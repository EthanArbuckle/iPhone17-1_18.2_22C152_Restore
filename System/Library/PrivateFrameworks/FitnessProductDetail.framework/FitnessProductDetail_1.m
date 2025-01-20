uint64_t sub_24F247490()
{
  return sub_24F2499A4((uint64_t (*)(void, void, void, void, void, void, void, void))sub_24F246554);
}

uint64_t sub_24F2474A8@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v74 = a8;
  uint64_t v73 = a7;
  uint64_t v72 = a6;
  uint64_t v71 = a5;
  uint64_t v70 = a3;
  v66 = a2;
  uint64_t v78 = a9;
  uint64_t v62 = a4;
  uint64_t v77 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  v69 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC7B8);
  MEMORY[0x270FA5388](v65);
  uint64_t v64 = (uint64_t)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_24F273CF0();
  uint64_t v76 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  v63 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v67 = (uint64_t)&v58 - v14;
  uint64_t v61 = sub_24F273EF0();
  uint64_t v60 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC7B0);
  MEMORY[0x270FA5388](v68);
  v58 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v59 = (uint64_t)&v58 - v19;
  v20 = (void *)(a1 + *(int *)(type metadata accessor for EditorialDetailContent() + 28));
  uint64_t v21 = v20[1];
  *(void *)&long long v92 = *v20;
  *((void *)&v92 + 1) = v21;
  sub_24F1DD4D0();
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_24F2743A0();
  uint64_t v24 = v23;
  char v26 = v25 & 1;
  sub_24F274190();
  uint64_t v27 = sub_24F274370();
  uint64_t v29 = v28;
  char v31 = v30;
  swift_release();
  sub_24F1BD634(v22, v24, v26);
  swift_bridgeObjectRelease();
  uint64_t v32 = sub_24F274360();
  uint64_t v34 = v33;
  LOBYTE(v24) = v35;
  uint64_t v37 = v36;
  sub_24F1BD634(v27, v29, v31 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)&long long v92 = v32;
  *((void *)&v92 + 1) = v34;
  LOBYTE(v93) = v24 & 1;
  *((void *)&v93 + 1) = v37;
  *(void *)&long long v94 = KeyPath;
  *((void *)&v94 + 1) = 3;
  LOBYTE(v95) = 0;
  sub_24F273EE0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CAAF0);
  sub_24F23E138();
  uint64_t v39 = (uint64_t)v58;
  sub_24F274500();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v16, v61);
  sub_24F1BD634(v92, *((uint64_t *)&v92 + 1), v93);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v40 = v59;
  sub_24F1A9F74(v39, v59, &qword_2699CC7B0);
  long long v41 = v66[3];
  long long v94 = v66[2];
  long long v95 = v41;
  long long v96 = v66[4];
  uint64_t v97 = *((void *)v66 + 10);
  long long v42 = v66[1];
  v43 = (void (**)(uint64_t))v66;
  long long v92 = *v66;
  long long v93 = v42;
  uint64_t v44 = v62;
  uint64_t v86 = v70;
  uint64_t v87 = v62;
  uint64_t v88 = v71;
  uint64_t v89 = v72;
  uint64_t v45 = v73;
  uint64_t v90 = v73;
  uint64_t v91 = v74;
  v46 = (void *)type metadata accessor for EditorialDetailView();
  uint64_t v47 = v64;
  uint64_t v48 = sub_24F247BC4(v46, v64);
  v49 = v69;
  v43[9](v48);
  unint64_t v50 = sub_24F24ABCC();
  uint64_t v51 = (uint64_t)v63;
  MEMORY[0x253357560](v49, v65, v44, v50);
  (*(void (**)(char *, uint64_t))(v77 + 8))(v49, v44);
  sub_24F1A62BC(v47, &qword_2699CC7B8);
  unint64_t v84 = v50;
  uint64_t v85 = v45;
  uint64_t v52 = v75;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v54 = v67;
  sub_24F1BB5B8(v51, v52, v67);
  uint64_t v55 = v76;
  v56 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
  v56(v51, v52);
  sub_24F1AA03C(v40, v39, &qword_2699CC7B0);
  uint64_t v82 = 0x4014000000000000;
  char v83 = 0;
  *(void *)&long long v92 = v39;
  *((void *)&v92 + 1) = &v82;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16))(v51, v54, v52);
  *(void *)&long long v93 = v51;
  uint64_t v86 = v68;
  uint64_t v87 = MEMORY[0x263F1B6B0];
  uint64_t v88 = v52;
  unint64_t v79 = sub_24F24AF20();
  uint64_t v80 = MEMORY[0x263F1B698];
  uint64_t v81 = WitnessTable;
  sub_24F2434C0((uint64_t)&v92, 3uLL, (uint64_t)&v86);
  v56(v54, v52);
  sub_24F1A62BC(v40, &qword_2699CC7B0);
  v56(v51, v52);
  return sub_24F1A62BC(v39, &qword_2699CC7B0);
}

uint64_t sub_24F247BC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC418);
  MEMORY[0x270FA5388](v55);
  uint64_t v59 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_24F273D90();
  uint64_t v65 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v64 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_24F2740B0();
  uint64_t v62 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC8D0);
  uint64_t v58 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC910);
  uint64_t v61 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC8C8);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC8B0);
  MEMORY[0x270FA5388](v57);
  uint64_t v18 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC918);
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v52 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v20 = *(_OWORD *)(v2 + 48);
  v74[2] = *(_OWORD *)(v2 + 32);
  v74[3] = v20;
  v74[4] = *(_OWORD *)(v2 + 64);
  uint64_t v75 = *(void *)(v2 + 80);
  long long v21 = *(_OWORD *)(v2 + 16);
  v74[0] = *(_OWORD *)v2;
  v74[1] = v21;
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = a1[2];
  uint64_t v24 = a1[3];
  *(void *)(v22 + 16) = v23;
  *(void *)(v22 + 24) = v24;
  uint64_t v25 = a1[4];
  uint64_t v26 = a1[5];
  *(void *)(v22 + 32) = v25;
  *(void *)(v22 + 40) = v26;
  uint64_t v27 = a1[6];
  uint64_t v28 = a1[7];
  *(void *)(v22 + 48) = v27;
  *(void *)(v22 + 56) = v28;
  long long v29 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v22 + 96) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v22 + 112) = v29;
  *(_OWORD *)(v22 + 128) = *(_OWORD *)(v2 + 64);
  *(void *)(v22 + 144) = *(void *)(v2 + 80);
  long long v30 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v22 + 64) = *(_OWORD *)v2;
  *(_OWORD *)(v22 + 80) = v30;
  uint64_t v67 = v23;
  uint64_t v68 = v24;
  uint64_t v69 = v25;
  uint64_t v70 = v26;
  uint64_t v71 = v27;
  uint64_t v72 = v28;
  uint64_t v73 = v74;
  sub_24F244A04((uint64_t)v74);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC540);
  sub_24F23D244();
  uint64_t v31 = (uint64_t)v59;
  sub_24F2746F0();
  sub_24F2740A0();
  sub_24F1BD4AC(&qword_2699CC8D8, &qword_2699CC8D0);
  sub_24F24AED8(&qword_2699CC8E0, MEMORY[0x263F1A3B8]);
  uint64_t v32 = v60;
  sub_24F274440();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v7, v32);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v10, v8);
  uint64_t v33 = v64;
  sub_24F273D80();
  uint64_t KeyPath = swift_getKeyPath();
  char v35 = (uint64_t *)&v16[*(int *)(v14 + 44)];
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC8F0);
  uint64_t v37 = v65;
  uint64_t v38 = v66;
  (*(void (**)(char *, char *, uint64_t))(v65 + 16))((char *)v35 + *(int *)(v36 + 28), v33, v66);
  *char v35 = KeyPath;
  uint64_t v39 = v61;
  uint64_t v40 = v63;
  (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v16, v12, v63);
  uint64_t v41 = v37;
  uint64_t v42 = v57;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v33, v38);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v12, v40);
  uint64_t v43 = sub_24F274610();
  sub_24F1AA03C((uint64_t)v16, (uint64_t)v18, &qword_2699CC8C8);
  *(void *)&v18[*(int *)(v42 + 36)] = v43;
  sub_24F1A62BC((uint64_t)v16, &qword_2699CC8C8);
  uint64_t v44 = *MEMORY[0x263F18D70];
  uint64_t v45 = sub_24F273CE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 104))(v31, v44, v45);
  sub_24F24AED8(&qword_2699CC468, MEMORY[0x263F18D80]);
  uint64_t result = sub_24F274A00();
  if (result)
  {
    sub_24F24ACF0();
    sub_24F1BD4AC(&qword_2699CC448, &qword_2699CC418);
    uint64_t v47 = v52;
    sub_24F2744A0();
    sub_24F1A62BC(v31, &qword_2699CC418);
    sub_24F1A62BC((uint64_t)v18, &qword_2699CC8B0);
    uint64_t v48 = v53;
    uint64_t v49 = v56;
    uint64_t v50 = v54;
    (*(void (**)(uint64_t, char *, uint64_t))(v53 + 16))(v56, v47, v54);
    *(void *)(v49 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CC7B8) + 36)) = 0x3FF0000000000000;
    return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v47, v50);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24F2483F0()
{
  return sub_24F2743A0();
}

uint64_t sub_24F248444@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  *(void *)a9 = sub_24F273F20();
  *(void *)(a9 + 8) = 0x4024000000000000;
  *(unsigned char *)(a9 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC848);
  return sub_24F2484EC(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_24F2484EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  type metadata accessor for EditorialDetailContent();
  uint64_t v15 = swift_bridgeObjectRetain();
  sub_24F24A1A8(v15);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a4;
  *(void *)(v16 + 32) = a5;
  *(void *)(v16 + 40) = a6;
  *(void *)(v16 + 48) = a7;
  *(void *)(v16 + 56) = a8;
  long long v17 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v16 + 96) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v16 + 112) = v17;
  *(_OWORD *)(v16 + 128) = *(_OWORD *)(a2 + 64);
  *(void *)(v16 + 144) = *(void *)(a2 + 80);
  long long v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v16 + 64) = *(_OWORD *)a2;
  *(_OWORD *)(v16 + 80) = v18;
  sub_24F244A04(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC850);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC858);
  sub_24F1BD4AC(&qword_2699CC860, &qword_2699CC850);
  sub_24F24AED8(&qword_2699CC868, (void (*)(uint64_t))type metadata accessor for EditorialExternalLink);
  sub_24F1BD4AC(&qword_2699CC870, &qword_2699CC858);
  return sub_24F2747E0();
}

uint64_t sub_24F2486C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  v25[0] = a8;
  v25[1] = a9;
  uint64_t v16 = type metadata accessor for EditorialExternalLink();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v16 - 8);
  sub_24F24A314(a1, (uint64_t)v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for EditorialExternalLink);
  unint64_t v19 = (*(unsigned __int8 *)(v17 + 80) + 152) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  *(void *)(v20 + 24) = a4;
  *(void *)(v20 + 32) = a5;
  *(void *)(v20 + 40) = a6;
  uint64_t v21 = v25[0];
  *(void *)(v20 + 48) = a7;
  *(void *)(v20 + 56) = v21;
  long long v22 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v20 + 96) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v20 + 112) = v22;
  *(_OWORD *)(v20 + 128) = *(_OWORD *)(a2 + 64);
  *(void *)(v20 + 144) = *(void *)(a2 + 80);
  long long v23 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v20 + 64) = *(_OWORD *)a2;
  *(_OWORD *)(v20 + 80) = v23;
  sub_24F24A4BC((uint64_t)v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19, (uint64_t (*)(void))type metadata accessor for EditorialExternalLink);
  v25[4] = a1;
  sub_24F244A04(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC878);
  sub_24F24A61C();
  return sub_24F2746F0();
}

uint64_t sub_24F24888C(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = type metadata accessor for EditorialDetailAction();
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v19 = a1[3];
  long long v27 = a1[2];
  long long v28 = v19;
  long long v29 = a1[4];
  uint64_t v30 = *((void *)a1 + 10);
  long long v20 = a1[1];
  long long v25 = *a1;
  long long v26 = v20;
  v24[0] = a3;
  v24[1] = a4;
  v24[2] = a5;
  v24[3] = a6;
  v24[4] = a7;
  v24[5] = a8;
  type metadata accessor for EditorialDetailView();
  sub_24F24388C();
  uint64_t v21 = a2 + *(int *)(type metadata accessor for EditorialExternalLink() + 20);
  uint64_t v22 = sub_24F273900();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v18, v21, v22);
  swift_storeEnumTagMultiPayload();
  sub_24F274940();
  swift_release();
  return sub_24F24B0F8((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for EditorialDetailAction);
}

uint64_t sub_24F248A08@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = sub_24F2746B0();
  uint64_t v41 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v40 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24F274250();
  uint64_t v38 = *(void *)(v5 - 8);
  uint64_t v39 = v5;
  MEMORY[0x270FA5388](v5);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CBBE0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC898);
  uint64_t v12 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC890);
  uint64_t v16 = v15 - 8;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *a1;
  uint64_t v20 = a1[1];
  uint64_t v44 = v19;
  uint64_t v45 = v20;
  sub_24F1DD4D0();
  swift_bridgeObjectRetain();
  sub_24F2746E0();
  uint64_t v44 = 0x4000000000000000;
  sub_24F1BD4AC(&qword_2699CBBE8, &qword_2699CBBE0);
  sub_24F23D308();
  sub_24F274410();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_24F2741B0();
  uint64_t v22 = v38;
  uint64_t v21 = v39;
  (*(void (**)(char *, void, uint64_t))(v38 + 104))(v7, *MEMORY[0x263F1A680], v39);
  uint64_t v23 = sub_24F274290();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v21);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v25 = v37;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v18, v14, v37);
  long long v26 = (uint64_t *)&v18[*(int *)(v16 + 44)];
  *long long v26 = KeyPath;
  v26[1] = v23;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v25);
  long long v28 = v40;
  uint64_t v27 = v41;
  uint64_t v29 = v42;
  (*(void (**)(char *, void, uint64_t))(v41 + 104))(v40, *MEMORY[0x263F1B538], v42);
  uint64_t v30 = swift_getKeyPath();
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC878);
  uint64_t v32 = v43;
  uint64_t v33 = (uint64_t *)(v43 + *(int *)(v31 + 36));
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CAC40);
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))((char *)v33 + *(int *)(v34 + 28), v28, v29);
  *uint64_t v33 = v30;
  sub_24F1AA03C((uint64_t)v18, v32, &qword_2699CC890);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
  return sub_24F1A62BC((uint64_t)v18, &qword_2699CC890);
}

uint64_t sub_24F248EC8(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = type metadata accessor for EditorialDetailAction();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v17 = a1[3];
  long long v23 = a1[2];
  long long v24 = v17;
  long long v25 = a1[4];
  uint64_t v26 = *((void *)a1 + 10);
  long long v18 = a1[1];
  long long v21 = *a1;
  long long v22 = v18;
  v20[0] = a2;
  v20[1] = a3;
  v20[2] = a4;
  v20[3] = a5;
  v20[4] = a6;
  v20[5] = a7;
  type metadata accessor for EditorialDetailView();
  sub_24F24388C();
  swift_storeEnumTagMultiPayload();
  sub_24F274940();
  swift_release();
  return sub_24F24B0F8((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for EditorialDetailAction);
}

uint64_t sub_24F248FF8(long long *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = type metadata accessor for EditorialDetailAction();
  MEMORY[0x270FA5388](v16);
  long long v18 = (void *)((char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  long long v19 = a1[3];
  long long v29 = a1[2];
  long long v30 = v19;
  long long v31 = a1[4];
  uint64_t v32 = *((void *)a1 + 10);
  long long v20 = a1[1];
  long long v27 = *a1;
  long long v28 = v20;
  v26[0] = a3;
  v26[1] = a4;
  v26[2] = a5;
  v26[3] = a6;
  v26[4] = a7;
  v26[5] = a8;
  type metadata accessor for EditorialDetailView();
  sub_24F24388C();
  long long v21 = (char *)v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CB858) + 48);
  uint64_t v22 = a2[1];
  *long long v18 = *a2;
  v18[1] = v22;
  long long v23 = (char *)a2 + *(int *)(type metadata accessor for EditorialPreview() + 20);
  uint64_t v24 = sub_24F273900();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v21, v23, v24);
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  sub_24F274940();
  swift_release();
  return sub_24F24B0F8((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for EditorialDetailAction);
}

uint64_t sub_24F249198@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v36 = a6;
  uint64_t v37 = a7;
  uint64_t v35 = a5;
  uint64_t v34 = a4;
  uint64_t v33 = a3;
  uint64_t v32 = a8;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC418);
  MEMORY[0x270FA5388](v31);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CBBE0);
  uint64_t v12 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC828);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24F2739F0();
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v19 = sub_24F274A20();
  MEMORY[0x270FA5388](v19 - 8);
  sub_24F274A10();
  type metadata accessor for LocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v21 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  long long v22 = a1[3];
  long long v47 = a1[2];
  long long v48 = v22;
  long long v49 = a1[4];
  uint64_t v50 = *((void *)a1 + 10);
  long long v23 = a1[1];
  long long v45 = *a1;
  long long v46 = v23;
  uint64_t v39 = a2;
  uint64_t v40 = v33;
  uint64_t v41 = v34;
  uint64_t v42 = v35;
  uint64_t v43 = v36;
  uint64_t v44 = v37;
  type metadata accessor for EditorialDetailView();
  sub_24F24388C();
  swift_getKeyPath();
  sub_24F274930();
  swift_release();
  swift_release();
  *(void *)&long long v45 = sub_24F274A60();
  *((void *)&v45 + 1) = v24;
  sub_24F1DD4D0();
  sub_24F2746E0();
  uint64_t v25 = MEMORY[0x2533575B0](objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.650980392, 1.0, 0.0, 1.0));
  uint64_t v26 = v38;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v17, v14, v38);
  *(void *)&v17[*(int *)(v15 + 36)] = v25;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v26);
  uint64_t v27 = *MEMORY[0x263F18D70];
  uint64_t v28 = sub_24F273CE0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 104))(v11, v27, v28);
  sub_24F24AED8(&qword_2699CC468, MEMORY[0x263F18D80]);
  uint64_t result = sub_24F274A00();
  if (result)
  {
    sub_24F249BC8();
    sub_24F1BD4AC(&qword_2699CC448, &qword_2699CC418);
    sub_24F2744A0();
    sub_24F1A62BC((uint64_t)v11, &qword_2699CC418);
    return sub_24F1A62BC((uint64_t)v17, &qword_2699CC828);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24F249684@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v29 = a6;
  uint64_t v30 = a7;
  uint64_t v28 = a5;
  uint64_t v27 = a4;
  uint64_t v31 = a8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CBBE0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24F2739F0();
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v16 = sub_24F274A20();
  MEMORY[0x270FA5388](v16 - 8);
  sub_24F274A10();
  type metadata accessor for LocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v18 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  long long v19 = a1[3];
  long long v40 = a1[2];
  long long v41 = v19;
  long long v42 = a1[4];
  uint64_t v43 = *((void *)a1 + 10);
  long long v20 = a1[1];
  long long v38 = *a1;
  long long v39 = v20;
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v34 = v27;
  uint64_t v35 = v28;
  uint64_t v36 = v29;
  uint64_t v37 = v30;
  type metadata accessor for EditorialDetailView();
  sub_24F24388C();
  swift_getKeyPath();
  sub_24F274930();
  swift_release();
  swift_release();
  *(void *)&long long v38 = sub_24F274A60();
  *((void *)&v38 + 1) = v21;
  sub_24F1DD4D0();
  sub_24F2746E0();
  uint64_t v22 = sub_24F2741A0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v24 = v31;
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v31, v14, v11);
  uint64_t v25 = (uint64_t *)(v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CC540) + 36));
  *uint64_t v25 = KeyPath;
  v25[1] = v22;
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_24F24998C()
{
  return sub_24F2499A4((uint64_t (*)(void, void, void, void, void, void, void, void))sub_24F2474A8);
}

uint64_t sub_24F2499A4(uint64_t (*a1)(void, void, void, void, void, void, void, void))
{
  return a1(v1[8], v1[9], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

unint64_t sub_24F2499C0()
{
  unint64_t result = qword_2699CC7F8;
  if (!qword_2699CC7F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CC7C0);
    sub_24F1BD4AC(&qword_2699CC800, &qword_2699CC7F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC7F8);
  }
  return result;
}

unint64_t sub_24F249A58()
{
  unint64_t result = qword_2699CC808;
  if (!qword_2699CC808)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CC7C8);
    sub_24F249ACC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC808);
  }
  return result;
}

unint64_t sub_24F249ACC()
{
  unint64_t result = qword_2699CC810;
  if (!qword_2699CC810)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CC7E8);
    sub_24F1BD4AC(&qword_2699CC818, &qword_2699CC7E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC810);
  }
  return result;
}

uint64_t sub_24F249B6C()
{
  return objectdestroy_11Tm((uint64_t (*)(void))type metadata accessor for EditorialPreview);
}

uint64_t sub_24F249B84()
{
  return sub_24F24A550((uint64_t (*)(void))type metadata accessor for EditorialPreview, (uint64_t (*)(void *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24F248FF8);
}

uint64_t sub_24F249BB0()
{
  return sub_24F24B078((uint64_t (*)(void, void, void, void, void, void, void))sub_24F249198);
}

unint64_t sub_24F249BC8()
{
  unint64_t result = qword_2699CC830;
  if (!qword_2699CC830)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CC828);
    sub_24F1BD4AC(&qword_2699CBBE8, &qword_2699CBBE0);
    sub_24F1BD4AC(&qword_2699CAC88, &qword_2699CAC90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC830);
  }
  return result;
}

uint64_t sub_24F249C8C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24F249CC4()
{
  return sub_24F2483F0();
}

uint64_t sub_24F249CCC()
{
  uint64_t v1 = type metadata accessor for EditorialDetailContent();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 64) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB260);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v6 = (uint64_t *)&unk_2699CB308;
  }
  else {
    uint64_t v6 = (uint64_t *)&unk_2699CB300;
  }
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(v6);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v0 + v3, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = v5 + *(int *)(v1 + 32);
  uint64_t v9 = type metadata accessor for EditorialPreview();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = v8 + *(int *)(v9 + 20);
    uint64_t v11 = sub_24F273900();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  uint64_t v12 = v2 | 7;
  uint64_t v13 = v5 + *(int *)(v1 + 36);
  uint64_t v14 = sub_24F273900();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24F1BCA54();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 88, v12);
}

uint64_t sub_24F249F40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v9 = *(void *)(type metadata accessor for EditorialDetailContent() - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (uint64_t)v1 + ((*(void *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_24F248444((uint64_t)v1 + v10, v11, v3, v4, v5, v6, v7, v8, a1);
}

uint64_t sub_24F24A01C()
{
  return sub_24F24B034();
}

uint64_t sub_24F24A024@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_24F273E40();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_24F24A058()
{
  return sub_24F273E50();
}

uint64_t sub_24F24A088()
{
  return sub_24F273DA0();
}

uint64_t sub_24F24A0AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24F24A0D8(a1, a2, a3, a4, MEMORY[0x263F1B548], MEMORY[0x263F191D8]);
}

uint64_t sub_24F24A0D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(char *))
{
  uint64_t v8 = a5(0);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

size_t sub_24F24A1A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC8A0);
  uint64_t v3 = *(void *)(type metadata accessor for EditorialExternalLink() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      sub_24F24A83C(&v11, (uint64_t)v6 + v5, v1, a1);
      uint64_t v10 = v9;
      swift_bridgeObjectRetain();
      sub_24F24AB60();
      if (v10 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24F24A300@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24F2486C4(a1, (uint64_t)(v2 + 8), v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], a2);
}

uint64_t sub_24F24A314(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F24A37C()
{
  return objectdestroy_11Tm((uint64_t (*)(void))type metadata accessor for EditorialExternalLink);
}

uint64_t objectdestroy_11Tm(uint64_t (*a1)(void))
{
  uint64_t v2 = (int *)(a1(0) - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 152) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  sub_24F1BCA54();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v7 = v1 + v4 + v2[7];
  uint64_t v8 = sub_24F273900();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  return MEMORY[0x270FA0238](v1, v5, v6);
}

uint64_t sub_24F24A4BC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F24A524()
{
  return sub_24F24A550((uint64_t (*)(void))type metadata accessor for EditorialExternalLink, (uint64_t (*)(void *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24F24888C);
}

uint64_t sub_24F24A550(uint64_t (*a1)(void), uint64_t (*a2)(void *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = v2[2];
  uint64_t v4 = v2[3];
  uint64_t v5 = v2[4];
  uint64_t v6 = v2[5];
  uint64_t v7 = v2[6];
  uint64_t v8 = v2[7];
  uint64_t v9 = *(void *)(a1(0) - 8);
  uint64_t v10 = (char *)v2 + ((*(unsigned __int8 *)(v9 + 80) + 152) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a2(v2 + 8, v10, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_24F24A614@<X0>(uint64_t a1@<X8>)
{
  return sub_24F248A08(*(uint64_t **)(v1 + 16), a1);
}

unint64_t sub_24F24A61C()
{
  unint64_t result = qword_2699CC880;
  if (!qword_2699CC880)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CC878);
    sub_24F24A6BC();
    sub_24F1BD4AC(&qword_2699CAC68, &qword_2699CAC40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC880);
  }
  return result;
}

unint64_t sub_24F24A6BC()
{
  unint64_t result = qword_2699CC888;
  if (!qword_2699CC888)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CC890);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CBBE0);
    sub_24F1BD4AC(&qword_2699CBBE8, &qword_2699CBBE0);
    sub_24F23D308();
    swift_getOpaqueTypeConformance2();
    sub_24F1BD4AC(&qword_2699CAF18, &qword_2699CAF20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC888);
  }
  return result;
}

uint64_t sub_24F24A7D8()
{
  return sub_24F273DA0();
}

uint64_t sub_24F24A7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24F24A0D8(a1, a2, a3, a4, MEMORY[0x263F1B548], MEMORY[0x263F191D8]);
}

void sub_24F24A83C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for EditorialExternalLink();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v28 - v13;
  uint64_t v33 = a4;
  uint64_t v16 = a4 + 56;
  uint64_t v15 = *(void *)(a4 + 56);
  uint64_t v30 = -1 << *(unsigned char *)(a4 + 32);
  if (-v30 < 64) {
    uint64_t v17 = ~(-1 << -(char)v30);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v15;
  if (!a2)
  {
    int64_t v19 = 0;
LABEL_34:
    uint64_t v27 = ~v30;
    *a1 = v33;
    a1[1] = v16;
    a1[2] = v27;
    a1[3] = v19;
    a1[4] = v18;
    return;
  }
  if (!a3)
  {
    int64_t v19 = 0;
    goto LABEL_34;
  }
  if (a3 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v29 = a1;
  int64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v31 = v16;
  int64_t v32 = (unint64_t)(63 - v30) >> 6;
  int64_t v28 = v32 - 1;
  if (!v18) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v21 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  unint64_t v22 = v21 | (v19 << 6);
  while (1)
  {
    ++v20;
    uint64_t v26 = *(void *)(v9 + 72);
    sub_24F24A314(*(void *)(v33 + 48) + v26 * v22, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for EditorialExternalLink);
    sub_24F24A4BC((uint64_t)v11, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for EditorialExternalLink);
    sub_24F24A4BC((uint64_t)v14, a2, (uint64_t (*)(void))type metadata accessor for EditorialExternalLink);
    if (v20 == a3) {
      goto LABEL_33;
    }
    a2 += v26;
    if (v18) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    if (v23 >= v32)
    {
      unint64_t v18 = 0;
LABEL_33:
      a1 = v29;
      uint64_t v16 = v31;
      goto LABEL_34;
    }
    uint64_t v16 = v31;
    unint64_t v24 = *(void *)(v31 + 8 * v23);
    if (!v24) {
      break;
    }
LABEL_18:
    unint64_t v18 = (v24 - 1) & v24;
    unint64_t v22 = __clz(__rbit64(v24)) + (v23 << 6);
    int64_t v19 = v23;
  }
  v19 += 2;
  if (v23 + 1 >= v32)
  {
    unint64_t v18 = 0;
    int64_t v19 = v23;
LABEL_39:
    a1 = v29;
    goto LABEL_34;
  }
  unint64_t v24 = *(void *)(v31 + 8 * v19);
  if (v24) {
    goto LABEL_14;
  }
  int64_t v25 = v23 + 2;
  if (v23 + 2 >= v32) {
    goto LABEL_36;
  }
  unint64_t v24 = *(void *)(v31 + 8 * v25);
  if (v24) {
    goto LABEL_17;
  }
  int64_t v19 = v23 + 3;
  if (v23 + 3 >= v32)
  {
    unint64_t v18 = 0;
    int64_t v19 = v23 + 2;
    goto LABEL_39;
  }
  unint64_t v24 = *(void *)(v31 + 8 * v19);
  if (v24)
  {
LABEL_14:
    int64_t v23 = v19;
    goto LABEL_18;
  }
  int64_t v25 = v23 + 4;
  if (v23 + 4 >= v32)
  {
LABEL_36:
    unint64_t v18 = 0;
    goto LABEL_39;
  }
  unint64_t v24 = *(void *)(v31 + 8 * v25);
  if (v24)
  {
LABEL_17:
    int64_t v23 = v25;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v23 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v23 >= v32)
    {
      unint64_t v18 = 0;
      int64_t v19 = v28;
      goto LABEL_39;
    }
    unint64_t v24 = *(void *)(v31 + 8 * v23);
    ++v25;
    if (v24) {
      goto LABEL_18;
    }
  }
LABEL_42:
  __break(1u);
}

uint64_t sub_24F24AB60()
{
  return swift_release();
}

uint64_t sub_24F24AB68@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_24F273E40();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_24F24AB9C()
{
  return sub_24F273E50();
}

unint64_t sub_24F24ABCC()
{
  unint64_t result = qword_2699CC8A8;
  if (!qword_2699CC8A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CC7B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CC8B0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CC418);
    sub_24F24ACF0();
    sub_24F1BD4AC(&qword_2699CC448, &qword_2699CC418);
    swift_getOpaqueTypeConformance2();
    sub_24F1BD4AC(&qword_2699CC8F8, &qword_2699CC900);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC8A8);
  }
  return result;
}

unint64_t sub_24F24ACF0()
{
  unint64_t result = qword_2699CC8B8;
  if (!qword_2699CC8B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CC8B0);
    sub_24F24AD90();
    sub_24F1BD4AC(&qword_2699CAC88, &qword_2699CAC90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC8B8);
  }
  return result;
}

unint64_t sub_24F24AD90()
{
  unint64_t result = qword_2699CC8C0;
  if (!qword_2699CC8C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CC8C8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CC8D0);
    sub_24F2740B0();
    sub_24F1BD4AC(&qword_2699CC8D8, &qword_2699CC8D0);
    sub_24F24AED8(&qword_2699CC8E0, MEMORY[0x263F1A3B8]);
    swift_getOpaqueTypeConformance2();
    sub_24F1BD4AC(&qword_2699CC8E8, &qword_2699CC8F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC8C0);
  }
  return result;
}

uint64_t sub_24F24AED8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24F24AF20()
{
  unint64_t result = qword_2699CC908;
  if (!qword_2699CC908)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699CC7B0);
    sub_24F23E138();
    sub_24F24AED8(&qword_2699CA990, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC908);
  }
  return result;
}

uint64_t objectdestroy_2Tm_0()
{
  sub_24F1BCA54();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 152, 7);
}

uint64_t sub_24F24B02C()
{
  return sub_24F24B034();
}

uint64_t sub_24F24B034()
{
  return sub_24F248EC8((long long *)(v0 + 64), *(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_24F24B060()
{
  return sub_24F24B078((uint64_t (*)(void, void, void, void, void, void, void))sub_24F249684);
}

uint64_t sub_24F24B078(uint64_t (*a1)(void, void, void, void, void, void, void))
{
  return a1(v1[8], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_24F24B094()
{
  return sub_24F273DF0();
}

uint64_t sub_24F24B0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24F24A0D8(a1, a2, a3, a4, MEMORY[0x263F19168], MEMORY[0x263F193E0]);
}

uint64_t sub_24F24B0F8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

__n128 ProgramDetailState.layout.getter@<Q0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 32);
  char v3 = *(unsigned char *)(v1 + 33);
  __n128 result = *(__n128 *)v1;
  long long v5 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 32) = v2;
  *(unsigned char *)(a1 + 33) = v3;
  return result;
}

void ProgramDetailState.libraryState.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 34);
}

unsigned char *ProgramDetailState.libraryState.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 34) = *result;
  return result;
}

uint64_t (*ProgramDetailState.libraryState.modify())()
{
  return nullsub_1;
}

uint64_t ProgramDetailState.loadState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ProgramDetailState();
  return sub_24F24C2C4(v1 + *(int *)(v3 + 24), a1, (uint64_t (*)(void))type metadata accessor for ProgramDetailLoadState);
}

uint64_t type metadata accessor for ProgramDetailState()
{
  uint64_t result = qword_26B1EE650;
  if (!qword_26B1EE650) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ProgramDetailState.loadState.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ProgramDetailState() + 24);
  return sub_24F24B288(a1, v3);
}

uint64_t sub_24F24B288(uint64_t a1, uint64_t a2)
{
  uint64_t State = type metadata accessor for ProgramDetailLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(State - 8) + 40))(a2, a1, State);
  return a2;
}

uint64_t (*ProgramDetailState.loadState.modify())(void)
{
  return nullsub_1;
}

uint64_t ProgramDetailState.locale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ProgramDetailState() + 28);
  uint64_t v4 = sub_24F2739F0();
  long long v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t ProgramDetailState.programIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ProgramDetailState() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ProgramDetailState.showingRemoveFromLibraryAlert.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ProgramDetailState() + 36));
}

uint64_t ProgramDetailState.showingRemoveFromLibraryAlert.setter(char a1)
{
  uint64_t result = type metadata accessor for ProgramDetailState();
  *(unsigned char *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*ProgramDetailState.showingRemoveFromLibraryAlert.modify())(void)
{
  return nullsub_1;
}

uint64_t ProgramDetailState.showingShareSheet.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ProgramDetailState() + 40));
}

uint64_t ProgramDetailState.showingShareSheet.setter(char a1)
{
  uint64_t result = type metadata accessor for ProgramDetailState();
  *(unsigned char *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*ProgramDetailState.showingShareSheet.modify())(void)
{
  return nullsub_1;
}

uint64_t ProgramDetailState.init(layout:libraryState:loadState:locale:programIdentifier:showingRemoveFromLibraryAlert:showingShareSheet:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>)
{
  char v16 = *(unsigned char *)(a1 + 32);
  char v17 = *(unsigned char *)(a1 + 33);
  char v18 = *a2;
  long long v19 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a9 = *(_OWORD *)a1;
  *(_OWORD *)(a9 + 16) = v19;
  *(unsigned char *)(a9 + 32) = v16;
  *(unsigned char *)(a9 + 33) = v17;
  *(unsigned char *)(a9 + 34) = v18;
  uint64_t v20 = (int *)type metadata accessor for ProgramDetailState();
  sub_24F24B610(a3, a9 + v20[6]);
  uint64_t v21 = a9 + v20[7];
  uint64_t v22 = sub_24F2739F0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v21, a4, v22);
  unint64_t v24 = (void *)(a9 + v20[8]);
  *unint64_t v24 = a5;
  v24[1] = a6;
  *(unsigned char *)(a9 + v20[9]) = a7;
  *(unsigned char *)(a9 + v20[10]) = a8;
  return result;
}

uint64_t sub_24F24B610(uint64_t a1, uint64_t a2)
{
  uint64_t State = type metadata accessor for ProgramDetailLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(State - 8) + 32))(a2, a1, State);
  return a2;
}

unint64_t sub_24F24B674(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x537972617262696CLL;
      break;
    case 2:
      unint64_t result = 0x7461745364616F6CLL;
      break;
    case 3:
      unint64_t result = 0x656C61636F6CLL;
      break;
    case 4:
    case 6:
      return result;
    case 5:
      unint64_t result = 0xD00000000000001DLL;
      break;
    default:
      unint64_t result = 0x74756F79616CLL;
      break;
  }
  return result;
}

unint64_t sub_24F24B758()
{
  return sub_24F24B674(*v0);
}

uint64_t sub_24F24B760@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F24F2B8(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F24B788(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_24F24B794(uint64_t a1)
{
  unint64_t v2 = sub_24F24BB30();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F24B7D0(uint64_t a1)
{
  unint64_t v2 = sub_24F24BB30();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ProgramDetailState.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC920);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F24BB30();
  sub_24F274EA0();
  char v9 = *((unsigned char *)v3 + 32);
  char v10 = *((unsigned char *)v3 + 33);
  long long v11 = v3[1];
  long long v15 = *v3;
  long long v16 = v11;
  char v17 = v9;
  char v18 = v10;
  char v14 = 0;
  sub_24F24BB84();
  sub_24F274E10();
  if (!v2)
  {
    LOBYTE(v15) = *((unsigned char *)v3 + 34);
    char v14 = 1;
    sub_24F208F00();
    sub_24F274E10();
    type metadata accessor for ProgramDetailState();
    LOBYTE(v15) = 2;
    type metadata accessor for ProgramDetailLoadState();
    sub_24F24C27C(&qword_2699CC938, (void (*)(uint64_t))type metadata accessor for ProgramDetailLoadState);
    sub_24F274E10();
    LOBYTE(v15) = 3;
    sub_24F2739F0();
    sub_24F24C27C(&qword_2699CA178, MEMORY[0x263F07690]);
    sub_24F274E10();
    LOBYTE(v15) = 4;
    sub_24F274DD0();
    LOBYTE(v15) = 5;
    sub_24F274DE0();
    LOBYTE(v15) = 6;
    sub_24F274DE0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_24F24BB30()
{
  unint64_t result = qword_2699CC928;
  if (!qword_2699CC928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC928);
  }
  return result;
}

unint64_t sub_24F24BB84()
{
  unint64_t result = qword_2699CC930;
  if (!qword_2699CC930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC930);
  }
  return result;
}

uint64_t ProgramDetailState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_24F2739F0();
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t State = type metadata accessor for ProgramDetailLoadState();
  MEMORY[0x270FA5388](State);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC940);
  uint64_t v9 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  long long v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = type metadata accessor for ProgramDetailState();
  MEMORY[0x270FA5388](v37);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v36 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_24F24BB30();
  uint64_t v33 = v11;
  long long v15 = v38;
  sub_24F274E90();
  if (v15) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  }
  long long v38 = v8;
  uint64_t v30 = v5;
  char v43 = 0;
  sub_24F24C228();
  sub_24F274D60();
  char v16 = v41;
  char v17 = v42;
  long long v18 = v40;
  uint64_t v19 = (uint64_t)v13;
  *(_OWORD *)uint64_t v13 = v39;
  *((_OWORD *)v13 + 1) = v18;
  v13[32] = v16;
  v13[33] = v17;
  char v43 = 1;
  sub_24F20A91C();
  sub_24F274D60();
  v13[34] = v39;
  LOBYTE(v39) = 2;
  sub_24F24C27C(&qword_2699CC950, (void (*)(uint64_t))type metadata accessor for ProgramDetailLoadState);
  uint64_t v20 = (uint64_t)v38;
  sub_24F274D60();
  uint64_t v21 = v9;
  uint64_t v22 = (int *)v37;
  sub_24F24B610(v20, v19 + *(int *)(v37 + 24));
  LOBYTE(v39) = 3;
  sub_24F24C27C(&qword_2699CA1A8, MEMORY[0x263F07690]);
  int64_t v23 = v30;
  uint64_t v24 = v35;
  sub_24F274D60();
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v19 + v22[7], v23, v24);
  LOBYTE(v39) = 4;
  uint64_t v25 = sub_24F274D20();
  uint64_t v26 = (uint64_t *)(v19 + v22[8]);
  *uint64_t v26 = v25;
  v26[1] = v27;
  LOBYTE(v39) = 5;
  *(unsigned char *)(v19 + v22[9]) = sub_24F274D30() & 1;
  LOBYTE(v39) = 6;
  LOBYTE(v24) = sub_24F274D30();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v33, v32);
  *(unsigned char *)(v19 + v22[10]) = v24 & 1;
  sub_24F24C2C4(v19, v31, (uint64_t (*)(void))type metadata accessor for ProgramDetailState);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  return sub_24F24DD64(v19, (uint64_t (*)(void))type metadata accessor for ProgramDetailState);
}

unint64_t sub_24F24C228()
{
  unint64_t result = qword_2699CC948;
  if (!qword_2699CC948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC948);
  }
  return result;
}

uint64_t sub_24F24C27C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24F24C2C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F24C32C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ProgramDetailState.init(from:)(a1, a2);
}

uint64_t sub_24F24C344(void *a1)
{
  return ProgramDetailState.encode(to:)(a1);
}

uint64_t _s20FitnessProductDetail07ProgramC5StateV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 33);
  long long v6 = *(_OWORD *)(a1 + 16);
  v21[0] = *(_OWORD *)a1;
  v21[1] = v6;
  char v22 = v4;
  char v23 = v5;
  char v7 = *(unsigned char *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 33);
  long long v9 = *(_OWORD *)(a2 + 16);
  v18[0] = *(_OWORD *)a2;
  v18[1] = v9;
  char v19 = v7;
  char v20 = v8;
  if ((_s20FitnessProductDetail07ProgramC6LayoutV2eeoiySbAC_ACtFZ_0((uint64_t)v21, (uint64_t)v18) & 1) == 0
    || *(unsigned __int8 *)(a1 + 34) != *(unsigned __int8 *)(a2 + 34)
    || (uint64_t v10 = (int *)type metadata accessor for ProgramDetailState(),
        (_s20FitnessProductDetail07ProgramC9LoadStateO2eeoiySbAC_ACtFZ_0(a1 + v10[6], a2 + v10[6]) & 1) == 0)
    || (MEMORY[0x2533569A0](a1 + v10[7], a2 + v10[7]) & 1) == 0)
  {
LABEL_9:
    char v16 = 0;
    return v16 & 1;
  }
  uint64_t v11 = v10[8];
  uint64_t v12 = *(void *)(a1 + v11);
  uint64_t v13 = *(void *)(a1 + v11 + 8);
  uint64_t v14 = (void *)(a2 + v11);
  if (v12 == *v14 && v13 == v14[1] || (char v15 = sub_24F274E20(), v16 = 0, (v15 & 1) != 0))
  {
    if (*(unsigned __int8 *)(a1 + v10[9]) == *(unsigned __int8 *)(a2 + v10[9]))
    {
      char v16 = *(unsigned char *)(a1 + v10[10]) ^ *(unsigned char *)(a2 + v10[10]) ^ 1;
      return v16 & 1;
    }
    goto LABEL_9;
  }
  return v16 & 1;
}

void *initializeBufferWithCopyOfBuffer for ProgramDetailState(uint64_t a1, uint64_t *a2, int *a3)
{
  char v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *char v4 = *a2;
    char v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(_WORD *)(a1 + 32) = *((_WORD *)a2 + 16);
    *(unsigned char *)(a1 + 34) = *((unsigned char *)a2 + 34);
    uint64_t v8 = a3[6];
    long long v9 = (char *)(a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC478);
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 2, v11))
    {
      uint64_t State = type metadata accessor for ProgramDetailLoadState();
      memcpy(v9, v10, *(void *)(*(void *)(State - 8) + 64));
    }
    else
    {
      uint64_t v67 = v12;
      uint64_t v64 = v11;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
      if (swift_getEnumCaseMultiPayload() == 1) {
        char v15 = (uint64_t *)&unk_2699CB450;
      }
      else {
        char v15 = (uint64_t *)&unk_2699CB448;
      }
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(v15);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v9, v10, v16);
      swift_storeEnumTagMultiPayload();
      char v17 = (int *)type metadata accessor for WorkoutProgram();
      uint64_t v18 = v17[5];
      char v19 = &v9[v18];
      char v20 = &v10[v18];
      uint64_t v21 = sub_24F2737E0();
      uint64_t v61 = *(void *)(v21 - 8);
      uint64_t v62 = v21;
      uint64_t v59 = *(void (**)(char *, char *))(v61 + 16);
      v59(v19, v20);
      uint64_t v22 = v17[6];
      char v23 = &v9[v22];
      uint64_t v24 = &v10[v22];
      uint64_t v25 = *((void *)v24 + 1);
      *(void *)char v23 = *(void *)v24;
      *((void *)v23 + 1) = v25;
      *(void *)&v9[v17[7]] = *(void *)&v10[v17[7]];
      uint64_t v63 = v17;
      uint64_t v26 = v17[8];
      uint64_t v60 = v9;
      __dst = &v9[v26];
      uint64_t v27 = &v10[v26];
      uint64_t v28 = type metadata accessor for WorkoutProgramPreview();
      uint64_t v58 = *(void *)(v28 - 8);
      uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v30 = v28;
      if (v29(v27, 1, v28))
      {
        uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8);
        memcpy(__dst, v27, *(void *)(*(void *)(v31 - 8) + 64));
      }
      else
      {
        uint64_t v32 = *((void *)v27 + 1);
        *(void *)__dst = *(void *)v27;
        *((void *)__dst + 1) = v32;
        uint64_t v33 = *(int *)(v30 + 20);
        uint64_t v56 = &v27[v33];
        uint64_t v57 = &__dst[v33];
        uint64_t v34 = sub_24F273900();
        uint64_t v35 = *(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16);
        swift_bridgeObjectRetain();
        v35(v57, v56, v34);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v58 + 56))(__dst, 0, 1, v30);
      }
      uint64_t v36 = v63[9];
      uint64_t v37 = &v60[v36];
      long long v38 = &v10[v36];
      uint64_t v39 = sub_24F273900();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v38, v39);
      uint64_t v40 = v63[10];
      __dsta = &v60[v40];
      char v41 = &v10[v40];
      uint64_t v42 = v67;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48))(&v10[v40], 1, v62))
      {
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
        memcpy(__dsta, v41, *(void *)(*(void *)(v43 - 8) + 64));
        uint64_t v44 = (void (*)(char *, char *, uint64_t))v59;
      }
      else
      {
        uint64_t v44 = (void (*)(char *, char *, uint64_t))v59;
        ((void (*)(char *, char *, uint64_t))v59)(__dsta, v41, v62);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v61 + 56))(__dsta, 0, 1, v62);
        uint64_t v42 = v67;
      }
      ((void (*)(char *, char *, uint64_t))v59)(&v60[v63[11]], &v10[v63[11]], v62);
      v44(&v60[v63[12]], &v10[v63[12]], v62);
      *(void *)&v60[v63[13]] = *(void *)&v10[v63[13]];
      long long v45 = *(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56);
      swift_bridgeObjectRetain();
      v45(v60, 0, 2, v64);
    }
    uint64_t v46 = a3[7];
    long long v47 = (char *)v4 + v46;
    uint64_t v48 = (uint64_t)a2 + v46;
    uint64_t v49 = sub_24F2739F0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 16))(v47, v48, v49);
    uint64_t v50 = a3[8];
    uint64_t v51 = a3[9];
    uint64_t v52 = (void *)((char *)v4 + v50);
    uint64_t v53 = (uint64_t *)((char *)a2 + v50);
    uint64_t v54 = v53[1];
    *uint64_t v52 = *v53;
    v52[1] = v54;
    *((unsigned char *)v4 + v51) = *((unsigned char *)a2 + v51);
    *((unsigned char *)v4 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ProgramDetailState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC478);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 2, v5))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
    if (swift_getEnumCaseMultiPayload() == 1) {
      long long v6 = (uint64_t *)&unk_2699CB450;
    }
    else {
      long long v6 = (uint64_t *)&unk_2699CB448;
    }
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(v6);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v4, v7);
    uint64_t v8 = (int *)type metadata accessor for WorkoutProgram();
    uint64_t v9 = v4 + v8[5];
    uint64_t v10 = sub_24F2737E0();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v12(v9, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v13 = v4 + v8[8];
    uint64_t v14 = type metadata accessor for WorkoutProgramPreview();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14))
    {
      swift_bridgeObjectRelease();
      uint64_t v15 = v13 + *(int *)(v14 + 20);
      uint64_t v16 = sub_24F273900();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
    }
    uint64_t v17 = v4 + v8[9];
    uint64_t v18 = sub_24F273900();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
    uint64_t v19 = v4 + v8[10];
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v19, 1, v10)) {
      v12(v19, v10);
    }
    v12(v4 + v8[11], v10);
    v12(v4 + v8[12], v10);
    swift_bridgeObjectRelease();
  }
  uint64_t v20 = a1 + *(int *)(a2 + 28);
  uint64_t v21 = sub_24F2739F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ProgramDetailState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = a3;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC478);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 2, v10))
  {
    uint64_t State = type metadata accessor for ProgramDetailLoadState();
    memcpy(v8, v9, *(void *)(*(void *)(State - 8) + 64));
  }
  else
  {
    uint64_t v59 = v11;
    uint64_t v60 = v10;
    uint64_t v61 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v13 = (uint64_t *)&unk_2699CB450;
    }
    else {
      uint64_t v13 = (uint64_t *)&unk_2699CB448;
    }
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(v13);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v8, v9, v14);
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = (int *)type metadata accessor for WorkoutProgram();
    uint64_t v16 = v15[5];
    uint64_t v17 = &v8[v16];
    uint64_t v18 = &v9[v16];
    uint64_t v19 = sub_24F2737E0();
    uint64_t v56 = (void (**)(char *, char *))(*(void *)(v19 - 8) + 16);
    uint64_t v57 = v19;
    uint64_t v54 = *(void *)(v19 - 8);
    uint64_t v55 = *v56;
    (*v56)(v17, v18);
    uint64_t v20 = v15[6];
    uint64_t v21 = &v8[v20];
    uint64_t v22 = &v9[v20];
    uint64_t v23 = *((void *)v22 + 1);
    *(void *)uint64_t v21 = *(void *)v22;
    *((void *)v21 + 1) = v23;
    *(void *)&v8[v15[7]] = *(void *)&v9[v15[7]];
    uint64_t v58 = v15;
    uint64_t v24 = v15[8];
    __dst = &v8[v24];
    uint64_t v25 = &v9[v24];
    uint64_t v26 = type metadata accessor for WorkoutProgramPreview();
    uint64_t v53 = *(void *)(v26 - 8);
    uint64_t v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v27(v25, 1, v26))
    {
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8);
      memcpy(__dst, v25, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      uint64_t v29 = *((void *)v25 + 1);
      *(void *)__dst = *(void *)v25;
      *((void *)__dst + 1) = v29;
      uint64_t v30 = *(int *)(v26 + 20);
      uint64_t v51 = &v25[v30];
      uint64_t v52 = &__dst[v30];
      uint64_t v31 = sub_24F273900();
      uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16);
      swift_bridgeObjectRetain();
      v32(v52, v51, v31);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(__dst, 0, 1, v26);
    }
    uint64_t v33 = v58[9];
    uint64_t v34 = &v8[v33];
    uint64_t v35 = &v9[v33];
    uint64_t v36 = sub_24F273900();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
    uint64_t v37 = v58[10];
    __dsta = &v8[v37];
    long long v38 = &v9[v37];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48))(&v9[v37], 1, v57))
    {
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
      memcpy(__dsta, v38, *(void *)(*(void *)(v39 - 8) + 64));
    }
    else
    {
      ((void (*)(char *, char *, uint64_t))v55)(__dsta, v38, v57);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(__dsta, 0, 1, v57);
    }
    ((void (*)(char *, char *, uint64_t))v55)(&v8[v58[11]], &v9[v58[11]], v57);
    ((void (*)(char *, char *, uint64_t))v55)(&v8[v58[12]], &v9[v58[12]], v57);
    *(void *)&v8[v58[13]] = *(void *)&v9[v58[13]];
    uint64_t v40 = *(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56);
    swift_bridgeObjectRetain();
    v40(v8, 0, 2, v60);
    uint64_t v3 = v61;
  }
  uint64_t v41 = v3[7];
  uint64_t v42 = a1 + v41;
  uint64_t v43 = a2 + v41;
  uint64_t v44 = sub_24F2739F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 16))(v42, v43, v44);
  uint64_t v45 = v3[8];
  uint64_t v46 = v3[9];
  long long v47 = (void *)(a1 + v45);
  uint64_t v48 = (void *)(a2 + v45);
  uint64_t v49 = v48[1];
  *long long v47 = *v48;
  v47[1] = v49;
  *(unsigned char *)(a1 + v46) = *(unsigned char *)(a2 + v46);
  *(unsigned char *)(a1 + v3[10]) = *(unsigned char *)(a2 + v3[10]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ProgramDetailState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = a3;
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC478);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 2, v9);
  int v13 = v11(v8, 2, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_24F1A62BC((uint64_t)v7, &qword_2699CC478);
      goto LABEL_10;
    }
    if (a1 != a2)
    {
      sub_24F1A62BC((uint64_t)v7, &qword_2699CB3B0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v30 = (uint64_t *)&unk_2699CB450;
      }
      else {
        uint64_t v30 = (uint64_t *)&unk_2699CB448;
      }
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(v30);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v7, v8, v31);
      swift_storeEnumTagMultiPayload();
    }
    uint64_t v32 = (int *)type metadata accessor for WorkoutProgram();
    uint64_t v33 = v32[5];
    uint64_t v34 = &v7[v33];
    uint64_t v35 = &v8[v33];
    uint64_t v36 = sub_24F2737E0();
    uint64_t v103 = *(void *)(v36 - 8);
    uint64_t v105 = v36;
    v100 = *(void (**)(char *, char *))(v103 + 24);
    v100(v34, v35);
    uint64_t v37 = v32[6];
    long long v38 = &v7[v37];
    uint64_t v39 = &v8[v37];
    *(void *)long long v38 = *(void *)v39;
    *((void *)v38 + 1) = *((void *)v39 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)&v7[v32[7]] = *(void *)&v8[v32[7]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v109 = v8;
    uint64_t v40 = v32[8];
    uint64_t v41 = &v7[v40];
    uint64_t v42 = &v8[v40];
    uint64_t v43 = type metadata accessor for WorkoutProgramPreview();
    uint64_t v44 = *(void *)(v43 - 8);
    uint64_t v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48);
    __src = v41;
    LODWORD(v41) = v45(v41, 1, v43);
    int v46 = v45(v42, 1, v43);
    if (v41)
    {
      if (v46)
      {
        size_t v47 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8) - 8) + 64);
        uint64_t v48 = __src;
LABEL_26:
        memcpy(v48, v42, v47);
        goto LABEL_29;
      }
      void *__src = *(void *)v42;
      __src[1] = *((void *)v42 + 1);
      uint64_t v61 = *(int *)(v43 + 20);
      long long v92 = &v42[v61];
      long long v94 = (char *)__src + v61;
      uint64_t v62 = sub_24F273900();
      uint64_t v90 = *(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 16);
      swift_bridgeObjectRetain();
      v90(v94, v92, v62);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v44 + 56))(__src, 0, 1, v43);
    }
    else
    {
      if (v46)
      {
        sub_24F24DD64((uint64_t)__src, (uint64_t (*)(void))type metadata accessor for WorkoutProgramPreview);
        size_t v47 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8) - 8) + 64);
        uint64_t v48 = __src;
        goto LABEL_26;
      }
      void *__src = *(void *)v42;
      __src[1] = *((void *)v42 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v63 = *(int *)(v43 + 20);
      uint64_t v64 = (char *)__src + v63;
      uint64_t v65 = &v42[v63];
      uint64_t v66 = sub_24F273900();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 24))(v64, v65, v66);
    }
LABEL_29:
    uint64_t v67 = v32[9];
    uint64_t v68 = &v7[v67];
    uint64_t v69 = &v109[v67];
    uint64_t v70 = sub_24F273900();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 24))(v68, v69, v70);
    uint64_t v71 = v32[10];
    uint64_t v72 = &v109[v71];
    uint64_t v73 = *(uint64_t (**)(void))(v103 + 48);
    long long v95 = &v7[v71];
    LODWORD(v68) = v73();
    __srca = v72;
    int v74 = ((uint64_t (*)(char *, uint64_t, uint64_t))v73)(v72, 1, v105);
    if (v68)
    {
      if (v74)
      {
        uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
        memcpy(v95, v72, *(void *)(*(void *)(v75 - 8) + 64));
        uint64_t v76 = v105;
      }
      else
      {
        uint64_t v76 = v105;
        (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v95, v72, v105);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v103 + 56))(v95, 0, 1, v105);
      }
    }
    else
    {
      if (!v74)
      {
        uint64_t v76 = v105;
        uint64_t v78 = (void (*)(char *, char *, uint64_t))v100;
        ((void (*)(char *, char *, uint64_t))v100)(v95, __srca, v105);
        goto LABEL_36;
      }
      uint64_t v76 = v105;
      (*(void (**)(char *, uint64_t))(v103 + 8))(v95, v105);
      uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
      memcpy(v95, v72, *(void *)(*(void *)(v77 - 8) + 64));
    }
    uint64_t v78 = (void (*)(char *, char *, uint64_t))v100;
LABEL_36:
    v78(&v7[v32[11]], &v109[v32[11]], v76);
    v78(&v7[v32[12]], &v109[v32[12]], v76);
    *(void *)&v7[v32[13]] = *(void *)&v109[v32[13]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v13)
  {
LABEL_10:
    uint64_t State = type metadata accessor for ProgramDetailLoadState();
    memcpy(v7, v8, *(void *)(*(void *)(State - 8) + 64));
    goto LABEL_37;
  }
  uint64_t v102 = v10;
  v104 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v14 = (uint64_t *)&unk_2699CB450;
  }
  else {
    uint64_t v14 = (uint64_t *)&unk_2699CB448;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(v14);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v7, v8, v15);
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = (int *)type metadata accessor for WorkoutProgram();
  uint64_t v17 = v16[5];
  uint64_t v18 = &v7[v17];
  uint64_t v19 = &v8[v17];
  uint64_t v20 = sub_24F2737E0();
  __srcb = (void (**)(char *, char *))(*(void *)(v20 - 8) + 16);
  uint64_t v99 = v20;
  uint64_t v91 = *(void *)(v20 - 8);
  long long v93 = *__srcb;
  (*__srcb)(v18, v19);
  uint64_t v21 = v16[6];
  uint64_t v22 = &v7[v21];
  uint64_t v23 = &v8[v21];
  *(void *)uint64_t v22 = *(void *)v23;
  *((void *)v22 + 1) = *((void *)v23 + 1);
  *(void *)&v7[v16[7]] = *(void *)&v8[v16[7]];
  v101 = v16;
  uint64_t v24 = v16[8];
  __dst = &v7[v24];
  v108 = v8;
  uint64_t v25 = &v8[v24];
  uint64_t v26 = type metadata accessor for WorkoutProgramPreview();
  uint64_t v89 = *(void *)(v26 - 8);
  uint64_t v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v89 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v27(v25, 1, v26))
  {
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8);
    memcpy(__dst, v25, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    *(void *)__dst = *(void *)v25;
    *((void *)__dst + 1) = *((void *)v25 + 1);
    uint64_t v49 = *(int *)(v26 + 20);
    uint64_t v87 = &v25[v49];
    uint64_t v88 = &__dst[v49];
    uint64_t v50 = sub_24F273900();
    uint64_t v51 = *(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16);
    swift_bridgeObjectRetain();
    v51(v88, v87, v50);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v89 + 56))(__dst, 0, 1, v26);
  }
  uint64_t v52 = v101[9];
  uint64_t v53 = &v7[v52];
  uint64_t v54 = &v108[v52];
  uint64_t v55 = sub_24F273900();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 16))(v53, v54, v55);
  uint64_t v56 = v101[10];
  __dsta = &v7[v56];
  uint64_t v57 = &v108[v56];
  uint64_t v3 = v104;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v91 + 48))(&v108[v56], 1, v99))
  {
    uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
    memcpy(__dsta, v57, *(void *)(*(void *)(v58 - 8) + 64));
    uint64_t v59 = v93;
  }
  else
  {
    uint64_t v59 = v93;
    ((void (*)(char *, char *, uint64_t))v93)(__dsta, v57, v99);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v91 + 56))(__dsta, 0, 1, v99);
  }
  ((void (*)(char *, char *, uint64_t))v93)(&v7[v101[11]], &v108[v101[11]], v99);
  ((void (*)(char *, char *, uint64_t))v59)(&v7[v101[12]], &v108[v101[12]], v99);
  *(void *)&v7[v101[13]] = *(void *)&v108[v101[13]];
  uint64_t v60 = *(void (**)(char *, void, uint64_t, uint64_t))(v102 + 56);
  swift_bridgeObjectRetain();
  v60(v7, 0, 2, v9);
LABEL_37:
  uint64_t v79 = v3[7];
  uint64_t v80 = a1 + v79;
  uint64_t v81 = a2 + v79;
  uint64_t v82 = sub_24F2739F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 24))(v80, v81, v82);
  uint64_t v83 = v3[8];
  unint64_t v84 = (void *)(a1 + v83);
  uint64_t v85 = (void *)(a2 + v83);
  *unint64_t v84 = *v85;
  v84[1] = v85[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v3[9]) = *(unsigned char *)(a2 + v3[9]);
  *(unsigned char *)(a1 + v3[10]) = *(unsigned char *)(a2 + v3[10]);
  return a1;
}

uint64_t sub_24F24DD64(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t initializeWithTake for ProgramDetailState(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC478);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 2, v10))
  {
    uint64_t State = type metadata accessor for ProgramDetailLoadState();
    memcpy(v8, v9, *(void *)(*(void *)(State - 8) + 64));
  }
  else
  {
    uint64_t v45 = v11;
    uint64_t v46 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
    if (swift_getEnumCaseMultiPayload() == 1) {
      int v13 = (uint64_t *)&unk_2699CB450;
    }
    else {
      int v13 = (uint64_t *)&unk_2699CB448;
    }
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(v13);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v8, v9, v14);
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = (int *)type metadata accessor for WorkoutProgram();
    uint64_t v16 = v15[5];
    uint64_t v17 = &v8[v16];
    uint64_t v18 = &v9[v16];
    uint64_t v19 = sub_24F2737E0();
    uint64_t v42 = *(void *)(v19 - 8);
    uint64_t v43 = v19;
    uint64_t v44 = *(void (**)(char *, char *))(v42 + 32);
    v44(v17, v18);
    *(_OWORD *)&v8[v15[6]] = *(_OWORD *)&v9[v15[6]];
    *(void *)&v8[v15[7]] = *(void *)&v9[v15[7]];
    uint64_t v20 = v15[8];
    uint64_t v21 = &v8[v20];
    uint64_t v22 = &v9[v20];
    uint64_t v23 = type metadata accessor for WorkoutProgramPreview();
    uint64_t v24 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8);
      memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
      uint64_t v26 = *(int *)(v23 + 20);
      __dsta = &v21[v26];
      uint64_t v27 = &v22[v26];
      uint64_t v28 = sub_24F273900();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(__dsta, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    uint64_t v29 = v15[9];
    uint64_t v30 = &v8[v29];
    uint64_t v31 = &v9[v29];
    uint64_t v32 = sub_24F273900();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
    uint64_t v33 = v15[10];
    __dst = &v8[v33];
    uint64_t v34 = &v9[v33];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(&v9[v33], 1, v43))
    {
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
      memcpy(__dst, v34, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      ((void (*)(char *, char *, uint64_t))v44)(__dst, v34, v43);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(__dst, 0, 1, v43);
    }
    ((void (*)(char *, char *, uint64_t))v44)(&v8[v15[11]], &v9[v15[11]], v43);
    ((void (*)(char *, char *, uint64_t))v44)(&v8[v15[12]], &v9[v15[12]], v43);
    *(void *)&v8[v15[13]] = *(void *)&v9[v15[13]];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v8, 0, 2, v46);
  }
  uint64_t v36 = a3[7];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  uint64_t v39 = sub_24F2739F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 32))(v37, v38, v39);
  uint64_t v40 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v40) = *(unsigned char *)(a2 + v40);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  return a1;
}

uint64_t assignWithTake for ProgramDetailState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = a3;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC478);
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 2, v10);
  int v14 = v12(v9, 2, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_24F1A62BC((uint64_t)v8, &qword_2699CC478);
      goto LABEL_10;
    }
    __srca = v3;
    if (a1 != a2)
    {
      sub_24F1A62BC((uint64_t)v8, &qword_2699CB3B0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v28 = (uint64_t *)&unk_2699CB450;
      }
      else {
        uint64_t v28 = (uint64_t *)&unk_2699CB448;
      }
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(v28);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v8, v9, v29);
      swift_storeEnumTagMultiPayload();
    }
    uint64_t v30 = (int *)type metadata accessor for WorkoutProgram();
    uint64_t v31 = v30[5];
    uint64_t v32 = &v8[v31];
    uint64_t v33 = &v9[v31];
    uint64_t v34 = sub_24F2737E0();
    uint64_t v99 = *(void *)(v34 - 8);
    uint64_t v101 = v34;
    long long v96 = *(void (**)(char *, char *))(v99 + 40);
    v96(v32, v33);
    uint64_t v35 = v30[6];
    uint64_t v36 = &v8[v35];
    uint64_t v37 = &v9[v35];
    uint64_t v39 = *(void *)v37;
    uint64_t v38 = *((void *)v37 + 1);
    *(void *)uint64_t v36 = v39;
    *((void *)v36 + 1) = v38;
    swift_bridgeObjectRelease();
    *(void *)&v8[v30[7]] = *(void *)&v9[v30[7]];
    swift_bridgeObjectRelease();
    uint64_t v40 = v30[8];
    uint64_t v41 = &v8[v40];
    uint64_t v42 = &v9[v40];
    uint64_t v43 = type metadata accessor for WorkoutProgramPreview();
    uint64_t v44 = *(void *)(v43 - 8);
    uint64_t v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48);
    long long v92 = v41;
    LODWORD(v41) = v45(v41, 1, v43);
    int v46 = v45(v42, 1, v43);
    if (v41)
    {
      if (v46)
      {
        size_t v47 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8) - 8) + 64);
        uint64_t v48 = v92;
LABEL_26:
        memcpy(v48, v42, v47);
        goto LABEL_29;
      }
      *(_OWORD *)long long v92 = *(_OWORD *)v42;
      uint64_t v60 = *(int *)(v43 + 20);
      uint64_t v61 = &v92[v60];
      uint64_t v62 = &v42[v60];
      uint64_t v63 = sub_24F273900();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 32))(v61, v62, v63);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v92, 0, 1, v43);
    }
    else
    {
      if (v46)
      {
        sub_24F24DD64((uint64_t)v92, (uint64_t (*)(void))type metadata accessor for WorkoutProgramPreview);
        size_t v47 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8) - 8) + 64);
        uint64_t v48 = v92;
        goto LABEL_26;
      }
      uint64_t v64 = *((void *)v42 + 1);
      *(void *)long long v92 = *(void *)v42;
      *((void *)v92 + 1) = v64;
      swift_bridgeObjectRelease();
      uint64_t v65 = *(int *)(v43 + 20);
      uint64_t v66 = &v92[v65];
      uint64_t v67 = &v42[v65];
      uint64_t v68 = sub_24F273900();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 40))(v66, v67, v68);
    }
LABEL_29:
    uint64_t v3 = __srca;
    uint64_t v69 = v30[9];
    uint64_t v70 = &v8[v69];
    uint64_t v71 = &v9[v69];
    uint64_t v72 = sub_24F273900();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 40))(v70, v71, v72);
    uint64_t v73 = v30[10];
    int v74 = &v9[v73];
    uint64_t v75 = *(uint64_t (**)(void))(v99 + 48);
    long long v94 = &v8[v73];
    LODWORD(v70) = v75();
    __srcb = v74;
    int v76 = ((uint64_t (*)(char *, uint64_t, uint64_t))v75)(v74, 1, v101);
    if (v70)
    {
      if (v76)
      {
        uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
        memcpy(v94, v74, *(void *)(*(void *)(v77 - 8) + 64));
        uint64_t v78 = v101;
      }
      else
      {
        uint64_t v78 = v101;
        (*(void (**)(char *, char *, uint64_t))(v99 + 32))(v94, v74, v101);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v99 + 56))(v94, 0, 1, v101);
      }
    }
    else
    {
      if (!v76)
      {
        uint64_t v80 = (void (*)(char *, char *, uint64_t))v96;
        uint64_t v78 = v101;
        ((void (*)(char *, char *, uint64_t))v96)(v94, __srcb, v101);
        goto LABEL_36;
      }
      uint64_t v78 = v101;
      (*(void (**)(char *, uint64_t))(v99 + 8))(v94, v101);
      uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
      memcpy(v94, v74, *(void *)(*(void *)(v79 - 8) + 64));
    }
    uint64_t v80 = (void (*)(char *, char *, uint64_t))v96;
LABEL_36:
    v80(&v8[v30[11]], &v9[v30[11]], v78);
    v80(&v8[v30[12]], &v9[v30[12]], v78);
    *(void *)&v8[v30[13]] = *(void *)&v9[v30[13]];
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v14)
  {
LABEL_10:
    uint64_t State = type metadata accessor for ProgramDetailLoadState();
    memcpy(v8, v9, *(void *)(*(void *)(State - 8) + 64));
    goto LABEL_37;
  }
  __src = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v15 = (uint64_t *)&unk_2699CB450;
  }
  else {
    uint64_t v15 = (uint64_t *)&unk_2699CB448;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(v15);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v8, v9, v16);
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = (int *)type metadata accessor for WorkoutProgram();
  uint64_t v18 = v17[5];
  uint64_t v19 = &v8[v18];
  uint64_t v20 = &v9[v18];
  uint64_t v21 = sub_24F2737E0();
  v98 = (void (**)(char *, char *))(*(void *)(v21 - 8) + 32);
  uint64_t v100 = v21;
  uint64_t v95 = *(void *)(v21 - 8);
  uint64_t v97 = *v98;
  (*v98)(v19, v20);
  *(_OWORD *)&v8[v17[6]] = *(_OWORD *)&v9[v17[6]];
  *(void *)&v8[v17[7]] = *(void *)&v9[v17[7]];
  uint64_t v22 = v17[8];
  __dst = &v8[v22];
  uint64_t v23 = &v9[v22];
  uint64_t v24 = type metadata accessor for WorkoutProgramPreview();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8);
    memcpy(__dst, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)v23;
    uint64_t v49 = *(int *)(v24 + 20);
    long long v93 = &__dst[v49];
    uint64_t v50 = &v23[v49];
    uint64_t v51 = sub_24F273900();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 32))(v93, v50, v51);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(__dst, 0, 1, v24);
  }
  uint64_t v52 = v17[9];
  uint64_t v53 = &v8[v52];
  uint64_t v54 = &v9[v52];
  uint64_t v55 = sub_24F273900();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 32))(v53, v54, v55);
  uint64_t v56 = v17[10];
  __dsta = &v8[v56];
  uint64_t v57 = &v9[v56];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v95 + 48))(&v9[v56], 1, v100))
  {
    uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
    memcpy(__dsta, v57, *(void *)(*(void *)(v58 - 8) + 64));
    uint64_t v59 = v97;
  }
  else
  {
    uint64_t v59 = v97;
    ((void (*)(char *, char *, uint64_t))v97)(__dsta, v57, v100);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v95 + 56))(__dsta, 0, 1, v100);
  }
  ((void (*)(char *, char *, uint64_t))v97)(&v8[v17[11]], &v9[v17[11]], v100);
  ((void (*)(char *, char *, uint64_t))v59)(&v8[v17[12]], &v9[v17[12]], v100);
  *(void *)&v8[v17[13]] = *(void *)&v9[v17[13]];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 2, v10);
  uint64_t v3 = __src;
LABEL_37:
  uint64_t v81 = v3[7];
  uint64_t v82 = a1 + v81;
  uint64_t v83 = a2 + v81;
  uint64_t v84 = sub_24F2739F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v84 - 8) + 40))(v82, v83, v84);
  uint64_t v85 = v3[8];
  uint64_t v86 = (void *)(a1 + v85);
  uint64_t v87 = (uint64_t *)(a2 + v85);
  uint64_t v89 = *v87;
  uint64_t v88 = v87[1];
  *uint64_t v86 = v89;
  v86[1] = v88;
  swift_bridgeObjectRelease();
  uint64_t v90 = v3[10];
  *(unsigned char *)(a1 + v3[9]) = *(unsigned char *)(a2 + v3[9]);
  *(unsigned char *)(a1 + v90) = *(unsigned char *)(a2 + v90);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProgramDetailState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F24ECFC);
}

uint64_t sub_24F24ECFC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t State = type metadata accessor for ProgramDetailLoadState();
  if (*(_DWORD *)(*(void *)(State - 8) + 84) == a2)
  {
    uint64_t v7 = State;
    uint64_t v8 = *(void *)(State - 8);
    uint64_t v9 = a3[6];
LABEL_5:
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v11(a1 + v9, a2, v7);
  }
  uint64_t v10 = sub_24F2739F0();
  if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
  {
    uint64_t v7 = v10;
    uint64_t v8 = *(void *)(v10 - 8);
    uint64_t v9 = a3[7];
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + a3[8] + 8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t storeEnumTagSinglePayload for ProgramDetailState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F24EE24);
}

uint64_t sub_24F24EE24(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t State = type metadata accessor for ProgramDetailLoadState();
  if (*(_DWORD *)(*(void *)(State - 8) + 84) == a3)
  {
    uint64_t v9 = State;
    uint64_t v10 = *(void *)(State - 8);
    uint64_t v11 = a4[6];
  }
  else
  {
    uint64_t result = sub_24F2739F0();
    if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
    {
      *(void *)(a1 + a4[8] + 8) = (a2 - 1);
      return result;
    }
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[7];
  }
  unint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  return v13(a1 + v11, a2, a2, v9);
}

uint64_t sub_24F24EF34()
{
  uint64_t result = type metadata accessor for ProgramDetailLoadState();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24F2739F0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ProgramDetailState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ProgramDetailState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x24F24F178);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailState.CodingKeys()
{
  return &type metadata for ProgramDetailState.CodingKeys;
}

unint64_t sub_24F24F1B4()
{
  unint64_t result = qword_2699CC958;
  if (!qword_2699CC958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC958);
  }
  return result;
}

unint64_t sub_24F24F20C()
{
  unint64_t result = qword_2699CC960;
  if (!qword_2699CC960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC960);
  }
  return result;
}

unint64_t sub_24F24F264()
{
  unint64_t result = qword_2699CC968;
  if (!qword_2699CC968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC968);
  }
  return result;
}

uint64_t sub_24F24F2B8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x74756F79616CLL && a2 == 0xE600000000000000;
  if (v3 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x537972617262696CLL && a2 == 0xEC00000065746174 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7461745364616F6CLL && a2 == 0xE900000000000065 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024F284110 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x800000024F284130 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024F284150)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_24F274E20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

BOOL static EditorialDetailLayout.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((MEMORY[0x253356A60]() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for EditorialDetailLayout();
  return *(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(v4 + 20));
}

uint64_t type metadata accessor for EditorialDetailLayout()
{
  uint64_t result = qword_26B1EDAE0;
  if (!qword_26B1EDAE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t EditorialDetailLayout.init(contentMargins:sizeClass:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24F273AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t result = type metadata accessor for EditorialDetailLayout();
  *(unsigned char *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t sub_24F24F688(char a1)
{
  if (a1) {
    return 0x73616C43657A6973;
  }
  else {
    return 0x4D746E65746E6F63;
  }
}

uint64_t sub_24F24F6D0()
{
  return sub_24F24F688(*v0);
}

uint64_t sub_24F24F6D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F2509D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F24F700(uint64_t a1)
{
  unint64_t v2 = sub_24F24FD60();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F24F73C(uint64_t a1)
{
  unint64_t v2 = sub_24F24FD60();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t EditorialDetailLayout.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC970);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F24FD60();
  sub_24F274EA0();
  v10[15] = 0;
  sub_24F273AC0();
  sub_24F250228(&qword_2699CC980, MEMORY[0x263F3DF60]);
  sub_24F274E10();
  if (!v2)
  {
    v10[14] = *(unsigned char *)(v3 + *(int *)(type metadata accessor for EditorialDetailLayout() + 20));
    v10[13] = 1;
    sub_24F24FDB4();
    sub_24F274E10();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t EditorialDetailLayout.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v27 = sub_24F273AC0();
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC990);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v25 = v6;
  uint64_t v26 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for EditorialDetailLayout();
  MEMORY[0x270FA5388](v10);
  int v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F24FD60();
  sub_24F274E90();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v22 = v10;
  unint64_t v13 = v12;
  uint64_t v14 = v24;
  char v30 = 0;
  sub_24F250228(&qword_2699CC998, MEMORY[0x263F3DF60]);
  uint64_t v15 = v27;
  uint64_t v16 = v25;
  sub_24F274D60();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  uint64_t v21 = (uint64_t)v13;
  v17(v13, v5, v15);
  char v28 = 1;
  sub_24F24FE08();
  sub_24F274D60();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v16);
  uint64_t v18 = v21;
  *(unsigned char *)(v21 + *(int *)(v22 + 20)) = v29;
  sub_24F24FE5C(v18, v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24F24FEC0(v18);
}

uint64_t sub_24F24FCA0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return EditorialDetailLayout.init(from:)(a1, a2);
}

uint64_t sub_24F24FCB8(void *a1)
{
  return EditorialDetailLayout.encode(to:)(a1);
}

uint64_t EditorialDetailLayout.hash(into:)()
{
  return sub_24F274E50();
}

unint64_t sub_24F24FD60()
{
  unint64_t result = qword_2699CC978;
  if (!qword_2699CC978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC978);
  }
  return result;
}

unint64_t sub_24F24FDB4()
{
  unint64_t result = qword_2699CC988;
  if (!qword_2699CC988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC988);
  }
  return result;
}

unint64_t sub_24F24FE08()
{
  unint64_t result = qword_2699CC9A0;
  if (!qword_2699CC9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC9A0);
  }
  return result;
}

uint64_t sub_24F24FE5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EditorialDetailLayout();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F24FEC0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EditorialDetailLayout();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t EditorialDetailLayout.hashValue.getter()
{
  return sub_24F274E80();
}

uint64_t sub_24F24FFBC()
{
  return sub_24F274E80();
}

uint64_t sub_24F250060()
{
  return sub_24F274E50();
}

uint64_t sub_24F2500EC()
{
  return sub_24F274E80();
}

BOOL sub_24F25018C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (MEMORY[0x253356A60]() & 1) != 0
      && *(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(a3 + 20));
}

uint64_t sub_24F2501E0()
{
  return sub_24F250228(&qword_2699CC9A8, (void (*)(uint64_t))type metadata accessor for EditorialDetailLayout);
}

uint64_t sub_24F250228(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for EditorialDetailLayout(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24F273AC0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for EditorialDetailLayout(uint64_t a1)
{
  uint64_t v2 = sub_24F273AC0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for EditorialDetailLayout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F273AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for EditorialDetailLayout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F273AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for EditorialDetailLayout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F273AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for EditorialDetailLayout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F273AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for EditorialDetailLayout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F2505A4);
}

uint64_t sub_24F2505A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F273AC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 6) {
      return v10 - 5;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for EditorialDetailLayout(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F250674);
}

uint64_t sub_24F250674(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24F273AC0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 5;
  }
  return result;
}

uint64_t sub_24F250730()
{
  uint64_t result = sub_24F273AC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for EditorialDetailLayout.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x24F250890);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EditorialDetailLayout.CodingKeys()
{
  return &type metadata for EditorialDetailLayout.CodingKeys;
}

unint64_t sub_24F2508CC()
{
  unint64_t result = qword_2699CC9B0;
  if (!qword_2699CC9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC9B0);
  }
  return result;
}

unint64_t sub_24F250924()
{
  unint64_t result = qword_2699CC9B8;
  if (!qword_2699CC9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC9B8);
  }
  return result;
}

unint64_t sub_24F25097C()
{
  unint64_t result = qword_2699CC9C0;
  if (!qword_2699CC9C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CC9C0);
  }
  return result;
}

uint64_t sub_24F2509D0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x4D746E65746E6F63 && a2 == 0xEE00736E69677261;
  if (v3 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73616C43657A6973 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F274E20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F250ADC(char a1)
{
  uint64_t result = 0xD00000000000001DLL;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x4164694477656976;
      break;
    case 2:
      uint64_t result = 0xD000000000000013;
      break;
    case 3:
      uint64_t result = 0xD000000000000013;
      break;
    case 4:
    case 5:
      uint64_t result = 0xD000000000000012;
      break;
    case 6:
      uint64_t result = 0xD000000000000023;
      break;
    case 7:
      uint64_t result = 0x6C69466863746177;
      break;
    case 8:
      unsigned int v3 = 1701998445;
      goto LABEL_12;
    case 9:
      uint64_t result = 0xD000000000000017;
      break;
    case 10:
      unsigned int v3 = 1802398060;
LABEL_12:
      uint64_t result = v3 | 0x7070615400000000;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F250C2C(uint64_t a1)
{
  unint64_t v2 = sub_24F2522D4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F250C68(uint64_t a1)
{
  unint64_t v2 = sub_24F2522D4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F250CA4()
{
  return sub_24F250ADC(*v0);
}

uint64_t sub_24F250CAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F25600C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F250CD4(unsigned char *a1@<X8>)
{
  *a1 = 11;
}

uint64_t sub_24F250CE0(uint64_t a1)
{
  unint64_t v2 = sub_24F252024();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F250D1C(uint64_t a1)
{
  unint64_t v2 = sub_24F252024();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F250D58(uint64_t a1)
{
  unint64_t v2 = sub_24F252424();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F250D94(uint64_t a1)
{
  unint64_t v2 = sub_24F252424();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F250DD0(uint64_t a1)
{
  unint64_t v2 = sub_24F25237C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F250E0C(uint64_t a1)
{
  unint64_t v2 = sub_24F25237C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F250E4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F256450(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24F250E78(uint64_t a1)
{
  unint64_t v2 = sub_24F2520DC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F250EB4(uint64_t a1)
{
  unint64_t v2 = sub_24F2520DC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F250EF0(uint64_t a1)
{
  unint64_t v2 = sub_24F252328();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F250F2C(uint64_t a1)
{
  unint64_t v2 = sub_24F252328();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F250F68(uint64_t a1)
{
  unint64_t v2 = sub_24F252184();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F250FA4(uint64_t a1)
{
  unint64_t v2 = sub_24F252184();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F250FE0(uint64_t a1)
{
  unint64_t v2 = sub_24F252130();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F25101C(uint64_t a1)
{
  unint64_t v2 = sub_24F252130();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F251058(uint64_t a1)
{
  unint64_t v2 = sub_24F25222C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F251094(uint64_t a1)
{
  unint64_t v2 = sub_24F25222C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F2510D0(uint64_t a1)
{
  unint64_t v2 = sub_24F252280();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F25110C(uint64_t a1)
{
  unint64_t v2 = sub_24F252280();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F251148(uint64_t a1)
{
  unint64_t v2 = sub_24F2523D0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F251184(uint64_t a1)
{
  unint64_t v2 = sub_24F2523D0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F2511C0(uint64_t a1)
{
  unint64_t v2 = sub_24F2521D8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2511FC(uint64_t a1)
{
  unint64_t v2 = sub_24F2521D8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ProgramDetailAction.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC9C8);
  uint64_t v94 = *(void *)(v2 - 8);
  uint64_t v95 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v91 = (char *)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24F273900();
  uint64_t v92 = *(void *)(v4 - 8);
  uint64_t v93 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v90 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC9D0);
  uint64_t v88 = *(void *)(v6 - 8);
  uint64_t v89 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v87 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC9D8);
  uint64_t v85 = *(void *)(v8 - 8);
  uint64_t v86 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v84 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC9E0);
  uint64_t v82 = *(void *)(v10 - 8);
  uint64_t v83 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v81 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC9E8);
  uint64_t v79 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v78 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC9F0);
  uint64_t v76 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v75 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC9F8);
  uint64_t v71 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v69 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCA00);
  uint64_t v73 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  uint64_t v70 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = type metadata accessor for WorkoutProgram();
  MEMORY[0x270FA5388](v67);
  uint64_t v68 = (uint64_t)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCA08);
  uint64_t v65 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v64 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCA10);
  uint64_t v62 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v19 = (char *)&v61 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCA18);
  uint64_t v61 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for ProgramDetailAction();
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v61 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCA20);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v97 = v26;
  uint64_t v98 = v27;
  MEMORY[0x270FA5388](v26);
  char v29 = (char *)&v61 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F252024();
  long long v96 = v29;
  sub_24F274EA0();
  sub_24F252078(v99, (uint64_t)v25);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v35 = v68;
      sub_24F253718((uint64_t)v25, v68, (uint64_t (*)(void))type metadata accessor for WorkoutProgram);
      v104[0] = 3;
      sub_24F252328();
      uint64_t v36 = v70;
      uint64_t v33 = v96;
      uint64_t v32 = v97;
      sub_24F274D80();
      sub_24F253780(&qword_2699CC6B0, (void (*)(uint64_t))type metadata accessor for WorkoutProgram);
      uint64_t v37 = v74;
      sub_24F274E10();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v36, v37);
      sub_24F254944(v35, (uint64_t (*)(void))type metadata accessor for WorkoutProgram);
      goto LABEL_4;
    case 2u:
      v104[6] = 9;
      sub_24F252130();
      uint64_t v39 = v87;
      uint64_t v41 = v96;
      uint64_t v40 = v97;
      sub_24F274D80();
      uint64_t v42 = v89;
      sub_24F274DD0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v88 + 8))(v39, v42);
      return (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v41, v40);
    case 3u:
      uint64_t v44 = v92;
      uint64_t v43 = v93;
      uint64_t v45 = v90;
      (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v90, v25, v93);
      v104[7] = 10;
      sub_24F2520DC();
      int v46 = v91;
      uint64_t v48 = v96;
      uint64_t v47 = v97;
      sub_24F274D80();
      sub_24F253780(&qword_2699CA528, MEMORY[0x263F06EA8]);
      uint64_t v49 = v95;
      sub_24F274E10();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v46, v49);
      (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v43);
      return (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v48, v47);
    case 4u:
      char v100 = 0;
      sub_24F252424();
      uint64_t v51 = v96;
      uint64_t v50 = v97;
      sub_24F274D80();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v22, v20);
      goto LABEL_17;
    case 5u:
      char v101 = 1;
      sub_24F2523D0();
      uint64_t v51 = v96;
      uint64_t v50 = v97;
      sub_24F274D80();
      uint64_t v52 = *(void (**)(char *, void))(v62 + 8);
      uint64_t v53 = v19;
      uint64_t v54 = &v95;
      goto LABEL_16;
    case 6u:
      v104[1] = 4;
      sub_24F2522D4();
      uint64_t v55 = v69;
      uint64_t v51 = v96;
      uint64_t v50 = v97;
      sub_24F274D80();
      uint64_t v52 = *(void (**)(char *, void))(v71 + 8);
      uint64_t v53 = v55;
      uint64_t v54 = (uint64_t *)v104;
      goto LABEL_16;
    case 7u:
      v104[2] = 5;
      sub_24F252280();
      uint64_t v56 = v75;
      uint64_t v51 = v96;
      uint64_t v50 = v97;
      sub_24F274D80();
      uint64_t v52 = *(void (**)(char *, void))(v76 + 8);
      uint64_t v53 = v56;
      uint64_t v54 = &v105;
      goto LABEL_16;
    case 8u:
      v104[3] = 6;
      sub_24F25222C();
      uint64_t v60 = v78;
      uint64_t v51 = v96;
      uint64_t v50 = v97;
      sub_24F274D80();
      uint64_t v52 = *(void (**)(char *, void))(v79 + 8);
      uint64_t v53 = v60;
      uint64_t v54 = &v106;
LABEL_16:
      v52(v53, *(v54 - 32));
      goto LABEL_17;
    case 9u:
      v104[4] = 7;
      sub_24F2521D8();
      uint64_t v57 = v81;
      uint64_t v51 = v96;
      uint64_t v50 = v97;
      sub_24F274D80();
      uint64_t v59 = v82;
      uint64_t v58 = v83;
      goto LABEL_14;
    case 0xAu:
      v104[5] = 8;
      sub_24F252184();
      uint64_t v57 = v84;
      uint64_t v51 = v96;
      uint64_t v50 = v97;
      sub_24F274D80();
      uint64_t v59 = v85;
      uint64_t v58 = v86;
LABEL_14:
      (*(void (**)(char *, uint64_t))(v59 + 8))(v57, v58);
LABEL_17:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v51, v50);
      break;
    default:
      char v30 = *v25;
      char v103 = 2;
      sub_24F25237C();
      uint64_t v31 = v64;
      uint64_t v33 = v96;
      uint64_t v32 = v97;
      sub_24F274D80();
      char v102 = v30;
      sub_24F208F00();
      uint64_t v34 = v66;
      sub_24F274E10();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v31, v34);
LABEL_4:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v33, v32);
      break;
  }
  return result;
}

uint64_t type metadata accessor for ProgramDetailAction()
{
  uint64_t result = qword_2699CCAE8;
  if (!qword_2699CCAE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24F252024()
{
  unint64_t result = qword_2699CCA28;
  if (!qword_2699CCA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCA28);
  }
  return result;
}

uint64_t sub_24F252078(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ProgramDetailAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24F2520DC()
{
  unint64_t result = qword_2699CCA30;
  if (!qword_2699CCA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCA30);
  }
  return result;
}

unint64_t sub_24F252130()
{
  unint64_t result = qword_2699CCA38;
  if (!qword_2699CCA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCA38);
  }
  return result;
}

unint64_t sub_24F252184()
{
  unint64_t result = qword_2699CCA40;
  if (!qword_2699CCA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCA40);
  }
  return result;
}

unint64_t sub_24F2521D8()
{
  unint64_t result = qword_2699CCA48;
  if (!qword_2699CCA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCA48);
  }
  return result;
}

unint64_t sub_24F25222C()
{
  unint64_t result = qword_2699CCA50;
  if (!qword_2699CCA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCA50);
  }
  return result;
}

unint64_t sub_24F252280()
{
  unint64_t result = qword_2699CCA58;
  if (!qword_2699CCA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCA58);
  }
  return result;
}

unint64_t sub_24F2522D4()
{
  unint64_t result = qword_2699CCA60;
  if (!qword_2699CCA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCA60);
  }
  return result;
}

unint64_t sub_24F252328()
{
  unint64_t result = qword_2699CCA68;
  if (!qword_2699CCA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCA68);
  }
  return result;
}

unint64_t sub_24F25237C()
{
  unint64_t result = qword_2699CCA70;
  if (!qword_2699CCA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCA70);
  }
  return result;
}

unint64_t sub_24F2523D0()
{
  unint64_t result = qword_2699CCA78;
  if (!qword_2699CCA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCA78);
  }
  return result;
}

unint64_t sub_24F252424()
{
  unint64_t result = qword_2699CCA80;
  if (!qword_2699CCA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCA80);
  }
  return result;
}

uint64_t ProgramDetailAction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v119 = a2;
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCA88);
  uint64_t v111 = *(void *)(v108 - 8);
  MEMORY[0x270FA5388](v108);
  v126 = (char *)v84 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCA90);
  uint64_t v110 = *(void *)(v107 - 8);
  MEMORY[0x270FA5388](v107);
  v125 = (char *)v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCA98);
  uint64_t v105 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  v118 = (char *)v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCAA0);
  uint64_t v103 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  v117 = (char *)v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCAA8);
  uint64_t v101 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  v116 = (char *)v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCAB0);
  uint64_t v99 = *(void *)(v100 - 8);
  MEMORY[0x270FA5388](v100);
  v115 = (char *)v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCAB8);
  uint64_t v96 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  v114 = (char *)v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCAC0);
  uint64_t v109 = *(void *)(v98 - 8);
  MEMORY[0x270FA5388](v98);
  v113 = (char *)v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCAC8);
  uint64_t v95 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  v124 = (char *)v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCAD0);
  uint64_t v92 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  v123 = (char *)v84 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCAD8);
  uint64_t v90 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  v112 = (char *)v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCAE0);
  uint64_t v120 = *(void *)(v122 - 8);
  MEMORY[0x270FA5388](v122);
  uint64_t v15 = (char *)v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = type metadata accessor for ProgramDetailAction();
  MEMORY[0x270FA5388](v121);
  uint64_t v17 = (char *)v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (void *)((char *)v84 - v19);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)v84 - v22;
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)v84 - v25;
  MEMORY[0x270FA5388](v27);
  char v29 = (char *)v84 - v28;
  uint64_t v30 = a1[3];
  v127 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v30);
  sub_24F252024();
  uint64_t v31 = v128;
  sub_24F274E90();
  if (v31) {
    goto LABEL_29;
  }
  uint64_t v85 = v26;
  uint64_t v86 = v20;
  uint64_t v87 = v23;
  uint64_t v88 = v17;
  uint64_t v33 = v123;
  uint64_t v32 = v124;
  uint64_t v128 = 0;
  uint64_t v35 = v125;
  uint64_t v34 = v126;
  uint64_t v36 = v121;
  uint64_t v89 = v29;
  uint64_t v37 = v122;
  uint64_t v38 = sub_24F274D70();
  if (*(void *)(v38 + 16) != 1)
  {
    uint64_t v42 = v37;
    uint64_t v43 = sub_24F274C70();
    swift_allocError();
    uint64_t v44 = v15;
    int v46 = v45;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA150);
    uint64_t *v46 = v36;
    sub_24F274CD0();
    sub_24F274C60();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v43 - 8) + 104))(v46, *MEMORY[0x263F8DCB0], v43);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v120 + 8))(v44, v42);
LABEL_29:
    uint64_t v69 = (uint64_t)v127;
    return __swift_destroy_boxed_opaque_existential_1(v69);
  }
  v84[1] = v38;
  switch(*(unsigned char *)(v38 + 32))
  {
    case 1:
      char v130 = 1;
      sub_24F2523D0();
      uint64_t v47 = v128;
      sub_24F274CC0();
      if (v47) {
        goto LABEL_28;
      }
      (*(void (**)(char *, uint64_t))(v92 + 8))(v33, v93);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v15, v37);
      uint64_t v41 = (uint64_t)v89;
      goto LABEL_23;
    case 2:
      char v132 = 2;
      sub_24F25237C();
      uint64_t v48 = v128;
      sub_24F274CC0();
      if (v48) {
        goto LABEL_28;
      }
      sub_24F20A91C();
      uint64_t v49 = v94;
      sub_24F274D60();
      (*(void (**)(char *, uint64_t))(v95 + 8))(v32, v49);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v15, v37);
      uint64_t v50 = v85;
      *uint64_t v85 = v131;
      swift_storeEnumTagMultiPayload();
      uint64_t v51 = (uint64_t)v50;
      goto LABEL_33;
    case 3:
      char v133 = 3;
      sub_24F252328();
      uint64_t v52 = v113;
      uint64_t v53 = v128;
      sub_24F274CC0();
      if (v53) {
        goto LABEL_28;
      }
      type metadata accessor for WorkoutProgram();
      sub_24F253780(&qword_2699CC6E8, (void (*)(uint64_t))type metadata accessor for WorkoutProgram);
      uint64_t v54 = (uint64_t)v87;
      uint64_t v55 = v98;
      sub_24F274D60();
      uint64_t v56 = v52;
      uint64_t v57 = v120;
      (*(void (**)(char *, uint64_t))(v109 + 8))(v56, v55);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v15, v37);
      goto LABEL_32;
    case 4:
      char v134 = 4;
      sub_24F2522D4();
      uint64_t v58 = v114;
      uint64_t v59 = v128;
      sub_24F274CC0();
      if (v59) {
        goto LABEL_28;
      }
      (*(void (**)(char *, uint64_t))(v96 + 8))(v58, v97);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v15, v37);
      uint64_t v41 = (uint64_t)v89;
      goto LABEL_23;
    case 5:
      char v135 = 5;
      sub_24F252280();
      uint64_t v60 = v115;
      uint64_t v61 = v128;
      sub_24F274CC0();
      if (v61) {
        goto LABEL_28;
      }
      (*(void (**)(char *, uint64_t))(v99 + 8))(v60, v100);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v15, v37);
      uint64_t v41 = (uint64_t)v89;
      goto LABEL_23;
    case 6:
      char v136 = 6;
      sub_24F25222C();
      uint64_t v62 = v116;
      uint64_t v63 = v128;
      sub_24F274CC0();
      if (v63) {
        goto LABEL_28;
      }
      (*(void (**)(char *, uint64_t))(v101 + 8))(v62, v102);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v15, v37);
      uint64_t v41 = (uint64_t)v89;
      goto LABEL_23;
    case 7:
      char v137 = 7;
      sub_24F2521D8();
      uint64_t v64 = v117;
      uint64_t v65 = v128;
      sub_24F274CC0();
      if (v65) {
        goto LABEL_28;
      }
      (*(void (**)(char *, uint64_t))(v103 + 8))(v64, v104);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v15, v37);
      uint64_t v41 = (uint64_t)v89;
      goto LABEL_23;
    case 8:
      char v138 = 8;
      sub_24F252184();
      uint64_t v66 = v118;
      uint64_t v67 = v128;
      sub_24F274CC0();
      if (v67) {
        goto LABEL_28;
      }
      (*(void (**)(char *, uint64_t))(v105 + 8))(v66, v106);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v15, v37);
      uint64_t v41 = (uint64_t)v89;
      goto LABEL_23;
    case 9:
      char v139 = 9;
      sub_24F252130();
      uint64_t v70 = v128;
      sub_24F274CC0();
      if (v70) {
        goto LABEL_28;
      }
      uint64_t v71 = v15;
      uint64_t v72 = v37;
      uint64_t v73 = v107;
      uint64_t v74 = sub_24F274D20();
      uint64_t v75 = v120;
      uint64_t v82 = v81;
      (*(void (**)(char *, uint64_t))(v110 + 8))(v35, v73);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v75 + 8))(v71, v72);
      uint64_t v83 = v86;
      *uint64_t v86 = v74;
      v83[1] = v82;
      swift_storeEnumTagMultiPayload();
      uint64_t v51 = (uint64_t)v83;
      goto LABEL_33;
    case 0xA:
      char v140 = 10;
      sub_24F2520DC();
      uint64_t v76 = v34;
      uint64_t v77 = v128;
      sub_24F274CC0();
      if (v77) {
        goto LABEL_28;
      }
      sub_24F273900();
      sub_24F253780(&qword_2699CA540, MEMORY[0x263F06EA8]);
      uint64_t v54 = (uint64_t)v88;
      uint64_t v79 = v108;
      sub_24F274D60();
      uint64_t v80 = v120;
      (*(void (**)(char *, uint64_t))(v111 + 8))(v76, v79);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v80 + 8))(v15, v37);
LABEL_32:
      swift_storeEnumTagMultiPayload();
      uint64_t v51 = v54;
LABEL_33:
      uint64_t v41 = (uint64_t)v89;
      sub_24F253718(v51, (uint64_t)v89, (uint64_t (*)(void))type metadata accessor for ProgramDetailAction);
      goto LABEL_24;
    default:
      char v129 = 0;
      sub_24F252424();
      uint64_t v39 = v112;
      uint64_t v40 = v128;
      sub_24F274CC0();
      if (v40)
      {
LABEL_28:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v120 + 8))(v15, v37);
        goto LABEL_29;
      }
      (*(void (**)(char *, uint64_t))(v90 + 8))(v39, v91);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v15, v37);
      uint64_t v41 = (uint64_t)v89;
LABEL_23:
      swift_storeEnumTagMultiPayload();
LABEL_24:
      uint64_t v68 = (uint64_t)v127;
      sub_24F253718(v41, v119, (uint64_t (*)(void))type metadata accessor for ProgramDetailAction);
      uint64_t v69 = v68;
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v69);
}

uint64_t sub_24F253718(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F253780(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24F2537C8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ProgramDetailAction.init(from:)(a1, a2);
}

uint64_t sub_24F2537E0(void *a1)
{
  return ProgramDetailAction.encode(to:)(a1);
}

void *initializeBufferWithCopyOfBuffer for ProgramDetailAction(void *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *(void *)a2;
    *a1 = *(void *)a2;
    a1 = (void *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 3:
        uint64_t v25 = sub_24F273900();
        (*(void (**)(void *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(a1, a2, v25);
        swift_storeEnumTagMultiPayload();
        break;
      case 2:
        uint64_t v26 = *((void *)a2 + 1);
        *a1 = *(void *)a2;
        a1[1] = v26;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 1:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
        if (swift_getEnumCaseMultiPayload() == 1) {
          uint64_t v8 = (uint64_t *)&unk_2699CB450;
        }
        else {
          uint64_t v8 = (uint64_t *)&unk_2699CB448;
        }
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(v8);
        (*(void (**)(void *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        swift_storeEnumTagMultiPayload();
        uint64_t v10 = (int *)type metadata accessor for WorkoutProgram();
        uint64_t v11 = v10[5];
        uint64_t v12 = (char *)a1 + v11;
        uint64_t v13 = &a2[v11];
        uint64_t v44 = sub_24F2737E0();
        int v46 = (void (**)(char *, char *))(*(void *)(v44 - 8) + 16);
        uint64_t v42 = *(void *)(v44 - 8);
        uint64_t v43 = *v46;
        (*v46)(v12, v13);
        uint64_t v14 = v10[6];
        uint64_t v15 = (void *)((char *)a1 + v14);
        uint64_t v16 = &a2[v14];
        uint64_t v17 = *((void *)v16 + 1);
        *uint64_t v15 = *(void *)v16;
        v15[1] = v17;
        *(void *)((char *)a1 + v10[7]) = *(void *)&a2[v10[7]];
        uint64_t v18 = v10[8];
        __dst = (void *)((char *)a1 + v18);
        uint64_t v19 = &a2[v18];
        uint64_t v20 = type metadata accessor for WorkoutProgramPreview();
        uint64_t v41 = *(void *)(v20 - 8);
        uint64_t v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v21(v19, 1, v20))
        {
          uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8);
          memcpy(__dst, v19, *(void *)(*(void *)(v22 - 8) + 64));
        }
        else
        {
          uint64_t v27 = *((void *)v19 + 1);
          void *__dst = *(void *)v19;
          __dst[1] = v27;
          uint64_t v28 = *(int *)(v20 + 20);
          uint64_t v39 = &v19[v28];
          uint64_t v40 = (char *)__dst + v28;
          uint64_t v29 = sub_24F273900();
          uint64_t v30 = *(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16);
          swift_bridgeObjectRetain();
          v30(v40, v39, v29);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v41 + 56))(__dst, 0, 1, v20);
        }
        uint64_t v31 = v10[9];
        uint64_t v32 = (char *)a1 + v31;
        uint64_t v33 = &a2[v31];
        uint64_t v34 = sub_24F273900();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
        uint64_t v35 = v10[10];
        uint64_t v36 = (char *)a1 + v35;
        uint64_t v37 = &a2[v35];
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(&a2[v35], 1, v44))
        {
          uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
          memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
        }
        else
        {
          ((void (*)(char *, char *, uint64_t))v43)(v36, v37, v44);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v36, 0, 1, v44);
        }
        ((void (*)(char *, char *, uint64_t))v43)((char *)a1 + v10[11], &a2[v10[11]], v44);
        ((void (*)(char *, char *, uint64_t))v43)((char *)a1 + v10[12], &a2[v10[12]], v44);
        *(void *)((char *)a1 + v10[13]) = *(void *)&a2[v10[13]];
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for ProgramDetailAction(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 3)
  {
    uint64_t v17 = sub_24F273900();
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8);
    return v18(a1, v17);
  }
  else
  {
    if (result != 2)
    {
      if (result != 1) {
        return result;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v3 = (uint64_t *)&unk_2699CB450;
      }
      else {
        uint64_t v3 = (uint64_t *)&unk_2699CB448;
      }
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(v3);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
      int v5 = (int *)type metadata accessor for WorkoutProgram();
      uint64_t v6 = a1 + v5[5];
      uint64_t v7 = sub_24F2737E0();
      uint64_t v8 = *(void *)(v7 - 8);
      uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
      v9(v6, v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v10 = a1 + v5[8];
      uint64_t v11 = type metadata accessor for WorkoutProgramPreview();
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11))
      {
        swift_bridgeObjectRelease();
        uint64_t v12 = v10 + *(int *)(v11 + 20);
        uint64_t v13 = sub_24F273900();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
      }
      uint64_t v14 = a1 + v5[9];
      uint64_t v15 = sub_24F273900();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
      uint64_t v16 = a1 + v5[10];
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v16, 1, v7)) {
        v9(v16, v7);
      }
      v9(a1 + v5[11], v7);
      v9(a1 + v5[12], v7);
    }
    return swift_bridgeObjectRelease();
  }
}

void *initializeWithCopy for ProgramDetailAction(void *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      uint64_t v22 = sub_24F273900();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(a1, a2, v22);
LABEL_17:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 2:
      uint64_t v23 = *((void *)a2 + 1);
      *a1 = *(void *)a2;
      a1[1] = v23;
      swift_bridgeObjectRetain();
      goto LABEL_17;
    case 1:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v7 = (uint64_t *)&unk_2699CB450;
      }
      else {
        uint64_t v7 = (uint64_t *)&unk_2699CB448;
      }
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(v7);
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
      uint64_t v9 = (int *)type metadata accessor for WorkoutProgram();
      uint64_t v10 = v9[5];
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = &a2[v10];
      uint64_t v42 = sub_24F2737E0();
      uint64_t v44 = (void (**)(char *, char *))(*(void *)(v42 - 8) + 16);
      uint64_t v40 = *(void *)(v42 - 8);
      uint64_t v41 = *v44;
      (*v44)(v11, v12);
      uint64_t v13 = v9[6];
      uint64_t v14 = (void *)((char *)a1 + v13);
      uint64_t v15 = &a2[v13];
      uint64_t v16 = *((void *)v15 + 1);
      *uint64_t v14 = *(void *)v15;
      v14[1] = v16;
      *(void *)((char *)a1 + v9[7]) = *(void *)&a2[v9[7]];
      uint64_t v17 = v9[8];
      __dst = (void *)((char *)a1 + v17);
      uint64_t v18 = &a2[v17];
      uint64_t v19 = type metadata accessor for WorkoutProgramPreview();
      uint64_t v39 = *(void *)(v19 - 8);
      uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v20(v18, 1, v19))
      {
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8);
        memcpy(__dst, v18, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        uint64_t v24 = *((void *)v18 + 1);
        void *__dst = *(void *)v18;
        __dst[1] = v24;
        uint64_t v25 = *(int *)(v19 + 20);
        uint64_t v37 = &v18[v25];
        uint64_t v38 = (char *)__dst + v25;
        uint64_t v26 = sub_24F273900();
        uint64_t v27 = *(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16);
        swift_bridgeObjectRetain();
        v27(v38, v37, v26);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v39 + 56))(__dst, 0, 1, v19);
      }
      uint64_t v28 = v9[9];
      uint64_t v29 = (char *)a1 + v28;
      uint64_t v30 = &a2[v28];
      uint64_t v31 = sub_24F273900();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
      uint64_t v32 = v9[10];
      uint64_t v33 = (char *)a1 + v32;
      uint64_t v34 = &a2[v32];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(&a2[v32], 1, v42))
      {
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
        memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
      }
      else
      {
        ((void (*)(char *, char *, uint64_t))v41)(v33, v34, v42);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v33, 0, 1, v42);
      }
      ((void (*)(char *, char *, uint64_t))v41)((char *)a1 + v9[11], &a2[v9[11]], v42);
      ((void (*)(char *, char *, uint64_t))v41)((char *)a1 + v9[12], &a2[v9[12]], v42);
      *(void *)((char *)a1 + v9[13]) = *(void *)&a2[v9[13]];
      swift_bridgeObjectRetain();
      goto LABEL_17;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void *assignWithCopy for ProgramDetailAction(void *a1, char *a2, uint64_t a3)
{
  if (a1 == (void *)a2) {
    return a1;
  }
  sub_24F254944((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for ProgramDetailAction);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      uint64_t v22 = sub_24F273900();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(a1, a2, v22);
LABEL_18:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 2:
      *a1 = *(void *)a2;
      a1[1] = *((void *)a2 + 1);
      swift_bridgeObjectRetain();
      goto LABEL_18;
    case 1:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v7 = (uint64_t *)&unk_2699CB450;
      }
      else {
        uint64_t v7 = (uint64_t *)&unk_2699CB448;
      }
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(v7);
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
      uint64_t v9 = (int *)type metadata accessor for WorkoutProgram();
      uint64_t v10 = v9[5];
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = &a2[v10];
      uint64_t v13 = sub_24F2737E0();
      uint64_t v41 = (void (**)(char *, char *))(*(void *)(v13 - 8) + 16);
      uint64_t v42 = v13;
      uint64_t v39 = *(void *)(v13 - 8);
      uint64_t v40 = *v41;
      (*v41)(v11, v12);
      uint64_t v14 = v9[6];
      uint64_t v15 = (void *)((char *)a1 + v14);
      uint64_t v16 = &a2[v14];
      *uint64_t v15 = *(void *)v16;
      v15[1] = *((void *)v16 + 1);
      *(void *)((char *)a1 + v9[7]) = *(void *)&a2[v9[7]];
      uint64_t v17 = v9[8];
      __dst = (void *)((char *)a1 + v17);
      uint64_t v18 = &a2[v17];
      uint64_t v19 = type metadata accessor for WorkoutProgramPreview();
      uint64_t v37 = *(void *)(v19 - 8);
      uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v20(v18, 1, v19))
      {
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8);
        memcpy(__dst, v18, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        void *__dst = *(void *)v18;
        __dst[1] = *((void *)v18 + 1);
        uint64_t v23 = *(int *)(v19 + 20);
        uint64_t v35 = &v18[v23];
        uint64_t v36 = (char *)__dst + v23;
        uint64_t v24 = sub_24F273900();
        uint64_t v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
        swift_bridgeObjectRetain();
        v25(v36, v35, v24);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v37 + 56))(__dst, 0, 1, v19);
      }
      uint64_t v26 = v9[9];
      uint64_t v27 = (char *)a1 + v26;
      uint64_t v28 = &a2[v26];
      uint64_t v29 = sub_24F273900();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
      uint64_t v30 = v9[10];
      uint64_t v31 = (char *)a1 + v30;
      uint64_t v32 = &a2[v30];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(&a2[v30], 1, v42))
      {
        uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
        memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
      }
      else
      {
        ((void (*)(char *, char *, uint64_t))v40)(v31, v32, v42);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v31, 0, 1, v42);
      }
      ((void (*)(char *, char *, uint64_t))v40)((char *)a1 + v9[11], &a2[v9[11]], v42);
      ((void (*)(char *, char *, uint64_t))v40)((char *)a1 + v9[12], &a2[v9[12]], v42);
      *(void *)((char *)a1 + v9[13]) = *(void *)&a2[v9[13]];
      swift_bridgeObjectRetain();
      goto LABEL_18;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

uint64_t sub_24F254944(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *initializeWithTake for ProgramDetailAction(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v20 = sub_24F273900();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(a1, a2, v20);
LABEL_15:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (EnumCaseMultiPayload == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v7 = (uint64_t *)&unk_2699CB450;
    }
    else {
      uint64_t v7 = (uint64_t *)&unk_2699CB448;
    }
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(v7);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = (int *)type metadata accessor for WorkoutProgram();
    uint64_t v10 = v9[5];
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    uint64_t v13 = sub_24F2737E0();
    uint64_t v36 = *(void *)(v13 - 8);
    uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
    v37(v11, v12, v13);
    *(_OWORD *)&a1[v9[6]] = *(_OWORD *)&a2[v9[6]];
    *(void *)&a1[v9[7]] = *(void *)&a2[v9[7]];
    uint64_t v14 = v9[8];
    uint64_t v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    uint64_t v17 = type metadata accessor for WorkoutProgramPreview();
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
      uint64_t v21 = *(int *)(v17 + 20);
      uint64_t v35 = &v15[v21];
      uint64_t v22 = &v16[v21];
      uint64_t v23 = sub_24F273900();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v35, v22, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    uint64_t v24 = v9[9];
    uint64_t v25 = &a1[v24];
    uint64_t v26 = &a2[v24];
    uint64_t v27 = sub_24F273900();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
    uint64_t v28 = v9[10];
    uint64_t v29 = &a1[v28];
    uint64_t v30 = &a2[v28];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(&a2[v28], 1, v13))
    {
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
      uint64_t v32 = v37;
    }
    else
    {
      uint64_t v33 = v30;
      uint64_t v32 = v37;
      v37(v29, v33, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v29, 0, 1, v13);
    }
    v37(&a1[v9[11]], &a2[v9[11]], v13);
    v32(&a1[v9[12]], &a2[v9[12]], v13);
    *(void *)&a1[v9[13]] = *(void *)&a2[v9[13]];
    goto LABEL_15;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *assignWithTake for ProgramDetailAction(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24F254944((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for ProgramDetailAction);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v20 = sub_24F273900();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(a1, a2, v20);
LABEL_16:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (EnumCaseMultiPayload == 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v7 = (uint64_t *)&unk_2699CB450;
      }
      else {
        uint64_t v7 = (uint64_t *)&unk_2699CB448;
      }
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(v7);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
      uint64_t v9 = (int *)type metadata accessor for WorkoutProgram();
      uint64_t v10 = v9[5];
      uint64_t v11 = &a1[v10];
      uint64_t v12 = &a2[v10];
      uint64_t v13 = sub_24F2737E0();
      uint64_t v36 = *(void *)(v13 - 8);
      uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
      v37(v11, v12, v13);
      *(_OWORD *)&a1[v9[6]] = *(_OWORD *)&a2[v9[6]];
      *(void *)&a1[v9[7]] = *(void *)&a2[v9[7]];
      uint64_t v14 = v9[8];
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      uint64_t v17 = type metadata accessor for WorkoutProgramPreview();
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
      {
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8);
        memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
        uint64_t v21 = *(int *)(v17 + 20);
        uint64_t v35 = &v15[v21];
        uint64_t v22 = &v16[v21];
        uint64_t v23 = sub_24F273900();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v35, v22, v23);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      }
      uint64_t v24 = v9[9];
      uint64_t v25 = &a1[v24];
      uint64_t v26 = &a2[v24];
      uint64_t v27 = sub_24F273900();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
      uint64_t v28 = v9[10];
      uint64_t v29 = &a1[v28];
      uint64_t v30 = &a2[v28];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(&a2[v28], 1, v13))
      {
        uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
        memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
        uint64_t v32 = v37;
      }
      else
      {
        uint64_t v33 = v30;
        uint64_t v32 = v37;
        v37(v29, v33, v13);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v29, 0, 1, v13);
      }
      v37(&a1[v9[11]], &a2[v9[11]], v13);
      v32(&a1[v9[12]], &a2[v9[12]], v13);
      *(void *)&a1[v9[13]] = *(void *)&a2[v9[13]];
      goto LABEL_16;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_24F255230()
{
  uint64_t result = type metadata accessor for WorkoutProgram();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24F273900();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ProgramDetailAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ProgramDetailAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *uint64_t result = a2 + 10;
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
        JUMPOUT(0x24F255464);
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
          *uint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.CodingKeys()
{
  return &type metadata for ProgramDetailAction.CodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.DismissRemoveFromLibraryAlertCodingKeys()
{
  return &type metadata for ProgramDetailAction.DismissRemoveFromLibraryAlertCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.ViewDidAppearCodingKeys()
{
  return &type metadata for ProgramDetailAction.ViewDidAppearCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.LibraryStateUpdatedCodingKeys()
{
  return &type metadata for ProgramDetailAction.LibraryStateUpdatedCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.LoadedProgramDetailCodingKeys()
{
  return &type metadata for ProgramDetailAction.LoadedProgramDetailCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.AddToLibraryTappedCodingKeys()
{
  return &type metadata for ProgramDetailAction.AddToLibraryTappedCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.ShareProgramTappedCodingKeys()
{
  return &type metadata for ProgramDetailAction.ShareProgramTappedCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.RemoveFromLibraryConfirmationTappedCodingKeys()
{
  return &type metadata for ProgramDetailAction.RemoveFromLibraryConfirmationTappedCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.WatchFilmTappedCodingKeys()
{
  return &type metadata for ProgramDetailAction.WatchFilmTappedCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.MoreTappedCodingKeys()
{
  return &type metadata for ProgramDetailAction.MoreTappedCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.NavigateToWorkoutDetailCodingKeys()
{
  return &type metadata for ProgramDetailAction.NavigateToWorkoutDetailCodingKeys;
}

unsigned char *_s20FitnessProductDetail19ProgramDetailActionO29LibraryStateUpdatedCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24F2555DCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailAction.LinkTappedCodingKeys()
{
  return &type metadata for ProgramDetailAction.LinkTappedCodingKeys;
}

unint64_t sub_24F255618()
{
  unint64_t result = qword_2699CCAF8;
  if (!qword_2699CCAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCAF8);
  }
  return result;
}

unint64_t sub_24F255670()
{
  unint64_t result = qword_2699CCB00;
  if (!qword_2699CCB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB00);
  }
  return result;
}

unint64_t sub_24F2556C8()
{
  unint64_t result = qword_2699CCB08;
  if (!qword_2699CCB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB08);
  }
  return result;
}

unint64_t sub_24F255720()
{
  unint64_t result = qword_2699CCB10;
  if (!qword_2699CCB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB10);
  }
  return result;
}

unint64_t sub_24F255778()
{
  unint64_t result = qword_2699CCB18;
  if (!qword_2699CCB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB18);
  }
  return result;
}

unint64_t sub_24F2557D0()
{
  unint64_t result = qword_2699CCB20;
  if (!qword_2699CCB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB20);
  }
  return result;
}

unint64_t sub_24F255828()
{
  unint64_t result = qword_2699CCB28;
  if (!qword_2699CCB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB28);
  }
  return result;
}

unint64_t sub_24F255880()
{
  unint64_t result = qword_2699CCB30;
  if (!qword_2699CCB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB30);
  }
  return result;
}

unint64_t sub_24F2558D8()
{
  unint64_t result = qword_2699CCB38;
  if (!qword_2699CCB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB38);
  }
  return result;
}

unint64_t sub_24F255930()
{
  unint64_t result = qword_2699CCB40;
  if (!qword_2699CCB40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB40);
  }
  return result;
}

unint64_t sub_24F255988()
{
  unint64_t result = qword_2699CCB48;
  if (!qword_2699CCB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB48);
  }
  return result;
}

unint64_t sub_24F2559E0()
{
  unint64_t result = qword_2699CCB50;
  if (!qword_2699CCB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB50);
  }
  return result;
}

unint64_t sub_24F255A38()
{
  unint64_t result = qword_2699CCB58;
  if (!qword_2699CCB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB58);
  }
  return result;
}

unint64_t sub_24F255A90()
{
  unint64_t result = qword_2699CCB60;
  if (!qword_2699CCB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB60);
  }
  return result;
}

unint64_t sub_24F255AE8()
{
  unint64_t result = qword_2699CCB68;
  if (!qword_2699CCB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB68);
  }
  return result;
}

unint64_t sub_24F255B40()
{
  unint64_t result = qword_2699CCB70;
  if (!qword_2699CCB70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB70);
  }
  return result;
}

unint64_t sub_24F255B98()
{
  unint64_t result = qword_2699CCB78;
  if (!qword_2699CCB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB78);
  }
  return result;
}

unint64_t sub_24F255BF0()
{
  unint64_t result = qword_2699CCB80;
  if (!qword_2699CCB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB80);
  }
  return result;
}

unint64_t sub_24F255C48()
{
  unint64_t result = qword_2699CCB88;
  if (!qword_2699CCB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB88);
  }
  return result;
}

unint64_t sub_24F255CA0()
{
  unint64_t result = qword_2699CCB90;
  if (!qword_2699CCB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB90);
  }
  return result;
}

unint64_t sub_24F255CF8()
{
  unint64_t result = qword_2699CCB98;
  if (!qword_2699CCB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCB98);
  }
  return result;
}

unint64_t sub_24F255D50()
{
  unint64_t result = qword_2699CCBA0;
  if (!qword_2699CCBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCBA0);
  }
  return result;
}

unint64_t sub_24F255DA8()
{
  unint64_t result = qword_2699CCBA8;
  if (!qword_2699CCBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCBA8);
  }
  return result;
}

unint64_t sub_24F255E00()
{
  unint64_t result = qword_2699CCBB0;
  if (!qword_2699CCBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCBB0);
  }
  return result;
}

unint64_t sub_24F255E58()
{
  unint64_t result = qword_2699CCBB8;
  if (!qword_2699CCBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCBB8);
  }
  return result;
}

unint64_t sub_24F255EB0()
{
  unint64_t result = qword_2699CCBC0;
  if (!qword_2699CCBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCBC0);
  }
  return result;
}

unint64_t sub_24F255F08()
{
  unint64_t result = qword_2699CCBC8;
  if (!qword_2699CCBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCBC8);
  }
  return result;
}

unint64_t sub_24F255F60()
{
  unint64_t result = qword_2699CCBD0;
  if (!qword_2699CCBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCBD0);
  }
  return result;
}

unint64_t sub_24F255FB8()
{
  unint64_t result = qword_2699CCBD8;
  if (!qword_2699CCBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCBD8);
  }
  return result;
}

uint64_t sub_24F25600C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000001DLL && a2 == 0x800000024F284170 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4164694477656976 && a2 == 0xED00007261657070 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024F284190 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024F2841B0 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024F2841D0 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024F2841F0 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000023 && a2 == 0x800000024F284210 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6C69466863746177 && a2 == 0xEF6465707061546DLL || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x7070615465726F6DLL && a2 == 0xEA00000000006465 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000024F284240 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x707061546B6E696CLL && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else
  {
    char v5 = sub_24F274E20();
    swift_bridgeObjectRelease();
    if (v5) {
      return 10;
    }
    else {
      return 11;
    }
  }
}

uint64_t sub_24F256450(uint64_t a1, uint64_t a2)
{
  if (a1 == 7107189 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24F274E20();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24F2564C8()
{
  return 7107189;
}

BOOL static WorkoutDetailDynamicTypeSize.< infix(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  return a1 < a2;
}

BOOL static WorkoutDetailDynamicTypeSize.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

unint64_t sub_24F2564F8(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6C6C616D73;
      break;
    case 2:
      unint64_t result = 0x6D756964656DLL;
      break;
    case 3:
      unint64_t result = 0x656772616CLL;
      break;
    case 4:
      unint64_t result = 0x72614C6172747865;
      break;
    case 5:
      unint64_t result = 0x7478456172747865;
      break;
    case 6:
      return result;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      unint64_t result = 0x6269737365636361;
      break;
    default:
      unint64_t result = 0x616D536172747865;
      break;
  }
  return result;
}

uint64_t sub_24F256668(uint64_t a1)
{
  unint64_t v2 = sub_24F257968();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2566A4(uint64_t a1)
{
  unint64_t v2 = sub_24F257968();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F2566E0(uint64_t a1)
{
  unint64_t v2 = sub_24F257914();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F25671C(uint64_t a1)
{
  unint64_t v2 = sub_24F257914();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F256758(uint64_t a1)
{
  unint64_t v2 = sub_24F2578C0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F256794(uint64_t a1)
{
  unint64_t v2 = sub_24F2578C0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F2567D0(uint64_t a1)
{
  unint64_t v2 = sub_24F25786C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F25680C(uint64_t a1)
{
  unint64_t v2 = sub_24F25786C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F256848(uint64_t a1)
{
  unint64_t v2 = sub_24F257818();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F256884(uint64_t a1)
{
  unint64_t v2 = sub_24F257818();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_24F2568C0()
{
  return sub_24F2564F8(*v0);
}

uint64_t sub_24F2568C8(uint64_t a1)
{
  unint64_t v2 = sub_24F2577C4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F256904(uint64_t a1)
{
  unint64_t v2 = sub_24F2577C4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F256940(uint64_t a1)
{
  unint64_t v2 = sub_24F2579BC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F25697C(uint64_t a1)
{
  unint64_t v2 = sub_24F2579BC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F2569B8(uint64_t a1)
{
  unint64_t v2 = sub_24F257A10();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2569F4(uint64_t a1)
{
  unint64_t v2 = sub_24F257A10();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F256A30(uint64_t a1)
{
  unint64_t v2 = sub_24F257A64();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F256A6C(uint64_t a1)
{
  unint64_t v2 = sub_24F257A64();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F256AA8(uint64_t a1)
{
  unint64_t v2 = sub_24F257BB4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F256AE4(uint64_t a1)
{
  unint64_t v2 = sub_24F257BB4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F256B20(uint64_t a1)
{
  unint64_t v2 = sub_24F257AB8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F256B5C(uint64_t a1)
{
  unint64_t v2 = sub_24F257AB8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F256B98(uint64_t a1)
{
  unint64_t v2 = sub_24F257B0C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F256BD4(uint64_t a1)
{
  unint64_t v2 = sub_24F257B0C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F256C10(uint64_t a1)
{
  unint64_t v2 = sub_24F257B60();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F256C4C(uint64_t a1)
{
  unint64_t v2 = sub_24F257B60();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WorkoutDetailDynamicTypeSize.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v71 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCBE0);
  uint64_t v69 = *(void *)(v3 - 8);
  uint64_t v70 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v68 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCBE8);
  uint64_t v66 = *(void *)(v5 - 8);
  uint64_t v67 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v65 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCBF0);
  uint64_t v63 = *(void *)(v7 - 8);
  uint64_t v64 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v62 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCBF8);
  uint64_t v60 = *(void *)(v9 - 8);
  uint64_t v61 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v59 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCC00);
  uint64_t v57 = *(void *)(v11 - 8);
  uint64_t v58 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v56 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCC08);
  uint64_t v54 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v53 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCC10);
  uint64_t v51 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v50 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCC18);
  uint64_t v48 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v47 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCC20);
  uint64_t v45 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v44 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCC28);
  uint64_t v42 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCC30);
  uint64_t v41 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCC38);
  uint64_t v40 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCC40);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v72 = v25;
  uint64_t v73 = v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v39 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F2577C4();
  sub_24F274EA0();
  switch((char)v71)
  {
    case 1:
      char v75 = 1;
      sub_24F257B60();
      uint64_t v31 = v72;
      sub_24F274D80();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v21, v19);
      goto LABEL_15;
    case 2:
      char v76 = 2;
      sub_24F257B0C();
      uint64_t v31 = v72;
      sub_24F274D80();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v18, v43);
      goto LABEL_15;
    case 3:
      char v77 = 3;
      sub_24F257AB8();
      uint64_t v32 = v44;
      uint64_t v31 = v72;
      sub_24F274D80();
      (*(void (**)(char *, uint64_t))(v45 + 8))(v32, v46);
      goto LABEL_15;
    case 4:
      char v78 = 4;
      sub_24F257A64();
      uint64_t v33 = v47;
      uint64_t v31 = v72;
      sub_24F274D80();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v33, v49);
      goto LABEL_15;
    case 5:
      char v79 = 5;
      sub_24F257A10();
      uint64_t v34 = v50;
      uint64_t v31 = v72;
      sub_24F274D80();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v34, v52);
      goto LABEL_15;
    case 6:
      char v80 = 6;
      sub_24F2579BC();
      uint64_t v35 = v53;
      uint64_t v31 = v72;
      sub_24F274D80();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v35, v55);
      goto LABEL_15;
    case 7:
      char v81 = 7;
      sub_24F257968();
      uint64_t v36 = v56;
      uint64_t v31 = v72;
      sub_24F274D80();
      uint64_t v38 = v57;
      uint64_t v37 = v58;
      goto LABEL_14;
    case 8:
      char v82 = 8;
      sub_24F257914();
      uint64_t v36 = v59;
      uint64_t v31 = v72;
      sub_24F274D80();
      uint64_t v38 = v60;
      uint64_t v37 = v61;
      goto LABEL_14;
    case 9:
      char v83 = 9;
      sub_24F2578C0();
      uint64_t v36 = v62;
      uint64_t v31 = v72;
      sub_24F274D80();
      uint64_t v38 = v63;
      uint64_t v37 = v64;
      goto LABEL_14;
    case 10:
      char v84 = 10;
      sub_24F25786C();
      uint64_t v36 = v65;
      uint64_t v31 = v72;
      sub_24F274D80();
      uint64_t v38 = v66;
      uint64_t v37 = v67;
      goto LABEL_14;
    case 11:
      char v85 = 11;
      sub_24F257818();
      uint64_t v36 = v68;
      uint64_t v31 = v72;
      sub_24F274D80();
      uint64_t v38 = v69;
      uint64_t v37 = v70;
LABEL_14:
      (*(void (**)(char *, uint64_t))(v38 + 8))(v36, v37);
LABEL_15:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v28, v31);
      break;
    default:
      char v74 = 0;
      sub_24F257BB4();
      uint64_t v29 = v72;
      sub_24F274D80();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v24, v22);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v28, v29);
      break;
  }
  return result;
}

unint64_t sub_24F2577C4()
{
  unint64_t result = qword_2699CCC48;
  if (!qword_2699CCC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCC48);
  }
  return result;
}

unint64_t sub_24F257818()
{
  unint64_t result = qword_2699CCC50;
  if (!qword_2699CCC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCC50);
  }
  return result;
}

unint64_t sub_24F25786C()
{
  unint64_t result = qword_2699CCC58;
  if (!qword_2699CCC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCC58);
  }
  return result;
}

unint64_t sub_24F2578C0()
{
  unint64_t result = qword_2699CCC60;
  if (!qword_2699CCC60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCC60);
  }
  return result;
}

unint64_t sub_24F257914()
{
  unint64_t result = qword_2699CCC68;
  if (!qword_2699CCC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCC68);
  }
  return result;
}

unint64_t sub_24F257968()
{
  unint64_t result = qword_2699CCC70;
  if (!qword_2699CCC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCC70);
  }
  return result;
}

unint64_t sub_24F2579BC()
{
  unint64_t result = qword_2699CCC78;
  if (!qword_2699CCC78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCC78);
  }
  return result;
}

unint64_t sub_24F257A10()
{
  unint64_t result = qword_2699CCC80;
  if (!qword_2699CCC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCC80);
  }
  return result;
}

unint64_t sub_24F257A64()
{
  unint64_t result = qword_2699CCC88;
  if (!qword_2699CCC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCC88);
  }
  return result;
}

unint64_t sub_24F257AB8()
{
  unint64_t result = qword_2699CCC90;
  if (!qword_2699CCC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCC90);
  }
  return result;
}

unint64_t sub_24F257B0C()
{
  unint64_t result = qword_2699CCC98;
  if (!qword_2699CCC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCC98);
  }
  return result;
}

unint64_t sub_24F257B60()
{
  unint64_t result = qword_2699CCCA0;
  if (!qword_2699CCCA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCCA0);
  }
  return result;
}

unint64_t sub_24F257BB4()
{
  unint64_t result = qword_2699CCCA8;
  if (!qword_2699CCCA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCCA8);
  }
  return result;
}

uint64_t WorkoutDetailDynamicTypeSize.init(from:)(void *a1)
{
  return sub_24F257CD8(a1);
}

uint64_t sub_24F257C20@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_24F257CD8(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_24F257C4C(void *a1)
{
  return WorkoutDetailDynamicTypeSize.encode(to:)(a1, *v1);
}

uint64_t WorkoutDetailDynamicTypeSize.hash(into:)()
{
  return sub_24F274E50();
}

uint64_t WorkoutDetailDynamicTypeSize.hashValue.getter()
{
  return sub_24F274E80();
}

uint64_t sub_24F257CD8(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCD90);
  uint64_t v69 = *(void *)(v2 - 8);
  uint64_t v70 = v2;
  MEMORY[0x270FA5388](v2);
  char v77 = (char *)v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCD98);
  uint64_t v67 = *(void *)(v4 - 8);
  uint64_t v68 = v4;
  MEMORY[0x270FA5388](v4);
  char v76 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCDA0);
  uint64_t v65 = *(void *)(v6 - 8);
  uint64_t v66 = v6;
  MEMORY[0x270FA5388](v6);
  char v75 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCDA8);
  uint64_t v48 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  char v74 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCDB0);
  uint64_t v63 = *(void *)(v9 - 8);
  uint64_t v64 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v73 = (char *)v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCDB8);
  uint64_t v61 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  char v80 = (char *)v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCDC0);
  uint64_t v60 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  char v79 = (char *)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCDC8);
  uint64_t v57 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  char v78 = (char *)v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCDD0);
  uint64_t v55 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v72 = (char *)v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCDD8);
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v71 = (char *)v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCDE0);
  uint64_t v51 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v17 = (char *)v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCDE8);
  uint64_t v50 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCDF0);
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (uint64_t)v46 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = a1[3];
  char v81 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v25);
  sub_24F2577C4();
  uint64_t v26 = v82;
  sub_24F274E90();
  if (v26) {
    goto LABEL_18;
  }
  uint64_t v47 = v20;
  v46[1] = v18;
  char v82 = v17;
  uint64_t v28 = v78;
  uint64_t v27 = v79;
  uint64_t v29 = v80;
  uint64_t v30 = v24;
  uint64_t v31 = sub_24F274D70();
  if (*(void *)(v31 + 16) != 1)
  {
    uint64_t v24 = sub_24F274C70();
    swift_allocError();
    uint64_t v37 = v36;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA150);
    *uint64_t v37 = &type metadata for WorkoutDetailDynamicTypeSize;
    sub_24F274CD0();
    sub_24F274C60();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v24 - 8) + 104))(v37, *MEMORY[0x263F8DCB0], v24);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v30, v21);
LABEL_18:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
    return v24;
  }
  uint64_t v24 = *(unsigned __int8 *)(v31 + 32);
  switch(*(unsigned char *)(v31 + 32))
  {
    case 1:
      char v84 = 1;
      sub_24F257B60();
      uint64_t v38 = v82;
      sub_24F274CC0();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v51 + 8);
      uint64_t v34 = v38;
      uint64_t v35 = (uint64_t *)&v87;
      goto LABEL_14;
    case 2:
      char v85 = 2;
      sub_24F257B0C();
      uint64_t v39 = v71;
      sub_24F274CC0();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v53 + 8);
      uint64_t v34 = v39;
      uint64_t v35 = (uint64_t *)v88;
      goto LABEL_14;
    case 3:
      char v86 = 3;
      sub_24F257AB8();
      uint64_t v40 = v72;
      sub_24F274CC0();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v55 + 8);
      uint64_t v34 = v40;
      uint64_t v35 = &v89;
      goto LABEL_14;
    case 4:
      v88[0] = 4;
      sub_24F257A64();
      sub_24F274CC0();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v57 + 8);
      uint64_t v34 = v28;
      uint64_t v35 = &v90;
      goto LABEL_14;
    case 5:
      v88[1] = 5;
      sub_24F257A10();
      sub_24F274CC0();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v60 + 8);
      uint64_t v34 = v27;
      uint64_t v35 = &v91;
      goto LABEL_14;
    case 6:
      v88[2] = 6;
      sub_24F2579BC();
      sub_24F274CC0();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v61 + 8);
      uint64_t v34 = v29;
      uint64_t v35 = &v92;
      goto LABEL_14;
    case 7:
      v88[3] = 7;
      sub_24F257968();
      uint64_t v41 = v73;
      sub_24F274CC0();
      uint64_t v43 = v63;
      uint64_t v42 = v64;
      goto LABEL_20;
    case 8:
      v88[4] = 8;
      sub_24F257914();
      uint64_t v44 = v74;
      sub_24F274CC0();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v48 + 8);
      uint64_t v34 = v44;
      uint64_t v35 = (uint64_t *)&v81;
      goto LABEL_14;
    case 9:
      v88[5] = 9;
      sub_24F2578C0();
      uint64_t v41 = v75;
      sub_24F274CC0();
      uint64_t v43 = v65;
      uint64_t v42 = v66;
      goto LABEL_20;
    case 0xA:
      v88[6] = 10;
      sub_24F25786C();
      uint64_t v41 = v76;
      sub_24F274CC0();
      uint64_t v43 = v67;
      uint64_t v42 = v68;
      goto LABEL_20;
    case 0xB:
      v88[7] = 11;
      sub_24F257818();
      uint64_t v41 = v77;
      sub_24F274CC0();
      uint64_t v43 = v69;
      uint64_t v42 = v70;
LABEL_20:
      uint64_t v33 = *(void (**)(char *, uint64_t))(v43 + 8);
      uint64_t v34 = v41;
      break;
    default:
      char v83 = 0;
      sub_24F257BB4();
      uint64_t v32 = v47;
      sub_24F274CC0();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v50 + 8);
      uint64_t v34 = v32;
      uint64_t v35 = (uint64_t *)&v78;
LABEL_14:
      uint64_t v42 = *(v35 - 32);
      break;
  }
  v33(v34, v42);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v30, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
  return v24;
}

unint64_t sub_24F258998()
{
  unint64_t result = qword_2699CCCB0;
  if (!qword_2699CCCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCCB0);
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize()
{
  return &type metadata for WorkoutDetailDynamicTypeSize;
}

unsigned char *_s20FitnessProductDetail28WorkoutDetailDynamicTypeSizeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x24F258ACCLL);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.CodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.ExtraSmallCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.ExtraSmallCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.SmallCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.SmallCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.MediumCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.MediumCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.LargeCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.LargeCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.ExtraLargeCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.ExtraLargeCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.ExtraExtraLargeCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.ExtraExtraLargeCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.ExtraExtraExtraLargeCodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.ExtraExtraExtraLargeCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.Accessibility1CodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.Accessibility1CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.Accessibility2CodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.Accessibility2CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.Accessibility3CodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.Accessibility3CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.Accessibility4CodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.Accessibility4CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailDynamicTypeSize.Accessibility5CodingKeys()
{
  return &type metadata for WorkoutDetailDynamicTypeSize.Accessibility5CodingKeys;
}

unint64_t sub_24F258BC8()
{
  unint64_t result = qword_2699CCCB8;
  if (!qword_2699CCCB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCCB8);
  }
  return result;
}

unint64_t sub_24F258C20()
{
  unint64_t result = qword_2699CCCC0;
  if (!qword_2699CCCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCCC0);
  }
  return result;
}

unint64_t sub_24F258C78()
{
  unint64_t result = qword_2699CCCC8;
  if (!qword_2699CCCC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCCC8);
  }
  return result;
}

unint64_t sub_24F258CD0()
{
  unint64_t result = qword_2699CCCD0;
  if (!qword_2699CCCD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCCD0);
  }
  return result;
}

unint64_t sub_24F258D28()
{
  unint64_t result = qword_2699CCCD8;
  if (!qword_2699CCCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCCD8);
  }
  return result;
}

unint64_t sub_24F258D80()
{
  unint64_t result = qword_2699CCCE0;
  if (!qword_2699CCCE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCCE0);
  }
  return result;
}

unint64_t sub_24F258DD8()
{
  unint64_t result = qword_2699CCCE8;
  if (!qword_2699CCCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCCE8);
  }
  return result;
}

unint64_t sub_24F258E30()
{
  unint64_t result = qword_2699CCCF0;
  if (!qword_2699CCCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCCF0);
  }
  return result;
}

unint64_t sub_24F258E88()
{
  unint64_t result = qword_2699CCCF8;
  if (!qword_2699CCCF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCCF8);
  }
  return result;
}

unint64_t sub_24F258EE0()
{
  unint64_t result = qword_2699CCD00;
  if (!qword_2699CCD00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD00);
  }
  return result;
}

unint64_t sub_24F258F38()
{
  unint64_t result = qword_2699CCD08;
  if (!qword_2699CCD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD08);
  }
  return result;
}

unint64_t sub_24F258F90()
{
  unint64_t result = qword_2699CCD10;
  if (!qword_2699CCD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD10);
  }
  return result;
}

unint64_t sub_24F258FE8()
{
  unint64_t result = qword_2699CCD18;
  if (!qword_2699CCD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD18);
  }
  return result;
}

unint64_t sub_24F259040()
{
  unint64_t result = qword_2699CCD20;
  if (!qword_2699CCD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD20);
  }
  return result;
}

unint64_t sub_24F259098()
{
  unint64_t result = qword_2699CCD28;
  if (!qword_2699CCD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD28);
  }
  return result;
}

unint64_t sub_24F2590F0()
{
  unint64_t result = qword_2699CCD30;
  if (!qword_2699CCD30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD30);
  }
  return result;
}

unint64_t sub_24F259148()
{
  unint64_t result = qword_2699CCD38;
  if (!qword_2699CCD38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD38);
  }
  return result;
}

unint64_t sub_24F2591A0()
{
  unint64_t result = qword_2699CCD40;
  if (!qword_2699CCD40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD40);
  }
  return result;
}

unint64_t sub_24F2591F8()
{
  unint64_t result = qword_2699CCD48;
  if (!qword_2699CCD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD48);
  }
  return result;
}

unint64_t sub_24F259250()
{
  unint64_t result = qword_2699CCD50;
  if (!qword_2699CCD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD50);
  }
  return result;
}

unint64_t sub_24F2592A8()
{
  unint64_t result = qword_2699CCD58;
  if (!qword_2699CCD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD58);
  }
  return result;
}

unint64_t sub_24F259300()
{
  unint64_t result = qword_2699CCD60;
  if (!qword_2699CCD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD60);
  }
  return result;
}

unint64_t sub_24F259358()
{
  unint64_t result = qword_2699CCD68;
  if (!qword_2699CCD68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD68);
  }
  return result;
}

unint64_t sub_24F2593B0()
{
  unint64_t result = qword_2699CCD70;
  if (!qword_2699CCD70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD70);
  }
  return result;
}

unint64_t sub_24F259408()
{
  unint64_t result = qword_2699CCD78;
  if (!qword_2699CCD78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD78);
  }
  return result;
}

unint64_t sub_24F259460()
{
  unint64_t result = qword_2699CCD80;
  if (!qword_2699CCD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD80);
  }
  return result;
}

unint64_t sub_24F2594B8()
{
  unint64_t result = qword_2699CCD88;
  if (!qword_2699CCD88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCD88);
  }
  return result;
}

BOOL static BookmarkStatus.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24F259524(char a1)
{
  if (a1) {
    return 0x62694C6E49746F6ELL;
  }
  else {
    return 0x72617262694C6E69;
  }
}

uint64_t sub_24F259568()
{
  return sub_24F259524(*v0);
}

uint64_t sub_24F259570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F25A394(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F259598(uint64_t a1)
{
  unint64_t v2 = sub_24F2599A4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2595D4(uint64_t a1)
{
  unint64_t v2 = sub_24F2599A4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F259610(uint64_t a1)
{
  unint64_t v2 = sub_24F259A4C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F25964C(uint64_t a1)
{
  unint64_t v2 = sub_24F259A4C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F259688(uint64_t a1)
{
  unint64_t v2 = sub_24F2599F8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2596C4(uint64_t a1)
{
  unint64_t v2 = sub_24F2599F8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BookmarkStatus.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCDF8);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCE00);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCE08);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F2599A4();
  sub_24F274EA0();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24F2599F8();
    uint64_t v14 = v18;
    sub_24F274D80();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24F259A4C();
    sub_24F274D80();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_24F2599A4()
{
  unint64_t result = qword_2699CCE10;
  if (!qword_2699CCE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCE10);
  }
  return result;
}

unint64_t sub_24F2599F8()
{
  unint64_t result = qword_2699CCE18;
  if (!qword_2699CCE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCE18);
  }
  return result;
}

unint64_t sub_24F259A4C()
{
  unint64_t result = qword_2699CCE20;
  if (!qword_2699CCE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCE20);
  }
  return result;
}

uint64_t BookmarkStatus.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCE28);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCE30);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCE38);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F2599A4();
  uint64_t v11 = v32;
  sub_24F274E90();
  if (v11) {
    goto LABEL_6;
  }
  uint64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  uint64_t v14 = v10;
  uint64_t v15 = sub_24F274D70();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24F274C70();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA150);
    *char v22 = &type metadata for BookmarkStatus;
    sub_24F274CD0();
    sub_24F274C60();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_24F2599F8();
    uint64_t v18 = v14;
    sub_24F274CC0();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24F259A4C();
    sub_24F274CC0();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_24F259EF8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return BookmarkStatus.init(from:)(a1, a2);
}

uint64_t sub_24F259F10(void *a1)
{
  return BookmarkStatus.encode(to:)(a1);
}

uint64_t BookmarkStatus.hash(into:)()
{
  return sub_24F274E50();
}

uint64_t BookmarkStatus.hashValue.getter()
{
  return sub_24F274E80();
}

unint64_t sub_24F259FA0()
{
  unint64_t result = qword_2699CCE40;
  if (!qword_2699CCE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCE40);
  }
  return result;
}

ValueMetadata *type metadata accessor for BookmarkStatus()
{
  return &type metadata for BookmarkStatus;
}

unsigned char *_s20FitnessProductDetail14BookmarkStatusOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F25A0D4);
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

ValueMetadata *type metadata accessor for BookmarkStatus.CodingKeys()
{
  return &type metadata for BookmarkStatus.CodingKeys;
}

ValueMetadata *type metadata accessor for BookmarkStatus.InLibraryCodingKeys()
{
  return &type metadata for BookmarkStatus.InLibraryCodingKeys;
}

ValueMetadata *type metadata accessor for BookmarkStatus.NotInLibraryCodingKeys()
{
  return &type metadata for BookmarkStatus.NotInLibraryCodingKeys;
}

unint64_t sub_24F25A130()
{
  unint64_t result = qword_2699CCE48;
  if (!qword_2699CCE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCE48);
  }
  return result;
}

unint64_t sub_24F25A188()
{
  unint64_t result = qword_2699CCE50;
  if (!qword_2699CCE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCE50);
  }
  return result;
}

unint64_t sub_24F25A1E0()
{
  unint64_t result = qword_2699CCE58;
  if (!qword_2699CCE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCE58);
  }
  return result;
}

unint64_t sub_24F25A238()
{
  unint64_t result = qword_2699CCE60;
  if (!qword_2699CCE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCE60);
  }
  return result;
}

unint64_t sub_24F25A290()
{
  unint64_t result = qword_2699CCE68;
  if (!qword_2699CCE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCE68);
  }
  return result;
}

unint64_t sub_24F25A2E8()
{
  unint64_t result = qword_2699CCE70;
  if (!qword_2699CCE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCE70);
  }
  return result;
}

unint64_t sub_24F25A340()
{
  unint64_t result = qword_2699CCE78;
  if (!qword_2699CCE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCE78);
  }
  return result;
}

uint64_t sub_24F25A394(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x72617262694C6E69 && a2 == 0xE900000000000079;
  if (v3 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x62694C6E49746F6ELL && a2 == 0xEC00000079726172)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F274E20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t EditorialExternalLink.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EditorialExternalLink.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for EditorialExternalLink() + 20);
  uint64_t v4 = sub_24F273900();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for EditorialExternalLink()
{
  uint64_t result = qword_2699CCEA0;
  if (!qword_2699CCEA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t EditorialExternalLink.init(name:url:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = a1;
  a4[1] = a2;
  uint64_t v5 = (char *)a4 + *(int *)(type metadata accessor for EditorialExternalLink() + 20);
  uint64_t v6 = sub_24F273900();
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  return v7(v5, a3, v6);
}

uint64_t sub_24F25A60C(char a1)
{
  if (a1) {
    return 7107189;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_24F25A634()
{
  return sub_24F25A60C(*v0);
}

uint64_t sub_24F25A63C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F25B634(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F25A664(uint64_t a1)
{
  unint64_t v2 = sub_24F25A894();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F25A6A0(uint64_t a1)
{
  unint64_t v2 = sub_24F25A894();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t EditorialExternalLink.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCE80);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F25A894();
  sub_24F274EA0();
  v8[15] = 0;
  sub_24F274DD0();
  if (!v1)
  {
    type metadata accessor for EditorialExternalLink();
    v8[14] = 1;
    sub_24F273900();
    sub_24F25B144(&qword_2699CA528, MEMORY[0x263F06EA8]);
    sub_24F274E10();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24F25A894()
{
  unint64_t result = qword_2699CCE88;
  if (!qword_2699CCE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCE88);
  }
  return result;
}

uint64_t EditorialExternalLink.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v24 = sub_24F273900();
  uint64_t v21 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCE90);
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for EditorialExternalLink();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (uint64_t *)((char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F25A894();
  sub_24F274E90();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v19 = v8;
  uint64_t v20 = v5;
  uint64_t v12 = v23;
  uint64_t v11 = v24;
  char v27 = 0;
  uint64_t v13 = v25;
  uint64_t v14 = (uint64_t)v10;
  *uint64_t v10 = sub_24F274D20();
  v10[1] = v15;
  char v26 = 1;
  sub_24F25B144(&qword_2699CA540, MEMORY[0x263F06EA8]);
  char v16 = v20;
  sub_24F274D60();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v14 + *(int *)(v19 + 20), v16, v11);
  sub_24F25ABF4(v14, v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24F25AC58(v14);
}

uint64_t sub_24F25ABF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EditorialExternalLink();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F25AC58(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EditorialExternalLink();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F25ACB4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return EditorialExternalLink.init(from:)(a1, a2);
}

uint64_t sub_24F25ACCC(void *a1)
{
  return EditorialExternalLink.encode(to:)(a1);
}

uint64_t EditorialExternalLink.hash(into:)()
{
  return sub_24F2749E0();
}

uint64_t static EditorialExternalLink.== infix(_:_:)(void *a1, void *a2)
{
  BOOL v2 = *a1 == *a2 && a1[1] == a2[1];
  if (v2 || (sub_24F274E20() & 1) != 0)
  {
    type metadata accessor for EditorialExternalLink();
    JUMPOUT(0x2533568B0);
  }
  return 0;
}

uint64_t EditorialExternalLink.hashValue.getter()
{
  return sub_24F274E80();
}

uint64_t sub_24F25AED0()
{
  return sub_24F274E80();
}

uint64_t sub_24F25AF90()
{
  return sub_24F2749E0();
}

uint64_t sub_24F25B040()
{
  return sub_24F274E80();
}

uint64_t sub_24F25B0FC()
{
  return sub_24F25B144(&qword_2699CCE98, (void (*)(uint64_t))type metadata accessor for EditorialExternalLink);
}

uint64_t sub_24F25B144(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24F25B18C(void *a1, void *a2)
{
  BOOL v2 = *a1 == *a2 && a1[1] == a2[1];
  if (v2 || (sub_24F274E20() & 1) != 0)
  {
    JUMPOUT(0x2533568B0);
  }
  return 0;
}

uint64_t getEnumTagSinglePayload for EditorialExternalLink(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F25B224);
}

uint64_t sub_24F25B224(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_24F273900();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for EditorialExternalLink(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F25B2E8);
}

uint64_t sub_24F25B2E8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24F273900();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24F25B390()
{
  uint64_t result = sub_24F273900();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for EditorialExternalLink.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x24F25B4F4);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EditorialExternalLink.CodingKeys()
{
  return &type metadata for EditorialExternalLink.CodingKeys;
}

unint64_t sub_24F25B530()
{
  unint64_t result = qword_2699CCEB0;
  if (!qword_2699CCEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCEB0);
  }
  return result;
}

unint64_t sub_24F25B588()
{
  unint64_t result = qword_2699CCEB8;
  if (!qword_2699CCEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCEB8);
  }
  return result;
}

unint64_t sub_24F25B5E0()
{
  unint64_t result = qword_2699CCEC0;
  if (!qword_2699CCEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCEC0);
  }
  return result;
}

uint64_t sub_24F25B634(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v3 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7107189 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F274E20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F25B700()
{
  uint64_t v1 = sub_24F273900();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unsigned int v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ProgramDetailFeature.TaskIdentifier();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F260490(v0, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
      sub_24F274E50();
      goto LABEL_5;
    case 3u:
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCEC8);
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, &v7[*(int *)(v9 + 48)], v1);
      sub_24F274E50();
      sub_24F274A70();
      swift_bridgeObjectRelease();
LABEL_5:
      sub_24F261FB0(&qword_2699CA480, MEMORY[0x263F06EA8]);
      sub_24F2749E0();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      break;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
      uint64_t result = sub_24F274E50();
      break;
    default:
      sub_24F274E50();
      sub_24F274A70();
      uint64_t result = swift_bridgeObjectRelease();
      break;
  }
  return result;
}

uint64_t sub_24F25B9AC()
{
  return sub_24F274E80();
}

uint64_t sub_24F25B9F0()
{
  return sub_24F274E80();
}

__n128 ProgramDetailFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 112);
  a2[6] = *(_OWORD *)(a1 + 96);
  a2[7] = v2;
  long long v3 = *(_OWORD *)(a1 + 144);
  a2[8] = *(_OWORD *)(a1 + 128);
  a2[9] = v3;
  long long v4 = *(_OWORD *)(a1 + 48);
  a2[2] = *(_OWORD *)(a1 + 32);
  a2[3] = v4;
  long long v5 = *(_OWORD *)(a1 + 80);
  a2[4] = *(_OWORD *)(a1 + 64);
  a2[5] = v5;
  __n128 result = *(__n128 *)a1;
  long long v7 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v7;
  return result;
}

int *ProgramDetailFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, char *a2, unint64_t *a3, char *a4)
{
  v320 = a4;
  v317 = a3;
  v319 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v290 = (uint64_t)&v285 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v291 = type metadata accessor for WorkoutProgramPreview();
  uint64_t v295 = *(void *)(v291 - 8);
  MEMORY[0x270FA5388](v291);
  uint64_t v288 = (uint64_t)&v285 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v287 = v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v293 = (uint64_t)&v285 - v9;
  uint64_t v313 = sub_24F273900();
  v312 = *(char **)(v313 - 8);
  uint64_t v10 = *((void *)v312 + 8);
  MEMORY[0x270FA5388](v313);
  v304 = (char *)&v285 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v311 = (uint64_t (*)())((char *)&v285 - v12);
  uint64_t v289 = type metadata accessor for WorkoutProgram();
  v307 = *(char **)(v289 - 8);
  uint64_t v13 = *((void *)v307 + 8);
  MEMORY[0x270FA5388](v289);
  uint64_t v286 = (uint64_t)&v285 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v296 = (uint64_t)&v285 - v15;
  MEMORY[0x270FA5388](v16);
  uint64_t v305 = (uint64_t)&v285 - v17;
  MEMORY[0x270FA5388](v18);
  v306 = (void **)((char *)&v285 - v19);
  uint64_t State = type metadata accessor for ProgramDetailLoadState();
  MEMORY[0x270FA5388](State - 8);
  uint64_t v302 = (uint64_t)&v285 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  v297 = (char *)&v285 - v23;
  uint64_t v315 = type metadata accessor for ProgramDetailFeature.TaskIdentifier();
  MEMORY[0x270FA5388](v315);
  v285 = (void **)((char *)&v285 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v25);
  v300 = (char *)&v285 - v26;
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (void **)((char *)&v285 - v28);
  MEMORY[0x270FA5388](v30);
  uint64_t v32 = (char *)&v285 - v31;
  MEMORY[0x270FA5388](v33);
  uint64_t v35 = (char *)&v285 - v34;
  MEMORY[0x270FA5388](v36);
  v301 = (uint64_t (*)(char *, char *, uint64_t))((char *)&v285 - v37);
  MEMORY[0x270FA5388](v38);
  v294 = (uint64_t (**)())((char *)&v285 - v39);
  MEMORY[0x270FA5388](v40);
  uint64_t v314 = (uint64_t)&v285 - v41;
  MEMORY[0x270FA5388](v42);
  uint64_t v44 = (char *)&v285 - v43;
  uint64_t v316 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA8A0);
  uint64_t v318 = *(void *)(v316 - 8);
  MEMORY[0x270FA5388](v316);
  v292 = (char *)&v285 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v46);
  v303 = (char *)&v285 - v47;
  MEMORY[0x270FA5388](v48);
  v308 = (char *)&v285 - v49;
  MEMORY[0x270FA5388](v50);
  v309 = (char *)&v285 - v51;
  MEMORY[0x270FA5388](v52);
  v298 = (char *)&v285 - v53;
  MEMORY[0x270FA5388](v54);
  v310 = (char *)&v285 - v55;
  MEMORY[0x270FA5388](v56);
  v299 = (char *)&v285 - v57;
  MEMORY[0x270FA5388](v58);
  uint64_t v60 = (char *)&v285 - v59;
  uint64_t v61 = type metadata accessor for ProgramDetailAction();
  MEMORY[0x270FA5388](v61);
  uint64_t v63 = (uint64_t *)((char *)&v285 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0));
  long long v64 = v4[7];
  long long v327 = v4[6];
  long long v328 = v64;
  long long v65 = v4[9];
  long long v329 = v4[8];
  long long v330 = v65;
  long long v66 = v4[3];
  long long v323 = v4[2];
  long long v324 = v66;
  long long v67 = v4[5];
  long long v325 = v4[4];
  long long v326 = v67;
  long long v68 = v4[1];
  long long v321 = *v4;
  long long v322 = v68;
  sub_24F260490((uint64_t)v320, (uint64_t)v63, (uint64_t (*)(void))type metadata accessor for ProgramDetailAction);
  __n128 result = (int *)swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:
      v320 = (char *)type metadata accessor for WorkoutProgram;
      uint64_t v70 = (void (*)(void, void, void))v306;
      sub_24F25DFAC((uint64_t)v63, (uint64_t)v306, (uint64_t (*)(void))type metadata accessor for WorkoutProgram);
      uint64_t v71 = (uint64_t)&v319[*(int *)(type metadata accessor for ProgramDetailState() + 24)];
      sub_24F263A6C(v71, (uint64_t (*)(void))type metadata accessor for ProgramDetailLoadState);
      sub_24F260490((uint64_t)v70, v71, (uint64_t (*)(void))type metadata accessor for WorkoutProgram);
      uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC478);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v71, 0, 2, v72);
      uint64_t v73 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2699CA868);
      char v74 = v310;
      char v75 = &v310[v73[16]];
      char v76 = &v310[v73[20]];
      v319 = &v310[v73[24]];
      uint64_t v77 = (uint64_t)v301;
      swift_storeEnumTagMultiPayload();
      sub_24F260490(v77, v314, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      sub_24F261FB0(&qword_2699CCED0, (void (*)(uint64_t))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      char v78 = v70;
      sub_24F274C10();
      sub_24F263A6C(v77, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      sub_24F274B10();
      uint64_t v79 = *MEMORY[0x263F39590];
      uint64_t v80 = sub_24F274920();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v80 - 8) + 104))(v75, v79, v80);
      uint64_t v81 = *MEMORY[0x263F39570];
      uint64_t v82 = sub_24F274910();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v82 - 8) + 104))(v76, v81, v82);
      uint64_t v83 = v305;
      sub_24F260490((uint64_t)v70, v305, (uint64_t (*)(void))type metadata accessor for WorkoutProgram);
      unint64_t v84 = (v307[80] + 176) & ~(unint64_t)v307[80];
      char v85 = (_OWORD *)swift_allocObject();
      long long v86 = v328;
      v85[7] = v327;
      v85[8] = v86;
      long long v87 = v330;
      v85[9] = v329;
      v85[10] = v87;
      long long v88 = v324;
      v85[3] = v323;
      v85[4] = v88;
      long long v89 = v326;
      v85[5] = v325;
      v85[6] = v89;
      long long v90 = v322;
      v85[1] = v321;
      v85[2] = v90;
      sub_24F25DFAC(v83, (uint64_t)v85 + v84, (uint64_t (*)(void))v320);
      uint64_t v91 = v319;
      *(void *)v319 = &unk_2699CCF30;
      *((void *)v91 + 1) = v85;
      uint64_t v92 = v318;
      uint64_t v93 = v316;
      (*(void (**)(char *, void, uint64_t))(v318 + 104))(v74, *MEMORY[0x263F39530], v316);
      uint64_t v94 = v317;
      unint64_t v95 = *v317;
      sub_24F260A28((uint64_t)&v321);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v95 = sub_24F1BA23C(0, *(void *)(v95 + 16) + 1, 1, v95);
      }
      unint64_t v97 = *(void *)(v95 + 16);
      unint64_t v96 = *(void *)(v95 + 24);
      if (v97 >= v96 >> 1) {
        unint64_t v95 = sub_24F1BA23C(v96 > 1, v97 + 1, 1, v95);
      }
      *(void *)(v95 + 16) = v97 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v92 + 32))(v95+ ((*(unsigned __int8 *)(v92 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80))+ *(void *)(v92 + 72) * v97, v310, v93);
      *uint64_t v94 = v95;
      uint64_t v98 = type metadata accessor for WorkoutProgram;
      uint64_t v99 = (uint64_t)v78;
      return (int *)sub_24F263A6C(v99, (uint64_t (*)(void))v98);
    case 2:
      uint64_t v101 = *v63;
      uint64_t v100 = v63[1];
      uint64_t v102 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2699CA868);
      uint64_t v103 = v308;
      uint64_t v104 = &v308[v102[16]];
      v320 = &v308[v102[20]];
      uint64_t v105 = &v308[v102[24]];
      *uint64_t v29 = v101;
      v29[1] = v100;
      swift_storeEnumTagMultiPayload();
      sub_24F260490((uint64_t)v29, v314, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      sub_24F261FB0(&qword_2699CCED0, (void (*)(uint64_t))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      swift_bridgeObjectRetain();
      sub_24F274C10();
      sub_24F263A6C((uint64_t)v29, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      uint64_t v106 = *MEMORY[0x263F39580];
      uint64_t v107 = sub_24F274920();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v107 - 8) + 104))(v104, v106, v107);
      uint64_t v108 = swift_allocObject();
      long long v109 = v328;
      *(_OWORD *)(v108 + 112) = v327;
      *(_OWORD *)(v108 + 128) = v109;
      long long v110 = v330;
      *(_OWORD *)(v108 + 144) = v329;
      *(_OWORD *)(v108 + 160) = v110;
      long long v111 = v324;
      *(_OWORD *)(v108 + 48) = v323;
      *(_OWORD *)(v108 + 64) = v111;
      long long v112 = v326;
      *(_OWORD *)(v108 + 80) = v325;
      *(_OWORD *)(v108 + 96) = v112;
      long long v113 = v322;
      *(_OWORD *)(v108 + 16) = v321;
      *(_OWORD *)(v108 + 32) = v113;
      *(void *)(v108 + 176) = v101;
      *(void *)(v108 + 184) = v100;
      *(void *)uint64_t v105 = &unk_2699CCF00;
      *((void *)v105 + 1) = v108;
      sub_24F260A28((uint64_t)&v321);
      sub_24F274B10();
      uint64_t v114 = *MEMORY[0x263F39578];
      uint64_t v115 = sub_24F274910();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v115 - 8) + 104))(v320, v114, v115);
      uint64_t v116 = v318;
      uint64_t v117 = v316;
      (*(void (**)(char *, void, uint64_t))(v318 + 104))(v103, *MEMORY[0x263F39530], v316);
      v118 = v317;
      unint64_t v119 = *v317;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v119 = sub_24F1BA23C(0, *(void *)(v119 + 16) + 1, 1, v119);
      }
      unint64_t v121 = *(void *)(v119 + 16);
      unint64_t v120 = *(void *)(v119 + 24);
      if (v121 >= v120 >> 1) {
        unint64_t v119 = sub_24F1BA23C(v120 > 1, v121 + 1, 1, v119);
      }
      *(void *)(v119 + 16) = v121 + 1;
      uint64_t v122 = *(uint64_t (**)(unint64_t, char *, uint64_t))(v116 + 32);
      unint64_t v123 = v119
           + ((*(unsigned __int8 *)(v116 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v116 + 80))
           + *(void *)(v116 + 72) * v121;
      v124 = (char *)&v330 + 8;
      goto LABEL_35;
    case 3:
      v125 = v312;
      v310 = (char *)*((void *)v312 + 4);
      v126 = v311;
      uint64_t v127 = v313;
      ((void (*)(uint64_t (*)(), uint64_t *, uint64_t))v310)(v311, v63, v313);
      uint64_t v128 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2699CA868);
      char v129 = v309;
      v319 = &v309[v128[12]];
      v307 = &v309[v128[16]];
      v320 = &v309[v128[20]];
      v308 = &v309[v128[24]];
      char v130 = (void (*)(char *, uint64_t (*)(), uint64_t))*((void *)v125 + 2);
      v130(v32, v126, v127);
      swift_storeEnumTagMultiPayload();
      sub_24F260490((uint64_t)v32, v314, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      sub_24F261FB0(&qword_2699CCED0, (void (*)(uint64_t))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      sub_24F274C10();
      sub_24F263A6C((uint64_t)v32, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      uint64_t v131 = *MEMORY[0x263F39580];
      uint64_t v132 = sub_24F274920();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v132 - 8) + 104))(v307, v131, v132);
      char v133 = v304;
      v130(v304, v126, v127);
      unint64_t v134 = (v125[80] + 176) & ~(unint64_t)v125[80];
      char v135 = (_OWORD *)swift_allocObject();
      long long v136 = v328;
      v135[7] = v327;
      v135[8] = v136;
      long long v137 = v330;
      v135[9] = v329;
      v135[10] = v137;
      long long v138 = v324;
      v135[3] = v323;
      v135[4] = v138;
      long long v139 = v326;
      v135[5] = v325;
      v135[6] = v139;
      long long v140 = v322;
      v135[1] = v321;
      v135[2] = v140;
      ((void (*)(char *, char *, uint64_t))v310)((char *)v135 + v134, v133, v127);
      v141 = v308;
      *(void *)v308 = &unk_2699CCF10;
      *((void *)v141 + 1) = v135;
      sub_24F260A28((uint64_t)&v321);
      sub_24F274B10();
      uint64_t v142 = *MEMORY[0x263F39578];
      uint64_t v143 = sub_24F274910();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v143 - 8) + 104))(v320, v142, v143);
      uint64_t v144 = v318;
      uint64_t v145 = v316;
      (*(void (**)(char *, void, uint64_t))(v318 + 104))(v129, *MEMORY[0x263F39530], v316);
      v146 = v317;
      unint64_t v147 = *v317;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v147 = sub_24F1BA23C(0, *(void *)(v147 + 16) + 1, 1, v147);
      }
      unint64_t v149 = *(void *)(v147 + 16);
      unint64_t v148 = *(void *)(v147 + 24);
      if (v149 >= v148 >> 1) {
        unint64_t v147 = sub_24F1BA23C(v148 > 1, v149 + 1, 1, v147);
      }
      *(void *)(v147 + 16) = v149 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v144 + 32))(v147+ ((*(unsigned __int8 *)(v144 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v144 + 80))+ *(void *)(v144 + 72) * v149, v309, v145);
      unint64_t *v146 = v147;
      return (int *)(*((uint64_t (**)(uint64_t (*)(), uint64_t))v312 + 1))(v311, v313);
    case 4:
      __n128 result = (int *)type metadata accessor for ProgramDetailState();
      v319[result[9]] = 0;
      return result;
    case 5:
      v320 = (char *)type metadata accessor for ProgramDetailState();
      v150 = &v319[*((int *)v320 + 8)];
      v152 = *(uint64_t (**)())v150;
      uint64_t v151 = *((void *)v150 + 1);
      v153 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2699CA868);
      v312 = &v60[v153[16]];
      uint64_t v313 = (uint64_t)&v60[v153[20]];
      v154 = &v60[v153[24]];
      swift_storeEnumTagMultiPayload();
      sub_24F260490((uint64_t)v44, v314, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      uint64_t v155 = sub_24F261FB0(&qword_2699CCED0, (void (*)(uint64_t))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      swift_bridgeObjectRetain();
      v310 = (char *)v155;
      sub_24F274C10();
      sub_24F263A6C((uint64_t)v44, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      uint64_t v156 = swift_allocObject();
      long long v157 = v328;
      *(_OWORD *)(v156 + 112) = v327;
      *(_OWORD *)(v156 + 128) = v157;
      long long v158 = v330;
      *(_OWORD *)(v156 + 144) = v329;
      *(_OWORD *)(v156 + 160) = v158;
      long long v159 = v324;
      *(_OWORD *)(v156 + 48) = v323;
      *(_OWORD *)(v156 + 64) = v159;
      long long v160 = v326;
      *(_OWORD *)(v156 + 80) = v325;
      *(_OWORD *)(v156 + 96) = v160;
      long long v161 = v322;
      *(_OWORD *)(v156 + 16) = v321;
      *(_OWORD *)(v156 + 32) = v161;
      v311 = v152;
      *(void *)(v156 + 176) = v152;
      *(void *)(v156 + 184) = v151;
      *(void *)v154 = &unk_2699CCF40;
      *((void *)v154 + 1) = v156;
      swift_bridgeObjectRetain();
      sub_24F260A28((uint64_t)&v321);
      sub_24F274B10();
      uint64_t v162 = *MEMORY[0x263F39588];
      uint64_t v163 = sub_24F274920();
      uint64_t v164 = *(void *)(v163 - 8);
      v165 = *(char **)(v164 + 104);
      v166 = v312;
      v312 = (char *)(v164 + 104);
      ((void (*)(char *, uint64_t, uint64_t))v165)(v166, v162, v163);
      uint64_t v167 = *MEMORY[0x263F39578];
      uint64_t v168 = sub_24F274910();
      uint64_t v169 = *(void *)(v168 - 8);
      v170 = *(void ***)(v169 + 104);
      uint64_t v171 = v313;
      LODWORD(v313) = v167;
      v306 = v170;
      uint64_t v305 = v169 + 104;
      ((void (*)(uint64_t, uint64_t, uint64_t))v170)(v171, v167, v168);
      v172 = *(char **)(v318 + 104);
      LODWORD(v304) = *MEMORY[0x263F39530];
      v303 = v172;
      ((void (*)(char *))v172)(v60);
      unint64_t v173 = *v317;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      LODWORD(v309) = v162;
      v307 = v165;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        unint64_t v173 = sub_24F1BA23C(0, *(void *)(v173 + 16) + 1, 1, v173);
      }
      uint64_t v175 = (uint64_t)v297;
      unint64_t v177 = *(void *)(v173 + 16);
      unint64_t v176 = *(void *)(v173 + 24);
      v308 = (char *)v163;
      uint64_t v302 = v168;
      if (v177 >= v176 >> 1) {
        unint64_t v173 = sub_24F1BA23C(v176 > 1, v177 + 1, 1, v173);
      }
      *(void *)(v173 + 16) = v177 + 1;
      uint64_t v179 = v318 + 32;
      v178 = *(uint64_t (**)(char *, char *, uint64_t))(v318 + 32);
      v300 = (char *)((*(unsigned __int8 *)(v318 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v318 + 80));
      v298 = *(char **)(v318 + 72);
      v180 = &v300[v173 + (void)v298 * v177];
      uint64_t v181 = v316;
      v301 = v178;
      v178(v180, v60, v316);
      v182 = v317;
      unint64_t *v317 = v173;
      uint64_t v183 = (uint64_t)&v319[*((int *)v320 + 6)];
      sub_24F260490(v183, v175, (uint64_t (*)(void))type metadata accessor for ProgramDetailLoadState);
      uint64_t v184 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC478);
      uint64_t v185 = v175;
      uint64_t v186 = *(void *)(v184 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v186 + 48))(v185, 2, v184) != 1)
      {
        swift_bridgeObjectRelease();
        uint64_t v98 = type metadata accessor for ProgramDetailLoadState;
        uint64_t v99 = v185;
        return (int *)sub_24F263A6C(v99, (uint64_t (*)(void))v98);
      }
      uint64_t v318 = v179;
      sub_24F263A6C(v185, (uint64_t (*)(void))type metadata accessor for ProgramDetailLoadState);
      sub_24F263A6C(v183, (uint64_t (*)(void))type metadata accessor for ProgramDetailLoadState);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v186 + 56))(v183, 2, 2, v184);
      v187 = v299;
      v297 = &v299[v153[12]];
      v319 = &v299[v153[16]];
      v320 = &v299[v153[20]];
      v188 = &v299[v153[24]];
      uint64_t v189 = (uint64_t)v294;
      v190 = v311;
      *v294 = v311;
      *(void *)(v189 + 8) = v151;
      swift_storeEnumTagMultiPayload();
      sub_24F260490(v189, v314, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      swift_bridgeObjectRetain();
      sub_24F274C10();
      sub_24F263A6C(v189, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      uint64_t v191 = swift_allocObject();
      long long v192 = v328;
      *(_OWORD *)(v191 + 112) = v327;
      *(_OWORD *)(v191 + 128) = v192;
      long long v193 = v330;
      *(_OWORD *)(v191 + 144) = v329;
      *(_OWORD *)(v191 + 160) = v193;
      long long v194 = v324;
      *(_OWORD *)(v191 + 48) = v323;
      *(_OWORD *)(v191 + 64) = v194;
      long long v195 = v326;
      *(_OWORD *)(v191 + 80) = v325;
      *(_OWORD *)(v191 + 96) = v195;
      long long v196 = v322;
      *(_OWORD *)(v191 + 16) = v321;
      *(_OWORD *)(v191 + 32) = v196;
      *(void *)(v191 + 176) = v190;
      *(void *)(v191 + 184) = v151;
      *(void *)v188 = &unk_2699CCF50;
      *((void *)v188 + 1) = v191;
      sub_24F260A28((uint64_t)&v321);
      sub_24F274B10();
      ((void (*)(char *, void, char *))v307)(v319, v309, v308);
      ((void (*)(char *, void, uint64_t))v306)(v320, v313, v302);
      ((void (*)(char *, void, uint64_t))v303)(v187, v304, v181);
      unint64_t v197 = *v182;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v197 = sub_24F1BA23C(0, *(void *)(v197 + 16) + 1, 1, v197);
      }
      v198 = v301;
      v199 = v300;
      v200 = v298;
      unint64_t v202 = *(void *)(v197 + 16);
      unint64_t v201 = *(void *)(v197 + 24);
      if (v202 >= v201 >> 1) {
        unint64_t v197 = sub_24F1BA23C(v201 > 1, v202 + 1, 1, v197);
      }
      *(void *)(v197 + 16) = v202 + 1;
      __n128 result = (int *)v198(&v199[v197 + v202 * (void)v200], v299, v181);
      unint64_t *v182 = v197;
      return result;
    case 6:
      __n128 result = (int *)type metadata accessor for ProgramDetailState();
      if (v319[34])
      {
        v203 = &v319[result[8]];
        uint64_t v205 = *(void *)v203;
        uint64_t v204 = *((void *)v203 + 1);
        v206 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2699CA868);
        v207 = v298;
        v208 = &v298[v206[16]];
        v320 = &v298[v206[20]];
        v209 = &v298[v206[24]];
        swift_storeEnumTagMultiPayload();
        sub_24F260490((uint64_t)v35, v314, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
        sub_24F261FB0(&qword_2699CCED0, (void (*)(uint64_t))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
        swift_bridgeObjectRetain();
        sub_24F274C10();
        sub_24F263A6C((uint64_t)v35, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
        uint64_t v210 = swift_allocObject();
        long long v211 = v328;
        *(_OWORD *)(v210 + 112) = v327;
        *(_OWORD *)(v210 + 128) = v211;
        long long v212 = v330;
        *(_OWORD *)(v210 + 144) = v329;
        *(_OWORD *)(v210 + 160) = v212;
        long long v213 = v324;
        *(_OWORD *)(v210 + 48) = v323;
        *(_OWORD *)(v210 + 64) = v213;
        long long v214 = v326;
        *(_OWORD *)(v210 + 80) = v325;
        *(_OWORD *)(v210 + 96) = v214;
        long long v215 = v322;
        *(_OWORD *)(v210 + 16) = v321;
        *(_OWORD *)(v210 + 32) = v215;
        *(void *)(v210 + 176) = v205;
        *(void *)(v210 + 184) = v204;
        *(void *)v209 = &unk_2699CCF20;
        *((void *)v209 + 1) = v210;
        sub_24F260A28((uint64_t)&v321);
        sub_24F274B10();
        uint64_t v216 = *MEMORY[0x263F39588];
        uint64_t v217 = sub_24F274920();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v217 - 8) + 104))(v208, v216, v217);
        uint64_t v218 = *MEMORY[0x263F39578];
        uint64_t v219 = sub_24F274910();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v219 - 8) + 104))(v320, v218, v219);
        uint64_t v220 = v318;
        uint64_t v117 = v316;
        (*(void (**)(char *, void, uint64_t))(v318 + 104))(v207, *MEMORY[0x263F39530], v316);
        v118 = v317;
        unint64_t v119 = *v317;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v119 = sub_24F1BA23C(0, *(void *)(v119 + 16) + 1, 1, v119);
        }
        unint64_t v222 = *(void *)(v119 + 16);
        unint64_t v221 = *(void *)(v119 + 24);
        if (v222 >= v221 >> 1) {
          unint64_t v119 = sub_24F1BA23C(v221 > 1, v222 + 1, 1, v119);
        }
        *(void *)(v119 + 16) = v222 + 1;
        uint64_t v122 = *(uint64_t (**)(unint64_t, char *, uint64_t))(v220 + 32);
        unint64_t v123 = v119
             + ((*(unsigned __int8 *)(v220 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v220 + 80))
             + *(void *)(v220 + 72) * v222;
        v124 = (char *)&v325 + 8;
LABEL_35:
        v223 = (char *)*((void *)v124 - 32);
LABEL_42:
        __n128 result = (int *)v122(v123, v223, v117);
        unint64_t *v118 = v119;
      }
      else
      {
        v319[result[9]] = 1;
      }
      return result;
    case 7:
      __n128 result = (int *)type metadata accessor for ProgramDetailState();
      v319[result[10]] = 1;
      return result;
    case 8:
      uint64_t v224 = type metadata accessor for ProgramDetailState();
      v225 = &v319[*(int *)(v224 + 32)];
      uint64_t v227 = *(void *)v225;
      uint64_t v226 = *((void *)v225 + 1);
      v319[*(int *)(v224 + 36)] = 0;
      v228 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2699CA868);
      v229 = v303;
      v230 = &v303[v228[16]];
      v320 = &v303[v228[20]];
      v231 = &v303[v228[24]];
      uint64_t v232 = (uint64_t)v300;
      swift_storeEnumTagMultiPayload();
      sub_24F260490(v232, v314, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      sub_24F261FB0(&qword_2699CCED0, (void (*)(uint64_t))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      swift_bridgeObjectRetain();
      sub_24F274C10();
      sub_24F263A6C(v232, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      uint64_t v233 = *MEMORY[0x263F39580];
      uint64_t v234 = sub_24F274920();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v234 - 8) + 104))(v230, v233, v234);
      uint64_t v235 = swift_allocObject();
      long long v236 = v328;
      *(_OWORD *)(v235 + 112) = v327;
      *(_OWORD *)(v235 + 128) = v236;
      long long v237 = v330;
      *(_OWORD *)(v235 + 144) = v329;
      *(_OWORD *)(v235 + 160) = v237;
      long long v238 = v324;
      *(_OWORD *)(v235 + 48) = v323;
      *(_OWORD *)(v235 + 64) = v238;
      long long v239 = v326;
      *(_OWORD *)(v235 + 80) = v325;
      *(_OWORD *)(v235 + 96) = v239;
      long long v240 = v322;
      *(_OWORD *)(v235 + 16) = v321;
      *(_OWORD *)(v235 + 32) = v240;
      *(void *)(v235 + 176) = v227;
      *(void *)(v235 + 184) = v226;
      *(void *)v231 = &unk_2699CCEF0;
      *((void *)v231 + 1) = v235;
      sub_24F260A28((uint64_t)&v321);
      sub_24F274B10();
      uint64_t v241 = *MEMORY[0x263F39578];
      uint64_t v242 = sub_24F274910();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v242 - 8) + 104))(v320, v241, v242);
      uint64_t v243 = v318;
      uint64_t v117 = v316;
      (*(void (**)(char *, void, uint64_t))(v318 + 104))(v229, *MEMORY[0x263F39530], v316);
      v118 = v317;
      unint64_t v119 = *v317;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v119 = sub_24F1BA23C(0, *(void *)(v119 + 16) + 1, 1, v119);
      }
      unint64_t v245 = *(void *)(v119 + 16);
      unint64_t v244 = *(void *)(v119 + 24);
      if (v245 >= v244 >> 1) {
        unint64_t v119 = sub_24F1BA23C(v244 > 1, v245 + 1, 1, v119);
      }
      *(void *)(v119 + 16) = v245 + 1;
      uint64_t v122 = *(uint64_t (**)(unint64_t, char *, uint64_t))(v243 + 32);
      unint64_t v123 = v119
           + ((*(unsigned __int8 *)(v243 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v243 + 80))
           + *(void *)(v243 + 72) * v245;
      v223 = v229;
      goto LABEL_42;
    case 9:
      uint64_t v246 = type metadata accessor for ProgramDetailState();
      uint64_t v247 = v302;
      sub_24F260490((uint64_t)&v319[*(int *)(v246 + 24)], v302, (uint64_t (*)(void))type metadata accessor for ProgramDetailLoadState);
      uint64_t v248 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CC478);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v248 - 8) + 48))(v247, 2, v248))
      {
        uint64_t v98 = type metadata accessor for ProgramDetailLoadState;
        uint64_t v99 = v247;
      }
      else
      {
        uint64_t v249 = v296;
        sub_24F25DFAC(v247, v296, (uint64_t (*)(void))type metadata accessor for WorkoutProgram);
        uint64_t v250 = v289;
        uint64_t v251 = v290;
        sub_24F25DF44(v249 + *(int *)(v289 + 32), v290);
        uint64_t v252 = v291;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v295 + 48))(v251, 1, v291) == 1)
        {
          sub_24F263A6C(v249, (uint64_t (*)(void))type metadata accessor for WorkoutProgram);
          return (int *)sub_24F1A62BC(v251, &qword_2699CB3B8);
        }
        v311 = type metadata accessor for WorkoutProgramPreview;
        uint64_t v253 = v293;
        sub_24F25DFAC(v251, v293, (uint64_t (*)(void))type metadata accessor for WorkoutProgramPreview);
        v254 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2699CA868);
        v255 = v292;
        v319 = &v292[v254[12]];
        v256 = &v292[v254[16]];
        v320 = &v292[v254[20]];
        v257 = &v292[v254[24]];
        uint64_t v258 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCEC8);
        uint64_t v259 = (uint64_t)v285;
        v260 = (char *)v285 + *(int *)(v258 + 48);
        v261 = (void *)(v249 + *(int *)(v250 + 24));
        uint64_t v262 = v261[1];
        void *v285 = *v261;
        *(void *)(v259 + 8) = v262;
        (*((void (**)(char *, uint64_t, uint64_t))v312 + 2))(v260, v253 + *(int *)(v252 + 20), v313);
        swift_storeEnumTagMultiPayload();
        sub_24F260490(v259, v314, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
        sub_24F261FB0(&qword_2699CCED0, (void (*)(uint64_t))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
        swift_bridgeObjectRetain();
        uint64_t v263 = v296;
        sub_24F274C10();
        sub_24F263A6C(v259, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
        uint64_t v264 = *MEMORY[0x263F39580];
        uint64_t v265 = sub_24F274920();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v265 - 8) + 104))(v256, v264, v265);
        uint64_t v266 = v286;
        sub_24F260490(v263, v286, (uint64_t (*)(void))type metadata accessor for WorkoutProgram);
        uint64_t v267 = v253;
        uint64_t v268 = v288;
        sub_24F260490(v267, v288, (uint64_t (*)(void))type metadata accessor for WorkoutProgramPreview);
        unint64_t v269 = (v307[80] + 176) & ~(unint64_t)v307[80];
        unint64_t v270 = (v13 + *(unsigned __int8 *)(v295 + 80) + v269) & ~(unint64_t)*(unsigned __int8 *)(v295 + 80);
        v271 = (_OWORD *)swift_allocObject();
        long long v272 = v328;
        v271[7] = v327;
        v271[8] = v272;
        long long v273 = v330;
        v271[9] = v329;
        v271[10] = v273;
        long long v274 = v324;
        v271[3] = v323;
        v271[4] = v274;
        long long v275 = v326;
        v271[5] = v325;
        v271[6] = v275;
        long long v276 = v322;
        v271[1] = v321;
        v271[2] = v276;
        sub_24F25DFAC(v266, (uint64_t)v271 + v269, (uint64_t (*)(void))type metadata accessor for WorkoutProgram);
        sub_24F25DFAC(v268, (uint64_t)v271 + v270, (uint64_t (*)(void))v311);
        *(void *)v257 = &unk_2699CCEE0;
        *((void *)v257 + 1) = v271;
        sub_24F260A28((uint64_t)&v321);
        sub_24F274B10();
        uint64_t v277 = *MEMORY[0x263F39578];
        uint64_t v278 = sub_24F274910();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v278 - 8) + 104))(v320, v277, v278);
        uint64_t v279 = v318;
        uint64_t v280 = v316;
        (*(void (**)(char *, void, uint64_t))(v318 + 104))(v255, *MEMORY[0x263F39530], v316);
        v281 = v317;
        unint64_t v282 = *v317;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v282 = sub_24F1BA23C(0, *(void *)(v282 + 16) + 1, 1, v282);
        }
        unint64_t v284 = *(void *)(v282 + 16);
        unint64_t v283 = *(void *)(v282 + 24);
        if (v284 >= v283 >> 1) {
          unint64_t v282 = sub_24F1BA23C(v283 > 1, v284 + 1, 1, v282);
        }
        *(void *)(v282 + 16) = v284 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v279 + 32))(v282+ ((*(unsigned __int8 *)(v279 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v279 + 80))+ *(void *)(v279 + 72) * v284, v292, v280);
        unint64_t *v281 = v282;
        sub_24F263A6C(v293, (uint64_t (*)(void))type metadata accessor for WorkoutProgramPreview);
        uint64_t v98 = type metadata accessor for WorkoutProgram;
        uint64_t v99 = v263;
      }
      return (int *)sub_24F263A6C(v99, (uint64_t (*)(void))v98);
    case 10:
      return result;
    default:
      v319[34] = *(unsigned char *)v63;
      return result;
  }
}

uint64_t type metadata accessor for ProgramDetailFeature.TaskIdentifier()
{
  uint64_t result = qword_2699CCF70;
  if (!qword_2699CCF70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24F25DF44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F25DFAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F25E014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = type metadata accessor for ProgramDetailAction();
  v4[4] = swift_task_alloc();
  v4[5] = sub_24F274B00();
  v4[6] = sub_24F274AF0();
  uint64_t v10 = (uint64_t (*)(void *, uint64_t, uint64_t))(*(void *)(a2 + 32) + **(int **)(a2 + 32));
  uint64_t v8 = (void *)swift_task_alloc();
  v4[7] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_24F25E15C;
  return v10(v4 + 12, a3, a4);
}

uint64_t sub_24F25E15C()
{
  long long v2 = (void *)*v1;
  v2[8] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F274AE0();
  v2[9] = v4;
  v2[10] = v3;
  if (v0) {
    uint64_t v5 = sub_24F25E4D4;
  }
  else {
    uint64_t v5 = sub_24F25E2BC;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F25E2BC()
{
  **(unsigned char **)(v0 + 32) = *(unsigned char *)(v0 + 96);
  swift_storeEnumTagMultiPayload();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCF90);
  void *v1 = v0;
  v1[1] = sub_24F25E37C;
  uint64_t v3 = *(void *)(v0 + 32);
  return MEMORY[0x270F252C8](v3, v2);
}

uint64_t sub_24F25E37C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 32);
  swift_task_dealloc();
  sub_24F263A6C(v2, (uint64_t (*)(void))type metadata accessor for ProgramDetailAction);
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v1 + 72);
  return MEMORY[0x270FA2498](sub_24F263AD0, v4, v3);
}

uint64_t sub_24F25E4D4()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F25E544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = type metadata accessor for ProgramDetailAction();
  v4[4] = swift_task_alloc();
  type metadata accessor for WorkoutProgram();
  uint64_t v8 = swift_task_alloc();
  v4[5] = v8;
  v4[6] = sub_24F274B00();
  v4[7] = sub_24F274AF0();
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  v4[8] = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24F25E6B4;
  return v11(v8, a3, a4);
}

uint64_t sub_24F25E6B4()
{
  uint64_t v2 = (void *)*v1;
  v2[9] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F274AE0();
  v2[10] = v4;
  v2[11] = v3;
  if (v0) {
    uint64_t v5 = sub_24F212D68;
  }
  else {
    uint64_t v5 = sub_24F25E814;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F25E814()
{
  sub_24F260490(v0[5], v0[4], (uint64_t (*)(void))type metadata accessor for WorkoutProgram);
  swift_storeEnumTagMultiPayload();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[12] = (uint64_t)v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCF90);
  void *v1 = v0;
  v1[1] = sub_24F25E8F4;
  uint64_t v3 = v0[4];
  return MEMORY[0x270F252C8](v3, v2);
}

uint64_t sub_24F25E8F4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 32);
  swift_task_dealloc();
  sub_24F263A6C(v2, (uint64_t (*)(void))type metadata accessor for ProgramDetailAction);
  uint64_t v3 = *(void *)(v1 + 88);
  uint64_t v4 = *(void *)(v1 + 80);
  return MEMORY[0x270FA2498](sub_24F25EA4C, v4, v3);
}

uint64_t sub_24F25EA4C()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  sub_24F263A6C(v1, (uint64_t (*)(void))type metadata accessor for WorkoutProgram);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24F25EAE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 48) = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCF98);
  *(void *)(v3 + 56) = v5;
  *(void *)(v3 + 64) = *(void *)(v5 - 8);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v3 + 72) = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCFA0);
  *(void *)(v3 + 80) = v7;
  *(void *)(v3 + 88) = *(void *)(v7 - 8);
  *(void *)(v3 + 96) = swift_task_alloc();
  *(void *)(v3 + 104) = sub_24F274B00();
  *(void *)(v3 + 112) = sub_24F274AF0();
  uint64_t v8 = *(int **)(a2 + 48);
  *(_OWORD *)(v3 + 120) = *(_OWORD *)(a2 + 128);
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)v8 + *v8);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 136) = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_24F25ECA4;
  return v11(v6);
}

uint64_t sub_24F25ECA4()
{
  uint64_t v2 = (void *)*v1;
  v2[18] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F274AE0();
  v2[19] = v4;
  v2[20] = v3;
  if (v0) {
    uint64_t v5 = sub_24F25F5E4;
  }
  else {
    uint64_t v5 = sub_24F25EE04;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F25EE04()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  sub_24F274B40();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = sub_24F274AF0();
  v0[21] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[22] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24F25EEF8;
  uint64_t v6 = v0[10];
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v0 + 4, v4, v7, v6);
}

uint64_t sub_24F25EEF8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24F25F03C, v3, v2);
}

uint64_t sub_24F25F03C()
{
  uint64_t v1 = v0[4];
  if (v1)
  {
    uint64_t v2 = v0[6];
    uint64_t v3 = *(void *)(v2 + *(int *)(type metadata accessor for WorkoutProgram() + 52));
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_24F274B60();
    v0[5] = v4;
    uint64_t v5 = *(void *)(v3 + 16);
    if (v5)
    {
      uint64_t v6 = (uint64_t *)(v3 + 40);
      do
      {
        uint64_t v7 = *(v6 - 1);
        uint64_t v8 = *v6;
        swift_bridgeObjectRetain();
        sub_24F261FF8(v0 + 2, v7, v8);
        swift_bridgeObjectRelease();
        v6 += 2;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
      uint64_t v9 = v0[5];
    }
    else
    {
      uint64_t v9 = v4;
      swift_bridgeObjectRelease();
    }
    uint64_t v12 = sub_24F262488(v9, v1);
    v0[23] = v12;
    swift_bridgeObjectRelease();
    if (*(void *)(v12 + 16))
    {
      if (qword_2699C9F98 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_24F273B40();
      __swift_project_value_buffer(v13, (uint64_t)qword_2699E8920);
      uint64_t v14 = sub_24F273B20();
      os_log_type_t v15 = sub_24F274BE0();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_24F198000, v14, v15, "Archived Sessions Updated — refreshing", v16, 2u);
        MEMORY[0x253358250](v16, -1, -1);
      }
      uint64_t v17 = (int *)v0[15];

      uint64_t v23 = (uint64_t (*)(uint64_t))((char *)v17 + *v17);
      uint64_t v18 = (void *)swift_task_alloc();
      v0[24] = v18;
      *uint64_t v18 = v0;
      v18[1] = sub_24F25F3D8;
      return v23(v12);
    }
    else
    {
      swift_release();
      uint64_t v19 = sub_24F274AF0();
      v0[21] = v19;
      uint64_t v20 = (void *)swift_task_alloc();
      v0[22] = v20;
      void *v20 = v0;
      v20[1] = sub_24F25EEF8;
      uint64_t v21 = v0[10];
      uint64_t v22 = MEMORY[0x263F8F500];
      return MEMORY[0x270FA1F68](v0 + 4, v19, v22, v21);
    }
  }
  else
  {
    (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
}

uint64_t sub_24F25F3D8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24F25F51C, v3, v2);
}

uint64_t sub_24F25F51C()
{
  uint64_t v1 = sub_24F274AF0();
  v0[21] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[22] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24F25EEF8;
  uint64_t v3 = v0[10];
  uint64_t v4 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v0 + 4, v1, v4, v3);
}

uint64_t sub_24F25F5E4()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F25F660(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = type metadata accessor for ProgramDetailAction();
  v4[4] = swift_task_alloc();
  v4[5] = sub_24F274B00();
  v4[6] = sub_24F274AF0();
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))(*a2 + *(int *)*a2);
  uint64_t v8 = (void *)swift_task_alloc();
  v4[7] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_24F25F794;
  return v10(a3, a4);
}

uint64_t sub_24F25F794()
{
  uint64_t v2 = (void *)*v1;
  v2[8] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F274AE0();
  v2[9] = v4;
  v2[10] = v3;
  if (v0) {
    uint64_t v5 = sub_24F25E4D4;
  }
  else {
    uint64_t v5 = sub_24F25F8F4;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F25F8F4()
{
  **(unsigned char **)(v0 + 32) = 0;
  swift_storeEnumTagMultiPayload();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCF90);
  void *v1 = v0;
  v1[1] = sub_24F25F9B0;
  uint64_t v3 = *(void *)(v0 + 32);
  return MEMORY[0x270F252C8](v3, v2);
}

uint64_t sub_24F25F9B0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 32);
  swift_task_dealloc();
  sub_24F263A6C(v2, (uint64_t (*)(void))type metadata accessor for ProgramDetailAction);
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v1 + 72);
  return MEMORY[0x270FA2498](sub_24F25FB08, v4, v3);
}

uint64_t sub_24F25FB08()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F25FB78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a2;
  v3[3] = a3;
  sub_24F274B00();
  v3[4] = sub_24F274AF0();
  uint64_t v5 = sub_24F274AE0();
  return MEMORY[0x270FA2498](sub_24F25FC10, v5, v4);
}

uint64_t sub_24F25FC10()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[2];
  swift_release();
  (*(void (**)(uint64_t))(v2 + 80))(v1);
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24F25FC88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = sub_24F274B00();
  v4[3] = sub_24F274AF0();
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 64) + **(int **)(a2 + 64));
  uint64_t v8 = (void *)swift_task_alloc();
  v4[4] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_24F2121B8;
  return v10(a3, a4);
}

uint64_t sub_24F25FD88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = type metadata accessor for ProgramDetailAction();
  v4[4] = swift_task_alloc();
  v4[5] = sub_24F274B00();
  v4[6] = sub_24F274AF0();
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 144) + **(int **)(a2 + 144));
  uint64_t v8 = (void *)swift_task_alloc();
  v4[7] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_24F25FEBC;
  return v10(a3, a4);
}

uint64_t sub_24F25FEBC()
{
  uint64_t v2 = (void *)*v1;
  v2[8] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F274AE0();
  v2[9] = v4;
  v2[10] = v3;
  if (v0) {
    uint64_t v5 = sub_24F263ACC;
  }
  else {
    uint64_t v5 = sub_24F26001C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F26001C()
{
  **(unsigned char **)(v0 + 32) = 1;
  swift_storeEnumTagMultiPayload();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCF90);
  void *v1 = v0;
  v1[1] = sub_24F25E37C;
  uint64_t v3 = *(void *)(v0 + 32);
  return MEMORY[0x270F252C8](v3, v2);
}

uint64_t sub_24F2600DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a3;
  v4[4] = a4;
  v4[2] = a2;
  sub_24F274B00();
  v4[5] = sub_24F274AF0();
  uint64_t v6 = sub_24F274AE0();
  v4[6] = v6;
  v4[7] = v5;
  return MEMORY[0x270FA2498](sub_24F260178, v6, v5);
}

uint64_t sub_24F260178()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = *(int **)(v0[2] + 112);
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for WorkoutProgram() + 24));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  uint64_t v7 = type metadata accessor for WorkoutProgramPreview();
  uint64_t v8 = v3;
  uint64_t v9 = v2 + *(int *)(v7 + 20);
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[8] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_24F26028C;
  return v12(v5, v6, v9);
}

uint64_t sub_24F26028C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 56);
  uint64_t v4 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v5 = sub_24F26042C;
  }
  else {
    uint64_t v5 = sub_24F2603C8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F2603C8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F26042C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F260490(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F2604F8()
{
  uint64_t v1 = (int *)type metadata accessor for WorkoutProgram();
  uint64_t v24 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v22 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v2 = type metadata accessor for WorkoutProgramPreview();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v21 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v20 = *(void *)(v3 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v23 = (v24 + 176) & ~v24;
  uint64_t v4 = v0 + v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v5 = (uint64_t *)&unk_2699CB450;
  }
  else {
    uint64_t v5 = (uint64_t *)&unk_2699CB448;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(v5);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
  uint64_t v7 = v4 + v1[5];
  uint64_t v8 = sub_24F2737E0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v26(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v4 + v1[8];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v10, 1, v2))
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = v10 + *(int *)(v2 + 20);
    uint64_t v12 = sub_24F273900();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  uint64_t v25 = v2;
  uint64_t v13 = v4 + v1[9];
  uint64_t v14 = sub_24F273900();
  os_log_type_t v15 = (void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);
  uint64_t v19 = *v15;
  (*v15)(v13, v14);
  uint64_t v16 = v4 + v1[10];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v16, 1, v8)) {
    v26(v16, v8);
  }
  uint64_t v17 = (v23 + v22 + v21) & ~v21;
  v26(v4 + v1[11], v8);
  v26(v4 + v1[12], v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19(v0 + v17 + *(int *)(v25 + 20), v14);
  return MEMORY[0x270FA0238](v0, v17 + v20, v24 | v21 | 7);
}

uint64_t sub_24F2608E4(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for WorkoutProgram() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 176) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(type metadata accessor for WorkoutProgramPreview() - 8) + 80);
  unint64_t v8 = v5 + v6 + v7;
  uint64_t v9 = v1 + 16;
  uint64_t v10 = v1 + v5;
  uint64_t v11 = v1 + (v8 & ~v7);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24F213688;
  return sub_24F2600DC(a1, v9, v10, v11);
}

uint64_t sub_24F260A28(uint64_t a1)
{
  return a1;
}

uint64_t sub_24F260AEC(uint64_t a1)
{
  uint64_t v4 = v1 + 16;
  uint64_t v6 = *(void *)(v1 + 176);
  uint64_t v5 = *(void *)(v1 + 184);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F213688;
  return sub_24F25FD88(a1, v4, v6, v5);
}

uint64_t sub_24F260BA0(uint64_t a1)
{
  uint64_t v4 = v1 + 16;
  uint64_t v6 = *(void *)(v1 + 176);
  uint64_t v5 = *(void *)(v1 + 184);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F213688;
  return sub_24F25FC88(a1, v4, v6, v5);
}

uint64_t sub_24F260C50()
{
  uint64_t v1 = sub_24F273900();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 176) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24F260D64(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24F273900() - 8);
  uint64_t v5 = v1 + 16;
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 176) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F213688;
  return sub_24F25FB78(a1, v5, v6);
}

uint64_t sub_24F260E4C(uint64_t a1)
{
  uint64_t v4 = v1 + 2;
  uint64_t v6 = v1[22];
  uint64_t v5 = v1[23];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F213688;
  return sub_24F25F660(a1, v4, v6, v5);
}

uint64_t sub_24F260EFC()
{
  uint64_t v1 = (int *)type metadata accessor for WorkoutProgram();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v18 = *(void *)(*((void *)v1 - 1) + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = v0 + ((v2 + 176) & ~v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB3B0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v4 = (uint64_t *)&unk_2699CB450;
  }
  else {
    uint64_t v4 = (uint64_t *)&unk_2699CB448;
  }
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(v4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + ((v2 + 176) & ~v2), v5);
  uint64_t v6 = v3 + v1[5];
  uint64_t v7 = sub_24F2737E0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v9(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v3 + v1[8];
  uint64_t v11 = type metadata accessor for WorkoutProgramPreview();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11))
  {
    swift_bridgeObjectRelease();
    uint64_t v12 = v10 + *(int *)(v11 + 20);
    uint64_t v13 = sub_24F273900();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  uint64_t v14 = v3 + v1[9];
  uint64_t v15 = sub_24F273900();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  uint64_t v16 = v3 + v1[10];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v16, 1, v7)) {
    v9(v16, v7);
  }
  v9(v3 + v1[11], v7);
  v9(v3 + v1[12], v7);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, ((v2 + 176) & ~v2) + v18, v2 | 7);
}

uint64_t sub_24F261248(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for WorkoutProgram() - 8);
  uint64_t v5 = v1 + 16;
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 176) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F213688;
  return sub_24F25EAE0(a1, v5, v6);
}

uint64_t sub_24F261330(uint64_t a1)
{
  uint64_t v4 = v1 + 16;
  uint64_t v6 = *(void *)(v1 + 176);
  uint64_t v5 = *(void *)(v1 + 184);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F213688;
  return sub_24F25E014(a1, v4, v6, v5);
}

uint64_t objectdestroy_3Tm_1()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 192, 7);
}

uint64_t sub_24F26146C(uint64_t a1)
{
  uint64_t v4 = v1 + 16;
  uint64_t v6 = *(void *)(v1 + 176);
  uint64_t v5 = *(void *)(v1 + 184);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F1B99E4;
  return sub_24F25E544(a1, v4, v6, v5);
}

uint64_t sub_24F26151C()
{
  return sub_24F261FB0(&qword_2699CCF58, (void (*)(uint64_t))type metadata accessor for ProgramDetailAction);
}

uint64_t sub_24F261564()
{
  return sub_24F261FB0(&qword_2699CCF60, (void (*)(uint64_t))type metadata accessor for ProgramDetailAction);
}

uint64_t sub_24F2615AC()
{
  return sub_24F261FB0(&qword_2699CCF68, (void (*)(uint64_t))type metadata accessor for ProgramDetailState);
}

ValueMetadata *type metadata accessor for ProgramDetailFeature()
{
  return &type metadata for ProgramDetailFeature;
}

uint64_t *sub_24F261604(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
        uint64_t v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v10 = sub_24F273900();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        swift_bridgeObjectRetain();
        uint64_t v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CCEC8) + 48);
        uint64_t v13 = (char *)a1 + v12;
        uint64_t v14 = (char *)a2 + v12;
        uint64_t v15 = sub_24F273900();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_24F2617E8(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 2:
      goto LABEL_6;
    case 3:
      swift_bridgeObjectRelease();
      a1 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CCEC8) + 48);
LABEL_6:
      uint64_t v3 = sub_24F273900();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

void *sub_24F2618D4(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      goto LABEL_6;
    case 2u:
      uint64_t v7 = sub_24F273900();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      goto LABEL_6;
    case 3u:
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CCEC8) + 48);
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_24F273900();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
LABEL_6:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_24F261A68(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24F263A6C((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_7;
      case 2u:
        uint64_t v6 = sub_24F273900();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        goto LABEL_7;
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CCEC8) + 48);
        uint64_t v8 = (char *)a1 + v7;
        uint64_t v9 = (char *)a2 + v7;
        uint64_t v10 = sub_24F273900();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
LABEL_7:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

_OWORD *sub_24F261C38(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    *a1 = *a2;
    uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CCEC8) + 48);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24F273900();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 2)
  {
    uint64_t v7 = sub_24F273900();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

_OWORD *sub_24F261D68(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24F263A6C((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      *a1 = *a2;
      uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CCEC8) + 48);
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_24F273900();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 2)
    {
      uint64_t v7 = sub_24F273900();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_24F261EBC()
{
  v2[4] = &unk_24F282138;
  v2[5] = &unk_24F282138;
  uint64_t result = sub_24F273900();
  if (v1 <= 0x3F)
  {
    v2[6] = *(void *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    v2[7] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_24F261F68()
{
  return sub_24F261FB0(&qword_2699CCF80, (void (*)(uint64_t))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
}

uint64_t sub_24F261FB0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24F261FF8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24F274E40();
  swift_bridgeObjectRetain();
  sub_24F274A70();
  uint64_t v8 = sub_24F274E80();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24F274E20() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24F274E20() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24F262DE8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24F2621A8()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCFA8);
  uint64_t v3 = sub_24F274C30();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                unint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24F274E40();
      sub_24F274A70();
      uint64_t result = sub_24F274E80();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_24F262488(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_24F262610((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    int64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_24F262610((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x253358250](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_24F262610(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v6 = 0;
    uint64_t v58 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v59 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v61 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          unint64_t v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          int64_t v62 = v6;
          unint64_t v12 = v11 | (v6 << 6);
        }
        else
        {
          int64_t v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59) {
            goto LABEL_79;
          }
          unint64_t v14 = *(void *)(v58 + 8 * v13);
          int64_t v15 = v6 + 1;
          if (!v14)
          {
            int64_t v15 = v6 + 2;
            if (v6 + 2 >= v59) {
              goto LABEL_79;
            }
            unint64_t v14 = *(void *)(v58 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v6 + 3;
              if (v6 + 3 >= v59) {
                goto LABEL_79;
              }
              unint64_t v14 = *(void *)(v58 + 8 * v15);
              if (!v14)
              {
                uint64_t v16 = v6 + 4;
                if (v6 + 4 >= v59) {
                  goto LABEL_79;
                }
                unint64_t v14 = *(void *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_83;
                    }
                    if (v15 >= v59) {
                      goto LABEL_79;
                    }
                    unint64_t v14 = *(void *)(v58 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_22;
                    }
                  }
                }
                int64_t v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          unint64_t v9 = (v14 - 1) & v14;
          int64_t v62 = v15;
          unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        sub_24F274E40();
        swift_bridgeObjectRetain();
        sub_24F274A70();
        uint64_t v20 = sub_24F274E80();
        uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
        unint64_t v22 = v20 & ~v21;
        unint64_t v23 = v22 >> 6;
        uint64_t v24 = 1 << v22;
        if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) != 0) {
          break;
        }
LABEL_6:
        uint64_t result = swift_bridgeObjectRelease();
        int64_t v6 = v62;
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v25 = *(void *)(a3 + 48);
      unint64_t v26 = (void *)(v25 + 16 * v22);
      BOOL v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_24F274E20() & 1) == 0)
      {
        uint64_t v28 = ~v21;
        for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & v28;
          if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
            break;
          }
          uint64_t v31 = (void *)(v25 + 16 * v30);
          BOOL v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_24F274E20() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v23 = v30 >> 6;
            uint64_t v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
  }
  int64_t v34 = 0;
  uint64_t v60 = a3 + 56;
  uint64_t v61 = 0;
  uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
  if (v35 < 64) {
    uint64_t v36 = ~(-1 << v35);
  }
  else {
    uint64_t v36 = -1;
  }
  unint64_t v37 = v36 & *(void *)(a3 + 56);
  int64_t v63 = (unint64_t)(v35 + 63) >> 6;
  uint64_t v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      unint64_t v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      unint64_t v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    int64_t v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      int64_t v34 = v41 + 1;
      if (v41 + 1 >= v63) {
        goto LABEL_79;
      }
      unint64_t v42 = *(void *)(v60 + 8 * v34);
      if (!v42)
      {
        int64_t v34 = v41 + 2;
        if (v41 + 2 >= v63) {
          goto LABEL_79;
        }
        unint64_t v42 = *(void *)(v60 + 8 * v34);
        if (!v42) {
          break;
        }
      }
    }
LABEL_62:
    unint64_t v37 = (v42 - 1) & v42;
    unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    uint64_t v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    sub_24F274E40();
    swift_bridgeObjectRetain();
    sub_24F274A70();
    uint64_t v47 = sub_24F274E80();
    uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v49 = v47 & ~v48;
    if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
      goto LABEL_46;
    }
    uint64_t v50 = *(void *)(a4 + 48);
    uint64_t v51 = (void *)(v50 + 16 * v49);
    BOOL v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_24F274E20() & 1) != 0)
    {
LABEL_76:
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_24F262B50(v57, a2, v61, v5);
      }
    }
    else
    {
      uint64_t v53 = ~v48;
      while (1)
      {
        unint64_t v49 = (v49 + 1) & v53;
        if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
          break;
        }
        uint64_t v54 = (void *)(v50 + 16 * v49);
        BOOL v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_24F274E20() & 1) != 0) {
          goto LABEL_76;
        }
      }
LABEL_46:
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  int64_t v43 = v41 + 3;
  if (v43 >= v63) {
    goto LABEL_79;
  }
  unint64_t v42 = *(void *)(v60 + 8 * v43);
  if (v42)
  {
    int64_t v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    int64_t v34 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v34 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v34);
    ++v43;
    if (v42) {
      goto LABEL_62;
    }
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_24F262B50(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCFA8);
  uint64_t result = sub_24F274C40();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_24F274E40();
    swift_bridgeObjectRetain();
    sub_24F274A70();
    uint64_t result = sub_24F274E80();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_24F262DE8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_24F2621A8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24F262F84();
      goto LABEL_22;
    }
    sub_24F263138();
  }
  uint64_t v11 = *v4;
  sub_24F274E40();
  sub_24F274A70();
  uint64_t result = sub_24F274E80();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24F274E20(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24F274E30();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_24F274E20();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_24F262F84()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCFA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24F274C20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24F263138()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCFA8);
  uint64_t v3 = sub_24F274C30();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24F274E40();
    swift_bridgeObjectRetain();
    sub_24F274A70();
    uint64_t result = sub_24F274E80();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24F2633E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F273900();
  uint64_t v62 = *(void *)(v4 - 8);
  uint64_t v63 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v60 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v61 = (char *)&v58 - v7;
  MEMORY[0x270FA5388](v8);
  int64_t v59 = (char *)&v58 - v9;
  uint64_t v10 = type metadata accessor for ProgramDetailFeature.TaskIdentifier();
  MEMORY[0x270FA5388](v10);
  unint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  unint64_t v15 = (char *)&v58 - v14;
  MEMORY[0x270FA5388](v16);
  int64_t v18 = (uint64_t *)((char *)&v58 - v17);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (uint64_t *)((char *)&v58 - v20);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCF88);
  MEMORY[0x270FA5388](v22 - 8);
  unint64_t v24 = (char *)&v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v26 = &v24[*(int *)(v25 + 56)];
  sub_24F260490(a1, (uint64_t)v24, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
  sub_24F260490(a2, (uint64_t)v26, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_24F260490((uint64_t)v24, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      uint64_t v37 = *v18;
      uint64_t v36 = v18[1];
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_37;
      }
      if (v37 == *(void *)v26 && v36 == *((void *)v26 + 1)) {
        goto LABEL_40;
      }
      char v39 = sub_24F274E20();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v39 & 1) == 0) {
        goto LABEL_28;
      }
      goto LABEL_41;
    case 2u:
      sub_24F260490((uint64_t)v24, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v32 = v62;
        uint64_t v31 = v63;
        BOOL v33 = v59;
        (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v59, v26, v63);
        char v34 = MEMORY[0x2533568B0](v15, v33);
        uint64_t v35 = *(void (**)(char *, uint64_t))(v32 + 8);
        v35(v33, v31);
        v35(v15, v31);
        goto LABEL_44;
      }
      (*(void (**)(char *, uint64_t))(v62 + 8))(v15, v63);
      goto LABEL_38;
    case 3u:
      sub_24F260490((uint64_t)v24, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      uint64_t v40 = *(void *)v12;
      uint64_t v41 = *((void *)v12 + 1);
      uint64_t v42 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2699CCEC8) + 48);
      int64_t v43 = &v12[v42];
      if (swift_getEnumCaseMultiPayload() != 3)
      {
        (*(void (**)(char *, uint64_t))(v62 + 8))(&v12[v42], v63);
LABEL_37:
        swift_bridgeObjectRelease();
LABEL_38:
        sub_24F1A62BC((uint64_t)v24, &qword_2699CCF88);
        goto LABEL_39;
      }
      uint64_t v45 = *(void *)v26;
      uint64_t v44 = *((void *)v26 + 1);
      uint64_t v46 = &v26[v42];
      uint64_t v47 = v62;
      uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v62 + 32);
      unint64_t v49 = v43;
      uint64_t v50 = v63;
      v48(v61, v49, v63);
      v48(v60, v46, v50);
      if (v40 == v45 && v41 == v44)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v52 = sub_24F274E20();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v52 & 1) == 0)
        {
          uint64_t v53 = *(void (**)(char *, uint64_t))(v47 + 8);
          v53(v60, v50);
          v53(v61, v50);
          goto LABEL_28;
        }
      }
      BOOL v55 = v60;
      uint64_t v54 = v61;
      char v34 = MEMORY[0x2533568B0](v61, v60);
      uint64_t v56 = *(void (**)(char *, uint64_t))(v47 + 8);
      v56(v55, v50);
      v56(v54, v50);
LABEL_44:
      sub_24F263A6C((uint64_t)v24, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      return v34 & 1;
    case 4u:
      if (swift_getEnumCaseMultiPayload() == 4) {
        goto LABEL_41;
      }
      goto LABEL_38;
    case 5u:
      if (swift_getEnumCaseMultiPayload() == 5) {
        goto LABEL_41;
      }
      goto LABEL_38;
    case 6u:
      if (swift_getEnumCaseMultiPayload() == 6) {
        goto LABEL_41;
      }
      goto LABEL_38;
    case 7u:
      if (swift_getEnumCaseMultiPayload() == 7) {
        goto LABEL_41;
      }
      goto LABEL_38;
    default:
      sub_24F260490((uint64_t)v24, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
      uint64_t v28 = *v21;
      uint64_t v27 = v21[1];
      if (swift_getEnumCaseMultiPayload()) {
        goto LABEL_37;
      }
      if (v28 == *(void *)v26 && v27 == *((void *)v26 + 1))
      {
LABEL_40:
        swift_bridgeObjectRelease_n();
LABEL_41:
        sub_24F263A6C((uint64_t)v24, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
        char v34 = 1;
        return v34 & 1;
      }
      char v30 = sub_24F274E20();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v30) {
        goto LABEL_41;
      }
LABEL_28:
      sub_24F263A6C((uint64_t)v24, (uint64_t (*)(void))type metadata accessor for ProgramDetailFeature.TaskIdentifier);
LABEL_39:
      char v34 = 0;
      return v34 & 1;
  }
}

uint64_t sub_24F263A6C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t WorkoutContextMenuPreviewContent.init(artwork:title:subtitle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24F1A9F74(a1, a4, &qword_26B1EE628);
  uint64_t v7 = type metadata accessor for WorkoutContextMenuPreviewContent();
  sub_24F1A9F74(a2, a4 + *(int *)(v7 + 20), &qword_26B1EE5F8);
  return sub_24F1A9F74(a3, a4 + *(int *)(v7 + 24), &qword_26B1EE5F8);
}

uint64_t sub_24F263B5C(char a1)
{
  return *(void *)&aArtwork_4[8 * a1];
}

uint64_t sub_24F263B7C()
{
  return sub_24F263B5C(*v0);
}

uint64_t sub_24F263B84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F267A7C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F263BAC(uint64_t a1)
{
  unint64_t v2 = sub_24F265EA4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F263BE8(uint64_t a1)
{
  unint64_t v2 = sub_24F265EA4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WorkoutContextMenuPreviewContent.hash(into:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24F2737E0();
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v24 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v23 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE620);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE628);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = v1;
  sub_24F1AA03C(v1, (uint64_t)v16, &qword_26B1EE628);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v16, 1, v10) == 1)
  {
    sub_24F274E60();
  }
  else
  {
    sub_24F1A9F74((uint64_t)v16, (uint64_t)v13, &qword_26B1EE620);
    sub_24F274E60();
    sub_24F273A70();
    sub_24F1A62BC((uint64_t)v13, &qword_26B1EE620);
  }
  uint64_t v17 = type metadata accessor for WorkoutContextMenuPreviewContent();
  sub_24F1AA03C(v26 + *(int *)(v17 + 20), (uint64_t)v9, &qword_26B1EE5F8);
  uint64_t v18 = v25;
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
  if (v19(v9, 1, v2) == 1)
  {
    sub_24F274E60();
  }
  else
  {
    uint64_t v20 = v24;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v24, v9, v2);
    sub_24F274E60();
    sub_24F267BBC(&qword_2699CB7E0, MEMORY[0x263F06828]);
    sub_24F2749E0();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v2);
  }
  sub_24F1AA03C(v26 + *(int *)(v17 + 24), (uint64_t)v6, &qword_26B1EE5F8);
  if (v19(v6, 1, v2) == 1) {
    return sub_24F274E60();
  }
  uint64_t v22 = v24;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v24, v6, v2);
  sub_24F274E60();
  sub_24F267BBC(&qword_2699CB7E0, MEMORY[0x263F06828]);
  sub_24F2749E0();
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v22, v2);
}

uint64_t WorkoutContextMenuPreviewContent.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCFB0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F265EA4();
  sub_24F274EA0();
  char v11 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE620);
  sub_24F265EF8(&qword_2699CCFC0);
  sub_24F274DC0();
  if (!v1)
  {
    type metadata accessor for WorkoutContextMenuPreviewContent();
    char v10 = 1;
    sub_24F2737E0();
    sub_24F267BBC(&qword_2699CB3D8, MEMORY[0x263F06828]);
    sub_24F274DC0();
    char v9 = 2;
    sub_24F274DC0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t WorkoutContextMenuPreviewContent.hashValue.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24F2737E0();
  uint64_t v26 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v25 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  char v9 = (char *)&v24 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE620);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE628);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F274E40();
  sub_24F1AA03C(v1, (uint64_t)v16, &qword_26B1EE628);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v16, 1, v10) == 1)
  {
    sub_24F274E60();
  }
  else
  {
    sub_24F1A9F74((uint64_t)v16, (uint64_t)v13, &qword_26B1EE620);
    sub_24F274E60();
    sub_24F273A70();
    sub_24F1A62BC((uint64_t)v13, &qword_26B1EE620);
  }
  uint64_t v17 = type metadata accessor for WorkoutContextMenuPreviewContent();
  uint64_t v18 = v1;
  sub_24F1AA03C(v1 + *(int *)(v17 + 20), (uint64_t)v9, &qword_26B1EE5F8);
  uint64_t v19 = v26;
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v20(v9, 1, v2) == 1)
  {
    sub_24F274E60();
  }
  else
  {
    uint64_t v21 = v25;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v25, v9, v2);
    sub_24F274E60();
    sub_24F267BBC(&qword_2699CB7E0, MEMORY[0x263F06828]);
    sub_24F2749E0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v2);
  }
  sub_24F1AA03C(v18 + *(int *)(v17 + 24), (uint64_t)v6, &qword_26B1EE5F8);
  if (v20(v6, 1, v2) == 1)
  {
    sub_24F274E60();
  }
  else
  {
    uint64_t v22 = v25;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v25, v6, v2);
    sub_24F274E60();
    sub_24F267BBC(&qword_2699CB7E0, MEMORY[0x263F06828]);
    sub_24F2749E0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v2);
  }
  return sub_24F274E80();
}

uint64_t WorkoutContextMenuPreviewContent.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  char v9 = (char *)&v26 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE628);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v31 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCFC8);
  uint64_t v30 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for WorkoutContextMenuPreviewContent();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = a1[3];
  BOOL v33 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_24F265EA4();
  sub_24F274E90();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  }
  uint64_t v18 = (uint64_t)v9;
  uint64_t v27 = v6;
  uint64_t v28 = v14;
  uint64_t v19 = v30;
  uint64_t v20 = (uint64_t)v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE620);
  char v36 = 0;
  sub_24F265EF8(&qword_2699CCFD0);
  uint64_t v21 = (uint64_t)v31;
  uint64_t v22 = v32;
  sub_24F274D10();
  uint64_t v23 = v20;
  sub_24F1A9F74(v21, v20, &qword_26B1EE628);
  sub_24F2737E0();
  char v35 = 1;
  sub_24F267BBC(&qword_2699CB420, MEMORY[0x263F06828]);
  sub_24F274D10();
  sub_24F1A9F74(v18, v20 + *(int *)(v28 + 20), &qword_26B1EE5F8);
  char v34 = 2;
  uint64_t v24 = (uint64_t)v27;
  sub_24F274D10();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v13, v22);
  sub_24F1A9F74(v24, v23 + *(int *)(v28 + 24), &qword_26B1EE5F8);
  sub_24F265F40(v23, v29);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  return sub_24F1B2DA8(v23);
}

uint64_t sub_24F264B68@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return WorkoutContextMenuPreviewContent.init(from:)(a1, a2);
}

uint64_t sub_24F264B80(void *a1)
{
  return WorkoutContextMenuPreviewContent.encode(to:)(a1);
}

uint64_t sub_24F264B9C(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = a2;
  uint64_t v3 = v2;
  uint64_t v4 = sub_24F2737E0();
  uint64_t v28 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v27 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v25 = (uint64_t)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE620);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE628);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F1AA03C(v3, (uint64_t)v17, &qword_26B1EE628);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v17, 1, v11) == 1)
  {
    sub_24F274E60();
  }
  else
  {
    sub_24F1A9F74((uint64_t)v17, (uint64_t)v14, &qword_26B1EE620);
    sub_24F274E60();
    sub_24F273A70();
    sub_24F1A62BC((uint64_t)v14, &qword_26B1EE620);
  }
  uint64_t v18 = v26;
  sub_24F1AA03C(v3 + *(int *)(v26 + 20), (uint64_t)v10, &qword_26B1EE5F8);
  uint64_t v19 = v28;
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
  if (v20(v10, 1, v4) == 1)
  {
    sub_24F274E60();
  }
  else
  {
    uint64_t v21 = v27;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v27, v10, v4);
    sub_24F274E60();
    sub_24F267BBC(&qword_2699CB7E0, MEMORY[0x263F06828]);
    sub_24F2749E0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v4);
  }
  uint64_t v22 = v25;
  sub_24F1AA03C(v3 + *(int *)(v18 + 24), v25, &qword_26B1EE5F8);
  if (v20((char *)v22, 1, v4) == 1) {
    return sub_24F274E60();
  }
  uint64_t v24 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v27, v22, v4);
  sub_24F274E60();
  sub_24F267BBC(&qword_2699CB7E0, MEMORY[0x263F06828]);
  sub_24F2749E0();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v24, v4);
}

uint64_t sub_24F264FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = a2;
  uint64_t v3 = sub_24F2737E0();
  uint64_t v26 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE620);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE628);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F274E40();
  sub_24F1AA03C(v2, (uint64_t)v17, &qword_26B1EE628);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v17, 1, v11) == 1)
  {
    sub_24F274E60();
  }
  else
  {
    sub_24F1A9F74((uint64_t)v17, (uint64_t)v14, &qword_26B1EE620);
    sub_24F274E60();
    sub_24F273A70();
    sub_24F1A62BC((uint64_t)v14, &qword_26B1EE620);
  }
  uint64_t v18 = v24;
  sub_24F1AA03C(v2 + *(int *)(v24 + 20), (uint64_t)v10, &qword_26B1EE5F8);
  uint64_t v19 = v26;
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v20(v10, 1, v3) == 1)
  {
    sub_24F274E60();
  }
  else
  {
    uint64_t v21 = v25;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v25, v10, v3);
    sub_24F274E60();
    sub_24F267BBC(&qword_2699CB7E0, MEMORY[0x263F06828]);
    sub_24F2749E0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v3);
  }
  sub_24F1AA03C(v2 + *(int *)(v18 + 24), (uint64_t)v7, &qword_26B1EE5F8);
  if (v20(v7, 1, v3) == 1)
  {
    sub_24F274E60();
  }
  else
  {
    uint64_t v22 = v25;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v25, v7, v3);
    sub_24F274E60();
    sub_24F267BBC(&qword_2699CB7E0, MEMORY[0x263F06828]);
    sub_24F2749E0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v3);
  }
  return sub_24F274E80();
}

BOOL _s20FitnessProductDetail32WorkoutContextMenuPreviewContentV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v79 = a2;
  uint64_t v3 = sub_24F2737E0();
  uint64_t v72 = *(void *)(v3 - 8);
  uint64_t v73 = v3;
  MEMORY[0x270FA5388](v3);
  long long v67 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CB470);
  uint64_t v5 = MEMORY[0x270FA5388](v75);
  uint64_t v70 = (uint64_t)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v74 = (uint64_t)&v66 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v66 = (uint64_t)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v68 = (uint64_t)&v66 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v69 = (uint64_t)&v66 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v71 = (uint64_t)&v66 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v77 = (uint64_t)&v66 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v78 = (uint64_t)&v66 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE620);
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CCFF8);
  uint64_t v25 = v24 - 8;
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v66 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE628);
  uint64_t v29 = MEMORY[0x270FA5388](v28 - 8);
  uint64_t v31 = (char *)&v66 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  char v34 = (char *)&v66 - v33;
  MEMORY[0x270FA5388](v32);
  char v36 = (char *)&v66 - v35;
  uint64_t v76 = a1;
  sub_24F1AA03C(a1, (uint64_t)&v66 - v35, &qword_26B1EE628);
  sub_24F1AA03C(v79, (uint64_t)v34, &qword_26B1EE628);
  uint64_t v37 = (uint64_t)&v27[*(int *)(v25 + 56)];
  sub_24F1AA03C((uint64_t)v36, (uint64_t)v27, &qword_26B1EE628);
  sub_24F1AA03C((uint64_t)v34, v37, &qword_26B1EE628);
  uint64_t v38 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48);
  if (v38((uint64_t)v27, 1, v20) == 1)
  {
    sub_24F1A62BC((uint64_t)v34, &qword_26B1EE628);
    sub_24F1A62BC((uint64_t)v36, &qword_26B1EE628);
    if (v38(v37, 1, v20) == 1)
    {
      sub_24F1A62BC((uint64_t)v27, &qword_26B1EE628);
      goto LABEL_8;
    }
LABEL_6:
    char v39 = &qword_2699CCFF8;
    uint64_t v40 = (uint64_t)v27;
LABEL_21:
    sub_24F1A62BC(v40, v39);
    return 0;
  }
  sub_24F1AA03C((uint64_t)v27, (uint64_t)v31, &qword_26B1EE628);
  if (v38(v37, 1, v20) == 1)
  {
    sub_24F1A62BC((uint64_t)v34, &qword_26B1EE628);
    sub_24F1A62BC((uint64_t)v36, &qword_26B1EE628);
    sub_24F1A62BC((uint64_t)v31, &qword_26B1EE620);
    goto LABEL_6;
  }
  sub_24F1A9F74(v37, (uint64_t)v23, &qword_26B1EE620);
  type metadata accessor for WorkoutContextMenuPreviewArtwork();
  sub_24F267BBC(&qword_2699CD000, (void (*)(uint64_t))type metadata accessor for WorkoutContextMenuPreviewArtwork);
  char v41 = sub_24F273A60();
  sub_24F1A62BC((uint64_t)v23, &qword_26B1EE620);
  sub_24F1A62BC((uint64_t)v34, &qword_26B1EE628);
  sub_24F1A62BC((uint64_t)v36, &qword_26B1EE628);
  sub_24F1A62BC((uint64_t)v31, &qword_26B1EE620);
  sub_24F1A62BC((uint64_t)v27, &qword_26B1EE628);
  if ((v41 & 1) == 0) {
    return 0;
  }
LABEL_8:
  uint64_t v42 = type metadata accessor for WorkoutContextMenuPreviewContent();
  uint64_t v43 = v78;
  sub_24F1AA03C(v76 + *(int *)(v42 + 20), v78, &qword_26B1EE5F8);
  uint64_t v44 = v77;
  sub_24F1AA03C(v79 + *(int *)(v42 + 20), v77, &qword_26B1EE5F8);
  uint64_t v45 = v74;
  uint64_t v46 = v74 + *(int *)(v75 + 48);
  sub_24F1AA03C(v43, v74, &qword_26B1EE5F8);
  sub_24F1AA03C(v44, v46, &qword_26B1EE5F8);
  uint64_t v48 = v72;
  uint64_t v47 = v73;
  unint64_t v49 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48);
  if (v49(v45, 1, v73) != 1)
  {
    uint64_t v50 = v71;
    sub_24F1AA03C(v45, v71, &qword_26B1EE5F8);
    if (v49(v46, 1, v47) != 1)
    {
      uint64_t v51 = v67;
      (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v67, v46, v47);
      sub_24F267BBC(&qword_2699CB480, MEMORY[0x263F06828]);
      char v52 = sub_24F274A00();
      uint64_t v53 = v50;
      uint64_t v54 = *(void (**)(char *, uint64_t))(v48 + 8);
      v54(v51, v47);
      sub_24F1A62BC(v77, &qword_26B1EE5F8);
      sub_24F1A62BC(v78, &qword_26B1EE5F8);
      v54((char *)v53, v47);
      sub_24F1A62BC(v74, &qword_26B1EE5F8);
      if ((v52 & 1) == 0) {
        return 0;
      }
      goto LABEL_15;
    }
    sub_24F1A62BC(v77, &qword_26B1EE5F8);
    sub_24F1A62BC(v78, &qword_26B1EE5F8);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v50, v47);
    goto LABEL_13;
  }
  sub_24F1A62BC(v44, &qword_26B1EE5F8);
  sub_24F1A62BC(v43, &qword_26B1EE5F8);
  if (v49(v46, 1, v47) != 1)
  {
LABEL_13:
    char v39 = &qword_2699CB470;
    uint64_t v40 = v45;
    goto LABEL_21;
  }
  sub_24F1A62BC(v45, &qword_26B1EE5F8);
LABEL_15:
  uint64_t v55 = v69;
  sub_24F1AA03C(v76 + *(int *)(v42 + 24), v69, &qword_26B1EE5F8);
  uint64_t v56 = v79 + *(int *)(v42 + 24);
  uint64_t v57 = v68;
  sub_24F1AA03C(v56, v68, &qword_26B1EE5F8);
  uint64_t v58 = v70;
  uint64_t v59 = v70 + *(int *)(v75 + 48);
  sub_24F1AA03C(v55, v70, &qword_26B1EE5F8);
  sub_24F1AA03C(v57, v59, &qword_26B1EE5F8);
  if (v49(v58, 1, v47) == 1)
  {
    sub_24F1A62BC(v57, &qword_26B1EE5F8);
    sub_24F1A62BC(v55, &qword_26B1EE5F8);
    if (v49(v59, 1, v47) == 1)
    {
      sub_24F1A62BC(v58, &qword_26B1EE5F8);
      return 1;
    }
    goto LABEL_20;
  }
  uint64_t v60 = v66;
  sub_24F1AA03C(v58, v66, &qword_26B1EE5F8);
  if (v49(v59, 1, v47) == 1)
  {
    sub_24F1A62BC(v57, &qword_26B1EE5F8);
    sub_24F1A62BC(v55, &qword_26B1EE5F8);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v60, v47);
LABEL_20:
    char v39 = &qword_2699CB470;
    uint64_t v40 = v58;
    goto LABEL_21;
  }
  uint64_t v62 = v57;
  uint64_t v63 = v67;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v67, v59, v47);
  sub_24F267BBC(&qword_2699CB480, MEMORY[0x263F06828]);
  char v64 = sub_24F274A00();
  long long v65 = *(void (**)(char *, uint64_t))(v48 + 8);
  v65(v63, v47);
  sub_24F1A62BC(v62, &qword_26B1EE5F8);
  sub_24F1A62BC(v55, &qword_26B1EE5F8);
  v65((char *)v60, v47);
  sub_24F1A62BC(v58, &qword_26B1EE5F8);
  return (v64 & 1) != 0;
}

uint64_t type metadata accessor for WorkoutContextMenuPreviewContent()
{
  uint64_t result = qword_26B1EE8F0;
  if (!qword_26B1EE8F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24F265EA4()
{
  unint64_t result = qword_2699CCFB8;
  if (!qword_2699CCFB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCFB8);
  }
  return result;
}

uint64_t sub_24F265EF8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1EE620);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24F265F40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WorkoutContextMenuPreviewContent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F265FA4()
{
  return sub_24F267BBC(&qword_2699CCFD8, (void (*)(uint64_t))type metadata accessor for WorkoutContextMenuPreviewContent);
}

uint64_t *initializeBufferWithCopyOfBuffer for WorkoutContextMenuPreviewContent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE620);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE628);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v11 = &qword_2699CA7C8;
      }
      else {
        uint64_t v11 = &qword_2699CA7C0;
      }
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(v11);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v13 = *(int *)(a3 + 20);
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_24F2737E0();
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    if (v18(v15, 1, v16))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
      memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    uint64_t v20 = *(int *)(a3 + 24);
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    if (v18(v22, 1, v16))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
      memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v21, v22, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v21, 0, 1, v16);
    }
  }
  return a1;
}

uint64_t destroy for WorkoutContextMenuPreviewContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE620);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
  {
    if (swift_getEnumCaseMultiPayload() == 1) {
      int v5 = &qword_2699CA7C8;
    }
    else {
      int v5 = &qword_2699CA7C0;
    }
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(v5);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 20);
  uint64_t v8 = sub_24F2737E0();
  uint64_t v13 = *(void *)(v8 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (!v9(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v7, v8);
  }
  uint64_t v10 = a1 + *(int *)(a2 + 24);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v9)(v10, 1, v8);
  if (!result)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
    return v12(v10, v8);
  }
  return result;
}

char *initializeWithCopy for WorkoutContextMenuPreviewContent(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE620);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE628);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v9 = &qword_2699CA7C8;
    }
    else {
      uint64_t v9 = &qword_2699CA7C0;
    }
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(v9);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = sub_24F2737E0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v16(v13, 1, v14))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v18 = *(int *)(a3 + 24);
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  if (v16(v20, 1, v14))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v20, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v19, 0, 1, v14);
  }
  return a1;
}

char *assignWithCopy for WorkoutContextMenuPreviewContent(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE620);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v11 = &qword_2699CA7C8;
      }
      else {
        uint64_t v11 = &qword_2699CA7C0;
      }
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(v11);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE628);
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_10;
  }
  if (v10)
  {
    sub_24F1A62BC((uint64_t)a1, &qword_26B1EE620);
    goto LABEL_9;
  }
  if (a1 != a2)
  {
    sub_24F1A62BC((uint64_t)a1, &qword_26B1EE620);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA7C8);
    }
    else {
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA7C0);
    }
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(a1, a2, v30);
    swift_storeEnumTagMultiPayload();
  }
LABEL_10:
  uint64_t v14 = *(int *)(a3 + 20);
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = sub_24F2737E0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19(v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
LABEL_15:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
    memcpy(v15, v16, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_16;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v15, v16, v17);
LABEL_16:
  uint64_t v23 = *(int *)(a3 + 24);
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  int v26 = v19(&a1[v23], 1, v17);
  int v27 = v19(v25, 1, v17);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v24, v25, v17);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v24, v17);
    goto LABEL_21;
  }
  if (v27)
  {
LABEL_21:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v24, v25, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v24, 0, 1, v17);
  return a1;
}

char *initializeWithTake for WorkoutContextMenuPreviewContent(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE620);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE628);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1) {
      int v9 = &qword_2699CA7C8;
    }
    else {
      int v9 = &qword_2699CA7C0;
    }
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(v9);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = sub_24F2737E0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v16(v13, 1, v14))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v18 = *(int *)(a3 + 24);
  uint64_t v19 = &a1[v18];
  int v20 = &a2[v18];
  if (v16(v20, 1, v14))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v19, v20, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v19, 0, 1, v14);
  }
  return a1;
}

char *assignWithTake for WorkoutContextMenuPreviewContent(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE620);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v11 = &qword_2699CA7C8;
      }
      else {
        uint64_t v11 = &qword_2699CA7C0;
      }
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(v11);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, a2, v12);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE628);
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_10;
  }
  if (v10)
  {
    sub_24F1A62BC((uint64_t)a1, &qword_26B1EE620);
    goto LABEL_9;
  }
  if (a1 != a2)
  {
    sub_24F1A62BC((uint64_t)a1, &qword_26B1EE620);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA7C8);
    }
    else {
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA7C0);
    }
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(a1, a2, v30);
    swift_storeEnumTagMultiPayload();
  }
LABEL_10:
  uint64_t v14 = *(int *)(a3 + 20);
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = sub_24F2737E0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19(v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
LABEL_15:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
    memcpy(v15, v16, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_16;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v15, v16, v17);
LABEL_16:
  uint64_t v23 = *(int *)(a3 + 24);
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  int v26 = v19(&a1[v23], 1, v17);
  int v27 = v19(v25, 1, v17);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v24, v25, v17);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v24, v17);
    goto LABEL_21;
  }
  if (v27)
  {
LABEL_21:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v24, v25, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v24, 0, 1, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutContextMenuPreviewContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F2674D4);
}

uint64_t sub_24F2674D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE628);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for WorkoutContextMenuPreviewContent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F2675E8);
}

uint64_t sub_24F2675E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE628);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1EE5F8);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_24F2676F4()
{
  sub_24F2677BC();
  if (v0 <= 0x3F)
  {
    sub_24F267818();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_24F2677BC()
{
  if (!qword_26B1EE630)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1EE620);
    unint64_t v0 = sub_24F274BF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B1EE630);
    }
  }
}

void sub_24F267818()
{
  if (!qword_26B1EE600)
  {
    sub_24F2737E0();
    unint64_t v0 = sub_24F274BF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B1EE600);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for WorkoutContextMenuPreviewContent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F26793CLL);
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

ValueMetadata *type metadata accessor for WorkoutContextMenuPreviewContent.CodingKeys()
{
  return &type metadata for WorkoutContextMenuPreviewContent.CodingKeys;
}

unint64_t sub_24F267978()
{
  unint64_t result = qword_2699CCFE0;
  if (!qword_2699CCFE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCFE0);
  }
  return result;
}

unint64_t sub_24F2679D0()
{
  unint64_t result = qword_2699CCFE8;
  if (!qword_2699CCFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCFE8);
  }
  return result;
}

unint64_t sub_24F267A28()
{
  unint64_t result = qword_2699CCFF0;
  if (!qword_2699CCFF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CCFF0);
  }
  return result;
}

uint64_t sub_24F267A7C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6B726F77747261 && a2 == 0xE700000000000000;
  if (v3 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24F274E20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24F267BBC(unint64_t *a1, void (*a2)(uint64_t))
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

BOOL static EditorialDetailSizeClass.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24F267C14(char a1)
{
  return *(void *)&aExtrasmasmall[8 * a1];
}

uint64_t sub_24F267C34()
{
  return sub_24F267C14(*v0);
}

uint64_t sub_24F267C3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F268890(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F267C64(uint64_t a1)
{
  unint64_t v2 = sub_24F268564();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F267CA0(uint64_t a1)
{
  unint64_t v2 = sub_24F268564();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F267CDC(uint64_t a1)
{
  unint64_t v2 = sub_24F2685B8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F267D18(uint64_t a1)
{
  unint64_t v2 = sub_24F2685B8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F267D54(uint64_t a1)
{
  unint64_t v2 = sub_24F26875C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F267D90(uint64_t a1)
{
  unint64_t v2 = sub_24F26875C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F267DCC(uint64_t a1)
{
  unint64_t v2 = sub_24F26860C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F267E08(uint64_t a1)
{
  unint64_t v2 = sub_24F26860C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F267E44(uint64_t a1)
{
  unint64_t v2 = sub_24F268660();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F267E80(uint64_t a1)
{
  unint64_t v2 = sub_24F268660();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F267EBC(uint64_t a1)
{
  unint64_t v2 = sub_24F2686B4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F267EF8(uint64_t a1)
{
  unint64_t v2 = sub_24F2686B4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F267F34(uint64_t a1)
{
  unint64_t v2 = sub_24F268708();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F267F70(uint64_t a1)
{
  unint64_t v2 = sub_24F268708();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t EditorialDetailSizeClass.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v40 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD008);
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v37 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD010);
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  MEMORY[0x270FA5388](v5);
  char v34 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD018);
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v33 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v31 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD020);
  uint64_t v29 = *(void *)(v9 - 8);
  uint64_t v30 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v28 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD028);
  uint64_t v26 = *(void *)(v11 - 8);
  uint64_t v27 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD030);
  uint64_t v25 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD038);
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  int v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F268564();
  sub_24F274EA0();
  switch((char)v40)
  {
    case 1:
      char v42 = 1;
      sub_24F268708();
      sub_24F274D80();
      uint64_t v22 = v26;
      uint64_t v21 = v27;
      goto LABEL_8;
    case 2:
      char v43 = 2;
      sub_24F2686B4();
      uint64_t v13 = v28;
      sub_24F274D80();
      uint64_t v22 = v29;
      uint64_t v21 = v30;
      goto LABEL_8;
    case 3:
      char v44 = 3;
      sub_24F268660();
      uint64_t v13 = v31;
      sub_24F274D80();
      uint64_t v22 = v32;
      uint64_t v21 = v33;
      goto LABEL_8;
    case 4:
      char v45 = 4;
      sub_24F26860C();
      uint64_t v13 = v34;
      sub_24F274D80();
      uint64_t v22 = v35;
      uint64_t v21 = v36;
      goto LABEL_8;
    case 5:
      char v46 = 5;
      sub_24F2685B8();
      uint64_t v13 = v37;
      sub_24F274D80();
      uint64_t v22 = v38;
      uint64_t v21 = v39;
LABEL_8:
      (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v21);
      break;
    default:
      char v41 = 0;
      sub_24F26875C();
      sub_24F274D80();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v14);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
}

unint64_t sub_24F268564()
{
  unint64_t result = qword_2699CD040;
  if (!qword_2699CD040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD040);
  }
  return result;
}

unint64_t sub_24F2685B8()
{
  unint64_t result = qword_2699CD048;
  if (!qword_2699CD048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD048);
  }
  return result;
}

unint64_t sub_24F26860C()
{
  unint64_t result = qword_2699CD050;
  if (!qword_2699CD050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD050);
  }
  return result;
}

unint64_t sub_24F268660()
{
  unint64_t result = qword_2699CD058;
  if (!qword_2699CD058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD058);
  }
  return result;
}

unint64_t sub_24F2686B4()
{
  unint64_t result = qword_2699CD060;
  if (!qword_2699CD060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD060);
  }
  return result;
}

unint64_t sub_24F268708()
{
  unint64_t result = qword_2699CD068;
  if (!qword_2699CD068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD068);
  }
  return result;
}

unint64_t sub_24F26875C()
{
  unint64_t result = qword_2699CD070;
  if (!qword_2699CD070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD070);
  }
  return result;
}

char *EditorialDetailSizeClass.init(from:)(void *a1)
{
  return sub_24F268AE4(a1);
}

char *sub_24F2687C8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24F268AE4(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24F2687F4(void *a1)
{
  return EditorialDetailSizeClass.encode(to:)(a1, *v1);
}

BOOL static EditorialDetailSizeClass.< infix(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  return a1 < a2;
}

uint64_t EditorialDetailSizeClass.hash(into:)()
{
  return sub_24F274E50();
}

uint64_t EditorialDetailSizeClass.hashValue.getter()
{
  return sub_24F274E80();
}

uint64_t sub_24F268890(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x616D536172747865 && a2 == 0xEA00000000006C6CLL || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6C616D73 && a2 == 0xE500000000000000 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x72616C75676572 && a2 == 0xE700000000000000 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D756964656DLL && a2 == 0xE600000000000000 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656772616CLL && a2 == 0xE500000000000000 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x72614C6172747865 && a2 == 0xEA00000000006567)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v5 = sub_24F274E20();
    swift_bridgeObjectRelease();
    if (v5) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

char *sub_24F268AE4(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD0F8);
  uint64_t v41 = *(void *)(v2 - 8);
  uint64_t v42 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v55 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD100);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v50 = v4;
  uint64_t v51 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v54 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD108);
  uint64_t v46 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v53 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD110);
  uint64_t v47 = *(void *)(v8 - 8);
  uint64_t v48 = v8;
  MEMORY[0x270FA5388](v8);
  char v52 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD118);
  uint64_t v44 = *(void *)(v10 - 8);
  uint64_t v45 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD120);
  uint64_t v43 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD128);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = a1[3];
  uint64_t v56 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_24F268564();
  uint64_t v21 = v57;
  sub_24F274E90();
  if (!v21)
  {
    uint64_t v38 = v13;
    uint64_t v39 = v15;
    uint64_t v40 = v12;
    uint64_t v22 = v52;
    uint64_t v23 = v53;
    uint64_t v24 = v54;
    uint64_t v25 = v55;
    uint64_t v57 = (char *)v16;
    uint64_t v26 = v19;
    uint64_t v27 = sub_24F274D70();
    if (*(void *)(v27 + 16) == 1)
    {
      uint64_t v19 = (char *)*(unsigned __int8 *)(v27 + 32);
      switch(*(unsigned char *)(v27 + 32))
      {
        case 1:
          char v59 = 1;
          sub_24F268708();
          uint64_t v24 = v40;
          uint64_t v29 = v57;
          sub_24F274CC0();
          uint64_t v35 = v44;
          uint64_t v34 = v45;
          goto LABEL_12;
        case 2:
          char v60 = 2;
          sub_24F2686B4();
          uint64_t v24 = v22;
          uint64_t v29 = v57;
          sub_24F274CC0();
          uint64_t v35 = v47;
          uint64_t v34 = v48;
          goto LABEL_12;
        case 3:
          char v61 = 3;
          sub_24F268660();
          uint64_t v36 = v57;
          sub_24F274CC0();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v23, v49);
          goto LABEL_14;
        case 4:
          char v62 = 4;
          sub_24F26860C();
          uint64_t v29 = v57;
          sub_24F274CC0();
          uint64_t v34 = v50;
          uint64_t v35 = v51;
LABEL_12:
          (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v34);
          goto LABEL_13;
        case 5:
          char v63 = 5;
          sub_24F2685B8();
          uint64_t v36 = v57;
          sub_24F274CC0();
          (*(void (**)(char *, uint64_t))(v41 + 8))(v25, v42);
LABEL_14:
          swift_bridgeObjectRelease();
          (*(void (**)(char *, char *))(v17 + 8))(v26, v36);
          break;
        default:
          char v58 = 0;
          sub_24F26875C();
          uint64_t v28 = v39;
          uint64_t v29 = v57;
          sub_24F274CC0();
          (*(void (**)(char *, uint64_t))(v43 + 8))(v28, v38);
LABEL_13:
          swift_bridgeObjectRelease();
          (*(void (**)(char *, char *))(v17 + 8))(v26, v29);
          break;
      }
    }
    else
    {
      uint64_t v30 = sub_24F274C70();
      swift_allocError();
      uint64_t v32 = v31;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA150);
      *uint64_t v32 = &type metadata for EditorialDetailSizeClass;
      uint64_t v19 = v57;
      sub_24F274CD0();
      sub_24F274C60();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, *MEMORY[0x263F8DCB0], v30);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v17 + 8))(v26, v19);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
  return v19;
}

unint64_t sub_24F269290()
{
  unint64_t result = qword_2699CD078;
  if (!qword_2699CD078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD078);
  }
  return result;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass()
{
  return &type metadata for EditorialDetailSizeClass;
}

unsigned char *_s20FitnessProductDetail24EditorialDetailSizeClassOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F2693C8);
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

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.CodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.CodingKeys;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.ExtraSmallCodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.ExtraSmallCodingKeys;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.SmallCodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.SmallCodingKeys;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.RegularCodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.RegularCodingKeys;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.MediumCodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.MediumCodingKeys;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.LargeCodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.LargeCodingKeys;
}

ValueMetadata *type metadata accessor for EditorialDetailSizeClass.ExtraLargeCodingKeys()
{
  return &type metadata for EditorialDetailSizeClass.ExtraLargeCodingKeys;
}

unint64_t sub_24F269464()
{
  unint64_t result = qword_2699CD080;
  if (!qword_2699CD080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD080);
  }
  return result;
}

unint64_t sub_24F2694BC()
{
  unint64_t result = qword_2699CD088;
  if (!qword_2699CD088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD088);
  }
  return result;
}

unint64_t sub_24F269514()
{
  unint64_t result = qword_2699CD090;
  if (!qword_2699CD090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD090);
  }
  return result;
}

unint64_t sub_24F26956C()
{
  unint64_t result = qword_2699CD098;
  if (!qword_2699CD098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD098);
  }
  return result;
}

unint64_t sub_24F2695C4()
{
  unint64_t result = qword_2699CD0A0;
  if (!qword_2699CD0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD0A0);
  }
  return result;
}

unint64_t sub_24F26961C()
{
  unint64_t result = qword_2699CD0A8;
  if (!qword_2699CD0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD0A8);
  }
  return result;
}

unint64_t sub_24F269674()
{
  unint64_t result = qword_2699CD0B0;
  if (!qword_2699CD0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD0B0);
  }
  return result;
}

unint64_t sub_24F2696CC()
{
  unint64_t result = qword_2699CD0B8;
  if (!qword_2699CD0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD0B8);
  }
  return result;
}

unint64_t sub_24F269724()
{
  unint64_t result = qword_2699CD0C0;
  if (!qword_2699CD0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD0C0);
  }
  return result;
}

unint64_t sub_24F26977C()
{
  unint64_t result = qword_2699CD0C8;
  if (!qword_2699CD0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD0C8);
  }
  return result;
}

unint64_t sub_24F2697D4()
{
  unint64_t result = qword_2699CD0D0;
  if (!qword_2699CD0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD0D0);
  }
  return result;
}

unint64_t sub_24F26982C()
{
  unint64_t result = qword_2699CD0D8;
  if (!qword_2699CD0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD0D8);
  }
  return result;
}

unint64_t sub_24F269884()
{
  unint64_t result = qword_2699CD0E0;
  if (!qword_2699CD0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD0E0);
  }
  return result;
}

unint64_t sub_24F2698DC()
{
  unint64_t result = qword_2699CD0E8;
  if (!qword_2699CD0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD0E8);
  }
  return result;
}

unint64_t sub_24F269934()
{
  unint64_t result = qword_2699CD0F0;
  if (!qword_2699CD0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD0F0);
  }
  return result;
}

uint64_t WorkoutSchedule.init(nextWorkout:additionalDays:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24F2739D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t result = type metadata accessor for WorkoutSchedule();
  *(void *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for WorkoutSchedule()
{
  uint64_t result = qword_26B1EE740;
  if (!qword_26B1EE740) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24F269A50(char a1)
{
  if (a1) {
    return 0x6E6F697469646461;
  }
  else {
    return 0x6B726F577478656ELL;
  }
}

uint64_t sub_24F269A9C()
{
  return sub_24F269A50(*v0);
}

uint64_t sub_24F269AA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F26A88C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F269ACC(uint64_t a1)
{
  unint64_t v2 = sub_24F269CE4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F269B08(uint64_t a1)
{
  unint64_t v2 = sub_24F269CE4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WorkoutSchedule.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD130);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F269CE4();
  sub_24F274EA0();
  v8[15] = 0;
  sub_24F2739D0();
  sub_24F26A048(&qword_2699CD140);
  sub_24F274E10();
  if (!v1)
  {
    type metadata accessor for WorkoutSchedule();
    v8[14] = 1;
    sub_24F274E00();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24F269CE4()
{
  unint64_t result = qword_2699CD138;
  if (!qword_2699CD138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD138);
  }
  return result;
}

uint64_t WorkoutSchedule.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v4 = sub_24F2739D0();
  uint64_t v22 = *(void *)(v4 - 8);
  uint64_t v23 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD148);
  uint64_t v21 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WorkoutSchedule();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F269CE4();
  sub_24F274E90();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v19 = v11;
  uint64_t v12 = v21;
  uint64_t v13 = v22;
  char v26 = 0;
  sub_24F26A048(&qword_2699CD150);
  uint64_t v14 = v23;
  sub_24F274D60();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v19, v6, v14);
  char v25 = 1;
  uint64_t v15 = sub_24F274D50();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v24);
  uint64_t v17 = (uint64_t)v19;
  uint64_t v16 = v20;
  *(void *)&v19[*(int *)(v9 + 20)] = v15;
  sub_24F26A08C(v17, v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24F1EB600(v17);
}

uint64_t sub_24F26A048(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24F2739D0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24F26A08C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WorkoutSchedule();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F26A0F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return WorkoutSchedule.init(from:)(a1, a2);
}

uint64_t sub_24F26A108(void *a1)
{
  return WorkoutSchedule.encode(to:)(a1);
}

BOOL static WorkoutSchedule.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_24F2739B0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for WorkoutSchedule();
  return *(void *)(a1 + *(int *)(v4 + 20)) == *(void *)(a2 + *(int *)(v4 + 20));
}

BOOL sub_24F26A170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (sub_24F2739B0() & 1) != 0 && *(void *)(a1 + *(int *)(a3 + 20)) == *(void *)(a2 + *(int *)(a3 + 20));
}

uint64_t *initializeBufferWithCopyOfBuffer for WorkoutSchedule(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24F2739D0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for WorkoutSchedule(uint64_t a1)
{
  uint64_t v2 = sub_24F2739D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for WorkoutSchedule(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F2739D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for WorkoutSchedule(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F2739D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for WorkoutSchedule(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F2739D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for WorkoutSchedule(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F2739D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutSchedule(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F26A4F8);
}

uint64_t sub_24F26A4F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F2739D0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for WorkoutSchedule(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F26A578);
}

uint64_t sub_24F26A578(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F2739D0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_24F26A5E8()
{
  uint64_t result = sub_24F2739D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for WorkoutSchedule.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x24F26A74CLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutSchedule.CodingKeys()
{
  return &type metadata for WorkoutSchedule.CodingKeys;
}

unint64_t sub_24F26A788()
{
  unint64_t result = qword_2699CD158;
  if (!qword_2699CD158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD158);
  }
  return result;
}

unint64_t sub_24F26A7E0()
{
  unint64_t result = qword_2699CD160;
  if (!qword_2699CD160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD160);
  }
  return result;
}

unint64_t sub_24F26A838()
{
  unint64_t result = qword_2699CD168;
  if (!qword_2699CD168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD168);
  }
  return result;
}

uint64_t sub_24F26A88C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6B726F577478656ELL && a2 == 0xEB0000000074756FLL;
  if (v3 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697469646461 && a2 == 0xEE00737961446C61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F274E20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

BOOL static WorkoutProgramLinkPlatform.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24F26A9B8(char a1)
{
  if (a1) {
    return 0x72657474697774;
  }
  else {
    return 0x6172676174736E69;
  }
}

uint64_t sub_24F26A9F4()
{
  return sub_24F26A9B8(*v0);
}

uint64_t sub_24F26A9FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F26B820(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F26AA24(uint64_t a1)
{
  unint64_t v2 = sub_24F26AE30();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F26AA60(uint64_t a1)
{
  unint64_t v2 = sub_24F26AE30();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F26AA9C(uint64_t a1)
{
  unint64_t v2 = sub_24F26AED8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F26AAD8(uint64_t a1)
{
  unint64_t v2 = sub_24F26AED8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F26AB14(uint64_t a1)
{
  unint64_t v2 = sub_24F26AE84();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F26AB50(uint64_t a1)
{
  unint64_t v2 = sub_24F26AE84();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WorkoutProgramLinkPlatform.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD170);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD178);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD180);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F26AE30();
  sub_24F274EA0();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24F26AE84();
    uint64_t v14 = v18;
    sub_24F274D80();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24F26AED8();
    sub_24F274D80();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_24F26AE30()
{
  unint64_t result = qword_2699CD188;
  if (!qword_2699CD188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD188);
  }
  return result;
}

unint64_t sub_24F26AE84()
{
  unint64_t result = qword_2699CD190;
  if (!qword_2699CD190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD190);
  }
  return result;
}

unint64_t sub_24F26AED8()
{
  unint64_t result = qword_2699CD198;
  if (!qword_2699CD198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD198);
  }
  return result;
}

uint64_t WorkoutProgramLinkPlatform.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD1A0);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD1A8);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD1B0);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F26AE30();
  uint64_t v11 = v32;
  sub_24F274E90();
  if (v11) {
    goto LABEL_6;
  }
  uint64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  uint64_t v14 = v10;
  uint64_t v15 = sub_24F274D70();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24F274C70();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA150);
    *char v22 = &type metadata for WorkoutProgramLinkPlatform;
    sub_24F274CD0();
    sub_24F274C60();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_24F26AE84();
    uint64_t v18 = v14;
    sub_24F274CC0();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24F26AED8();
    sub_24F274CC0();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_24F26B384@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return WorkoutProgramLinkPlatform.init(from:)(a1, a2);
}

uint64_t sub_24F26B39C(void *a1)
{
  return WorkoutProgramLinkPlatform.encode(to:)(a1);
}

uint64_t WorkoutProgramLinkPlatform.hash(into:)()
{
  return sub_24F274E50();
}

uint64_t WorkoutProgramLinkPlatform.hashValue.getter()
{
  return sub_24F274E80();
}

unint64_t sub_24F26B42C()
{
  unint64_t result = qword_2699CD1B8;
  if (!qword_2699CD1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD1B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutProgramLinkPlatform()
{
  return &type metadata for WorkoutProgramLinkPlatform;
}

unsigned char *_s20FitnessProductDetail26WorkoutProgramLinkPlatformOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F26B560);
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

ValueMetadata *type metadata accessor for WorkoutProgramLinkPlatform.CodingKeys()
{
  return &type metadata for WorkoutProgramLinkPlatform.CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutProgramLinkPlatform.InstagramCodingKeys()
{
  return &type metadata for WorkoutProgramLinkPlatform.InstagramCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutProgramLinkPlatform.TwitterCodingKeys()
{
  return &type metadata for WorkoutProgramLinkPlatform.TwitterCodingKeys;
}

unint64_t sub_24F26B5BC()
{
  unint64_t result = qword_2699CD1C0;
  if (!qword_2699CD1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD1C0);
  }
  return result;
}

unint64_t sub_24F26B614()
{
  unint64_t result = qword_2699CD1C8;
  if (!qword_2699CD1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD1C8);
  }
  return result;
}

unint64_t sub_24F26B66C()
{
  unint64_t result = qword_2699CD1D0;
  if (!qword_2699CD1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD1D0);
  }
  return result;
}

unint64_t sub_24F26B6C4()
{
  unint64_t result = qword_2699CD1D8;
  if (!qword_2699CD1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD1D8);
  }
  return result;
}

unint64_t sub_24F26B71C()
{
  unint64_t result = qword_2699CD1E0;
  if (!qword_2699CD1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD1E0);
  }
  return result;
}

unint64_t sub_24F26B774()
{
  unint64_t result = qword_2699CD1E8;
  if (!qword_2699CD1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD1E8);
  }
  return result;
}

unint64_t sub_24F26B7CC()
{
  unint64_t result = qword_2699CD1F0;
  if (!qword_2699CD1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD1F0);
  }
  return result;
}

uint64_t sub_24F26B820(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6172676174736E69 && a2 == 0xE90000000000006DLL;
  if (v3 || (sub_24F274E20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72657474697774 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F274E20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t EditorialPreview.streamingProgramIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EditorialPreview.streamingURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for EditorialPreview() + 20);
  uint64_t v4 = sub_24F273900();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for EditorialPreview()
{
  uint64_t result = qword_26B1EE790;
  if (!qword_26B1EE790) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t EditorialPreview.init(streamingProgramIdentifier:streamingURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = a1;
  a4[1] = a2;
  uint64_t v5 = (char *)a4 + *(int *)(type metadata accessor for EditorialPreview() + 20);
  uint64_t v6 = sub_24F273900();
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  return v7(v5, a3, v6);
}

uint64_t sub_24F26BA88(uint64_t a1)
{
  unint64_t v2 = sub_24F26BCB8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F26BAC4(uint64_t a1)
{
  unint64_t v2 = sub_24F26BCB8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t EditorialPreview.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD1F8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F26BCB8();
  sub_24F274EA0();
  v8[15] = 0;
  sub_24F274D90();
  if (!v1)
  {
    type metadata accessor for EditorialPreview();
    v8[14] = 1;
    sub_24F273900();
    sub_24F26C660(&qword_2699CA528, MEMORY[0x263F06EA8]);
    sub_24F274E10();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24F26BCB8()
{
  unint64_t result = qword_2699CD200;
  if (!qword_2699CD200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD200);
  }
  return result;
}

uint64_t EditorialPreview.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v24 = sub_24F273900();
  uint64_t v21 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD208);
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for EditorialPreview();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (uint64_t *)((char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F26BCB8();
  sub_24F274E90();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v19 = v8;
  uint64_t v20 = v5;
  uint64_t v12 = v23;
  uint64_t v11 = v24;
  char v27 = 0;
  uint64_t v13 = v25;
  uint64_t v14 = (uint64_t)v10;
  *uint64_t v10 = sub_24F274CE0();
  v10[1] = v15;
  char v26 = 1;
  sub_24F26C660(&qword_2699CA540, MEMORY[0x263F06EA8]);
  char v16 = v20;
  sub_24F274D60();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v14 + *(int *)(v19 + 20), v16, v11);
  sub_24F26C018(v14, v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24F26C07C(v14);
}

uint64_t sub_24F26C018(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EditorialPreview();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F26C07C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EditorialPreview();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F26C0D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return EditorialPreview.init(from:)(a1, a2);
}

uint64_t sub_24F26C0F0(void *a1)
{
  return EditorialPreview.encode(to:)(a1);
}

uint64_t EditorialPreview.hash(into:)()
{
  if (*(void *)(v0 + 8))
  {
    sub_24F274E60();
    swift_bridgeObjectRetain();
    sub_24F274A70();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24F274E60();
  }
  type metadata accessor for EditorialPreview();
  sub_24F273900();
  sub_24F26C660(&qword_2699CA480, MEMORY[0x263F06EA8]);
  return sub_24F2749E0();
}

uint64_t EditorialPreview.hashValue.getter()
{
  sub_24F274E40();
  if (*(void *)(v0 + 8))
  {
    sub_24F274E60();
    swift_bridgeObjectRetain();
    sub_24F274A70();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24F274E60();
  }
  type metadata accessor for EditorialPreview();
  sub_24F273900();
  sub_24F26C660(&qword_2699CA480, MEMORY[0x263F06EA8]);
  sub_24F2749E0();
  return sub_24F274E80();
}

uint64_t sub_24F26C2D4()
{
  sub_24F274E40();
  if (*(void *)(v0 + 8))
  {
    sub_24F274E60();
    swift_bridgeObjectRetain();
    sub_24F274A70();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24F274E60();
  }
  sub_24F273900();
  sub_24F26C660(&qword_2699CA480, MEMORY[0x263F06EA8]);
  sub_24F2749E0();
  return sub_24F274E80();
}

uint64_t sub_24F26C3C4()
{
  if (*(void *)(v0 + 8))
  {
    sub_24F274E60();
    swift_bridgeObjectRetain();
    sub_24F274A70();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24F274E60();
  }
  sub_24F273900();
  sub_24F26C660(&qword_2699CA480, MEMORY[0x263F06EA8]);
  return sub_24F2749E0();
}

uint64_t sub_24F26C49C()
{
  sub_24F274E40();
  if (*(void *)(v0 + 8))
  {
    sub_24F274E60();
    swift_bridgeObjectRetain();
    sub_24F274A70();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24F274E60();
  }
  sub_24F273900();
  sub_24F26C660(&qword_2699CA480, MEMORY[0x263F06EA8]);
  sub_24F2749E0();
  return sub_24F274E80();
}

uint64_t _s20FitnessProductDetail16EditorialPreviewV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      BOOL v5 = *a1 == *a2 && v3 == v4;
      if (v5 || (sub_24F274E20() & 1) != 0)
      {
LABEL_8:
        type metadata accessor for EditorialPreview();
        JUMPOUT(0x2533568B0);
      }
    }
  }
  else if (!v4)
  {
    goto LABEL_8;
  }
  return 0;
}

uint64_t sub_24F26C618()
{
  return sub_24F26C660(&qword_2699CD210, (void (*)(uint64_t))type metadata accessor for EditorialPreview);
}

uint64_t sub_24F26C660(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t getEnumTagSinglePayload for EditorialPreview(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F26C6BC);
}

uint64_t sub_24F26C6BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_24F273900();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for EditorialPreview(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F26C78C);
}

uint64_t sub_24F26C78C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = sub_24F273900();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24F26C834()
{
  uint64_t result = sub_24F273900();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for EditorialPreview.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x24F26C998);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EditorialPreview.CodingKeys()
{
  return &type metadata for EditorialPreview.CodingKeys;
}

unint64_t sub_24F26C9D4()
{
  unint64_t result = qword_2699CD218;
  if (!qword_2699CD218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD218);
  }
  return result;
}

unint64_t sub_24F26CA2C()
{
  unint64_t result = qword_2699CD220;
  if (!qword_2699CD220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD220);
  }
  return result;
}

unint64_t sub_24F26CA84()
{
  unint64_t result = qword_2699CD228;
  if (!qword_2699CD228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD228);
  }
  return result;
}

BOOL static ProgramDetailSizeClass.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24F26CAE8(uint64_t a1)
{
  unint64_t v2 = sub_24F26CF00();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F26CB24(uint64_t a1)
{
  unint64_t v2 = sub_24F26CF00();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F26CB60(uint64_t a1)
{
  unint64_t v2 = sub_24F26CFA8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F26CB9C(uint64_t a1)
{
  unint64_t v2 = sub_24F26CFA8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F26CBD8(uint64_t a1)
{
  unint64_t v2 = sub_24F26CF54();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F26CC14(uint64_t a1)
{
  unint64_t v2 = sub_24F26CF54();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ProgramDetailSizeClass.encode(to:)(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD230);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD238);
  uint64_t v6 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD240);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F26CF00();
  sub_24F274EA0();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_24F26CF54();
    sub_24F274D80();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_24F26CFA8();
    sub_24F274D80();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

unint64_t sub_24F26CF00()
{
  unint64_t result = qword_2699CD248;
  if (!qword_2699CD248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD248);
  }
  return result;
}

unint64_t sub_24F26CF54()
{
  unint64_t result = qword_2699CD250;
  if (!qword_2699CD250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD250);
  }
  return result;
}

unint64_t sub_24F26CFA8()
{
  unint64_t result = qword_2699CD258;
  if (!qword_2699CD258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD258);
  }
  return result;
}

uint64_t ProgramDetailSizeClass.init(from:)(uint64_t a1)
{
  return sub_24F26D0D4(a1) & 1;
}

uint64_t sub_24F26D018@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_24F26D0D4(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_24F26D048(void *a1)
{
  return ProgramDetailSizeClass.encode(to:)(a1, *v1);
}

uint64_t ProgramDetailSizeClass.hash(into:)()
{
  return sub_24F274E50();
}

uint64_t ProgramDetailSizeClass.hashValue.getter()
{
  return sub_24F274E80();
}

uint64_t sub_24F26D0D4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2A0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2A8);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B0);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)a1, *(void *)(a1 + 24));
  sub_24F26CF00();
  uint64_t v12 = v26;
  sub_24F274E90();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_24F274D70();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_24F274C70();
    swift_allocError();
    int v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA150);
    *int v18 = &type metadata for ProgramDetailSizeClass;
    sub_24F274CD0();
    sub_24F274C60();
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
    sub_24F26CF54();
    sub_24F274CC0();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_24F26CFA8();
    sub_24F274CC0();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  __swift_destroy_boxed_opaque_existential_1(v26);
  return a1;
}

unint64_t sub_24F26D528()
{
  unint64_t result = qword_2699CD260;
  if (!qword_2699CD260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD260);
  }
  return result;
}

ValueMetadata *type metadata accessor for ProgramDetailSizeClass()
{
  return &type metadata for ProgramDetailSizeClass;
}

unsigned char *_s20FitnessProductDetail22ProgramDetailSizeClassOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F26D65CLL);
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

ValueMetadata *type metadata accessor for ProgramDetailSizeClass.CodingKeys()
{
  return &type metadata for ProgramDetailSizeClass.CodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailSizeClass.CompactCodingKeys()
{
  return &type metadata for ProgramDetailSizeClass.CompactCodingKeys;
}

ValueMetadata *type metadata accessor for ProgramDetailSizeClass.RegularCodingKeys()
{
  return &type metadata for ProgramDetailSizeClass.RegularCodingKeys;
}

unint64_t sub_24F26D6B8()
{
  unint64_t result = qword_2699CD268;
  if (!qword_2699CD268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD268);
  }
  return result;
}

unint64_t sub_24F26D710()
{
  unint64_t result = qword_2699CD270;
  if (!qword_2699CD270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD270);
  }
  return result;
}

unint64_t sub_24F26D768()
{
  unint64_t result = qword_2699CD278;
  if (!qword_2699CD278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD278);
  }
  return result;
}

unint64_t sub_24F26D7C0()
{
  unint64_t result = qword_2699CD280;
  if (!qword_2699CD280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD280);
  }
  return result;
}

unint64_t sub_24F26D818()
{
  unint64_t result = qword_2699CD288;
  if (!qword_2699CD288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD288);
  }
  return result;
}

unint64_t sub_24F26D870()
{
  unint64_t result = qword_2699CD290;
  if (!qword_2699CD290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD290);
  }
  return result;
}

unint64_t sub_24F26D8C8()
{
  unint64_t result = qword_2699CD298;
  if (!qword_2699CD298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD298);
  }
  return result;
}

uint64_t WorkoutDetailLoadState.workoutDetail.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t State = type metadata accessor for WorkoutDetailLoadState();
  MEMORY[0x270FA5388](State - 8);
  unsigned int v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F26DADC(v2, (uint64_t)v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 2, v7))
  {
    sub_24F26E320((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for WorkoutDetailLoadState);
    uint64_t v8 = type metadata accessor for WorkoutDetail();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a1, 1, 1, v8);
  }
  else
  {
    sub_24F26EB68((uint64_t)v6, a1, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
    uint64_t v10 = type metadata accessor for WorkoutDetail();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a1, 0, 1, v10);
  }
}

uint64_t type metadata accessor for WorkoutDetailLoadState()
{
  uint64_t result = qword_2699CD328;
  if (!qword_2699CD328) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24F26DADC(uint64_t a1, uint64_t a2)
{
  uint64_t State = type metadata accessor for WorkoutDetailLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(State - 8) + 16))(a2, a1, State);
  return a2;
}

uint64_t sub_24F26DB40(char a1)
{
  return *(void *)&aIdle_12[8 * a1];
}

uint64_t sub_24F26DB60()
{
  return sub_24F26DB40(*v0);
}

uint64_t sub_24F26DB68(uint64_t a1)
{
  unint64_t v2 = sub_24F26E278();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F26DBA4(uint64_t a1)
{
  unint64_t v2 = sub_24F26E278();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F26DBE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F27361C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24F26DC10(uint64_t a1)
{
  unint64_t v2 = sub_24F26E2CC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F26DC4C(uint64_t a1)
{
  unint64_t v2 = sub_24F26E2CC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F26DC88(uint64_t a1)
{
  unint64_t v2 = sub_24F26E380();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F26DCC4(uint64_t a1)
{
  unint64_t v2 = sub_24F26E380();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F26DD00(uint64_t a1)
{
  unint64_t v2 = sub_24F26E3D4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F26DD3C(uint64_t a1)
{
  unint64_t v2 = sub_24F26E3D4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WorkoutDetailLoadState.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2C0);
  uint64_t v32 = *(void *)(v2 - 8);
  uint64_t v33 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v31 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for WorkoutDetail();
  MEMORY[0x270FA5388](v29);
  uint64_t v30 = (uint64_t)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2C8);
  uint64_t v27 = *(void *)(v5 - 8);
  uint64_t v28 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2D0);
  uint64_t v25 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t State = type metadata accessor for WorkoutDetailLoadState();
  MEMORY[0x270FA5388](State - 8);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2D8);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F26E278();
  sub_24F274EA0();
  sub_24F26DADC(v34, (uint64_t)v13);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  int v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v13, 2, v18);
  if (v19)
  {
    if (v19 == 1)
    {
      char v35 = 0;
      sub_24F26E3D4();
      sub_24F274D80();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v26);
    }
    else
    {
      char v36 = 1;
      sub_24F26E380();
      sub_24F274D80();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v28);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  else
  {
    uint64_t v20 = v30;
    sub_24F26EB68((uint64_t)v13, v30, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
    char v37 = 2;
    sub_24F26E2CC();
    uint64_t v21 = v31;
    sub_24F274D80();
    sub_24F26F524(&qword_2699CA198, (void (*)(uint64_t))type metadata accessor for WorkoutDetail);
    uint64_t v22 = v33;
    sub_24F274E10();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v21, v22);
    sub_24F26E320(v20, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
}

unint64_t sub_24F26E278()
{
  unint64_t result = qword_2699CD2E0;
  if (!qword_2699CD2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD2E0);
  }
  return result;
}

unint64_t sub_24F26E2CC()
{
  unint64_t result = qword_2699CD2E8;
  if (!qword_2699CD2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD2E8);
  }
  return result;
}

uint64_t sub_24F26E320(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24F26E380()
{
  unint64_t result = qword_2699CD2F0;
  if (!qword_2699CD2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD2F0);
  }
  return result;
}

unint64_t sub_24F26E3D4()
{
  unint64_t result = qword_2699CD2F8;
  if (!qword_2699CD2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD2F8);
  }
  return result;
}

uint64_t WorkoutDetailLoadState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD300);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v47 = v3;
  uint64_t v48 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v51 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD308);
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v46 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v50 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD310);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  uint64_t v44 = v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD318);
  uint64_t v49 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t State = type metadata accessor for WorkoutDetailLoadState();
  MEMORY[0x270FA5388](State);
  uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v41 - v19;
  uint64_t v21 = a1[3];
  uint64_t v53 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  sub_24F26E278();
  uint64_t v22 = (uint64_t)v54;
  sub_24F274E90();
  if (!v22)
  {
    uint64_t v42 = v17;
    uint64_t v23 = v50;
    uint64_t v24 = v51;
    uint64_t v54 = v20;
    uint64_t v25 = v52;
    uint64_t v26 = sub_24F274D70();
    if (*(void *)(v26 + 16) == 1)
    {
      if (*(unsigned char *)(v26 + 32))
      {
        if (*(unsigned char *)(v26 + 32) != 1)
        {
          char v57 = 2;
          sub_24F26E2CC();
          uint64_t v33 = v24;
          sub_24F274CC0();
          type metadata accessor for WorkoutDetail();
          sub_24F26F524(&qword_2699CA190, (void (*)(uint64_t))type metadata accessor for WorkoutDetail);
          uint64_t v36 = (uint64_t)v42;
          uint64_t v37 = v47;
          sub_24F274D60();
          (*(void (**)(char *, uint64_t))(v48 + 8))(v33, v37);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v49 + 8))(v14, v12);
          uint64_t v38 = (uint64_t)v53;
          uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v36, 0, 2, v39);
          uint64_t v28 = (uint64_t)v54;
          sub_24F26EB68(v36, (uint64_t)v54, (uint64_t (*)(void))type metadata accessor for WorkoutDetailLoadState);
          uint64_t v40 = v52;
LABEL_12:
          sub_24F26EB68(v28, v40, (uint64_t (*)(void))type metadata accessor for WorkoutDetailLoadState);
          return __swift_destroy_boxed_opaque_existential_1(v38);
        }
        char v56 = 1;
        sub_24F26E380();
        sub_24F274CC0();
        (*(void (**)(char *, uint64_t))(v45 + 8))(v23, v46);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v49 + 8))(v14, v12);
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
        uint64_t v28 = (uint64_t)v54;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v54, 2, 2, v27);
      }
      else
      {
        char v55 = 0;
        sub_24F26E3D4();
        sub_24F274CC0();
        (*(void (**)(char *, uint64_t))(v44 + 8))(v11, v43);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v49 + 8))(v14, v12);
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
        uint64_t v28 = (uint64_t)v54;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v54, 1, 2, v35);
      }
      uint64_t v38 = (uint64_t)v53;
      uint64_t v40 = v25;
      goto LABEL_12;
    }
    uint64_t v29 = sub_24F274C70();
    swift_allocError();
    uint64_t v30 = v14;
    uint64_t v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA150);
    *uint64_t v32 = State;
    sub_24F274CD0();
    sub_24F274C60();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v29 - 8) + 104))(v32, *MEMORY[0x263F8DCB0], v29);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v30, v12);
  }
  uint64_t v38 = (uint64_t)v53;
  return __swift_destroy_boxed_opaque_existential_1(v38);
}

uint64_t sub_24F26EB68(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F26EBD0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return WorkoutDetailLoadState.init(from:)(a1, a2);
}

uint64_t sub_24F26EBE8(void *a1)
{
  return WorkoutDetailLoadState.encode(to:)(a1);
}

uint64_t WorkoutDetailLoadState.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for WorkoutDetail();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t State = type metadata accessor for WorkoutDetailLoadState();
  MEMORY[0x270FA5388](State - 8);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F26DADC(v2, (uint64_t)v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 2, v10)) {
    return sub_24F274E50();
  }
  sub_24F26EB68((uint64_t)v9, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
  sub_24F274E50();
  WorkoutDetail.hash(into:)(a1);
  return sub_24F26E320((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
}

uint64_t WorkoutDetailLoadState.hashValue.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for WorkoutDetail();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v11[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t State = type metadata accessor for WorkoutDetailLoadState();
  MEMORY[0x270FA5388](State - 8);
  uint64_t v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_24F274E40();
  sub_24F26DADC(v1, (uint64_t)v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 2, v8))
  {
    sub_24F274E50();
  }
  else
  {
    sub_24F26EB68((uint64_t)v7, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
    sub_24F274E50();
    WorkoutDetail.hash(into:)((uint64_t)v11);
    sub_24F26E320((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
  }
  return sub_24F274E80();
}

uint64_t sub_24F26EF0C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for WorkoutDetail();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F26DADC(v2, (uint64_t)v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 2, v10)) {
    return sub_24F274E50();
  }
  sub_24F26EB68((uint64_t)v9, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
  sub_24F274E50();
  WorkoutDetail.hash(into:)(a1);
  return sub_24F26E320((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
}

uint64_t sub_24F26F07C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for WorkoutDetail();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v11[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_24F274E40();
  sub_24F26DADC(v1, (uint64_t)v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 2, v8))
  {
    sub_24F274E50();
  }
  else
  {
    sub_24F26EB68((uint64_t)v7, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
    sub_24F274E50();
    WorkoutDetail.hash(into:)((uint64_t)v11);
    sub_24F26E320((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
  }
  return sub_24F274E80();
}

BOOL _s20FitnessProductDetail07WorkoutC9LoadStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WorkoutDetail();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t State = type metadata accessor for WorkoutDetailLoadState();
  MEMORY[0x270FA5388](State - 8);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD388);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (uint64_t)&v12[*(int *)(v13 + 56)];
  sub_24F26DADC(a1, (uint64_t)v12);
  sub_24F26DADC(a2, v14);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  int v17 = v16(v12, 2, v15);
  if (!v17)
  {
    sub_24F26DADC((uint64_t)v12, (uint64_t)v9);
    if (!v16((char *)v14, 2, v15))
    {
      sub_24F26EB68(v14, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
      BOOL v18 = static WorkoutDetail.== infix(_:_:)((uint64_t)v9, (uint64_t)v6);
      sub_24F26E320((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
      sub_24F26E320((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
      sub_24F26E320((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for WorkoutDetailLoadState);
      return v18;
    }
    sub_24F26E320((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for WorkoutDetail);
    goto LABEL_9;
  }
  if (v17 == 1)
  {
    if (v16((char *)v14, 2, v15) != 1) {
      goto LABEL_9;
    }
  }
  else if (v16((char *)v14, 2, v15) != 2)
  {
LABEL_9:
    sub_24F1A62BC((uint64_t)v12, &qword_2699CD388);
    return 0;
  }
  sub_24F26E320((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for WorkoutDetailLoadState);
  return 1;
}

uint64_t sub_24F26F4DC()
{
  return sub_24F26F524(&qword_2699CD320, (void (*)(uint64_t))type metadata accessor for WorkoutDetailLoadState);
}

uint64_t sub_24F26F524(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for WorkoutDetailLoadState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v79 = v8;
      uint64_t v10 = sub_24F2737E0();
      uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
      v11((char *)a1, (char *)a2, v10);
      uint64_t v12 = (int *)type metadata accessor for WorkoutDetail();
      *(uint64_t *)((char *)a1 + v12[5]) = *(uint64_t *)((char *)a2 + v12[5]);
      uint64_t v13 = v12[6];
      uint64_t v14 = (char *)a1 + v13;
      uint64_t v15 = (char *)a2 + v13;
      swift_bridgeObjectRetain();
      uint64_t v81 = v11;
      v11(v14, v15, v10);
      uint64_t v16 = v12[7];
      int v17 = (char *)a1 + v16;
      BOOL v18 = (char *)a2 + v16;
      uint64_t v19 = sub_24F273A50();
      uint64_t v20 = *(void *)(v19 - 8);
      uint64_t v77 = v7;
      uint64_t v78 = v10;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
      {
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA428);
        memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      }
      uint64_t v22 = type metadata accessor for WorkoutDetailArtwork();
      uint64_t v23 = *(int *)(v22 + 20);
      uint64_t v24 = &v17[v23];
      uint64_t v25 = &v18[v23];
      uint64_t v26 = sub_24F273900();
      uint64_t v27 = *(void *)(v26 - 8);
      uint64_t v80 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
      if (v80(v25, 1, v26))
      {
        uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
        memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
      }
      uint64_t v29 = *(int *)(v22 + 24);
      uint64_t v30 = &v17[v29];
      uint64_t v31 = &v18[v29];
      uint64_t v32 = *((void *)v31 + 1);
      *(void *)uint64_t v30 = *(void *)v31;
      *((void *)v30 + 1) = v32;
      uint64_t v33 = v12[8];
      uint64_t v34 = (uint64_t *)((char *)a1 + v33);
      uint64_t v35 = (uint64_t *)((char *)a2 + v33);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699CAB58);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v36 = sub_24F273A90();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
      }
      else
      {
        uint64_t v37 = v35[1];
        *uint64_t v34 = *v35;
        v34[1] = v37;
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      *(uint64_t *)((char *)a1 + v12[9]) = *(uint64_t *)((char *)a2 + v12[9]);
      uint64_t v38 = v12[10];
      uint64_t v39 = (char *)a1 + v38;
      uint64_t v40 = (char *)a2 + v38;
      swift_bridgeObjectRetain();
      v81(v39, v40, v78);
      v81((char *)a1 + v12[11], (char *)a2 + v12[11], v78);
      v81((char *)a1 + v12[12], (char *)a2 + v12[12], v78);
      uint64_t v41 = v12[13];
      uint64_t v42 = (uint64_t *)((char *)a1 + v41);
      uint64_t v43 = (uint64_t *)((char *)a2 + v41);
      uint64_t v44 = v43[1];
      *uint64_t v42 = *v43;
      v42[1] = v44;
      *((unsigned char *)a1 + v12[14]) = *((unsigned char *)a2 + v12[14]);
      uint64_t v45 = v12[15];
      uint64_t v46 = (uint64_t *)((char *)a1 + v45);
      uint64_t v47 = (uint64_t *)((char *)a2 + v45);
      uint64_t v48 = v47[1];
      void *v46 = *v47;
      v46[1] = v48;
      uint64_t v49 = v12[16];
      uint64_t v50 = (char *)a1 + v49;
      uint64_t v51 = (char *)a2 + v49;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v80(v51, 1, v26))
      {
        uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
        memcpy(v50, v51, *(void *)(*(void *)(v52 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v50, v51, v26);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v50, 0, 1, v26);
      }
      *(uint64_t *)((char *)a1 + v12[17]) = *(uint64_t *)((char *)a2 + v12[17]);
      uint64_t v53 = v12[18];
      uint64_t v54 = (char *)a1 + v53;
      char v55 = (char *)a2 + v53;
      swift_bridgeObjectRetain();
      if (v80(v55, 1, v26))
      {
        uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
        memcpy(v54, v55, *(void *)(*(void *)(v56 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v54, v55, v26);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v54, 0, 1, v26);
      }
      uint64_t v57 = v12[19];
      char v58 = (uint64_t *)((char *)a1 + v57);
      char v59 = (uint64_t *)((char *)a2 + v57);
      uint64_t v60 = v59[1];
      void *v58 = *v59;
      v58[1] = v60;
      uint64_t v61 = v12[20];
      char v62 = (char *)a1 + v61;
      char v63 = (char *)a2 + v61;
      swift_bridgeObjectRetain();
      v81(v62, v63, v78);
      char v64 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
      v64((char *)a1 + v12[21], (char *)a2 + v12[21], v26);
      v64((char *)a1 + v12[22], (char *)a2 + v12[22], v26);
      uint64_t v65 = v12[23];
      uint64_t v66 = (uint64_t *)((char *)a1 + v65);
      long long v67 = (uint64_t *)((char *)a2 + v65);
      uint64_t v68 = v67[1];
      void *v66 = *v67;
      v66[1] = v68;
      uint64_t v69 = v12[24];
      uint64_t v70 = (char *)a1 + v69;
      uint64_t v71 = (char *)a2 + v69;
      swift_bridgeObjectRetain();
      v81(v70, v71, v78);
      v81((char *)a1 + v12[25], (char *)a2 + v12[25], v78);
      *(uint64_t *)((char *)a1 + v12[26]) = *(uint64_t *)((char *)a2 + v12[26]);
      *((unsigned char *)a1 + v12[27]) = *((unsigned char *)a2 + v12[27]);
      uint64_t v72 = v12[28];
      uint64_t v73 = (char *)a1 + v72;
      uint64_t v74 = (char *)a2 + v72;
      *(void *)uint64_t v73 = *(void *)v74;
      *(_DWORD *)(v73 + 7) = *(_DWORD *)(v74 + 7);
      uint64_t v75 = *(void (**)(uint64_t *, void, uint64_t, uint64_t))(v79 + 56);
      swift_bridgeObjectRetain();
      v75(a1, 0, 2, v77);
    }
  }
  return a1;
}

uint64_t destroy for WorkoutDetailLoadState(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 2, v2);
  if (!result)
  {
    uint64_t v4 = sub_24F2737E0();
    int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    v5(a1, v4);
    uint64_t v6 = (int *)type metadata accessor for WorkoutDetail();
    swift_bridgeObjectRelease();
    uint64_t v19 = v5;
    v5(a1 + v6[6], v4);
    uint64_t v7 = a1 + v6[7];
    uint64_t v8 = sub_24F273A50();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    }
    uint64_t v10 = v7 + *(int *)(type metadata accessor for WorkoutDetailArtwork() + 20);
    uint64_t v11 = sub_24F273900();
    uint64_t v12 = *(void *)(v11 - 8);
    BOOL v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    if (!v18(v10, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    }
    swift_bridgeObjectRelease();
    uint64_t v13 = a1 + v6[8];
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699CAB58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_24F273A90();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    v19(a1 + v6[10], v4);
    v19(a1 + v6[11], v4);
    v19(a1 + v6[12], v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v15 = a1 + v6[16];
    if (!v18(v15, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
    }
    swift_bridgeObjectRelease();
    uint64_t v16 = a1 + v6[18];
    if (!v18(v16, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v16, v11);
    }
    swift_bridgeObjectRelease();
    v19(a1 + v6[20], v4);
    int v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(a1 + v6[21], v11);
    v17(a1 + v6[22], v11);
    swift_bridgeObjectRelease();
    v19(a1 + v6[24], v4);
    v19(a1 + v6[25], v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

char *initializeWithCopy for WorkoutDetailLoadState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v77 = v7;
    uint64_t v8 = sub_24F2737E0();
    uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
    v9(a1, a2, v8);
    uint64_t v10 = (int *)type metadata accessor for WorkoutDetail();
    *(void *)&a1[v10[5]] = *(void *)&a2[v10[5]];
    uint64_t v11 = v10[6];
    uint64_t v12 = &a1[v11];
    uint64_t v13 = &a2[v11];
    swift_bridgeObjectRetain();
    uint64_t v79 = v9;
    v9(v12, v13, v8);
    uint64_t v14 = v10[7];
    uint64_t v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    uint64_t v17 = sub_24F273A50();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v75 = v6;
    uint64_t v76 = v8;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA428);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    uint64_t v20 = type metadata accessor for WorkoutDetailArtwork();
    uint64_t v21 = *(int *)(v20 + 20);
    uint64_t v22 = &v15[v21];
    uint64_t v23 = &v16[v21];
    uint64_t v24 = sub_24F273900();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v78 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
    if (v78(v23, 1, v24))
    {
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
      memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    uint64_t v27 = *(int *)(v20 + 24);
    uint64_t v28 = &v15[v27];
    uint64_t v29 = &v16[v27];
    uint64_t v30 = *((void *)v29 + 1);
    *(void *)uint64_t v28 = *(void *)v29;
    *((void *)v28 + 1) = v30;
    uint64_t v31 = v10[8];
    uint64_t v32 = &a1[v31];
    uint64_t v33 = &a2[v31];
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699CAB58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v34 = sub_24F273A90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
    }
    else
    {
      uint64_t v35 = *((void *)v33 + 1);
      *(void *)uint64_t v32 = *(void *)v33;
      *((void *)v32 + 1) = v35;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
    *(void *)&a1[v10[9]] = *(void *)&a2[v10[9]];
    uint64_t v36 = v10[10];
    uint64_t v37 = &a1[v36];
    uint64_t v38 = &a2[v36];
    swift_bridgeObjectRetain();
    v79(v37, v38, v76);
    v79(&a1[v10[11]], &a2[v10[11]], v76);
    v79(&a1[v10[12]], &a2[v10[12]], v76);
    uint64_t v39 = v10[13];
    uint64_t v40 = &a1[v39];
    uint64_t v41 = &a2[v39];
    uint64_t v42 = *((void *)v41 + 1);
    *(void *)uint64_t v40 = *(void *)v41;
    *((void *)v40 + 1) = v42;
    a1[v10[14]] = a2[v10[14]];
    uint64_t v43 = v10[15];
    uint64_t v44 = &a1[v43];
    uint64_t v45 = &a2[v43];
    uint64_t v46 = *((void *)v45 + 1);
    *(void *)uint64_t v44 = *(void *)v45;
    *((void *)v44 + 1) = v46;
    uint64_t v47 = v10[16];
    uint64_t v48 = &a1[v47];
    uint64_t v49 = &a2[v47];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v78(v49, 1, v24))
    {
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
      memcpy(v48, v49, *(void *)(*(void *)(v50 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v48, v49, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v48, 0, 1, v24);
    }
    *(void *)&a1[v10[17]] = *(void *)&a2[v10[17]];
    uint64_t v51 = v10[18];
    uint64_t v52 = &a1[v51];
    uint64_t v53 = &a2[v51];
    swift_bridgeObjectRetain();
    if (v78(v53, 1, v24))
    {
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
      memcpy(v52, v53, *(void *)(*(void *)(v54 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v52, v53, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v52, 0, 1, v24);
    }
    uint64_t v55 = v10[19];
    uint64_t v56 = &a1[v55];
    uint64_t v57 = &a2[v55];
    uint64_t v58 = *((void *)v57 + 1);
    *(void *)uint64_t v56 = *(void *)v57;
    *((void *)v56 + 1) = v58;
    uint64_t v59 = v10[20];
    uint64_t v60 = &a1[v59];
    uint64_t v61 = &a2[v59];
    swift_bridgeObjectRetain();
    v79(v60, v61, v76);
    char v62 = *(void (**)(char *, char *, uint64_t))(v25 + 16);
    v62(&a1[v10[21]], &a2[v10[21]], v24);
    v62(&a1[v10[22]], &a2[v10[22]], v24);
    uint64_t v63 = v10[23];
    char v64 = &a1[v63];
    uint64_t v65 = &a2[v63];
    uint64_t v66 = *((void *)v65 + 1);
    *(void *)char v64 = *(void *)v65;
    *((void *)v64 + 1) = v66;
    uint64_t v67 = v10[24];
    uint64_t v68 = &a1[v67];
    uint64_t v69 = &a2[v67];
    swift_bridgeObjectRetain();
    v79(v68, v69, v76);
    v79(&a1[v10[25]], &a2[v10[25]], v76);
    *(void *)&a1[v10[26]] = *(void *)&a2[v10[26]];
    a1[v10[27]] = a2[v10[27]];
    uint64_t v70 = v10[28];
    uint64_t v71 = &a1[v70];
    uint64_t v72 = &a2[v70];
    *(void *)uint64_t v71 = *(void *)v72;
    *(_DWORD *)(v71 + 7) = *(_DWORD *)(v72 + 7);
    uint64_t v73 = *(void (**)(char *, void, uint64_t, uint64_t))(v77 + 56);
    swift_bridgeObjectRetain();
    v73(a1, 0, 2, v75);
  }
  return a1;
}

char *assignWithCopy for WorkoutDetailLoadState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (v9)
  {
    if (!v10)
    {
      uint64_t v142 = v7;
      uint64_t v11 = sub_24F2737E0();
      uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
      v12(a1, a2, v11);
      uint64_t v13 = (int *)type metadata accessor for WorkoutDetail();
      *(void *)&a1[v13[5]] = *(void *)&a2[v13[5]];
      uint64_t v14 = v13[6];
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      swift_bridgeObjectRetain();
      v12(v15, v16, v11);
      uint64_t v17 = v13[7];
      uint64_t v18 = &a1[v17];
      uint64_t v19 = &a2[v17];
      uint64_t v20 = sub_24F273A50();
      uint64_t v21 = *(void *)(v20 - 8);
      long long v138 = v12;
      uint64_t v140 = v11;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
      {
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA428);
        memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      }
      uint64_t v34 = type metadata accessor for WorkoutDetailArtwork();
      uint64_t v35 = *(int *)(v34 + 20);
      long long v137 = v18;
      uint64_t v36 = &v18[v35];
      uint64_t v37 = &v19[v35];
      uint64_t v38 = sub_24F273900();
      uint64_t v39 = *(void *)(v38 - 8);
      v146 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
      uint64_t v144 = v39;
      if (v146(v37, 1, v38))
      {
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
        memcpy(v36, v37, *(void *)(*(void *)(v40 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v36, v37, v38);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
      }
      uint64_t v41 = v38;
      uint64_t v42 = *(int *)(v34 + 24);
      uint64_t v43 = &v137[v42];
      uint64_t v44 = &v19[v42];
      *(void *)uint64_t v43 = *(void *)v44;
      *((void *)v43 + 1) = *((void *)v44 + 1);
      uint64_t v45 = v13[8];
      uint64_t v46 = &a1[v45];
      uint64_t v47 = &a2[v45];
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699CAB58);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v48 = sub_24F273A90();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
      }
      else
      {
        *(void *)uint64_t v46 = *(void *)v47;
        *((void *)v46 + 1) = *((void *)v47 + 1);
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      *(void *)&a1[v13[9]] = *(void *)&a2[v13[9]];
      uint64_t v49 = v13[10];
      uint64_t v50 = &a1[v49];
      uint64_t v51 = &a2[v49];
      swift_bridgeObjectRetain();
      v138(v50, v51, v140);
      v138(&a1[v13[11]], &a2[v13[11]], v140);
      v138(&a1[v13[12]], &a2[v13[12]], v140);
      uint64_t v52 = v13[13];
      uint64_t v53 = &a1[v52];
      uint64_t v54 = &a2[v52];
      *(void *)uint64_t v53 = *(void *)v54;
      *((void *)v53 + 1) = *((void *)v54 + 1);
      a1[v13[14]] = a2[v13[14]];
      uint64_t v55 = v13[15];
      uint64_t v56 = &a1[v55];
      uint64_t v57 = &a2[v55];
      *(void *)uint64_t v56 = *(void *)v57;
      *((void *)v56 + 1) = *((void *)v57 + 1);
      uint64_t v58 = v13[16];
      uint64_t v59 = &a1[v58];
      uint64_t v60 = &a2[v58];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v146(v60, 1, v41))
      {
        uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
        memcpy(v59, v60, *(void *)(*(void *)(v61 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v144 + 16))(v59, v60, v41);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v144 + 56))(v59, 0, 1, v41);
      }
      *(void *)&a1[v13[17]] = *(void *)&a2[v13[17]];
      uint64_t v62 = v13[18];
      uint64_t v63 = &a1[v62];
      char v64 = &a2[v62];
      swift_bridgeObjectRetain();
      if (v146(v64, 1, v41))
      {
        uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
        memcpy(v63, v64, *(void *)(*(void *)(v65 - 8) + 64));
        uint64_t v66 = v144;
      }
      else
      {
        uint64_t v66 = v144;
        (*(void (**)(char *, char *, uint64_t))(v144 + 16))(v63, v64, v41);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v144 + 56))(v63, 0, 1, v41);
      }
      uint64_t v67 = v13[19];
      uint64_t v68 = &a1[v67];
      uint64_t v69 = &a2[v67];
      *(void *)uint64_t v68 = *(void *)v69;
      *((void *)v68 + 1) = *((void *)v69 + 1);
      uint64_t v70 = v13[20];
      uint64_t v71 = &a1[v70];
      uint64_t v72 = &a2[v70];
      swift_bridgeObjectRetain();
      v138(v71, v72, v140);
      uint64_t v73 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
      v73(&a1[v13[21]], &a2[v13[21]], v41);
      v73(&a1[v13[22]], &a2[v13[22]], v41);
      uint64_t v74 = v13[23];
      uint64_t v75 = &a1[v74];
      uint64_t v76 = &a2[v74];
      *(void *)uint64_t v75 = *(void *)v76;
      *((void *)v75 + 1) = *((void *)v76 + 1);
      uint64_t v77 = v13[24];
      uint64_t v78 = &a1[v77];
      uint64_t v79 = &a2[v77];
      swift_bridgeObjectRetain();
      v138(v78, v79, v140);
      v138(&a1[v13[25]], &a2[v13[25]], v140);
      *(void *)&a1[v13[26]] = *(void *)&a2[v13[26]];
      a1[v13[27]] = a2[v13[27]];
      uint64_t v80 = v13[28];
      uint64_t v81 = &a1[v80];
      uint64_t v82 = &a2[v80];
      int v83 = *(_DWORD *)(v82 + 7);
      *(void *)uint64_t v81 = *(void *)v82;
      *(_DWORD *)(v81 + 7) = v83;
      unint64_t v84 = *(void (**)(char *, void, uint64_t, uint64_t))(v142 + 56);
      swift_bridgeObjectRetain();
      v84(a1, 0, 2, v6);
      return a1;
    }
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  if (v10)
  {
    sub_24F1A62BC((uint64_t)a1, &qword_2699CD2B8);
    goto LABEL_7;
  }
  uint64_t v23 = sub_24F2737E0();
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 24);
  v24(a1, a2, v23);
  uint64_t v25 = (int *)type metadata accessor for WorkoutDetail();
  *(void *)&a1[v25[5]] = *(void *)&a2[v25[5]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v141 = v23;
  uint64_t v145 = v24;
  v24(&a1[v25[6]], &a2[v25[6]], v23);
  uint64_t v26 = v25[7];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  uint64_t v29 = sub_24F273A50();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
  int v32 = v31(v27, 1, v29);
  int v33 = v31(v28, 1, v29);
  if (v32)
  {
    if (!v33)
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (v33)
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v27, v29);
LABEL_27:
    uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA428);
    memcpy(v27, v28, *(void *)(*(void *)(v85 - 8) + 64));
    goto LABEL_28;
  }
  (*(void (**)(char *, char *, uint64_t))(v30 + 24))(v27, v28, v29);
LABEL_28:
  uint64_t v139 = type metadata accessor for WorkoutDetailArtwork();
  uint64_t v86 = *(int *)(v139 + 20);
  long long v87 = &v27[v86];
  long long v88 = &v28[v86];
  uint64_t v89 = sub_24F273900();
  uint64_t v147 = *(void *)(v89 - 8);
  long long v90 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v147 + 48);
  int v91 = v90(v87, 1, v89);
  uint64_t v143 = v90;
  int v92 = v90(v88, 1, v89);
  if (v91)
  {
    if (!v92)
    {
      (*(void (**)(char *, char *, uint64_t))(v147 + 16))(v87, v88, v89);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v147 + 56))(v87, 0, 1, v89);
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (v92)
  {
    (*(void (**)(char *, uint64_t))(v147 + 8))(v87, v89);
LABEL_33:
    uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
    memcpy(v87, v88, *(void *)(*(void *)(v93 - 8) + 64));
    goto LABEL_34;
  }
  (*(void (**)(char *, char *, uint64_t))(v147 + 24))(v87, v88, v89);
LABEL_34:
  uint64_t v94 = *(int *)(v139 + 24);
  unint64_t v95 = &v27[v94];
  unint64_t v96 = &v28[v94];
  *(void *)unint64_t v95 = *(void *)v96;
  *((void *)v95 + 1) = *((void *)v96 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v97 = v25[8];
    uint64_t v98 = &a1[v97];
    uint64_t v99 = &a2[v97];
    sub_24F1A62BC((uint64_t)&a1[v97], &qword_2699CAB58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699CAB58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v100 = sub_24F273A90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v100 - 8) + 16))(v98, v99, v100);
    }
    else
    {
      *(void *)uint64_t v98 = *(void *)v99;
      *((void *)v98 + 1) = *((void *)v99 + 1);
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)&a1[v25[9]] = *(void *)&a2[v25[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v145(&a1[v25[10]], &a2[v25[10]], v141);
  v145(&a1[v25[11]], &a2[v25[11]], v141);
  v145(&a1[v25[12]], &a2[v25[12]], v141);
  uint64_t v101 = v25[13];
  uint64_t v102 = &a1[v101];
  uint64_t v103 = &a2[v101];
  *(void *)uint64_t v102 = *(void *)v103;
  *((void *)v102 + 1) = *((void *)v103 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[v25[14]] = a2[v25[14]];
  uint64_t v104 = v25[15];
  uint64_t v105 = &a1[v104];
  uint64_t v106 = &a2[v104];
  *(void *)uint64_t v105 = *(void *)v106;
  *((void *)v105 + 1) = *((void *)v106 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v107 = v25[16];
  uint64_t v108 = &a1[v107];
  long long v109 = &a2[v107];
  int v110 = v143(&a1[v107], 1, v89);
  int v111 = v143(v109, 1, v89);
  if (!v110)
  {
    if (!v111)
    {
      (*(void (**)(char *, char *, uint64_t))(v147 + 24))(v108, v109, v89);
      goto LABEL_45;
    }
    (*(void (**)(char *, uint64_t))(v147 + 8))(v108, v89);
    goto LABEL_44;
  }
  if (v111)
  {
LABEL_44:
    uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
    memcpy(v108, v109, *(void *)(*(void *)(v112 - 8) + 64));
    goto LABEL_45;
  }
  (*(void (**)(char *, char *, uint64_t))(v147 + 16))(v108, v109, v89);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v147 + 56))(v108, 0, 1, v89);
LABEL_45:
  *(void *)&a1[v25[17]] = *(void *)&a2[v25[17]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v113 = v25[18];
  uint64_t v114 = &a1[v113];
  uint64_t v115 = &a2[v113];
  int v116 = v143(&a1[v113], 1, v89);
  int v117 = v143(v115, 1, v89);
  if (v116)
  {
    v118 = v145;
    if (v117)
    {
      uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
      memcpy(v114, v115, *(void *)(*(void *)(v119 - 8) + 64));
      uint64_t v120 = v147;
    }
    else
    {
      unint64_t v123 = v115;
      uint64_t v120 = v147;
      (*(void (**)(char *, char *, uint64_t))(v147 + 16))(v114, v123, v89);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v147 + 56))(v114, 0, 1, v89);
    }
  }
  else
  {
    v118 = v145;
    if (v117)
    {
      (*(void (**)(char *, uint64_t))(v147 + 8))(v114, v89);
      uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
      uint64_t v122 = v115;
      uint64_t v120 = v147;
      memcpy(v114, v122, *(void *)(*(void *)(v121 - 8) + 64));
    }
    else
    {
      v124 = v115;
      uint64_t v120 = v147;
      (*(void (**)(char *, char *, uint64_t))(v147 + 24))(v114, v124, v89);
    }
  }
  uint64_t v125 = v25[19];
  v126 = &a1[v125];
  uint64_t v127 = &a2[v125];
  *(void *)v126 = *(void *)v127;
  *((void *)v126 + 1) = *((void *)v127 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v118(&a1[v25[20]], &a2[v25[20]], v141);
  uint64_t v128 = *(void (**)(char *, char *, uint64_t))(v120 + 24);
  v128(&a1[v25[21]], &a2[v25[21]], v89);
  v128(&a1[v25[22]], &a2[v25[22]], v89);
  uint64_t v129 = v25[23];
  char v130 = &a1[v129];
  uint64_t v131 = &a2[v129];
  *(void *)char v130 = *(void *)v131;
  *((void *)v130 + 1) = *((void *)v131 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v118(&a1[v25[24]], &a2[v25[24]], v141);
  v118(&a1[v25[25]], &a2[v25[25]], v141);
  *(void *)&a1[v25[26]] = *(void *)&a2[v25[26]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[v25[27]] = a2[v25[27]];
  uint64_t v132 = v25[28];
  char v133 = &a1[v132];
  unint64_t v134 = &a2[v132];
  uint64_t v135 = *(void *)v134;
  *(_DWORD *)(v133 + 7) = *(_DWORD *)(v134 + 7);
  *(void *)char v133 = v135;
  return a1;
}

char *initializeWithTake for WorkoutDetailLoadState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v44 = v6;
    uint64_t v8 = sub_24F2737E0();
    int v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32);
    v9(a1, a2, v8);
    int v10 = (int *)type metadata accessor for WorkoutDetail();
    *(void *)&a1[v10[5]] = *(void *)&a2[v10[5]];
    uint64_t v46 = v9;
    v9(&a1[v10[6]], &a2[v10[6]], v8);
    uint64_t v11 = v10[7];
    uint64_t v12 = &a1[v11];
    uint64_t v13 = &a2[v11];
    uint64_t v14 = sub_24F273A50();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v42 = v7;
    uint64_t v43 = v8;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA428);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    uint64_t v17 = type metadata accessor for WorkoutDetailArtwork();
    uint64_t v18 = *(int *)(v17 + 20);
    uint64_t v19 = &v12[v18];
    uint64_t v20 = &v13[v18];
    uint64_t v21 = sub_24F273900();
    uint64_t v22 = *(void *)(v21 - 8);
    uint64_t v45 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
    if (v45(v20, 1, v21))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    *(_OWORD *)&v12[*(int *)(v17 + 24)] = *(_OWORD *)&v13[*(int *)(v17 + 24)];
    uint64_t v24 = v10[8];
    uint64_t v25 = &a1[v24];
    uint64_t v26 = &a2[v24];
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CAB58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v28 = sub_24F273A90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v25, v26, v28);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
    }
    *(void *)&a1[v10[9]] = *(void *)&a2[v10[9]];
    v46(&a1[v10[10]], &a2[v10[10]], v43);
    v46(&a1[v10[11]], &a2[v10[11]], v43);
    v46(&a1[v10[12]], &a2[v10[12]], v43);
    *(_OWORD *)&a1[v10[13]] = *(_OWORD *)&a2[v10[13]];
    a1[v10[14]] = a2[v10[14]];
    *(_OWORD *)&a1[v10[15]] = *(_OWORD *)&a2[v10[15]];
    uint64_t v29 = v10[16];
    uint64_t v30 = &a1[v29];
    uint64_t v31 = &a2[v29];
    if (v45(&a2[v29], 1, v21))
    {
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
      memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v30, v31, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v30, 0, 1, v21);
    }
    *(void *)&a1[v10[17]] = *(void *)&a2[v10[17]];
    uint64_t v33 = v10[18];
    uint64_t v34 = &a1[v33];
    uint64_t v35 = &a2[v33];
    if (v45(&a2[v33], 1, v21))
    {
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
      memcpy(v34, v35, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v34, v35, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v34, 0, 1, v21);
    }
    *(_OWORD *)&a1[v10[19]] = *(_OWORD *)&a2[v10[19]];
    v46(&a1[v10[20]], &a2[v10[20]], v43);
    uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
    v37(&a1[v10[21]], &a2[v10[21]], v21);
    v37(&a1[v10[22]], &a2[v10[22]], v21);
    *(_OWORD *)&a1[v10[23]] = *(_OWORD *)&a2[v10[23]];
    v46(&a1[v10[24]], &a2[v10[24]], v43);
    v46(&a1[v10[25]], &a2[v10[25]], v43);
    *(void *)&a1[v10[26]] = *(void *)&a2[v10[26]];
    a1[v10[27]] = a2[v10[27]];
    uint64_t v38 = v10[28];
    uint64_t v39 = &a1[v38];
    uint64_t v40 = &a2[v38];
    *(void *)uint64_t v39 = *(void *)v40;
    *(_DWORD *)(v39 + 7) = *(_DWORD *)(v40 + 7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(a1, 0, 2, v44);
  }
  return a1;
}

unsigned char *assignWithTake for WorkoutDetailLoadState(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (v9)
  {
    if (!v10)
    {
      uint64_t v120 = v7;
      uint64_t v11 = sub_24F2737E0();
      uint64_t v12 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v11 - 8) + 32);
      v12(a1, a2, v11);
      uint64_t v13 = (int *)type metadata accessor for WorkoutDetail();
      *(void *)&a1[v13[5]] = *(void *)&a2[v13[5]];
      v12(&a1[v13[6]], &a2[v13[6]], v11);
      uint64_t v14 = v13[7];
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      uint64_t v17 = sub_24F273A50();
      uint64_t v18 = *(void *)(v17 - 8);
      int v116 = v12;
      uint64_t v118 = v11;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
      {
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA428);
        memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      }
      uint64_t v31 = type metadata accessor for WorkoutDetailArtwork();
      uint64_t v32 = *(int *)(v31 + 20);
      uint64_t v115 = v15;
      uint64_t v33 = &v15[v32];
      uint64_t v34 = &v16[v32];
      uint64_t v35 = sub_24F273900();
      uint64_t v36 = *(void *)(v35 - 8);
      v124 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
      uint64_t v122 = v36;
      if (v124(v34, 1, v35))
      {
        uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
        memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v33, v34, v35);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
      }
      *(_OWORD *)&v115[*(int *)(v31 + 24)] = *(_OWORD *)&v16[*(int *)(v31 + 24)];
      uint64_t v38 = v13[8];
      uint64_t v39 = &a1[v38];
      uint64_t v40 = &a2[v38];
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CAB58);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v42 = sub_24F273A90();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 32))(v39, v40, v42);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v39, v40, *(void *)(*(void *)(v41 - 8) + 64));
      }
      *(void *)&a1[v13[9]] = *(void *)&a2[v13[9]];
      v116(&a1[v13[10]], &a2[v13[10]], v118);
      v116(&a1[v13[11]], &a2[v13[11]], v118);
      v116(&a1[v13[12]], &a2[v13[12]], v118);
      *(_OWORD *)&a1[v13[13]] = *(_OWORD *)&a2[v13[13]];
      a1[v13[14]] = a2[v13[14]];
      *(_OWORD *)&a1[v13[15]] = *(_OWORD *)&a2[v13[15]];
      uint64_t v43 = v13[16];
      uint64_t v44 = &a1[v43];
      uint64_t v45 = &a2[v43];
      if (v124(&a2[v43], 1, v35))
      {
        uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
        memcpy(v44, v45, *(void *)(*(void *)(v46 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v122 + 32))(v44, v45, v35);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v122 + 56))(v44, 0, 1, v35);
      }
      *(void *)&a1[v13[17]] = *(void *)&a2[v13[17]];
      uint64_t v47 = v13[18];
      uint64_t v48 = &a1[v47];
      uint64_t v49 = &a2[v47];
      if (v124(&a2[v47], 1, v35))
      {
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
        memcpy(v48, v49, *(void *)(*(void *)(v50 - 8) + 64));
        uint64_t v51 = v122;
      }
      else
      {
        uint64_t v51 = v122;
        (*(void (**)(char *, char *, uint64_t))(v122 + 32))(v48, v49, v35);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v122 + 56))(v48, 0, 1, v35);
      }
      *(_OWORD *)&a1[v13[19]] = *(_OWORD *)&a2[v13[19]];
      v116(&a1[v13[20]], &a2[v13[20]], v118);
      uint64_t v52 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v51 + 32);
      v52(&a1[v13[21]], &a2[v13[21]], v35);
      v52(&a1[v13[22]], &a2[v13[22]], v35);
      *(_OWORD *)&a1[v13[23]] = *(_OWORD *)&a2[v13[23]];
      v116(&a1[v13[24]], &a2[v13[24]], v118);
      v116(&a1[v13[25]], &a2[v13[25]], v118);
      *(void *)&a1[v13[26]] = *(void *)&a2[v13[26]];
      a1[v13[27]] = a2[v13[27]];
      uint64_t v53 = v13[28];
      uint64_t v54 = &a1[v53];
      uint64_t v55 = &a2[v53];
      *(void *)uint64_t v54 = *(void *)v55;
      *(_DWORD *)(v54 + 7) = *(_DWORD *)(v55 + 7);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v120 + 56))(a1, 0, 2, v6);
      return a1;
    }
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  if (v10)
  {
    sub_24F1A62BC((uint64_t)a1, &qword_2699CD2B8);
    goto LABEL_7;
  }
  uint64_t v20 = sub_24F2737E0();
  uint64_t v21 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v20 - 8) + 40);
  v21(a1, a2, v20);
  uint64_t v22 = (int *)type metadata accessor for WorkoutDetail();
  *(void *)&a1[v22[5]] = *(void *)&a2[v22[5]];
  swift_bridgeObjectRelease();
  uint64_t v119 = v20;
  unint64_t v123 = v21;
  v21(&a1[v22[6]], &a2[v22[6]], v20);
  uint64_t v23 = v22[7];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  uint64_t v26 = sub_24F273A50();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  int v29 = v28(v24, 1, v26);
  int v30 = v28(v25, 1, v26);
  if (v29)
  {
    if (!v30)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (v30)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
LABEL_27:
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA428);
    memcpy(v24, v25, *(void *)(*(void *)(v56 - 8) + 64));
    goto LABEL_28;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v24, v25, v26);
LABEL_28:
  uint64_t v117 = type metadata accessor for WorkoutDetailArtwork();
  uint64_t v57 = *(int *)(v117 + 20);
  uint64_t v58 = &v24[v57];
  uint64_t v59 = &v25[v57];
  uint64_t v60 = sub_24F273900();
  uint64_t v125 = *(void *)(v60 - 8);
  uint64_t v61 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v125 + 48);
  int v62 = v61(v58, 1, v60);
  uint64_t v121 = v61;
  int v63 = v61(v59, 1, v60);
  if (v62)
  {
    if (!v63)
    {
      (*(void (**)(char *, char *, uint64_t))(v125 + 32))(v58, v59, v60);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v125 + 56))(v58, 0, 1, v60);
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (v63)
  {
    (*(void (**)(char *, uint64_t))(v125 + 8))(v58, v60);
LABEL_33:
    uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
    memcpy(v58, v59, *(void *)(*(void *)(v64 - 8) + 64));
    goto LABEL_34;
  }
  (*(void (**)(char *, char *, uint64_t))(v125 + 40))(v58, v59, v60);
LABEL_34:
  uint64_t v65 = *(int *)(v117 + 24);
  uint64_t v66 = &v24[v65];
  uint64_t v67 = &v25[v65];
  uint64_t v69 = *(void *)v67;
  uint64_t v68 = *((void *)v67 + 1);
  *(void *)uint64_t v66 = v69;
  *((void *)v66 + 1) = v68;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v70 = v22[8];
    uint64_t v71 = &a1[v70];
    uint64_t v72 = &a2[v70];
    sub_24F1A62BC((uint64_t)&a1[v70], &qword_2699CAB58);
    uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CAB58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v74 = sub_24F273A90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v74 - 8) + 32))(v71, v72, v74);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v71, v72, *(void *)(*(void *)(v73 - 8) + 64));
    }
  }
  *(void *)&a1[v22[9]] = *(void *)&a2[v22[9]];
  swift_bridgeObjectRelease();
  v123(&a1[v22[10]], &a2[v22[10]], v119);
  v123(&a1[v22[11]], &a2[v22[11]], v119);
  v123(&a1[v22[12]], &a2[v22[12]], v119);
  uint64_t v75 = v22[13];
  uint64_t v76 = &a1[v75];
  uint64_t v77 = (uint64_t *)&a2[v75];
  uint64_t v79 = *v77;
  uint64_t v78 = v77[1];
  *uint64_t v76 = v79;
  v76[1] = v78;
  swift_bridgeObjectRelease();
  a1[v22[14]] = a2[v22[14]];
  uint64_t v80 = v22[15];
  uint64_t v81 = &a1[v80];
  uint64_t v82 = (uint64_t *)&a2[v80];
  uint64_t v84 = *v82;
  uint64_t v83 = v82[1];
  *uint64_t v81 = v84;
  v81[1] = v83;
  swift_bridgeObjectRelease();
  uint64_t v85 = v22[16];
  uint64_t v86 = &a1[v85];
  long long v87 = &a2[v85];
  int v88 = v121(&a1[v85], 1, v60);
  int v89 = v121(v87, 1, v60);
  if (!v88)
  {
    if (!v89)
    {
      (*(void (**)(char *, char *, uint64_t))(v125 + 40))(v86, v87, v60);
      goto LABEL_44;
    }
    (*(void (**)(char *, uint64_t))(v125 + 8))(v86, v60);
    goto LABEL_43;
  }
  if (v89)
  {
LABEL_43:
    uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
    memcpy(v86, v87, *(void *)(*(void *)(v90 - 8) + 64));
    goto LABEL_44;
  }
  (*(void (**)(char *, char *, uint64_t))(v125 + 32))(v86, v87, v60);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v125 + 56))(v86, 0, 1, v60);
LABEL_44:
  *(void *)&a1[v22[17]] = *(void *)&a2[v22[17]];
  swift_bridgeObjectRelease();
  uint64_t v91 = v22[18];
  int v92 = &a1[v91];
  uint64_t v93 = &a2[v91];
  int v94 = v121(&a1[v91], 1, v60);
  int v95 = v121(v93, 1, v60);
  if (v94)
  {
    unint64_t v96 = v123;
    if (v95)
    {
      uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
      memcpy(v92, v93, *(void *)(*(void *)(v97 - 8) + 64));
      uint64_t v98 = v125;
    }
    else
    {
      uint64_t v98 = v125;
      (*(void (**)(char *, char *, uint64_t))(v125 + 32))(v92, v93, v60);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v125 + 56))(v92, 0, 1, v60);
    }
  }
  else
  {
    unint64_t v96 = v123;
    uint64_t v98 = v125;
    if (v95)
    {
      (*(void (**)(char *, uint64_t))(v125 + 8))(v92, v60);
      uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CA430);
      memcpy(v92, v93, *(void *)(*(void *)(v99 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v125 + 40))(v92, v93, v60);
    }
  }
  uint64_t v100 = v22[19];
  uint64_t v101 = &a1[v100];
  uint64_t v102 = (uint64_t *)&a2[v100];
  uint64_t v104 = *v102;
  uint64_t v103 = v102[1];
  void *v101 = v104;
  v101[1] = v103;
  swift_bridgeObjectRelease();
  v96(&a1[v22[20]], &a2[v22[20]], v119);
  uint64_t v105 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v98 + 40);
  v105(&a1[v22[21]], &a2[v22[21]], v60);
  v105(&a1[v22[22]], &a2[v22[22]], v60);
  uint64_t v106 = v22[23];
  uint64_t v107 = &a1[v106];
  uint64_t v108 = (uint64_t *)&a2[v106];
  uint64_t v110 = *v108;
  uint64_t v109 = v108[1];
  *uint64_t v107 = v110;
  v107[1] = v109;
  swift_bridgeObjectRelease();
  v96(&a1[v22[24]], &a2[v22[24]], v119);
  v96(&a1[v22[25]], &a2[v22[25]], v119);
  *(void *)&a1[v22[26]] = *(void *)&a2[v22[26]];
  swift_bridgeObjectRelease();
  a1[v22[27]] = a2[v22[27]];
  uint64_t v111 = v22[28];
  uint64_t v112 = &a1[v111];
  uint64_t v113 = &a2[v111];
  *(void *)uint64_t v112 = *(void *)v113;
  *(_DWORD *)(v112 + 7) = *(_DWORD *)(v113 + 7);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutDetailLoadState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F272E50);
}

uint64_t sub_24F272E50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for WorkoutDetailLoadState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F272ED4);
}

uint64_t sub_24F272ED4(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_24F272F5C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 2, v2);
}

uint64_t sub_24F272FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699CD2B8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 2, v4);
}

uint64_t sub_24F27303C()
{
  uint64_t result = type metadata accessor for WorkoutDetail();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for WorkoutDetailLoadState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F273180);
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

ValueMetadata *type metadata accessor for WorkoutDetailLoadState.CodingKeys()
{
  return &type metadata for WorkoutDetailLoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailLoadState.IdleCodingKeys()
{
  return &type metadata for WorkoutDetailLoadState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for WorkoutDetailLoadState.FetchingCodingKeys()
{
  return &type metadata for WorkoutDetailLoadState.FetchingCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for WorkoutDetailLoadState.FetchedCodingKeys(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24F273274);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutDetailLoadState.FetchedCodingKeys()
{
  return &type metadata for WorkoutDetailLoadState.FetchedCodingKeys;
}

unint64_t sub_24F2732B0()
{
  unint64_t result = qword_2699CD338;
  if (!qword_2699CD338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD338);
  }
  return result;
}

unint64_t sub_24F273308()
{
  unint64_t result = qword_2699CD340;
  if (!qword_2699CD340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD340);
  }
  return result;
}

unint64_t sub_24F273360()
{
  unint64_t result = qword_2699CD348;
  if (!qword_2699CD348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD348);
  }
  return result;
}

unint64_t sub_24F2733B8()
{
  unint64_t result = qword_2699CD350;
  if (!qword_2699CD350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD350);
  }
  return result;
}

unint64_t sub_24F273410()
{
  unint64_t result = qword_2699CD358;
  if (!qword_2699CD358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD358);
  }
  return result;
}

unint64_t sub_24F273468()
{
  unint64_t result = qword_2699CD360;
  if (!qword_2699CD360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD360);
  }
  return result;
}

unint64_t sub_24F2734C0()
{
  unint64_t result = qword_2699CD368;
  if (!qword_2699CD368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD368);
  }
  return result;
}

unint64_t sub_24F273518()
{
  unint64_t result = qword_2699CD370;
  if (!qword_2699CD370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD370);
  }
  return result;
}

unint64_t sub_24F273570()
{
  unint64_t result = qword_2699CD378;
  if (!qword_2699CD378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD378);
  }
  return result;
}

unint64_t sub_24F2735C8()
{
  unint64_t result = qword_2699CD380;
  if (!qword_2699CD380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699CD380);
  }
  return result;
}

uint64_t sub_24F27361C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x4474756F6B726F77 && a2 == 0xED00006C69617465)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24F274E20();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24F2736BC()
{
  return 0x4474756F6B726F77;
}

uint64_t sub_24F273700()
{
  return MEMORY[0x270EFEAC8]();
}

uint64_t sub_24F273710()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t sub_24F273720()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t sub_24F273730()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_24F273740()
{
  return MEMORY[0x270EEEB88]();
}

uint64_t sub_24F273750()
{
  return MEMORY[0x270EEEC38]();
}

uint64_t sub_24F273760()
{
  return MEMORY[0x270EEEC88]();
}

uint64_t sub_24F273770()
{
  return MEMORY[0x270EEEC90]();
}

uint64_t sub_24F273780()
{
  return MEMORY[0x270EEECA8]();
}

uint64_t sub_24F273790()
{
  return MEMORY[0x270EEECC0]();
}

uint64_t sub_24F2737A0()
{
  return MEMORY[0x270EEECD0]();
}

uint64_t sub_24F2737B0()
{
  return MEMORY[0x270EEECF8]();
}

uint64_t sub_24F2737C0()
{
  return MEMORY[0x270EEED18]();
}

uint64_t sub_24F2737D0()
{
  return MEMORY[0x270EEED90]();
}

uint64_t sub_24F2737E0()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_24F2737F0()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_24F273800()
{
  return MEMORY[0x270EEEE28]();
}

uint64_t sub_24F273810()
{
  return MEMORY[0x270EEEE50]();
}

uint64_t sub_24F273820()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_24F273830()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_24F273840()
{
  return MEMORY[0x270EEF138]();
}

uint64_t sub_24F273850()
{
  return MEMORY[0x270EEF140]();
}

uint64_t sub_24F273860()
{
  return MEMORY[0x270EEF150]();
}

uint64_t sub_24F273870()
{
  return MEMORY[0x270EEF1B8]();
}

uint64_t sub_24F273880()
{
  return MEMORY[0x270EEF318]();
}

uint64_t sub_24F273890()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_24F2738A0()
{
  return MEMORY[0x270EEF9F0]();
}

uint64_t sub_24F2738B0()
{
  return MEMORY[0x270EEFA90]();
}

uint64_t sub_24F2738C0()
{
  return MEMORY[0x270EEFA98]();
}

uint64_t sub_24F2738D0()
{
  return MEMORY[0x270EEFB90]();
}

uint64_t sub_24F2738E0()
{
  return MEMORY[0x270EEFB98]();
}

uint64_t sub_24F2738F0()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_24F273900()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24F273910()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_24F273920()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_24F273930()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_24F273940()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_24F273950()
{
  return MEMORY[0x270EF0578]();
}

uint64_t sub_24F273960()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_24F273970()
{
  return MEMORY[0x270EF0600]();
}

uint64_t sub_24F273980()
{
  return MEMORY[0x270EF0628]();
}

uint64_t sub_24F273990()
{
  return MEMORY[0x270EF06A8]();
}

uint64_t sub_24F2739A0()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_24F2739B0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_24F2739C0()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_24F2739D0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24F2739E0()
{
  return MEMORY[0x270EF0F30]();
}

uint64_t sub_24F2739F0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24F273A00()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_24F273A10()
{
  return MEMORY[0x270EF12A0]();
}

uint64_t sub_24F273A20()
{
  return MEMORY[0x270EF12A8]();
}

uint64_t sub_24F273A30()
{
  return MEMORY[0x270EF1330]();
}

uint64_t sub_24F273A40()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24F273A50()
{
  return MEMORY[0x270F2B2F8]();
}

uint64_t sub_24F273A60()
{
  return MEMORY[0x270F2B340]();
}

uint64_t sub_24F273A70()
{
  return MEMORY[0x270F2B348]();
}

uint64_t sub_24F273A80()
{
  return MEMORY[0x270F2B350]();
}

uint64_t sub_24F273A90()
{
  return MEMORY[0x270F2B418]();
}

uint64_t sub_24F273AA0()
{
  return MEMORY[0x270F2B018]();
}

uint64_t sub_24F273AB0()
{
  return MEMORY[0x270F2B040]();
}

uint64_t sub_24F273AC0()
{
  return MEMORY[0x270F2B050]();
}

uint64_t sub_24F273AD0()
{
  return MEMORY[0x270F2B068]();
}

uint64_t sub_24F273AE0()
{
  return MEMORY[0x270F2CD10]();
}

uint64_t sub_24F273AF0()
{
  return MEMORY[0x270F2CD18]();
}

uint64_t sub_24F273B00()
{
  return MEMORY[0x270F2CD20]();
}

uint64_t sub_24F273B10()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24F273B20()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24F273B30()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24F273B40()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24F273B50()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_24F273B60()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_24F273B70()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_24F273B80()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_24F273B90()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_24F273BA0()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24F273BB0()
{
  return MEMORY[0x270EFEDF0]();
}

uint64_t sub_24F273BC0()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_24F273BD0()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_24F273BE0()
{
  return MEMORY[0x270EFF248]();
}

uint64_t sub_24F273BF0()
{
  return MEMORY[0x270EFF250]();
}

uint64_t sub_24F273C00()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_24F273C10()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24F273C20()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_24F273C30()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_24F273C40()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_24F273C50()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_24F273C60()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_24F273C70()
{
  return MEMORY[0x270EFF918]();
}

uint64_t sub_24F273C80()
{
  return MEMORY[0x270EFF920]();
}

uint64_t sub_24F273C90()
{
  return MEMORY[0x270EFFA08]();
}

uint64_t sub_24F273CA0()
{
  return MEMORY[0x270EFFA10]();
}

uint64_t sub_24F273CB0()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_24F273CC0()
{
  return MEMORY[0x270EFFA60]();
}

uint64_t sub_24F273CD0()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_24F273CE0()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_24F273CF0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24F273D00()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_24F273D10()
{
  return MEMORY[0x270F00538]();
}

uint64_t sub_24F273D20()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_24F273D30()
{
  return MEMORY[0x270F00628]();
}

uint64_t sub_24F273D40()
{
  return MEMORY[0x270F00640]();
}

uint64_t sub_24F273D50()
{
  return MEMORY[0x270F00650]();
}

uint64_t sub_24F273D60()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_24F273D70()
{
  return MEMORY[0x270F00698]();
}

uint64_t sub_24F273D80()
{
  return MEMORY[0x270F006E0]();
}

uint64_t sub_24F273D90()
{
  return MEMORY[0x270F006F0]();
}

uint64_t sub_24F273DA0()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_24F273DB0()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_24F273DC0()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_24F273DD0()
{
  return MEMORY[0x270F00A78]();
}

uint64_t sub_24F273DE0()
{
  return MEMORY[0x270F00A88]();
}

uint64_t sub_24F273DF0()
{
  return MEMORY[0x270F00B28]();
}

uint64_t sub_24F273E00()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_24F273E10()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_24F273E20()
{
  return MEMORY[0x270F00DA8]();
}

uint64_t sub_24F273E30()
{
  return MEMORY[0x270F00DB8]();
}

uint64_t sub_24F273E40()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_24F273E50()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_24F273E60()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24F273E70()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_24F273E80()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_24F273E90()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_24F273EA0()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_24F273EB0()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_24F273EC0()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_24F273ED0()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_24F273EE0()
{
  return MEMORY[0x270F01440]();
}

uint64_t sub_24F273EF0()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_24F273F00()
{
  return MEMORY[0x270F014E8]();
}

uint64_t sub_24F273F10()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24F273F20()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24F273F30()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_24F273F40()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24F273F50()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_24F273F60()
{
  return MEMORY[0x270F01940]();
}

uint64_t sub_24F273F70()
{
  return MEMORY[0x270F01950]();
}

uint64_t sub_24F273F80()
{
  return MEMORY[0x270F01A18]();
}

uint64_t sub_24F273F90()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_24F273FA0()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_24F273FB0()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_24F273FC0()
{
  return MEMORY[0x270F01D58]();
}

uint64_t sub_24F273FD0()
{
  return MEMORY[0x270F01D60]();
}

uint64_t sub_24F273FE0()
{
  return MEMORY[0x270F01D68]();
}

uint64_t sub_24F273FF0()
{
  return MEMORY[0x270F01D70]();
}

uint64_t sub_24F274000()
{
  return MEMORY[0x270F01FF8]();
}

uint64_t sub_24F274010()
{
  return MEMORY[0x270F02000]();
}

uint64_t sub_24F274020()
{
  return MEMORY[0x270F02008]();
}

uint64_t sub_24F274030()
{
  return MEMORY[0x270F02010]();
}

uint64_t sub_24F274040()
{
  return MEMORY[0x270F02080]();
}

uint64_t sub_24F274050()
{
  return MEMORY[0x270F02088]();
}

uint64_t sub_24F274060()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_24F274070()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_24F274080()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_24F274090()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_24F2740A0()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_24F2740B0()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_24F2740C0()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_24F2740D0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24F2740E0()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_24F2740F0()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_24F274100()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_24F274110()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_24F274120()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24F274130()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_24F274140()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_24F274150()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_24F274160()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_24F274170()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_24F274180()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_24F274190()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_24F2741A0()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_24F2741B0()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_24F2741C0()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_24F2741D0()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_24F2741E0()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_24F2741F0()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_24F274200()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_24F274210()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_24F274220()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_24F274230()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_24F274240()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_24F274250()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_24F274260()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_24F274270()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_24F274280()
{
  return MEMORY[0x270F02CD8]();
}

uint64_t sub_24F274290()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_24F2742A0()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_24F2742B0()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_24F2742C0()
{
  return MEMORY[0x270F2B438]();
}

uint64_t sub_24F2742D0()
{
  return MEMORY[0x270F02F80]();
}

uint64_t sub_24F2742E0()
{
  return MEMORY[0x270F02F98]();
}

uint64_t sub_24F2742F0()
{
  return MEMORY[0x270F02FA8]();
}

uint64_t sub_24F274300()
{
  return MEMORY[0x270F02FB0]();
}

uint64_t sub_24F274310()
{
  return MEMORY[0x270F02FC0]();
}

uint64_t sub_24F274320()
{
  return MEMORY[0x270F02FC8]();
}

uint64_t sub_24F274330()
{
  return MEMORY[0x270F02FD0]();
}

uint64_t sub_24F274340()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_24F274350()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_24F274360()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_24F274370()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24F274380()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_24F274390()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_24F2743A0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24F2743B0()
{
  return MEMORY[0x270F2B440]();
}

uint64_t sub_24F2743C0()
{
  return MEMORY[0x270F2B458]();
}

uint64_t sub_24F2743D0()
{
  return MEMORY[0x270F87730]();
}

uint64_t sub_24F2743E0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24F2743F0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24F274400()
{
  return MEMORY[0x270F03318]();
}

uint64_t sub_24F274410()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_24F274420()
{
  return MEMORY[0x270F03428]();
}

uint64_t sub_24F274430()
{
  return MEMORY[0x270F03430]();
}

uint64_t sub_24F274440()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_24F274450()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_24F274460()
{
  return MEMORY[0x270F03590]();
}

uint64_t sub_24F274470()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_24F274480()
{
  return MEMORY[0x270F036A0]();
}

uint64_t sub_24F274490()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24F2744A0()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_24F2744B0()
{
  return MEMORY[0x270F037D8]();
}

uint64_t sub_24F2744C0()
{
  return MEMORY[0x270F03A08]();
}

uint64_t sub_24F2744D0()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_24F2744E0()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_24F2744F0()
{
  return MEMORY[0x270F03C30]();
}

uint64_t sub_24F274500()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_24F274510()
{
  return MEMORY[0x270F03CD0]();
}

uint64_t sub_24F274520()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_24F274530()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_24F274540()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_24F274550()
{
  return MEMORY[0x270F04038]();
}

uint64_t sub_24F274560()
{
  return MEMORY[0x270F040E0]();
}

uint64_t sub_24F274570()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_24F274580()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_24F274590()
{
  return MEMORY[0x270F04148]();
}

uint64_t sub_24F2745A0()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_24F2745B0()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_24F2745C0()
{
  return MEMORY[0x270F041F8]();
}

uint64_t sub_24F2745D0()
{
  return MEMORY[0x270F04210]();
}

uint64_t sub_24F2745E0()
{
  return MEMORY[0x270F04290]();
}

uint64_t sub_24F2745F0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_24F274600()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_24F274610()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_24F274620()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_24F274630()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24F274640()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_24F274650()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_24F274660()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_24F274670()
{
  return MEMORY[0x270F04580]();
}

uint64_t sub_24F274680()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_24F274690()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_24F2746A0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24F2746B0()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_24F2746C0()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_24F2746D0()
{
  return MEMORY[0x270F04760]();
}

uint64_t sub_24F2746E0()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_24F2746F0()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24F274700()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_24F274710()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_24F274720()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_24F274730()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_24F274740()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_24F274750()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_24F274760()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_24F274770()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_24F274780()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_24F274790()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_24F2747A0()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_24F2747B0()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_24F2747C0()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_24F2747D0()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_24F2747E0()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_24F2747F0()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_24F274800()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_24F274810()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_24F274820()
{
  return MEMORY[0x270F04F78]();
}

uint64_t sub_24F274830()
{
  return MEMORY[0x270F04FA0]();
}

uint64_t sub_24F274840()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_24F274850()
{
  return MEMORY[0x270F05030]();
}

uint64_t sub_24F274860()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24F274870()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_24F274880()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_24F274890()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_24F2748A0()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_24F2748B0()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_24F2748C0()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_24F2748E0()
{
  return MEMORY[0x270F252A0]();
}

uint64_t sub_24F2748F0()
{
  return MEMORY[0x270F252B0]();
}

uint64_t sub_24F274910()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24F274920()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24F274930()
{
  return MEMORY[0x270F253B0]();
}

uint64_t sub_24F274940()
{
  return MEMORY[0x270F253C0]();
}

uint64_t sub_24F274950()
{
  return MEMORY[0x270F253D0]();
}

uint64_t sub_24F274960()
{
  return MEMORY[0x270F45990]();
}

uint64_t sub_24F274970()
{
  return MEMORY[0x270F45998]();
}

uint64_t sub_24F274980()
{
  return MEMORY[0x270F45A10]();
}

uint64_t sub_24F274990()
{
  return MEMORY[0x270F45A30]();
}

uint64_t sub_24F2749A0()
{
  return MEMORY[0x270F45A40]();
}

uint64_t sub_24F2749B0()
{
  return MEMORY[0x270F45A60]();
}

uint64_t sub_24F2749C0()
{
  return MEMORY[0x270F45D88]();
}

uint64_t sub_24F2749D0()
{
  return MEMORY[0x270F45DA8]();
}

uint64_t sub_24F2749E0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24F2749F0()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_24F274A00()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24F274A10()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_24F274A20()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24F274A30()
{
  return MEMORY[0x270EF1968]();
}

uint64_t sub_24F274A40()
{
  return MEMORY[0x270EF1A38]();
}

uint64_t sub_24F274A50()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_24F274A60()
{
  return MEMORY[0x270F2CE98]();
}

uint64_t sub_24F274A70()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24F274A80()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24F274A90()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_24F274AA0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24F274AB0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24F274AC0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24F274AD0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24F274AE0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24F274AF0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24F274B00()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24F274B10()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24F274B20()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24F274B30()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24F274B40()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24F274B60()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24F274B70()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24F274B80()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_24F274B90()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_24F274BA0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_24F274BB0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24F274BC0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24F274BD0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24F274BE0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24F274BF0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24F274C00()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24F274C10()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24F274C20()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24F274C30()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24F274C40()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24F274C50()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24F274C60()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24F274C70()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24F274C80()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24F274C90()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24F274CA0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24F274CB0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24F274CC0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24F274CD0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24F274CE0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24F274CF0()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_24F274D00()
{
  return MEMORY[0x270F9F298]();
}

uint64_t sub_24F274D10()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24F274D20()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24F274D30()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24F274D40()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24F274D50()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24F274D60()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24F274D70()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24F274D80()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24F274D90()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24F274DA0()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_24F274DB0()
{
  return MEMORY[0x270F9F3D8]();
}

uint64_t sub_24F274DC0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24F274DD0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24F274DE0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24F274DF0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24F274E00()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24F274E10()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24F274E20()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24F274E30()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24F274E40()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24F274E50()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24F274E60()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24F274E70()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24F274E80()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24F274E90()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24F274EA0()
{
  return MEMORY[0x270F9FD98]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}