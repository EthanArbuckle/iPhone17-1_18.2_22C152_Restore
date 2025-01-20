uint64_t sub_24436F850@<X0>(uint64_t a1@<X8>)
{
  return sub_24436F8B0(0x73756F6976657250, 0xE800000000000000, 0xD000000000000010, a1);
}

uint64_t sub_24436F880@<X0>(uint64_t a1@<X8>)
{
  return sub_24436F8B0(1954047310, 0xE400000000000000, 0x2E6E6F7276656863, a1);
}

uint64_t sub_24436F8B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v49 = a3;
  uint64_t v46 = a1;
  uint64_t v47 = a2;
  uint64_t v55 = a4;
  uint64_t v4 = sub_2443B7F40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v53 = v4;
  uint64_t v54 = v5;
  MEMORY[0x270FA5388](v4);
  v52 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2443B97D0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E3EDB0);
  uint64_t v11 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46DF8);
  uint64_t v44 = v14;
  MEMORY[0x270FA5388](v14);
  v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46E20);
  uint64_t v50 = *(void *)(v17 - 8);
  uint64_t v51 = v17;
  MEMORY[0x270FA5388](v17);
  v45 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46DF0);
  uint64_t v20 = v19 - 8;
  MEMORY[0x270FA5388](v19);
  v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2443B7FC0();
  sub_2443B9840();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F1B538], v7);
  uint64_t KeyPath = swift_getKeyPath();
  v24 = (uint64_t *)&v16[*(int *)(v14 + 36)];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E39000);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v24 + *(int *)(v25 + 28), v10, v7);
  uint64_t *v24 = KeyPath;
  uint64_t v26 = v48;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v13, v48);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v26);
  v27 = v52;
  sub_2443B7F30();
  sub_244371654();
  sub_244371718(&qword_268E3ECB0, MEMORY[0x263F197E0]);
  v28 = v45;
  uint64_t v29 = v53;
  sub_2443B8EF0();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v27, v29);
  sub_243E9DDBC((uint64_t)v16, &qword_268E46DF8);
  uint64_t v30 = sub_2443B95E0();
  uint64_t v32 = v50;
  uint64_t v31 = v51;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v22, v28, v51);
  *(void *)&v22[*(int *)(v20 + 44)] = v30;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v28, v31);
  LOBYTE(v30) = sub_2443B8AE0();
  sub_2443B6E30();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v41 = v55;
  sub_243E9DD58((uint64_t)v22, v55, &qword_268E46DF0);
  uint64_t v42 = v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E46DD8) + 36);
  *(unsigned char *)uint64_t v42 = v30;
  *(void *)(v42 + 8) = v34;
  *(void *)(v42 + 16) = v36;
  *(void *)(v42 + 24) = v38;
  *(void *)(v42 + 32) = v40;
  *(unsigned char *)(v42 + 40) = 0;
  return sub_243E9DDBC((uint64_t)v22, &qword_268E46DF0);
}

uint64_t sub_24436FDD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v71 = a2;
  uint64_t v68 = sub_2443B79D0();
  uint64_t v65 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  v61 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46D18);
  uint64_t v54 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46D20);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46D28);
  uint64_t v62 = *(void *)(v9 - 8);
  uint64_t v63 = v9;
  MEMORY[0x270FA5388](v9);
  v59 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46D30);
  uint64_t v66 = *(void *)(v11 - 8);
  uint64_t v67 = v11;
  MEMORY[0x270FA5388](v11);
  v64 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46D38);
  MEMORY[0x270FA5388](v60);
  v58 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46D40);
  uint64_t v69 = *(void *)(v14 - 8);
  uint64_t v70 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v57 = (uint64_t)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v56 = (uint64_t)&v54 - v17;
  uint64_t v18 = type metadata accessor for ImageConditioningPickerHeaderView();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void *)(v19 + 64);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  v24 = (char *)&v54 - v23;
  uint64_t v25 = a1;
  sub_244370FF8(a1, (uint64_t)&v54 - v23);
  uint64_t v26 = &v24[*(int *)(v18 + 32)];
  uint64_t v27 = *(void *)v26;
  uint64_t v28 = *((void *)v26 + 1);
  LOBYTE(v26) = v26[16];
  uint64_t v72 = v27;
  uint64_t v73 = v28;
  LOBYTE(v74) = (_BYTE)v26;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E387D0);
  MEMORY[0x24568CC50](&v76, v29);
  LOBYTE(a1) = v76;
  sub_24437105C((uint64_t)v24);
  uint64_t v30 = 1;
  if ((a1 & 1) == 0)
  {
    sub_244370FF8(v25, (uint64_t)v21);
    unint64_t v31 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    uint64_t v32 = swift_allocObject();
    uint64_t v33 = sub_2443710BC((uint64_t)v21, v32 + v31);
    MEMORY[0x270FA5388](v33);
    *(&v54 - 2) = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E46D48);
    sub_244371188();
    sub_2443B9930();
    uint64_t v34 = v54;
    uint64_t v35 = v55;
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v8, v5, v55);
    v8[*(int *)(v6 + 36)] = 0;
    (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v35);
    uint64_t v36 = v61;
    sub_2443B79C0();
    unint64_t v37 = sub_244371368();
    uint64_t v38 = sub_244371718(&qword_268E3ED10, MEMORY[0x263F18FD0]);
    uint64_t v39 = v59;
    uint64_t v40 = v68;
    sub_2443B8F20();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v36, v40);
    uint64_t v41 = sub_243E9DDBC((uint64_t)v8, &qword_268E46D20);
    MEMORY[0x270FA5388](v41);
    *(&v54 - 2) = v25;
    uint64_t v72 = v6;
    uint64_t v73 = v40;
    unint64_t v74 = v37;
    uint64_t v75 = v38;
    swift_getOpaqueTypeConformance2();
    uint64_t v42 = v63;
    v43 = v64;
    sub_2443B9110();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v39, v42);
    uint64_t v44 = v25 + *(int *)(v18 + 28);
    uint64_t v45 = *(void *)v44;
    LOBYTE(v34) = *(unsigned char *)(v44 + 8);
    sub_243EB1808(*(void *)v44, v34);
    LOBYTE(v38) = sub_2440D2A60(v45, v34);
    sub_243EB18F8(v45, v34);
    if (v38) {
      double v46 = 0.0;
    }
    else {
      double v46 = 1.0;
    }
    uint64_t v48 = v66;
    uint64_t v47 = v67;
    uint64_t v49 = (uint64_t)v58;
    (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v58, v43, v67);
    *(double *)(v49 + *(int *)(v60 + 36)) = v46;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v43, v47);
    uint64_t v50 = v57;
    sub_243E9DD58(v49, v57, &qword_268E46D38);
    *(unsigned char *)(v50 + *(int *)(v70 + 36)) = 1;
    sub_243E9DDBC(v49, &qword_268E46D38);
    uint64_t v51 = v50;
    uint64_t v52 = v56;
    sub_243EA697C(v51, v56, &qword_268E46D40);
    sub_243EA697C(v52, v71, &qword_268E46D40);
    uint64_t v30 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v71, v30, 1, v70);
}

uint64_t sub_2443705D0()
{
  type metadata accessor for ImageConditioningPickerHeaderView();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E387D0);
  MEMORY[0x24568CC50](&v1);
  sub_2443B9AD0();
  swift_release();
  return swift_release();
}

uint64_t sub_24437068C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v68 = a1;
  uint64_t v1 = sub_2443B76F0();
  uint64_t v66 = *(void *)(v1 - 8);
  uint64_t v67 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v65 = (char *)&v55 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EFA0);
  MEMORY[0x270FA5388](v3 - 8);
  v64 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2443B8CA0();
  uint64_t v62 = *(void *)(v5 - 8);
  uint64_t v63 = v5;
  MEMORY[0x270FA5388](v5);
  v61 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E44FF0) - 8;
  MEMORY[0x270FA5388](v58);
  uint64_t v57 = (uint64_t *)((char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E44FF8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v56 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2443B77B0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v55 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46D70);
  uint64_t v21 = v20 - 8;
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46D60) - 8;
  MEMORY[0x270FA5388](v60);
  uint64_t v59 = (uint64_t)&v55 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ImageConditioningPickerHeaderView();
  sub_2440D502C((uint64_t)v19);
  sub_2440D27EC((uint64_t)v12);
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F18D60], v13);
  sub_244101960((uint64_t)v19, (uint64_t)v16, (uint64_t)v12);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v14 + 8);
  v25(v16, v13);
  sub_243E9DDBC((uint64_t)v12, &qword_268E3EA10);
  v25(v19, v13);
  uint64_t v26 = sub_244370ED8();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  LOBYTE(v19) = v31 & 1;
  uint64_t v32 = *MEMORY[0x263F1A7B8];
  uint64_t v33 = sub_2443B8DE0();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = (uint64_t)v56;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 104))(v56, v32, v33);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v34 + 56))(v35, 0, 1, v33);
  uint64_t KeyPath = swift_getKeyPath();
  unint64_t v37 = v57;
  sub_243E9DD58(v35, (uint64_t)v57 + *(int *)(v58 + 36), &qword_268E44FF8);
  *unint64_t v37 = KeyPath;
  sub_243E9DD58((uint64_t)v37, (uint64_t)&v23[*(int *)(v21 + 44)], &qword_268E44FF0);
  *(void *)uint64_t v23 = v26;
  *((void *)v23 + 1) = v28;
  v23[16] = (char)v19;
  *((void *)v23 + 3) = v30;
  sub_243EA654C(v26, v28, (char)v19);
  swift_bridgeObjectRetain();
  sub_243E9DDBC((uint64_t)v37, &qword_268E44FF0);
  sub_243E9DDBC(v35, &qword_268E44FF8);
  sub_243EA5864(v26, v28, (char)v19);
  swift_bridgeObjectRelease();
  uint64_t v39 = v61;
  uint64_t v38 = v62;
  uint64_t v40 = v63;
  (*(void (**)(char *, void, uint64_t))(v62 + 104))(v61, *MEMORY[0x263F1A728], v63);
  uint64_t v41 = *MEMORY[0x263F1A608];
  uint64_t v42 = sub_2443B8BB0();
  uint64_t v43 = *(void *)(v42 - 8);
  uint64_t v44 = (uint64_t)v64;
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 104))(v64, v41, v42);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v43 + 56))(v44, 0, 1, v42);
  sub_2443B8BD0();
  uint64_t v45 = sub_2443B8C10();
  sub_243E9DDBC(v44, &qword_268E3EFA0);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
  uint64_t v46 = swift_getKeyPath();
  uint64_t v47 = v59;
  sub_243E9DD58((uint64_t)v23, v59, &qword_268E46D70);
  uint64_t v48 = (uint64_t *)(v47 + *(int *)(v60 + 44));
  *uint64_t v48 = v46;
  v48[1] = v45;
  sub_243E9DDBC((uint64_t)v23, &qword_268E46D70);
  uint64_t v49 = v65;
  sub_2443B76E0();
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46D48);
  uint64_t v51 = v67;
  uint64_t v52 = v68;
  uint64_t v53 = v66;
  (*(void (**)(uint64_t, char *, uint64_t))(v66 + 16))(v68 + *(int *)(v50 + 36), v49, v67);
  sub_243E9DD58(v47, v52, &qword_268E46D60);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v49, v51);
  return sub_243E9DDBC(v47, &qword_268E46D60);
}

uint64_t sub_244370DE8@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for ImageConditioningPickerHeaderView();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E387D0);
  MEMORY[0x24568CC50](&v7, v2);
  sub_2443B7FC0();
  uint64_t result = sub_2443B8E10();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_244370ED8()
{
  type metadata accessor for ImageConditioningPickerHeaderView();
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E387D0);
  MEMORY[0x24568CC50](&v2, v0);
  sub_2443B7FC0();
  return sub_2443B8E10();
}

uint64_t sub_244370FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ImageConditioningPickerHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24437105C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ImageConditioningPickerHeaderView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2443710BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ImageConditioningPickerHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_244371120()
{
  type metadata accessor for ImageConditioningPickerHeaderView();

  return sub_2443705D0();
}

uint64_t sub_244371180@<X0>(uint64_t a1@<X8>)
{
  return sub_24437068C(a1);
}

unint64_t sub_244371188()
{
  unint64_t result = qword_268E46D50;
  if (!qword_268E46D50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E46D48);
    sub_244371228();
    sub_243E9DC94(&qword_268E3FCC0, &qword_268E3FCA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46D50);
  }
  return result;
}

unint64_t sub_244371228()
{
  unint64_t result = qword_268E46D58;
  if (!qword_268E46D58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E46D60);
    sub_2443712C8();
    sub_243E9DC94(&qword_268E37E88, &qword_268E37E90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46D58);
  }
  return result;
}

unint64_t sub_2443712C8()
{
  unint64_t result = qword_268E46D68;
  if (!qword_268E46D68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E46D70);
    sub_243E9DC94(&qword_268E46D78, &qword_268E44FF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46D68);
  }
  return result;
}

unint64_t sub_244371368()
{
  unint64_t result = qword_268E46D80;
  if (!qword_268E46D80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E46D20);
    sub_243E9DC94(&qword_268E46D88, &qword_268E46D18);
    sub_243E9DC94((unint64_t *)&qword_268E3F060, &qword_268E3B800);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46D80);
  }
  return result;
}

uint64_t sub_24437142C@<X0>(uint64_t a1@<X8>)
{
  return sub_244370DE8(a1);
}

uint64_t sub_244371448()
{
  uint64_t v1 = type metadata accessor for ImageConditioningPickerHeaderView();
  return (*(uint64_t (**)(void))(v0
                              + *(int *)(v1 + 48)
                              + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))))();
}

unint64_t sub_2443714B4()
{
  unint64_t result = qword_268E46DE0;
  if (!qword_268E46DE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E46DD8);
    sub_244371530();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46DE0);
  }
  return result;
}

unint64_t sub_244371530()
{
  unint64_t result = qword_268E46DE8;
  if (!qword_268E46DE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E46DF0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E46DF8);
    sub_2443B7F40();
    sub_244371654();
    sub_244371718(&qword_268E3ECB0, MEMORY[0x263F197E0]);
    swift_getOpaqueTypeConformance2();
    sub_243E9DC94(&qword_268E37E98, &qword_268E37EA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46DE8);
  }
  return result;
}

unint64_t sub_244371654()
{
  unint64_t result = qword_268E46E00;
  if (!qword_268E46E00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E46DF8);
    sub_243E9DC94(&qword_268E38FF0, (uint64_t *)&unk_268E3EDB0);
    sub_243E9DC94(&qword_268E3CC68, &qword_268E39000);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46E00);
  }
  return result;
}

uint64_t sub_244371718(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroyTm_42()
{
  uint64_t v1 = (int *)type metadata accessor for ImageConditioningPickerHeaderView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = v3 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_2443B8640();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v3 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E38900);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2443B77B0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  sub_243EB18F8(*(void *)(v3 + v1[7]), *(unsigned char *)(v3 + v1[7] + 8));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v9 = v3 + v1[13];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3CD20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);

  return swift_deallocObject();
}

uint64_t sub_2443719E4()
{
  uint64_t v1 = type metadata accessor for ImageConditioningPickerHeaderView();
  return (*(uint64_t (**)(void))(v0
                              + *(int *)(v1 + 40)
                              + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))))();
}

unint64_t sub_244371A5C()
{
  unint64_t result = qword_268E46E28;
  if (!qword_268E46E28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E46D08);
    sub_244371AFC();
    sub_243E9DC94(&qword_268E46E58, &qword_268E46D10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46E28);
  }
  return result;
}

unint64_t sub_244371AFC()
{
  unint64_t result = qword_268E46E30;
  if (!qword_268E46E30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E46CF8);
    sub_244371B9C();
    sub_243E9DC94(&qword_268E46E48, &qword_268E46E50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46E30);
  }
  return result;
}

unint64_t sub_244371B9C()
{
  unint64_t result = qword_268E46E38;
  if (!qword_268E46E38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E46CF0);
    sub_243E9DC94(&qword_268E46E40, &qword_268E46CE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46E38);
  }
  return result;
}

void sub_244371C3C()
{
  if ((v0[24] & 1) != 0 || (v0[32] & 1) != 0 || v0[40] != 1) {
    int v1 = 2;
  }
  else {
    int v1 = v0[16];
  }
  if (v0[64] != v1)
  {
    v0[64] = v1;
    uint64_t v2 = sub_2443BA950();
    MEMORY[0x270FA5388](v2);
    v3[2] = v0;
    char v4 = v1;
    sub_244232A00((uint64_t)sub_244372578, (uint64_t)v3);
  }
}

uint64_t sub_244371D10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  *(_WORD *)(v2 + 16) = 0;
  *(_DWORD *)(v2 + 20) = 0;
  *(_WORD *)(v2 + 24) = 0;
  *(_DWORD *)(v2 + 28) = 0;
  *(_DWORD *)(v2 + 36) = 0;
  char v4 = (int *)(v2 + 36);
  *(_WORD *)(v2 + 32) = 0;
  *(unsigned char *)(v2 + 40) = 1;
  *(unsigned char *)(v2 + 64) = 0;
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  sub_243EAAAB4();
  swift_retain();
  uint64_t v5 = sub_2443BAD80();
  uint64_t v6 = swift_allocObject();
  swift_weakInit();
  uint64_t v21 = sub_244372548;
  uint64_t v22 = v6;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 1107296256;
  uint64_t v19 = sub_244372118;
  uint64_t v20 = &block_descriptor_34;
  uint64_t v7 = _Block_copy(&v17);
  swift_release();
  swift_beginAccess();
  uint32_t v8 = notify_register_dispatch("com.apple.springboard.lockstate", (int *)(v2 + 20), v5, v7);
  swift_endAccess();
  _Block_release(v7);

  *(unsigned char *)(v2 + 17) = v8 == 0;
  uint64_t v9 = sub_2443BAD80();
  uint64_t v10 = swift_allocObject();
  swift_weakInit();
  uint64_t v21 = sub_244372568;
  uint64_t v22 = v10;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 1107296256;
  uint64_t v19 = sub_244372118;
  uint64_t v20 = &block_descriptor_9;
  uint64_t v11 = _Block_copy(&v17);
  swift_release();
  swift_beginAccess();
  uint32_t v12 = notify_register_dispatch("com.apple.springboard.hasBlankedScreen", (int *)(v2 + 28), v9, v11);
  swift_endAccess();
  _Block_release(v11);

  *(unsigned char *)(v2 + 25) = v12 == 0;
  uint64_t v13 = sub_2443BAD80();
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  uint64_t v21 = sub_244372570;
  uint64_t v22 = v14;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 1107296256;
  uint64_t v19 = sub_244372118;
  uint64_t v20 = &block_descriptor_13;
  uint64_t v15 = _Block_copy(&v17);
  swift_release();
  swift_beginAccess();
  LODWORD(v4) = notify_register_dispatch("com.apple.iokit.hid.displayStatus", v4, v13, v15);
  swift_endAccess();
  swift_release();
  _Block_release(v15);

  *(unsigned char *)(v3 + 33) = v4 == 0;
  return v3;
}

uint64_t sub_24437205C()
{
  v2[7] = *MEMORY[0x263EF8340];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    v2[0] = 0;
    swift_beginAccess();
    if (!notify_get_state(*(_DWORD *)(v1 + 20), v2))
    {
      *(unsigned char *)(v1 + 24) = v2[0] != 0;
      sub_244371C3C();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_244372118(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_24437216C()
{
  v2[7] = *MEMORY[0x263EF8340];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    v2[0] = 0;
    swift_beginAccess();
    if (!notify_get_state(*(_DWORD *)(v1 + 28), v2))
    {
      *(unsigned char *)(v1 + 32) = v2[0] != 0;
      sub_244371C3C();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_244372228()
{
  v2[7] = *MEMORY[0x263EF8340];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    v2[0] = 0;
    swift_beginAccess();
    if (!notify_get_state(*(_DWORD *)(v1 + 36), v2))
    {
      *(unsigned char *)(v1 + 40) = v2[0] != 0;
      sub_244371C3C();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_2443722E4()
{
  if (*(unsigned char *)(v0 + 17) == 1)
  {
    swift_beginAccess();
    notify_cancel(*(_DWORD *)(v0 + 20));
  }
  if (*(unsigned char *)(v0 + 25) == 1)
  {
    swift_beginAccess();
    notify_cancel(*(_DWORD *)(v0 + 28));
  }
  if (*(unsigned char *)(v0 + 33) == 1)
  {
    swift_beginAccess();
    notify_cancel(*(_DWORD *)(v0 + 36));
  }
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PerformanceMitigationNotifier()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for PerformanceMitigationNotifier.State(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x244372480);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PerformanceMitigationNotifier.State()
{
  return &type metadata for PerformanceMitigationNotifier.State;
}

unint64_t sub_2443724BC()
{
  unint64_t result = qword_268E46E60;
  if (!qword_268E46E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46E60);
  }
  return result;
}

uint64_t sub_244372510()
{
  swift_weakDestroy();

  return swift_deallocObject();
}

uint64_t sub_244372548()
{
  return sub_24437205C();
}

uint64_t block_copy_helper_33(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_33()
{
  return swift_release();
}

uint64_t sub_244372568()
{
  return sub_24437216C();
}

uint64_t sub_244372570()
{
  return sub_244372228();
}

uint64_t sub_244372578()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 48))(*(unsigned __int8 *)(v0 + 24));
}

uint64_t sub_2443725C4(uint64_t a1, unint64_t a2)
{
  unsigned int v4 = (void *)sub_2443B54D0();
  uint64_t v5 = (void *)sub_2443BA4B0();
  id v6 = objc_msgSend(v4, sel_localizedStringForLanguage_context_, v5, 1);

  if (v6)
  {
    sub_2443BA4F0();
  }
  else
  {
    if (qword_268E378E8 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_2443B6800();
    __swift_project_value_buffer(v7, (uint64_t)qword_268E39360);
    swift_bridgeObjectRetain_n();
    uint32_t v8 = sub_2443B67E0();
    os_log_type_t v9 = sub_2443BAD10();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v13 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_bridgeObjectRetain();
      sub_243F2D034(a1, a2, &v13);
      sub_2443BB0C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_243E89000, v8, v9, "Did failed to localize '%s'.", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24568FCC0](v11, -1, -1);
      MEMORY[0x24568FCC0](v10, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2443727F8()
{
  id v0 = objc_msgSend(self, sel__deviceLanguage);
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = sub_2443BA4F0();
    unint64_t v4 = v3;

    uint64_t v5 = sub_2443725C4(v2, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_268E378E8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2443B6800();
    __swift_project_value_buffer(v6, (uint64_t)qword_268E39360);
    uint64_t v7 = sub_2443B67E0();
    os_log_type_t v8 = sub_2443BAD10();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl(&dword_243E89000, v7, v8, "Unexpected empty NSLocale._deviceLanguage.", v9, 2u);
      MEMORY[0x24568FCC0](v9, -1, -1);
    }

    return 0;
  }
  return v5;
}

uint64_t sub_244372958()
{
  v1[15] = v0;
  uint64_t v2 = sub_2443B5350();
  v1[16] = v2;
  v1[17] = *(void *)(v2 - 8);
  v1[18] = swift_task_alloc();
  sub_2443BA950();
  v1[19] = sub_2443BA940();
  uint64_t v4 = sub_2443BA8E0();
  v1[20] = v4;
  v1[21] = v3;
  return MEMORY[0x270FA2498](sub_244372A4C, v4, v3);
}

uint64_t sub_244372A4C()
{
  sub_244372DF8(v0[18]);
  id v1 = objc_msgSend(self, sel_sharedApplication);
  v0[22] = v1;
  uint64_t v2 = sub_2443B5260();
  v0[23] = v2;
  sub_2441955FC(MEMORY[0x263F8EE78]);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_24437AAB0();
  uint64_t v3 = sub_2443BA2F0();
  v0[24] = v3;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 25;
  v0[3] = sub_244372C44;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_244375BC8;
  v0[13] = &block_descriptor;
  v0[14] = v4;
  objc_msgSend(v1, sel_openURL_options_completionHandler_, v2, v3, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_244372C44()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 168);
  uint64_t v2 = *(void *)(*(void *)v0 + 160);
  return MEMORY[0x270FA2498](sub_244372D4C, v2, v1);
}

uint64_t sub_244372D4C()
{
  uint64_t v2 = (void *)v0[23];
  uint64_t v1 = (void *)v0[24];
  uint64_t v3 = (void *)v0[22];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[16];
  uint64_t v6 = v0[17];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);

  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_244372DF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E44850);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2443B4EB0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  os_log_type_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2443B4EA0();
  sub_2443B4E90();
  MEMORY[0x245688010](7824750, 0xE300000000000000);
  sub_244373040();
  sub_2443B4E60();
  sub_2443B4E70();
  uint64_t v9 = sub_2443B5350();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v4, 1, v9) == 1)
  {
    sub_243E9DDBC((uint64_t)v4, &qword_268E44850);
    sub_24437AB08();
    swift_allocError();
    *uint64_t v11 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v4, v9);
  }
}

unint64_t sub_244373040()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46F20);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  v355 = (char *)&v300 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v354 = (char *)&v300 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v353 = (uint64_t)&v300 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v352 = (char *)&v300 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v351 = (char *)&v300 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v350 = (char *)&v300 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v349 = (uint64_t)&v300 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v348 = (uint64_t)&v300 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v347 = (uint64_t)&v300 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v346 = (char *)&v300 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v356 = (uint64_t)&v300 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v345 = (uint64_t)&v300 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v344 = (uint64_t)&v300 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v343 = (uint64_t)&v300 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v342 = (uint64_t)&v300 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  v341 = (char *)&v300 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v340 = (char *)&v300 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  v357 = (unsigned int (*)(char *, uint64_t, uint64_t))((char *)&v300 - v38);
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  uint64_t v41 = (char *)&v300 - v40;
  MEMORY[0x270FA5388](v39);
  uint64_t v43 = (char *)&v300 - v42;
  uint64_t v44 = sub_2443B4E50();
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  v302 = (char *)&v300 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  v303 = (char *)&v300 - v49;
  uint64_t v50 = MEMORY[0x270FA5388](v48);
  v308 = (char *)&v300 - v51;
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  v309 = (char *)&v300 - v53;
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  v338 = (char *)&v300 - v55;
  uint64_t v56 = MEMORY[0x270FA5388](v54);
  v339 = (char *)&v300 - v57;
  uint64_t v58 = MEMORY[0x270FA5388](v56);
  v336 = (char *)&v300 - v59;
  uint64_t v60 = MEMORY[0x270FA5388](v58);
  v337 = (char *)&v300 - v61;
  uint64_t v62 = MEMORY[0x270FA5388](v60);
  v334 = (char *)&v300 - v63;
  uint64_t v64 = MEMORY[0x270FA5388](v62);
  v335 = (char *)&v300 - v65;
  uint64_t v66 = MEMORY[0x270FA5388](v64);
  v332 = (char *)&v300 - v67;
  uint64_t v68 = MEMORY[0x270FA5388](v66);
  v333 = (char *)&v300 - v69;
  uint64_t v70 = MEMORY[0x270FA5388](v68);
  v330 = (char *)&v300 - v71;
  uint64_t v72 = MEMORY[0x270FA5388](v70);
  v331 = (char *)&v300 - v73;
  uint64_t v74 = MEMORY[0x270FA5388](v72);
  v328 = (char *)&v300 - v75;
  uint64_t v76 = MEMORY[0x270FA5388](v74);
  v329 = (char *)&v300 - v77;
  uint64_t v78 = MEMORY[0x270FA5388](v76);
  v326 = (char *)&v300 - v79;
  uint64_t v80 = MEMORY[0x270FA5388](v78);
  v327 = (char *)&v300 - v81;
  uint64_t v82 = MEMORY[0x270FA5388](v80);
  v324 = (char *)&v300 - v83;
  uint64_t v84 = MEMORY[0x270FA5388](v82);
  v325 = (char *)&v300 - v85;
  uint64_t v86 = MEMORY[0x270FA5388](v84);
  v322 = (char *)&v300 - v87;
  uint64_t v88 = MEMORY[0x270FA5388](v86);
  v323 = (char *)&v300 - v89;
  uint64_t v90 = MEMORY[0x270FA5388](v88);
  v320 = (char *)&v300 - v91;
  uint64_t v92 = MEMORY[0x270FA5388](v90);
  v321 = (char *)&v300 - v93;
  uint64_t v94 = MEMORY[0x270FA5388](v92);
  v318 = (char *)&v300 - v95;
  uint64_t v96 = MEMORY[0x270FA5388](v94);
  v319 = (char *)&v300 - v97;
  uint64_t v98 = MEMORY[0x270FA5388](v96);
  v316 = (char *)&v300 - v99;
  uint64_t v100 = MEMORY[0x270FA5388](v98);
  v317 = (char *)&v300 - v101;
  uint64_t v102 = MEMORY[0x270FA5388](v100);
  v314 = (char *)&v300 - v103;
  uint64_t v104 = MEMORY[0x270FA5388](v102);
  v315 = (char *)&v300 - v105;
  uint64_t v106 = MEMORY[0x270FA5388](v104);
  v306 = (char *)&v300 - v107;
  uint64_t v108 = MEMORY[0x270FA5388](v106);
  v307 = (char *)&v300 - v109;
  uint64_t v110 = MEMORY[0x270FA5388](v108);
  v304 = (char *)&v300 - v111;
  uint64_t v112 = MEMORY[0x270FA5388](v110);
  v305 = (char *)&v300 - v113;
  uint64_t v114 = MEMORY[0x270FA5388](v112);
  v312 = (char *)&v300 - v115;
  uint64_t v116 = MEMORY[0x270FA5388](v114);
  v313 = (char *)&v300 - v117;
  uint64_t v118 = MEMORY[0x270FA5388](v116);
  v310 = (char *)&v300 - v119;
  uint64_t v120 = MEMORY[0x270FA5388](v118);
  v311 = (char *)&v300 - v121;
  uint64_t v122 = MEMORY[0x270FA5388](v120);
  v124 = (char *)&v300 - v123;
  MEMORY[0x270FA5388](v122);
  v126 = (char *)&v300 - v125;
  unint64_t v359 = MEMORY[0x263F8EE78];
  if (!*(void *)(v1 + 24))
  {
    v358 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56);
    v358(v43, 1, 1, v44);
LABEL_5:
    sub_243E9DDBC((uint64_t)v43, &qword_268E46F20);
    uint64_t v127 = (uint64_t)v357;
    uint64_t v128 = *(void *)(v1 + 48);
    if (!v128) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v301 = v41;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2443B4E40();
  v358 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56);
  v358(v43, 0, 1, v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v43, 1, v44) == 1)
  {
    uint64_t v41 = v301;
    goto LABEL_5;
  }
  v153 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
  v153(v126, v43, v44);
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v124, v126, v44);
  unint64_t v154 = sub_243F3B550(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v156 = *(void *)(v154 + 16);
  unint64_t v155 = *(void *)(v154 + 24);
  if (v156 >= v155 >> 1) {
    unint64_t v154 = sub_243F3B550(v155 > 1, v156 + 1, 1, v154);
  }
  *(void *)(v154 + 16) = v156 + 1;
  v153((char *)(v154+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v156), v124, v44);
  unint64_t v359 = v154;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v126, v44);
  uint64_t v127 = (uint64_t)v357;
  uint64_t v41 = v301;
  uint64_t v128 = *(void *)(v1 + 48);
  if (v128)
  {
LABEL_6:
    uint64_t v130 = *(void *)(v1 + 56);
    uint64_t v129 = *(void *)(v1 + 64);
    long long v360 = *(_OWORD *)(v1 + 32);
    uint64_t v361 = v128;
    uint64_t v362 = v130;
    uint64_t v363 = v129;
    uint64_t v131 = sub_244375BEC();
    sub_2441A35B8(v131);
  }
LABEL_7:
  char v132 = *(unsigned char *)(v1 + 88);
  swift_bridgeObjectRetain();
  sub_2443771AC(v132, (uint64_t)v41);
  swift_bridgeObjectRelease();
  v133 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48);
  if (v133(v41, 1, v44) == 1)
  {
    sub_243E9DDBC((uint64_t)v41, &qword_268E46F20);
  }
  else
  {
    v134 = v41;
    v135 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
    v136 = v311;
    v135(v311, v134, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v310, v136, v44);
    unint64_t v137 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v137 = sub_243F3B550(0, *(void *)(v137 + 16) + 1, 1, v137);
    }
    unint64_t v139 = *(void *)(v137 + 16);
    unint64_t v138 = *(void *)(v137 + 24);
    if (v139 >= v138 >> 1) {
      unint64_t v137 = sub_243F3B550(v138 > 1, v139 + 1, 1, v137);
    }
    *(void *)(v137 + 16) = v139 + 1;
    v135((char *)(v137+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v139), v310, v44);
    unint64_t v359 = v137;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v311, v44);
    uint64_t v127 = (uint64_t)v357;
  }
  char v140 = *(unsigned char *)(v1 + 112);
  swift_bridgeObjectRetain();
  sub_2443773C4(v140, v127);
  swift_bridgeObjectRelease();
  if (v133((char *)v127, 1, v44) == 1)
  {
    sub_243E9DDBC(v127, &qword_268E46F20);
    if (*(void *)(v1 + 144)) {
      goto LABEL_16;
    }
LABEL_28:
    uint64_t v141 = (uint64_t)v340;
    v358(v340, 1, 1, v44);
    goto LABEL_29;
  }
  v148 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
  v149 = v313;
  v148(v313, v127, v44);
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v312, v149, v44);
  unint64_t v150 = v359;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v150 = sub_243F3B550(0, *(void *)(v150 + 16) + 1, 1, v150);
  }
  unint64_t v152 = *(void *)(v150 + 16);
  unint64_t v151 = *(void *)(v150 + 24);
  if (v152 >= v151 >> 1) {
    unint64_t v150 = sub_243F3B550(v151 > 1, v152 + 1, 1, v150);
  }
  *(void *)(v150 + 16) = v152 + 1;
  v148((char *)(v150+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v152), (uint64_t)v312, v44);
  unint64_t v359 = v150;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v313, v44);
  if (!*(void *)(v1 + 144)) {
    goto LABEL_28;
  }
LABEL_16:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v141 = (uint64_t)v340;
  sub_2443B4E40();
  v358((char *)v141, 0, 1, v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v133((char *)v141, 1, v44) != 1)
  {
    v142 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v143 = v305;
    v142(v305, v141, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v304, v143, v44);
    unint64_t v144 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v144 = sub_243F3B550(0, *(void *)(v144 + 16) + 1, 1, v144);
    }
    unint64_t v146 = *(void *)(v144 + 16);
    unint64_t v145 = *(void *)(v144 + 24);
    if (v146 >= v145 >> 1) {
      unint64_t v144 = sub_243F3B550(v145 > 1, v146 + 1, 1, v144);
    }
    *(void *)(v144 + 16) = v146 + 1;
    v142((char *)(v144+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v146), (uint64_t)v304, v44);
    unint64_t v359 = v144;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v305, v44);
    if (!*(void *)(v1 + 176)) {
      goto LABEL_22;
    }
    goto LABEL_30;
  }
LABEL_29:
  sub_243E9DDBC(v141, &qword_268E46F20);
  if (!*(void *)(v1 + 176))
  {
LABEL_22:
    uint64_t v147 = (uint64_t)v341;
    v358(v341, 1, 1, v44);
LABEL_31:
    sub_243E9DDBC(v147, &qword_268E46F20);
    goto LABEL_41;
  }
LABEL_30:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v147 = (uint64_t)v341;
  sub_2443B4E40();
  v358((char *)v147, 0, 1, v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v133((char *)v147, 1, v44) == 1) {
    goto LABEL_31;
  }
  v157 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
  v158 = v307;
  v157(v307, v147, v44);
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v306, v158, v44);
  unint64_t v159 = v359;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v159 = sub_243F3B550(0, *(void *)(v159 + 16) + 1, 1, v159);
  }
  unint64_t v161 = *(void *)(v159 + 16);
  unint64_t v160 = *(void *)(v159 + 24);
  if (v161 >= v160 >> 1) {
    unint64_t v159 = sub_243F3B550(v160 > 1, v161 + 1, 1, v159);
  }
  *(void *)(v159 + 16) = v161 + 1;
  v157((char *)(v159+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v161), (uint64_t)v306, v44);
  unint64_t v359 = v159;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v307, v44);
LABEL_41:
  uint64_t v162 = *(void *)(v1 + 184);
  uint64_t v163 = *(void *)(v1 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v164 = v342;
  sub_2443779E8(v162, v163, (void (*)(uint64_t, uint64_t))sub_24437B0C4, v342);
  swift_bridgeObjectRelease();
  uint64_t v165 = v164;
  swift_bridgeObjectRelease();
  if (v133((char *)v164, 1, v44) == 1)
  {
    sub_243E9DDBC(v164, &qword_268E46F20);
  }
  else
  {
    v166 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v167 = v315;
    v166(v315, v165, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v314, v167, v44);
    unint64_t v168 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v168 = sub_243F3B550(0, *(void *)(v168 + 16) + 1, 1, v168);
    }
    unint64_t v170 = *(void *)(v168 + 16);
    unint64_t v169 = *(void *)(v168 + 24);
    if (v170 >= v169 >> 1) {
      unint64_t v168 = sub_243F3B550(v169 > 1, v170 + 1, 1, v168);
    }
    *(void *)(v168 + 16) = v170 + 1;
    v166((char *)(v168+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v170), (uint64_t)v314, v44);
    unint64_t v359 = v168;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v315, v44);
  }
  v171 = (int *)type metadata accessor for TapToRadarDraft();
  uint64_t v172 = v343;
  sub_244377548(v343);
  unsigned int v173 = v133((char *)v172, 1, v44);
  v357 = v133;
  if (v173 == 1)
  {
    sub_243E9DDBC(v172, &qword_268E46F20);
  }
  else
  {
    uint64_t v174 = v172;
    v175 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v176 = v317;
    v175(v317, v174, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v316, v176, v44);
    unint64_t v177 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v177 = sub_243F3B550(0, *(void *)(v177 + 16) + 1, 1, v177);
    }
    unint64_t v179 = *(void *)(v177 + 16);
    unint64_t v178 = *(void *)(v177 + 24);
    if (v179 >= v178 >> 1) {
      unint64_t v177 = sub_243F3B550(v178 > 1, v179 + 1, 1, v177);
    }
    *(void *)(v177 + 16) = v179 + 1;
    v175((char *)(v177+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v179), (uint64_t)v316, v44);
    unint64_t v359 = v177;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v317, v44);
    v133 = v357;
  }
  v180 = (uint64_t *)(v1 + v171[12]);
  uint64_t v181 = *v180;
  uint64_t v182 = v180[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v183 = v344;
  sub_244377818(v181, v182, v344);
  swift_bridgeObjectRelease();
  uint64_t v184 = v183;
  swift_bridgeObjectRelease();
  if (v133((char *)v183, 1, v44) == 1)
  {
    sub_243E9DDBC(v183, &qword_268E46F20);
  }
  else
  {
    v185 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v186 = v319;
    v185(v319, v184, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v318, v186, v44);
    unint64_t v187 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v187 = sub_243F3B550(0, *(void *)(v187 + 16) + 1, 1, v187);
    }
    unint64_t v189 = *(void *)(v187 + 16);
    unint64_t v188 = *(void *)(v187 + 24);
    if (v189 >= v188 >> 1) {
      unint64_t v187 = sub_243F3B550(v188 > 1, v189 + 1, 1, v187);
    }
    *(void *)(v187 + 16) = v189 + 1;
    v185((char *)(v187+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v189), (uint64_t)v318, v44);
    unint64_t v359 = v187;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v319, v44);
    v133 = v357;
  }
  v190 = (uint64_t *)(v1 + v171[13]);
  uint64_t v191 = *v190;
  uint64_t v192 = v190[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v193 = v345;
  sub_244377818(v191, v192, v345);
  swift_bridgeObjectRelease();
  uint64_t v194 = v193;
  swift_bridgeObjectRelease();
  if (v133((char *)v193, 1, v44) == 1)
  {
    sub_243E9DDBC(v193, &qword_268E46F20);
  }
  else
  {
    v195 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v196 = v321;
    v195(v321, v194, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v320, v196, v44);
    unint64_t v197 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v197 = sub_243F3B550(0, *(void *)(v197 + 16) + 1, 1, v197);
    }
    unint64_t v199 = *(void *)(v197 + 16);
    unint64_t v198 = *(void *)(v197 + 24);
    if (v199 >= v198 >> 1) {
      unint64_t v197 = sub_243F3B550(v198 > 1, v199 + 1, 1, v197);
    }
    *(void *)(v197 + 16) = v199 + 1;
    v195((char *)(v197+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v199), (uint64_t)v320, v44);
    unint64_t v359 = v197;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v321, v44);
    v133 = v357;
  }
  v200 = (uint64_t *)(v1 + v171[14]);
  uint64_t v201 = *v200;
  uint64_t v202 = v200[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v203 = v356;
  sub_2443779E8(v201, v202, (void (*)(uint64_t, uint64_t))sub_24437AC80, v356);
  swift_bridgeObjectRelease();
  uint64_t v204 = v203;
  swift_bridgeObjectRelease();
  if (v133((char *)v203, 1, v44) == 1)
  {
    sub_243E9DDBC(v203, &qword_268E46F20);
  }
  else
  {
    v205 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v206 = v323;
    v205(v323, v204, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v322, v206, v44);
    unint64_t v207 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v207 = sub_243F3B550(0, *(void *)(v207 + 16) + 1, 1, v207);
    }
    unint64_t v209 = *(void *)(v207 + 16);
    unint64_t v208 = *(void *)(v207 + 24);
    if (v209 >= v208 >> 1) {
      unint64_t v207 = sub_243F3B550(v208 > 1, v209 + 1, 1, v207);
    }
    *(void *)(v207 + 16) = v209 + 1;
    v205((char *)(v207+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v209), (uint64_t)v322, v44);
    unint64_t v359 = v207;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v323, v44);
    v133 = v357;
  }
  swift_bridgeObjectRetain();
  uint64_t v210 = (uint64_t)v346;
  sub_2443B4E40();
  swift_bridgeObjectRelease();
  uint64_t v356 = v45 + 56;
  v358((char *)v210, 0, 1, v44);
  uint64_t v211 = v210;
  swift_bridgeObjectRelease();
  if (v133((char *)v210, 1, v44) == 1)
  {
    sub_243E9DDBC(v210, &qword_268E46F20);
  }
  else
  {
    v212 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v213 = v325;
    v212(v325, v211, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v324, v213, v44);
    unint64_t v214 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v214 = sub_243F3B550(0, *(void *)(v214 + 16) + 1, 1, v214);
    }
    unint64_t v216 = *(void *)(v214 + 16);
    unint64_t v215 = *(void *)(v214 + 24);
    if (v216 >= v215 >> 1) {
      unint64_t v214 = sub_243F3B550(v215 > 1, v216 + 1, 1, v214);
    }
    *(void *)(v214 + 16) = v216 + 1;
    v212((char *)(v214+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v216), (uint64_t)v324, v44);
    unint64_t v359 = v214;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v325, v44);
    v133 = v357;
  }
  v217 = (uint64_t *)(v1 + v171[16]);
  uint64_t v218 = *v217;
  uint64_t v219 = v217[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v220 = v347;
  sub_2443779E8(v218, v219, (void (*)(uint64_t, uint64_t))sub_24437AC80, v347);
  swift_bridgeObjectRelease();
  uint64_t v221 = v220;
  swift_bridgeObjectRelease();
  if (v133((char *)v220, 1, v44) == 1)
  {
    sub_243E9DDBC(v220, &qword_268E46F20);
  }
  else
  {
    v222 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v223 = v327;
    v222(v327, v221, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v326, v223, v44);
    unint64_t v224 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v224 = sub_243F3B550(0, *(void *)(v224 + 16) + 1, 1, v224);
    }
    unint64_t v226 = *(void *)(v224 + 16);
    unint64_t v225 = *(void *)(v224 + 24);
    if (v226 >= v225 >> 1) {
      unint64_t v224 = sub_243F3B550(v225 > 1, v226 + 1, 1, v224);
    }
    *(void *)(v224 + 16) = v226 + 1;
    v222((char *)(v224+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v226), (uint64_t)v326, v44);
    unint64_t v359 = v224;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v327, v44);
    v133 = v357;
  }
  v227 = (uint64_t *)(v1 + v171[17]);
  uint64_t v228 = *v227;
  uint64_t v229 = v227[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v230 = v348;
  sub_2443779E8(v228, v229, (void (*)(uint64_t, uint64_t))sub_24437AB5C, v348);
  swift_bridgeObjectRelease();
  uint64_t v231 = v230;
  swift_bridgeObjectRelease();
  if (v133((char *)v230, 1, v44) == 1)
  {
    sub_243E9DDBC(v230, &qword_268E46F20);
  }
  else
  {
    v232 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v233 = v329;
    v232(v329, v231, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v328, v233, v44);
    unint64_t v234 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v234 = sub_243F3B550(0, *(void *)(v234 + 16) + 1, 1, v234);
    }
    unint64_t v236 = *(void *)(v234 + 16);
    unint64_t v235 = *(void *)(v234 + 24);
    if (v236 >= v235 >> 1) {
      unint64_t v234 = sub_243F3B550(v235 > 1, v236 + 1, 1, v234);
    }
    *(void *)(v234 + 16) = v236 + 1;
    v232((char *)(v234+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v236), (uint64_t)v328, v44);
    unint64_t v359 = v234;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v329, v44);
    v133 = v357;
  }
  v237 = (uint64_t *)(v1 + v171[18]);
  uint64_t v238 = *v237;
  uint64_t v239 = v237[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v240 = v349;
  sub_2443779E8(v238, v239, (void (*)(uint64_t, uint64_t))sub_24437AC80, v349);
  swift_bridgeObjectRelease();
  uint64_t v241 = v240;
  swift_bridgeObjectRelease();
  if (v133((char *)v240, 1, v44) == 1)
  {
    sub_243E9DDBC(v240, &qword_268E46F20);
  }
  else
  {
    v242 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v243 = v331;
    v242(v331, v241, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v330, v243, v44);
    unint64_t v244 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v244 = sub_243F3B550(0, *(void *)(v244 + 16) + 1, 1, v244);
    }
    unint64_t v246 = *(void *)(v244 + 16);
    unint64_t v245 = *(void *)(v244 + 24);
    if (v246 >= v245 >> 1) {
      unint64_t v244 = sub_243F3B550(v245 > 1, v246 + 1, 1, v244);
    }
    *(void *)(v244 + 16) = v246 + 1;
    v242((char *)(v244+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v246), (uint64_t)v330, v44);
    unint64_t v359 = v244;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v331, v44);
    v133 = v357;
  }
  uint64_t v247 = *(void *)(v1 + v171[19] + 16);
  swift_bridgeObjectRetain();
  sub_244376888(v247);
  if (v248)
  {
    uint64_t v249 = (uint64_t)v350;
    sub_2443B4E40();
    swift_bridgeObjectRelease();
    uint64_t v250 = 0;
  }
  else
  {
    uint64_t v250 = 1;
    uint64_t v249 = (uint64_t)v350;
  }
  v358((char *)v249, v250, 1, v44);
  swift_bridgeObjectRelease();
  unsigned int v251 = v133((char *)v249, 1, v44);
  uint64_t v252 = v249;
  if (v251 == 1)
  {
    sub_243E9DDBC(v249, &qword_268E46F20);
  }
  else
  {
    v253 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v254 = v333;
    v253(v333, v252, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v332, v254, v44);
    unint64_t v255 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v255 = sub_243F3B550(0, *(void *)(v255 + 16) + 1, 1, v255);
    }
    unint64_t v257 = *(void *)(v255 + 16);
    unint64_t v256 = *(void *)(v255 + 24);
    if (v257 >= v256 >> 1) {
      unint64_t v255 = sub_243F3B550(v256 > 1, v257 + 1, 1, v255);
    }
    *(void *)(v255 + 16) = v257 + 1;
    v253((char *)(v255+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v257), (uint64_t)v332, v44);
    unint64_t v359 = v255;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v333, v44);
    v133 = v357;
  }
  swift_bridgeObjectRetain();
  uint64_t v258 = (uint64_t)v351;
  sub_2443B4E40();
  swift_bridgeObjectRelease();
  v358((char *)v258, 0, 1, v44);
  uint64_t v259 = v258;
  swift_bridgeObjectRelease();
  if (v133((char *)v258, 1, v44) == 1)
  {
    sub_243E9DDBC(v258, &qword_268E46F20);
  }
  else
  {
    v260 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v261 = v335;
    v260(v335, v259, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v334, v261, v44);
    unint64_t v262 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v262 = sub_243F3B550(0, *(void *)(v262 + 16) + 1, 1, v262);
    }
    unint64_t v264 = *(void *)(v262 + 16);
    unint64_t v263 = *(void *)(v262 + 24);
    if (v264 >= v263 >> 1) {
      unint64_t v262 = sub_243F3B550(v263 > 1, v264 + 1, 1, v262);
    }
    *(void *)(v262 + 16) = v264 + 1;
    v260((char *)(v262+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v264), (uint64_t)v334, v44);
    unint64_t v359 = v262;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v335, v44);
    v133 = v357;
  }
  char v265 = *(unsigned char *)(v1 + v171[21] + 16);
  swift_bridgeObjectRetain();
  sub_244376E44(v265);
  if (v266)
  {
    uint64_t v267 = (uint64_t)v352;
    sub_2443B4E40();
    swift_bridgeObjectRelease();
    uint64_t v268 = 0;
  }
  else
  {
    uint64_t v268 = 1;
    uint64_t v267 = (uint64_t)v352;
  }
  v358((char *)v267, v268, 1, v44);
  swift_bridgeObjectRelease();
  unsigned int v269 = v133((char *)v267, 1, v44);
  uint64_t v270 = v267;
  if (v269 == 1)
  {
    sub_243E9DDBC(v267, &qword_268E46F20);
  }
  else
  {
    v271 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v272 = v337;
    v271(v337, v270, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v336, v272, v44);
    unint64_t v273 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v273 = sub_243F3B550(0, *(void *)(v273 + 16) + 1, 1, v273);
    }
    unint64_t v275 = *(void *)(v273 + 16);
    unint64_t v274 = *(void *)(v273 + 24);
    if (v275 >= v274 >> 1) {
      unint64_t v273 = sub_243F3B550(v274 > 1, v275 + 1, 1, v273);
    }
    *(void *)(v273 + 16) = v275 + 1;
    v271((char *)(v273+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v275), (uint64_t)v336, v44);
    unint64_t v359 = v273;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v337, v44);
    v133 = v357;
  }
  v276 = (uint64_t *)(v1 + v171[22]);
  uint64_t v277 = *v276;
  uint64_t v278 = v276[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v279 = v353;
  sub_2443779E8(v277, v278, (void (*)(uint64_t, uint64_t))sub_24437AC80, v353);
  swift_bridgeObjectRelease();
  uint64_t v280 = v279;
  swift_bridgeObjectRelease();
  if (v133((char *)v279, 1, v44) == 1)
  {
    sub_243E9DDBC(v279, &qword_268E46F20);
  }
  else
  {
    v281 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
    v282 = v339;
    v281(v339, v280, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v338, v282, v44);
    unint64_t v283 = v359;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v283 = sub_243F3B550(0, *(void *)(v283 + 16) + 1, 1, v283);
    }
    unint64_t v285 = *(void *)(v283 + 16);
    unint64_t v284 = *(void *)(v283 + 24);
    if (v285 >= v284 >> 1) {
      unint64_t v283 = sub_243F3B550(v284 > 1, v285 + 1, 1, v283);
    }
    *(void *)(v283 + 16) = v285 + 1;
    v281((char *)(v283+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v285), (uint64_t)v338, v44);
    unint64_t v359 = v283;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v339, v44);
    v133 = v357;
  }
  if (!*(void *)(v1 + v171[23] + 24))
  {
    uint64_t v286 = (uint64_t)v354;
    v358(v354, 1, 1, v44);
    goto LABEL_146;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v286 = (uint64_t)v354;
  sub_2443B4E40();
  v358((char *)v286, 0, 1, v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v133((char *)v286, 1, v44) == 1)
  {
LABEL_146:
    sub_243E9DDBC(v286, &qword_268E46F20);
    goto LABEL_147;
  }
  v287 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
  v288 = v309;
  v287(v309, v286, v44);
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v308, v288, v44);
  unint64_t v289 = v359;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v289 = sub_243F3B550(0, *(void *)(v289 + 16) + 1, 1, v289);
  }
  unint64_t v291 = *(void *)(v289 + 16);
  unint64_t v290 = *(void *)(v289 + 24);
  if (v291 >= v290 >> 1) {
    unint64_t v289 = sub_243F3B550(v290 > 1, v291 + 1, 1, v289);
  }
  *(void *)(v289 + 16) = v291 + 1;
  v287((char *)(v289+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v291), (uint64_t)v308, v44);
  unint64_t v359 = v289;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v309, v44);
  v133 = v357;
LABEL_147:
  if (!*(void *)(v1 + v171[24] + 24))
  {
    uint64_t v292 = (uint64_t)v355;
    v358(v355, 1, 1, v44);
    goto LABEL_155;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v292 = (uint64_t)v355;
  sub_2443B4E40();
  v358((char *)v292, 0, 1, v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v133((char *)v292, 1, v44) == 1)
  {
LABEL_155:
    sub_243E9DDBC(v292, &qword_268E46F20);
    return v359;
  }
  v293 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
  v294 = v303;
  v293(v303, v292, v44);
  v295 = v302;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v302, v294, v44);
  unint64_t v296 = v359;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v296 = sub_243F3B550(0, *(void *)(v296 + 16) + 1, 1, v296);
  }
  unint64_t v298 = *(void *)(v296 + 16);
  unint64_t v297 = *(void *)(v296 + 24);
  if (v298 >= v297 >> 1) {
    unint64_t v296 = sub_243F3B550(v297 > 1, v298 + 1, 1, v296);
  }
  *(void *)(v296 + 16) = v298 + 1;
  v293((char *)(v296+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v298), (uint64_t)v295, v44);
  unint64_t v359 = v296;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v294, v44);
  return v359;
}

uint64_t sub_244375BC8(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return MEMORY[0x270FA2400]();
}

uint64_t sub_244375BEC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3AC48);
  sub_2443B4E50();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2443C34A0;
  sub_2443BB770();
  sub_2443B4E40();
  swift_bridgeObjectRelease();
  sub_2443B4E40();
  sub_2443B4E40();
  return v0;
}

uint64_t sub_244375D60()
{
  return sub_2443BB9D0();
}

uint64_t sub_244375DE0()
{
  sub_2443BB9A0();
  sub_2443BA590();

  return sub_2443BA590();
}

uint64_t sub_244375E50()
{
  return sub_2443BB9D0();
}

uint64_t sub_244375ECC(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  uint64_t v8 = *(void *)(a2 + 32);
  return sub_24437A984(v5, v7) & 1;
}

unint64_t sub_244375F18(char a1)
{
  unint64_t result = 0x7974697275636553;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0x7265776F50;
      break;
    case 3:
      unint64_t result = 0x616D726F66726550;
      break;
    case 4:
      unint64_t result = 0x69626173552F4955;
      break;
    case 5:
      unint64_t result = 0x2073756F69726553;
      break;
    case 6:
      unint64_t result = 0x754220726568744FLL;
      break;
    case 7:
      unint64_t result = 0x2065727574616546;
      break;
    case 8:
      unint64_t result = 0x6D65636E61686E45;
      break;
    case 9:
      unint64_t result = 1802723668;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24437607C(char a1)
{
  unint64_t result = 0x7974697275636553;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0x7265776F50;
      break;
    case 3:
      unint64_t result = 0x616D726F66726550;
      break;
    case 4:
      unint64_t result = 0x69626173552F4955;
      break;
    case 5:
      unint64_t result = 0x2073756F69726553;
      break;
    case 6:
      unint64_t result = 0x754220726568744FLL;
      break;
    case 7:
      unint64_t result = 0x2065727574616546;
      break;
    case 8:
      unint64_t result = 0x6D65636E61686E45;
      break;
    case 9:
      unint64_t result = 1802723668;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2443761E0(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_24437607C(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_24437607C(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2443BB7D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24437626C()
{
  char v1 = *v0;
  sub_2443BB990();
  sub_24437607C(v1);
  sub_2443BA590();
  swift_bridgeObjectRelease();
  return sub_2443BB9D0();
}

uint64_t sub_2443762D0()
{
  sub_24437607C(*v0);
  sub_2443BA590();

  return swift_bridgeObjectRelease();
}

uint64_t sub_244376324()
{
  char v1 = *v0;
  sub_2443BB990();
  sub_24437607C(v1);
  sub_2443BA590();
  swift_bridgeObjectRelease();
  return sub_2443BB9D0();
}

uint64_t sub_244376384@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24437B93C();
  *a1 = result;
  return result;
}

unint64_t sub_2443763B4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_24437607C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_2443763E0()
{
  return sub_244375F18(*v0);
}

uint64_t sub_2443763E8(unsigned __int8 *a1, char *a2)
{
  return sub_243FE2608(*a1, *a2);
}

uint64_t sub_2443763F4()
{
  return sub_243FD6D58();
}

uint64_t sub_2443763FC()
{
  sub_2443BA590();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2443764FC()
{
  return sub_2443131BC();
}

uint64_t sub_244376504@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24437B988();
  *a1 = result;
  return result;
}

void sub_244376534(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE600000000000000;
  uint64_t v3 = 0x737961776C41;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE900000000000073;
      uint64_t v3 = 0x656D6974656D6F53;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0x796C65726152;
      *(void *)(a1 + 8) = 0xE600000000000000;
      break;
    case 3:
      *(void *)a1 = 0x656C62616E55;
      *(void *)(a1 + 8) = 0xE600000000000000;
      break;
    case 4:
      strcpy((char *)a1, "I Didn't Try");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 5:
      strcpy((char *)a1, "Not Applicable");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t sub_244376614()
{
  return *(void *)&aAlways_2[8 * *v0];
}

uint64_t sub_244376638(unsigned __int8 *a1, char *a2)
{
  return sub_243FE29F8(*a1, *a2);
}

uint64_t sub_244376644()
{
  return sub_2443133D0();
}

uint64_t sub_244376650()
{
  sub_2443BA590();

  return swift_bridgeObjectRelease();
}

uint64_t sub_244376748()
{
  return sub_2443133D0();
}

uint64_t sub_244376750@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24437B9D4();
  *a1 = result;
  return result;
}

void sub_244376788(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE600000000000000;
  uint64_t v3 = 0x656E6F685069;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1684099177;
      goto LABEL_3;
    case 2:
      *a1 = 0x6863746157;
      a1[1] = 0xE500000000000000;
      break;
    case 3:
      *a1 = 0x5654656C707041;
      a1[1] = 0xE700000000000000;
      break;
    case 4:
      *a1 = 0x646F50656D6F48;
      a1[1] = 0xE700000000000000;
      break;
    case 5:
      *a1 = 6512973;
      a1[1] = 0xE300000000000000;
      break;
    case 6:
      *a1 = 0x6E6F69736956;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_244376864()
{
  return *(void *)&aIphone_2[8 * *v0];
}

uint64_t sub_244376888(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (a1)
    {
      unint64_t v2 = sub_243F3A284(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v4 = v2[2];
      unint64_t v3 = v2[3];
      if (v4 >= v3 >> 1) {
        unint64_t v2 = sub_243F3A284((void *)(v3 > 1), v4 + 1, 1, v2);
      }
      v2[2] = v4 + 1;
      uint64_t v5 = &v2[2 * v4];
      v5[4] = 0x79616C50726941;
      v5[5] = 0xE700000000000000;
      if ((v1 & 2) == 0)
      {
LABEL_14:
        if ((v1 & 4) != 0)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v2 = sub_243F3A284(0, v2[2] + 1, 1, v2);
          }
          unint64_t v10 = v2[2];
          unint64_t v9 = v2[3];
          if (v10 >= v9 >> 1) {
            unint64_t v2 = sub_243F3A284((void *)(v9 > 1), v10 + 1, 1, v2);
          }
          v2[2] = v10 + 1;
          uint64_t v11 = (char *)&v2[2 * v10];
          strcpy(v11 + 32, "MediaSystems");
          v11[45] = 0;
          *((_WORD *)v11 + 23) = -5120;
        }
        if ((v1 & 8) != 0)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v2 = sub_243F3A284(0, v2[2] + 1, 1, v2);
          }
          unint64_t v13 = v2[2];
          unint64_t v12 = v2[3];
          if (v13 >= v12 >> 1) {
            unint64_t v2 = sub_243F3A284((void *)(v12 > 1), v13 + 1, 1, v2);
          }
          v2[2] = v13 + 1;
          uint64_t v14 = &v2[2 * v13];
          v14[4] = 0x616C506572616853;
          v14[5] = 0xE900000000000079;
          if ((v1 & 0x10) == 0)
          {
LABEL_22:
            if ((v1 & 0x20) == 0) {
              goto LABEL_23;
            }
            goto LABEL_36;
          }
        }
        else if ((v1 & 0x10) == 0)
        {
          goto LABEL_22;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v2 = sub_243F3A284(0, v2[2] + 1, 1, v2);
        }
        unint64_t v16 = v2[2];
        unint64_t v15 = v2[3];
        if (v16 >= v15 >> 1) {
          unint64_t v2 = sub_243F3A284((void *)(v15 > 1), v16 + 1, 1, v2);
        }
        v2[2] = v16 + 1;
        uint64_t v17 = &v2[2 * v16];
        v17[4] = 0x79627261654ELL;
        v17[5] = 0xE600000000000000;
        if ((v1 & 0x20) == 0)
        {
LABEL_23:
          if ((v1 & 0x40) == 0) {
            goto LABEL_24;
          }
          goto LABEL_41;
        }
LABEL_36:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v2 = sub_243F3A284(0, v2[2] + 1, 1, v2);
        }
        unint64_t v19 = v2[2];
        unint64_t v18 = v2[3];
        if (v19 >= v18 >> 1) {
          unint64_t v2 = sub_243F3A284((void *)(v18 > 1), v19 + 1, 1, v2);
        }
        v2[2] = v19 + 1;
        uint64_t v20 = &v2[2 * v19];
        v20[4] = 0x657463656E6E6F43;
        v20[5] = 0xE900000000000064;
        if ((v1 & 0x40) == 0)
        {
LABEL_24:
          if ((v1 & 0x80) == 0)
          {
LABEL_51:
            __swift_instantiateConcreteTypeFromMangledName(&qword_268E37EC8);
            sub_243F91928();
            uint64_t v1 = sub_2443BA3D0();
            swift_bridgeObjectRelease();
            return v1;
          }
LABEL_46:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v2 = sub_243F3A284(0, v2[2] + 1, 1, v2);
          }
          unint64_t v25 = v2[2];
          unint64_t v24 = v2[3];
          if (v25 >= v24 >> 1) {
            unint64_t v2 = sub_243F3A284((void *)(v24 > 1), v25 + 1, 1, v2);
          }
          v2[2] = v25 + 1;
          uint64_t v26 = &v2[2 * v25];
          v26[4] = 0xD000000000000016;
          v26[5] = 0x80000002443F6630;
          goto LABEL_51;
        }
LABEL_41:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v2 = sub_243F3A284(0, v2[2] + 1, 1, v2);
        }
        unint64_t v22 = v2[2];
        unint64_t v21 = v2[3];
        if (v22 >= v21 >> 1) {
          unint64_t v2 = sub_243F3A284((void *)(v21 > 1), v22 + 1, 1, v2);
        }
        v2[2] = v22 + 1;
        uint64_t v23 = &v2[2 * v22];
        v23[4] = 0x61656854656D6F48;
        v23[5] = 0xEB00000000726574;
        if ((v1 & 0x80) == 0) {
          goto LABEL_51;
        }
        goto LABEL_46;
      }
    }
    else
    {
      unint64_t v2 = (void *)MEMORY[0x263F8EE78];
      if ((a1 & 2) == 0) {
        goto LABEL_14;
      }
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v2 = sub_243F3A284(0, v2[2] + 1, 1, v2);
    }
    unint64_t v7 = v2[2];
    unint64_t v6 = v2[3];
    if (v7 >= v6 >> 1) {
      unint64_t v2 = sub_243F3A284((void *)(v6 > 1), v7 + 1, 1, v2);
    }
    v2[2] = v7 + 1;
    char v8 = &v2[2 * v7];
    v8[4] = 0x4874694B656D6F48;
    v8[5] = 0xEB00000000656D6FLL;
    goto LABEL_14;
  }
  return v1;
}

uint64_t sub_244376D44()
{
  return sub_244376888(*v0);
}

uint64_t sub_244376D4C()
{
  return sub_2443BB9D0();
}

uint64_t sub_244376D94()
{
  return sub_2443BB9A0();
}

uint64_t sub_244376DC0()
{
  return sub_2443BB9D0();
}

uint64_t sub_244376E04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2440B857C();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

unint64_t sub_244376E44(char a1)
{
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      char v2 = sub_2443BB7D0();
      swift_bridgeObjectRelease();
      if (v2) {
        goto LABEL_4;
      }
      unint64_t result = 48;
      switch(a1)
      {
        case 2:
          unint64_t result = 12589;
          break;
        case 3:
        case 4:
        case 5:
          unint64_t result = 0xD000000000000010;
          break;
        case 6:
          unint64_t result = 0xD00000000000001CLL;
          break;
        default:
          return result;
      }
      break;
    default:
      swift_bridgeObjectRelease();
LABEL_4:
      unint64_t result = 0;
      break;
  }
  return result;
}

unint64_t sub_244376FF4(char a1)
{
  unint64_t result = 7105633;
  switch(a1)
  {
    case 1:
      unint64_t result = 48;
      break;
    case 2:
      unint64_t result = 12589;
      break;
    case 3:
    case 4:
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
      unint64_t result = 0xD00000000000001CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2443770B0(unsigned __int8 *a1, char *a2)
{
  return sub_243FE281C(*a1, *a2);
}

uint64_t sub_2443770BC()
{
  return sub_2443132D0();
}

uint64_t sub_2443770C8()
{
  return sub_244312EA4();
}

uint64_t sub_2443770D0()
{
  return sub_2443132D0();
}

uint64_t sub_2443770D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24437B9D4();
  *a1 = result;
  return result;
}

unint64_t sub_244377110@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_244376FF4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_24437713C()
{
  return sub_244376E44(*v0);
}

uint64_t sub_244377144(char a1)
{
  if (!a1) {
    return 0xD000000000000028;
  }
  if (a1 == 1) {
    return 0xD00000000000001DLL;
  }
  return 0x100000000000002FLL;
}

uint64_t sub_2443771A4()
{
  return sub_244377144(*v0);
}

uint64_t sub_2443771AC@<X0>(char a1@<W2>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 10:
      uint64_t v3 = sub_2443B4E50();
      unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
      uint64_t v5 = v3;
      uint64_t v6 = a2;
      uint64_t v7 = 1;
      break;
    default:
      sub_2443B4E40();
      swift_bridgeObjectRelease();
      uint64_t v8 = sub_2443B4E50();
      unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
      uint64_t v5 = v8;
      uint64_t v6 = a2;
      uint64_t v7 = 0;
      break;
  }

  return v4(v6, v7, 1, v5);
}

uint64_t sub_2443773C4@<X0>(char a1@<W2>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 6:
      uint64_t v9 = sub_2443B4E50();
      unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
      uint64_t v5 = v9;
      uint64_t v6 = a2;
      uint64_t v7 = 1;
      break;
    default:
      sub_2443B4E40();
      swift_bridgeObjectRelease();
      uint64_t v3 = sub_2443B4E50();
      unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
      uint64_t v5 = v3;
      uint64_t v6 = a2;
      uint64_t v7 = 0;
      break;
  }

  return v4(v6, v7, 1, v5);
}

uint64_t sub_244377548@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3AC88);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2443B5440();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E41AD8);
  sub_24425F88C(v2 + *(int *)(v11 + 36), (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_243E9DDBC((uint64_t)v6, &qword_268E3AC88);
    uint64_t v12 = sub_2443B4E50();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a1, 1, 1, v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
    unint64_t v15 = (void *)sub_2443BA4B0();
    objc_msgSend(v14, sel_setDateFormat_, v15);

    objc_msgSend(v14, sel_setDoesRelativeDateFormatting_, 0);
    unint64_t v16 = (void *)sub_2443B53D0();
    id v17 = objc_msgSend(v14, sel_stringFromDate_, v16);

    sub_2443BA4F0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_2443B4E40();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_2443B4E50();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a1, 0, 1, v18);
  }
}

uint64_t sub_244377818@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  if (*(void *)(a2 + 16))
  {
    MEMORY[0x270FA5388](a1);
    sub_2443B5350();
    uint64_t KeyPath = swift_getKeyPath();
    swift_retain();
    sub_24437ADB0(a2, KeyPath);
    swift_release_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E37EC8);
    sub_243F91928();
    sub_2443BA3D0();
    swift_bridgeObjectRelease();
    sub_2443B4E40();
    swift_bridgeObjectRelease();
    uint64_t v6 = sub_2443B4E50();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a3, 0, 1, v6);
  }
  else
  {
    uint64_t v8 = sub_2443B4E50();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    return v9(a3, 1, 1, v8);
  }
}

uint64_t sub_2443779E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, void (*a3)(uint64_t, uint64_t)@<X5>, uint64_t a4@<X8>)
{
  if (*(void *)(a2 + 16))
  {
    MEMORY[0x270FA5388](a1);
    uint64_t KeyPath = swift_getKeyPath();
    swift_retain();
    a3(a2, KeyPath);
    swift_release_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E37EC8);
    sub_243F91928();
    sub_2443BA3D0();
    swift_bridgeObjectRelease();
    sub_2443B4E40();
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_2443B4E50();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a4, 0, 1, v8);
  }
  else
  {
    uint64_t v10 = sub_2443B4E50();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    return v11(a4, 1, 1, v10);
  }
}

uint64_t sub_244377BAC()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_244377BDC()
{
  return sub_2443BB770();
}

uint64_t sub_244377C18()
{
  if (*v0) {
    return 49;
  }
  else {
    return 48;
  }
}

uint64_t sub_244377C30()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  uint64_t v1 = (void *)sub_2443BA4B0();
  objc_msgSend(v0, sel_setDateFormat_, v1);

  objc_msgSend(v0, sel_setDoesRelativeDateFormatting_, 0);
  uint64_t v2 = (void *)sub_2443B53D0();
  id v3 = objc_msgSend(v0, sel_stringFromDate_, v2);

  uint64_t v4 = sub_2443BA4F0();
  return v4;
}

uint64_t sub_244377D0C()
{
  return sub_2443B52F0();
}

uint64_t sub_244377D14()
{
  sub_2443BA8B0();
  swift_getWitnessTable();
  uint64_t v0 = sub_2443BAC20();
  uint64_t v1 = 0;
  if ((v0 & 1) == 0)
  {
    MEMORY[0x270FA5388](v0);
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    swift_getWitnessTable();
    sub_2443BA720();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E37EC8);
    sub_243F91928();
    uint64_t v1 = sub_2443BA3D0();
    swift_bridgeObjectRelease();
  }
  return v1;
}

uint64_t sub_244377EA8()
{
  return sub_244377D14();
}

uint64_t sub_244377EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v5 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v12, a1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, a1);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(v8, a2);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v13;
}

uint64_t sub_2443780B0(uint64_t a1, uint64_t a2)
{
  return sub_244377EBC(a1, *(void *)(a2 - 8));
}

uint64_t sub_2443780B8(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *(void *)a1 = *a2;
    a1 = v12 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = a2[6];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v9)
    {
      *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
      uint64_t v10 = a2[7];
      uint64_t v11 = a2[8];
      *(void *)(a1 + 48) = v9;
      *(void *)(a1 + 56) = v10;
      *(void *)(a1 + 64) = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v13 = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 48) = v13;
      *(void *)(a1 + 64) = a2[8];
    }
    uint64_t v14 = a2[10];
    *(void *)(a1 + 72) = a2[9];
    *(void *)(a1 + 80) = v14;
    *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
    uint64_t v15 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v15;
    *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
    uint64_t v16 = a2[16];
    *(void *)(a1 + 120) = a2[15];
    *(void *)(a1 + 128) = v16;
    uint64_t v17 = a2[18];
    *(void *)(a1 + 136) = a2[17];
    *(void *)(a1 + 144) = v17;
    uint64_t v18 = a2[20];
    *(void *)(a1 + 152) = a2[19];
    *(void *)(a1 + 160) = v18;
    uint64_t v19 = a2[22];
    *(void *)(a1 + 168) = a2[21];
    *(void *)(a1 + 176) = v19;
    uint64_t v20 = a2[24];
    *(void *)(a1 + 184) = a2[23];
    *(void *)(a1 + 192) = v20;
    *(void *)(a1 + 200) = a2[25];
    uint64_t v21 = a3[11];
    unint64_t v22 = (void *)(a1 + v21);
    uint64_t v23 = (uint64_t)a2 + v21;
    uint64_t v24 = *(uint64_t *)((char *)a2 + v21 + 8);
    void *v22 = *(uint64_t *)((char *)a2 + v21);
    v22[1] = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v25 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E41AD8) + 36);
    uint64_t v26 = (char *)v22 + v25;
    uint64_t v27 = (const void *)(v23 + v25);
    uint64_t v28 = sub_2443B5440();
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
    {
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3AC88);
      memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
    uint64_t v31 = a3[12];
    uint64_t v32 = a3[13];
    uint64_t v33 = (void *)(a1 + v31);
    uint64_t v34 = (uint64_t *)((char *)a2 + v31);
    uint64_t v35 = v34[1];
    *uint64_t v33 = *v34;
    v33[1] = v35;
    v33[2] = v34[2];
    uint64_t v36 = (void *)(a1 + v32);
    uint64_t v37 = (uint64_t *)((char *)a2 + v32);
    uint64_t v38 = v37[1];
    *uint64_t v36 = *v37;
    v36[1] = v38;
    v36[2] = v37[2];
    uint64_t v39 = a3[14];
    uint64_t v40 = a3[15];
    uint64_t v41 = (void *)(a1 + v39);
    uint64_t v42 = (uint64_t *)((char *)a2 + v39);
    uint64_t v43 = v42[1];
    *uint64_t v41 = *v42;
    v41[1] = v43;
    v41[2] = v42[2];
    uint64_t v44 = a1 + v40;
    uint64_t v45 = (uint64_t)a2 + v40;
    uint64_t v46 = *(void *)(v45 + 8);
    *(void *)uint64_t v44 = *(void *)v45;
    *(void *)(v44 + 8) = v46;
    *(unsigned char *)(v44 + 16) = *(unsigned char *)(v45 + 16);
    uint64_t v47 = a3[16];
    uint64_t v48 = a3[17];
    uint64_t v49 = (void *)(a1 + v47);
    uint64_t v50 = (uint64_t *)((char *)a2 + v47);
    uint64_t v51 = v50[1];
    *uint64_t v49 = *v50;
    v49[1] = v51;
    v49[2] = v50[2];
    uint64_t v52 = (void *)(a1 + v48);
    uint64_t v53 = (uint64_t *)((char *)a2 + v48);
    uint64_t v54 = v53[1];
    void *v52 = *v53;
    v52[1] = v54;
    v52[2] = v53[2];
    uint64_t v55 = a3[18];
    uint64_t v56 = a3[19];
    uint64_t v57 = (void *)(a1 + v55);
    uint64_t v58 = (uint64_t *)((char *)a2 + v55);
    uint64_t v59 = v58[1];
    *uint64_t v57 = *v58;
    v57[1] = v59;
    v57[2] = v58[2];
    uint64_t v60 = (void *)(a1 + v56);
    uint64_t v61 = (uint64_t *)((char *)a2 + v56);
    uint64_t v62 = v61[1];
    *uint64_t v60 = *v61;
    v60[1] = v62;
    v60[2] = v61[2];
    uint64_t v63 = a3[20];
    uint64_t v64 = a3[21];
    uint64_t v65 = a1 + v63;
    uint64_t v66 = (uint64_t)a2 + v63;
    uint64_t v67 = *(void *)(v66 + 8);
    *(void *)uint64_t v65 = *(void *)v66;
    *(void *)(v65 + 8) = v67;
    *(unsigned char *)(v65 + 16) = *(unsigned char *)(v66 + 16);
    uint64_t v68 = a1 + v64;
    uint64_t v69 = (uint64_t)a2 + v64;
    uint64_t v70 = *(void *)(v69 + 8);
    *(void *)uint64_t v68 = *(void *)v69;
    *(void *)(v68 + 8) = v70;
    *(unsigned char *)(v68 + 16) = *(unsigned char *)(v69 + 16);
    uint64_t v71 = a3[22];
    uint64_t v72 = a3[23];
    uint64_t v73 = (void *)(a1 + v71);
    uint64_t v74 = (uint64_t *)((char *)a2 + v71);
    uint64_t v75 = v74[1];
    *uint64_t v73 = *v74;
    v73[1] = v75;
    v73[2] = v74[2];
    uint64_t v76 = (void *)(a1 + v72);
    uint64_t v77 = (uint64_t *)((char *)a2 + v72);
    uint64_t v78 = v77[1];
    *uint64_t v76 = *v77;
    v76[1] = v78;
    uint64_t v79 = v77[3];
    v76[2] = v77[2];
    v76[3] = v79;
    uint64_t v80 = a3[24];
    uint64_t v81 = (void *)(a1 + v80);
    uint64_t v82 = (uint64_t *)((char *)a2 + v80);
    uint64_t v83 = v82[1];
    *uint64_t v81 = *v82;
    v81[1] = v83;
    uint64_t v84 = v82[3];
    v81[2] = v82[2];
    v81[3] = v84;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_244378580(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 48))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 44);
  swift_bridgeObjectRelease();
  uint64_t v5 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E41AD8) + 36);
  uint64_t v6 = sub_2443B5440();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2443787D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v8)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    uint64_t v9 = *(void *)(a2 + 56);
    uint64_t v10 = *(void *)(a2 + 64);
    *(void *)(a1 + 48) = v8;
    *(void *)(a1 + 56) = v9;
    *(void *)(a1 + 64) = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v11 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v11;
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
  }
  uint64_t v12 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v12;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v13 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v13;
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  uint64_t v14 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v14;
  uint64_t v15 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v15;
  uint64_t v16 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v16;
  uint64_t v17 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v17;
  uint64_t v18 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v18;
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  uint64_t v84 = a3;
  uint64_t v19 = a3[11];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = a2 + v19;
  uint64_t v22 = *(void *)(a2 + v19 + 8);
  *uint64_t v20 = *(void *)(a2 + v19);
  v20[1] = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E41AD8) + 36);
  uint64_t v24 = (char *)v20 + v23;
  uint64_t v25 = (const void *)(v21 + v23);
  uint64_t v26 = sub_2443B5440();
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
  {
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3AC88);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v27 + 16))(v24, v25, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  uint64_t v29 = v84[12];
  uint64_t v30 = v84[13];
  uint64_t v31 = (void *)(a1 + v29);
  uint64_t v32 = (void *)(a2 + v29);
  uint64_t v33 = v32[1];
  *uint64_t v31 = *v32;
  v31[1] = v33;
  v31[2] = v32[2];
  uint64_t v34 = (void *)(a1 + v30);
  uint64_t v35 = (void *)(a2 + v30);
  uint64_t v36 = v35[1];
  *uint64_t v34 = *v35;
  v34[1] = v36;
  v34[2] = v35[2];
  uint64_t v37 = v84[14];
  uint64_t v38 = v84[15];
  uint64_t v39 = (void *)(a1 + v37);
  uint64_t v40 = (void *)(a2 + v37);
  uint64_t v41 = v40[1];
  *uint64_t v39 = *v40;
  v39[1] = v41;
  v39[2] = v40[2];
  uint64_t v42 = a1 + v38;
  uint64_t v43 = a2 + v38;
  uint64_t v44 = *(void *)(v43 + 8);
  *(void *)uint64_t v42 = *(void *)v43;
  *(void *)(v42 + 8) = v44;
  *(unsigned char *)(v42 + 16) = *(unsigned char *)(v43 + 16);
  uint64_t v45 = v84[16];
  uint64_t v46 = v84[17];
  uint64_t v47 = (void *)(a1 + v45);
  uint64_t v48 = (void *)(a2 + v45);
  uint64_t v49 = v48[1];
  *uint64_t v47 = *v48;
  v47[1] = v49;
  v47[2] = v48[2];
  uint64_t v50 = (void *)(a1 + v46);
  uint64_t v51 = (void *)(a2 + v46);
  uint64_t v52 = v51[1];
  *uint64_t v50 = *v51;
  v50[1] = v52;
  v50[2] = v51[2];
  uint64_t v53 = v84[18];
  uint64_t v54 = v84[19];
  uint64_t v55 = (void *)(a1 + v53);
  uint64_t v56 = (void *)(a2 + v53);
  uint64_t v57 = v56[1];
  *uint64_t v55 = *v56;
  v55[1] = v57;
  v55[2] = v56[2];
  uint64_t v58 = (void *)(a1 + v54);
  uint64_t v59 = (void *)(a2 + v54);
  uint64_t v60 = v59[1];
  void *v58 = *v59;
  v58[1] = v60;
  v58[2] = v59[2];
  uint64_t v61 = v84[20];
  uint64_t v62 = v84[21];
  uint64_t v63 = a1 + v61;
  uint64_t v64 = a2 + v61;
  uint64_t v65 = *(void *)(v64 + 8);
  *(void *)uint64_t v63 = *(void *)v64;
  *(void *)(v63 + 8) = v65;
  *(unsigned char *)(v63 + 16) = *(unsigned char *)(v64 + 16);
  uint64_t v66 = a1 + v62;
  uint64_t v67 = a2 + v62;
  uint64_t v68 = *(void *)(v67 + 8);
  *(void *)uint64_t v66 = *(void *)v67;
  *(void *)(v66 + 8) = v68;
  *(unsigned char *)(v66 + 16) = *(unsigned char *)(v67 + 16);
  uint64_t v69 = v84[22];
  uint64_t v70 = v84[23];
  uint64_t v71 = (void *)(a1 + v69);
  uint64_t v72 = (void *)(a2 + v69);
  uint64_t v73 = v72[1];
  *uint64_t v71 = *v72;
  v71[1] = v73;
  v71[2] = v72[2];
  uint64_t v74 = (void *)(a1 + v70);
  uint64_t v75 = (void *)(a2 + v70);
  uint64_t v76 = v75[1];
  *uint64_t v74 = *v75;
  v74[1] = v76;
  uint64_t v77 = v75[3];
  v74[2] = v75[2];
  v74[3] = v77;
  uint64_t v78 = v84[24];
  uint64_t v79 = (void *)(a1 + v78);
  uint64_t v80 = (void *)(a2 + v78);
  uint64_t v81 = v80[1];
  *uint64_t v79 = *v80;
  v79[1] = v81;
  uint64_t v82 = v80[3];
  v79[2] = v80[2];
  v79[3] = v82;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244378C54(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (_OWORD *)(a1 + 32);
  uint64_t v7 = (_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48))
  {
    if (v8)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_244379360(a1 + 32);
      uint64_t v9 = *(void *)(a2 + 64);
      long long v10 = *(_OWORD *)(a2 + 48);
      *uint64_t v6 = *v7;
      *(_OWORD *)(a1 + 48) = v10;
      *(void *)(a1 + 64) = v9;
    }
  }
  else if (v8)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v11 = *v7;
    long long v12 = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *uint64_t v6 = v11;
    *(_OWORD *)(a1 + 48) = v12;
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[11];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = a2 + v13;
  *uint64_t v14 = *(void *)(a2 + v13);
  v14[1] = *(void *)(a2 + v13 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E41AD8) + 36);
  uint64_t v17 = (char *)v14 + v16;
  uint64_t v18 = (char *)(v15 + v16);
  uint64_t v19 = sub_2443B5440();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 24))(v17, v18, v19);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_13;
  }
  if (v23)
  {
LABEL_13:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3AC88);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
LABEL_14:
  uint64_t v25 = a3[12];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = a2 + v25;
  *uint64_t v26 = *(void *)(a2 + v25);
  v26[1] = *(void *)(a2 + v25 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v26[2] = *(void *)(v27 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[13];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = a2 + v28;
  *uint64_t v29 = *(void *)(a2 + v28);
  v29[1] = *(void *)(a2 + v28 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29[2] = *(void *)(v30 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v31 = a3[14];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = a2 + v31;
  *uint64_t v32 = *(void *)(a2 + v31);
  v32[1] = *(void *)(a2 + v31 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v32[2] = *(void *)(v33 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = a3[15];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  *(void *)uint64_t v35 = *(void *)(a2 + v34);
  *(void *)(v35 + 8) = *(void *)(a2 + v34 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v35 + 16) = *(unsigned char *)(v36 + 16);
  uint64_t v37 = a3[16];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = a2 + v37;
  *uint64_t v38 = *(void *)(a2 + v37);
  v38[1] = *(void *)(a2 + v37 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v38[2] = *(void *)(v39 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v40 = a3[17];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = a2 + v40;
  *uint64_t v41 = *(void *)(a2 + v40);
  v41[1] = *(void *)(a2 + v40 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v41[2] = *(void *)(v42 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v43 = a3[18];
  uint64_t v44 = (void *)(a1 + v43);
  uint64_t v45 = a2 + v43;
  *uint64_t v44 = *(void *)(a2 + v43);
  v44[1] = *(void *)(a2 + v43 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v44[2] = *(void *)(v45 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v46 = a3[19];
  uint64_t v47 = (void *)(a1 + v46);
  uint64_t v48 = a2 + v46;
  *uint64_t v47 = *(void *)(a2 + v46);
  v47[1] = *(void *)(a2 + v46 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v47[2] = *(void *)(v48 + 16);
  uint64_t v49 = a3[20];
  uint64_t v50 = a1 + v49;
  uint64_t v51 = a2 + v49;
  *(void *)uint64_t v50 = *(void *)(a2 + v49);
  *(void *)(v50 + 8) = *(void *)(a2 + v49 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v50 + 16) = *(unsigned char *)(v51 + 16);
  uint64_t v52 = a3[21];
  uint64_t v53 = a1 + v52;
  uint64_t v54 = a2 + v52;
  *(void *)uint64_t v53 = *(void *)(a2 + v52);
  *(void *)(v53 + 8) = *(void *)(a2 + v52 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v53 + 16) = *(unsigned char *)(v54 + 16);
  uint64_t v55 = a3[22];
  uint64_t v56 = (void *)(a1 + v55);
  uint64_t v57 = a2 + v55;
  *uint64_t v56 = *(void *)(a2 + v55);
  v56[1] = *(void *)(a2 + v55 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v56[2] = *(void *)(v57 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v58 = a3[23];
  uint64_t v59 = (void *)(a1 + v58);
  uint64_t v60 = a2 + v58;
  void *v59 = *(void *)(a2 + v58);
  v59[1] = *(void *)(a2 + v58 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v59[2] = *(void *)(v60 + 16);
  v59[3] = *(void *)(v60 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v61 = a3[24];
  uint64_t v62 = (void *)(a1 + v61);
  uint64_t v63 = a2 + v61;
  *uint64_t v62 = *(void *)(a2 + v61);
  v62[1] = *(void *)(a2 + v61 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v62[2] = *(void *)(v63 + 16);
  v62[3] = *(void *)(v63 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_244379360(uint64_t a1)
{
  return a1;
}

uint64_t sub_244379394(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  uint64_t v8 = a3[11];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E41AD8) + 36);
  long long v12 = (void *)(v9 + v11);
  uint64_t v13 = (const void *)(v10 + v11);
  uint64_t v14 = sub_2443B5440();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3AC88);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v17 = a3[12];
  uint64_t v18 = a3[13];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *(void *)(v19 + 16) = *(void *)(v20 + 16);
  uint64_t v21 = a1 + v18;
  uint64_t v22 = a2 + v18;
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *(void *)(v21 + 16) = *(void *)(v22 + 16);
  uint64_t v23 = a3[14];
  uint64_t v24 = a3[15];
  uint64_t v25 = a1 + v23;
  uint64_t v26 = a2 + v23;
  *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  *(void *)(v25 + 16) = *(void *)(v26 + 16);
  uint64_t v27 = a1 + v24;
  uint64_t v28 = a2 + v24;
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  *(unsigned char *)(v27 + 16) = *(unsigned char *)(v28 + 16);
  uint64_t v29 = a3[16];
  uint64_t v30 = a3[17];
  uint64_t v31 = a1 + v29;
  uint64_t v32 = (long long *)(a2 + v29);
  long long v33 = *v32;
  *(void *)(v31 + 16) = *((void *)v32 + 2);
  *(_OWORD *)uint64_t v31 = v33;
  uint64_t v34 = a1 + v30;
  uint64_t v35 = a2 + v30;
  *(void *)(v34 + 16) = *(void *)(v35 + 16);
  *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
  uint64_t v36 = a3[18];
  uint64_t v37 = a3[19];
  uint64_t v38 = a1 + v36;
  uint64_t v39 = a2 + v36;
  *(void *)(v38 + 16) = *(void *)(v39 + 16);
  *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
  uint64_t v40 = a1 + v37;
  uint64_t v41 = a2 + v37;
  *(void *)(v40 + 16) = *(void *)(v41 + 16);
  *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
  uint64_t v42 = a3[20];
  uint64_t v43 = a3[21];
  uint64_t v44 = a1 + v42;
  uint64_t v45 = a2 + v42;
  *(unsigned char *)(v44 + 16) = *(unsigned char *)(v45 + 16);
  *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
  uint64_t v46 = a1 + v43;
  uint64_t v47 = a2 + v43;
  *(unsigned char *)(v46 + 16) = *(unsigned char *)(v47 + 16);
  *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
  uint64_t v48 = a3[22];
  uint64_t v49 = a3[23];
  uint64_t v50 = a1 + v48;
  uint64_t v51 = a2 + v48;
  *(void *)(v50 + 16) = *(void *)(v51 + 16);
  *(_OWORD *)uint64_t v50 = *(_OWORD *)v51;
  uint64_t v52 = (_OWORD *)(a1 + v49);
  uint64_t v53 = (_OWORD *)(a2 + v49);
  long long v54 = v53[1];
  _OWORD *v52 = *v53;
  v52[1] = v54;
  uint64_t v55 = a3[24];
  uint64_t v56 = (_OWORD *)(a1 + v55);
  uint64_t v57 = (_OWORD *)(a2 + v55);
  long long v58 = v57[1];
  *uint64_t v56 = *v57;
  v56[1] = v58;
  return a1;
}

uint64_t sub_24437967C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 48))
  {
    uint64_t v8 = *(void *)(a2 + 48);
    if (v8)
    {
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(void *)(a1 + 48) = v8;
      swift_bridgeObjectRelease();
      uint64_t v9 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = v9;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_244379360(a1 + 32);
  }
  long long v10 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v10;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
LABEL_6:
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v11;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v12 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v12;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  uint64_t v13 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v17;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[11];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = a2 + v18;
  uint64_t v21 = *(void *)(a2 + v18 + 8);
  *uint64_t v19 = *(void *)(a2 + v18);
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E41AD8) + 36);
  uint64_t v23 = (char *)v19 + v22;
  uint64_t v24 = (char *)(v20 + v22);
  uint64_t v25 = sub_2443B5440();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v23, v24, v25);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v25);
    goto LABEL_11;
  }
  if (v29)
  {
LABEL_11:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3AC88);
    memcpy(v23, v24, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v23, v24, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
LABEL_12:
  uint64_t v31 = a3[12];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = a2 + v31;
  uint64_t v34 = *(void *)(a2 + v31 + 8);
  *uint64_t v32 = *(void *)(a2 + v31);
  v32[1] = v34;
  swift_bridgeObjectRelease();
  v32[2] = *(void *)(v33 + 16);
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[13];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = a2 + v35;
  uint64_t v38 = *(void *)(a2 + v35 + 8);
  *uint64_t v36 = *(void *)(a2 + v35);
  v36[1] = v38;
  swift_bridgeObjectRelease();
  v36[2] = *(void *)(v37 + 16);
  swift_bridgeObjectRelease();
  uint64_t v39 = a3[14];
  uint64_t v40 = (void *)(a1 + v39);
  uint64_t v41 = a2 + v39;
  uint64_t v42 = *(void *)(a2 + v39 + 8);
  *uint64_t v40 = *(void *)(a2 + v39);
  v40[1] = v42;
  swift_bridgeObjectRelease();
  v40[2] = *(void *)(v41 + 16);
  swift_bridgeObjectRelease();
  uint64_t v43 = a3[15];
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  uint64_t v46 = *(void *)(a2 + v43 + 8);
  *(void *)uint64_t v44 = *(void *)(a2 + v43);
  *(void *)(v44 + 8) = v46;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v44 + 16) = *(unsigned char *)(v45 + 16);
  uint64_t v47 = a3[16];
  uint64_t v48 = (void *)(a1 + v47);
  uint64_t v49 = a2 + v47;
  uint64_t v50 = *(void *)(a2 + v47 + 8);
  *uint64_t v48 = *(void *)(a2 + v47);
  v48[1] = v50;
  swift_bridgeObjectRelease();
  v48[2] = *(void *)(v49 + 16);
  swift_bridgeObjectRelease();
  uint64_t v51 = a3[17];
  uint64_t v52 = (void *)(a1 + v51);
  uint64_t v53 = a2 + v51;
  uint64_t v54 = *(void *)(a2 + v51 + 8);
  void *v52 = *(void *)(a2 + v51);
  v52[1] = v54;
  swift_bridgeObjectRelease();
  v52[2] = *(void *)(v53 + 16);
  swift_bridgeObjectRelease();
  uint64_t v55 = a3[18];
  uint64_t v56 = (void *)(a1 + v55);
  uint64_t v57 = a2 + v55;
  uint64_t v58 = *(void *)(a2 + v55 + 8);
  *uint64_t v56 = *(void *)(a2 + v55);
  v56[1] = v58;
  swift_bridgeObjectRelease();
  v56[2] = *(void *)(v57 + 16);
  swift_bridgeObjectRelease();
  uint64_t v59 = a3[19];
  uint64_t v60 = (void *)(a1 + v59);
  uint64_t v61 = a2 + v59;
  uint64_t v62 = *(void *)(a2 + v59 + 8);
  *uint64_t v60 = *(void *)(a2 + v59);
  v60[1] = v62;
  swift_bridgeObjectRelease();
  v60[2] = *(void *)(v61 + 16);
  uint64_t v63 = a3[20];
  uint64_t v64 = a1 + v63;
  uint64_t v65 = a2 + v63;
  uint64_t v66 = *(void *)(a2 + v63 + 8);
  *(void *)uint64_t v64 = *(void *)(a2 + v63);
  *(void *)(v64 + 8) = v66;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v64 + 16) = *(unsigned char *)(v65 + 16);
  uint64_t v67 = a3[21];
  uint64_t v68 = a1 + v67;
  uint64_t v69 = a2 + v67;
  uint64_t v70 = *(void *)(a2 + v67 + 8);
  *(void *)uint64_t v68 = *(void *)(a2 + v67);
  *(void *)(v68 + 8) = v70;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v68 + 16) = *(unsigned char *)(v69 + 16);
  uint64_t v71 = a3[22];
  uint64_t v72 = (void *)(a1 + v71);
  uint64_t v73 = a2 + v71;
  uint64_t v74 = *(void *)(a2 + v71 + 8);
  *uint64_t v72 = *(void *)(a2 + v71);
  v72[1] = v74;
  swift_bridgeObjectRelease();
  v72[2] = *(void *)(v73 + 16);
  swift_bridgeObjectRelease();
  uint64_t v75 = a3[23];
  uint64_t v76 = (void *)(a1 + v75);
  uint64_t v77 = a2 + v75;
  uint64_t v78 = *(void *)(a2 + v75 + 8);
  *uint64_t v76 = *(void *)(a2 + v75);
  v76[1] = v78;
  swift_bridgeObjectRelease();
  uint64_t v79 = *(void *)(v77 + 24);
  v76[2] = *(void *)(v77 + 16);
  v76[3] = v79;
  swift_bridgeObjectRelease();
  uint64_t v80 = a3[24];
  uint64_t v81 = (void *)(a1 + v80);
  uint64_t v82 = (void *)(a2 + v80);
  uint64_t v83 = v82[1];
  *uint64_t v81 = *v82;
  v81[1] = v83;
  swift_bridgeObjectRelease();
  uint64_t v84 = v82[3];
  v81[2] = v82[2];
  v81[3] = v84;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_244379B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_244379B58);
}

uint64_t sub_244379B58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E41AD8);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 44);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_244379C0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_244379C20);
}

uint64_t sub_244379C20(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E41AD8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 44);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for TapToRadarDraft()
{
  uint64_t result = qword_268E46E68;
  if (!qword_268E46E68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_244379D18()
{
  sub_244379DF4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_244379DF4()
{
  if (!qword_268E46E78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E3AC88);
    sub_244379E5C();
    unint64_t v0 = type metadata accessor for URLParameter();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268E46E78);
    }
  }
}

unint64_t sub_244379E5C()
{
  unint64_t result = qword_268E46E80[0];
  if (!qword_268E46E80[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E3AC88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268E46E80);
  }
  return result;
}

uint64_t type metadata accessor for URLParameter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_244379EE0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_244379F7C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    uint64_t v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_24437A084(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

void *sub_24437A0F8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  swift_bridgeObjectRetain();
  v6(v8, v9, v5);
  return a1;
}

void *sub_24437A188(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_OWORD *sub_24437A220(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_24437A290(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_24437A318(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 16) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 16) & ~v6);
      }
      unint64_t v15 = *((void *)a1 + 1);
      if (v15 >= 0xFFFFFFFF) {
        LODWORD(v15) = -1;
      }
      return (v15 + 1);
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_24437A4B8(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 16) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x24437A718);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v7 & 0x80000000) != 0)
        {
          unint64_t v18 = (unint64_t)&a1[v9 + 16] & ~v9;
          uint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
          v19(v18);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(void *)a1 = a2 ^ 0x80000000;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((void *)a1 + 1) = a2 - 1;
        }
      }
      return;
  }
}

uint64_t destroy for TapToRadarDraft.Component()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TapToRadarDraft.Component(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TapToRadarDraft.Component(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for TapToRadarDraft.Component(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TapToRadarDraft.Component(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TapToRadarDraft.Component(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TapToRadarDraft.Component()
{
  return &type metadata for TapToRadarDraft.Component;
}

unint64_t sub_24437A930()
{
  unint64_t result = qword_268E46F08;
  if (!qword_268E46F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268E46F08);
  }
  return result;
}

uint64_t sub_24437A984(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  BOOL v4 = a1[1] == a2[1] && a1[2] == a2[2];
  if (v4 || (char v5 = sub_2443BB7D0(), result = 0, (v5 & 1) != 0))
  {
    if (a1[3] == a2[3] && a1[4] == a2[4])
    {
      return 1;
    }
    else
    {
      return sub_2443BB7D0();
    }
  }
  return result;
}

uint64_t sub_24437AA24@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a2 + a1 - 8) + 8))(*(void *)(a2 + a1 - 16));
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_24437AA6C()
{
  return 16;
}

__n128 sub_24437AA78(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24437AA84()
{
  return swift_getAtKeyPath();
}

unint64_t sub_24437AAB0()
{
  unint64_t result = qword_268E38598;
  if (!qword_268E38598)
  {
    type metadata accessor for OpenExternalURLOptionsKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E38598);
  }
  return result;
}

unint64_t sub_24437AB08()
{
  unint64_t result = qword_268E46F18;
  if (!qword_268E46F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46F18);
  }
  return result;
}

void *sub_24437AB5C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = 0;
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  do
  {
    swift_getAtKeyPath();
    if (v9)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_243F3A284(0, v3[2] + 1, 1, v3);
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1) {
        uint64_t v3 = sub_243F3A284((void *)(v5 > 1), v6 + 1, 1, v3);
      }
      v3[2] = v6 + 1;
      BOOL v4 = &v3[2 * v6];
      v4[4] = v8;
      v4[5] = v9;
    }
    ++v2;
  }
  while (v1 != v2);
  swift_bridgeObjectRelease();
  return v3;
}

void *sub_24437AC80(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v2 = swift_bridgeObjectRetain() + 40;
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  do
  {
    swift_bridgeObjectRetain();
    swift_getAtKeyPath();
    swift_bridgeObjectRelease();
    if (v9)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_243F3A284(0, v3[2] + 1, 1, v3);
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1) {
        uint64_t v3 = sub_243F3A284((void *)(v5 > 1), v6 + 1, 1, v3);
      }
      v3[2] = v6 + 1;
      BOOL v4 = &v3[2 * v6];
      v4[4] = v8;
      v4[5] = v9;
    }
    v2 += 16;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

void *sub_24437ADB0(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = a2;
  uint64_t v4 = sub_2443B5350();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v31 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E44850);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    v24[1] = a1;
    v24[2] = v2;
    unsigned int v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v11 = v5 + 16;
    uint64_t v30 = v12;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v27 = *(void *)(v11 + 56);
    int v28 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 32);
    uint64_t v25 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v26 = (void (**)(char *, char *, uint64_t))(v11 + 16);
    swift_bridgeObjectRetain();
    uint64_t v35 = (void *)MEMORY[0x263F8EE78];
    int v29 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 40);
    v24[0] = (v11 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v24[3] = v11;
    while (1)
    {
      v30(v9, v13, v4);
      unsigned int v16 = *v29;
      (*v29)(v9, 0, 1, v4);
      if ((*v28)(v9, 1, v4) == 1) {
        break;
      }
      int v17 = v31;
      (*v26)(v31, v9, v4);
      swift_getAtKeyPath();
      uint64_t v18 = v33;
      uint64_t v19 = v34;
      (*v25)(v17, v4);
      if (v19)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v35 = sub_243F3A284(0, v35[2] + 1, 1, v35);
        }
        unint64_t v21 = v35[2];
        unint64_t v20 = v35[3];
        if (v21 >= v20 >> 1) {
          uint64_t v35 = sub_243F3A284((void *)(v20 > 1), v21 + 1, 1, v35);
        }
        unsigned int v14 = v35;
        v35[2] = v21 + 1;
        int v15 = &v14[2 * v21];
        v15[4] = v18;
        v15[5] = v19;
      }
      v13 += v27;
      if (!--v10)
      {
        v16(v9, 1, 1, v4);
        break;
      }
    }
  }
  else
  {
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    swift_bridgeObjectRetain();
    uint64_t v35 = (void *)MEMORY[0x263F8EE78];
    v22(v9, 1, 1, v4);
  }
  swift_bridgeObjectRelease();
  return v35;
}

void *sub_24437B0C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = 0;
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  do
  {
    swift_getAtKeyPath();
    if (v9)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_243F3A284(0, v3[2] + 1, 1, v3);
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1) {
        uint64_t v3 = sub_243F3A284((void *)(v5 > 1), v6 + 1, 1, v3);
      }
      v3[2] = v6 + 1;
      uint64_t v4 = &v3[2 * v6];
      v4[4] = v8;
      v4[5] = v9;
    }
    ++v2;
  }
  while (v1 != v2);
  swift_bridgeObjectRelease();
  return v3;
}

unsigned char *storeEnumTagSinglePayload for TapToRadarDraft.TapToRadarError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24437B2B4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TapToRadarDraft.TapToRadarError()
{
  return &type metadata for TapToRadarDraft.TapToRadarError;
}

ValueMetadata *type metadata accessor for TapToRadarDraft.AutoDiagnostics()
{
  return &type metadata for TapToRadarDraft.AutoDiagnostics;
}

ValueMetadata *type metadata accessor for TapToRadarDraft.RemoteDeviceSelections()
{
  return &type metadata for TapToRadarDraft.RemoteDeviceSelections;
}

unsigned char *_s15ImagePlayground15TapToRadarDraftV11DeviceClassOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24437B3E0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TapToRadarDraft.DeviceClass()
{
  return &type metadata for TapToRadarDraft.DeviceClass;
}

unsigned char *storeEnumTagSinglePayload for TapToRadarDraft.Reproducibility(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24437B4E4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TapToRadarDraft.Reproducibility()
{
  return &type metadata for TapToRadarDraft.Reproducibility;
}

unsigned char *storeEnumTagSinglePayload for TapToRadarDraft.Classification(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24437B5E8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TapToRadarDraft.Classification()
{
  return &type metadata for TapToRadarDraft.Classification;
}

unint64_t sub_24437B624()
{
  unint64_t result = qword_268E46F28;
  if (!qword_268E46F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46F28);
  }
  return result;
}

unint64_t sub_24437B67C()
{
  unint64_t result = qword_268E46F30;
  if (!qword_268E46F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46F30);
  }
  return result;
}

unint64_t sub_24437B6D4()
{
  unint64_t result = qword_268E46F38;
  if (!qword_268E46F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46F38);
  }
  return result;
}

unint64_t sub_24437B72C()
{
  unint64_t result = qword_268E46F40;
  if (!qword_268E46F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46F40);
  }
  return result;
}

unint64_t sub_24437B784()
{
  unint64_t result = qword_268E46F48;
  if (!qword_268E46F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46F48);
  }
  return result;
}

unint64_t sub_24437B7DC()
{
  unint64_t result = qword_268E46F50;
  if (!qword_268E46F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46F50);
  }
  return result;
}

unint64_t sub_24437B834()
{
  unint64_t result = qword_268E46F58;
  if (!qword_268E46F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46F58);
  }
  return result;
}

unint64_t sub_24437B88C()
{
  unint64_t result = qword_268E46F60;
  if (!qword_268E46F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46F60);
  }
  return result;
}

unint64_t sub_24437B8E8()
{
  unint64_t result = qword_268E46F68;
  if (!qword_268E46F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46F68);
  }
  return result;
}

uint64_t sub_24437B93C()
{
  unint64_t v0 = sub_2443BB5F0();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA) {
    return 10;
  }
  else {
    return v0;
  }
}

uint64_t sub_24437B988()
{
  unint64_t v0 = sub_2443BB5F0();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t sub_24437B9D4()
{
  unint64_t v0 = sub_2443BB5F0();
  swift_bridgeObjectRelease();
  if (v0 >= 7) {
    return 7;
  }
  else {
    return v0;
  }
}

uint64_t sub_24437BA1C(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  switch(a9 >> 61)
  {
    case 0uLL:
    case 5uLL:
      goto LABEL_4;
    case 1uLL:
      swift_bridgeObjectRetain();
      goto LABEL_4;
    case 2uLL:
      sub_243EE0D98(result, a2);
      sub_243EE0D98(a3, a4);
      sub_243EE0D98(a5, a6);
LABEL_4:
      unint64_t result = swift_bridgeObjectRetain();
      break;
    case 3uLL:
      swift_bridgeObjectRetain();
      unint64_t result = sub_243EE0DAC(a3, a4);
      break;
    case 4uLL:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t result = sub_243EE0D98(a5, a6);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for GenerationRecipe_V4.Ingredient(uint64_t a1)
{
  return sub_24437BBBC(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

uint64_t sub_24437BBBC(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  switch(a9 >> 61)
  {
    case 0uLL:
    case 5uLL:
      goto LABEL_4;
    case 1uLL:
      swift_bridgeObjectRelease();
      goto LABEL_4;
    case 2uLL:
      sub_243ECBC24(result, a2);
      sub_243ECBC24(a3, a4);
      sub_243ECBC24(a5, a6);
LABEL_4:
      unint64_t result = swift_bridgeObjectRelease();
      break;
    case 3uLL:
      swift_bridgeObjectRelease();
      unint64_t result = sub_243ECBC38(a3, a4);
      break;
    case 4uLL:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t result = sub_243ECBC24(a5, a6);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t *initializeWithCopy for GenerationRecipe_V4.Ingredient(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  unint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  unint64_t v11 = a2[8];
  uint64_t v13 = a2[9];
  uint64_t v14 = a2[10];
  sub_24437BA1C(*a2, v4, v5, v6, v7, v8, v9, v10, v11);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v13;
  a1[10] = v14;
  return a1;
}

uint64_t assignWithCopy for GenerationRecipe_V4.Ingredient(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  unint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  unint64_t v11 = a2[8];
  uint64_t v22 = a2[9];
  uint64_t v23 = a2[10];
  sub_24437BA1C(*a2, v4, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v12 = *(void *)a1;
  unint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  unint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  unint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v22;
  *(void *)(a1 + 80) = v23;
  sub_24437BBBC(v12, v13, v14, v15, v16, v17, v18, v19, v20);
  return a1;
}

uint64_t assignWithTake for GenerationRecipe_V4.Ingredient(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 80);
  uint64_t v4 = *(void *)a1;
  unint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  unint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  unint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  long long v14 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v14;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = v3;
  sub_24437BBBC(v4, v6, v5, v7, v8, v9, v10, v11, v12);
  return a1;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Ingredient()
{
  return &type metadata for GenerationRecipe_V4.Ingredient;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Prompt()
{
  return &type metadata for GenerationRecipe_V4.Prompt;
}

uint64_t *sub_24437BF34(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    unint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2443B54B0();
    uint64_t v12 = *(void *)(v11 - 8);
    long long v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 2, v11))
    {
      uint64_t v14 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 2, v11);
    }
    *(_OWORD *)((char *)v4 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(uint64_t a1)
{
  return sub_243ECF8B4(a1, (uint64_t *)&unk_268E46F80);
}

void *sub_24437C0E0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  unint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2443B54B0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 2, v10))
  {
    uint64_t v13 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 2, v10);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_24437C21C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2443B54B0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 2, v9);
  int v13 = v11(v8, 2, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 2, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)((char *)a1 + v15);
  unint64_t v17 = (void *)((char *)a2 + v15);
  void *v16 = *v17;
  v16[1] = v17[1];
  return a1;
}

_OWORD *sub_24437C3D4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2443B54B0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 2, v9))
  {
    uint64_t v11 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 2, v9);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_24437C500(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2443B54B0();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 2, v10);
  int v14 = v12(v9, 2, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 2, v10);
LABEL_7:
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_24437C698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24437C6AC);
}

uint64_t sub_24437C6AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24437C75C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24437C770);
}

uint64_t sub_24437C770(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for GenerationRecipe_V4.Prompt.Entity(uint64_t a1)
{
  return sub_243ECF8B4(a1, (uint64_t *)&unk_268E46F70);
}

uint64_t sub_24437C838()
{
  uint64_t result = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24437C8D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24437C8EC);
}

uint64_t sub_24437C8EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2443B54B0();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_24437C958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24437C96C);
}

uint64_t sub_24437C96C(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_2443B54B0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4()
{
  return &type metadata for GenerationRecipe_V4;
}

uint64_t sub_24437CA00(void *a1)
{
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47148);
  uint64_t v27 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  int v28 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2443B54B0();
  uint64_t v31 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v30 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47150);
  uint64_t v25 = *(void *)(v5 - 8);
  uint64_t v26 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47158);
  uint64_t v23 = *(void *)(v8 - 8);
  uint64_t v24 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
  MEMORY[0x270FA5388](v11 - 8);
  int v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47160);
  uint64_t v33 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2443848D4();
  uint64_t v17 = v31;
  sub_2443BBA30();
  sub_24438480C(v32, (uint64_t)v13, type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind);
  int v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v13, 2, v3);
  if (v18)
  {
    if (v18 == 1)
    {
      char v34 = 0;
      sub_2443849D0();
      sub_2443BB6D0();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v24);
    }
    else
    {
      char v35 = 1;
      sub_24438497C();
      sub_2443BB6D0();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v26);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v14);
  }
  else
  {
    uint64_t v19 = v27;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v30, v13, v3);
    char v36 = 2;
    sub_244384928();
    long long v20 = v28;
    sub_2443BB6D0();
    sub_2443846AC(&qword_268E39B50, MEMORY[0x263F07508]);
    uint64_t v21 = v29;
    sub_2443BB740();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v21);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v30, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v14);
  }
}

uint64_t sub_24437CF30@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47108);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v46 = v3;
  uint64_t v47 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v50 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47110);
  uint64_t v42 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v49 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47118);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v43 = v7;
  uint64_t v44 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47120);
  uint64_t v48 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  int v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v40 - v18;
  uint64_t v20 = a1[3];
  uint64_t v52 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_2443848D4();
  uint64_t v21 = (uint64_t)v53;
  sub_2443BBA10();
  if (!v21)
  {
    uint64_t v41 = v16;
    uint64_t v22 = v49;
    uint64_t v23 = v50;
    uint64_t v53 = v19;
    uint64_t v24 = v51;
    uint64_t v25 = sub_2443BB6C0();
    if (*(void *)(v25 + 16) == 1)
    {
      if (*(unsigned char *)(v25 + 32))
      {
        if (*(unsigned char *)(v25 + 32) != 1)
        {
          char v56 = 2;
          sub_244384928();
          uint64_t v30 = v23;
          sub_2443BB600();
          uint64_t v35 = sub_2443B54B0();
          sub_2443846AC(&qword_268E39B18, MEMORY[0x263F07508]);
          uint64_t v36 = (uint64_t)v41;
          uint64_t v37 = v46;
          uint64_t v49 = (char *)v35;
          sub_2443BB6B0();
          (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v37);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v11);
          uint64_t v38 = (uint64_t)v52;
          (*(void (**)(uint64_t, void, uint64_t))(*((void *)v49 - 1) + 56))(v36, 0, 2);
          uint64_t v33 = (uint64_t)v53;
          sub_244384748(v36, (uint64_t)v53);
          uint64_t v39 = v51;
LABEL_12:
          sub_244384748(v33, v39);
          return __swift_destroy_boxed_opaque_existential_1(v38);
        }
        char v55 = 1;
        sub_24438497C();
        sub_2443BB600();
        (*(void (**)(char *, uint64_t))(v42 + 8))(v22, v45);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v11);
        uint64_t v32 = sub_2443B54B0();
        uint64_t v33 = (uint64_t)v53;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v53, 2, 2, v32);
      }
      else
      {
        char v54 = 0;
        sub_2443849D0();
        sub_2443BB600();
        (*(void (**)(char *, uint64_t))(v44 + 8))(v10, v43);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v11);
        uint64_t v34 = sub_2443B54B0();
        uint64_t v33 = (uint64_t)v53;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v53, 1, 2, v34);
      }
      uint64_t v38 = (uint64_t)v52;
      uint64_t v39 = v24;
      goto LABEL_12;
    }
    uint64_t v26 = sub_2443BB360();
    swift_allocError();
    uint64_t v27 = v13;
    uint64_t v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E39B08);
    *uint64_t v29 = v14;
    sub_2443BB620();
    sub_2443BB350();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v29, *MEMORY[0x263F8DCB0], v26);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v27, v11);
  }
  uint64_t v38 = (uint64_t)v52;
  return __swift_destroy_boxed_opaque_existential_1(v38);
}

uint64_t sub_24437D648(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E470F8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2443846F4();
  sub_2443BBA30();
  LOBYTE(v12) = 0;
  sub_2443BB710();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity(0);
    LOBYTE(v12) = 1;
    type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
    sub_2443846AC(&qword_268E47100, (void (*)(uint64_t))type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind);
    sub_2443BB740();
    long long v12 = *(_OWORD *)(v3 + *(int *)(v9 + 24));
    v11[15] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E39AB0);
    sub_243EF6C34(&qword_268E39AD0);
    sub_2443BB740();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24437D878@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v4 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E470E0);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity(0);
  MEMORY[0x270FA5388](v10);
  long long v12 = (uint64_t *)((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = a1[3];
  uint64_t v25 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_2443846F4();
  sub_2443BBA10();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  }
  uint64_t v14 = (uint64_t)v6;
  uint64_t v15 = v23;
  uint64_t v16 = v24;
  LOBYTE(v26) = 0;
  *long long v12 = sub_2443BB660();
  v12[1] = v17;
  uint64_t v21 = v12;
  LOBYTE(v26) = 1;
  sub_2443846AC(&qword_268E470F0, (void (*)(uint64_t))type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind);
  sub_2443BB6B0();
  uint64_t v18 = (uint64_t)v21;
  sub_244384748(v14, (uint64_t)v21 + *(int *)(v10 + 20));
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E39AB0);
  char v27 = 2;
  sub_243EF6C34(&qword_268E39AB8);
  sub_2443BB6B0();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v16);
  *(_OWORD *)(v18 + *(int *)(v10 + 24)) = v26;
  sub_24438480C(v18, v22, type metadata accessor for GenerationRecipe_V4.Prompt.Entity);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  return sub_2443847AC(v18, type metadata accessor for GenerationRecipe_V4.Prompt.Entity);
}

uint64_t sub_24437DC3C(uint64_t a1)
{
  unint64_t v2 = sub_2443848D4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437DC78(uint64_t a1)
{
  unint64_t v2 = sub_2443848D4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437DCB4(uint64_t a1)
{
  unint64_t v2 = sub_2443849D0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437DCF0(uint64_t a1)
{
  unint64_t v2 = sub_2443849D0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437DD2C(uint64_t a1)
{
  unint64_t v2 = sub_244384928();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437DD68(uint64_t a1)
{
  unint64_t v2 = sub_244384928();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437DDA4(uint64_t a1)
{
  unint64_t v2 = sub_24438497C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437DDE0(uint64_t a1)
{
  unint64_t v2 = sub_24438497C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437DE1C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24437CF30(a1, a2);
}

uint64_t sub_24437DE34(void *a1)
{
  return sub_24437CA00(a1);
}

uint64_t sub_24437DE50(uint64_t a1)
{
  unint64_t v2 = sub_2443846F4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437DE8C(uint64_t a1)
{
  unint64_t v2 = sub_2443846F4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437DEC8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24437D878(a1, a2);
}

uint64_t sub_24437DEE0(void *a1)
{
  return sub_24437D648(a1);
}

uint64_t sub_24437DEFC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v11[0] = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E470C8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2443845C4();
  sub_2443BBA30();
  char v13 = 0;
  sub_2443BB710();
  if (!v4)
  {
    v11[1] = v11[0];
    char v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E470B0);
    sub_244384618(&qword_268E470D0, &qword_268E470D8);
    sub_2443BB740();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_24437E0CC(uint64_t a1)
{
  unint64_t v2 = sub_2443845C4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437E108(uint64_t a1)
{
  unint64_t v2 = sub_2443845C4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437E144@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_2443818B4(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_24437E174(void *a1)
{
  return sub_24437DEFC(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_24437E194(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_2443BB7D0() & 1) == 0) {
    return 0;
  }

  return sub_243FC8B78(v2, v3);
}

uint64_t sub_24437E208(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47428);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47430);
  uint64_t v6 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47438);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244386570();
  sub_2443BBA30();
  char v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_2443865C4();
    sub_2443BB6D0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_244386618();
    sub_2443BB6D0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

uint64_t sub_24437E4B8(uint64_t a1)
{
  unint64_t v2 = sub_244386618();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437E4F4(uint64_t a1)
{
  unint64_t v2 = sub_244386618();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437E530(uint64_t a1)
{
  unint64_t v2 = sub_244386570();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437E56C(uint64_t a1)
{
  unint64_t v2 = sub_244386570();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437E5A8(uint64_t a1)
{
  unint64_t v2 = sub_2443865C4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437E5E4(uint64_t a1)
{
  unint64_t v2 = sub_2443865C4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437E620@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_244381B10(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_24437E650(void *a1)
{
  return sub_24437E208(a1, *v1);
}

unint64_t sub_24437E66C(char a1)
{
  unint64_t result = 0x6E6153746F4E6F64;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000018;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0xD000000000000019;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24437E71C(char a1)
{
  unint64_t result = 0x6E6153746F4E6F64;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000018;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0xD000000000000019;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24437E7CC(void *a1, uint64_t a2)
{
  uint64_t v31 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47400);
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  MEMORY[0x270FA5388](v3);
  int v28 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47408);
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v25 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47410);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47418);
  uint64_t v22 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  char v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47420);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2443863CC();
  sub_2443BBA30();
  switch((char)v31)
  {
    case 1:
      char v33 = 1;
      sub_2443864C8();
      sub_2443BB6D0();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
      break;
    case 2:
      char v34 = 2;
      sub_244386474();
      uint64_t v17 = v25;
      sub_2443BB6D0();
      uint64_t v19 = v26;
      uint64_t v18 = v27;
      goto LABEL_5;
    case 3:
      char v35 = 3;
      sub_244386420();
      uint64_t v17 = v28;
      sub_2443BB6D0();
      uint64_t v19 = v29;
      uint64_t v18 = v30;
LABEL_5:
      (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
      break;
    default:
      char v32 = 0;
      sub_24438651C();
      sub_2443BB6D0();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v10);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

unint64_t sub_24437EC14()
{
  return sub_24437E71C(*v0);
}

uint64_t sub_24437EC1C(uint64_t a1)
{
  unint64_t v2 = sub_2443863CC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437EC58(uint64_t a1)
{
  unint64_t v2 = sub_2443863CC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437EC94(uint64_t a1)
{
  unint64_t v2 = sub_24438651C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437ECD0(uint64_t a1)
{
  unint64_t v2 = sub_24438651C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437ED0C(uint64_t a1)
{
  unint64_t v2 = sub_244386474();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437ED48(uint64_t a1)
{
  unint64_t v2 = sub_244386474();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437ED84(uint64_t a1)
{
  unint64_t v2 = sub_244386420();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437EDC0(uint64_t a1)
{
  unint64_t v2 = sub_244386420();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437EDFC(uint64_t a1)
{
  unint64_t v2 = sub_2443864C8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437EE38(uint64_t a1)
{
  unint64_t v2 = sub_2443864C8();

  return MEMORY[0x270FA00B8](a1, v2);
}

char *sub_24437EE74@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_244381F60(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24437EEA0(void *a1)
{
  return sub_24437E7CC(a1, *v1);
}

unint64_t sub_24437EEBC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_24437E66C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_24437EEE8(char a1)
{
  unint64_t result = 0x67616D4965736162;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6D49686374656B73;
      break;
    case 2:
      unint64_t result = 0x614D686374656B73;
      break;
    case 4:
      unint64_t result = 0xD000000000000017;
      break;
    case 5:
      unint64_t result = 0xD000000000000018;
      break;
    case 6:
      unint64_t result = 0xD000000000000014;
      break;
    case 7:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 8:
      unint64_t result = 25705;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24437F028(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47310);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244385C24();
  sub_2443BBA30();
  sub_243EF95CC(v3, (uint64_t)v15);
  sub_243EF95CC((uint64_t)v15, (uint64_t)v12);
  char v11 = 0;
  sub_243EF9578();
  sub_2443BB700();
  if (!v2)
  {
    sub_243EF95CC(v3 + 16, (uint64_t)v14);
    sub_243EF95CC((uint64_t)v14, (uint64_t)v12);
    char v11 = 1;
    sub_2443BB700();
    sub_243EF95CC(v3 + 32, (uint64_t)v13);
    sub_243EF95CC((uint64_t)v13, (uint64_t)v12);
    char v11 = 2;
    sub_2443BB700();
    v12[0] = 3;
    sub_2443BB730();
    v12[0] = 4;
    sub_2443BB730();
    v12[0] = 5;
    sub_2443BB720();
    v12[0] = *(unsigned char *)(v3 + 65);
    char v11 = 6;
    sub_244385D20();
    sub_2443BB740();
    v12[0] = *(unsigned char *)(v3 + 66);
    char v11 = 7;
    sub_244385D74();
    sub_2443BB740();
    v12[0] = 8;
    sub_2443BB710();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_24437F344()
{
  return sub_24437EEE8(*v0);
}

uint64_t sub_24437F34C(uint64_t a1)
{
  unint64_t v2 = sub_244385C24();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437F388(uint64_t a1)
{
  unint64_t v2 = sub_244385C24();

  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_24437F3C4@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_244382598(a1, (uint64_t *)v7);
  if (!v2)
  {
    long long v5 = v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v7[4];
    *(void *)(a2 + 80) = v8;
    double result = *(double *)v7;
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_24437F420(void *a1)
{
  return sub_24437F028(a1);
}

uint64_t sub_24437F46C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = a4;
  uint64_t v13 = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47308);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244385BD0();
  sub_2443BBA30();
  LOBYTE(v14) = 0;
  sub_2443BB710();
  if (!v5)
  {
    uint64_t v14 = v12;
    uint64_t v15 = v13;
    char v16 = 1;
    sub_243EF9578();
    sub_2443BB740();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_24437F5FC(uint64_t a1)
{
  unint64_t v2 = sub_244385BD0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437F638(uint64_t a1)
{
  unint64_t v2 = sub_244385BD0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24437F674@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_244382C60(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_24437F6A4(void *a1)
{
  return sub_24437F46C(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_24437F6C4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47300);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244385B7C();
  sub_2443BBA30();
  v11[0] = 0;
  sub_2443BB710();
  if (!v2)
  {
    v11[0] = 1;
    sub_2443BB6E0();
    sub_243EF95CC(v3 + 32, (uint64_t)v12);
    sub_243EF95CC((uint64_t)v12, (uint64_t)v11);
    v10[15] = 2;
    sub_243EF9578();
    sub_2443BB700();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24437F874(uint64_t a1)
{
  unint64_t v2 = sub_244385B7C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24437F8B0(uint64_t a1)
{
  unint64_t v2 = sub_244385B7C();

  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_24437F8EC@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_244382E94(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_24437F930(void *a1)
{
  return sub_24437F6C4(a1);
}

uint64_t sub_24437F96C()
{
  sub_243EF6F74(v0, (uint64_t)v4);
  sub_243EF6F74(v0, (uint64_t)&v5);
  switch(v6 >> 61)
  {
    case 1uLL:
    case 3uLL:
      uint64_t v1 = v5;
      goto LABEL_5;
    case 2uLL:
      uint64_t v1 = v7;
      goto LABEL_5;
    case 4uLL:
      v6 &= 0x1FFFFFFFFFFFFFFFuLL;
      uint64_t v3 = v5;
      swift_bridgeObjectRetain();
      sub_2443BA5F0();
      uint64_t v1 = v3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return v1;
    default:
      uint64_t v1 = v5;
LABEL_5:
      swift_bridgeObjectRetain();
      return v1;
  }
}

void *sub_24437FA6C(void *a1)
{
  uint64_t v2 = v1;
  sub_243EF6F74(v2, (uint64_t)v67);
  uint64_t v47 = v67[0];
  unint64_t v56 = v67[1];
  unint64_t v57 = v67[3];
  uint64_t v55 = v67[4];
  uint64_t v53 = v67[2];
  unint64_t v54 = v67[5];
  uint64_t v49 = v67[10];
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47048);
  uint64_t v48 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v45 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47050);
  uint64_t v51 = *(void *)(v5 - 8);
  uint64_t v52 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v46 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47058);
  uint64_t v43 = *(void *)(v7 - 8);
  uint64_t v44 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v40 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47060);
  uint64_t v41 = *(void *)(v9 - 8);
  uint64_t v42 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v39 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47068);
  uint64_t v38 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47070);
  uint64_t v37 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  char v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47078);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v59 = v17;
  uint64_t v60 = v18;
  MEMORY[0x270FA5388](v17);
  char v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24438407C();
  uint64_t v58 = v20;
  uint64_t v21 = v87;
  sub_2443BBA30();
  sub_243EF6F74((uint64_t)v21, (uint64_t)&v68);
  switch((unint64_t)v72 >> 61)
  {
    case 1uLL:
      *(void *)&long long v72 = v72 & 0x1FFFFFFFFFFFFFFFLL;
      long long v74 = v68;
      uint64_t v75 = v69;
      LOBYTE(v61) = 1;
      sub_24438431C();
      uint64_t v26 = v58;
      uint64_t v25 = v59;
      sub_2443BB6D0();
      long long v61 = v74;
      *(void *)&long long v62 = v75;
      sub_244384514();
      sub_2443BB740();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v11);
      return (void *)(*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v26, v25);
    case 2uLL:
      *(void *)&long long v72 = v72 & 0x1FFFFFFFFFFFFFFFLL;
      long long v78 = v70;
      long long v79 = v71;
      uint64_t v81 = v73;
      long long v76 = v68;
      long long v77 = v69;
      long long v80 = v72;
      LOBYTE(v61) = 2;
      sub_243EE0D98(v47, v56);
      sub_243EE0D98(v53, v57);
      sub_243EE0D98(v55, v54);
      sub_244384274();
      swift_bridgeObjectRetain();
      uint64_t v27 = v39;
      uint64_t v29 = v58;
      uint64_t v28 = v59;
      sub_2443BB6D0();
      long long v63 = v78;
      long long v64 = v79;
      long long v65 = v80;
      uint64_t v66 = v81;
      long long v61 = v76;
      long long v62 = v77;
      sub_2443844C0();
      uint64_t v30 = v42;
      sub_2443BB740();
      uint64_t v31 = v41;
      goto LABEL_7;
    case 3uLL:
      *(void *)&long long v72 = v72 & 0x1FFFFFFFFFFFFFFFLL;
      long long v82 = v68;
      long long v83 = v69;
      LOBYTE(v61) = 3;
      swift_bridgeObjectRetain();
      sub_243EE0DAC(v53, v57);
      sub_2443841CC();
      uint64_t v27 = v40;
      uint64_t v29 = v58;
      uint64_t v28 = v59;
      sub_2443BB6D0();
      long long v61 = v82;
      long long v62 = v83;
      sub_24438446C();
      uint64_t v30 = v44;
      sub_2443BB740();
      uint64_t v31 = v43;
      goto LABEL_7;
    case 4uLL:
      *(void *)&long long v72 = v72 & 0x1FFFFFFFFFFFFFFFLL;
      long long v84 = v68;
      long long v85 = v69;
      long long v86 = v70;
      LOBYTE(v61) = 4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_243EE0D98(v55, v54);
      sub_244384124();
      uint64_t v27 = v46;
      uint64_t v29 = v58;
      uint64_t v28 = v59;
      sub_2443BB6D0();
      long long v61 = v84;
      long long v62 = v85;
      long long v63 = v86;
      sub_244384418();
      uint64_t v30 = v52;
      sub_2443BB740();
      uint64_t v31 = v51;
LABEL_7:
      (*(void (**)(char *, uint64_t))(v31 + 8))(v27, v30);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v29, v28);
      double result = sub_244384568(v21, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_24437BBBC);
      break;
    case 5uLL:
      *(void *)&long long v72 = v72 & 0x1FFFFFFFFFFFFFFFLL;
      LOBYTE(v61) = 5;
      sub_2443840D0();
      char v32 = v45;
      char v34 = v58;
      uint64_t v33 = v59;
      sub_2443BB6D0();
      uint64_t v35 = v50;
      sub_2443BB710();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v32, v35);
      double result = (void *)(*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v34, v33);
      break;
    default:
      *(void *)&long long v72 = v72 & 0x1FFFFFFFFFFFFFFFLL;
      LOBYTE(v61) = 0;
      sub_2443843C4();
      uint64_t v23 = v58;
      uint64_t v22 = v59;
      sub_2443BB6D0();
      sub_2443BB710();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v16, v14);
      double result = (void *)(*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v23, v22);
      break;
  }
  return result;
}

uint64_t sub_244380368()
{
  uint64_t result = 0x5064657461727563;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x74706D6F7270;
      break;
    case 2:
      uint64_t result = 0x676E6977617264;
      break;
    case 3:
      uint64_t result = 0x646574726F706D69;
      break;
    case 4:
      uint64_t result = 0x6E6F73726570;
      break;
    case 5:
      uint64_t result = 0x656C797473;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24438043C(uint64_t a1)
{
  unint64_t v2 = sub_24438407C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244380478(uint64_t a1)
{
  unint64_t v2 = sub_24438407C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2443804B4(uint64_t a1)
{
  unint64_t v2 = sub_2443843C4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2443804F0(uint64_t a1)
{
  unint64_t v2 = sub_2443843C4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24438052C(uint64_t a1)
{
  unint64_t v2 = sub_244384274();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244380568(uint64_t a1)
{
  unint64_t v2 = sub_244384274();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2443805A4(uint64_t a1)
{
  unint64_t v2 = sub_2443841CC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2443805E0(uint64_t a1)
{
  unint64_t v2 = sub_2443841CC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24438061C(uint64_t a1)
{
  unint64_t v2 = sub_244384124();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244380658(uint64_t a1)
{
  unint64_t v2 = sub_244384124();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_244380694(uint64_t a1)
{
  unint64_t v2 = sub_24438431C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2443806D0(uint64_t a1)
{
  unint64_t v2 = sub_24438431C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24438070C(uint64_t a1)
{
  unint64_t v2 = sub_2443840D0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244380748(uint64_t a1)
{
  unint64_t v2 = sub_2443840D0();

  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_244380784(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_244383190(a1, v4);
  if (!v2) {
    sub_243EF6F74((uint64_t)v4, a2);
  }
}

void *sub_2443807CC(void *a1)
{
  sub_243EF6F74(v1, (uint64_t)v4);
  return sub_24437FA6C(a1);
}

uint64_t sub_24438081C(uint64_t a1, uint64_t a2)
{
  sub_243EF6F74(a1, (uint64_t)v4);
  sub_243EF6F74(a2, (uint64_t)v5);
  return sub_244380E5C(v4, v5) & 1;
}

uint64_t sub_244380868@<X0>(uint64_t *a1@<X8>)
{
  sub_243EF6F74(v1, (uint64_t)v5);
  uint64_t result = sub_24437F96C();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2443808A8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    char v21 = a3;
    uint64_t v4 = (unint64_t *)(swift_bridgeObjectRetain() + 56);
    while (2)
    {
      uint64_t v8 = *(v4 - 3);
      unint64_t v9 = *(v4 - 2);
      uint64_t v11 = *(v4 - 1);
      unint64_t v10 = *v4;
      uint64_t v13 = v4[1];
      unint64_t v12 = v4[2];
      uint64_t v15 = v4[3];
      uint64_t v14 = v4[4];
      unint64_t v16 = v4[5];
      v4 += 11;
      uint64_t v25 = v11;
      unint64_t v26 = v10;
      unint64_t v23 = v12;
      uint64_t v24 = v13;
      unint64_t v22 = v16;
      switch(v16 >> 61)
      {
        case 1uLL:
        case 3uLL:
          uint64_t v17 = v11;
          uint64_t v5 = v14;
          sub_24437BA1C(v8, v9, v17, v10, v13, v12, v15, v14, v16);
          swift_bridgeObjectRetain();
          goto LABEL_4;
        case 2uLL:
          uint64_t v18 = v11;
          uint64_t v5 = v14;
          sub_24437BA1C(v8, v9, v18, v10, v13, v12, v15, v14, v16);
          swift_bridgeObjectRetain();
          unint64_t v6 = v9;
          goto LABEL_5;
        case 4uLL:
          uint64_t v19 = v11;
          uint64_t v5 = v14;
          sub_24437BA1C(v8, v9, v19, v10, v13, v12, v15, v14, v16);
          swift_bridgeObjectRetain();
          uint64_t v7 = v8;
          sub_2443BA5F0();
          unint64_t v6 = v9;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          goto LABEL_6;
        default:
          uint64_t v5 = v14;
          swift_bridgeObjectRetain_n();
LABEL_4:
          unint64_t v6 = v9;
LABEL_5:
          uint64_t v7 = v8;
LABEL_6:
          sub_2443BA5F0();
          swift_bridgeObjectRelease();
          sub_24437BBBC(v7, v6, v25, v26, v24, v23, v15, v5, v22);
          if (--v3) {
            continue;
          }
          swift_bridgeObjectRelease();
          a3 = v21;
          break;
      }
      break;
    }
  }
  if ((a3 & 1) == 0)
  {
    sub_243EF7228();
    sub_2443BB170();
    sub_2443BA5F0();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_244380B38(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47168);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244383FD4();
  sub_2443BBA30();
  uint64_t v14 = a2;
  char v13 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E46FA0);
  sub_244384A24(&qword_268E47170, (void (*)(void))sub_244384A94);
  sub_2443BB740();
  if (!v3)
  {
    char v12 = 1;
    sub_2443BB6F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_244380CFC(uint64_t a1)
{
  unint64_t v2 = sub_244383FD4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_244380D38(uint64_t a1)
{
  unint64_t v2 = sub_244383FD4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_244380D74@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_244383D94(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6 & 1;
  }
  return result;
}

uint64_t sub_244380DA8(void *a1)
{
  return sub_244380B38(a1, *v1, v1[1]);
}

uint64_t sub_244380DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  char v3 = *(unsigned char *)(a1 + 16);
  uint64_t v4 = *(void *)(a2 + 8);
  int v5 = *(unsigned __int8 *)(a2 + 16);
  if (sub_243FC68FC(*(void *)a1, *(void *)a2))
  {
    if (v3)
    {
      if (v5) {
        return 1;
      }
    }
    else
    {
      if (v2 == v4) {
        char v7 = v5;
      }
      else {
        char v7 = 1;
      }
      if ((v7 & 1) == 0) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_244380E2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2443808A8(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_244380E5C(void *a1, void *a2)
{
  sub_243EF6F74((uint64_t)a1, (uint64_t)&v22);
  switch((unint64_t)v26 >> 61)
  {
    case 1uLL:
      *(void *)&long long v26 = v26 & 0x1FFFFFFFFFFFFFFFLL;
      long long v6 = v22;
      uint64_t v7 = v23;
      sub_243EF6F74((uint64_t)a2, (uint64_t)&v28);
      if ((unint64_t)v32 >> 61 == 1)
      {
        *(void *)&long long v32 = v32 & 0x1FFFFFFFFFFFFFFFLL;
        uint64_t v8 = v29;
        BOOL v9 = (void)v6 == (void)v28 && *((void *)&v6 + 1) == *((void *)&v28 + 1);
        if (v9 || (sub_2443BB7D0()) && (sub_243FC8B78(v7, v8)) {
          goto LABEL_27;
        }
      }
      goto LABEL_26;
    case 2uLL:
      *(void *)&long long v26 = v26 & 0x1FFFFFFFFFFFFFFFLL;
      long long v30 = v24;
      long long v31 = v25;
      uint64_t v33 = v27;
      long long v28 = v22;
      long long v29 = v23;
      long long v32 = v26;
      sub_243EF6F74((uint64_t)a2, (uint64_t)v17);
      if ((unint64_t)v18 >> 61 != 2) {
        goto LABEL_26;
      }
      *(void *)&long long v18 = v18 & 0x1FFFFFFFFFFFFFFFLL;
      uint64_t v21 = v19;
      v20[0] = v17[0];
      v20[1] = v17[1];
      v20[2] = v17[2];
      v20[3] = v17[3];
      v20[4] = v18;
      sub_244384568(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_24437BA1C);
      sub_244384568(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_24437BA1C);
      char v10 = sub_244332078((uint64_t)&v28, (uint64_t)v20);
      goto LABEL_30;
    case 3uLL:
      *(void *)&long long v26 = v26 & 0x1FFFFFFFFFFFFFFFLL;
      uint64_t v5 = *((void *)&v22 + 1);
      uint64_t v4 = v22;
      sub_243EF6F74((uint64_t)a2, (uint64_t)&v28);
      uint64_t v11 = v32;
      if ((unint64_t)v32 >> 61 == 3) {
        goto LABEL_20;
      }
      goto LABEL_26;
    case 4uLL:
      *(void *)&long long v26 = v26 & 0x1FFFFFFFFFFFFFFFLL;
      long long v12 = v22;
      sub_243EF6F74((uint64_t)a2, (uint64_t)&v28);
      if ((unint64_t)v32 >> 61 != 4) {
        goto LABEL_26;
      }
      *(void *)&long long v32 = v32 & 0x1FFFFFFFFFFFFFFFLL;
      uint64_t v13 = *((void *)&v28 + 1);
      uint64_t v16 = v28;
      swift_bridgeObjectRetain();
      sub_2443BA5F0();
      sub_244384568(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_24437BA1C);
      sub_244384568(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_24437BA1C);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)&v20[0] = v16;
      *((void *)&v20[0] + 1) = v13;
      swift_bridgeObjectRetain();
      sub_2443BA5F0();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 == v20[0]) {
        char v10 = 1;
      }
      else {
        char v10 = sub_2443BB7D0();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_30:
      sub_244384568(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_24437BBBC);
      sub_244384568(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_24437BBBC);
      return v10 & 1;
    case 5uLL:
      *(void *)&long long v26 = v26 & 0x1FFFFFFFFFFFFFFFLL;
      uint64_t v5 = *((void *)&v22 + 1);
      uint64_t v4 = v22;
      sub_243EF6F74((uint64_t)a2, (uint64_t)&v28);
      uint64_t v11 = v32;
      if ((unint64_t)v32 >> 61 != 5) {
        goto LABEL_26;
      }
LABEL_20:
      *(void *)&long long v32 = v11 & 0x1FFFFFFFFFFFFFFFLL;
LABEL_21:
      if (v4 == (void)v28 && v5 == *((void *)&v28 + 1)) {
LABEL_27:
      }
        char v10 = 1;
      else {
        char v10 = sub_2443BB7D0();
      }
      break;
    default:
      *(void *)&long long v26 = v26 & 0x1FFFFFFFFFFFFFFFLL;
      uint64_t v5 = *((void *)&v22 + 1);
      uint64_t v4 = v22;
      sub_243EF6F74((uint64_t)a2, (uint64_t)&v28);
      if (!((unint64_t)v32 >> 61)) {
        goto LABEL_21;
      }
LABEL_26:
      char v10 = 0;
      break;
  }
  return v10 & 1;
}

uint64_t sub_244381244(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2443B54B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
  MEMORY[0x270FA5388](v8 - 8);
  char v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BF40);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v13[*(int *)(v14 + 56)];
  sub_24438480C(a1, (uint64_t)v13, type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind);
  sub_24438480C(a2, v15, type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v17 = v16(v13, 2, v4);
  if (!v17)
  {
    sub_24438480C((uint64_t)v13, (uint64_t)v10, type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind);
    if (!v16((char *)v15, 2, v4))
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v15, v4);
      char v18 = _s15ImagePlayground0A10GenerationV07PreviewA0V2eeoiySbAE_AEtFZ_0();
      uint64_t v19 = *(void (**)(char *, uint64_t))(v5 + 8);
      v19(v7, v4);
      v19(v10, v4);
      sub_2443847AC((uint64_t)v13, type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind);
      return v18 & 1;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    goto LABEL_9;
  }
  if (v17 == 1)
  {
    if (v16((char *)v15, 2, v4) != 1) {
      goto LABEL_9;
    }
  }
  else if (v16((char *)v15, 2, v4) != 2)
  {
LABEL_9:
    sub_244384874((uint64_t)v13);
    char v18 = 0;
    return v18 & 1;
  }
  sub_2443847AC((uint64_t)v13, type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind);
  char v18 = 1;
  return v18 & 1;
}

BOOL sub_244381544(void *a1, void *a2)
{
  uint64_t v4 = sub_2443B54B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
  MEMORY[0x270FA5388](v8 - 8);
  char v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BF40);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a1 == *a2 && a1[1] == a2[1] || (char v14 = sub_2443BB7D0(), result = 0, (v14 & 1) != 0))
  {
    uint64_t v31 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity(0);
    uint64_t v16 = *(int *)(v31 + 20);
    uint64_t v17 = (uint64_t)a2 + v16;
    uint64_t v18 = (uint64_t)&v13[*(int *)(v11 + 48)];
    sub_24438480C((uint64_t)a1 + v16, (uint64_t)v13, type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind);
    sub_24438480C(v17, v18, type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind);
    uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
    int v20 = v19(v13, 2, v4);
    if (v20)
    {
      if (v20 == 1)
      {
        if (v19((char *)v18, 2, v4) == 1) {
          goto LABEL_13;
        }
      }
      else if (v19((char *)v18, 2, v4) == 2)
      {
LABEL_13:
        sub_2443847AC((uint64_t)v13, type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind);
        uint64_t v23 = *(int *)(v31 + 24);
        uint64_t v25 = *(void *)((char *)a1 + v23);
        uint64_t v24 = *(void *)((char *)a1 + v23 + 8);
        long long v26 = (void *)((char *)a2 + v23);
        uint64_t v28 = *v26;
        uint64_t v27 = v26[1];
        return v25 == v28 && v24 == v27;
      }
    }
    else
    {
      sub_24438480C((uint64_t)v13, (uint64_t)v10, type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind);
      if (!v19((char *)v18, 2, v4))
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v18, v4);
        char v21 = _s15ImagePlayground0A10GenerationV07PreviewA0V2eeoiySbAE_AEtFZ_0();
        long long v22 = *(void (**)(char *, uint64_t))(v5 + 8);
        v22(v7, v4);
        v22(v10, v4);
        if ((v21 & 1) == 0)
        {
          sub_2443847AC((uint64_t)v13, type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind);
          return 0;
        }
        goto LABEL_13;
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
    sub_244384874((uint64_t)v13);
    return 0;
  }
  return result;
}

uint64_t sub_2443818B4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E470A0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2443845C4();
  sub_2443BBA10();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v9[31] = 0;
    uint64_t v7 = sub_2443BB660();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E470B0);
    v9[15] = 1;
    sub_244384618(&qword_268E470B8, &qword_268E470C0);
    swift_bridgeObjectRetain();
    sub_2443BB6B0();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_244381B10(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E473D0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E473D8);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E473E0);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)a1, *(void *)(a1 + 24));
  sub_244386570();
  uint64_t v12 = v26;
  sub_2443BBA10();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_2443BB6C0();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_2443BB360();
    swift_allocError();
    uint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E39B08);
    *uint64_t v18 = &type metadata for GenerationRecipe_V4.DrawOnImageRecipe.AssignmentOptions;
    sub_2443BB620();
    sub_2443BB350();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_2443865C4();
    sub_2443BB600();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_244386618();
    sub_2443BB600();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  __swift_destroy_boxed_opaque_existential_1(v26);
  return a1;
}

char *sub_244381F60(void *a1)
{
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47380);
  uint64_t v45 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v44 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47388);
  uint64_t v42 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v43 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47390);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47398);
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E473A0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v46 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_2443863CC();
  uint64_t v15 = v47;
  sub_2443BBA10();
  if (v15) {
    goto LABEL_7;
  }
  uint64_t v35 = v7;
  uint64_t v36 = v9;
  uint64_t v16 = v43;
  uint64_t v17 = v44;
  uint64_t v47 = 0;
  uint64_t v18 = v45;
  uint64_t v19 = v11;
  int v20 = v13;
  uint64_t v21 = sub_2443BB6C0();
  uint64_t v22 = (char *)v21;
  if (*(void *)(v21 + 16) != 1)
  {
    uint64_t v25 = sub_2443BB360();
    swift_allocError();
    uint64_t v13 = v22;
    uint64_t v26 = v10;
    char v28 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E39B08);
    void *v28 = &type metadata for GenerationRecipe_V4.DrawOnImageRecipe.SanitizationCategory;
    sub_2443BB620();
    sub_2443BB350();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v28, *MEMORY[0x263F8DCB0], v25);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v26);
LABEL_7:
    uint64_t v29 = (uint64_t)v46;
    goto LABEL_8;
  }
  uint64_t v13 = (char *)*(unsigned __int8 *)(v21 + 32);
  switch(*(unsigned char *)(v21 + 32))
  {
    case 1:
      char v49 = 1;
      sub_2443864C8();
      uint64_t v31 = v47;
      sub_2443BB600();
      if (v31) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v39);
      goto LABEL_14;
    case 2:
      char v50 = 2;
      sub_244386474();
      uint64_t v32 = v47;
      sub_2443BB600();
      if (v32) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v42 + 8))(v16, v40);
      goto LABEL_14;
    case 3:
      char v51 = 3;
      sub_244386420();
      uint64_t v33 = v47;
      sub_2443BB600();
      if (v33) {
        goto LABEL_14;
      }
      (*(void (**)(char *, uint64_t))(v18 + 8))(v17, v41);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
      uint64_t v29 = (uint64_t)v46;
      break;
    default:
      char v48 = 0;
      sub_24438651C();
      uint64_t v23 = v36;
      uint64_t v24 = v47;
      sub_2443BB600();
      if (v24)
      {
LABEL_12:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v37 + 8))(v23, v35);
LABEL_14:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
      uint64_t v29 = (uint64_t)v46;
      break;
  }
LABEL_8:
  __swift_destroy_boxed_opaque_existential_1(v29);
  return v13;
}

uint64_t sub_244382598@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E472E0);
  uint64_t v4 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2443B54B0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2443B54A0();
  sub_2443B5460();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v13 = a1[3];
  uint64_t v14 = (uint64_t)a1;
  uint64_t v15 = a1;
  uint64_t v16 = v6;
  __swift_project_boxed_opaque_existential_1(v15, v13);
  sub_244385C24();
  sub_2443BBA10();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1(v14);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v51 = v4;
    char v59 = 0;
    sub_243EF947C();
    uint64_t v17 = v55;
    sub_2443BB650();
    uint64_t v50 = v12;
    uint64_t v18 = v56;
    unint64_t v19 = v57;
    char v59 = 1;
    sub_243EE0D98(v56, v57);
    sub_2443BB650();
    unint64_t v49 = v19;
    unint64_t v20 = v57;
    char v59 = 2;
    uint64_t v21 = v56;
    sub_243EE0D98(v56, v57);
    sub_2443BB650();
    unint64_t v47 = v20;
    uint64_t v48 = v21;
    uint64_t v23 = v56;
    unint64_t v22 = v57;
    LOBYTE(v56) = 3;
    sub_243EE0D98(v23, v57);
    sub_2443BB680();
    uint64_t v53 = v23;
    unint64_t v54 = v22;
    uint64_t v25 = v24;
    LOBYTE(v56) = 4;
    sub_2443BB680();
    uint64_t v27 = v26;
    LOBYTE(v56) = 5;
    int v28 = sub_2443BB670();
    uint64_t v29 = v51;
    LODWORD(v23) = v28;
    char v59 = 6;
    sub_244385C78();
    sub_2443BB6B0();
    int v58 = v23;
    LODWORD(v23) = v56;
    char v59 = 7;
    sub_244385CCC();
    sub_2443BB6B0();
    int v45 = v56;
    int v46 = v23;
    LOBYTE(v56) = 8;
    uint64_t v44 = sub_2443BB660();
    uint64_t v31 = v30;
    v58 &= 1u;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v17);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v32 = v18;
    uint64_t v33 = v18;
    unint64_t v34 = v49;
    sub_243EE0D98(v33, v49);
    unint64_t v35 = v47;
    uint64_t v36 = v48;
    sub_243EE0D98(v48, v47);
    uint64_t v37 = v31;
    uint64_t v38 = v53;
    unint64_t v39 = v54;
    sub_243EE0D98(v53, v54);
    sub_243ECBC24(v38, v39);
    sub_243ECBC24(v36, v35);
    sub_243ECBC24(v32, v34);
    __swift_destroy_boxed_opaque_existential_1(v14);
    sub_243ECBC24(v32, v34);
    sub_243ECBC24(v36, v35);
    sub_243ECBC24(v38, v39);
    uint64_t v40 = v37;
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v42 = v52;
    uint64_t *v52 = v32;
    v42[1] = v34;
    v42[2] = v36;
    v42[3] = v35;
    v42[4] = v38;
    v42[5] = v39;
    v42[6] = v25;
    v42[7] = v27;
    *((unsigned char *)v42 + 64) = v58;
    *((unsigned char *)v42 + 65) = v46;
    *((unsigned char *)v42 + 66) = v45;
    v42[9] = v44;
    v42[10] = v40;
  }
  return result;
}

uint64_t sub_244382C60(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E472D0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244385BD0();
  sub_2443BBA10();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    LOBYTE(v12) = 0;
    uint64_t v7 = sub_2443BB660();
    v11[15] = 1;
    sub_243EF947C();
    swift_bridgeObjectRetain();
    sub_2443BB6B0();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v9 = v12;
    unint64_t v10 = v13;
    swift_bridgeObjectRetain();
    sub_243EE0DAC(v9, v10);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    sub_243ECBC38(v9, v10);
  }
  return v7;
}

uint64_t sub_244382E94@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E472C0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244385B7C();
  sub_2443BBA10();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    return sub_243ECBC24(0, 0xF000000000000000);
  }
  else
  {
    LOBYTE(v20) = 0;
    uint64_t v9 = sub_2443BB660();
    uint64_t v11 = v10;
    uint64_t v19 = v9;
    LOBYTE(v20) = 1;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_2443BB630();
    uint64_t v14 = v13;
    uint64_t v18 = v12;
    char v22 = 2;
    sub_243EF947C();
    swift_bridgeObjectRetain();
    sub_2443BB650();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v15 = v20;
    unint64_t v16 = v21;
    sub_243EE0D98(v20, v21);
    sub_243ECBC24(0, 0xF000000000000000);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_243EE0D98(v15, v16);
    sub_243ECBC24(v15, v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = sub_243ECBC24(v15, v16);
    *a2 = v19;
    a2[1] = v11;
    a2[2] = v18;
    a2[3] = v14;
    a2[4] = v15;
    a2[5] = v16;
  }
  return result;
}

__n128 sub_244383190@<Q0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  long long v72 = a2;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46FB8);
  uint64_t v71 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  v76.n128_u64[0] = (unint64_t)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46FC0);
  uint64_t v70 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v75 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46FC8);
  uint64_t v68 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  long long v74 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46FD0);
  uint64_t v65 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v73 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46FD8);
  uint64_t v62 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46FE0);
  uint64_t v61 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46FE8);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v89 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_24438407C();
  uint64_t v17 = v77;
  sub_2443BBA10();
  uint64_t v18 = v17;
  if (v17) {
    goto LABEL_11;
  }
  uint64_t v60 = v11;
  uint64_t v59 = v9;
  uint64_t v19 = v74;
  uint64_t v20 = v75;
  unint64_t v21 = v76.n128_u64[0];
  *(void *)&long long v77 = v13;
  uint64_t v22 = sub_2443BB6C0();
  if (*(void *)(v22 + 16) != 1)
  {
    uint64_t v25 = sub_2443BB360();
    swift_allocError();
    uint64_t v27 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E39B08);
    void *v27 = &type metadata for GenerationRecipe_V4.Ingredient;
    sub_2443BB620();
    sub_2443BB350();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x263F8DCB0], v25);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v77 + 8))(v15, v12);
LABEL_11:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v89);
    return result;
  }
  switch(*(unsigned char *)(v22 + 32))
  {
    case 1:
      LOBYTE(v78) = 1;
      sub_24438431C();
      sub_2443BB600();
      sub_244384370();
      uint64_t v28 = v63;
      sub_2443BB6B0();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v8, v28);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v77 + 8))(v15, v12);
      uint64_t v63 = 0;
      uint64_t v48 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v45 = v78;
      uint64_t v47 = v79;
      *(void *)&long long v29 = v80;
      __n128 v76 = 0u;
      long long v77 = v29;
      unint64_t v49 = 0x2000000000000000;
      uint64_t v30 = (uint64_t)v89;
      break;
    case 2:
      LOBYTE(v78) = 2;
      sub_244384274();
      uint64_t v31 = v73;
      sub_2443BB600();
      sub_2443842C8();
      uint64_t v32 = v66;
      sub_2443BB6B0();
      uint64_t v33 = v77;
      uint64_t v63 = 0;
      (*(void (**)(char *, uint64_t))(v65 + 8))(v31, v32);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v15, v12);
      uint64_t v45 = v78;
      uint64_t v47 = v79;
      __n128 v76 = v81;
      long long v77 = v80;
      uint64_t v18 = v82;
      uint64_t v48 = v83;
      uint64_t v50 = v87;
      uint64_t v51 = v88;
      uint64_t v53 = 0x10000;
      if (!v86) {
        uint64_t v53 = 0;
      }
      uint64_t v54 = 0x4000000000000000;
      if (v84) {
        uint64_t v54 = 0x4000000000000001;
      }
      unint64_t v49 = v54 | ((unint64_t)v85 << 8) | v53;
      uint64_t v30 = (uint64_t)v89;
      break;
    case 3:
      LOBYTE(v78) = 3;
      sub_2443841CC();
      unint64_t v34 = v19;
      sub_2443BB600();
      sub_244384220();
      uint64_t v35 = v67;
      sub_2443BB6B0();
      uint64_t v36 = v77;
      uint64_t v63 = 0;
      (*(void (**)(char *, uint64_t))(v68 + 8))(v34, v35);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v12);
      uint64_t v48 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v45 = v78;
      uint64_t v47 = v79;
      __n128 v76 = 0u;
      long long v77 = v80;
      unint64_t v49 = 0x6000000000000000;
      uint64_t v30 = (uint64_t)v89;
      break;
    case 4:
      LOBYTE(v78) = 4;
      sub_244384124();
      sub_2443BB600();
      sub_244384178();
      uint64_t v37 = v69;
      sub_2443BB6B0();
      uint64_t v38 = v77;
      uint64_t v63 = 0;
      (*(void (**)(char *, uint64_t))(v70 + 8))(v20, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v12);
      uint64_t v48 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v45 = v78;
      uint64_t v47 = v79;
      unint64_t v49 = 0x8000000000000000;
      long long v77 = v80;
      __n128 v52 = v81;
      goto LABEL_17;
    case 5:
      LOBYTE(v78) = 5;
      sub_2443840D0();
      sub_2443BB600();
      unint64_t v40 = v21;
      uint64_t v41 = v15;
      uint64_t v42 = v64;
      uint64_t v43 = sub_2443BB660();
      uint64_t v18 = 0;
      uint64_t v44 = v77;
      uint64_t v47 = v55;
      uint64_t v63 = 0;
      uint64_t v56 = *(void (**)(unint64_t, uint64_t))(v71 + 8);
      uint64_t v75 = (char *)v43;
      v56(v40, v42);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v41, v12);
      uint64_t v48 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      __n128 v76 = 0u;
      long long v77 = 0u;
      unint64_t v49 = 0xA000000000000000;
      uint64_t v30 = (uint64_t)v89;
      uint64_t v45 = (uint64_t)v75;
      break;
    default:
      LOBYTE(v78) = 0;
      sub_2443843C4();
      uint64_t v23 = v60;
      sub_2443BB600();
      uint64_t v24 = v59;
      uint64_t v18 = 0;
      uint64_t v45 = sub_2443BB660();
      uint64_t v47 = v46;
      uint64_t v63 = 0;
      (*(void (**)(char *, uint64_t))(v61 + 8))(v23, v24);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v77 + 8))(v15, v12);
      uint64_t v48 = 0;
      unint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      __n128 v52 = 0uLL;
      long long v77 = 0u;
LABEL_17:
      __n128 v76 = v52;
      uint64_t v30 = (uint64_t)v89;
      break;
  }
  __swift_destroy_boxed_opaque_existential_1(v30);
  unint64_t v57 = v72;
  *long long v72 = v45;
  v57[1] = v47;
  __n128 result = v76;
  *((_OWORD *)v57 + 1) = v77;
  *((__n128 *)v57 + 2) = result;
  v57[6] = v18;
  v57[7] = v48;
  v57[8] = v49;
  v57[9] = v50;
  v57[10] = v51;
  return result;
}

uint64_t sub_244383D94(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E46F90);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_244383FD4();
  sub_2443BBA10();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E46FA0);
    v9[7] = 0;
    sub_244384A24(&qword_268E46FA8, (void (*)(void))sub_244384028);
    sub_2443BB6B0();
    uint64_t v7 = v10;
    v9[6] = 1;
    swift_bridgeObjectRetain();
    sub_2443BB640();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_244383FD4()
{
  unint64_t result = qword_268E46F98;
  if (!qword_268E46F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46F98);
  }
  return result;
}

unint64_t sub_244384028()
{
  unint64_t result = qword_268E46FB0;
  if (!qword_268E46FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46FB0);
  }
  return result;
}

unint64_t sub_24438407C()
{
  unint64_t result = qword_268E46FF0;
  if (!qword_268E46FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46FF0);
  }
  return result;
}

unint64_t sub_2443840D0()
{
  unint64_t result = qword_268E46FF8;
  if (!qword_268E46FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E46FF8);
  }
  return result;
}

unint64_t sub_244384124()
{
  unint64_t result = qword_268E47000;
  if (!qword_268E47000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47000);
  }
  return result;
}

unint64_t sub_244384178()
{
  unint64_t result = qword_268E47008;
  if (!qword_268E47008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47008);
  }
  return result;
}

unint64_t sub_2443841CC()
{
  unint64_t result = qword_268E47010;
  if (!qword_268E47010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47010);
  }
  return result;
}

unint64_t sub_244384220()
{
  unint64_t result = qword_268E47018;
  if (!qword_268E47018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47018);
  }
  return result;
}

unint64_t sub_244384274()
{
  unint64_t result = qword_268E47020;
  if (!qword_268E47020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47020);
  }
  return result;
}

unint64_t sub_2443842C8()
{
  unint64_t result = qword_268E47028;
  if (!qword_268E47028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47028);
  }
  return result;
}

unint64_t sub_24438431C()
{
  unint64_t result = qword_268E47030;
  if (!qword_268E47030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47030);
  }
  return result;
}

unint64_t sub_244384370()
{
  unint64_t result = qword_268E47038;
  if (!qword_268E47038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47038);
  }
  return result;
}

unint64_t sub_2443843C4()
{
  unint64_t result = qword_268E47040;
  if (!qword_268E47040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47040);
  }
  return result;
}

unint64_t sub_244384418()
{
  unint64_t result = qword_268E47080;
  if (!qword_268E47080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47080);
  }
  return result;
}

unint64_t sub_24438446C()
{
  unint64_t result = qword_268E47088;
  if (!qword_268E47088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47088);
  }
  return result;
}

unint64_t sub_2443844C0()
{
  unint64_t result = qword_268E47090;
  if (!qword_268E47090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47090);
  }
  return result;
}

unint64_t sub_244384514()
{
  unint64_t result = qword_268E47098;
  if (!qword_268E47098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47098);
  }
  return result;
}

void *sub_244384568(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

unint64_t sub_2443845C4()
{
  unint64_t result = qword_268E470A8;
  if (!qword_268E470A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E470A8);
  }
  return result;
}

uint64_t sub_244384618(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E470B0);
    sub_2443846AC(a2, (void (*)(uint64_t))type metadata accessor for GenerationRecipe_V4.Prompt.Entity);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2443846AC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2443846F4()
{
  unint64_t result = qword_268E470E8;
  if (!qword_268E470E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E470E8);
  }
  return result;
}

uint64_t sub_244384748(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2443847AC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24438480C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_244384874(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BF40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2443848D4()
{
  unint64_t result = qword_268E47128;
  if (!qword_268E47128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47128);
  }
  return result;
}

unint64_t sub_244384928()
{
  unint64_t result = qword_268E47130;
  if (!qword_268E47130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47130);
  }
  return result;
}

unint64_t sub_24438497C()
{
  unint64_t result = qword_268E47138;
  if (!qword_268E47138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47138);
  }
  return result;
}

unint64_t sub_2443849D0()
{
  unint64_t result = qword_268E47140;
  if (!qword_268E47140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47140);
  }
  return result;
}

uint64_t sub_244384A24(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E46FA0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_244384A94()
{
  unint64_t result = qword_268E47178;
  if (!qword_268E47178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47178);
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind.CodingKeys()
{
  return &type metadata for GenerationRecipe_V4.Prompt.Entity.Kind.CodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind.GenericCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.Prompt.Entity.Kind.GenericCodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind.UnknownCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.Prompt.Entity.Kind.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Prompt.Entity.Kind.NamedCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.Prompt.Entity.Kind.NamedCodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Prompt.Entity.CodingKeys()
{
  return &type metadata for GenerationRecipe_V4.Prompt.Entity.CodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Prompt.CodingKeys()
{
  return &type metadata for GenerationRecipe_V4.Prompt.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for GenerationRecipe_V4.Ingredient.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x244384C20);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Ingredient.CodingKeys()
{
  return &type metadata for GenerationRecipe_V4.Ingredient.CodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Ingredient.CuratedPromptCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.Ingredient.CuratedPromptCodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Ingredient.PromptCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.Ingredient.PromptCodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Ingredient.DrawingCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.Ingredient.DrawingCodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Ingredient.ImportedImageCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.Ingredient.ImportedImageCodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Ingredient.PersonCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.Ingredient.PersonCodingKeys;
}

unsigned char *_s15ImagePlayground19GenerationRecipe_V4V6PromptV6EntityV4KindO15NamedCodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x244384D44);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.Ingredient.StyleCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.Ingredient.StyleCodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.CodingKeys()
{
  return &type metadata for GenerationRecipe_V4.CodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.PersonData()
{
  return &type metadata for GenerationRecipe_V4.PersonData;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.ImportedImage()
{
  return &type metadata for GenerationRecipe_V4.ImportedImage;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.DrawOnImageRecipe()
{
  return &type metadata for GenerationRecipe_V4.DrawOnImageRecipe;
}

unint64_t sub_244384DC0()
{
  unint64_t result = qword_268E47180;
  if (!qword_268E47180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47180);
  }
  return result;
}

unint64_t sub_244384E18()
{
  unint64_t result = qword_268E47188;
  if (!qword_268E47188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47188);
  }
  return result;
}

unint64_t sub_244384E70()
{
  unint64_t result = qword_268E47190;
  if (!qword_268E47190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47190);
  }
  return result;
}

unint64_t sub_244384EC8()
{
  unint64_t result = qword_268E47198;
  if (!qword_268E47198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47198);
  }
  return result;
}

unint64_t sub_244384F20()
{
  unint64_t result = qword_268E471A0;
  if (!qword_268E471A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E471A0);
  }
  return result;
}

unint64_t sub_244384F78()
{
  unint64_t result = qword_268E471A8;
  if (!qword_268E471A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E471A8);
  }
  return result;
}

unint64_t sub_244384FD0()
{
  unint64_t result = qword_268E471B0;
  if (!qword_268E471B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E471B0);
  }
  return result;
}

unint64_t sub_244385028()
{
  unint64_t result = qword_268E471B8;
  if (!qword_268E471B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E471B8);
  }
  return result;
}

unint64_t sub_244385080()
{
  unint64_t result = qword_268E471C0;
  if (!qword_268E471C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E471C0);
  }
  return result;
}

unint64_t sub_2443850D8()
{
  unint64_t result = qword_268E471C8;
  if (!qword_268E471C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E471C8);
  }
  return result;
}

unint64_t sub_244385130()
{
  unint64_t result = qword_268E471D0;
  if (!qword_268E471D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E471D0);
  }
  return result;
}

unint64_t sub_244385188()
{
  unint64_t result = qword_268E471D8;
  if (!qword_268E471D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E471D8);
  }
  return result;
}

unint64_t sub_2443851E0()
{
  unint64_t result = qword_268E471E0;
  if (!qword_268E471E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E471E0);
  }
  return result;
}

unint64_t sub_244385238()
{
  unint64_t result = qword_268E471E8;
  if (!qword_268E471E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E471E8);
  }
  return result;
}

unint64_t sub_244385290()
{
  unint64_t result = qword_268E471F0;
  if (!qword_268E471F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E471F0);
  }
  return result;
}

unint64_t sub_2443852E8()
{
  unint64_t result = qword_268E471F8;
  if (!qword_268E471F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E471F8);
  }
  return result;
}

unint64_t sub_244385340()
{
  unint64_t result = qword_268E47200;
  if (!qword_268E47200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47200);
  }
  return result;
}

unint64_t sub_244385398()
{
  unint64_t result = qword_268E47208;
  if (!qword_268E47208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47208);
  }
  return result;
}

unint64_t sub_2443853F0()
{
  unint64_t result = qword_268E47210;
  if (!qword_268E47210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47210);
  }
  return result;
}

unint64_t sub_244385448()
{
  unint64_t result = qword_268E47218;
  if (!qword_268E47218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47218);
  }
  return result;
}

unint64_t sub_2443854A0()
{
  unint64_t result = qword_268E47220;
  if (!qword_268E47220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47220);
  }
  return result;
}

unint64_t sub_2443854F8()
{
  unint64_t result = qword_268E47228;
  if (!qword_268E47228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47228);
  }
  return result;
}

unint64_t sub_244385550()
{
  unint64_t result = qword_268E47230;
  if (!qword_268E47230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47230);
  }
  return result;
}

unint64_t sub_2443855A8()
{
  unint64_t result = qword_268E47238;
  if (!qword_268E47238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47238);
  }
  return result;
}

unint64_t sub_244385600()
{
  unint64_t result = qword_268E47240;
  if (!qword_268E47240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47240);
  }
  return result;
}

unint64_t sub_244385658()
{
  unint64_t result = qword_268E47248;
  if (!qword_268E47248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47248);
  }
  return result;
}

unint64_t sub_2443856B0()
{
  unint64_t result = qword_268E47250;
  if (!qword_268E47250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47250);
  }
  return result;
}

unint64_t sub_244385708()
{
  unint64_t result = qword_268E47258;
  if (!qword_268E47258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47258);
  }
  return result;
}

unint64_t sub_244385760()
{
  unint64_t result = qword_268E47260;
  if (!qword_268E47260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47260);
  }
  return result;
}

unint64_t sub_2443857B8()
{
  unint64_t result = qword_268E47268;
  if (!qword_268E47268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47268);
  }
  return result;
}

unint64_t sub_244385810()
{
  unint64_t result = qword_268E47270;
  if (!qword_268E47270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47270);
  }
  return result;
}

unint64_t sub_244385868()
{
  unint64_t result = qword_268E47278;
  if (!qword_268E47278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47278);
  }
  return result;
}

unint64_t sub_2443858C0()
{
  unint64_t result = qword_268E47280;
  if (!qword_268E47280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47280);
  }
  return result;
}

unint64_t sub_244385918()
{
  unint64_t result = qword_268E47288;
  if (!qword_268E47288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47288);
  }
  return result;
}

unint64_t sub_244385970()
{
  unint64_t result = qword_268E47290;
  if (!qword_268E47290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47290);
  }
  return result;
}

unint64_t sub_2443859C8()
{
  unint64_t result = qword_268E47298;
  if (!qword_268E47298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47298);
  }
  return result;
}

unint64_t sub_244385A20()
{
  unint64_t result = qword_268E472A0;
  if (!qword_268E472A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E472A0);
  }
  return result;
}

unint64_t sub_244385A78()
{
  unint64_t result = qword_268E472A8;
  if (!qword_268E472A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E472A8);
  }
  return result;
}

unint64_t sub_244385AD0()
{
  unint64_t result = qword_268E472B0;
  if (!qword_268E472B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E472B0);
  }
  return result;
}

unint64_t sub_244385B28()
{
  unint64_t result = qword_268E472B8;
  if (!qword_268E472B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E472B8);
  }
  return result;
}

unint64_t sub_244385B7C()
{
  unint64_t result = qword_268E472C8;
  if (!qword_268E472C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E472C8);
  }
  return result;
}

unint64_t sub_244385BD0()
{
  unint64_t result = qword_268E472D8;
  if (!qword_268E472D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E472D8);
  }
  return result;
}

unint64_t sub_244385C24()
{
  unint64_t result = qword_268E472E8;
  if (!qword_268E472E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E472E8);
  }
  return result;
}

unint64_t sub_244385C78()
{
  unint64_t result = qword_268E472F0;
  if (!qword_268E472F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E472F0);
  }
  return result;
}

unint64_t sub_244385CCC()
{
  unint64_t result = qword_268E472F8;
  if (!qword_268E472F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E472F8);
  }
  return result;
}

unint64_t sub_244385D20()
{
  unint64_t result = qword_268E47318;
  if (!qword_268E47318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47318);
  }
  return result;
}

unint64_t sub_244385D74()
{
  unint64_t result = qword_268E47320;
  if (!qword_268E47320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47320);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for GenerationRecipe_V4.DrawOnImageRecipe.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x244385E94);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.DrawOnImageRecipe.CodingKeys()
{
  return &type metadata for GenerationRecipe_V4.DrawOnImageRecipe.CodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.ImportedImage.CodingKeys()
{
  return &type metadata for GenerationRecipe_V4.ImportedImage.CodingKeys;
}

unsigned char *_s15ImagePlayground19GenerationRecipe_V4V6PromptV6EntityV4KindO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x244385FA8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.PersonData.CodingKeys()
{
  return &type metadata for GenerationRecipe_V4.PersonData.CodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.DrawOnImageRecipe.AssignmentOptions()
{
  return &type metadata for GenerationRecipe_V4.DrawOnImageRecipe.AssignmentOptions;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.DrawOnImageRecipe.SanitizationCategory()
{
  return &type metadata for GenerationRecipe_V4.DrawOnImageRecipe.SanitizationCategory;
}

unint64_t sub_244386008()
{
  unint64_t result = qword_268E47328;
  if (!qword_268E47328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47328);
  }
  return result;
}

unint64_t sub_244386060()
{
  unint64_t result = qword_268E47330;
  if (!qword_268E47330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47330);
  }
  return result;
}

unint64_t sub_2443860B8()
{
  unint64_t result = qword_268E47338;
  if (!qword_268E47338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47338);
  }
  return result;
}

unint64_t sub_244386110()
{
  unint64_t result = qword_268E47340;
  if (!qword_268E47340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47340);
  }
  return result;
}

unint64_t sub_244386168()
{
  unint64_t result = qword_268E47348;
  if (!qword_268E47348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47348);
  }
  return result;
}

unint64_t sub_2443861C0()
{
  unint64_t result = qword_268E47350;
  if (!qword_268E47350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47350);
  }
  return result;
}

unint64_t sub_244386218()
{
  unint64_t result = qword_268E47358;
  if (!qword_268E47358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47358);
  }
  return result;
}

unint64_t sub_244386270()
{
  unint64_t result = qword_268E47360;
  if (!qword_268E47360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47360);
  }
  return result;
}

unint64_t sub_2443862C8()
{
  unint64_t result = qword_268E47368;
  if (!qword_268E47368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47368);
  }
  return result;
}

unint64_t sub_244386320()
{
  unint64_t result = qword_268E47370;
  if (!qword_268E47370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47370);
  }
  return result;
}

unint64_t sub_244386378()
{
  unint64_t result = qword_268E47378;
  if (!qword_268E47378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47378);
  }
  return result;
}

unint64_t sub_2443863CC()
{
  unint64_t result = qword_268E473A8;
  if (!qword_268E473A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E473A8);
  }
  return result;
}

unint64_t sub_244386420()
{
  unint64_t result = qword_268E473B0;
  if (!qword_268E473B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E473B0);
  }
  return result;
}

unint64_t sub_244386474()
{
  unint64_t result = qword_268E473B8;
  if (!qword_268E473B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E473B8);
  }
  return result;
}

unint64_t sub_2443864C8()
{
  unint64_t result = qword_268E473C0;
  if (!qword_268E473C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E473C0);
  }
  return result;
}

unint64_t sub_24438651C()
{
  unint64_t result = qword_268E473C8;
  if (!qword_268E473C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E473C8);
  }
  return result;
}

unint64_t sub_244386570()
{
  unint64_t result = qword_268E473E8;
  if (!qword_268E473E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E473E8);
  }
  return result;
}

unint64_t sub_2443865C4()
{
  unint64_t result = qword_268E473F0;
  if (!qword_268E473F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E473F0);
  }
  return result;
}

unint64_t sub_244386618()
{
  unint64_t result = qword_268E473F8;
  if (!qword_268E473F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E473F8);
  }
  return result;
}

unsigned char *_s15ImagePlayground19GenerationRecipe_V4V17DrawOnImageRecipeV17AssignmentOptionsOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x244386738);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.DrawOnImageRecipe.AssignmentOptions.CodingKeys()
{
  return &type metadata for GenerationRecipe_V4.DrawOnImageRecipe.AssignmentOptions.CodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.DrawOnImageRecipe.AssignmentOptions.BlendCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.DrawOnImageRecipe.AssignmentOptions.BlendCodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.DrawOnImageRecipe.AssignmentOptions.NoBlendingCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.DrawOnImageRecipe.AssignmentOptions.NoBlendingCodingKeys;
}

unsigned char *_s15ImagePlayground19GenerationRecipe_V4V17DrawOnImageRecipeV20SanitizationCategoryOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24438685CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.DrawOnImageRecipe.SanitizationCategory.CodingKeys()
{
  return &type metadata for GenerationRecipe_V4.DrawOnImageRecipe.SanitizationCategory.CodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.DrawOnImageRecipe.SanitizationCategory.DoNotSanitizeCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.DrawOnImageRecipe.SanitizationCategory.DoNotSanitizeCodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.DrawOnImageRecipe.SanitizationCategory.SanitizeUnknownImageTypeCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.DrawOnImageRecipe.SanitizationCategory.SanitizeUnknownImageTypeCodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.DrawOnImageRecipe.SanitizationCategory.SanitizeScribbleCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.DrawOnImageRecipe.SanitizationCategory.SanitizeScribbleCodingKeys;
}

ValueMetadata *type metadata accessor for GenerationRecipe_V4.DrawOnImageRecipe.SanitizationCategory.SanitizeScribbleOverImageCodingKeys()
{
  return &type metadata for GenerationRecipe_V4.DrawOnImageRecipe.SanitizationCategory.SanitizeScribbleOverImageCodingKeys;
}

unint64_t sub_2443868D8()
{
  unint64_t result = qword_268E47440;
  if (!qword_268E47440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47440);
  }
  return result;
}

unint64_t sub_244386930()
{
  unint64_t result = qword_268E47448;
  if (!qword_268E47448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47448);
  }
  return result;
}

unint64_t sub_244386988()
{
  unint64_t result = qword_268E47450;
  if (!qword_268E47450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47450);
  }
  return result;
}

unint64_t sub_2443869E0()
{
  unint64_t result = qword_268E47458;
  if (!qword_268E47458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47458);
  }
  return result;
}

unint64_t sub_244386A38()
{
  unint64_t result = qword_268E47460;
  if (!qword_268E47460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47460);
  }
  return result;
}

unint64_t sub_244386A90()
{
  unint64_t result = qword_268E47468;
  if (!qword_268E47468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47468);
  }
  return result;
}

unint64_t sub_244386AE8()
{
  unint64_t result = qword_268E47470;
  if (!qword_268E47470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47470);
  }
  return result;
}

unint64_t sub_244386B40()
{
  unint64_t result = qword_268E47478;
  if (!qword_268E47478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47478);
  }
  return result;
}

unint64_t sub_244386B98()
{
  unint64_t result = qword_268E47480;
  if (!qword_268E47480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47480);
  }
  return result;
}

unint64_t sub_244386BF0()
{
  unint64_t result = qword_268E47488;
  if (!qword_268E47488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47488);
  }
  return result;
}

unint64_t sub_244386C48()
{
  unint64_t result = qword_268E47490;
  if (!qword_268E47490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47490);
  }
  return result;
}

unint64_t sub_244386CA0()
{
  unint64_t result = qword_268E47498;
  if (!qword_268E47498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47498);
  }
  return result;
}

unint64_t sub_244386CF8()
{
  unint64_t result = qword_268E474A0;
  if (!qword_268E474A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E474A0);
  }
  return result;
}

unint64_t sub_244386D50()
{
  unint64_t result = qword_268E474A8;
  if (!qword_268E474A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E474A8);
  }
  return result;
}

unint64_t sub_244386DA8()
{
  unint64_t result = qword_268E474B0;
  if (!qword_268E474B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E474B0);
  }
  return result;
}

unint64_t sub_244386E00()
{
  unint64_t result = qword_268E474B8;
  if (!qword_268E474B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E474B8);
  }
  return result;
}

unint64_t sub_244386E58()
{
  unint64_t result = qword_268E474C0;
  if (!qword_268E474C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E474C0);
  }
  return result;
}

unint64_t sub_244386EB0()
{
  unint64_t result = qword_268E474C8;
  if (!qword_268E474C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E474C8);
  }
  return result;
}

void *sub_244386F04(uint64_t a1, uint64_t a2)
{
  int v3 = v2;
  if (qword_268E37C38 != -1) {
    swift_once();
  }
  unsigned int v6 = (void *)qword_268E446E0;
  uint64_t v7 = MEMORY[0x263F8EE78];
  v3[2] = qword_268E446E0;
  v3[5] = a2;
  v3[6] = v7;
  v3[4] = a1;
  uint64_t v8 = qword_268E379F8;
  id v9 = v6;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)qword_268E3D2A8;
  void v3[3] = qword_268E3D2A8;
  id v11 = v10;
  sub_2443BB2D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2443BA5F0();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_2443BA4B0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_arrayForKey_, v12, 0xD000000000000018, 0x80000002443F6760);

  if (v13)
  {
    uint64_t v14 = sub_2443BA7C0();

    uint64_t v15 = sub_243EB29AC(v14);
    swift_bridgeObjectRelease();
    if (v15)
    {
      v3[6] = v15;
      swift_bridgeObjectRelease();
    }
  }
  return v3;
}

uint64_t type metadata accessor for PhotoLibraryPopulationSource()
{
  return self;
}

void *sub_2443870E4(void *a1, void *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v38 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v38 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    id v9 = (char *)a2 + v7;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[6];
    uint64_t v12 = a3[7];
    id v13 = (void *)((char *)v4 + v11);
    uint64_t v14 = (void *)((char *)a2 + v11);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = (char *)v4 + v12;
    uint64_t v17 = (char *)a2 + v12;
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    *((void *)v16 + 2) = *((void *)v17 + 2);
    uint64_t v18 = a3[8];
    uint64_t v19 = a3[9];
    uint64_t v20 = (void *)((char *)v4 + v18);
    unint64_t v21 = (void *)((char *)a2 + v18);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = (char *)v4 + v19;
    uint64_t v24 = (char *)a2 + v19;
    uint64_t v25 = *(void *)v24;
    LOBYTE(v24) = v24[8];
    *(void *)uint64_t v23 = v25;
    v23[8] = (char)v24;
    uint64_t v26 = a3[10];
    __n128 v52 = a3;
    uint64_t v27 = a2;
    uint64_t v28 = (char *)v4 + v26;
    long long v29 = (char *)v27 + v26;
    uint64_t v30 = *(void *)v29;
    char v31 = v29[8];
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_243EB1808(v30, v31);
    *(void *)uint64_t v28 = v30;
    v28[8] = v31;
    uint64_t v32 = v52[11];
    uint64_t v33 = (void *)((char *)v4 + v32);
    unint64_t v34 = (void *)((char *)v27 + v32);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v35 = sub_2443B8640();
      uint64_t v36 = *(void *)(v35 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
      {
        uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
        memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v36 + 16))(v33, v34, v35);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
      }
    }
    else
    {
      *uint64_t v33 = *v34;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v39 = v52[12];
    uint64_t v40 = v52[13];
    uint64_t v41 = (char *)v4 + v39;
    uint64_t v42 = (char *)v27 + v39;
    uint64_t v43 = *(void *)v42;
    LOBYTE(v42) = v42[8];
    *(void *)uint64_t v41 = v43;
    v41[8] = (char)v42;
    uint64_t v44 = (void *)((char *)v4 + v40);
    uint64_t v45 = (void *)((char *)v27 + v40);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F4C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v46 = sub_2443B8530();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
    }
    else
    {
      *uint64_t v44 = *v45;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v47 = v52[14];
    uint64_t v48 = (_OWORD *)((char *)v4 + v47);
    unint64_t v49 = (_OWORD *)((char *)v27 + v47);
    long long v50 = v49[1];
    *uint64_t v48 = *v49;
    v48[1] = v50;
  }
  return v4;
}

uint64_t sub_244387494(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_243EB18F8(*(void *)(a1 + a2[10]), *(unsigned char *)(a1 + a2[10] + 8));
  uint64_t v6 = a1 + a2[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2443B8640();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v9 = a1 + a2[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F4C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2443B8530();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
    return v11(v9, v10);
  }
  else
  {
    return swift_release();
  }
}

void *sub_2443876C8(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)((char *)a1 + v10);
  id v13 = (void *)((char *)a2 + v10);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = (char *)a1 + v11;
  uint64_t v16 = (char *)a2 + v11;
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *((void *)v15 + 2) = *((void *)v16 + 2);
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)((char *)a1 + v17);
  uint64_t v20 = (void *)((char *)a2 + v17);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = (char *)a1 + v18;
  uint64_t v23 = (char *)a2 + v18;
  uint64_t v24 = *(void *)v23;
  LOBYTE(v23) = v23[8];
  *(void *)uint64_t v22 = v24;
  v22[8] = (char)v23;
  uint64_t v25 = a3[10];
  uint64_t v48 = (char *)a1 + v25;
  uint64_t v26 = (char *)a2 + v25;
  uint64_t v27 = *(void *)v26;
  char v28 = v26[8];
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_243EB1808(v27, v28);
  *(void *)uint64_t v48 = v27;
  v48[8] = v28;
  uint64_t v29 = a3[11];
  uint64_t v30 = (void *)((char *)a1 + v29);
  char v31 = (void *)((char *)a2 + v29);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v32 = sub_2443B8640();
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
    {
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
      memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v33 + 16))(v30, v31, v32);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
    }
  }
  else
  {
    *uint64_t v30 = *v31;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v35 = a3[12];
  uint64_t v36 = a3[13];
  uint64_t v37 = (char *)a1 + v35;
  uint64_t v38 = (char *)a2 + v35;
  uint64_t v39 = *(void *)v38;
  LOBYTE(v38) = v38[8];
  *(void *)uint64_t v37 = v39;
  v37[8] = (char)v38;
  uint64_t v40 = (void *)((char *)a1 + v36);
  uint64_t v41 = (void *)((char *)a2 + v36);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F4C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v42 = sub_2443B8530();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
  }
  else
  {
    *uint64_t v40 = *v41;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v43 = a3[14];
  uint64_t v44 = (_OWORD *)((char *)a1 + v43);
  uint64_t v45 = (_OWORD *)((char *)a2 + v43);
  long long v46 = v45[1];
  *uint64_t v44 = *v45;
  v44[1] = v46;
  return a1;
}

void *sub_244387A20(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  v14[2] = v15[2];
  swift_retain();
  swift_release();
  uint64_t v16 = a3[8];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_retain();
  swift_release();
  uint64_t v19 = a3[9];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = *(void *)v21;
  LOBYTE(v21) = v21[8];
  *(void *)uint64_t v20 = v22;
  v20[8] = (char)v21;
  swift_retain();
  swift_release();
  uint64_t v23 = a3[10];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = *(void *)v25;
  LOBYTE(v17) = v25[8];
  sub_243EB1808(*(void *)v25, (char)v17);
  uint64_t v27 = *(void *)v24;
  char v28 = v24[8];
  *(void *)uint64_t v24 = v26;
  v24[8] = (char)v17;
  sub_243EB18F8(v27, v28);
  if (a1 != a2)
  {
    uint64_t v29 = a3[11];
    uint64_t v30 = (void *)((char *)a1 + v29);
    char v31 = (void *)((char *)a2 + v29);
    sub_243E9DDBC((uint64_t)a1 + v29, (uint64_t *)&unk_268E38400);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v32 = sub_2443B8640();
      uint64_t v33 = *(void *)(v32 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
      {
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
        memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v33 + 16))(v30, v31, v32);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
      }
    }
    else
    {
      *uint64_t v30 = *v31;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v35 = a3[12];
  uint64_t v36 = (char *)a1 + v35;
  uint64_t v37 = (char *)a2 + v35;
  uint64_t v38 = *(void *)v37;
  LOBYTE(v37) = v37[8];
  *(void *)uint64_t v36 = v38;
  v36[8] = (char)v37;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v39 = a3[13];
    uint64_t v40 = (void *)((char *)a1 + v39);
    uint64_t v41 = (void *)((char *)a2 + v39);
    sub_243E9DDBC((uint64_t)a1 + v39, &qword_268E3F4C0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F4C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v42 = sub_2443B8530();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
    }
    else
    {
      *uint64_t v40 = *v41;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v43 = a3[14];
  uint64_t v44 = (void *)((char *)a1 + v43);
  uint64_t v45 = (void *)((char *)a2 + v43);
  *uint64_t v44 = *v45;
  v44[1] = v45[1];
  v44[2] = v45[2];
  v44[3] = v45[3];
  return a1;
}

void *sub_244387E18(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *((void *)v11 + 2) = *((void *)v12 + 2);
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  uint64_t v13 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  v14[8] = v15[8];
  *(void *)uint64_t v14 = *(void *)v15;
  uint64_t v16 = a3[10];
  uint64_t v17 = a3[11];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = (char *)a1 + v17;
  uint64_t v21 = (char *)a2 + v17;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v23 = sub_2443B8640();
    uint64_t v24 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v21, 1, v23))
    {
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
      memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v20, v21, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v20, 0, 1, v23);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  uint64_t v26 = a3[12];
  uint64_t v27 = a3[13];
  char v28 = (char *)a1 + v26;
  uint64_t v29 = (char *)a2 + v26;
  *(void *)char v28 = *(void *)v29;
  v28[8] = v29[8];
  uint64_t v30 = (char *)a1 + v27;
  char v31 = (char *)a2 + v27;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F4C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v33 = sub_2443B8530();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v30, v31, v33);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
  }
  uint64_t v34 = a3[14];
  uint64_t v35 = (_OWORD *)((char *)a1 + v34);
  uint64_t v36 = (_OWORD *)((char *)a2 + v34);
  long long v37 = v36[1];
  *uint64_t v35 = *v36;
  v35[1] = v37;
  return a1;
}

void *sub_244388120(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_bridgeObjectRelease();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_release();
  uint64_t v13 = a3[7];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *((void *)v14 + 2) = *((void *)v15 + 2);
  swift_release();
  uint64_t v16 = a3[8];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  swift_bridgeObjectRelease();
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_release();
  uint64_t v19 = a3[9];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = *(void *)v21;
  LOBYTE(v21) = v21[8];
  *(void *)uint64_t v20 = v22;
  v20[8] = (char)v21;
  swift_release();
  uint64_t v23 = a3[10];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = *(void *)v25;
  LOBYTE(v25) = v25[8];
  uint64_t v27 = *(void *)v24;
  char v28 = v24[8];
  *(void *)uint64_t v24 = v26;
  v24[8] = (char)v25;
  sub_243EB18F8(v27, v28);
  if (a1 != a2)
  {
    uint64_t v29 = a3[11];
    uint64_t v30 = (char *)a1 + v29;
    char v31 = (char *)a2 + v29;
    sub_243E9DDBC((uint64_t)a1 + v29, (uint64_t *)&unk_268E38400);
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v33 = sub_2443B8640();
      uint64_t v34 = *(void *)(v33 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v31, 1, v33))
      {
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
        memcpy(v30, v31, *(void *)(*(void *)(v35 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v30, v31, v33);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v30, 0, 1, v33);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
    }
  }
  uint64_t v36 = a3[12];
  long long v37 = (char *)a1 + v36;
  uint64_t v38 = (char *)a2 + v36;
  uint64_t v39 = *(void *)v38;
  LOBYTE(v38) = v38[8];
  *(void *)long long v37 = v39;
  v37[8] = (char)v38;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v40 = a3[13];
    uint64_t v41 = (char *)a1 + v40;
    uint64_t v42 = (char *)a2 + v40;
    sub_243E9DDBC((uint64_t)a1 + v40, &qword_268E3F4C0);
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F4C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v44 = sub_2443B8530();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 32))(v41, v42, v44);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v41, v42, *(void *)(*(void *)(v43 - 8) + 64));
    }
  }
  uint64_t v45 = a3[14];
  long long v46 = (_OWORD *)((char *)a1 + v45);
  uint64_t v47 = (_OWORD *)((char *)a2 + v45);
  long long v48 = v47[1];
  *long long v46 = *v47;
  v46[1] = v48;
  return a1;
}

uint64_t sub_2443884CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2443884E0);
}

uint64_t sub_2443884E0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[5];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v13(a1 + v9, a2, v7);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + a3[6]);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38410);
    if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
    {
      uint64_t v7 = v12;
      uint64_t v8 = *(void *)(v12 - 8);
      uint64_t v9 = a3[11];
      goto LABEL_9;
    }
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D8);
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
    uint64_t v16 = v14;
    uint64_t v17 = a1 + a3[13];
    return v15(v17, a2, v16);
  }
}

uint64_t sub_244388668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24438867C);
}

uint64_t sub_24438867C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v13(a1 + v11, a2, a2, v9);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6]) = (a2 - 1);
    return result;
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38410);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[11];
    goto LABEL_7;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D8);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + a4[13];

  return v15(v17, a2, a2, v16);
}

uint64_t type metadata accessor for PhotoGridView()
{
  uint64_t result = qword_268E474E0;
  if (!qword_268E474E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_244388850()
{
  sub_2443889EC(319, &qword_268E474F0, (uint64_t (*)(uint64_t))type metadata accessor for PhotoGridViewModel, MEMORY[0x263F1B870]);
  if (v0 <= 0x3F)
  {
    sub_243E9D1EC();
    if (v1 <= 0x3F)
    {
      sub_2443889EC(319, &qword_268E474F8, MEMORY[0x263F19E18], MEMORY[0x263F185C8]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_2443889EC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_244388A50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_244388A6C(unint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = sub_2443B54B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    if (!v8) {
      return v9;
    }
    uint64_t v18 = MEMORY[0x263F8EE78];
    uint64_t result = sub_243F233CC(0, v8 & ~(v8 >> 63), 0);
    if (v8 < 0) {
      break;
    }
    uint64_t v11 = 0;
    uint64_t v9 = v18;
    unint64_t v16 = a1 & 0xC000000000000001;
    unint64_t v17 = a1;
    v15[0] = v2;
    v15[1] = v5 + 32;
    while (v8 != v11)
    {
      if (v16)
      {
        uint64_t v12 = MEMORY[0x24568E4B0](v11, a1);
      }
      else
      {
        uint64_t v12 = *(void *)(a1 + 8 * v11 + 32);
        swift_retain();
      }
      swift_beginAccess();
      uint64_t v13 = *(void *)(v12 + 16) + *(void *)(**(void **)(v12 + 16) + 160);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
      swift_release();
      uint64_t v18 = v9;
      unint64_t v2 = *(void *)(v9 + 16);
      unint64_t v14 = *(void *)(v9 + 24);
      if (v2 >= v14 >> 1)
      {
        sub_243F233CC(v14 > 1, v2 + 1, 1);
        uint64_t v9 = v18;
      }
      ++v11;
      *(void *)(v9 + 16) = v2 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v2, v7, v4);
      a1 = v17;
      if (v8 == v11) {
        return v9;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_2443BB510();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_244388CE0(unint64_t a1, double a2, double a3)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_2443BB4E0();
    __break(1u);
    return result;
  }
  if (!a1) {
    return MEMORY[0x263F8EE78];
  }
  type metadata accessor for CGSize(0);
  uint64_t result = sub_2443BA850();
  *(void *)(result + 16) = a1;
  uint64_t v5 = (double *)(result + 32);
  if (a1 < 4)
  {
    unint64_t v6 = 0;
    double v7 = a3;
    double v8 = a2;
LABEL_9:
    unint64_t v14 = a1 - v6;
    do
    {
      *uint64_t v5 = v8;
      v5[1] = v7;
      v5 += 2;
      --v14;
    }
    while (v14);
    return result;
  }
  unint64_t v6 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v5 += 2 * (a1 & 0xFFFFFFFFFFFFFFFCLL);
  double v8 = a2;
  int64x2_t v9 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
  double v7 = a3;
  int64x2_t v10 = vdupq_lane_s64(*(uint64_t *)&a3, 0);
  uint64_t v11 = (double *)(result + 64);
  unint64_t v12 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    uint64_t v13 = v11 - 4;
    vst2q_f64(v13, *(float64x2x2_t *)v9.i8);
    vst2q_f64(v11, *(float64x2x2_t *)v9.i8);
    v11 += 8;
    v12 -= 4;
  }
  while (v12);
  if (v6 != a1) {
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_244388DF0(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = sub_2443BB4E0();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      uint64_t v4 = sub_2443B9CF0();
      uint64_t v5 = sub_2443BA850();
      *(void *)(v5 + 16) = a2;
      uint64_t v6 = *(void *)(v4 - 8);
      unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      double v8 = *(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 16);
      v8(v5 + v7, a1, v4);
      uint64_t v9 = a2 - 1;
      if (a2 != 1)
      {
        uint64_t v10 = *(void *)(v6 + 72);
        unint64_t v11 = v5 + v10 + v7;
        do
        {
          v8(v11, a1, v4);
          v11 += v10;
          --v9;
        }
        while (v9);
      }
    }
    else
    {
      uint64_t v5 = MEMORY[0x263F8EE78];
    }
    uint64_t v12 = sub_2443B9CF0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
    return v5;
  }
  return result;
}

uint64_t sub_244388F98@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_244389090(a1, &OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__filterFavorites, a2);
}

uint64_t sub_244388FAC()
{
  return swift_release();
}

uint64_t sub_24438907C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_244389090(a1, &OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__viewIsEnabled, a2);
}

uint64_t sub_244389090@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, unsigned char *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_2443955F4(&qword_268E38C38, (void (*)(uint64_t))type metadata accessor for PhotoGridViewModel);
  sub_2443B55F0();
  uint64_t result = swift_release();
  *a3 = *(unsigned char *)(v5 + *a2);
  return result;
}

uint64_t sub_244389144()
{
  return swift_release();
}

uint64_t sub_244389214@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2443955F4(&qword_268E38C38, (void (*)(uint64_t))type metadata accessor for PhotoGridViewModel);
  sub_2443B55F0();
  swift_release();
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__gridElementViewModels);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2443892C8()
{
  return swift_bridgeObjectRelease();
}

double sub_2443893A8@<D0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  uint64_t v3 = (int *)type metadata accessor for PhotoGridView();
  type metadata accessor for PhotoGridViewModel();
  sub_2443955F4(&qword_268E38C38, (void (*)(uint64_t))type metadata accessor for PhotoGridViewModel);
  sub_2443B9C10();
  uint64_t v4 = (_OWORD *)((char *)a2 + v3[6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E476D8);
  sub_2443B98C0();
  *uint64_t v4 = v15;
  uint64_t v5 = (char *)a2 + v3[7];
  type metadata accessor for CGSize(0);
  sub_2443B98C0();
  *(_OWORD *)uint64_t v5 = v15;
  *((void *)v5 + 2) = v16;
  uint64_t v6 = (_OWORD *)((char *)a2 + v3[8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E421A0);
  sub_2443B98C0();
  *uint64_t v6 = v15;
  unint64_t v7 = (char *)a2 + v3[9];
  *(void *)unint64_t v7 = swift_getKeyPath();
  v7[8] = 0;
  double v8 = (char *)a2 + v3[10];
  *(void *)double v8 = swift_getKeyPath();
  v8[8] = 0;
  uint64_t v9 = (void *)((char *)a2 + v3[11]);
  *uint64_t v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = (char *)a2 + v3[12];
  type metadata accessor for HomeAnimationCoordinator();
  sub_2443955F4((unint64_t *)&qword_268E3A9D8, (void (*)(uint64_t))type metadata accessor for HomeAnimationCoordinator);
  *(void *)uint64_t v10 = sub_2443B6FA0();
  v10[8] = v11 & 1;
  uint64_t v12 = (void *)((char *)a2 + v3[13]);
  *uint64_t v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F4C0);
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = (_OWORD *)((char *)a2 + v3[14]);
  double result = 12.0;
  _OWORD *v13 = xmmword_2443E49E0;
  v13[1] = xmmword_2443E49F0;
  return result;
}

uint64_t sub_244389614()
{
  uint64_t v0 = sub_2443B7FB0();
  MEMORY[0x270FA5388](v0 - 8);
  sub_2443B7FA0();
  sub_2443B7F90();
  sub_2443B7F70();
  sub_2443B7F90();
  sub_2443B7FD0();
  uint64_t v1 = sub_2443B8E10();
  uint64_t v3 = v2;
  char v5 = v4 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E476A0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E3BCB0);
  sub_243E9DC94(&qword_268E476A8, &qword_268E476A0);
  sub_243E9DC94((unint64_t *)&qword_268E3EC30, (uint64_t *)&unk_268E3BCB0);
  sub_2443B9160();
  sub_243EA5864(v1, v3, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443898E0(double a1)
{
  type metadata accessor for PhotoGridView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  sub_2443B9BF0();
  char v2 = *(unsigned char *)(v6 + 80);
  uint64_t result = swift_release();
  if (v2) {
    return 3;
  }
  double v4 = round(a1 * 0.00390625);
  if ((~*(void *)&v4 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v4 >= 9.22337204e18)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v5 = (uint64_t)v4;
  if ((uint64_t)v4 >= 8) {
    uint64_t v5 = 8;
  }
  if (v5 <= 2) {
    return 2;
  }
  else {
    return v5;
  }
}

uint64_t sub_2443899B8(double a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  double v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_2443B9CE0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (double *)((char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_2443B9CF0();
  MEMORY[0x270FA5388](v13 - 8);
  long long v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v1 + *(int *)(type metadata accessor for PhotoGridView() + 56);
  sub_2440D27EC((uint64_t)v8);
  double v17 = sub_244394E8C((uint64_t)v8);
  sub_243E9DDBC((uint64_t)v8, &qword_268E3EA10);
  uint64_t v18 = *(void *)(v16 + 24);
  *uint64_t v12 = v17;
  *((void *)v12 + 1) = v18;
  (*(void (**)(double *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F1B8C0], v9);
  sub_2440D27EC((uint64_t)v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  sub_2443B9BF0();
  swift_release();
  sub_243E9DDBC((uint64_t)v5, &qword_268E3EA10);
  sub_2443B9D00();
  uint64_t v19 = sub_2443898E0(a1);
  return sub_244388DF0((uint64_t)v15, v19);
}

uint64_t sub_244389C28()
{
  uint64_t v1 = type metadata accessor for PhotoGridView();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  sub_24439565C(v0, (uint64_t)&v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_2443954F8((uint64_t)&v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)], v5 + v4, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  uint64_t v6 = sub_2443B9E20();
  uint64_t v8 = v7;
  sub_24438E38C(v0, (uint64_t)&v23);
  *(void *)&long long v14 = sub_244391EA0;
  *((void *)&v14 + 1) = v5;
  long long v15 = v23;
  long long v16 = v24;
  long long v17 = v25;
  long long v18 = v26;
  long long v19 = v27;
  long long v20 = v28;
  *(void *)&long long v21 = v29;
  BYTE8(v21) = BYTE8(v29);
  *(void *)&long long v22 = v6;
  *((void *)&v22 + 1) = v8;
  uint64_t v13 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E47500);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E47508);
  sub_244391F28();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47538);
  unint64_t v10 = sub_244391FEC();
  *(void *)&long long v23 = v9;
  *((void *)&v23 + 1) = v10;
  swift_getOpaqueTypeConformance2();
  sub_2443B94F0();
  long long v29 = v20;
  long long v30 = v21;
  long long v31 = v22;
  long long v25 = v16;
  long long v26 = v17;
  long long v27 = v18;
  long long v28 = v19;
  long long v23 = v14;
  long long v24 = v15;
  return sub_244392168((uint64_t)&v23);
}

uint64_t sub_244389E60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (**a3)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v6 = sub_2443B73F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PhotoGridView();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10 - 8);
  sub_24439565C(a2, (uint64_t)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = (v12 + *(unsigned __int8 *)(v7 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v15 = swift_allocObject();
  sub_2443954F8((uint64_t)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v13, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15 + v14, v9, v6);
  *a3 = sub_2443925B4;
  a3[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v15;
  return result;
}

uint64_t sub_24438A05C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v104 = a3;
  uint64_t v107 = a4;
  uint64_t v108 = a1;
  uint64_t v112 = sub_2443B7000();
  uint64_t v114 = *(void *)(v112 - 8);
  MEMORY[0x270FA5388](v112);
  uint64_t v105 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = sub_2443B7920();
  uint64_t v113 = *(unsigned __int8 **)(v103 - 8);
  MEMORY[0x270FA5388](v103);
  uint64_t v87 = v6;
  uint64_t v100 = (char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E3A110);
  MEMORY[0x270FA5388](v99);
  uint64_t v92 = (uint64_t *)((char *)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for PhotoGridView();
  uint64_t v90 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v90 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47588);
  unint64_t v82 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_268E47590);
  uint64_t v106 = *(v83 - 1);
  MEMORY[0x270FA5388](v83);
  unint64_t v14 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 v85 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_268E47598);
  uint64_t v84 = *(v85 - 1);
  MEMORY[0x270FA5388](v85);
  long long v16 = (char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = (uint64_t (*)(void))__swift_instantiateConcreteTypeFromMangledName(&qword_268E475A0);
  MEMORY[0x270FA5388](v109);
  char v86 = (char *)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E475A8);
  uint64_t v91 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  uint64_t v110 = (uint64_t (*)())((char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E475B0);
  uint64_t v96 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v111 = (char *)&v81 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E475B8);
  uint64_t v101 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  uint64_t v98 = (char *)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E475C0);
  MEMORY[0x270FA5388](v94);
  uint64_t v95 = (char *)&v81 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2443B8AC0();
  uint64_t v115 = a2;
  uint64_t v116 = v104;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E475C8);
  sub_2443926A0();
  sub_2443B6EC0();
  type metadata accessor for CGRect(0);
  uint64_t v23 = v22;
  sub_24439565C(a2, (uint64_t)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  uint64_t v24 = *(unsigned __int8 *)(v90 + 80);
  uint64_t v25 = (v24 + 16) & ~v24;
  uint64_t v89 = v25 + v9;
  uint64_t v88 = v24 | 7;
  uint64_t v26 = swift_allocObject();
  uint64_t v90 = v25;
  uint64_t v104 = (uint64_t)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2443954F8(v104, v26 + v25, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  uint64_t v27 = sub_243E9DC94(&qword_268E47638, &qword_268E47588);
  uint64_t v80 = sub_2443955F4(&qword_268E47640, type metadata accessor for CGRect);
  sub_2443B92B0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v12, v10);
  uint64_t v117 = (uint64_t (*)(void))v10;
  uint64_t v118 = v23;
  uint64_t v119 = v27;
  uint64_t v120 = v80;
  swift_getOpaqueTypeConformance2();
  long long v28 = v16;
  long long v29 = v83;
  sub_2443B9190();
  (*(void (**)(char *, void *))(v106 + 8))(v14, v29);
  uint64_t v106 = a2;
  uint64_t v83 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  sub_2443B9BF0();
  LODWORD(a2) = *((unsigned __int8 *)v117 + 24);
  swift_release();
  unsigned __int8 v30 = sub_2443B8AD0();
  if (a2)
  {
    char v31 = sub_2443B8B20();
    sub_2443B8B20();
    unsigned __int8 v32 = sub_2443B8B20();
    uint64_t v34 = v108;
    uint64_t v33 = v109;
    uint64_t v35 = v113;
    if (v32 == v30) {
      goto LABEL_10;
    }
  }
  else
  {
    char v36 = sub_2443B8AF0();
    char v31 = sub_2443B8B20();
    sub_2443B8B20();
    if (sub_2443B8B20() != v30) {
      char v31 = sub_2443B8B20();
    }
    sub_2443B8B20();
    char v37 = sub_2443B8B20();
    uint64_t v35 = v113;
    uint64_t v33 = v109;
    if (v37 == v36)
    {
      uint64_t v34 = v108;
      goto LABEL_10;
    }
    uint64_t v34 = v108;
  }
  char v31 = sub_2443B8B20();
LABEL_10:
  uint64_t v38 = sub_2443B78B0();
  uint64_t v39 = v84;
  uint64_t v40 = (uint64_t)v86;
  uint64_t v41 = v28;
  uint64_t v42 = v28;
  uint64_t v43 = v85;
  (*(void (**)(char *, char *, void *))(v84 + 16))(v86, v42, v85);
  uint64_t v44 = v40 + *((int *)v33 + 9);
  *(void *)uint64_t v44 = v38;
  *(unsigned char *)(v44 + 8) = v31;
  (*(void (**)(char *, void *))(v39 + 8))(v41, v43);
  sub_2443B9BF0();
  uint64_t v45 = v117;
  swift_getKeyPath();
  uint64_t v117 = v45;
  sub_2443955F4(&qword_268E38C38, (void (*)(uint64_t))type metadata accessor for PhotoGridViewModel);
  sub_2443B55F0();
  swift_release();
  uint64_t v46 = (uint64_t)v45 + OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__gridScrollAssetID;
  swift_beginAccess();
  uint64_t v47 = (void (*)(void, void, void))v92;
  sub_243E9DD58(v46, (uint64_t)v92, (uint64_t *)&unk_268E3A110);
  swift_release();
  long long v48 = v100;
  uint64_t v49 = v103;
  unsigned __int8 v85 = (void *)*((void *)v35 + 2);
  ((void (*)(char *, uint64_t, uint64_t))v85)(v100, v34, v103);
  uint64_t v50 = v35[80];
  uint64_t v51 = (v50 + 16) & ~v50;
  v87 += v51;
  uint64_t v84 = v50 | 7;
  uint64_t v52 = swift_allocObject();
  uint64_t v53 = (void *)*((void *)v35 + 4);
  uint64_t v113 = v35 + 32;
  uint64_t v83 = v53;
  ((void (*)(uint64_t, char *, uint64_t))v53)(v52 + v51, v48, v49);
  unint64_t v54 = sub_244392A80();
  uint64_t v55 = sub_2443937A0((unint64_t *)&qword_268E38040, &qword_268E44A90);
  uint64_t v56 = v99;
  unint64_t v82 = v54;
  uint64_t v81 = v55;
  sub_2443B9530();
  swift_release();
  sub_243E9DDBC((uint64_t)v47, (uint64_t *)&unk_268E3A110);
  sub_243E9DDBC(v40, &qword_268E475A0);
  if (qword_268E37B68 != -1) {
    swift_once();
  }
  uint64_t v57 = v112;
  uint64_t v58 = __swift_project_value_buffer(v112, (uint64_t)qword_268E76FD8);
  uint64_t v59 = v114;
  uint64_t v60 = v105;
  uint64_t v92 = *(uint64_t **)(v114 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v92)(v105, v58, v57);
  ((void (*)(char *, uint64_t, uint64_t))v85)(v48, v108, v49);
  uint64_t v61 = swift_allocObject();
  ((void (*)(uint64_t, char *, uint64_t))v83)(v61 + v51, v48, v49);
  uint64_t v62 = v57;
  uint64_t v117 = v109;
  uint64_t v118 = v56;
  uint64_t v119 = v82;
  uint64_t v120 = v81;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v64 = v110;
  uint64_t v65 = (uint64_t (*)(void))v93;
  sub_2443B9450();
  swift_release();
  uint64_t v113 = *(unsigned __int8 **)(v59 + 8);
  uint64_t v114 = v59 + 8;
  ((void (*)(char *, uint64_t))v113)(v60, v62);
  (*(void (**)(uint64_t (*)(), uint64_t (*)(void)))(v91 + 8))(v64, v65);
  if (qword_268E37B70 != -1) {
    swift_once();
  }
  uint64_t v66 = __swift_project_value_buffer(v62, (uint64_t)qword_268E76FF0);
  ((void (*)(char *, uint64_t, uint64_t))v92)(v60, v66, v62);
  uint64_t v110 = type metadata accessor for PhotoGridView;
  uint64_t v67 = v106;
  uint64_t v68 = v104;
  sub_24439565C(v106, v104, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  uint64_t v69 = swift_allocObject();
  uint64_t v70 = v90;
  uint64_t v109 = (uint64_t (*)(void))type metadata accessor for PhotoGridView;
  sub_2443954F8(v68, v69 + v90, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  uint64_t v117 = v65;
  uint64_t v118 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v71 = v98;
  uint64_t v72 = v97;
  uint64_t v73 = v111;
  sub_2443B9450();
  swift_release();
  ((void (*)(char *, uint64_t))v113)(v60, v112);
  (*(void (**)(char *, uint64_t))(v96 + 8))(v73, v72);
  sub_24439565C(v67, v68, (uint64_t (*)(void))v110);
  uint64_t v74 = swift_allocObject();
  sub_2443954F8(v68, v74 + v70, v109);
  uint64_t v75 = v101;
  uint64_t v76 = (uint64_t)v95;
  uint64_t v77 = v102;
  (*(void (**)(char *, char *, uint64_t))(v101 + 16))(v95, v71, v102);
  uint64_t v78 = (uint64_t (**)())(v76 + *(int *)(v94 + 36));
  *uint64_t v78 = sub_244392D5C;
  v78[1] = (uint64_t (*)())v74;
  v78[2] = 0;
  v78[3] = 0;
  (*(void (**)(char *, uint64_t))(v75 + 8))(v71, v77);
  return sub_243EA697C(v76, v107, &qword_268E475C0);
}

uint64_t sub_24438AFEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v80 = a2;
  uint64_t v3 = sub_2443B8450();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v94 = (uint64_t)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v92 = (uint64_t)&v75 - v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v75 - v9;
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47620);
  uint64_t v86 = *(void *)(v87 - 8);
  MEMORY[0x270FA5388](v87);
  uint64_t v83 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47610) - 8;
  MEMORY[0x270FA5388](v85);
  uint64_t v84 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47600) - 8;
  MEMORY[0x270FA5388](v91);
  unint64_t v82 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E475F0);
  MEMORY[0x270FA5388](v93);
  uint64_t v90 = (uint64_t)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E475E0);
  MEMORY[0x270FA5388](v76);
  uint64_t v79 = (uint64_t)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E475C8);
  MEMORY[0x270FA5388](v78);
  uint64_t v77 = (uint64_t)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2443B73D0();
  uint64_t v81 = sub_2443899B8(v17);
  uint64_t v18 = type metadata accessor for PhotoGridView();
  sub_2440D27EC((uint64_t)v10);
  uint64_t v89 = a1 + *(int *)(v18 + 20);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  sub_2443B9BF0();
  swift_release();
  sub_243E9DDBC((uint64_t)v10, &qword_268E3EA10);
  uint64_t v95 = a1;
  sub_2443B8150();
  LODWORD(v98) = 0;
  sub_2443955F4(&qword_268E38F20, MEMORY[0x263F19D28]);
  sub_2443BBA80();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E47660);
  sub_244393968();
  uint64_t v19 = v83;
  sub_2443B9FE0();
  uint64_t v20 = (long long *)(a1 + *(int *)(v18 + 28));
  uint64_t v21 = (uint64_t)v82;
  uint64_t v22 = *((void *)v20 + 2);
  long long v96 = *v20;
  uint64_t v97 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E39828);
  sub_2443B98F0();
  uint64_t v23 = v98;
  uint64_t v24 = v99;
  uint64_t v25 = v100;
  uint64_t v26 = v101;
  uint64_t v27 = (void *)swift_allocObject();
  v27[2] = v23;
  v27[3] = v24;
  v27[4] = v25;
  v27[5] = v26;
  uint64_t v28 = v86;
  uint64_t v29 = (uint64_t)v84;
  uint64_t v30 = v87;
  (*(void (**)(char *, char *, uint64_t))(v86 + 16))(v84, v19, v87);
  char v31 = (void *)(v29 + *(int *)(v85 + 44));
  *char v31 = sub_243EB2340;
  v31[1] = 0;
  v31[2] = sub_244129DFC;
  v31[3] = v27;
  (*(void (**)(char *, uint64_t))(v28 + 8))(v19, v30);
  LOBYTE(v27) = sub_2443B8AF0();
  uint64_t v32 = v92;
  sub_2440D27EC(v92);
  sub_2443B9BF0();
  swift_release();
  sub_243E9DDBC(v32, &qword_268E3EA10);
  sub_2443B6E30();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  sub_243E9DD58(v29, v21, &qword_268E47610);
  uint64_t v41 = v21 + *(int *)(v91 + 44);
  *(unsigned char *)uint64_t v41 = (_BYTE)v27;
  *(void *)(v41 + 8) = v34;
  *(void *)(v41 + 16) = v36;
  *(void *)(v41 + 24) = v38;
  *(void *)(v41 + 32) = v40;
  *(unsigned char *)(v41 + 40) = 0;
  sub_243E9DDBC(v29, &qword_268E47610);
  LOBYTE(v30) = sub_2443B8B00();
  unsigned __int8 v42 = sub_2443B8AD0();
  char v43 = sub_2443B8B20();
  sub_2443B8B20();
  if (sub_2443B8B20() != v30) {
    char v43 = sub_2443B8B20();
  }
  sub_2443B8B20();
  if (sub_2443B8B20() != v42) {
    char v43 = sub_2443B8B20();
  }
  uint64_t v44 = v94;
  sub_2440D27EC(v94);
  sub_2443B9BF0();
  swift_release();
  sub_243E9DDBC(v44, &qword_268E3EA10);
  sub_2443B6E30();
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v53 = v90;
  sub_243E9DD58(v21, v90, &qword_268E47600);
  uint64_t v54 = v53 + *(int *)(v93 + 36);
  *(unsigned char *)uint64_t v54 = v43;
  *(void *)(v54 + 8) = v46;
  *(void *)(v54 + 16) = v48;
  *(void *)(v54 + 24) = v50;
  *(void *)(v54 + 32) = v52;
  *(unsigned char *)(v54 + 40) = 0;
  sub_243E9DDBC(v21, &qword_268E47600);
  uint64_t v87 = sub_2443B9F10();
  sub_2443B9BF0();
  uint64_t v55 = v98;
  swift_getKeyPath();
  uint64_t v56 = v55 + OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel___observationRegistrar;
  uint64_t v98 = v55;
  uint64_t v94 = sub_2443955F4(&qword_268E38C38, (void (*)(uint64_t))type metadata accessor for PhotoGridViewModel);
  uint64_t v92 = v56;
  sub_2443B55F0();
  swift_release();
  uint64_t v93 = v55;
  unint64_t v57 = *(void *)(v55 + OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__assets);
  uint64_t v98 = MEMORY[0x263F8EE78];
  if (v57 >> 62)
  {
LABEL_21:
    swift_bridgeObjectRetain();
    uint64_t v58 = sub_2443BB510();
    uint64_t v59 = &qword_268E3B000;
    if (v58) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v58 = *(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    uint64_t v59 = &qword_268E3B000;
    if (v58)
    {
LABEL_7:
      unint64_t v60 = 0;
      uint64_t v91 = v59[144];
      while (1)
      {
        if ((v57 & 0xC000000000000001) != 0)
        {
          uint64_t v62 = MEMORY[0x24568E4B0](v60, v57);
          uint64_t v61 = v62;
          unint64_t v63 = v60 + 1;
          if (__OFADD__(v60, 1))
          {
LABEL_18:
            __break(1u);
LABEL_19:
            uint64_t v65 = v98;
            goto LABEL_23;
          }
        }
        else
        {
          if (v60 >= *(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_21;
          }
          uint64_t v61 = *(void *)(v57 + 8 * v60 + 32);
          uint64_t v62 = swift_retain();
          unint64_t v63 = v60 + 1;
          if (__OFADD__(v60, 1)) {
            goto LABEL_18;
          }
        }
        MEMORY[0x270FA5388](v62);
        sub_243EB156C(0, (unint64_t *)&qword_268E3EE00);
        swift_getKeyPath();
        *(void *)&long long v96 = v61;
        sub_243E9DC94((unint64_t *)&qword_268E41D80, &qword_268E3EB20);
        sub_2443B55F0();
        swift_release();
        if ((*(unsigned char *)(v61 + *(void *)(*(void *)v61 + 208)) & 1) != 0
          || (swift_getKeyPath(),
              uint64_t v64 = v93,
              *(void *)&long long v96 = v93,
              sub_2443B55F0(),
              swift_release(),
              (*(unsigned char *)(v64 + v91) & 1) == 0))
        {
          sub_2443BB3A0();
          sub_2443BB3E0();
          sub_2443BB3F0();
          sub_2443BB3B0();
        }
        else
        {
          swift_release();
        }
        ++v60;
        if (v63 == v58) {
          goto LABEL_19;
        }
      }
    }
  }
  uint64_t v65 = MEMORY[0x263F8EE78];
LABEL_23:
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v66 = v90;
  uint64_t v67 = v79;
  sub_243E9DD58(v90, v79, &qword_268E475F0);
  uint64_t v68 = (uint64_t *)(v67 + *(int *)(v76 + 36));
  *uint64_t v68 = v87;
  v68[1] = v65;
  sub_243E9DDBC(v66, &qword_268E475F0);
  uint64_t v69 = sub_2443B9F10();
  sub_2443B9BF0();
  uint64_t v70 = v98;
  swift_getKeyPath();
  uint64_t v98 = v70;
  sub_2443B55F0();
  swift_release();
  char v71 = *(unsigned char *)(v70 + OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__filterFavorites);
  swift_release();
  uint64_t v72 = v77;
  sub_243E9DD58(v67, v77, &qword_268E475E0);
  uint64_t v73 = v72 + *(int *)(v78 + 36);
  *(void *)uint64_t v73 = v69;
  *(unsigned char *)(v73 + 8) = v71;
  sub_243E9DDBC(v67, &qword_268E475E0);
  return sub_243EA697C(v72, v80, &qword_268E475C8);
}

uint64_t sub_24438BB80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PhotoGridView();
  uint64_t v33 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v33 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47660);
  uint64_t v32 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v31 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  sub_2443B9BF0();
  uint64_t v9 = v34;
  swift_getKeyPath();
  uint64_t v34 = v9;
  sub_2443955F4(&qword_268E38C38, (void (*)(uint64_t))type metadata accessor for PhotoGridViewModel);
  sub_2443B55F0();
  swift_release();
  int v10 = *(unsigned __int8 *)(v9 + OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__filterFavorites);
  swift_getKeyPath();
  if (v10 != 1)
  {
    uint64_t v34 = v9;
    sub_2443B55F0();
    swift_release();
    uint64_t v19 = *(void *)(v9 + OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__gridElementViewModels);
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v20 = a2;
    uint64_t v14 = v33;
LABEL_18:
    uint64_t v38 = v19;
    swift_getKeyPath();
    sub_24439565C(a1, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
    unint64_t v21 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v22 = swift_allocObject();
    sub_2443954F8((uint64_t)v6, v22 + v21, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E421A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E47680);
    sub_243E9DC94(&qword_268E47688, &qword_268E421A0);
    sub_2443955F4((unint64_t *)&qword_268E3C060, MEMORY[0x263F07508]);
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47670);
    uint64_t v24 = sub_243E9DC94(&qword_268E47678, &qword_268E47670);
    uint64_t v34 = v23;
    uint64_t v35 = MEMORY[0x263F8D310];
    uint64_t v36 = v24;
    uint64_t v37 = MEMORY[0x263F8D320];
    swift_getOpaqueTypeConformance2();
    uint64_t v25 = v31;
    sub_2443B9B50();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v32 + 32))(v20, v25, v7);
  }
  uint64_t v29 = v7;
  uint64_t v30 = a2;
  uint64_t v34 = v9;
  sub_2443B55F0();
  swift_release();
  unint64_t v11 = *(void *)(v9 + OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__gridElementViewModels);
  uint64_t v34 = MEMORY[0x263F8EE78];
  if (!(v11 >> 62))
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v14 = v33;
    if (v12) {
      goto LABEL_4;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v19 = MEMORY[0x263F8EE78];
LABEL_17:
    swift_release();
    uint64_t v7 = v29;
    uint64_t v20 = v30;
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2443BB510();
  uint64_t v12 = result;
  uint64_t v14 = v33;
  if (!result) {
    goto LABEL_16;
  }
LABEL_4:
  if (v12 >= 1)
  {
    v26[1] = v5;
    uint64_t v27 = a1;
    uint64_t v28 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    for (uint64_t i = 0; i != v12; ++i)
    {
      if ((v11 & 0xC000000000000001) != 0)
      {
        uint64_t v16 = MEMORY[0x24568E4B0](i, v11);
        uint64_t v17 = v16;
      }
      else
      {
        uint64_t v17 = *(void *)(v11 + 8 * i + 32);
        uint64_t v16 = swift_retain();
      }
      uint64_t v18 = *(void *)(v17 + 16);
      MEMORY[0x270FA5388](v16);
      sub_243EB156C(0, (unint64_t *)&qword_268E3EE00);
      swift_getKeyPath();
      uint64_t v38 = v18;
      sub_243E9DC94((unint64_t *)&qword_268E41D80, &qword_268E3EB20);
      sub_2443B55F0();
      swift_release();
      if (*(unsigned char *)(v18 + *(void *)(*(void *)v18 + 208)) == 1)
      {
        sub_2443BB3A0();
        sub_2443BB3E0();
        sub_2443BB3F0();
        sub_2443BB3B0();
      }
      else
      {
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v14 = v33;
    uint64_t v19 = v34;
    a1 = v27;
    uint64_t v6 = v28;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_24438C1B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v109 = a2;
  uint64_t v4 = sub_2443B54B0();
  uint64_t v106 = *(void *)(v4 - 8);
  uint64_t v107 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v108 = (char *)v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2443B7EC0();
  uint64_t v103 = *(void *)(v6 - 8);
  uint64_t v104 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v102 = (char *)v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v101 = (char *)v79 - v9;
  uint64_t v10 = type metadata accessor for PhotoGridView();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v105 = v10 - 8;
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v92 = (uint64_t)v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v85 = (uint64_t)v79 - v14;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v79 - v16;
  uint64_t v19 = v18;
  uint64_t v94 = v18;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)v79 - v21;
  uint64_t v91 = (uint64_t)v79 - v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47690);
  uint64_t v99 = *(void *)(v23 - 8);
  uint64_t v100 = v23;
  MEMORY[0x270FA5388](v23);
  uint64_t v95 = (char *)v79 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47698) - 8;
  MEMORY[0x270FA5388](v98);
  long long v96 = (char *)v79 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47670);
  MEMORY[0x270FA5388](v113);
  uint64_t v97 = (char *)v79 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = *v2;
  sub_24439565C((uint64_t)v2, (uint64_t)v22, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  uint64_t v93 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v27 = v93 | 7;
  uint64_t v28 = (v93 + 16) & ~v93;
  unint64_t v29 = (v19 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v79[1] = v29 + 8;
  uint64_t v80 = v28;
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = v30 + v28;
  uint64_t v32 = v30;
  uint64_t v89 = v30;
  sub_2443954F8((uint64_t)v22, v31, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  *(void *)(v32 + v29) = a1;
  uint64_t v110 = type metadata accessor for PhotoGridView;
  sub_24439565C((uint64_t)v2, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  uint64_t v111 = v27;
  uint64_t v33 = swift_allocObject();
  uint64_t v87 = v33;
  uint64_t v34 = v80;
  uint64_t v112 = type metadata accessor for PhotoGridView;
  sub_2443954F8((uint64_t)v17, v33 + v80, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  *(void *)(v33 + v29) = a1;
  uint64_t v35 = (uint64_t)v2;
  uint64_t v36 = v85;
  sub_24439565C((uint64_t)v2, v85, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  uint64_t v37 = swift_allocObject();
  uint64_t v86 = v37;
  sub_2443954F8(v36, v37 + v34, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  uint64_t v38 = a1;
  *(void *)(v37 + v29) = a1;
  swift_retain_n();
  LOBYTE(v117) = 0;
  swift_retain_n();
  sub_2443B98C0();
  uint64_t v85 = *((void *)&v130 + 1);
  LOBYTE(v114) = v130;
  uint64_t KeyPath = swift_getKeyPath();
  char v116 = 0;
  uint64_t v83 = swift_getKeyPath();
  *(void *)&long long v117 = a1;
  type metadata accessor for PhotoGridElementViewModel();
  swift_retain();
  sub_2443B98C0();
  uint64_t v81 = *((void *)&v130 + 1);
  uint64_t v39 = v130;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E3BE30);
  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_2443C51A0;
  *(void *)(v40 + 32) = v38;
  *(void *)&long long v130 = v40;
  sub_2443BA7E0();
  uint64_t v41 = v130;
  uint64_t v42 = v92;
  char v43 = v110;
  sub_24439565C(v35, v92, (uint64_t (*)(void))v110);
  uint64_t v44 = swift_allocObject();
  sub_2443954F8(v42, v44 + v34, (uint64_t (*)(void))v112);
  *(void *)(v44 + v29) = v41;
  *(void *)&long long v130 = v90;
  *((void *)&v130 + 1) = v39;
  *(void *)&long long v131 = v81;
  BYTE8(v131) = v114;
  *(void *)&long long v132 = v85;
  *((void *)&v132 + 1) = KeyPath;
  LOBYTE(v133) = v116;
  *((void *)&v133 + 1) = v83;
  LOBYTE(v134) = 0;
  *((void *)&v134 + 1) = v41;
  *(void *)&long long v135 = sub_2443941CC;
  *((void *)&v135 + 1) = v44;
  LOBYTE(v136) = 0;
  *((void *)&v136 + 1) = sub_244393DD8;
  *(void *)&long long v137 = v89;
  *((void *)&v137 + 1) = sub_244393E08;
  *(void *)&long long v138 = v87;
  *((void *)&v138 + 1) = sub_244393E38;
  *(void *)&long long v139 = v86;
  *((void *)&v139 + 1) = sub_244391CA0;
  *(void *)&long long v140 = 0;
  *((void *)&v140 + 1) = sub_244391CEC;
  *(void *)&long long v141 = 0;
  *((void *)&v141 + 1) = sub_244391D38;
  uint64_t v142 = 0;
  long long v123 = v136;
  long long v124 = v137;
  uint64_t v129 = 0;
  long long v127 = v140;
  long long v128 = v141;
  long long v125 = v138;
  long long v126 = v139;
  long long v121 = v134;
  long long v122 = v135;
  long long v119 = v132;
  long long v120 = v133;
  long long v117 = v130;
  long long v118 = v131;
  uint64_t v45 = v35;
  uint64_t v88 = v35;
  uint64_t v46 = v91;
  sub_24439565C(v35, v91, (uint64_t (*)(void))v43);
  sub_2443BA950();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v47 = sub_2443BA940();
  uint64_t v48 = (v93 + 32) & ~v93;
  v94 += v48;
  unint64_t v49 = (v94 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v50 = swift_allocObject();
  uint64_t v51 = MEMORY[0x263F8F500];
  *(void *)(v50 + 16) = v47;
  *(void *)(v50 + 24) = v51;
  uint64_t v52 = v46;
  uint64_t v53 = v46;
  uint64_t v54 = v112;
  sub_2443954F8(v53, v50 + v48, (uint64_t (*)(void))v112);
  *(void *)(v50 + v49) = v38;
  sub_24439565C(v45, v52, (uint64_t (*)(void))v110);
  uint64_t v55 = sub_2443BA940();
  uint64_t v56 = swift_allocObject();
  *(void *)(v56 + 16) = v55;
  *(void *)(v56 + 24) = MEMORY[0x263F8F500];
  sub_2443954F8(v52, v56 + v48, (uint64_t (*)(void))v54);
  sub_2443B9B00();
  uint64_t v82 = v38;
  swift_retain();
  unint64_t v57 = v95;
  sub_244389614();
  swift_release();
  swift_release();
  swift_release();
  sub_2443948CC((uint64_t)&v130);
  uint64_t v58 = v101;
  sub_2443B7EB0();
  uint64_t v59 = v103;
  uint64_t v60 = v104;
  (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v102, v58, v104);
  sub_2443955F4(&qword_268E39010, MEMORY[0x263F196B8]);
  uint64_t v61 = v60;
  uint64_t v62 = sub_2443B7370();
  uint64_t v63 = v99;
  uint64_t v64 = (uint64_t)v96;
  uint64_t v65 = v57;
  uint64_t v66 = v57;
  uint64_t v67 = v100;
  (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v96, v65, v100);
  *(void *)(v64 + *(int *)(v98 + 44)) = v62;
  (*(void (**)(char *, uint64_t))(v59 + 8))(v58, v61);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v66, v67);
  uint64_t v68 = *(void *)(v82 + 16) + *(void *)(**(void **)(v82 + 16) + 160);
  uint64_t v69 = (uint64_t)v97;
  uint64_t v71 = v106;
  uint64_t v70 = v107;
  uint64_t v72 = *(void (**)(char *, uint64_t, uint64_t))(v106 + 16);
  v72(&v97[*(int *)(v113 + 52)], v68, v107);
  sub_243EA697C(v64, v69, &qword_268E47698);
  LOBYTE(v59) = *(unsigned char *)(v88 + *(int *)(v105 + 56) + 8);
  uint64_t v73 = swift_retain();
  sub_2440D4870(v73, v59);
  swift_release();
  uint64_t v74 = v108;
  v72(v108, v68, v70);
  uint64_t v75 = v74;
  sub_2443B5460();
  uint64_t v114 = 0x6E61725464697247;
  unint64_t v115 = 0xEF2D6E6F69746973;
  sub_2443BA5F0();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v76 = v114;
  unint64_t v77 = v115;
  (*(void (**)(char *, uint64_t))(v71 + 8))(v75, v70);
  uint64_t v114 = v76;
  unint64_t v115 = v77;
  sub_243E9DC94(&qword_268E47678, &qword_268E47670);
  sub_2443B92E0();
  swift_bridgeObjectRelease();
  return sub_243E9DDBC(v69, &qword_268E47670);
}

uint64_t sub_24438CCD4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_2443B7690();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  return result;
}

uint64_t sub_24438CD04(CGFloat *a1, CGFloat *a2)
{
  CGFloat v2 = a1[1];
  CGFloat rect = *a1;
  CGFloat v3 = a1[2];
  CGFloat v4 = a1[3];
  CGFloat v5 = *a2;
  CGFloat v6 = a2[1];
  CGFloat v7 = a2[2];
  CGFloat v8 = a2[3];
  v13.origin.x = *a2;
  v13.origin.y = v6;
  v13.size.width = v7;
  v13.size.height = v8;
  double MinY = CGRectGetMinY(v13);
  v14.origin.x = rect;
  v14.origin.y = v2;
  v14.size.width = v3;
  v14.size.height = v4;
  BOOL v10 = CGRectGetMinY(v14) <= MinY;
  return sub_24438CDA8(v10, v5, v6, v7, v8);
}

uint64_t sub_24438CDA8(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat MaxY)
{
  uint64_t v6 = v5;
  LODWORD(v81) = a1;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BD50);
  MEMORY[0x270FA5388](v11 - 8);
  CGRect v13 = (char *)v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E4F8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3B430);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)v78 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (uint64_t)v78 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for PhotoGridView();
  uint64_t v24 = v5 + *(int *)(v23 + 28);
  uint64_t v25 = *(void *)(v24 + 16);
  long long v89 = *(_OWORD *)v24;
  uint64_t v90 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E39828);
  uint64_t result = sub_2443B98D0();
  double v27 = v84;
  if (v84 <= 0.0) {
    return result;
  }
  uint64_t v28 = v5 + *(int *)(v23 + 20);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  uint64_t v80 = v28;
  sub_2443B9BF0();
  uint64_t v29 = v89;
  swift_getKeyPath();
  *(void *)&long long v89 = v29;
  uint64_t v82 = sub_2443955F4(&qword_268E38C38, (void (*)(uint64_t))type metadata accessor for PhotoGridViewModel);
  sub_2443B55F0();
  swift_release();
  unint64_t v30 = *(void *)(v29 + OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__gridElementViewModels);
  swift_bridgeObjectRetain();
  swift_release();
  if (v30 >> 62) {
    goto LABEL_80;
  }
  uint64_t v31 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_4:
  uint64_t result = swift_bridgeObjectRelease();
  if (v31 < 1) {
    return result;
  }
  v91.origin.x = a2;
  v91.origin.y = a3;
  v91.size.width = a4;
  v91.size.height = MaxY;
  double MinY = CGRectGetMinY(v91);
  v92.origin.x = a2;
  v92.origin.y = a3;
  v92.size.width = a4;
  v92.size.height = MaxY;
  MaxY = CGRectGetMaxY(v92);
  uint64_t v33 = (CGFloat *)(v6 + *(int *)(v23 + 56));
  a4 = *v33;
  double v34 = v33[1];
  sub_2440D27EC(v22);
  sub_2443B9BF0();
  int v35 = *(unsigned __int8 *)(v89 + 24);
  swift_release();
  if (!v35) {
    a4 = v34;
  }
  sub_243E9DDBC(v22, &qword_268E3EA10);
  if (MinY - a4 > 0.0) {
    a3 = MinY - a4;
  }
  else {
    a3 = 0.0;
  }
  uint64_t v6 = sub_2443898E0(v27);
  sub_2443B9BF0();
  uint64_t v36 = v89;
  swift_getKeyPath();
  *(void *)&long long v89 = v36;
  sub_2443B55F0();
  swift_release();
  unint64_t v37 = *(void *)(v36 + OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__gridElementViewModels);
  swift_bridgeObjectRetain();
  swift_release();
  if (v37 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_2443BB510();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v38 = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (__OFSUB__(v38, 1))
  {
    __break(1u);
    goto LABEL_83;
  }
  if (!v6)
  {
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  if (v38 == 0x8000000000000001 && v6 == -1) {
    goto LABEL_99;
  }
  double v39 = (v27 + a4) / (double)v6;
  double v27 = a3 / v39;
  if (a3 / v39 <= -9.22337204e18) {
    goto LABEL_84;
  }
  if (v27 >= 9.22337204e18)
  {
LABEL_85:
    __break(1u);
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  double v40 = (MaxY - a4) / v39;
  if ((*(void *)&v27 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&v40 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_86;
  }
  if (v40 <= -9.22337204e18)
  {
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  if (v40 >= 9.22337204e18)
  {
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  uint64_t v79 = v14;
  if ((v38 - 1) / v6 >= (uint64_t)v40) {
    uint64_t v14 = (uint64_t)v40;
  }
  else {
    uint64_t v14 = (v38 - 1) / v6;
  }
  sub_2443B9BF0();
  uint64_t v42 = v89;
  swift_getKeyPath();
  *(void *)&long long v89 = v42;
  sub_2443B55F0();
  swift_release();
  unint64_t v43 = *(void *)(v42 + OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__gridElementViewModels);
  swift_bridgeObjectRetain();
  swift_release();
  if (!(v43 >> 62))
  {
    uint64_t v44 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_29;
  }
LABEL_89:
  swift_bridgeObjectRetain();
  uint64_t v44 = sub_2443BB510();
  swift_bridgeObjectRelease();
LABEL_29:
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v45 = v44 - 1;
  if (__OFSUB__(v44, 1))
  {
    __break(1u);
    goto LABEL_91;
  }
  uint64_t v46 = (uint64_t)v27;
  uint64_t v47 = (uint64_t)v27 * v6;
  if ((unsigned __int128)((uint64_t)v27 * (__int128)v6) >> 64 != v47 >> 63)
  {
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  uint64_t v48 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  uint64_t v49 = v48 * v6;
  if ((unsigned __int128)(v48 * (__int128)v6) >> 64 != (v48 * v6) >> 63)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  uint64_t v50 = v49 - 1;
  if (__OFSUB__(v49, 1))
  {
LABEL_94:
    __break(1u);
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  if (v45 >= v50) {
    uint64_t v51 = v49 - 1;
  }
  else {
    uint64_t v51 = v44 - 1;
  }
  BOOL v52 = __OFSUB__(v14, v46);
  uint64_t v53 = v14 - v46;
  if (v52) {
    goto LABEL_95;
  }
  uint64_t v54 = v53 + 1;
  if (__OFADD__(v53, 1))
  {
LABEL_96:
    __break(1u);
    goto LABEL_97;
  }
  uint64_t v55 = v54 * v6;
  if ((unsigned __int128)(v54 * (__int128)v6) >> 64 != (v54 * v6) >> 63)
  {
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  if (v55 + 0x4000000000000000 < 0)
  {
LABEL_98:
    __break(1u);
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  uint64_t v56 = 2 * v55;
  if (v81)
  {
    uint64_t v14 = v79;
    if (v45 <= v50) {
      return result;
    }
    if (!__OFADD__(v51, v56))
    {
      uint64_t v22 = v51 + 1;
      if (v45 >= v51 + v56) {
        uint64_t v57 = v51 + v56;
      }
      else {
        uint64_t v57 = v44 - 1;
      }
      if (v57 >= v22) {
        goto LABEL_53;
      }
      return result;
    }
LABEL_101:
    __break(1u);
    return result;
  }
  uint64_t v57 = v47 - 1;
  uint64_t v14 = v79;
  if (v47 < 1) {
    return result;
  }
  if (__OFSUB__(v47, v56))
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  uint64_t v22 = (v47 - v56) & ~((v47 - v56) >> 63);
  if (v57 >= v22)
  {
LABEL_53:
    v78[1] = MEMORY[0x263F8EE60] + 8;
    uint64_t v81 = v57;
    while (1)
    {
      sub_2443B9BF0();
      uint64_t v23 = v89;
      swift_getKeyPath();
      *(void *)&long long v89 = v23;
      sub_2443B55F0();
      swift_release();
      uint64_t v58 = *(void *)(v23 + OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__gridElementViewModels);
      swift_bridgeObjectRetain();
      swift_release();
      if ((v58 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x24568E4B0](v22, v58);
      }
      else
      {
        if (v22 < 0)
        {
          __break(1u);
LABEL_78:
          __break(1u);
LABEL_79:
          __break(1u);
LABEL_80:
          swift_bridgeObjectRetain();
          uint64_t v31 = sub_2443BB510();
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        if ((unint64_t)v22 >= *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_78;
        }
        uint64_t v6 = *(void *)(v58 + 8 * v22 + 32);
        swift_retain();
      }
      swift_bridgeObjectRelease();
      uint64_t v59 = *(void **)(v6 + 16);
      uint64_t v60 = (char *)v59 + *(void *)(*v59 + 160);
      uint64_t v61 = *(void *)(v59[7] + 16);
      uint64_t v62 = sub_2443B54B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 16))(v16, v60, v62);
      v16[*(int *)(v14 + 36)] = 0;
      swift_beginAccess();
      uint64_t v63 = *(void *)(v61 + 16);
      if (!*(void *)(v63 + 16)) {
        goto LABEL_61;
      }
      unint64_t v64 = sub_2441973A0((uint64_t)v16);
      if (v65)
      {
        uint64_t v66 = *(void *)(*(void *)(v63 + 56) + 8 * v64);
        swift_endAccess();
        uint64_t v67 = (void *)swift_retain();
        sub_244079248(v67);
        uint64_t v68 = v66 + *(void *)(*(void *)v66 + 112);
        swift_beginAccess();
        sub_24439565C(v68, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for PlaygroundImage);
        swift_release();
        uint64_t v69 = type metadata accessor for PlaygroundImage();
        uint64_t v23 = (v69 - 8) & 0xFFFFFFFFFFFFLL | 0x2E3F000000000000;
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v19, 0, 1, v69);
      }
      else
      {
LABEL_61:
        swift_endAccess();
        uint64_t v69 = type metadata accessor for PlaygroundImage();
        uint64_t v23 = (v69 - 8) & 0xFFFFFFFFFFFFLL | 0x2E3F000000000000;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v19, 1, 1, v69);
      }
      sub_243E9DDBC((uint64_t)v16, &qword_268E3E4F8);
      type metadata accessor for PlaygroundImage();
      int v70 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v69 - 8) + 48))(v19, 1, v69);
      sub_243E9DDBC((uint64_t)v19, &qword_268E3B430);
      if (v70 == 1) {
        break;
      }
      uint64_t result = swift_release();
LABEL_72:
      if (v81 == v22) {
        return result;
      }
      BOOL v52 = __OFADD__(v22++, 1);
      if (v52) {
        goto LABEL_79;
      }
    }
    uint64_t v71 = sub_2443BA9E0();
    uint64_t v72 = *(void *)(v71 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v72 + 56))(v13, 1, 1, v71);
    sub_2443BA950();
    swift_retain();
    uint64_t v73 = sub_2443BA940();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v73;
    *(void *)(v23 + 24) = MEMORY[0x263F8F500];
    *(void *)(v23 + 32) = v6;
    *(unsigned char *)(v23 + 40) = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v72 + 48))(v13, 1, v71) == 1)
    {
      sub_243E9DDBC((uint64_t)v13, &qword_268E3BD50);
      if (*(void *)(v23 + 16))
      {
LABEL_65:
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v74 = sub_2443BA8E0();
        uint64_t v76 = v75;
        swift_unknownObjectRelease();
LABEL_69:
        uint64_t v77 = swift_allocObject();
        *(void *)(v77 + 16) = &unk_268E47658;
        *(void *)(v77 + 24) = v23;
        if (v76 | v74)
        {
          uint64_t v85 = 0;
          uint64_t v86 = 0;
          uint64_t v87 = v74;
          uint64_t v88 = v76;
        }
        swift_task_create();
        swift_release();
        uint64_t result = swift_release();
        uint64_t v14 = v79;
        goto LABEL_72;
      }
    }
    else
    {
      sub_2443BA9D0();
      (*(void (**)(char *, uint64_t))(v72 + 8))(v13, v71);
      if (*(void *)(v23 + 16)) {
        goto LABEL_65;
      }
    }
    uint64_t v74 = 0;
    uint64_t v76 = 0;
    goto LABEL_69;
  }
  return result;
}

uint64_t sub_24438D930()
{
  return swift_release();
}

uint64_t sub_24438D9A4()
{
  return sub_2443B7910();
}

uint64_t sub_24438DA58(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v41 = sub_2443BA180();
  uint64_t v44 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  double v40 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2443BA1A0();
  uint64_t v42 = *(void *)(v3 - 8);
  uint64_t v43 = v3;
  MEMORY[0x270FA5388](v3);
  double v39 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_2443B7920();
  uint64_t v5 = *(void *)(v31 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v31);
  unint64_t v30 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_2443B7020();
  uint64_t v7 = *(void *)(v29 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v29);
  uint64_t v9 = sub_2443BA1E0();
  uint64_t v33 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  double v34 = (char *)&v28 - v14;
  sub_243EB156C(0, (unint64_t *)&qword_268E41420);
  uint64_t v36 = sub_2443BAD80();
  sub_2443BA1C0();
  MEMORY[0x24568D380](v12, 0.2);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v35 = v10 + 8;
  v32(v12, v9);
  uint64_t v15 = v29;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v37, v29);
  uint64_t v17 = v30;
  uint64_t v16 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v30, v38, v31);
  unint64_t v18 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v19 = (v8 + *(unsigned __int8 *)(v5 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v20 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v20 + v18, (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v20 + v19, v17, v16);
  aBlock[4] = sub_2443936A8;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244102010;
  aBlock[3] = &block_descriptor_35;
  uint64_t v21 = _Block_copy(aBlock);
  swift_release();
  uint64_t v22 = v39;
  sub_2443BA190();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2443955F4((unint64_t *)&qword_268E3A140, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E44A60);
  sub_243E9DC94((unint64_t *)&qword_268E3A150, &qword_268E44A60);
  uint64_t v23 = v40;
  uint64_t v24 = v41;
  sub_2443BB200();
  uint64_t v25 = v34;
  uint64_t v26 = (void *)v36;
  MEMORY[0x24568DEF0](v34, v22, v23, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v44 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v22, v43);
  return ((uint64_t (*)(char *, uint64_t))v32)(v25, v33);
}

uint64_t sub_24438DFD8()
{
  type metadata accessor for PhotoGridView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  sub_2443B9BF0();
  swift_getKeyPath();
  sub_2443955F4(&qword_268E38C38, (void (*)(uint64_t))type metadata accessor for PhotoGridViewModel);
  sub_2443B55F0();
  swift_release();
  unint64_t v0 = *(void *)(v7 + OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__gridElementViewModels);
  swift_bridgeObjectRetain();
  swift_release();
  if (v0 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v1 = sub_2443BB510();
    swift_bridgeObjectRelease();
    if (!v1) {
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v1 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v1) {
      return swift_bridgeObjectRelease();
    }
  }
  unint64_t v2 = v1 - 1;
  if (__OFSUB__(v1, 1))
  {
    __break(1u);
  }
  else if ((v0 & 0xC000000000000001) == 0)
  {
    if ((v2 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v2 < *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v3 = *(void *)(v0 + 8 * v2 + 32);
      swift_retain();
      goto LABEL_8;
    }
    __break(1u);
LABEL_20:
    uint64_t result = sub_2443BB510();
    if (result) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
  uint64_t v3 = MEMORY[0x24568E4B0](v2, v0);
LABEL_8:
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v3 + 16);
  swift_retain();
  swift_release();
  sub_2443B9BF0();
  swift_getKeyPath();
  sub_2443B55F0();
  swift_release();
  swift_retain();
  unint64_t v5 = swift_bridgeObjectRetain();
  unint64_t v0 = sub_243F8D51C(v5, v4);
  swift_bridgeObjectRelease();
  swift_release();
  if (v0 >> 62) {
    goto LABEL_20;
  }
  uint64_t result = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!result)
  {
LABEL_21:
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
LABEL_10:
  if ((v0 & 0xC000000000000001) != 0)
  {
    MEMORY[0x24568E4B0](0, v0);
    goto LABEL_13;
  }
  if (*(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_13:
    swift_bridgeObjectRelease();
    sub_2442CC974();
    swift_release();
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_24438E2A8()
{
  uint64_t v0 = sub_2443B8530();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PhotoGridView();
  sub_2440D6234((uint64_t)v3);
  sub_2443B8520();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_24438E38C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1 + *(int *)(type metadata accessor for PhotoGridView() + 40);
  uint64_t v4 = *(void *)v3;
  char v5 = *(unsigned char *)(v3 + 8);
  sub_243EB1808(*(void *)v3, v5);
  sub_2440D43B8(v4, v5, &v30);
  uint64_t result = sub_243EB18F8(v4, v5);
  if (v30 == 3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E38AC0);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_2443C34A0;
    uint64_t v8 = self;
    MEMORY[0x24568C8B0](objc_msgSend(v8, sel_systemBackgroundColor));
    uint64_t v9 = sub_2443B96C0();
    swift_release();
    *(void *)(v7 + 32) = v9;
    MEMORY[0x24568C8B0](objc_msgSend(v8, sel_systemBackgroundColor));
    uint64_t v10 = sub_2443B96C0();
    swift_release();
    *(void *)(v7 + 40) = v10;
    MEMORY[0x24568C8B0](objc_msgSend(v8, sel_systemBackgroundColor));
    uint64_t v11 = sub_2443B96C0();
    swift_release();
    *(void *)(v7 + 48) = v11;
    uint64_t v30 = v7;
    sub_2443BA7E0();
    uint64_t v12 = v30;
    sub_2443BA0D0();
    sub_2443BA0E0();
    MEMORY[0x24568CE60](v12);
    sub_2443B7620();
    uint64_t v13 = v25;
    uint64_t v14 = v26;
    uint64_t v15 = v27;
    uint64_t v16 = v28;
    uint64_t v17 = v29;
    uint64_t v18 = sub_2443B78B0();
    LOBYTE(v8) = sub_2443B8AE0();
    sub_2443B9E40();
    uint64_t result = sub_2443B72C0();
    uint64_t v19 = v30;
    uint64_t v20 = v31;
    uint64_t v21 = v32;
    uint64_t v22 = v33;
    uint64_t v23 = v8;
    long long v24 = v34;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v23 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    long long v24 = 0uLL;
  }
  *(void *)a2 = v13;
  *(void *)(a2 + 8) = v14;
  *(void *)(a2 + 16) = v15;
  *(void *)(a2 + 24) = v16;
  *(void *)(a2 + 32) = v17;
  *(void *)(a2 + 40) = v18;
  *(void *)(a2 + 48) = v23;
  *(void *)(a2 + 56) = v19;
  *(void *)(a2 + 64) = v20;
  *(void *)(a2 + 72) = v21;
  *(void *)(a2 + 80) = v22;
  *(_OWORD *)(a2 + 88) = v24;
  *(unsigned char *)(a2 + 104) = 0;
  return result;
}

uint64_t sub_24438E5F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47558);
  uint64_t v53 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  BOOL v52 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2443B83E0();
  uint64_t v55 = *(void *)(v5 - 8);
  uint64_t v56 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v54 = (char *)&v51 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47548);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v58 = (char *)&v51 - v14;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47538);
  MEMORY[0x270FA5388](v60);
  uint64_t v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v51 - v18;
  uint64_t v20 = type metadata accessor for PhotoGridView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  sub_2443B9BF0();
  uint64_t v21 = v61;
  if (v61[24])
  {
    swift_getKeyPath();
    uint64_t v59 = a2;
    uint64_t v61 = v21;
    sub_2443955F4(&qword_268E38C38, (void (*)(uint64_t))type metadata accessor for PhotoGridViewModel);
    sub_2443B55F0();
    swift_release();
    int v22 = v21[OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__viewIsEnabled];
    swift_release();
    if (v22 == 1)
    {
      char v23 = *(unsigned char *)(a1 + *(int *)(v20 + 36) + 8);
      uint64_t v24 = swift_retain();
      uint64_t v51 = sub_2440D2C64(v24, v23);
      swift_release();
      swift_getKeyPath();
      if (qword_268E37B88 != -1) {
        swift_once();
      }
      uint64_t v61 = off_268E419D8;
      sub_2443955F4((unint64_t *)&qword_268E399D0, (void (*)(uint64_t))type metadata accessor for DebugSettings);
      sub_2443B55F0();
      swift_retain();
      if (os_variant_has_internal_ui())
      {
        if (qword_268E379F8 != -1) {
          swift_once();
        }
        uint64_t v25 = qword_268E3D2A8;
        uint64_t v26 = (void *)sub_2443BA4B0();
        LOBYTE(v25) = objc_msgSend((id)v25, sel_BOOLForKey_, v26);
        swift_release();
        swift_release();
        swift_release();

        if (v25)
        {
          uint64_t v27 = v54;
          sub_2443B8390();
          uint64_t v28 = (*(uint64_t (**)(char *, char *, uint64_t))(v55 + 16))(v7, v27, v56);
          uint64_t v51 = (uint64_t)&v51;
          MEMORY[0x270FA5388](v28);
          *(&v51 - 2) = a1;
          __swift_instantiateConcreteTypeFromMangledName(&qword_268E47578);
          uint64_t v29 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E3F570);
          uint64_t v30 = sub_243E9DC94(&qword_268E3F578, &qword_268E3F570);
          unint64_t v31 = sub_2443921DC();
          uint64_t v61 = (unsigned char *)v29;
          uint64_t v62 = &type metadata for ToolbarItemToggleStyle;
          uint64_t v63 = v30;
          unint64_t v64 = v31;
          swift_getOpaqueTypeConformance2();
          uint64_t v32 = v52;
          sub_2443B7080();
          uint64_t v33 = sub_243E9DC94(&qword_268E47560, &qword_268E47558);
          long long v34 = (unsigned char *)v57;
          MEMORY[0x24568B620](v32, v57, v33);
          uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47570);
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v12, 0, 1, v35);
          uint64_t v61 = v34;
          uint64_t v62 = (ValueMetadata *)v33;
          uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
          uint64_t v37 = v58;
          MEMORY[0x24568B650](v12, v35, OpaqueTypeConformance2);
          sub_243E9DDBC((uint64_t)v12, &qword_268E47548);
          (*(void (**)(char *, unsigned char *))(v53 + 8))(v32, v34);
          (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
LABEL_14:
          unint64_t v46 = sub_244392094();
          MEMORY[0x24568B620](v37, v10, v46);
          uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47568);
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v16, 0, 1, v47);
          uint64_t v61 = (unsigned char *)v10;
          uint64_t v62 = (ValueMetadata *)v46;
          uint64_t v48 = swift_getOpaqueTypeConformance2();
          MEMORY[0x24568B650](v16, v47, v48);
          sub_243E9DDBC((uint64_t)v16, &qword_268E47538);
          uint64_t v41 = &qword_268E47548;
          uint64_t v42 = (uint64_t)v37;
          goto LABEL_15;
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47570);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v12, 1, 1, v43);
      uint64_t v44 = sub_243E9DC94(&qword_268E47560, &qword_268E47558);
      uint64_t v61 = (unsigned char *)v57;
      uint64_t v62 = (ValueMetadata *)v44;
      uint64_t v45 = swift_getOpaqueTypeConformance2();
      uint64_t v37 = v58;
      MEMORY[0x24568B650](v12, v43, v45);
      sub_243E9DDBC((uint64_t)v12, &qword_268E47548);
      goto LABEL_14;
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47568);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v16, 1, 1, v38);
  unint64_t v39 = sub_244392094();
  uint64_t v61 = (unsigned char *)v10;
  uint64_t v62 = (ValueMetadata *)v39;
  uint64_t v40 = swift_getOpaqueTypeConformance2();
  MEMORY[0x24568B650](v16, v38, v40);
  uint64_t v41 = &qword_268E47538;
  uint64_t v42 = (uint64_t)v16;
LABEL_15:
  sub_243E9DDBC(v42, v41);
  unint64_t v49 = sub_244391FEC();
  MEMORY[0x24568B620](v19, v60, v49);
  return sub_243E9DDBC((uint64_t)v19, &qword_268E47538);
}

uint64_t sub_24438EEF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F570);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for PhotoGridView();
  sub_2443B9C00();
  swift_getKeyPath();
  sub_2443B9C20();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v12 = a1;
  sub_2443B9A50();
  sub_243E9DC94(&qword_268E3F578, &qword_268E3F570);
  sub_2443921DC();
  sub_2443B8FB0();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_24438F134@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for PhotoGridView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  sub_2443B9BF0();
  swift_getKeyPath();
  sub_2443955F4(&qword_268E38C38, (void (*)(uint64_t))type metadata accessor for PhotoGridViewModel);
  sub_2443B55F0();
  swift_release();
  swift_release();
  sub_2443B7FC0();
  uint64_t result = sub_2443B8E10();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_24438F2A8()
{
  return swift_release();
}

uint64_t sub_24438F374(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BD50);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E3BE30);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2443C51A0;
  *(void *)(v6 + 32) = a2;
  uint64_t v14 = v6;
  sub_2443BA7E0();
  uint64_t v7 = v14;
  uint64_t v8 = sub_2443BA9E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_2443BA950();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_2443BA940();
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = v7;
  sub_243EACE30((uint64_t)v5, (uint64_t)&unk_268E476D0, (uint64_t)v10);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_24438F4E0(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E3BE30);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2443C51A0;
  *(void *)(inited + 32) = a2;
  unint64_t v6 = inited;
  sub_2443BA7E0();
  swift_retain();
  uint64_t v4 = sub_244388A6C(v6);
  sub_243FD4674(v4);
  swift_bridgeObjectRelease();
  type metadata accessor for PhotoGridView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E476B0);
  sub_2443B98E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24438F5BC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 232) = a5;
  *(void *)(v6 + 240) = a6;
  *(unsigned char *)(v6 + 512) = a4;
  *(void *)(v6 + 248) = sub_2443BA950();
  *(void *)(v6 + 256) = sub_2443BA940();
  uint64_t v8 = sub_2443BA8E0();
  *(void *)(v6 + 264) = v8;
  *(void *)(v6 + 272) = v7;
  return MEMORY[0x270FA2498](sub_24438F65C, v8, v7);
}

uint64_t sub_24438F65C()
{
  if (*(unsigned char *)(v0 + 512) == 1)
  {
    unint64_t v1 = *(void *)(v0 + 232);
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_2443BB510();
      *(void *)(v0 + 280) = v3;
      if (v3)
      {
LABEL_4:
        uint64_t v5 = *(void *)(v0 + 232);
        if ((v5 & 0xC000000000000001) != 0)
        {
          uint64_t v6 = MEMORY[0x24568E4B0](0);
        }
        else
        {
          if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return MEMORY[0x270FA2498](v3, v5, v4);
          }
          uint64_t v6 = swift_retain();
        }
        *(void *)(v0 + 288) = v6;
        *(void *)(v0 + 296) = 1;
        *(void *)(v0 + 304) = *(void *)(v6 + 16);
        swift_retain();
        *(void *)(v0 + 312) = sub_2443BA940();
        uint64_t v7 = sub_2443BA8E0();
        uint64_t v4 = v8;
        *(void *)(v0 + 320) = v7;
        *(void *)(v0 + 328) = v8;
        uint64_t v3 = (uint64_t)sub_24438F7C8;
        uint64_t v5 = v7;
        return MEMORY[0x270FA2498](v3, v5, v4);
      }
    }
    else
    {
      uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v3 = swift_bridgeObjectRetain();
      *(void *)(v0 + 280) = v2;
      if (v2) {
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRelease();
  }
  swift_release();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_24438F7C8()
{
  uint64_t v1 = v0[38];
  swift_beginAccess();
  uint64_t v2 = *(void **)(v1 + 80);
  v0[42] = v2;
  if (v2)
  {
    uint64_t v10 = (uint64_t (*)(uint64_t))((char *)&dword_268E44848 + dword_268E44848);
    id v3 = v2;
    uint64_t v4 = (void *)swift_task_alloc();
    v0[43] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_24438F914;
    return v10((uint64_t)v3);
  }
  else
  {
    swift_release();
    sub_24407F97C();
    uint64_t v6 = swift_allocError();
    *uint64_t v7 = 0;
    swift_willThrow();
    v0[63] = v6;
    uint64_t v8 = v0[33];
    uint64_t v9 = v0[34];
    return MEMORY[0x270FA2498](sub_244390664, v8, v9);
  }
}

uint64_t sub_24438F914(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 352) = a1;
  *(void *)(v4 + 360) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 328);
  uint64_t v6 = *(void *)(v3 + 320);
  if (v1) {
    uint64_t v7 = sub_24438FEC8;
  }
  else {
    uint64_t v7 = sub_24438FA58;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_24438FA58()
{
  uint64_t v1 = (void *)v0[42];
  swift_release();
  swift_release();

  uint64_t v2 = v0[33];
  uint64_t v3 = v0[34];
  return MEMORY[0x270FA2498](sub_24438FACC, v2, v3);
}

uint64_t sub_24438FACC()
{
  uint64_t v1 = *(void *)(v0 + 352);
  type metadata accessor for PhotoGridView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  sub_2443B9BF0();
  id v2 = sub_24416DDA4();
  swift_release();
  uint64_t v3 = *(void *)(v1 + 16);
  *(void *)(v0 + 368) = v3;
  if (v3)
  {
    uint64_t v4 = (unint64_t *)(*(void *)(v0 + 352) + 56);
    while (1)
    {
      unint64_t v5 = v4[5];
      if (v5 >> 61 == 4) {
        break;
      }
      v4 += 11;
      if (!--v3) {
        goto LABEL_5;
      }
    }
    uint64_t v7 = *(v4 - 3);
    unint64_t v40 = *(v4 - 2);
    uint64_t v38 = *(v4 - 1);
    uint64_t v36 = v4[1];
    unint64_t v37 = *v4;
    uint64_t v8 = v4[3];
    unint64_t v35 = v4[2];
    uint64_t v9 = v4[4];
    id v34 = v2;
    id v10 = v2;
    swift_bridgeObjectRetain();
    uint64_t v32 = v9;
    uint64_t v33 = v8;
    sub_243EE0C3C(v7, v40, v38, v37, v36, v35, v8, v9, v5);
    id v31 = v10;
    uint64_t v11 = sub_2443031E8();
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12)
    {
      uint64_t v13 = type metadata accessor for CharacterAsset();
      unint64_t v14 = v11
          + ((*(unsigned __int8 *)(*(void *)(v13 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v13 - 8) + 80));
      uint64_t v39 = *(void *)(*(void *)(v13 - 8) + 72);
      while (1)
      {
        if (*(unsigned char *)(v14 + *(int *)(v13 + 20)) == 3)
        {
          unint64_t v15 = 0xEB00000000646569;
          uint64_t v16 = 0x6669636570736E75;
        }
        else
        {
          uint64_t v16 = sub_2443B6360();
          unint64_t v15 = v17;
        }
        type metadata accessor for CharacterRecipe();
        _s15ImagePlayground0A16GenerationPersonV8SkinToneV2idSSvg_0();
        *(void *)(v0 + 192) = v16;
        *(void *)(v0 + 200) = v15;
        swift_bridgeObjectRetain();
        sub_2443BA5F0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (*(void *)(v0 + 192) == v7 && v40 == *(void *)(v0 + 200))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_19;
        }
        char v18 = sub_2443BB7D0();
        swift_bridgeObjectRelease();
        if (v18) {
          break;
        }
        v14 += v39;
        if (!--v12)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          char v6 = 0;
          goto LABEL_20;
        }
      }
      swift_bridgeObjectRelease();
LABEL_19:
      swift_bridgeObjectRelease();
      char v6 = 1;
LABEL_20:
      id v2 = v34;
      uint64_t v20 = v38;
      uint64_t v22 = v36;
      unint64_t v21 = v37;
      unint64_t v23 = v35;
      uint64_t v24 = v32;
      uint64_t v19 = v33;
      uint64_t v25 = v31;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v6 = 0;
      uint64_t v19 = v8;
      id v2 = v34;
      uint64_t v20 = v38;
      uint64_t v22 = v36;
      unint64_t v21 = v37;
      unint64_t v23 = v35;
      uint64_t v25 = v31;
      uint64_t v24 = v9;
    }
    sub_243EE0EB4(v7, v40, v20, v21, v22, v23, v19, v24, v5);
  }
  else
  {
LABEL_5:
    char v6 = 0;
  }
  *(unsigned char *)(v0 + 513) = v6;

  sub_2443B9BF0();
  id v26 = sub_24416DDA4();
  *(void *)(v0 + 376) = v26;
  swift_release();
  id v27 = v26;
  *(void *)(v0 + 384) = sub_2443BA940();
  uint64_t v29 = sub_2443BA8E0();
  *(void *)(v0 + 392) = v29;
  *(void *)(v0 + 400) = v28;
  return MEMORY[0x270FA2498](sub_24438FF3C, v29, v28);
}

uint64_t sub_24438FEC8()
{
  uint64_t v1 = (void *)v0[42];
  swift_release();

  v0[63] = v0[45];
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[34];
  return MEMORY[0x270FA2498](sub_244390664, v2, v3);
}

uint64_t sub_24438FF3C()
{
  uint64_t v1 = *(void *)(v0 + 368);
  if (v1)
  {
    uint64_t v2 = (unint64_t *)(*(void *)(v0 + 352) + 56);
    while (1)
    {
      unint64_t v3 = v2[5];
      *(void *)(v0 + 408) = v3;
      if (v3 >> 61 == 4) {
        break;
      }
      v2 += 11;
      if (!--v1) {
        goto LABEL_5;
      }
    }
    uint64_t v7 = *(v2 - 3);
    *(void *)(v0 + 416) = v7;
    uint64_t v8 = v7;
    uint64_t v19 = v7;
    unint64_t v9 = *(v2 - 2);
    *(void *)(v0 + 424) = v9;
    uint64_t v10 = *(v2 - 1);
    *(void *)(v0 + 432) = v10;
    unint64_t v11 = *v2;
    *(void *)(v0 + 440) = *v2;
    uint64_t v12 = v2[1];
    *(void *)(v0 + 448) = v12;
    unint64_t v13 = v2[2];
    *(void *)(v0 + 456) = v13;
    uint64_t v14 = v2[3];
    *(void *)(v0 + 464) = v14;
    uint64_t v15 = v2[4];
    *(void *)(v0 + 472) = v15;
    *(void *)(v0 + 480) = v2[6];
    *(void *)(v0 + 488) = v2[7];
    unint64_t v18 = v9;
    sub_243EE0C3C(v8, v9, v10, v11, v12, v13, v14, v15, v3);
    sub_243EE0C3C(v19, v18, v10, v11, v12, v13, v14, v15, v3);
    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 496) = v16;
    void *v16 = v0;
    v16[1] = sub_244390418;
    return sub_24430A310(v19, v18);
  }
  else
  {
LABEL_5:
    uint64_t v4 = *(void **)(v0 + 376);
    swift_release();

    *(unsigned char *)(v0 + 514) = 2;
    uint64_t v5 = *(void *)(v0 + 264);
    uint64_t v6 = *(void *)(v0 + 272);
    return MEMORY[0x270FA2498](sub_244390130, v5, v6);
  }
}

uint64_t sub_244390130()
{
  unint64_t v1 = sub_2440FE0B8(0, 2, *((void *)v0 + 44), *((unsigned __int8 *)v0 + 513), *((unsigned __int8 *)v0 + 514));
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  char v7 = v6;
  swift_bridgeObjectRelease();
  *((void *)v0 + 16) = &type metadata for Analytics.ImageInteractionPayload;
  *((void *)v0 + 17) = &off_26F90B8A8;
  uint64_t v8 = swift_allocObject();
  *((void *)v0 + 13) = v8;
  *(_WORD *)(v8 + 16) = v1;
  *(unsigned char *)(v8 + 18) = BYTE2(v1) & 1;
  *(unsigned char *)(v8 + 19) = BYTE3(v1) & 1;
  *(unsigned char *)(v8 + 20) = BYTE4(v1) & 1;
  *(unsigned char *)(v8 + 21) = BYTE5(v1);
  *(void *)(v8 + 24) = v3;
  *(void *)(v8 + 32) = v5;
  *(unsigned char *)(v8 + 40) = v7;
  unint64_t v9 = (void *)sub_2443BA4B0();
  sub_243EC0740((uint64_t)v0 + 104, (uint64_t)(v0 + 4));
  uint64_t v10 = swift_allocObject();
  sub_243EC06D8(v0 + 4, v10 + 16);
  *((void *)v0 + 6) = sub_243F9C880;
  *((void *)v0 + 7) = v10;
  *((void *)v0 + 2) = MEMORY[0x263EF8330];
  *((void *)v0 + 3) = 1107296256;
  *((void *)v0 + 4) = sub_243F9BEA0;
  *((void *)v0 + 5) = &block_descriptor_108;
  unint64_t v11 = _Block_copy(v0 + 1);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v11);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v0 + 104);
  uint64_t v12 = (uint64_t (*)())swift_release();
  unint64_t v14 = *((void *)v0 + 37);
  if (v14 != *((void *)v0 + 35))
  {
    uint64_t v17 = *((void *)v0 + 29);
    if ((v17 & 0xC000000000000001) != 0)
    {
      uint64_t v12 = (uint64_t (*)())MEMORY[0x24568E4B0](*((void *)v0 + 37));
    }
    else
    {
      if (v14 >= *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_14;
      }
      uint64_t v12 = (uint64_t (*)())swift_retain();
    }
    *((void *)v0 + 36) = v12;
    *((void *)v0 + 37) = v14 + 1;
    if (!__OFADD__(v14, 1))
    {
      *((void *)v0 + 38) = *((void *)v12 + 2);
      swift_retain();
      *((void *)v0 + 39) = sub_2443BA940();
      uint64_t v18 = sub_2443BA8E0();
      uint64_t v13 = v19;
      *((void *)v0 + 40) = v18;
      *((void *)v0 + 41) = v19;
      uint64_t v12 = sub_24438F7C8;
      uint64_t v17 = v18;
      return MEMORY[0x270FA2498](v12, v17, v13);
    }
    __break(1u);
LABEL_14:
    __break(1u);
    return MEMORY[0x270FA2498](v12, v17, v13);
  }
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v15 = (uint64_t (*)(void))*((void *)v0 + 1);
  return v15();
}

uint64_t sub_244390418(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(*v1 + 515) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 400);
  uint64_t v4 = *(void *)(v2 + 392);
  return MEMORY[0x270FA2498](sub_244390540, v4, v3);
}

uint64_t sub_244390540()
{
  char v13 = *(unsigned char *)(v0 + 515);
  unint64_t v1 = *(void *)(v0 + 456);
  uint64_t v14 = *(void *)(v0 + 464);
  unint64_t v2 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 448);
  unint64_t v4 = *(void *)(v0 + 424);
  uint64_t v5 = *(void *)(v0 + 432);
  unint64_t v6 = *(void *)(v0 + 408);
  uint64_t v7 = *(void *)(v0 + 416);
  uint64_t v11 = *(void *)(v0 + 472);
  uint64_t v12 = *(void **)(v0 + 376);
  swift_release();
  sub_243EE0EB4(v7, v4, v5, v2, v3, v1, v14, v11, v6);
  sub_243EE0EB4(v7, v4, v5, v2, v3, v1, v14, v11, v6);

  *(unsigned char *)(v0 + 514) = v13;
  uint64_t v8 = *(void *)(v0 + 264);
  uint64_t v9 = *(void *)(v0 + 272);
  return MEMORY[0x270FA2498](sub_244390130, v8, v9);
}

uint64_t sub_244390664()
{
  uint64_t v22 = v0;
  swift_release();
  if (qword_268E377F8 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)v0[63];
  uint64_t v2 = sub_2443B6800();
  __swift_project_value_buffer(v2, (uint64_t)qword_268E39090);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2443B67E0();
  os_log_type_t v6 = sub_2443BAD10();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[63];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v21 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_getErrorValue();
    uint64_t v11 = sub_2443BB8F0();
    *(void *)(v9 + 4) = sub_243F2D034(v11, v12, &v21);
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_243E89000, v5, v6, "Failed to get recipe for asset with error: %s", (uint8_t *)v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24568FCC0](v10, -1, -1);
    MEMORY[0x24568FCC0](v9, -1, -1);

    swift_release();
  }
  else
  {
    swift_release();
  }
  unint64_t v15 = v0[37];
  if (v15 != v0[35])
  {
    uint64_t v18 = v0[29];
    if ((v18 & 0xC000000000000001) != 0)
    {
      char v13 = (uint64_t (*)())MEMORY[0x24568E4B0](v0[37]);
    }
    else
    {
      if (v15 >= *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_19;
      }
      char v13 = (uint64_t (*)())swift_retain();
    }
    v0[36] = v13;
    v0[37] = v15 + 1;
    if (!__OFADD__(v15, 1))
    {
      v0[38] = *((void *)v13 + 2);
      swift_retain();
      v0[39] = sub_2443BA940();
      uint64_t v19 = sub_2443BA8E0();
      uint64_t v14 = v20;
      v0[40] = v19;
      v0[41] = v20;
      char v13 = sub_24438F7C8;
      uint64_t v18 = v19;
      return MEMORY[0x270FA2498](v13, v18, v14);
    }
    __break(1u);
LABEL_19:
    __break(1u);
    return MEMORY[0x270FA2498](v13, v18, v14);
  }
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_24439096C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v53 = type metadata accessor for DisplayableImage();
  uint64_t v7 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v9 = (uint64_t *)((char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E476F0);
  uint64_t v50 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v49 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E476F8);
  MEMORY[0x270FA5388](v48);
  char v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47700);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v47 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_2443BB510();
    uint64_t v51 = v10;
    uint64_t v52 = v14;
    if (v17) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v20 = MEMORY[0x263F8EE78];
    goto LABEL_14;
  }
  uint64_t v17 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v51 = v10;
  uint64_t v52 = v14;
  if (!v17) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v45 = a3;
  uint64_t v54 = MEMORY[0x263F8EE78];
  uint64_t result = sub_243F23408(0, v17 & ~(v17 >> 63), 0);
  if (v17 < 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v42 = v16;
  uint64_t v43 = v13;
  uint64_t v44 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = v54;
  unint64_t v21 = a1 & 0xC000000000000001;
  unint64_t v22 = a1;
  do
  {
    if (v21)
    {
      uint64_t v23 = MEMORY[0x24568E4B0](v19, a1);
    }
    else
    {
      uint64_t v23 = *(void *)(a1 + 8 * v19 + 32);
      swift_retain();
    }
    *uint64_t v9 = *(void *)(v23 + 16);
    swift_storeEnumTagMultiPayload();
    swift_retain();
    swift_release();
    uint64_t v54 = v20;
    unint64_t v25 = *(void *)(v20 + 16);
    unint64_t v24 = *(void *)(v20 + 24);
    if (v25 >= v24 >> 1)
    {
      sub_243F23408(v24 > 1, v25 + 1, 1);
      uint64_t v20 = v54;
    }
    ++v19;
    *(void *)(v20 + 16) = v25 + 1;
    sub_2443954F8((uint64_t)v9, v20+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v25, (uint64_t (*)(void))type metadata accessor for DisplayableImage);
    a1 = v22;
  }
  while (v17 != v19);
  swift_bridgeObjectRelease();
  char v13 = v43;
  a4 = v44;
  uint64_t v16 = v42;
  a3 = v45;
LABEL_14:
  uint64_t v54 = v20;
  id v26 = (void *)swift_allocObject();
  uint64_t v27 = v46;
  void v26[2] = a1;
  v26[3] = v27;
  v26[4] = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E47708);
  sub_243E9DC94(&qword_268E47710, &qword_268E47708);
  sub_2443955F4(&qword_268E3EDD8, (void (*)(uint64_t))type metadata accessor for DisplayableImage);
  uint64_t v28 = v49;
  sub_2443BA040();
  if (qword_268E37938 != -1) {
    swift_once();
  }
  uint64_t v29 = qword_268E76D28;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v54 = v29;
  swift_retain_n();
  uint64_t v31 = sub_2443B72D0();
  uint64_t v33 = v50;
  uint64_t v32 = v51;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v13, v28, v51);
  swift_release();
  id v34 = (uint64_t *)&v13[*(int *)(v48 + 36)];
  *id v34 = KeyPath;
  v34[1] = v31;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v32);
  uint64_t v35 = v52;
  if (v47)
  {
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_2443BB510();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v36 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  BOOL v37 = v36 == 0;
  uint64_t v38 = swift_getKeyPath();
  uint64_t v39 = swift_allocObject();
  *(unsigned char *)(v39 + 16) = v37;
  sub_243E9DD58((uint64_t)v13, (uint64_t)v16, &qword_268E476F8);
  unint64_t v40 = (uint64_t *)&v16[*(int *)(v35 + 36)];
  *unint64_t v40 = v38;
  v40[1] = (uint64_t)sub_243F1D3CC;
  v40[2] = v39;
  sub_243E9DDBC((uint64_t)v13, &qword_268E476F8);
  return sub_243EA697C((uint64_t)v16, a4, &qword_268E47700);
}

uint64_t sub_244390FA0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DisplayableImage();
  MEMORY[0x270FA5388](v2);
  id v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2443B7FC0();
  sub_24439565C(a1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for DisplayableImage);
  sub_2443955F4(&qword_268E3EDD8, (void (*)(uint64_t))type metadata accessor for DisplayableImage);
  return sub_2443B71C0();
}

uint64_t sub_2443910C0@<X0>(uint64_t a1@<X8>)
{
  return sub_24439096C(*(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), a1);
}

uint64_t sub_2443910CC(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PhotoGridView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BD50);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2443BA9E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  sub_24439565C(a2, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  sub_2443BA950();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_2443BA940();
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8F500];
  *(void *)(v16 + 16) = v14;
  *(void *)(v16 + 24) = v17;
  *(unsigned char *)(v16 + 32) = a1;
  *(void *)(v16 + 40) = a3;
  sub_2443954F8((uint64_t)v9, v16 + v15, (uint64_t (*)(void))type metadata accessor for PhotoGridView);
  sub_243EACE30((uint64_t)v12, (uint64_t)&unk_268E476C0, v16);
  return swift_release();
}

uint64_t sub_2443912C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  v4[4] = type metadata accessor for PlaygroundImage();
  v4[5] = swift_task_alloc();
  v4[6] = sub_2443BA950();
  v4[7] = sub_2443BA940();
  uint64_t v6 = sub_2443BA8E0();
  unsigned char v4[8] = v6;
  v4[9] = v5;
  return MEMORY[0x270FA2498](sub_24439138C, v6, v5);
}

uint64_t sub_24439138C()
{
  v0[2] = MEMORY[0x263F8EE78];
  unint64_t v1 = v0[3];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2443BB510();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  sub_244393474(v2, 0);
  sub_2443BA7E0();
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_2443BB510();
    uint64_t v3 = v4;
    v0[10] = v4;
    if (v4) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v4 = swift_bridgeObjectRetain();
    v0[10] = v3;
    if (v3)
    {
LABEL_5:
      if (v3 < 1)
      {
        __break(1u);
      }
      else
      {
        uint64_t v7 = v0[3];
        v0[11] = 0;
        if ((v7 & 0xC000000000000001) != 0) {
          uint64_t v8 = MEMORY[0x24568E4B0](0);
        }
        else {
          uint64_t v8 = swift_retain();
        }
        v0[12] = v8;
        v0[13] = *(void *)(v8 + 16);
        swift_retain();
        v0[14] = sub_2443BA940();
        uint64_t v13 = sub_2443BA8E0();
        uint64_t v6 = v14;
        v0[15] = v13;
        v0[16] = v14;
        uint64_t v4 = (uint64_t)sub_2443915C4;
        uint64_t v5 = v13;
      }
      return MEMORY[0x270FA2498](v4, v5, v6);
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  id v9 = objc_msgSend(self, sel_generalPasteboard);
  sub_243EB156C(0, &qword_268E3C1B0);
  uint64_t v10 = (void *)sub_2443BA7A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setImages_, v10);

  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_2443915C4()
{
  uint64_t v1 = sub_2443BA940();
  v0[17] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[18] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2443916A8;
  uint64_t v3 = v0[13];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2360](v4, v1, v6, 0xD000000000000010, 0x80000002443ED510, sub_2440B00A8, v3, v5);
}

uint64_t sub_2443916A8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 120);
    uint64_t v4 = *(void *)(v2 + 128);
    uint64_t v5 = sub_244391A6C;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 120);
    uint64_t v4 = *(void *)(v2 + 128);
    uint64_t v5 = sub_2443917C4;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_2443917C4()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  return MEMORY[0x270FA2498](sub_244391830, v1, v2);
}

uint64_t sub_244391830()
{
  uint64_t v1 = v0[5];
  sub_243F28BEC();
  uint64_t v3 = v2;
  sub_244395498(v1, (uint64_t (*)(void))type metadata accessor for PlaygroundImage);
  id v4 = v3;
  MEMORY[0x24568D920]();
  if (*(void *)((v0[2] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v0[2] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2443BA810();
  }
  sub_2443BA870();
  sub_2443BA7E0();

  swift_release();
  uint64_t v5 = v0[11] + 1;
  if (v5 == v0[10])
  {
    swift_bridgeObjectRelease();
    swift_release();
    id v6 = objc_msgSend(self, sel_generalPasteboard);
    sub_243EB156C(0, &qword_268E3C1B0);
    uint64_t v7 = (void *)sub_2443BA7A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setImages_, v7);

    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
  else
  {
    v0[11] = v5;
    if ((v0[3] & 0xC000000000000001) != 0) {
      uint64_t v10 = MEMORY[0x24568E4B0]();
    }
    else {
      uint64_t v10 = swift_retain();
    }
    v0[12] = v10;
    v0[13] = *(void *)(v10 + 16);
    swift_retain();
    v0[14] = sub_2443BA940();
    uint64_t v12 = sub_2443BA8E0();
    v0[15] = v12;
    v0[16] = v11;
    return MEMORY[0x270FA2498](sub_2443915C4, v12, v11);
  }
}

uint64_t sub_244391A6C()
{
  uint64_t v1 = (void *)v0[19];
  swift_release();
  swift_release();

  swift_release();
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  return MEMORY[0x270FA2498](sub_244391AF8, v2, v3);
}

uint64_t sub_244391AF8()
{
  swift_release();
  uint64_t v1 = v0[11] + 1;
  if (v1 == v0[10])
  {
    swift_bridgeObjectRelease();
    swift_release();
    id v2 = objc_msgSend(self, sel_generalPasteboard);
    sub_243EB156C(0, &qword_268E3C1B0);
    uint64_t v3 = (void *)sub_2443BA7A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setImages_, v3);

    swift_task_dealloc();
    id v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    v0[11] = v1;
    if ((v0[3] & 0xC000000000000001) != 0) {
      uint64_t v6 = MEMORY[0x24568E4B0]();
    }
    else {
      uint64_t v6 = swift_retain();
    }
    v0[12] = v6;
    v0[13] = *(void *)(v6 + 16);
    swift_retain();
    v0[14] = sub_2443BA940();
    uint64_t v8 = sub_2443BA8E0();
    v0[15] = v8;
    v0[16] = v7;
    return MEMORY[0x270FA2498](sub_2443915C4, v8, v7);
  }
}

void sub_244391CA0()
{
}

void sub_244391CEC()
{
}

void sub_244391D38()
{
}

uint64_t sub_244391D84@<X0>(uint64_t a1@<X3>, unsigned char *a2@<X8>)
{
  type metadata accessor for PhotoGridView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E476B0);
  sub_2443B98D0();
  LOBYTE(a1) = sub_244273CB4(*(void *)(a1 + 16) + *(void *)(**(void **)(a1 + 16) + 160), v5);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = a1 & 1;
  return result;
}

unsigned char *sub_244391E28(unsigned char *result)
{
  if ((*result & 1) == 0)
  {
    type metadata accessor for PhotoGridView();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E476B0);
    return (unsigned char *)sub_2443B98E0();
  }
  return result;
}

uint64_t sub_244391EA0@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for PhotoGridView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_244389E60(a1, v6, a2);
}

uint64_t sub_244391F20@<X0>(uint64_t a1@<X8>)
{
  return sub_24438E5F8(*(void *)(v1 + 16), a1);
}

unint64_t sub_244391F28()
{
  unint64_t result = qword_268E47510;
  if (!qword_268E47510)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47500);
    sub_243E9DC94(&qword_268E47518, &qword_268E47520);
    sub_243E9DC94(&qword_268E47528, &qword_268E47530);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47510);
  }
  return result;
}

unint64_t sub_244391FEC()
{
  unint64_t result = qword_268E47540;
  if (!qword_268E47540)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47538);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47548);
    sub_244392094();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47540);
  }
  return result;
}

unint64_t sub_244392094()
{
  unint64_t result = qword_268E47550;
  if (!qword_268E47550)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47548);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47558);
    sub_243E9DC94(&qword_268E47560, &qword_268E47558);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47550);
  }
  return result;
}

uint64_t sub_244392168(uint64_t a1)
{
  return a1;
}

uint64_t sub_2443921A0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_244389090(a1, &OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__viewIsEnabled, a2);
}

uint64_t sub_2443921D4()
{
  return sub_24438EEF0(*(void *)(v0 + 16));
}

unint64_t sub_2443921DC()
{
  unint64_t result = qword_268E47580;
  if (!qword_268E47580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47580);
  }
  return result;
}

uint64_t sub_244392230@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_244389090(a1, &OBJC_IVAR____TtC15ImagePlayground18PhotoGridViewModel__filterFavorites, a2);
}

uint64_t sub_24439225C@<X0>(uint64_t a1@<X8>)
{
  return sub_24438F134(a1);
}

uint64_t sub_244392264()
{
  return sub_243F83E70(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_244392284()
{
  uint64_t v1 = (int *)type metadata accessor for PhotoGridView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v15 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v3 = sub_2443B73F0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v0 + ((v2 + 16) & ~v2);
  uint64_t v7 = v6 + v1[5];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_243EB18F8(*(void *)(v6 + v1[10]), *(unsigned char *)(v6 + v1[10] + 8));
  uint64_t v9 = v6 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2443B8640();
    uint64_t v11 = *(void *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v12 = v6 + v1[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F4C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_2443B8530();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + ((((v2 + 16) & ~v2) + v15 + v5) & ~v5), v3);

  return swift_deallocObject();
}

uint64_t sub_2443925B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for PhotoGridView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(sub_2443B73F0() - 8);
  uint64_t v9 = v2 + ((v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));

  return sub_24438A05C(a1, v2 + v6, v9, a2);
}

uint64_t sub_244392698@<X0>(uint64_t a1@<X8>)
{
  return sub_24438AFEC(*(void *)(v1 + 16), a1);
}

unint64_t sub_2443926A0()
{
  unint64_t result = qword_268E475D0;
  if (!qword_268E475D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E475C8);
    sub_244392740();
    sub_243E9DC94(&qword_268E3A470, &qword_268E3A478);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E475D0);
  }
  return result;
}

unint64_t sub_244392740()
{
  unint64_t result = qword_268E475D8;
  if (!qword_268E475D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E475E0);
    sub_24439282C(&qword_268E475E8, &qword_268E475F0, (void (*)(void))sub_244392804);
    sub_243E9DC94(&qword_268E47628, &qword_268E47630);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E475D8);
  }
  return result;
}

uint64_t sub_244392804()
{
  return sub_24439282C(&qword_268E475F8, &qword_268E47600, (void (*)(void))sub_2443928AC);
}

uint64_t sub_24439282C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2443928AC()
{
  unint64_t result = qword_268E47608;
  if (!qword_268E47608)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47610);
    sub_243E9DC94(&qword_268E47618, &qword_268E47620);
    sub_243E9DC94(&qword_268E3D1B8, &qword_268E3D1C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47608);
  }
  return result;
}

uint64_t sub_244392974(CGFloat *a1, CGFloat *a2)
{
  type metadata accessor for PhotoGridView();

  return sub_24438CD04(a1, a2);
}

uint64_t sub_244392A00()
{
  sub_2443B7920();

  return sub_24438D930();
}

unint64_t sub_244392A80()
{
  unint64_t result = qword_268E47648;
  if (!qword_268E47648)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E475A0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47590);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47588);
    type metadata accessor for CGRect(255);
    sub_243E9DC94(&qword_268E47638, &qword_268E47588);
    sub_2443955F4(&qword_268E47640, type metadata accessor for CGRect);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47648);
  }
  return result;
}

uint64_t objectdestroy_24Tm_0()
{
  uint64_t v1 = sub_2443B7920();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);

  return swift_deallocObject();
}

uint64_t sub_244392C74(uint64_t a1)
{
  return sub_244392CD0(a1, MEMORY[0x263F18E88], sub_24438DA58);
}

uint64_t sub_244392CA4(uint64_t a1)
{
  return sub_244392CD0(a1, (uint64_t (*)(void))type metadata accessor for PhotoGridView, (uint64_t (*)(uint64_t, uint64_t))sub_24438DFD8);
}

uint64_t sub_244392CD0(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a2(0) - 8);
  uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a3(a1, v6);
}

uint64_t sub_244392D5C()
{
  type metadata accessor for PhotoGridView();

  return sub_24438E2A8();
}

uint64_t sub_244392DBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v3 = sub_2443B7AF0();
  uint64_t v56 = *(void *)(v3 - 8);
  uint64_t v57 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v55 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E38AA0);
  MEMORY[0x270FA5388](v51);
  uint64_t v50 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_2443B7A50();
  MEMORY[0x270FA5388](v54);
  uint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2443B9780();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E38EA0);
  MEMORY[0x270FA5388](v49);
  uint64_t v52 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E476E0);
  uint64_t v58 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v53 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3B430);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for PlaygroundImage();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244072908(a1 + *(void *)(*(void *)a1 + 160), 0, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_243E9DDBC((uint64_t)v16, &qword_268E3B430);
    uint64_t v21 = 1;
    uint64_t v22 = v59;
  }
  else
  {
    uint64_t v48 = v20;
    sub_2443954F8((uint64_t)v16, (uint64_t)v20, (uint64_t (*)(void))type metadata accessor for PlaygroundImage);
    sub_243F2A2D4();
    sub_2443B9750();
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F1B4B8], v8);
    uint64_t v23 = sub_2443B97E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v24 = v54;
    unint64_t v25 = &v7[*(int *)(v54 + 20)];
    unsigned int v47 = *MEMORY[0x263F19860];
    uint64_t v26 = v47;
    uint64_t v27 = sub_2443B80C0();
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104);
    v28(v25, v26, v27);
    __asm { FMOV            V0.2D, #16.0 }
    long long v46 = _Q0;
    *(_OWORD *)uint64_t v7 = _Q0;
    id v34 = (uint64_t (*)(void))MEMORY[0x263F19048];
    uint64_t v35 = v50;
    sub_24439565C((uint64_t)v7, v50, MEMORY[0x263F19048]);
    uint64_t v36 = (uint64_t)v52;
    *(_WORD *)(v35 + *(int *)(v51 + 36)) = 256;
    sub_243E9DD58(v35, v36 + *(int *)(v49 + 36), &qword_268E38AA0);
    *(void *)uint64_t v36 = v23;
    *(void *)(v36 + 8) = 0;
    *(_WORD *)(v36 + 16) = 1;
    swift_retain();
    sub_243E9DDBC(v35, &qword_268E38AA0);
    BOOL v37 = (uint64_t (*)(void))MEMORY[0x263F19048];
    sub_244395498((uint64_t)v7, MEMORY[0x263F19048]);
    swift_release();
    uint64_t v38 = v55;
    sub_2443B7AE0();
    v28(&v7[*(int *)(v24 + 20)], v47, v27);
    *(_OWORD *)uint64_t v7 = v46;
    uint64_t v39 = (uint64_t)v53;
    uint64_t v40 = (uint64_t)&v53[*(int *)(v60 + 36)];
    sub_24439565C((uint64_t)v7, v40, v34);
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E476E8);
    uint64_t v43 = v56;
    uint64_t v42 = v57;
    (*(void (**)(uint64_t, char *, uint64_t))(v56 + 16))(v40 + *(int *)(v41 + 40), v38, v57);
    *(unsigned char *)(v40 + *(int *)(v41 + 36)) = 0;
    sub_243E9DD58(v36, v39, &qword_268E38EA0);
    sub_244395498((uint64_t)v7, v37);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v38, v42);
    sub_243E9DDBC(v36, &qword_268E38EA0);
    sub_244395498((uint64_t)v48, (uint64_t (*)(void))type metadata accessor for PlaygroundImage);
    uint64_t v44 = v59;
    sub_243EA697C(v39, v59, &qword_268E476E0);
    uint64_t v21 = 0;
    uint64_t v22 = v44;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 56))(v22, v21, 1, v60);
}

uint64_t sub_24439346C@<X0>(uint64_t a1@<X8>)
{
  return sub_244392DBC(*v1, a1);
}

uint64_t sub_244393474(uint64_t a1, char a2)
{
  unint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v2 = v5;
  uint64_t v7 = 0;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    if (a1 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      return result;
    }
    uint64_t v7 = 1;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_2443BB510();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 <= a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t result = MEMORY[0x24568E4C0](v7, v9, a2 & 1, v5);
  *uint64_t v2 = result;
  return result;
}

uint64_t sub_24439353C()
{
  return sub_243F83F44(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_244393558()
{
  uint64_t v1 = sub_2443B7020();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = sub_2443B7920();
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);

  return swift_deallocObject();
}

uint64_t sub_2443936A8()
{
  return sub_2443B6FF0();
}

uint64_t block_copy_helper_34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_34()
{
  return swift_release();
}

uint64_t sub_244393784()
{
  return sub_24438D9A4();
}

uint64_t sub_2443937A0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268E3A110);
    sub_2443955F4(a2, MEMORY[0x263F07508]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_244393834()
{
  return objectdestroy_46Tm(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8]);
}

uint64_t sub_244393864(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_243EAEC64;
  return sub_2442CE140(a1, v4, v5, v6, v7);
}

uint64_t sub_244393928()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_244393960@<X0>(uint64_t a1@<X8>)
{
  return sub_24438BB80(*(void *)(v1 + 16), a1);
}

unint64_t sub_244393968()
{
  unint64_t result = qword_268E47668;
  if (!qword_268E47668)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47660);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47670);
    sub_243E9DC94(&qword_268E47678, &qword_268E47670);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47668);
  }
  return result;
}

uint64_t sub_244393A50()
{
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_244393AA0()
{
  return 16;
}

__n128 sub_244393AAC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t objectdestroyTm_43()
{
  uint64_t v1 = (int *)type metadata accessor for PhotoGridView();
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*((void *)v1 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v1 - 1) + 80));
  uint64_t v3 = v2 + v1[5];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_243EB18F8(*(void *)(v2 + v1[10]), *(unsigned char *)(v2 + v1[10] + 8));
  uint64_t v5 = v2 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2443B8640();
    uint64_t v7 = *(void *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v8 = v2 + v1[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F4C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_2443B8530();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }

  return swift_deallocObject();
}

uint64_t sub_244393D4C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24438C1B0(*a1, a2);
}

uint64_t sub_244393DC0()
{
  return objectdestroy_70Tm(MEMORY[0x263F8EED8]);
}

uint64_t sub_244393DD8()
{
  return sub_244393E50((uint64_t (*)(unint64_t, uint64_t))sub_24438F2A8);
}

uint64_t sub_244393DF0()
{
  return objectdestroy_70Tm(MEMORY[0x263F8EED8]);
}

uint64_t sub_244393E08()
{
  return sub_244393E50((uint64_t (*)(unint64_t, uint64_t))sub_24438F374);
}

uint64_t sub_244393E20()
{
  return objectdestroy_70Tm(MEMORY[0x263F8EED8]);
}

uint64_t sub_244393E38()
{
  return sub_244393E50((uint64_t (*)(unint64_t, uint64_t))sub_24438F4E0);
}

uint64_t sub_244393E50(uint64_t (*a1)(unint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for PhotoGridView() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v1 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));

  return a1(v1 + v3, v4);
}

uint64_t sub_244393F00()
{
  return objectdestroy_70Tm(MEMORY[0x263F8EEA0]);
}

uint64_t objectdestroy_70Tm(void (*a1)(void))
{
  unint64_t v3 = (int *)type metadata accessor for PhotoGridView();
  unint64_t v4 = (*(unsigned __int8 *)(*((void *)v3 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v3 - 1) + 80);
  uint64_t v5 = *(void *)(*((void *)v3 - 1) + 64);
  uint64_t v6 = v1 + v4;
  unint64_t v7 = v1 + v4 + v3[5];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_243EB18F8(*(void *)(v6 + v3[10]), *(unsigned char *)(v6 + v3[10] + 8));
  unint64_t v9 = v1 + v4 + v3[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2443B8640();
    uint64_t v11 = *(void *)(v10 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
      (*(void (**)(unint64_t, uint64_t))(v11 + 8))(v9, v10);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v12 = v6 + v3[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F4C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_2443B8530();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  a1(*(void *)(v1 + ((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));

  return swift_deallocObject();
}

uint64_t sub_2443941CC(char a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for PhotoGridView() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_2443910CC(a1, v1 + v4, v5);
}

uint64_t sub_244394268()
{
  uint64_t v1 = (int *)type metadata accessor for PhotoGridView();
  unint64_t v2 = (*(unsigned __int8 *)(*((void *)v1 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  swift_unknownObjectRelease();
  uint64_t v3 = v0 + v2;
  unint64_t v4 = v0 + v2 + v1[5];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_243EB18F8(*(void *)(v3 + v1[10]), *(unsigned char *)(v3 + v1[10] + 8));
  unint64_t v6 = v0 + v2 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2443B8640();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
      (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v6, v7);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v9 = v3 + v1[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F4C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2443B8530();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_24439451C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for PhotoGridView() - 8);
  uint64_t v4 = *(void *)(v1
                 + ((*(void *)(v3 + 64)
                   + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
                   + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_244391D84(v4, a1);
}

uint64_t sub_2443945BC()
{
  uint64_t v1 = (int *)type metadata accessor for PhotoGridView();
  unint64_t v2 = (*(unsigned __int8 *)(*((void *)v1 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  swift_unknownObjectRelease();
  uint64_t v3 = v0 + v2;
  unint64_t v4 = v0 + v2 + v1[5];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_243EB18F8(*(void *)(v3 + v1[10]), *(unsigned char *)(v3 + v1[10] + 8));
  unint64_t v6 = v0 + v2 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2443B8640();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
      (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v6, v7);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v9 = v3 + v1[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F4C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2443B8530();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }

  return swift_deallocObject();
}

unsigned char *sub_244394854(unsigned char *a1)
{
  type metadata accessor for PhotoGridView();

  return sub_244391E28(a1);
}

uint64_t sub_2443948CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  char v3 = *(unsigned char *)(a1 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_243EB18F8(v2, v3);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2443949BC()
{
  uint64_t v1 = (int *)type metadata accessor for PhotoGridView();
  unint64_t v2 = (*(unsigned __int8 *)(*((void *)v1 - 1) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + v2;
  unint64_t v4 = v0 + v2 + v1[5];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E474D0);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_243EB18F8(*(void *)(v3 + v1[10]), *(unsigned char *)(v3 + v1[10] + 8));
  unint64_t v6 = v0 + v2 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2443B8640();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
      (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v6, v7);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v9 = v3 + v1[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3F4C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2443B8530();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }

  return swift_deallocObject();
}

uint64_t sub_244394C5C(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PhotoGridView() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  char v7 = *(unsigned char *)(v1 + 32);
  uint64_t v8 = *(void *)(v1 + 40);
  uint64_t v9 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_243EAE800;
  return sub_24438F5BC(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_244394D60()
{
  return swift_deallocObject();
}

uint64_t sub_244394D70()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return swift_deallocObject();
}

uint64_t sub_244394DA8()
{
  return objectdestroy_46Tm(MEMORY[0x263F8EEE8], MEMORY[0x263F8EEA0]);
}

uint64_t sub_244394DD8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *char v7 = v2;
  v7[1] = sub_243EAEC64;
  return sub_2443912C0(a1, v4, v5, v6);
}

double sub_244394E8C(uint64_t a1)
{
  uint64_t v2 = sub_2443B8640();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EC00);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v23 - v15;
  (*(void (**)(char *, void, uint64_t, __n128))(v3 + 104))((char *)&v23 - v15, *MEMORY[0x263F19F00], v2, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v16, 0, 1, v2);
  uint64_t v17 = (uint64_t)&v9[*(int *)(v7 + 56)];
  sub_243E9DD58(a1, (uint64_t)v9, &qword_268E3EA10);
  sub_243E9DD58((uint64_t)v16, v17, &qword_268E3EA10);
  uint64_t v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v18((uint64_t)v9, 1, v2) != 1)
  {
    sub_243E9DD58((uint64_t)v9, (uint64_t)v12, &qword_268E3EA10);
    if (v18(v17, 1, v2) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v5, v17, v2);
      sub_2443955F4((unint64_t *)&qword_268E38590, MEMORY[0x263F19F18]);
      char v19 = sub_2443BA3F0();
      uint64_t v20 = *(void (**)(char *, uint64_t))(v3 + 8);
      v20(v5, v2);
      sub_243E9DDBC((uint64_t)v16, &qword_268E3EA10);
      v20(v12, v2);
      sub_243E9DDBC((uint64_t)v9, &qword_268E3EA10);
      if (v19) {
        return 140.0;
      }
      return 210.0;
    }
    sub_243E9DDBC((uint64_t)v16, &qword_268E3EA10);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
LABEL_6:
    sub_243E9DDBC((uint64_t)v9, &qword_268E3EC00);
    return 210.0;
  }
  sub_243E9DDBC((uint64_t)v16, &qword_268E3EA10);
  if (v18(v17, 1, v2) != 1) {
    goto LABEL_6;
  }
  sub_243E9DDBC((uint64_t)v9, &qword_268E3EA10);
  return 140.0;
}

uint64_t sub_24439522C()
{
  return sub_2443B7C40();
}

ValueMetadata *type metadata accessor for DragPreview()
{
  return &type metadata for DragPreview;
}

uint64_t destroy for PhotoGridView._ShareLink()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t _s15ImagePlayground13PhotoGridViewV10_ShareLinkVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PhotoGridView._ShareLink(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PhotoGridView._ShareLink(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PhotoGridView._ShareLink()
{
  return &type metadata for PhotoGridView._ShareLink;
}

ValueMetadata *type metadata accessor for PhotoGridView.Metrics()
{
  return &type metadata for PhotoGridView.Metrics;
}

uint64_t sub_2443953AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_244395460()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24439547C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_244395498(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2443954F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_244395560()
{
  return objectdestroy_46Tm(MEMORY[0x263F8EEA0], MEMORY[0x263F8EED8]);
}

uint64_t objectdestroy_46Tm(void (*a1)(void), void (*a2)(void))
{
  a1(*(void *)(v2 + 16));
  a2(*(void *)(v2 + 32));

  return swift_deallocObject();
}

uint64_t sub_2443955F4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24439564C()
{
  return swift_deallocObject();
}

uint64_t sub_24439565C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_2443956C8()
{
  unint64_t result = qword_268E47718;
  if (!qword_268E47718)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47720);
    sub_24439573C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47718);
  }
  return result;
}

unint64_t sub_24439573C()
{
  unint64_t result = qword_268E47728;
  if (!qword_268E47728)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E476E0);
    sub_243EBDADC();
    sub_243E9DC94(&qword_268E47730, &qword_268E476E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47728);
  }
  return result;
}

unint64_t sub_2443957E0()
{
  unint64_t result = qword_268E47738;
  if (!qword_268E47738)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47700);
    sub_244395880();
    sub_243E9DC94((unint64_t *)&unk_268E3EC40, &qword_268E3AB10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47738);
  }
  return result;
}

unint64_t sub_244395880()
{
  unint64_t result = qword_268E47740;
  if (!qword_268E47740)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E476F8);
    sub_243E9DC94(&qword_268E47748, &qword_268E476F0);
    sub_243E9DC94(&qword_268E37DC0, &qword_268E37DC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47740);
  }
  return result;
}

id sub_24439594C(void *a1, void *a2, void *a3, double a4)
{
  if (qword_268E378F8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2443B6800();
  __swift_project_value_buffer(v7, (uint64_t)qword_268E39390);
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  id v11 = v8;
  id v12 = v9;
  id v13 = v10;
  __n128 v14 = sub_2443B67E0();
  os_log_type_t v15 = sub_2443BAD00();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v24 = v22;
    *(_DWORD *)uint64_t v16 = 136315394;
    objc_msgSend(v12, sel_position);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E47750);
    sub_244396C84();
    uint64_t v17 = sub_2443BB880();
    sub_243F2D034(v17, v18, &v24);
    sub_2443BB0C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    uint64_t v19 = sub_2443BB880();
    sub_243F2D034(v19, v20, &v24);
    sub_2443BB0C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243E89000, v14, v15, "Setting updateWandPosition from %s to %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24568FCC0](v22, -1, -1);
    MEMORY[0x24568FCC0](v16, -1, -1);
  }
  else
  {
  }
  return objc_msgSend(v12, sel_setPosition_, a4);
}

void sub_244395BE0(void *a1, uint64_t a2, id *a3)
{
  id v5 = objc_msgSend(a1, sel_asset);
  if (v5)
  {
    id v6 = objc_msgSend(v5, sel_name);
    swift_unknownObjectRelease();
    if (v6)
    {
      uint64_t v7 = sub_2443BA4F0();
      uint64_t v9 = v8;

      if (v7 == 0xD000000000000013 && v9 == 0x80000002443F6910)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v10 = sub_2443BB7D0();
        swift_bridgeObjectRelease();
        if ((v10 & 1) == 0) {
          return;
        }
      }
      id v12 = *a3;
      *a3 = a1;
      id v11 = a1;
    }
  }
}

void sub_244395D0C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_244395D68(__int16 a1)
{
  char v1 = HIBYTE(a1);
  sub_2443BB2D0();
  swift_bridgeObjectRelease();
  strcpy((char *)v3, "objectName: ");
  sub_2443BA5F0();
  swift_bridgeObjectRelease();
  sub_2443BA5F0();
  sub_244395EA0(v1);
  sub_2443BA5F0();
  swift_bridgeObjectRelease();
  return v3[0];
}

uint64_t sub_244395EA0(char a1)
{
  uint64_t result = 0x63735F656C707061;
  switch(a1)
  {
    case 1:
      uint64_t result = 0xD000000000000014;
      break;
    case 2:
      unsigned int v3 = 1651469410;
      goto LABEL_16;
    case 3:
      uint64_t result = 0x6163735F626F6C62;
      break;
    case 4:
      uint64_t result = 0xD000000000000015;
      break;
    case 5:
      uint64_t result = 0x646F4D746867696CLL;
      break;
    case 6:
      uint64_t result = 0x725F6E6565726373;
      break;
    case 7:
    case 10:
      uint64_t result = 0xD00000000000001ALL;
      break;
    case 8:
      uint64_t result = 0xD000000000000017;
      break;
    case 9:
      uint64_t result = 0xD000000000000016;
      break;
    case 11:
      uint64_t result = 0xD00000000000001CLL;
      break;
    case 12:
      uint64_t result = 0xD000000000000013;
      break;
    case 13:
      uint64_t result = 0x496C616974696E69;
      break;
    case 14:
      uint64_t result = 0x6C43646E61577369;
      break;
    case 15:
      unsigned int v3 = 1684955511;
LABEL_16:
      uint64_t result = v3 | 0x736F705F00000000;
      break;
    case 16:
      uint64_t result = 0x74696857646E6177;
      break;
    case 17:
      uint64_t result = 0xD000000000000012;
      break;
    case 18:
      uint64_t result = 0x656C636974726170;
      break;
    case 19:
      uint64_t result = 0x7974696361706FLL;
      break;
    case 20:
      uint64_t result = 0x737569646172;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_244396140(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_243FE2C04(*a1, *a2);
}

uint64_t sub_24439614C()
{
  return sub_2443BB9D0();
}

uint64_t sub_244396208()
{
  sub_2443BA590();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2443962B0()
{
  return sub_2443BB9D0();
}

uint64_t sub_244396368@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_244397A48();
  *a1 = result;
  return result;
}

void sub_244396398(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xED000073676E6964;
  unint64_t v4 = 0xEB00000000646E61;
  uint64_t v5 = 0x5772657474696D45;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6F6C42656E616C50;
    unint64_t v4 = 0xE900000000000062;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6E69622065646F6ELL;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_244396410(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = sub_244395EA0(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_244395EA0(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2443BB7D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24439649C()
{
  char v1 = *v0;
  sub_2443BB990();
  sub_244395EA0(v1);
  sub_2443BA590();
  swift_bridgeObjectRelease();
  return sub_2443BB9D0();
}

uint64_t sub_244396500()
{
  sub_244395EA0(*v0);
  sub_2443BA590();

  return swift_bridgeObjectRelease();
}

uint64_t sub_244396554()
{
  char v1 = *v0;
  sub_2443BB990();
  sub_244395EA0(v1);
  sub_2443BA590();
  swift_bridgeObjectRelease();
  return sub_2443BB9D0();
}

uint64_t sub_2443965B4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_244397A94();
  *a1 = result;
  return result;
}

uint64_t sub_2443965E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_244395EA0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_244396610()
{
  char v1 = *(unsigned char *)(v0 + 1);
  sub_2443BB990();
  sub_2443BA590();
  swift_bridgeObjectRelease();
  sub_244395EA0(v1);
  sub_2443BA590();
  swift_bridgeObjectRelease();
  return sub_2443BB9D0();
}

uint64_t sub_244396700()
{
  char v1 = *(unsigned char *)(v0 + 1);
  sub_2443BA590();
  swift_bridgeObjectRelease();
  sub_244395EA0(v1);
  sub_2443BA590();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2443967E0()
{
  char v1 = *(unsigned char *)(v0 + 1);
  sub_2443BB990();
  sub_2443BA590();
  swift_bridgeObjectRelease();
  sub_244395EA0(v1);
  sub_2443BA590();
  swift_bridgeObjectRelease();
  return sub_2443BB9D0();
}

uint64_t sub_2443968CC(__int16 *a1, __int16 *a2)
{
  return sub_2443968E0(*a1, *a2);
}

uint64_t sub_2443968D8()
{
  return sub_244395D68(*v0);
}

uint64_t sub_2443968E0(__int16 a1, __int16 a2)
{
  char v2 = HIBYTE(a2);
  char v3 = HIBYTE(a1);
  unint64_t v4 = 0xED000073676E6964;
  uint64_t v5 = 0x6E69622065646F6ELL;
  int v6 = a1;
  if (!(_BYTE)a1)
  {
    uint64_t v7 = 0x6E69622065646F6ELL;
    unint64_t v8 = 0xED000073676E6964;
    int v9 = a2;
    if (!(_BYTE)a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  if (a1 == 1) {
    uint64_t v7 = 0x5772657474696D45;
  }
  else {
    uint64_t v7 = 0x6F6C42656E616C50;
  }
  if (v6 == 1) {
    unint64_t v8 = 0xEB00000000646E61;
  }
  else {
    unint64_t v8 = 0xE900000000000062;
  }
  int v9 = a2;
  if ((_BYTE)a2)
  {
LABEL_9:
    if (v9 == 1) {
      uint64_t v5 = 0x5772657474696D45;
    }
    else {
      uint64_t v5 = 0x6F6C42656E616C50;
    }
    if (v9 == 1) {
      unint64_t v4 = 0xEB00000000646E61;
    }
    else {
      unint64_t v4 = 0xE900000000000062;
    }
  }
LABEL_15:
  if (v7 == v5 && v8 == v4)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v10 = sub_2443BB7D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v11 = 0;
    if ((v10 & 1) == 0) {
      return v11 & 1;
    }
  }
  uint64_t v12 = sub_244395EA0(v3);
  uint64_t v14 = v13;
  if (v12 == sub_244395EA0(v2) && v14 == v15) {
    char v11 = 1;
  }
  else {
    char v11 = sub_2443BB7D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

void sub_244396AA8(void *a1)
{
  char v1 = objc_msgSend(a1, sel_particleEmitter);
  if (v1)
  {
    int v9 = v1;
    if (qword_268E378F8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2443B6800();
    __swift_project_value_buffer(v2, (uint64_t)qword_268E39390);
    char v3 = sub_2443B67E0();
    os_log_type_t v4 = sub_2443BACF0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_243E89000, v3, v4, "resetParticleEmitter()", v5, 2u);
      MEMORY[0x24568FCC0](v5, -1, -1);
    }

    [v9 killParticles];
    [v9 restart];
  }
  else
  {
    if (qword_268E378F8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2443B6800();
    __swift_project_value_buffer(v6, (uint64_t)qword_268E39390);
    int v9 = sub_2443B67E0();
    os_log_type_t v7 = sub_2443BAD10();
    if (os_log_type_enabled(v9, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v8 = 0;
      _os_log_impl(&dword_243E89000, v9, v7, "particleEmitter is nil", v8, 2u);
      MEMORY[0x24568FCC0](v8, -1, -1);
    }
  }
}

unint64_t sub_244396C84()
{
  unint64_t result = qword_268E47758;
  if (!qword_268E47758)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47750);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47758);
  }
  return result;
}

void sub_244396CE0(uint64_t a1, id a2)
{
  if (objc_msgSend(a2, sel_asset))
  {
    self;
    char v3 = (void *)swift_dynamicCastObjCClass();
    if (v3)
    {
      objc_msgSend(v3, sel_setCGImage_, a1);
      swift_unknownObjectRelease();
      return;
    }
    swift_unknownObjectRelease();
  }
  if (qword_268E378F8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2443B6800();
  __swift_project_value_buffer(v4, (uint64_t)qword_268E39390);
  oslog = sub_2443B67E0();
  os_log_type_t v5 = sub_2443BAD10();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_243E89000, oslog, v5, "maskAssetNode.asset is not a VFXClientTextureAsset!", v6, 2u);
    MEMORY[0x24568FCC0](v6, -1, -1);
  }
}

id sub_244396E48(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(a1, sel_rootNode);
  char v3 = (void *)sub_2443BA4B0();
  id v4 = objc_msgSend(v2, sel_childNodeWithName_, v3);

  if (!v4)
  {
    if (qword_268E378F8 == -1) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
  id v5 = objc_msgSend(v1, sel_rootNode);
  uint64_t v6 = (void *)sub_2443BA4B0();
  os_log_type_t v7 = objc_msgSend(v5, sel_childNodeWithName_, v6);

  if (!v7)
  {
    if (qword_268E378F8 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_2443B6800();
    __swift_project_value_buffer(v19, (uint64_t)qword_268E39390);
    uint64_t v16 = sub_2443B67E0();
    os_log_type_t v20 = sub_2443BAD10();
    if (!os_log_type_enabled(v16, v20))
    {

      return 0;
    }
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_243E89000, v16, v20, "Failed to load emitterWandStars", v21, 2u);
    MEMORY[0x24568FCC0](v21, -1, -1);

    goto LABEL_13;
  }
  id v30 = 0;
  id v8 = objc_msgSend(v1, sel_assetRegistry);
  id v9 = objc_msgSend(v8, sel_rootNode);

  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = &v30;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_244397360;
  *(void *)(v11 + 24) = v10;
  aBlock[4] = sub_244397378;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244395D0C;
  aBlock[3] = &block_descriptor_36;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_enumerateHierarchyUsingBlock_, v12);

  _Block_release(v12);
  LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v9)
  {
    __break(1u);
LABEL_25:
    swift_once();
LABEL_7:
    uint64_t v15 = sub_2443B6800();
    __swift_project_value_buffer(v15, (uint64_t)qword_268E39390);
    uint64_t v16 = sub_2443B67E0();
    os_log_type_t v17 = sub_2443BAD10();
    if (os_log_type_enabled(v16, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v18 = 0;
      _os_log_impl(&dword_243E89000, v16, v17, "Failed to load emmitter", v18, 2u);
      MEMORY[0x24568FCC0](v18, -1, -1);
    }
LABEL_13:

LABEL_21:
    return 0;
  }
  if (!v30)
  {
    if (qword_268E378F8 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_2443B6800();
    __swift_project_value_buffer(v22, (uint64_t)qword_268E39390);
    uint64_t v23 = sub_2443B67E0();
    os_log_type_t v24 = sub_2443BAD10();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v25 = 0;
      _os_log_impl(&dword_243E89000, v23, v24, "Failed to load assetNode", v25, 2u);
      MEMORY[0x24568FCC0](v25, -1, -1);
      uint64_t v26 = v7;
      uint64_t v27 = v4;
    }
    else
    {
      uint64_t v26 = v23;
      uint64_t v27 = v1;
      uint64_t v23 = v7;
      id v1 = v4;
    }

    id v1 = v30;
    swift_release();
    goto LABEL_21;
  }
  id v13 = v30;

  id v14 = v30;
  swift_release();

  return v4;
}

uint64_t sub_244397350()
{
  return swift_deallocObject();
}

void sub_244397360(void *a1, uint64_t a2)
{
  sub_244395BE0(a1, a2, *(id **)(v2 + 16));
}

uint64_t sub_244397368()
{
  return swift_deallocObject();
}

uint64_t sub_244397378()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_35(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_35()
{
  return swift_release();
}

uint64_t getEnumTagSinglePayload for VFXBindingWand(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 65282 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65282 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65282;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65282;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65282;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for VFXBindingWand(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65282 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65282 < 0xFF0000) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 254;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x244397518);
      case 4:
        *(_DWORD *)(result + 2) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VFXBindingWand()
{
  return &type metadata for VFXBindingWand;
}

void *initializeBufferWithCopyOfBuffer for VFXNodesWand(void *a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  unsigned int v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  a1[2] = v5;
  id v6 = v3;
  id v7 = v4;
  id v8 = v5;
  return a1;
}

void destroy for VFXNodesWand(uint64_t a1)
{
  int v2 = *(void **)(a1 + 16);
}

uint64_t assignWithCopy for VFXNodesWand(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  uint64_t v10 = *(void **)(a2 + 16);
  uint64_t v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  return a1;
}

uint64_t assignWithTake for VFXNodesWand(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

ValueMetadata *type metadata accessor for VFXNodesWand()
{
  return &type metadata for VFXNodesWand;
}

unint64_t sub_2443976AC()
{
  unint64_t result = qword_268E47760;
  if (!qword_268E47760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47760);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for VFXBindingWand.PropertyName(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEC) {
    goto LABEL_17;
  }
  if (a2 + 20 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 20) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 20;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 20;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 20;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x15;
  int v8 = v6 - 21;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for VFXBindingWand.PropertyName(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 20 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 20) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEB)
  {
    unsigned int v6 = ((a2 - 236) >> 8) + 1;
    *unint64_t result = a2 + 20;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24439785CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 20;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VFXBindingWand.PropertyName()
{
  return &type metadata for VFXBindingWand.PropertyName;
}

unsigned char *storeEnumTagSinglePayload for VFXBindingWand.NodeName(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x244397960);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VFXBindingWand.NodeName()
{
  return &type metadata for VFXBindingWand.NodeName;
}

unint64_t sub_24439799C()
{
  unint64_t result = qword_268E47768;
  if (!qword_268E47768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47768);
  }
  return result;
}

unint64_t sub_2443979F4()
{
  unint64_t result = qword_268E47770;
  if (!qword_268E47770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47770);
  }
  return result;
}

uint64_t sub_244397A48()
{
  unint64_t v0 = sub_2443BB5F0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_244397A94()
{
  unint64_t v0 = sub_2443BB850();
  swift_bridgeObjectRelease();
  if (v0 >= 0x15) {
    return 21;
  }
  else {
    return v0;
  }
}

void sub_244397AEC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E42118);
    int v2 = (void *)sub_2443BB550();
  }
  else
  {
    int v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  int64_t i = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v11 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v11 >= v27) {
    goto LABEL_32;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v11);
  int64_t v13 = i + 1;
  if (!v12)
  {
    int64_t v13 = i + 2;
    if (i + 2 >= v27) {
      goto LABEL_32;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    if (!v12)
    {
      int64_t v13 = i + 3;
      if (i + 3 >= v27) {
        goto LABEL_32;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = i + 4;
        if (i + 4 >= v27) {
          goto LABEL_32;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v14 = i + 5;
          if (i + 5 < v27)
          {
            unint64_t v12 = *(void *)(v28 + 8 * v14);
            if (v12)
            {
              int64_t v13 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v13 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_36;
              }
              if (v13 >= v27) {
                break;
              }
              unint64_t v12 = *(void *)(v28 + 8 * v13);
              ++v14;
              if (v12) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_243EB3298();
          return;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v12 - 1) & v12;
  unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
  for (i = v13; ; unint64_t v10 = v9 | (i << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    unint64_t v18 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    id v19 = v18;
    unint64_t v20 = sub_244196F54(v17, v16);
    unint64_t v21 = v20;
    if (v22)
    {
      BOOL v7 = (uint64_t *)(v2[6] + 16 * v20);
      swift_bridgeObjectRelease();
      *BOOL v7 = v17;
      v7[1] = v16;
      uint64_t v8 = v2[7];

      *(void *)(v8 + 8 * v21) = v19;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v20;
    uint64_t v23 = (uint64_t *)(v2[6] + 16 * v20);
    *uint64_t v23 = v17;
    v23[1] = v16;
    *(void *)(v2[7] + 8 * v20) = v19;
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_34;
    }
    v2[2] = v26;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_244397D90(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E420F0);
    uint64_t v2 = sub_2443BB550();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_243EA0958(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_243EA6E2C(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_243EA6E2C(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_243EA6E2C(v36, v37);
    sub_243EA6E2C(v37, &v33);
    uint64_t result = sub_2443BB250();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_243EA6E2C(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_243EB3298();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t GPGenerationRecipeData.underlyingData.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___GPGenerationRecipeData_underlyingData);
  sub_243EE0DAC(v1, *(void *)(v0 + OBJC_IVAR___GPGenerationRecipeData_underlyingData + 8));
  return v1;
}

id GPGenerationRecipeData.init(underlyingData:)(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  unint64_t v5 = (void *)sub_2443B5370();
  id v6 = objc_msgSend(v4, sel_initWithUnderlyingData_, v5);
  sub_243ECBC38(a1, a2);

  return v6;
}

id GPGenerationRecipeData.init(underlyingData:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR___GPGenerationRecipeData_underlyingData);
  *uint64_t v3 = a1;
  v3[1] = a2;
  v5.super_class = (Class)GPGenerationRecipeData;
  return objc_msgSendSuper2(&v5, sel_init);
}

Swift::OpaquePointer_optional __swiftcall GPGenerationRecipeData.getRecipeInfo()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3B430);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v98 = (char *)v81 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E39718);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v99 = (char *)v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2443B5B70();
  unint64_t v110 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v81 - v9;
  uint64_t v11 = type metadata accessor for ImageConditioningStyle();
  MEMORY[0x270FA5388](v11);
  int64_t v13 = (char *)v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&double v15 = MEMORY[0x270FA5388](v14).n128_u64[0];
  uint64_t v17 = (char *)v81 - v16;
  id v18 = objc_msgSend(v0, sel_underlyingData, v15);
  uint64_t v19 = sub_2443B5380();
  unint64_t v21 = v20;

  uint64_t v22 = sub_2440BE468(v19, v21, 5);
  sub_243ECBC38(v19, v21);
  uint64_t v86 = v17;
  uint64_t v93 = v13;
  uint64_t v87 = v11;
  uint64_t v94 = v10;
  uint64_t v23 = *(void *)(v22 + 16);
  if (v23)
  {
    uint64_t v90 = v7;
    uint64_t v92 = v5;
    uint64_t v88 = 0;
    uint64_t v95 = 0;
    uint64_t v97 = 0;
    unint64_t v101 = 0;
    unint64_t v96 = 0;
    unint64_t v102 = 0;
    CGRect v91 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v110 + 48);
    uint64_t v85 = (void (**)(char *, uint64_t, uint64_t))(v110 + 32);
    double v84 = (void (**)(char *, char *, uint64_t))(v110 + 16);
    uint64_t v83 = v98 + 32;
    uint64_t v82 = (void (**)(char *, uint64_t))(v110 + 8);
    v81[1] = v22;
    unint64_t v24 = (unint64_t *)(v22 + 56);
    uint64_t v104 = (void *)MEMORY[0x263F8EE78];
    uint64_t v103 = (void *)MEMORY[0x263F8EE78];
    do
    {
      unint64_t v28 = v24[5];
      uint64_t v29 = *(v24 - 3);
      unint64_t v30 = *(v24 - 2);
      uint64_t v31 = *(v24 - 1);
      unint64_t v110 = *v24;
      uint64_t v32 = v24[1];
      unint64_t v33 = v24[2];
      uint64_t v34 = v24[3];
      uint64_t v35 = v24[4];
      unint64_t v36 = v24[6];
      unint64_t v37 = v24[7];
      switch(v28 >> 61)
      {
        case 0uLL:
          unint64_t v109 = v24[7];
          unint64_t v108 = v36;
          uint64_t v105 = v31;
          uint64_t v106 = v32;
          unint64_t v107 = v33;
          sub_243EE0C3C(v29, v30, v31, v110, v32, v33, v34, v35, v28);
          swift_bridgeObjectRetain();
          uint64_t v38 = v34;
          uint64_t v39 = v35;
          if (swift_isUniquelyReferenced_nonNull_native()) {
            uint64_t v40 = v103;
          }
          else {
            uint64_t v40 = sub_243F3A284(0, v103[2] + 1, 1, v103);
          }
          unint64_t v42 = v40[2];
          unint64_t v41 = v40[3];
          if (v42 >= v41 >> 1) {
            uint64_t v40 = sub_243F3A284((void *)(v41 > 1), v42 + 1, 1, v40);
          }
          _OWORD v40[2] = v42 + 1;
          uint64_t v103 = v40;
          uint64_t v43 = &v40[2 * v42];
          v43[4] = v29;
          v43[5] = v30;
          goto LABEL_16;
        case 1uLL:
          unint64_t v109 = v24[7];
          unint64_t v108 = v36;
          uint64_t v105 = v31;
          uint64_t v106 = v32;
          unint64_t v107 = v33;
          sub_243EE0C3C(v29, v30, v31, v110, v32, v33, v34, v35, v28);
          swift_bridgeObjectRetain();
          uint64_t v38 = v34;
          uint64_t v39 = v35;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v104 = sub_243F3A284(0, v104[2] + 1, 1, v104);
          }
          unint64_t v45 = v104[2];
          unint64_t v44 = v104[3];
          if (v45 >= v44 >> 1) {
            uint64_t v104 = sub_243F3A284((void *)(v44 > 1), v45 + 1, 1, v104);
          }
          long long v46 = v104;
          v104[2] = v45 + 1;
          unsigned int v47 = &v46[2 * v45];
          v47[4] = v29;
          v47[5] = v30;
LABEL_16:
          sub_243EE0EB4(v29, v30, v105, v110, v106, v107, v38, v39, v28);
          break;
        case 4uLL:
          unint64_t v25 = v110;
          unint64_t v107 = v29;
          uint64_t v26 = v32;
          unint64_t v108 = v36;
          unint64_t v109 = v37;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_243EE0D98(v26, v33);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v80 = v28;
          unint64_t v27 = v107;
          sub_243EE0EB4(v107, v30, v31, v25, v26, v33, v34, v35, v80);
          uint64_t v97 = v31;
          unint64_t v101 = v25;
          unint64_t v96 = v27;
          unint64_t v102 = v30;
          break;
        case 5uLL:
          unint64_t v109 = v24[7];
          uint64_t v106 = v32;
          unint64_t v108 = v36;
          sub_243EE0C3C(v29, v30, v31, v110, v32, v33, v34, v35, v28);
          swift_bridgeObjectRetain();
          uint64_t v100 = v34;
          uint64_t v48 = (uint64_t)v99;
          sub_2443B5B40();
          uint64_t v49 = *v91;
          unint64_t v107 = v33;
          uint64_t v50 = v92;
          if (v49(v48, 1, v92) == 1)
          {
            sub_2443A618C(v48);
            sub_243EE0EB4(v29, v30, v31, v110, v106, v107, v100, v35, v28);
          }
          else
          {
            uint64_t v51 = v94;
            (*v85)(v94, v48, v50);
            uint64_t v89 = v35;
            uint64_t v52 = *v84;
            uint64_t v105 = v31;
            uint64_t v53 = v90;
            v52(v90, v51, v50);
            v52(v93, v53, v50);
            uint64_t v54 = sub_2443B5B30();
            uint64_t v55 = type metadata accessor for PlaygroundImage();
            uint64_t v56 = (uint64_t)v98;
            sub_2443B54A0();
            uint64_t v57 = (_OWORD *)(v56 + *(int *)(v55 + 36));
            *uint64_t v57 = 0u;
            v57[1] = 0u;
            *(void *)uint64_t v56 = v54;
            *(unsigned char *)(v56 + 8) = 0;
            *(_DWORD *)(v56 + 24) = 1;
            *(void *)(v56 + 16) = 0;
            uint64_t v58 = v83;
            *uint64_t v83 = 0;
            v58[1] = 0;
            uint64_t v59 = *v82;
            (*v82)(v90, v50);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v56, 0, 1, v55);
            uint64_t v60 = (uint64_t)v93;
            sub_243EA697C(v56, (uint64_t)&v93[*(int *)(v87 + 20)], &qword_268E3B430);
            uint64_t v61 = (uint64_t)v86;
            sub_2443A62D0(v60, (uint64_t)v86, (uint64_t (*)(void))type metadata accessor for ImageConditioningStyle);
            v59(v94, v50);
            swift_bridgeObjectRelease();
            uint64_t v88 = sub_2443B5B60();
            uint64_t v95 = v62;
            sub_243EE0EB4(v29, v30, v105, v110, v106, v107, v100, v89, v28);
            sub_243ED3770(v61);
          }
          break;
        default:
          break;
      }
      v24 += 11;
      --v23;
    }
    while (v23);
    swift_bridgeObjectRelease();
    uint64_t v63 = v104;
    unint64_t v64 = v101;
    uint64_t v65 = v97;
    uint64_t v66 = v95;
    unint64_t v67 = v96;
    uint64_t v68 = v103;
    uint64_t v69 = v88;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v69 = 0;
    uint64_t v66 = 0;
    uint64_t v65 = 0;
    unint64_t v64 = 0;
    unint64_t v67 = 0;
    unint64_t v102 = 0;
    uint64_t v63 = (void *)MEMORY[0x263F8EE78];
    uint64_t v68 = (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3C3A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2443C3490;
  *(void *)(inited + 32) = 0x74706D6F7270;
  *(void *)(inited + 40) = 0xE600000000000000;
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E37EC8);
  *(void *)(inited + 48) = v63;
  *(void *)(inited + 72) = v71;
  *(void *)(inited + 80) = 0x73746365666665;
  *(void *)(inited + 120) = v71;
  *(void *)(inited + 88) = 0xE700000000000000;
  *(void *)(inited + 96) = v68;
  unint64_t v72 = sub_244194D6C(inited);
  uint64_t v73 = MEMORY[0x263F8D310];
  if (v66)
  {
    uint64_t v114 = MEMORY[0x263F8D310];
    *(void *)&long long v113 = v69;
    *((void *)&v113 + 1) = v66;
    sub_243EA6E2C(&v113, &v112);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v111 = v72;
    sub_2443A0DB8(&v112, 0x656C797473, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
    unint64_t v72 = v111;
    swift_bridgeObjectRelease();
  }
  if (v102)
  {
    uint64_t v114 = v73;
    *(void *)&long long v113 = v67;
    *((void *)&v113 + 1) = v102;
    sub_243EA6E2C(&v113, &v112);
    char v75 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v111 = v72;
    sub_2443A0DB8(&v112, 0x44496E6F73726570, 0xE800000000000000, v75);
    unint64_t v72 = v111;
    swift_bridgeObjectRelease();
  }
  if (v64)
  {
    uint64_t v114 = v73;
    *(void *)&long long v113 = v65;
    *((void *)&v113 + 1) = v64;
    sub_243EA6E2C(&v113, &v112);
    char v76 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v111 = v72;
    sub_2443A0DB8(&v112, 0x61466E6F73726570, 0xEC00000044496563, v76);
    unint64_t v72 = v111;
    swift_bridgeObjectRelease();
  }
  uint64_t v77 = sub_244397D90(v72);
  swift_bridgeObjectRelease();
  uint64_t v79 = (void *)v77;
  result.value._rawValue = v79;
  result.is_nil = v78;
  return result;
}

void __swiftcall GPGenerationRecipeData.getDrawOnImageRecipe()(GPDrawOnImageRecipe_optional *__return_ptr retstr)
{
  id v2 = objc_msgSend(v1, sel_underlyingData);
  uint64_t v3 = sub_2443B5380();
  unint64_t v5 = v4;

  uint64_t v6 = sub_2440BE468(v3, v5, 5);
  sub_243ECBC38(v3, v5);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v22 = 0;
    uint64_t v8 = (unint64_t *)(v6 + 56);
    do
    {
      unint64_t v9 = v8[5];
      if (v9 >> 61 == 2)
      {
        unint64_t v10 = v8[7];
        uint64_t v21 = v8[4];
        unint64_t v19 = v8[6];
        uint64_t v20 = v8[3];
        uint64_t v12 = v8[1];
        unint64_t v11 = v8[2];
        uint64_t v14 = *(v8 - 1);
        unint64_t v13 = *v8;
        unint64_t v15 = *(v8 - 2);
        v23[0] = *(v8 - 3);
        uint64_t v16 = v23[0];
        v23[1] = v15;
        v23[2] = v14;
        v23[3] = v13;
        v23[4] = v12;
        v23[5] = v11;
        unint64_t v18 = v11;
        v23[6] = v20;
        v23[7] = v21;
        __int16 v24 = v9 & 0xFF01;
        char v25 = BYTE2(v9) & 1;
        unint64_t v26 = v19;
        unint64_t v27 = v10;
        type metadata accessor for GPDrawOnImageRecipe();
        sub_243EE0D98(v16, v15);
        sub_243EE0D98(v14, v13);
        sub_243EE0D98(v12, v11);
        swift_bridgeObjectRetain();
        sub_243EE0D98(v16, v15);
        sub_243EE0D98(v14, v13);
        sub_243EE0D98(v12, v11);
        swift_bridgeObjectRetain();
        id v17 = sub_243F198B4((uint64_t)v23);

        sub_243EE0EB4(v16, v15, v14, v13, v12, v18, v20, v21, v9);
        uint64_t v22 = v17;
      }
      v8 += 11;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void __swiftcall GPGenerationRecipeData.init()(GPGenerationRecipeData *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v1, sel_init);
}

void GPGenerationRecipeData.init()()
{
}

uint64_t sub_244399438(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42108);
  uint64_t result = sub_2443BB530();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    unint64_t v30 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v12) {
          goto LABEL_34;
        }
        unint64_t v18 = v30[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_34;
          }
          unint64_t v18 = v30[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_34:
              if (a2)
              {
                uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
                if (v29 >= 64) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v30 = -1 << v29;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v18 = v30[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v12) {
                  goto LABEL_34;
                }
                unint64_t v18 = v30[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      uint64_t v20 = *(void *)(*(void *)(v5 + 48) + 8 * v16);
      uint64_t v21 = (long long *)(*(void *)(v5 + 56) + 40 * v16);
      if (a2) {
        sub_243EC06D8(v21, (uint64_t)v31);
      }
      else {
        sub_243EC0740((uint64_t)v21, (uint64_t)v31);
      }
      uint64_t result = sub_2443BB980();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(void *)(*(void *)(v7 + 48) + 8 * v14) = v20;
      uint64_t result = sub_243EC06D8(v31, *(void *)(v7 + 56) + 40 * v14);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_244399700(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E420D0);
  char v36 = a2;
  uint64_t v6 = sub_2443BB530();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_2443BB990();
    sub_2443BA590();
    uint64_t result = sub_2443BB9D0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_244399A18(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E38D10);
  char v36 = a2;
  uint64_t v6 = sub_2443BB530();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2443BB990();
    sub_2443BA590();
    uint64_t result = sub_2443BB9D0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_244399D30(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for PhotosPersonImage();
  uint64_t v40 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E420A8);
  int v41 = a2;
  uint64_t v9 = sub_2443BB530();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v38 = v2;
  uint64_t v39 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  int64_t v15 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v16 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v15) {
      break;
    }
    unint64_t v23 = v39;
    unint64_t v24 = v39[v22];
    ++v18;
    if (!v24)
    {
      int64_t v18 = v22 + 1;
      if (v22 + 1 >= v15) {
        goto LABEL_34;
      }
      unint64_t v24 = v39[v18];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v15)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v38;
          if ((v41 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v39[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v18 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v18 >= v15) {
              goto LABEL_34;
            }
            unint64_t v24 = v39[v18];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v18 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    unint64_t v26 = *(void **)(*(void *)(v8 + 48) + 8 * v21);
    uint64_t v27 = *(void *)(v40 + 72);
    uint64_t v28 = *(void *)(v8 + 56) + v27 * v21;
    if (v41)
    {
      sub_2443A62D0(v28, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
    }
    else
    {
      sub_2443A6268(v28, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
      id v29 = v26;
    }
    uint64_t result = sub_2443BAF80();
    uint64_t v30 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v16 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v31) & ~*(void *)(v16 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v16 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v19 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    *(void *)(*(void *)(v10 + 48) + 8 * v19) = v26;
    uint64_t result = sub_2443A62D0((uint64_t)v7, *(void *)(v10 + 56) + v27 * v19, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v38;
  unint64_t v23 = v39;
  if ((v41 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v8 + 32);
  if (v37 >= 64) {
    bzero(v23, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v37;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_24439A0D8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for PhotosPersonImage();
  uint64_t v48 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v51 = (uint64_t)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E420B8);
  int v49 = a2;
  uint64_t v8 = sub_2443BB530();
  uint64_t v9 = v8;
  if (*(void *)(v7 + 16))
  {
    unint64_t v44 = v2;
    uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
    uint64_t v11 = *(void *)(v7 + 64);
    long long v46 = (void *)(v7 + 64);
    if (v10 < 64) {
      uint64_t v12 = ~(-1 << v10);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = v12 & v11;
    int64_t v45 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = v8 + 64;
    uint64_t result = swift_retain();
    int64_t v16 = 0;
    uint64_t v47 = v7;
    while (1)
    {
      if (v13)
      {
        unint64_t v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v21 = v20 | (v16 << 6);
      }
      else
      {
        int64_t v22 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          return result;
        }
        if (v22 >= v45) {
          goto LABEL_38;
        }
        unint64_t v23 = v46[v22];
        ++v16;
        if (!v23)
        {
          int64_t v16 = v22 + 1;
          if (v22 + 1 >= v45) {
            goto LABEL_38;
          }
          unint64_t v23 = v46[v16];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v45)
            {
LABEL_38:
              swift_release();
              uint64_t v3 = v44;
              if (v49)
              {
                uint64_t v43 = 1 << *(unsigned char *)(v7 + 32);
                if (v43 >= 64) {
                  bzero(v46, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *long long v46 = -1 << v43;
                }
                *(void *)(v7 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v46[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v16 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_45;
                }
                if (v16 >= v45) {
                  goto LABEL_38;
                }
                unint64_t v23 = v46[v16];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v16 = v24;
          }
        }
LABEL_21:
        unint64_t v13 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v16 << 6);
      }
      uint64_t v25 = *(void *)(v7 + 56);
      uint64_t v26 = *(void *)(v7 + 48) + 48 * v21;
      uint64_t v27 = *(void *)(v26 + 8);
      uint64_t v52 = *(void *)v26;
      uint64_t v28 = *(void *)(v26 + 16);
      uint64_t v29 = *(void *)(v26 + 24);
      char v30 = *(unsigned char *)(v26 + 32);
      unint64_t v31 = *(void **)(v26 + 40);
      uint64_t v32 = *(void *)(v48 + 72);
      uint64_t v33 = v25 + v32 * v21;
      int64_t v50 = v16;
      if (v49)
      {
        sub_2443A62D0(v33, v51, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
      }
      else
      {
        sub_2443A6268(v33, v51, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
        id v34 = v31;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_2443BB990();
      sub_2443BB9B0();
      if (v27)
      {
        swift_bridgeObjectRetain();
        sub_2443BA590();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRetain();
      sub_2443BA590();
      swift_bridgeObjectRelease();
      sub_2443BB9B0();
      sub_2443BB9B0();
      if (v31)
      {
        id v35 = v31;
        sub_2443BAFA0();
      }
      uint64_t result = sub_2443BB9D0();
      uint64_t v36 = -1 << *(unsigned char *)(v9 + 32);
      unint64_t v37 = result & ~v36;
      unint64_t v38 = v37 >> 6;
      if (((-1 << v37) & ~*(void *)(v14 + 8 * (v37 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v37) & ~*(void *)(v14 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v39 = 0;
        unint64_t v40 = (unint64_t)(63 - v36) >> 6;
        do
        {
          if (++v38 == v40 && (v39 & 1) != 0)
          {
            __break(1u);
            goto LABEL_44;
          }
          BOOL v41 = v38 == v40;
          if (v38 == v40) {
            unint64_t v38 = 0;
          }
          v39 |= v41;
          uint64_t v42 = *(void *)(v14 + 8 * v38);
        }
        while (v42 == -1);
        unint64_t v17 = __clz(__rbit64(~v42)) + (v38 << 6);
      }
      *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = *(void *)(v9 + 48) + 48 * v17;
      uint64_t v19 = v51;
      *(void *)uint64_t v18 = v52;
      *(void *)(v18 + 8) = v27;
      *(void *)(v18 + 16) = v28;
      *(void *)(v18 + 24) = v29;
      *(unsigned char *)(v18 + 32) = v30;
      *(void *)(v18 + 40) = v31;
      uint64_t result = sub_2443A62D0(v19, *(void *)(v9 + 56) + v32 * v17, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
      ++*(void *)(v9 + 16);
      uint64_t v7 = v47;
      int64_t v16 = v50;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

uint64_t sub_24439A568(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for Bubble(0);
  uint64_t v45 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E41FD8);
  char v9 = a2;
  uint64_t v10 = sub_2443BB530();
  uint64_t v11 = v10;
  if (*(void *)(v8 + 16))
  {
    uint64_t v42 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v13 = *(void *)(v8 + 64);
    unint64_t v44 = (void *)(v8 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v43 = (unint64_t)(v12 + 63) >> 6;
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    while (1)
    {
      if (v15)
      {
        unint64_t v21 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v22 = v21 | (v18 << 6);
      }
      else
      {
        int64_t v23 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v23 >= v43) {
          goto LABEL_34;
        }
        unint64_t v24 = v44[v23];
        ++v18;
        if (!v24)
        {
          int64_t v18 = v23 + 1;
          if (v23 + 1 >= v43) {
            goto LABEL_34;
          }
          unint64_t v24 = v44[v18];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v43)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v42;
              if (v9)
              {
                uint64_t v40 = 1 << *(unsigned char *)(v8 + 32);
                if (v40 >= 64) {
                  bzero(v44, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v44 = -1 << v40;
                }
                *(void *)(v8 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v44[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v18 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v43) {
                  goto LABEL_34;
                }
                unint64_t v24 = v44[v18];
                ++v25;
                if (v24) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v25;
          }
        }
LABEL_21:
        unint64_t v15 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v18 << 6);
      }
      uint64_t v26 = *(void *)(v45 + 72);
      uint64_t v27 = *(void *)(v8 + 48) + v26 * v22;
      if (v9) {
        sub_2443A62D0(v27, (uint64_t)v7, type metadata accessor for Bubble);
      }
      else {
        sub_2443A6268(v27, (uint64_t)v7, type metadata accessor for Bubble);
      }
      uint64_t v28 = (uint64_t *)(*(void *)(v8 + 56) + 32 * v22);
      uint64_t v30 = v28[2];
      uint64_t v29 = v28[3];
      uint64_t v32 = *v28;
      uint64_t v31 = v28[1];
      sub_2443BB990();
      sub_2440E7EFC();
      sub_2443BA590();
      swift_bridgeObjectRelease();
      uint64_t result = sub_2443BB9D0();
      uint64_t v33 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v34 = result & ~v33;
      unint64_t v35 = v34 >> 6;
      if (((-1 << v34) & ~*(void *)(v16 + 8 * (v34 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v34) & ~*(void *)(v16 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v36 = 0;
        unint64_t v37 = (unint64_t)(63 - v33) >> 6;
        do
        {
          if (++v35 == v37 && (v36 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v38 = v35 == v37;
          if (v35 == v37) {
            unint64_t v35 = 0;
          }
          v36 |= v38;
          uint64_t v39 = *(void *)(v16 + 8 * v35);
        }
        while (v39 == -1);
        unint64_t v19 = __clz(__rbit64(~v39)) + (v35 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = sub_2443A62D0((uint64_t)v7, *(void *)(v11 + 48) + v26 * v19, type metadata accessor for Bubble);
      unint64_t v20 = (void *)(*(void *)(v11 + 56) + 32 * v19);
      *unint64_t v20 = v32;
      v20[1] = v31;
      v20[2] = v30;
      v20[3] = v29;
      ++*(void *)(v11 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_24439A954(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42000);
  uint64_t result = sub_2443BB530();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v30 = a2;
    int64_t v8 = 0;
    uint64_t v31 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v12) {
          goto LABEL_31;
        }
        unint64_t v18 = v31[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v18 = v31[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_31:
              if ((v30 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
              if (v29 >= 64) {
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v31 = -1 << v29;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v12) {
                  goto LABEL_31;
                }
                unint64_t v18 = v31[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      char v20 = *(unsigned char *)(*(void *)(v5 + 48) + v16);
      char v21 = *(unsigned char *)(*(void *)(v5 + 56) + v16);
      sub_2443BB990();
      sub_2443BB9A0();
      uint64_t result = sub_2443BB9D0();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(unsigned char *)(*(void *)(v7 + 48) + v14) = v20;
      *(unsigned char *)(*(void *)(v7 + 56) + v14) = v21;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24439AC1C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E4F8);
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v40 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E420C8);
  int v41 = a2;
  uint64_t v9 = sub_2443BB530();
  uint64_t v10 = v9;
  if (*(void *)(v8 + 16))
  {
    char v36 = v2;
    uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v12 = *(void *)(v8 + 64);
    BOOL v38 = (void *)(v8 + 64);
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & v12;
    int64_t v37 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v15 = v9 + 64;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    while (1)
    {
      if (v14)
      {
        unint64_t v19 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v20 = v19 | (v17 << 6);
      }
      else
      {
        int64_t v21 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v37) {
          goto LABEL_34;
        }
        unint64_t v22 = v38[v21];
        ++v17;
        if (!v22)
        {
          int64_t v17 = v21 + 1;
          if (v21 + 1 >= v37) {
            goto LABEL_34;
          }
          unint64_t v22 = v38[v17];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v37)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v36;
              if (v41)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v8 + 32);
                if (v34 >= 64) {
                  bzero(v38, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *BOOL v38 = -1 << v34;
                }
                *(void *)(v8 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v38[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v17 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v37) {
                  goto LABEL_34;
                }
                unint64_t v22 = v38[v17];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v17 = v23;
          }
        }
LABEL_21:
        unint64_t v14 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      uint64_t v24 = *(void *)(v39 + 72);
      uint64_t v25 = *(void *)(v8 + 48) + v24 * v20;
      if (v41)
      {
        sub_243EA697C(v25, (uint64_t)v7, &qword_268E3E4F8);
        uint64_t v26 = *(void *)(*(void *)(v8 + 56) + 8 * v20);
      }
      else
      {
        sub_243E9DD58(v25, (uint64_t)v7, &qword_268E3E4F8);
        uint64_t v26 = *(void *)(*(void *)(v8 + 56) + 8 * v20);
        swift_retain();
      }
      sub_2443BB990();
      sub_2443B54B0();
      sub_243FD6830();
      sub_2443BA370();
      sub_2443BB9A0();
      uint64_t result = sub_2443BB9D0();
      uint64_t v27 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v15 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v28) & ~*(void *)(v15 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v15 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v18 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t result = sub_243EA697C((uint64_t)v7, *(void *)(v10 + 48) + v24 * v18, &qword_268E3E4F8);
      *(void *)(*(void *)(v10 + 56) + 8 * v18) = v26;
      ++*(void *)(v10 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_24439AFFC(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for ConversationContextItem();
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E420E0);
  int v43 = a2;
  uint64_t v9 = sub_2443BB530();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  int v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    int64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_2443A62D0(v30, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ConversationContextItem);
    }
    else
    {
      sub_2443A6268(v30, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ConversationContextItem);
      swift_bridgeObjectRetain();
    }
    sub_2443BB990();
    sub_2443BA590();
    uint64_t result = sub_2443BB9D0();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *unint64_t v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_2443A62D0((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18, (uint64_t (*)(void))type metadata accessor for ConversationContextItem);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_24439B3DC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42040);
  char v42 = a2;
  uint64_t v6 = sub_2443BB530();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    unint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    unint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    unint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2443BB990();
    sub_2443BA590();
    uint64_t result = sub_2443BB9D0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24439B704(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3B520);
  char v35 = a2;
  uint64_t v6 = sub_2443BB530();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v33 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v33) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v34 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v33) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v34 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v33)
        {
LABEL_33:
          swift_release();
          if ((v35 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v34 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v33) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v34 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = 8 * v20;
    uint64_t v30 = *(void *)(*(void *)(v5 + 48) + v29);
    uint64_t v31 = *(void *)(*(void *)(v5 + 56) + v29);
    if ((v35 & 1) == 0)
    {
      swift_retain();
      swift_retain();
    }
    sub_2443BB990();
    sub_2443B54B0();
    sub_243FD6830();
    sub_2443BA370();
    uint64_t result = sub_2443BB9D0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 8 * v17;
    *(void *)(*(void *)(v7 + 48) + v18) = v30;
    *(void *)(*(void *)(v7 + 56) + v18) = v31;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24439BA44(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3B4F0);
  char v35 = a2;
  uint64_t v6 = sub_2443BB530();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v19 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v20 = v19 | (v13 << 6);
      }
      else
      {
        int64_t v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v34[v21];
        ++v13;
        if (!v22)
        {
          int64_t v13 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v34[v13];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v35)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v34[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v13 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v34[v13];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v23;
          }
        }
LABEL_30:
        unint64_t v10 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void **)(*(void *)(v5 + 56) + v28);
      if ((v35 & 1) == 0)
      {
        swift_retain();
        id v31 = v30;
      }
      sub_2443BB990();
      sub_2443B54B0();
      sub_243FD6830();
      sub_2443BA370();
      uint64_t result = sub_2443BB9D0();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24439BD68(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for FacePickerPersistentStorage.GeneratedPreviewArchive(0);
  uint64_t v41 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for GeneratedPreviewOptions(0);
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E41F20);
  int v44 = a2;
  uint64_t v12 = sub_2443BB530();
  uint64_t v13 = v12;
  if (*(void *)(v11 + 16))
  {
    uint64_t v38 = v2;
    uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
    uint64_t v15 = *(void *)(v11 + 64);
    int64_t v40 = (void *)(v11 + 64);
    if (v14 < 64) {
      uint64_t v16 = ~(-1 << v14);
    }
    else {
      uint64_t v16 = -1;
    }
    unint64_t v17 = v16 & v15;
    int64_t v39 = (unint64_t)(v14 + 63) >> 6;
    uint64_t v18 = v12 + 64;
    uint64_t result = swift_retain();
    int64_t v20 = 0;
    while (1)
    {
      if (v17)
      {
        unint64_t v22 = __clz(__rbit64(v17));
        v17 &= v17 - 1;
        unint64_t v23 = v22 | (v20 << 6);
      }
      else
      {
        int64_t v24 = v20 + 1;
        if (__OFADD__(v20, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v24 >= v39) {
          goto LABEL_34;
        }
        unint64_t v25 = v40[v24];
        ++v20;
        if (!v25)
        {
          int64_t v20 = v24 + 1;
          if (v24 + 1 >= v39) {
            goto LABEL_34;
          }
          unint64_t v25 = v40[v20];
          if (!v25)
          {
            int64_t v26 = v24 + 2;
            if (v26 >= v39)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v38;
              if (v44)
              {
                uint64_t v37 = 1 << *(unsigned char *)(v11 + 32);
                if (v37 >= 64) {
                  bzero(v40, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v40 = -1 << v37;
                }
                *(void *)(v11 + 16) = 0;
              }
              break;
            }
            unint64_t v25 = v40[v26];
            if (!v25)
            {
              while (1)
              {
                int64_t v20 = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  goto LABEL_41;
                }
                if (v20 >= v39) {
                  goto LABEL_34;
                }
                unint64_t v25 = v40[v20];
                ++v26;
                if (v25) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v20 = v26;
          }
        }
LABEL_21:
        unint64_t v17 = (v25 - 1) & v25;
        unint64_t v23 = __clz(__rbit64(v25)) + (v20 << 6);
      }
      uint64_t v27 = *(void *)(v42 + 72);
      uint64_t v28 = *(void *)(v11 + 48) + v27 * v23;
      if (v44)
      {
        sub_2443A62D0(v28, (uint64_t)v10, type metadata accessor for GeneratedPreviewOptions);
        uint64_t v29 = *(void *)(v41 + 72);
        sub_2443A62D0(*(void *)(v11 + 56) + v29 * v23, (uint64_t)v7, type metadata accessor for FacePickerPersistentStorage.GeneratedPreviewArchive);
      }
      else
      {
        sub_2443A6268(v28, (uint64_t)v10, type metadata accessor for GeneratedPreviewOptions);
        uint64_t v29 = *(void *)(v41 + 72);
        sub_2443A6268(*(void *)(v11 + 56) + v29 * v23, (uint64_t)v7, type metadata accessor for FacePickerPersistentStorage.GeneratedPreviewArchive);
      }
      sub_2443BB990();
      sub_2443BA590();
      _s15ImagePlayground0A17ConditioningStyleV2idSSvg_0();
      sub_2443BA590();
      swift_bridgeObjectRelease();
      uint64_t result = sub_2443BB9D0();
      uint64_t v30 = -1 << *(unsigned char *)(v13 + 32);
      unint64_t v31 = result & ~v30;
      unint64_t v32 = v31 >> 6;
      if (((-1 << v31) & ~*(void *)(v18 + 8 * (v31 >> 6))) != 0)
      {
        unint64_t v21 = __clz(__rbit64((-1 << v31) & ~*(void *)(v18 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v33 = 0;
        unint64_t v34 = (unint64_t)(63 - v30) >> 6;
        do
        {
          if (++v32 == v34 && (v33 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v35 = v32 == v34;
          if (v32 == v34) {
            unint64_t v32 = 0;
          }
          v33 |= v35;
          uint64_t v36 = *(void *)(v18 + 8 * v32);
        }
        while (v36 == -1);
        unint64_t v21 = __clz(__rbit64(~v36)) + (v32 << 6);
      }
      *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      sub_2443A62D0((uint64_t)v10, *(void *)(v13 + 48) + v27 * v21, type metadata accessor for GeneratedPreviewOptions);
      uint64_t result = sub_2443A62D0((uint64_t)v7, *(void *)(v13 + 56) + v29 * v21, type metadata accessor for FacePickerPersistentStorage.GeneratedPreviewArchive);
      ++*(void *)(v13 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

uint64_t sub_24439C234(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3ABC8);
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for GeneratedPreviewOptions(0);
  uint64_t v43 = *(void *)(v8 - 8);
  uint64_t v44 = v8;
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E41F80);
  int v45 = a2;
  uint64_t v12 = sub_2443BB530();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v41 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  int64_t v39 = v2;
  int64_t v40 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v18 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  while (1)
  {
    if (v17)
    {
      unint64_t v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v40) {
      break;
    }
    unint64_t v25 = v41;
    unint64_t v26 = v41[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v26 = v41[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v45 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v41[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v40) {
              goto LABEL_34;
            }
            unint64_t v26 = v41[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v17 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v43 + 72);
    uint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v45)
    {
      sub_2443A62D0(v29, (uint64_t)v10, type metadata accessor for GeneratedPreviewOptions);
      uint64_t v30 = *(void *)(v42 + 72);
      sub_243EA697C(*(void *)(v11 + 56) + v30 * v23, (uint64_t)v7, &qword_268E3ABC8);
    }
    else
    {
      sub_2443A6268(v29, (uint64_t)v10, type metadata accessor for GeneratedPreviewOptions);
      uint64_t v30 = *(void *)(v42 + 72);
      sub_243E9DD58(*(void *)(v11 + 56) + v30 * v23, (uint64_t)v7, &qword_268E3ABC8);
    }
    sub_2443BB990();
    sub_2443BA590();
    _s15ImagePlayground0A17ConditioningStyleV2idSSvg_0();
    sub_2443BA590();
    swift_bridgeObjectRelease();
    uint64_t result = sub_2443BB9D0();
    uint64_t v31 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    sub_2443A62D0((uint64_t)v10, *(void *)(v13 + 48) + v28 * v21, type metadata accessor for GeneratedPreviewOptions);
    uint64_t result = sub_243EA697C((uint64_t)v7, *(void *)(v13 + 56) + v30 * v21, &qword_268E3ABC8);
    ++*(void *)(v13 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v25 = v41;
  if ((v45 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

uint64_t sub_24439C6F4(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3ABB8);
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ImageKeyFaceLoader.Context.ID(0);
  uint64_t v43 = *(void *)(v8 - 8);
  uint64_t v44 = v8;
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E41F50);
  int v45 = a2;
  uint64_t v12 = sub_2443BB530();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v41 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  int64_t v39 = v2;
  int64_t v40 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v18 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  while (1)
  {
    if (v17)
    {
      unint64_t v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v40) {
      break;
    }
    unint64_t v25 = v41;
    unint64_t v26 = v41[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v26 = v41[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v45 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v41[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v40) {
              goto LABEL_34;
            }
            unint64_t v26 = v41[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v17 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v43 + 72);
    uint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v45)
    {
      sub_2443A62D0(v29, (uint64_t)v10, type metadata accessor for ImageKeyFaceLoader.Context.ID);
      uint64_t v30 = *(void *)(v42 + 72);
      sub_243EA697C(*(void *)(v11 + 56) + v30 * v23, (uint64_t)v7, &qword_268E3ABB8);
    }
    else
    {
      sub_2443A6268(v29, (uint64_t)v10, type metadata accessor for ImageKeyFaceLoader.Context.ID);
      uint64_t v30 = *(void *)(v42 + 72);
      sub_243E9DD58(*(void *)(v11 + 56) + v30 * v23, (uint64_t)v7, &qword_268E3ABB8);
    }
    sub_2443BB990();
    sub_2443BA590();
    sub_2443BA590();
    type metadata accessor for GeneratedPreviewOptions(0);
    _s15ImagePlayground0A17ConditioningStyleV2idSSvg_0();
    sub_2443BA590();
    swift_bridgeObjectRelease();
    uint64_t result = sub_2443BB9D0();
    uint64_t v31 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    sub_2443A62D0((uint64_t)v10, *(void *)(v13 + 48) + v28 * v21, type metadata accessor for ImageKeyFaceLoader.Context.ID);
    uint64_t result = sub_243EA697C((uint64_t)v7, *(void *)(v13 + 56) + v30 * v21, &qword_268E3ABB8);
    ++*(void *)(v13 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v25 = v41;
  if ((v45 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

uint64_t sub_24439CBD0(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v6 = v4;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v8 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v55 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2443B54B0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  int v53 = a2;
  uint64_t v15 = sub_2443BB530();
  uint64_t v16 = v15;
  if (!*(void *)(v14 + 16)) {
    goto LABEL_41;
  }
  uint64_t v17 = 1 << *(unsigned char *)(v14 + 32);
  uint64_t v18 = *(void *)(v14 + 64);
  uint64_t v47 = (void *)(v14 + 64);
  if (v17 < 64) {
    uint64_t v19 = ~(-1 << v17);
  }
  else {
    uint64_t v19 = -1;
  }
  unint64_t v20 = v19 & v18;
  int v45 = v4;
  int64_t v46 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v48 = v8 + 16;
  int v49 = (void (**)(char *, unint64_t, uint64_t))(v11 + 16);
  uint64_t v51 = v8;
  uint64_t v52 = v11;
  unint64_t v21 = (void (**)(char *, unint64_t, uint64_t))(v11 + 32);
  uint64_t v54 = (uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32);
  uint64_t v22 = v15 + 64;
  uint64_t result = swift_retain();
  int64_t v24 = 0;
  for (i = v14; ; uint64_t v14 = i)
  {
    if (v20)
    {
      unint64_t v26 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      unint64_t v27 = v26 | (v24 << 6);
      goto LABEL_22;
    }
    int64_t v28 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v28 >= v46) {
      break;
    }
    uint64_t v29 = v47;
    unint64_t v30 = v47[v28];
    ++v24;
    if (!v30)
    {
      int64_t v24 = v28 + 1;
      if (v28 + 1 >= v46) {
        goto LABEL_34;
      }
      unint64_t v30 = v47[v24];
      if (!v30)
      {
        int64_t v31 = v28 + 2;
        if (v31 >= v46)
        {
LABEL_34:
          swift_release();
          uint64_t v6 = v45;
          if ((v53 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v30 = v47[v31];
        if (!v30)
        {
          while (1)
          {
            int64_t v24 = v31 + 1;
            if (__OFADD__(v31, 1)) {
              goto LABEL_43;
            }
            if (v24 >= v46) {
              goto LABEL_34;
            }
            unint64_t v30 = v47[v24];
            ++v31;
            if (v30) {
              goto LABEL_21;
            }
          }
        }
        int64_t v24 = v31;
      }
    }
LABEL_21:
    unint64_t v20 = (v30 - 1) & v30;
    unint64_t v27 = __clz(__rbit64(v30)) + (v24 << 6);
LABEL_22:
    uint64_t v32 = *(void *)(v52 + 72);
    unint64_t v33 = *(void *)(v14 + 48) + v32 * v27;
    if (v53)
    {
      (*v21)(v13, v33, v10);
      uint64_t v34 = *(void *)(v14 + 56);
      uint64_t v35 = *(void *)(v51 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v51 + 32))(v55, v34 + v35 * v27, v56);
    }
    else
    {
      (*v49)(v13, v33, v10);
      uint64_t v36 = *(void *)(v14 + 56);
      uint64_t v35 = *(void *)(v51 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v51 + 16))(v55, v36 + v35 * v27, v56);
    }
    sub_243FD6830();
    uint64_t result = sub_2443BA360();
    uint64_t v37 = -1 << *(unsigned char *)(v16 + 32);
    unint64_t v38 = result & ~v37;
    unint64_t v39 = v38 >> 6;
    if (((-1 << v38) & ~*(void *)(v22 + 8 * (v38 >> 6))) != 0)
    {
      unint64_t v25 = __clz(__rbit64((-1 << v38) & ~*(void *)(v22 + 8 * (v38 >> 6)))) | v38 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v40 = 0;
      unint64_t v41 = (unint64_t)(63 - v37) >> 6;
      do
      {
        if (++v39 == v41 && (v40 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v42 = v39 == v41;
        if (v39 == v41) {
          unint64_t v39 = 0;
        }
        v40 |= v42;
        uint64_t v43 = *(void *)(v22 + 8 * v39);
      }
      while (v43 == -1);
      unint64_t v25 = __clz(__rbit64(~v43)) + (v39 << 6);
    }
    *(void *)(v22 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    (*v21)((char *)(*(void *)(v16 + 48) + v32 * v25), (unint64_t)v13, v10);
    uint64_t result = (*v54)(*(void *)(v16 + 56) + v35 * v25, v55, v56);
    ++*(void *)(v16 + 16);
  }
  swift_release();
  uint64_t v6 = v45;
  uint64_t v29 = v47;
  if ((v53 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v44 = 1 << *(unsigned char *)(v14 + 32);
  if (v44 >= 64) {
    bzero(v29, ((unint64_t)(v44 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v29 = -1 << v44;
  }
  *(void *)(v14 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v6 = v16;
  return result;
}

uint64_t sub_24439D09C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E41FF8);
  char v37 = a2;
  uint64_t v6 = sub_2443BB530();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_2443BB990();
    sub_2443BA590();
    uint64_t result = sub_2443BB9D0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24439D3A8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3C2D0);
  uint64_t v6 = sub_2443BB530();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      int64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_243EA6E2C(v24, v35);
      }
      else
      {
        sub_243EA0958((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_2443BB990();
      sub_2443BA590();
      uint64_t result = sub_2443BB9D0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_243EA6E2C(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24439D6A8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v43 = sub_2443BB450();
  uint64_t v5 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  BOOL v42 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42060);
  int v41 = a2;
  uint64_t result = sub_2443BB530();
  uint64_t v9 = result;
  if (*(void *)(v7 + 16))
  {
    char v37 = v2;
    int64_t v10 = 0;
    uint64_t v11 = *(void *)(v7 + 64);
    unint64_t v39 = (void *)(v7 + 64);
    uint64_t v12 = 1 << *(unsigned char *)(v7 + 32);
    if (v12 < 64) {
      uint64_t v13 = ~(-1 << v12);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & v11;
    int64_t v38 = (unint64_t)(v12 + 63) >> 6;
    char v40 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    unint64_t v15 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
    uint64_t v16 = result + 64;
    while (1)
    {
      if (v14)
      {
        unint64_t v18 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v19 = v18 | (v10 << 6);
      }
      else
      {
        int64_t v20 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v39;
        if (v20 >= v38) {
          goto LABEL_34;
        }
        unint64_t v21 = v39[v20];
        ++v10;
        if (!v21)
        {
          int64_t v10 = v20 + 1;
          if (v20 + 1 >= v38) {
            goto LABEL_34;
          }
          unint64_t v21 = v39[v10];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v38)
            {
LABEL_34:
              if ((v41 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v37;
                goto LABEL_41;
              }
              uint64_t v36 = 1 << *(unsigned char *)(v7 + 32);
              if (v36 >= 64) {
                bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *unint64_t v39 = -1 << v36;
              }
              uint64_t v3 = v37;
              *(void *)(v7 + 16) = 0;
              break;
            }
            unint64_t v21 = v39[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v10 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_43;
                }
                if (v10 >= v38) {
                  goto LABEL_34;
                }
                unint64_t v21 = v39[v10];
                ++v22;
                if (v21) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v10 = v22;
          }
        }
LABEL_21:
        unint64_t v14 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v10 << 6);
      }
      uint64_t v23 = *(void *)(v7 + 56);
      uint64_t v24 = v7;
      char v25 = *(unsigned char *)(*(void *)(v7 + 48) + v19);
      uint64_t v26 = v5;
      uint64_t v27 = *(void *)(v5 + 72);
      uint64_t v28 = v23 + v27 * v19;
      if (v41) {
        (*v15)(v42, v28, v43);
      }
      else {
        (*v40)(v42, v28, v43);
      }
      sub_2443BB990();
      sub_2443BB9A0();
      uint64_t result = sub_2443BB9D0();
      uint64_t v29 = -1 << *(unsigned char *)(v9 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v16 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v17 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v16 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(unsigned char *)(*(void *)(v9 + 48) + v17) = v25;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v15)(*(void *)(v9 + 56) + v27 * v17, v42, v43);
      ++*(void *)(v9 + 16);
      uint64_t v5 = v26;
      uint64_t v7 = v24;
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *uint64_t v3 = v9;
  return result;
}

uint64_t sub_24439DA60(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42068);
  uint64_t result = sub_2443BB530();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v31 = a2;
    int64_t v8 = 0;
    uint64_t v9 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        int64_t v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v13) {
          goto LABEL_31;
        }
        unint64_t v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          int64_t v8 = v18 + 1;
          if (v18 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v19 = v9[v8];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_31:
              if ((v31 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v9 = -1 << v30;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v8 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v19 = v9[v8];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v20;
          }
        }
LABEL_21:
        unint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      char v21 = *(unsigned char *)(*(void *)(v5 + 48) + v17);
      uint64_t v22 = *(void *)(*(void *)(v5 + 56) + 8 * v17);
      sub_2443BB990();
      sub_2443BB9A0();
      uint64_t result = sub_2443BB9D0();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(unsigned char *)(*(void *)(v7 + 48) + v15) = v21;
      *(void *)(*(void *)(v7 + 56) + 8 * v15) = v22;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24439DD2C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_2443B54B0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42098);
  int v47 = a2;
  uint64_t v10 = sub_2443BB530();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  int v49 = v8;
  uint64_t v50 = v5;
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v43 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  int v41 = v2;
  int64_t v42 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v44 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v48 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v16 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0;
  uint64_t v45 = v6;
  for (i = v9; ; uint64_t v9 = i)
  {
    if (v15)
    {
      unint64_t v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v22 = v21 | (v18 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v42) {
      break;
    }
    unint64_t v24 = v43;
    unint64_t v25 = v43[v23];
    ++v18;
    if (!v25)
    {
      int64_t v18 = v23 + 1;
      if (v23 + 1 >= v42) {
        goto LABEL_34;
      }
      unint64_t v25 = v43[v18];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v42)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v41;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v43[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v18 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v18 >= v42) {
              goto LABEL_34;
            }
            unint64_t v25 = v43[v18];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v18 = v26;
      }
    }
LABEL_21:
    unint64_t v15 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v6 + 72);
    unint64_t v28 = *(void *)(v9 + 48) + v27 * v22;
    if (v47)
    {
      (*v48)(v49, v28, v50);
      uint64_t v29 = (uint64_t *)(*(void *)(v9 + 56) + 16 * v22);
      uint64_t v30 = *v29;
      uint64_t v31 = v29[1];
    }
    else
    {
      (*v44)(v49, v28, v50);
      char v32 = (uint64_t *)(*(void *)(v9 + 56) + 16 * v22);
      uint64_t v30 = *v32;
      uint64_t v31 = v32[1];
      swift_bridgeObjectRetain();
    }
    sub_243FD6830();
    uint64_t result = sub_2443BA360();
    uint64_t v33 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v16 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v34) & ~*(void *)(v16 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v16 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v19 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v48)(*(void *)(v11 + 48) + v27 * v19, v49, v50);
    int64_t v20 = (void *)(*(void *)(v11 + 56) + 16 * v19);
    *int64_t v20 = v30;
    v20[1] = v31;
    ++*(void *)(v11 + 16);
    uint64_t v6 = v45;
  }
  swift_release();
  uint64_t v3 = v41;
  unint64_t v24 = v43;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v9 + 32);
  if (v40 >= 64) {
    bzero(v24, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v40;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_24439E138(uint64_t a1, char a2, uint64_t *a3)
{
  unint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v7 = sub_2443BB530();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  char v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    int64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          unint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_2443BB990();
    sub_2443BA590();
    uint64_t result = sub_2443BB9D0();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v4 = v36;
  int64_t v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v4 = v8;
  return result;
}

uint64_t sub_24439E444(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E47788);
  uint64_t result = sub_2443BB530();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = -1 << v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    id v34 = v3;
    int64_t v35 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v21 >= v35) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v35)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v34;
                goto LABEL_40;
              }
              if (v33 >= 64) {
                bzero((void *)(v5 + 64), 8 * v35);
              }
              else {
                *uint64_t v9 = v32;
              }
              uint64_t v3 = v34;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void **)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        id v31 = v30;
      }
      uint64_t result = sub_2443BB980();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24439E6F8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42078);
  uint64_t result = sub_2443BB530();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v33 = a2;
    uint64_t v32 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v30 = -1 << v10;
    uint64_t v31 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        int64_t v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v13) {
          goto LABEL_31;
        }
        unint64_t v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          int64_t v8 = v18 + 1;
          if (v18 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v19 = v9[v8];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_31:
              if ((v33 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v32;
                goto LABEL_38;
              }
              if (v31 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                *uint64_t v9 = v30;
              }
              uint64_t v3 = v32;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v8 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v19 = v9[v8];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v20;
          }
        }
LABEL_21:
        unint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
      char v22 = *(unsigned char *)(*(void *)(v5 + 56) + v17);
      uint64_t result = sub_2443BB980();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v7 + 48) + 8 * v15) = v21;
      *(unsigned char *)(*(void *)(v7 + 56) + v15) = v22;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24439E998(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_2443B54B0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3C2B8);
  int v45 = a2;
  uint64_t v10 = sub_2443BB530();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  int v41 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  char v39 = v2;
  int64_t v40 = (unint64_t)(v12 + 63) >> 6;
  int64_t v42 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v44 = v6;
  unint64_t v16 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v17 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v19 = 0;
  for (i = v9; ; uint64_t v9 = i)
  {
    if (v15)
    {
      unint64_t v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v22 = v21 | (v19 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    unint64_t v24 = v41;
    unint64_t v25 = v41[v23];
    ++v19;
    if (!v25)
    {
      int64_t v19 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v25 = v41[v19];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v45 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v41[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v19 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v19 >= v40) {
              goto LABEL_34;
            }
            unint64_t v25 = v41[v19];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v19 = v26;
      }
    }
LABEL_21:
    unint64_t v15 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v44 + 72);
    unint64_t v28 = *(void *)(v9 + 48) + v27 * v22;
    if (v45)
    {
      (*v16)(v8, v28, v5);
      uint64_t v29 = *(void *)(*(void *)(v9 + 56) + 8 * v22);
    }
    else
    {
      (*v42)(v8, v28, v5);
      uint64_t v29 = *(void *)(*(void *)(v9 + 56) + 8 * v22);
      swift_retain();
    }
    sub_243FD6830();
    uint64_t result = sub_2443BA360();
    uint64_t v30 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v20 = __clz(__rbit64((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v17 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v20 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v16)(*(void *)(v11 + 48) + v27 * v20, v8, v5);
    *(void *)(*(void *)(v11 + 56) + 8 * v20) = v29;
    ++*(void *)(v11 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = v41;
  if ((v45 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v9 + 32);
  if (v37 >= 64) {
    bzero(v24, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v37;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_24439ED8C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E47798);
  char v42 = a2;
  uint64_t v6 = sub_2443BB530();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  char v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    unint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    unint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = *(void *)(v5 + 56) + v31;
    uint64_t v36 = *(void *)v35;
    char v37 = *(unsigned char *)(v35 + 8);
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_2443BB990();
    sub_2443BA590();
    uint64_t result = sub_2443BB9D0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    int64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *int64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = *(void *)(v7 + 56) + v18;
    *(void *)uint64_t v20 = v36;
    *(unsigned char *)(v20 + 8) = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24439F0BC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42130);
  char v37 = a2;
  uint64_t v6 = sub_2443BB530();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    int64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_2443BB990();
    sub_2443BA590();
    uint64_t result = sub_2443BB9D0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    int64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *int64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24439F3C4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42128);
  char v38 = a2;
  uint64_t v6 = sub_2443BB530();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v11) {
      break;
    }
    unint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v37 + 8 * v23);
    ++v14;
    if (!v25)
    {
      int64_t v14 = v23 + 1;
      if (v23 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v37 + 8 * v14);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v14 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v37 + 8 * v14);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v14 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    long long v39 = *(_OWORD *)(*(void *)(v5 + 56) + v31);
    if ((v38 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_2443BB990();
    sub_2443BA590();
    uint64_t result = sub_2443BB9D0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v17 == v28;
        if (v17 == v28) {
          unint64_t v17 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v12 + 8 * v17);
      }
      while (v30 == -1);
      unint64_t v18 = __clz(__rbit64(~v30)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 16 * v18;
    unint64_t v20 = (void *)(*(void *)(v7 + 48) + v19);
    *unint64_t v20 = v34;
    v20[1] = v33;
    *(_OWORD *)(*(void *)(v7 + 56) + v19) = v39;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  unint64_t v24 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24439F6D4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E46B68);
  uint64_t result = sub_2443BB530();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *uint64_t v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = sub_2443BB980();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24439F98C(long long *a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  int64_t v8 = (void *)*v3;
  unint64_t v10 = sub_24419706C(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_2443A2280();
      goto LABEL_7;
    }
    sub_244399438(v13, a3 & 1);
    unint64_t v19 = sub_24419706C(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      unint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7] + 40 * v10;
    __swift_destroy_boxed_opaque_existential_1(v17);
    return sub_243EC06D8(a1, v17);
  }
LABEL_13:

  return sub_2443A1AB0(v10, a2, a1, v16);
}

uint64_t sub_24439FACC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_244196F54(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2443A2600();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_244399A18(v15, a4 & 1);
  unint64_t v21 = sub_244196F54(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  int64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *int64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

id sub_24439FC3C(uint64_t a1, void *a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_2441970A8((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 >= v12 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v15 = *v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      uint64_t v17 = type metadata accessor for PhotosPersonImage();
      return (id)sub_2443A6200(a1, v16 + *(void *)(*(void *)(v17 - 8) + 72) * v9, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
    }
    goto LABEL_11;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_2443A27B8();
    goto LABEL_7;
  }
  sub_244399D30(v12, a3 & 1);
  unint64_t v19 = sub_2441970A8((uint64_t)a2);
  if ((v13 & 1) != (v20 & 1))
  {
LABEL_15:
    sub_243EB156C(0, &qword_268E3FE38);
    id result = (id)sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v9 = v19;
  uint64_t v15 = *v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  sub_2443A1B1C(v9, (uint64_t)a2, a1, v15);

  return a2;
}

uint64_t sub_24439FDA8(uint64_t a1, uint64_t *a2, char a3)
{
  unint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  unint64_t v10 = sub_2441970EC(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 >= v13 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v16 = *v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t v18 = type metadata accessor for PhotosPersonImage();
      return sub_2443A6200(a1, v17 + *(void *)(*(void *)(v18 - 8) + 72) * v10, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
    }
    goto LABEL_11;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_2443A2A38();
    goto LABEL_7;
  }
  sub_24439A0D8(v13, a3 & 1);
  unint64_t v20 = sub_2441970EC(a2);
  if ((v14 & 1) != (v21 & 1))
  {
LABEL_15:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v10 = v20;
  uint64_t v16 = *v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  sub_2443A1BC4(v10, a2, a1, v16);

  return sub_243EBCB50((uint64_t)a2);
}

uint64_t sub_24439FF04(char a1, char a2, char a3)
{
  unint64_t v4 = v3;
  char v7 = a2 & 1;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_2441975D0(a2 & 1);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2443A2FC0();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(unsigned char *)(v16[7] + v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = v7;
    *(unsigned char *)(v16[7] + v10) = a1;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_24439A954(result, a3 & 1);
  uint64_t result = sub_2441975D0(v7);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E47790);
  uint64_t result = sub_2443BB8A0();
  __break(1u);
  return result;
}

uint64_t sub_2443A0034(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E4F8);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)*v3;
  unint64_t v13 = sub_2441973A0(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 >= v16 && (a3 & 1) != 0)
  {
LABEL_7:
    BOOL v19 = *v4;
    if (v17)
    {
LABEL_8:
      uint64_t v20 = v19[7];
      uint64_t result = swift_release();
      *(void *)(v20 + 8 * v13) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a3 & 1) == 0)
  {
    sub_2443A314C();
    goto LABEL_7;
  }
  sub_24439AC1C(v16, a3 & 1);
  unint64_t v22 = sub_2441973A0(a2);
  if ((v17 & 1) != (v23 & 1))
  {
LABEL_14:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v13 = v22;
  BOOL v19 = *v4;
  if (v17) {
    goto LABEL_8;
  }
LABEL_11:
  sub_243E9DD58(a2, (uint64_t)v10, &qword_268E3E4F8);
  return sub_2443A1C80(v13, (uint64_t)v10, a1, v19);
}

uint64_t sub_2443A01AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_244196F54(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2443A2448();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_244399700(v15, a4 & 1);
  unint64_t v21 = sub_244196F54(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v23 = (uint64_t *)(v18[6] + 16 * v12);
  *char v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

uint64_t sub_2443A031C(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2443A084C(a1, a2, a3, (uint64_t *)&unk_268E44800, &qword_268E41FC8);
}

uint64_t sub_2443A0330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_244196F54(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_2443A3670();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *unint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_24439B3DC(v17, a5 & 1);
  unint64_t v23 = sub_244196F54(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  BOOL v25 = (uint64_t *)(v20[6] + 16 * v14);
  *BOOL v25 = a3;
  v25[1] = a4;
  uint64_t v26 = (void *)(v20[7] + 16 * v14);
  *uint64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

uint64_t sub_2443A04B8(uint64_t a1, void *a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for GeneratedPreviewOptions(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = (void *)*v3;
  unint64_t v13 = sub_244196FCC(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 >= v16 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v19 = *v4;
    if (v17)
    {
LABEL_8:
      uint64_t v20 = v19[7];
      uint64_t v21 = type metadata accessor for FacePickerPersistentStorage.GeneratedPreviewArchive(0);
      return sub_2443A6200(a1, v20 + *(void *)(*(void *)(v21 - 8) + 72) * v13, type metadata accessor for FacePickerPersistentStorage.GeneratedPreviewArchive);
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a3 & 1) == 0)
  {
    sub_2443A3B80();
    goto LABEL_7;
  }
  sub_24439BD68(v16, a3 & 1);
  unint64_t v23 = sub_244196FCC(a2);
  if ((v17 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v13 = v23;
  uint64_t v19 = *v4;
  if (v17) {
    goto LABEL_8;
  }
LABEL_11:
  sub_2443A6268((uint64_t)a2, (uint64_t)v10, type metadata accessor for GeneratedPreviewOptions);
  return sub_2443A1D2C(v13, (uint64_t)v10, a1, v19);
}

uint64_t sub_2443A0664(uint64_t a1, void *a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for GeneratedPreviewOptions(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = (void *)*v3;
  unint64_t v13 = sub_244196FCC(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 >= v16 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v19 = *v4;
    if (v17)
    {
LABEL_8:
      uint64_t v20 = v19[7];
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3ABC8);
      return sub_243F70D20(a1, v20 + *(void *)(*(void *)(v21 - 8) + 72) * v13, &qword_268E3ABC8);
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a3 & 1) == 0)
  {
    sub_2443A3EB0();
    goto LABEL_7;
  }
  sub_24439C234(v16, a3 & 1);
  unint64_t v23 = sub_244196FCC(a2);
  if ((v17 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v13 = v23;
  uint64_t v19 = *v4;
  if (v17) {
    goto LABEL_8;
  }
LABEL_11:
  sub_2443A6268((uint64_t)a2, (uint64_t)v10, type metadata accessor for GeneratedPreviewOptions);
  return sub_2443A1E18(v13, (uint64_t)v10, a1, v19, type metadata accessor for GeneratedPreviewOptions, type metadata accessor for GeneratedPreviewOptions, &qword_268E3ABC8);
}

uint64_t sub_2443A0838(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2443A084C(a1, a2, a3, &qword_268E3B4C8, &qword_268E41F68);
}

uint64_t sub_2443A084C(uint64_t a1, uint64_t a2, char a3, uint64_t *a4, uint64_t *a5)
{
  int64_t v33 = a5;
  uint64_t v34 = a1;
  char v7 = (void **)v5;
  uint64_t v10 = sub_2443B54B0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (void *)*v5;
  unint64_t v16 = sub_2441972CC(a2);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v20 = v15;
  uint64_t v21 = v14[3];
  if (v21 < v19 || (a3 & 1) == 0)
  {
    if (v21 >= v19 && (a3 & 1) == 0)
    {
      sub_2443A4520(a4, v33);
      goto LABEL_7;
    }
    sub_24439CBD0(v19, a3 & 1, a4, v33);
    unint64_t v31 = sub_2441972CC(a2);
    if ((v20 & 1) == (v32 & 1))
    {
      unint64_t v16 = v31;
      char v22 = *v7;
      if (v20) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
      return sub_2443A1EF8(v16, (uint64_t)v13, v34, v22, a4);
    }
LABEL_15:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
LABEL_7:
  char v22 = *v7;
  if ((v20 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v23 = v22[7];
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 40);
  uint64_t v27 = v24;
  uint64_t v28 = v23 + *(void *)(v25 + 72) * v16;
  uint64_t v29 = v34;

  return v26(v28, v29, v27);
}

uint64_t sub_2443A0A6C(uint64_t a1, void *a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for ImageKeyFaceLoader.Context.ID(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)*v3;
  unint64_t v13 = sub_2441977DC(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 >= v16 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v19 = *v4;
    if (v17)
    {
LABEL_8:
      uint64_t v20 = v19[7];
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3ABB8);
      return sub_243F70D20(a1, v20 + *(void *)(*(void *)(v21 - 8) + 72) * v13, &qword_268E3ABB8);
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a3 & 1) == 0)
  {
    sub_2443A41E8();
    goto LABEL_7;
  }
  sub_24439C6F4(v16, a3 & 1);
  unint64_t v23 = sub_2441977DC(a2);
  if ((v17 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v13 = v23;
  uint64_t v19 = *v4;
  if (v17) {
    goto LABEL_8;
  }
LABEL_11:
  sub_2443A6268((uint64_t)a2, (uint64_t)v10, type metadata accessor for ImageKeyFaceLoader.Context.ID);
  return sub_2443A1E18(v13, (uint64_t)v10, a1, v19, type metadata accessor for ImageKeyFaceLoader.Context.ID, type metadata accessor for ImageKeyFaceLoader.Context.ID, &qword_268E3ABB8);
}

uint64_t sub_2443A0C40(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2443A084C(a1, a2, a3, &qword_268E3B4B8, &qword_268E41F38);
}

uint64_t sub_2443A0C54(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_244196F54(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2443A48C4();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_24439D09C(result, a4 & 1);
  uint64_t result = sub_244196F54(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v20 = a2;
  v20[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

_OWORD *sub_2443A0DB8(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_244196F54(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_2443A4A74();
      goto LABEL_7;
    }
    sub_24439D3A8(v15, a4 & 1);
    unint64_t v21 = sub_244196F54(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_2443BB8A0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    char v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    return sub_243EA6E2C(a1, v19);
  }
LABEL_13:
  sub_2443A1FF0(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_2443A0F0C(uint64_t a1, char a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_244197260(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_2443A4C5C();
      goto LABEL_7;
    }
    sub_24439D6A8(v13, a3 & 1);
    unint64_t v24 = sub_244197260(a2);
    if ((v14 & 1) == (v25 & 1))
    {
      unint64_t v10 = v24;
      char v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
LABEL_7:
  char v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = sub_2443BB450();
    uint64_t v19 = *(void *)(v18 - 8);
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 40);
    uint64_t v21 = v18;
    uint64_t v22 = v17 + *(void *)(v19 + 72) * v10;
    return v20(v22, a1, v21);
  }
LABEL_13:

  return sub_2443A205C(v10, a2, a1, v16);
}

uint64_t sub_2443A1074(unsigned __int8 a1, char a2, double a3)
{
  unint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_244197260(a1);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a2 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a2 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2443A4EE8();
LABEL_7:
    char v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(double *)(v16[7] + 8 * v10) = a3;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a1;
    *(double *)(v16[7] + 8 * v10) = a3;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_24439DA60(result, a2 & 1);
  uint64_t result = sub_244197260(a1);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    char v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_2443BB8A0();
  __break(1u);
  return result;
}

uint64_t sub_2443A119C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v28 = a2;
  uint64_t v9 = sub_2443B54B0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  BOOL v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)*v4;
  unint64_t v15 = sub_2441972CC(a3);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v21 = *v5;
    if (v19)
    {
LABEL_8:
      uint64_t v22 = (uint64_t *)(v21[7] + 16 * v15);
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v24 = v28;
      uint64_t *v22 = a1;
      v22[1] = v24;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_2443A5078();
    goto LABEL_7;
  }
  sub_24439DD2C(v18, a4 & 1);
  unint64_t v25 = sub_2441972CC(a3);
  if ((v19 & 1) != (v26 & 1))
  {
LABEL_14:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v15 = v25;
  uint64_t v21 = *v5;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  return sub_2443A2108(v15, (uint64_t)v12, a1, v28, v21);
}

void sub_2443A1354(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_2443A1360(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_2443A136C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  char v7 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_244196F54(a2, a3);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_2443A5350(a5);
LABEL_7:
    uint64_t v20 = (void *)*v7;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_24439E138(v17, a4 & 1, a5);
  unint64_t v22 = sub_244196F54(a2, a3);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_17:
    sub_2443BB8A0();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  uint64_t v20 = (void *)*v7;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v24 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v24 = a2;
  v24[1] = a3;
  *(void *)(v20[7] + 8 * v14) = a1;
  uint64_t v25 = v20[2];
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v27;

  swift_bridgeObjectRetain();
}

uint64_t sub_2443A14F4(char a1, uint64_t a2, char a3)
{
  unint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_24419706C(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2443A56A0();
LABEL_7:
    BOOL v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(unsigned char *)(v16[7] + v10) = a1 & 1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(void *)(v16[6] + 8 * v10) = a2;
    *(unsigned char *)(v16[7] + v10) = a1 & 1;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_24439E6F8(result, a3 & 1);
  uint64_t result = sub_24419706C(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    BOOL v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_2443BB8A0();
  __break(1u);
  return result;
}

uint64_t sub_2443A1628(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = sub_2443B54B0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v12 = (void *)*v3;
  unint64_t v14 = sub_2441972CC(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_2443A5830();
    goto LABEL_7;
  }
  sub_24439E998(v17, a3 & 1);
  unint64_t v23 = sub_2441972CC(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_2443A21C8(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_2443A17D0(uint64_t a1, uint64_t a2, char a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_244196F54(a1, a2);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2443A5C8C();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(double *)(v18[7] + 8 * v12) = a4;
      return result;
    }
    goto LABEL_11;
  }
  sub_24439F0BC(result, a3 & 1);
  uint64_t result = sub_244196F54(a1, a2);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v20 = a1;
  v20[1] = a2;
  *(double *)(v18[7] + 8 * v12) = a4;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

uint64_t sub_2443A1938(uint64_t a1, uint64_t a2, char a3, double a4, double a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_244196F54(a1, a2);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2443A5E3C();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (double *)(v20[7] + 16 * v14);
      *uint64_t v21 = a4;
      v21[1] = a5;
      return result;
    }
    goto LABEL_11;
  }
  sub_24439F3C4(result, a3 & 1);
  uint64_t result = sub_244196F54(a1, a2);
  if ((v18 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_2443BB8A0();
    __break(1u);
    return result;
  }
  unint64_t v14 = result;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v23 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v23 = a1;
  v23[1] = a2;
  char v24 = (double *)(v20[7] + 16 * v14);
  double *v24 = a4;
  v24[1] = a5;
  uint64_t v25 = v20[2];
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v27;

  return swift_bridgeObjectRetain();
}

uint64_t sub_2443A1AB0(unint64_t a1, uint64_t a2, long long *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_243EC06D8(a3, a4[7] + 40 * a1);
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

uint64_t sub_2443A1B1C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for PhotosPersonImage();
  uint64_t result = sub_2443A62D0(a3, v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

uint64_t sub_2443A1BC4(unint64_t a1, _OWORD *a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v7 = (_OWORD *)(a4[6] + 48 * a1);
  long long v8 = a2[1];
  *uint64_t v7 = *a2;
  v7[1] = v8;
  _OWORD v7[2] = a2[2];
  uint64_t v9 = a4[7];
  uint64_t v10 = type metadata accessor for PhotosPersonImage();
  uint64_t result = sub_2443A62D0(a3, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
  uint64_t v12 = a4[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a4[2] = v14;
  }
  return result;
}

uint64_t sub_2443A1C80(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E4F8);
  uint64_t result = sub_243EA697C(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, &qword_268E3E4F8);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_2443A1D2C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for GeneratedPreviewOptions(0);
  sub_2443A62D0(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, type metadata accessor for GeneratedPreviewOptions);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for FacePickerPersistentStorage.GeneratedPreviewArchive(0);
  uint64_t result = sub_2443A62D0(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, type metadata accessor for FacePickerPersistentStorage.GeneratedPreviewArchive);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

uint64_t sub_2443A1E18(unint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t *a7)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v13 = a4[6];
  uint64_t v14 = a5(0);
  sub_2443A62D0(a2, v13 + *(void *)(*(void *)(v14 - 8) + 72) * a1, a6);
  uint64_t v15 = a4[7];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(a7);
  uint64_t result = sub_243EA697C(a3, v15 + *(void *)(*(void *)(v16 - 8) + 72) * a1, a7);
  uint64_t v18 = a4[2];
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    a4[2] = v20;
  }
  return result;
}

uint64_t sub_2443A1EF8(unint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t *a5)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v10 = a4[6];
  uint64_t v11 = sub_2443B54B0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a2, v11);
  uint64_t v12 = a4[7];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v12 + *(void *)(*(void *)(v13 - 8) + 72) * a1, a3, v13);
  uint64_t v15 = a4[2];
  BOOL v16 = __OFADD__(v15, 1);
  uint64_t v17 = v15 + 1;
  if (v16) {
    __break(1u);
  }
  else {
    a4[2] = v17;
  }
  return result;
}

_OWORD *sub_2443A1FF0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_243EA6E2C(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_2443A205C(unint64_t a1, char a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = sub_2443BB450();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a3, v8);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

uint64_t sub_2443A2108(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v10 = a5[6];
  uint64_t v11 = sub_2443B54B0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a2, v11);
  uint64_t v13 = (void *)(a5[7] + 16 * a1);
  void *v13 = a3;
  v13[1] = a4;
  uint64_t v14 = a5[2];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    a5[2] = v16;
  }
  return result;
}

uint64_t sub_2443A21C8(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_2443B54B0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

void *sub_2443A2280()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42108);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 40 * v15;
    sub_243EC0740(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t result = (void *)sub_243EC06D8(v22, *(void *)(v4 + 56) + v18);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2443A2448()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E420D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2443A2600()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E38D10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2443A27B8()
{
  id v1 = v0;
  uint64_t v2 = type metadata accessor for PhotosPersonImage();
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E420A8);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_2443BB520();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    id result = (id)swift_release();
LABEL_25:
    *id v1 = v7;
    return result;
  }
  int64_t v24 = v1;
  id result = (id)(v6 + 64);
  uint64_t v9 = v5 + 64;
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v9 + 8 * v10) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v15) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v9 + 8 * v11);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_9:
    uint64_t v18 = 8 * v17;
    uint64_t v19 = *(void **)(*(void *)(v5 + 48) + 8 * v17);
    unint64_t v20 = *(void *)(v25 + 72) * v17;
    sub_2443A6268(*(void *)(v5 + 56) + v20, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
    *(void *)(*(void *)(v7 + 48) + v18) = v19;
    sub_2443A62D0((uint64_t)v4, *(void *)(v7 + 56) + v20, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
    id result = v19;
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v15)
  {
LABEL_23:
    id result = (id)swift_release();
    id v1 = v24;
    goto LABEL_25;
  }
  unint64_t v22 = *(void *)(v9 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2443A2A38()
{
  uint64_t v1 = type metadata accessor for PhotosPersonImage();
  uint64_t v40 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  long long v39 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E420B8);
  uint64_t v36 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_2443BB520();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v42 = v4;
  if (!v5)
  {
    uint64_t result = swift_release();
    uint64_t v35 = v42;
    uint64_t v34 = v36;
LABEL_25:
    *uint64_t v34 = v35;
    return result;
  }
  uint64_t v6 = v4;
  uint64_t v7 = (char *)(v4 + 64);
  uint64_t v8 = (char *)(v3 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  uint64_t v37 = v3 + 64;
  if (v6 != v3 || v7 >= &v8[8 * v9])
  {
    memmove(v7, v8, 8 * v9);
    uint64_t v6 = v42;
  }
  int64_t v10 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v41 = v3;
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v38 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v14 = (uint64_t)v39;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      int64_t v43 = v10;
      unint64_t v16 = v15 | (v10 << 6);
      uint64_t result = v41;
      goto LABEL_9;
    }
    int64_t v30 = v10 + 1;
    uint64_t result = v41;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v30 >= v38) {
      goto LABEL_23;
    }
    unint64_t v31 = *(void *)(v37 + 8 * v30);
    int64_t v32 = v10 + 1;
    if (!v31)
    {
      int64_t v32 = v30 + 1;
      if (v30 + 1 >= v38) {
        goto LABEL_23;
      }
      unint64_t v31 = *(void *)(v37 + 8 * v32);
      if (!v31) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v31 - 1) & v31;
    int64_t v43 = v32;
    unint64_t v16 = __clz(__rbit64(v31)) + (v32 << 6);
LABEL_9:
    uint64_t v18 = 48 * v16;
    uint64_t v19 = *(void *)(result + 48) + 48 * v16;
    uint64_t v20 = *(void *)v19;
    uint64_t v21 = *(void *)(v19 + 8);
    uint64_t v23 = *(void *)(v19 + 16);
    uint64_t v22 = *(void *)(v19 + 24);
    char v24 = *(unsigned char *)(v19 + 32);
    uint64_t v25 = *(void **)(v19 + 40);
    unint64_t v26 = *(void *)(v40 + 72) * v16;
    sub_2443A6268(*(void *)(result + 56) + v26, v14, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
    uint64_t v27 = v42;
    uint64_t v28 = *(void *)(v42 + 48) + v18;
    *(void *)uint64_t v28 = v20;
    *(void *)(v28 + 8) = v21;
    *(void *)(v28 + 16) = v23;
    *(void *)(v28 + 24) = v22;
    *(unsigned char *)(v28 + 32) = v24;
    *(void *)(v28 + 40) = v25;
    sub_2443A62D0(v14, *(void *)(v27 + 56) + v26, (uint64_t (*)(void))type metadata accessor for PhotosPersonImage);
    id v29 = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int64_t v10 = v43;
  }
  int64_t v33 = v30 + 2;
  if (v33 >= v38)
  {
LABEL_23:
    uint64_t result = swift_release();
    uint64_t v34 = v36;
    uint64_t v35 = v42;
    goto LABEL_25;
  }
  unint64_t v31 = *(void *)(v37 + 8 * v33);
  if (v31)
  {
    int64_t v32 = v33;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v32 = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (v32 >= v38) {
      goto LABEL_23;
    }
    unint64_t v31 = *(void *)(v37 + 8 * v32);
    ++v33;
    if (v31) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2443A2D2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Bubble(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E41FD8);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_2443BB520();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v8;
    return result;
  }
  int64_t v30 = v1;
  uint64_t result = (void *)(v7 + 64);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v11);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 64);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v26 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v16) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v10 + 8 * v26);
    ++v12;
    if (!v27)
    {
      int64_t v12 = v26 + 1;
      if (v26 + 1 >= v16) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v10 + 8 * v12);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v15 = (v27 - 1) & v27;
    unint64_t v18 = __clz(__rbit64(v27)) + (v12 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v3 + 72) * v18;
    sub_2443A6268(*(void *)(v6 + 48) + v19, (uint64_t)v5, type metadata accessor for Bubble);
    uint64_t v20 = 32 * v18;
    uint64_t v21 = (long long *)(*(void *)(v6 + 56) + v20);
    uint64_t v22 = *(void *)(v8 + 48) + v19;
    long long v23 = *v21;
    long long v31 = v21[1];
    long long v32 = v23;
    uint64_t result = (void *)sub_2443A62D0((uint64_t)v5, v22, type metadata accessor for Bubble);
    char v24 = (_OWORD *)(*(void *)(v8 + 56) + v20);
    long long v25 = v31;
    _OWORD *v24 = v32;
    v24[1] = v25;
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v16)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v30;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v10 + 8 * v28);
  if (v27)
  {
    int64_t v12 = v28;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v10 + 8 * v12);
    ++v28;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2443A2FC0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42000);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v20 = __clz(__rbit64(v18));
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = v20 + (v9 << 6);
LABEL_12:
    char v16 = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2443A314C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E4F8);
  uint64_t v26 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E420C8);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_2443BB520();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v7;
    return result;
  }
  char v24 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v25 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v14) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v10;
    if (!v21)
    {
      int64_t v10 = v20 + 1;
      if (v20 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v10);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v26 + 72) * v16;
    sub_243E9DD58(*(void *)(v5 + 48) + v17, (uint64_t)v4, &qword_268E3E4F8);
    uint64_t v18 = 8 * v16;
    uint64_t v19 = *(void *)(*(void *)(v5 + 56) + 8 * v16);
    sub_243EA697C((uint64_t)v4, *(void *)(v7 + 48) + v17, &qword_268E3E4F8);
    *(void *)(*(void *)(v7 + 56) + v18) = v19;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    int64_t v10 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v10);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2443A33C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ConversationContextItem();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E420E0);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_2443BB520();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v7;
    return result;
  }
  unint64_t v27 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_2443A6268(*(void *)(v5 + 56) + v21, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ConversationContextItem);
    int64_t v22 = (void *)(*(void *)(v7 + 48) + v17);
    void *v22 = v19;
    v22[1] = v20;
    sub_2443A62D0((uint64_t)v4, *(void *)(v7 + 56) + v21, (uint64_t (*)(void))type metadata accessor for ConversationContextItem);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2443A365C()
{
  return sub_2443A4520((uint64_t *)&unk_268E44800, &qword_268E41FC8);
}

void *sub_2443A3670()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42040);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v23 = v19;
    v23[1] = v18;
    unint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    void *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2443A382C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3B520);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    swift_retain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2443A39D8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3B4F0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    swift_retain();
    id result = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2443A3B80()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for FacePickerPersistentStorage.GeneratedPreviewArchive(0);
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for GeneratedPreviewOptions(0);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E41F20);
  uint64_t v8 = *v0;
  uint64_t v9 = sub_2443BB520();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
    id result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v10;
    return result;
  }
  int64_t v27 = v1;
  id result = (void *)(v9 + 64);
  uint64_t v12 = v8 + 64;
  unint64_t v13 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v12 + 8 * v13) {
    id result = memmove(result, (const void *)(v8 + 64), 8 * v13);
  }
  int64_t v14 = 0;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v15 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(v8 + 64);
  int64_t v18 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      unint64_t v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v18) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v12 + 8 * v23);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v23 + 1;
      if (v23 + 1 >= v18) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v12 + 8 * v14);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v17 = (v24 - 1) & v24;
    unint64_t v20 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_9:
    unint64_t v21 = *(void *)(v28 + 72) * v20;
    sub_2443A6268(*(void *)(v8 + 48) + v21, (uint64_t)v7, type metadata accessor for GeneratedPreviewOptions);
    unint64_t v22 = *(void *)(v29 + 72) * v20;
    sub_2443A6268(*(void *)(v8 + 56) + v22, (uint64_t)v4, type metadata accessor for FacePickerPersistentStorage.GeneratedPreviewArchive);
    sub_2443A62D0((uint64_t)v7, *(void *)(v10 + 48) + v21, type metadata accessor for GeneratedPreviewOptions);
    id result = (void *)sub_2443A62D0((uint64_t)v4, *(void *)(v10 + 56) + v22, type metadata accessor for FacePickerPersistentStorage.GeneratedPreviewArchive);
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v18)
  {
LABEL_23:
    id result = (void *)swift_release();
    uint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v12 + 8 * v25);
  if (v24)
  {
    int64_t v14 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v14 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v14 >= v18) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v12 + 8 * v14);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2443A3EB0()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3ABC8);
  uint64_t v28 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for GeneratedPreviewOptions(0);
  uint64_t v27 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E41F80);
  uint64_t v8 = *v0;
  uint64_t v9 = sub_2443BB520();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
    id result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v10;
    return result;
  }
  int64_t v25 = v1;
  id result = (void *)(v9 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12) {
    id result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  }
  uint64_t v26 = v8 + 64;
  int64_t v13 = 0;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v8 + 64);
  int64_t v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      unint64_t v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v19 = v18 | (v13 << 6);
      goto LABEL_9;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v22 >= v17) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v17) {
        goto LABEL_23;
      }
      unint64_t v23 = *(void *)(v26 + 8 * v13);
      if (!v23) {
        break;
      }
    }
LABEL_22:
    unint64_t v16 = (v23 - 1) & v23;
    unint64_t v19 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_9:
    unint64_t v20 = *(void *)(v27 + 72) * v19;
    sub_2443A6268(*(void *)(v8 + 48) + v20, (uint64_t)v7, type metadata accessor for GeneratedPreviewOptions);
    unint64_t v21 = *(void *)(v28 + 72) * v19;
    sub_243E9DD58(*(void *)(v8 + 56) + v21, (uint64_t)v4, &qword_268E3ABC8);
    sub_2443A62D0((uint64_t)v7, *(void *)(v10 + 48) + v20, type metadata accessor for GeneratedPreviewOptions);
    id result = (void *)sub_243EA697C((uint64_t)v4, *(void *)(v10 + 56) + v21, &qword_268E3ABC8);
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v17)
  {
LABEL_23:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_25;
  }
  unint64_t v23 = *(void *)(v26 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v17) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2443A41D4()
{
  return sub_2443A4520(&qword_268E3B4C8, &qword_268E41F68);
}

void *sub_2443A41E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3ABB8);
  uint64_t v28 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ImageKeyFaceLoader.Context.ID(0);
  uint64_t v27 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E41F50);
  uint64_t v8 = *v0;
  uint64_t v9 = sub_2443BB520();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
    id result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v10;
    return result;
  }
  int64_t v25 = v1;
  id result = (void *)(v9 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12) {
    id result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  }
  uint64_t v26 = v8 + 64;
  int64_t v13 = 0;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v8 + 64);
  int64_t v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      unint64_t v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v19 = v18 | (v13 << 6);
      goto LABEL_9;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v22 >= v17) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v17) {
        goto LABEL_23;
      }
      unint64_t v23 = *(void *)(v26 + 8 * v13);
      if (!v23) {
        break;
      }
    }
LABEL_22:
    unint64_t v16 = (v23 - 1) & v23;
    unint64_t v19 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_9:
    unint64_t v20 = *(void *)(v27 + 72) * v19;
    sub_2443A6268(*(void *)(v8 + 48) + v20, (uint64_t)v7, type metadata accessor for ImageKeyFaceLoader.Context.ID);
    unint64_t v21 = *(void *)(v28 + 72) * v19;
    sub_243E9DD58(*(void *)(v8 + 56) + v21, (uint64_t)v4, &qword_268E3ABB8);
    sub_2443A62D0((uint64_t)v7, *(void *)(v10 + 48) + v20, type metadata accessor for ImageKeyFaceLoader.Context.ID);
    id result = (void *)sub_243EA697C((uint64_t)v4, *(void *)(v10 + 56) + v21, &qword_268E3ABB8);
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v17)
  {
LABEL_23:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_25;
  }
  unint64_t v23 = *(void *)(v26 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v17) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2443A450C()
{
  return sub_2443A4520(&qword_268E3B4B8, &qword_268E41F38);
}

void *sub_2443A4520(uint64_t *a1, uint64_t *a2)
{
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v48 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v44 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_2443B54B0();
  uint64_t v47 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v42 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v35 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_2443BB520();
  uint64_t v8 = *(void *)(v6 + 16);
  uint64_t v49 = v7;
  if (!v8)
  {
    id result = (void *)swift_release();
    uint64_t v34 = v49;
    int64_t v33 = v35;
LABEL_25:
    *int64_t v33 = v34;
    return result;
  }
  uint64_t v9 = v7;
  id result = (void *)(v7 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v6 || (unint64_t)result >= v6 + 64 + 8 * v11)
  {
    id result = memmove(result, (const void *)(v6 + 64), 8 * v11);
    uint64_t v9 = v49;
  }
  int64_t v12 = 0;
  *(void *)(v9 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  uint64_t v46 = v6;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 64);
  uint64_t v36 = v6 + 64;
  int64_t v37 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v16 = v48;
  uint64_t v17 = v47;
  uint64_t v40 = v48 + 16;
  uint64_t v41 = v47 + 16;
  uint64_t v38 = v48 + 32;
  uint64_t v39 = v47 + 32;
  unint64_t v18 = v42;
  uint64_t v19 = v43;
  uint64_t v20 = v45;
  uint64_t v21 = v49;
  while (1)
  {
    if (v15)
    {
      unint64_t v22 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      int64_t v50 = v12;
      unint64_t v23 = v22 | (v12 << 6);
      uint64_t v24 = v46;
      goto LABEL_9;
    }
    int64_t v29 = v12 + 1;
    uint64_t v24 = v46;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v29 >= v37) {
      goto LABEL_23;
    }
    unint64_t v30 = *(void *)(v36 + 8 * v29);
    int64_t v31 = v12 + 1;
    if (!v30)
    {
      int64_t v31 = v29 + 1;
      if (v29 + 1 >= v37) {
        goto LABEL_23;
      }
      unint64_t v30 = *(void *)(v36 + 8 * v31);
      if (!v30) {
        break;
      }
    }
LABEL_22:
    unint64_t v15 = (v30 - 1) & v30;
    int64_t v50 = v31;
    unint64_t v23 = __clz(__rbit64(v30)) + (v31 << 6);
LABEL_9:
    unint64_t v25 = *(void *)(v17 + 72) * v23;
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v18, *(void *)(v24 + 48) + v25, v19);
    unint64_t v26 = *(void *)(v16 + 72) * v23;
    unint64_t v27 = *(void *)(v24 + 56) + v26;
    uint64_t v28 = v44;
    (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))(v44, v27, v20);
    (*(void (**)(unint64_t, char *, uint64_t))(v17 + 32))(*(void *)(v21 + 48) + v25, v18, v19);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v16 + 32))(*(void *)(v21 + 56) + v26, v28, v20);
    int64_t v12 = v50;
  }
  int64_t v32 = v29 + 2;
  if (v32 >= v37)
  {
LABEL_23:
    id result = (void *)swift_release();
    int64_t v33 = v35;
    uint64_t v34 = v49;
    goto LABEL_25;
  }
  unint64_t v30 = *(void *)(v36 + 8 * v32);
  if (v30)
  {
    int64_t v31 = v32;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v31 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v31 >= v37) {
      goto LABEL_23;
    }
    unint64_t v30 = *(void *)(v36 + 8 * v31);
    ++v32;
    if (v30) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2443A48C4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E41FF8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    unint64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    void *v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2443A4A74()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3C2D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v25 = v1;
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_243EA0958(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_243EA6E2C(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2443A4C5C()
{
  uint64_t v1 = sub_2443BB450();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42060);
  int64_t v22 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_2443BB520();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (void *)swift_release();
    uint64_t *v22 = v7;
    return result;
  }
  id result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v23 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v26 = v2 + 16;
  int64_t v24 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v25 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v18 >= v24) {
      goto LABEL_23;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_23;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v10);
      if (!v19) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_9:
    char v16 = *(unsigned char *)(*(void *)(v5 + 48) + v15);
    unint64_t v17 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 56) + v17, v1);
    *(unsigned char *)(*(void *)(v7 + 48) + v15) = v16;
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 56) + v17, v4, v1);
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v24) {
    goto LABEL_23;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v24) {
      goto LABEL_23;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_2443A4EE8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42068);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v20 = __clz(__rbit64(v18));
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = v20 + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2443A5078()
{
  uint64_t v38 = sub_2443B54B0();
  uint64_t v1 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  int64_t v37 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42098);
  int64_t v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_2443BB520();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v40 = v4;
  if (!v5)
  {
    id result = (void *)swift_release();
    uint64_t v30 = v40;
    int64_t v29 = v32;
LABEL_25:
    *int64_t v29 = v30;
    return result;
  }
  uint64_t v6 = v4;
  id result = (void *)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v40;
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v39 = v3;
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v33 = v3 + 64;
  int64_t v34 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v35 = v1 + 32;
  uint64_t v36 = v1 + 16;
  unint64_t v14 = v37;
  uint64_t v13 = v38;
  uint64_t v15 = v40;
  while (1)
  {
    if (v12)
    {
      unint64_t v16 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v17 = v16 | (v9 << 6);
      uint64_t v18 = v39;
      goto LABEL_9;
    }
    int64_t v26 = v9 + 1;
    uint64_t v18 = v39;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v9);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v17 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v14, *(void *)(v18 + 48) + v19, v13);
    uint64_t v20 = *(void *)(v18 + 56);
    uint64_t v21 = 16 * v17;
    int64_t v22 = (uint64_t *)(v20 + 16 * v17);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v15 + 48) + v19, v14, v13);
    uint64_t v25 = (void *)(*(void *)(v15 + 56) + v21);
    *uint64_t v25 = v23;
    v25[1] = v24;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v34)
  {
LABEL_23:
    id result = (void *)swift_release();
    int64_t v29 = v32;
    uint64_t v30 = v40;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

id sub_2443A5350(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2443BB520();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    void *v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2443A54FC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E47788);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2443A56A0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42078);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v20 = __clz(__rbit64(v18));
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = v20 + (v9 << 6);
LABEL_12:
    char v16 = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2443A5830()
{
  uint64_t v1 = sub_2443B54B0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3C2B8);
  int64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_2443BB520();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (void *)swift_release();
    *int64_t v23 = v7;
    return result;
  }
  id result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v24 = v5 + 64;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v27 = v2 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = (void *)swift_retain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_2443A5AC8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E47798);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = *(void *)(v2 + 56) + v16;
    uint64_t v21 = *(void *)v20;
    LOBYTE(v20) = *(unsigned char *)(v20 + 8);
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    void *v22 = v19;
    v22[1] = v18;
    uint64_t v23 = *(void *)(v4 + 56) + v16;
    *(void *)uint64_t v23 = v21;
    *(unsigned char *)(v23 + 8) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_retain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2443A5C8C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42130);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2443A5E3C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E42128);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v20;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2443A5FE8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E46B68);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2443BB520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    id result = (void *)swift_retain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2443A618C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E39718);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for GPGenerationRecipeData(uint64_t a1)
{
  return sub_243EB156C(a1, &qword_268E47780);
}

uint64_t sub_2443A6200(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_2443A6268(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2443A62D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2443A6338@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_2443A7134();
  sub_2443B55F0();
  swift_release();
  swift_beginAccess();
  return sub_2443A71FC(v1 + 24, a1);
}

uint64_t sub_2443A63CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 24;
  swift_beginAccess();
  sub_2443A718C(a2, v3);
  return swift_endAccess();
}

uint64_t sub_2443A6430()
{
  swift_getKeyPath();
  sub_2443A7134();
  sub_2443B55F0();
  swift_release();
  return MEMORY[0x24568FDF0](v0 + OBJC_IVAR____TtC15ImagePlayground14ErrorViewModel__feedbackInputProvider);
}

uint64_t sub_2443A64B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + OBJC_IVAR____TtC15ImagePlayground14ErrorViewModel__feedbackInputProvider + 8) = a3;
  return swift_unknownObjectWeakAssign();
}

id sub_2443A64DC()
{
  uint64_t v1 = OBJC_IVAR____TtC15ImagePlayground14ErrorViewModel____lazy_storage___dateFormatter;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC15ImagePlayground14ErrorViewModel____lazy_storage___dateFormatter);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC15ImagePlayground14ErrorViewModel____lazy_storage___dateFormatter);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
    objc_msgSend(v4, sel_setDateStyle_, 1);
    objc_msgSend(v4, sel_setTimeStyle_, 2);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_2443A6578()
{
  swift_getKeyPath();
  uint64_t v10 = v0;
  sub_2443A7134();
  sub_2443B55F0();
  swift_release();
  swift_beginAccess();
  sub_2443A71FC(v0 + 24, (uint64_t)v11);
  uint64_t v1 = v12;
  if (!v12)
  {
    sub_2443110EC((uint64_t)v11);
LABEL_5:
    swift_bridgeObjectRelease();
    return 0x4E574F4E4B4E55;
  }
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v11, v12);
  uint64_t v3 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  (*(void (**)(char *))(v3 + 16))(v5);
  sub_2443110EC((uint64_t)v11);
  uint64_t v6 = sub_2443B4F00();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  if (!v8) {
    goto LABEL_5;
  }
  return v6;
}

uint64_t sub_2443A6728()
{
  id v0 = sub_2443A64DC();
  uint64_t v1 = (void *)sub_2443B53D0();
  id v2 = objc_msgSend(v0, sel_stringFromDate_, v1);

  sub_2443BA4F0();
  id v3 = objc_msgSend(self, sel_processInfo);
  id v4 = objc_msgSend(v3, sel_processName);

  sub_2443BA4F0();
  sub_2443BB2D0();
  sub_2443BA5F0();
  sub_2443BA5F0();
  swift_bridgeObjectRelease();
  sub_2443BA5F0();
  sub_2443BA5F0();
  swift_bridgeObjectRelease();
  sub_2443BA5F0();
  sub_2443A6578();
  sub_2443BA5F0();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2443A68D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[17] = a4;
  sub_2443BA950();
  v4[18] = sub_2443BA940();
  uint64_t v6 = sub_2443BA8E0();
  v4[19] = v6;
  v4[20] = v5;
  return MEMORY[0x270FA2498](sub_2443A6970, v6, v5);
}

uint64_t sub_2443A6970()
{
  uint64_t v1 = v0[17];
  sub_2443BB2D0();
  swift_bridgeObjectRelease();
  sub_2443A6578();
  sub_2443BA5F0();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_2443A6728();
  uint64_t v4 = v3;
  type metadata accessor for TapToRadarManager.LogReason();
  uint64_t inited = swift_initStackObject();
  v0[21] = inited;
  *(void *)(inited + 48) = 0x7567656C62627542;
  *(void *)(inited + 56) = 0xE90000000000006DLL;
  *(void *)(inited + 64) = 5459817;
  *(void *)(inited + 72) = 0xE300000000000000;
  *(void *)(inited + 80) = 0xD000000000000014;
  *(void *)(inited + 88) = 0x80000002443F6A50;
  *(void *)(inited + 96) = v2;
  *(void *)(inited + 104) = v4;
  *(void *)(inited + 16) = 0xD000000000000011;
  *(void *)(inited + 24) = 0x80000002443F6A30;
  *(_OWORD *)(inited + 32) = xmmword_2443C5620;
  swift_getKeyPath();
  v0[16] = v1;
  sub_2443A7134();
  sub_2443B55F0();
  swift_release();
  uint64_t v6 = v1 + OBJC_IVAR____TtC15ImagePlayground14ErrorViewModel__feedbackInputProvider;
  if (MEMORY[0x24568FDF0](v6))
  {
    uint64_t v7 = *(void *)(v6 + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(ObjectType, v7);
    v0[22] = v9;
    swift_unknownObjectRelease();
    v0[23] = sub_24416EBD4();
    uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_268E41AD0 + dword_268E41AD0);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[24] = v10;
    void *v10 = v0;
    v10[1] = sub_2443A6CDC;
    return v17(inited, v9);
  }
  else
  {
    swift_release();
    if (qword_268E378E8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_2443B6800();
    __swift_project_value_buffer(v12, (uint64_t)qword_268E39360);
    int64_t v13 = sub_2443B67E0();
    os_log_type_t v14 = sub_2443BAD10();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v15 = 0;
      _os_log_impl(&dword_243E89000, v13, v14, "feedbackInput is nil", v15, 2u);
      MEMORY[0x24568FCC0](v15, -1, -1);
    }
    swift_setDeallocating();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    uint64_t v16 = (uint64_t (*)(void))v0[1];
    return v16();
  }
}

uint64_t sub_2443A6CDC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_2443A6E20, v3, v2);
}

uint64_t sub_2443A6E20()
{
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2443A6ED0()
{
  swift_release();
  sub_2443110EC(v0 + 24);
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ImagePlayground14ErrorViewModel_timestamp;
  uint64_t v2 = sub_2443B5440();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_243EAE8F4(v0 + OBJC_IVAR____TtC15ImagePlayground14ErrorViewModel__feedbackInputProvider);

  uint64_t v3 = v0 + OBJC_IVAR____TtC15ImagePlayground14ErrorViewModel___observationRegistrar;
  uint64_t v4 = sub_2443B5630();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_2443A6FE4()
{
  return type metadata accessor for ErrorViewModel();
}

uint64_t type metadata accessor for ErrorViewModel()
{
  uint64_t result = qword_268E477C0;
  if (!qword_268E477C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2443A7038()
{
  uint64_t result = sub_2443B5440();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2443B5630();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

unint64_t sub_2443A7134()
{
  unint64_t result = qword_268E399B8;
  if (!qword_268E399B8)
  {
    type metadata accessor for ErrorViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E399B8);
  }
  return result;
}

uint64_t sub_2443A718C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E399C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_2443A71FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E399C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2443A7264(uint64_t a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
  }
  else
  {
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v8 = a3[6];
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[7];
    uint64_t v13 = a1 + v12;
    uint64_t v14 = (uint64_t)a2 + v12;
    uint64_t v15 = *(void *)v14;
    char v16 = *(unsigned char *)(v14 + 8);
    sub_243EB1808(*(void *)v14, v16);
    *(void *)uint64_t v13 = v15;
    *(unsigned char *)(v13 + 8) = v16;
    uint64_t v17 = a3[8];
    uint64_t v18 = (void *)(a1 + v17);
    unint64_t v19 = (uint64_t *)((char *)a2 + v17);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_2443B8640();
      uint64_t v21 = *(void *)(v20 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
      {
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
        memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v18, v19, v20);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      }
    }
    else
    {
      *uint64_t v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v23 = a3[9];
    int64_t v24 = (void *)(a1 + v23);
    unint64_t v25 = (uint64_t *)((char *)a2 + v23);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = sub_2443B77D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
    }
    else
    {
      void *v24 = *v25;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v27 = a3[10];
    int64_t v28 = (void *)(a1 + v27);
    int64_t v29 = (uint64_t *)((char *)a2 + v27);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E44CB0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v30 = sub_2443B6F30();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
    }
    else
    {
      void *v28 = *v29;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v31 = a3[11];
    uint64_t v32 = a3[12];
    uint64_t v33 = (_OWORD *)(a1 + v31);
    int64_t v34 = (_OWORD *)((char *)a2 + v31);
    long long v35 = v34[5];
    v33[4] = v34[4];
    v33[5] = v35;
    v33[6] = v34[6];
    long long v36 = v34[1];
    *uint64_t v33 = *v34;
    v33[1] = v36;
    long long v37 = v34[3];
    v33[2] = v34[2];
    v33[3] = v37;
    uint64_t v38 = a1 + v32;
    uint64_t v39 = (uint64_t)a2 + v32;
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3CD20);
    uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 16);
    v41(v38, v39, v40);
    v41(a1 + a3[13], (uint64_t)a2 + a3[13], v40);
    uint64_t v42 = a3[14];
    uint64_t v43 = a1 + v42;
    uint64_t v44 = (uint64_t)a2 + v42;
    *(_OWORD *)uint64_t v43 = *(_OWORD *)v44;
    *(void *)(v43 + 16) = *(void *)(v44 + 16);
  }
  swift_retain();
  return a1;
}

uint64_t sub_2443A76AC(uint64_t a1, int *a2)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  sub_243EB18F8(*(void *)(a1 + a2[7]), *(unsigned char *)(a1 + a2[7] + 8));
  uint64_t v6 = a1 + a2[8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2443B8640();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = a1 + a2[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2443B77D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = a1 + a2[10];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E44CB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_2443B6F30();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  else
  {
    swift_release();
  }
  uint64_t v13 = a1 + a2[12];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3CD20);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);
  v15(v13, v14);
  v15(a1 + a2[13], v14);

  return swift_release();
}

uint64_t sub_2443A7960(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = *(void *)v13;
  char v15 = *(unsigned char *)(v13 + 8);
  sub_243EB1808(*(void *)v13, v15);
  *(void *)uint64_t v12 = v14;
  *(unsigned char *)(v12 + 8) = v15;
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_2443B8640();
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
      memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
  }
  else
  {
    *uint64_t v17 = *v18;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)(a1 + v22);
  int64_t v24 = (void *)(a2 + v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = sub_2443B77D0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
  }
  else
  {
    *uint64_t v23 = *v24;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v26 = a3[10];
  uint64_t v27 = (void *)(a1 + v26);
  int64_t v28 = (void *)(a2 + v26);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E44CB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v29 = sub_2443B6F30();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
  }
  else
  {
    void *v27 = *v28;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v30 = a3[11];
  uint64_t v31 = a3[12];
  uint64_t v32 = (_OWORD *)(a1 + v30);
  uint64_t v33 = (_OWORD *)(a2 + v30);
  long long v34 = v33[5];
  v32[4] = v33[4];
  v32[5] = v34;
  v32[6] = v33[6];
  long long v35 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v35;
  long long v36 = v33[3];
  _OWORD v32[2] = v33[2];
  v32[3] = v36;
  uint64_t v37 = a1 + v31;
  uint64_t v38 = a2 + v31;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3CD20);
  uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 16);
  v40(v37, v38, v39);
  v40(a1 + a3[13], a2 + a3[13], v39);
  uint64_t v41 = a3[14];
  uint64_t v42 = a1 + v41;
  uint64_t v43 = a2 + v41;
  *(_OWORD *)uint64_t v42 = *(_OWORD *)v43;
  *(void *)(v42 + 16) = *(void *)(v43 + 16);
  swift_retain();
  return a1;
}

uint64_t sub_2443A7D5C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = *(void *)v12;
  LOBYTE(v8) = *(unsigned char *)(v12 + 8);
  sub_243EB1808(*(void *)v12, v8);
  uint64_t v14 = *(void *)v11;
  char v15 = *(unsigned char *)(v11 + 8);
  *(void *)uint64_t v11 = v13;
  *(unsigned char *)(v11 + 8) = v8;
  sub_243EB18F8(v14, v15);
  if (a1 != a2)
  {
    uint64_t v16 = a3[8];
    uint64_t v17 = (void *)(a1 + v16);
    uint64_t v18 = (void *)(a2 + v16);
    sub_243E9DDBC(a1 + v16, (uint64_t *)&unk_268E38400);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_2443B8640();
      uint64_t v20 = *(void *)(v19 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
      {
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
        memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      }
    }
    else
    {
      *uint64_t v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v22 = a3[9];
    uint64_t v23 = (void *)(a1 + v22);
    int64_t v24 = (void *)(a2 + v22);
    sub_243E9DDBC(a1 + v22, &qword_268E3DE18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v25 = sub_2443B77D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    }
    else
    {
      *uint64_t v23 = *v24;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v26 = a3[10];
    uint64_t v27 = (void *)(a1 + v26);
    int64_t v28 = (void *)(a2 + v26);
    sub_243E9DDBC(a1 + v26, (uint64_t *)&unk_268E44CB0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E44CB0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v29 = sub_2443B6F30();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
    }
    else
    {
      void *v27 = *v28;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v30 = a3[11];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (void *)(a2 + v30);
  *uint64_t v31 = *v32;
  v31[1] = v32[1];
  long long v31[2] = v32[2];
  v31[3] = v32[3];
  v31[4] = v32[4];
  v31[5] = v32[5];
  v31[6] = v32[6];
  v31[7] = v32[7];
  v31[8] = v32[8];
  v31[9] = v32[9];
  v31[10] = v32[10];
  v31[11] = v32[11];
  v31[12] = v32[12];
  v31[13] = v32[13];
  uint64_t v33 = a3[12];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3CD20);
  uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 24);
  v37(v34, v35, v36);
  v37(a1 + a3[13], a2 + a3[13], v36);
  uint64_t v38 = a3[14];
  uint64_t v39 = (void *)(a1 + v38);
  uint64_t v40 = (void *)(a2 + v38);
  *uint64_t v39 = *v40;
  v39[1] = v40[1];
  v39[2] = v40[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2443A8228(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  char v15 = (void *)(a1 + v12);
  uint64_t v16 = (const void *)(a2 + v12);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_2443B8640();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
      memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v19 + 32))(v15, v16, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v15, 0, 1, v18);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  uint64_t v21 = a3[9];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (const void *)(a2 + v21);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = sub_2443B77D0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v25 - 8) + 32))(v22, v23, v25);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  uint64_t v26 = a3[10];
  uint64_t v27 = (void *)(a1 + v26);
  int64_t v28 = (const void *)(a2 + v26);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E44CB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v30 = sub_2443B6F30();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v30 - 8) + 32))(v27, v28, v30);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  uint64_t v31 = a3[11];
  uint64_t v32 = a3[12];
  uint64_t v33 = (_OWORD *)(a1 + v31);
  uint64_t v34 = (_OWORD *)(a2 + v31);
  long long v35 = v34[5];
  v33[4] = v34[4];
  v33[5] = v35;
  v33[6] = v34[6];
  long long v36 = v34[1];
  *uint64_t v33 = *v34;
  v33[1] = v36;
  long long v37 = v34[3];
  v33[2] = v34[2];
  v33[3] = v37;
  uint64_t v38 = a1 + v32;
  uint64_t v39 = a2 + v32;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3CD20);
  uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 32);
  v41(v38, v39, v40);
  v41(a1 + a3[13], a2 + a3[13], v40);
  uint64_t v42 = a3[14];
  uint64_t v43 = a1 + v42;
  uint64_t v44 = a2 + v42;
  *(_OWORD *)uint64_t v43 = *(_OWORD *)v44;
  *(void *)(v43 + 16) = *(void *)(v44 + 16);
  return a1;
}

uint64_t sub_2443A8614(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v13 = *v12;
  LOBYTE(v12) = *((unsigned char *)v12 + 8);
  uint64_t v14 = *(void *)v11;
  char v15 = *(unsigned char *)(v11 + 8);
  *(void *)uint64_t v11 = v13;
  *(unsigned char *)(v11 + 8) = (_BYTE)v12;
  sub_243EB18F8(v14, v15);
  if (a1 != a2)
  {
    uint64_t v16 = a3[8];
    uint64_t v17 = (void *)(a1 + v16);
    uint64_t v18 = (const void *)(a2 + v16);
    sub_243E9DDBC(a1 + v16, (uint64_t *)&unk_268E38400);
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_2443B8640();
      uint64_t v21 = *(void *)(v20 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v18, 1, v20))
      {
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EA10);
        memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v17, v18, v20);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v17, 0, 1, v20);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
    }
    uint64_t v23 = a3[9];
    uint64_t v24 = (void *)(a1 + v23);
    uint64_t v25 = (const void *)(a2 + v23);
    sub_243E9DDBC(a1 + v23, &qword_268E3DE18);
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = sub_2443B77D0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v27 - 8) + 32))(v24, v25, v27);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
    }
    uint64_t v28 = a3[10];
    uint64_t v29 = (void *)(a1 + v28);
    uint64_t v30 = (const void *)(a2 + v28);
    sub_243E9DDBC(a1 + v28, (uint64_t *)&unk_268E44CB0);
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E44CB0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v32 = sub_2443B6F30();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v32 - 8) + 32))(v29, v30, v32);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
    }
  }
  uint64_t v33 = a3[11];
  uint64_t v34 = a3[12];
  long long v35 = (_OWORD *)(a1 + v33);
  long long v36 = (_OWORD *)(a2 + v33);
  long long v37 = v36[1];
  *long long v35 = *v36;
  v35[1] = v37;
  long long v38 = v36[3];
  _OWORD v35[2] = v36[2];
  v35[3] = v38;
  long long v39 = v36[5];
  v35[4] = v36[4];
  v35[5] = v39;
  v35[6] = v36[6];
  uint64_t v40 = a1 + v34;
  uint64_t v41 = a2 + v34;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3CD20);
  uint64_t v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 40);
  v43(v40, v41, v42);
  v43(a1 + a3[13], a2 + a3[13], v42);
  uint64_t v44 = a3[14];
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
  *(void *)(v45 + 16) = *(void *)(v46 + 16);
  swift_release();
  return a1;
}

uint64_t sub_2443A8A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2443A8A94);
}

uint64_t sub_2443A8A94(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE10);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[6];
LABEL_13:
    char v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
    return v15(&a1[v11], a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38410);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[8];
    goto LABEL_13;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE20);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a3[9];
    goto LABEL_13;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E38A40);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v9 = v14;
    uint64_t v10 = *(void *)(v14 - 8);
    uint64_t v11 = a3[10];
    goto LABEL_13;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3CD20);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  uint64_t v18 = v16;
  uint64_t v19 = &a1[a3[12]];

  return v17(v19, a2, v18);
}

uint64_t sub_2443A8CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2443A8CCC);
}

char *sub_2443A8CCC(char *result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)unint64_t result = (a2 - 1);
    return result;
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE10);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[6];
LABEL_11:
    char v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v15(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38410);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[8];
    goto LABEL_11;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE20);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[9];
    goto LABEL_11;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E38A40);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a3)
  {
    uint64_t v9 = v14;
    uint64_t v10 = *(void *)(v14 - 8);
    uint64_t v11 = a4[10];
    goto LABEL_11;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3CD20);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = &v5[a4[12]];

  return (char *)v17(v19, a2, a2, v18);
}

uint64_t type metadata accessor for FacePickerCarouselView()
{
  uint64_t result = qword_268E477D8;
  if (!qword_268E477D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2443A8F3C()
{
  sub_24405CC48();
  if (v0 <= 0x3F)
  {
    sub_243E9D1EC();
    if (v1 <= 0x3F)
    {
      sub_24405CCA0(319, &qword_268E3DE40, MEMORY[0x263F18DD8]);
      if (v2 <= 0x3F)
      {
        sub_24405CCA0(319, (unint64_t *)&qword_268E38A58, MEMORY[0x263F18520]);
        if (v3 <= 0x3F)
        {
          sub_244031020();
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

uint64_t sub_2443A9120()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_2443A913C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v3 = sub_2443B8CA0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(a2 + 16) = sub_2443B6E70() & 1;
  *(void *)(a2 + 24) = v7;
  *(unsigned char *)(a2 + 32) = v8 & 1;
  uint64_t v9 = (int *)type metadata accessor for FacePickerCarouselView();
  swift_getKeyPath();
  sub_2443B7120();
  uint64_t v10 = a2 + v9[7];
  *(void *)uint64_t v10 = swift_getKeyPath();
  *(unsigned char *)(v10 + 8) = 0;
  uint64_t v11 = (uint64_t *)(a2 + v9[8]);
  *uint64_t v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = (uint64_t *)(a2 + v9[9]);
  *uint64_t v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE18);
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = (uint64_t *)(a2 + v9[10]);
  uint64_t *v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E44CB0);
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = (_OWORD *)(a2 + v9[11]);
  *uint64_t v14 = xmmword_2443E50C0;
  v14[1] = xmmword_2443CA550;
  v14[2] = xmmword_2443E50D0;
  v14[3] = xmmword_2443E50E0;
  v14[4] = xmmword_2443E50F0;
  v14[5] = xmmword_2443E5100;
  v14[6] = xmmword_2443E5110;
  *(void *)&long long v23 = 0x4074000000000000;
  uint64_t v15 = *MEMORY[0x263F1A6C8];
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v16(v6, v15, v3);
  sub_24402E01C();
  sub_2443B7190();
  *(void *)&long long v23 = 0x3FF0000000000000;
  v16(v6, v15, v3);
  sub_2443B7190();
  uint64_t v17 = a2 + v9[14];
  long long v22 = *MEMORY[0x263F001B0];
  type metadata accessor for CGSize(0);
  sub_2443B98C0();
  uint64_t v18 = v24;
  double result = *(double *)&v23;
  *(_OWORD *)uint64_t v17 = v23;
  *(void *)(v17 + 16) = v18;
  *(void *)a2 = v21;
  *(void *)(a2 + 8) = 0;
  return result;
}

float64x2_t sub_2443A9430()
{
  uint64_t v1 = type metadata accessor for FacePickerCarouselView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3CD20);
  sub_2443B71A0();
  if (v3 <= 1.0)
  {
    return *(float64x2_t *)(v0 + *(int *)(v1 + 44) + 80);
  }
  else
  {
    sub_2443B71A0();
    return vaddq_f64(*(float64x2_t *)(v0 + *(int *)(v1 + 44) + 80), vmulq_n_f64(*(float64x2_t *)(v0 + *(int *)(v1 + 44) + 96), (v3 + -1.0) * 0.5));
  }
}

void sub_2443A94E4()
{
  uint64_t v1 = type metadata accessor for CarouselFace();
  MEMORY[0x270FA5388](v1 - 8);
  double v3 = (char *)v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = v0[1];
  v17[1] = *v0;
  v17[2] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DEA8);
  sub_2443B98D0();
  sub_243F92708((uint64_t)v3);
  swift_release();
  type metadata accessor for PhotosPersonAsset();
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_2443BA4B0();
  id v7 = objc_msgSend(v5, sel_uuidFromLocalIdentifier_, v6);

  if (!v7)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v8 = sub_2443BA4F0();
  uint64_t v10 = v9;

  uint64_t v11 = (void *)sub_2443BA4B0();
  id v12 = objc_msgSend(v5, sel_uuidFromLocalIdentifier_, v11);

  if (!v12)
  {
LABEL_10:
    __break(1u);
    return;
  }
  uint64_t v13 = sub_2443BA4F0();
  uint64_t v15 = v14;

  if (v8 != v13 || v10 != v15) {
    sub_2443BB7D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_244069B40((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for CarouselFace);
}

uint64_t sub_2443A96C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v1 = sub_2443B7F00();
  uint64_t v29 = *(void *)(v1 - 8);
  uint64_t v30 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v28 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2443B9780();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PhotosPersonAsset();
  type metadata accessor for PhotosPersonImage();
  sub_243F2A2D4();
  sub_2443B9750();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F1B4B8], v3);
  uint64_t v27 = sub_2443B97E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  type metadata accessor for FacePickerCarouselView();
  sub_2443B9E40();
  sub_2443B72C0();
  uint64_t v7 = v43;
  char v8 = v44;
  uint64_t v9 = v45;
  LOBYTE(v4) = v46;
  uint64_t v11 = v47;
  uint64_t v10 = v48;
  uint64_t v12 = sub_2443B9E40();
  uint64_t v25 = v13;
  uint64_t v26 = v12;
  uint64_t v14 = sub_2443B9680();
  sub_2443B7070();
  double v15 = v49;
  uint64_t v16 = v51;
  uint64_t v17 = v52;
  uint64_t v18 = v53;
  uint64_t v19 = sub_2443B9E40();
  char v60 = 1;
  char v59 = v8;
  char v57 = v4;
  long long v32 = (unint64_t)v27;
  LOBYTE(v33) = 1;
  *(_WORD *)((char *)&v33 + 1) = 1;
  BYTE3(v33) = 1;
  *((void *)&v33 + 1) = v7;
  LOBYTE(v34) = v8;
  *(_DWORD *)((char *)&v34 + 1) = *(_DWORD *)v58;
  DWORD1(v34) = *(_DWORD *)&v58[3];
  *((void *)&v34 + 1) = v9;
  LOBYTE(v35) = v4;
  DWORD1(v35) = *(_DWORD *)&v56[3];
  *(_DWORD *)((char *)&v35 + 1) = *(_DWORD *)v56;
  *((void *)&v35 + 1) = v11;
  *(void *)&long long v36 = v10;
  *((double *)&v36 + 1) = v15 * 0.5;
  unsigned long long v37 = __PAIR128__(v50, *(unint64_t *)&v15);
  *(void *)&long long v38 = v16;
  *((void *)&v38 + 1) = v17;
  *(void *)&long long v39 = v18;
  *((void *)&v39 + 1) = v14;
  LOWORD(v40) = 256;
  WORD3(v40) = v55;
  *(_DWORD *)((char *)&v40 + 2) = v54;
  *((void *)&v40 + 1) = v19;
  *(void *)&long long v41 = v20;
  *((void *)&v41 + 1) = v26;
  uint64_t v42 = v25;
  long long v22 = v28;
  uint64_t v21 = v29;
  uint64_t v23 = v30;
  (*(void (**)(char *, void, uint64_t))(v29 + 104))(v28, *MEMORY[0x263F19790], v30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E240);
  sub_244069BA0();
  sub_2443B8FE0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v23);
  v61[7] = v39;
  v61[8] = v40;
  v61[9] = v41;
  v61[3] = v35;
  v61[4] = v36;
  v61[5] = v37;
  v61[6] = v38;
  v61[0] = v32;
  v61[1] = v33;
  uint64_t v62 = v42;
  v61[2] = v34;
  return sub_244069D88((uint64_t)v61);
}

uint64_t sub_2443A9ABC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v4 = v3;
  uint64_t v90 = a1;
  uint64_t v88 = a2;
  uint64_t v89 = sub_2443BA9E0();
  uint64_t v87 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  uint64_t v86 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for CarouselFace();
  uint64_t v85 = *(void *)(v8 - 8);
  uint64_t v84 = *(void *)(v85 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v83 = (uint64_t)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for FacePickerCarouselView();
  uint64_t v81 = *(void *)(v10 - 8);
  uint64_t v80 = *(void *)(v81 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v78 = (uint64_t)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E168);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (uint64_t *)((char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E158);
  uint64_t v16 = v15 - 8;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v75 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E148);
  uint64_t v20 = v19 - 8;
  MEMORY[0x270FA5388](v19);
  char v76 = (uint64_t (*)())((char *)&v75 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E138);
  uint64_t v23 = v22 - 8;
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v75 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = (uint64_t (*)())(__swift_instantiateConcreteTypeFromMangledName(&qword_268E3E128) - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v27 = (char *)&v75 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E118);
  MEMORY[0x270FA5388](v92);
  uint64_t v91 = (uint64_t)&v75 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47A50);
  uint64_t v79 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v93 = (char *)&v75 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v14 = sub_2443B9E00();
  v14[1] = v30;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E198);
  sub_2443AA390(v4, a1, (uint64_t)v14 + *(int *)(v31 + 44), a3);
  sub_2443B9E40();
  sub_2443B72C0();
  sub_243E9DD58((uint64_t)v14, (uint64_t)v18, &qword_268E3E168);
  long long v32 = &v18[*(int *)(v16 + 44)];
  long long v33 = v95;
  *(_OWORD *)long long v32 = v94;
  *((_OWORD *)v32 + 1) = v33;
  *((_OWORD *)v32 + 2) = v96;
  sub_243E9DDBC((uint64_t)v14, &qword_268E3E168);
  LOBYTE(v14) = sub_2443B8AE0();
  sub_2443B6E30();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v42 = v76;
  sub_243E9DD58((uint64_t)v18, (uint64_t)v76, &qword_268E3E158);
  uint64_t v43 = (char *)v42 + *(int *)(v20 + 44);
  char *v43 = (char)v14;
  *((void *)v43 + 1) = v35;
  *((void *)v43 + 2) = v37;
  *((void *)v43 + 3) = v39;
  *((void *)v43 + 4) = v41;
  v43[40] = 0;
  sub_243E9DDBC((uint64_t)v18, &qword_268E3E158);
  uint64_t v44 = sub_2443B9E40();
  uint64_t v46 = v45;
  uint64_t v47 = (uint64_t)&v25[*(int *)(v23 + 44)];
  uint64_t v48 = (uint64_t)v4;
  uint64_t v49 = (uint64_t)v4;
  char v75 = v4;
  uint64_t v50 = v90;
  sub_2443AB93C(v48, v47, a3);
  uint64_t v51 = (uint64_t *)(v47 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E3E178) + 36));
  *uint64_t v51 = v44;
  v51[1] = v46;
  sub_243EA697C((uint64_t)v42, (uint64_t)v25, &qword_268E3E148);
  LOBYTE(v44) = sub_2443B8B40();
  sub_243E9DD58((uint64_t)v25, (uint64_t)v27, &qword_268E3E138);
  uint64_t v52 = &v27[*((int *)v77 + 11)];
  char *v52 = v44;
  *(_OWORD *)(v52 + 8) = 0u;
  *(_OWORD *)(v52 + 24) = 0u;
  v52[40] = 1;
  sub_243E9DDBC((uint64_t)v25, &qword_268E3E138);
  uint64_t v53 = v91;
  sub_243E9DD58((uint64_t)v27, v91, &qword_268E3E128);
  *(unsigned char *)(v53 + *(int *)(v92 + 36)) = 0;
  sub_243E9DDBC((uint64_t)v27, &qword_268E3E128);
  uint64_t v77 = type metadata accessor for FacePickerCarouselView;
  uint64_t v54 = v78;
  sub_2443B3F38(v49, v78, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  char v76 = type metadata accessor for CarouselFace;
  uint64_t v55 = v83;
  sub_2443B3F38(v50, v83, (uint64_t (*)(void))type metadata accessor for CarouselFace);
  unint64_t v56 = (*(unsigned __int8 *)(v81 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
  unint64_t v57 = (v80 + *(unsigned __int8 *)(v85 + 80) + v56) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80);
  uint64_t v58 = swift_allocObject();
  sub_2443B3EC8(v54, v58 + v56, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  uint64_t v59 = v55;
  sub_2443B3EC8(v55, v58 + v57, (uint64_t (*)(void))type metadata accessor for CarouselFace);
  sub_24406909C();
  uint64_t v60 = v91;
  sub_2443B9010();
  swift_release();
  sub_243E9DDBC(v60, &qword_268E3E118);
  sub_2443B3F38((uint64_t)v75, v54, (uint64_t (*)(void))v77);
  uint64_t v61 = v59;
  sub_2443B3F38(v90, v59, (uint64_t (*)(void))v76);
  uint64_t v62 = swift_allocObject();
  sub_2443B3EC8(v54, v62 + v56, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  sub_2443B3EC8(v61, v62 + v57, (uint64_t (*)(void))type metadata accessor for CarouselFace);
  uint64_t v63 = v86;
  sub_2443BA970();
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47A40);
  uint64_t v65 = v88;
  uint64_t v66 = (char *)(v88 + *(int *)(v64 + 36));
  uint64_t v67 = sub_2443B7550();
  uint64_t v68 = v87;
  uint64_t v69 = v89;
  (*(void (**)(char *, char *, uint64_t))(v87 + 16))(&v66[*(int *)(v67 + 20)], v63, v89);
  *(void *)uint64_t v66 = &unk_268E47A60;
  *((void *)v66 + 1) = v62;
  uint64_t v70 = v79;
  uint64_t v71 = v65;
  unint64_t v72 = v93;
  uint64_t v73 = v82;
  (*(void (**)(uint64_t, char *, uint64_t))(v79 + 16))(v71, v93, v82);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v63, v69);
  return (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v72, v73);
}

uint64_t sub_2443AA390@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v167 = a3;
  uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E1D0);
  uint64_t v163 = *(void *)(v164 - 8);
  MEMORY[0x270FA5388](v164);
  uint64_t v162 = (uint64_t)&v126 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E1D8);
  MEMORY[0x270FA5388](v160);
  v166 = (char *)&v126 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v165 = (uint64_t)&v126 - v10;
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E38AA0);
  MEMORY[0x270FA5388](v137);
  uint64_t v139 = (uint64_t)&v126 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = sub_2443B9780();
  uint64_t v134 = *(void *)(v135 - 8);
  MEMORY[0x270FA5388](v135);
  long long v133 = (char *)&v126 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E38EA0);
  MEMORY[0x270FA5388](v136);
  long long v140 = (char *)&v126 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E38EA8);
  MEMORY[0x270FA5388](v138);
  uint64_t v142 = (uint64_t)&v126 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E38EB0);
  uint64_t v155 = *(void *)(v156 - 8);
  MEMORY[0x270FA5388](v156);
  uint64_t v141 = (uint64_t)&v126 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3B430);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v152 = (uint64_t)&v126 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = type metadata accessor for PlaygroundImage();
  uint64_t v150 = *(void *)(v151 - 8);
  MEMORY[0x270FA5388](v151);
  uint64_t v154 = (uint64_t)&v126 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E38EC0);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v158 = (uint64_t)&v126 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v157 = (uint64_t)&v126 - v22;
  uint64_t v23 = sub_2443B7A50();
  MEMORY[0x270FA5388](v23);
  unint64_t v170 = (double *)((char *)&v126 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E1E0);
  MEMORY[0x270FA5388](v129);
  uint64_t v26 = (char *)&v126 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E1E8);
  MEMORY[0x270FA5388](v130);
  uint64_t v28 = (char *)&v126 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E1F0);
  MEMORY[0x270FA5388](v149);
  uint64_t v128 = (uint64_t)&v126 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  long long v32 = (char *)&v126 - v31;
  uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E1F8);
  MEMORY[0x270FA5388](v146);
  uint64_t v147 = (uint64_t)&v126 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = sub_2443B7EC0();
  uint64_t v169 = *(void *)(v148 - 8);
  MEMORY[0x270FA5388](v148);
  uint64_t v35 = (char *)&v126 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3C4F8);
  uint64_t v145 = *(void *)(v168 - 8);
  MEMORY[0x270FA5388](v168);
  v171 = (char *)&v126 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  uint64_t v39 = (char *)&v126 - v38;
  uint64_t v40 = type metadata accessor for CarouselFakeBlobView();
  MEMORY[0x270FA5388](v40);
  uint64_t v42 = (char *)&v126 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E200);
  MEMORY[0x270FA5388](v144);
  uint64_t v126 = (uint64_t)&v126 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v44);
  uint64_t v127 = (uint64_t)&v126 - v45;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E208);
  MEMORY[0x270FA5388](v46 - 8);
  uint64_t v153 = (uint64_t)&v126 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v48);
  uint64_t v172 = (uint64_t)&v126 - v49;
  unint64_t v161 = a1;
  uint64_t v50 = a1[1];
  *(void *)&long long v178 = *a1;
  *((void *)&v178 + 1) = v50;
  uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DEA8);
  sub_2443B98D0();
  uint64_t v159 = a2;
  sub_243F94400(a2);
  LOBYTE(a2) = v51;
  swift_release();
  double v52 = a4 * 0.119999997;
  long long v132 = v35;
  uint64_t v131 = v23;
  if (a2)
  {
    *(double *)uint64_t v42 = v52;
    *(void *)&long long v175 = 0;
    sub_2443B98C0();
    uint64_t v53 = *((void *)&v178 + 1);
    *((void *)v42 + 1) = v178;
    *((void *)v42 + 2) = v53;
    uint64_t v54 = (uint64_t *)&v42[*(int *)(v40 + 24)];
    *uint64_t v54 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E44CB0);
    swift_storeEnumTagMultiPayload();
    sub_2443B7EB0();
    sub_2443B9F10();
    uint64_t v55 = sub_2443B3E80(&qword_268E39010, MEMORY[0x263F196B8]);
    uint64_t v56 = (uint64_t)v39;
    uint64_t v57 = v148;
    sub_2443B6F00();
    swift_release();
    uint64_t v130 = *(void *)(v169 + 8);
    ((void (*)(char *, uint64_t))v130)(v35, v57);
    uint64_t v58 = v145;
    uint64_t v59 = v168;
    uint64_t v129 = *(void *)(v145 + 16);
    ((void (*)(char *, uint64_t, uint64_t))v129)(v171, v56, v168);
    *(void *)&long long v178 = v57;
    *((void *)&v178 + 1) = v55;
    swift_getOpaqueTypeConformance2();
    uint64_t v60 = sub_2443B7370();
    uint64_t v61 = v126;
    sub_2443B3F38((uint64_t)v42, v126, (uint64_t (*)(void))type metadata accessor for CarouselFakeBlobView);
    *(void *)(v61 + *(int *)(v144 + 36)) = v60;
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v56, v59);
    sub_244069B40((uint64_t)v42, (uint64_t (*)(void))type metadata accessor for CarouselFakeBlobView);
    uint64_t v62 = &qword_268E3E200;
    uint64_t v63 = v127;
    sub_243EA697C(v61, v127, &qword_268E3E200);
    sub_243E9DD58(v63, v147, &qword_268E3E200);
    swift_storeEnumTagMultiPayload();
    sub_244069810();
    sub_244069928();
    sub_2443B82E0();
    uint64_t v64 = v63;
  }
  else
  {
    uint64_t v65 = *(int *)(v23 + 20);
    uint64_t v66 = v170;
    uint64_t v67 = (char *)v170 + v65;
    uint64_t v68 = *MEMORY[0x263F19860];
    uint64_t v69 = sub_2443B80C0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v69 - 8) + 104))(v67, v68, v69);
    *uint64_t v66 = v52;
    v66[1] = v52;
    LODWORD(v67) = sub_2443B8550();
    sub_2443B3F38((uint64_t)v66, (uint64_t)v26, MEMORY[0x263F19048]);
    uint64_t v70 = v129;
    *(_DWORD *)&v26[*(int *)(v129 + 52)] = v67;
    *(_WORD *)&v26[*(int *)(v70 + 56)] = 256;
    sub_244069B40((uint64_t)v66, MEMORY[0x263F19048]);
    sub_2443B9E40();
    sub_2443B72C0();
    sub_243E9DD58((uint64_t)v26, (uint64_t)v28, &qword_268E3E1E0);
    uint64_t v71 = &v28[*(int *)(v130 + 36)];
    long long v72 = v176;
    *(_OWORD *)uint64_t v71 = v175;
    *((_OWORD *)v71 + 1) = v72;
    *((_OWORD *)v71 + 2) = v177;
    sub_243E9DDBC((uint64_t)v26, &qword_268E3E1E0);
    sub_2443B7EB0();
    sub_2443B9F10();
    uint64_t v73 = (uint64_t)v28;
    uint64_t v74 = sub_2443B3E80(&qword_268E39010, MEMORY[0x263F196B8]);
    uint64_t v56 = (uint64_t)v39;
    uint64_t v57 = v148;
    sub_2443B6F00();
    swift_release();
    uint64_t v130 = *(void *)(v169 + 8);
    ((void (*)(char *, uint64_t))v130)(v35, v57);
    uint64_t v58 = v145;
    uint64_t v75 = v168;
    uint64_t v129 = *(void *)(v145 + 16);
    ((void (*)(char *, uint64_t, uint64_t))v129)(v171, v56, v168);
    *(void *)&long long v178 = v57;
    *((void *)&v178 + 1) = v74;
    swift_getOpaqueTypeConformance2();
    uint64_t v76 = sub_2443B7370();
    uint64_t v77 = v128;
    sub_243E9DD58(v73, v128, &qword_268E3E1E8);
    *(void *)(v77 + *(int *)(v149 + 36)) = v76;
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v56, v75);
    sub_243E9DDBC(v73, &qword_268E3E1E8);
    uint64_t v62 = &qword_268E3E1F0;
    sub_243EA697C(v77, (uint64_t)v32, &qword_268E3E1F0);
    sub_243E9DD58((uint64_t)v32, v147, &qword_268E3E1F0);
    swift_storeEnumTagMultiPayload();
    sub_244069810();
    sub_244069928();
    sub_2443B82E0();
    uint64_t v64 = (uint64_t)v32;
  }
  sub_243E9DDBC(v64, v62);
  uint64_t v78 = v170;
  uint64_t v79 = v161[1];
  *(void *)&long long v178 = *v161;
  *((void *)&v178 + 1) = v79;
  sub_2443B98D0();
  uint64_t v80 = v152;
  sub_243F94B84(v159, v152);
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v150 + 48))(v80, 1, v151) == 1)
  {
    sub_243E9DDBC(v80, &qword_268E3B430);
    uint64_t v81 = 1;
    uint64_t v82 = v157;
    uint64_t v83 = v156;
  }
  else
  {
    sub_2443B3EC8(v80, v154, (uint64_t (*)(void))type metadata accessor for PlaygroundImage);
    sub_243F2A2D4();
    sub_2443B9750();
    uint64_t v84 = *MEMORY[0x263F1B4B8];
    uint64_t v85 = v134;
    uint64_t v86 = *(void (**)(char *, uint64_t, uint64_t))(v134 + 104);
    uint64_t v87 = v78;
    uint64_t v152 = v56;
    uint64_t v88 = v133;
    uint64_t v89 = v135;
    v86(v133, v84, v135);
    uint64_t v90 = sub_2443B97E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v85 + 8))(v88, v89);
    uint64_t v91 = (char *)v87 + *(int *)(v131 + 20);
    uint64_t v92 = *MEMORY[0x263F19860];
    uint64_t v93 = sub_2443B80C0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v93 - 8) + 104))(v91, v92, v93);
    *uint64_t v87 = v52;
    v87[1] = v52;
    uint64_t v94 = v139;
    sub_2443B3F38((uint64_t)v87, v139, MEMORY[0x263F19048]);
    *(_WORD *)(v94 + *(int *)(v137 + 36)) = 256;
    uint64_t v95 = (uint64_t)v140;
    sub_243E9DD58(v94, (uint64_t)&v140[*(int *)(v136 + 36)], &qword_268E38AA0);
    *(void *)uint64_t v95 = v90;
    *(void *)(v95 + 8) = 0;
    *(_WORD *)(v95 + 16) = 257;
    swift_retain();
    sub_243E9DDBC(v94, &qword_268E38AA0);
    sub_244069B40((uint64_t)v87, MEMORY[0x263F19048]);
    swift_release();
    sub_2443B9E40();
    sub_2443B72C0();
    uint64_t v96 = v142;
    sub_243E9DD58(v95, v142, &qword_268E38EA0);
    uint64_t v97 = (_OWORD *)(v96 + *(int *)(v138 + 36));
    long long v98 = v179;
    *uint64_t v97 = v178;
    v97[1] = v98;
    v97[2] = v180;
    sub_243E9DDBC(v95, &qword_268E38EA0);
    uint64_t v99 = v132;
    sub_2443B7EB0();
    sub_2443B9F10();
    uint64_t v100 = sub_2443B3E80(&qword_268E39010, MEMORY[0x263F196B8]);
    uint64_t v101 = v152;
    sub_2443B6F00();
    swift_release();
    ((void (*)(char *, uint64_t))v130)(v99, v57);
    uint64_t v102 = v168;
    ((void (*)(char *, uint64_t, uint64_t))v129)(v171, v101, v168);
    uint64_t v173 = v57;
    uint64_t v174 = v100;
    swift_getOpaqueTypeConformance2();
    uint64_t v103 = sub_2443B7370();
    uint64_t v104 = v141;
    sub_243E9DD58(v96, v141, &qword_268E38EA8);
    uint64_t v83 = v156;
    *(void *)(v104 + *(int *)(v156 + 36)) = v103;
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v101, v102);
    sub_243E9DDBC(v96, &qword_268E38EA8);
    sub_244069B40(v154, (uint64_t (*)(void))type metadata accessor for PlaygroundImage);
    uint64_t v82 = v157;
    sub_243EA697C(v104, v157, &qword_268E38EB0);
    uint64_t v81 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v155 + 56))(v82, v81, 1, v83);
  uint64_t v105 = v162;
  sub_2443A96C0(v162);
  type metadata accessor for FacePickerCarouselView();
  char v106 = sub_2443B8AE0();
  sub_2443B6E30();
  uint64_t v108 = v107;
  uint64_t v110 = v109;
  uint64_t v112 = v111;
  uint64_t v114 = v113;
  uint64_t v115 = v163;
  uint64_t v116 = (uint64_t)v166;
  uint64_t v117 = v164;
  (*(void (**)(char *, uint64_t, uint64_t))(v163 + 16))(v166, v105, v164);
  uint64_t v118 = v116 + *(int *)(v160 + 36);
  *(unsigned char *)uint64_t v118 = v106;
  *(void *)(v118 + 8) = v108;
  *(void *)(v118 + 16) = v110;
  *(void *)(v118 + 24) = v112;
  *(void *)(v118 + 32) = v114;
  *(unsigned char *)(v118 + 40) = 0;
  (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v105, v117);
  uint64_t v119 = v165;
  sub_243EA697C(v116, v165, &qword_268E3E1D8);
  uint64_t v120 = v172;
  uint64_t v121 = v153;
  sub_243E9DD58(v172, v153, &qword_268E3E208);
  uint64_t v122 = v158;
  sub_243E9DD58(v82, v158, &qword_268E38EC0);
  sub_243E9DD58(v119, v116, &qword_268E3E1D8);
  uint64_t v123 = v167;
  sub_243E9DD58(v121, v167, &qword_268E3E208);
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E238);
  sub_243E9DD58(v122, v123 + *(int *)(v124 + 48), &qword_268E38EC0);
  sub_243E9DD58(v116, v123 + *(int *)(v124 + 64), &qword_268E3E1D8);
  sub_243E9DDBC(v119, &qword_268E3E1D8);
  sub_243E9DDBC(v82, &qword_268E38EC0);
  sub_243E9DDBC(v120, &qword_268E3E208);
  sub_243E9DDBC(v116, &qword_268E3E1D8);
  sub_243E9DDBC(v122, &qword_268E38EC0);
  return sub_243E9DDBC(v121, &qword_268E3E208);
}

uint64_t sub_2443AB93C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v30 = a2;
  uint64_t v5 = sub_2443B76F0();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_2443B7A50();
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (double *)((char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E1B0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v13 = a3 * 0.119999997 + *(double *)(a1 + *(int *)(type metadata accessor for FacePickerCarouselView() + 44) + 32);
  uint64_t v14 = (char *)v9 + *(int *)(v7 + 28);
  uint64_t v15 = *MEMORY[0x263F19860];
  uint64_t v16 = sub_2443B80C0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v14, v15, v16);
  *uint64_t v9 = v13;
  v9[1] = v13;
  sub_2443A94E4();
  if (v17) {
    sub_2443B76E0();
  }
  else {
    *(void *)&long long v31 = sub_2443B9670();
  }
  uint64_t v18 = sub_2443B72D0();
  sub_2443B7070();
  uint64_t v19 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_2443B3F38((uint64_t)v9, (uint64_t)v12, MEMORY[0x263F19048]);
  double v20 = *(double *)&v31 * 0.5;
  uint64_t v21 = (uint64_t)&v12[*(int *)(v10 + 68)];
  sub_2443B3F38((uint64_t)v9, v21, v19);
  *(double *)(v21 + *(int *)(sub_2443B7A40() + 20)) = v20;
  uint64_t v22 = v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E3E1B8) + 36);
  long long v23 = v32;
  *(_OWORD *)uint64_t v22 = v31;
  *(_OWORD *)(v22 + 16) = v23;
  *(void *)(v22 + 32) = v33;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E1C0);
  *(void *)(v21 + *(int *)(v24 + 52)) = v18;
  *(_WORD *)(v21 + *(int *)(v24 + 56)) = 256;
  uint64_t v25 = sub_2443B9E40();
  uint64_t v27 = v26;
  uint64_t v28 = (uint64_t *)(v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E3E1C8) + 36));
  uint64_t *v28 = v25;
  v28[1] = v27;
  sub_244069B40((uint64_t)v9, MEMORY[0x263F19048]);
  return sub_243EA697C((uint64_t)v12, v30, &qword_268E3E1B0);
}

uint64_t sub_2443ABC5C()
{
  return swift_release();
}

void sub_2443ABCDC(uint64_t *a1)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DEA8);
  sub_2443B98D0();
  type metadata accessor for PhotosPersonAsset();
  uint64_t v1 = self;
  uint64_t v2 = (void *)sub_2443BA4B0();
  id v3 = objc_msgSend(v1, sel_uuidFromLocalIdentifier_, v2, v5, v6);

  if (v3)
  {
    sub_2443BA4F0();

    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_2443B3E80(&qword_268E394E8, (void (*)(uint64_t))type metadata accessor for FacePickerCarouselViewModel);
    sub_2443B55E0();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2443ABE84@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v62 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3EFA0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (uint64_t)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2443B8CA0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2443B7FC0();
  uint64_t v10 = sub_2443B8E10();
  uint64_t v12 = v11;
  uint64_t v61 = v13;
  char v15 = v14 & 1;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F1A6B8], v6);
  uint64_t v16 = sub_2443B8BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v5, 1, 1, v16);
  sub_2443B8BC0();
  sub_2443B8C10();
  sub_243E9DDBC(v5, &qword_268E3EFA0);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v17 = sub_2443B8E00();
  uint64_t v63 = v18;
  uint64_t v64 = v17;
  uint64_t v20 = v19;
  LOBYTE(v5) = v21;
  swift_release();
  LOBYTE(v5) = v5 & 1;
  sub_243EA5864(v10, v12, v15);
  swift_bridgeObjectRelease();
  uint64_t v22 = v62[1];
  *(void *)&long long v100 = *v62;
  *((void *)&v100 + 1) = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DEA8);
  sub_2443B98D0();
  uint64_t v23 = sub_243F92C58();
  uint64_t v25 = v24;
  swift_release();
  *(void *)&long long v100 = v23;
  *((void *)&v100 + 1) = v25;
  sub_243EA663C();
  uint64_t v26 = sub_2443B8E40();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  LOBYTE(v10) = v31 & 1;
  type metadata accessor for FacePickerCarouselView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3CD20);
  sub_2443B71A0();
  double v32 = *(double *)&v100;
  uint64_t v33 = sub_2443B9E40();
  sub_2441D2A88(0.0, 1, 0.0, 1, v32, 0, 0.0, 1, (uint64_t)&v100, 0.0, 1, 0.0, 1, v33, v34, v26, v28, v10, v30);
  sub_243EA5864(v26, v28, v10);
  swift_bridgeObjectRelease();
  long long v71 = v106;
  long long v72 = v107;
  long long v73 = v108;
  long long v67 = v102;
  long long v68 = v103;
  long long v69 = v104;
  long long v70 = v105;
  long long v65 = v100;
  long long v66 = v101;
  LOBYTE(v32) = sub_2443B8AD0();
  char v74 = 1;
  uint64_t KeyPath = swift_getKeyPath();
  LOBYTE(v30) = v74;
  uint64_t v36 = swift_getKeyPath();
  char v79 = 0;
  uint64_t v37 = sub_2443B8C50();
  uint64_t v38 = swift_getKeyPath();
  char v39 = v79;
  long long v40 = v71;
  long long v41 = v72;
  long long v88 = v71;
  long long v89 = v72;
  long long v42 = v73;
  long long v90 = v73;
  long long v43 = v67;
  long long v44 = v68;
  long long v84 = v67;
  long long v85 = v68;
  long long v46 = v69;
  long long v45 = v70;
  long long v86 = v69;
  long long v87 = v70;
  long long v48 = v65;
  long long v47 = v66;
  long long v82 = v65;
  long long v83 = v66;
  LOWORD(v91) = 256;
  *(_DWORD *)((char *)&v91 + 2) = v76;
  WORD3(v91) = v77;
  BYTE8(v91) = LOBYTE(v32);
  *(_DWORD *)((char *)&v91 + 9) = *(_DWORD *)v75;
  HIDWORD(v91) = *(_DWORD *)&v75[3];
  long long v92 = 0u;
  long long v93 = 0u;
  LOBYTE(v94) = v30;
  *(_DWORD *)((char *)&v94 + 1) = *(_DWORD *)v78;
  DWORD1(v94) = *(_DWORD *)&v78[3];
  *((void *)&v94 + 1) = KeyPath;
  LOBYTE(v95) = 1;
  DWORD1(v95) = *(_DWORD *)&v80[3];
  *(_DWORD *)((char *)&v95 + 1) = *(_DWORD *)v80;
  *((void *)&v95 + 1) = v36;
  *(void *)&long long v96 = 3;
  BYTE8(v96) = v79;
  *(_DWORD *)((char *)&v96 + 9) = *(_DWORD *)v81;
  HIDWORD(v96) = *(_DWORD *)&v81[3];
  *(void *)&long long v97 = v38;
  *((void *)&v97 + 1) = v37;
  long long v49 = v68;
  *(_OWORD *)(a2 + 64) = v67;
  *(_OWORD *)(a2 + 80) = v49;
  long long v50 = v83;
  *(_OWORD *)(a2 + 32) = v82;
  *(_OWORD *)(a2 + 48) = v50;
  long long v51 = v89;
  *(_OWORD *)(a2 + 128) = v88;
  *(_OWORD *)(a2 + 144) = v51;
  long long v52 = v87;
  *(_OWORD *)(a2 + 96) = v86;
  *(_OWORD *)(a2 + 112) = v52;
  long long v53 = v93;
  *(_OWORD *)(a2 + 192) = v92;
  *(_OWORD *)(a2 + 208) = v53;
  long long v54 = v91;
  *(_OWORD *)(a2 + 160) = v90;
  *(_OWORD *)(a2 + 176) = v54;
  long long v55 = v97;
  *(_OWORD *)(a2 + 256) = v96;
  *(_OWORD *)(a2 + 272) = v55;
  long long v56 = v95;
  *(_OWORD *)(a2 + 224) = v94;
  *(_OWORD *)(a2 + 240) = v56;
  long long v106 = v40;
  long long v107 = v41;
  long long v108 = v42;
  long long v102 = v43;
  long long v103 = v44;
  *(_DWORD *)uint64_t v120 = *(_DWORD *)v80;
  *(_DWORD *)&v120[3] = *(_DWORD *)&v80[3];
  *(_DWORD *)uint64_t v124 = *(_DWORD *)v81;
  *(_DWORD *)&v124[3] = *(_DWORD *)&v81[3];
  char v99 = v5;
  *(_DWORD *)(a2 + 17) = *(_DWORD *)v98;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)&v98[3];
  uint64_t v58 = v63;
  uint64_t v57 = v64;
  *(void *)a2 = v64;
  *(void *)(a2 + 8) = v20;
  *(unsigned char *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v58;
  long long v104 = v46;
  long long v105 = v45;
  long long v100 = v48;
  long long v101 = v47;
  __int16 v109 = 256;
  int v110 = v76;
  __int16 v111 = v77;
  char v112 = LOBYTE(v32);
  *(_DWORD *)uint64_t v113 = *(_DWORD *)v75;
  *(_DWORD *)&v113[3] = *(_DWORD *)&v75[3];
  long long v114 = 0u;
  long long v115 = 0u;
  char v116 = v30;
  *(_DWORD *)uint64_t v117 = *(_DWORD *)v78;
  *(_DWORD *)&v117[3] = *(_DWORD *)&v78[3];
  uint64_t v118 = KeyPath;
  char v119 = 1;
  uint64_t v121 = v36;
  uint64_t v122 = 3;
  char v123 = v39;
  uint64_t v125 = v38;
  uint64_t v126 = v37;
  uint64_t v59 = v57;
  sub_243EA654C(v57, v20, v5);
  swift_bridgeObjectRetain();
  sub_244069DDC((uint64_t)&v82);
  sub_244069E58((uint64_t)&v100);
  sub_243EA5864(v59, v20, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443AC478()
{
  return swift_release();
}

uint64_t sub_2443AC570@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v55 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DFB0);
  MEMORY[0x270FA5388](v3 - 8);
  long long v54 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47978) - 8;
  MEMORY[0x270FA5388](v53);
  uint64_t v58 = (uint64_t)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2443B7F60();
  uint64_t v51 = *(void *)(v6 - 8);
  uint64_t v52 = v6;
  MEMORY[0x270FA5388](v6);
  long long v50 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47980);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47988);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v47 = v12;
  uint64_t v48 = v13;
  MEMORY[0x270FA5388](v12);
  char v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47990);
  uint64_t v16 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47998);
  MEMORY[0x270FA5388](v19);
  char v21 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E479A0);
  uint64_t v57 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  long long v56 = (char *)&v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E479A8);
  sub_243E9DC94(&qword_268E479B0, &qword_268E479A8);
  sub_2443B8CB0();
  uint64_t v23 = sub_243E9DC94(&qword_268E479B8, &qword_268E47980);
  sub_2443B92F0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v60 = v8;
  uint64_t v61 = v23;
  swift_getOpaqueTypeConformance2();
  uint64_t v24 = v47;
  sub_2443B9060();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v15, v24);
  uint64_t v25 = v46;
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v21, v18, v46);
  *(_WORD *)&v21[*(int *)(v19 + 36)] = 256;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v25);
  sub_2443B2FB0();
  uint64_t v26 = v56;
  sub_2443B9220();
  sub_243E9DDBC((uint64_t)v21, &qword_268E47998);
  uint64_t v27 = v50;
  sub_2443B7F50();
  uint64_t v28 = v52;
  uint64_t v29 = v58;
  uint64_t v30 = v58 + *(int *)(v53 + 44);
  uint64_t v31 = v51;
  double v32 = *(void (**)(uint64_t, char *, uint64_t))(v51 + 16);
  v32(v30, v27, v52);
  uint64_t v33 = v31;
  uint64_t v34 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v31 + 56);
  v34(v30, 0, 1, v28);
  uint64_t v35 = v26;
  uint64_t v36 = v49;
  (*(void (**)(uint64_t, char *, uint64_t))(v57 + 16))(v29, v35, v49);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v38 = (uint64_t)v54;
  v32((uint64_t)v54, v27, v28);
  v34(v38, 0, 1, v28);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E478A0);
  uint64_t v40 = v55;
  long long v41 = (uint64_t *)(v55 + *(int *)(v39 + 36));
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E008);
  sub_243E9DD58(v38, (uint64_t)v41 + *(int *)(v42 + 28), &qword_268E3DFB0);
  *long long v41 = KeyPath;
  uint64_t v43 = v58;
  sub_243E9DD58(v58, v40, &qword_268E47978);
  sub_243E9DDBC(v38, &qword_268E3DFB0);
  sub_243E9DDBC(v43, &qword_268E47978);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v27, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v56, v36);
}

uint64_t sub_2443ACC18@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E479C8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E479D0);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v29 = (uint64_t)&v27 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E020);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v28 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v27 - v17;
  uint64_t v32 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E028);
  sub_2440686F4();
  sub_2443B9BC0();
  uint64_t v31 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E479D8);
  sub_2443B30D8();
  sub_2443B9BC0();
  uint64_t v33 = sub_2443B9670();
  swift_retain();
  uint64_t v19 = sub_2443B9AB0();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v10, v6, v3);
  swift_release();
  *(void *)&v10[*(int *)(v8 + 44)] = v19;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v20 = v29;
  sub_243EA697C((uint64_t)v10, v29, &qword_268E479D0);
  char v21 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  uint64_t v22 = v28;
  v21(v28, v18, v13);
  sub_243E9DD58(v20, (uint64_t)v10, &qword_268E479D0);
  uint64_t v23 = v30;
  v21(v30, v22, v13);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E479E8);
  sub_243E9DD58((uint64_t)v10, (uint64_t)&v23[*(int *)(v24 + 48)], &qword_268E479D0);
  sub_243E9DDBC(v20, &qword_268E479D0);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v14 + 8);
  v25(v18, v13);
  sub_243E9DDBC((uint64_t)v10, &qword_268E479D0);
  return ((uint64_t (*)(char *, uint64_t))v25)(v22, v13);
}

uint64_t sub_2443ACFB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for FacePickerCarouselView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E040);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2443B3F38(a1, (uint64_t)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = swift_allocObject();
  sub_2443B3EC8((uint64_t)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E080);
  sub_243E9DC94(&qword_268E3E088, &qword_268E3E080);
  sub_2443B9930();
  uint64_t v13 = sub_2443B95E0();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a2, v10, v7);
  uint64_t v15 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E3E028) + 36));
  *uint64_t v15 = KeyPath;
  v15[1] = v13;
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2443AD228@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for FacePickerCarouselView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = sub_2443B7EF0();
  sub_2443B3F38(a1, (uint64_t)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  sub_2443B3EC8((uint64_t)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  uint64_t v10 = sub_2443B95E0();
  uint64_t result = swift_getKeyPath();
  *(void *)a2 = v7;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 1;
  *(unsigned char *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = sub_2443B31A0;
  *(void *)(a2 + 56) = v9;
  *(void *)(a2 + 64) = 0;
  *(unsigned char *)(a2 + 72) = 1;
  *(void *)(a2 + 80) = result;
  *(void *)(a2 + 88) = v10;
  return result;
}

uint64_t sub_2443AD388()
{
  return swift_release();
}

uint64_t sub_2443AD480@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E478E8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E478D8);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E478B8);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2443B7180();
  v33[1] = sub_2443B8AD0();
  uint64_t v13 = (void *)(v1 + *(int *)(type metadata accessor for FacePickerCarouselView() + 56));
  uint64_t v15 = v13[1];
  uint64_t v16 = v13[2];
  *(void *)&long long v35 = *v13;
  uint64_t v14 = v35;
  *((void *)&v35 + 1) = v15;
  *(void *)&long long v36 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E39828);
  sub_2443B98D0();
  sub_2443B6E30();
  uint64_t v38 = v17;
  uint64_t v39 = v18;
  uint64_t v40 = v19;
  uint64_t v41 = v20;
  char v42 = 0;
  sub_2443B86D0();
  *(void *)&long long v35 = v14;
  *((void *)&v35 + 1) = v15;
  *(void *)&long long v36 = v16;
  sub_2443B98D0();
  sub_2443B9E40();
  sub_2443B72C0();
  sub_243E9DD58((uint64_t)v4, (uint64_t)v8, &qword_268E478E8);
  char v21 = &v8[*(int *)(v6 + 44)];
  long long v22 = v36;
  *(_OWORD *)char v21 = v35;
  *((_OWORD *)v21 + 1) = v22;
  *((_OWORD *)v21 + 2) = v37;
  sub_243E9DDBC((uint64_t)v4, &qword_268E478E8);
  LOBYTE(v16) = sub_2443B8B40();
  sub_2443B6E30();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  sub_243E9DD58((uint64_t)v8, (uint64_t)v12, &qword_268E478D8);
  uint64_t v31 = &v12[*(int *)(v10 + 44)];
  *uint64_t v31 = v16;
  *((void *)v31 + 1) = v24;
  *((void *)v31 + 2) = v26;
  *((void *)v31 + 3) = v28;
  *((void *)v31 + 4) = v30;
  v31[40] = 0;
  sub_243E9DDBC((uint64_t)v8, &qword_268E478D8);
  return sub_243EA697C((uint64_t)v12, v34, &qword_268E478B8);
}

uint64_t sub_2443AD7BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v154 = a1;
  uint64_t v153 = sub_2443B9D40();
  uint64_t v152 = *(void *)(v153 - 8);
  MEMORY[0x270FA5388](v153);
  uint64_t v151 = (char *)&v108 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v138 = sub_2443B8820();
  uint64_t v137 = *(void *)(v138 - 8);
  MEMORY[0x270FA5388](v138);
  uint64_t v118 = (char *)&v108 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for FacePickerCarouselView();
  uint64_t v6 = v5 - 8;
  uint64_t v117 = *(void *)(v5 - 8);
  uint64_t v116 = *(void *)(v117 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v157 = (uint64_t)&v108 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2443B8A10();
  MEMORY[0x270FA5388](v8 - 8);
  long long v108 = (char *)&v108 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_2443B8A30();
  uint64_t v10 = *(void *)(v109 - 8);
  MEMORY[0x270FA5388](v109);
  uint64_t v12 = (char *)&v108 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47950);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v108 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47948);
  uint64_t v114 = *(void *)(v113 - 8);
  MEMORY[0x270FA5388](v113);
  uint64_t v155 = (char *)&v108 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47940);
  uint64_t v115 = *(void *)(v111 - 8);
  MEMORY[0x270FA5388](v111);
  char v112 = (char *)&v108 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47938);
  uint64_t v121 = *(void *)(v123 - 8);
  MEMORY[0x270FA5388](v123);
  int v110 = (char *)&v108 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47930);
  uint64_t v122 = *(void *)(v125 - 8);
  MEMORY[0x270FA5388](v125);
  char v119 = (char *)&v108 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47928);
  uint64_t v124 = *(void *)(v127 - 8);
  MEMORY[0x270FA5388](v127);
  uint64_t v120 = (char *)&v108 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47920);
  uint64_t v128 = *(void *)(v131 - 8);
  MEMORY[0x270FA5388](v131);
  uint64_t v126 = (char *)&v108 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47918);
  uint64_t v132 = *(void *)(v133 - 8);
  MEMORY[0x270FA5388](v133);
  uint64_t v129 = (char *)&v108 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47910);
  uint64_t v134 = *(void *)(v140 - 8);
  MEMORY[0x270FA5388](v140);
  uint64_t v130 = (char *)&v108 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47908);
  uint64_t v142 = *(void *)(v143 - 8);
  MEMORY[0x270FA5388](v143);
  uint64_t v141 = (char *)&v108 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E479F0);
  uint64_t v148 = *(void *)(v150 - 8);
  MEMORY[0x270FA5388](v150);
  uint64_t v146 = (char *)&v108 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47900);
  MEMORY[0x270FA5388](v144);
  uint64_t v149 = (char *)&v108 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E478A8);
  MEMORY[0x270FA5388](v145);
  uint64_t v147 = (uint64_t)&v108 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2443B8AA0();
  uint64_t v158 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E479F8);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47A00);
  uint64_t v29 = sub_243E9DC94(&qword_268E47A08, &qword_268E47A00);
  *(void *)&long long v165 = v28;
  *((void *)&v165 + 1) = v29;
  swift_getOpaqueTypeConformance2();
  sub_2443B6EC0();
  sub_2443B8AD0();
  uint64_t v139 = (char *)v2 + *(int *)(v6 + 52);
  uint64_t v30 = (char *)v2 + *(int *)(v6 + 64);
  uint64_t v31 = *((void *)v30 + 2);
  uint64_t v136 = v30;
  long long v165 = *(_OWORD *)v30;
  *(void *)&long long v166 = v31;
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E39828);
  sub_2443B98D0();
  sub_2443B6E30();
  uint64_t v168 = v32;
  uint64_t v169 = v33;
  uint64_t v170 = v34;
  uint64_t v171 = v35;
  char v172 = 0;
  sub_2443B86D0();
  sub_2443B8A00();
  sub_2443B8A20();
  unint64_t v36 = sub_2443B2E08();
  uint64_t v37 = v13;
  uint64_t v38 = v109;
  sub_2443B9250();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v38);
  sub_243E9DDBC((uint64_t)v15, &qword_268E47950);
  uint64_t v156 = v2;
  uint64_t v39 = v2[1];
  *(void *)&long long v163 = *v2;
  *((void *)&v163 + 1) = v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DEA8);
  sub_2443B98F0();
  long long v40 = v165;
  uint64_t v41 = v166;
  swift_getKeyPath();
  long long v163 = v40;
  *(void *)&long long v164 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DEB0);
  sub_2443B9AE0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  long long v163 = v165;
  long long v164 = v166;
  uint64_t v159 = v37;
  uint64_t v160 = v38;
  unint64_t v161 = v36;
  uint64_t v42 = v111;
  uint64_t v162 = MEMORY[0x263F1A480];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v44 = MEMORY[0x263F8D310];
  uint64_t v45 = v112;
  uint64_t v46 = v113;
  uint64_t v47 = v155;
  sub_2443B9070();
  uint64_t v48 = v110;
  uint64_t v49 = v157;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v114 + 8))(v47, v46);
  sub_2443B3F38((uint64_t)v156, v49, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  uint64_t v50 = *(unsigned __int8 *)(v117 + 80);
  uint64_t v51 = (v50 + 16) & ~v50;
  uint64_t v155 = (char *)(v51 + v116);
  uint64_t v117 = v50 | 7;
  uint64_t v52 = swift_allocObject();
  sub_2443B3EC8(v49, v52 + v51, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  *(void *)&long long v165 = v46;
  *((void *)&v165 + 1) = v44;
  uint64_t v53 = v118;
  *(void *)&long long v166 = OpaqueTypeConformance2;
  *((void *)&v166 + 1) = MEMORY[0x263F8D320];
  uint64_t v54 = swift_getOpaqueTypeConformance2();
  uint64_t v55 = v48;
  sub_2443B91D0();
  swift_release();
  long long v56 = v45;
  uint64_t v57 = v42;
  (*(void (**)(char *, uint64_t))(v115 + 8))(v56, v42);
  sub_2443B8340();
  LOBYTE(v42) = sub_2443B8AC0();
  unsigned __int8 v58 = sub_2443B8AA0();
  sub_2443B8AB0();
  sub_2443B8AB0();
  if (sub_2443B8AB0() != v42) {
    sub_2443B8AB0();
  }
  sub_2443B8AB0();
  if (sub_2443B8AB0() != v58) {
    sub_2443B8AB0();
  }
  *(void *)&long long v165 = v57;
  *((void *)&v165 + 1) = v54;
  uint64_t v59 = swift_getOpaqueTypeConformance2();
  uint64_t v60 = v119;
  uint64_t v61 = v123;
  sub_2443B90F0();
  (*(void (**)(char *, void))(v137 + 8))(v53, v138);
  (*(void (**)(char *, uint64_t))(v121 + 8))(v55, v61);
  *(void *)&long long v165 = v61;
  *((void *)&v165 + 1) = v59;
  uint64_t v62 = swift_getOpaqueTypeConformance2();
  uint64_t v63 = v120;
  uint64_t v64 = v125;
  sub_2443B9190();
  (*(void (**)(char *, uint64_t))(v122 + 8))(v60, v64);
  *(void *)&long long v165 = v64;
  *((void *)&v165 + 1) = v62;
  uint64_t v65 = swift_getOpaqueTypeConformance2();
  long long v66 = v126;
  uint64_t v67 = v127;
  sub_2443B9560();
  (*(void (**)(char *, uint64_t))(v124 + 8))(v63, v67);
  uint64_t v68 = (uint64_t)v156;
  uint64_t v69 = v156[3];
  char v70 = *((unsigned char *)v156 + 32);
  LOBYTE(v163) = *((unsigned char *)v156 + 16);
  *((void *)&v163 + 1) = v69;
  LOBYTE(v164) = v70;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E41EA0);
  sub_2443B6E60();
  *(void *)&long long v165 = v67;
  *((void *)&v165 + 1) = v65;
  uint64_t v71 = swift_getOpaqueTypeConformance2();
  long long v72 = v129;
  uint64_t v73 = v131;
  sub_2443B9470();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v128 + 8))(v66, v73);
  swift_getKeyPath();
  LOBYTE(v163) = 2;
  *(void *)&long long v165 = v73;
  *((void *)&v165 + 1) = v71;
  uint64_t v74 = swift_getOpaqueTypeConformance2();
  uint64_t v75 = v130;
  uint64_t v76 = v133;
  sub_2443B8FF0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v132 + 8))(v72, v76);
  *(void *)&long long v165 = v76;
  *((void *)&v165 + 1) = &type metadata for ComposingFocusState.Value;
  *(void *)&long long v166 = v74;
  uint64_t v77 = swift_getOpaqueTypeConformance2();
  uint64_t v78 = v141;
  uint64_t v79 = v140;
  sub_2443B91C0();
  (*(void (**)(char *, uint64_t))(v134 + 8))(v75, v79);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E3EB40);
  sub_2443B74B0();
  uint64_t v80 = swift_allocObject();
  long long v138 = xmmword_2443C3490;
  *(_OWORD *)(v80 + 16) = xmmword_2443C3490;
  sub_2443B74A0();
  sub_2443B7430();
  uint64_t v81 = sub_24415F6C8(v80);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v82 = v157;
  sub_2443B3F38(v68, v157, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  uint64_t v83 = swift_allocObject();
  sub_2443B3EC8(v82, v83 + v51, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E0B0);
  uint64_t v84 = v152;
  uint64_t v85 = swift_allocObject();
  *(_OWORD *)(v85 + 16) = v138;
  sub_2443B9D20();
  sub_2443B9D30();
  *(void *)&long long v165 = v85;
  sub_2443B3E80((unint64_t *)&unk_268E3EB50, MEMORY[0x263F1B8E0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E0B8);
  sub_243E9DC94(&qword_268E3EB60, &qword_268E3E0B8);
  long long v86 = v151;
  uint64_t v87 = v153;
  sub_2443BB200();
  *(void *)&long long v165 = v79;
  *((void *)&v165 + 1) = v77;
  uint64_t v88 = swift_getOpaqueTypeConformance2();
  long long v89 = v146;
  uint64_t v90 = v143;
  MEMORY[0x24568C090](v81, v86, sub_2443B32DC, v83, v143, v88);
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v84 + 8))(v86, v87);
  (*(void (**)(char *, uint64_t))(v142 + 8))(v78, v90);
  uint64_t v91 = *((void *)v136 + 2);
  long long v165 = *(_OWORD *)v136;
  *(void *)&long long v166 = v91;
  sub_2443B98D0();
  sub_2443B9E40();
  sub_2443B72C0();
  uint64_t v92 = v148;
  uint64_t v93 = (uint64_t)v149;
  uint64_t v94 = v150;
  (*(void (**)(char *, char *, uint64_t))(v148 + 16))(v149, v89, v150);
  long long v95 = (_OWORD *)(v93 + *(int *)(v144 + 36));
  long long v96 = v166;
  *long long v95 = v165;
  v95[1] = v96;
  v95[2] = v167;
  (*(void (**)(char *, uint64_t))(v92 + 8))(v89, v94);
  LOBYTE(v94) = sub_2443B8B40();
  sub_2443B6E30();
  uint64_t v98 = v97;
  uint64_t v100 = v99;
  uint64_t v102 = v101;
  uint64_t v104 = v103;
  uint64_t v105 = v147;
  sub_243E9DD58(v93, v147, &qword_268E47900);
  uint64_t v106 = v105 + *(int *)(v145 + 36);
  *(unsigned char *)uint64_t v106 = v94;
  *(void *)(v106 + 8) = v98;
  *(void *)(v106 + 16) = v100;
  *(void *)(v106 + 24) = v102;
  *(void *)(v106 + 32) = v104;
  *(unsigned char *)(v106 + 40) = 0;
  sub_243E9DDBC(v93, &qword_268E47900);
  return sub_243EA697C(v105, v154, &qword_268E478A8);
}

uint64_t sub_2443AEDE4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  v21[1] = a2;
  uint64_t v3 = type metadata accessor for FacePickerCarouselView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47A00);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_2443B7EF0();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  v21[0] = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E47A10) + 44)];
  uint64_t v9 = a1[1];
  uint64_t v22 = *a1;
  uint64_t v23 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DEA8);
  sub_2443B98D0();
  uint64_t v10 = v27;
  swift_getKeyPath();
  uint64_t v22 = v10;
  sub_2443B3E80(&qword_268E394E8, (void (*)(uint64_t))type metadata accessor for FacePickerCarouselViewModel);
  sub_2443B55F0();
  swift_release();
  swift_beginAccess();
  uint64_t v11 = *(void *)(v10 + 48);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v26 = v11;
  sub_2443B3F38((uint64_t)a1, (uint64_t)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  unint64_t v12 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v13 = swift_allocObject();
  sub_2443B3EC8((uint64_t)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E0C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E47A18);
  sub_243E9DC94(&qword_268E3E0D8, &qword_268E3E0C8);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47A20);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E3E188);
  unint64_t v16 = sub_2443B33A4();
  uint64_t v17 = sub_2443B7B40();
  uint64_t v18 = sub_2443B3E80((unint64_t *)&qword_268E3E190, MEMORY[0x263F191C0]);
  uint64_t v22 = v17;
  uint64_t v23 = v18;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v22 = v14;
  uint64_t v23 = v15;
  unint64_t v24 = v16;
  uint64_t v25 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_2443B3E80(&qword_268E3E0E8, (void (*)(uint64_t))type metadata accessor for CarouselFace);
  sub_2443B9B60();
  sub_243E9DC94(&qword_268E47A08, &qword_268E47A00);
  sub_2443B91A0();
  return sub_243E9DDBC((uint64_t)v8, &qword_268E47A00);
}

uint64_t sub_2443AF200@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v44 = a3;
  uint64_t v4 = type metadata accessor for FacePickerCarouselView();
  uint64_t v5 = v4 - 8;
  uint64_t v41 = *(void *)(v4 - 8);
  uint64_t v40 = *(void *)(v41 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v39 = (uint64_t)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2443B8950();
  uint64_t v42 = *(void *)(v7 - 8);
  uint64_t v43 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v38 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47A40);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v36 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47A38);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47A20);
  MEMORY[0x270FA5388](v36);
  uint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v17 = sub_2443B8150();
  *((void *)v17 + 1) = 0;
  v17[16] = 0;
  uint64_t v20 = (uint64_t *)(a2 + *(int *)(v5 + 64));
  uint64_t v21 = *v20;
  uint64_t v22 = v20[1];
  uint64_t v23 = v20[2];
  *(void *)&long long v47 = *v20;
  *((void *)&v47 + 1) = v22;
  *(void *)&long long v48 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E39828);
  sub_2443B98D0();
  if (v45 < 350.0 || v46 < 480.0) {
    double v25 = 180.0;
  }
  else {
    double v25 = 220.0;
  }
  uint64_t v26 = (uint64_t)&v17[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E47A48) + 44)];
  sub_2443A9ABC(v37, (uint64_t)v11, v25);
  sub_243EA697C((uint64_t)v11, (uint64_t)v14, &qword_268E47A40);
  sub_243EA697C((uint64_t)v14, v26, &qword_268E47A40);
  *(void *)&long long v47 = v21;
  *((void *)&v47 + 1) = v22;
  *(void *)&long long v48 = v23;
  sub_2443B98D0();
  *(void *)&long long v47 = v21;
  *((void *)&v47 + 1) = v22;
  *(void *)&long long v48 = v23;
  sub_2443B98D0();
  sub_2443B9E40();
  sub_2443B72C0();
  sub_243E9DD58((uint64_t)v17, (uint64_t)v19, &qword_268E47A38);
  uint64_t v27 = &v19[*(int *)(v36 + 36)];
  long long v28 = v48;
  *(_OWORD *)uint64_t v27 = v47;
  *((_OWORD *)v27 + 1) = v28;
  *((_OWORD *)v27 + 2) = v49;
  sub_243E9DDBC((uint64_t)v17, &qword_268E47A38);
  uint64_t v29 = v38;
  sub_2443B88F0();
  uint64_t v30 = v39;
  sub_2443B3F38(a2, v39, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  unint64_t v31 = (*(unsigned __int8 *)(v41 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v32 = swift_allocObject();
  sub_2443B3EC8(v30, v32 + v31, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3E188);
  sub_2443B33A4();
  uint64_t v33 = sub_2443B7B40();
  uint64_t v34 = sub_2443B3E80((unint64_t *)&qword_268E3E190, MEMORY[0x263F191C0]);
  double v45 = *(double *)&v33;
  double v46 = *(double *)&v34;
  swift_getOpaqueTypeConformance2();
  sub_2443B9100();
  swift_release();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v29, v43);
  return sub_243E9DDBC((uint64_t)v19, &qword_268E47A20);
}

uint64_t sub_2443AF7B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v4 = 1.0;
  if ((sub_2443B8460() & 1) == 0) {
    double v4 = *(double *)(a3 + *(int *)(type metadata accessor for FacePickerCarouselView() + 44) + 48);
  }
  sub_2443BA0F0();
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = sub_2443B7B40();
  uint64_t v10 = sub_2443B3E80((unint64_t *)&qword_268E3E190, MEMORY[0x263F191C0]);
  return MEMORY[0x24568A400](v9, v10, v4, v6, v8);
}

uint64_t sub_2443AF87C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v84 = a1;
  uint64_t v83 = type metadata accessor for CarouselFace();
  MEMORY[0x270FA5388](v83);
  uint64_t v82 = (uint64_t)v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for FacePickerCarouselView();
  uint64_t v85 = *(uint64_t (**)())(v3 - 8);
  uint64_t v4 = *((void *)v85 + 8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E477E8);
  uint64_t v68 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v62 = (char *)v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E477F0);
  uint64_t v70 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v64 = (char *)v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E477F8) - 8;
  MEMORY[0x270FA5388](v67);
  uint64_t v65 = (char *)v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47800);
  MEMORY[0x270FA5388](v73);
  uint64_t v69 = (uint64_t)v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47808);
  uint64_t v78 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v71 = (char *)v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47810);
  MEMORY[0x270FA5388](v79);
  uint64_t v74 = (char *)v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47818);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v80 = v11;
  uint64_t v81 = v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v75 = (char *)v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v77 = (char *)v59 - v15;
  long long v86 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E47820);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47828);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E38D68);
  unint64_t v18 = sub_2443B2378();
  uint64_t v19 = sub_243E9DC94(&qword_268E38DB8, &qword_268E38D68);
  uint64_t v89 = v16;
  uint64_t v90 = (ValueMetadata *)v17;
  unint64_t v91 = v18;
  unint64_t v92 = v19;
  swift_getOpaqueTypeConformance2();
  sub_2443B7890();
  uint64_t v20 = (uint64_t)v1;
  uint64_t v21 = v1[1];
  uint64_t v87 = *v1;
  uint64_t v88 = v21;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DEA8);
  sub_2443B98F0();
  uint64_t v22 = v89;
  uint64_t v23 = v90;
  unint64_t v24 = v91;
  swift_getKeyPath();
  uint64_t v89 = v22;
  uint64_t v90 = v23;
  unint64_t v91 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DEB0);
  sub_2443B9AE0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_2443B3F38((uint64_t)v1, (uint64_t)v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  uint64_t v25 = *((unsigned __int8 *)v85 + 80);
  uint64_t v60 = (v25 + 16) & ~v25;
  uint64_t v61 = v25 | 7;
  v59[1] = v60 + v4;
  uint64_t v26 = swift_allocObject() + v60;
  uint64_t v85 = type metadata accessor for FacePickerCarouselView;
  uint64_t v27 = (char *)v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2443B3EC8((uint64_t)v27, v26, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  type metadata accessor for FacePickerGridView();
  sub_243E9DC94(&qword_268E47848, &qword_268E477E8);
  sub_2443B3E80(&qword_268E3DED0, (void (*)(uint64_t))type metadata accessor for FacePickerGridView);
  long long v28 = v64;
  uint64_t v29 = v66;
  uint64_t v30 = v62;
  sub_2443B9410();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v30, v29);
  sub_2443B3F38(v20, (uint64_t)v27, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  uint64_t v31 = swift_allocObject();
  uint64_t v32 = v60;
  sub_2443B3EC8((uint64_t)v27, v31 + v60, (uint64_t (*)(void))v85);
  uint64_t v33 = v70;
  uint64_t v34 = (uint64_t)v65;
  uint64_t v35 = v72;
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v65, v28, v72);
  uint64_t v36 = (uint64_t (**)())(v34 + *(int *)(v67 + 44));
  *uint64_t v36 = sub_2443B24F8;
  v36[1] = (uint64_t (*)())v31;
  _OWORD v36[2] = 0;
  v36[3] = 0;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v35);
  uint64_t v37 = (uint64_t *)v20;
  sub_2443B3F38(v20, (uint64_t)v27, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  uint64_t v38 = swift_allocObject();
  sub_2443B3EC8((uint64_t)v27, v38 + v32, (uint64_t (*)(void))v85);
  uint64_t v39 = v69;
  sub_243E9DD58(v34, v69, &qword_268E477F8);
  uint64_t v40 = v73;
  uint64_t v41 = (void *)(v39 + *(int *)(v73 + 36));
  *uint64_t v41 = 0;
  v41[1] = 0;
  v41[2] = sub_2443B2514;
  v41[3] = v38;
  sub_243E9DDBC(v34, &qword_268E477F8);
  uint64_t v42 = sub_2443B3FA0(&qword_268E47850, &qword_268E47800, (void (*)(void))sub_2443B25A0);
  uint64_t v43 = v71;
  sub_2443B9340();
  sub_243E9DDBC(v39, &qword_268E47800);
  sub_2443B9F10();
  uint64_t v44 = (ValueMetadata *)v37[1];
  uint64_t v89 = *v37;
  uint64_t v90 = v44;
  sub_2443B98D0();
  uint64_t v45 = v82;
  sub_243F92708(v82);
  swift_release();
  uint64_t v89 = v40;
  uint64_t v90 = (ValueMetadata *)v42;
  swift_getOpaqueTypeConformance2();
  sub_2443B3E80(&qword_268E47860, (void (*)(uint64_t))type metadata accessor for CarouselFace);
  uint64_t v46 = (uint64_t)v74;
  uint64_t v47 = v76;
  sub_2443B9550();
  swift_release();
  sub_244069B40(v45, (uint64_t (*)(void))type metadata accessor for CarouselFace);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v43, v47);
  uint64_t v48 = *(_OWORD *)&sub_2443A9430();
  sub_2443A9430();
  uint64_t v89 = v48;
  uint64_t v90 = v49;
  unint64_t v50 = sub_2443B26C4();
  unint64_t v51 = sub_244066DF0();
  uint64_t v52 = v75;
  uint64_t v53 = v79;
  sub_2443B9180();
  sub_243E9DDBC(v46, &qword_268E47810);
  uint64_t v89 = v53;
  uint64_t v90 = &type metadata for FixedPresentationSizing;
  unint64_t v91 = v50;
  unint64_t v92 = v51;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v55 = v77;
  uint64_t v56 = v80;
  sub_2440352D0(v52, v80, OpaqueTypeConformance2);
  uint64_t v57 = *(void (**)(char *, uint64_t))(v81 + 8);
  v57(v52, v56);
  sub_2440352D0(v55, v56, OpaqueTypeConformance2);
  return ((uint64_t (*)(char *, uint64_t))v57)(v55, v56);
}

uint64_t sub_2443B039C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = type metadata accessor for FacePickerCarouselView();
  uint64_t v36 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v37 = v4;
  uint64_t v38 = (uint64_t)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_2443B8350();
  uint64_t v5 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47838);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47870);
  uint64_t v12 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47828);
  MEMORY[0x270FA5388](v35);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47820);
  uint64_t v33 = *(void *)(v17 - 8);
  uint64_t v34 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v31 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = a1;
  uint64_t v41 = a1;
  sub_2443B8AC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E47878);
  sub_2443B27FC();
  sub_2443B6EC0();
  sub_2443B8340();
  unsigned __int8 v19 = sub_2443B8AC0();
  sub_2443B8AB0();
  sub_2443B8AB0();
  if (sub_2443B8AB0() != v19) {
    sub_2443B8AB0();
  }
  sub_243E9DC94(&qword_268E47840, &qword_268E47838);
  sub_2443B9240();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v30);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v21 = v38;
  uint64_t v20 = v39;
  sub_2443B3F38(v39, v38, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  unint64_t v22 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v23 = swift_allocObject();
  sub_2443B3EC8(v21, v23 + v22, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  uint64_t v24 = v32;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v14, v32);
  uint64_t v25 = &v16[*(int *)(v35 + 36)];
  *(void *)uint64_t v25 = sub_243EB2340;
  *((void *)v25 + 1) = 0;
  *((void *)v25 + 2) = sub_2443B28A0;
  *((void *)v25 + 3) = v23;
  uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v24);
  MEMORY[0x270FA5388](v26);
  *(&v29 - 2) = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E38D68);
  sub_2443B2378();
  sub_243E9DC94(&qword_268E38DB8, &qword_268E38D68);
  uint64_t v27 = v31;
  sub_2443B94F0();
  sub_243E9DDBC((uint64_t)v16, &qword_268E47828);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v40, v27, v34);
}

uint64_t sub_2443B094C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47890);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47878);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_2443B8150();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E47898);
  sub_2443B0B98(a1, &v6[*(int *)(v10 + 44)]);
  uint64_t v11 = (char *)a1 + *(int *)(type metadata accessor for FacePickerCarouselView() + 56);
  uint64_t v12 = *((void *)v11 + 2);
  long long v19 = *(_OWORD *)v11;
  *(void *)&long long v20 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E39828);
  sub_2443B98D0();
  sub_2443B9E40();
  sub_2443B7AD0();
  sub_243E9DD58((uint64_t)v6, (uint64_t)v9, &qword_268E47890);
  uint64_t v13 = &v9[*(int *)(v7 + 36)];
  long long v14 = v24;
  *((_OWORD *)v13 + 4) = v23;
  *((_OWORD *)v13 + 5) = v14;
  *((_OWORD *)v13 + 6) = v25;
  long long v15 = v20;
  *(_OWORD *)uint64_t v13 = v19;
  *((_OWORD *)v13 + 1) = v15;
  long long v16 = v22;
  *((_OWORD *)v13 + 2) = v21;
  *((_OWORD *)v13 + 3) = v16;
  sub_243E9DDBC((uint64_t)v6, &qword_268E47890);
  return sub_243EA697C((uint64_t)v9, a2, &qword_268E47878);
}

uint64_t sub_2443B0B98@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unsigned __int8 v58 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E478A0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v64 = &v52[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v63 = &v52[-v6];
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E478A8);
  MEMORY[0x270FA5388](v60);
  uint64_t v8 = &v52[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E478B0);
  MEMORY[0x270FA5388](v57);
  uint64_t v10 = &v52[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E478B8);
  MEMORY[0x270FA5388](v59);
  uint64_t v12 = &v52[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E478C0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v62 = &v52[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v15);
  uint64_t v65 = &v52[-v16];
  uint64_t v17 = *(void *)((char *)a1 + *(int *)(type metadata accessor for FacePickerCarouselView() + 44) + 24);
  uint64_t v18 = sub_2443B8150();
  sub_2443ABE84(a1, (uint64_t)v78);
  v79[296] = 0;
  memcpy(&v79[7], v78, 0x120uLL);
  uint64_t KeyPath = swift_getKeyPath();
  v80[0] = v18;
  v80[1] = v17;
  LOBYTE(v80[2]) = 0;
  memcpy((char *)&v80[2] + 1, v79, 0x127uLL);
  v80[39] = KeyPath;
  LOBYTE(v80[40]) = 1;
  memcpy(v77, v80, sizeof(v77));
  sub_2443B9E40();
  sub_2441D3B60(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v69, 0.0, 1, 0.0, 1);
  sub_2443B2EE0((uint64_t)v80);
  memcpy(v81, v69, sizeof(v81));
  int v61 = sub_2443B8AF0();
  sub_2443B6E30();
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  memcpy(v84, v81, sizeof(v84));
  unsigned __int8 v82 = 0;
  uint64_t v28 = a1[1];
  v69[0] = *a1;
  v69[1] = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DEA8);
  sub_2443B98D0();
  uint64_t v29 = v68[0];
  swift_getKeyPath();
  v69[0] = v29;
  sub_2443B3E80(&qword_268E394E8, (void (*)(uint64_t))type metadata accessor for FacePickerCarouselViewModel);
  sub_2443B55F0();
  swift_release();
  swift_beginAccess();
  uint64_t v30 = *(void *)(v29 + 48);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v31 = *(void *)(v30 + 16);
  swift_bridgeObjectRelease();
  if (v31)
  {
    sub_2443AD7BC((uint64_t)v8);
    uint64_t v32 = &qword_268E478A8;
    sub_243E9DD58((uint64_t)v8, (uint64_t)v10, &qword_268E478A8);
    swift_storeEnumTagMultiPayload();
    sub_2443B3FA0(&qword_268E478C8, &qword_268E478B8, (void (*)(void))sub_2443B2A28);
    sub_2443B3FA0(&qword_268E478F0, &qword_268E478A8, (void (*)(void))sub_2443B2B28);
    sub_2443B82E0();
    uint64_t v33 = (uint64_t)v8;
  }
  else
  {
    sub_2443AD480((uint64_t)v12);
    uint64_t v32 = &qword_268E478B8;
    sub_243E9DD58((uint64_t)v12, (uint64_t)v10, &qword_268E478B8);
    swift_storeEnumTagMultiPayload();
    sub_2443B3FA0(&qword_268E478C8, &qword_268E478B8, (void (*)(void))sub_2443B2A28);
    sub_2443B3FA0(&qword_268E478F0, &qword_268E478A8, (void (*)(void))sub_2443B2B28);
    sub_2443B82E0();
    uint64_t v33 = (uint64_t)v12;
  }
  sub_243E9DDBC(v33, v32);
  sub_2443B7FC0();
  uint64_t v56 = sub_2443B8E10();
  uint64_t v35 = v34;
  uint64_t v59 = v36;
  char v38 = v37 & 1;
  uint64_t v55 = swift_getKeyPath();
  uint64_t v60 = sub_2443B8B90();
  uint64_t v54 = swift_getKeyPath();
  int v53 = sub_2443B8B40();
  uint64_t v39 = v63;
  sub_2443AC570((uint64_t)v63);
  memcpy(v67, v84, sizeof(v67));
  v66[0] = *(_DWORD *)v83;
  *(_DWORD *)((char *)v66 + 3) = *(_DWORD *)&v83[3];
  unsigned __int8 v40 = v82;
  LODWORD(v57) = v82;
  uint64_t v41 = v62;
  sub_243E9DD58((uint64_t)v65, (uint64_t)v62, &qword_268E478C0);
  sub_243E9DD58((uint64_t)v39, (uint64_t)v64, &qword_268E478A0);
  memcpy(v68, v84, 0x1B8uLL);
  LOBYTE(v68[55]) = v61;
  *(_DWORD *)((char *)&v68[55] + 1) = *(_DWORD *)v83;
  HIDWORD(v68[55]) = *(_DWORD *)&v83[3];
  v68[56] = v21;
  v68[57] = v23;
  v68[58] = v25;
  v68[59] = v27;
  LOBYTE(v68[60]) = v40;
  uint64_t v42 = v58;
  memcpy(v58, v68, 0x1E1uLL);
  v42[61] = 0;
  *((unsigned char *)v42 + 496) = 1;
  uint64_t v43 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268E47970);
  sub_243E9DD58((uint64_t)v41, (uint64_t)v42 + v43[16], &qword_268E478C0);
  uint64_t v44 = (char *)v42 + v43[20];
  *(void *)uint64_t v44 = 0;
  v44[8] = 1;
  uint64_t v45 = (char *)v42 + v43[24];
  uint64_t v47 = v55;
  uint64_t v46 = v56;
  *(void *)uint64_t v45 = v56;
  *((void *)v45 + 1) = v35;
  v45[16] = v38;
  uint64_t v48 = v60;
  *((void *)v45 + 3) = v59;
  *((void *)v45 + 4) = v47;
  *((_WORD *)v45 + 20) = 1;
  v45[42] = 1;
  *((void *)v45 + 6) = v54;
  *((void *)v45 + 7) = v48;
  v45[64] = v53;
  *(_OWORD *)(v45 + 72) = 0u;
  *(_OWORD *)(v45 + 88) = 0u;
  v45[104] = 1;
  uint64_t v49 = (uint64_t)v42 + v43[28];
  unint64_t v50 = v64;
  sub_243E9DD58((uint64_t)v64, v49, &qword_268E478A0);
  sub_2441D8338((uint64_t)v68);
  sub_243EA654C(v46, v35, v38);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2441D8338((uint64_t)v81);
  sub_243E9DDBC((uint64_t)v63, &qword_268E478A0);
  sub_243E9DDBC((uint64_t)v65, &qword_268E478C0);
  sub_2443B2EE0((uint64_t)v81);
  sub_243E9DDBC((uint64_t)v50, &qword_268E478A0);
  sub_243EA5864(v46, v35, v38);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_243E9DDBC((uint64_t)v62, &qword_268E478C0);
  memcpy(v69, v67, sizeof(v69));
  char v70 = v61;
  *(_DWORD *)uint64_t v71 = v66[0];
  *(_DWORD *)&v71[3] = *(_DWORD *)((char *)v66 + 3);
  uint64_t v72 = v21;
  uint64_t v73 = v23;
  uint64_t v74 = v25;
  uint64_t v75 = v27;
  char v76 = v57;
  return sub_2443B2EE0((uint64_t)v69);
}

uint64_t sub_2443B1430()
{
  return sub_2443B98E0();
}

uint64_t sub_2443B14A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v18[1] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E38DE8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2443B83E0();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BCA0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v18 - v12;
  sub_2443B83A0();
  v18[8] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E3BCB0);
  sub_243E9DC94((unint64_t *)&qword_268E3EC30, (uint64_t *)&unk_268E3BCB0);
  sub_2443B7080();
  sub_2443B83B0();
  v18[4] = a1;
  sub_2443B7080();
  uint64_t v14 = &v5[*(int *)(v3 + 48)];
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v15(v5, v13, v7);
  v15(v14, v10, v7);
  sub_2443B81E0();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  return ((uint64_t (*)(char *, uint64_t))v16)(v13, v7);
}

uint64_t sub_2443B1748(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FacePickerCarouselView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BCC0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2443B6E10();
  uint64_t v8 = sub_2443B6E20();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  sub_2443B3F38(a1, (uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  sub_2443B3EC8((uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  return sub_2443B9920();
}

uint64_t sub_2443B1930(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FacePickerCarouselView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  sub_2443B3F38(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_2443B3EC8((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, (uint64_t (*)(void))type metadata accessor for FacePickerCarouselView);
  return sub_2443B9930();
}

uint64_t sub_2443B1A84@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DEA8);
  sub_2443B98D0();
  sub_243F936A8();
  swift_release();
  uint64_t v2 = type metadata accessor for FacePickerGridView();
  uint64_t v3 = (uint64_t *)(a1 + *(int *)(v2 + 20));
  *uint64_t v3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = a1 + *(int *)(v2 + 24);
  *(_OWORD *)uint64_t v4 = xmmword_2443CA5B0;
  *(_OWORD *)(v4 + 16) = xmmword_2443CA5C0;
  *(_OWORD *)(v4 + 32) = xmmword_2443CA5D0;
  *(_OWORD *)(v4 + 48) = xmmword_2443CA5E0;
  *(void *)(v4 + 64) = 0x4087700000000000;
  type metadata accessor for FacePickerGridViewModel();
  sub_2443B3E80(&qword_268E3B638, (void (*)(uint64_t))type metadata accessor for FacePickerGridViewModel);
  return sub_2443B9C10();
}

uint64_t sub_2443B1BBC(uint64_t *a1)
{
  uint64_t v43 = sub_2443B6F30();
  uint64_t v42 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v41 = (char *)v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v40 = (uint64_t)v35 - v4;
  uint64_t v39 = sub_2443B77D0();
  uint64_t v37 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  char v38 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v36 = (uint64_t)v35 - v7;
  uint64_t v9 = a1[1];
  uint64_t v54 = *a1;
  uint64_t v8 = v54;
  uint64_t v55 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DEA8);
  sub_2443B98D0();
  uint64_t v11 = v57;
  uint64_t v44 = type metadata accessor for FacePickerCarouselView();
  uint64_t v12 = (char *)a1 + *(int *)(v44 + 28);
  uint64_t v13 = *(void *)v12;
  char v14 = v12[8];
  sub_243EB1808(*(void *)v12, v14);
  sub_2440D43B8(v13, v14, &v57);
  sub_243EB18F8(v13, v14);
  LOBYTE(v13) = v57;
  swift_getKeyPath();
  uint64_t v52 = v11;
  char v53 = v13;
  uint64_t v54 = v11;
  uint64_t v15 = sub_2443B3E80(&qword_268E394E8, (void (*)(uint64_t))type metadata accessor for FacePickerCarouselViewModel);
  uint64_t v45 = MEMORY[0x263F8EE60] + 8;
  v35[0] = v15;
  sub_2443B55E0();
  swift_release();
  swift_release();
  uint64_t v54 = v8;
  uint64_t v55 = v9;
  v35[1] = v10;
  sub_2443B98D0();
  uint64_t v16 = v57;
  swift_getKeyPath();
  uint64_t v50 = v16;
  char v51 = 1;
  uint64_t v54 = v16;
  sub_2443B55E0();
  swift_release();
  swift_release();
  uint64_t v54 = v8;
  uint64_t v55 = v9;
  sub_2443B98D0();
  uint64_t v17 = v57;
  uint64_t v18 = a1;
  uint64_t v19 = v36;
  sub_2440D4830(v36);
  uint64_t v20 = v37;
  uint64_t v21 = v38;
  uint64_t v22 = v39;
  (*(void (**)(char *, void, uint64_t))(v37 + 104))(v38, *MEMORY[0x263F18DD0], v39);
  LOBYTE(v13) = sub_2443B77C0();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v20 + 8);
  v23(v21, v22);
  v23((char *)v19, v22);
  uint64_t v24 = v18;
  swift_getKeyPath();
  uint64_t v48 = v17;
  char v49 = v13 & 1;
  uint64_t v54 = v17;
  sub_2443B55E0();
  swift_release();
  swift_release();
  uint64_t v25 = v18[1];
  uint64_t v54 = *v18;
  uint64_t v55 = v25;
  sub_2443B98D0();
  uint64_t v26 = v57;
  uint64_t v27 = v40;
  sub_2440D2818(v40);
  uint64_t v28 = v42;
  uint64_t v29 = v41;
  uint64_t v30 = v43;
  (*(void (**)(char *, void, uint64_t))(v42 + 104))(v41, *MEMORY[0x263F184F8], v43);
  LOBYTE(v13) = sub_2443B6F20();
  uint64_t v31 = *(void (**)(char *, uint64_t))(v28 + 8);
  v31(v29, v30);
  v31((char *)v27, v30);
  swift_getKeyPath();
  uint64_t v46 = v26;
  char v47 = v13 & 1;
  uint64_t v54 = v26;
  sub_2443B55E0();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE10);
  sub_2443B7100();
  uint64_t result = v54;
  if ((v55 & 1) == 0)
  {
    sub_243EB18F8(v54, 0);
    goto LABEL_5;
  }
  if ((_BYTE)v54)
  {
LABEL_5:
    uint64_t v33 = v24[3];
    char v34 = *((unsigned char *)v24 + 32);
    LOBYTE(v54) = *((unsigned char *)v24 + 16);
    uint64_t v55 = v33;
    char v56 = v34;
    LOBYTE(v57) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E41EA0);
    return sub_2443B6E50();
  }
  return result;
}

uint64_t sub_2443B21EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DEA8);
  sub_2443B98D0();
  swift_getKeyPath();
  sub_2443B3E80(&qword_268E394E8, (void (*)(uint64_t))type metadata accessor for FacePickerCarouselViewModel);
  sub_2443B55E0();
  swift_release();
  swift_release();
  type metadata accessor for FacePickerCarouselView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE10);
  sub_2443B7100();
  uint64_t result = v3;
  if ((v2 & 1) == 0) {
    return sub_243EB18F8(v3, 0);
  }
  if (v3 == 2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E41EA0);
    return sub_2443B6E50();
  }
  return result;
}

uint64_t sub_2443B2370@<X0>(uint64_t a1@<X8>)
{
  return sub_2443B039C(*(void *)(v1 + 16), a1);
}

unint64_t sub_2443B2378()
{
  unint64_t result = qword_268E47830;
  if (!qword_268E47830)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47828);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47838);
    sub_243E9DC94(&qword_268E47840, &qword_268E47838);
    swift_getOpaqueTypeConformance2();
    sub_243E9DC94(&qword_268E3D1B8, &qword_268E3D1C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47830);
  }
  return result;
}

uint64_t sub_2443B2484@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for FacePickerCarouselView();

  return sub_2443B1A84(a1);
}

uint64_t sub_2443B24F8()
{
  return sub_2443B252C((uint64_t (*)(uint64_t))sub_2443B1BBC);
}

uint64_t sub_2443B2514()
{
  return sub_2443B252C(sub_2443B21EC);
}

uint64_t sub_2443B252C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for FacePickerCarouselView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

unint64_t sub_2443B25A0()
{
  unint64_t result = qword_268E47858;
  if (!qword_268E47858)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E477F8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E477E8);
    type metadata accessor for FacePickerGridView();
    sub_243E9DC94(&qword_268E47848, &qword_268E477E8);
    sub_2443B3E80(&qword_268E3DED0, (void (*)(uint64_t))type metadata accessor for FacePickerGridView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47858);
  }
  return result;
}

unint64_t sub_2443B26C4()
{
  unint64_t result = qword_268E47868;
  if (!qword_268E47868)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47810);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47800);
    sub_2443B3FA0(&qword_268E47850, &qword_268E47800, (void (*)(void))sub_2443B25A0);
    swift_getOpaqueTypeConformance2();
    sub_243E9DC94(&qword_268E3DEF8, &qword_268E3DEE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47868);
  }
  return result;
}

uint64_t sub_2443B27F4@<X0>(uint64_t a1@<X8>)
{
  return sub_2443B094C(*(void **)(v1 + 16), a1);
}

unint64_t sub_2443B27FC()
{
  unint64_t result = qword_268E47880;
  if (!qword_268E47880)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47878);
    sub_243E9DC94(&qword_268E47888, &qword_268E47890);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47880);
  }
  return result;
}

uint64_t sub_2443B28A0()
{
  type metadata accessor for FacePickerCarouselView();

  return sub_2443B1430();
}

uint64_t sub_2443B2910@<X0>(uint64_t a1@<X8>)
{
  return sub_2443B14A4(*(void *)(v1 + 16), a1);
}

uint64_t sub_2443B2918()
{
  return sub_2443B1748(*(void *)(v0 + 16));
}

uint64_t sub_2443B2920()
{
  return sub_2443B1930(*(void *)(v0 + 16));
}

uint64_t sub_2443B292C()
{
  return sub_2443B2944((void (*)(uint64_t))sub_243F99604);
}

uint64_t sub_2443B2944(void (*a1)(uint64_t))
{
  uint64_t v3 = *(void *)(type metadata accessor for FacePickerCarouselView() - 8);
  return sub_244065F00(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

uint64_t sub_2443B29AC()
{
  return sub_2443B2944((void (*)(uint64_t))sub_243F98D70);
}

uint64_t sub_2443B29C4()
{
  return sub_2443B8080();
}

uint64_t sub_2443B29F8()
{
  return *(void *)v0;
}

uint64_t sub_2443B2A28()
{
  return sub_2443B3FA0(&qword_268E478D0, &qword_268E478D8, (void (*)(void))sub_2443B2A58);
}

unint64_t sub_2443B2A58()
{
  unint64_t result = qword_268E478E0;
  if (!qword_268E478E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E478E8);
    sub_243E9DC94(&qword_268E3BD20, &qword_268E3BD00);
    sub_2443B3E80(&qword_268E3F340, MEMORY[0x263F1A048]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E478E0);
  }
  return result;
}

unint64_t sub_2443B2B28()
{
  unint64_t result = qword_268E478F8;
  if (!qword_268E478F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47900);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47908);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47910);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47918);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47920);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47928);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47930);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47938);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47940);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47948);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47950);
    sub_2443B8A30();
    sub_2443B2E08();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E478F8);
  }
  return result;
}

unint64_t sub_2443B2E08()
{
  unint64_t result = qword_268E47958;
  if (!qword_268E47958)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47950);
    sub_243E9DC94(&qword_268E47960, &qword_268E47968);
    sub_2443B3E80(&qword_268E3F340, MEMORY[0x263F1A048]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47958);
  }
  return result;
}

uint64_t sub_2443B2EE0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  sub_243EA5864(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_243EA5864(v2, v3, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_2443B2FA8@<X0>(char *a1@<X8>)
{
  return sub_2443ACC18(*(void *)(v1 + 16), a1);
}

unint64_t sub_2443B2FB0()
{
  unint64_t result = qword_268E479C0;
  if (!qword_268E479C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47998);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47988);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47980);
    sub_243E9DC94(&qword_268E479B8, &qword_268E47980);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E479C0);
  }
  return result;
}

uint64_t sub_2443B30C8@<X0>(uint64_t a1@<X8>)
{
  return sub_2443ACFB8(*(void *)(v1 + 16), a1);
}

uint64_t sub_2443B30D0@<X0>(uint64_t a1@<X8>)
{
  return sub_2443AD228(*(void *)(v1 + 16), a1);
}

unint64_t sub_2443B30D8()
{
  unint64_t result = qword_268E479E0;
  if (!qword_268E479E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E479D8);
    sub_243E9DC94(&qword_268E3E058, &qword_268E3E060);
    sub_243E9DC94((unint64_t *)&qword_268E38940, &qword_268E38948);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E479E0);
  }
  return result;
}

uint64_t sub_2443B31A0()
{
  type metadata accessor for FacePickerCarouselView();

  return sub_2443AC478();
}

uint64_t sub_2443B3224()
{
  return sub_2443B252C((uint64_t (*)(uint64_t))sub_2443AD388);
}

uint64_t sub_2443B323C@<X0>(uint64_t a1@<X8>)
{
  return sub_2443AEDE4(*(uint64_t **)(v1 + 16), a1);
}

uint64_t sub_2443B3250()
{
  type metadata accessor for FacePickerCarouselView();

  return sub_244063B78();
}

uint64_t sub_2443B32DC(uint64_t a1)
{
  return sub_2443B3310(a1, (uint64_t (*)(uint64_t, uint64_t))sub_244063BDC);
}

uint64_t sub_2443B32F8(uint64_t a1)
{
  return sub_2443B3310(a1, (uint64_t (*)(uint64_t, uint64_t))sub_2443AF200);
}

uint64_t sub_2443B3310(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for FacePickerCarouselView() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

unint64_t sub_2443B33A4()
{
  unint64_t result = qword_268E47A28;
  if (!qword_268E47A28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E47A20);
    sub_243E9DC94(&qword_268E47A30, &qword_268E47A38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E47A28);
  }
  return result;
}

uint64_t objectdestroyTm_44()
{
  uint64_t v1 = (int *)type metadata accessor for FacePickerCarouselView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = v3 + v1[6];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  sub_243EB18F8(*(void *)(v3 + v1[7]), *(unsigned char *)(v3 + v1[7] + 8));
  uint64_t v6 = v3 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2443B8640();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = v3 + v1[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2443B77D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = v3 + v1[10];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E44CB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_2443B6F30();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  else
  {
    swift_release();
  }
  uint64_t v13 = v3 + v1[12];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3CD20);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);
  v15(v13, v14);
  v15(v3 + v1[13], v14);
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2443B377C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for FacePickerCarouselView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_2443AF7B0(a1, a2, v6);
}

uint64_t sub_2443B3808()
{
  type metadata accessor for FacePickerCarouselView();
  type metadata accessor for CarouselFace();

  return sub_2443ABC5C();
}

uint64_t objectdestroy_109Tm()
{
  uint64_t v1 = (int *)type metadata accessor for FacePickerCarouselView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for CarouselFace() - 8) + 80);
  uint64_t v6 = v0 + v3;
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = v0 + v3 + v1[6];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  sub_243EB18F8(*(void *)(v6 + v1[7]), *(unsigned char *)(v6 + v1[7] + 8));
  uint64_t v9 = v0 + v3 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E38400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2443B8640();
    uint64_t v11 = *(void *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v12 = v6 + v1[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E3DE18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_2443B77D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  uint64_t v14 = v6 + v1[10];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E44CB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_2443B6F30();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = (v3 + v4 + v5) & ~v5;
  uint64_t v17 = v6 + v1[12];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3CD20);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8);
  v19(v17, v18);
  v19(v6 + v1[13], v18);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v20 = v0 + v16 + *(int *)(type metadata accessor for PhotosPersonAsset() + 20);
  swift_bridgeObjectRelease();
  uint64_t v21 = (id *)(v20 + *(int *)(type metadata accessor for PhotosPersonImage() + 24));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v22 = (char *)v21 + *(int *)(type metadata accessor for PlaygroundImage() + 32);
  uint64_t v23 = sub_2443B54B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v22, v23);
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2443B3D30()
{
  uint64_t v2 = *(void *)(type metadata accessor for FacePickerCarouselView() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for CarouselFace() - 8) + 80);
  unint64_t v6 = v3 + v4 + v5;
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + (v6 & ~v5);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_243EAE800;
  return sub_24405FF84(v7, v8);
}

void sub_2443B3E64()
{
  sub_2443ABCDC(*(uint64_t **)(v0 + 16));
}

uint64_t sub_2443B3E80(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2443B3EC8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2443B3F38(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2443B3FA0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for FixedPresentationSizing()
{
  return &type metadata for FixedPresentationSizing;
}

uint64_t getEnumTagSinglePayload for FacePickerCarouselView.Metrics(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 112)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for FacePickerCarouselView.Metrics(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 112) = v3;
  return result;
}

ValueMetadata *type metadata accessor for FacePickerCarouselView.Metrics()
{
  return &type metadata for FacePickerCarouselView.Metrics;
}

uint64_t sub_2443B40BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_2443B4150()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_268E47A68 = (uint64_t)result;
  return result;
}

uint64_t sub_2443B41A8(uint64_t a1)
{
  return sub_2443B43A0(a1, qword_268E77168);
}

uint64_t sub_2443B41CC(uint64_t a1)
{
  return sub_2443B43A0(a1, qword_268E77180);
}

uint64_t sub_2443B41F0(uint64_t a1)
{
  return sub_2443B43A0(a1, qword_268E77198);
}

uint64_t sub_2443B4214(uint64_t a1)
{
  return sub_2443B43A0(a1, qword_268E771B0);
}

uint64_t sub_2443B423C(uint64_t a1)
{
  return sub_2443B43A0(a1, qword_268E771C8);
}

uint64_t sub_2443B4268(uint64_t a1)
{
  return sub_2443B43A0(a1, qword_268E771E0);
}

uint64_t sub_2443B428C(uint64_t a1)
{
  return sub_2443B43A0(a1, qword_268E771F8);
}

uint64_t sub_2443B42B0(uint64_t a1)
{
  return sub_2443B43A0(a1, qword_268E77210);
}

uint64_t sub_2443B42D8(uint64_t a1)
{
  return sub_2443B43A0(a1, qword_268E77228);
}

uint64_t sub_2443B4304(uint64_t a1)
{
  return sub_2443B43A0(a1, qword_268E77240);
}

uint64_t sub_2443B432C(uint64_t a1)
{
  return sub_2443B43A0(a1, qword_268E77258);
}

uint64_t sub_2443B4350(uint64_t a1)
{
  return sub_2443B43A0(a1, qword_268E77270);
}

uint64_t sub_2443B437C(uint64_t a1)
{
  return sub_2443B43A0(a1, qword_268E77288);
}

uint64_t sub_2443B43A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2443B6540();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_268E37CC8 != -1) {
    swift_once();
  }
  id v4 = (id)qword_268E47A68;
  return sub_2443B6530();
}

uint64_t sub_2443B4444()
{
  uint64_t v0 = sub_2443B6560();
  __swift_allocate_value_buffer(v0, qword_268E772A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_268E772A0);
  if (qword_268E37CC8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_268E47A68;
  return sub_2443B6530();
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_268E76CD8 == -1)
  {
    if (qword_268E76CE0) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_268E76CD8, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_268E76CE0) {
      return _availability_version_check();
    }
  }
  if (qword_268E76CD0 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_268E76CD0, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_268E76CC4 > a3) {
    return 1;
  }
  return dword_268E76CC4 >= a3 && dword_268E76CC8 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v1 = qword_268E76CE0;
  if (qword_268E76CE0) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x263EF8368])
    {
      uint64_t v1 = MEMORY[0x270FA5398];
      qword_268E76CE0 = MEMORY[0x270FA5398];
    }
    if (!v1 || result != 0)
    {
      id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        id v4 = *(unsigned __int8 **)result;
        id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            uint64_t v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    uint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        id result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x24568F310](v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_268E76CC4, &dword_268E76CC8);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_2443B49D0()
{
  return MEMORY[0x270F08328]();
}

uint64_t sub_2443B49F0()
{
  return MEMORY[0x270F08338]();
}

uint64_t sub_2443B4A00()
{
  return MEMORY[0x270F08340]();
}

uint64_t sub_2443B4A10()
{
  return MEMORY[0x270F08348]();
}

uint64_t sub_2443B4A20()
{
  return MEMORY[0x270EE0A98]();
}

uint64_t sub_2443B4A50()
{
  return MEMORY[0x270EE0C80]();
}

uint64_t sub_2443B4A60()
{
  return MEMORY[0x270EE0CB0]();
}

uint64_t sub_2443B4A70()
{
  return MEMORY[0x270EE0CC0]();
}

uint64_t sub_2443B4A80()
{
  return MEMORY[0x270EE0CD0]();
}

uint64_t sub_2443B4AA0()
{
  return MEMORY[0x270EE0D18]();
}

uint64_t sub_2443B4AC0()
{
  return MEMORY[0x270EE0DA0]();
}

uint64_t sub_2443B4AD0()
{
  return MEMORY[0x270EE0DA8]();
}

uint64_t sub_2443B4AE0()
{
  return MEMORY[0x270EE0DB8]();
}

uint64_t sub_2443B4AF0()
{
  return MEMORY[0x270EE0DF8]();
}

uint64_t sub_2443B4B10()
{
  return MEMORY[0x270EE0E68]();
}

uint64_t sub_2443B4B20()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_2443B4B30()
{
  return MEMORY[0x270EE0E98]();
}

uint64_t sub_2443B4B40()
{
  return MEMORY[0x270F07DD8]();
}

uint64_t sub_2443B4B50()
{
  return MEMORY[0x270EE0F90]();
}

uint64_t sub_2443B4B60()
{
  return MEMORY[0x270EE11D8]();
}

uint64_t sub_2443B4B70()
{
  return MEMORY[0x270EE11F8]();
}

uint64_t sub_2443B4B80()
{
  return MEMORY[0x270EE1208]();
}

uint64_t sub_2443B4B90()
{
  return MEMORY[0x270EE1250]();
}

uint64_t sub_2443B4BA0()
{
  return MEMORY[0x270EE1288]();
}

uint64_t sub_2443B4BB0()
{
  return MEMORY[0x270EE1300]();
}

uint64_t sub_2443B4BC0()
{
  return MEMORY[0x270EE13B8]();
}

uint64_t sub_2443B4BD0()
{
  return MEMORY[0x270EE13C0]();
}

uint64_t sub_2443B4BE0()
{
  return MEMORY[0x270EE18A0]();
}

uint64_t sub_2443B4BF0()
{
  return MEMORY[0x270EE1900]();
}

uint64_t sub_2443B4C00()
{
  return MEMORY[0x270EE1918]();
}

uint64_t sub_2443B4C10()
{
  return MEMORY[0x270EE1938]();
}

uint64_t sub_2443B4C20()
{
  return MEMORY[0x270EE1958]();
}

uint64_t sub_2443B4C30()
{
  return MEMORY[0x270EE19E0]();
}

uint64_t sub_2443B4C40()
{
  return MEMORY[0x270EE19E8]();
}

uint64_t sub_2443B4C50()
{
  return MEMORY[0x270EE1A00]();
}

uint64_t sub_2443B4C70()
{
  return MEMORY[0x270EE1A20]();
}

uint64_t sub_2443B4C80()
{
  return MEMORY[0x270EE1B80]();
}

uint64_t sub_2443B4C90()
{
  return MEMORY[0x270EE1B98]();
}

uint64_t sub_2443B4CB0()
{
  return MEMORY[0x270EE1C48]();
}

uint64_t sub_2443B4CC0()
{
  return MEMORY[0x270EE1CA0]();
}

uint64_t sub_2443B4CD0()
{
  return MEMORY[0x270EE1CC0]();
}

uint64_t sub_2443B4CF0()
{
  return MEMORY[0x270EED9A8]();
}

uint64_t sub_2443B4D00()
{
  return MEMORY[0x270EED9C0]();
}

uint64_t sub_2443B4D10()
{
  return MEMORY[0x270EED9C8]();
}

uint64_t sub_2443B4D20()
{
  return MEMORY[0x270EEDA90]();
}

uint64_t sub_2443B4D30()
{
  return MEMORY[0x270EEDB78]();
}

uint64_t sub_2443B4D40()
{
  return MEMORY[0x270EEDB90]();
}

uint64_t sub_2443B4D50()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_2443B4D60()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2443B4D70()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_2443B4D80()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_2443B4D90()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_2443B4DA0()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_2443B4DB0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_2443B4DC0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_2443B4DD0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_2443B4DE0()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_2443B4DF0()
{
  return MEMORY[0x270EEE218]();
}

uint64_t sub_2443B4E00()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2443B4E10()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_2443B4E20()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_2443B4E30()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_2443B4E40()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_2443B4E50()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_2443B4E60()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_2443B4E70()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_2443B4E80()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_2443B4E90()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_2443B4EA0()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_2443B4EB0()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_2443B4EC0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2443B4ED0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2443B4EE0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2443B4EF0()
{
  return MEMORY[0x270EEE8F8]();
}

uint64_t sub_2443B4F00()
{
  return MEMORY[0x270EEE908]();
}

uint64_t sub_2443B4F10()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_2443B4F20()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_2443B4F30()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_2443B4F40()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_2443B4F50()
{
  return MEMORY[0x270EFEAC8]();
}

uint64_t sub_2443B4F60()
{
  return MEMORY[0x270EFEB00]();
}

uint64_t sub_2443B4F70()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t sub_2443B4F80()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t sub_2443B4F90()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_2443B4FA0()
{
  return MEMORY[0x270EEEB40]();
}

uint64_t sub_2443B4FB0()
{
  return MEMORY[0x270EEEB88]();
}

uint64_t sub_2443B4FC0()
{
  return MEMORY[0x270EEEBE0]();
}

uint64_t sub_2443B4FD0()
{
  return MEMORY[0x270EEEDA0]();
}

uint64_t sub_2443B4FE0()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_2443B4FF0()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_2443B5000()
{
  return MEMORY[0x270EEEEA8]();
}

uint64_t sub_2443B5010()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_2443B5020()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_2443B5030()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_2443B5040()
{
  return MEMORY[0x270EEF128]();
}

uint64_t sub_2443B5050()
{
  return MEMORY[0x270EEF220]();
}

uint64_t sub_2443B5060()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_2443B5070()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_2443B5080()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_2443B5090()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_2443B50A0()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_2443B50B0()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_2443B5100()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t sub_2443B5130()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_2443B5140()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_2443B5150()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2443B5160()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2443B5170()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_2443B5180()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_2443B5190()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_2443B51A0()
{
  return MEMORY[0x270EEF8C8]();
}

uint64_t sub_2443B51B0()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_2443B51C0()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_2443B51D0()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_2443B51E0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_2443B51F0()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_2443B5200()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2443B5210()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_2443B5220()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_2443B5230()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_2443B5240()
{
  return MEMORY[0x270EEFD00]();
}

uint64_t sub_2443B5250()
{
  return MEMORY[0x270EEFD10]();
}

uint64_t sub_2443B5260()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2443B5270()
{
  return MEMORY[0x270EEFD58]();
}

uint64_t sub_2443B5280()
{
  return MEMORY[0x270FA1648]();
}

uint64_t sub_2443B5290()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_2443B52A0()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_2443B52B0()
{
  return MEMORY[0x270EEFDB8]();
}

uint64_t sub_2443B52C0()
{
  return MEMORY[0x270EEFE18]();
}

uint64_t sub_2443B52D0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2443B52E0()
{
  return MEMORY[0x270EEFE38]();
}

uint64_t sub_2443B52F0()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_2443B5300()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_2443B5310()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2443B5320()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_2443B5330()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_2443B5340()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_2443B5350()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2443B5360()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_2443B5370()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2443B5380()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2443B5390()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_2443B53A0()
{
  return MEMORY[0x270EF02D8]();
}

uint64_t sub_2443B53B0()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_2443B53C0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_2443B53D0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2443B53E0()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_2443B53F0()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_2443B5400()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_2443B5410()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2443B5420()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2443B5430()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2443B5440()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2443B5450()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_2443B5460()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2443B5470()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_2443B5480()
{
  return MEMORY[0x270EF0C98]();
}

uint64_t _s15ImagePlayground0A10GenerationV07PreviewA0V2eeoiySbAE_AEtFZ_0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_2443B54A0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2443B54B0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2443B54C0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_2443B54D0()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_2443B54E0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2443B54F0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2443B5500()
{
  return MEMORY[0x270EF1458]();
}

uint64_t sub_2443B5510()
{
  return MEMORY[0x270EF1460]();
}

uint64_t sub_2443B5520()
{
  return MEMORY[0x270EF1478]();
}

uint64_t sub_2443B5530()
{
  return MEMORY[0x270EF14B8]();
}

uint64_t sub_2443B5540()
{
  return MEMORY[0x270EF14C0]();
}

uint64_t sub_2443B5550()
{
  return MEMORY[0x270EF14D8]();
}

uint64_t sub_2443B5560()
{
  return MEMORY[0x270EF1510]();
}

uint64_t sub_2443B5570()
{
  return MEMORY[0x270EF1538]();
}

uint64_t sub_2443B5580()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_2443B5590()
{
  return MEMORY[0x270F81700]();
}

uint64_t sub_2443B55A0()
{
  return MEMORY[0x270F81718]();
}

uint64_t sub_2443B55B0()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_2443B55C0()
{
  return MEMORY[0x270FA1168]();
}

uint64_t sub_2443B55D0()
{
  return MEMORY[0x270FA11C0]();
}

uint64_t sub_2443B55E0()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_2443B55F0()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_2443B5600()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_2443B5610()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_2443B5620()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_2443B5630()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_2443B5640()
{
  return MEMORY[0x270EE57F8]();
}

uint64_t sub_2443B5650()
{
  return MEMORY[0x270EEB958]();
}

uint64_t sub_2443B5660()
{
  return MEMORY[0x270EEB970]();
}

uint64_t sub_2443B5670()
{
  return MEMORY[0x270EEB978]();
}

uint64_t sub_2443B5680()
{
  return MEMORY[0x270EEB980]();
}

uint64_t sub_2443B5690()
{
  return MEMORY[0x270EEB988]();
}

uint64_t sub_2443B56A0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_2443B56B0()
{
  return MEMORY[0x270F4BA28]();
}

uint64_t sub_2443B56C0()
{
  return MEMORY[0x270F4BC00]();
}

uint64_t sub_2443B56D0()
{
  return MEMORY[0x270F4BE70]();
}

uint64_t sub_2443B56E0()
{
  return MEMORY[0x270F4C098]();
}

uint64_t sub_2443B56F0()
{
  return MEMORY[0x270F4C0A0]();
}

uint64_t sub_2443B5700()
{
  return MEMORY[0x270F83A58]();
}

uint64_t sub_2443B5710()
{
  return MEMORY[0x270F83A70]();
}

uint64_t sub_2443B5720()
{
  return MEMORY[0x270F83AA0]();
}

uint64_t sub_2443B5730()
{
  return MEMORY[0x270F83AA8]();
}

uint64_t sub_2443B5740()
{
  return MEMORY[0x270F83AB8]();
}

uint64_t sub_2443B5750()
{
  return MEMORY[0x270F83AC0]();
}

uint64_t sub_2443B5760()
{
  return MEMORY[0x270F83AD0]();
}

uint64_t sub_2443B5770()
{
  return MEMORY[0x270F83AF8]();
}

uint64_t sub_2443B5780()
{
  return MEMORY[0x270F83B20]();
}

uint64_t sub_2443B5790()
{
  return MEMORY[0x270F83B38]();
}

uint64_t sub_2443B57A0()
{
  return MEMORY[0x270F83B58]();
}

uint64_t sub_2443B57B0()
{
  return MEMORY[0x270F83B70]();
}

uint64_t sub_2443B57C0()
{
  return MEMORY[0x270F83B78]();
}

uint64_t sub_2443B57D0()
{
  return MEMORY[0x270F83BD8]();
}

uint64_t sub_2443B57E0()
{
  return MEMORY[0x270F83C08]();
}

uint64_t sub_2443B57F0()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_2443B5800()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_2443B5810()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_2443B5820()
{
  return MEMORY[0x270F287E0]();
}

uint64_t sub_2443B5830()
{
  return MEMORY[0x270F28810]();
}

uint64_t sub_2443B5840()
{
  return MEMORY[0x270F28850]();
}

uint64_t sub_2443B5850()
{
  return MEMORY[0x270F288A8]();
}

uint64_t sub_2443B5860()
{
  return MEMORY[0x270F28900]();
}

uint64_t sub_2443B5870()
{
  return MEMORY[0x270F28930]();
}

uint64_t sub_2443B5880()
{
  return MEMORY[0x270F28938]();
}

uint64_t sub_2443B5890()
{
  return MEMORY[0x270F28988]();
}

uint64_t sub_2443B58A0()
{
  return MEMORY[0x270F289A8]();
}

uint64_t sub_2443B58B0()
{
  return MEMORY[0x270F289D8]();
}

uint64_t sub_2443B58C0()
{
  return MEMORY[0x270F289F8]();
}

uint64_t sub_2443B58D0()
{
  return MEMORY[0x270F28A20]();
}

uint64_t sub_2443B58E0()
{
  return MEMORY[0x270F28AD8]();
}

uint64_t sub_2443B58F0()
{
  return MEMORY[0x270EE9F40]();
}

uint64_t sub_2443B5900()
{
  return MEMORY[0x270EE9F48]();
}

uint64_t sub_2443B5910()
{
  return MEMORY[0x270EE9F58]();
}

uint64_t sub_2443B5920()
{
  return MEMORY[0x270EE9F68]();
}

uint64_t sub_2443B5930()
{
  return MEMORY[0x270EE9F78]();
}

uint64_t sub_2443B5940()
{
  return MEMORY[0x270EE9F90]();
}

uint64_t sub_2443B5950()
{
  return MEMORY[0x270F2F850]();
}

uint64_t sub_2443B5960()
{
  return MEMORY[0x270F2F860]();
}

uint64_t sub_2443B5970()
{
  return MEMORY[0x270F2F870]();
}

uint64_t sub_2443B5980()
{
  return MEMORY[0x270F2F890]();
}

uint64_t sub_2443B5990()
{
  return MEMORY[0x270F2F898]();
}

uint64_t sub_2443B59A0()
{
  return MEMORY[0x270F2F8B0]();
}

uint64_t sub_2443B59B0()
{
  return MEMORY[0x270F2F8B8]();
}

uint64_t sub_2443B59C0()
{
  return MEMORY[0x270F2F8C8]();
}

uint64_t sub_2443B59D0()
{
  return MEMORY[0x270F2F8D8]();
}

uint64_t sub_2443B59E0()
{
  return MEMORY[0x270F2F8F0]();
}

uint64_t sub_2443B59F0()
{
  return MEMORY[0x270F2F900]();
}

uint64_t sub_2443B5A00()
{
  return MEMORY[0x270F2F910]();
}

uint64_t sub_2443B5A10()
{
  return MEMORY[0x270F2F928]();
}

uint64_t sub_2443B5A20()
{
  return MEMORY[0x270F2F948]();
}

uint64_t sub_2443B5A30()
{
  return MEMORY[0x270F2F950]();
}

uint64_t sub_2443B5A40()
{
  return MEMORY[0x270F2F990]();
}

uint64_t sub_2443B5A50()
{
  return MEMORY[0x270F2F9A8]();
}

uint64_t sub_2443B5A60()
{
  return MEMORY[0x270F2F9C0]();
}

uint64_t sub_2443B5A70()
{
  return MEMORY[0x270F2FA20]();
}

uint64_t sub_2443B5A80()
{
  return MEMORY[0x270F2FA28]();
}

uint64_t sub_2443B5A90()
{
  return MEMORY[0x270F2FA30]();
}

uint64_t sub_2443B5AA0()
{
  return MEMORY[0x270F2FA38]();
}

uint64_t sub_2443B5AC0()
{
  return MEMORY[0x270F2FA48]();
}

uint64_t sub_2443B5AD0()
{
  return MEMORY[0x270F2FA50]();
}

uint64_t sub_2443B5AE0()
{
  return MEMORY[0x270F2FA88]();
}

uint64_t sub_2443B5AF0()
{
  return MEMORY[0x270F2FA90]();
}

uint64_t sub_2443B5B00()
{
  return MEMORY[0x270F2FA98]();
}

uint64_t sub_2443B5B10()
{
  return MEMORY[0x270F83C58]();
}

uint64_t sub_2443B5B20()
{
  return MEMORY[0x270F83C60]();
}

uint64_t sub_2443B5B30()
{
  return MEMORY[0x270F83C68]();
}

uint64_t sub_2443B5B40()
{
  return MEMORY[0x270F83C70]();
}

uint64_t _s15ImagePlayground0A17ConditioningStyleV2idSSvg_0()
{
  return MEMORY[0x270F83C78]();
}

uint64_t sub_2443B5B60()
{
  return MEMORY[0x270F83C80]();
}

uint64_t sub_2443B5B70()
{
  return MEMORY[0x270F83C88]();
}

uint64_t sub_2443B5B80()
{
  return MEMORY[0x270F83C90]();
}

uint64_t sub_2443B5B90()
{
  return MEMORY[0x270F83C98]();
}

uint64_t sub_2443B5BA0()
{
  return MEMORY[0x270F83CA0]();
}

uint64_t sub_2443B5BB0()
{
  return MEMORY[0x270F83CA8]();
}

uint64_t sub_2443B5BC0()
{
  return MEMORY[0x270F83CB0]();
}

uint64_t sub_2443B5BD0()
{
  return MEMORY[0x270F83CB8]();
}

uint64_t sub_2443B5BE0()
{
  return MEMORY[0x270F83CC0]();
}

uint64_t sub_2443B5BF0()
{
  return MEMORY[0x270F83CD0]();
}

uint64_t sub_2443B5C00()
{
  return MEMORY[0x270F83CD8]();
}

uint64_t sub_2443B5C10()
{
  return MEMORY[0x270F83CE0]();
}

uint64_t sub_2443B5C20()
{
  return MEMORY[0x270F83CE8]();
}

uint64_t sub_2443B5C30()
{
  return MEMORY[0x270F83CF0]();
}

uint64_t sub_2443B5C40()
{
  return MEMORY[0x270F83CF8]();
}

uint64_t sub_2443B5C50()
{
  return MEMORY[0x270F83D00]();
}

uint64_t sub_2443B5C60()
{
  return MEMORY[0x270F83D10]();
}

uint64_t sub_2443B5C70()
{
  return MEMORY[0x270F83D18]();
}

uint64_t sub_2443B5C80()
{
  return MEMORY[0x270F83D20]();
}

uint64_t sub_2443B5C90()
{
  return MEMORY[0x270F83D28]();
}

uint64_t sub_2443B5CA0()
{
  return MEMORY[0x270F83D30]();
}

uint64_t sub_2443B5CB0()
{
  return MEMORY[0x270F83D38]();
}

uint64_t sub_2443B5CC0()
{
  return MEMORY[0x270F83D40]();
}

uint64_t sub_2443B5CD0()
{
  return MEMORY[0x270F83D48]();
}

uint64_t sub_2443B5CE0()
{
  return MEMORY[0x270F83D50]();
}

uint64_t sub_2443B5CF0()
{
  return MEMORY[0x270F83D58]();
}

uint64_t sub_2443B5D00()
{
  return MEMORY[0x270F83D60]();
}

uint64_t sub_2443B5D10()
{
  return MEMORY[0x270F83D68]();
}

uint64_t sub_2443B5D20()
{
  return MEMORY[0x270F83D70]();
}

uint64_t sub_2443B5D30()
{
  return MEMORY[0x270F83D78]();
}

uint64_t sub_2443B5D40()
{
  return MEMORY[0x270F83D80]();
}

uint64_t sub_2443B5D50()
{
  return MEMORY[0x270F83D88]();
}

uint64_t sub_2443B5D60()
{
  return MEMORY[0x270F83D98]();
}

uint64_t sub_2443B5D70()
{
  return MEMORY[0x270F83DA0]();
}

uint64_t sub_2443B5D80()
{
  return MEMORY[0x270F83DA8]();
}

uint64_t sub_2443B5D90()
{
  return MEMORY[0x270F83DB0]();
}

uint64_t sub_2443B5DA0()
{
  return MEMORY[0x270F83DB8]();
}

uint64_t sub_2443B5DB0()
{
  return MEMORY[0x270F83DC0]();
}

uint64_t sub_2443B5DC0()
{
  return MEMORY[0x270F83DC8]();
}

uint64_t sub_2443B5DD0()
{
  return MEMORY[0x270F83DD0]();
}

uint64_t sub_2443B5DE0()
{
  return MEMORY[0x270F83DD8]();
}

uint64_t sub_2443B5DF0()
{
  return MEMORY[0x270F83DE0]();
}

uint64_t sub_2443B5E00()
{
  return MEMORY[0x270F83DE8]();
}

uint64_t sub_2443B5E10()
{
  return MEMORY[0x270F83DF0]();
}

uint64_t sub_2443B5E40()
{
  return MEMORY[0x270F83E08]();
}

uint64_t sub_2443B5E50()
{
  return MEMORY[0x270F83E10]();
}

uint64_t sub_2443B5E60()
{
  return MEMORY[0x270F83E18]();
}

uint64_t sub_2443B5E70()
{
  return MEMORY[0x270F83E20]();
}

uint64_t sub_2443B5E80()
{
  return MEMORY[0x270F83E28]();
}

uint64_t sub_2443B5EA0()
{
  return MEMORY[0x270F83E38]();
}

uint64_t sub_2443B5EB0()
{
  return MEMORY[0x270F83E40]();
}

uint64_t sub_2443B5EC0()
{
  return MEMORY[0x270F83E48]();
}

uint64_t sub_2443B5ED0()
{
  return MEMORY[0x270F83E50]();
}

uint64_t sub_2443B5EE0()
{
  return MEMORY[0x270F83E58]();
}

uint64_t sub_2443B5EF0()
{
  return MEMORY[0x270F83E60]();
}

uint64_t sub_2443B5F00()
{
  return MEMORY[0x270F83E68]();
}

uint64_t sub_2443B5F10()
{
  return MEMORY[0x270F83E70]();
}

uint64_t sub_2443B5F20()
{
  return MEMORY[0x270F83E78]();
}

uint64_t sub_2443B5F30()
{
  return MEMORY[0x270F83E80]();
}

uint64_t sub_2443B5F40()
{
  return MEMORY[0x270F83E88]();
}

uint64_t sub_2443B5F50()
{
  return MEMORY[0x270F83E90]();
}

uint64_t sub_2443B5F60()
{
  return MEMORY[0x270F83E98]();
}

uint64_t sub_2443B5F70()
{
  return MEMORY[0x270F83EA0]();
}

uint64_t sub_2443B5F80()
{
  return MEMORY[0x270F83EA8]();
}

uint64_t sub_2443B5F90()
{
  return MEMORY[0x270F83EB0]();
}

uint64_t sub_2443B5FA0()
{
  return MEMORY[0x270F83EB8]();
}

uint64_t sub_2443B5FB0()
{
  return MEMORY[0x270F83EC0]();
}

uint64_t sub_2443B5FC0()
{
  return MEMORY[0x270F83EC8]();
}

uint64_t sub_2443B5FD0()
{
  return MEMORY[0x270F83ED0]();
}

uint64_t sub_2443B5FE0()
{
  return MEMORY[0x270F83ED8]();
}

uint64_t sub_2443B5FF0()
{
  return MEMORY[0x270F83EE0]();
}

uint64_t sub_2443B6000()
{
  return MEMORY[0x270F83EE8]();
}

uint64_t sub_2443B6010()
{
  return MEMORY[0x270F83EF0]();
}

uint64_t sub_2443B6020()
{
  return MEMORY[0x270F83EF8]();
}

uint64_t sub_2443B6030()
{
  return MEMORY[0x270F83F00]();
}

uint64_t sub_2443B6040()
{
  return MEMORY[0x270F83F08]();
}

uint64_t sub_2443B6050()
{
  return MEMORY[0x270F83F10]();
}

uint64_t sub_2443B6080()
{
  return MEMORY[0x270F83F28]();
}

uint64_t sub_2443B6090()
{
  return MEMORY[0x270F83F30]();
}

uint64_t sub_2443B60A0()
{
  return MEMORY[0x270F83F38]();
}

uint64_t sub_2443B60B0()
{
  return MEMORY[0x270F83F40]();
}

uint64_t sub_2443B60C0()
{
  return MEMORY[0x270F83F48]();
}

uint64_t sub_2443B60D0()
{
  return MEMORY[0x270F83F50]();
}

uint64_t sub_2443B60E0()
{
  return MEMORY[0x270F83F58]();
}

uint64_t sub_2443B60F0()
{
  return MEMORY[0x270F83F60]();
}

uint64_t sub_2443B6100()
{
  return MEMORY[0x270F83F68]();
}

uint64_t sub_2443B6110()
{
  return MEMORY[0x270F83F70]();
}

uint64_t sub_2443B6130()
{
  return MEMORY[0x270F83F80]();
}

uint64_t sub_2443B6140()
{
  return MEMORY[0x270F83F88]();
}

uint64_t sub_2443B6150()
{
  return MEMORY[0x270F83F90]();
}

uint64_t sub_2443B6170()
{
  return MEMORY[0x270F83FA8]();
}

uint64_t sub_2443B6180()
{
  return MEMORY[0x270F83FB0]();
}

uint64_t sub_2443B61A0()
{
  return MEMORY[0x270F83FC0]();
}

uint64_t sub_2443B61B0()
{
  return MEMORY[0x270F83FC8]();
}

uint64_t sub_2443B61C0()
{
  return MEMORY[0x270F83FD0]();
}

uint64_t sub_2443B61D0()
{
  return MEMORY[0x270F83FD8]();
}

uint64_t sub_2443B61E0()
{
  return MEMORY[0x270F83FE0]();
}

uint64_t sub_2443B61F0()
{
  return MEMORY[0x270F83FF8]();
}

uint64_t sub_2443B6200()
{
  return MEMORY[0x270F84000]();
}

uint64_t sub_2443B6210()
{
  return MEMORY[0x270F84008]();
}

uint64_t sub_2443B6220()
{
  return MEMORY[0x270F84040]();
}

uint64_t sub_2443B6230()
{
  return MEMORY[0x270F84050]();
}

uint64_t sub_2443B6240()
{
  return MEMORY[0x270F84058]();
}

uint64_t sub_2443B6250()
{
  return MEMORY[0x270F84060]();
}

uint64_t sub_2443B6260()
{
  return MEMORY[0x270F84068]();
}

uint64_t sub_2443B6270()
{
  return MEMORY[0x270F84070]();
}

uint64_t sub_2443B6280()
{
  return MEMORY[0x270F84078]();
}

uint64_t sub_2443B6290()
{
  return MEMORY[0x270F84090]();
}

uint64_t sub_2443B62A0()
{
  return MEMORY[0x270F84098]();
}

uint64_t sub_2443B62B0()
{
  return MEMORY[0x270F840A8]();
}

uint64_t sub_2443B62C0()
{
  return MEMORY[0x270F840B0]();
}

uint64_t sub_2443B62D0()
{
  return MEMORY[0x270F840B8]();
}

uint64_t sub_2443B62E0()
{
  return MEMORY[0x270F840C0]();
}

uint64_t sub_2443B62F0()
{
  return MEMORY[0x270F840C8]();
}

uint64_t sub_2443B6300()
{
  return MEMORY[0x270F840D0]();
}

uint64_t sub_2443B6310()
{
  return MEMORY[0x270F840D8]();
}

uint64_t sub_2443B6340()
{
  return MEMORY[0x270F84148]();
}

uint64_t sub_2443B6350()
{
  return MEMORY[0x270F84150]();
}

uint64_t sub_2443B6360()
{
  return MEMORY[0x270F84158]();
}

uint64_t sub_2443B6370()
{
  return MEMORY[0x270F84160]();
}

uint64_t sub_2443B6380()
{
  return MEMORY[0x270F84168]();
}

uint64_t _s15ImagePlayground0A16GenerationPersonV8SkinToneV2idSSvg_0()
{
  return MEMORY[0x270F84170]();
}

uint64_t sub_2443B63A0()
{
  return MEMORY[0x270F84178]();
}

uint64_t sub_2443B63B0()
{
  return MEMORY[0x270F84180]();
}

uint64_t sub_2443B63C0()
{
  return MEMORY[0x270F84188]();
}

uint64_t sub_2443B63D0()
{
  return MEMORY[0x270EEB7E8]();
}

uint64_t sub_2443B63E0()
{
  return MEMORY[0x270EEB7F8]();
}

uint64_t sub_2443B63F0()
{
  return MEMORY[0x270EEB800]();
}

uint64_t sub_2443B6400()
{
  return MEMORY[0x270EEB808]();
}

uint64_t sub_2443B6410()
{
  return MEMORY[0x270EEB810]();
}

uint64_t sub_2443B6420()
{
  return MEMORY[0x270EEB818]();
}

uint64_t sub_2443B6430()
{
  return MEMORY[0x270EEB8E0]();
}

uint64_t sub_2443B6440()
{
  return MEMORY[0x270EEB8E8]();
}

uint64_t sub_2443B6450()
{
  return MEMORY[0x270F843B0]();
}

uint64_t sub_2443B6460()
{
  return MEMORY[0x270F843B8]();
}

uint64_t sub_2443B6470()
{
  return MEMORY[0x270F843C0]();
}

uint64_t sub_2443B6480()
{
  return MEMORY[0x270F843F8]();
}

uint64_t sub_2443B6490()
{
  return MEMORY[0x270F84400]();
}

uint64_t sub_2443B64A0()
{
  return MEMORY[0x270F84410]();
}

uint64_t sub_2443B64B0()
{
  return MEMORY[0x270F84418]();
}

uint64_t sub_2443B64C0()
{
  return MEMORY[0x270F84428]();
}

uint64_t sub_2443B64D0()
{
  return MEMORY[0x270F84430]();
}

uint64_t sub_2443B64E0()
{
  return MEMORY[0x270F84450]();
}

uint64_t sub_2443B64F0()
{
  return MEMORY[0x270F84458]();
}

uint64_t sub_2443B6500()
{
  return MEMORY[0x270F4C178]();
}

uint64_t sub_2443B6510()
{
  return MEMORY[0x270F4C188]();
}

uint64_t sub_2443B6530()
{
  return MEMORY[0x270EEB1B0]();
}

uint64_t sub_2443B6540()
{
  return MEMORY[0x270EEB1C0]();
}

uint64_t sub_2443B6550()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_2443B6560()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_2443B6570()
{
  return MEMORY[0x270FA1658]();
}

uint64_t sub_2443B6580()
{
  return MEMORY[0x270FA1668]();
}

uint64_t sub_2443B6590()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_2443B65A0()
{
  return MEMORY[0x270FA1750]();
}

uint64_t sub_2443B65B0()
{
  return MEMORY[0x270FA17C0]();
}

uint64_t sub_2443B65C0()
{
  return MEMORY[0x270FA1800]();
}

uint64_t sub_2443B65D0()
{
  return MEMORY[0x270FA1808]();
}

uint64_t sub_2443B65E0()
{
  return MEMORY[0x270FA1828]();
}

uint64_t sub_2443B65F0()
{
  return MEMORY[0x270FA1830]();
}

uint64_t sub_2443B6600()
{
  return MEMORY[0x270FA1838]();
}

uint64_t sub_2443B6610()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_2443B6620()
{
  return MEMORY[0x270FA1888]();
}

uint64_t sub_2443B6630()
{
  return MEMORY[0x270FA18C8]();
}

uint64_t sub_2443B6640()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_2443B6650()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_2443B6660()
{
  return MEMORY[0x270F2EDE0]();
}

uint64_t sub_2443B6670()
{
  return MEMORY[0x270F2EDE8]();
}

uint64_t sub_2443B6680()
{
  return MEMORY[0x270F2EDF0]();
}

uint64_t sub_2443B6690()
{
  return MEMORY[0x270F2EDF8]();
}

uint64_t sub_2443B66A0()
{
  return MEMORY[0x270F16E28]();
}

uint64_t sub_2443B66C0()
{
  return MEMORY[0x270F16E38]();
}

uint64_t sub_2443B66D0()
{
  return MEMORY[0x270F5CFA0]();
}

uint64_t sub_2443B66E0()
{
  return MEMORY[0x270F5CFA8]();
}

uint64_t sub_2443B66F0()
{
  return MEMORY[0x270F5CFB0]();
}

uint64_t sub_2443B6700()
{
  return MEMORY[0x270F5CFB8]();
}

uint64_t sub_2443B6710()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_2443B6720()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_2443B6730()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_2443B6740()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_2443B6750()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2443B6760()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_2443B6770()
{
  return MEMORY[0x270FA2D68]();
}

uint64_t sub_2443B6780()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_2443B6790()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_2443B67A0()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_2443B67B0()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_2443B67C0()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_2443B67D0()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_2443B67E0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2443B67F0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2443B6800()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2443B6810()
{
  return MEMORY[0x270F5C490]();
}

uint64_t sub_2443B6820()
{
  return MEMORY[0x270F5C498]();
}

uint64_t sub_2443B6830()
{
  return MEMORY[0x270F5C4A0]();
}

uint64_t sub_2443B6840()
{
  return MEMORY[0x270F5C4B0]();
}

uint64_t sub_2443B6850()
{
  return MEMORY[0x270F5C510]();
}

uint64_t sub_2443B6860()
{
  return MEMORY[0x270F5C518]();
}

uint64_t sub_2443B6870()
{
  return MEMORY[0x270F5C568]();
}

uint64_t sub_2443B6880()
{
  return MEMORY[0x270F5C578]();
}

uint64_t sub_2443B6890()
{
  return MEMORY[0x270F5C590]();
}

uint64_t sub_2443B68A0()
{
  return MEMORY[0x270F5C680]();
}

uint64_t sub_2443B68B0()
{
  return MEMORY[0x270F5C6F8]();
}

uint64_t sub_2443B68C0()
{
  return MEMORY[0x270F5C728]();
}

uint64_t sub_2443B68D0()
{
  return MEMORY[0x270F5C730]();
}

uint64_t sub_2443B6900()
{
  return MEMORY[0x270F5C780]();
}

uint64_t sub_2443B6910()
{
  return MEMORY[0x270F5C788]();
}

uint64_t sub_2443B6920()
{
  return MEMORY[0x270F5C998]();
}

uint64_t sub_2443B6930()
{
  return MEMORY[0x270F5C9A0]();
}

uint64_t sub_2443B6940()
{
  return MEMORY[0x270F5CA08]();
}

uint64_t sub_2443B6950()
{
  return MEMORY[0x270F5CA60]();
}

uint64_t sub_2443B6960()
{
  return MEMORY[0x270F5CA68]();
}

uint64_t sub_2443B6970()
{
  return MEMORY[0x270F5CA70]();
}

uint64_t sub_2443B6980()
{
  return MEMORY[0x270F5CA78]();
}

uint64_t sub_2443B6990()
{
  return MEMORY[0x270F5CA88]();
}

uint64_t sub_2443B69A0()
{
  return MEMORY[0x270F5CA90]();
}

uint64_t sub_2443B69B0()
{
  return MEMORY[0x270F5CA98]();
}

uint64_t sub_2443B69C0()
{
  return MEMORY[0x270F5CAA8]();
}

uint64_t sub_2443B69D0()
{
  return MEMORY[0x270F5CAD0]();
}

uint64_t sub_2443B69E0()
{
  return MEMORY[0x270F5CB28]();
}

uint64_t sub_2443B69F0()
{
  return MEMORY[0x270F81788]();
}

uint64_t sub_2443B6A00()
{
  return MEMORY[0x270F81798]();
}

uint64_t sub_2443B6A10()
{
  return MEMORY[0x270F817A0]();
}

uint64_t sub_2443B6A20()
{
  return MEMORY[0x270F817A8]();
}

uint64_t sub_2443B6A30()
{
  return MEMORY[0x270F817B0]();
}

uint64_t sub_2443B6A40()
{
  return MEMORY[0x270F817D0]();
}

uint64_t sub_2443B6A50()
{
  return MEMORY[0x270F817D8]();
}

uint64_t sub_2443B6A60()
{
  return MEMORY[0x270F817E8]();
}

uint64_t sub_2443B6A70()
{
  return MEMORY[0x270F81800]();
}

uint64_t sub_2443B6A80()
{
  return MEMORY[0x270F81808]();
}

uint64_t sub_2443B6A90()
{
  return MEMORY[0x270F81810]();
}

uint64_t sub_2443B6AA0()
{
  return MEMORY[0x270F81820]();
}

uint64_t sub_2443B6AB0()
{
  return MEMORY[0x270F81828]();
}

uint64_t sub_2443B6AC0()
{
  return MEMORY[0x270F81838]();
}

uint64_t sub_2443B6AD0()
{
  return MEMORY[0x270F81840]();
}

uint64_t sub_2443B6AE0()
{
  return MEMORY[0x270F81850]();
}

uint64_t sub_2443B6AF0()
{
  return MEMORY[0x270F81868]();
}

uint64_t sub_2443B6B00()
{
  return MEMORY[0x270F81878]();
}

uint64_t sub_2443B6B10()
{
  return MEMORY[0x270F81888]();
}

uint64_t sub_2443B6B20()
{
  return MEMORY[0x270F81898]();
}

uint64_t sub_2443B6B30()
{
  return MEMORY[0x270F818A0]();
}

uint64_t sub_2443B6B90()
{
  return MEMORY[0x270F818F8]();
}

uint64_t sub_2443B6BA0()
{
  return MEMORY[0x270F81910]();
}

uint64_t sub_2443B6BB0()
{
  return MEMORY[0x270F81918]();
}

uint64_t sub_2443B6BC0()
{
  return MEMORY[0x270F81B98]();
}

uint64_t sub_2443B6BD0()
{
  return MEMORY[0x270F81BA0]();
}

uint64_t sub_2443B6BE0()
{
  return MEMORY[0x270F81BA8]();
}

uint64_t sub_2443B6BF0()
{
  return MEMORY[0x270F81BC0]();
}

uint64_t sub_2443B6C00()
{
  return MEMORY[0x270F81BD0]();
}

uint64_t sub_2443B6C10()
{
  return MEMORY[0x270F81BE0]();
}

uint64_t sub_2443B6C20()
{
  return MEMORY[0x270F81BF0]();
}

uint64_t sub_2443B6C30()
{
  return MEMORY[0x270F81C00]();
}

uint64_t sub_2443B6C40()
{
  return MEMORY[0x270F81C08]();
}

uint64_t sub_2443B6C50()
{
  return MEMORY[0x270EE2DA8]();
}

uint64_t sub_2443B6C60()
{
  return MEMORY[0x270FA2C18]();
}

uint64_t sub_2443B6C70()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_2443B6C80()
{
  return MEMORY[0x270FA08E0]();
}

uint64_t sub_2443B6C90()
{
  return MEMORY[0x270FA1530]();
}

uint64_t sub_2443B6CA0()
{
  return MEMORY[0x270EF17F0]();
}

uint64_t sub_2443B6CB0()
{
  return MEMORY[0x270FA1560]();
}

uint64_t sub_2443B6CC0()
{
  return MEMORY[0x270FA1568]();
}

uint64_t sub_2443B6CD0()
{
  return MEMORY[0x270FA1580]();
}

uint64_t sub_2443B6CE0()
{
  return MEMORY[0x270FA1598]();
}

uint64_t sub_2443B6CF0()
{
  return MEMORY[0x270FA15A8]();
}

uint64_t sub_2443B6D00()
{
  return MEMORY[0x270FA15B0]();
}

uint64_t sub_2443B6D10()
{
  return MEMORY[0x270FA15B8]();
}

uint64_t sub_2443B6D20()
{
  return MEMORY[0x270FA1610]();
}

uint64_t sub_2443B6D30()
{
  return MEMORY[0x270FA1618]();
}

uint64_t sub_2443B6D40()
{
  return MEMORY[0x270FA1620]();
}

uint64_t sub_2443B6D50()
{
  return MEMORY[0x270EF7578]();
}

uint64_t sub_2443B6D60()
{
  return MEMORY[0x270EF7590]();
}

uint64_t sub_2443B6D70()
{
  return MEMORY[0x270EF7598]();
}

uint64_t sub_2443B6D80()
{
  return MEMORY[0x270EF75A0]();
}

uint64_t sub_2443B6D90()
{
  return MEMORY[0x270EF75A8]();
}

uint64_t sub_2443B6DA0()
{
  return MEMORY[0x270EF77B0]();
}

uint64_t sub_2443B6DB0()
{
  return MEMORY[0x270EF77B8]();
}

uint64_t sub_2443B6DC0()
{
  return MEMORY[0x270EF77C0]();
}

uint64_t sub_2443B6DD0()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_2443B6DE0()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_2443B6DF0()
{
  return MEMORY[0x270EFEBD0]();
}

uint64_t sub_2443B6E00()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_2443B6E10()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_2443B6E20()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_2443B6E30()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_2443B6E40()
{
  return MEMORY[0x270EFED30]();
}

uint64_t sub_2443B6E50()
{
  return MEMORY[0x270EFED38]();
}

uint64_t sub_2443B6E60()
{
  return MEMORY[0x270EFED40]();
}

uint64_t sub_2443B6E70()
{
  return MEMORY[0x270EFED68]();
}

uint64_t sub_2443B6E80()
{
  return MEMORY[0x270EFED70]();
}

uint64_t sub_2443B6E90()
{
  return MEMORY[0x270EFED90]();
}

uint64_t sub_2443B6EA0()
{
  return MEMORY[0x270EFED98]();
}

uint64_t sub_2443B6EB0()
{
  return MEMORY[0x270EFEDF0]();
}

uint64_t sub_2443B6EC0()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_2443B6ED0()
{
  return MEMORY[0x270EFEE70]();
}

uint64_t sub_2443B6EE0()
{
  return MEMORY[0x270EFEE78]();
}

uint64_t sub_2443B6EF0()
{
  return MEMORY[0x270EFEEA0]();
}

uint64_t sub_2443B6F00()
{
  return MEMORY[0x270EFEEA8]();
}

uint64_t sub_2443B6F10()
{
  return MEMORY[0x270EFEED0]();
}

uint64_t sub_2443B6F20()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_2443B6F30()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_2443B6F40()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_2443B6F50()
{
  return MEMORY[0x270EFEF58]();
}

uint64_t sub_2443B6F60()
{
  return MEMORY[0x270EFEFA0]();
}

uint64_t sub_2443B6F70()
{
  return MEMORY[0x270EFEFB8]();
}

uint64_t sub_2443B6F80()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_2443B6F90()
{
  return MEMORY[0x270EFEFE0]();
}

uint64_t sub_2443B6FA0()
{
  return MEMORY[0x270EFEFF0]();
}

uint64_t sub_2443B6FB0()
{
  return MEMORY[0x270EFF008]();
}

uint64_t sub_2443B6FC0()
{
  return MEMORY[0x270EFF010]();
}

uint64_t sub_2443B6FD0()
{
  return MEMORY[0x270EFF048]();
}

uint64_t sub_2443B6FE0()
{
  return MEMORY[0x270EFF078]();
}

uint64_t sub_2443B6FF0()
{
  return MEMORY[0x270EFF080]();
}

uint64_t sub_2443B7000()
{
  return MEMORY[0x270EFF090]();
}

uint64_t sub_2443B7010()
{
  return MEMORY[0x270EFF098]();
}

uint64_t sub_2443B7020()
{
  return MEMORY[0x270EFF0B0]();
}

uint64_t sub_2443B7030()
{
  return MEMORY[0x270EFF0C0]();
}

uint64_t sub_2443B7040()
{
  return MEMORY[0x270EFF0C8]();
}

uint64_t sub_2443B7050()
{
  return MEMORY[0x270EFF0F0]();
}

uint64_t sub_2443B7060()
{
  return MEMORY[0x270EFF0F8]();
}

uint64_t sub_2443B7070()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_2443B7080()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_2443B7090()
{
  return MEMORY[0x270EFF1C8]();
}

uint64_t sub_2443B70A0()
{
  return MEMORY[0x270EFF1D8]();
}

uint64_t sub_2443B70B0()
{
  return MEMORY[0x270EFF208]();
}

uint64_t sub_2443B70C0()
{
  return MEMORY[0x270EFF220]();
}

uint64_t sub_2443B70D0()
{
  return MEMORY[0x270EFF2A0]();
}

uint64_t sub_2443B70E0()
{
  return MEMORY[0x270EFF2A8]();
}

uint64_t sub_2443B70F0()
{
  return MEMORY[0x270EFF2B0]();
}

uint64_t sub_2443B7100()
{
  return MEMORY[0x270EFF2E8]();
}

uint64_t sub_2443B7110()
{
  return MEMORY[0x270EFF2F0]();
}

uint64_t sub_2443B7120()
{
  return MEMORY[0x270EFF2F8]();
}

uint64_t sub_2443B7130()
{
  return MEMORY[0x270EFF338]();
}

uint64_t sub_2443B7140()
{
  return MEMORY[0x270EFF340]();
}

uint64_t sub_2443B7150()
{
  return MEMORY[0x270EFF348]();
}

uint64_t sub_2443B7160()
{
  return MEMORY[0x270EFF350]();
}

uint64_t sub_2443B7170()
{
  return MEMORY[0x270EFF368]();
}

uint64_t sub_2443B7180()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_2443B7190()
{
  return MEMORY[0x270EFF3E0]();
}

uint64_t sub_2443B71A0()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_2443B71B0()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_2443B71C0()
{
  return MEMORY[0x270EFF460]();
}

uint64_t sub_2443B71D0()
{
  return MEMORY[0x270EFF488]();
}

uint64_t sub_2443B71E0()
{
  return MEMORY[0x270EFF490]();
}

uint64_t sub_2443B71F0()
{
  return MEMORY[0x270EFF498]();
}

uint64_t sub_2443B7200()
{
  return MEMORY[0x270EFF4A0]();
}

uint64_t sub_2443B7210()
{
  return MEMORY[0x270EFF4A8]();
}

uint64_t sub_2443B7220()
{
  return MEMORY[0x270EFF4B8]();
}

uint64_t sub_2443B7230()
{
  return MEMORY[0x270EFF4F0]();
}

uint64_t sub_2443B7240()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_2443B7250()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_2443B7260()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_2443B7270()
{
  return MEMORY[0x270EFF560]();
}

uint64_t sub_2443B7280()
{
  return MEMORY[0x270EFF568]();
}

uint64_t sub_2443B7290()
{
  return MEMORY[0x270EFF570]();
}

uint64_t sub_2443B72A0()
{
  return MEMORY[0x270EFF578]();
}

uint64_t sub_2443B72B0()
{
  return MEMORY[0x270EFF580]();
}

uint64_t sub_2443B72C0()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_2443B72D0()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_2443B72E0()
{
  return MEMORY[0x270EFF5E8]();
}

uint64_t sub_2443B72F0()
{
  return MEMORY[0x270EFF600]();
}

uint64_t sub_2443B7300()
{
  return MEMORY[0x270EFF608]();
}

uint64_t sub_2443B7310()
{
  return MEMORY[0x270EFF610]();
}

uint64_t sub_2443B7320()
{
  return MEMORY[0x270EFF620]();
}

uint64_t sub_2443B7330()
{
  return MEMORY[0x270EFF628]();
}

uint64_t sub_2443B7340()
{
  return MEMORY[0x270EFF630]();
}

uint64_t sub_2443B7350()
{
  return MEMORY[0x270EFF638]();
}

uint64_t sub_2443B7360()
{
  return MEMORY[0x270EFF640]();
}

uint64_t sub_2443B7370()
{
  return MEMORY[0x270EFF648]();
}

uint64_t sub_2443B7380()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_2443B7390()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_2443B73A0()
{
  return MEMORY[0x270EFF6B0]();
}

uint64_t sub_2443B73B0()
{
  return MEMORY[0x270EFF6B8]();
}

uint64_t sub_2443B73C0()
{
  return MEMORY[0x270EFF6C0]();
}

uint64_t sub_2443B73D0()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_2443B73E0()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_2443B73F0()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_2443B7400()
{
  return MEMORY[0x270EFF708]();
}

uint64_t sub_2443B7410()
{
  return MEMORY[0x270EFF728]();
}

uint64_t sub_2443B7420()
{
  return MEMORY[0x270EFF748]();
}

uint64_t sub_2443B7430()
{
  return MEMORY[0x270EFF760]();
}

uint64_t sub_2443B7440()
{
  return MEMORY[0x270EFF768]();
}

uint64_t sub_2443B7450()
{
  return MEMORY[0x270EFF770]();
}

uint64_t sub_2443B7460()
{
  return MEMORY[0x270EFF778]();
}

uint64_t sub_2443B7470()
{
  return MEMORY[0x270EFF780]();
}

uint64_t sub_2443B7480()
{
  return MEMORY[0x270EFF788]();
}

uint64_t sub_2443B7490()
{
  return MEMORY[0x270EFF790]();
}

uint64_t sub_2443B74A0()
{
  return MEMORY[0x270EFF7A8]();
}

uint64_t sub_2443B74B0()
{
  return MEMORY[0x270EFF7B0]();
}

uint64_t sub_2443B74C0()
{
  return MEMORY[0x270EFF7C8]();
}

uint64_t sub_2443B74D0()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_2443B74E0()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_2443B74F0()
{
  return MEMORY[0x270EFF7E0]();
}

uint64_t sub_2443B7500()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_2443B7510()
{
  return MEMORY[0x270EFF7F8]();
}

uint64_t sub_2443B7530()
{
  return MEMORY[0x270EFF838]();
}

uint64_t sub_2443B7540()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_2443B7550()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_2443B7560()
{
  return MEMORY[0x270EFF930]();
}

uint64_t sub_2443B7570()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_2443B7580()
{
  return MEMORY[0x270EFF948]();
}

uint64_t sub_2443B7590()
{
  return MEMORY[0x270EFF950]();
}

uint64_t sub_2443B75A0()
{
  return MEMORY[0x270EFF958]();
}

uint64_t sub_2443B75B0()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_2443B75D0()
{
  return MEMORY[0x270EFF9D0]();
}

uint64_t sub_2443B75E0()
{
  return MEMORY[0x270EFF9E0]();
}

uint64_t sub_2443B75F0()
{
  return MEMORY[0x270EFFA08]();
}

uint64_t sub_2443B7600()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_2443B7610()
{
  return MEMORY[0x270EFFA60]();
}

uint64_t sub_2443B7620()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_2443B7630()
{
  return MEMORY[0x270EFFA88]();
}

uint64_t sub_2443B7640()
{
  return MEMORY[0x270EFFA90]();
}

uint64_t sub_2443B7650()
{
  return MEMORY[0x270EFFA98]();
}

uint64_t sub_2443B7660()
{
  return MEMORY[0x270EFFB58]();
}

uint64_t sub_2443B7670()
{
  return MEMORY[0x270EFFBE8]();
}

uint64_t sub_2443B7680()
{
  return MEMORY[0x270EFFBF0]();
}

uint64_t sub_2443B7690()
{
  return MEMORY[0x270EFFC10]();
}

uint64_t sub_2443B76A0()
{
  return MEMORY[0x270EFFC18]();
}

uint64_t sub_2443B76B0()
{
  return MEMORY[0x270EFFC20]();
}

uint64_t sub_2443B76C0()
{
  return MEMORY[0x270EFFC28]();
}

uint64_t sub_2443B76D0()
{
  return MEMORY[0x270EFFC38]();
}

uint64_t sub_2443B76E0()
{
  return MEMORY[0x270EFFD10]();
}

uint64_t sub_2443B76F0()
{
  return MEMORY[0x270EFFD18]();
}

uint64_t sub_2443B7700()
{
  return MEMORY[0x270EFFD40]();
}

uint64_t sub_2443B7710()
{
  return MEMORY[0x270EFFD48]();
}

uint64_t sub_2443B7720()
{
  return MEMORY[0x270EFFD58]();
}

uint64_t sub_2443B7730()
{
  return MEMORY[0x270EFFD60]();
}

uint64_t sub_2443B7740()
{
  return MEMORY[0x270EFFD68]();
}

uint64_t sub_2443B7750()
{
  return MEMORY[0x270EFFDB8]();
}

uint64_t sub_2443B7760()
{
  return MEMORY[0x270EFFDC0]();
}

uint64_t sub_2443B7770()
{
  return MEMORY[0x270EFFE00]();
}

uint64_t sub_2443B7780()
{
  return MEMORY[0x270EFFE08]();
}

uint64_t sub_2443B77B0()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_2443B77C0()
{
  return MEMORY[0x270F00050]();
}

uint64_t sub_2443B77D0()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_2443B77E0()
{
  return MEMORY[0x270F00068]();
}

uint64_t sub_2443B77F0()
{
  return MEMORY[0x270F00070]();
}

uint64_t sub_2443B7800()
{
  return MEMORY[0x270F000B0]();
}

uint64_t sub_2443B7810()
{
  return MEMORY[0x270F000C0]();
}

uint64_t sub_2443B7820()
{
  return MEMORY[0x270F000C8]();
}

uint64_t sub_2443B7830()
{
  return MEMORY[0x270F000D0]();
}

uint64_t sub_2443B7840()
{
  return MEMORY[0x270F000F0]();
}

uint64_t sub_2443B7850()
{
  return MEMORY[0x270F00138]();
}

uint64_t sub_2443B7860()
{
  return MEMORY[0x270F00148]();
}

uint64_t sub_2443B7870()
{
  return MEMORY[0x270F00150]();
}

uint64_t sub_2443B7880()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_2443B7890()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_2443B78A0()
{
  return MEMORY[0x270F001D8]();
}

uint64_t sub_2443B78B0()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_2443B78C0()
{
  return MEMORY[0x270F00228]();
}

uint64_t sub_2443B78D0()
{
  return MEMORY[0x270F00230]();
}

uint64_t sub_2443B78E0()
{
  return MEMORY[0x270F00240]();
}

uint64_t sub_2443B78F0()
{
  return MEMORY[0x270F00248]();
}

uint64_t sub_2443B7900()
{
  return MEMORY[0x270F00250]();
}

uint64_t sub_2443B7910()
{
  return MEMORY[0x270F00268]();
}

uint64_t sub_2443B7920()
{
  return MEMORY[0x270F00270]();
}

uint64_t sub_2443B7930()
{
  return MEMORY[0x270F00340]();
}

uint64_t sub_2443B7940()
{
  return MEMORY[0x270F00348]();
}

uint64_t sub_2443B7950()
{
  return MEMORY[0x270F00350]();
}

uint64_t sub_2443B7960()
{
  return MEMORY[0x270F00358]();
}

uint64_t sub_2443B7970()
{
  return MEMORY[0x270F00360]();
}

uint64_t sub_2443B7980()
{
  return MEMORY[0x270F003C0]();
}

uint64_t sub_2443B7990()
{
  return MEMORY[0x270F003C8]();
}

uint64_t sub_2443B79A0()
{
  return MEMORY[0x270F00458]();
}

uint64_t sub_2443B79B0()
{
  return MEMORY[0x270F00460]();
}

uint64_t sub_2443B79C0()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_2443B79D0()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_2443B79E0()
{
  return MEMORY[0x270F00508]();
}

uint64_t sub_2443B79F0()
{
  return MEMORY[0x270F00510]();
}

uint64_t sub_2443B7A00()
{
  return MEMORY[0x270F00518]();
}

uint64_t sub_2443B7A10()
{
  return MEMORY[0x270F00520]();
}

uint64_t sub_2443B7A20()
{
  return MEMORY[0x270F00528]();
}

uint64_t sub_2443B7A30()
{
  return MEMORY[0x270F00530]();
}

uint64_t sub_2443B7A40()
{
  return MEMORY[0x270F00590]();
}

uint64_t sub_2443B7A50()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_2443B7A60()
{
  return MEMORY[0x270F005D0]();
}

uint64_t sub_2443B7A70()
{
  return MEMORY[0x270F005D8]();
}

uint64_t sub_2443B7A80()
{
  return MEMORY[0x270F00630]();
}

uint64_t sub_2443B7A90()
{
  return MEMORY[0x270F00648]();
}

uint64_t sub_2443B7AA0()
{
  return MEMORY[0x270F00650]();
}

uint64_t sub_2443B7AB0()
{
  return MEMORY[0x270F00658]();
}

uint64_t sub_2443B7AC0()
{
  return MEMORY[0x270F00670]();
}

uint64_t sub_2443B7AD0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_2443B7AE0()
{
  return MEMORY[0x270F00708]();
}

uint64_t sub_2443B7AF0()
{
  return MEMORY[0x270F00738]();
}

uint64_t sub_2443B7B00()
{
  return MEMORY[0x270F00768]();
}

uint64_t sub_2443B7B10()
{
  return MEMORY[0x270F00780]();
}

uint64_t sub_2443B7B20()
{
  return MEMORY[0x270F007E0]();
}

uint64_t sub_2443B7B30()
{
  return MEMORY[0x270F007F0]();
}

uint64_t sub_2443B7B40()
{
  return MEMORY[0x270F00810]();
}

uint64_t sub_2443B7B50()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_2443B7B60()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_2443B7B70()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_2443B7B80()
{
  return MEMORY[0x270F008F0]();
}

uint64_t sub_2443B7B90()
{
  return MEMORY[0x270F00920]();
}

uint64_t sub_2443B7BA0()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_2443B7BB0()
{
  return MEMORY[0x270F00948]();
}

uint64_t sub_2443B7BC0()
{
  return MEMORY[0x270F009D0]();
}

uint64_t sub_2443B7BD0()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_2443B7BE0()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_2443B7BF0()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_2443B7C00()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_2443B7C10()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_2443B7C20()
{
  return MEMORY[0x270F00A78]();
}

uint64_t sub_2443B7C30()
{
  return MEMORY[0x270F00A88]();
}

uint64_t sub_2443B7C40()
{
  return MEMORY[0x270F00AA0]();
}

uint64_t sub_2443B7C50()
{
  return MEMORY[0x270F00AB8]();
}

uint64_t sub_2443B7C60()
{
  return MEMORY[0x270F00AC0]();
}

uint64_t sub_2443B7C70()
{
  return MEMORY[0x270F00AF0]();
}

uint64_t sub_2443B7C80()
{
  return MEMORY[0x270F00B18]();
}

uint64_t sub_2443B7C90()
{
  return MEMORY[0x270F00B20]();
}

uint64_t sub_2443B7CA0()
{
  return MEMORY[0x270F00B68]();
}

uint64_t sub_2443B7CB0()
{
  return MEMORY[0x270F00B70]();
}

uint64_t sub_2443B7CC0()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_2443B7CD0()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_2443B7CE0()
{
  return MEMORY[0x270F00BC8]();
}

uint64_t sub_2443B7CF0()
{
  return MEMORY[0x270F00BD0]();
}

uint64_t sub_2443B7D00()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_2443B7D10()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_2443B7D20()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_2443B7D30()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_2443B7D40()
{
  return MEMORY[0x270F00CA0]();
}

uint64_t sub_2443B7D50()
{
  return MEMORY[0x270F00CA8]();
}

uint64_t sub_2443B7D60()
{
  return MEMORY[0x270F00CD8]();
}

uint64_t sub_2443B7D70()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_2443B7D80()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_2443B7D90()
{
  return MEMORY[0x270F00DA8]();
}

uint64_t sub_2443B7DA0()
{
  return MEMORY[0x270F00DB8]();
}

uint64_t sub_2443B7DB0()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_2443B7DC0()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_2443B7DD0()
{
  return MEMORY[0x270F00E00]();
}

uint64_t sub_2443B7DE0()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_2443B7DF0()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_2443B7E00()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_2443B7E10()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_2443B7E20()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_2443B7E30()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_2443B7E40()
{
  return MEMORY[0x270F00EA0]();
}

uint64_t sub_2443B7E50()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_2443B7E60()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_2443B7E70()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_2443B7E80()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_2443B7E90()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_2443B7EA0()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_2443B7EB0()
{
  return MEMORY[0x270F00FA0]();
}

uint64_t sub_2443B7EC0()
{
  return MEMORY[0x270F00FA8]();
}

uint64_t sub_2443B7ED0()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_2443B7EE0()
{
  return MEMORY[0x270F01060]();
}

uint64_t sub_2443B7EF0()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2443B7F00()
{
  return MEMORY[0x270F01130]();
}

uint64_t sub_2443B7F10()
{
  return MEMORY[0x270F01148]();
}

uint64_t sub_2443B7F20()
{
  return MEMORY[0x270F01150]();
}

uint64_t sub_2443B7F30()
{
  return MEMORY[0x270F01198]();
}

uint64_t sub_2443B7F40()
{
  return MEMORY[0x270F011A0]();
}

uint64_t sub_2443B7F50()
{
  return MEMORY[0x270F011C0]();
}

uint64_t sub_2443B7F60()
{
  return MEMORY[0x270F011D0]();
}

uint64_t sub_2443B7F70()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_2443B7F80()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_2443B7F90()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_2443B7FA0()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_2443B7FB0()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_2443B7FC0()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_2443B7FD0()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_2443B7FF0()
{
  return MEMORY[0x270F01290]();
}

uint64_t sub_2443B8000()
{
  return MEMORY[0x270F012E0]();
}

uint64_t sub_2443B8010()
{
  return MEMORY[0x270F012E8]();
}

uint64_t sub_2443B8020()
{
  return MEMORY[0x270F012F0]();
}

uint64_t sub_2443B8030()
{
  return MEMORY[0x270F01300]();
}

uint64_t sub_2443B8040()
{
  return MEMORY[0x270F01308]();
}

uint64_t sub_2443B8050()
{
  return MEMORY[0x270F01310]();
}

uint64_t sub_2443B8060()
{
  return MEMORY[0x270F01318]();
}

uint64_t sub_2443B8070()
{
  return MEMORY[0x270F01320]();
}

uint64_t sub_2443B8080()
{
  return MEMORY[0x270F01328]();
}

uint64_t sub_2443B8090()
{
  return MEMORY[0x270F01330]();
}

uint64_t sub_2443B80A0()
{
  return MEMORY[0x270F01338]();
}

uint64_t sub_2443B80B0()
{
  return MEMORY[0x270F01340]();
}

uint64_t sub_2443B80C0()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_2443B80D0()
{
  return MEMORY[0x270F01378]();
}

uint64_t sub_2443B80E0()
{
  return MEMORY[0x270F013D0]();
}

uint64_t sub_2443B80F0()
{
  return MEMORY[0x270F01428]();
}

uint64_t sub_2443B8100()
{
  return MEMORY[0x270F01430]();
}

uint64_t sub_2443B8110()
{
  return MEMORY[0x270F01440]();
}

uint64_t sub_2443B8120()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_2443B8130()
{
  return MEMORY[0x270F01468]();
}

uint64_t sub_2443B8140()
{
  return MEMORY[0x270F01470]();
}

uint64_t sub_2443B8150()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_2443B8160()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_2443B8170()
{
  return MEMORY[0x270F01538]();
}

uint64_t sub_2443B8180()
{
  return MEMORY[0x270F015D0]();
}

uint64_t sub_2443B8190()
{
  return MEMORY[0x270F015F8]();
}

uint64_t sub_2443B81A0()
{
  return MEMORY[0x270F01608]();
}

uint64_t sub_2443B81B0()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_2443B81C0()
{
  return MEMORY[0x270F01618]();
}

uint64_t sub_2443B81D0()
{
  return MEMORY[0x270F01630]();
}

uint64_t sub_2443B81E0()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_2443B81F0()
{
  return MEMORY[0x270F01678]();
}

uint64_t sub_2443B8200()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_2443B8210()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_2443B8220()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_2443B8230()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_2443B8250()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_2443B8260()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_2443B8270()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_2443B8280()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_2443B8290()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_2443B82A0()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_2443B82C0()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_2443B82D0()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_2443B82E0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2443B82F0()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_2443B8300()
{
  return MEMORY[0x270F01830]();
}

uint64_t sub_2443B8310()
{
  return MEMORY[0x270F01838]();
}

uint64_t sub_2443B8320()
{
  return MEMORY[0x270F018D8]();
}

uint64_t sub_2443B8330()
{
  return MEMORY[0x270F018F8]();
}

uint64_t sub_2443B8340()
{
  return MEMORY[0x270F01940]();
}

uint64_t sub_2443B8350()
{
  return MEMORY[0x270F01950]();
}

uint64_t sub_2443B8360()
{
  return MEMORY[0x270F019E8]();
}

uint64_t sub_2443B8370()
{
  return MEMORY[0x270F019F0]();
}

uint64_t sub_2443B8380()
{
  return MEMORY[0x270F019F8]();
}

uint64_t sub_2443B8390()
{
  return MEMORY[0x270F01A10]();
}

uint64_t sub_2443B83A0()
{
  return MEMORY[0x270F01A28]();
}

uint64_t sub_2443B83B0()
{
  return MEMORY[0x270F01A40]();
}

uint64_t sub_2443B83C0()
{
  return MEMORY[0x270F01A60]();
}

uint64_t sub_2443B83D0()
{
  return MEMORY[0x270F01A68]();
}

uint64_t sub_2443B83E0()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_2443B83F0()
{
  return MEMORY[0x270F01AF0]();
}

uint64_t sub_2443B8400()
{
  return MEMORY[0x270F01AF8]();
}

uint64_t sub_2443B8410()
{
  return MEMORY[0x270F01B00]();
}

uint64_t sub_2443B8420()
{
  return MEMORY[0x270F01B08]();
}

uint64_t sub_2443B8430()
{
  return MEMORY[0x270F01B10]();
}

uint64_t sub_2443B8440()
{
  return MEMORY[0x270F01B78]();
}

uint64_t sub_2443B8450()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_2443B8460()
{
  return MEMORY[0x270F01BB0]();
}

uint64_t sub_2443B8470()
{
  return MEMORY[0x270F01BB8]();
}

uint64_t sub_2443B8480()
{
  return MEMORY[0x270F01BC0]();
}

uint64_t sub_2443B8490()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_2443B84A0()
{
  return MEMORY[0x270F01C10]();
}

uint64_t sub_2443B84B0()
{
  return MEMORY[0x270F01C18]();
}

uint64_t sub_2443B84C0()
{
  return MEMORY[0x270F01C20]();
}

uint64_t sub_2443B84D0()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_2443B84E0()
{
  return MEMORY[0x270F01CA0]();
}

uint64_t sub_2443B84F0()
{
  return MEMORY[0x270F01CA8]();
}

uint64_t sub_2443B8500()
{
  return MEMORY[0x270F01CB0]();
}

uint64_t sub_2443B8510()
{
  return MEMORY[0x270F01CC8]();
}

uint64_t sub_2443B8520()
{
  return MEMORY[0x270F01CE0]();
}

uint64_t sub_2443B8530()
{
  return MEMORY[0x270F01CE8]();
}

uint64_t sub_2443B8540()
{
  return MEMORY[0x270F01CF0]();
}

uint64_t sub_2443B8550()
{
  return MEMORY[0x270F01D10]();
}

uint64_t sub_2443B8560()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_2443B8570()
{
  return MEMORY[0x270F01D28]();
}

uint64_t sub_2443B8580()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_2443B8590()
{
  return MEMORY[0x270F01D58]();
}

uint64_t sub_2443B85A0()
{
  return MEMORY[0x270F01D60]();
}

uint64_t sub_2443B85B0()
{
  return MEMORY[0x270F01D68]();
}

uint64_t sub_2443B85C0()
{
  return MEMORY[0x270F01D70]();
}

uint64_t sub_2443B85D0()
{
  return MEMORY[0x270F01D80]();
}

uint64_t sub_2443B85E0()
{
  return MEMORY[0x270F01DB0]();
}

uint64_t sub_2443B85F0()
{
  return MEMORY[0x270F01DB8]();
}

uint64_t sub_2443B8600()
{
  return MEMORY[0x270F01DC0]();
}

uint64_t sub_2443B8610()
{
  return MEMORY[0x270F01DF0]();
}

uint64_t sub_2443B8620()
{
  return MEMORY[0x270F01DF8]();
}

uint64_t sub_2443B8630()
{
  return MEMORY[0x270F01E58]();
}

uint64_t sub_2443B8640()
{
  return MEMORY[0x270F01E68]();
}

uint64_t sub_2443B8650()
{
  return MEMORY[0x270F01F70]();
}

uint64_t sub_2443B8660()
{
  return MEMORY[0x270F01F98]();
}

uint64_t sub_2443B8670()
{
  return MEMORY[0x270F01FF8]();
}

uint64_t sub_2443B8680()
{
  return MEMORY[0x270F02000]();
}

uint64_t sub_2443B8690()
{
  return MEMORY[0x270F02008]();
}

uint64_t sub_2443B86A0()
{
  return MEMORY[0x270F02010]();
}

uint64_t sub_2443B86B0()
{
  return MEMORY[0x270F02018]();
}

uint64_t sub_2443B86C0()
{
  return MEMORY[0x270F02078]();
}

uint64_t sub_2443B86D0()
{
  return MEMORY[0x270F02080]();
}

uint64_t sub_2443B86E0()
{
  return MEMORY[0x270F02098]();
}

uint64_t sub_2443B86F0()
{
  return MEMORY[0x270F020A0]();
}

uint64_t sub_2443B8700()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_2443B8710()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_2443B8720()
{
  return MEMORY[0x270F02100]();
}

uint64_t sub_2443B8730()
{
  return MEMORY[0x270F02120]();
}

uint64_t sub_2443B8740()
{
  return MEMORY[0x270F02128]();
}

uint64_t sub_2443B8750()
{
  return MEMORY[0x270F02130]();
}

uint64_t sub_2443B8760()
{
  return MEMORY[0x270F02180]();
}

uint64_t sub_2443B8770()
{
  return MEMORY[0x270F02188]();
}

uint64_t sub_2443B8780()
{
  return MEMORY[0x270F02190]();
}

uint64_t sub_2443B8790()
{
  return MEMORY[0x270F02218]();
}

uint64_t sub_2443B87A0()
{
  return MEMORY[0x270F02220]();
}

uint64_t sub_2443B87B0()
{
  return MEMORY[0x270F02278]();
}

uint64_t sub_2443B87C0()
{
  return MEMORY[0x270F02280]();
}

uint64_t sub_2443B87D0()
{
  return MEMORY[0x270F022F0]();
}

uint64_t sub_2443B87E0()
{
  return MEMORY[0x270F022F8]();
}

uint64_t sub_2443B87F0()
{
  return MEMORY[0x270F02310]();
}

uint64_t sub_2443B8800()
{
  return MEMORY[0x270F02318]();
}

uint64_t sub_2443B8810()
{
  return MEMORY[0x270F02320]();
}

uint64_t sub_2443B8820()
{
  return MEMORY[0x270F02330]();
}

uint64_t sub_2443B8830()
{
  return MEMORY[0x270F02370]();
}

uint64_t sub_2443B8840()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_2443B8850()
{
  return MEMORY[0x270F02390]();
}

uint64_t sub_2443B8860()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_2443B8870()
{
  return MEMORY[0x270F023F0]();
}

uint64_t sub_2443B8880()
{
  return MEMORY[0x270F023F8]();
}

uint64_t sub_2443B8890()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_2443B88A0()
{
  return MEMORY[0x270F02438]();
}

uint64_t sub_2443B88B0()
{
  return MEMORY[0x270F02490]();
}

uint64_t sub_2443B88C0()
{
  return MEMORY[0x270F024A8]();
}

uint64_t sub_2443B88D0()
{
  return MEMORY[0x270F024B0]();
}

uint64_t sub_2443B88E0()
{
  return MEMORY[0x270F02658]();
}

uint64_t sub_2443B88F0()
{
  return MEMORY[0x270F02660]();
}

uint64_t sub_2443B8900()
{
  return MEMORY[0x270F02670]();
}

uint64_t sub_2443B8910()
{
  return MEMORY[0x270F02678]();
}

uint64_t sub_2443B8920()
{
  return MEMORY[0x270F02680]();
}

uint64_t sub_2443B8930()
{
  return MEMORY[0x270F02688]();
}

uint64_t sub_2443B8940()
{
  return MEMORY[0x270F02690]();
}

uint64_t sub_2443B8950()
{
  return MEMORY[0x270F02698]();
}

uint64_t sub_2443B8960()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_2443B8970()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_2443B8980()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_2443B89A0()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_2443B89B0()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_2443B89C0()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_2443B89E0()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_2443B89F0()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_2443B8A00()
{
  return MEMORY[0x270F027D8]();
}

uint64_t sub_2443B8A10()
{
  return MEMORY[0x270F027E0]();
}

uint64_t sub_2443B8A20()
{
  return MEMORY[0x270F027E8]();
}

uint64_t sub_2443B8A30()
{
  return MEMORY[0x270F027F0]();
}

uint64_t sub_2443B8A40()
{
  return MEMORY[0x270F02810]();
}

uint64_t sub_2443B8A50()
{
  return MEMORY[0x270F028E0]();
}

uint64_t sub_2443B8A60()
{
  return MEMORY[0x270F028E8]();
}

uint64_t sub_2443B8A70()
{
  return MEMORY[0x270F028F8]();
}

uint64_t sub_2443B8A80()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_2443B8A90()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2443B8AA0()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_2443B8AB0()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_2443B8AC0()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_2443B8AD0()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_2443B8AE0()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2443B8AF0()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_2443B8B00()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_2443B8B10()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_2443B8B20()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_2443B8B30()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_2443B8B40()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_2443B8B50()
{
  return MEMORY[0x270F02A98]();
}

uint64_t sub_2443B8B60()
{
  return MEMORY[0x270F02AA8]();
}

uint64_t sub_2443B8B70()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_2443B8B80()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_2443B8B90()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_2443B8BA0()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_2443B8BB0()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_2443B8BC0()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_2443B8BD0()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_2443B8BE0()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_2443B8BF0()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_2443B8C00()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_2443B8C10()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_2443B8C20()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_2443B8C30()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_2443B8C40()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_2443B8C50()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_2443B8C60()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_2443B8C70()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_2443B8C80()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_2443B8C90()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_2443B8CA0()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_2443B8CB0()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_2443B8CC0()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_2443B8CD0()
{
  return MEMORY[0x270F02EA0]();
}

uint64_t sub_2443B8CE0()
{
  return MEMORY[0x270F02EE8]();
}

uint64_t sub_2443B8CF0()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_2443B8D00()
{
  return MEMORY[0x270F02F78]();
}

uint64_t sub_2443B8D10()
{
  return MEMORY[0x270F02F80]();
}

uint64_t sub_2443B8D20()
{
  return MEMORY[0x270F02F88]();
}

uint64_t sub_2443B8D30()
{
  return MEMORY[0x270F02F98]();
}

uint64_t sub_2443B8D40()
{
  return MEMORY[0x270F02FA0]();
}

uint64_t sub_2443B8D50()
{
  return MEMORY[0x270F02FA8]();
}

uint64_t sub_2443B8D60()
{
  return MEMORY[0x270F02FB0]();
}

uint64_t sub_2443B8D70()
{
  return MEMORY[0x270F02FC0]();
}

uint64_t sub_2443B8D80()
{
  return MEMORY[0x270F02FC8]();
}

uint64_t sub_2443B8D90()
{
  return MEMORY[0x270F02FD0]();
}

uint64_t sub_2443B8DA0()
{
  return MEMORY[0x270F02FE8]();
}

uint64_t sub_2443B8DB0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_2443B8DC0()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_2443B8DD0()
{
  return MEMORY[0x270F03058]();
}

uint64_t sub_2443B8DE0()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_2443B8DF0()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_2443B8E00()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2443B8E10()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_2443B8E20()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_2443B8E30()
{
  return MEMORY[0x270F03248]();
}

uint64_t sub_2443B8E40()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2443B8E50()
{
  return MEMORY[0x270F07E78]();
}

uint64_t sub_2443B8E60()
{
  return MEMORY[0x270F08350]();
}

uint64_t sub_2443B8E70()
{
  return MEMORY[0x270F08358]();
}

uint64_t sub_2443B8E80()
{
  return MEMORY[0x270F286E8]();
}

uint64_t sub_2443B8E90()
{
  return MEMORY[0x270F032A8]();
}

uint64_t sub_2443B8EA0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2443B8EB0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2443B8EC0()
{
  return MEMORY[0x270F03310]();
}

uint64_t sub_2443B8ED0()
{
  return MEMORY[0x270F03348]();
}

uint64_t sub_2443B8EE0()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_2443B8EF0()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_2443B8F00()
{
  return MEMORY[0x270F03398]();
}

uint64_t sub_2443B8F10()
{
  return MEMORY[0x270F03430]();
}

uint64_t sub_2443B8F20()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_2443B8F30()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_2443B8F40()
{
  return MEMORY[0x270F03480]();
}

uint64_t sub_2443B8F50()
{
  return MEMORY[0x270F03498]();
}

uint64_t sub_2443B8F60()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_2443B8F70()
{
  return MEMORY[0x270F034B0]();
}

uint64_t sub_2443B8F80()
{
  return MEMORY[0x270F034E8]();
}

uint64_t sub_2443B8F90()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_2443B8FA0()
{
  return MEMORY[0x270F03500]();
}

uint64_t sub_2443B8FB0()
{
  return MEMORY[0x270F03548]();
}

uint64_t sub_2443B8FC0()
{
  return MEMORY[0x270F03560]();
}

uint64_t sub_2443B8FD0()
{
  return MEMORY[0x270F03580]();
}

uint64_t sub_2443B8FE0()
{
  return MEMORY[0x270F035A0]();
}

uint64_t sub_2443B8FF0()
{
  return MEMORY[0x270F035B0]();
}

uint64_t sub_2443B9000()
{
  return MEMORY[0x270F035C0]();
}

uint64_t sub_2443B9010()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_2443B9020()
{
  return MEMORY[0x270F03680]();
}

uint64_t sub_2443B9030()
{
  return MEMORY[0x270F036B0]();
}

uint64_t sub_2443B9040()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2443B9050()
{
  return MEMORY[0x270F036E8]();
}

uint64_t sub_2443B9060()
{
  return MEMORY[0x270F03728]();
}

uint64_t sub_2443B9070()
{
  return MEMORY[0x270F03730]();
}

uint64_t sub_2443B9080()
{
  return MEMORY[0x270F03788]();
}

uint64_t sub_2443B9090()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_2443B90A0()
{
  return MEMORY[0x270F037C0]();
}

uint64_t sub_2443B90B0()
{
  return MEMORY[0x270F037F0]();
}

uint64_t sub_2443B90C0()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_2443B90D0()
{
  return MEMORY[0x270F03878]();
}

uint64_t sub_2443B90E0()
{
  return MEMORY[0x270F03880]();
}

uint64_t sub_2443B90F0()
{
  return MEMORY[0x270F038D0]();
}

uint64_t sub_2443B9100()
{
  return MEMORY[0x270F038E0]();
}

uint64_t sub_2443B9110()
{
  return MEMORY[0x270F03988]();
}

uint64_t sub_2443B9120()
{
  return MEMORY[0x270F03998]();
}

uint64_t sub_2443B9130()
{
  return MEMORY[0x270F039A0]();
}

uint64_t sub_2443B9140()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_2443B9150()
{
  return MEMORY[0x270F039C8]();
}

uint64_t sub_2443B9160()
{
  return MEMORY[0x270F03A00]();
}

uint64_t sub_2443B9170()
{
  return MEMORY[0x270F03A18]();
}

uint64_t sub_2443B9180()
{
  return MEMORY[0x270F03A90]();
}

uint64_t sub_2443B9190()
{
  return MEMORY[0x270F03AB0]();
}

uint64_t sub_2443B91A0()
{
  return MEMORY[0x270F03AC0]();
}

uint64_t sub_2443B91B0()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_2443B91C0()
{
  return MEMORY[0x270F03B30]();
}

uint64_t sub_2443B91D0()
{
  return MEMORY[0x270F03B58]();
}

uint64_t sub_2443B91E0()
{
  return MEMORY[0x270F03B60]();
}

uint64_t sub_2443B91F0()
{
  return MEMORY[0x270F03B70]();
}

uint64_t sub_2443B9200()
{
  return MEMORY[0x270F03B78]();
}

uint64_t sub_2443B9210()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_2443B9220()
{
  return MEMORY[0x270F03C00]();
}

uint64_t sub_2443B9230()
{
  return MEMORY[0x270F03C18]();
}

uint64_t sub_2443B9240()
{
  return MEMORY[0x270F03C30]();
}

uint64_t sub_2443B9250()
{
  return MEMORY[0x270F03C40]();
}

uint64_t sub_2443B9260()
{
  return MEMORY[0x270F03C58]();
}

uint64_t sub_2443B9270()
{
  return MEMORY[0x270F03C70]();
}

uint64_t sub_2443B9280()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_2443B9290()
{
  return MEMORY[0x270F03CD8]();
}

uint64_t sub_2443B92A0()
{
  return MEMORY[0x270F03CE0]();
}

uint64_t sub_2443B92B0()
{
  return MEMORY[0x270F03CF8]();
}

uint64_t sub_2443B92C0()
{
  return MEMORY[0x270F03D18]();
}

uint64_t sub_2443B92D0()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_2443B92E0()
{
  return MEMORY[0x270F03D38]();
}

uint64_t sub_2443B92F0()
{
  return MEMORY[0x270F03D40]();
}

uint64_t sub_2443B9300()
{
  return MEMORY[0x270F03D60]();
}

uint64_t sub_2443B9310()
{
  return MEMORY[0x270F03DA0]();
}

uint64_t sub_2443B9320()
{
  return MEMORY[0x270F03DA8]();
}

uint64_t sub_2443B9330()
{
  return MEMORY[0x270F03DE0]();
}

uint64_t sub_2443B9340()
{
  return MEMORY[0x270F03E00]();
}

uint64_t sub_2443B9350()
{
  return MEMORY[0x270F03E28]();
}

uint64_t sub_2443B9360()
{
  return MEMORY[0x270F03E40]();
}

uint64_t sub_2443B9370()
{
  return MEMORY[0x270F03E48]();
}

uint64_t sub_2443B9380()
{
  return MEMORY[0x270F03E70]();
}

uint64_t sub_2443B9390()
{
  return MEMORY[0x270F03EA0]();
}

uint64_t sub_2443B93A0()
{
  return MEMORY[0x270F03EB8]();
}

uint64_t sub_2443B93B0()
{
  return MEMORY[0x270F03EC0]();
}

uint64_t sub_2443B93C0()
{
  return MEMORY[0x270F03F08]();
}

uint64_t sub_2443B93D0()
{
  return MEMORY[0x270F03F80]();
}

uint64_t sub_2443B93E0()
{
  return MEMORY[0x270F03FA8]();
}

uint64_t sub_2443B93F0()
{
  return MEMORY[0x270F03FB8]();
}

uint64_t sub_2443B9400()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_2443B9410()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_2443B9420()
{
  return MEMORY[0x270F04050]();
}

uint64_t sub_2443B9430()
{
  return MEMORY[0x270F04068]();
}

uint64_t sub_2443B9440()
{
  return MEMORY[0x270F04070]();
}

uint64_t sub_2443B9450()
{
  return MEMORY[0x270F04080]();
}

uint64_t sub_2443B9460()
{
  return MEMORY[0x270F040A0]();
}

uint64_t sub_2443B9470()
{
  return MEMORY[0x270F040A8]();
}

uint64_t sub_2443B9480()
{
  return MEMORY[0x270F040B0]();
}

uint64_t sub_2443B9490()
{
  return MEMORY[0x270F040D0]();
}

uint64_t sub_2443B94A0()
{
  return MEMORY[0x270F040D8]();
}

uint64_t sub_2443B94B0()
{
  return MEMORY[0x270F040E0]();
}

uint64_t sub_2443B94C0()
{
  return MEMORY[0x270F04100]();
}

uint64_t sub_2443B94D0()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_2443B94E0()
{
  return MEMORY[0x270F04118]();
}

uint64_t sub_2443B94F0()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_2443B9500()
{
  return MEMORY[0x270F04140]();
}

uint64_t sub_2443B9510()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_2443B9520()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_2443B9530()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_2443B9540()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_2443B9550()
{
  return MEMORY[0x270F041E8]();
}

uint64_t sub_2443B9560()
{
  return MEMORY[0x270F04230]();
}

uint64_t sub_2443B9570()
{
  return MEMORY[0x270F04258]();
}

uint64_t sub_2443B9580()
{
  return MEMORY[0x270F04290]();
}

uint64_t sub_2443B9590()
{
  return MEMORY[0x270F042B0]();
}

uint64_t sub_2443B95A0()
{
  return MEMORY[0x270F04340]();
}

uint64_t sub_2443B95B0()
{
  return MEMORY[0x270F04348]();
}

uint64_t sub_2443B95C0()
{
  return MEMORY[0x270F04350]();
}

uint64_t sub_2443B95D0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_2443B95E0()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_2443B95F0()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_2443B9610()
{
  return MEMORY[0x270F043D8]();
}

uint64_t sub_2443B9620()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_2443B9630()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_2443B9640()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_2443B9650()
{
  return MEMORY[0x270F04450]();
}

uint64_t sub_2443B9660()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_2443B9670()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_2443B9680()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_2443B9690()
{
  return MEMORY[0x270F044A8]();
}

uint64_t sub_2443B96A0()
{
  return MEMORY[0x270F044C8]();
}

uint64_t sub_2443B96B0()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_2443B96C0()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_2443B96D0()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_2443B96E0()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_2443B96F0()
{
  return MEMORY[0x270F04580]();
}

uint64_t sub_2443B9700()
{
  return MEMORY[0x270F04598]();
}

uint64_t sub_2443B9710()
{
  return MEMORY[0x270F045A0]();
}

uint64_t sub_2443B9720()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_2443B9730()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_2443B9740()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_2443B9750()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_2443B9760()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2443B9770()
{
  return MEMORY[0x270F04668]();
}

uint64_t sub_2443B9780()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_2443B9790()
{
  return MEMORY[0x270F04698]();
}

uint64_t sub_2443B97A0()
{
  return MEMORY[0x270F046A0]();
}

uint64_t sub_2443B97B0()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_2443B97C0()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_2443B97D0()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_2443B97E0()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_2443B97F0()
{
  return MEMORY[0x270F04728]();
}

uint64_t sub_2443B9800()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_2443B9810()
{
  return MEMORY[0x270F04740]();
}

uint64_t sub_2443B9820()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_2443B9830()
{
  return MEMORY[0x270F04758]();
}

uint64_t sub_2443B9840()
{
  return MEMORY[0x270F04760]();
}

uint64_t sub_2443B9850()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_2443B9880()
{
  return MEMORY[0x270F047D8]();
}

uint64_t sub_2443B98A0()
{
  return MEMORY[0x270F047E8]();
}

uint64_t sub_2443B98C0()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2443B98D0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2443B98E0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_2443B98F0()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_2443B9900()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_2443B9910()
{
  return MEMORY[0x270F04870]();
}

uint64_t sub_2443B9920()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_2443B9930()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_2443B9940()
{
  return MEMORY[0x270F048C8]();
}

uint64_t sub_2443B9950()
{
  return MEMORY[0x270F048E0]();
}

uint64_t sub_2443B9960()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_2443B9970()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_2443B9980()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_2443B9990()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_2443B99A0()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_2443B99B0()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_2443B99C0()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_2443B99D0()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_2443B99E0()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_2443B99F0()
{
  return MEMORY[0x270F049D0]();
}

uint64_t sub_2443B9A00()
{
  return MEMORY[0x270F04A70]();
}

uint64_t sub_2443B9A10()
{
  return MEMORY[0x270F04A80]();
}

uint64_t sub_2443B9A20()
{
  return MEMORY[0x270F04A88]();
}

uint64_t sub_2443B9A30()
{
  return MEMORY[0x270F04A98]();
}

uint64_t sub_2443B9A40()
{
  return MEMORY[0x270F04AA0]();
}

uint64_t sub_2443B9A50()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_2443B9A60()
{
  return MEMORY[0x270F04AC0]();
}

uint64_t sub_2443B9A70()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_2443B9A80()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_2443B9A90()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_2443B9AA0()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_2443B9AB0()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_2443B9AC0()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_2443B9AD0()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_2443B9AE0()
{
  return MEMORY[0x270F04B58]();
}

uint64_t sub_2443B9AF0()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_2443B9B00()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_2443B9B10()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_2443B9B20()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_2443B9B30()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_2443B9B40()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_2443B9B50()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2443B9B60()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_2443B9B70()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_2443B9B80()
{
  return MEMORY[0x270F04CE8]();
}

uint64_t sub_2443B9B90()
{
  return MEMORY[0x270F04CF0]();
}

uint64_t sub_2443B9BA0()
{
  return MEMORY[0x270F04D28]();
}

uint64_t sub_2443B9BB0()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_2443B9BC0()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_2443B9BD0()
{
  return MEMORY[0x270F04D88]();
}

uint64_t sub_2443B9BE0()
{
  return MEMORY[0x270F04DD8]();
}

uint64_t sub_2443B9BF0()
{
  return MEMORY[0x270F04DF0]();
}

uint64_t sub_2443B9C00()
{
  return MEMORY[0x270F04E10]();
}

uint64_t sub_2443B9C10()
{
  return MEMORY[0x270F04E20]();
}

uint64_t sub_2443B9C20()
{
  return MEMORY[0x270F04E28]();
}

uint64_t sub_2443B9C30()
{
  return MEMORY[0x270F04E38]();
}

uint64_t sub_2443B9C40()
{
  return MEMORY[0x270F04E60]();
}

uint64_t sub_2443B9C50()
{
  return MEMORY[0x270F04E68]();
}

uint64_t sub_2443B9C60()
{
  return MEMORY[0x270F04E70]();
}

uint64_t sub_2443B9C70()
{
  return MEMORY[0x270F04E80]();
}

uint64_t sub_2443B9C80()
{
  return MEMORY[0x270F04EA0]();
}

uint64_t sub_2443B9C90()
{
  return MEMORY[0x270F04EA8]();
}

uint64_t sub_2443B9CA0()
{
  return MEMORY[0x270F04EB0]();
}

uint64_t sub_2443B9CB0()
{
  return MEMORY[0x270F04EC8]();
}

uint64_t sub_2443B9CC0()
{
  return MEMORY[0x270F04ED8]();
}

uint64_t sub_2443B9CD0()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_2443B9CE0()
{
  return MEMORY[0x270F04EF0]();
}

uint64_t sub_2443B9CF0()
{
  return MEMORY[0x270F04F00]();
}

uint64_t sub_2443B9D00()
{
  return MEMORY[0x270F04F10]();
}

uint64_t sub_2443B9D10()
{
  return MEMORY[0x270F04F28]();
}

uint64_t sub_2443B9D20()
{
  return MEMORY[0x270F04F30]();
}

uint64_t sub_2443B9D30()
{
  return MEMORY[0x270F04F38]();
}

uint64_t sub_2443B9D40()
{
  return MEMORY[0x270F04F40]();
}

uint64_t sub_2443B9D50()
{
  return MEMORY[0x270F04F48]();
}

uint64_t sub_2443B9D60()
{
  return MEMORY[0x270F04F50]();
}

uint64_t sub_2443B9D70()
{
  return MEMORY[0x270F04F58]();
}

uint64_t sub_2443B9D80()
{
  return MEMORY[0x270F04F60]();
}

uint64_t sub_2443B9D90()
{
  return MEMORY[0x270F04F78]();
}

uint64_t sub_2443B9DA0()
{
  return MEMORY[0x270F04F90]();
}

uint64_t sub_2443B9DB0()
{
  return MEMORY[0x270F04F98]();
}

uint64_t sub_2443B9DC0()
{
  return MEMORY[0x270F04FA0]();
}

uint64_t sub_2443B9DD0()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_2443B9DE0()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_2443B9DF0()
{
  return MEMORY[0x270F05020]();
}

uint64_t sub_2443B9E00()
{
  return MEMORY[0x270F05030]();
}

uint64_t sub_2443B9E10()
{
  return MEMORY[0x270F05048]();
}

uint64_t sub_2443B9E20()
{
  return MEMORY[0x270F05058]();
}

uint64_t sub_2443B9E30()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_2443B9E40()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2443B9E50()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_2443B9E60()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_2443B9E70()
{
  return MEMORY[0x270F050C0]();
}

uint64_t sub_2443B9E80()
{
  return MEMORY[0x270F050D0]();
}

uint64_t sub_2443B9E90()
{
  return MEMORY[0x270F050D8]();
}

uint64_t sub_2443B9EA0()
{
  return MEMORY[0x270F050E0]();
}

uint64_t sub_2443B9EB0()
{
  return MEMORY[0x270F050E8]();
}

uint64_t sub_2443B9EC0()
{
  return MEMORY[0x270F050F0]();
}

uint64_t sub_2443B9ED0()
{
  return MEMORY[0x270F050F8]();
}

uint64_t sub_2443B9EE0()
{
  return MEMORY[0x270F05108]();
}

uint64_t sub_2443B9EF0()
{
  return MEMORY[0x270F05110]();
}

uint64_t sub_2443B9F00()
{
  return MEMORY[0x270F05118]();
}

uint64_t sub_2443B9F10()
{
  return MEMORY[0x270F05120]();
}

uint64_t sub_2443B9F20()
{
  return MEMORY[0x270F05130]();
}

uint64_t sub_2443B9F30()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_2443B9F40()
{
  return MEMORY[0x270F05148]();
}

uint64_t sub_2443B9F50()
{
  return MEMORY[0x270F05158]();
}

uint64_t sub_2443B9F60()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_2443B9F70()
{
  return MEMORY[0x270F05178]();
}

uint64_t sub_2443B9F80()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_2443B9F90()
{
  return MEMORY[0x270F051C8]();
}

uint64_t sub_2443B9FA0()
{
  return MEMORY[0x270F051D0]();
}

uint64_t sub_2443B9FB0()
{
  return MEMORY[0x270F051E0]();
}

uint64_t sub_2443B9FC0()
{
  return MEMORY[0x270F051E8]();
}

uint64_t sub_2443B9FD0()
{
  return MEMORY[0x270F051F0]();
}

uint64_t sub_2443B9FE0()
{
  return MEMORY[0x270F05200]();
}

uint64_t sub_2443B9FF0()
{
  return MEMORY[0x270F05210]();
}

uint64_t sub_2443BA000()
{
  return MEMORY[0x270F05220]();
}

uint64_t sub_2443BA010()
{
  return MEMORY[0x270F05238]();
}

uint64_t sub_2443BA020()
{
  return MEMORY[0x270F05268]();
}

uint64_t sub_2443BA030()
{
  return MEMORY[0x270F05270]();
}

uint64_t sub_2443BA040()
{
  return MEMORY[0x270F05280]();
}

uint64_t sub_2443BA050()
{
  return MEMORY[0x270F052D0]();
}

uint64_t sub_2443BA060()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_2443BA070()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_2443BA080()
{
  return MEMORY[0x270F05340]();
}

uint64_t sub_2443BA090()
{
  return MEMORY[0x270F05358]();
}

uint64_t sub_2443BA0A0()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_2443BA0B0()
{
  return MEMORY[0x270F05370]();
}

uint64_t sub_2443BA0C0()
{
  return MEMORY[0x270F05378]();
}

uint64_t sub_2443BA0D0()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_2443BA0E0()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_2443BA0F0()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_2443BA100()
{
  return MEMORY[0x270F05468]();
}

uint64_t sub_2443BA110()
{
  return MEMORY[0x270F05480]();
}

uint64_t sub_2443BA120()
{
  return MEMORY[0x270F05488]();
}

uint64_t sub_2443BA130()
{
  return MEMORY[0x270F054A0]();
}

uint64_t sub_2443BA140()
{
  return MEMORY[0x270F054A8]();
}

uint64_t sub_2443BA150()
{
  return MEMORY[0x270F054B0]();
}

uint64_t sub_2443BA160()
{
  return MEMORY[0x270F054B8]();
}

uint64_t sub_2443BA170()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_2443BA180()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2443BA190()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2443BA1A0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2443BA1B0()
{
  return MEMORY[0x270FA0A80]();
}

uint64_t sub_2443BA1C0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2443BA1D0()
{
  return MEMORY[0x270FA0AD0]();
}

uint64_t sub_2443BA1E0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2443BA1F0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_2443BA200()
{
  return MEMORY[0x270F286F0]();
}

uint64_t sub_2443BA210()
{
  return MEMORY[0x270F28700]();
}

uint64_t sub_2443BA220()
{
  return MEMORY[0x270F28708]();
}

uint64_t sub_2443BA230()
{
  return MEMORY[0x270F28710]();
}

uint64_t sub_2443BA240()
{
  return MEMORY[0x270F28718]();
}

uint64_t sub_2443BA250()
{
  return MEMORY[0x270F28720]();
}

uint64_t sub_2443BA260()
{
  return MEMORY[0x270F28730]();
}

uint64_t sub_2443BA270()
{
  return MEMORY[0x270F28738]();
}

uint64_t sub_2443BA280()
{
  return MEMORY[0x270F28750]();
}

uint64_t sub_2443BA290()
{
  return MEMORY[0x270EFA360]();
}

uint64_t sub_2443BA2A0()
{
  return MEMORY[0x270EFA378]();
}

uint64_t sub_2443BA2B0()
{
  return MEMORY[0x270EFA4C0]();
}

uint64_t sub_2443BA2C0()
{
  return MEMORY[0x270EFA4D0]();
}

uint64_t sub_2443BA2D0()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_2443BA2E0()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_2443BA2F0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2443BA300()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_2443BA310()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2443BA320()
{
  return MEMORY[0x270F9D120]();
}

uint64_t sub_2443BA330()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_2443BA340()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_2443BA350()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_2443BA360()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2443BA370()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2443BA380()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_2443BA390()
{
  return MEMORY[0x270F9D380]();
}

uint64_t sub_2443BA3A0()
{
  return MEMORY[0x270F9D3D8]();
}

uint64_t sub_2443BA3B0()
{
  return MEMORY[0x270F9D3E0]();
}

uint64_t sub_2443BA3C0()
{
  return MEMORY[0x270F9D410]();
}

uint64_t sub_2443BA3D0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2443BA3E0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2443BA3F0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2443BA400()
{
  return MEMORY[0x270EE1ED8]();
}

uint64_t sub_2443BA410()
{
  return MEMORY[0x270EE1EE0]();
}

uint64_t sub_2443BA420()
{
  return MEMORY[0x270EE1EE8]();
}

uint64_t sub_2443BA430()
{
  return MEMORY[0x270EE1EF0]();
}

uint64_t sub_2443BA440()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_2443BA450()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_2443BA460()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_2443BA470()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_2443BA480()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_2443BA490()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_2443BA4A0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_2443BA4B0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2443BA4C0()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_2443BA4D0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2443BA4E0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2443BA4F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2443BA500()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_2443BA510()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_2443BA520()
{
  return MEMORY[0x270EF1B10]();
}

uint64_t sub_2443BA530()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2443BA540()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2443BA550()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_2443BA560()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2443BA570()
{
  return MEMORY[0x270F9D660]();
}

uint64_t sub_2443BA580()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2443BA590()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2443BA5A0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2443BA5B0()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_2443BA5C0()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_2443BA5D0()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_2443BA5E0()
{
  return MEMORY[0x270FA1628]();
}

uint64_t sub_2443BA5F0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2443BA600()
{
  return MEMORY[0x270F9D7C8]();
}

uint64_t sub_2443BA610()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2443BA620()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2443BA630()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2443BA650()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2443BA660()
{
  return MEMORY[0x270F9D820]();
}

uint64_t sub_2443BA670()
{
  return MEMORY[0x270F9D830]();
}

uint64_t sub_2443BA680()
{
  return MEMORY[0x270F9D840]();
}

uint64_t sub_2443BA690()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_2443BA6A0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2443BA6B0()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_2443BA6C0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2443BA6D0()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_2443BA6E0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2443BA6F0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2443BA700()
{
  return MEMORY[0x270EF1B50]();
}

uint64_t sub_2443BA710()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_2443BA720()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_2443BA730()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_2443BA740()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_2443BA750()
{
  return MEMORY[0x270F9D988]();
}

uint64_t sub_2443BA760()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_2443BA770()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t sub_2443BA780()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2443BA790()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2443BA7A0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2443BA7B0()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_2443BA7C0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2443BA7D0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2443BA7E0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2443BA7F0()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_2443BA800()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_2443BA810()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2443BA820()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t sub_2443BA830()
{
  return MEMORY[0x270F9DC00]();
}

uint64_t sub_2443BA840()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_2443BA850()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2443BA860()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_2443BA870()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2443BA880()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_2443BA890()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_2443BA8A0()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_2443BA8B0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2443BA8C0()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_2443BA8D0()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_2443BA8E0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2443BA8F0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2443BA900()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2443BA910()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_2443BA940()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2443BA950()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2443BA960()
{
  return MEMORY[0x270FA1EB0]();
}

uint64_t sub_2443BA970()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_2443BA980()
{
  return MEMORY[0x270FA1EC8]();
}

uint64_t sub_2443BA990()
{
  return MEMORY[0x270FA1ED8]();
}

uint64_t sub_2443BA9A0()
{
  return MEMORY[0x270FA1EE8]();
}

uint64_t sub_2443BA9B0()
{
  return MEMORY[0x270FA1EF0]();
}

uint64_t sub_2443BA9C0()
{
  return MEMORY[0x270FA1EF8]();
}

uint64_t sub_2443BA9D0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2443BA9E0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2443BA9F0()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_2443BAA00()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_2443BAA10()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_2443BAA30()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_2443BAA50()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2443BAA70()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_2443BAA80()
{
  return MEMORY[0x270FA1FE0]();
}

uint64_t sub_2443BAA90()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_2443BAAB0()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_2443BAAC0()
{
  return MEMORY[0x270FA20C0]();
}

uint64_t sub_2443BAAD0()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_2443BAAE0()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_2443BAAF0()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_2443BAB10()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_2443BAB20()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_2443BAB30()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_2443BAB40()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2443BAB50()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_2443BAB60()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_2443BAB70()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2443BAB80()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_2443BAB90()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_2443BABA0()
{
  return MEMORY[0x270F84460]();
}

uint64_t sub_2443BABB0()
{
  return MEMORY[0x270F9E070]();
}

uint64_t sub_2443BABC0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2443BABD0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2443BABE0()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_2443BABF0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_2443BAC00()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2443BAC10()
{
  return MEMORY[0x270F9E0F0]();
}

uint64_t sub_2443BAC20()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_2443BAC30()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t sub_2443BAC40()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2443BAC50()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_2443BAC60()
{
  return MEMORY[0x270FA10D8]();
}

uint64_t sub_2443BAC70()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_2443BAC80()
{
  return MEMORY[0x270EE5848]();
}

uint64_t sub_2443BAC90()
{
  return MEMORY[0x270EE5888]();
}

uint64_t sub_2443BACA0()
{
  return MEMORY[0x270EF1E08]();
}

uint64_t sub_2443BACC0()
{
  return MEMORY[0x270F0CCA0]();
}

uint64_t sub_2443BACD0()
{
  return MEMORY[0x270EF1EE8]();
}

uint64_t sub_2443BACE0()
{
  return MEMORY[0x270EF1F00]();
}

uint64_t sub_2443BACF0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2443BAD00()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2443BAD10()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2443BAD20()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2443BAD30()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2443BAD40()
{
  return MEMORY[0x270FA1950]();
}

uint64_t sub_2443BAD50()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2443BAD60()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_2443BAD70()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2443BAD80()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2443BAD90()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2443BADA0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2443BADB0()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_2443BADC0()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_2443BADD0()
{
  return MEMORY[0x270FA0E48]();
}

uint64_t sub_2443BADE0()
{
  return MEMORY[0x270FA0E50]();
}

uint64_t sub_2443BADF0()
{
  return MEMORY[0x270FA0E58]();
}

uint64_t sub_2443BAE00()
{
  return MEMORY[0x270FA0E60]();
}

uint64_t sub_2443BAE10()
{
  return MEMORY[0x270FA0E70]();
}

uint64_t sub_2443BAE20()
{
  return MEMORY[0x270FA0E80]();
}

uint64_t sub_2443BAE30()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_2443BAE40()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_2443BAE50()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_2443BAE60()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_2443BAE70()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_2443BAE80()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_2443BAE90()
{
  return MEMORY[0x270EEB9D8]();
}

uint64_t sub_2443BAEA0()
{
  return MEMORY[0x270EEB9E8]();
}

uint64_t sub_2443BAEB0()
{
  return MEMORY[0x270EEB9F0]();
}

uint64_t sub_2443BAEC0()
{
  return MEMORY[0x270EEB9F8]();
}

uint64_t sub_2443BAED0()
{
  return MEMORY[0x270EEBA00]();
}

uint64_t sub_2443BAEE0()
{
  return MEMORY[0x270EEBA08]();
}

uint64_t sub_2443BAEF0()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_2443BAF00()
{
  return MEMORY[0x270FA0FB8]();
}

uint64_t sub_2443BAF10()
{
  return MEMORY[0x270EF2050]();
}

uint64_t sub_2443BAF20()
{
  return MEMORY[0x270EE5908]();
}

uint64_t sub_2443BAF30()
{
  return MEMORY[0x270EE5910]();
}

uint64_t sub_2443BAF40()
{
  return MEMORY[0x270F828A8]();
}

uint64_t sub_2443BAF50()
{
  return MEMORY[0x270EF20C0]();
}

uint64_t sub_2443BAF60()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_2443BAF70()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_2443BAF80()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2443BAF90()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2443BAFA0()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_2443BAFB0()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_2443BAFC0()
{
  return MEMORY[0x270EFA2A8]();
}

uint64_t sub_2443BAFD0()
{
  return MEMORY[0x270EFA2B0]();
}

uint64_t sub_2443BAFE0()
{
  return MEMORY[0x270F53CA8]();
}

uint64_t sub_2443BAFF0()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_2443BB000()
{
  return MEMORY[0x270F829B0]();
}

uint64_t sub_2443BB010()
{
  return MEMORY[0x270F829B8]();
}

uint64_t sub_2443BB020()
{
  return MEMORY[0x270F82A78]();
}

uint64_t sub_2443BB030()
{
  return MEMORY[0x270F82AF0]();
}

uint64_t sub_2443BB040()
{
  return MEMORY[0x270F82B00]();
}

uint64_t sub_2443BB050()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_2443BB060()
{
  return MEMORY[0x270F82B60]();
}

uint64_t sub_2443BB070()
{
  return MEMORY[0x270F82B88]();
}

uint64_t sub_2443BB080()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_2443BB090()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_2443BB0A0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2443BB0B0()
{
  return MEMORY[0x270EF23C8]();
}

uint64_t sub_2443BB0C0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2443BB0D0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2443BB0E0()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_2443BB0F0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_2443BB100()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_2443BB110()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_2443BB120()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_2443BB130()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_2443BB140()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_2443BB150()
{
  return MEMORY[0x270EF2590]();
}

uint64_t sub_2443BB160()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_2443BB170()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_2443BB180()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2443BB190()
{
  return MEMORY[0x270F9E6C8]();
}

uint64_t sub_2443BB1A0()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_2443BB1B0()
{
  return MEMORY[0x270F9E740]();
}

uint64_t sub_2443BB1C0()
{
  return MEMORY[0x270F9E750]();
}

uint64_t sub_2443BB1D0()
{
  return MEMORY[0x270F9E760]();
}

uint64_t sub_2443BB1F0()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_2443BB200()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2443BB210()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2443BB220()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_2443BB230()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_2443BB240()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_2443BB250()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2443BB260()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2443BB270()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2443BB280()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2443BB290()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2443BB2A0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2443BB2B0()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_2443BB2C0()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_2443BB2D0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2443BB2E0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2443BB2F0()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_2443BB300()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_2443BB310()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_2443BB320()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2443BB330()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2443BB340()
{
  return MEMORY[0x270F9EA70]();
}

uint64_t sub_2443BB350()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2443BB360()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2443BB370()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2443BB380()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_2443BB3A0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2443BB3B0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2443BB3C0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_2443BB3D0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2443BB3E0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2443BB3F0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2443BB400()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_2443BB410()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_2443BB420()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_2443BB430()
{
  return MEMORY[0x270FA2168]();
}

uint64_t sub_2443BB440()
{
  return MEMORY[0x270FA2198]();
}

uint64_t sub_2443BB450()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_2443BB460()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_2443BB470()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_2443BB480()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_2443BB490()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2443BB4A0()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_2443BB4B0()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_2443BB4C0()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_2443BB4D0()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_2443BB4E0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2443BB4F0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2443BB500()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_2443BB510()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2443BB520()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2443BB530()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2443BB540()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_2443BB550()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2443BB560()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2443BB570()
{
  return MEMORY[0x270FA2278]();
}

uint64_t sub_2443BB580()
{
  return MEMORY[0x270FA2280]();
}

uint64_t sub_2443BB590()
{
  return MEMORY[0x270FA2288]();
}

uint64_t sub_2443BB5A0()
{
  return MEMORY[0x270FA2290]();
}

uint64_t sub_2443BB5B0()
{
  return MEMORY[0x270FA2298]();
}

uint64_t sub_2443BB5C0()
{
  return MEMORY[0x270FA22A0]();
}

uint64_t sub_2443BB5D0()
{
  return MEMORY[0x270FA22A8]();
}

uint64_t sub_2443BB5F0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2443BB600()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2443BB610()
{
  return MEMORY[0x270EF2620]();
}

uint64_t sub_2443BB620()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2443BB630()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2443BB640()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_2443BB650()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2443BB660()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2443BB670()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2443BB680()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_2443BB690()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2443BB6A0()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_2443BB6B0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2443BB6C0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2443BB6D0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2443BB6E0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2443BB6F0()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_2443BB700()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2443BB710()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2443BB720()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_2443BB730()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_2443BB740()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2443BB750()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_2443BB760()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2443BB770()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2443BB780()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_2443BB7A0()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_2443BB7B0()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_2443BB7C0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2443BB7D0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2443BB7F0()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_2443BB800()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_2443BB810()
{
  return MEMORY[0x270F9F8F0]();
}

uint64_t sub_2443BB820()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_2443BB830()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2443BB840()
{
  return MEMORY[0x270F9FA28]();
}

uint64_t sub_2443BB850()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_2443BB870()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_2443BB880()
{
  return MEMORY[0x270F9FAD0]();
}

uint64_t sub_2443BB890()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2443BB8A0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2443BB8B0()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_2443BB8F0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2443BB900()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2443BB910()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2443BB920()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2443BB930()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2443BB940()
{
  return MEMORY[0x270EF2690]();
}

uint64_t sub_2443BB950()
{
  return MEMORY[0x270F53CB0]();
}

uint64_t sub_2443BB960()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_2443BB970()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_2443BB980()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_2443BB990()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2443BB9A0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2443BB9B0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2443BB9C0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2443BB9D0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2443BB9E0()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_2443BB9F0()
{
  return MEMORY[0x270EF2760]();
}

uint64_t sub_2443BBA00()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_2443BBA10()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2443BBA20()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_2443BBA30()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2443BBA40()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_2443BBA50()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_2443BBA80()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t sub_2443BBA90()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AXRuntimeCheck_MediaAnalysisSupport()
{
  return MEMORY[0x270F09508]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t CEMCreateEmojiLocaleData()
{
  return MEMORY[0x270F18BE0]();
}

uint64_t CEMCreateStringByTranslatingEmojiCharactersToNameInString()
{
  return MEMORY[0x270F18BE8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x270EE5A50](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x270EE5A58](context);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B80](red, green, blue, alpha);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x270EE5C40](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CB8](plist);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D70](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5028](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5038](provider, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5050](isrc);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7008](path, transform);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  MEMORY[0x270EE7148](t, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x270F960F0]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x270F961A0]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F82C80]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

CGRect VNImageRectForNormalizedRect(CGRect normalizedRect, size_t imageWidth, size_t imageHeight)
{
  MEMORY[0x270F06980](imageWidth, imageHeight, (__n128)normalizedRect.origin, *(__n128 *)&normalizedRect.origin.y, (__n128)normalizedRect.size, *(__n128 *)&normalizedRect.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x270F06678](pixelBuffer, options, imageOut);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _availability_version_check()
{
  return MEMORY[0x270ED7F40]();
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

simd_float4 _simd_cos_f4(simd_float4 x)
{
  MEMORY[0x270ED81E8]((__n128)x);
  return result;
}

simd_float4 _simd_sin_f4(simd_float4 x)
{
  MEMORY[0x270ED8348]((__n128)x);
  return result;
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x270FA0178]();
}

void bzero(void *a1, size_t a2)
{
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x270ED9698]();
}

float exp2f(float a1)
{
  MEMORY[0x270ED9868](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9940](*(void *)&a1, a2, a3, *(void *)&a4);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x270EDA570](a1, *(void *)&a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

void rewind(FILE *a1)
{
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x270FA0220]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x270FA04B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x270FA0500]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x270FA0540]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x270FA2468]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

uint64_t vfx_script_clock_delta_time()
{
  return MEMORY[0x270F83970]();
}

uint64_t vfx_script_clock_simulation_index()
{
  return MEMORY[0x270F83978]();
}

uint64_t vfx_script_clock_time()
{
  return MEMORY[0x270F83980]();
}

uint64_t vfx_script_color_ramp_copy()
{
  return MEMORY[0x270F83988]();
}

uint64_t vfx_script_color_ramp_create()
{
  return MEMORY[0x270F83990]();
}

uint64_t vfx_script_color_ramp_destroy()
{
  return MEMORY[0x270F83998]();
}

uint64_t vfx_script_curve_create()
{
  return MEMORY[0x270F839A0]();
}

uint64_t vfx_script_curve_destroy()
{
  return MEMORY[0x270F839A8]();
}

uint64_t vfx_script_curve_evaluate()
{
  return MEMORY[0x270F839B0]();
}

uint64_t vfx_script_get_arguments_buffer()
{
  return MEMORY[0x270F839B8]();
}

uint64_t vfx_script_get_iteration_range()
{
  return MEMORY[0x270F839C0]();
}

uint64_t vfx_script_texture_sample1d()
{
  return MEMORY[0x270F839C8]();
}

uint64_t vfx_script_texture_sample1d_curve()
{
  return MEMORY[0x270F839D0]();
}

uint64_t vfx_script_texture_sample3d()
{
  return MEMORY[0x270F839D8]();
}