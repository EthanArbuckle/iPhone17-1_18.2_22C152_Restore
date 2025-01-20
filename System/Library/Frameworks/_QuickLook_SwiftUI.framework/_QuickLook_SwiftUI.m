uint64_t View.quickLookPreview<A>(_:in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = a5;
  v20 = a6;
  v21 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v9);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for QuickLookPreviewModifier();
  v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  v18 = (char *)&v20 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a2, a4);
  sub_2352D938C(a1, (uint64_t)v11, &qword_2687F5A20);
  sub_2352D40F0((uint64_t)v14, (uint64_t)v11, a4, (uint64_t)v18);
  MEMORY[0x237DD8980](v18, v21, v15, v22);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for QuickLookPreviewModifier()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2352D40F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for QuickLookPreviewModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4 + *(int *)(v8 + 36), a1, a3);

  return sub_2352D901C(a2, a4);
}

uint64_t View.quickLookPreview(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a4;
  uint64_t v7 = sub_2352DB458();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v16 = (char *)&v23 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  uint64_t v25 = a1;
  MEMORY[0x237DD89A0](v17);
  sub_2352D938C((uint64_t)v16, (uint64_t)v14, &qword_2687F5A28);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v14, 1, v7) == 1)
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
  }
  else
  {
    v19 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v19(v10, v14, v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A40);
    unint64_t v20 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_2352DBAE0;
    v19((char *)(v18 + v20), v10, v7);
  }
  sub_2352D9800((uint64_t)v16, &qword_2687F5A28);
  uint64_t v26 = v18;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A30);
  sub_2352D8FD8(&qword_2687F5A38, &qword_2687F5A30);
  View.quickLookPreview<A>(_:in:)(v25, (uint64_t)&v26, a2, v21, a3, v24);
  return swift_bridgeObjectRelease();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_2352D4460()
{
  sub_2352D6A7C();
  if (v0 <= 0x3F)
  {
    swift_checkMetadataState();
    if (v1 <= 0x3F) {
      swift_initClassMetadata2();
    }
  }
}

uint64_t sub_2352D453C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  MEMORY[0x270FA5388](v2 - 8);
  sub_2352D938C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2687F5A28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  sub_2352DB5B8();
  return sub_2352D9800(a1, &qword_2687F5A28);
}

uint64_t sub_2352D45E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](a1);
  v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(void (**)(char *))(v2 + 16);
  v16(v4);
  sub_2352DB648();
  uint64_t v5 = sub_2352DB638();
  uint64_t v6 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = (v6 + 48) & ~v6;
  v15[1] = v6 | 7;
  v15[2] = v7 + v3;
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8F500];
  v8[2] = v5;
  v8[3] = v9;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v10 = *(void *)(a1 + 24);
  v8[4] = v11;
  v8[5] = v10;
  v15[0] = *(void *)(v2 + 32);
  ((void (*)(char *, char *, uint64_t))v15[0])((char *)v8 + v7, v4, a1);
  ((void (*)(char *, uint64_t, uint64_t))v16)(v4, v17, a1);
  uint64_t v12 = sub_2352DB638();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = MEMORY[0x263F8F500];
  v13[4] = v11;
  v13[5] = v10;
  ((void (*)(char *, char *, uint64_t))v15[0])((char *)v13 + v7, v4, a1);
  sub_2352DB5D8();
  return v18;
}

uint64_t sub_2352D47E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, unsigned char *a4@<X8>)
{
  v34 = a4;
  uint64_t v33 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  v32 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v7;
  uint64_t v30 = v6;
  uint64_t v8 = type metadata accessor for QuickLookPreviewModifier();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v29 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  v31 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v16 = (char *)&v29 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  MEMORY[0x237DD89A0](v17);
  uint64_t v18 = sub_2352DB458();
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  sub_2352D9800((uint64_t)v16, &qword_2687F5A28);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  if (v21 == 1)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    char v23 = 0;
LABEL_5:
    unsigned char *v34 = v23 & 1;
    return result;
  }
  uint64_t v24 = v30;
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v32, &v11[*(int *)(v8 + 36)], v30);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  uint64_t v26 = v31;
  MEMORY[0x237DD89A0](v25);
  uint64_t result = v20(v26, 1, v18);
  if (result != 1)
  {
    sub_2352D9348(&qword_2687F5CB0);
    v27 = v31;
    v28 = v32;
    char v23 = sub_2352DB628();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v24);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v27, v18);
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_2352D4B68(unsigned char *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  uint64_t result = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*a1 & 1) == 0)
  {
    uint64_t v6 = sub_2352DB458();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
    type metadata accessor for QuickLookPreviewModifier();
    return sub_2352D453C((uint64_t)v5);
  }
  return result;
}

uint64_t sub_2352D4C54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v53 = a1;
  v56 = a3;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  uint64_t v5 = MEMORY[0x270FA5388](v55);
  v54 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a2 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v5);
  swift_getWitnessTable();
  uint64_t v9 = sub_2352DB4A8();
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v45 = *(void *)(a2 + 24);
  uint64_t v46 = v10;
  type metadata accessor for PreviewController();
  uint64_t v11 = sub_2352DB498();
  uint64_t v12 = v9;
  uint64_t v40 = v9;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v43 = WitnessTable;
  uint64_t v63 = swift_getWitnessTable();
  uint64_t v64 = MEMORY[0x263F1A0B8];
  uint64_t v52 = MEMORY[0x263F18E48];
  uint64_t v41 = v11;
  uint64_t v42 = swift_getWitnessTable();
  uint64_t v59 = v12;
  uint64_t v60 = v11;
  uint64_t v61 = WitnessTable;
  uint64_t v62 = v42;
  uint64_t v48 = MEMORY[0x263F1AB60];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v51 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  v39 = (char *)&v38 - v14;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F5CA0);
  uint64_t v15 = sub_2352DB498();
  uint64_t v49 = *(void *)(v15 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  v44 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v50 = (char *)&v38 - v18;
  uint64_t v38 = v3;
  sub_2352D45E8(a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a2);
  unint64_t v19 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = v45;
  *(void *)(v20 + 16) = v46;
  *(void *)(v20 + 24) = v21;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v20 + v19, (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  uint64_t v22 = swift_checkMetadataState();
  uint64_t v23 = swift_checkMetadataState();
  uint64_t v24 = v42;
  uint64_t v25 = v43;
  uint64_t v26 = v39;
  sub_2352DB568();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  uint64_t v28 = (uint64_t)v54;
  MEMORY[0x237DD89A0](v27);
  uint64_t v59 = v22;
  uint64_t v60 = v23;
  uint64_t v61 = v25;
  uint64_t v62 = v24;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_2352D8F48();
  uint64_t v30 = v44;
  uint64_t v31 = OpaqueTypeMetadata2;
  sub_2352DB598();
  sub_2352D9800(v28, &qword_2687F5A28);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v26, v31);
  uint64_t v32 = sub_2352D8FD8(&qword_2687F5CB8, &qword_2687F5CA0);
  uint64_t v57 = OpaqueTypeConformance2;
  uint64_t v58 = v32;
  swift_getWitnessTable();
  uint64_t v34 = v49;
  uint64_t v33 = v50;
  v35 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  v35(v50, v30, v15);
  v36 = *(void (**)(char *, uint64_t))(v34 + 8);
  v36(v30, v15);
  v35(v56, v33, v15);
  return ((uint64_t (*)(char *, uint64_t))v36)(v33, v15);
}

uint64_t sub_2352D5234@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v32 = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v30 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28[1] = a3;
  uint64_t v12 = type metadata accessor for PreviewController();
  uint64_t v31 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v28 - v13;
  uint64_t v15 = sub_2352DB498();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  unint64_t v19 = (char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v28 - v20;
  uint64_t v22 = type metadata accessor for QuickLookPreviewModifier();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v29 + *(int *)(v22 + 36), a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  uint64_t v23 = (uint64_t)v30;
  sub_2352DB5C8();
  sub_2352D55B4((uint64_t)v11, v23, a2, (uint64_t)v14);
  sub_2352DB548();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_2352DB578();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v12);
  uint64_t v33 = WitnessTable;
  uint64_t v34 = MEMORY[0x263F1A0B8];
  swift_getWitnessTable();
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  v25(v21, v19, v15);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v16 + 8);
  v26(v19, v15);
  v25(v32, v21, v15);
  return ((uint64_t (*)(char *, uint64_t))v26)(v21, v15);
}

uint64_t sub_2352D55B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4, a1);
  uint64_t v6 = a4 + *(int *)(type metadata accessor for PreviewController() + 36);

  return sub_2352D901C(a2, v6);
}

uint64_t sub_2352D5650()
{
  return sub_2352DB488();
}

uint64_t sub_2352D566C()
{
  return sub_2352DB5C8();
}

id sub_2352D56AC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  sub_2352DB5C8();
  return sub_2352D95D8((uint64_t)v3, v0);
}

uint64_t sub_2352D5760(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getWitnessTable();
  sub_2352DB538();
  sub_2352DB528();
  uint64_t v6 = (void *)v8[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  sub_2352DB5C8();
  sub_2352D5D74(a1, (uint64_t)v5, v1);

  return sub_2352D9800((uint64_t)v5, &qword_2687F5A20);
}

uint64_t sub_2352D586C(uint64_t a1)
{
  *(void *)((char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x70)) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_2352D589C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (uint64_t)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x78);
  swift_beginAccess();
  sub_2352D938C(v4, (uint64_t)v3, &qword_2687F5A20);
  MEMORY[0x237DD89A0](v1);
  return sub_2352D9800((uint64_t)v3, &qword_2687F5A20);
}

uint64_t sub_2352D5990(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (uint64_t)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x78);
  swift_beginAccess();
  sub_2352D938C(v9, (uint64_t)v8, &qword_2687F5A20);
  sub_2352D938C(a1, (uint64_t)v5, &qword_2687F5A28);
  sub_2352DB5B8();
  sub_2352D9800(a1, &qword_2687F5A28);
  return sub_2352D9800((uint64_t)v8, &qword_2687F5A20);
}

uint64_t sub_2352D5AF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
  uint64_t v4 = (char *)v1 + *(void *)(v3 + 0x80);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, char *))(*(void *)(*(void *)(v3 + 88) - 8) + 16))(a1, v4);
}

uint64_t sub_2352D5BA8(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
  uint64_t v4 = (char *)v1 + *(void *)(v3 + 0x80);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t))(*(void *)(*(void *)(v3 + 88) - 8) + 40))(v4, a1);
  return swift_endAccess();
}

uint64_t sub_2352D5C64(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  uint64_t v6 = sub_2352D9880((uint64_t)v5);

  return v6;
}

id sub_2352D5CB0(void *a1, uint64_t a2, void *a3, void (*a4)(char *, uint64_t))
{
  id v6 = a3;
  id v7 = a1;
  id v8 = sub_2352D9990(a4);

  return v8;
}

void sub_2352D5D14(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_2352D9E9C();
}

uint64_t sub_2352D5D74(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t v90 = a3;
  id v86 = a1;
  uint64_t v6 = *MEMORY[0x263F8EED0] & *v3;
  uint64_t v7 = *(void *)(v6 + 0x58);
  uint64_t v84 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  v85 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v83 = (char *)&v70 - v10;
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(qword_2687F5CD0);
  MEMORY[0x270FA5388](v81);
  uint64_t v87 = (uint64_t)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = *(void *)(v6 + 104);
  uint64_t v82 = *(void *)(*(void *)(v74 + 8) + 8);
  uint64_t v89 = v7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v73 = sub_2352DB6B8();
  uint64_t v72 = *(void *)(v73 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v73);
  v77 = (char *)&v70 - v14;
  uint64_t v78 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v71 = (char *)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v76 = (char *)&v70 - v17;
  uint64_t v18 = sub_2352DB458();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v75 = (char *)&v70 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  v80 = (char *)&v70 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v79 = (uint64_t)&v70 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v70 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v31 = (char *)&v70 - v30;
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  uint64_t v34 = (char *)&v70 - v33;
  MEMORY[0x270FA5388](v32);
  v36 = (char *)&v70 - v35;
  sub_2352D589C();
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  MEMORY[0x237DD89A0](v37);
  uint64_t v38 = (uint64_t)v4 + *(void *)((*MEMORY[0x263F8EED0] & *v4) + 0x78);
  swift_beginAccess();
  sub_2352D9798(a2, v38);
  swift_endAccess();
  uint64_t v88 = v19;
  v39 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  v91 = v36;
  LODWORD(v38) = v39(v36, 1, v18);
  sub_2352D938C((uint64_t)v34, (uint64_t)v31, &qword_2687F5A28);
  if (v38 == 1 && v39(v31, 1, v18) == 1)
  {
    sub_2352D9800((uint64_t)v31, &qword_2687F5A28);
  }
  else
  {
    sub_2352D9800((uint64_t)v31, &qword_2687F5A28);
    sub_2352D938C((uint64_t)v34, (uint64_t)v28, &qword_2687F5A28);
    if (v39(v28, 1, v18) == 1)
    {
      sub_2352D9800((uint64_t)v28, &qword_2687F5A28);
      uint64_t v40 = v90;
    }
    else
    {
      v70 = v34;
      (*(void (**)(char *, char *, uint64_t))(v88 + 32))(v80, v28, v18);
      sub_2352D9348(&qword_2687F5CB0);
      uint64_t v41 = v77;
      uint64_t v42 = v90;
      sub_2352DB698();
      uint64_t v43 = v78;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v78 + 48))(v41, 1, AssociatedTypeWitness) == 1)
      {
        (*(void (**)(char *, uint64_t))(v88 + 8))(v80, v18);
        (*(void (**)(char *, uint64_t))(v72 + 8))(v41, v73);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v76, v41, AssociatedTypeWitness);
        v44 = v71;
        v77 = (char *)AssociatedTypeWitness;
        uint64_t v45 = v43;
        sub_2352DB678();
        uint64_t v46 = v76;
        uint64_t v47 = sub_2352DB668();
        uint64_t v48 = *(void (**)(char *, char *))(v45 + 8);
        uint64_t v49 = v44;
        v50 = v77;
        v48(v49, v77);
        objc_msgSend(v86, sel_setCurrentPreviewItemIndex_, v47);
        v48(v46, v50);
        (*(void (**)(char *, uint64_t))(v88 + 8))(v80, v18);
      }
      uint64_t v40 = v42;
      uint64_t v34 = v70;
    }
    uint64_t v51 = v87;
    uint64_t v52 = v87 + *(int *)(v81 + 48);
    sub_2352D938C((uint64_t)v91, v87, &qword_2687F5A28);
    sub_2352D938C((uint64_t)v34, v52, &qword_2687F5A28);
    int v53 = v39((char *)v51, 1, v18);
    uint64_t v54 = (uint64_t)v85;
    if (v53 == 1)
    {
      int v55 = v39((char *)v52, 1, v18);
      if (v55 == 1) {
        v56 = &qword_2687F5A28;
      }
      else {
        v56 = qword_2687F5CD0;
      }
      if (v55 == 1) {
        char v57 = -1;
      }
      else {
        char v57 = 0;
      }
    }
    else
    {
      uint64_t v58 = v79;
      sub_2352D938C(v51, v79, &qword_2687F5A28);
      if (v39((char *)v52, 1, v18) == 1)
      {
        (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v58, v18);
        char v57 = 0;
        v56 = qword_2687F5CD0;
      }
      else
      {
        uint64_t v59 = v88;
        uint64_t v60 = v75;
        (*(void (**)(char *, uint64_t, uint64_t))(v88 + 32))(v75, v52, v18);
        sub_2352D9348(&qword_2687F5CB0);
        char v57 = sub_2352DB608();
        uint64_t v61 = v58;
        uint64_t v62 = *(void (**)(char *, uint64_t))(v59 + 8);
        v62(v60, v18);
        v62((char *)v61, v18);
        uint64_t v51 = v87;
        v56 = &qword_2687F5A28;
      }
    }
    uint64_t v63 = v89;
    uint64_t v64 = v84;
    sub_2352D9800(v51, v56);
    v65 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 16);
    v66 = v83;
    v65(v83, v40, v63);
    if (v57)
    {
      sub_2352D5AF4(v54);
      sub_2352D9348(&qword_2687F5CB0);
      char v67 = sub_2352DB618();
      v68 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
      v68(v54, v63);
      v68((uint64_t)v66, v63);
      uint64_t v40 = v90;
      if (v67) {
        goto LABEL_25;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v64 + 8))(v66, v63);
    }
    v65((char *)v54, v40, v63);
    sub_2352D5BA8(v54);
    objc_msgSend(v86, sel_reloadData);
  }
LABEL_25:
  sub_2352D9800((uint64_t)v34, &qword_2687F5A28);
  return sub_2352D9800((uint64_t)v91, &qword_2687F5A28);
}

void sub_2352D6764()
{
  uint64_t v1 = v0;
  swift_getKeyPath();
  uint64_t v2 = sub_2352DB428();
  swift_release();
  uint64_t v3 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x70);
  id v4 = *(void **)((char *)v1 + v3);
  *(void *)((char *)v1 + v3) = v2;
}

void sub_2352D6810()
{
  uint64_t v1 = *(void **)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x70));
  if (v1)
  {
    id v2 = v1;
    sub_2352DB418();
  }
}

void sub_2352D6894()
{
}

id sub_2352D6900()
{
  long long v2 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x50);
  long long v3 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x60);
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for PreviewController.PreviewCoordinator();
  return objc_msgSendSuper2(&v4, sel_dealloc, v2, v3);
}

uint64_t sub_2352D6978(void *a1)
{
  long long v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = *MEMORY[0x263F8EED0] & *a1;

  sub_2352D9800((uint64_t)a1 + *(void *)((*v2 & *a1) + 0x78), &qword_2687F5A20);
  objc_super v4 = (char *)a1 + *(void *)((*v2 & *a1) + 0x80);
  id v5 = *(uint64_t (**)(char *))(*(void *)(*(void *)(v3 + 88) - 8) + 8);

  return v5(v4);
}

uint64_t type metadata accessor for PreviewController.PreviewCoordinator()
{
  return swift_getGenericMetadata();
}

void sub_2352D6A7C()
{
  if (!qword_2687F5B88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F5A28);
    unint64_t v0 = sub_2352DB5E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2687F5B88);
    }
  }
}

id sub_2352D6AD8()
{
  return sub_2352D9630();
}

void sub_2352D6AEC()
{
}

id sub_2352D6AF4@<X0>(void *a1@<X8>)
{
  id result = sub_2352D56AC();
  *a1 = result;
  return result;
}

uint64_t sub_2352D6B1C()
{
  return sub_2352DB4C8();
}

uint64_t sub_2352D6B58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F02710](a1, a2, a3, WitnessTable);
}

uint64_t sub_2352D6BD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F026D8](a1, a2, a3, WitnessTable);
}

uint64_t sub_2352D6C50()
{
  return sub_2352DB558();
}

void sub_2352D6C6C()
{
}

uint64_t sub_2352D6F30(uint64_t a1)
{
  uint64_t v3 = sub_2352DB458();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2687F5CD0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v32 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v32 - v17;
  sub_2352D938C(a1, (uint64_t)v36, &qword_2687F5CC8);
  if (!v37)
  {
    uint64_t v25 = &qword_2687F5CC8;
    uint64_t v26 = v36;
LABEL_10:
    sub_2352D9800((uint64_t)v26, v25);
    goto LABEL_11;
  }
  type metadata accessor for QLPreviewItemContainer();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    char v24 = 0;
    return v24 & 1;
  }
  uint64_t v33 = v6;
  uint64_t v34 = v13;
  uint64_t v19 = v35;
  uint64_t v20 = v1 + OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL;
  swift_beginAccess();
  sub_2352D938C(v20, (uint64_t)v18, &qword_2687F5A28);
  uint64_t v21 = (uint64_t)v19 + OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL;
  swift_beginAccess();
  sub_2352D938C(v21, (uint64_t)v16, &qword_2687F5A28);
  uint64_t v22 = (uint64_t)&v9[*(int *)(v7 + 48)];
  sub_2352D938C((uint64_t)v18, (uint64_t)v9, &qword_2687F5A28);
  sub_2352D938C((uint64_t)v16, v22, &qword_2687F5A28);
  uint64_t v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v23((uint64_t)v9, 1, v3) != 1)
  {
    uint64_t v27 = (uint64_t)v34;
    sub_2352D938C((uint64_t)v9, (uint64_t)v34, &qword_2687F5A28);
    if (v23(v22, 1, v3) != 1)
    {
      uint64_t v29 = v19;
      uint64_t v30 = v33;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v33, v22, v3);
      sub_2352D9348(&qword_2687F5CB0);
      char v24 = sub_2352DB608();

      uint64_t v31 = *(void (**)(char *, uint64_t))(v4 + 8);
      v31(v30, v3);
      sub_2352D9800((uint64_t)v16, &qword_2687F5A28);
      sub_2352D9800((uint64_t)v18, &qword_2687F5A28);
      v31((char *)v27, v3);
      sub_2352D9800((uint64_t)v9, &qword_2687F5A28);
      return v24 & 1;
    }

    sub_2352D9800((uint64_t)v16, &qword_2687F5A28);
    sub_2352D9800((uint64_t)v18, &qword_2687F5A28);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v27, v3);
    goto LABEL_9;
  }

  sub_2352D9800((uint64_t)v16, &qword_2687F5A28);
  sub_2352D9800((uint64_t)v18, &qword_2687F5A28);
  if (v23(v22, 1, v3) != 1)
  {
LABEL_9:
    uint64_t v25 = qword_2687F5CD0;
    uint64_t v26 = v9;
    goto LABEL_10;
  }
  sub_2352D9800((uint64_t)v9, &qword_2687F5A28);
  char v24 = 1;
  return v24 & 1;
}

uint64_t sub_2352D743C()
{
  uint64_t v1 = sub_2352DB458();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2352DB6F8();
  uint64_t v8 = v0 + OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL;
  swift_beginAccess();
  sub_2352D938C(v8, (uint64_t)v7, &qword_2687F5A28);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
  {
    sub_2352DB6D8();
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_2352DB6D8();
    sub_2352D9348(&qword_2687F5CC0);
    sub_2352DB5F8();
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  }
  long long v18 = v13;
  long long v19 = v14;
  uint64_t v20 = v15;
  long long v16 = v11;
  long long v17 = v12;
  return sub_2352DB6E8();
}

id sub_2352D7674()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLPreviewItemContainer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2352D76D8()
{
  return type metadata accessor for QLPreviewItemContainer();
}

uint64_t type metadata accessor for QLPreviewItemContainer()
{
  uint64_t result = qword_2687F5BF8;
  if (!qword_2687F5BF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2352D772C()
{
  sub_2352D77BC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2352D77BC()
{
  if (!qword_2687F5C08)
  {
    sub_2352DB458();
    unint64_t v0 = sub_2352DB6B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2687F5C08);
    }
  }
}

uint64_t sub_2352D7814()
{
  return swift_getWitnessTable();
}

uint64_t sub_2352D78A8()
{
  return swift_getWitnessTable();
}

uint64_t sub_2352D7944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

void sub_2352D794C()
{
  sub_2352D6A7C();
  if (v0 <= 0x3F)
  {
    swift_checkMetadataState();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void *sub_2352D7A18(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_2352DB458();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(_DWORD *)(v7 + 80);
  if (*(_DWORD *)(v7 + 84)) {
    size_t v9 = *(void *)(v7 + 64);
  }
  else {
    size_t v9 = *(void *)(v7 + 64) + 1;
  }
  size_t v10 = ((v8 + 16) & ~v8) + v9;
  uint64_t v11 = *(void *)(a3 + 16);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(_DWORD *)(v12 + 80);
  size_t v14 = v10 + v13;
  unint64_t v15 = ((v10 + v13) & ~v13) + *(void *)(v12 + 64);
  int v16 = (*(_DWORD *)(v12 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000;
  uint64_t v17 = *a2;
  *a1 = *a2;
  if ((v13 | v8) > 7 || v16 != 0 || v15 > 0x18)
  {
    a1 = (void *)(v17 + (((v13 | v8) & 0xF8 ^ 0x1F8) & ((v13 | v8) + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v26 = ~v13;
    uint64_t v27 = v11;
    uint64_t v20 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v28 = a2;
    uint64_t v21 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v20 = *v21;
    __dst = (void *)(((unint64_t)v20 + v8 + 8) & ~v8);
    uint64_t v22 = (const void *)(((unint64_t)v21 + v8 + 8) & ~v8);
    uint64_t v23 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
    swift_retain();
    swift_retain();
    if (v23(v22, 1, v6))
    {
      memcpy(__dst, v22, v9);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(__dst, v22, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(__dst, 0, 1, v6);
    }
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v12 + 16))(((unint64_t)a1 + v14) & v26, ((unint64_t)v28 + v14) & v26, v27);
  }
  return a1;
}

uint64_t sub_2352D7C68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 15;
  swift_release();
  unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  uint64_t v6 = sub_2352DB458();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 8) & ~v8;
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v9, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v11 = *(uint64_t (**)(uint64_t))(*(void *)(v10 - 8) + 8);
  uint64_t v12 = *(unsigned __int8 *)(*(void *)(v10 - 8) + 80);
  uint64_t v13 = ((v8 + 16) & ~v8) + a1 + *(void *)(v7 + 64);
  if (!*(_DWORD *)(v7 + 84)) {
    ++v13;
  }

  return v11((v13 + v12) & ~v12);
}

void *sub_2352D7DAC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v5 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v4 = *v5;
  uint64_t v6 = sub_2352DB458();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (void *)(((unint64_t)v4 + v8 + 8) & ~v8);
  uint64_t v10 = (const void *)(((unint64_t)v5 + v8 + 8) & ~v8);
  uint64_t v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  swift_retain();
  swift_retain();
  if (v11(v10, 1, v6))
  {
    int v12 = *(_DWORD *)(v7 + 84);
    uint64_t v13 = *(void *)(v7 + 64);
    if (v12) {
      size_t v14 = *(void *)(v7 + 64);
    }
    else {
      size_t v14 = v13 + 1;
    }
    memcpy(v9, v10, v14);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(v9, v10, v6);
    int v16 = *(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56);
    uint64_t v15 = v7 + 56;
    v16(v9, 0, 1, v6);
    int v12 = *(_DWORD *)(v15 + 28);
    uint64_t v13 = *(void *)(v15 + 8);
  }
  uint64_t v17 = v13 + ((v8 + 16) & ~v8);
  if (!v12) {
    ++v17;
  }
  uint64_t v18 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v18 + 16))(((unint64_t)a1 + v17 + *(unsigned __int8 *)(v18 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80), ((unint64_t)a2 + v17 + *(unsigned __int8 *)(v18 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
  return a1;
}

void *sub_2352D7F74(void *a1, void *a2, uint64_t a3)
{
  unint64_t v5 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFF8;
  *uint64_t v6 = *(void *)(v5 & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  uint64_t v8 = sub_2352DB458();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (void *)(((unint64_t)v6 + v10 + 8) & ~v10);
  int v12 = (void *)((v10 + 8 + v7) & ~v10);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v9 + 48);
  int v14 = v13(v11, 1, v8);
  int v15 = v13(v12, 1, v8);
  if (v14)
  {
    if (v15)
    {
      int v16 = *(_DWORD *)(v9 + 84);
      size_t v17 = *(void *)(v9 + 64);
LABEL_6:
      if (v16) {
        size_t v18 = v17;
      }
      else {
        size_t v18 = v17 + 1;
      }
      memcpy(v11, v12, v18);
      goto LABEL_12;
    }
    (*(void (**)(void *, void *, uint64_t))(v9 + 16))(v11, v12, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v11, 0, 1, v8);
  }
  else
  {
    if (v15)
    {
      (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
      int v16 = *(_DWORD *)(v9 + 84);
      size_t v17 = *(void *)(v9 + 64);
      goto LABEL_6;
    }
    (*(void (**)(void *, void *, uint64_t))(v9 + 24))(v11, v12, v8);
  }
LABEL_12:
  uint64_t v19 = *(void *)(v9 + 64) + ((v10 + 16) & ~v10);
  if (!*(_DWORD *)(v9 + 84)) {
    ++v19;
  }
  uint64_t v20 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v20 + 24))(((unint64_t)a1 + v19 + *(unsigned __int8 *)(v20 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80), ((unint64_t)a2 + v19 + *(unsigned __int8 *)(v20 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  return a1;
}

void *sub_2352D81C0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v7 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v6 = *v7;
  uint64_t v8 = sub_2352DB458();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (void *)(((unint64_t)v6 + v10 + 8) & ~v10);
  int v12 = (const void *)(((unint64_t)v7 + v10 + 8) & ~v10);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v12, 1, v8))
  {
    int v13 = *(_DWORD *)(v9 + 84);
    size_t v14 = *(void *)(v9 + 64);
    if (v13) {
      size_t v15 = v14;
    }
    else {
      size_t v15 = v14 + 1;
    }
    memcpy(v11, v12, v15);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v11, v12, v8);
    size_t v17 = *(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56);
    uint64_t v16 = v9 + 56;
    v17(v11, 0, 1, v8);
    int v13 = *(_DWORD *)(v16 + 28);
    size_t v14 = *(void *)(v16 + 8);
  }
  size_t v18 = v14 + ((v10 + 16) & ~v10);
  if (!v13) {
    ++v18;
  }
  uint64_t v19 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v19 + 32))(((unint64_t)a1 + v18 + *(unsigned __int8 *)(v19 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80), ((unint64_t)a2 + v18 + *(unsigned __int8 *)(v19 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
  return a1;
}

void *sub_2352D8364(void *a1, void *a2, uint64_t a3)
{
  unint64_t v5 = (unint64_t)a2 + 15;
  *a1 = *a2;
  unint64_t v6 = (unint64_t)a1 + 15;
  swift_release();
  unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFF8;
  *(void *)(v6 & 0xFFFFFFFFFFFFFFF8) = *(void *)(v5 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  uint64_t v8 = sub_2352DB458();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (void *)((v10 + 8 + v7) & ~v10);
  int v12 = (void *)((v10 + 8 + (v5 & 0xFFFFFFFFFFFFFFF8)) & ~v10);
  int v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v9 + 48);
  int v14 = v13(v11, 1, v8);
  int v15 = v13(v12, 1, v8);
  if (v14)
  {
    if (v15)
    {
      int v16 = *(_DWORD *)(v9 + 84);
      size_t v17 = *(void *)(v9 + 64);
LABEL_6:
      if (v16) {
        size_t v18 = v17;
      }
      else {
        size_t v18 = v17 + 1;
      }
      memcpy(v11, v12, v18);
      goto LABEL_12;
    }
    (*(void (**)(void *, void *, uint64_t))(v9 + 32))(v11, v12, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v11, 0, 1, v8);
  }
  else
  {
    if (v15)
    {
      (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
      int v16 = *(_DWORD *)(v9 + 84);
      size_t v17 = *(void *)(v9 + 64);
      goto LABEL_6;
    }
    (*(void (**)(void *, void *, uint64_t))(v9 + 40))(v11, v12, v8);
  }
LABEL_12:
  uint64_t v19 = *(void *)(v9 + 64) + ((v10 + 16) & ~v10);
  if (!*(_DWORD *)(v9 + 84)) {
    ++v19;
  }
  uint64_t v20 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v20 + 40))(((unint64_t)a1 + v19 + *(unsigned __int8 *)(v20 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80), ((unint64_t)a2 + v19 + *(unsigned __int8 *)(v20 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  return a1;
}

uint64_t sub_2352D85A0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(sub_2352DB458() - 8);
  uint64_t v7 = v6;
  int v8 = *(_DWORD *)(v6 + 84);
  if (v8) {
    unsigned int v9 = v8 - 1;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  else {
    unsigned int v10 = v9;
  }
  uint64_t v11 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  uint64_t v13 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v14 = *(void *)(v6 + 64);
  uint64_t v15 = *(unsigned __int8 *)(v11 + 80);
  if (v12 <= v10) {
    unsigned int v16 = v10;
  }
  else {
    unsigned int v16 = *(_DWORD *)(v11 + 84);
  }
  if (v8) {
    uint64_t v17 = v14;
  }
  else {
    uint64_t v17 = v14 + 1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v18 = v17 + ((v13 + 16) & ~v13) + v15;
  if (a2 <= v16) {
    goto LABEL_34;
  }
  uint64_t v19 = (v18 & ~v15) + *(void *)(v11 + 64);
  char v20 = 8 * v19;
  if (v19 <= 3)
  {
    unsigned int v23 = ((a2 - v16 + ~(-1 << v20)) >> v20) + 1;
    if (HIWORD(v23))
    {
      int v21 = *(_DWORD *)((char *)a1 + v19);
      if (!v21) {
        goto LABEL_34;
      }
      goto LABEL_24;
    }
    if (v23 > 0xFF)
    {
      int v21 = *(unsigned __int16 *)((char *)a1 + v19);
      if (!*(unsigned __int16 *)((char *)a1 + v19)) {
        goto LABEL_34;
      }
      goto LABEL_24;
    }
    if (v23 < 2)
    {
LABEL_34:
      if (v10 >= v12)
      {
        uint64_t v29 = (uint64_t *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
        if ((v9 & 0x80000000) != 0)
        {
          unsigned int v31 = (*(uint64_t (**)(unint64_t))(v7 + 48))(((unint64_t)v29 + v13 + 8) & ~v13);
          if (v31 >= 2) {
            return v31 - 1;
          }
          else {
            return 0;
          }
        }
        else
        {
          uint64_t v30 = *v29;
          if ((unint64_t)*v29 >= 0xFFFFFFFF) {
            LODWORD(v30) = -1;
          }
          return (v30 + 1);
        }
      }
      else
      {
        unint64_t v27 = ((unint64_t)a1 + v18) & ~v15;
        uint64_t v28 = *(uint64_t (**)(unint64_t, uint64_t))(v11 + 48);
        return v28(v27, v12);
      }
    }
  }
  int v21 = *((unsigned __int8 *)a1 + v19);
  if (!*((unsigned char *)a1 + v19)) {
    goto LABEL_34;
  }
LABEL_24:
  int v24 = (v21 - 1) << v20;
  if (v19 > 3) {
    int v24 = 0;
  }
  if (v19)
  {
    if (v19 <= 3) {
      int v25 = (v18 & ~v15) + *(_DWORD *)(v11 + 64);
    }
    else {
      int v25 = 4;
    }
    switch(v25)
    {
      case 2:
        int v26 = *a1;
        break;
      case 3:
        int v26 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v26 = *(_DWORD *)a1;
        break;
      default:
        int v26 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v26 = 0;
  }
  return v16 + (v26 | v24) + 1;
}

void sub_2352D8848(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  int v8 = 0;
  uint64_t v9 = *(void *)(sub_2352DB458() - 8);
  uint64_t v10 = v9;
  int v11 = *(_DWORD *)(v9 + 84);
  if (v11) {
    unsigned int v12 = v11 - 1;
  }
  else {
    unsigned int v12 = 0;
  }
  if (v12 <= 0x7FFFFFFF) {
    unsigned int v13 = 0x7FFFFFFF;
  }
  else {
    unsigned int v13 = v12;
  }
  uint64_t v14 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v15 = *(unsigned int *)(v14 + 84);
  uint64_t v16 = *(unsigned __int8 *)(v9 + 80);
  size_t v17 = *(void *)(v9 + 64);
  uint64_t v18 = *(unsigned __int8 *)(v14 + 80);
  if (v15 <= v13) {
    unsigned int v19 = v13;
  }
  else {
    unsigned int v19 = *(_DWORD *)(v14 + 84);
  }
  uint64_t v20 = (v16 + 16) & ~v16;
  if (v11) {
    size_t v21 = v17;
  }
  else {
    size_t v21 = v17 + 1;
  }
  size_t v22 = v20 + v21;
  size_t v23 = v20 + v21 + v18;
  size_t v24 = (v23 & ~v18) + *(void *)(v14 + 64);
  if (a3 <= v19) {
    goto LABEL_23;
  }
  if (v24 <= 3)
  {
    unsigned int v27 = ((a3 - v19 + ~(-1 << (8 * v24))) >> (8 * v24)) + 1;
    if (HIWORD(v27))
    {
      int v8 = 4;
      if (v19 < a2) {
        goto LABEL_24;
      }
      goto LABEL_16;
    }
    if (v27 >= 0x100) {
      int v8 = 2;
    }
    else {
      int v8 = v27 > 1;
    }
LABEL_23:
    if (v19 < a2) {
      goto LABEL_24;
    }
LABEL_16:
    uint64_t v25 = ~v16;
    uint64_t v26 = ~v18;
    switch(v8)
    {
      case 1:
        a1[v24] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_32;
      case 2:
        *(_WORD *)&a1[v24] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_32;
      case 3:
        goto LABEL_77;
      case 4:
        *(_DWORD *)&a1[v24] = 0;
        goto LABEL_31;
      default:
LABEL_31:
        if (a2)
        {
LABEL_32:
          if (v13 >= v15)
          {
            if (v13 >= a2)
            {
              uint64_t v35 = (void *)((unint64_t)(a1 + 15) & 0xFFFFFFFFFFFFFFF8);
              if ((v12 & 0x80000000) != 0)
              {
                a1 = (unsigned char *)(((unint64_t)v35 + v16 + 8) & v25);
                if (v12 >= a2)
                {
                  v39 = *(void (**)(uint64_t, void))(v10 + 56);
                  uint64_t v40 = ((unint64_t)v35 + v16 + 8) & v25;
                  v39(v40, (a2 + 1));
                }
                else
                {
                  if (v21 <= 3) {
                    int v37 = ~(-1 << (8 * v21));
                  }
                  else {
                    int v37 = -1;
                  }
                  if (v21)
                  {
                    int v33 = v37 & (~v12 + a2);
                    if (v21 <= 3) {
                      int v38 = v21;
                    }
                    else {
                      int v38 = 4;
                    }
                    bzero(a1, v21);
                    switch(v38)
                    {
                      case 2:
LABEL_68:
                        *(_WORD *)a1 = v33;
                        break;
                      case 3:
LABEL_74:
                        *(_WORD *)a1 = v33;
                        a1[2] = BYTE2(v33);
                        break;
                      case 4:
LABEL_75:
                        *(_DWORD *)a1 = v33;
                        break;
                      default:
LABEL_45:
                        *a1 = v33;
                        break;
                    }
                  }
                }
              }
              else
              {
                if ((a2 & 0x80000000) != 0) {
                  uint64_t v36 = a2 ^ 0x80000000;
                }
                else {
                  uint64_t v36 = (a2 - 1);
                }
                *uint64_t v35 = v36;
              }
            }
            else
            {
              if (v22 <= 3) {
                int v32 = ~(-1 << (8 * v22));
              }
              else {
                int v32 = -1;
              }
              if (v22)
              {
                int v33 = v32 & (~v13 + a2);
                if (v22 <= 3) {
                  int v34 = v22;
                }
                else {
                  int v34 = 4;
                }
                bzero(a1, v22);
                switch(v34)
                {
                  case 2:
                    goto LABEL_68;
                  case 3:
                    goto LABEL_74;
                  case 4:
                    goto LABEL_75;
                  default:
                    goto LABEL_45;
                }
              }
            }
          }
          else
          {
            unsigned int v31 = *(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 56);
            v31((unint64_t)&a1[v23] & v26, a2, v15);
          }
        }
        break;
    }
    return;
  }
  int v8 = 1;
  if (v19 >= a2) {
    goto LABEL_16;
  }
LABEL_24:
  unsigned int v28 = ~v19 + a2;
  if (v24 < 4)
  {
    int v29 = (v28 >> (8 * v24)) + 1;
    if (v24)
    {
      int v30 = v28 & ~(-1 << (8 * v24));
      bzero(a1, v24);
      if (v24 == 3)
      {
        *(_WORD *)a1 = v30;
        a1[2] = BYTE2(v30);
      }
      else if (v24 == 2)
      {
        *(_WORD *)a1 = v30;
      }
      else
      {
        *a1 = v30;
      }
    }
  }
  else
  {
    bzero(a1, v24);
    *(_DWORD *)a1 = v28;
    int v29 = 1;
  }
  switch(v8)
  {
    case 1:
      a1[v24] = v29;
      break;
    case 2:
      *(_WORD *)&a1[v24] = v29;
      break;
    case 3:
LABEL_77:
      __break(1u);
      JUMPOUT(0x2352D8C84);
    case 4:
      *(_DWORD *)&a1[v24] = v29;
      break;
    default:
      return;
  }
}

uint64_t sub_2352D8CCC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for PreviewController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2352D8D28()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for QuickLookPreviewModifier();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*(void *)(v2 - 8) + 64);
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20) + 32);
  uint64_t v7 = sub_2352DB458();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4 + *(int *)(v2 + 36), v1);

  return MEMORY[0x270FA0238](v0, v4 + v5, v3 | 7);
}

uint64_t sub_2352D8EBC@<X0>(char *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(type metadata accessor for QuickLookPreviewModifier() - 8);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_2352D5234(v6, v3, v4, a1);
}

unint64_t sub_2352D8F48()
{
  unint64_t result = qword_2687F5CA8;
  if (!qword_2687F5CA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F5A28);
    sub_2352D9348(&qword_2687F5CB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F5CA8);
  }
  return result;
}

uint64_t sub_2352D8FD8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2352D901C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2352D9088@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(type metadata accessor for QuickLookPreviewModifier() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_2352D47E0(v5, v6, v3, a1);
}

uint64_t objectdestroy_13Tm()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = type metadata accessor for QuickLookPreviewModifier();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = *(void *)(*(void *)(v2 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20) + 32);
  uint64_t v7 = sub_2352DB458();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4 + *(int *)(v2 + 36), v1);

  return MEMORY[0x270FA0238](v0, v4 + v5, v3 | 7);
}

uint64_t sub_2352D92B8(unsigned char *a1)
{
  type metadata accessor for QuickLookPreviewModifier();

  return sub_2352D4B68(a1);
}

uint64_t sub_2352D9348(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2352DB458();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2352D938C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2352D93F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_2352D9458(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)MEMORY[0x263F8EED0];
  uint64_t v6 = *MEMORY[0x263F8EED0] & *v2;
  *(void *)((char *)v2 + *(void *)(v6 + 112)) = 0;
  sub_2352D938C(a1, (uint64_t)v2 + *(void *)((*v5 & *v2) + 0x78), &qword_2687F5A20);
  uint64_t v7 = (char *)v2 + *(void *)((*v5 & *v2) + 0x80);
  uint64_t v8 = *(void *)(v6 + 88);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v7, a2, v8);
  uint64_t v11 = *(void *)(v6 + 80);
  long long v12 = *(_OWORD *)(v6 + 96);
  v13.receiver = v2;
  v13.super_class = (Class)type metadata accessor for PreviewController.PreviewCoordinator();
  id v9 = objc_msgSendSuper2(&v13, sel_init, v11, v8, v12);
  sub_2352D9800(a1, &qword_2687F5A20);
  return v9;
}

id sub_2352D95D8(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for PreviewController.PreviewCoordinator());
  return sub_2352D9458(a1, a2);
}

id sub_2352D9630()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16098]), sel_init);
  objc_msgSend(v0, sel_setForceModalPresentation_, 1);
  type metadata accessor for PreviewController();
  swift_getWitnessTable();
  sub_2352DB538();
  sub_2352DB528();
  objc_msgSend(v0, sel_setDataSource_, v2);

  sub_2352DB528();
  objc_msgSend(v0, sel_setDelegate_, v2);

  sub_2352DB528();
  sub_2352D6764();

  return v0;
}

char *keypath_get_selector_currentPreviewItemIndex()
{
  return sel_currentPreviewItemIndex;
}

id sub_2352D9750@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_currentPreviewItemIndex);
  *a2 = result;
  return result;
}

id sub_2352D9784(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCurrentPreviewItemIndex_, *a1);
}

uint64_t sub_2352D9798(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_2352D9800(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_2352D985C()
{
}

uint64_t sub_2352D9880(uint64_t a1)
{
  uint64_t v2 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x58);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)&v8 - v4;
  sub_2352D5AF4((uint64_t)&v8 - v4);
  uint64_t v6 = sub_2352DB688();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

id sub_2352D9990(void (*a1)(char *, uint64_t))
{
  uint64_t v42 = a1;
  uint64_t v2 = *MEMORY[0x263F8EED0] & *v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v45 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_2352DB458();
  uint64_t v47 = *(void *)(v43 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v43);
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v46 = (char *)&v39 - v8;
  uint64_t v9 = *(void *)(v2 + 88);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v7);
  objc_super v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v39 - v14;
  uint64_t v39 = *(void *)(v2 + 104);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v41 = AssociatedTypeWitness;
  uint64_t v48 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v17 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  unsigned int v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  size_t v21 = (char *)&v39 - v20;
  sub_2352D5AF4((uint64_t)v15);
  sub_2352D5AF4((uint64_t)v13);
  sub_2352DB678();
  size_t v22 = *(void (**)(char *, uint64_t))(v10 + 8);
  v22(v13, v9);
  uint64_t v40 = v21;
  sub_2352DB658();
  size_t v23 = *(void (**)(char *, uint64_t))(v48 + 8);
  v48 += 8;
  uint64_t v42 = v23;
  v23(v19, AssociatedTypeWitness);
  v22(v15, v9);
  sub_2352D5AF4((uint64_t)v15);
  size_t v24 = (void (*)(char *, void))sub_2352DB6A8();
  uint64_t v25 = v46;
  uint64_t v26 = v47;
  unsigned int v27 = *(void (**)(char *))(v47 + 16);
  uint64_t v28 = v43;
  v27(v46);
  v24(v50, 0);
  v22(v15, v9);
  int v29 = v44;
  ((void (*)(char *, char *, uint64_t))v27)(v44, v25, v28);
  int v30 = (objc_class *)type metadata accessor for QLPreviewItemContainer();
  unsigned int v31 = (char *)objc_allocWithZone(v30);
  uint64_t v32 = (uint64_t)&v31[OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL];
  int v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
  v33(&v31[OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL], 1, 1, v28);
  uint64_t v34 = (uint64_t)v45;
  ((void (*)(char *, char *, uint64_t))v27)(v45, v29, v28);
  v33((char *)v34, 0, 1, v28);
  swift_beginAccess();
  uint64_t v35 = v31;
  sub_2352D93F0(v34, v32);
  swift_endAccess();

  v49.receiver = v35;
  v49.super_class = v30;
  id v36 = objc_msgSendSuper2(&v49, sel_init);
  int v37 = *(void (**)(char *, uint64_t))(v47 + 8);
  v37(v29, v28);
  v37(v46, v28);
  v42(v40, v41);
  return v36;
}

uint64_t sub_2352D9E9C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2352DB458();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  return sub_2352D5990((uint64_t)v2);
}

void sub_2352D9F4C()
{
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_2352D9FAC()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_2352D6A7C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_2352DA078(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_2352DB458();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v10 | 7;
  uint64_t v12 = (v10 | 7) + v7;
  if (*(_DWORD *)(v9 + 84)) {
    size_t v13 = *(void *)(v9 + 64);
  }
  else {
    size_t v13 = *(void *)(v9 + 64) + 1;
  }
  uint64_t v14 = v11 | *(_DWORD *)(v6 + 80);
  if (v14 != 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0
    || ((v10 + 16) & ~v10) + v13 + (v12 & ~(v10 | 7)) > 0x18)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v14 + 16) & ~v14));
    swift_retain();
  }
  else
  {
    uint64_t v28 = v8;
    uint64_t v18 = ~v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    unsigned int v19 = (void *)(((unint64_t)a1 + v12) & v18);
    uint64_t v20 = (void *)(((unint64_t)a2 + v12) & v18);
    *unsigned int v19 = *v20;
    size_t v21 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
    size_t v22 = (void *)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8);
    *size_t v21 = *v22;
    size_t v23 = (void *)(((unint64_t)v21 + v10 + 8) & ~v10);
    size_t v24 = (const void *)(((unint64_t)v22 + v10 + 8) & ~v10);
    uint64_t v25 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48);
    swift_retain();
    swift_retain();
    if (v25(v24, 1, v28))
    {
      memcpy(v23, v24, v13);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(v23, v24, v28);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v23, 0, 1, v28);
    }
  }
  return a1;
}

uint64_t sub_2352DA2B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = sub_2352DB458();
  uint64_t v10 = *(void *)(v5 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v10 + 80);
  swift_release();
  swift_release();
  unint64_t v7 = (v6 + ((((v4 + a1 + (v6 | 7)) & ~(v6 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v6;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v10 + 48))(v7, 1, v5);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(unint64_t, uint64_t))(v10 + 8);
    return v9(v7, v5);
  }
  return result;
}

uint64_t sub_2352DA3E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = sub_2352DB458();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + v6;
  uint64_t v11 = (void *)((v10 + a1) & ~(v9 | 7));
  uint64_t v12 = (void *)((v10 + a2) & ~(v9 | 7));
  *uint64_t v11 = *v12;
  size_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *size_t v13 = *v14;
  uint64_t v15 = (void *)(((unint64_t)v13 + v9 + 8) & ~v9);
  uint64_t v16 = (const void *)(((unint64_t)v14 + v9 + 8) & ~v9);
  uint64_t v17 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  swift_retain();
  swift_retain();
  if (v17(v16, 1, v7))
  {
    if (*(_DWORD *)(v8 + 84)) {
      size_t v18 = *(void *)(v8 + 64);
    }
    else {
      size_t v18 = *(void *)(v8 + 64) + 1;
    }
    memcpy(v15, v16, v18);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(v15, v16, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
  }
  return a1;
}

uint64_t sub_2352DA560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = sub_2352DB458();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + v6;
  uint64_t v11 = (void *)((v10 + a1) & ~(v9 | 7));
  uint64_t v12 = (void *)((v10 + a2) & ~(v9 | 7));
  *uint64_t v11 = *v12;
  swift_retain();
  swift_release();
  size_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *size_t v13 = *v14;
  swift_retain();
  swift_release();
  uint64_t v15 = (void *)(((unint64_t)v13 + v9 + 8) & ~v9);
  uint64_t v16 = (void *)(((unint64_t)v14 + v9 + 8) & ~v9);
  uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v8 + 48);
  LODWORD(v9) = v17(v15, 1, v7);
  int v18 = v17(v16, 1, v7);
  if (v9)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 16))(v15, v16, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
      return a1;
    }
    int v19 = *(_DWORD *)(v8 + 84);
    size_t v20 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 24))(v15, v16, v7);
      return a1;
    }
    size_t v22 = *(void (**)(void *, uint64_t))(v8 + 8);
    uint64_t v21 = v8 + 8;
    v22(v15, v7);
    int v19 = *(_DWORD *)(v21 + 76);
    size_t v20 = *(void *)(v21 + 56);
  }
  if (v19) {
    size_t v23 = v20;
  }
  else {
    size_t v23 = v20 + 1;
  }
  memcpy(v15, v16, v23);
  return a1;
}

uint64_t sub_2352DA75C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = sub_2352DB458();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + v6;
  uint64_t v11 = (void *)((v10 + a1) & ~(v9 | 7));
  uint64_t v12 = (void *)((v10 + a2) & ~(v9 | 7));
  *uint64_t v11 = *v12;
  size_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *size_t v13 = *v14;
  uint64_t v15 = (void *)(((unint64_t)v13 + v9 + 8) & ~v9);
  uint64_t v16 = (const void *)(((unint64_t)v14 + v9 + 8) & ~v9);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v16, 1, v7))
  {
    if (*(_DWORD *)(v8 + 84)) {
      size_t v17 = *(void *)(v8 + 64);
    }
    else {
      size_t v17 = *(void *)(v8 + 64) + 1;
    }
    memcpy(v15, v16, v17);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v15, v16, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
  }
  return a1;
}

uint64_t sub_2352DA8C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = sub_2352DB458();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + v6;
  uint64_t v11 = (void *)((v10 + a1) & ~(v9 | 7));
  uint64_t v12 = (void *)((v10 + a2) & ~(v9 | 7));
  *uint64_t v11 = *v12;
  swift_release();
  size_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *size_t v13 = *v14;
  swift_release();
  uint64_t v15 = (void *)(((unint64_t)v13 + v9 + 8) & ~v9);
  uint64_t v16 = (void *)(((unint64_t)v14 + v9 + 8) & ~v9);
  size_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v8 + 48);
  LODWORD(v9) = v17(v15, 1, v7);
  int v18 = v17(v16, 1, v7);
  if (v9)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 32))(v15, v16, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
      return a1;
    }
    int v19 = *(_DWORD *)(v8 + 84);
    size_t v20 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 40))(v15, v16, v7);
      return a1;
    }
    size_t v22 = *(void (**)(void *, uint64_t))(v8 + 8);
    uint64_t v21 = v8 + 8;
    v22(v15, v7);
    int v19 = *(_DWORD *)(v21 + 76);
    size_t v20 = *(void *)(v21 + 56);
  }
  if (v19) {
    size_t v23 = v20;
  }
  else {
    size_t v23 = v20 + 1;
  }
  memcpy(v15, v16, v23);
  return a1;
}

uint64_t sub_2352DAAB4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = sub_2352DB458();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = v9;
  int v11 = *(_DWORD *)(v9 + 84);
  if (v11) {
    unsigned int v12 = v11 - 1;
  }
  else {
    unsigned int v12 = 0;
  }
  if (v12 <= 0x7FFFFFFF) {
    unsigned int v13 = 0x7FFFFFFF;
  }
  else {
    unsigned int v13 = v12;
  }
  if (v13 <= v7) {
    unsigned int v14 = v7;
  }
  else {
    unsigned int v14 = v13;
  }
  uint64_t v15 = *(unsigned __int8 *)(v9 + 80);
  if (v11) {
    uint64_t v16 = *(void *)(*(void *)(v8 - 8) + 64);
  }
  else {
    uint64_t v16 = *(void *)(*(void *)(v8 - 8) + 64) + 1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v17 = v15 | 7;
  uint64_t v18 = (v15 | 7) + *(void *)(v6 + 64);
  if (a2 <= v14) {
    goto LABEL_34;
  }
  uint64_t v19 = v16 + ((v15 + 16) & ~v15) + (v18 & ~v17);
  char v20 = 8 * v19;
  if (v19 <= 3)
  {
    unsigned int v23 = ((a2 - v14 + ~(-1 << v20)) >> v20) + 1;
    if (HIWORD(v23))
    {
      int v21 = *(_DWORD *)((char *)a1 + v19);
      if (!v21) {
        goto LABEL_34;
      }
      goto LABEL_24;
    }
    if (v23 > 0xFF)
    {
      int v21 = *(unsigned __int16 *)((char *)a1 + v19);
      if (!*(unsigned __int16 *)((char *)a1 + v19)) {
        goto LABEL_34;
      }
      goto LABEL_24;
    }
    if (v23 < 2)
    {
LABEL_34:
      if (v7 >= v13)
      {
        int v29 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48);
        return v29(a1, v7, v5);
      }
      else
      {
        unsigned int v27 = (unint64_t *)(((((unint64_t)a1 + v18) & ~v17) + 15) & 0xFFFFFFFFFFFFFFF8);
        if ((v12 & 0x80000000) != 0)
        {
          unsigned int v30 = (*(uint64_t (**)(unint64_t))(v10 + 48))(((unint64_t)v27 + v15 + 8) & ~v15);
          if (v30 >= 2) {
            return v30 - 1;
          }
          else {
            return 0;
          }
        }
        else
        {
          unint64_t v28 = *v27;
          if (v28 >= 0xFFFFFFFF) {
            LODWORD(v28) = -1;
          }
          return (v28 + 1);
        }
      }
    }
  }
  int v21 = *((unsigned __int8 *)a1 + v19);
  if (!*((unsigned char *)a1 + v19)) {
    goto LABEL_34;
  }
LABEL_24:
  int v24 = (v21 - 1) << v20;
  if (v19 > 3) {
    int v24 = 0;
  }
  if (v19)
  {
    if (v19 <= 3) {
      int v25 = v19;
    }
    else {
      int v25 = 4;
    }
    switch(v25)
    {
      case 2:
        int v26 = *a1;
        break;
      case 3:
        int v26 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v26 = *(_DWORD *)a1;
        break;
      default:
        int v26 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v26 = 0;
  }
  return v14 + (v26 | v24) + 1;
}

void sub_2352DAD7C(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v37 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  int v10 = 0;
  uint64_t v11 = *(void *)(sub_2352DB458() - 8);
  int v12 = *(_DWORD *)(v11 + 84);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  if (v12) {
    unsigned int v14 = v12 - 1;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v14 <= 0x7FFFFFFF) {
    unsigned int v15 = 0x7FFFFFFF;
  }
  else {
    unsigned int v15 = v14;
  }
  if (v15 <= v9) {
    unsigned int v16 = v9;
  }
  else {
    unsigned int v16 = v15;
  }
  uint64_t v17 = (v13 | 7) + *(void *)(v8 + 64);
  uint64_t v18 = (v13 + 16) & ~v13;
  if (v12) {
    size_t v19 = *(void *)(v11 + 64);
  }
  else {
    size_t v19 = *(void *)(v11 + 64) + 1;
  }
  size_t v20 = v18 + v19;
  size_t v21 = (v17 & ~(v13 | 7)) + v18 + v19;
  if (a3 <= v16) {
    goto LABEL_23;
  }
  if (v21 <= 3)
  {
    unsigned int v22 = ((a3 - v16 + ~(-1 << (8 * v21))) >> (8 * v21)) + 1;
    if (HIWORD(v22))
    {
      int v10 = 4;
      if (v16 < a2) {
        goto LABEL_24;
      }
      goto LABEL_16;
    }
    if (v22 >= 0x100) {
      int v10 = 2;
    }
    else {
      int v10 = v22 > 1;
    }
LABEL_23:
    if (v16 < a2) {
      goto LABEL_24;
    }
LABEL_16:
    switch(v10)
    {
      case 1:
        a1[v21] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_32;
      case 2:
        *(_WORD *)&a1[v21] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_32;
      case 3:
        goto LABEL_77;
      case 4:
        *(_DWORD *)&a1[v21] = 0;
        goto LABEL_31;
      default:
LABEL_31:
        if (a2)
        {
LABEL_32:
          if (v9 >= v15)
          {
            unsigned int v30 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v37 + 56);
            v30(a1, a2, v9, v7);
          }
          else
          {
            int v26 = (unsigned char *)((unint64_t)&a1[v17] & ~(v13 | 7));
            if (v15 >= a2)
            {
              unsigned int v31 = (void *)((unint64_t)(v26 + 15) & 0xFFFFFFFFFFFFFFF8);
              if ((v14 & 0x80000000) != 0)
              {
                uint64_t v33 = (uint64_t)v31 + v13 + 8;
                int v26 = (unsigned char *)(v33 & ~v13);
                if (v14 >= a2)
                {
                  id v36 = *(void (**)(uint64_t, void))(v11 + 56);
                  v36(v33 & ~v13, (a2 + 1));
                }
                else
                {
                  if (v19 <= 3) {
                    int v34 = ~(-1 << (8 * v19));
                  }
                  else {
                    int v34 = -1;
                  }
                  if (v19)
                  {
                    int v28 = v34 & (~v14 + a2);
                    if (v19 <= 3) {
                      int v35 = v19;
                    }
                    else {
                      int v35 = 4;
                    }
                    bzero(v26, v19);
                    switch(v35)
                    {
                      case 2:
LABEL_68:
                        *(_WORD *)int v26 = v28;
                        break;
                      case 3:
LABEL_74:
                        *(_WORD *)int v26 = v28;
                        v26[2] = BYTE2(v28);
                        break;
                      case 4:
LABEL_75:
                        *(_DWORD *)int v26 = v28;
                        break;
                      default:
LABEL_42:
                        *int v26 = v28;
                        break;
                    }
                  }
                }
              }
              else
              {
                if ((a2 & 0x80000000) != 0) {
                  uint64_t v32 = a2 ^ 0x80000000;
                }
                else {
                  uint64_t v32 = (a2 - 1);
                }
                void *v31 = v32;
              }
            }
            else
            {
              if (v20 <= 3) {
                int v27 = ~(-1 << (8 * v20));
              }
              else {
                int v27 = -1;
              }
              if (v20)
              {
                int v28 = v27 & (~v15 + a2);
                if (v20 <= 3) {
                  int v29 = v18 + v19;
                }
                else {
                  int v29 = 4;
                }
                bzero(v26, v20);
                switch(v29)
                {
                  case 2:
                    goto LABEL_68;
                  case 3:
                    goto LABEL_74;
                  case 4:
                    goto LABEL_75;
                  default:
                    goto LABEL_42;
                }
              }
            }
          }
        }
        break;
    }
    return;
  }
  int v10 = 1;
  if (v16 >= a2) {
    goto LABEL_16;
  }
LABEL_24:
  unsigned int v23 = ~v16 + a2;
  if (v21 < 4)
  {
    int v24 = (v23 >> (8 * v21)) + 1;
    if (v21)
    {
      int v25 = v23 & ~(-1 << (8 * v21));
      bzero(a1, v21);
      if (v21 == 3)
      {
        *(_WORD *)a1 = v25;
        a1[2] = BYTE2(v25);
      }
      else if (v21 == 2)
      {
        *(_WORD *)a1 = v25;
      }
      else
      {
        *a1 = v25;
      }
    }
  }
  else
  {
    bzero(a1, v21);
    *(_DWORD *)a1 = v23;
    int v24 = 1;
  }
  switch(v10)
  {
    case 1:
      a1[v21] = v24;
      break;
    case 2:
      *(_WORD *)&a1[v21] = v24;
      break;
    case 3:
LABEL_77:
      __break(1u);
      JUMPOUT(0x2352DB1DCLL);
    case 4:
      *(_DWORD *)&a1[v21] = v24;
      break;
    default:
      return;
  }
}

uint64_t sub_2352DB224()
{
  return swift_getWitnessTable();
}

uint64_t sub_2352DB3F0()
{
  return swift_getWitnessTable();
}

uint64_t sub_2352DB40C()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_2352DB418()
{
  return MEMORY[0x270EEF760]();
}

uint64_t sub_2352DB428()
{
  return MEMORY[0x270EEFA78]();
}

uint64_t sub_2352DB438()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2352DB448()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2352DB458()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2352DB468()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_2352DB478()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_2352DB488()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_2352DB498()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_2352DB4A8()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_2352DB4B8()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_2352DB4C8()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_2352DB4E8()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_2352DB4F8()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_2352DB508()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_2352DB528()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_2352DB538()
{
  return MEMORY[0x270F029A0]();
}

uint64_t sub_2352DB548()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2352DB558()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2352DB568()
{
  return MEMORY[0x270F037C0]();
}

uint64_t sub_2352DB578()
{
  return MEMORY[0x270F03C68]();
}

uint64_t sub_2352DB588()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_2352DB598()
{
  return MEMORY[0x270F041A8]();
}

uint64_t sub_2352DB5A8()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_2352DB5B8()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_2352DB5C8()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_2352DB5D8()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_2352DB5E8()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_2352DB5F8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2352DB608()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2352DB618()
{
  return MEMORY[0x270F9DA08]();
}

uint64_t sub_2352DB628()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t sub_2352DB638()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2352DB648()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2352DB658()
{
  return MEMORY[0x270F9E040]();
}

uint64_t sub_2352DB668()
{
  return MEMORY[0x270F9E048]();
}

uint64_t sub_2352DB678()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2352DB688()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2352DB698()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t sub_2352DB6A8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2352DB6B8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2352DB6C8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2352DB6D8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2352DB6E8()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_2352DB6F8()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}