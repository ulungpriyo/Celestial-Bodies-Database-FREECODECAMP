--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    area integer,
    volume integer,
    age numeric,
    description text,
    has_oxygen boolean DEFAULT true NOT NULL,
    has_life boolean DEFAULT true NOT NULL,
    star_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    diameter integer,
    volume integer,
    age numeric,
    description text,
    is_light boolean DEFAULT true NOT NULL,
    is_tidal_locked boolean DEFAULT true NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    radius integer,
    mass integer,
    age numeric,
    description text,
    is_habitable boolean DEFAULT true NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    star_id integer,
    moon_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    distance integer,
    volume integer,
    age numeric,
    description text,
    is_light boolean DEFAULT true NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    galaxy_id integer,
    planet_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy1', 100, 150, 200.5, 'SOLID', true, true, 1);
INSERT INTO public.galaxy VALUES (2, 'galaxy2', 100, 150, 200.5, 'SOLID', true, true, 2);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', 100, 150, 200.5, 'SOLID', true, true, 3);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', 100, 150, 200.5, 'SOLID', true, true, 4);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', 100, 150, 200.5, 'SOLID', true, true, 5);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', 100, 150, 200.5, 'SOLID', true, true, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', 100, 150, 200.5, 'SOLID', true, true, 1);
INSERT INTO public.moon VALUES (2, 'moon2', 100, 150, 200.5, 'SOLID', true, true, 2);
INSERT INTO public.moon VALUES (3, 'moon3', 100, 150, 200.5, 'SOLID', true, true, 3);
INSERT INTO public.moon VALUES (4, 'moon4', 100, 150, 200.5, 'SOLID', true, true, 4);
INSERT INTO public.moon VALUES (5, 'moon5', 100, 150, 200.5, 'SOLID', true, true, 5);
INSERT INTO public.moon VALUES (6, 'moon6', 100, 150, 200.5, 'SOLID', true, true, 6);
INSERT INTO public.moon VALUES (7, 'moon7', 100, 150, 200.5, 'SOLID', true, true, 7);
INSERT INTO public.moon VALUES (8, 'moon8', 100, 150, 200.5, 'SOLID', true, true, 8);
INSERT INTO public.moon VALUES (9, 'moon9', 100, 150, 200.5, 'SOLID', true, true, 9);
INSERT INTO public.moon VALUES (10, 'moon10', 100, 150, 200.5, 'SOLID', true, true, 10);
INSERT INTO public.moon VALUES (11, 'moon11', 100, 150, 200.5, 'SOLID', true, true, 11);
INSERT INTO public.moon VALUES (12, 'moon12', 100, 150, 200.5, 'SOLID', true, true, 12);
INSERT INTO public.moon VALUES (13, 'moon13', 100, 150, 200.5, 'SOLID', true, true, 1);
INSERT INTO public.moon VALUES (14, 'moon14', 100, 150, 200.5, 'SOLID', true, true, 2);
INSERT INTO public.moon VALUES (15, 'moon15', 100, 150, 200.5, 'SOLID', true, true, 3);
INSERT INTO public.moon VALUES (16, 'moon16', 100, 150, 200.5, 'SOLID', true, true, 4);
INSERT INTO public.moon VALUES (17, 'moon17', 100, 150, 200.5, 'SOLID', true, true, 5);
INSERT INTO public.moon VALUES (18, 'moon18', 100, 150, 200.5, 'SOLID', true, true, 6);
INSERT INTO public.moon VALUES (19, 'moon19', 100, 150, 200.5, 'SOLID', true, true, 7);
INSERT INTO public.moon VALUES (20, 'moon20', 100, 150, 200.5, 'SOLID', true, true, 8);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'moreinfo1', 'info1');
INSERT INTO public.more_info VALUES (2, 'moreinfo2', 'info2');
INSERT INTO public.more_info VALUES (3, 'moreinfo3', 'info3');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', 100, 150, 200.5, 'SOLID', true, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'planet2', 100, 150, 200.5, 'SOLID', true, true, 2, 2);
INSERT INTO public.planet VALUES (3, 'planet3', 100, 150, 200.5, 'SOLID', true, true, 3, 3);
INSERT INTO public.planet VALUES (4, 'planet4', 100, 150, 200.5, 'SOLID', true, true, 4, 4);
INSERT INTO public.planet VALUES (5, 'planet5', 100, 150, 200.5, 'SOLID', true, true, 5, 5);
INSERT INTO public.planet VALUES (6, 'planet6', 100, 150, 200.5, 'SOLID', true, true, 6, 6);
INSERT INTO public.planet VALUES (7, 'planet7', 100, 150, 200.5, 'SOLID', true, true, 6, 7);
INSERT INTO public.planet VALUES (8, 'planet8', 100, 150, 200.5, 'SOLID', true, true, 6, 8);
INSERT INTO public.planet VALUES (9, 'planet9', 100, 150, 200.5, 'SOLID', true, true, 6, 9);
INSERT INTO public.planet VALUES (10, 'planet10', 100, 150, 200.5, 'SOLID', true, true, 6, 10);
INSERT INTO public.planet VALUES (11, 'planet11', 100, 150, 200.5, 'SOLID', true, true, 6, 11);
INSERT INTO public.planet VALUES (12, 'planet12', 100, 150, 200.5, 'SOLID', true, true, 6, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 100, 150, 200.5, 'SOLID', true, true, 1, 1);
INSERT INTO public.star VALUES (2, 'star2', 100, 150, 200.5, 'SOLID', true, true, 2, 2);
INSERT INTO public.star VALUES (3, 'star3', 100, 150, 200.5, 'SOLID', true, true, 3, 3);
INSERT INTO public.star VALUES (4, 'star4', 100, 150, 200.5, 'SOLID', true, true, 4, 4);
INSERT INTO public.star VALUES (5, 'star5', 100, 150, 200.5, 'SOLID', true, true, 5, 5);
INSERT INTO public.star VALUES (6, 'star6', 100, 150, 200.5, 'SOLID', true, true, 6, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_planet_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey1 FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

