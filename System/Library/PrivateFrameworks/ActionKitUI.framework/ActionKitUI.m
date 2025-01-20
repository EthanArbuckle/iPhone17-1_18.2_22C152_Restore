uint64_t initializeBufferWithCopyOfBuffer for AccountLoginView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for AccountLoginView()
{
  return swift_release();
}

void *assignWithCopy for AccountLoginView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AccountLoginView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountLoginView(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountLoginView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountLoginView()
{
  return &type metadata for AccountLoginView;
}

void type metadata accessor for Code(uint64_t a1)
{
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
}

void type metadata accessor for WKNavigationActionPolicy(uint64_t a1)
{
}

uint64_t sub_22BEF4164@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = dynamic_cast_existential_1_conditional(a1);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a2, a3);
  }
  *a4 = result;
  return result;
}

uint64_t sub_22BEF41D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_22BEF4218()
{
  return sub_22BF5A168();
}

uint64_t sub_22BEF4234@<X0>(uint64_t *a1@<X8>)
{
  return sub_22BEF4164(*v1, v1[1], v1[2], a1);
}

uint64_t sub_22BEF4240@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v48 = a2;
  uint64_t v3 = sub_22BF5A068();
  uint64_t v41 = v3;
  OUTLINED_FUNCTION_0();
  uint64_t v47 = v4;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v44 = *(void *)(a1 + 16);
  v45 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v7;
  uint64_t v43 = v7;
  sub_22BF5A0A8();
  sub_22BF59FA8();
  uint64_t v9 = sub_22BF5A288();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v57 = v8;
  uint64_t v58 = WitnessTable;
  uint64_t v56 = swift_getWitnessTable();
  uint64_t v11 = swift_getWitnessTable();
  uint64_t v52 = v9;
  uint64_t v53 = v11;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v52 = v9;
  uint64_t v53 = v11;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v14 = sub_22BEF934C();
  uint64_t v15 = MEMORY[0x263F8D310];
  uint64_t v52 = OpaqueTypeMetadata2;
  uint64_t v53 = MEMORY[0x263F8D310];
  uint64_t v54 = OpaqueTypeConformance2;
  unint64_t v55 = v14;
  uint64_t v16 = swift_getOpaqueTypeMetadata2();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491220);
  uint64_t v52 = OpaqueTypeMetadata2;
  uint64_t v53 = v15;
  uint64_t v18 = OUTLINED_FUNCTION_5();
  uint64_t v19 = sub_22BEF96F8(&qword_268491228, &qword_268491220);
  uint64_t v52 = v16;
  uint64_t v53 = v17;
  uint64_t v54 = v18;
  unint64_t v55 = v19;
  swift_getOpaqueTypeMetadata2();
  uint64_t v52 = v16;
  uint64_t v53 = v17;
  OUTLINED_FUNCTION_5();
  uint64_t v20 = sub_22BF59D28();
  OUTLINED_FUNCTION_0();
  uint64_t v42 = v21;
  MEMORY[0x270FA5388](v22);
  v24 = (char *)&v41 - v23;
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v26 = sub_22BEF7390(&qword_268491230, MEMORY[0x263F1A128]);
  uint64_t v52 = v20;
  uint64_t v53 = v3;
  uint64_t v54 = v25;
  unint64_t v55 = v26;
  uint64_t v27 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0();
  uint64_t v29 = v28;
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  v33 = (char *)&v41 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  v35 = (char *)&v41 - v34;
  uint64_t v49 = v44;
  uint64_t v50 = v43;
  uint64_t v51 = v46;
  sub_22BF59D18();
  v36 = v45;
  sub_22BF5A058();
  uint64_t v37 = v41;
  sub_22BF5A0F8();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v36, v37);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v24, v20);
  v38 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
  v38(v35, v33, v27);
  v39 = *(void (**)(char *, uint64_t))(v29 + 8);
  v39(v33, v27);
  v38(v48, v35, v27);
  return ((uint64_t (*)(char *, uint64_t))v39)(v35, v27);
}

uint64_t sub_22BEF46F8@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v64 = a2;
  v61 = a1;
  v63 = a4;
  uint64_t v62 = sub_22BF59E98();
  uint64_t v57 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  v59 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF5A0A8();
  uint64_t v51 = sub_22BF59FA8();
  uint64_t v6 = sub_22BF5A288();
  uint64_t v60 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v41 - v7;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v75 = a3;
  uint64_t v76 = WitnessTable;
  uint64_t v41 = a3;
  uint64_t v55 = swift_getWitnessTable();
  uint64_t v74 = v55;
  uint64_t v10 = swift_getWitnessTable();
  *(void *)&long long v71 = v6;
  *((void *)&v71 + 1) = v10;
  uint64_t v53 = v6;
  uint64_t v11 = v10;
  uint64_t v54 = v10;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v58 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v52 = (char *)&v41 - v13;
  *(void *)&long long v71 = v6;
  *((void *)&v71 + 1) = v11;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v15 = sub_22BEF934C();
  uint64_t v16 = MEMORY[0x263F8D310];
  uint64_t v43 = OpaqueTypeMetadata2;
  *(void *)&long long v71 = OpaqueTypeMetadata2;
  *((void *)&v71 + 1) = MEMORY[0x263F8D310];
  uint64_t v72 = OpaqueTypeConformance2;
  unint64_t v73 = v15;
  uint64_t v45 = OpaqueTypeConformance2;
  unint64_t v17 = v15;
  unint64_t v44 = v15;
  uint64_t v18 = swift_getOpaqueTypeMetadata2();
  uint64_t v49 = v18;
  uint64_t v56 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v50 = (char *)&v41 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491220);
  uint64_t v48 = v20;
  *(void *)&long long v71 = OpaqueTypeMetadata2;
  *((void *)&v71 + 1) = v16;
  uint64_t v72 = OpaqueTypeConformance2;
  unint64_t v73 = v17;
  uint64_t v21 = swift_getOpaqueTypeConformance2();
  uint64_t v47 = v21;
  uint64_t v46 = sub_22BEF96F8(&qword_268491228, &qword_268491220);
  *(void *)&long long v71 = v18;
  *((void *)&v71 + 1) = v20;
  uint64_t v72 = v21;
  unint64_t v73 = v46;
  uint64_t v22 = swift_getOpaqueTypeMetadata2();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v41 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v42 = (char *)&v41 - v27;
  uint64_t v68 = v64;
  uint64_t v69 = a3;
  uint64_t v28 = v61;
  v70 = v61;
  sub_22BF5A278();
  uint64_t v29 = v57;
  uint64_t v30 = v59;
  uint64_t v31 = v62;
  (*(void (**)(char *, void, uint64_t))(v57 + 104))(v59, *MEMORY[0x263F19698], v62);
  uint64_t v32 = v52;
  uint64_t v33 = v53;
  sub_22BF5A1A8();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v8, v33);
  long long v71 = *v28;
  uint64_t v34 = v50;
  uint64_t v35 = v43;
  sub_22BF5A178();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v32, v35);
  uint64_t v65 = v64;
  uint64_t v66 = v41;
  v67 = v28;
  uint64_t v36 = v49;
  sub_22BF5A1E8();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v34, v36);
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
  v38 = v42;
  v37(v42, v26, v22);
  v39 = *(void (**)(char *, uint64_t))(v23 + 8);
  v39(v26, v22);
  v37(v63, v38, v22);
  return ((uint64_t (*)(char *, uint64_t))v39)(v38, v22);
}

uint64_t sub_22BEF4E14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v36 = a4;
  uint64_t v37 = a3;
  uint64_t v6 = sub_22BF5A0A8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)v33 - v12;
  uint64_t v14 = *(void *)(a2 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v11);
  unint64_t v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v33 - v18;
  uint64_t v20 = sub_22BF59FA8();
  uint64_t v34 = *(void *)(v20 - 8);
  uint64_t v35 = v20;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)v33 - v22;
  if (*(unsigned char *)(a1 + 17))
  {
    (*(void (**)(uint64_t))(a1 + 24))(v21);
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
    v27(v19, v17, a2);
    uint64_t v28 = *(void (**)(char *, uint64_t))(v14 + 8);
    v28(v17, a2);
    v27(v17, v19, a2);
    swift_getWitnessTable();
    sub_22BEF5260((uint64_t)v17, a2);
    v28(v17, a2);
    v28(v19, a2);
  }
  else
  {
    MEMORY[0x270FA5388](v21);
    uint64_t v24 = v37;
    v33[-4] = a2;
    v33[-3] = v24;
    v33[-2] = a1;
    sub_22BF5A098();
    v33[1] = swift_getWitnessTable();
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v25(v13, v10, v6);
    uint64_t v26 = *(void (**)(char *, uint64_t))(v7 + 8);
    v26(v10, v6);
    v25(v10, v13, v6);
    sub_22BEF5498((uint64_t)v10, a2, v6);
    v26(v10, v6);
    v26(v13, v6);
  }
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v38 = v37;
  uint64_t v39 = WitnessTable;
  uint64_t v30 = v35;
  swift_getWitnessTable();
  uint64_t v31 = v34;
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 16))(v36, v23, v30);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v23, v30);
}

uint64_t sub_22BEF5260(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BF59F88();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_22BF59F98();
}

uint64_t sub_22BEF5358@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v14 - v9;
  (*(void (**)(void))(v8 + 24))();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v11(v10, v7, a1);
  uint64_t v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, a1);
  v11(a2, v10, a1);
  return ((uint64_t (*)(char *, uint64_t))v12)(v10, a1);
}

uint64_t sub_22BEF5498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_22BF59F88();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_22BF59F98();
}

uint64_t sub_22BEF5590@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v23 = a4;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491238);
  MEMORY[0x270FA5388](v22);
  uint64_t v20 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491240);
  uint64_t v8 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22BF59FF8();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491248);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF59FD8();
  uint64_t v27 = a2;
  uint64_t v28 = a3;
  uint64_t v29 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491250);
  sub_22BEF940C();
  sub_22BF59CA8();
  sub_22BF59FE8();
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  uint64_t v26 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491270);
  sub_22BEF94EC();
  sub_22BF59CA8();
  uint64_t v16 = &v20[*(int *)(v22 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v20, v15, v12);
  unint64_t v17 = v16;
  uint64_t v18 = v21;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v17, v10, v21);
  sub_22BF59EC8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_22BEF58AC@<X0>(uint64_t a1@<X8>)
{
  return sub_22BEF58E0(a1);
}

uint64_t sub_22BEF58E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_22BF59D58();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491260);
  uint64_t v32 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491308);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v1 + 40);
  if (v14)
  {
    uint64_t v27 = v11;
    uint64_t v28 = v7;
    uint64_t v29 = v4;
    uint64_t v30 = v3;
    uint64_t v31 = a1;
    uint64_t v15 = *(void *)(v1 + 48);
    swift_retain();
    sub_22BF5A4E8();
    if (qword_268490F80 != -1) {
      swift_once();
    }
    id v16 = (id)qword_2684922C8;
    unint64_t v17 = (void *)sub_22BF5A4A8();
    uint64_t v18 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    id v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, v18, 0);

    uint64_t v20 = sub_22BF5A4C8();
    uint64_t v22 = v21;

    uint64_t v33 = v20;
    uint64_t v34 = v22;
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v14;
    *(void *)(v23 + 24) = v15;
    sub_22BEF934C();
    swift_retain();
    sub_22BF5A308();
    sub_22BF59D38();
    sub_22BEF96F8(&qword_2684921E0, (uint64_t *)&unk_268491260);
    uint64_t v24 = v28;
    sub_22BF5A188();
    sub_22BEF9E9C(v14);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v30);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v24);
    uint64_t v25 = v31;
    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v31, v13, v10);
    return __swift_storeEnumTagSinglePayload(v25, 0, 1, v10);
  }
  else
  {
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v10);
  }
}

uint64_t sub_22BEF5CE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  v16[0] = a2;
  v16[1] = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491298);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684912C0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491288);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v17 = *(_OWORD *)(a1 + 72);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491740);
  sub_22BF5A2B8();
  if (v18 == 1)
  {
    sub_22BF59CB8();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v13, v10);
    swift_storeEnumTagMultiPayload();
    sub_22BEF96F8(&qword_268491280, &qword_268491288);
    sub_22BEF958C();
    sub_22BF59F98();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    uint64_t v15 = type metadata accessor for AccountLoginLayoutView();
    sub_22BEF5FB0(v15, (uint64_t)v6);
    sub_22BEF973C((uint64_t)v6, (uint64_t)v9);
    swift_storeEnumTagMultiPayload();
    sub_22BEF96F8(&qword_268491280, &qword_268491288);
    sub_22BEF958C();
    sub_22BF59F98();
    return sub_22BEF9CBC((uint64_t)v6, &qword_268491298);
  }
}

uint64_t sub_22BEF5FB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v4 = sub_22BF59D58();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491260);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684912A0);
  MEMORY[0x270FA5388](v46);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684912D0);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  MEMORY[0x270FA5388](v15);
  if (*(void *)(v2 + 56))
  {
    uint64_t v38 = (char *)&v38 - v16;
    uint64_t v39 = v18;
    uint64_t v40 = v17;
    uint64_t v41 = v8;
    uint64_t v42 = v5;
    uint64_t v43 = v4;
    uint64_t v44 = a2;
    sub_22BF5A4E8();
    if (qword_268490F80 != -1) {
      swift_once();
    }
    id v19 = (id)qword_2684922C8;
    uint64_t v20 = (void *)sub_22BF5A4A8();
    uint64_t v21 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    id v22 = objc_msgSend(v19, sel_localizedStringForKey_value_table_, v20, v21, 0);

    uint64_t v23 = sub_22BF5A4C8();
    uint64_t v25 = v24;

    *(void *)&long long v48 = v23;
    *((void *)&v48 + 1) = v25;
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = *(_OWORD *)(v45 + 16);
    memcpy((void *)(v26 + 32), (const void *)v2, 0x58uLL);
    sub_22BEF9818(v2);
    sub_22BEF934C();
    sub_22BF5A308();
    if (*(unsigned char *)(v2 + 16))
    {
      long long v48 = *(_OWORD *)(v2 + 72);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491740);
      sub_22BF5A2B8();
      char v27 = v47;
    }
    else
    {
      char v27 = 1;
    }
    uint64_t v30 = v41;
    uint64_t v29 = v42;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v32 = swift_allocObject();
    *(unsigned char *)(v32 + 16) = v27;
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v11, v30);
    uint64_t v33 = (uint64_t *)&v13[*(int *)(v46 + 36)];
    uint64_t *v33 = KeyPath;
    v33[1] = (uint64_t)sub_22BEF9AAC;
    void v33[2] = v32;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v30);
    sub_22BF59D48();
    sub_22BEF9634();
    uint64_t v34 = v39;
    sub_22BF5A188();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v43);
    sub_22BEF9CBC((uint64_t)v13, &qword_2684912A0);
    uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 32);
    uint64_t v36 = v38;
    v35(v38, v34, v14);
    uint64_t v37 = v44;
    v35((char *)v44, (uint64_t)v36, v14);
    return __swift_storeEnumTagSinglePayload(v37, 0, 1, v14);
  }
  else
  {
    return __swift_storeEnumTagSinglePayload(a2, 1, 1, v14);
  }
}

uint64_t sub_22BEF64D4()
{
  uint64_t v0 = type metadata accessor for AccountLoginLayoutView();
  return sub_22BEF6500(v0);
}

uint64_t sub_22BEF6500(uint64_t a1)
{
  uint64_t v2 = (const void *)v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491C20);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22BF5A5E8();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  sub_22BF5A5C8();
  sub_22BEF9818(v1);
  uint64_t v8 = sub_22BF5A5B8();
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v10;
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(a1 + 16);
  memcpy((void *)(v9 + 48), v2, 0x58uLL);
  sub_22BEF6A0C((uint64_t)v6, (uint64_t)&unk_2684912E8, v9);
  return swift_release();
}

uint64_t sub_22BEF6618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a4;
  sub_22BF5A5C8();
  v4[10] = sub_22BF5A5B8();
  uint64_t v6 = sub_22BF5A588();
  v4[11] = v6;
  v4[12] = v5;
  return MEMORY[0x270FA2498](sub_22BEF66B0, v6, v5);
}

uint64_t sub_22BEF66B0()
{
  uint64_t v1 = *(void *)(v0 + 72);
  if ((*(unsigned char *)(v1 + 16) & 1) != 0 && (uint64_t v2 = *(int **)(v1 + 56), (*(void *)(v0 + 104) = v2) != 0))
  {
    *(void *)(v0 + 112) = *(void *)(v1 + 64);
    *(_OWORD *)(v0 + 16) = *(_OWORD *)(v1 + 72);
    sub_22BEF9E08(v0 + 24, v0 + 64);
    *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 16);
    *(unsigned char *)(v0 + 136) = 1;
    swift_retain();
    *(void *)(v0 + 120) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491740);
    sub_22BF5A2C8();
    uint64_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 128) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_22BEF6838;
    return v6();
  }
  else
  {
    swift_release();
    OUTLINED_FUNCTION_3();
    return v5();
  }
}

uint64_t sub_22BEF6838()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  OUTLINED_FUNCTION_2();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  uint64_t v4 = *(void *)(v1 + 96);
  uint64_t v5 = *(void *)(v1 + 88);
  return MEMORY[0x270FA2498](sub_22BEF694C, v5, v4);
}

uint64_t sub_22BEF694C()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_release();
  *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 16);
  *(unsigned char *)(v0 + 137) = 0;
  sub_22BEF9E70(v0 + 64);
  sub_22BF5A2C8();
  sub_22BEF9E9C(v1);
  sub_22BEF9EAC(v0 + 16);
  OUTLINED_FUNCTION_3();
  return v2();
}

uint64_t sub_22BEF6A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BF5A5E8();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_22BEF9CBC(a1, &qword_268491C20);
  }
  else
  {
    sub_22BF5A5D8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22BF5A588();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_22BEF6B7C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  memcpy(__dst, v2, sizeof(__dst));
  return sub_22BEF4240(a1, a2);
}

uint64_t sub_22BEF6BD0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  char v27 = a2;
  uint64_t v4 = *(void *)(a1 + 24);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491208);
  v26[2] = *(void *)(a1 + 16);
  v26[3] = v10;
  v26[1] = v4;
  uint64_t v11 = sub_22BF5A3B8();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  id v19 = (char *)v26 - v18;
  sub_22BEF6E18((uint64_t *)v33);
  long long v31 = v33[0];
  long long v32 = v33[1];
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v2 + *(int *)(a1 + 52), v4);
  uint64_t v20 = sub_22BEF92E8((unint64_t *)&unk_268491210, &qword_268491208);
  uint64_t v24 = *(void *)(a1 + 32);
  uint64_t v25 = *(void *)(a1 + 40);
  sub_22BF5A398();
  uint64_t v28 = v20;
  uint64_t v29 = v24;
  uint64_t v30 = v25;
  swift_getWitnessTable();
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v21(v19, v17, v11);
  id v22 = *(void (**)(char *, uint64_t))(v13 + 8);
  v22(v17, v11);
  v21(v27, v19, v11);
  return ((uint64_t (*)(char *, uint64_t))v22)(v19, v11);
}

uint64_t sub_22BEF6E18@<X0>(uint64_t *a1@<X8>)
{
  if (*(void *)(v1 + 8))
  {
    sub_22BEF934C();
    swift_bridgeObjectRetain();
    uint64_t result = sub_22BF5A0E8();
    uint64_t v7 = v6 & 1;
  }
  else
  {
    uint64_t result = 0;
    uint64_t v4 = 0;
    uint64_t v7 = 0;
    uint64_t v5 = 0;
  }
  *a1 = result;
  a1[1] = v4;
  a1[2] = v7;
  a1[3] = v5;
  return result;
}

uint64_t sub_22BEF6EA0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id sub_22BEF6EA8()
{
  return *v0;
}

uint64_t sub_22BEF6EB4()
{
  return sub_22BF5A4C8();
}

uint64_t sub_22BEF6EC4(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_268491058, type metadata accessor for ASWebAuthenticationSessionError);
  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_22BEF6F30(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_268491058, type metadata accessor for ASWebAuthenticationSessionError);
  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_22BEF6F9C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_22BEF7390(&qword_268491058, type metadata accessor for ASWebAuthenticationSessionError);
  id v5 = a1;
  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_22BEF702C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_22BF5A688();

  return v2;
}

uint64_t sub_22BEF7060(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BEF7390(&qword_268491058, type metadata accessor for ASWebAuthenticationSessionError);
  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

BOOL sub_22BEF70E0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_22BEF70F0()
{
  return sub_22BF5A4C8();
}

uint64_t sub_22BEF7100(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_268491008, type metadata accessor for WFOAuth2Error);
  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_22BEF716C(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_268491008, type metadata accessor for WFOAuth2Error);
  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_22BEF71D8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_22BEF7390(&qword_268491008, type metadata accessor for WFOAuth2Error);
  id v5 = a1;
  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_22BEF7268(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BEF7390(&qword_268491008, type metadata accessor for WFOAuth2Error);
  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

uint64_t sub_22BEF72E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BEF7300()
{
  return sub_22BEF7390(&qword_268491000, type metadata accessor for Code);
}

uint64_t sub_22BEF7348()
{
  return sub_22BEF7390(&qword_268491008, type metadata accessor for WFOAuth2Error);
}

uint64_t sub_22BEF7390(unint64_t *a1, void (*a2)(uint64_t))
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

void type metadata accessor for WFOAuth2Error(uint64_t a1)
{
}

uint64_t sub_22BEF73EC()
{
  return sub_22BEF7390(&qword_268491010, type metadata accessor for WFOAuth2Error);
}

uint64_t sub_22BEF7434()
{
  return sub_22BEF7390(&qword_268491018, type metadata accessor for WFOAuth2Error);
}

uint64_t sub_22BEF747C()
{
  return sub_22BEF7390(&qword_268491020, type metadata accessor for WFOAuth2Error);
}

uint64_t sub_22BEF74C4()
{
  return sub_22BEF7390(&qword_268491028, type metadata accessor for Code);
}

uint64_t sub_22BEF750C()
{
  return sub_22BEF7390(&qword_268491030, type metadata accessor for Code);
}

unint64_t sub_22BEF7558()
{
  unint64_t result = qword_268491038;
  if (!qword_268491038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491038);
  }
  return result;
}

uint64_t sub_22BEF75A4()
{
  return sub_22BEF7390(&qword_268491040, type metadata accessor for WFOAuth2Error);
}

uint64_t sub_22BEF75F0()
{
  return sub_22BF5A4C8();
}

uint64_t sub_22BEF7600(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_2684911C8, type metadata accessor for ENError);
  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_22BEF766C(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_2684911C8, type metadata accessor for ENError);
  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_22BEF76D8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_22BEF7390(&qword_2684911C8, type metadata accessor for ENError);
  id v5 = a1;
  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_22BEF7768()
{
  return sub_22BEF702C(*v0);
}

uint64_t sub_22BEF7770(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BEF7390(&qword_2684911C8, type metadata accessor for ENError);
  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

uint64_t sub_22BEF77EC()
{
  return sub_22BF5A808();
}

void sub_22BEF784C(uint64_t a1@<X8>)
{
  sub_22BEF7880();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_22BEF7888@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

BOOL sub_22BEF78B8(uint64_t *a1, uint64_t *a2)
{
  return sub_22BEF70E0(*a1, *a2);
}

uint64_t sub_22BEF78C4(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_268491060, type metadata accessor for ASWebAuthenticationSessionError);
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_22BEF7930(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_268491060, type metadata accessor for ASWebAuthenticationSessionError);
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_22BEF79A0(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_268491058, type metadata accessor for ASWebAuthenticationSessionError);
  return MEMORY[0x270EEF788](a1, v2);
}

uint64_t sub_22BEF7A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BEF7390(&qword_268491058, type metadata accessor for ASWebAuthenticationSessionError);
  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

uint64_t sub_22BEF7A90(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_268491010, type metadata accessor for WFOAuth2Error);
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_22BEF7AFC(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_268491010, type metadata accessor for WFOAuth2Error);
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_22BEF7B68(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_268491008, type metadata accessor for WFOAuth2Error);
  return MEMORY[0x270EEF788](a1, v2);
}

uint64_t sub_22BEF7BD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BEF7390(&qword_268491008, type metadata accessor for WFOAuth2Error);
  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

uint64_t sub_22BEF7C58()
{
  return sub_22BEF7390(&qword_268491048, type metadata accessor for WFOAuth2Error);
}

uint64_t sub_22BEF7CA0()
{
  return sub_22BEF7390(&qword_268491050, _s3__C4CodeOMa_0);
}

uint64_t sub_22BEF7CE8()
{
  return sub_22BEF7390(&qword_268491058, type metadata accessor for ASWebAuthenticationSessionError);
}

void type metadata accessor for ASWebAuthenticationSessionError(uint64_t a1)
{
}

uint64_t sub_22BEF7D44()
{
  return sub_22BEF7390(&qword_268491060, type metadata accessor for ASWebAuthenticationSessionError);
}

uint64_t sub_22BEF7D8C()
{
  return sub_22BEF7390(&qword_268491068, type metadata accessor for ASWebAuthenticationSessionError);
}

uint64_t sub_22BEF7DD4()
{
  return sub_22BEF7390((unint64_t *)&unk_268491070, type metadata accessor for ASWebAuthenticationSessionError);
}

uint64_t sub_22BEF7E1C()
{
  return sub_22BEF7390((unint64_t *)&unk_268491660, _s3__C4CodeOMa_0);
}

uint64_t sub_22BEF7E64()
{
  return sub_22BEF7390(&qword_268491080, _s3__C4CodeOMa_0);
}

uint64_t sub_22BEF7EAC()
{
  return sub_22BEF7390(&qword_268491088, type metadata accessor for ASWebAuthenticationSessionError);
}

uint64_t sub_22BEF7EF4()
{
  return sub_22BEF7390(&qword_268491090, type metadata accessor for ASWebAuthenticationSessionError);
}

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2()) {
    return a1;
  }
  else {
    return 0;
  }
}

void _s3__C4CodeOMa_1(uint64_t a1)
{
}

uint64_t sub_22BEF7F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_22BEF7F9C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22BEF8044(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
  }
  else
  {
    uint64_t v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    uint64_t v12 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
    uint64_t v15 = (void *)((v7 + v13) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v16 = v15[1];
    uint64_t v17 = (void *)((v7 + v12) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v17 = *v15;
    v17[1] = v16;
  }
  swift_retain();
  return a1;
}

uint64_t sub_22BEF8178(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 24) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80));
  return swift_release();
}

void *sub_22BEF8210(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(void *)(v5 - 8) + 16;
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  swift_bridgeObjectRetain();
  v6(v9, v10, v5);
  uint64_t v11 = *(void *)(v7 + 48) + 7;
  uint64_t v12 = (void *)((v11 + v9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)((v11 + v10) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  return a1;
}

void *sub_22BEF82C4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v9, v10);
  uint64_t v11 = *(void *)(v7 + 40) + 7;
  uint64_t v12 = (void *)((v11 + v9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)((v11 + v10) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_22BEF8394(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 16) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 16) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_22BEF8434(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 16) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  *(_OWORD *)((*(void *)(v8 + 24) + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v8 + 24) + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_22BEF84EC(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v9 = *(void *)(*(void *)(v4 - 8) + 64) + 7;
  if (v8 < a2)
  {
    unint64_t v10 = ((v9 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v11 = a2 - v8;
    uint64_t v12 = v10 & 0xFFFFFFF8;
    if ((v10 & 0xFFFFFFF8) != 0) {
      unsigned int v13 = 2;
    }
    else {
      unsigned int v13 = v11 + 1;
    }
    if (v13 >= 0x10000) {
      unsigned int v14 = 4;
    }
    else {
      unsigned int v14 = 2;
    }
    if (v13 < 0x100) {
      unsigned int v14 = 1;
    }
    if (v13 >= 2) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    switch(v15)
    {
      case 1:
        int v16 = *((unsigned __int8 *)a1 + v10);
        if (!v16) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v16 = *(unsigned __int16 *)((char *)a1 + v10);
        if (v16) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x22BEF8644);
      case 4:
        int v16 = *(_DWORD *)((char *)a1 + v10);
        if (!v16) {
          break;
        }
LABEL_22:
        int v18 = v16 - 1;
        if (v12)
        {
          int v18 = 0;
          LODWORD(v12) = *a1;
        }
        return v8 + (v12 | v18) + 1;
      default:
        break;
    }
  }
  uint64_t v19 = ((unint64_t)a1 + v7 + 16) & ~v7;
  if (v6 >= 0x7FFFFFFF) {
    return __swift_getEnumTagSinglePayload(v19, v6, v4);
  }
  unint64_t v20 = *(void *)((v9 + v19) & 0xFFFFFFFFFFFFFFF8);
  if (v20 >= 0xFFFFFFFF) {
    LODWORD(v20) = -1;
  }
  return (v20 + 1);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void sub_22BEF8680(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = *(void *)(*(void *)(v6 - 8) + 64) + 7;
  unint64_t v12 = ((v11 + ((v10 + 16) & ~v10)) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v9 >= a3)
  {
    int v16 = 0;
  }
  else
  {
    unsigned int v13 = a3 - v9;
    if (((v11 + ((v10 + 16) & ~v10)) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v14 = v13 + 1;
    }
    else {
      unsigned int v14 = 2;
    }
    if (v14 >= 0x10000) {
      int v15 = 4;
    }
    else {
      int v15 = 2;
    }
    if (v14 < 0x100) {
      int v15 = 1;
    }
    if (v14 >= 2) {
      int v16 = v15;
    }
    else {
      int v16 = 0;
    }
  }
  if (a2 > v9)
  {
    if (((v11 + ((v10 + 16) & ~v10)) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v17 = a2 - v9;
    }
    else {
      int v17 = 1;
    }
    if (((v11 + ((v10 + 16) & ~v10)) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v18 = ~v9 + a2;
      bzero(a1, ((v11 + ((v10 + 16) & ~v10)) & 0xFFFFFFFFFFFFFFF8) + 16);
      *(_DWORD *)a1 = v18;
    }
    switch(v16)
    {
      case 1:
        a1[v12] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v12] = v17;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v12] = v17;
        return;
      default:
        return;
    }
  }
  switch(v16)
  {
    case 1:
      a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x22BEF8870);
    case 4:
      *(_DWORD *)&a1[v12] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        unint64_t v19 = (unint64_t)&a1[v10 + 16] & ~v10;
        if (v8 < 0x7FFFFFFF)
        {
          unint64_t v20 = (void *)((v11 + v19) & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v21 = a2 ^ 0x80000000;
            v20[1] = 0;
          }
          else
          {
            uint64_t v21 = (a2 - 1);
          }
          *unint64_t v20 = v21;
        }
        else
        {
          __swift_storeEnumTagSinglePayload(v19, a2, v8, v6);
        }
      }
      return;
  }
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for AccountLoginSection()
{
  return swift_getGenericMetadata();
}

uint64_t _s11ActionKitUI20SSHKeyGenerationViewVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_22BEF890C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  if (*(void *)(a1 + 40)) {
    swift_release();
  }
  if (*(void *)(a1 + 56)) {
    swift_release();
  }
  return swift_release();
}

uint64_t sub_22BEF8970(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v7 = (_OWORD *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_retain();
  if (v6)
  {
    uint64_t v8 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v6;
    *(void *)(a1 + 48) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *v7;
  }
  uint64_t v9 = *(void *)(a2 + 56);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v9;
    *(void *)(a1 + 64) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  return a1;
}

uint64_t sub_22BEF8A30(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v5;
      *(void *)(a1 + 48) = v6;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v5;
    *(void *)(a1 + 48) = v7;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
LABEL_8:
  uint64_t v8 = *(void *)(a2 + 56);
  if (!*(void *)(a1 + 56))
  {
    if (v8)
    {
      uint64_t v10 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v8;
      *(void *)(a1 + 64) = v10;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = v9;
  swift_retain();
  swift_release();
LABEL_15:
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t sub_22BEF8B80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  uint64_t v5 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v5;
      *(void *)(a1 + 48) = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v5;
    *(void *)(a1 + 48) = v7;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
LABEL_8:
  uint64_t v8 = *(void *)(a2 + 56);
  if (!*(void *)(a1 + 56))
  {
    if (v8)
    {
      uint64_t v10 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v8;
      *(void *)(a1 + 64) = v10;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = v9;
  swift_release();
LABEL_15:
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  return a1;
}

uint64_t sub_22BEF8C90(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 88))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22BEF8CD0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for AccountLoginLayoutView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22BEF8D3C()
{
  return sub_22BEF92E8(&qword_2684911B0, &qword_2684911B8);
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

uint64_t sub_22BEF8DB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BEF8DF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BEF8E3C()
{
  return sub_22BEF7390(&qword_2684911C0, _s3__C4CodeOMa_1);
}

uint64_t sub_22BEF8E84()
{
  return sub_22BEF7390(&qword_2684911C8, type metadata accessor for ENError);
}

void type metadata accessor for ENError(uint64_t a1)
{
}

void sub_22BEF8EE0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_22BEF8F28()
{
  return sub_22BEF7390(&qword_2684911D0, type metadata accessor for ENError);
}

uint64_t sub_22BEF8F70()
{
  return sub_22BEF7390(&qword_2684911D8, type metadata accessor for ENError);
}

uint64_t sub_22BEF8FB8()
{
  return sub_22BEF7390((unint64_t *)&unk_2684911E0, type metadata accessor for ENError);
}

uint64_t sub_22BEF9000()
{
  return sub_22BEF7390((unint64_t *)&unk_268491940, _s3__C4CodeOMa_1);
}

uint64_t sub_22BEF9048()
{
  return sub_22BEF7390(&qword_2684911F0, _s3__C4CodeOMa_1);
}

uint64_t sub_22BEF9090()
{
  return sub_22BEF7390(&qword_2684911F8, type metadata accessor for ENError);
}

uint64_t sub_22BEF90D8(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_2684911D0, type metadata accessor for ENError);
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_22BEF9144(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_2684911D0, type metadata accessor for ENError);
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_22BEF91B0(uint64_t a1)
{
  uint64_t v2 = sub_22BEF7390(&qword_2684911C8, type metadata accessor for ENError);
  return MEMORY[0x270EEF788](a1, v2);
}

uint64_t sub_22BEF921C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BEF7390(&qword_2684911C8, type metadata accessor for ENError);
  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

uint64_t sub_22BEF92A0()
{
  return sub_22BEF7390(&qword_268491200, type metadata accessor for ENError);
}

uint64_t sub_22BEF92E8(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_22BEF934C()
{
  unint64_t result = qword_268491760;
  if (!qword_268491760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268491760);
  }
  return result;
}

uint64_t sub_22BEF9398@<X0>(char *a1@<X8>)
{
  return sub_22BEF46F8(*(_OWORD **)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_22BEF93A4@<X0>(uint64_t a1@<X8>)
{
  return sub_22BEF4E14(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_22BEF93B0@<X0>(uint64_t a1@<X8>)
{
  return sub_22BEF5590(v1[4], v1[2], v1[3], a1);
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

uint64_t sub_22BEF9400@<X0>(uint64_t a1@<X8>)
{
  return sub_22BEF58AC(a1);
}

unint64_t sub_22BEF940C()
{
  unint64_t result = qword_268491258;
  if (!qword_268491258)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491250);
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268491260);
    sub_22BEF96F8(&qword_2684921E0, (uint64_t *)&unk_268491260);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491258);
  }
  return result;
}

uint64_t sub_22BEF94E0@<X0>(uint64_t a1@<X8>)
{
  return sub_22BEF5CE4(*(void *)(v1 + 32), *(void *)(v1 + 24), a1);
}

unint64_t sub_22BEF94EC()
{
  unint64_t result = qword_268491278;
  if (!qword_268491278)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491270);
    sub_22BEF96F8(&qword_268491280, &qword_268491288);
    sub_22BEF958C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491278);
  }
  return result;
}

unint64_t sub_22BEF958C()
{
  unint64_t result = qword_268491290;
  if (!qword_268491290)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491298);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684912A0);
    sub_22BEF9634();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491290);
  }
  return result;
}

unint64_t sub_22BEF9634()
{
  unint64_t result = qword_2684912A8;
  if (!qword_2684912A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684912A0);
    sub_22BEF96F8(&qword_2684921E0, (uint64_t *)&unk_268491260);
    sub_22BEF96F8(&qword_2684912B0, &qword_2684912B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684912A8);
  }
  return result;
}

uint64_t sub_22BEF96F8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_22BEF973C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BEF97A4()
{
  swift_bridgeObjectRelease();
  swift_release();
  if (*(void *)(v0 + 72)) {
    swift_release();
  }
  if (*(void *)(v0 + 88)) {
    swift_release();
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, 120, 7);
}

uint64_t sub_22BEF980C()
{
  return sub_22BEF64D4();
}

uint64_t sub_22BEF9818(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22BEF9894(v2);
  sub_22BEF9894(v3);
  swift_retain();
  return a1;
}

uint64_t sub_22BEF9894(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_22BEF98A4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_22BEF9980;
  return v6(a1);
}

uint64_t sub_22BEF9980()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v3();
}

uint64_t sub_22BEF9A44@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22BF59E38();
  *a1 = result & 1;
  return result;
}

uint64_t sub_22BEF9A74()
{
  return sub_22BF59E48();
}

uint64_t sub_22BEF9A9C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_22BEF9AAC(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_22BEF9AC4()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(void *)(v0 + 88)) {
    swift_release();
  }
  if (*(void *)(v0 + 104)) {
    swift_release();
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, 136, 7);
}

uint64_t sub_22BEF9B34(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_22BEF9BFC;
  return sub_22BEF6618(a1, v4, v5, v1 + 48);
}

uint64_t sub_22BEF9BFC()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v3();
}

uint64_t sub_22BEF9CBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22BEF9D18()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22BEF9D50(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_22BEF9BFC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2684912F0 + dword_2684912F0);
  return v6(a1, v4);
}

uint64_t sub_22BEF9E08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BEF9E70(uint64_t a1)
{
  return a1;
}

uint64_t sub_22BEF9E9C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_22BEF9EAC(uint64_t a1)
{
  return a1;
}

uint64_t sub_22BEF9ED8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_22BEF9F00@<X0>(char *a1@<X8>)
{
  return sub_22BEF5358(*(void *)(v1 + 16), a1);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22BEF9F3C()
{
  return swift_getWitnessTable();
}

uint64_t sub_22BEF9FDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_5()
{
  *(void *)(v2 - 128) = v0;
  *(void *)(v2 - 120) = v1;
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BEFA320(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_22BF5A418();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3_0();
  uint64_t v11 = v10 - v9;
  uint64_t v23 = sub_22BF5A448();
  OUTLINED_FUNCTION_0_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_3_0();
  uint64_t v17 = v16 - v15;
  sub_22BEFD454();
  int v18 = (void *)sub_22BF5A648();
  unint64_t v19 = (void *)swift_allocObject();
  v19[2] = v2;
  v19[3] = a1;
  v19[4] = a2;
  aBlock[4] = sub_22BEFD4D4;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22BF1F2AC;
  aBlock[3] = &block_descriptor_1;
  unint64_t v20 = _Block_copy(aBlock);
  id v21 = v2;
  swift_retain();
  swift_release();
  sub_22BF5A438();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22BEFD54C((unint64_t *)&unk_268491700, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914C0);
  sub_22BEF96F8((unint64_t *)&qword_268491710, (uint64_t *)&unk_2684914C0);
  sub_22BF5A6D8();
  MEMORY[0x230F588F0](0, v17, v11, v20);
  _Block_release(v20);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v17, v23);
}

uint64_t sub_22BEFA5A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = type metadata accessor for InstapaperLoginView(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v13 = a2;
  *((void *)v13 + 1) = a3;
  uint64_t v28 = 0;
  unint64_t v29 = 0xE000000000000000;
  swift_retain();
  sub_22BF5A2A8();
  uint64_t v14 = v31;
  *((_OWORD *)v13 + 1) = v30;
  *((void *)v13 + 4) = v14;
  uint64_t v28 = 0;
  unint64_t v29 = 0xE000000000000000;
  sub_22BF5A2A8();
  uint64_t v15 = v31;
  *(_OWORD *)(v13 + 40) = v30;
  *((void *)v13 + 7) = v15;
  uint64_t v16 = sub_22BF59C28();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v16);
  sub_22BEFE78C((uint64_t)v10, (uint64_t)v8, &qword_2684914D0);
  sub_22BF5A2A8();
  sub_22BEF9CBC((uint64_t)v10, &qword_2684914D0);
  uint64_t v17 = *(int *)(v11 + 32);
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  int v18 = (uint64_t *)&v13[v17];
  id v19 = (id)qword_2684922C8;
  unint64_t v20 = (void *)sub_22BF5A4A8();
  id v21 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v22 = objc_msgSend(v19, sel_localizedStringForKey_value_table_, v20, v21, 0);

  uint64_t v23 = sub_22BF5A4C8();
  uint64_t v25 = v24;

  *int v18 = v23;
  v18[1] = v25;
  sub_22BEFD54C(&qword_2684914D8, (void (*)(uint64_t))type metadata accessor for InstapaperLoginView);
  sub_22BF5A678();
  return sub_22BEFD594((uint64_t)v13);
}

id sub_22BEFA910(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for WFInstapaperAccessResourceUserInterface();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithUserInterfaceType_attribution_, a1, a2);

  return v5;
}

id sub_22BEFA9B8(uint64_t a1)
{
  return sub_22BEFD198(a1, type metadata accessor for WFInstapaperAccessResourceUserInterface);
}

uint64_t type metadata accessor for WFInstapaperAccessResourceUserInterface()
{
  return self;
}

uint64_t sub_22BEFA9F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for InstapaperLoginView(0);
  uint64_t v36 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v36 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v4 - 8);
  objc_super v7 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v36 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v36 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v36 - v15;
  uint64_t v17 = (uint64_t *)(v1 + *(int *)(v14 + 40));
  uint64_t v18 = v17[1];
  uint64_t v37 = *v17;
  uint64_t v38 = v18;
  uint64_t v19 = *(void *)(v1 + 32);
  long long v39 = *(_OWORD *)(v1 + 16);
  uint64_t v40 = v19;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
  sub_22BF5A2B8();
  uint64_t v21 = v41;
  unint64_t v20 = v42;
  swift_bridgeObjectRelease();
  if ((v20 & 0x2000000000000000) != 0) {
    uint64_t v22 = HIBYTE(v20) & 0xF;
  }
  else {
    uint64_t v22 = v21 & 0xFFFFFFFFFFFFLL;
  }
  sub_22BEFE244(v2, (uint64_t)v16);
  if (v22)
  {
    uint64_t v23 = *((void *)v16 + 7);
    long long v39 = *(_OWORD *)(v16 + 40);
    uint64_t v40 = v23;
    sub_22BF5A2B8();
    uint64_t v25 = v41;
    unint64_t v24 = v42;
    swift_bridgeObjectRelease();
    uint64_t v26 = HIBYTE(v24) & 0xF;
    if ((v24 & 0x2000000000000000) == 0) {
      uint64_t v26 = v25 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v27 = v26 != 0;
  }
  else
  {
    BOOL v27 = 0;
  }
  sub_22BEFD594((uint64_t)v16);
  sub_22BEFE244(v2, (uint64_t)v13);
  unint64_t v28 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v29 = swift_allocObject();
  sub_22BEFE2AC((uint64_t)v13, v29 + v28);
  sub_22BEFE244(v2, (uint64_t)v10);
  uint64_t v30 = swift_allocObject();
  sub_22BEFE2AC((uint64_t)v10, v30 + v28);
  sub_22BEFE244(v2, (uint64_t)v7);
  uint64_t v31 = swift_allocObject();
  sub_22BEFE2AC((uint64_t)v7, v31 + v28);
  LOBYTE(v41) = 0;
  uint64_t result = sub_22BF5A2A8();
  char v33 = v39;
  uint64_t v34 = *((void *)&v39 + 1);
  uint64_t v35 = v38;
  *(void *)a1 = v37;
  *(void *)(a1 + 8) = v35;
  *(unsigned char *)(a1 + 16) = v27;
  *(unsigned char *)(a1 + 17) = 0;
  *(void *)(a1 + 24) = sub_22BEFE310;
  *(void *)(a1 + 32) = v29;
  *(void *)(a1 + 40) = sub_22BEFE48C;
  *(void *)(a1 + 48) = v30;
  *(void *)(a1 + 56) = &unk_268491520;
  *(void *)(a1 + 64) = v31;
  *(unsigned char *)(a1 + 72) = v33;
  *(void *)(a1 + 80) = v34;
  return result;
}

uint64_t sub_22BEFACF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v52 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491530);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v51 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = type metadata accessor for InstapaperLoginView(0);
  uint64_t v43 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v44 = v4;
  uint64_t v45 = (uint64_t)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684917C0);
  MEMORY[0x270FA5388](v5 - 8);
  objc_super v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491540);
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684917B0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491550);
  uint64_t v47 = *(void *)(v14 - 8);
  uint64_t v48 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v46 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v16 = (id)qword_2684922C8;
  uint64_t v17 = (void *)sub_22BF5A4A8();
  uint64_t v18 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, v18, 0);

  uint64_t v20 = sub_22BF5A4C8();
  uint64_t v39 = v21;
  uint64_t v40 = v20;

  sub_22BF5A4E8();
  id v22 = (id)qword_2684922C8;
  uint64_t v23 = (void *)sub_22BF5A4A8();
  unint64_t v24 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v22, sel_localizedStringForKey_value_table_, v23, v24, 0);

  uint64_t v26 = sub_22BF5A4C8();
  uint64_t v28 = v27;

  uint64_t v53 = v26;
  uint64_t v54 = v28;
  sub_22BF59B48();
  uint64_t v29 = sub_22BF59B58();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v29);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_22BEF934C();
    sub_22BF5A0B8();
    uint64_t v31 = v45;
    sub_22BEFE244(v50, v45);
    unint64_t v32 = (*(unsigned __int8 *)(v43 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    uint64_t v33 = swift_allocObject();
    sub_22BEFE2AC(v31, v33 + v32);
    uint64_t v34 = v41;
    uint64_t v35 = v39;
    *(void *)uint64_t v13 = v40;
    *((void *)v13 + 1) = v35;
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(&v13[*(int *)(v11 + 52)], v10, v42);
    uint64_t v36 = (uint64_t (**)())&v13[*(int *)(v11 + 56)];
    char *v36 = sub_22BEFE5E4;
    v36[1] = (uint64_t (*)())v33;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
    uint64_t v37 = (uint64_t)v51;
    sub_22BF5A2D8();
    sub_22BF59C28();
    sub_22BEF96F8(&qword_268491560, &qword_2684917B0);
    sub_22BEFD54C(&qword_268491568, MEMORY[0x263F87748]);
    uint64_t v38 = v46;
    sub_22BF5A1C8();
    sub_22BEF9CBC(v37, (uint64_t *)&unk_268491530);
    sub_22BEF9CBC((uint64_t)v13, &qword_2684917B0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v47 + 32))(v52, v38, v48);
  }
  return result;
}

uint64_t sub_22BEFB2E8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v76 = a2;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491570);
  uint64_t v72 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  long long v71 = (char *)v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491810);
  uint64_t v4 = MEMORY[0x270FA5388](v70);
  uint64_t v75 = (char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v73 = (uint64_t)v62 - v6;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491580);
  uint64_t v7 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v9 = (char *)v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491588);
  MEMORY[0x270FA5388](v63);
  uint64_t v11 = (char *)v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491590);
  uint64_t v64 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v13 = (char *)v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491598);
  uint64_t v68 = *(void *)(v14 - 8);
  uint64_t v69 = v14;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  v67 = (char *)v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v77 = (char *)v62 - v17;
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v18 = (id)qword_2684922C8;
  id v19 = (void *)sub_22BF5A4A8();
  uint64_t v20 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v21 = objc_msgSend(v18, sel_localizedStringForKey_value_table_, v19, v20, 0);

  uint64_t v22 = sub_22BF5A4C8();
  unint64_t v24 = v23;

  uint64_t v25 = *(void *)(a1 + 32);
  long long v78 = *(_OWORD *)(a1 + 16);
  uint64_t v79 = v25;
  v62[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
  sub_22BF5A2D8();
  v62[0] = a1;
  uint64_t v80 = v22;
  unint64_t v81 = v24;
  v62[1] = sub_22BEF934C();
  sub_22BF5A408();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v27 = sub_22BF5A4C8();
  uint64_t v29 = v28;
  uint64_t v30 = v65;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v9, v65);
  uint64_t v31 = v63;
  unint64_t v32 = (uint64_t *)&v11[*(int *)(v63 + 36)];
  *unint64_t v32 = KeyPath;
  v32[1] = v27;
  v32[2] = v29;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v30);
  unint64_t v33 = sub_22BEFE660();
  sub_22BF5A148();
  sub_22BEF9CBC((uint64_t)v11, &qword_268491588);
  uint64_t v80 = v31;
  unint64_t v81 = v33;
  swift_getOpaqueTypeConformance2();
  uint64_t v34 = v66;
  uint64_t v35 = v67;
  sub_22BF5A198();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v13, v34);
  uint64_t v37 = v68;
  uint64_t v36 = v69;
  (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v77, v35, v69);
  sub_22BF5A4E8();
  id v38 = (id)qword_2684922C8;
  uint64_t v39 = (void *)sub_22BF5A4A8();
  uint64_t v40 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v41 = objc_msgSend(v38, sel_localizedStringForKey_value_table_, v39, v40, 0);

  uint64_t v42 = sub_22BF5A4C8();
  unint64_t v44 = v43;

  uint64_t v45 = *(void *)(v62[0] + 56);
  long long v78 = *(_OWORD *)(v62[0] + 40);
  uint64_t v79 = v45;
  sub_22BF5A2D8();
  uint64_t v80 = v42;
  unint64_t v81 = v44;
  uint64_t v46 = v71;
  sub_22BF59C88();
  uint64_t v47 = swift_getKeyPath();
  uint64_t v48 = sub_22BF5A4C8();
  uint64_t v50 = v49;
  uint64_t v51 = v72;
  uint64_t v52 = v74;
  uint64_t v53 = (uint64_t)v75;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v75, v46, v74);
  uint64_t v54 = (uint64_t *)(v53 + *(int *)(v70 + 36));
  *uint64_t v54 = v47;
  v54[1] = v48;
  v54[2] = v50;
  (*(void (**)(char *, uint64_t))(v51 + 8))(v46, v52);
  uint64_t v55 = v73;
  sub_22BEFE724(v53, v73);
  uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
  uint64_t v57 = v77;
  v56(v35, v77, v36);
  sub_22BEFE78C(v55, v53, (uint64_t *)&unk_268491810);
  uint64_t v58 = v76;
  v56(v76, v35, v36);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684915C0);
  sub_22BEFE78C(v53, (uint64_t)&v58[*(int *)(v59 + 48)], (uint64_t *)&unk_268491810);
  sub_22BEF9CBC(v55, (uint64_t *)&unk_268491810);
  uint64_t v60 = *(void (**)(char *, uint64_t))(v37 + 8);
  v60(v57, v36);
  sub_22BEF9CBC(v53, (uint64_t *)&unk_268491810);
  return ((uint64_t (*)(char *, uint64_t))v60)(v35, v36);
}

uint64_t sub_22BEFBB1C(uint64_t a1)
{
  uint64_t v2 = sub_22BF59C28();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_22BF5A218();
}

uint64_t sub_22BEFBBE8()
{
  v0[2] = sub_22BF5A5C8();
  v0[3] = sub_22BF5A5B8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_22BEFBC94;
  return sub_22BEFBDF8();
}

uint64_t sub_22BEFBC94()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v4 = sub_22BF5A588();
  return MEMORY[0x270FA2498](sub_22BEFBDA0, v4, v3);
}

uint64_t sub_22BEFBDA0()
{
  OUTLINED_FUNCTION_4();
  swift_release();
  OUTLINED_FUNCTION_3();
  return v0();
}

uint64_t sub_22BEFBDF8()
{
  v1[17] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  sub_22BF5A5C8();
  v1[20] = sub_22BF5A5B8();
  uint64_t v3 = sub_22BF5A588();
  v1[21] = v3;
  v1[22] = v2;
  return MEMORY[0x270FA2498](sub_22BEFBED0, v3, v2);
}

uint64_t sub_22BEFBED0()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v1 + 32);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v1 + 16);
  *(void *)(v0 + 32) = v2;
  *(void *)(v0 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
  sub_22BF5A2B8();
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v1 + 56);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)(v1 + 40);
  *(void *)(v0 + 56) = v5;
  sub_22BF5A2B8();
  uint64_t v7 = *(void *)(v0 + 104);
  uint64_t v6 = *(void *)(v0 + 112);
  id v8 = objc_allocWithZone((Class)type metadata accessor for InstapaperLoginSession(0));
  *(void *)(v0 + 192) = sub_22BEFC374(v3, v4, v7, v6);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_22BEFC000;
  return sub_22BEFC42C();
}

uint64_t sub_22BEFC000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_1();
  uint64_t v11 = v10;
  uint64_t v12 = *v5;
  OUTLINED_FUNCTION_2();
  *uint64_t v13 = v12;
  v11[26] = v4;
  swift_task_dealloc();
  if (v4)
  {
    uint64_t v14 = v11[21];
    uint64_t v15 = v11[22];
    uint64_t v16 = sub_22BEFC250;
  }
  else
  {
    v11[27] = a4;
    v11[28] = a3;
    v11[29] = a2;
    v11[30] = a1;
    uint64_t v14 = v11[21];
    uint64_t v15 = v11[22];
    uint64_t v16 = sub_22BEFC11C;
  }
  return MEMORY[0x270FA2498](v16, v14, v15);
}

uint64_t sub_22BEFC11C()
{
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v4 = *(void *)(v0 + 216);
  uint64_t v3 = *(void *)(v0 + 224);
  uint64_t v10 = *(void **)(v0 + 192);
  uint64_t v5 = *(void *)(v0 + 136);
  swift_release();
  uint64_t v6 = self;
  uint64_t v7 = *(void *)(v5 + 32);
  *(_OWORD *)(v0 + 64) = *(_OWORD *)(v5 + 16);
  *(void *)(v0 + 80) = v7;
  sub_22BF5A2B8();
  sub_22BEFE574(*(void *)(v0 + 120), *(void *)(v0 + 128), v6, (SEL *)&selRef_setInstapaperUsername_);
  sub_22BEFE574(v1, v2, v6, (SEL *)&selRef_setInstapaperToken_);
  sub_22BEFE574(v3, v4, v6, (SEL *)&selRef_setInstapaperTokenSecret_);
  (*(void (**)(uint64_t, void))v5)(1, 0);

  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v8();
}

uint64_t sub_22BEFC250()
{
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = (void *)v0[24];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[18];
  swift_release();

  sub_22BF59AF8();
  sub_22BF59C38();
  uint64_t v5 = sub_22BF59C28();
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v5);
  type metadata accessor for InstapaperLoginView(0);
  sub_22BEFE78C(v3, v4, &qword_2684914D0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  sub_22BF5A2C8();

  sub_22BEF9CBC(v3, &qword_2684914D0);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v6();
}

uint64_t sub_22BEFC360(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_engine) = a1;
  return MEMORY[0x270F9A758]();
}

id sub_22BEFC374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)&v4[OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_engine] = 0;
  uint64_t v9 = (uint64_t)&v4[OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_continuation];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491490);
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  uint64_t v11 = &v4[OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_username];
  *(void *)uint64_t v11 = a1;
  *((void *)v11 + 1) = a2;
  uint64_t v12 = &v4[OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_password];
  *(void *)uint64_t v12 = a3;
  *((void *)v12 + 1) = a4;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for InstapaperLoginSession(0);
  return objc_msgSendSuper2(&v14, sel_init);
}

uint64_t sub_22BEFC42C()
{
  OUTLINED_FUNCTION_4();
  v1[6] = v0;
  v1[7] = sub_22BF5A5C8();
  v1[8] = sub_22BF5A5B8();
  uint64_t v3 = sub_22BF5A588();
  v1[9] = v3;
  v1[10] = v2;
  return MEMORY[0x270FA2498](sub_22BEFC4C4, v3, v2);
}

uint64_t sub_22BEFC4C4()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F231C0]), sel_initWithDelegate_, v0[6]);
  v0[11] = v1;
  if (v1)
  {
    id v9 = v1;
    uint64_t v10 = v0[6];
    uint64_t v11 = sub_22BF5A5B8();
    v0[12] = v11;
    uint64_t v12 = swift_task_alloc();
    v0[13] = v12;
    *(void *)(v12 + 16) = v10;
    *(void *)(v12 + 24) = v9;
    uint64_t v13 = (void *)swift_task_alloc();
    v0[14] = v13;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914A8);
    *uint64_t v13 = v0;
    v13[1] = sub_22BEFC60C;
    uint64_t v3 = MEMORY[0x263F8F500];
    uint64_t v6 = sub_22BEFD44C;
    id v1 = v0 + 2;
    uint64_t v2 = v11;
    uint64_t v4 = 0x29286E69676F6CLL;
    unint64_t v5 = 0xE700000000000000;
    uint64_t v7 = v12;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2360](v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_22BEFC60C()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2();
  *unint64_t v5 = v4;
  v3[15] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = v3[9];
    uint64_t v7 = v3[10];
    uint64_t v8 = sub_22BEFC774;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v6 = v3[9];
    uint64_t v7 = v3[10];
    uint64_t v8 = sub_22BEFC700;
  }
  return MEMORY[0x270FA2498](v8, v6, v7);
}

uint64_t sub_22BEFC700()
{
  OUTLINED_FUNCTION_4();

  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 8);
  return v5(v1, v2, v3, v4);
}

uint64_t sub_22BEFC774()
{
  uint64_t v1 = *(void **)(v0 + 88);
  swift_release();

  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v2();
}

uint64_t sub_22BEFC7F8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491498);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491490);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v8, a1, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v9);
  uint64_t v10 = a2 + OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_continuation;
  swift_beginAccess();
  sub_22BEFD334((uint64_t)v8, v10);
  swift_endAccess();
  uint64_t v11 = (void *)sub_22BF5A4A8();
  uint64_t v12 = (void *)sub_22BF5A4A8();

  id v13 = a3;
  return sub_22BEFC360((uint64_t)a3);
}

uint64_t sub_22BEFC978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v27 = a3;
  uint64_t v28 = a5;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491490);
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_3_0();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491498);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  id v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  id v21 = (char *)&v26 - v20;
  uint64_t v22 = v6 + OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_continuation;
  swift_beginAccess();
  sub_22BEFE78C(v22, (uint64_t)v21, &qword_268491498);
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v9))
  {
    sub_22BEF9CBC((uint64_t)v21, &qword_268491498);
LABEL_6:
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 1, 1, v9);
    swift_beginAccess();
    sub_22BEFD334((uint64_t)v19, v22);
    return swift_endAccess();
  }
  uint64_t v24 = v27;
  uint64_t v23 = v28;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v15, v21, v9);
  uint64_t result = sub_22BEF9CBC((uint64_t)v21, &qword_268491498);
  if (a4)
  {
    if (a6)
    {
      uint64_t v29 = v24;
      uint64_t v30 = a4;
      uint64_t v31 = v23;
      uint64_t v32 = a6;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_22BF5A5A8();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
      goto LABEL_6;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_22BEFCC6C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491490);
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3_0();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491498);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v45 - v16;
  if (!a3) {
    return;
  }
  uint64_t v48 = v11;
  uint64_t v49 = v3;
  id v18 = a3;
  id v19 = (id)sub_22BF59AF8();
  id v20 = objc_msgSend(v19, sel_domain);
  uint64_t v21 = sub_22BF5A4C8();
  uint64_t v23 = v22;

  if (v21 == sub_22BF5A4C8() && v23 == v24)
  {
    swift_bridgeObjectRelease_n();
LABEL_9:
    id v27 = objc_msgSend(v19, sel_code);

    if (v27 == (id)401)
    {
      uint64_t v47 = v7;
      uint64_t v28 = sub_22BF5A4C8();
      uint64_t v45 = v29;
      uint64_t v46 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2684914A0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_22BF62900;
      *(void *)(inited + 32) = sub_22BF5A4C8();
      *(void *)(inited + 40) = v31;
      sub_22BF5A4E8();
      if (qword_268490F80 != -1) {
        swift_once();
      }
      id v32 = (id)qword_2684922C8;
      unint64_t v33 = (void *)sub_22BF5A4A8();
      uint64_t v34 = (void *)sub_22BF5A4A8();
      swift_bridgeObjectRelease();
      id v35 = objc_msgSend(v32, sel_localizedStringForKey_value_table_, v33, v34, 0);

      uint64_t v36 = sub_22BF5A4C8();
      uint64_t v38 = v37;

      *(void *)(inited + 72) = MEMORY[0x263F8D310];
      *(void *)(inited + 48) = v36;
      *(void *)(inited + 56) = v38;
      uint64_t v39 = sub_22BF5A468();
      id v40 = objc_allocWithZone(MEMORY[0x263F087E8]);
      id v41 = sub_22BEFD39C(v46, v45, 401, v39);

      id v19 = v41;
      uint64_t v7 = v47;
    }
    goto LABEL_13;
  }
  char v26 = sub_22BF5A7A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v26) {
    goto LABEL_9;
  }

LABEL_13:
  uint64_t v42 = v49 + OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_continuation;
  swift_beginAccess();
  sub_22BEFE78C(v42, (uint64_t)v17, &qword_268491498);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v5))
  {
    sub_22BEF9CBC((uint64_t)v17, &qword_268491498);
  }
  else
  {
    uint64_t v43 = v48;
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v48, v17, v5);
    sub_22BEF9CBC((uint64_t)v17, &qword_268491498);
    id v50 = v19;
    id v44 = v19;
    sub_22BF5A598();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v43, v5);
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v5);
  swift_beginAccess();
  sub_22BEFD334((uint64_t)v15, v42);
  swift_endAccess();
}

void sub_22BEFD13C()
{
}

id sub_22BEFD17C()
{
  return sub_22BEFD198(0, (uint64_t (*)(void))type metadata accessor for InstapaperLoginSession);
}

id sub_22BEFD198(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_22BEFD240()
{
  return type metadata accessor for InstapaperLoginSession(0);
}

uint64_t type metadata accessor for InstapaperLoginSession(uint64_t a1)
{
  return sub_22BEFD518(a1, (uint64_t *)&unk_268491470);
}

void sub_22BEFD268()
{
  sub_22BEFE1C8(319, &qword_268491488, &qword_268491490, MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_22BEFD334(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_22BEFD39C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v8 = (void *)sub_22BF5A458();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

uint64_t sub_22BEFD44C(uint64_t a1)
{
  return sub_22BEFC7F8(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

unint64_t sub_22BEFD454()
{
  unint64_t result = qword_2684914B0;
  if (!qword_2684914B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2684914B0);
  }
  return result;
}

uint64_t sub_22BEFD494()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22BEFD4D4()
{
  return sub_22BEFA5A4(v0[2], v0[3], v0[4]);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t type metadata accessor for InstapaperLoginView(uint64_t a1)
{
  return sub_22BEFD518(a1, (uint64_t *)&unk_2684914F0);
}

uint64_t sub_22BEFD518(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22BEFD54C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22BEFD594(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InstapaperLoginView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22BEFD5F0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22BEFD628(char a1, uint64_t a2)
{
  sub_22BF1F2B0(a1, a2, *(void *)(v2 + 16));
}

void *sub_22BEFD630(void *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *a1 = v5;
    a1 = (void *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v9 = a2[1];
    uint64_t v8 = a2[2];
    *a1 = v5;
    a1[1] = v9;
    uint64_t v10 = a2[3];
    uint64_t v11 = a2[4];
    a1[2] = v8;
    a1[3] = v10;
    uint64_t v12 = a2[5];
    uint64_t v13 = a2[6];
    a1[4] = v11;
    a1[5] = v12;
    uint64_t v14 = a2[7];
    uint64_t v15 = *(int *)(a3 + 28);
    __dst = (char *)a1 + v15;
    uint64_t v16 = (char *)a2 + v15;
    a1[6] = v13;
    a1[7] = v14;
    uint64_t v17 = sub_22BF59C28();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
      id v19 = __dst;
      memcpy(__dst, v16, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      id v19 = __dst;
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(__dst, v16, v17);
      __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v17);
    }
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
    *(void *)&v19[*(int *)(v20 + 28)] = *(void *)&v16[*(int *)(v20 + 28)];
    uint64_t v21 = *(int *)(a3 + 32);
    uint64_t v22 = (void *)((char *)a1 + v21);
    uint64_t v23 = (uint64_t *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_22BEFD804(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_22BF59C28();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  swift_release();
  return swift_bridgeObjectRelease();
}

void *sub_22BEFD8E4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v8 = a2[7];
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  a1[6] = a2[6];
  a1[7] = v8;
  uint64_t v12 = sub_22BF59C28();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  *(void *)&v10[*(int *)(v14 + 28)] = *(void *)&v11[*(int *)(v14 + 28)];
  uint64_t v15 = *(int *)(a3 + 32);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_22BEFDA60(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22BF59C28();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  *(void *)&v8[*(int *)(v15 + 28)] = *(void *)&v9[*(int *)(v15 + 28)];
  swift_retain();
  swift_release();
  uint64_t v16 = *(int *)(a3 + 32);
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22BEFDCA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = sub_22BF59C28();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  *(void *)&v8[*(int *)(v12 + 28)] = *(void *)&v9[*(int *)(v12 + 28)];
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_22BEFDDC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = sub_22BF59C28();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  int v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (!EnumTagSinglePayload)
  {
    uint64_t v14 = *(void *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
LABEL_7:
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  *(void *)&v9[*(int *)(v16 + 28)] = *(void *)&v10[*(int *)(v16 + 28)];
  swift_release();
  uint64_t v17 = *(int *)(a3 + 32);
  uint64_t v18 = (void *)(a1 + v17);
  id v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22BEFDFBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BEFDFD0);
}

uint64_t sub_22BEFDFD0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 28);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22BEFE05C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BEFE070);
}

void *sub_22BEFE070(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 28);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_22BEFE0F4()
{
  sub_22BEFE1C8(319, (unint64_t *)&qword_268491500, &qword_2684914D0, MEMORY[0x263F1B5D0]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22BEFE1C8(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_22BEFE228()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BEFE244(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InstapaperLoginView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BEFE2AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InstapaperLoginView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BEFE310()
{
  return sub_22BEFE5FC((uint64_t (*)(uint64_t))sub_22BEFACF0);
}

uint64_t objectdestroy_19Tm()
{
  uint64_t v1 = type metadata accessor for InstapaperLoginView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v6 = sub_22BF59C28();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_22BEFE48C()
{
  OUTLINED_FUNCTION_2_0();
  return (*(uint64_t (**)(void, void))(v0
                                                   + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))))(0, 0);
}

uint64_t sub_22BEFE4D4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_22BEF9BFC;
  return sub_22BEFBBE8();
}

void sub_22BEFE574(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6 = (id)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

uint64_t sub_22BEFE5E4()
{
  return sub_22BEFE5FC((uint64_t (*)(uint64_t))sub_22BEFB2E8);
}

uint64_t sub_22BEFE5FC(uint64_t (*a1)(uint64_t))
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

unint64_t sub_22BEFE660()
{
  unint64_t result = qword_2684915A0;
  if (!qword_2684915A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491588);
    sub_22BEF96F8((unint64_t *)&unk_268491800, &qword_268491580);
    sub_22BEF96F8((unint64_t *)&unk_2684915B0, (uint64_t *)&unk_268491820);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684915A0);
  }
  return result;
}

uint64_t sub_22BEFE724(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BEFE78C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22BEFE7F0()
{
  return sub_22BEF96F8(&qword_2684915C8, qword_2684915D0);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return type metadata accessor for InstapaperLoginView(0) - 8;
}

void sub_22BEFE880(uint64_t a1, uint64_t a2, void *a3, void (**a4)(void, void, void))
{
  uint64_t v6 = sub_22BF5A418();
  uint64_t v22 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22BF5A448();
  uint64_t v21 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a4;
  _Block_copy(a4);
  int v13 = (NSString *)sub_22BF5A4A8();
  Class v14 = NSClassFromString(v13);

  if (v14
    && (swift_getObjCClassMetadata(),
        sub_22BF00710(0, (unint64_t *)&qword_268491670),
        (uint64_t v15 = swift_dynamicCastMetatype()) != 0))
  {
    uint64_t v16 = v15;
    sub_22BF00710(0, (unint64_t *)&qword_2684914B0);
    uint64_t v17 = (void *)sub_22BF5A648();
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = v16;
    v18[3] = a3;
    v18[4] = sub_22BF006BC;
    v18[5] = v12;
    aBlock[4] = sub_22BF00704;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22BF1F2AC;
    aBlock[3] = &block_descriptor_32;
    id v19 = _Block_copy(aBlock);
    id v20 = a3;
    swift_retain();
    swift_release();
    sub_22BF5A438();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_22BF005E8((unint64_t *)&unk_268491700, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914C0);
    sub_22BF00630();
    sub_22BF5A6D8();
    MEMORY[0x230F588F0](0, v11, v8, v19);
    _Block_release(v19);

    (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v9);
    swift_release();
    _Block_release(a4);
  }
  else
  {
    a4[2](a4, 0, 0);
    swift_release();
    _Block_release(a4);
  }
}

void sub_22BEFEC4C(uint64_t a1, uint64_t a2, void (*a3)(void, void, void), void *a4)
{
  sub_22BF00710(0, &qword_268491678);
  uint64_t v7 = swift_dynamicCastMetatype();
  if (v7)
  {
    sub_22BEFEEF8(v7, a3, a4);
  }
  else
  {
    unint64_t v8 = (void *)swift_allocObject();
    v8[2] = a1;
    v8[3] = a3;
    v8[4] = a4;
    sub_22BF00790();
    swift_retain();
    sub_22BF5A678();
    swift_release();
  }
}

uint64_t sub_22BEFED2C(void *a1, uint64_t a2, void (*a3)(uint64_t, void *, void))
{
  uint64_t v4 = a1;
  if (a1)
  {
    objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_saveAccount_, a1);
    id v5 = objc_msgSend(v4, sel_accountID);
    uint64_t v6 = sub_22BF5A4C8();
    uint64_t v4 = v7;
  }
  else
  {
    uint64_t v6 = 0;
  }
  a3(v6, v4, 0);
  return swift_bridgeObjectRelease();
}

void sub_22BEFEE68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v6 = (void *)sub_22BF5A4A8();
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sub_22BF59AF8();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);
}

void sub_22BEFEEF8(uint64_t a1, void (*a2)(void, void, void), void *a3)
{
  uint64_t v65 = a2;
  id v66 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684917C0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22BF59B58();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v58 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v58 - v16;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v67 = objc_msgSend(ObjCClassFromMetadata, sel_sessionManager);
  id v19 = objc_msgSend(ObjCClassFromMetadata, sel_redirectURI);
  if (!v19)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v8);
    goto LABEL_8;
  }
  id v20 = v19;
  uint64_t v64 = v17;
  sub_22BF59B28();

  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v21(v7, v15, v8);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
LABEL_8:
    sub_22BF003D8((uint64_t)v7);
    v65(0, 0, 0);

    return;
  }
  v61 = v12;
  id v62 = v3;
  uint64_t v22 = v64;
  v21(v64, v7, v8);
  id v60 = objc_msgSend(self, sel_sharedManager);
  sub_22BF00710(0, &qword_268491650);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v15, v22, v8);
  id v59 = sub_22BEFF630((uint64_t)v15, 0, 0);
  id v23 = objc_msgSend(ObjCClassFromMetadata, sel_responseType);
  if (!v23)
  {
    sub_22BF5A4C8();
    id v23 = (id)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
  }
  uint64_t v24 = sub_22BF00438(ObjCClassFromMetadata);
  uint64_t v63 = v9;
  if (v24)
  {
    sub_22BEFF704(v24);
    swift_bridgeObjectRelease();
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = 0;
    sub_22BF00710(0, &qword_268491658);
    uint64_t v58 = sub_22BF5A558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = swift_allocObject();
    uint64_t v58 = 0;
    *(void *)(v25 + 16) = 0;
  }
  id v26 = v66;
  id v27 = (void *)sub_22BF59B18();
  uint64_t v28 = (void *)swift_allocObject();
  uint64_t v30 = v59;
  uint64_t v29 = v60;
  v28[2] = v25;
  v28[3] = v29;
  v28[4] = v30;
  v28[5] = a1;
  v28[6] = v65;
  v28[7] = v26;
  uint64_t v72 = sub_22BF00518;
  uint64_t v73 = v28;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v69 = 1107296256;
  uint64_t v70 = sub_22BEFFFA4;
  long long v71 = &block_descriptor_2;
  uint64_t v31 = _Block_copy(&aBlock);
  swift_retain();
  id v32 = v29;
  id v33 = v30;
  swift_retain();
  swift_release();
  id v66 = v23;
  id v34 = v23;
  id v35 = (void *)v58;
  id v36 = objc_msgSend(v67, sel_authorizationSessionWithResponseType_scopes_redirectURI_completionHandler_, v34, v58, v27, v31);
  _Block_release(v31);

  id v60 = (id)(v25 + 16);
  swift_beginAccess();
  uint64_t v37 = *(void **)(v25 + 16);
  *(void *)(v25 + 16) = v36;

  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v25;
  *(void *)(v38 + 24) = v32;
  uint64_t v72 = sub_22BF00580;
  uint64_t v73 = (void *)v38;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v69 = 1107296256;
  uint64_t v39 = (void (*)(void, void, void))v33;
  uint64_t v70 = sub_22BF002D4;
  long long v71 = &block_descriptor_10;
  id v40 = _Block_copy(&aBlock);
  swift_retain();
  id v41 = v32;
  swift_release();
  id v42 = objc_msgSend(v33, sel_action);
  if (!v42)
  {
    sub_22BF5A4C8();
    id v42 = (id)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
  }
  uint64_t v65 = v39;
  id v43 = objc_msgSend(v39, sel_URL, v58);
  id v44 = v61;
  sub_22BF59B28();

  sub_22BF59B38();
  uint64_t v46 = v45;
  uint64_t v47 = *(void (**)(char *, uint64_t))(v63 + 8);
  v47(v44, v8);
  if (v46)
  {
    uint64_t v48 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v48 = 0;
  }
  objc_msgSend(v41, sel_registerHandler_forIncomingRequestsWithAction_scheme_, v40, v42, v48);

  _Block_release(v40);
  id v49 = objc_msgSend(v62, sel_presentationAnchor);
  if (!v49)
  {
    uint64_t v56 = OUTLINED_FUNCTION_0_1();
    ((void (*)(uint64_t))v47)(v56);
    swift_release();

LABEL_21:
    return;
  }
  id v50 = v49;
  uint64_t v51 = (id *)v60;
  swift_beginAccess();
  if (*v51)
  {
    id v52 = objc_msgSend(*v51, sel_authenticationSessionWithPresentationAnchor_, v50);
    id v53 = v66;
    if (v52)
    {
      uint64_t v54 = v52;
      objc_msgSend(v52, sel_start);

      uint64_t v55 = OUTLINED_FUNCTION_0_1();
      ((void (*)(uint64_t))v47)(v55);
      swift_release();
      return;
    }
    uint64_t v57 = OUTLINED_FUNCTION_0_1();
    ((void (*)(uint64_t))v47)(v57);
    swift_release();

    goto LABEL_21;
  }
  __break(1u);
}

id sub_22BEFF630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)sub_22BF59B18();
  if (a3)
  {
    uint64_t v6 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_requestWithURL_fromSourceApplication_, v5, v6);

  uint64_t v8 = sub_22BF59B58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
  return v7;
}

uint64_t sub_22BEFF704(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    sub_22BF5A738();
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_22BF5A4A8();
      swift_bridgeObjectRelease();
      sub_22BF5A718();
      sub_22BF5A748();
      sub_22BF5A758();
      sub_22BF5A728();
      v4 += 16;
      --v2;
    }
    while (v2);
    return v5;
  }
  return result;
}

void sub_22BEFF7C8(void *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6, void (*a7)(void, void, void *), uint64_t a8)
{
  id v35 = a7;
  uint64_t v36 = a8;
  uint64_t v13 = sub_22BF59B58();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  swift_beginAccess();
  uint64_t v17 = *(void **)(a3 + 16);
  *(void *)(a3 + 16) = 0;

  id v18 = objc_msgSend(a5, sel_action);
  if (!v18)
  {
    sub_22BF5A4C8();
    id v18 = (id)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
  }
  id v19 = objc_msgSend(a5, sel_URL, v35);
  sub_22BF59B28();

  sub_22BF59B38();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if (v21)
  {
    uint64_t v22 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = 0;
  }
  objc_msgSend(a4, sel_removeHandlerForIncomingRequestsWithAction_scheme_, v18, v22);

  if (a1)
  {
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    id v24 = a1;
    id v25 = objc_msgSend(ObjCClassFromMetadata, sel_accountWithCredential_, v24);
    if (objc_msgSend(ObjCClassFromMetadata, sel_saveAccount_, v25))
    {
      id v26 = (void *)swift_allocObject();
      uint64_t v27 = v36;
      v26[2] = v35;
      v26[3] = v27;
      void v26[4] = v25;
      aBlock[4] = sub_22BF0058C;
      aBlock[5] = v26;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_22BEFFF38;
      aBlock[3] = &block_descriptor_17_0;
      uint64_t v28 = _Block_copy(aBlock);
      swift_retain();
      id v29 = v25;
      swift_release();
      objc_msgSend(v29, sel_refreshWithCompletionHandler_, v28);
      _Block_release(v28);
    }
    else
    {
    }
  }
  else if (a2)
  {
    _s3__C4CodeOMa_0(0);
    aBlock[0] = 1;
    id v30 = a2;
    sub_22BF005E8((unint64_t *)&unk_268491660, _s3__C4CodeOMa_0);
    uint64_t v31 = 0;
    if ((sub_22BF59A88() & 1) == 0)
    {
      type metadata accessor for Code(0);
      aBlock[0] = 106;
      id v32 = a2;
      sub_22BF005E8(&qword_268491028, type metadata accessor for Code);
      char v33 = sub_22BF59A88();

      uint64_t v31 = 0;
      if ((v33 & 1) == 0)
      {
        id v34 = a2;
        uint64_t v31 = a2;
      }
    }
    v35(0, 0, v31);
  }
}

uint64_t sub_22BEFFBE0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_22BF5A418();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_22BF5A448();
  uint64_t v11 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF00710(0, (unint64_t *)&qword_2684914B0);
  uint64_t v14 = (void *)sub_22BF5A648();
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a2;
  v15[3] = a3;
  v15[4] = a4;
  aBlock[4] = sub_22BF005DC;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22BF1F2AC;
  aBlock[3] = &block_descriptor_23;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  id v17 = a4;
  swift_release();
  sub_22BF5A438();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22BF005E8((unint64_t *)&unk_268491700, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914C0);
  sub_22BF00630();
  sub_22BF5A6D8();
  MEMORY[0x230F588F0](0, v13, v10, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v20);
}

uint64_t sub_22BEFFEB0(void (*a1)(uint64_t, uint64_t, void), int a2, id a3)
{
  id v4 = objc_msgSend(a3, sel_accountID);
  uint64_t v5 = sub_22BF5A4C8();
  uint64_t v7 = v6;

  a1(v5, v7, 0);
  return swift_bridgeObjectRelease();
}

void sub_22BEFFF38(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_22BEFFFA4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_22BF00030(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_22BF59B58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v24 - v11;
  swift_beginAccess();
  uint64_t v13 = *(void **)(a2 + 16);
  if (v13)
  {
    id v14 = v13;
    id v15 = objc_msgSend(a1, sel_URL);
    sub_22BF59B28();

    uint64_t v16 = (void *)sub_22BF59B18();
    id v17 = *(void (**)(char *, uint64_t))(v7 + 8);
    v17(v12, v6);
    unsigned int v18 = objc_msgSend(v14, sel_resumeSessionWithURL_, v16);

    if (v18)
    {
      id v19 = objc_msgSend(a1, sel_action);
      if (!v19)
      {
        sub_22BF5A4C8();
        id v19 = (id)sub_22BF5A4A8();
        swift_bridgeObjectRelease();
      }
      id v20 = objc_msgSend(a1, sel_URL);
      sub_22BF59B28();

      sub_22BF59B38();
      uint64_t v22 = v21;
      v17(v10, v6);
      if (v22)
      {
        uint64_t v23 = sub_22BF5A4A8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v23 = 0;
      }
      objc_msgSend(a3, sel_removeHandlerForIncomingRequestsWithAction_scheme_, v19, v23);

      id v14 = (id)v23;
    }
  }
}

id sub_22BF00270(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for WFAccountAccessResourceUserInterface();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithUserInterfaceType_attribution_, a1, a2);

  return v5;
}

void sub_22BF002D4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_22BF00380()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFAccountAccessResourceUserInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WFAccountAccessResourceUserInterface()
{
  return self;
}

uint64_t sub_22BF003D8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684917C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22BF00438(void *a1)
{
  id v1 = objc_msgSend(a1, sel_scopes);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_22BF5A568();

  return v3;
}

uint64_t sub_22BF00490()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22BF004C8()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_22BF00518(void *a1, void *a2)
{
  sub_22BEFF7C8(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32), *(void *)(v2 + 40), *(void (**)(void, void, void *))(v2 + 48), *(void *)(v2 + 56));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_22BF00540()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_22BF00580(void *a1)
{
  sub_22BF00030(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_22BF0058C(uint64_t a1)
{
  return sub_22BEFFBE0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t objectdestroy_13Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22BF005DC()
{
  return sub_22BEFFEB0(*(void (**)(uint64_t, uint64_t, void))(v0 + 16), *(void *)(v0 + 24), *(id *)(v0 + 32));
}

uint64_t sub_22BF005E8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_22BF00630()
{
  unint64_t result = qword_268491710;
  if (!qword_268491710)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2684914C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491710);
  }
  return result;
}

uint64_t sub_22BF00684()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22BF006BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22BEFEE68(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_22BF006C4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_22BF00704()
{
  sub_22BEFEC4C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(void, void, void))(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_22BF00710(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_22BF0074C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22BF00784(void *a1)
{
  return sub_22BEFED2C(a1, *(void *)(v1 + 16), *(void (**)(uint64_t, void *, void))(v1 + 24));
}

unint64_t sub_22BF00790()
{
  unint64_t result = qword_268491680[0];
  if (!qword_268491680[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268491680);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return *(void *)(v0 - 208);
}

uint64_t sub_22BF00810(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_22BF5A418();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_22BF5A448();
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  id v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BEFD454();
  uint64_t v16 = (void *)sub_22BF5A648();
  id v17 = (void *)swift_allocObject();
  v17[2] = v2;
  v17[3] = a1;
  v17[4] = a2;
  aBlock[4] = sub_22BF00F9C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22BF1F2AC;
  aBlock[3] = &block_descriptor_3;
  unsigned int v18 = _Block_copy(aBlock);
  id v19 = v2;
  swift_retain();
  swift_release();
  sub_22BF5A438();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22BF04BE0((unint64_t *)&unk_268491700, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914C0);
  sub_22BEF96F8((unint64_t *)&qword_268491710, (uint64_t *)&unk_2684914C0);
  sub_22BF5A6D8();
  MEMORY[0x230F588F0](0, v15, v10, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v22);
}

uint64_t sub_22BF00AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v29 - v9;
  uint64_t v11 = type metadata accessor for PinboardLoginView();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v13 = a2;
  *((void *)v13 + 1) = a3;
  LOBYTE(v30) = 0;
  swift_retain();
  sub_22BF5A2A8();
  uint64_t v14 = *((void *)&v32 + 1);
  v13[16] = v32;
  *((void *)v13 + 3) = v14;
  uint64_t v30 = 0;
  unint64_t v31 = 0xE000000000000000;
  sub_22BF5A2A8();
  uint64_t v15 = v33;
  *((_OWORD *)v13 + 2) = v32;
  *((void *)v13 + 6) = v15;
  uint64_t v30 = 0;
  unint64_t v31 = 0xE000000000000000;
  sub_22BF5A2A8();
  uint64_t v16 = v33;
  *(_OWORD *)(v13 + 56) = v32;
  *((void *)v13 + 9) = v16;
  uint64_t v30 = 0;
  unint64_t v31 = 0xE000000000000000;
  sub_22BF5A2A8();
  uint64_t v17 = v33;
  *((_OWORD *)v13 + 5) = v32;
  *((void *)v13 + 12) = v17;
  uint64_t v18 = sub_22BF59C28();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v18);
  sub_22BF04EE4((uint64_t)v10, (uint64_t)v8, &qword_2684914D0);
  sub_22BF5A2A8();
  sub_22BF04F40((uint64_t)v10, &qword_2684914D0);
  uint64_t v19 = *(int *)(v11 + 40);
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v20 = (uint64_t *)&v13[v19];
  id v21 = (id)qword_2684922C8;
  uint64_t v22 = (void *)sub_22BF5A4A8();
  uint64_t v23 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v24 = objc_msgSend(v21, sel_localizedStringForKey_value_table_, v22, v23, 0);

  uint64_t v25 = sub_22BF5A4C8();
  uint64_t v27 = v26;

  *id v20 = v25;
  v20[1] = v27;
  sub_22BF04BE0(&qword_268491720, (void (*)(uint64_t))type metadata accessor for PinboardLoginView);
  sub_22BF5A678();
  return sub_22BF03A68((uint64_t)v13);
}

id sub_22BF00E5C(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for WFPinboardAccessResourceUserInterface();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithUserInterfaceType_attribution_, a1, a2);

  return v5;
}

id sub_22BF00F04()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFPinboardAccessResourceUserInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WFPinboardAccessResourceUserInterface()
{
  return self;
}

uint64_t sub_22BF00F5C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22BF00F9C()
{
  return sub_22BF00AA4(v0[2], v0[3], v0[4]);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t type metadata accessor for PinboardLoginView()
{
  uint64_t result = qword_268491728;
  if (!qword_268491728) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22BF01008@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for PinboardLoginView();
  uint64_t v41 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v41 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v4 - 8);
  objc_super v7 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v41 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v41 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v41 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v41 - v18;
  id v20 = (uint64_t *)(v1 + *(int *)(v17 + 48));
  uint64_t v21 = v20[1];
  uint64_t v42 = *v20;
  uint64_t v43 = v21;
  uint64_t v22 = *(void *)(v1 + 24);
  LOBYTE(v44) = *(unsigned char *)(v1 + 16);
  *((void *)&v44 + 1) = v22;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491740);
  sub_22BF5A2B8();
  if (v46 == 1)
  {
    uint64_t v23 = *(void *)(v1 + 96);
    long long v44 = *(_OWORD *)(v1 + 80);
    uint64_t v45 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
    sub_22BF5A2B8();
    long long v24 = v46;
    swift_bridgeObjectRelease();
    if ((*((void *)&v24 + 1) & 0x2000000000000000) != 0) {
      uint64_t v25 = HIBYTE(*((void *)&v24 + 1)) & 0xFLL;
    }
    else {
      uint64_t v25 = v24 & 0xFFFFFFFFFFFFLL;
    }
    sub_22BF04834(v2, (uint64_t)v19);
    if (v25)
    {
      uint64_t v26 = *((void *)v19 + 12);
      long long v44 = *((_OWORD *)v19 + 5);
      uint64_t v45 = v26;
      sub_22BF5A2B8();
      long long v44 = v46;
      *(void *)&long long v46 = 58;
      *((void *)&v46 + 1) = 0xE100000000000000;
      sub_22BEF934C();
      LOBYTE(v25) = sub_22BF5A6B8();
      swift_bridgeObjectRelease();
    }
    uint64_t v27 = (uint64_t)v19;
  }
  else
  {
    uint64_t v28 = *(void *)(v1 + 48);
    long long v44 = *(_OWORD *)(v1 + 32);
    uint64_t v45 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
    sub_22BF5A2B8();
    long long v29 = v46;
    swift_bridgeObjectRelease();
    if ((*((void *)&v29 + 1) & 0x2000000000000000) != 0) {
      uint64_t v25 = HIBYTE(*((void *)&v29 + 1)) & 0xFLL;
    }
    else {
      uint64_t v25 = v29 & 0xFFFFFFFFFFFFLL;
    }
    sub_22BF04834(v2, (uint64_t)v16);
    if (v25)
    {
      uint64_t v30 = *((void *)v16 + 9);
      long long v44 = *(_OWORD *)(v16 + 56);
      uint64_t v45 = v30;
      sub_22BF5A2B8();
      long long v31 = v46;
      swift_bridgeObjectRelease();
      uint64_t v32 = HIBYTE(*((void *)&v31 + 1)) & 0xFLL;
      if ((*((void *)&v31 + 1) & 0x2000000000000000) == 0) {
        uint64_t v32 = v31 & 0xFFFFFFFFFFFFLL;
      }
      LOBYTE(v25) = v32 != 0;
    }
    uint64_t v27 = (uint64_t)v16;
  }
  sub_22BF03A68(v27);
  sub_22BF04834(v2, (uint64_t)v13);
  unint64_t v33 = (*(unsigned __int8 *)(v41 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v34 = swift_allocObject();
  sub_22BF0489C((uint64_t)v13, v34 + v33);
  sub_22BF04834(v2, (uint64_t)v10);
  uint64_t v35 = swift_allocObject();
  sub_22BF0489C((uint64_t)v10, v35 + v33);
  sub_22BF04834(v2, (uint64_t)v7);
  uint64_t v36 = swift_allocObject();
  sub_22BF0489C((uint64_t)v7, v36 + v33);
  LOBYTE(v46) = 0;
  uint64_t result = sub_22BF5A2A8();
  char v38 = v44;
  uint64_t v39 = *((void *)&v44 + 1);
  uint64_t v40 = v43;
  *(void *)a1 = v42;
  *(void *)(a1 + 8) = v40;
  *(unsigned char *)(a1 + 16) = v25 & 1;
  *(unsigned char *)(a1 + 17) = 0;
  *(void *)(a1 + 24) = sub_22BF04900;
  *(void *)(a1 + 32) = v34;
  *(void *)(a1 + 40) = sub_22BF0491C;
  *(void *)(a1 + 48) = v35;
  *(void *)(a1 + 56) = &unk_268491758;
  *(void *)(a1 + 64) = v36;
  *(unsigned char *)(a1 + 72) = v38;
  *(void *)(a1 + 80) = v39;
  return result;
}

uint64_t sub_22BF0140C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491530);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491788);
  MEMORY[0x270FA5388](v5);
  objc_super v7 = (uint64_t *)((char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22BF015B4(a1, v7);
  type metadata accessor for PinboardLoginView();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  sub_22BF5A2D8();
  sub_22BF59C28();
  sub_22BF04B48();
  sub_22BF04BE0(&qword_268491568, MEMORY[0x263F87748]);
  sub_22BF5A1C8();
  sub_22BF04F40((uint64_t)v4, (uint64_t *)&unk_268491530);
  return sub_22BF04F40((uint64_t)v7, &qword_268491788);
}

uint64_t sub_22BF015B4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684917B0);
  uint64_t v4 = MEMORY[0x270FA5388](v99);
  uint64_t v6 = (uint64_t *)((char *)&v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v4);
  uint64_t v86 = (uint64_t)&v83 - v7;
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684917B8);
  MEMORY[0x270FA5388](v97);
  uint64_t v98 = (uint64_t)&v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684917C0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v83 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491540);
  uint64_t v90 = *(void *)(v15 - 8);
  uint64_t v91 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  v85 = (char *)&v83 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v84 = (char *)&v83 - v18;
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684917D0);
  uint64_t v19 = MEMORY[0x270FA5388](v94);
  uint64_t v21 = (char *)&v83 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v83 - v22;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684917D8);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  uint64_t v96 = (uint64_t)&v83 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  v95 = (char *)&v83 - v27;
  uint64_t v28 = type metadata accessor for PinboardLoginView();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(void *)(v29 + 64);
  MEMORY[0x270FA5388](v28 - 8);
  long long v31 = (char *)&v83 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF04834(a1, (uint64_t)v31);
  uint64_t v32 = *(unsigned __int8 *)(v29 + 80);
  uint64_t v33 = (v32 + 16) & ~v32;
  uint64_t v87 = v32 | 7;
  uint64_t v88 = v33 + v30;
  uint64_t v34 = swift_allocObject();
  uint64_t v89 = v33;
  sub_22BF0489C((uint64_t)v31, v34 + v33);
  char v35 = *(unsigned char *)(a1 + 16);
  uint64_t v92 = a1;
  uint64_t v36 = *(void *)(a1 + 24);
  LOBYTE(v101) = v35;
  uint64_t v102 = v36;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491740);
  sub_22BF5A2B8();
  v100 = a2;
  uint64_t v93 = v34;
  if (v103 == 1)
  {
    sub_22BF5A4E8();
    if (qword_268490F80 != -1) {
      swift_once();
    }
    id v37 = (id)qword_2684922C8;
    char v38 = (void *)sub_22BF5A4A8();
    uint64_t v39 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    id v40 = objc_msgSend(v37, sel_localizedStringForKey_value_table_, v38, v39, 0);

    uint64_t v86 = sub_22BF5A4C8();
    uint64_t v42 = v41;

    sub_22BF5A4E8();
    id v43 = (id)qword_2684922C8;
    long long v44 = (void *)sub_22BF5A4A8();
    uint64_t v45 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    id v46 = objc_msgSend(v43, sel_localizedStringForKey_value_table_, v44, v45, 0);

    uint64_t v47 = sub_22BF5A4C8();
    uint64_t v49 = v48;

    uint64_t v101 = v47;
    uint64_t v102 = v49;
    sub_22BF59B48();
    uint64_t v50 = sub_22BF59B58();
    uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v50);
    if (result != 1)
    {
      sub_22BEF934C();
      id v52 = v84;
      sub_22BF5A0B8();
      sub_22BF04834(v92, (uint64_t)v31);
      uint64_t v53 = swift_allocObject();
      sub_22BF0489C((uint64_t)v31, v53 + v89);
      *(void *)uint64_t v21 = v86;
      *((void *)v21 + 1) = v42;
      uint64_t v54 = v94;
      (*(void (**)(char *, char *, uint64_t))(v90 + 32))(&v21[*(int *)(v94 + 52)], v52, v91);
      uint64_t v55 = (uint64_t (**)())&v21[*(int *)(v54 + 56)];
      *uint64_t v55 = sub_22BF04DDC;
      v55[1] = (uint64_t (*)())v53;
      uint64_t v56 = &qword_2684917D0;
      sub_22BF04E88((uint64_t)v21, (uint64_t)v23, &qword_2684917D0);
      sub_22BF04EE4((uint64_t)v23, v98, &qword_2684917D0);
      swift_storeEnumTagMultiPayload();
      sub_22BEF96F8((unint64_t *)&unk_2684917E0, &qword_2684917D0);
      sub_22BEF96F8(&qword_268491560, &qword_2684917B0);
      uint64_t v57 = (uint64_t)v95;
      sub_22BF59F98();
      uint64_t v58 = (uint64_t)v23;
LABEL_10:
      sub_22BF04F40(v58, v56);
      uint64_t v79 = v100;
      uint64_t v80 = v96;
      uint64_t v81 = v93;
      sub_22BF04EE4(v57, v96, &qword_2684917D8);
      *uint64_t v79 = 0;
      v79[1] = 0;
      v79[2] = sub_22BF04C2C;
      v79[3] = v81;
      uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684917F0);
      sub_22BF04EE4(v80, (uint64_t)v79 + *(int *)(v82 + 48), &qword_2684917D8);
      swift_retain();
      sub_22BF04F40(v57, &qword_2684917D8);
      sub_22BF04F40(v80, &qword_2684917D8);
      swift_release();
      return swift_bridgeObjectRelease();
    }
    __break(1u);
  }
  else
  {
    sub_22BF5A4E8();
    if (qword_268490F80 != -1) {
      swift_once();
    }
    id v59 = (id)qword_2684922C8;
    id v60 = (void *)sub_22BF5A4A8();
    v61 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    id v62 = objc_msgSend(v59, sel_localizedStringForKey_value_table_, v60, v61, 0);

    uint64_t v63 = sub_22BF5A4C8();
    uint64_t v65 = v64;

    sub_22BF5A4E8();
    id v66 = (id)qword_2684922C8;
    id v67 = (void *)sub_22BF5A4A8();
    uint64_t v68 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    id v69 = objc_msgSend(v66, sel_localizedStringForKey_value_table_, v67, v68, 0);

    uint64_t v70 = sub_22BF5A4C8();
    uint64_t v72 = v71;

    uint64_t v101 = v70;
    uint64_t v102 = v72;
    sub_22BF59B48();
    uint64_t v73 = sub_22BF59B58();
    uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v73);
    if (result != 1)
    {
      sub_22BEF934C();
      uint64_t v74 = v85;
      sub_22BF5A0B8();
      sub_22BF04834(v92, (uint64_t)v31);
      uint64_t v75 = swift_allocObject();
      sub_22BF0489C((uint64_t)v31, v75 + v89);
      *uint64_t v6 = v63;
      v6[1] = v65;
      uint64_t v76 = v99;
      (*(void (**)(char *, char *, uint64_t))(v90 + 32))((char *)v6 + *(int *)(v99 + 52), v74, v91);
      v77 = (uint64_t (**)())((char *)v6 + *(int *)(v76 + 56));
      char *v77 = sub_22BF04C48;
      v77[1] = (uint64_t (*)())v75;
      uint64_t v56 = &qword_2684917B0;
      uint64_t v78 = v86;
      sub_22BF04E88((uint64_t)v6, v86, &qword_2684917B0);
      sub_22BF04EE4(v78, v98, &qword_2684917B0);
      swift_storeEnumTagMultiPayload();
      sub_22BEF96F8((unint64_t *)&unk_2684917E0, &qword_2684917D0);
      sub_22BEF96F8(&qword_268491560, &qword_2684917B0);
      uint64_t v57 = (uint64_t)v95;
      sub_22BF59F98();
      uint64_t v58 = v78;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_22BF01FFC()
{
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v0 = (id)qword_2684922C8;
  uint64_t v1 = (void *)sub_22BF5A4A8();
  uint64_t v2 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, v2, 0);

  sub_22BF5A4C8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491740);
  sub_22BF5A2D8();
  sub_22BEF934C();
  return sub_22BF5A328();
}

uint64_t sub_22BF0215C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491580);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v6 = (id)qword_2684922C8;
  uint64_t v7 = (void *)sub_22BF5A4A8();
  uint64_t v8 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v6, sel_localizedStringForKey_value_table_, v7, v8, 0);

  uint64_t v10 = sub_22BF5A4C8();
  uint64_t v12 = v11;

  uint64_t v13 = *(void *)(a1 + 96);
  *(_OWORD *)&v15[8] = *(_OWORD *)(a1 + 80);
  uint64_t v16 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
  sub_22BF5A2D8();
  uint64_t v17 = v10;
  uint64_t v18 = v12;
  sub_22BEF934C();
  sub_22BF5A408();
  sub_22BEF96F8((unint64_t *)&unk_268491800, &qword_268491580);
  sub_22BF5A198();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_22BF023DC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v76 = a2;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491570);
  uint64_t v72 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  uint64_t v71 = (char *)v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491810);
  uint64_t v4 = MEMORY[0x270FA5388](v70);
  uint64_t v75 = (char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v73 = (uint64_t)v62 - v6;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491580);
  uint64_t v7 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  id v9 = (char *)v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491588);
  MEMORY[0x270FA5388](v63);
  uint64_t v11 = (char *)v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491590);
  uint64_t v64 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v13 = (char *)v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491598);
  uint64_t v68 = *(void *)(v14 - 8);
  uint64_t v69 = v14;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  id v67 = (char *)v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v77 = (char *)v62 - v17;
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v18 = (id)qword_2684922C8;
  uint64_t v19 = (void *)sub_22BF5A4A8();
  uint64_t v20 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v21 = objc_msgSend(v18, sel_localizedStringForKey_value_table_, v19, v20, 0);

  uint64_t v22 = sub_22BF5A4C8();
  unint64_t v24 = v23;

  uint64_t v25 = *(void *)(a1 + 48);
  long long v78 = *(_OWORD *)(a1 + 32);
  uint64_t v79 = v25;
  v62[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
  sub_22BF5A2D8();
  v62[0] = a1;
  uint64_t v80 = v22;
  unint64_t v81 = v24;
  v62[1] = sub_22BEF934C();
  sub_22BF5A408();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v27 = sub_22BF5A4C8();
  uint64_t v29 = v28;
  uint64_t v30 = v65;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v9, v65);
  uint64_t v31 = v63;
  uint64_t v32 = (uint64_t *)&v11[*(int *)(v63 + 36)];
  *uint64_t v32 = KeyPath;
  v32[1] = v27;
  v32[2] = v29;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v30);
  unint64_t v33 = sub_22BEFE660();
  sub_22BF5A148();
  sub_22BF04F40((uint64_t)v11, &qword_268491588);
  uint64_t v80 = v31;
  unint64_t v81 = v33;
  swift_getOpaqueTypeConformance2();
  uint64_t v34 = v66;
  char v35 = v67;
  sub_22BF5A198();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v13, v34);
  uint64_t v37 = v68;
  uint64_t v36 = v69;
  (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v77, v35, v69);
  sub_22BF5A4E8();
  id v38 = (id)qword_2684922C8;
  uint64_t v39 = (void *)sub_22BF5A4A8();
  id v40 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v41 = objc_msgSend(v38, sel_localizedStringForKey_value_table_, v39, v40, 0);

  uint64_t v42 = sub_22BF5A4C8();
  unint64_t v44 = v43;

  uint64_t v45 = *(void *)(v62[0] + 72);
  long long v78 = *(_OWORD *)(v62[0] + 56);
  uint64_t v79 = v45;
  sub_22BF5A2D8();
  uint64_t v80 = v42;
  unint64_t v81 = v44;
  id v46 = v71;
  sub_22BF59C88();
  uint64_t v47 = swift_getKeyPath();
  uint64_t v48 = sub_22BF5A4C8();
  uint64_t v50 = v49;
  uint64_t v51 = v72;
  uint64_t v52 = v74;
  uint64_t v53 = (uint64_t)v75;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v75, v46, v74);
  uint64_t v54 = (uint64_t *)(v53 + *(int *)(v70 + 36));
  *uint64_t v54 = v47;
  v54[1] = v48;
  v54[2] = v50;
  (*(void (**)(char *, uint64_t))(v51 + 8))(v46, v52);
  uint64_t v55 = v73;
  sub_22BF04E88(v53, v73, (uint64_t *)&unk_268491810);
  uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
  uint64_t v57 = v77;
  v56(v35, v77, v36);
  sub_22BF04EE4(v55, v53, (uint64_t *)&unk_268491810);
  uint64_t v58 = v76;
  v56(v76, v35, v36);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684915C0);
  sub_22BF04EE4(v53, (uint64_t)&v58[*(int *)(v59 + 48)], (uint64_t *)&unk_268491810);
  sub_22BF04F40(v55, (uint64_t *)&unk_268491810);
  id v60 = *(void (**)(char *, uint64_t))(v37 + 8);
  v60(v57, v36);
  sub_22BF04F40(v53, (uint64_t *)&unk_268491810);
  return ((uint64_t (*)(char *, uint64_t))v60)(v35, v36);
}

uint64_t sub_22BF02C14(uint64_t a1)
{
  uint64_t v2 = sub_22BF59C28();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_22BF5A218();
}

uint64_t sub_22BF02CE0()
{
  v0[2] = sub_22BF5A5C8();
  v0[3] = sub_22BF5A5B8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_22BF02D8C;
  return sub_22BF02EA0();
}

uint64_t sub_22BF02D8C()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  swift_task_dealloc();
  uint64_t v1 = sub_22BF5A588();
  return MEMORY[0x270FA2498](sub_22BEFBDA0, v1, v0);
}

uint64_t sub_22BF02EA0()
{
  v1[68] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
  v1[69] = swift_task_alloc();
  v1[70] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491770);
  v1[71] = swift_task_alloc();
  sub_22BF5A5C8();
  v1[72] = sub_22BF5A5B8();
  uint64_t v3 = sub_22BF5A588();
  v1[73] = v3;
  v1[74] = v2;
  return MEMORY[0x270FA2498](sub_22BF02FAC, v3, v2);
}

uint64_t sub_22BF02FAC()
{
  uint64_t v1 = *(void *)(v0 + 544);
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F23238]), sel_init);
  *(void *)(v0 + 600) = v2;
  char v3 = *(unsigned char *)(v1 + 16);
  *(unsigned char *)(v0 + 634) = v3;
  uint64_t v4 = *(void *)(v1 + 24);
  *(void *)(v0 + 608) = v4;
  *(unsigned char *)(v0 + 464) = v3;
  *(void *)(v0 + 472) = v4;
  *(void *)(v0 + 616) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491740);
  sub_22BF5A2B8();
  if (*(unsigned char *)(v0 + 633) == 1)
  {
    uint64_t v5 = *(void *)(v0 + 544);
    long long v6 = *(_OWORD *)(v5 + 80);
    uint64_t v7 = *(void *)(v5 + 96);
    *(_OWORD *)(v0 + 120) = v6;
    uint64_t v8 = (uint64_t *)(v0 + 432);
    *(void *)(v0 + 136) = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
    sub_22BF5A2B8();
    id v9 = &selRef_setApiToken_;
    uint64_t v10 = 440;
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 544);
    uint64_t v12 = *(void *)(v11 + 48);
    *(_OWORD *)(v0 + 144) = *(_OWORD *)(v11 + 32);
    *(void *)(v0 + 160) = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
    sub_22BF5A2B8();
    sub_22BEFE574(*(void *)(v0 + 368), *(void *)(v0 + 376), v2, (SEL *)&selRef_setUsername_);
    uint64_t v13 = *(void *)(v11 + 72);
    *(_OWORD *)(v0 + 192) = *(_OWORD *)(v11 + 56);
    uint64_t v8 = (uint64_t *)(v0 + 528);
    *(void *)(v0 + 208) = v13;
    sub_22BF5A2B8();
    id v9 = &selRef_setPassword_;
    uint64_t v10 = 536;
  }
  sub_22BEFE574(*v8, *(void *)(v0 + v10), v2, (SEL *)v9);
  uint64_t v14 = *(void *)(v0 + 568);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v14;
  *(void *)(v0 + 24) = sub_22BF031DC;
  uint64_t v15 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_22BF0385C;
  *(void *)(v0 + 104) = &block_descriptor_17;
  *(void *)(v0 + 112) = v15;
  objc_msgSend(v2, sel_getModifiedDateWithCompletion_, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_22BF031DC()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = v0[6];
  *(void *)(v2 + 624) = v1;
  uint64_t v3 = v0[74];
  uint64_t v4 = v0[73];
  if (v1) {
    uint64_t v5 = sub_22BF03728;
  }
  else {
    uint64_t v5 = sub_22BF032E4;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_22BF032E4()
{
  uint64_t v1 = *(void *)(v0 + 608);
  char v2 = *(unsigned char *)(v0 + 634);
  uint64_t v3 = *(void *)(v0 + 568);
  swift_release();
  sub_22BF04F40(v3, &qword_268491770);
  *(unsigned char *)(v0 + 400) = v2;
  *(void *)(v0 + 408) = v1;
  sub_22BF5A2B8();
  if (*(unsigned char *)(v0 + 632) != 1)
  {
    uint64_t v18 = *(void *)(v0 + 544);
    id v19 = objc_msgSend(self, sel_workflowUserDefaults);
    uint64_t v20 = *(void *)(v18 + 32);
    uint64_t v21 = *(void *)(v18 + 40);
    uint64_t v22 = *(void *)(v18 + 48);
    *(void *)(v0 + 312) = v20;
    *(void *)(v0 + 320) = v21;
    *(void *)(v0 + 328) = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
    sub_22BF5A2B8();
    unint64_t v23 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_setObject_forKey_, v23, *MEMORY[0x263F232C0]);

    *(void *)(v0 + 240) = v20;
    *(void *)(v0 + 248) = v21;
    *(void *)(v0 + 256) = v22;
    sub_22BF5A2B8();
    unint64_t v24 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    uint64_t v25 = (void *)OUTLINED_FUNCTION_6();
    WFPinboardStoreSecretForUsername();

    *(void *)(v0 + 288) = v20;
    *(void *)(v0 + 296) = v21;
    *(void *)(v0 + 304) = v22;
    sub_22BF5A2B8();
    uint64_t v26 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    uint64_t v27 = *(void *)(v18 + 72);
    *(_OWORD *)(v0 + 264) = *(_OWORD *)(v18 + 56);
    *(void *)(v0 + 280) = v27;
    sub_22BF5A2B8();
    uint64_t v16 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    uint64_t v17 = (void *)OUTLINED_FUNCTION_5_0();
    WFPinboardStoreSecretForUsername();

    goto LABEL_5;
  }
  uint64_t v4 = *(void **)(v0 + 544);
  uint64_t v5 = v4[10];
  uint64_t v6 = v4[11];
  uint64_t v7 = v4[12];
  *(void *)(v0 + 216) = v5;
  *(void *)(v0 + 224) = v6;
  *(void *)(v0 + 232) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
  sub_22BF5A2B8();
  uint64_t v8 = *(void *)(v0 + 456);
  *(void *)(v0 + 480) = *(void *)(v0 + 448);
  *(void *)(v0 + 488) = v8;
  *(void *)(v0 + 496) = 58;
  *(void *)(v0 + 504) = 0xE100000000000000;
  sub_22BEF934C();
  uint64_t v9 = sub_22BF5A6A8();
  swift_bridgeObjectRelease();
  if (*(void *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v10 = objc_msgSend(self, sel_workflowUserDefaults);
    uint64_t v11 = v7;
    uint64_t v12 = (void *)sub_22BF5A4A8();
    objc_msgSend(v10, sel_setObject_forKey_, v12, *MEMORY[0x263F232C0]);

    uint64_t v13 = (void *)sub_22BF5A4A8();
    *(void *)(v0 + 168) = v5;
    *(void *)(v0 + 176) = v6;
    *(void *)(v0 + 184) = v11;
    sub_22BF5A2B8();
    uint64_t v14 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    uint64_t v15 = (void *)OUTLINED_FUNCTION_6();
    WFPinboardStoreSecretForUsername();

    uint64_t v16 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    uint64_t v17 = (void *)OUTLINED_FUNCTION_5_0();
    WFPinboardStoreSecretForUsername();
LABEL_5:
    uint64_t v28 = *(void **)(v0 + 600);
    uint64_t v29 = *(void (***)(uint64_t, void))(v0 + 544);

    (*v29)(1, 0);
    goto LABEL_7;
  }
  uint64_t v28 = *(void **)(v0 + 600);
  swift_bridgeObjectRelease();
LABEL_7:

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v30();
}

uint64_t sub_22BF03728()
{
  uint64_t v1 = (void *)v0[78];
  char v2 = (void *)v0[75];
  uint64_t v3 = v0[70];
  uint64_t v4 = v0[69];
  swift_release();
  swift_willThrow();

  sub_22BF59AF8();
  sub_22BF59C38();
  uint64_t v5 = sub_22BF59C28();
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v5);
  type metadata accessor for PinboardLoginView();
  sub_22BF04EE4(v3, v4, &qword_2684914D0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  sub_22BF5A2C8();

  sub_22BF04F40(v3, &qword_2684914D0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v6();
}

uint64_t sub_22BF0385C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491770);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v16 - v10;
  uint64_t v12 = *(void *)(a1 + 32);
  if (a3) {
    return sub_22BF03980(v12, (uint64_t)a3);
  }
  if (a2)
  {
    sub_22BF59B68();
    uint64_t v14 = sub_22BF59B78();
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v14 = sub_22BF59B78();
    uint64_t v15 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v9, v15, 1, v14);
  sub_22BF04E88((uint64_t)v9, (uint64_t)v11, &qword_268491770);
  return sub_22BF039E4(v12, (uint64_t)v11);
}

uint64_t sub_22BF03980(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491778);
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = a2;
  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_22BF039E4(uint64_t a1, uint64_t a2)
{
  sub_22BF04E88(a2, *(void *)(*(void *)(a1 + 64) + 40), &qword_268491770);
  return MEMORY[0x270FA2408](a1);
}

uint64_t sub_22BF03A44(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return MEMORY[0x270FA2408]();
}

uint64_t sub_22BF03A68(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PinboardLoginView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22BF03AC4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22BF03AFC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *(void *)a1 = v5;
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v8;
    uint64_t v9 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v9;
    uint64_t v10 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v10;
    uint64_t v11 = a2[10];
    *(void *)(a1 + 72) = a2[9];
    *(void *)(a1 + 80) = v11;
    uint64_t v12 = a2[12];
    uint64_t v13 = *(int *)(a3 + 36);
    __dst = (char *)(a1 + v13);
    unint64_t v23 = (char *)a2 + v13;
    *(void *)(a1 + 88) = a2[11];
    *(void *)(a1 + 96) = v12;
    uint64_t v22 = sub_22BF59C28();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v23, 1, v22))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
      uint64_t v15 = __dst;
      memcpy(__dst, v23, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      uint64_t v15 = __dst;
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(__dst, v23, v22);
      __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v22);
    }
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
    *(void *)&v15[*(int *)(v16 + 28)] = *(void *)&v23[*(int *)(v16 + 28)];
    uint64_t v17 = *(int *)(a3 + 40);
    uint64_t v18 = (void *)(a1 + v17);
    id v19 = (uint64_t *)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_22BF03D0C(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_22BF59C28();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BF03E04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v9;
  uint64_t v10 = *(void *)(a2 + 96);
  uint64_t v11 = *(int *)(a3 + 36);
  __dst = (char *)(a1 + v11);
  uint64_t v21 = (char *)(a2 + v11);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v10;
  uint64_t v20 = sub_22BF59C28();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v20))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
    uint64_t v13 = __dst;
    memcpy(__dst, v21, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = __dst;
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(__dst, v21, v20);
    __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v20);
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  *(void *)&v13[*(int *)(v14 + 28)] = *(void *)&v21[*(int *)(v14 + 28)];
  uint64_t v15 = *(int *)(a3 + 40);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22BF03FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = sub_22BF59C28();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  *(void *)&v8[*(int *)(v15 + 28)] = *(void *)&v9[*(int *)(v15 + 28)];
  swift_retain();
  swift_release();
  uint64_t v16 = *(int *)(a3 + 40);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22BF04260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  uint64_t v10 = sub_22BF59C28();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  *(void *)&v8[*(int *)(v12 + 28)] = *(void *)&v9[*(int *)(v12 + 28)];
  *(_OWORD *)(a1 + *(int *)(a3 + 40)) = *(_OWORD *)(a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t sub_22BF0439C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_release();
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = sub_22BF59C28();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (!EnumTagSinglePayload)
  {
    uint64_t v15 = *(void *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
LABEL_7:
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  *(void *)&v10[*(int *)(v17 + 28)] = *(void *)&v11[*(int *)(v17 + 28)];
  swift_release();
  uint64_t v18 = *(int *)(a3 + 40);
  id v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *id v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22BF045C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BF045DC);
}

uint64_t sub_22BF045DC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 36);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22BF04668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BF0467C);
}

void *sub_22BF0467C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 36);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_22BF04700()
{
  sub_22BF047BC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22BF047BC()
{
  if (!qword_268491500)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684914D0);
    unint64_t v0 = sub_22BF5A2E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268491500);
    }
  }
}

uint64_t sub_22BF04818()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BF04834(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PinboardLoginView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF0489C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PinboardLoginView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF04900()
{
  return sub_22BF04DF4(sub_22BF0140C);
}

uint64_t sub_22BF0491C()
{
  uint64_t v1 = type metadata accessor for PinboardLoginView();
  OUTLINED_FUNCTION_1_0(v1);
  return (*(uint64_t (**)(void, void))(v0
                                                   + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))))(0, 0);
}

uint64_t sub_22BF0496C()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = type metadata accessor for PinboardLoginView();
  OUTLINED_FUNCTION_1_0(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_22BF04A14;
  return sub_22BF02CE0();
}

uint64_t sub_22BF04A14()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v0();
}

uint64_t sub_22BF04ADC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22BF59DB8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22BF04B08()
{
  return sub_22BF59DC8();
}

unint64_t sub_22BF04B48()
{
  unint64_t result = qword_268491790;
  if (!qword_268491790)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491788);
    sub_22BEF96F8(&qword_268491798, (uint64_t *)&unk_2684917A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491790);
  }
  return result;
}

uint64_t sub_22BF04BE0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22BF04C2C()
{
  return sub_22BF04DF4((uint64_t (*)(uint64_t))sub_22BF01FFC);
}

uint64_t sub_22BF04C48()
{
  return sub_22BF04DF4((uint64_t (*)(uint64_t))sub_22BF023DC);
}

uint64_t objectdestroy_7Tm()
{
  uint64_t v1 = type metadata accessor for PinboardLoginView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 36);
  uint64_t v6 = sub_22BF59C28();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_22BF04DDC()
{
  return sub_22BF04DF4(sub_22BF0215C);
}

uint64_t sub_22BF04DF4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for PinboardLoginView();
  OUTLINED_FUNCTION_1_0(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return a1(v4);
}

uint64_t sub_22BF04E58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22BF59DB8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22BF04E88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_3_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_22BF04EE4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_3_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_22BF04F40(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_3_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_22BF04F94()
{
  return sub_22BEF96F8(&qword_268491830, (uint64_t *)&unk_268491838);
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_22BF5A4A8();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_22BF5A4A8();
}

void sub_22BF05038(void *a1, void (**a2)(void, void, void))
{
  uint64_t v4 = sub_22BF5A418();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22BF5A448();
  uint64_t v22 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  uint64_t v12 = self;
  _Block_copy(a2);
  id v13 = objc_msgSend(v12, sel_evernoteSession);
  if (objc_msgSend(v13, sel_isAuthenticated))
  {
    a2[2](a2, 1, 0);
    swift_release();

    _Block_release(a2);
  }
  else
  {
    objc_msgSend(v13, sel_setAuthenticator_, 0);
    sub_22BEFD454();
    uint64_t v21 = sub_22BF5A648();
    int v14 = (void *)swift_allocObject();
    v14[2] = a1;
    v14[3] = v13;
    v14[4] = sub_22BEFD628;
    v14[5] = v11;
    aBlock[4] = sub_22BF057F4;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22BF1F2AC;
    aBlock[3] = &block_descriptor_4;
    uint64_t v15 = _Block_copy(aBlock);
    uint64_t v20 = v8;
    uint64_t v16 = v15;
    id v17 = a1;
    id v19 = v13;
    swift_retain();
    swift_release();
    sub_22BF5A438();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_22BF05858((unint64_t *)&unk_268491700, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914C0);
    sub_22BEF96F8((unint64_t *)&qword_268491710, (uint64_t *)&unk_2684914C0);
    sub_22BF5A6D8();
    uint64_t v18 = (void *)v21;
    MEMORY[0x230F588F0](0, v10, v7, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v20);
    swift_release();
    _Block_release(a2);
  }
}

uint64_t sub_22BF0541C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v20[1] = a1;
  uint64_t v7 = type metadata accessor for EvernoteWebView.LoadingState(0);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = type metadata accessor for EvernoteWebView(0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (void *)((char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v15 = a2;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 2, v16);
  sub_22BF08830((uint64_t)v12, (uint64_t)v10, (void (*)(void))type metadata accessor for EvernoteWebView.LoadingState);
  id v17 = a2;
  swift_retain();
  sub_22BF5A2A8();
  sub_22BF058A0((uint64_t)v12, (void (*)(void))type metadata accessor for EvernoteWebView.LoadingState);
  uint64_t v18 = (void *)((char *)v15 + *(int *)(v13 + 24));
  *uint64_t v18 = a3;
  v18[1] = a4;
  sub_22BF05858(&qword_2684918B0, (void (*)(uint64_t))type metadata accessor for EvernoteWebView);
  sub_22BF5A678();
  return sub_22BF058A0((uint64_t)v15, (void (*)(void))type metadata accessor for EvernoteWebView);
}

id sub_22BF05674(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for WFEvernoteAccessResourceUserInterface();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithUserInterfaceType_attribution_, a1, a2);

  return v5;
}

id sub_22BF0571C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFEvernoteAccessResourceUserInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WFEvernoteAccessResourceUserInterface()
{
  return self;
}

uint64_t sub_22BF05774()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22BF057AC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22BF057F4()
{
  return sub_22BF0541C(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t type metadata accessor for EvernoteWebView.LoadingState(uint64_t a1)
{
  return sub_22BEFD518(a1, (uint64_t *)&unk_2684918E0);
}

uint64_t type metadata accessor for EvernoteWebView(uint64_t a1)
{
  return sub_22BEFD518(a1, (uint64_t *)&unk_2684918C8);
}

uint64_t sub_22BF05858(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22BF058A0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_3_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

void **sub_22BF058F8(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    objc_super v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
  }
  else
  {
    objc_super v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = v4;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 2, v12))
    {
      uint64_t v13 = type metadata accessor for EvernoteWebView.LoadingState(0);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v14 = sub_22BF59B58();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v9, v10, v14);
      uint64_t v15 = *(int *)(v12 + 48);
      uint64_t v16 = &v9[v15];
      id v17 = &v10[v15];
      uint64_t v18 = *((void *)v17 + 1);
      *(void *)uint64_t v16 = *(void *)v17;
      *((void *)v16 + 1) = v18;
      uint64_t v19 = *(int *)(v12 + 64);
      uint64_t v20 = &v9[v19];
      uint64_t v21 = &v10[v19];
      uint64_t v22 = *((void *)v21 + 1);
      *(void *)uint64_t v20 = *(void *)v21;
      *((void *)v20 + 1) = v22;
      swift_bridgeObjectRetain();
      swift_retain();
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 2, v12);
    }
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918B8);
    *(void *)&v9[*(int *)(v23 + 28)] = *(void *)&v10[*(int *)(v23 + 28)];
    uint64_t v24 = *(int *)(a3 + 24);
    uint64_t v25 = (void **)((char *)v7 + v24);
    uint64_t v26 = (void **)((char *)a2 + v24);
    uint64_t v27 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v27;
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t sub_22BF05AA4(id *a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 20);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  if (!__swift_getEnumTagSinglePayload(v4, 2, v5))
  {
    uint64_t v6 = sub_22BF59B58();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
    swift_bridgeObjectRelease();
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918B8);
  swift_release();
  return swift_release();
}

void **sub_22BF05B90(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  id v10 = v6;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 2, v11))
  {
    uint64_t v12 = type metadata accessor for EvernoteWebView.LoadingState(0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_22BF59B58();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v8, v9, v13);
    uint64_t v14 = *(int *)(v11 + 48);
    uint64_t v15 = &v8[v14];
    uint64_t v16 = &v9[v14];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    uint64_t v18 = *(int *)(v11 + 64);
    uint64_t v19 = &v8[v18];
    uint64_t v20 = &v9[v18];
    uint64_t v21 = *((void *)v20 + 1);
    *(void *)uint64_t v19 = *(void *)v20;
    *((void *)v19 + 1) = v21;
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 2, v11);
  }
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918B8);
  *(void *)&v8[*(int *)(v22 + 28)] = *(void *)&v9[*(int *)(v22 + 28)];
  uint64_t v23 = *(int *)(a3 + 24);
  uint64_t v24 = (void **)((char *)a1 + v23);
  uint64_t v25 = (void **)((char *)a2 + v23);
  uint64_t v26 = v25[1];
  void *v24 = *v25;
  v24[1] = v26;
  swift_retain();
  swift_retain();
  return a1;
}

void **sub_22BF05CF8(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  id v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 2, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 2, v12);
  if (!EnumTagSinglePayload)
  {
    if (!v14)
    {
      uint64_t v30 = sub_22BF59B58();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 24))(v10, v11, v30);
      uint64_t v31 = *(int *)(v12 + 48);
      uint64_t v32 = &v10[v31];
      unint64_t v33 = &v11[v31];
      *(void *)uint64_t v32 = *(void *)v33;
      *((void *)v32 + 1) = *((void *)v33 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v34 = *(int *)(v12 + 64);
      char v35 = &v10[v34];
      uint64_t v36 = &v11[v34];
      uint64_t v37 = *((void *)v36 + 1);
      *(void *)char v35 = *(void *)v36;
      *((void *)v35 + 1) = v37;
      swift_retain();
      swift_release();
      goto LABEL_7;
    }
    sub_22BF04F40((uint64_t)v10, &qword_2684918A8);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v23 = type metadata accessor for EvernoteWebView.LoadingState(0);
    memcpy(v10, v11, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v15 = sub_22BF59B58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v10, v11, v15);
  uint64_t v16 = *(int *)(v12 + 48);
  uint64_t v17 = &v10[v16];
  uint64_t v18 = &v11[v16];
  *(void *)uint64_t v17 = *(void *)v18;
  *((void *)v17 + 1) = *((void *)v18 + 1);
  uint64_t v19 = *(int *)(v12 + 64);
  uint64_t v20 = &v10[v19];
  uint64_t v21 = &v11[v19];
  uint64_t v22 = *((void *)v21 + 1);
  *(void *)uint64_t v20 = *(void *)v21;
  *((void *)v20 + 1) = v22;
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 2, v12);
LABEL_7:
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918B8);
  *(void *)&v10[*(int *)(v24 + 28)] = *(void *)&v11[*(int *)(v24 + 28)];
  swift_retain();
  swift_release();
  uint64_t v25 = *(int *)(a3 + 24);
  uint64_t v26 = (void **)((char *)a1 + v25);
  uint64_t v27 = (void **)((char *)a2 + v25);
  uint64_t v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  swift_retain();
  swift_release();
  return a1;
}

void *sub_22BF05F40(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 2, v9))
  {
    uint64_t v10 = type metadata accessor for EvernoteWebView.LoadingState(0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    uint64_t v11 = sub_22BF59B58();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v7, v8, v11);
    *(_OWORD *)&v7[*(int *)(v9 + 48)] = *(_OWORD *)&v8[*(int *)(v9 + 48)];
    *(_OWORD *)&v7[*(int *)(v9 + 64)] = *(_OWORD *)&v8[*(int *)(v9 + 64)];
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918B8);
  *(void *)&v7[*(int *)(v12 + 28)] = *(void *)&v8[*(int *)(v12 + 28)];
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void **sub_22BF0606C(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 2, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 2, v10);
  if (!EnumTagSinglePayload)
  {
    if (!v12)
    {
      uint64_t v17 = sub_22BF59B58();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40))(v8, v9, v17);
      uint64_t v18 = *(int *)(v10 + 48);
      uint64_t v19 = &v8[v18];
      uint64_t v20 = &v9[v18];
      uint64_t v22 = *(void *)v20;
      uint64_t v21 = *((void *)v20 + 1);
      *(void *)uint64_t v19 = v22;
      *((void *)v19 + 1) = v21;
      swift_bridgeObjectRelease();
      *(_OWORD *)&v8[*(int *)(v10 + 64)] = *(_OWORD *)&v9[*(int *)(v10 + 64)];
      swift_release();
      goto LABEL_7;
    }
    sub_22BF04F40((uint64_t)v8, &qword_2684918A8);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = type metadata accessor for EvernoteWebView.LoadingState(0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v13 = sub_22BF59B58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v8, v9, v13);
  *(_OWORD *)&v8[*(int *)(v10 + 48)] = *(_OWORD *)&v9[*(int *)(v10 + 48)];
  *(_OWORD *)&v8[*(int *)(v10 + 64)] = *(_OWORD *)&v9[*(int *)(v10 + 64)];
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 2, v10);
LABEL_7:
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918B8);
  *(void *)&v8[*(int *)(v15 + 28)] = *(void *)&v9[*(int *)(v15 + 28)];
  swift_release();
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_22BF0625C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BF06270);
}

uint64_t sub_22BF06270(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918B8);
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22BF062FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BF06310);
}

void *sub_22BF06310(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918B8);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_22BF06394()
{
  sub_22BF0643C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22BF0643C()
{
  if (!qword_2684918D8)
  {
    type metadata accessor for EvernoteWebView.LoadingState(255);
    unint64_t v0 = sub_22BF5A2E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2684918D8);
    }
  }
}

uint64_t *sub_22BF06494(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v9 = sub_22BF59B58();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
      uint64_t v10 = *(int *)(v7 + 48);
      uint64_t v11 = (uint64_t *)((char *)a1 + v10);
      int v12 = (uint64_t *)((char *)a2 + v10);
      uint64_t v13 = v12[1];
      *uint64_t v11 = *v12;
      v11[1] = v13;
      uint64_t v14 = *(int *)(v7 + 64);
      uint64_t v15 = (uint64_t *)((char *)a1 + v14);
      uint64_t v16 = (uint64_t *)((char *)a2 + v14);
      uint64_t v17 = v16[1];
      *uint64_t v15 = *v16;
      v15[1] = v17;
      swift_bridgeObjectRetain();
      swift_retain();
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t sub_22BF065D0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  uint64_t result = __swift_getEnumTagSinglePayload(a1, 2, v2);
  if (!result)
  {
    uint64_t v4 = sub_22BF59B58();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

char *sub_22BF06684(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_22BF59B58();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(v6 + 48);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = *((void *)v10 + 1);
    *(void *)uint64_t v9 = *(void *)v10;
    *((void *)v9 + 1) = v11;
    uint64_t v12 = *(int *)(v6 + 64);
    uint64_t v13 = &a1[v12];
    uint64_t v14 = &a2[v12];
    uint64_t v15 = *((void *)v14 + 1);
    *(void *)uint64_t v13 = *(void *)v14;
    *((void *)v13 + 1) = v15;
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

char *sub_22BF06784(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 2, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      uint64_t v18 = sub_22BF59B58();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 24))(a1, a2, v18);
      uint64_t v19 = *(int *)(v6 + 48);
      uint64_t v20 = &a1[v19];
      uint64_t v21 = &a2[v19];
      *(void *)uint64_t v20 = *(void *)v21;
      *((void *)v20 + 1) = *((void *)v21 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v22 = *(int *)(v6 + 64);
      uint64_t v23 = &a1[v22];
      uint64_t v24 = &a2[v22];
      uint64_t v25 = *((void *)v24 + 1);
      *(void *)uint64_t v23 = *(void *)v24;
      *((void *)v23 + 1) = v25;
      swift_retain();
      swift_release();
      return a1;
    }
    sub_22BF04F40((uint64_t)a1, &qword_2684918A8);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_22BF59B58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
  uint64_t v10 = *(int *)(v6 + 48);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  *(void *)uint64_t v11 = *(void *)v12;
  *((void *)v11 + 1) = *((void *)v12 + 1);
  uint64_t v13 = *(int *)(v6 + 64);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = *((void *)v15 + 1);
  *(void *)uint64_t v14 = *(void *)v15;
  *((void *)v14 + 1) = v16;
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  return a1;
}

char *sub_22BF06950(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_22BF59B58();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    *(_OWORD *)&a1[*(int *)(v6 + 48)] = *(_OWORD *)&a2[*(int *)(v6 + 48)];
    *(_OWORD *)&a1[*(int *)(v6 + 64)] = *(_OWORD *)&a2[*(int *)(v6 + 64)];
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

char *sub_22BF06A34(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 2, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      uint64_t v11 = sub_22BF59B58();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(a1, a2, v11);
      uint64_t v12 = *(int *)(v6 + 48);
      uint64_t v13 = &a1[v12];
      uint64_t v14 = &a2[v12];
      uint64_t v16 = *(void *)v14;
      uint64_t v15 = *((void *)v14 + 1);
      *(void *)uint64_t v13 = v16;
      *((void *)v13 + 1) = v15;
      swift_bridgeObjectRelease();
      *(_OWORD *)&a1[*(int *)(v6 + 64)] = *(_OWORD *)&a2[*(int *)(v6 + 64)];
      swift_release();
      return a1;
    }
    sub_22BF04F40((uint64_t)a1, &qword_2684918A8);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_22BF59B58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
  *(_OWORD *)&a1[*(int *)(v6 + 48)] = *(_OWORD *)&a2[*(int *)(v6 + 48)];
  *(_OWORD *)&a1[*(int *)(v6 + 64)] = *(_OWORD *)&a2[*(int *)(v6 + 64)];
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  return a1;
}

uint64_t sub_22BF06BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BF06BD4);
}

uint64_t sub_22BF06BD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, a2, v4);
  if (EnumTagSinglePayload >= 3) {
    return EnumTagSinglePayload - 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_22BF06C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BF06C34);
}

uint64_t sub_22BF06C34(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  return __swift_storeEnumTagSinglePayload(a1, v5, a3, v6);
}

uint64_t sub_22BF06C98(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  return __swift_getEnumTagSinglePayload(a1, 2, v2);
}

uint64_t sub_22BF06CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  return __swift_storeEnumTagSinglePayload(a1, a2, 2, v4);
}

uint64_t sub_22BF06D30()
{
  uint64_t result = sub_22BF59B58();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_22BF06DD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BF06DEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for EvernoteWebView(0);
  uint64_t v23 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v23 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v21 - v7;
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v9 = (id)qword_2684922C8;
  uint64_t v10 = (void *)sub_22BF5A4A8();
  uint64_t v11 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v10, v11, 0);

  uint64_t v22 = sub_22BF5A4C8();
  uint64_t v14 = v13;

  sub_22BF08830(v1, (uint64_t)v8, (void (*)(void))type metadata accessor for EvernoteWebView);
  unint64_t v15 = (*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v16 = swift_allocObject();
  sub_22BF08888((uint64_t)v8, v16 + v15);
  sub_22BF08830(v1, (uint64_t)v6, (void (*)(void))type metadata accessor for EvernoteWebView);
  uint64_t v17 = swift_allocObject();
  sub_22BF08888((uint64_t)v6, v17 + v15);
  char v24 = 0;
  uint64_t result = sub_22BF5A2A8();
  char v19 = v25;
  uint64_t v20 = v26;
  *(void *)a1 = v22;
  *(void *)(a1 + 8) = v14;
  *(_WORD *)(a1 + 16) = 257;
  *(void *)(a1 + 24) = sub_22BF088EC;
  *(void *)(a1 + 32) = v16;
  *(void *)(a1 + 40) = sub_22BF08A60;
  *(void *)(a1 + 48) = v17;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 72) = v19;
  *(void *)(a1 + 80) = v20;
  return result;
}

uint64_t sub_22BF07084@<X0>(uint64_t a1@<X8>)
{
  uint64_t v58 = a1;
  uint64_t v2 = sub_22BF59A78();
  uint64_t v47 = *(void *)(v2 - 8);
  uint64_t v48 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v45 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for WebView(0);
  MEMORY[0x270FA5388](v57);
  uint64_t v50 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_22BF59B58();
  uint64_t v49 = *(void *)(v51 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v51);
  unint64_t v44 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  id v46 = (char *)&v43 - v7;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918F0);
  MEMORY[0x270FA5388](v55);
  uint64_t v56 = (uint64_t)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for EvernoteWebView(0);
  *(void *)&long long v53 = *(void *)(v9 - 8);
  uint64_t v10 = *(void *)(v53 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491288);
  uint64_t v11 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491900);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491908);
  uint64_t v17 = MEMORY[0x270FA5388](v54);
  char v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v43 - v20;
  uint64_t v22 = type metadata accessor for EvernoteWebView.LoadingState(0);
  MEMORY[0x270FA5388](v22 - 8);
  char v24 = (char *)&v43 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918B8);
  sub_22BF5A2B8();
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 2, v26))
  {
    sub_22BF59CB8();
    sub_22BF5A3D8();
    sub_22BF19AB8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v16, 0.0, 1, INFINITY, 0);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v52);
    sub_22BF08830(v25, (uint64_t)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for EvernoteWebView);
    unint64_t v27 = (*(unsigned __int8 *)(v53 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
    uint64_t v28 = swift_allocObject();
    sub_22BF08888((uint64_t)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v28 + v27);
    sub_22BF08E58((uint64_t)v16, (uint64_t)v19, &qword_268491900);
    uint64_t v29 = (uint64_t (**)())&v19[*(int *)(v54 + 36)];
    *uint64_t v29 = sub_22BF08D90;
    v29[1] = (uint64_t (*)())v28;
    v29[2] = 0;
    v29[3] = 0;
    sub_22BF04F40((uint64_t)v16, &qword_268491900);
    sub_22BF08DF0((uint64_t)v19, (uint64_t)v21);
    sub_22BF08E58((uint64_t)v21, v56, &qword_268491908);
    swift_storeEnumTagMultiPayload();
    sub_22BF08C70();
    sub_22BF05858(&qword_268491938, (void (*)(uint64_t))type metadata accessor for WebView);
    sub_22BF59F98();
    return sub_22BF04F40((uint64_t)v21, &qword_268491908);
  }
  else
  {
    uint64_t v31 = &v24[*(int *)(v26 + 48)];
    uint64_t v32 = *(void *)v31;
    uint64_t v33 = *((void *)v31 + 1);
    uint64_t v34 = v49;
    char v35 = *(void (**)(char *, char *, uint64_t))(v49 + 32);
    long long v53 = *(_OWORD *)&v24[*(int *)(v26 + 64)];
    uint64_t v36 = v46;
    uint64_t v37 = v51;
    v35(v46, v24, v51);
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v44, v36, v37);
    id v38 = v45;
    sub_22BF59A58();
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = v32;
    *(void *)(v39 + 24) = v33;
    *(_OWORD *)(v39 + 32) = v53;
    uint64_t v40 = (uint64_t)v50;
    (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v50, v38, v48);
    uint64_t v41 = v56;
    uint64_t v42 = (void *)(v40 + *(int *)(v57 + 20));
    *uint64_t v42 = &unk_268491918;
    v42[1] = v39;
    sub_22BF08830(v40, v41, (void (*)(void))type metadata accessor for WebView);
    swift_storeEnumTagMultiPayload();
    sub_22BF08C70();
    sub_22BF05858(&qword_268491938, (void (*)(uint64_t))type metadata accessor for WebView);
    sub_22BF59F98();
    sub_22BF058A0(v40, (void (*)(void))type metadata accessor for WebView);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v36, v37);
  }
}

uint64_t sub_22BF077FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EvernoteWebView(0);
  return (*(uint64_t (**)(void, void))(a1 + *(int *)(v2 + 24)))(0, 0);
}

uint64_t sub_22BF07840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a4;
  v5[10] = a5;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684917C0);
  v5[11] = swift_task_alloc();
  uint64_t v6 = sub_22BF59A78();
  v5[12] = v6;
  v5[13] = *(void *)(v6 - 8);
  v5[14] = swift_task_alloc();
  uint64_t v7 = sub_22BF59B58();
  v5[15] = v7;
  v5[16] = *(void *)(v7 - 8);
  v5[17] = swift_task_alloc();
  sub_22BF5A5C8();
  v5[18] = sub_22BF5A5B8();
  uint64_t v9 = sub_22BF5A588();
  return MEMORY[0x270FA2498](sub_22BF079C8, v9, v8);
}

uint64_t sub_22BF079C8()
{
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 104);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v6 = *(void **)(v0 + 48);
  swift_release();
  id v7 = objc_msgSend(v6, sel_request);
  sub_22BF59A48();

  sub_22BF59A68();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  if (__swift_getEnumTagSinglePayload(v5, 1, v1) == 1)
  {
    sub_22BF04F40(*(void *)(v0 + 88), (uint64_t *)&unk_2684917C0);
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 56);
    uint64_t v8 = *(void *)(v0 + 64);
    (*(void (**)(void, void, void))(*(void *)(v0 + 128) + 32))(*(void *)(v0 + 136), *(void *)(v0 + 88), *(void *)(v0 + 120));
    *(void *)(v0 + 16) = sub_22BF59B08();
    *(void *)(v0 + 24) = v10;
    *(void *)(v0 + 32) = v9;
    *(void *)(v0 + 40) = v8;
    sub_22BF09230();
    sub_22BF0927C();
    char v11 = sub_22BF5A488();
    swift_bridgeObjectRelease();
    if (v11)
    {
      (*(void (**)(void))(v0 + 72))(*(void *)(v0 + 136));
      uint64_t v12 = OUTLINED_FUNCTION_6_0();
      v13(v12);
      uint64_t v14 = 0;
      goto LABEL_7;
    }
    uint64_t v15 = OUTLINED_FUNCTION_6_0();
    v16(v15);
  }
  uint64_t v14 = 1;
LABEL_7:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v17(v14);
}

void sub_22BF07B94(void **a1)
{
  uint64_t v2 = type metadata accessor for EvernoteWebView(0);
  uint64_t v23 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v23 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for EvernoteWebView.LoadingState(0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  char v11 = (char *)&v22 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v22 - v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918B8);
  sub_22BF5A2B8();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v13, 2, v14);
  sub_22BF058A0((uint64_t)v13, (void (*)(void))type metadata accessor for EvernoteWebView.LoadingState);
  if (EnumTagSinglePayload == 1)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 2, 2, v14);
    sub_22BF08830((uint64_t)v11, (uint64_t)v8, (void (*)(void))type metadata accessor for EvernoteWebView.LoadingState);
    sub_22BF5A2C8();
    sub_22BF058A0((uint64_t)v11, (void (*)(void))type metadata accessor for EvernoteWebView.LoadingState);
    uint64_t v16 = *a1;
    sub_22BF08830((uint64_t)a1, (uint64_t)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for EvernoteWebView);
    unint64_t v17 = (*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    uint64_t v18 = swift_allocObject();
    sub_22BF08888((uint64_t)v4, v18 + v17);
    uint64_t v28 = sub_22BF08EAC;
    uint64_t v29 = v18;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v25 = 1107296256;
    uint64_t v26 = sub_22BF08550;
    unint64_t v27 = &block_descriptor_27;
    uint64_t v19 = _Block_copy(&aBlock);
    swift_release();
    sub_22BF08830((uint64_t)a1, (uint64_t)v4, (void (*)(void))type metadata accessor for EvernoteWebView);
    uint64_t v20 = swift_allocObject();
    sub_22BF08888((uint64_t)v4, v20 + v17);
    uint64_t v28 = sub_22BF08F24;
    uint64_t v29 = v20;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v25 = 1107296256;
    uint64_t v26 = sub_22BEFFF38;
    unint64_t v27 = &block_descriptor_33;
    uint64_t v21 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v16, sel_authenticateWithAuthorizationBlock_preferRegistration_completion_, v19, 0, v21);
    _Block_release(v21);
    _Block_release(v19);
  }
}

uint64_t sub_22BF07F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v33 = a6;
  uint64_t v37 = a4;
  uint64_t v38 = a5;
  uint64_t v35 = a2;
  uint64_t v36 = a3;
  uint64_t v40 = sub_22BF5A418();
  uint64_t v43 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v39 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22BF5A448();
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22BF59B58();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for EvernoteWebView(0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BEFD454();
  uint64_t v34 = sub_22BF5A648();
  sub_22BF08830(v33, (uint64_t)v18, (void (*)(void))type metadata accessor for EvernoteWebView);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  unint64_t v19 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v20 = (v17 + *(unsigned __int8 *)(v12 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v21 = (v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = swift_allocObject();
  sub_22BF08888((uint64_t)v18, v22 + v19);
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v22 + v20, v14, v11);
  uint64_t v23 = (void *)(v22 + v21);
  uint64_t v24 = v36;
  *uint64_t v23 = v35;
  v23[1] = v24;
  uint64_t v25 = (void *)(v22 + ((v21 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v26 = v38;
  *uint64_t v25 = v37;
  v25[1] = v26;
  aBlock[4] = sub_22BF0916C;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22BF1F2AC;
  aBlock[3] = &block_descriptor_42;
  unint64_t v27 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  sub_22BF5A438();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22BF05858((unint64_t *)&unk_268491700, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914C0);
  sub_22BEF96F8((unint64_t *)&qword_268491710, (uint64_t *)&unk_2684914C0);
  uint64_t v29 = v39;
  uint64_t v28 = v40;
  sub_22BF5A6D8();
  uint64_t v30 = (void *)v34;
  MEMORY[0x230F588F0](0, v10, v29, v27);
  _Block_release(v27);

  (*(void (**)(char *, uint64_t))(v43 + 8))(v29, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v10, v42);
}

uint64_t sub_22BF083AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v22[1] = a1;
  uint64_t v11 = type metadata accessor for EvernoteWebView.LoadingState(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v22 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  uint64_t v18 = &v16[*(int *)(v17 + 48)];
  unint64_t v19 = &v16[*(int *)(v17 + 64)];
  uint64_t v20 = sub_22BF59B58();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v16, a2, v20);
  *(void *)uint64_t v18 = a3;
  *((void *)v18 + 1) = a4;
  *(void *)unint64_t v19 = a5;
  *((void *)v19 + 1) = a6;
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 2, v17);
  type metadata accessor for EvernoteWebView(0);
  sub_22BF08830((uint64_t)v16, (uint64_t)v14, (void (*)(void))type metadata accessor for EvernoteWebView.LoadingState);
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918B8);
  sub_22BF5A2C8();
  return sub_22BF058A0((uint64_t)v16, (void (*)(void))type metadata accessor for EvernoteWebView.LoadingState);
}

uint64_t sub_22BF08550(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v6 = sub_22BF59B58();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t, void (*)(uint64_t), uint64_t))(a1 + 32);
  sub_22BF59B28();
  uint64_t v11 = sub_22BF5A4C8();
  uint64_t v13 = v12;
  uint64_t v14 = _Block_copy(a4);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  swift_retain();
  v10(v9, v11, v13, sub_22BF08F68, v15);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_22BF086C8(uint64_t a1, uint64_t a2)
{
  id v3 = (id)sub_22BF59B18();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);
}

void sub_22BF08724(void *a1, uint64_t a2)
{
  if (a1)
  {
    _s3__C4CodeOMa_1(0);
    id v4 = a1;
    sub_22BF05858((unint64_t *)&unk_268491940, _s3__C4CodeOMa_1);
    uint64_t v5 = 0;
    if ((sub_22BF59A88() & 1) == 0)
    {
      id v6 = a1;
      uint64_t v5 = a1;
    }
    uint64_t v7 = type metadata accessor for EvernoteWebView(0);
    (*(void (**)(void, void *))(a2 + *(int *)(v7 + 24)))(0, v5);
  }
  else
  {
    uint64_t v8 = type metadata accessor for EvernoteWebView(0);
    (*(void (**)(uint64_t, void))(a2 + *(int *)(v8 + 24)))(1, 0);
  }
}

uint64_t sub_22BF08830(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3_1();
  uint64_t v4 = OUTLINED_FUNCTION_5_1();
  v5(v4);
  return a2;
}

uint64_t sub_22BF08888(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EvernoteWebView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF088EC@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF07084(a1);
}

uint64_t objectdestroy_10Tm()
{
  type metadata accessor for EvernoteWebView(0);
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);

  uint64_t v7 = v1 + v4 + *(int *)(v0 + 20);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  if (!__swift_getEnumTagSinglePayload(v7, 2, v8))
  {
    sub_22BF59B58();
    OUTLINED_FUNCTION_3_1();
    (*(void (**)(uint64_t))(v9 + 8))(v7);
    swift_bridgeObjectRelease();
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918B8);
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v1, v4 + v6, v3 | 7);
}

uint64_t sub_22BF08A60()
{
  return sub_22BF08DA8(sub_22BF077FC);
}

uint64_t sub_22BF08A78()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22BF08AB8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_22BF08B74;
  return sub_22BF07840(a1, v4, v5, v7, v6);
}

uint64_t sub_22BF08B74(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

unint64_t sub_22BF08C70()
{
  unint64_t result = qword_268491920;
  if (!qword_268491920)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491908);
    sub_22BF08CEC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491920);
  }
  return result;
}

unint64_t sub_22BF08CEC()
{
  unint64_t result = qword_268491928;
  if (!qword_268491928)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491900);
    sub_22BEF96F8(&qword_268491280, &qword_268491288);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491928);
  }
  return result;
}

uint64_t sub_22BF08D90()
{
  return sub_22BF08DA8((uint64_t (*)(uint64_t))sub_22BF07B94);
}

uint64_t sub_22BF08DA8(uint64_t (*a1)(uint64_t))
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0();
  return a1(v1 + v2);
}

uint64_t sub_22BF08DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491908);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF08E58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_3_1();
  uint64_t v4 = OUTLINED_FUNCTION_5_1();
  v5(v4);
  return a2;
}

uint64_t sub_22BF08EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0();
  return sub_22BF07F20(a1, a2, a3, a4, a5, v5 + v11);
}

void sub_22BF08F24(void *a1)
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0();
  sub_22BF08724(a1, v1 + v3);
}

void sub_22BF08F68(uint64_t a1)
{
  sub_22BF086C8(a1, *(void *)(v1 + 16));
}

uint64_t sub_22BF08F70()
{
  type metadata accessor for EvernoteWebView(0);
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v14 = *(void *)(v5 + 64);
  uint64_t v6 = sub_22BF59B58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = *(void *)(v7 + 64);

  uint64_t v9 = v1 + v4 + *(int *)(v0 + 20);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684918A8);
  if (!__swift_getEnumTagSinglePayload(v9, 2, v10))
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease();
    swift_release();
  }
  uint64_t v11 = (v4 + v14 + v8) & ~v8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918B8);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1 + v11, v6);
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v1, ((((v13 + v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16, v3 | v8 | 7);
}

uint64_t sub_22BF0916C()
{
  uint64_t v1 = type metadata accessor for EvernoteWebView(0);
  OUTLINED_FUNCTION_2_1(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = sub_22BF59B58();
  OUTLINED_FUNCTION_2_1(v6);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unint64_t v11 = (v3 + v5 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v12 = (*(void *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v13 = v0 + v11;
  uint64_t v14 = *(void *)(v0 + v12);
  uint64_t v15 = *(void *)(v0 + v12 + 8);
  uint64_t v16 = (uint64_t *)(v0 + ((v12 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v17 = *v16;
  uint64_t v18 = v16[1];
  return sub_22BF083AC(v0 + v3, v13, v14, v15, v17, v18);
}

unint64_t sub_22BF09230()
{
  unint64_t result = qword_268491950;
  if (!qword_268491950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491950);
  }
  return result;
}

unint64_t sub_22BF0927C()
{
  unint64_t result = qword_268491958;
  if (!qword_268491958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491958);
  }
  return result;
}

uint64_t sub_22BF092C8()
{
  return sub_22BEF96F8((unint64_t *)&unk_268491960, (uint64_t *)&unk_268492390);
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return type metadata accessor for EvernoteWebView(0) - 8;
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0;
}

uint64_t sub_22BF093B4@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF0AC14(v1, a1);
}

id sub_22BF093C4()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1FA60]), sel_init);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1FA58]), sel_initWithFrame_configuration_, v0, 0.0, 0.0, 0.0, 0.0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491AA0);
  sub_22BF5A078();
  objc_msgSend(v1, sel_setUIDelegate_, v3);

  sub_22BF5A078();
  objc_msgSend(v1, sel_setNavigationDelegate_, v3);

  return v1;
}

void sub_22BF094AC(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v49 = a1;
  uint64_t v5 = sub_22BF59A78();
  long long v53 = *(void **)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v45 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491A90);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v52 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491A98);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v48 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v46 = (uint64_t)&v43 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v43 - v16;
  MEMORY[0x270FA5388](v15);
  unint64_t v19 = (char *)&v43 - v18;
  uint64_t v20 = type metadata accessor for WebView(0);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491AA0);
  sub_22BF5A078();
  uint64_t v24 = v54;
  sub_22BF0AC14(v2, (uint64_t)v22);
  uint64_t v25 = (uint64_t)v24
      + OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_configuration;
  swift_beginAccess();
  sub_22BF0ACD4((uint64_t)v22, v25);
  swift_endAccess();

  uint64_t v47 = v23;
  uint64_t v50 = a2;
  uint64_t v26 = v53;
  sub_22BF5A078();
  unint64_t v27 = v54;
  uint64_t v28 = (uint64_t)v54
      + OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_loadedRequest;
  swift_beginAccess();
  sub_22BF0AD38(v28, (uint64_t)v19);

  uint64_t v29 = (void (*)(char *))v26[2];
  uint64_t v30 = v3;
  uint64_t v31 = (uint64_t)v52;
  uint64_t v51 = v30;
  v29(v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v5);
  uint64_t v32 = v31 + *(int *)(v8 + 56);
  sub_22BF0AD38((uint64_t)v19, v31);
  sub_22BF0AD38((uint64_t)v17, v32);
  if (__swift_getEnumTagSinglePayload(v31, 1, v5) == 1)
  {
    sub_22BEF9CBC((uint64_t)v17, &qword_268491A98);
    sub_22BEF9CBC((uint64_t)v19, &qword_268491A98);
    if (__swift_getEnumTagSinglePayload(v32, 1, v5) == 1)
    {
      sub_22BEF9CBC(v31, &qword_268491A98);
      return;
    }
  }
  else
  {
    uint64_t v33 = v46;
    sub_22BF0AD38(v31, v46);
    if (__swift_getEnumTagSinglePayload(v32, 1, v5) != 1)
    {
      uint64_t v34 = (void (*)(char *, uint64_t, uint64_t))v26[4];
      unint64_t v44 = v29;
      uint64_t v35 = v45;
      v34(v45, v32, v5);
      sub_22BF0AE08(&qword_268491AA8, MEMORY[0x263F06088]);
      char v36 = sub_22BF5A498();
      uint64_t v37 = (void (*)(char *, uint64_t))v26[1];
      v37(v35, v5);
      sub_22BEF9CBC((uint64_t)v17, &qword_268491A98);
      sub_22BEF9CBC((uint64_t)v19, &qword_268491A98);
      v37((char *)v33, v5);
      uint64_t v29 = v44;
      sub_22BEF9CBC(v31, &qword_268491A98);
      if (v36) {
        return;
      }
      goto LABEL_8;
    }
    sub_22BEF9CBC((uint64_t)v17, &qword_268491A98);
    sub_22BEF9CBC((uint64_t)v19, &qword_268491A98);
    ((void (*)(uint64_t, uint64_t))v26[1])(v33, v5);
  }
  sub_22BEF9CBC(v31, &qword_268491A90);
LABEL_8:
  uint64_t v38 = v51;
  uint64_t v39 = (void *)sub_22BF59A38();

  sub_22BF5A078();
  uint64_t v40 = v55;
  uint64_t v41 = (uint64_t)v48;
  ((void (*)(char *, uint64_t, uint64_t))v29)(v48, v38, v5);
  __swift_storeEnumTagSinglePayload(v41, 0, 1, v5);
  uint64_t v42 = (uint64_t)v40
      + OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_loadedRequest;
  swift_beginAccess();
  sub_22BF0ADA0(v41, v42);
  swift_endAccess();
}

id sub_22BF09A38()
{
  uint64_t v1 = type metadata accessor for WebView(0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF0AC14(v0, (uint64_t)v3);
  id v4 = objc_allocWithZone((Class)type metadata accessor for WebHostingView.Coordinator(0));
  return sub_22BF09AC0((uint64_t)v3);
}

id sub_22BF09AC0(uint64_t a1)
{
  uint64_t v3 = (uint64_t)v1
     + OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_loadedRequest;
  uint64_t v4 = sub_22BF59A78();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v4);
  sub_22BF0AC14(a1, (uint64_t)v1+ OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_configuration);
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for WebHostingView.Coordinator(0);
  id v5 = objc_msgSendSuper2(&v7, sel_init);
  sub_22BF0AC78(a1);
  return v5;
}

uint64_t sub_22BF09B58(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  sub_22BF5A5C8();
  v3[7] = sub_22BF5A5B8();
  uint64_t v5 = sub_22BF5A588();
  v3[8] = v5;
  v3[9] = v4;
  return MEMORY[0x270FA2498](sub_22BF09BF0, v5, v4);
}

uint64_t sub_22BF09BF0()
{
  uint64_t v1 = v0[6]
     + OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_configuration;
  swift_beginAccess();
  uint64_t v2 = (int **)(v1 + *(int *)(type metadata accessor for WebView(0) + 20));
  uint64_t v3 = *v2;
  v0[10] = v2[1];
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v3 + *v3);
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[11] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_22BF09D08;
  uint64_t v5 = v0[5];
  return v7(v5);
}

uint64_t sub_22BF09D08()
{
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_2();
  *uint64_t v3 = v2;
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_3_2();
  *uint64_t v5 = v4;
  *(void *)(v7 + 96) = v6;
  swift_task_dealloc();
  swift_release();
  uint64_t v8 = *(void *)(v1 + 72);
  uint64_t v9 = *(void *)(v1 + 64);
  return MEMORY[0x270FA2498](sub_22BF09E4C, v9, v8);
}

uint64_t sub_22BF09E4C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 96);
  return v1(v2);
}

uint64_t sub_22BF09F48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  sub_22BF5A5C8();
  v4[6] = sub_22BF5A5B8();
  uint64_t v6 = sub_22BF5A588();
  return MEMORY[0x270FA2498](sub_22BF09FE4, v6, v5);
}

uint64_t sub_22BF09FE4()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v3 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[4];
  uint64_t v4 = (void *)v0[2];
  swift_release();
  v0[7] = _Block_copy(v2);
  id v5 = v4;
  id v6 = v3;
  id v7 = v1;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[8] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_22BF0A0B0;
  uint64_t v10 = v0[2];
  uint64_t v9 = v0[3];
  return sub_22BF09B58(v10, v9);
}

uint64_t sub_22BF0A0B0(uint64_t a1)
{
  OUTLINED_FUNCTION_1();
  uint64_t v4 = (void (**)(void, void))v3[7];
  id v5 = (void *)v3[5];
  id v6 = (void *)v3[3];
  id v7 = (void *)v3[2];
  uint64_t v8 = *v1;
  OUTLINED_FUNCTION_3_2();
  *uint64_t v9 = v8;
  swift_task_dealloc();

  v4[2](v4, a1);
  _Block_release(v4);
  uint64_t v10 = *(uint64_t (**)(void))(v8 + 8);
  return v10();
}

void sub_22BF0A208()
{
}

id sub_22BF0A25C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WebHostingView.Coordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22BF0A2DC()
{
  return type metadata accessor for WebHostingView.Coordinator(0);
}

uint64_t type metadata accessor for WebHostingView.Coordinator(uint64_t a1)
{
  return sub_22BEFD518(a1, (uint64_t *)&unk_268491A48);
}

void sub_22BF0A304()
{
  type metadata accessor for WebView(319);
  if (v0 <= 0x3F)
  {
    sub_22BF0A3F0();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t type metadata accessor for WebView(uint64_t a1)
{
  return sub_22BEFD518(a1, qword_268491A70);
}

void sub_22BF0A3F0()
{
  if (!qword_268491A60)
  {
    sub_22BF59A78();
    unint64_t v0 = sub_22BF5A698();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268491A60);
    }
  }
}

uint64_t *sub_22BF0A448(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_22BF59A78();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
  }
  swift_retain();
  return a1;
}

uint64_t sub_22BF0A51C(uint64_t a1)
{
  uint64_t v2 = sub_22BF59A78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_22BF0A594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BF59A78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_retain();
  return a1;
}

uint64_t sub_22BF0A61C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BF59A78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22BF0A6B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BF59A78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_22BF0A72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BF59A78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_22BF0A7B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BF0A7C8);
}

uint64_t sub_22BF0A7C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22BF59A78();
  OUTLINED_FUNCTION_0_3();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_22BF0A854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BF0A868);
}

void sub_22BF0A868(uint64_t a1, int a2, int a3, uint64_t a4)
{
  sub_22BF59A78();
  OUTLINED_FUNCTION_0_3();
  if (*(_DWORD *)(v8 + 84) == a3)
  {
    uint64_t v9 = OUTLINED_FUNCTION_2_2();
    __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

uint64_t sub_22BF0A8E4()
{
  uint64_t result = sub_22BF59A78();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22BF0A97C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BF0A998()
{
  return MEMORY[0x263F1BB58];
}

id sub_22BF0A9BC@<X0>(void *a1@<X8>)
{
  id result = sub_22BF09A38();
  *a1 = result;
  return result;
}

uint64_t sub_22BF0A9E8()
{
  return sub_22BF59EF8();
}

uint64_t sub_22BF0AA2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BF0AE08(&qword_268491AB0, (void (*)(uint64_t))type metadata accessor for WebHostingView);
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_22BF0AAC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BF0AE08(&qword_268491AB0, (void (*)(uint64_t))type metadata accessor for WebHostingView);
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_22BF0AB54()
{
}

uint64_t sub_22BF0ABAC()
{
  return sub_22BF0AE08(&qword_268491A88, (void (*)(uint64_t))type metadata accessor for WebHostingView);
}

uint64_t type metadata accessor for WebHostingView(uint64_t a1)
{
  return sub_22BEFD518(a1, (uint64_t *)&unk_268491AD0);
}

uint64_t sub_22BF0AC14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WebView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF0AC78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WebView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22BF0ACD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WebView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF0AD38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491A98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF0ADA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491A98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF0AE08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22BF0AE50()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22BF0AEA0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_22BF0AF60;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_268491AB8 + dword_268491AB8);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_22BF0AF60()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t *sub_22BF0B02C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for WebView(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_22BF59A78();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(v6 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
  }
  swift_retain();
  return a1;
}

uint64_t sub_22BF0B108(uint64_t a1)
{
  uint64_t v2 = sub_22BF59A78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  type metadata accessor for WebView(0);
  return swift_release();
}

uint64_t sub_22BF0B184(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BF59A78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for WebView(0) + 20);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  uint64_t v8 = v7[1];
  *uint64_t v6 = *v7;
  v6[1] = v8;
  swift_retain();
  return a1;
}

uint64_t sub_22BF0B208(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BF59A78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for WebView(0) + 20);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  uint64_t v8 = v7[1];
  *uint64_t v6 = *v7;
  v6[1] = v8;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22BF0B298(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BF59A78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  uint64_t v5 = type metadata accessor for WebView(0);
  *(_OWORD *)(a1 + *(int *)(v5 + 20)) = *(_OWORD *)(a2 + *(int *)(v5 + 20));
  return a1;
}

uint64_t sub_22BF0B310(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BF59A78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  uint64_t v5 = type metadata accessor for WebView(0);
  *(_OWORD *)(a1 + *(int *)(v5 + 20)) = *(_OWORD *)(a2 + *(int *)(v5 + 20));
  swift_release();
  return a1;
}

uint64_t sub_22BF0B394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BF0B3A8);
}

uint64_t sub_22BF0B3A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WebView(0);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_22BF0B3F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BF0B404);
}

uint64_t sub_22BF0B404()
{
  type metadata accessor for WebView(0);
  uint64_t v0 = OUTLINED_FUNCTION_2_2();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t sub_22BF0B444()
{
  uint64_t result = type metadata accessor for WebView(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22BF0B4D0()
{
  return sub_22BF0AE08(&qword_268491A88, (void (*)(uint64_t))type metadata accessor for WebHostingView);
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return v0;
}

uint64_t sub_22BF0B550(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
  OUTLINED_FUNCTION_3_1();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v28 - v8;
  uint64_t v10 = type metadata accessor for WordPressLoginView();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v13 = a1;
  *((void *)v13 + 1) = a2;
  unint64_t v29 = 0;
  unint64_t v30 = 0xE000000000000000;
  swift_retain();
  OUTLINED_FUNCTION_4_1();
  uint64_t v14 = v32;
  *((_OWORD *)v13 + 1) = v31;
  *((void *)v13 + 4) = v14;
  unint64_t v29 = 0;
  unint64_t v30 = 0xE000000000000000;
  OUTLINED_FUNCTION_4_1();
  uint64_t v15 = v32;
  *(_OWORD *)(v13 + 40) = v31;
  *((void *)v13 + 7) = v15;
  unint64_t v29 = 0xD000000000000015;
  unint64_t v30 = 0x800000022BF64E20;
  OUTLINED_FUNCTION_4_1();
  uint64_t v16 = v32;
  *((_OWORD *)v13 + 4) = v31;
  *((void *)v13 + 10) = v16;
  uint64_t v17 = sub_22BF59C28();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v17);
  sub_22BF04EE4((uint64_t)v9, (uint64_t)v7, &qword_2684914D0);
  sub_22BF5A2A8();
  sub_22BF04F40((uint64_t)v9, &qword_2684914D0);
  uint64_t v18 = *(int *)(v10 + 36);
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  unint64_t v19 = (uint64_t *)&v13[v18];
  id v20 = (id)qword_2684922C8;
  uint64_t v21 = (void *)sub_22BF5A4A8();
  uint64_t v22 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v20, sel_localizedStringForKey_value_table_, v21, v22, 0);

  uint64_t v24 = sub_22BF5A4C8();
  uint64_t v26 = v25;

  *unint64_t v19 = v24;
  v19[1] = v26;
  sub_22BF0E554(&qword_268491AE0, (void (*)(uint64_t))type metadata accessor for WordPressLoginView);
  return sub_22BF5A338();
}

uint64_t sub_22BF0B824(uint64_t a1, uint64_t a2)
{
  return sub_22BF0B550(a1, a2);
}

uint64_t type metadata accessor for WordPressLoginView()
{
  uint64_t result = qword_268491AE8;
  if (!qword_268491AE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22BF0B884@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684917C0);
  MEMORY[0x270FA5388](v4 - 8);
  long long v53 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for WordPressLoginView();
  uint64_t v54 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v54 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v55 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v58 = (uint64_t)&v52 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v52 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v52 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  unint64_t v19 = (char *)&v52 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v52 - v21;
  id v23 = (uint64_t *)(v1 + *(int *)(v20 + 44));
  uint64_t v24 = v23[1];
  uint64_t v56 = *v23;
  uint64_t v57 = v24;
  uint64_t v25 = *(void *)(v1 + 32);
  long long v59 = *(_OWORD *)(v1 + 16);
  uint64_t v60 = v25;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
  sub_22BF5A2B8();
  uint64_t v27 = v61;
  unint64_t v26 = v62;
  swift_bridgeObjectRelease();
  if ((v26 & 0x2000000000000000) != 0) {
    uint64_t v28 = HIBYTE(v26) & 0xF;
  }
  else {
    uint64_t v28 = v27 & 0xFFFFFFFFFFFFLL;
  }
  sub_22BF0E284(v2, (uint64_t)v22);
  if (!v28)
  {
    sub_22BF0E2E8((uint64_t)v22);
    sub_22BF0E284(v2, (uint64_t)v19);
LABEL_15:
    sub_22BF0E2E8((uint64_t)v19);
    sub_22BF0E284(v2, (uint64_t)v16);
LABEL_16:
    sub_22BF0E2E8((uint64_t)v16);
    BOOL v40 = 0;
    goto LABEL_17;
  }
  uint64_t v29 = *((void *)v22 + 7);
  long long v59 = *(_OWORD *)(v22 + 40);
  uint64_t v60 = v29;
  sub_22BF5A2B8();
  uint64_t v31 = v61;
  unint64_t v30 = v62;
  swift_bridgeObjectRelease();
  if ((v30 & 0x2000000000000000) != 0) {
    uint64_t v32 = HIBYTE(v30) & 0xF;
  }
  else {
    uint64_t v32 = v31 & 0xFFFFFFFFFFFFLL;
  }
  sub_22BF0E2E8((uint64_t)v22);
  sub_22BF0E284(v2, (uint64_t)v19);
  if (!v32) {
    goto LABEL_15;
  }
  uint64_t v33 = *((void *)v19 + 10);
  long long v59 = *((_OWORD *)v19 + 4);
  uint64_t v60 = v33;
  sub_22BF5A2B8();
  uint64_t v35 = v61;
  unint64_t v34 = v62;
  swift_bridgeObjectRelease();
  if ((v34 & 0x2000000000000000) != 0) {
    uint64_t v36 = HIBYTE(v34) & 0xF;
  }
  else {
    uint64_t v36 = v35 & 0xFFFFFFFFFFFFLL;
  }
  sub_22BF0E2E8((uint64_t)v19);
  sub_22BF0E284(v2, (uint64_t)v16);
  if (!v36) {
    goto LABEL_16;
  }
  uint64_t v37 = *((void *)v16 + 10);
  long long v59 = *((_OWORD *)v16 + 4);
  uint64_t v60 = v37;
  sub_22BF5A2B8();
  uint64_t v38 = (uint64_t)v53;
  sub_22BF59B48();
  swift_bridgeObjectRelease();
  sub_22BF0E2E8((uint64_t)v16);
  uint64_t v39 = sub_22BF59B58();
  BOOL v40 = __swift_getEnumTagSinglePayload(v38, 1, v39) != 1;
  sub_22BF04F40(v38, (uint64_t *)&unk_2684917C0);
LABEL_17:
  uint64_t v41 = v54;
  uint64_t v42 = (uint64_t)v55;
  sub_22BF0E284(v2, (uint64_t)v13);
  unint64_t v43 = (*(unsigned __int8 *)(v41 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v44 = swift_allocObject();
  sub_22BF0E348((uint64_t)v13, v44 + v43);
  uint64_t v45 = v58;
  sub_22BF0E284(v2, v58);
  uint64_t v46 = swift_allocObject();
  sub_22BF0E348(v45, v46 + v43);
  sub_22BF0E284(v2, v42);
  uint64_t v47 = swift_allocObject();
  sub_22BF0E348(v42, v47 + v43);
  LOBYTE(v61) = 0;
  uint64_t result = sub_22BF5A2A8();
  char v49 = v59;
  uint64_t v50 = *((void *)&v59 + 1);
  uint64_t v51 = v57;
  *(void *)a1 = v56;
  *(void *)(a1 + 8) = v51;
  *(unsigned char *)(a1 + 16) = v40;
  *(unsigned char *)(a1 + 17) = 0;
  *(void *)(a1 + 24) = sub_22BF0E3AC;
  *(void *)(a1 + 32) = v44;
  *(void *)(a1 + 40) = sub_22BF0E3C8;
  *(void *)(a1 + 48) = v46;
  *(void *)(a1 + 56) = &unk_268491B00;
  *(void *)(a1 + 64) = v47;
  *(unsigned char *)(a1 + 72) = v49;
  *(void *)(a1 + 80) = v50;
  return result;
}

uint64_t sub_22BF0BD18(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491530);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF0BEEC(a1, (uint64_t)v13);
  v8[0] = v13[0];
  v8[1] = v13[1];
  v8[2] = v13[2];
  long long v9 = v13[3];
  char v10 = v14;
  long long v11 = v15;
  uint64_t v12 = v16;
  type metadata accessor for WordPressLoginView();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  sub_22BF5A2D8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491B10);
  sub_22BF59C28();
  sub_22BF0E4BC();
  sub_22BF0E554(&qword_268491568, MEMORY[0x263F87748]);
  sub_22BF5A1C8();
  sub_22BF04F40((uint64_t)v4, (uint64_t *)&unk_268491530);
  long long v5 = v9;
  char v6 = v10;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22BF0E59C(v5, *((uint64_t *)&v5 + 1), v6);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BF0BEEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for WordPressLoginView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v8 = (id)qword_2684922C8;
  long long v9 = (void *)sub_22BF5A4A8();
  char v10 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v8, sel_localizedStringForKey_value_table_, v9, v10, 0);

  uint64_t v12 = sub_22BF5A4C8();
  uint64_t v44 = v13;
  uint64_t v45 = v12;

  sub_22BF0E284(a1, (uint64_t)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = (v14 + 16) & ~v14;
  uint64_t v43 = v14 | 7;
  uint64_t v16 = swift_allocObject();
  sub_22BF0E348((uint64_t)v7, v16 + v15);
  sub_22BF5A4E8();
  id v17 = (id)qword_2684922C8;
  uint64_t v18 = sub_22BF5A4A8();
  uint64_t v42 = a1;
  unint64_t v19 = (void *)v18;
  uint64_t v20 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v21 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v19, v20, 0);

  uint64_t v41 = sub_22BF5A4C8();
  uint64_t v23 = v22;

  sub_22BF5A4E8();
  id v24 = (id)qword_2684922C8;
  uint64_t v25 = (void *)sub_22BF5A4A8();
  unint64_t v26 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v27 = objc_msgSend(v24, sel_localizedStringForKey_value_table_, v25, v26, 0);

  uint64_t v28 = sub_22BF5A4C8();
  uint64_t v30 = v29;

  uint64_t v46 = v28;
  uint64_t v47 = v30;
  sub_22BEF934C();
  uint64_t v31 = sub_22BF5A0E8();
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  LOBYTE(v25) = v36 & 1;
  sub_22BF0E284(v42, (uint64_t)v7);
  uint64_t v37 = swift_allocObject();
  sub_22BF0E348((uint64_t)v7, v37 + v15);
  uint64_t v38 = v44;
  *(void *)a2 = v45;
  *(void *)(a2 + 8) = v38;
  *(void *)(a2 + 16) = sub_22BF0E5B0;
  *(void *)(a2 + 24) = v16;
  *(void *)(a2 + 32) = v41;
  *(void *)(a2 + 40) = v23;
  *(void *)(a2 + 48) = v31;
  *(void *)(a2 + 56) = v33;
  *(unsigned char *)(a2 + 64) = (_BYTE)v25;
  *(void *)(a2 + 72) = v35;
  *(void *)(a2 + 80) = sub_22BF0E73C;
  *(void *)(a2 + 88) = v37;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_22BF0E7B8(v31, v33, (char)v25);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRelease();
  sub_22BF0E59C(v31, v33, (char)v25);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BF0C2EC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v68 = a2;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491570);
  uint64_t v64 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v63 = (char *)v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491810);
  uint64_t v4 = MEMORY[0x270FA5388](v62);
  id v67 = (char *)v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v65 = (uint64_t)v57 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491580);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491588);
  MEMORY[0x270FA5388](v58);
  uint64_t v12 = (char *)v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491B40);
  uint64_t v60 = *(void *)(v13 - 8);
  uint64_t v61 = v13;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  long long v59 = (char *)v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v69 = (char *)v57 - v16;
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v17 = (id)qword_2684922C8;
  uint64_t v18 = (void *)sub_22BF5A4A8();
  unint64_t v19 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, v19, 0);

  uint64_t v21 = sub_22BF5A4C8();
  uint64_t v23 = v22;

  uint64_t v24 = *(void *)(a1 + 32);
  long long v70 = *(_OWORD *)(a1 + 16);
  uint64_t v71 = v24;
  v57[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
  sub_22BF5A2D8();
  v57[0] = a1;
  uint64_t v72 = v21;
  uint64_t v73 = v23;
  sub_22BEF934C();
  sub_22BF5A408();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v26 = sub_22BF5A4C8();
  uint64_t v28 = v27;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v12, v10, v7);
  uint64_t v29 = (uint64_t *)&v12[*(int *)(v58 + 36)];
  *uint64_t v29 = KeyPath;
  v29[1] = v26;
  v29[2] = v28;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_22BEFE660();
  uint64_t v30 = v59;
  sub_22BF5A198();
  sub_22BF04F40((uint64_t)v12, &qword_268491588);
  uint64_t v32 = v60;
  uint64_t v31 = v61;
  (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v69, v30, v61);
  sub_22BF5A4E8();
  id v33 = (id)qword_2684922C8;
  uint64_t v34 = (void *)sub_22BF5A4A8();
  uint64_t v35 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v36 = objc_msgSend(v33, sel_localizedStringForKey_value_table_, v34, v35, 0);

  uint64_t v37 = sub_22BF5A4C8();
  uint64_t v39 = v38;

  uint64_t v40 = *(void *)(v57[0] + 56);
  long long v70 = *(_OWORD *)(v57[0] + 40);
  uint64_t v71 = v40;
  sub_22BF5A2D8();
  uint64_t v72 = v37;
  uint64_t v73 = v39;
  uint64_t v41 = v63;
  sub_22BF59C88();
  uint64_t v42 = swift_getKeyPath();
  uint64_t v43 = sub_22BF5A4C8();
  uint64_t v45 = v44;
  uint64_t v46 = v64;
  uint64_t v47 = v66;
  uint64_t v48 = (uint64_t)v67;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v67, v41, v66);
  char v49 = (uint64_t *)(v48 + *(int *)(v62 + 36));
  *char v49 = v42;
  v49[1] = v43;
  v49[2] = v45;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v41, v47);
  uint64_t v50 = v65;
  sub_22BEFE724(v48, v65);
  uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  uint64_t v52 = v69;
  v51(v30, v69, v31);
  sub_22BF04EE4(v50, v48, (uint64_t *)&unk_268491810);
  long long v53 = v68;
  v51(v68, v30, v31);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491B48);
  sub_22BF04EE4(v48, (uint64_t)&v53[*(int *)(v54 + 48)], (uint64_t *)&unk_268491810);
  sub_22BF04F40(v50, (uint64_t *)&unk_268491810);
  uint64_t v55 = *(void (**)(char *, uint64_t))(v32 + 8);
  v55(v52, v31);
  sub_22BF04F40(v48, (uint64_t *)&unk_268491810);
  return ((uint64_t (*)(char *, uint64_t))v55)(v30, v31);
}

uint64_t sub_22BF0CA1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491580);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491B30);
  uint64_t v7 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF59EB8();
  uint64_t v10 = *(void *)(a1 + 80);
  long long v22 = *(_OWORD *)(a1 + 64);
  uint64_t v23 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
  sub_22BF5A2D8();
  sub_22BF5A3F8();
  sub_22BEF96F8((unint64_t *)&unk_268491800, &qword_268491580);
  sub_22BF5A148();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v12 = sub_22BF5A4C8();
  uint64_t v14 = v13;
  uint64_t v16 = v20;
  uint64_t v15 = v21;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v21, v9, v20);
  id v17 = (uint64_t *)(v15 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268491B38) + 36));
  *id v17 = KeyPath;
  v17[1] = v12;
  v17[2] = v14;
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v16);
}

uint64_t sub_22BF0CCD0(uint64_t a1)
{
  uint64_t v2 = sub_22BF59C28();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_22BF5A218();
}

uint64_t sub_22BF0CD9C()
{
  v0[2] = sub_22BF5A5C8();
  v0[3] = sub_22BF5A5B8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_22BF02D8C;
  return sub_22BF0CE48();
}

uint64_t sub_22BF0CE48()
{
  v1[31] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
  v1[32] = swift_task_alloc();
  v1[33] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684917C0);
  v1[34] = swift_task_alloc();
  uint64_t v2 = sub_22BF59B58();
  v1[35] = v2;
  v1[36] = *(void *)(v2 - 8);
  v1[37] = swift_task_alloc();
  sub_22BF5A5C8();
  v1[38] = sub_22BF5A5B8();
  uint64_t v4 = sub_22BF5A588();
  v1[39] = v4;
  v1[40] = v3;
  return MEMORY[0x270FA2498](sub_22BF0CFAC, v4, v3);
}

uint64_t sub_22BF0CFAC()
{
  uint64_t v1 = *(void *)(v0 + 248);
  long long v2 = *(_OWORD *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 80);
  *(_OWORD *)(v0 + 168) = v2;
  uint64_t v5 = *(void *)(v0 + 272);
  uint64_t v4 = *(void *)(v0 + 280);
  *(void *)(v0 + 184) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
  sub_22BF5A2B8();
  sub_22BF59B48();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v5, 1, v4) == 1)
  {
    uint64_t v6 = *(void *)(v0 + 272);
    swift_release();
    sub_22BF04F40(v6, (uint64_t *)&unk_2684917C0);
    OUTLINED_FUNCTION_3_3();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_3();
    return v7();
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 248);
    (*(void (**)(void, void, void))(*(void *)(v0 + 288) + 32))(*(void *)(v0 + 296), *(void *)(v0 + 272), *(void *)(v0 + 280));
    id v16 = self;
    uint64_t v10 = *(void *)(v9 + 32);
    *(_OWORD *)(v0 + 120) = *(_OWORD *)(v9 + 16);
    *(void *)(v0 + 136) = v10;
    sub_22BF5A2B8();
    uint64_t v11 = sub_22BF5A4A8();
    *(void *)(v0 + 328) = v11;
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v9 + 56);
    *(_OWORD *)(v0 + 144) = *(_OWORD *)(v9 + 40);
    *(void *)(v0 + 160) = v12;
    sub_22BF5A2B8();
    uint64_t v13 = sub_22BF5A4A8();
    *(void *)(v0 + 336) = v13;
    swift_bridgeObjectRelease();
    uint64_t v14 = sub_22BF59B18();
    *(void *)(v0 + 344) = v14;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 240;
    *(void *)(v0 + 24) = sub_22BF0D264;
    uint64_t v15 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_22BF0D5B4;
    *(void *)(v0 + 104) = &block_descriptor;
    *(void *)(v0 + 112) = v15;
    objc_msgSend(v16, sel_loginWithUsername_password_blogURL_completionHandler_, v11, v13, v14, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
}

uint64_t sub_22BF0D264()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = v0[6];
  *(void *)(v2 + 352) = v1;
  uint64_t v3 = v0[40];
  uint64_t v4 = v0[39];
  if (v1) {
    uint64_t v5 = sub_22BF0D454;
  }
  else {
    uint64_t v5 = sub_22BF0D36C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_22BF0D36C()
{
  uint64_t v2 = (void *)v0[42];
  uint64_t v1 = (void *)v0[43];
  uint64_t v3 = (void *)v0[41];
  uint64_t v4 = v0[37];
  uint64_t v5 = v0[35];
  uint64_t v6 = v0[36];
  uint64_t v7 = (void (**)(void *))v0[31];
  swift_release();
  uint64_t v8 = (void *)v0[30];

  uint64_t v9 = *v7;
  id v10 = v8;
  v9(v8);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  OUTLINED_FUNCTION_3_3();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v11();
}

uint64_t sub_22BF0D454()
{
  uint64_t v2 = (void *)v0[43];
  uint64_t v1 = (void *)v0[44];
  uint64_t v3 = (void *)v0[41];
  uint64_t v4 = (void *)v0[42];
  uint64_t v5 = v0[37];
  uint64_t v6 = v0[35];
  uint64_t v7 = v0[36];
  uint64_t v8 = v0[33];
  uint64_t v12 = v0[32];
  swift_release();
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);

  sub_22BF59AF8();
  sub_22BF59C38();
  uint64_t v9 = sub_22BF59C28();
  __swift_storeEnumTagSinglePayload(v8, 0, 1, v9);
  type metadata accessor for WordPressLoginView();
  sub_22BF04EE4(v8, v12, &qword_2684914D0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  sub_22BF5A2C8();

  sub_22BF04F40(v8, &qword_2684914D0);
  OUTLINED_FUNCTION_3_3();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v10();
}

uint64_t sub_22BF0D5B4(uint64_t result, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (a3)
  {
    id v4 = a3;
    return sub_22BF0397C(v3, v4);
  }
  else if (a2)
  {
    id v5 = a2;
    return sub_22BF03A44(v3, (uint64_t)v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_22BF0D628(void *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *a1 = v5;
    a1 = (void *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2[1];
    uint64_t v7 = a2[2];
    *a1 = v5;
    a1[1] = v8;
    uint64_t v9 = a2[3];
    uint64_t v10 = a2[4];
    a1[2] = v7;
    a1[3] = v9;
    uint64_t v11 = a2[5];
    uint64_t v12 = a2[6];
    a1[4] = v10;
    a1[5] = v11;
    uint64_t v14 = a2[7];
    uint64_t v13 = a2[8];
    a1[6] = v12;
    a1[7] = v14;
    uint64_t v16 = a2[9];
    uint64_t v15 = a2[10];
    a1[8] = v13;
    a1[9] = v16;
    uint64_t v17 = *(int *)(a3 + 32);
    __dst = (char *)a1 + v17;
    uint64_t v27 = (char *)a2 + v17;
    a1[10] = v15;
    uint64_t v18 = sub_22BF59C28();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v18))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
      uint64_t v20 = __dst;
      memcpy(__dst, v27, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      uint64_t v20 = __dst;
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(__dst, v27, v18);
      __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v18);
    }
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
    *(void *)&v20[*(int *)(v21 + 28)] = *(void *)&v27[*(int *)(v21 + 28)];
    uint64_t v22 = *(int *)(a3 + 36);
    uint64_t v23 = (void *)((char *)a1 + v22);
    uint64_t v24 = (uint64_t *)((char *)a2 + v22);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_22BF0D820(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_22BF59C28();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  swift_release();
  return swift_bridgeObjectRelease();
}

void *sub_22BF0D910(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v8 = a2[7];
  a1[6] = a2[6];
  a1[7] = v8;
  uint64_t v9 = a2[9];
  a1[8] = a2[8];
  a1[9] = v9;
  uint64_t v10 = *(int *)(a3 + 32);
  __dst = (char *)a1 + v10;
  uint64_t v20 = (char *)a2 + v10;
  a1[10] = a2[10];
  uint64_t v11 = sub_22BF59C28();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
    uint64_t v13 = __dst;
    memcpy(__dst, v20, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = __dst;
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(__dst, v20, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v11);
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  *(void *)&v13[*(int *)(v14 + 28)] = *(void *)&v20[*(int *)(v14 + 28)];
  uint64_t v15 = *(int *)(a3 + 36);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_22BF0DABC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22BF59C28();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  *(void *)&v8[*(int *)(v15 + 28)] = *(void *)&v9[*(int *)(v15 + 28)];
  swift_retain();
  swift_release();
  uint64_t v16 = *(int *)(a3 + 36);
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22BF0DD38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  long long v7 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  *(_OWORD *)(a1 + 64) = v7;
  uint64_t v11 = sub_22BF59C28();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  *(void *)&v9[*(int *)(v13 + 28)] = *(void *)&v10[*(int *)(v13 + 28)];
  *(_OWORD *)(a1 + *(int *)(a3 + 36)) = *(_OWORD *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_22BF0DE6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  uint64_t v9 = *(int *)(a3 + 32);
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = sub_22BF59C28();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (!EnumTagSinglePayload)
  {
    uint64_t v15 = *(void *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684914D0);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
LABEL_7:
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  *(void *)&v10[*(int *)(v17 + 28)] = *(void *)&v11[*(int *)(v17 + 28)];
  swift_release();
  uint64_t v18 = *(int *)(a3 + 36);
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22BF0E080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BF0E094);
}

uint64_t sub_22BF0E094(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 32);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22BF0E120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BF0E134);
}

void *sub_22BF0E134(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 32);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_22BF0E1B8()
{
  sub_22BF047BC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_22BF0E268()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BF0E284(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WordPressLoginView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF0E2E8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WordPressLoginView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22BF0E348(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WordPressLoginView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF0E3AC()
{
  return sub_22BF0E754(sub_22BF0BD18);
}

uint64_t sub_22BF0E3C8()
{
  uint64_t v1 = type metadata accessor for WordPressLoginView();
  OUTLINED_FUNCTION_1_0(v1);
  return (*(uint64_t (**)(void))(v0
                                           + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))))(0);
}

uint64_t sub_22BF0E414()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = type metadata accessor for WordPressLoginView();
  OUTLINED_FUNCTION_1_0(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_22BF04A14;
  return sub_22BF0CD9C();
}

unint64_t sub_22BF0E4BC()
{
  unint64_t result = qword_268491B18;
  if (!qword_268491B18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491B10);
    sub_22BEF96F8(&qword_268491B20, &qword_268491B28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491B18);
  }
  return result;
}

uint64_t sub_22BF0E554(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22BF0E59C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_22BF0E5B0()
{
  return sub_22BF0E754((uint64_t (*)(uint64_t))sub_22BF0C2EC);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = type metadata accessor for WordPressLoginView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 32);
  uint64_t v6 = sub_22BF59C28();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914E0);
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_22BF0E73C()
{
  return sub_22BF0E754((uint64_t (*)(uint64_t))sub_22BF0CA1C);
}

uint64_t sub_22BF0E754(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for WordPressLoginView();
  OUTLINED_FUNCTION_1_0(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return a1(v4);
}

uint64_t sub_22BF0E7B8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_22BF0E7D0()
{
  return sub_22BEF96F8(&qword_268491B50, &qword_268491B58);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_22BF5A2A8();
}

uint64_t sub_22BF0E844@<X0>(uint64_t **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  uint64_t v5 = (*a1)[2];
  uint64_t v6 = (*a1)[3];
  char v7 = *((unsigned char *)*a1 + 32);
  uint64_t v8 = *v2;
  uint64_t v9 = v2[1];
  uint64_t v10 = v2[2];
  uint64_t v11 = v2[3];
  LOBYTE(v2) = *((unsigned char *)v2 + 32);
  uint64_t v12 = a1[2];
  uint64_t v13 = a1[3];
  uint64_t v14 = *v12;
  uint64_t v15 = v12[1];
  uint64_t v16 = v12[2];
  uint64_t v17 = v12[3];
  LOBYTE(v12) = *((unsigned char *)v12 + 32);
  uint64_t v19 = *v13;
  uint64_t v18 = v13[1];
  uint64_t v21 = v13[2];
  uint64_t v20 = v13[3];
  uint64_t v22 = a1[4];
  uint64_t v23 = *v22;
  uint64_t v25 = v22[2];
  uint64_t v24 = v22[1];
  uint64_t v28 = v22[3];
  LOBYTE(v22) = *((unsigned char *)v22 + 32);
  char v26 = *((unsigned char *)v13 + 32);
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v3;
  *(void *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v6;
  *(unsigned char *)(a2 + 32) = v7;
  *(void *)(a2 + 40) = v8;
  *(void *)(a2 + 48) = v9;
  *(void *)(a2 + 56) = v10;
  *(void *)(a2 + 64) = v11;
  *(unsigned char *)(a2 + 72) = (_BYTE)v2;
  *(void *)(a2 + 80) = v14;
  *(void *)(a2 + 88) = v15;
  *(void *)(a2 + 96) = v16;
  *(void *)(a2 + 104) = v17;
  *(unsigned char *)(a2 + 112) = (_BYTE)v12;
  *(void *)(a2 + 120) = v19;
  *(void *)(a2 + 128) = v18;
  *(void *)(a2 + 136) = v21;
  *(void *)(a2 + 144) = v20;
  *(unsigned char *)(a2 + 152) = v26;
  *(void *)(a2 + 160) = v23;
  *(void *)(a2 + 168) = v24;
  *(void *)(a2 + 176) = v25;
  *(void *)(a2 + 184) = v28;
  *(unsigned char *)(a2 + 192) = (_BYTE)v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22BF18078(v19, v18);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_22BF0E974(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491C20);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_3_4();
  uint64_t v6 = sub_22BF5A5E8();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v6);
  char v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  _OWORD v8[3] = 0;
  v8[4] = &unk_268491C30;
  v8[5] = v7;
  sub_22BF16AD4(v2, (uint64_t)&unk_268491C40, (uint64_t)v8);
  return swift_release();
}

uint64_t WFSSHKeyParameter.view(with:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491B60);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_3_4();
  id v2 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491B68);
  sub_22BEF96F8(&qword_268491B70, &qword_268491B68);
  sub_22BF59C08();
  sub_22BEF96F8(&qword_268491B78, &qword_268491B60);
  return sub_22BF5A338();
}

uint64_t sub_22BF0EBA0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491C90);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491C98);
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v5);
  sub_22BF00710(0, &qword_268491C68);
  id v6 = a1;
  swift_retain();
  return sub_22BF59C18();
}

uint64_t sub_22BF0EC88()
{
  return sub_22BF0EBA0(*(void **)(v0 + 16));
}

uint64_t WFSSHKeyParameter.moduleSummarySlots(for:)()
{
  sub_22BF00710(0, &qword_268491B80);
  id v1 = objc_msgSend(v0, sel_localizedLabel);
  uint64_t v2 = sub_22BF5A4C8();
  uint64_t v4 = v3;

  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v5 = (id)qword_2684922C8;
  id v6 = (void *)sub_22BF5A4A8();
  char v7 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v6, v7, 0);

  uint64_t v9 = sub_22BF5A4C8();
  uint64_t v11 = v10;

  uint64_t v12 = (void *)sub_22BF5A4A8();
  id v13 = sub_22BF0EEB0(v2, v4, v9, v11, v12);
  id v14 = objc_msgSend(self, sel_sharedKeyPair);
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = objc_msgSend(v14, sel_localizedDescription);
    uint64_t v17 = sub_22BF5A4C8();
    uint64_t v19 = v18;

    sub_22BF16DC0(0, v17, v19, v13);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491B88);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_22BF62EA0;
  *(void *)(v20 + 32) = v13;
  uint64_t v22 = v20;
  sub_22BF5A578();
  return v22;
}

id sub_22BF0EEB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a2)
  {
    char v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    id v8 = 0;
    goto LABEL_6;
  }
  char v7 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  id v8 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
LABEL_6:
  id v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_slotWithLocalizedName_localizedPlaceholder_key_, v7, v8, a5);

  return v9;
}

id sub_22BF0EF6C(void *a1)
{
  id v1 = a1;
  swift_unknownObjectRetain();
  uint64_t v2 = WFSSHKeyParameter.moduleSummarySlots(for:)();
  swift_unknownObjectRelease();

  if (v2)
  {
    sub_22BF00710(0, &qword_268491B80);
    uint64_t v3 = (void *)sub_22BF5A558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

uint64_t sub_22BF0F00C()
{
  static WFSSHKeyParameter.moduleSummaryEditorClass()();
  return swift_getObjCClassFromMetadata();
}

uint64_t sub_22BF0F034(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC11ActionKitUI28SSHKeyParameterSummaryEditor_modal) = a1;
  return MEMORY[0x270F9A758]();
}

void sub_22BF0F048()
{
  uint64_t v2 = sub_22BF59BA8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  char v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22BF59BB8();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3_4();
  uint64_t v15 = v0;
  (*(void (**)(uint64_t, void))(v9 + 104))(v1, *MEMORY[0x263F86550]);
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v7, *MEMORY[0x263F86548], v2);
  objc_allocWithZone((Class)sub_22BF59BE8());
  uint64_t v10 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491C60);
  type metadata accessor for SSHKeyParameterSummaryEditor();
  sub_22BF00710(0, &qword_268491C68);
  sub_22BF00710(0, &qword_268491C70);
  sub_22BEF96F8(&qword_268491C78, &qword_268491C60);
  uint64_t v11 = sub_22BF59BF8();
  sub_22BF0F034(v11);
  uint64_t v12 = *(void **)&v10[OBJC_IVAR____TtC11ActionKitUI28SSHKeyParameterSummaryEditor_modal];
  if (v12)
  {
    id v13 = v12;
    sub_22BF59BD8();
  }
}

uint64_t sub_22BF0F26C()
{
  return sub_22BF59D18();
}

uint64_t sub_22BF0F33C()
{
  uint64_t v0 = sub_22BF59E98();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SSHKeyConfigurationView();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF0FAFC((uint64_t)v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F19698], v0);
  sub_22BF17D9C(&qword_268491C88, (void (*)(uint64_t))type metadata accessor for SSHKeyConfigurationView);
  sub_22BF5A1A8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_22BF172BC((uint64_t)v6);
}

uint64_t sub_22BF0F544()
{
  OUTLINED_FUNCTION_4();
  v1[17] = v0;
  sub_22BF5A5C8();
  v1[18] = sub_22BF5A5B8();
  uint64_t v3 = sub_22BF5A588();
  v1[19] = v3;
  v1[20] = v2;
  return MEMORY[0x270FA2498](sub_22BF0F5D8, v3, v2);
}

uint64_t sub_22BF0F5D8()
{
  uint64_t v1 = *(void *)(v0 + 136);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_22BF0F6D4;
  uint64_t v2 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_22BF0F82C;
  *(void *)(v0 + 104) = &block_descriptor_0;
  *(void *)(v0 + 112) = v2;
  uint64_t v3 = type metadata accessor for SSHKeyParameterSummaryEditor();
  *(void *)(v0 + 120) = v1;
  *(void *)(v0 + 128) = v3;
  objc_msgSendSuper2((objc_super *)(v0 + 120), sel_cancelEditingWithCompletionHandler_, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_22BF0F6D4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 152);
  return MEMORY[0x270FA2498](sub_22BF0F7B4, v2, v1);
}

uint64_t sub_22BF0F7B4()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *(void *)(v0 + 136);
  swift_release();
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC11ActionKitUI28SSHKeyParameterSummaryEditor_modal);
  if (v2)
  {
    id v3 = v2;
    sub_22BF59BC8();
  }
  OUTLINED_FUNCTION_3();
  return v4();
}

uint64_t sub_22BF0F82C(uint64_t a1)
{
  return j__swift_continuation_resume(*(void *)(a1 + 32));
}

uint64_t sub_22BF0F8B4(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_22BF5A5C8();
  v2[4] = sub_22BF5A5B8();
  uint64_t v4 = sub_22BF5A588();
  return MEMORY[0x270FA2498](sub_22BF0F94C, v4, v3);
}

uint64_t sub_22BF0F94C()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_22BF0F9F8;
  return sub_22BF0F544();
}

uint64_t sub_22BF0F9F8()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = *(void (***)(void))(v1 + 40);
  id v3 = *(void **)(v1 + 24);
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_2();
  *uint64_t v5 = v4;
  swift_task_dealloc();

  v2[2](v2);
  _Block_release(v2);
  OUTLINED_FUNCTION_3();
  return v6();
}

uint64_t sub_22BF0FAFC@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(self, sel_sharedKeyPair);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  id v5 = v1;
  return sub_22BF0FBEC((uint64_t)sub_22BF16E98, v4, a1);
}

void sub_22BF0FB98(void *a1)
{
  id v1 = objc_msgSend(a1, sel_parameter);
  objc_msgSend(v1, sel_attributesDidChange);
}

uint64_t sub_22BF0FBEC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491C00);
  sub_22BF5A2A8();
  *(_OWORD *)a3 = v10;
  *(void *)(a3 + 16) = a1;
  *(void *)(a3 + 24) = a2;
  uint64_t v6 = type metadata accessor for SSHKeyConfigurationView();
  char v7 = (uint64_t *)(a3 + *(int *)(v6 + 24));
  *char v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491C08);
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = a3 + *(int *)(v6 + 28);
  uint64_t result = sub_22BF5A2A8();
  *(unsigned char *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = *((void *)&v10 + 1);
  return result;
}

id sub_22BF0FCC0(void *a1, uint64_t a2, char a3)
{
  *(void *)&v3[OBJC_IVAR____TtC11ActionKitUI28SSHKeyParameterSummaryEditor_modal] = 0;
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for SSHKeyParameterSummaryEditor();
  id v7 = objc_msgSendSuper2(&v9, sel_initWithParameter_arrayIndex_processing_, a1, a2, a3 & 1);

  return v7;
}

id sub_22BF0FD78()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SSHKeyParameterSummaryEditor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22BF0FDBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v57 = a1;
  uint64_t v3 = type metadata accessor for SSHKeyConfigurationView();
  uint64_t v4 = v3 - 8;
  uint64_t v52 = *(void *)(v3 - 8);
  uint64_t v51 = *(void *)(v52 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v50 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491CC8);
  uint64_t v6 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491CD0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v53 = v9;
  uint64_t v54 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v48 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491CD8);
  uint64_t v55 = *(void *)(v12 - 8);
  uint64_t v56 = v12;
  MEMORY[0x270FA5388](v12);
  char v49 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491CE0);
  sub_22BEF96F8(&qword_268491CE8, &qword_268491CE0);
  sub_22BF5A098();
  uint64_t v58 = v2;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491CF0);
  uint64_t v15 = sub_22BEF96F8(&qword_268491CF8, &qword_268491CC8);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491D00);
  uint64_t v17 = sub_22BEF96F8((unint64_t *)&unk_268491D08, &qword_268491D00);
  uint64_t v60 = v16;
  uint64_t v61 = v17;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v19 = v47;
  sub_22BF5A1E8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  uint64_t v20 = v2 + *(int *)(v4 + 36);
  char v21 = *(unsigned char *)v20;
  uint64_t v22 = *(void *)(v20 + 8);
  LOBYTE(v64) = v21;
  uint64_t v65 = v22;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491740);
  sub_22BF5A2D8();
  uint64_t v23 = v2;
  uint64_t v24 = v50;
  sub_22BF17C80(v23, v50);
  unint64_t v25 = (*(unsigned __int8 *)(v52 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
  uint64_t v26 = swift_allocObject();
  sub_22BF17CE8(v24, v26 + v25);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491D18);
  uint64_t v60 = v19;
  uint64_t v61 = v14;
  uint64_t v62 = v15;
  uint64_t v63 = OpaqueTypeConformance2;
  uint64_t v28 = v49;
  uint64_t v29 = swift_getOpaqueTypeConformance2();
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491D20);
  uint64_t v31 = sub_22BF5A068();
  uint64_t v32 = sub_22BEF96F8(&qword_268491D28, &qword_268491D20);
  uint64_t v33 = sub_22BF17D9C(&qword_268491230, MEMORY[0x263F1A128]);
  uint64_t v60 = v30;
  uint64_t v61 = v31;
  uint64_t v34 = v53;
  uint64_t v62 = v32;
  uint64_t v63 = v33;
  uint64_t v35 = swift_getOpaqueTypeConformance2();
  id v36 = v48;
  sub_22BF5A1D8();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v36, v34);
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v37 = (id)qword_2684922C8;
  uint64_t v38 = (void *)sub_22BF5A4A8();
  uint64_t v39 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v40 = objc_msgSend(v37, sel_localizedStringForKey_value_table_, v38, v39, 0);

  uint64_t v41 = sub_22BF5A4C8();
  uint64_t v43 = v42;

  uint64_t v64 = v41;
  uint64_t v65 = v43;
  uint64_t v60 = v34;
  uint64_t v61 = v27;
  uint64_t v62 = v29;
  uint64_t v63 = v35;
  swift_getOpaqueTypeConformance2();
  sub_22BEF934C();
  uint64_t v44 = v56;
  sub_22BF5A178();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v28, v44);
}

uint64_t sub_22BF10494@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v27 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491DB0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v26 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491DB8);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v26 - v14;
  long long v28 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491DA8);
  uint64_t v16 = sub_22BF5A2B8();
  uint64_t v17 = v29;
  if (v29)
  {
    uint64_t v26 = (uint64_t)&v26;
    MEMORY[0x270FA5388](v16);
    *(&v26 - 2) = (uint64_t)v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268491DE0);
    sub_22BEF96F8(&qword_268491DE8, &qword_268491DE0);
    sub_22BF5A3A8();

    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 1;
  }
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491DC0);
  uint64_t v20 = __swift_storeEnumTagSinglePayload((uint64_t)v15, v18, 1, v19);
  MEMORY[0x270FA5388](v20);
  *(&v26 - 2) = (uint64_t)v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491DC8);
  sub_22BEF96F8(&qword_268491DD0, &qword_268491DC8);
  sub_22BF5A3A8();
  sub_22BF04EE4((uint64_t)v15, (uint64_t)v13, &qword_268491DB8);
  char v21 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v21(v7, v9, v3);
  uint64_t v22 = v27;
  sub_22BF04EE4((uint64_t)v13, v27, &qword_268491DB8);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491DD8);
  v21((char *)(v22 + *(int *)(v23 + 48)), v7, v3);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v4 + 8);
  v24(v9, v3);
  sub_22BF04F40((uint64_t)v15, &qword_268491DB8);
  v24(v7, v3);
  return sub_22BF04F40((uint64_t)v13, &qword_268491DB8);
}

uint64_t sub_22BF10814(uint64_t a1)
{
  uint64_t v2 = sub_22BF59FF8();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491D00);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22BF59FE8();
  uint64_t v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491260);
  sub_22BEF96F8(&qword_2684921E0, (uint64_t *)&unk_268491260);
  sub_22BF59CA8();
  uint64_t v7 = sub_22BEF96F8((unint64_t *)&unk_268491D08, &qword_268491D00);
  MEMORY[0x230F582C0](v6, v3, v7);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_22BF109DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SSHKeyConfigurationView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v5 = (id)qword_2684922C8;
  uint64_t v6 = (void *)sub_22BF5A4A8();
  uint64_t v7 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v6, v7, 0);

  uint64_t v9 = sub_22BF5A4C8();
  uint64_t v11 = v10;

  v15[0] = v9;
  v15[1] = v11;
  sub_22BF17C80(a1, (uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v13 = swift_allocObject();
  sub_22BF17CE8((uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  sub_22BEF934C();
  return sub_22BF5A308();
}

uint64_t sub_22BF10BD4()
{
  uint64_t v0 = sub_22BF59CD8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SSHKeyConfigurationView();
  sub_22BF1CD64((uint64_t)v3);
  sub_22BF59CC8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_22BF10CB8(uint64_t a1)
{
  uint64_t v2 = sub_22BF5A068();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491D20);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = a1;
  sub_22BF17DEC();
  sub_22BF59D18();
  sub_22BF5A058();
  sub_22BEF96F8(&qword_268491D28, &qword_268491D20);
  sub_22BF17D9C(&qword_268491230, MEMORY[0x263F1A128]);
  sub_22BF5A0F8();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

void *sub_22BF10EE4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for SSHKeyConfigurationView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  sub_22BF17C80(a1, (uint64_t)&__src[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8]);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = (void *)swift_allocObject();
  sub_22BF17CE8((uint64_t)&__src[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8], (uint64_t)v8 + v7);
  sub_22BF11DF4(sub_22BF17E3C, v8, __src);
  return memcpy(a2, __src, 0x88uLL);
}

uint64_t sub_22BF10FFC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v4 = (id)qword_2684922C8;
  uint64_t v5 = (void *)sub_22BF5A4A8();
  uint64_t v6 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, v6, 0);

  uint64_t v8 = sub_22BF5A4C8();
  uint64_t v66 = v9;

  id v10 = objc_msgSend(a1, sel_localizedType);
  uint64_t v11 = sub_22BF5A4C8();
  uint64_t v64 = v12;
  uint64_t v65 = v11;

  sub_22BF5A4E8();
  id v13 = (id)qword_2684922C8;
  uint64_t v14 = (void *)sub_22BF5A4A8();
  uint64_t v15 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, v15, 0);

  uint64_t v17 = sub_22BF5A4C8();
  uint64_t v62 = v18;
  uint64_t v63 = v17;

  id v19 = objc_msgSend(a1, sel_publicKeyFingerprintWithType_, 0);
  uint64_t v20 = sub_22BF5A4C8();
  uint64_t v60 = v21;
  uint64_t v61 = v20;

  sub_22BF5A4E8();
  id v22 = (id)qword_2684922C8;
  uint64_t v23 = (void *)sub_22BF5A4A8();
  uint64_t v24 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v22, sel_localizedStringForKey_value_table_, v23, v24, 0);

  uint64_t v26 = sub_22BF5A4C8();
  uint64_t v28 = v27;

  id v29 = objc_msgSend(a1, sel_publicKeyFingerprintWithType_, 1);
  uint64_t v30 = sub_22BF5A4C8();
  uint64_t v56 = v31;
  uint64_t v57 = v30;

  id v32 = objc_msgSend(a1, sel_keySize);
  uint64_t v33 = v32;
  uint64_t v67 = v8;
  uint64_t v68 = a2;
  uint64_t v58 = v28;
  uint64_t v59 = v26;
  if (!v32)
  {
    uint64_t v39 = 0;
    uint64_t v41 = 0;
LABEL_8:
    uint64_t v43 = 0;
    goto LABEL_9;
  }
  uint64_t v34 = (uint64_t *)objc_msgSend(v32, sel_integerValue);

  if ((uint64_t)v34 < 1)
  {
    uint64_t v39 = 0;
    uint64_t v41 = 0;
    uint64_t v33 = 0;
    goto LABEL_8;
  }
  sub_22BF5A4E8();
  id v35 = (id)qword_2684922C8;
  id v36 = (void *)sub_22BF5A4A8();
  id v37 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v38 = objc_msgSend(v35, sel_localizedStringForKey_value_table_, v36, v37, 0);

  uint64_t v39 = sub_22BF5A4C8();
  uint64_t v41 = v40;

  v82[0] = v34;
  uint64_t v33 = (void *)sub_22BF5A788();
  uint64_t v43 = v42;
LABEL_9:
  sub_22BF5A4E8();
  id v44 = (id)qword_2684922C8;
  uint64_t v45 = (void *)sub_22BF5A4A8();
  uint64_t v46 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v47 = objc_msgSend(v44, sel_localizedStringForKey_value_table_, v45, v46, 0);

  uint64_t v48 = sub_22BF5A4C8();
  uint64_t v50 = v49;

  id v51 = objc_msgSend(a1, sel_comment);
  uint64_t v52 = sub_22BF5A4C8();
  uint64_t v54 = v53;

  v80[0] = v67;
  v80[1] = v66;
  v80[2] = v65;
  v80[3] = v64;
  char v81 = 0;
  v78[0] = v63;
  v78[1] = v62;
  v78[2] = v61;
  v78[3] = v60;
  char v79 = 1;
  v82[0] = v80;
  v82[1] = v78;
  v76[0] = v59;
  v76[1] = v58;
  v76[2] = v57;
  v76[3] = v56;
  char v77 = 1;
  uint64_t v71 = v39;
  uint64_t v72 = v41;
  uint64_t v73 = v33;
  uint64_t v74 = v43;
  char v75 = 0;
  v82[2] = v76;
  v82[3] = &v71;
  v69[0] = v48;
  v69[1] = v50;
  v69[2] = v52;
  v69[3] = v54;
  char v70 = 0;
  v82[4] = v69;
  sub_22BF0E844(v82, v68);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22BF18034(v71, v72);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BF1157C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SSHKeyConfigurationView();
  uint64_t v30 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v31 = v4;
  uint64_t v32 = (uint64_t)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491DF0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v27 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491DF8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v27 - v16;
  long long v33 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491DA8);
  sub_22BF5A2B8();
  uint64_t v18 = v34;
  if (v34)
  {
    *(void *)(swift_allocObject() + 16) = v18;
    id v28 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268491E00);
    uint64_t v29 = v5;
    sub_22BEF96F8(&qword_268491E08, &qword_268491E00);
    uint64_t v5 = v29;
    sub_22BF5A2F8();

    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v17, v19, 1, v5);
  uint64_t v20 = v32;
  sub_22BF17C80((uint64_t)v1, v32);
  unint64_t v21 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v22 = swift_allocObject();
  sub_22BF17CE8(v20, v22 + v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491E00);
  sub_22BEF96F8(&qword_268491E08, &qword_268491E00);
  sub_22BF5A2F8();
  sub_22BF04EE4((uint64_t)v17, (uint64_t)v15, &qword_268491DF8);
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v23(v9, v11, v5);
  sub_22BF04EE4((uint64_t)v15, a1, &qword_268491DF8);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491E10);
  v23((char *)(a1 + *(int *)(v24 + 48)), v9, v5);
  id v25 = *(void (**)(char *, uint64_t))(v6 + 8);
  v25(v11, v5);
  sub_22BF04F40((uint64_t)v17, &qword_268491DF8);
  v25(v9, v5);
  return sub_22BF04F40((uint64_t)v15, &qword_268491DF8);
}

void sub_22BF119BC(void *a1)
{
  id v1 = objc_msgSend(a1, sel_publicKey);
  uint64_t v2 = sub_22BF5A4C8();
  uint64_t v4 = v3;

  id v5 = objc_msgSend(self, sel_generalPasteboard);
  sub_22BF18278(v2, v4, v5);
}

uint64_t sub_22BF11A58()
{
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v0 = (id)qword_2684922C8;
  id v1 = (void *)sub_22BF5A4A8();
  uint64_t v2 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, v2, 0);

  sub_22BF5A4C8();
  sub_22BEF934C();
  return sub_22BF5A298();
}

uint64_t sub_22BF11B90()
{
  return sub_22BF5A2C8();
}

uint64_t sub_22BF11BFC()
{
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v0 = (id)qword_2684922C8;
  id v1 = (void *)sub_22BF5A4A8();
  uint64_t v2 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, v2, 0);

  sub_22BF5A4C8();
  sub_22BEF934C();
  return sub_22BF5A298();
}

uint64_t sub_22BF11D34(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268491DA8);
    sub_22BF5A2C8();
    objc_msgSend(self, sel_setSharedKeyPair_, v1);
  }
  type metadata accessor for SSHKeyConfigurationView();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491740);
  return sub_22BF5A2C8();
}

void *sub_22BF11DF4@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  sub_22BF5A2A8();
  char v34 = (char)__src[0];
  id v36 = __src[1];
  swift_retain();
  sub_22BF5A2A8();
  char v33 = (char)__src[0];
  id v32 = __src[1];
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491D38);
  sub_22BF5A2A8();
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_defaultKeyComment);
  uint64_t v6 = (void *)sub_22BF5A4C8();
  uint64_t v8 = v7;

  __src[17] = v6;
  __src[18] = v8;
  sub_22BF5A2A8();
  id v30 = __src[0];
  id v9 = __src[2];
  swift_retain();
  id v31 = __src[1];
  swift_bridgeObjectRetain();
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v10 = (id)qword_2684922C8;
  uint64_t v11 = (void *)sub_22BF5A4A8();
  uint64_t v12 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v10, sel_localizedStringForKey_value_table_, v11, v12, 0);

  uint64_t v29 = (void *)sub_22BF5A4C8();
  uint64_t v15 = v14;

  swift_bridgeObjectRetain();
  sub_22BF5A4E8();
  id v16 = (id)qword_2684922C8;
  uint64_t v17 = (void *)sub_22BF5A4A8();
  uint64_t v18 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, v18, 0);

  uint64_t v20 = (void *)sub_22BF5A4C8();
  uint64_t v22 = v21;

  swift_bridgeObjectRetain();
  swift_retain();
  id v23 = objc_msgSend(v4, sel_keyFormats);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491DA0);
  uint64_t v24 = sub_22BF5A568();

  if (*(void *)(v24 + 16))
  {
    id v25 = *(void **)(v24 + 32);
    swift_bridgeObjectRelease();
    id v26 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultKeySize);
    id v27 = v26;

    swift_release();
    __src[0] = a1;
    __src[1] = a2;
    LOBYTE(__src[2]) = v34;
    __src[3] = v36;
    LOBYTE(__src[4]) = v33;
    __src[5] = v32;
    __src[6] = v25;
    __src[7] = 0;
    __src[8] = v26;
    __src[9] = 0;
    __src[10] = v30;
    __src[11] = v31;
    __src[12] = v9;
    __src[13] = v29;
    __src[14] = v15;
    __src[15] = v20;
    __src[16] = v22;
    sub_22BF17E8C((uint64_t)__src);
    swift_release();
    swift_release();

    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_22BF17F38((uint64_t)__src);
    return memcpy(a3, __src, 0x88uLL);
  }
  else
  {
    uint64_t result = (void *)swift_bridgeObjectRelease();
    __break(1u);
  }
  return result;
}

uint64_t sub_22BF121E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v29 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491F90);
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491F98);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491FA0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491FA8);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(v2 + 32) & 1) != 0 && (uint64_t v16 = sub_22BF5A508(), v16 >= 13))
  {
    id v28 = &v24;
    MEMORY[0x270FA5388](v16);
    id v27 = &v24 - 4;
    *(&v24 - 2) = v2;
    sub_22BF1265C((_OWORD *)v2, (uint64_t)v11);
    uint64_t v26 = sub_22BEF96F8(&qword_268491FC0, &qword_268491F90);
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491FC8);
    uint64_t v17 = v13;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491FD0);
    uint64_t v19 = sub_22BEF96F8(&qword_268491FD8, &qword_268491FD0);
    unint64_t v20 = sub_22BEF934C();
    uint64_t v30 = v18;
    uint64_t v31 = MEMORY[0x263F8D310];
    uint64_t v32 = v19;
    unint64_t v33 = v20;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v30 = v25;
    uint64_t v31 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    sub_22BF59D08();
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v8, v15, v12);
    swift_storeEnumTagMultiPayload();
    sub_22BEF96F8(&qword_268491FB8, &qword_268491FA8);
    sub_22BF59F98();
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v15, v12);
  }
  else
  {
    *(void *)id v5 = sub_22BF59EA8();
    *((void *)v5 + 1) = 0;
    v5[16] = 1;
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491FB0);
    sub_22BF12CA4(v2, (uint64_t)&v5[*(int *)(v23 + 44)]);
    sub_22BF04EE4((uint64_t)v5, (uint64_t)v8, &qword_268491F90);
    swift_storeEnumTagMultiPayload();
    sub_22BEF96F8(&qword_268491FB8, &qword_268491FA8);
    sub_22BEF96F8(&qword_268491FC0, &qword_268491F90);
    sub_22BF59F98();
    return sub_22BF04F40((uint64_t)v5, &qword_268491F90);
  }
}

uint64_t sub_22BF1265C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v20 = sub_22BF59E98();
  uint64_t v3 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  id v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491FD0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491FC8);
  uint64_t v10 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491FE0);
  sub_22BF193E4();
  sub_22BF5A098();
  long long v23 = *a1;
  uint64_t v13 = sub_22BEF96F8(&qword_268491FD8, &qword_268491FD0);
  unint64_t v14 = sub_22BEF934C();
  sub_22BF5A178();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v15 = v20;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F19698], v20);
  *(void *)&long long v23 = v6;
  *((void *)&v23 + 1) = MEMORY[0x263F8D310];
  uint64_t v24 = v13;
  unint64_t v25 = v14;
  swift_getOpaqueTypeConformance2();
  uint64_t v16 = v19;
  sub_22BF5A1A8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v16);
}

uint64_t sub_22BF1297C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = sub_22BF5A048();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492020);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491FF8);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = *(void *)(a1 + 24);
  uint64_t v28 = v15;
  uint64_t v29 = v16;
  sub_22BEF934C();
  swift_bridgeObjectRetain();
  uint64_t v28 = sub_22BF5A0E8();
  uint64_t v29 = v17;
  char v30 = v18 & 1;
  uint64_t v31 = v19;
  sub_22BF5A038();
  sub_22BF5A158();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_22BF0E59C(v28, v29, v30);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v14, v10, v7);
  uint64_t v21 = &v14[*(int *)(v12 + 44)];
  *(void *)uint64_t v21 = KeyPath;
  *((void *)v21 + 1) = 1;
  v21[16] = 0;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v22 = swift_getKeyPath();
  uint64_t v23 = v27;
  sub_22BF04EE4((uint64_t)v14, v27, &qword_268491FF8);
  uint64_t v24 = (uint64_t *)(v23 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268491FE0) + 36));
  uint64_t *v24 = v22;
  v24[1] = 0x3FE0000000000000;
  return sub_22BF04F40((uint64_t)v14, &qword_268491FF8);
}

uint64_t sub_22BF12C54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_22BF59EA8();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491FB0);
  return sub_22BF12CA4(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_22BF12CA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v76 = sub_22BF5A048();
  uint64_t v4 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492020);
  uint64_t v7 = *(void *)(v69 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v69);
  uint64_t v68 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v62 - v10;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492028);
  MEMORY[0x270FA5388](v70);
  uint64_t v72 = (uint64_t *)((char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492030);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  char v18 = (char *)&v62 - v17;
  uint64_t v19 = *(void *)(a1 + 8);
  uint64_t v77 = *(void *)a1;
  uint64_t v78 = v19;
  sub_22BEF934C();
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_22BF5A0E8();
  uint64_t v73 = v21;
  uint64_t v74 = v20;
  int v71 = v22;
  uint64_t v75 = v23;
  if ((*(unsigned char *)(a1 + 32) & 1) != 0 && sub_22BF5A508() >= 13)
  {
    uint64_t v77 = sub_22BF132A4();
    uint64_t v78 = v24;
    uint64_t v25 = sub_22BF5A0E8();
    uint64_t v27 = v26;
    char v29 = v28 & 1;
    sub_22BF5A268();
    uint64_t v30 = sub_22BF5A0D8();
    uint64_t v68 = v31;
    LODWORD(v67) = v32;
    uint64_t v34 = v33;
    swift_release();
    sub_22BF0E59C(v25, v27, v29);
    swift_bridgeObjectRelease();
    id v35 = v72;
    id v36 = v68;
    *uint64_t v72 = v30;
    v35[1] = (uint64_t)v36;
    *((unsigned char *)v35 + 16) = v67 & 1;
    v35[3] = v34;
    swift_storeEnumTagMultiPayload();
    uint64_t v77 = MEMORY[0x263F1A830];
    uint64_t v78 = v76;
    uint64_t v79 = MEMORY[0x263F1A820];
    uint64_t v80 = MEMORY[0x263F1A0D8];
    swift_getOpaqueTypeConformance2();
    sub_22BF59F98();
  }
  else
  {
    uint64_t v77 = sub_22BF132A4();
    uint64_t v78 = v37;
    uint64_t v38 = sub_22BF5A0E8();
    uint64_t v40 = v39;
    uint64_t v67 = a2;
    char v42 = v41 & 1;
    sub_22BF5A268();
    uint64_t v65 = v11;
    uint64_t v62 = sub_22BF5A0D8();
    uint64_t v63 = v43;
    uint64_t v64 = v7;
    uint64_t v45 = v44;
    uint64_t v66 = v18;
    char v47 = v46;
    swift_release();
    char v48 = v42;
    a2 = v67;
    sub_22BF0E59C(v38, v40, v48);
    swift_bridgeObjectRelease();
    uint64_t v77 = v62;
    uint64_t v78 = v45;
    char v49 = v47 & 1;
    char v18 = v66;
    LOBYTE(v79) = v49;
    uint64_t v80 = v63;
    sub_22BF5A038();
    uint64_t v50 = MEMORY[0x263F1A830];
    uint64_t v51 = MEMORY[0x263F1A820];
    uint64_t v52 = v68;
    uint64_t v53 = v76;
    sub_22BF5A158();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v53);
    sub_22BF0E59C(v77, v78, v79);
    swift_bridgeObjectRelease();
    uint64_t v55 = v64;
    uint64_t v54 = v65;
    uint64_t v56 = v69;
    (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v65, v52, v69);
    (*(void (**)(uint64_t *, char *, uint64_t))(v55 + 16))(v72, v54, v56);
    swift_storeEnumTagMultiPayload();
    uint64_t v77 = v50;
    uint64_t v78 = v53;
    uint64_t v79 = v51;
    uint64_t v80 = MEMORY[0x263F1A0D8];
    swift_getOpaqueTypeConformance2();
    sub_22BF59F98();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
  }
  char v57 = v71 & 1;
  sub_22BF04EE4((uint64_t)v18, (uint64_t)v16, &qword_268492030);
  uint64_t v59 = v73;
  uint64_t v58 = v74;
  *(void *)a2 = v74;
  *(void *)(a2 + 8) = v59;
  *(unsigned char *)(a2 + 16) = v57;
  *(void *)(a2 + 24) = v75;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(qword_268492038);
  sub_22BF04EE4((uint64_t)v16, a2 + *(int *)(v60 + 64), &qword_268492030);
  sub_22BF0E7B8(v58, v59, v57);
  swift_bridgeObjectRetain();
  sub_22BF04F40((uint64_t)v18, &qword_268492030);
  sub_22BF04F40((uint64_t)v16, &qword_268492030);
  sub_22BF0E59C(v58, v59, v57);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BF132A4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if ((*(unsigned char *)(v0 + 32) & 1) != 0 && sub_22BF5A508() >= 13)
  {
    sub_22BF5A518();
    uint64_t v2 = sub_22BF5A548();
    uint64_t v3 = MEMORY[0x230F58770](v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_22BF5A528();
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v1;
}

uint64_t sub_22BF13370@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF121E0(a1);
}

uint64_t sub_22BF133AC()
{
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedDisplayName);
  sub_22BF5A4C8();

  sub_22BF5A4F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BF13428()
{
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedDisplayName);
  uint64_t v1 = sub_22BF5A4C8();
  uint64_t v3 = v2;

  id v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedDisplayName);
  uint64_t v5 = sub_22BF5A4C8();
  uint64_t v7 = v6;

  if (v1 == v5 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_22BF5A7A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_22BF134F8()
{
  sub_22BF5A7F8();
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedDisplayName);
  sub_22BF5A4C8();

  sub_22BF5A4F8();
  swift_bridgeObjectRelease();
  return sub_22BF5A808();
}

uint64_t sub_22BF13584()
{
  return sub_22BF134F8();
}

uint64_t sub_22BF1358C()
{
  return sub_22BF133AC();
}

uint64_t sub_22BF13594()
{
  sub_22BF5A7F8();
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedDisplayName);
  sub_22BF5A4C8();

  sub_22BF5A4F8();
  swift_bridgeObjectRelease();
  return sub_22BF5A808();
}

uint64_t sub_22BF1361C()
{
  return sub_22BF13428();
}

uint64_t sub_22BF13628@<X0>(uint64_t a1@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v2 = sub_22BF59E98();
  uint64_t v48 = *(void *)(v2 - 8);
  uint64_t v49 = v2;
  MEMORY[0x270FA5388](v2);
  char v47 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491E18);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491E20);
  uint64_t v40 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  char v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491E28);
  uint64_t v42 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491E30);
  uint64_t v45 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v43 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491E38);
  MEMORY[0x270FA5388](v50);
  uint64_t v51 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491E40);
  sub_22BEF96F8(&qword_268491E48, &qword_268491E40);
  sub_22BF5A098();
  uint64_t v52 = v1;
  uint64_t v54 = v1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491E50);
  uint64_t v15 = sub_22BEF96F8(&qword_268491E58, &qword_268491E18);
  uint64_t v16 = sub_22BEF96F8(&qword_268491E60, &qword_268491E50);
  sub_22BF5A1E8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v17 = (id)qword_2684922C8;
  char v18 = (void *)sub_22BF5A4A8();
  uint64_t v19 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, v19, 0);

  uint64_t v21 = sub_22BF5A4C8();
  uint64_t v23 = v22;

  *(void *)&long long v59 = v21;
  *((void *)&v59 + 1) = v23;
  *(void *)&long long v56 = v4;
  *((void *)&v56 + 1) = v14;
  uint64_t v57 = v15;
  unint64_t v58 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v25 = sub_22BEF934C();
  uint64_t v26 = MEMORY[0x263F8D310];
  uint64_t v27 = v41;
  sub_22BF5A178();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v27);
  uint64_t v29 = v48;
  uint64_t v28 = v49;
  uint64_t v30 = v47;
  (*(void (**)(char *, void, uint64_t))(v48 + 104))(v47, *MEMORY[0x263F19698], v49);
  *(void *)&long long v56 = v27;
  *((void *)&v56 + 1) = v26;
  uint64_t v57 = OpaqueTypeConformance2;
  unint64_t v58 = v25;
  uint64_t v31 = swift_getOpaqueTypeConformance2();
  int v32 = v43;
  uint64_t v33 = v44;
  sub_22BF5A1A8();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v28);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v11, v33);
  uint64_t v34 = v52;
  long long v59 = v52[1];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491740);
  uint64_t v35 = sub_22BF5A2D8();
  MEMORY[0x270FA5388](v35);
  *(&v40 - 2) = (uint64_t)v34;
  *(void *)&long long v56 = v33;
  *((void *)&v56 + 1) = v31;
  swift_getOpaqueTypeConformance2();
  uint64_t v36 = (uint64_t)v51;
  uint64_t v37 = v46;
  sub_22BF5A1B8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v32, v37);
  long long v56 = v34[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491E68);
  sub_22BF5A2B8();
  uint64_t v38 = swift_allocObject();
  memcpy((void *)(v38 + 16), v34, 0x88uLL);
  sub_22BF17E8C((uint64_t)v34);
  sub_22BF18B50();
  sub_22BF18D24();
  sub_22BF5A1F8();
  swift_release();
  return sub_22BF04F40(v36, &qword_268491E38);
}

__n128 sub_22BF13E2C@<Q0>(uint64_t a1@<X8>)
{
  sub_22BF13E98(&v9);
  uint64_t v2 = v11;
  uint64_t v3 = v14;
  uint64_t v4 = v16;
  __n128 result = v10;
  long long v6 = v15;
  long long v7 = v12;
  long long v8 = v13;
  *(void *)a1 = v9;
  *(__n128 *)(a1 + 8) = result;
  *(void *)(a1 + 24) = v2;
  *(_OWORD *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 48) = v8;
  *(void *)(a1 + 64) = v3;
  *(_OWORD *)(a1 + 72) = v6;
  *(void *)(a1 + 88) = v4;
  return result;
}

uint64_t sub_22BF13E98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v4 = (id)qword_2684922C8;
  uint64_t v5 = (void *)sub_22BF5A4A8();
  long long v6 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, v6, 0);

  uint64_t v34 = sub_22BF5A4C8();
  uint64_t v35 = v8;

  uint64_t v33 = swift_allocObject();
  memcpy((void *)(v33 + 16), v2, 0x88uLL);
  uint64_t v9 = v2;
  sub_22BF17E8C((uint64_t)v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491E68);
  sub_22BF5A2B8();
  id v10 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_possibleKeySizes);
  sub_22BF00710(0, &qword_268491EC8);
  unint64_t v11 = sub_22BF5A568();

  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_22BF5A778();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v12)
  {
    sub_22BF5A4E8();
    id v13 = (id)qword_2684922C8;
    uint64_t v14 = (void *)sub_22BF5A4A8();
    long long v15 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, v15, 0);

    uint64_t v17 = sub_22BF5A4C8();
    uint64_t v31 = v18;
    uint64_t v32 = v17;

    uint64_t v19 = swift_allocObject();
    id v20 = v9;
    memcpy((void *)(v19 + 16), v9, 0x88uLL);
    sub_22BF17E8C((uint64_t)v9);
    uint64_t v30 = sub_22BF18FE8;
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v30 = 0;
    uint64_t v19 = 0;
    id v20 = v9;
  }
  sub_22BF5A4E8();
  id v21 = (id)qword_2684922C8;
  uint64_t v22 = (void *)sub_22BF5A4A8();
  uint64_t v23 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v24 = objc_msgSend(v21, sel_localizedStringForKey_value_table_, v22, v23, 0);

  uint64_t v25 = sub_22BF5A4C8();
  uint64_t v27 = v26;

  uint64_t v28 = swift_allocObject();
  memcpy((void *)(v28 + 16), v20, 0x88uLL);
  *a1 = v34;
  a1[1] = v35;
  a1[2] = (uint64_t)sub_22BF18FDC;
  a1[3] = v33;
  a1[4] = v32;
  a1[5] = v31;
  a1[6] = (uint64_t)v30;
  a1[7] = v19;
  a1[8] = v25;
  a1[9] = v27;
  a1[10] = (uint64_t)sub_22BF19074;
  a1[11] = v28;
  sub_22BF17E8C((uint64_t)v20);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22BF1907C(v32, v31);
  sub_22BF190C0(v32, v31);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BF142D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491E90);
  MEMORY[0x270FA5388](v21);
  id v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491E98);
  uint64_t v5 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  id v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22BF59FF8();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491EA0);
  uint64_t v9 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  unint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF59FD8();
  uint64_t v24 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491308);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268491260);
  uint64_t v13 = sub_22BEF96F8(&qword_2684921E0, (uint64_t *)&unk_268491260);
  uint64_t v25 = v12;
  uint64_t v26 = v13;
  swift_getOpaqueTypeConformance2();
  sub_22BF59CA8();
  sub_22BF59FE8();
  uint64_t v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491EB0);
  sub_22BF18E9C();
  sub_22BF59CA8();
  uint64_t v14 = &v4[*(int *)(v21 + 48)];
  uint64_t v15 = v19;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v4, v11, v19);
  id v16 = v14;
  uint64_t v17 = v20;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v16, v7, v20);
  sub_22BF59EC8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v15);
}

uint64_t sub_22BF1462C@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v20 = sub_22BF59D58();
  uint64_t v3 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491260);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v10 = (id)qword_2684922C8;
  unint64_t v11 = (void *)sub_22BF5A4A8();
  uint64_t v12 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v10, sel_localizedStringForKey_value_table_, v11, v12, 0, v19);

  uint64_t v14 = sub_22BF5A4C8();
  uint64_t v16 = v15;

  uint64_t v21 = v14;
  uint64_t v22 = v16;
  uint64_t v17 = swift_allocObject();
  memcpy((void *)(v17 + 16), a1, 0x88uLL);
  sub_22BF17E8C((uint64_t)a1);
  sub_22BEF934C();
  sub_22BF5A308();
  sub_22BF59D38();
  sub_22BEF96F8(&qword_2684921E0, (uint64_t *)&unk_268491260);
  sub_22BF5A188();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_22BF14914@<X0>(uint64_t a1@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v2 = sub_22BF59D58();
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491260);
  uint64_t v39 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491308);
  uint64_t v43 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v37 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v42 = (char *)&v35 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491EC0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491288);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = v1;
  long long v45 = v1[2];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491740);
  sub_22BF5A2B8();
  if (v46 == 1)
  {
    sub_22BF59CB8();
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v14, v18, v15);
    swift_storeEnumTagMultiPayload();
    sub_22BEF96F8(&qword_268491280, &qword_268491288);
    uint64_t v19 = sub_22BEF96F8(&qword_2684921E0, (uint64_t *)&unk_268491260);
    *(void *)&long long v45 = v5;
    *((void *)&v45 + 1) = v19;
    swift_getOpaqueTypeConformance2();
    sub_22BF59F98();
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  else
  {
    uint64_t v35 = v12;
    uint64_t v36 = v5;
    sub_22BF5A4E8();
    if (qword_268490F80 != -1) {
      swift_once();
    }
    id v21 = (id)qword_2684922C8;
    uint64_t v22 = (void *)sub_22BF5A4A8();
    uint64_t v23 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    id v24 = objc_msgSend(v21, sel_localizedStringForKey_value_table_, v22, v23, 0);

    uint64_t v25 = sub_22BF5A4C8();
    uint64_t v27 = v26;

    *(void *)&long long v45 = v25;
    *((void *)&v45 + 1) = v27;
    uint64_t v28 = swift_allocObject();
    uint64_t v29 = (uint64_t)v38;
    memcpy((void *)(v28 + 16), v38, 0x88uLL);
    sub_22BF17E8C(v29);
    sub_22BEF934C();
    sub_22BF5A308();
    sub_22BF59D48();
    uint64_t v30 = sub_22BEF96F8(&qword_2684921E0, (uint64_t *)&unk_268491260);
    uint64_t v31 = v36;
    uint64_t v32 = v37;
    sub_22BF5A188();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v4, v41);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v31);
    uint64_t v34 = v42;
    uint64_t v33 = v43;
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v42, v32, v8);
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v14, v34, v8);
    swift_storeEnumTagMultiPayload();
    sub_22BEF96F8(&qword_268491280, &qword_268491288);
    *(void *)&long long v45 = v31;
    *((void *)&v45 + 1) = v30;
    swift_getOpaqueTypeConformance2();
    sub_22BF59F98();
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v34, v8);
  }
}

uint64_t sub_22BF14F68(const void *a1)
{
  uint64_t v2 = sub_22BF5A258();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  MEMORY[0x270FA5388](v3);
  sub_22BEF934C();
  swift_bridgeObjectRetain();
  sub_22BF5A0E8();
  swift_bridgeObjectRetain();
  sub_22BF5A0E8();
  sub_22BF5A248();
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v4 = (id)qword_2684922C8;
  uint64_t v5 = (void *)sub_22BF5A4A8();
  uint64_t v6 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, v6, 0);

  sub_22BF5A4C8();
  uint64_t v8 = sub_22BF5A0E8();
  uint64_t v10 = v9;
  LOBYTE(v6) = v11 & 1;
  uint64_t v12 = swift_allocObject();
  memcpy((void *)(v12 + 16), a1, 0x88uLL);
  sub_22BF17E8C((uint64_t)a1);
  sub_22BF5A238();
  swift_release();
  sub_22BF0E59C(v8, v10, (char)v6);
  swift_bridgeObjectRelease();
  return sub_22BF5A228();
}

uint64_t sub_22BF15238()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22BF5A418();
  uint64_t v18 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_22BF5A448();
  uint64_t v5 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22BF5A428();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long aBlock = v0[2];
  LOBYTE(v19) = 1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491740);
  sub_22BF5A2C8();
  sub_22BF00710(0, (unint64_t *)&qword_2684914B0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8F060], v8);
  uint64_t v12 = (void *)sub_22BF5A668();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v13 = swift_allocObject();
  memcpy((void *)(v13 + 16), v1, 0x88uLL);
  uint64_t v23 = sub_22BF18D9C;
  uint64_t v24 = v13;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  id v21 = sub_22BF1F2AC;
  uint64_t v22 = &block_descriptor_55;
  uint64_t v14 = _Block_copy(&aBlock);
  sub_22BF17E8C((uint64_t)v1);
  sub_22BF5A438();
  uint64_t v19 = MEMORY[0x263F8EE78];
  sub_22BF17D9C((unint64_t *)&unk_268491700, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914C0);
  sub_22BEF96F8((unint64_t *)&qword_268491710, (uint64_t *)&unk_2684914C0);
  sub_22BF5A6D8();
  MEMORY[0x230F588F0](0, v7, v4, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  return swift_release();
}

uint64_t sub_22BF15614()
{
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultKeySize);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491E80);
  return sub_22BF5A2C8();
}

uint64_t sub_22BF15680(uint64_t a1)
{
  uint64_t v2 = sub_22BF59FC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491F50);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = *(_OWORD *)(a1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491E68);
  sub_22BF5A2D8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491F58);
  sub_22BF19318();
  sub_22BF19364();
  sub_22BF5A318();
  sub_22BF59FB8();
  sub_22BEF96F8(&qword_268491F70, &qword_268491F50);
  sub_22BF5A138();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_22BF158D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491F58);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_keyFormats);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491DA0);
  uint64_t v7 = sub_22BF5A568();

  int64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    uint64_t v15 = a1;
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_22BF16C44(0, v8, 0);
    uint64_t v9 = 0;
    uint64_t v10 = v16;
    unint64_t v11 = *(void *)(v16 + 16);
    do
    {
      uint64_t v12 = *(void *)(v7 + 8 * v9 + 32);
      uint64_t v16 = v10;
      unint64_t v13 = *(void *)(v10 + 24);
      if (v11 >= v13 >> 1)
      {
        sub_22BF16C44((char *)(v13 > 1), v11 + 1, 1);
        uint64_t v10 = v16;
      }
      ++v9;
      *(void *)(v10 + 16) = v11 + 1;
      *(void *)(v10 + 8 * v11++ + 32) = v12;
    }
    while (v8 != v9);
    swift_bridgeObjectRelease();
    a1 = v15;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  uint64_t v16 = v10;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491F78);
  sub_22BEF96F8(&qword_268491F80, &qword_268491F78);
  sub_22BF19318();
  sub_22BF5A378();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
}

uint64_t sub_22BF15B50@<X0>(uint64_t a1@<X8>)
{
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedDisplayName);
  sub_22BF5A4C8();

  sub_22BEF934C();
  uint64_t result = sub_22BF5A0E8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_22BF15BDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v12[1] = a2;
  uint64_t v3 = sub_22BF59FC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491ED0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v13 = *(_OWORD *)(a1 + 64);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491E80);
  sub_22BF5A2D8();
  v12[4] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491D38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491ED8);
  sub_22BF1916C(&qword_268491EE0, &qword_268491D38, (void (*)(void))sub_22BF1910C);
  sub_22BF1916C(&qword_268491EF0, &qword_268491ED8, (void (*)(void))sub_22BF191D8);
  sub_22BF5A318();
  sub_22BF59FB8();
  sub_22BEF96F8(&qword_268491F38, &qword_268491ED0);
  sub_22BF5A138();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_22BF15EB4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491E68);
  sub_22BF5A2B8();
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_possibleKeySizes);
  sub_22BF00710(0, &qword_268491EC8);
  sub_22BF5A568();

  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491F40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491F00);
  sub_22BEF96F8(&qword_268491F48, &qword_268491F40);
  sub_22BF1910C();
  sub_22BF191D8();
  return sub_22BF5A378();
}

id sub_22BF16000@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = *a1;
  id v4 = objc_msgSend(*a1, sel_stringValue);
  sub_22BF5A4C8();

  sub_22BEF934C();
  *(void *)a2 = sub_22BF5A0E8();
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  *(void *)(a2 + 24) = v7;
  *(void *)(a2 + 32) = v3;
  *(void *)(a2 + 40) = v3;
  id v8 = v3;
  return v8;
}

uint64_t sub_22BF160AC()
{
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v0 = (id)qword_2684922C8;
  uint64_t v1 = (void *)sub_22BF5A4A8();
  id v2 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, v2, 0);

  sub_22BF5A4C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
  sub_22BF5A2D8();
  sub_22BEF934C();
  return sub_22BF5A408();
}

uint64_t sub_22BF16248()
{
  return sub_22BF5A2C8();
}

uint64_t sub_22BF16298(uint64_t a1)
{
  uint64_t v2 = sub_22BF5A418();
  uint64_t v19 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_22BF5A448();
  uint64_t v5 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long aBlock = *(_OWORD *)(a1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491E68);
  sub_22BF5A2B8();
  long long aBlock = *(_OWORD *)(a1 + 64);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491E80);
  sub_22BF5A2B8();
  id v8 = v25;
  if (v25)
  {
    id v9 = objc_msgSend(v25, sel_integerValue);
  }
  else
  {
    id v9 = 0;
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  long long aBlock = *(_OWORD *)(a1 + 80);
  id v21 = *(uint64_t (**)())(a1 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491510);
  sub_22BF5A2B8();
  unint64_t v11 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(ObjCClassFromMetadata, sel_generateKeyPairWithKeySize_comment_, v9, v11);

  sub_22BF00710(0, (unint64_t *)&qword_2684914B0);
  long long v13 = (void *)sub_22BF5A648();
  uint64_t v14 = swift_allocObject();
  memcpy((void *)(v14 + 16), (const void *)a1, 0x88uLL);
  *(void *)(v14 + 152) = v12;
  uint64_t v23 = sub_22BF18E44;
  uint64_t v24 = v14;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  id v21 = sub_22BF1F2AC;
  uint64_t v22 = &block_descriptor_61;
  uint64_t v15 = _Block_copy(&aBlock);
  sub_22BF17E8C(a1);
  id v16 = v12;
  swift_release();
  sub_22BF5A438();
  *(void *)&long long aBlock = MEMORY[0x263F8EE78];
  sub_22BF17D9C((unint64_t *)&unk_268491700, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914C0);
  sub_22BEF96F8((unint64_t *)&qword_268491710, (uint64_t *)&unk_2684914C0);
  sub_22BF5A6D8();
  MEMORY[0x230F588F0](0, v7, v4, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v18);
}

uint64_t sub_22BF1667C@<X0>(uint64_t a1@<X8>)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_22BF13628(a1);
}

uint64_t sub_22BF166C0@<X0>(uint64_t a1@<X5>, uint64_t a2@<X8>)
{
  v14[0] = a2;
  uint64_t v3 = sub_22BF5A3B8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  id v9 = (char *)v14 - v8;
  sub_22BF168BC((uint64_t)&v18);
  long long v15 = v18;
  char v16 = v19;
  uint64_t v17 = v20;
  uint64_t v10 = MEMORY[0x263F1A820];
  sub_22BF5A388();
  v14[1] = v10;
  v14[2] = a1;
  v14[3] = MEMORY[0x263F1BA00];
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_22BEF41D4(v7, v3, WitnessTable);
  id v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, v3);
  sub_22BEF41D4(v9, v3, WitnessTable);
  return ((uint64_t (*)(char *, uint64_t))v12)(v9, v3);
}

uint64_t sub_22BF168BC@<X0>(uint64_t a1@<X8>)
{
  sub_22BEF934C();
  swift_bridgeObjectRetain();
  uint64_t result = sub_22BF5A0E8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_22BF16928@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22BF166C0(*(void *)(a1 + 24), a2);
}

uint64_t sub_22BF1693C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  char v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *char v4 = v3;
  v4[1] = sub_22BF19A78;
  return v6();
}

uint64_t sub_22BF16A08(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_22BF19A78;
  return v7();
}

uint64_t sub_22BF16AD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BF5A5E8();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_22BF04F40(a1, &qword_268491C20);
  }
  else
  {
    sub_22BF5A5D8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22BF5A588();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

char *sub_22BF16C44(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_22BF16C64(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_22BF16C64(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268491F88);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  long long v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[8 * v8] <= v12) {
      memmove(v12, v13, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_22BF16D5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_22BF59E58();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_22BF16D90()
{
  return sub_22BF59E68();
}

void sub_22BF16DC0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = (id)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  objc_msgSend(a4, sel_populateWithIcon_string_, a1, v6);
}

uint64_t type metadata accessor for SSHKeyParameterSummaryEditor()
{
  return self;
}

uint64_t sub_22BF16E60()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22BF16E98()
{
  sub_22BF0FB98(*(void **)(v0 + 16));
}

uint64_t type metadata accessor for SSHKeyConfigurationView()
{
  uint64_t result = qword_268491CB0;
  if (!qword_268491CB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22BF16EE8()
{
  return sub_22BF59E08();
}

uint64_t sub_22BF16F0C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22BF16F4C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_9(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_22BEF9BFC;
  id v6 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_268491C10 + dword_268491C10);
  return v6(v1, v2);
}

uint64_t sub_22BF16FF8()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_9(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_22BF19A78;
  int64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268491C28 + dword_268491C28);
  return v7(v1, v2, v3);
}

uint64_t objectdestroy_7Tm_0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22BF170F8(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  int64_t v7 = (void *)OUTLINED_FUNCTION_9(v6);
  *int64_t v7 = v8;
  v7[1] = sub_22BF19A78;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268491C38 + dword_268491C38);
  return v9(a1, v3, v4, v5);
}

uint64_t sub_22BF171C0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22BF171F8(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_9(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_22BEF9BFC;
  int64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268491C48 + dword_268491C48);
  return v7(a1, v3);
}

uint64_t sub_22BF172AC()
{
  return sub_22BF0F26C();
}

uint64_t sub_22BF172B4()
{
  return sub_22BF0F33C();
}

uint64_t sub_22BF172BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SSHKeyConfigurationView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_22BF17318(char *a1, char **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
  }
  else
  {
    uint64_t v8 = a2[3];
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *((void *)a1 + 3) = v8;
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (char **)((char *)a2 + v9);
    id v12 = v5;
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268491C08);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_22BF59CD8();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v10, v11, v13);
    }
    else
    {
      *(void *)uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = *(int *)(a3 + 28);
    long long v15 = &a1[v14];
    uint64_t v16 = (uint64_t)a2 + v14;
    *long long v15 = *(unsigned char *)v16;
    *((void *)v15 + 1) = *(void *)(v16 + 8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_22BF17484(id *a1, uint64_t a2)
{
  swift_release();
  swift_release();
  int v4 = (char *)a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491C08);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_22BF59CD8();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

uint64_t sub_22BF17550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  id v11 = v6;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491C08);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_22BF59CD8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
  }
  else
  {
    *uint64_t v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(unsigned char *)uint64_t v14 = *(unsigned char *)v15;
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_retain();
  return a1;
}

uint64_t sub_22BF17678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v9 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v9;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 24);
    id v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_22BF04F40(a1 + v10, &qword_268491C08);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268491C08);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_22BF59CD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *id v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(unsigned char *)uint64_t v15 = *(unsigned char *)v16;
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_22BF177CC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491C08);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_22BF59CD8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_22BF178BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 24);
    id v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_22BF04F40(a1 + v7, &qword_268491C08);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491C08);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_22BF59CD8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(unsigned char *)uint64_t v13 = *(unsigned char *)v14;
  *(void *)(v13 + 8) = *(void *)(v14 + 8);
  swift_release();
  return a1;
}

uint64_t sub_22BF17A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BF17A18);
}

uint64_t sub_22BF17A18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491CA0);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22BF17AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BF17AB8);
}

uint64_t sub_22BF17AB8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491CA0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_22BF17B3C()
{
  sub_22BF17BE0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22BF17BE0()
{
  if (!qword_268491CC0)
  {
    sub_22BF59CD8();
    unint64_t v0 = sub_22BF59C78();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268491CC0);
    }
  }
}

uint64_t sub_22BF17C38()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BF17C54@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF10494(a1);
}

uint64_t sub_22BF17C78()
{
  return sub_22BF10814(*(void *)(v0 + 16));
}

uint64_t sub_22BF17C80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SSHKeyConfigurationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF17CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SSHKeyConfigurationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF17D4C()
{
  uint64_t v1 = type metadata accessor for SSHKeyConfigurationView();
  OUTLINED_FUNCTION_1_0(v1);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return sub_22BF10CB8(v3);
}

uint64_t sub_22BF17D9C(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_22BF17DE4@<X0>(void *a1@<X8>)
{
  return sub_22BF10EE4(*(void *)(v1 + 16), a1);
}

unint64_t sub_22BF17DEC()
{
  unint64_t result = qword_268491D30;
  if (!qword_268491D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491D30);
  }
  return result;
}

uint64_t sub_22BF17E3C(void *a1)
{
  uint64_t v2 = type metadata accessor for SSHKeyConfigurationView();
  OUTLINED_FUNCTION_1_0(v2);
  return sub_22BF11D34(a1);
}

uint64_t sub_22BF17E8C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v3 = v2;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22BF17F38(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_22BF17FE4()
{
  return sub_22BF109DC(*(void *)(v0 + 16));
}

uint64_t sub_22BF17FF0()
{
  return sub_22BF1821C((uint64_t (*)(uint64_t))sub_22BF10BD4);
}

uint64_t sub_22BF18008@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF1157C(a1);
}

uint64_t sub_22BF1802C@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF10FFC(*(void **)(v1 + 16), a1);
}

uint64_t sub_22BF18034(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22BF18078(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t objectdestroy_26Tm()
{
  uint64_t v1 = type metadata accessor for SSHKeyConfigurationView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491C08);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22BF59CD8();
    OUTLINED_FUNCTION_3_1();
    (*(void (**)(uint64_t))(v6 + 8))(v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_22BF18204()
{
  return sub_22BF1821C((uint64_t (*)(uint64_t))sub_22BF11B90);
}

uint64_t sub_22BF1821C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for SSHKeyConfigurationView();
  OUTLINED_FUNCTION_1_0(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return a1(v4);
}

void sub_22BF18270()
{
  sub_22BF119BC(*(void **)(v0 + 16));
}

void sub_22BF18278(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setString_, v4);
}

uint64_t destroy for SSHKeyGenerationView(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SSHKeyGenerationView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  uint64_t v5 = *(void **)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  uint64_t v8 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v8;
  uint64_t v9 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v9;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v10 = v5;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SSHKeyGenerationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  uint64_t v5 = *(void **)(a1 + 64);
  uint64_t v6 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v6;
  id v7 = v6;

  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy136_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x88uLL);
}

uint64_t assignWithTake for SSHKeyGenerationView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  uint64_t v4 = *(void **)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);

  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  uint64_t v5 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SSHKeyGenerationView(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 136))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SSHKeyGenerationView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 136) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SSHKeyGenerationView()
{
  return &type metadata for SSHKeyGenerationView;
}

uint64_t destroy for SSHKeyValueRowView(uint64_t a1, uint64_t a2)
{
  return sub_22BF195E4(a1, a2, MEMORY[0x263F8EEA0]);
}

uint64_t initializeWithCopy for SSHKeyValueRowView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SSHKeyValueRowView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SSHKeyValueRowView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SSHKeyValueRowView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 33))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SSHKeyValueRowView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SSHKeyValueRowView()
{
  return &type metadata for SSHKeyValueRowView;
}

uint64_t sub_22BF188D8()
{
  return OUTLINED_FUNCTION_7();
}

uint64_t sub_22BF18AF4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BF18B10()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_22BF18B2C@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_22BF13E2C(a1).n128_u64[0];
  return result;
}

uint64_t sub_22BF18B34@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF142D0(*(void *)(v1 + 16), a1);
}

uint64_t sub_22BF18B3C()
{
  return sub_22BF14F68(*(const void **)(v0 + 16));
}

uint64_t sub_22BF18B48()
{
  return sub_22BF15614();
}

unint64_t sub_22BF18B50()
{
  unint64_t result = qword_268491E70;
  if (!qword_268491E70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491E38);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491E30);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491E28);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491E20);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491E18);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491E50);
    sub_22BEF96F8(&qword_268491E58, &qword_268491E18);
    sub_22BEF96F8(&qword_268491E60, &qword_268491E50);
    swift_getOpaqueTypeConformance2();
    sub_22BEF934C();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491E70);
  }
  return result;
}

unint64_t sub_22BF18D24()
{
  unint64_t result = qword_268491E78;
  if (!qword_268491E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491E78);
  }
  return result;
}

uint64_t sub_22BF18D74()
{
  return sub_22BF15238();
}

uint64_t sub_22BF18D9C()
{
  return sub_22BF16298(v0 + 16);
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_22BF18DBC()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 160, 7);
}

uint64_t sub_22BF18E44()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(void *)(v0 + 152));
}

uint64_t sub_22BF18E70@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF1462C(*(const void **)(v1 + 16), a1);
}

uint64_t sub_22BF18E78@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF14914(a1);
}

unint64_t sub_22BF18E9C()
{
  unint64_t result = qword_268491EB8;
  if (!qword_268491EB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491EB0);
    sub_22BEF96F8(&qword_268491280, &qword_268491288);
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268491260);
    sub_22BEF96F8(&qword_2684921E0, (uint64_t *)&unk_268491260);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491EB8);
  }
  return result;
}

uint64_t sub_22BF18FA0()
{
  return sub_22BF16248();
}

uint64_t sub_22BF18FAC()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

uint64_t sub_22BF18FDC()
{
  return sub_22BF15680(v0 + 16);
}

uint64_t sub_22BF18FE8@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF15BDC(v1 + 16, a1);
}

uint64_t objectdestroy_46Tm()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 152, 7);
}

uint64_t sub_22BF19074()
{
  return sub_22BF160AC();
}

uint64_t sub_22BF1907C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_22BF190C0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_22BF19104()
{
  return sub_22BF15EB4();
}

unint64_t sub_22BF1910C()
{
  unint64_t result = qword_268491EE8;
  if (!qword_268491EE8)
  {
    sub_22BF00710(255, &qword_268491EC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491EE8);
  }
  return result;
}

uint64_t sub_22BF1916C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_22BF191D8()
{
  unint64_t result = qword_268491EF8;
  if (!qword_268491EF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491F00);
    sub_22BF19278();
    sub_22BEF96F8(&qword_268491F28, &qword_268491F30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491EF8);
  }
  return result;
}

unint64_t sub_22BF19278()
{
  unint64_t result = qword_268491F08;
  if (!qword_268491F08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491F10);
    sub_22BEF96F8(&qword_268491F18, &qword_268491F20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491F08);
  }
  return result;
}

unint64_t sub_22BF19318()
{
  unint64_t result = qword_268491F60;
  if (!qword_268491F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491F60);
  }
  return result;
}

unint64_t sub_22BF19364()
{
  unint64_t result = qword_268491F68;
  if (!qword_268491F68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491F58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491F68);
  }
  return result;
}

uint64_t sub_22BF193D4@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF12C54(*(void *)(v1 + 16), a1);
}

uint64_t sub_22BF193DC@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF1297C(*(void *)(v1 + 16), a1);
}

unint64_t sub_22BF193E4()
{
  unint64_t result = qword_268491FE8;
  if (!qword_268491FE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491FE0);
    sub_22BF19484();
    sub_22BEF96F8(&qword_268492010, &qword_268492018);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491FE8);
  }
  return result;
}

unint64_t sub_22BF19484()
{
  unint64_t result = qword_268491FF0;
  if (!qword_268491FF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491FF8);
    sub_22BF5A048();
    swift_getOpaqueTypeConformance2();
    sub_22BEF96F8(&qword_268492000, &qword_268492008);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268491FF0);
  }
  return result;
}

uint64_t sub_22BF19570@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_22BF59DE8();
  *a1 = v3;
  return result;
}

uint64_t sub_22BF1959C()
{
  return sub_22BF59DF8();
}

uint64_t sub_22BF195C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_22BF195CC(uint64_t a1, uint64_t a2)
{
  return sub_22BF195E4(a1, a2, MEMORY[0x263F8EED8]);
}

uint64_t sub_22BF195E4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a1 + 24);
  return a3(v4);
}

uint64_t sub_22BF19634(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_22BF19680(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_22BF196F4(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t sub_22BF19744(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22BF19784(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for SSHKeySection()
{
  return __swift_instantiateGenericMetadata();
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SSHKeyGenerationView.KeyFormat(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 8))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SSHKeyGenerationView.KeyFormat(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SSHKeyGenerationView.KeyFormat()
{
  return &type metadata for SSHKeyGenerationView.KeyFormat;
}

uint64_t sub_22BF19878()
{
  return OUTLINED_FUNCTION_7();
}

unint64_t sub_22BF198E4()
{
  unint64_t result = qword_2684920C0;
  if (!qword_2684920C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684920C8);
    sub_22BEF96F8(&qword_268491FB8, &qword_268491FA8);
    sub_22BEF96F8(&qword_268491FC0, &qword_268491F90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684920C0);
  }
  return result;
}

uint64_t sub_22BF199A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BF199F0()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

void *sub_22BF19AB8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_22BF5A638();
    uint64_t v23 = (void *)sub_22BF5A088();
    sub_22BF59C48();
  }
  sub_22BF59D88();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491288);
  OUTLINED_FUNCTION_3_1();
  (*(void (**)(uint64_t, uint64_t))(v24 + 16))(a9, v13);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491900);
  return memcpy((void *)(a9 + *(int *)(v25 + 36)), __src, 0x70uLL);
}

uint64_t sub_22BF19C7C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_22BF5A638();
    uint64_t v23 = (void *)sub_22BF5A088();
    sub_22BF59C48();
  }
  sub_22BF59D88();
  long long v24 = v13[1];
  long long v28 = *v13;
  long long v29 = v24;
  sub_22BF1EB34((uint64_t)&v28, (uint64_t)v31);
  uint64_t v30 = *((void *)&v29 + 1);
  long long v25 = v13[1];
  *(_OWORD *)a9 = *v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(unsigned char *)(a9 + 32) = *((unsigned char *)v13 + 32);
  memcpy((void *)(a9 + 40), __src, 0x70uLL);
  sub_22BF1EB90((uint64_t)v31);
  return sub_22BF1EBC4((uint64_t)&v30);
}

uint64_t sub_22BF19E30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BF59B88();
  uint64_t v17 = *(void *)(v4 - 8);
  uint64_t v18 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF59B98();
  sub_22BF1EE34(&qword_2684922B8, MEMORY[0x263F07978]);
  uint64_t v7 = sub_22BF5A608();
  if (!v7)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v8 = v7;
  uint64_t v23 = MEMORY[0x263F8EE78];
  sub_22BF5A738();
  uint64_t result = sub_22BF5A5F8();
  if (v8 < 0) {
    goto LABEL_15;
  }
  uint64_t v16 = v2;
  uint64_t v20 = a2 & 0xFFFFFFFFFFFFFF8;
  unint64_t v21 = a2 & 0xC000000000000001;
  uint64_t v19 = a2 + 32;
  uint64_t v10 = a2;
  while (1)
  {
    uint64_t v11 = (uint64_t (*)(unsigned char *, void))sub_22BF5A628();
    unint64_t v13 = *v12;
    uint64_t result = v11(v22, 0);
    if (v21)
    {
      MEMORY[0x230F58990](v13, a2);
      goto LABEL_9;
    }
    if ((v13 & 0x8000000000000000) != 0) {
      break;
    }
    if (v13 >= *(void *)(v20 + 16)) {
      goto LABEL_14;
    }
    id v14 = *(id *)(v19 + 8 * v13);
LABEL_9:
    sub_22BF5A718();
    sub_22BF5A748();
    sub_22BF5A758();
    sub_22BF5A728();
    sub_22BF5A618();
    --v8;
    a2 = v10;
    if (!v8)
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v18);
      uint64_t v15 = v23;
      swift_bridgeObjectRelease();
      return v15;
    }
  }
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t WFAccountAccessResource.accountConfigurationView.getter()
{
  uint64_t v2 = type metadata accessor for AccountManagementView();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3_4();
  uint64_t v5 = (uint64_t *)(v1 + *(int *)(v4 + 28));
  *uint64_t v5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684920D0);
  swift_storeEnumTagMultiPayload();
  uint64_t v6 = v1 + *(int *)(v2 + 32);
  *(void *)uint64_t v6 = swift_getKeyPath();
  *(unsigned char *)(v6 + 8) = 0;
  uint64_t v7 = *(int *)(v2 + 36);
  id v8 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684920D8);
  sub_22BF5A2A8();
  *(_OWORD *)(v1 + v7) = v12;
  *(void *)uint64_t v1 = v8;
  objc_msgSend(v8, sel_accountClass);
  swift_getObjCClassMetadata();
  sub_22BF1D4A4();
  uint64_t v9 = swift_dynamicCastMetatypeUnconditional();
  *(void *)(v1 + 8) = v9;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v1 + 16) = sub_22BF1D4F4;
  *(void *)(v1 + 24) = v10;
  *(unsigned char *)(v1 + 32) = 0;
  sub_22BF1EE34(&qword_2684920E8, (void (*)(uint64_t))type metadata accessor for AccountManagementView);
  return sub_22BF5A338();
}

uint64_t type metadata accessor for AccountManagementView()
{
  uint64_t result = qword_268492108;
  if (!qword_268492108) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22BF1A294(uint64_t a1)
{
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *(void *)(v1 + 16) = a1;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v3 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_22BF1EF6C;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22BF1F2AC;
  aBlock[3] = &block_descriptor_38;
  uint64_t v4 = _Block_copy(aBlock);
  swift_release();
  id v5 = objc_msgSend(ObjCClassFromMetadata, sel_addAccountObserver_, v4);
  _Block_release(v4);
  sub_22BF5A6C8();
  swift_unknownObjectRelease();
  swift_beginAccess();
  sub_22BF1EF74((uint64_t)aBlock, v1 + 24);
  swift_endAccess();
  return v1;
}

uint64_t sub_22BF1A3D4()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    type metadata accessor for AccountListViewModel();
    sub_22BF1EE34(&qword_2684921C8, (void (*)(uint64_t))type metadata accessor for AccountListViewModel);
    sub_22BF59C58();
    swift_release();
    sub_22BF59C68();
    return swift_release();
  }
  return result;
}

uint64_t sub_22BF1A488()
{
  swift_beginAccess();
  sub_22BF04EE4(v0 + 24, (uint64_t)&v3, &qword_2684922C0);
  if (v4)
  {
    sub_22BF1EEE0(&v3, &v5);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    __swift_project_boxed_opaque_existential_0(&v5, v6);
    objc_msgSend(ObjCClassFromMetadata, sel_removeAccountObserver_, sub_22BF5A798());
    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
  }
  else
  {
    sub_22BF04F40((uint64_t)&v3, &qword_2684922C0);
  }
  sub_22BF04F40(v0 + 24, &qword_2684922C0);
  return v0;
}

uint64_t sub_22BF1A568()
{
  uint64_t v0 = sub_22BF1A488();
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t sub_22BF1A598()
{
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_accounts);
  sub_22BF1D4A4();
  uint64_t v1 = sub_22BF5A568();

  return v1;
}

uint64_t sub_22BF1A5F4()
{
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedServiceName);
  uint64_t v1 = sub_22BF5A4C8();

  return v1;
}

uint64_t sub_22BF1A650@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountListViewModel();
  uint64_t result = sub_22BF59C58();
  *a1 = result;
  return result;
}

uint64_t sub_22BF1A690(uint64_t a1)
{
  return sub_22BF1A294(a1);
}

uint64_t sub_22BF1A6D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v2 = sub_22BF5A068();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492128);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = v1;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492130);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268492138);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491CF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268492148);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268492150);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268492158);
  uint64_t v13 = sub_22BF59CF8();
  unint64_t v14 = sub_22BF1E0C0();
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  unint64_t v30 = v14;
  unint64_t v31 = MEMORY[0x263F18AA0];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v16 = sub_22BEF934C();
  uint64_t v28 = v11;
  uint64_t v29 = MEMORY[0x263F8D310];
  unint64_t v30 = OpaqueTypeConformance2;
  unint64_t v31 = v16;
  uint64_t v17 = swift_getOpaqueTypeConformance2();
  uint64_t v28 = v10;
  uint64_t v29 = v17;
  uint64_t v18 = swift_getOpaqueTypeConformance2();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491D00);
  uint64_t v20 = sub_22BEF96F8((unint64_t *)&unk_268491D08, &qword_268491D00);
  uint64_t v28 = v19;
  uint64_t v29 = v20;
  uint64_t v21 = swift_getOpaqueTypeConformance2();
  uint64_t v28 = v24;
  uint64_t v29 = v23;
  unint64_t v30 = v18;
  unint64_t v31 = v21;
  swift_getOpaqueTypeConformance2();
  sub_22BF59D18();
  sub_22BF5A058();
  sub_22BEF96F8((unint64_t *)&unk_268492190, &qword_268492128);
  sub_22BF1EE34(&qword_268491230, MEMORY[0x263F1A128]);
  sub_22BF5A0F8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_22BF1AA7C@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v78 = a2;
  uint64_t v3 = sub_22BF59E98();
  uint64_t v75 = *(void *)(v3 - 8);
  uint64_t v76 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v74 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_22BF59CF8();
  uint64_t v64 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v62 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22BF5A3C8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684921A0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492170);
  uint64_t v13 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v15 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492158);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492150);
  uint64_t v66 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  uint64_t v79 = (char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492148);
  uint64_t v69 = *(void *)(v20 - 8);
  uint64_t v70 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v67 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492138);
  uint64_t v72 = *(void *)(v22 - 8);
  uint64_t v73 = v22;
  MEMORY[0x270FA5388](v22);
  int v71 = (char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = a1;
  uint64_t v80 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684921A8);
  sub_22BEF96F8(&qword_2684921B0, &qword_2684921A8);
  sub_22BF5A0C8();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F1B878], v6);
  sub_22BF5A368();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684921B8);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v25);
  uint64_t v26 = (uint64_t *)&v18[*(int *)(v16 + 36)];
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492180);
  sub_22BF04EE4((uint64_t)v12, (uint64_t)v26 + *(int *)(v27 + 28), &qword_2684921A0);
  *uint64_t v26 = KeyPath;
  uint64_t v28 = v65;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v18, v15, v65);
  sub_22BF04F40((uint64_t)v12, &qword_2684921A0);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v28);
  uint64_t v29 = v62;
  sub_22BF59CE8();
  unint64_t v30 = sub_22BF1E0C0();
  uint64_t v65 = v16;
  uint64_t v31 = v63;
  sub_22BF5A208();
  uint64_t v32 = v31;
  (*(void (**)(char *, uint64_t))(v64 + 8))(v29, v31);
  sub_22BF04F40((uint64_t)v18, &qword_268492158);
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v33 = (id)qword_2684922C8;
  uint64_t v34 = (void *)sub_22BF5A4A8();
  uint64_t v35 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v36 = objc_msgSend(v33, sel_localizedStringForKey_value_table_, v34, v35, 0);

  sub_22BF5A4C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684921C0);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_22BF62900;
  uint64_t v38 = v77;
  type metadata accessor for AccountListViewModel();
  sub_22BF1EE34(&qword_2684921C8, (void (*)(uint64_t))type metadata accessor for AccountListViewModel);
  sub_22BF59C98();
  uint64_t v39 = sub_22BF1A5F4();
  uint64_t v41 = v40;
  swift_release();
  uint64_t v42 = MEMORY[0x263F8D310];
  *(void *)(v37 + 56) = MEMORY[0x263F8D310];
  *(void *)(v37 + 64) = sub_22BF1E1B4();
  *(void *)(v37 + 32) = v39;
  *(void *)(v37 + 40) = v41;
  uint64_t v43 = sub_22BF5A4B8();
  uint64_t v45 = v44;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v85 = v43;
  uint64_t v86 = v45;
  uint64_t v81 = v65;
  uint64_t v82 = v32;
  unint64_t v83 = v30;
  unint64_t v84 = MEMORY[0x263F18AA0];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v47 = sub_22BEF934C();
  uint64_t v48 = v67;
  uint64_t v49 = v68;
  uint64_t v50 = v79;
  sub_22BF5A178();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v50, v49);
  uint64_t v52 = v74;
  uint64_t v51 = v75;
  uint64_t v53 = v76;
  (*(void (**)(char *, void, uint64_t))(v75 + 104))(v74, *MEMORY[0x263F19698], v76);
  uint64_t v81 = v49;
  uint64_t v82 = v42;
  unint64_t v83 = OpaqueTypeConformance2;
  unint64_t v84 = v47;
  uint64_t v54 = swift_getOpaqueTypeConformance2();
  uint64_t v56 = v70;
  uint64_t v55 = v71;
  sub_22BF5A1A8();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v53);
  uint64_t v57 = (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v48, v56);
  MEMORY[0x270FA5388](v57);
  *(&v62 - 2) = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491CF0);
  uint64_t v81 = v56;
  uint64_t v82 = v54;
  swift_getOpaqueTypeConformance2();
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268491D00);
  uint64_t v59 = sub_22BEF96F8((unint64_t *)&unk_268491D08, &qword_268491D00);
  uint64_t v81 = v58;
  uint64_t v82 = v59;
  swift_getOpaqueTypeConformance2();
  uint64_t v60 = v73;
  sub_22BF5A1E8();
  return (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v55, v60);
}

uint64_t sub_22BF1B4C8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684921F0);
  uint64_t v35 = *(void *)(v38 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v38);
  id v36 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v31 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684921F8);
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v8 = v34;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v31 - v12;
  uint64_t v40 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268492200);
  sub_22BF1E848();
  id v33 = v13;
  sub_22BF5A3A8();
  uint64_t v39 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268492240);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268492248);
  uint64_t v15 = sub_22BF5A018();
  uint64_t v16 = sub_22BEF96F8(&qword_268492250, &qword_268492248);
  uint64_t v17 = sub_22BF1EE34(&qword_268492258, MEMORY[0x263F19CE8]);
  uint64_t v41 = v14;
  uint64_t v42 = v15;
  uint64_t v43 = v16;
  uint64_t v44 = v17;
  swift_getOpaqueTypeConformance2();
  uint64_t v31 = v6;
  sub_22BF5A3A8();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v32 = v11;
  uint64_t v19 = v13;
  uint64_t v20 = v7;
  v18(v11, v19, v7);
  uint64_t v22 = v35;
  uint64_t v21 = v36;
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  uint64_t v24 = v6;
  uint64_t v25 = v38;
  v23(v36, v24, v38);
  uint64_t v26 = v37;
  v18(v37, v11, v20);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492260);
  v23(&v26[*(int *)(v27 + 48)], v21, v25);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v22 + 8);
  v28(v31, v25);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v34 + 8);
  v29(v33, v20);
  v28(v21, v25);
  return ((uint64_t (*)(char *, uint64_t))v29)(v32, v20);
}

uint64_t sub_22BF1B868@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v53 = a1;
  uint64_t v3 = type metadata accessor for AccountManagementView();
  uint64_t v44 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v45 = v4;
  uint64_t v46 = (uint64_t)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492228);
  uint64_t v48 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  unint64_t v47 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492218);
  uint64_t v6 = MEMORY[0x270FA5388](v52);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v49 = (uint64_t)&v43 - v9;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492298);
  MEMORY[0x270FA5388](v51);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AccountListViewModel();
  sub_22BF1EE34(&qword_2684921C8, (void (*)(uint64_t))type metadata accessor for AccountListViewModel);
  sub_22BF59C98();
  unint64_t v12 = sub_22BF1A598();
  swift_release();
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_22BF5A778();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v13)
  {
    sub_22BF59C98();
    uint64_t v14 = sub_22BF1A598();
    swift_release();
    uint64_t v54 = v14;
    swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684922A0);
    sub_22BEF96F8(&qword_2684922A8, &qword_2684922A0);
    sub_22BF1EE34(&qword_2684922B0, (void (*)(uint64_t))sub_22BF1D4A4);
    uint64_t v15 = v47;
    sub_22BF5A378();
    uint64_t v16 = v46;
    sub_22BF1E210(v2, v46);
    unint64_t v17 = (*(unsigned __int8 *)(v44 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
    uint64_t v18 = swift_allocObject();
    sub_22BF1E278(v16, v18 + v17);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = sub_22BF1ED84;
    *(void *)(v19 + 24) = v18;
    uint64_t v20 = v48;
    uint64_t v21 = v50;
    (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v8, v15, v50);
    uint64_t v22 = (uint64_t (**)())&v8[*(int *)(v52 + 36)];
    *uint64_t v22 = sub_22BF1EE0C;
    v22[1] = (uint64_t (*)())v19;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v15, v21);
    uint64_t v23 = v49;
    sub_22BF04E88((uint64_t)v8, v49, &qword_268492218);
    sub_22BF04EE4(v23, (uint64_t)v11, &qword_268492218);
    swift_storeEnumTagMultiPayload();
    sub_22BF1E8C4();
    sub_22BF59F98();
    return sub_22BF04F40(v23, &qword_268492218);
  }
  else
  {
    sub_22BF5A4E8();
    if (qword_268490F80 != -1) {
      swift_once();
    }
    id v25 = (id)qword_2684922C8;
    uint64_t v26 = (void *)sub_22BF5A4A8();
    uint64_t v27 = (void *)sub_22BF5A4A8();
    swift_bridgeObjectRelease();
    id v28 = objc_msgSend(v25, sel_localizedStringForKey_value_table_, v26, v27, 0);

    uint64_t v29 = sub_22BF5A4C8();
    uint64_t v31 = v30;

    uint64_t v54 = v29;
    uint64_t v55 = v31;
    sub_22BEF934C();
    uint64_t v32 = sub_22BF5A0E8();
    uint64_t v34 = v33;
    LOBYTE(v26) = v35 & 1;
    sub_22BF5A268();
    uint64_t v36 = sub_22BF5A0D8();
    uint64_t v38 = v37;
    char v40 = v39;
    uint64_t v42 = v41;
    swift_release();
    sub_22BF0E59C(v32, v34, (char)v26);
    swift_bridgeObjectRelease();
    *(void *)uint64_t v11 = v36;
    *((void *)v11 + 1) = v38;
    unsigned char v11[16] = v40 & 1;
    *((void *)v11 + 3) = v42;
    swift_storeEnumTagMultiPayload();
    sub_22BF1E8C4();
    return sub_22BF59F98();
  }
}

uint64_t sub_22BF1BEF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v16[1] = a2;
  uint64_t v3 = sub_22BF5A018();
  v16[0] = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AccountManagementView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492248);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF1E210(a1, (uint64_t)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  sub_22BF1E278((uint64_t)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268492268);
  sub_22BF1EA18();
  sub_22BF5A2F8();
  sub_22BF5A008();
  sub_22BEF96F8(&qword_268492250, &qword_268492248);
  sub_22BF1EE34(&qword_268492258, MEMORY[0x263F19CE8]);
  sub_22BF5A128();
  (*(void (**)(char *, uint64_t))(v16[0] + 8))(v5, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_22BF1C1F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22BF59D78();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684920F0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AccountManagementView();
  sub_22BF1CFD8((uint64_t)v5);
  MEMORY[0x230F585E0](v3);
  sub_22BF59D68();
  sub_22BF5A358();
  sub_22BF04F40((uint64_t)v5, &qword_2684920F0);
  uint64_t v7 = (char *)v0 + *(int *)(v6 + 32);
  uint64_t v8 = *(void *)v7;
  char v9 = v7[8];
  sub_22BF1D6EC(*(void *)v7, v9);
  uint64_t v10 = sub_22BF1D23C(v8, v9);
  uint64_t result = sub_22BF1D800(v8, v9);
  if (v10)
  {
    unint64_t v12 = *v1;
    aBlock[4] = nullsub_1;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22BF1CCE8;
    aBlock[3] = &block_descriptor_5;
    unint64_t v13 = _Block_copy(aBlock);
    objc_msgSend(v12, sel_makeAvailableWithUserInterface_completionHandler_, v10, v13);
    _Block_release(v13);
    return swift_unknownObjectRelease();
  }
  return result;
}

void *sub_22BF1C3EC@<X0>(void *a1@<X8>)
{
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v2 = (id)qword_2684922C8;
  uint64_t v3 = (void *)sub_22BF5A4A8();
  uint64_t v4 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, 0);

  uint64_t v6 = sub_22BF5A4C8();
  uint64_t v8 = v7;

  __src[0] = v6;
  __src[1] = v8;
  sub_22BEF934C();
  uint64_t v9 = sub_22BF5A0E8();
  uint64_t v11 = v10;
  __src[19] = v9;
  id __src[20] = v10;
  char v13 = v12 & 1;
  char v17 = v12 & 1;
  uint64_t v18 = v14;
  char v19 = 0;
  sub_22BF5A3E8();
  sub_22BF19C7C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1);
  sub_22BF0E59C(v9, v11, v13);
  swift_bridgeObjectRelease();
  return memcpy(a1, __src, 0x98uLL);
}

uint64_t sub_22BF1C5A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684921A0);
  MEMORY[0x270FA5388](v2 - 8);
  sub_22BF04EE4(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2684921A0);
  return sub_22BF59E28();
}

uint64_t sub_22BF1C634(uint64_t a1)
{
  uint64_t v2 = sub_22BF59FF8();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491D00);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22BF59FE8();
  uint64_t v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268491260);
  sub_22BEF96F8(&qword_2684921E0, (uint64_t *)&unk_268491260);
  sub_22BF59CA8();
  uint64_t v7 = sub_22BEF96F8((unint64_t *)&unk_268491D08, &qword_268491D00);
  MEMORY[0x230F582C0](v6, v3, v7);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_22BF1C7FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AccountManagementView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v5 = (id)qword_2684922C8;
  uint64_t v6 = (void *)sub_22BF5A4A8();
  uint64_t v7 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v6, v7, 0);

  uint64_t v9 = sub_22BF5A4C8();
  uint64_t v11 = v10;

  v15[0] = v9;
  v15[1] = v11;
  sub_22BF1E210(a1, (uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v13 = swift_allocObject();
  sub_22BF1E278((uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  sub_22BEF934C();
  return sub_22BF5A308();
}

uint64_t sub_22BF1C9F4()
{
  uint64_t v0 = sub_22BF59D78();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684920F0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AccountManagementView();
  sub_22BF1CFD8((uint64_t)v3);
  MEMORY[0x230F585E0](v1);
  sub_22BF59D68();
  sub_22BF5A358();
  return sub_22BF04F40((uint64_t)v3, &qword_2684920F0);
}

uint64_t sub_22BF1CB0C@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  sub_22BF1EE7C(*a1);
  sub_22BEF934C();
  uint64_t result = sub_22BF5A0E8();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  *(void *)(a2 + 24) = v6;
  return result;
}

uint64_t sub_22BF1CB78(uint64_t a1)
{
  type metadata accessor for AccountListViewModel();
  sub_22BF1EE34(&qword_2684921C8, (void (*)(uint64_t))type metadata accessor for AccountListViewModel);
  sub_22BF59C98();
  uint64_t v2 = sub_22BF1A598();
  swift_release();
  unint64_t v3 = sub_22BF19E30(a1, v2);
  unint64_t v4 = v3;
  if (!(v3 >> 62))
  {
    uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }
  uint64_t v5 = sub_22BF5A778();
  if (!v5) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  uint64_t result = swift_getObjCClassFromMetadata();
  if (v5 >= 1)
  {
    uint64_t v7 = (void *)result;
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x230F58990](i, v4);
      }
      else {
        id v9 = *(id *)(v4 + 8 * i + 32);
      }
      uint64_t v10 = v9;
      objc_msgSend(v7, sel_deleteAccount_, v9);
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_22BF1CCE8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_22BF1CD64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_22BF59E88();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491C08);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF04EE4(v3, (uint64_t)v9, &qword_268491C08);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22BF59CD8();
    OUTLINED_FUNCTION_3_1();
    return (*(uint64_t (**)(uint64_t, char *))(v10 + 32))(a1, v9);
  }
  else
  {
    os_log_type_t v12 = sub_22BF5A638();
    uint64_t v13 = sub_22BF5A088();
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      *(void *)(v14 + 4) = sub_22BF1E31C(0x417373696D736944, 0xED00006E6F697463, &v17);
      _os_log_impl(&dword_22BEF1000, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F59740](v15, -1, -1);
      MEMORY[0x230F59740](v14, -1, -1);
    }

    sub_22BF59E78();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
  }
}

uint64_t sub_22BF1CFD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22BF59E88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684920D0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF04EE4(v2, (uint64_t)v10, &qword_2684920D0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_22BF04E88((uint64_t)v10, a1, &qword_2684920F0);
  }
  os_log_type_t v12 = sub_22BF5A638();
  uint64_t v13 = sub_22BF5A088();
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = sub_22BF1E31C(0xD000000000000019, 0x800000022BF651E0, &v17);
    _os_log_impl(&dword_22BEF1000, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F59740](v15, -1, -1);
    MEMORY[0x230F59740](v14, -1, -1);
  }

  sub_22BF59E78();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_22BF1D23C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_22BF59E88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_unknownObjectRetain();
  }
  else
  {
    swift_retain();
    os_log_type_t v8 = sub_22BF5A638();
    uint64_t v9 = sub_22BF5A088();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v14 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      *(void *)(v10 + 4) = sub_22BF1E31C(0xD00000000000001DLL, 0x800000022BF65260, &v14);
      _os_log_impl(&dword_22BEF1000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F59740](v11, -1, -1);
      MEMORY[0x230F59740](v10, -1, -1);
    }

    sub_22BF59E78();
    swift_getAtKeyPath();
    sub_22BF1D800(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t sub_22BF1D424()
{
  return sub_22BF59DD8();
}

uint64_t sub_22BF1D448@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22BF59D98();
  *a1 = result;
  return result;
}

uint64_t sub_22BF1D474()
{
  return sub_22BF59DA8();
}

unint64_t sub_22BF1D4A4()
{
  unint64_t result = qword_268491670;
  if (!qword_268491670)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268491670);
  }
  return result;
}

uint64_t sub_22BF1D4E4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22BF1D4F4()
{
  return sub_22BF1A690(*(void *)(v0 + 16));
}

uint64_t type metadata accessor for AccountListViewModel()
{
  return self;
}

char *sub_22BF1D520(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
  }
  else
  {
    uint64_t v7 = a1;
    os_log_type_t v8 = a2[2];
    *((void *)a1 + 1) = a2[1];
    uint64_t v9 = a2[3];
    char v10 = *((unsigned char *)a2 + 32);
    uint64_t v11 = v4;
    sub_22BF1D6E4();
    *((void *)v7 + 2) = v8;
    *((void *)v7 + 3) = v9;
    v7[32] = v10;
    uint64_t v12 = a3[7];
    uint64_t v13 = &v7[v12];
    uint64_t v14 = (char **)((char *)a2 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684920D0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *(void *)uint64_t v13 = *v14;
    if (EnumCaseMultiPayload == 1)
    {
      *((void *)v13 + 1) = v14[1];
      swift_retain();
      swift_retain();
      uint64_t v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684920F0) + 32);
      uint64_t v17 = &v13[v16];
      uint64_t v18 = (char *)v14 + v16;
      uint64_t v19 = sub_22BF59D78();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v20 = a3[8];
    uint64_t v21 = &v7[v20];
    uint64_t v22 = (uint64_t)a2 + v20;
    uint64_t v23 = *(void *)v22;
    char v24 = *(unsigned char *)(v22 + 8);
    sub_22BF1D6EC(*(void *)v22, v24);
    *(void *)uint64_t v21 = v23;
    v21[8] = v24;
    uint64_t v25 = a3[9];
    uint64_t v26 = &v7[v25];
    uint64_t v27 = (uint64_t)a2 + v25;
    id v28 = *(void **)v27;
    uint64_t v29 = *(void *)(v27 + 8);
    *(void *)uint64_t v26 = *(void *)v27;
    *((void *)v26 + 1) = v29;
    id v30 = v28;
  }
  swift_retain();
  return v7;
}

uint64_t sub_22BF1D6E4()
{
  return swift_retain();
}

uint64_t sub_22BF1D6EC(uint64_t a1, char a2)
{
  if (a2) {
    return swift_unknownObjectRetain();
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_22BF1D6F8(id *a1, int *a2)
{
  sub_22BF1D7F8();
  uint64_t v4 = (char *)a1 + a2[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684920D0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v6 = &v4[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684920F0) + 32)];
    uint64_t v7 = sub_22BF59D78();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  sub_22BF1D800(*(uint64_t *)((char *)a1 + a2[8]), *((unsigned char *)a1 + a2[8] + 8));

  return swift_release();
}

uint64_t sub_22BF1D7F8()
{
  return swift_release();
}

uint64_t sub_22BF1D800(uint64_t a1, char a2)
{
  if (a2) {
    return swift_unknownObjectRelease();
  }
  else {
    return swift_release();
  }
}

uint64_t sub_22BF1D80C(uint64_t a1, long long *a2, int *a3)
{
  long long v6 = *a2;
  *(_OWORD *)a1 = *a2;
  uint64_t v7 = *((void *)a2 + 2);
  uint64_t v8 = *((void *)a2 + 3);
  char v9 = *((unsigned char *)a2 + 32);
  id v10 = (id)v6;
  sub_22BF1D6E4();
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = v9;
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684920D0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *uint64_t v12 = *v13;
  if (EnumCaseMultiPayload == 1)
  {
    v12[1] = v13[1];
    swift_retain();
    swift_retain();
    uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684920F0) + 32);
    uint64_t v16 = (char *)v12 + v15;
    uint64_t v17 = (char *)v13 + v15;
    uint64_t v18 = sub_22BF59D78();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = (uint64_t)a2 + v19;
  uint64_t v22 = *(void *)v21;
  char v23 = *(unsigned char *)(v21 + 8);
  sub_22BF1D6EC(*(void *)v21, v23);
  *(void *)uint64_t v20 = v22;
  *(unsigned char *)(v20 + 8) = v23;
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (uint64_t)a2 + v24;
  uint64_t v27 = *(void **)v26;
  uint64_t v28 = *(void *)(v26 + 8);
  *uint64_t v25 = *(void *)v26;
  v25[1] = v28;
  id v29 = v27;
  swift_retain();
  return a1;
}

uint64_t sub_22BF1D988(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(a2 + 24);
  char v11 = *(unsigned char *)(a2 + 32);
  sub_22BF1D6E4();
  *(void *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v10;
  *(unsigned char *)(a1 + 32) = v11;
  sub_22BF1D7F8();
  if (a1 != a2)
  {
    uint64_t v12 = a3[7];
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (void *)(a2 + v12);
    sub_22BF04F40(a1 + v12, &qword_2684920D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684920D0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *uint64_t v13 = *v14;
    if (EnumCaseMultiPayload == 1)
    {
      v13[1] = v14[1];
      swift_retain();
      swift_retain();
      uint64_t v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684920F0) + 32);
      uint64_t v17 = (char *)v13 + v16;
      uint64_t v18 = (char *)v14 + v16;
      uint64_t v19 = sub_22BF59D78();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = *(void *)v22;
  char v24 = *(unsigned char *)(v22 + 8);
  sub_22BF1D6EC(*(void *)v22, v24);
  uint64_t v25 = *(void *)v21;
  char v26 = *(unsigned char *)(v21 + 8);
  *(void *)uint64_t v21 = v23;
  *(unsigned char *)(v21 + 8) = v24;
  sub_22BF1D800(v25, v26);
  uint64_t v27 = a3[9];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = a2 + v27;
  id v30 = *(void **)(a1 + v27);
  uint64_t v31 = *(void **)v29;
  *uint64_t v28 = *(void *)v29;
  id v32 = v31;

  v28[1] = *(void *)(v29 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22BF1DB58(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v7 = a3[7];
  id v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684920D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = v9[1];
    *id v8 = *v9;
    v8[1] = v11;
    uint64_t v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684920F0) + 32);
    uint64_t v13 = (char *)v8 + v12;
    uint64_t v14 = (char *)v9 + v12;
    uint64_t v15 = sub_22BF59D78();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  *(_OWORD *)(a1 + v17) = *(_OWORD *)(a2 + v17);
  return a1;
}

uint64_t sub_22BF1DC90(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  char v7 = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = v7;
  sub_22BF1D7F8();
  if (a1 != a2)
  {
    uint64_t v8 = a3[7];
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (void *)(a2 + v8);
    sub_22BF04F40(a1 + v8, &qword_2684920D0);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684920D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = v10[1];
      *uint64_t v9 = *v10;
      v9[1] = v12;
      uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684920F0) + 32);
      uint64_t v14 = (char *)v9 + v13;
      uint64_t v15 = (char *)v10 + v13;
      uint64_t v16 = sub_22BF59D78();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v20 = *v19;
  LOBYTE(v19) = *((unsigned char *)v19 + 8);
  uint64_t v21 = *(void *)v18;
  char v22 = *(unsigned char *)(v18 + 8);
  *(void *)uint64_t v18 = v20;
  *(unsigned char *)(v18 + 8) = (_BYTE)v19;
  sub_22BF1D800(v21, v22);
  uint64_t v23 = a3[9];
  char v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  char v26 = *(void **)(a1 + v23);
  void *v24 = *v25;

  v24[1] = v25[1];
  swift_release();
  return a1;
}

uint64_t sub_22BF1DE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BF1DE48);
}

uint64_t sub_22BF1DE48(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684920F8);
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 28);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22BF1DED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BF1DEE8);
}

void *sub_22BF1DEE8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684920F8);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 28);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_22BF1DF6C()
{
  sub_22BF1E034();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22BF1E034()
{
  if (!qword_268492118)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684920F0);
    unint64_t v0 = sub_22BF59C78();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268492118);
    }
  }
}

uint64_t sub_22BF1E090()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_22BF1E09C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BF1E0B8@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF1AA7C(*(char **)(v1 + 16), a1);
}

unint64_t sub_22BF1E0C0()
{
  unint64_t result = qword_268492160;
  if (!qword_268492160)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268492158);
    sub_22BEF96F8(&qword_268492168, &qword_268492170);
    sub_22BEF96F8(&qword_268492178, (uint64_t *)&unk_268492180);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268492160);
  }
  return result;
}

uint64_t sub_22BF1E184@<X0>(char *a1@<X8>)
{
  return sub_22BF1B4C8(*(void *)(v1 + 16), a1);
}

uint64_t sub_22BF1E18C()
{
  return sub_22BF59E18();
}

unint64_t sub_22BF1E1B4()
{
  unint64_t result = qword_2684921D0;
  if (!qword_2684921D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684921D0);
  }
  return result;
}

uint64_t sub_22BF1E200()
{
  return sub_22BF1C634(*(void *)(v0 + 16));
}

uint64_t sub_22BF1E208()
{
  return sub_22BF1C7FC(*(void *)(v0 + 16));
}

uint64_t sub_22BF1E210(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccountManagementView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF1E278(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccountManagementView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF1E2DC()
{
  uint64_t v0 = type metadata accessor for AccountManagementView();
  OUTLINED_FUNCTION_1_0(v0);
  return sub_22BF1C9F4();
}

unint64_t sub_22BF1E31C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_22BF1E3F0(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22BF1E540((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_22BF1E540((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_22BF1E3F0(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_22BF1E59C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_22BF5A708();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_22BF1E540(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22BF1E59C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22BF1E634(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_22BF1E738(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_22BF1E738((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22BF1E634(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_22BF1E6D0(v2, 0);
      uint64_t result = sub_22BF5A6E8();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_22BF5A538();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_22BF1E6D0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684921E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_22BF1E738(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684921E8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[v8] <= v12) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_22BF1E824@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF1B868(a1);
}

unint64_t sub_22BF1E848()
{
  unint64_t result = qword_268492208;
  if (!qword_268492208)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268492200);
    sub_22BF1E8C4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268492208);
  }
  return result;
}

unint64_t sub_22BF1E8C4()
{
  unint64_t result = qword_268492210;
  if (!qword_268492210)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268492218);
    sub_22BF1E964();
    sub_22BEF96F8(&qword_268492230, &qword_268492238);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268492210);
  }
  return result;
}

unint64_t sub_22BF1E964()
{
  unint64_t result = qword_268492220;
  if (!qword_268492220)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268492228);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268492220);
  }
  return result;
}

uint64_t sub_22BF1E9D0@<X0>(uint64_t a1@<X8>)
{
  return sub_22BF1BEF8(*(void *)(v1 + 16), a1);
}

uint64_t sub_22BF1E9DC()
{
  uint64_t v0 = type metadata accessor for AccountManagementView();
  OUTLINED_FUNCTION_1_0(v0);
  return sub_22BF1C1F8();
}

unint64_t sub_22BF1EA18()
{
  unint64_t result = qword_268492270;
  if (!qword_268492270)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268492268);
    sub_22BF1EA94();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268492270);
  }
  return result;
}

unint64_t sub_22BF1EA94()
{
  unint64_t result = qword_268492278;
  if (!qword_268492278)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268492280);
    sub_22BEF96F8(&qword_268492288, &qword_268492290);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268492278);
  }
  return result;
}

uint64_t sub_22BF1EB34(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22BF1EB90(uint64_t a1)
{
  return a1;
}

uint64_t sub_22BF1EBC4(uint64_t a1)
{
  return a1;
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t objectdestroy_19Tm_0()
{
  uint64_t v1 = (int *)type metadata accessor for AccountManagementView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;

  sub_22BF1D7F8();
  uint64_t v6 = v0 + v3 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684920D0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v8 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684920F0) + 32);
    sub_22BF59D78();
    OUTLINED_FUNCTION_3_1();
    (*(void (**)(uint64_t))(v9 + 8))(v8);
  }
  sub_22BF1D800(*(void *)(v5 + v1[8]), *(unsigned char *)(v5 + v1[8] + 8));

  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_22BF1ED84(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AccountManagementView();
  OUTLINED_FUNCTION_1_0(v2);
  return sub_22BF1CB78(a1);
}

uint64_t sub_22BF1EDD4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22BF1EE0C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_22BF1EE34(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22BF1EE7C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_localizedName);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_22BF5A4C8();

  return v3;
}

_OWORD *sub_22BF1EEE0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_22BF1EF34()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22BF1EF6C()
{
  return sub_22BF1A3D4();
}

uint64_t sub_22BF1EF74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684922C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF1EFDC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t StaticString._asString.getter(unint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    if (result) {
      return sub_22BF5A4E8();
    }
    __break(1u);
  }
  if (HIDWORD(result))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return sub_22BF5A4E8();
  }
  if (result >> 11 == 27) {
    goto LABEL_14;
  }
  if (WORD1(result) > 0x10u) {
    goto LABEL_11;
  }
  if ((result & 0xFFFFFF80) != 0 || result <= 0xFF) {
    return sub_22BF5A4E8();
  }
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

id static NSBundle._current.getter()
{
  if (qword_268490F80 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_2684922C8;
  return v0;
}

id sub_22BF1F220()
{
  _s2__CMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2684922C8 = (uint64_t)result;
  return result;
}

uint64_t sub_22BF1F278()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t _s2__CMa()
{
  return self;
}

void sub_22BF1F2B0(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_22BF59AF8();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

uint64_t sub_22BF1F320(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_22BF1F364(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_22BF5A418();
  OUTLINED_FUNCTION_0_0();
  uint64_t v27 = v6;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_22BF5A448();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    uint64_t v16 = result;
    uint64_t v17 = sub_22BF5A4C8();
    sub_22BEFE574(v17, v18, v16, (SEL *)&selRef_setOAuthConsumerKey_);
    uint64_t v19 = sub_22BF5A4C8();
    sub_22BEFE574(v19, v20, v16, (SEL *)&selRef_setOAuthConsumerSecret_);
    sub_22BEFD454();
    uint64_t v21 = (void *)sub_22BF5A648();
    char v22 = (void *)swift_allocObject();
    void v22[2] = v2;
    v22[3] = v16;
    v22[4] = a1;
    v22[5] = a2;
    aBlock[4] = sub_22BF214FC;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22BF1F2AC;
    aBlock[3] = &block_descriptor_6;
    uint64_t v23 = _Block_copy(aBlock);
    id v24 = v2;
    id v25 = v16;
    swift_retain();
    swift_release();
    sub_22BF5A438();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_22BF21560((unint64_t *)&unk_268491700, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914C0);
    sub_22BEF96F8((unint64_t *)&qword_268491710, (uint64_t *)&unk_2684914C0);
    sub_22BF5A6D8();
    MEMORY[0x230F588F0](0, v14, v9, v23);
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v5);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v26);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22BF1F674(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v20[1] = a1;
  uint64_t v7 = type metadata accessor for TumblrWebView.LoadingState(0);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = type metadata accessor for TumblrWebView(0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (void *)((char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v15 = a2;
  v15[1] = 0x726C626D75746677;
  void v15[2] = 0xE800000000000000;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 2, v16);
  sub_22BF2286C((uint64_t)v12, (uint64_t)v10, (void (*)(void))type metadata accessor for TumblrWebView.LoadingState);
  id v17 = a2;
  swift_retain();
  sub_22BF5A2A8();
  sub_22BF215A8((uint64_t)v12, (void (*)(void))type metadata accessor for TumblrWebView.LoadingState);
  uint64_t v18 = (void *)((char *)v15 + *(int *)(v13 + 28));
  *uint64_t v18 = a3;
  v18[1] = a4;
  sub_22BF21560(&qword_268492340, (void (*)(uint64_t))type metadata accessor for TumblrWebView);
  sub_22BF5A678();
  return sub_22BF215A8((uint64_t)v15, (void (*)(void))type metadata accessor for TumblrWebView);
}

id sub_22BF1F90C(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for WFTumblrAccessResourceUserInterface();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithUserInterfaceType_attribution_, a1, a2);

  return v5;
}

id sub_22BF1F9B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFTumblrAccessResourceUserInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WFTumblrAccessResourceUserInterface()
{
  return self;
}

uint64_t sub_22BF1FA0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for TumblrWebView(0);
  uint64_t v23 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v23 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - v7;
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v9 = (id)qword_2684922C8;
  uint64_t v10 = (void *)sub_22BF5A4A8();
  uint64_t v11 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v10, v11, 0);

  uint64_t v22 = sub_22BF5A4C8();
  uint64_t v14 = v13;

  sub_22BF2286C(v1, (uint64_t)v8, (void (*)(void))type metadata accessor for TumblrWebView);
  unint64_t v15 = (*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v16 = swift_allocObject();
  sub_22BF228C4((uint64_t)v8, v16 + v15);
  sub_22BF2286C(v1, (uint64_t)v6, (void (*)(void))type metadata accessor for TumblrWebView);
  uint64_t v17 = swift_allocObject();
  sub_22BF228C4((uint64_t)v6, v17 + v15);
  char v24 = 0;
  uint64_t result = sub_22BF5A2A8();
  char v19 = v25;
  uint64_t v20 = v26;
  *(void *)a1 = v22;
  *(void *)(a1 + 8) = v14;
  *(_WORD *)(a1 + 16) = 257;
  *(void *)(a1 + 24) = sub_22BF22928;
  *(void *)(a1 + 32) = v16;
  *(void *)(a1 + 40) = sub_22BF22A8C;
  *(void *)(a1 + 48) = v17;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 72) = v19;
  *(void *)(a1 + 80) = v20;
  return result;
}

uint64_t sub_22BF1FCA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v1 = sub_22BF59A78();
  uint64_t v43 = *(void *)(v1 - 8);
  uint64_t v44 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v41 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = type metadata accessor for WebView(0);
  MEMORY[0x270FA5388](v52);
  uint64_t v46 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_22BF59B58();
  uint64_t v45 = *(void *)(v47 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v47);
  char v40 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v42 = (char *)&v39 - v6;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684918F0);
  MEMORY[0x270FA5388](v50);
  uint64_t v51 = (uint64_t)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TumblrWebView(0);
  uint64_t v48 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v48 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491288);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491900);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_268491908);
  uint64_t v17 = MEMORY[0x270FA5388](v49);
  char v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v39 - v20;
  uint64_t v22 = type metadata accessor for TumblrWebView.LoadingState(0);
  MEMORY[0x270FA5388](v22 - 8);
  char v24 = (char *)&v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492348);
  sub_22BF5A2B8();
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 2, v25))
  {
    sub_22BF59CB8();
    sub_22BF5A3D8();
    sub_22BF19AB8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v16, 0.0, 1, INFINITY, 0);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    sub_22BF2286C(v54, (uint64_t)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for TumblrWebView);
    unint64_t v26 = (*(unsigned __int8 *)(v48 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
    uint64_t v27 = swift_allocObject();
    sub_22BF228C4((uint64_t)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v27 + v26);
    sub_22BF08E58((uint64_t)v16, (uint64_t)v19, &qword_268491900);
    uint64_t v28 = (uint64_t (**)())&v19[*(int *)(v49 + 36)];
    *uint64_t v28 = sub_22BF22B60;
    v28[1] = (uint64_t (*)())v27;
    v28[2] = 0;
    v28[3] = 0;
    sub_22BF04F40((uint64_t)v16, &qword_268491900);
    sub_22BF08DF0((uint64_t)v19, (uint64_t)v21);
    sub_22BF08E58((uint64_t)v21, v51, &qword_268491908);
    swift_storeEnumTagMultiPayload();
    sub_22BF08C70();
    sub_22BF21560(&qword_268491938, (void (*)(uint64_t))type metadata accessor for WebView);
    sub_22BF59F98();
    return sub_22BF04F40((uint64_t)v21, &qword_268491908);
  }
  else
  {
    uint64_t v30 = v45;
    uint64_t v31 = v42;
    uint64_t v32 = v47;
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v42, v24, v47);
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v40, v31, v32);
    uint64_t v33 = v41;
    sub_22BF59A58();
    sub_22BF2286C(v54, (uint64_t)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for TumblrWebView);
    unint64_t v34 = (*(unsigned __int8 *)(v48 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
    uint64_t v35 = swift_allocObject();
    sub_22BF228C4((uint64_t)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v35 + v34);
    uint64_t v36 = (uint64_t)v46;
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v46, v33, v44);
    uint64_t v37 = v51;
    uint64_t v38 = (void *)(v36 + *(int *)(v52 + 20));
    void *v38 = &unk_268492388;
    v38[1] = v35;
    sub_22BF2286C(v36, v37, (void (*)(void))type metadata accessor for WebView);
    swift_storeEnumTagMultiPayload();
    sub_22BF08C70();
    sub_22BF21560(&qword_268491938, (void (*)(uint64_t))type metadata accessor for WebView);
    sub_22BF59F98();
    sub_22BF215A8(v36, (void (*)(void))type metadata accessor for WebView);
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v31, v32);
  }
}

uint64_t sub_22BF20430(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TumblrWebView(0);
  return (*(uint64_t (**)(void, void))(a1 + *(int *)(v2 + 28)))(0, 0);
}

uint64_t sub_22BF20474(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684917C0);
  v2[4] = swift_task_alloc();
  uint64_t v3 = sub_22BF59A78();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_22BF59B58();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  sub_22BF5A5C8();
  v2[11] = sub_22BF5A5B8();
  uint64_t v6 = sub_22BF5A588();
  return MEMORY[0x270FA2498](sub_22BF205F4, v6, v5);
}

uint64_t sub_22BF205F4()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[4];
  uint64_t v6 = (void *)v0[2];
  swift_release();
  id v7 = objc_msgSend(v6, sel_request);
  sub_22BF59A48();

  sub_22BF59A68();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  if (__swift_getEnumTagSinglePayload(v5, 1, v1) == 1)
  {
    sub_22BF04F40(v0[4], (uint64_t *)&unk_2684917C0);
LABEL_10:
    uint64_t v13 = 1;
    goto LABEL_13;
  }
  uint64_t v8 = v0[3];
  (*(void (**)(void, void, void))(v0[9] + 32))(v0[10], v0[4], v0[8]);
  uint64_t v9 = sub_22BF59B38();
  if (!v10)
  {
LABEL_9:
    (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
    goto LABEL_10;
  }
  if (v9 == *(void *)(v8 + 8) && v10 == *(void *)(v8 + 16))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = sub_22BF5A7A8();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0) {
      goto LABEL_9;
    }
  }
  uint64_t v15 = v0[9];
  uint64_t v14 = v0[10];
  uint64_t v16 = v0[8];
  uint64_t v17 = *(void **)v0[3];
  uint64_t v18 = (void *)sub_22BF59B18();
  objc_msgSend(v17, sel_handleOpenURL_, v18);

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  uint64_t v13 = 0;
LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v19 = (uint64_t (*)(uint64_t))v0[1];
  return v19(v13);
}

void sub_22BF207D8(void **a1)
{
  uint64_t v2 = type metadata accessor for TumblrWebView(0);
  uint64_t v26 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v26 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TumblrWebView.LoadingState(0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v23 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v23 - v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492348);
  sub_22BF5A2B8();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v13, 2, v14);
  sub_22BF215A8((uint64_t)v13, (void (*)(void))type metadata accessor for TumblrWebView.LoadingState);
  if (EnumTagSinglePayload == 1)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 2, 2, v14);
    sub_22BF2286C((uint64_t)v11, (uint64_t)v8, (void (*)(void))type metadata accessor for TumblrWebView.LoadingState);
    sub_22BF5A2C8();
    sub_22BF215A8((uint64_t)v11, (void (*)(void))type metadata accessor for TumblrWebView.LoadingState);
    uint64_t v16 = *a1;
    uint64_t v17 = (uint64_t)a1[2];
    char v24 = a1[1];
    uint64_t v25 = v16;
    sub_22BF2286C((uint64_t)a1, (uint64_t)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for TumblrWebView);
    unint64_t v18 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    uint64_t v19 = swift_allocObject();
    sub_22BF228C4((uint64_t)v4, v19 + v18);
    uint64_t v31 = sub_22BF22BD0;
    uint64_t v32 = v19;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_22BF21238;
    uint64_t v30 = &block_descriptor_27_0;
    uint64_t v20 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    sub_22BF2286C((uint64_t)a1, (uint64_t)v4, (void (*)(void))type metadata accessor for TumblrWebView);
    uint64_t v21 = swift_allocObject();
    sub_22BF228C4((uint64_t)v4, v21 + v18);
    uint64_t v31 = sub_22BF22C24;
    uint64_t v32 = v21;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_22BF213E0;
    uint64_t v30 = &block_descriptor_33_0;
    uint64_t v22 = _Block_copy(&aBlock);
    swift_release();
    sub_22BF22CA4((uint64_t)v24, v17, (uint64_t)v20, (uint64_t)v22, v25);
    swift_bridgeObjectRelease();
    _Block_release(v22);
    _Block_release(v20);
  }
}

uint64_t sub_22BF20B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = a2;
  uint64_t v37 = a1;
  uint64_t v2 = sub_22BF5A418();
  uint64_t v36 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v34 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_22BF5A448();
  uint64_t v33 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v32 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TumblrWebView(0);
  uint64_t v30 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v30 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684917C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22BF59B58();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v27 - v14;
  sub_22BF08E58(v37, (uint64_t)v9, (uint64_t *)&unk_2684917C0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10) == 1) {
    return sub_22BF04F40((uint64_t)v9, (uint64_t *)&unk_2684917C0);
  }
  uint64_t v37 = v2;
  uint64_t v27 = *(void (**)(char *, char *))(v11 + 32);
  uint64_t v29 = v15;
  v27(v15, v9);
  sub_22BEFD454();
  uint64_t v28 = sub_22BF5A648();
  uint64_t v17 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v18 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BF2286C(v31, (uint64_t)v18, (void (*)(void))type metadata accessor for TumblrWebView);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v17, v15, v10);
  unint64_t v19 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  unint64_t v20 = (v6 + *(unsigned __int8 *)(v11 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = swift_allocObject();
  sub_22BF228C4((uint64_t)v18, v21 + v19);
  ((void (*)(unint64_t, char *, uint64_t))v27)(v21 + v20, v17, v10);
  aBlock[4] = sub_22BF22F38;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22BF1F2AC;
  aBlock[3] = &block_descriptor_39;
  uint64_t v22 = _Block_copy(aBlock);
  uint64_t v23 = v32;
  sub_22BF5A438();
  uint64_t v38 = MEMORY[0x263F8EE78];
  sub_22BF21560((unint64_t *)&unk_268491700, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684914C0);
  sub_22BEF96F8((unint64_t *)&qword_268491710, (uint64_t *)&unk_2684914C0);
  char v24 = v34;
  uint64_t v25 = v37;
  sub_22BF5A6D8();
  uint64_t v26 = (void *)v28;
  MEMORY[0x230F588F0](0, v23, v24, v22);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v24, v25);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v23, v35);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v29, v10);
  return swift_release();
}

uint64_t sub_22BF210E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for TumblrWebView.LoadingState(0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v12 - v7;
  uint64_t v9 = sub_22BF59B58();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v8, a2, v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 2, v10);
  type metadata accessor for TumblrWebView(0);
  sub_22BF2286C((uint64_t)v8, (uint64_t)v6, (void (*)(void))type metadata accessor for TumblrWebView.LoadingState);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492348);
  sub_22BF5A2C8();
  return sub_22BF215A8((uint64_t)v8, (void (*)(void))type metadata accessor for TumblrWebView.LoadingState);
}

uint64_t sub_22BF21238(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684917C0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void (**)(char *))(a1 + 32);
  if (a2)
  {
    sub_22BF59B28();
    uint64_t v8 = sub_22BF59B58();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = sub_22BF59B58();
    uint64_t v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v6, v9, 1, v8);
  swift_retain();
  v7(v6);
  swift_release();
  return sub_22BF04F40((uint64_t)v6, (uint64_t *)&unk_2684917C0);
}

uint64_t sub_22BF21320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2 && a4)
  {
    uint64_t v12 = self;
    sub_22BF22D14(a1, a2, v12);
    sub_22BF22D6C(a3, a4, v12);
    uint64_t v13 = *(uint64_t (**)(uint64_t, void))(a6 + *(int *)(type metadata accessor for TumblrWebView(0) + 28));
    return v13(1, 0);
  }
  else
  {
    uint64_t v15 = *(uint64_t (**)(void, uint64_t))(a6 + *(int *)(type metadata accessor for TumblrWebView(0) + 28));
    return v15(0, a5);
  }
}

uint64_t sub_22BF213E0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v7 = sub_22BF5A4C8();
    uint64_t v9 = v8;
    if (v5)
    {
LABEL_3:
      uint64_t v10 = sub_22BF5A4C8();
      uint64_t v5 = v11;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  swift_retain();
  id v12 = a4;
  v6(v7, v9, v10, v5, a4);
  swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BF214B4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22BF214FC()
{
  return sub_22BF1F674(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t type metadata accessor for TumblrWebView.LoadingState(uint64_t a1)
{
  return sub_22BEFD518(a1, (uint64_t *)&unk_268492370);
}

uint64_t type metadata accessor for TumblrWebView(uint64_t a1)
{
  return sub_22BEFD518(a1, (uint64_t *)&unk_268492358);
}

uint64_t sub_22BF21560(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22BF215A8(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_3_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_22BF21600()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

char *sub_22BF21638(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v8;
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (char *)a2 + v9;
    id v12 = v4;
    swift_bridgeObjectRetain();
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 2, v13))
    {
      uint64_t v14 = type metadata accessor for TumblrWebView.LoadingState(0);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      uint64_t v15 = sub_22BF59B58();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v10, v11, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 2, v13);
    }
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492348);
    *(void *)&v10[*(int *)(v16 + 28)] = *(void *)&v11[*(int *)(v16 + 28)];
    uint64_t v17 = *(int *)(a3 + 28);
    unint64_t v18 = &v7[v17];
    unint64_t v19 = (char **)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    *(void *)unint64_t v18 = *v19;
    *((void *)v18 + 1) = v20;
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t sub_22BF217C0(id *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 24);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  if (!__swift_getEnumTagSinglePayload(v4, 2, v5))
  {
    uint64_t v6 = sub_22BF59B58();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492348);
  swift_release();
  return swift_release();
}

void *sub_22BF21890(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v7;
  a1[2] = *(void *)(a2 + 16);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)(a2 + v8);
  id v11 = v6;
  swift_bridgeObjectRetain();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 2, v12))
  {
    uint64_t v13 = type metadata accessor for TumblrWebView.LoadingState(0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v14 = sub_22BF59B58();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v9, v10, v14);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 2, v12);
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492348);
  *(void *)&v9[*(int *)(v15 + 28)] = *(void *)&v10[*(int *)(v15 + 28)];
  uint64_t v16 = *(int *)(a3 + 28);
  uint64_t v17 = (void *)((char *)a1 + v16);
  unint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_22BF219CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)(a1 + v9);
  id v11 = (char *)(a2 + v9);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 2, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 2, v12);
  if (!EnumTagSinglePayload)
  {
    if (!v14)
    {
      uint64_t v23 = sub_22BF59B58();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 24))(v10, v11, v23);
      goto LABEL_7;
    }
    sub_22BF04F40((uint64_t)v10, &qword_268492338);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v16 = type metadata accessor for TumblrWebView.LoadingState(0);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v15 = sub_22BF59B58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v10, v11, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 2, v12);
LABEL_7:
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492348);
  *(void *)&v10[*(int *)(v17 + 28)] = *(void *)&v11[*(int *)(v17 + 28)];
  swift_retain();
  swift_release();
  uint64_t v18 = *(int *)(a3 + 28);
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22BF21BA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)(a1 + v6);
  id v8 = (char *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 2, v9))
  {
    uint64_t v10 = type metadata accessor for TumblrWebView.LoadingState(0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    uint64_t v11 = sub_22BF59B58();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v7, v8, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492348);
  *(void *)&v7[*(int *)(v12 + 28)] = *(void *)&v8[*(int *)(v12 + 28)];
  *(_OWORD *)(a1 + *(int *)(a3 + 28)) = *(_OWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_22BF21CC4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 2, v11);
  int v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 2, v11);
  if (!EnumTagSinglePayload)
  {
    if (!v13)
    {
      uint64_t v18 = sub_22BF59B58();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 40))(v9, v10, v18);
      goto LABEL_7;
    }
    sub_22BF04F40((uint64_t)v9, &qword_268492338);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v15 = type metadata accessor for TumblrWebView.LoadingState(0);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v14 = sub_22BF59B58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v9, v10, v14);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 2, v11);
LABEL_7:
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492348);
  *(void *)&v9[*(int *)(v16 + 28)] = *(void *)&v10[*(int *)(v16 + 28)];
  swift_release();
  *(_OWORD *)(a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  swift_release();
  return a1;
}

uint64_t sub_22BF21E78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BF21E8C);
}

uint64_t sub_22BF21E8C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492348);
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22BF21F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BF21F2C);
}

void *sub_22BF21F2C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492348);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 24);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_22BF21FB0()
{
  sub_22BF22060();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22BF22060()
{
  if (!qword_268492368)
  {
    type metadata accessor for TumblrWebView.LoadingState(255);
    unint64_t v0 = sub_22BF5A2E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268492368);
    }
  }
}

uint64_t *sub_22BF220B8(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v9 = sub_22BF59B58();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t sub_22BF221C0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  uint64_t result = __swift_getEnumTagSinglePayload(a1, 2, v2);
  if (!result)
  {
    uint64_t v4 = sub_22BF59B58();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(a1, v4);
  }
  return result;
}

void *sub_22BF22250(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_22BF59B58();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

void *sub_22BF2231C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 2, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      uint64_t v11 = sub_22BF59B58();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 24))(a1, a2, v11);
      return a1;
    }
    sub_22BF04F40((uint64_t)a1, &qword_268492338);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_22BF59B58();
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  return a1;
}

void *sub_22BF2245C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_22BF59B58();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

void *sub_22BF22528(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 2, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      uint64_t v11 = sub_22BF59B58();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 40))(a1, a2, v11);
      return a1;
    }
    sub_22BF04F40((uint64_t)a1, &qword_268492338);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_22BF59B58();
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  return a1;
}

uint64_t sub_22BF22668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BF2267C);
}

uint64_t sub_22BF2267C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, a2, v4);
  if (EnumTagSinglePayload >= 3) {
    return EnumTagSinglePayload - 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_22BF226C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BF226DC);
}

uint64_t sub_22BF226DC(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  return __swift_storeEnumTagSinglePayload(a1, v5, a3, v6);
}

uint64_t sub_22BF22740(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  return __swift_getEnumTagSinglePayload(a1, 2, v2);
}

uint64_t sub_22BF22788(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  return __swift_storeEnumTagSinglePayload(a1, a2, 2, v4);
}

uint64_t sub_22BF227D8()
{
  uint64_t result = sub_22BF59B58();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_22BF22850()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BF2286C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3_1();
  uint64_t v4 = OUTLINED_FUNCTION_5_1();
  v5(v4);
  return a2;
}

uint64_t sub_22BF228C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TumblrWebView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BF22928@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for TumblrWebView(0);
  OUTLINED_FUNCTION_1_0(v2);
  return sub_22BF1FCA4(a1);
}

uint64_t objectdestroy_10Tm_0()
{
  type metadata accessor for TumblrWebView(0);
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);

  swift_bridgeObjectRelease();
  uint64_t v7 = v1 + v4 + *(int *)(v0 + 24);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  if (!__swift_getEnumTagSinglePayload(v7, 2, v8))
  {
    sub_22BF59B58();
    OUTLINED_FUNCTION_3_1();
    (*(void (**)(uint64_t))(v9 + 8))(v7);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492348);
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v1, v4 + v6, v3 | 7);
}

uint64_t sub_22BF22A8C()
{
  return sub_22BF22B78(sub_22BF20430);
}

uint64_t sub_22BF22AA8(uint64_t a1)
{
  uint64_t v4 = type metadata accessor for TumblrWebView(0);
  OUTLINED_FUNCTION_1_0(v4);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_22BF08B74;
  return sub_22BF20474(a1, v6);
}

uint64_t sub_22BF22B60()
{
  return sub_22BF22B78((uint64_t (*)(uint64_t))sub_22BF207D8);
}

uint64_t sub_22BF22B78(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for TumblrWebView(0);
  OUTLINED_FUNCTION_1_0(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return a1(v4);
}

uint64_t sub_22BF22BD0(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TumblrWebView(0);
  OUTLINED_FUNCTION_1_0(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_22BF20B7C(a1, v5);
}

uint64_t sub_22BF22C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = type metadata accessor for TumblrWebView(0);
  OUTLINED_FUNCTION_1_0(v11);
  uint64_t v13 = v5 + ((*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return sub_22BF21320(a1, a2, a3, a4, a5, v13);
}

void sub_22BF22CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = (id)sub_22BF5A4A8();
  objc_msgSend(a5, sel_authenticate_urlBlock_callback_, v8, a3, a4);
}

void sub_22BF22D14(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_22BF5A4A8();
  objc_msgSend(a3, sel_setTumblrOAuthToken_, v4);
}

void sub_22BF22D6C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_22BF5A4A8();
  objc_msgSend(a3, sel_setTumblrOAuthTokenSecret_, v4);
}

uint64_t sub_22BF22DC4()
{
  type metadata accessor for TumblrWebView(0);
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v17 = *(void *)(v5 + 64);
  uint64_t v6 = sub_22BF59B58();
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = *(void *)(v10 + 64);

  swift_bridgeObjectRelease();
  uint64_t v12 = v1 + v4 + *(int *)(v0 + 24);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268492338);
  if (!__swift_getEnumTagSinglePayload(v12, 2, v13)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
  }
  uint64_t v14 = v3 | v9 | 7;
  uint64_t v15 = (v4 + v17 + v9) & ~v9;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268492348);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1 + v15, v6);
  return MEMORY[0x270FA0238](v1, v15 + v11, v14);
}

uint64_t sub_22BF22F38()
{
  uint64_t v1 = *(void *)(type metadata accessor for TumblrWebView(0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = sub_22BF59B58();
  OUTLINED_FUNCTION_1_0(v4);
  uint64_t v6 = v0 + ((v2 + v3 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_22BF210E8(v0 + v2, v6);
}

uint64_t sub_22BF22FE4()
{
  return sub_22BEF96F8((unint64_t *)&unk_268491960, (uint64_t *)&unk_268492390);
}

uint64_t sub_22BF23070()
{
  return sub_22BF00710(0, &qword_2684923B8);
}

uint64_t sub_22BF230E0()
{
  v3.receiver = v0;
  v3.super_class = (Class)swift_getObjectType();
  id v1 = objc_msgSendSuper2(&v3, sel_layer);
  self;
  return swift_dynamicCastObjCClassUnconditional();
}

id sub_22BF23150(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id sub_22BF231DC(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_22BF2325C()
{
  uint64_t v0 = (objc_class *)type metadata accessor for WFShazamMediaActionView.ListeningView();
  id v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v4.receiver = v1;
  v4.super_class = v0;
  id v2 = objc_msgSendSuper2(&v4, sel_layer);
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_startActiveListeningAnimation);

  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v1;
}

id WFShazamMediaActionView.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

char *WFShazamMediaActionView.init()()
{
  id v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = OBJC_IVAR___WFShazamMediaActionView_listeningView;
  objc_super v4 = v0;
  *(void *)&v1[v3] = sub_22BF2325C();
  uint64_t v5 = OBJC_IVAR___WFShazamMediaActionView_label;
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v7 = (id)qword_2684922C8;
  uint64_t v8 = (void *)sub_22BF5A4A8();
  uint64_t v9 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v8, v9, 0);

  uint64_t v11 = sub_22BF5A4C8();
  uint64_t v13 = v12;

  sub_22BF23C64(v11, v13, v6);
  id v14 = objc_msgSend(self, sel_boldSystemFontOfSize_, 14.0);
  objc_msgSend(v6, sel_setFont_, v14);

  id v15 = objc_msgSend(self, sel_labelColor);
  objc_msgSend(v6, sel_setTextColor_, v15);

  objc_msgSend(v6, sel_setTextAlignment_, 1);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v4[v5] = v6;

  v46.receiver = v4;
  v46.super_class = ObjectType;
  uint64_t v16 = (char *)objc_msgSendSuper2(&v46, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v17 = OBJC_IVAR___WFShazamMediaActionView_listeningView;
  uint64_t v18 = *(void **)&v16[OBJC_IVAR___WFShazamMediaActionView_listeningView];
  uint64_t v19 = v16;
  objc_msgSend(v19, sel_addSubview_, v18);
  uint64_t v20 = OBJC_IVAR___WFShazamMediaActionView_label;
  objc_msgSend(v19, sel_addSubview_, *(void *)&v19[OBJC_IVAR___WFShazamMediaActionView_label]);
  uint64_t v21 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268491B88);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_22BF63550;
  id v23 = objc_msgSend(v18, sel_widthAnchor);
  id v24 = objc_msgSend(v23, sel_constraintEqualToConstant_, 100.0);

  *(void *)(v22 + 32) = v24;
  id v25 = objc_msgSend(*(id *)&v16[v17], sel_heightAnchor);
  id v26 = objc_msgSend(v25, sel_constraintEqualToConstant_, 100.0);

  *(void *)(v22 + 40) = v26;
  id v27 = objc_msgSend(*(id *)&v16[v17], sel_centerXAnchor);
  id v28 = objc_msgSend(v19, sel_centerXAnchor);
  id v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v28);

  *(void *)(v22 + 48) = v29;
  id v30 = objc_msgSend(*(id *)&v16[v17], sel_centerYAnchor);
  id v31 = objc_msgSend(v19, sel_centerYAnchor);
  id v32 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v31);

  *(void *)(v22 + 56) = v32;
  id v33 = objc_msgSend(*(id *)&v19[v20], sel_leadingAnchor);
  id v34 = objc_msgSend(v19, sel_layoutMarginsGuide);
  id v35 = objc_msgSend(v34, sel_leadingAnchor);

  id v36 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v35);
  *(void *)(v22 + 64) = v36;
  id v37 = objc_msgSend(*(id *)&v19[v20], sel_trailingAnchor);
  id v38 = objc_msgSend(v19, sel_layoutMarginsGuide);
  id v39 = objc_msgSend(v38, sel_trailingAnchor);

  id v40 = objc_msgSend(v37, sel_constraintEqualToAnchor_, v39);
  *(void *)(v22 + 72) = v40;
  id v41 = objc_msgSend(*(id *)&v19[v20], sel_centerYAnchor);
  id v42 = objc_msgSend(v19, sel_centerYAnchor);
  id v43 = objc_msgSend(v41, sel_constraintEqualToAnchor_constant_, v42, 72.0);

  *(void *)(v22 + 80) = v43;
  sub_22BF5A578();
  sub_22BF00710(0, &qword_2684923B0);
  uint64_t v44 = (void *)sub_22BF5A558();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_activateConstraints_, v44);

  return v19;
}

void sub_22BF2390C()
{
  uint64_t v1 = OBJC_IVAR___WFShazamMediaActionView_listeningView;
  *(void *)&v0[v1] = sub_22BF2325C();
  uint64_t v2 = OBJC_IVAR___WFShazamMediaActionView_label;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  sub_22BF5A4E8();
  if (qword_268490F80 != -1) {
    swift_once();
  }
  id v4 = (id)qword_2684922C8;
  uint64_t v5 = (void *)sub_22BF5A4A8();
  id v6 = (void *)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, v6, 0);

  uint64_t v8 = sub_22BF5A4C8();
  uint64_t v10 = v9;

  sub_22BF23C64(v8, v10, v3);
  id v11 = objc_msgSend(self, sel_boldSystemFontOfSize_, 14.0);
  objc_msgSend(v3, sel_setFont_, v11);

  id v12 = objc_msgSend(self, sel_labelColor);
  objc_msgSend(v3, sel_setTextColor_, v12);

  objc_msgSend(v3, sel_setTextAlignment_, 1);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v0[v2] = v3;

  sub_22BF5A768();
  __break(1u);
}

id WFShazamMediaActionView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void WFShazamMediaActionView.init(frame:)()
{
}

id sub_22BF23BE0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_22BF23C64(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_22BF5A4A8();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setText_, v4);
}

uint64_t type metadata accessor for WFShazamMediaActionView()
{
  return self;
}

uint64_t type metadata accessor for WFShazamMediaActionView.ListeningView()
{
  return self;
}

id WFLocalizedString(void *a1)
{
  id v1 = a1;
  objc_super v2 = WFCurrentBundle();
  id v3 = [v2 localizedStringForKey:v1 value:v1 table:0];

  return v3;
}

id WFCurrentBundle()
{
  if (WFCurrentBundle_onceToken != -1) {
    dispatch_once(&WFCurrentBundle_onceToken, &__block_literal_global);
  }
  uint64_t v0 = (void *)WFCurrentBundle_bundle;
  return v0;
}

void __WFCurrentBundle_block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(&v4, 0, sizeof(v4));
  if (dladdr(WFCurrentBundle, &v4) && v4.dli_fname)
  {
    uint64_t v0 = [objc_alloc(NSURL) initFileURLWithFileSystemRepresentation:v4.dli_fname isDirectory:0 relativeToURL:0];
    id v1 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    uint64_t v2 = [MEMORY[0x263F086E0] bundleWithURL:v1];
    id v3 = (void *)WFCurrentBundle_bundle;
    WFCurrentBundle_bundle = v2;
  }
  else
  {
    uint64_t v0 = getWFGeneralLogObject();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "WFCurrentBundle_block_invoke";
      _os_log_impl(&dword_22BEF1000, v0, OS_LOG_TYPE_ERROR, "%s WFLocalizedString failed to locate current bundle", buf, 0xCu);
    }
  }
}

id WFLocalizedStringWithKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = WFCurrentBundle();
  id v6 = [v5 localizedStringForKey:v4 value:v3 table:0];

  return v6;
}

void sub_22BF24F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_22BF28A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  objc_destroyWeak(v31);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_22BF2B1B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__396(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__397(uint64_t a1)
{
}

void sub_22BF2DC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_22BF31100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void sub_22BF32A48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22BF386BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getWKWebViewClass_block_invoke(uint64_t a1)
{
  WebKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("WKWebView");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getWKWebViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getWKWebViewClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFShowWebPageActionUIKitUserInterface.m", 18, @"Unable to find class %s", "WKWebView");

    __break(1u);
  }
}

void __getWKWebViewConfigurationClass_block_invoke(uint64_t a1)
{
  WebKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("WKWebViewConfiguration");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getWKWebViewConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getWKWebViewConfigurationClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFShowWebPageActionUIKitUserInterface.m", 19, @"Unable to find class %s", "WKWebViewConfiguration");

    __break(1u);
  }
}

void WebKitLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!WebKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __WebKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264900208;
    uint64_t v5 = 0;
    WebKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!WebKitLibraryCore_frameworkLibrary)
  {
    id v1 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *WebKitLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"WFShowWebPageActionUIKitUserInterface.m", 17, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __WebKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WebKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_22BF38E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSFSafariViewControllerConfigurationClass_block_invoke(uint64_t a1)
{
  SafariServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SFSafariViewControllerConfiguration");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFSafariViewControllerConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getSFSafariViewControllerConfigurationClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFShowWebPageActionUIKitUserInterface.m", 23, @"Unable to find class %s", "SFSafariViewControllerConfiguration");

    __break(1u);
  }
}

void __getSFSafariViewControllerClass_block_invoke(uint64_t a1)
{
  SafariServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SFSafariViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFSafariViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getSFSafariViewControllerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFShowWebPageActionUIKitUserInterface.m", 22, @"Unable to find class %s", "SFSafariViewController");

    __break(1u);
  }
}

void SafariServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SafariServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SafariServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2649001F0;
    uint64_t v5 = 0;
    SafariServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SafariServicesLibraryCore_frameworkLibrary)
  {
    id v1 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *SafariServicesLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"WFShowWebPageActionUIKitUserInterface.m", 21, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SafariServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SafariServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_22BF3C1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void *__getAVMetadataObjectTypeUPCECodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypeUPCECode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypeUPCECodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *AVFoundationLibrary()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __AVFoundationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264900360;
    uint64_t v6 = 0;
    AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)AVFoundationLibraryCore_frameworkLibrary;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *AVFoundationLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 17, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void *__getAVMetadataObjectTypeCode39CodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypeCode39Code");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypeCode39CodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVMetadataObjectTypeCode39Mod43CodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypeCode39Mod43Code");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypeCode39Mod43CodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVMetadataObjectTypeEAN13CodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypeEAN13Code");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypeEAN13CodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVMetadataObjectTypeEAN8CodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypeEAN8Code");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypeEAN8CodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVMetadataObjectTypeCode93CodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypeCode93Code");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypeCode93CodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVMetadataObjectTypeCode128CodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypeCode128Code");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypeCode128CodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVMetadataObjectTypePDF417CodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypePDF417Code");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypePDF417CodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVMetadataObjectTypeQRCodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypeQRCode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypeQRCodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVMetadataObjectTypeAztecCodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypeAztecCode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypeAztecCodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVMetadataObjectTypeInterleaved2of5CodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypeInterleaved2of5Code");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypeInterleaved2of5CodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVMetadataObjectTypeITF14CodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypeITF14Code");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypeITF14CodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVMetadataObjectTypeDataMatrixCodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypeDataMatrixCode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypeDataMatrixCodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AVFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AVFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_22BF3D234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVCaptureSessionClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary_2413();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureSession");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getAVCaptureSessionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFTakePhotoImmediateModeManager.m", 15, @"Unable to find class %s", "AVCaptureSession");

    __break(1u);
  }
}

void *__getAVCaptureSessionPresetPhotoSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary_2413();
  uint64_t result = dlsym(v2, "AVCaptureSessionPresetPhoto");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureSessionPresetPhotoSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *AVFoundationLibrary_2413()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AVFoundationLibraryCore_frameworkLibrary_2418)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __AVFoundationLibraryCore_block_invoke_2419;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264900378;
    uint64_t v6 = 0;
    AVFoundationLibraryCore_frameworkLibrary_2418 = _sl_dlopen();
  }
  uint64_t v0 = (void *)AVFoundationLibraryCore_frameworkLibrary_2418;
  if (!AVFoundationLibraryCore_frameworkLibrary_2418)
  {
    uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *AVFoundationLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFTakePhotoImmediateModeManager.m", 13, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void __getAVCaptureDeviceInputClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary_2413();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureDeviceInput");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceInputClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getAVCaptureDeviceInputClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFTakePhotoImmediateModeManager.m", 16, @"Unable to find class %s", "AVCaptureDeviceInput");

    __break(1u);
  }
}

uint64_t __AVFoundationLibraryCore_block_invoke_2419()
{
  uint64_t result = _sl_dlopen();
  AVFoundationLibraryCore_frameworkLibrary_2418 = result;
  return result;
}

void sub_22BF3DC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary_2413();
  uint64_t result = dlsym(v2, "AVCaptureDeviceTypeBuiltInDualCamera");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary_2413();
  uint64_t result = dlsym(v2, "AVCaptureDeviceTypeBuiltInWideAngleCamera");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getAVCaptureDeviceDiscoverySessionClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary_2413();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureDeviceDiscoverySession");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceDiscoverySessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getAVCaptureDeviceDiscoverySessionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFTakePhotoImmediateModeManager.m", 14, @"Unable to find class %s", "AVCaptureDeviceDiscoverySession");

    __break(1u);
  }
}

void *__getAVMediaTypeVideoSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary_2413();
  uint64_t result = dlsym(v2, "AVMediaTypeVideo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMediaTypeVideoSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void getAVFoundationErrorDomain()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getAVFoundationErrorDomainSymbolLoc_ptr;
  uint64_t v9 = getAVFoundationErrorDomainSymbolLoc_ptr;
  if (!getAVFoundationErrorDomainSymbolLoc_ptr)
  {
    id v1 = AVFoundationLibrary_2413();
    v7[3] = (uint64_t)dlsym(v1, "AVFoundationErrorDomain");
    getAVFoundationErrorDomainSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    long long v4 = [MEMORY[0x263F08690] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSErrorDomain getAVFoundationErrorDomain(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFTakePhotoImmediateModeManager.m", 23, @"%s", dlerror());

    __break(1u);
  }
}

void sub_22BF3DFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAVFoundationErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary_2413();
  uint64_t result = dlsym(v2, "AVFoundationErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVFoundationErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22BF3E160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVCapturePhotoSettingsClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary_2413();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AVCapturePhotoSettings");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVCapturePhotoSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getAVCapturePhotoSettingsClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFTakePhotoImmediateModeManager.m", 18, @"Unable to find class %s", "AVCapturePhotoSettings");

    __break(1u);
  }
}

void sub_22BF3E3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVCapturePhotoOutputClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary_2413();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AVCapturePhotoOutput");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVCapturePhotoOutputClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getAVCapturePhotoOutputClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFTakePhotoImmediateModeManager.m", 17, @"Unable to find class %s", "AVCapturePhotoOutput");

    __break(1u);
  }
}

void sub_22BF3FE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getQLPreviewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!QuickLookLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __QuickLookLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_2649003D8;
    uint64_t v8 = 0;
    QuickLookLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!QuickLookLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    long long v4 = [NSString stringWithUTF8String:"void *QuickLookLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"WFMarkupActionUIKitUserInterface.m", 18, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("QLPreviewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"Class getQLPreviewControllerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFMarkupActionUIKitUserInterface.m", 19, @"Unable to find class %s", "QLPreviewController");

LABEL_10:
    __break(1u);
  }
  getQLPreviewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __QuickLookLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  QuickLookLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_22BF4141C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
}

uint64_t __Block_byref_object_copy__2875(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2876(uint64_t a1)
{
}

uint64_t __WFActivityItemValuesFromContentItems_block_invoke(uint64_t a1, void *a2)
{
  return [a2 activityViewController:*(void *)(a1 + 32) itemForActivityType:0];
}

void __WFExtensionItemsForActivityItemValues_block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 userInfo];
  if (v3)
  {
    long long v4 = [v7 userInfo];
    id v5 = (id)[v4 mutableCopy];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }

  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v6 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v6 = MEMORY[0x263EFFA80];
  }
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F6BD68]];
  [v7 setUserInfo:v5];
}

void sub_22BF42090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id *location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  objc_destroyWeak(v61);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

id getSLComposeViewControllerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSLComposeViewControllerClass_softClass;
  uint64_t v7 = getSLComposeViewControllerClass_softClass;
  if (!getSLComposeViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSLComposeViewControllerClass_block_invoke;
    v3[3] = &unk_264900EF8;
    v3[4] = &v4;
    __getSLComposeViewControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22BF423AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WFExtensionCommunicationError(void *a1)
{
  v10[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = WFLocalizedStringWithKey(@"App Communication Failure (iOS)", @"App Communication Failure");
  id v3 = WFLocalizedStringWithKey(@"Unable to communicate with selected app. (iOS)", @"Unable to communicate with selected app.");
  uint64_t v4 = *MEMORY[0x263F08320];
  v9[0] = *MEMORY[0x263F08338];
  v9[1] = v4;
  v10[0] = v2;
  v10[1] = v3;
  id v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v6 = (void *)[v5 mutableCopy];

  if (v1) {
    [v6 setObject:v1 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"WFShareActionUIKitUserInterfaceErrorDomain" code:1 userInfo:v6];

  return v7;
}

void __WFConfiguredViewControllerForShareExtension_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = *(void (**)(uint64_t, void, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 0, 0);
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] userCancelledError];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
}

uint64_t __WFConfiguredViewControllerForActionExtension_block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __WFConfiguredViewControllerForActionExtension_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [MEMORY[0x263F087E8] userCancelledError];
    uint64_t v7 = v6;
    if (v4)
    {
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = [v6 domain];
      uint64_t v10 = [v7 code];
      uint64_t v13 = *MEMORY[0x263F08608];
      v14[0] = v4;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      id v12 = [v8 errorWithDomain:v9 code:v10 userInfo:v11];
    }
    else
    {
      id v12 = v6;
    }

    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v12);
  }
}

void __WFConfiguredViewControllerForActionExtension_block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v1 = *(void *)(a1 + 32);
    WFExtensionCommunicationError(0);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __WFConfiguredViewControllerForActionExtension_block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  id v16 = v7;
  if (a2 && v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) infoDictionary];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"NSExtension"];

    uint64_t v10 = [v9 objectForKeyedSubscript:@"NSExtensionActionWantsFullScreenPresentation"];
    if ([v10 BOOLValue])
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v13 = [v9 objectForKeyedSubscript:@"NSExtensionAttributes"];
      id v14 = [v13 objectForKeyedSubscript:@"NSExtensionActionWantsFullScreenPresentation"];
      if ([v14 BOOLValue]) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = 2;
      }
    }
    [v16 setModalPresentationStyle:v11];
    id v15 = [v16 view];
    [v15 setTintAdjustmentMode:1];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v9 = WFExtensionCommunicationError(a4);
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v9);
  }
}

Class __getSLComposeViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!SocialLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __SocialLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_264900610;
    uint64_t v8 = 0;
    SocialLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SocialLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *SocialLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"WFShareActionUIKitUserInterface.m", 24, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("SLComposeViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getSLComposeViewControllerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFShareActionUIKitUserInterface.m", 25, @"Unable to find class %s", "SLComposeViewController");

LABEL_10:
    __break(1u);
  }
  getSLComposeViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SocialLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SocialLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_22BF42D18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22BF471D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPMediaPickerControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __MediaPlayerLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_264900830;
    uint64_t v8 = 0;
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *MediaPlayerLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"WFSelectMusicActionUIKitUserInterface.m", 16, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("MPMediaPickerController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getMPMediaPickerControllerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFSelectMusicActionUIKitUserInterface.m", 17, @"Unable to find class %s", "MPMediaPickerController");

LABEL_10:
    __break(1u);
  }
  getMPMediaPickerControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaPlayerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_22BF4B5E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void __Block_byref_object_copy__4343(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__4344(uint64_t a1)
{
}

id getSLComposeViewControllerClass_4457()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSLComposeViewControllerClass_softClass_4467;
  uint64_t v7 = getSLComposeViewControllerClass_softClass_4467;
  if (!getSLComposeViewControllerClass_softClass_4467)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSLComposeViewControllerClass_block_invoke_4468;
    v3[3] = &unk_264900EF8;
    v3[4] = &v4;
    __getSLComposeViewControllerClass_block_invoke_4468((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22BF4D2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22BF4D3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getSLComposeViewControllerClass_block_invoke_4468(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!SocialLibraryCore_frameworkLibrary_4469)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __SocialLibraryCore_block_invoke_4470;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_264900AE8;
    uint64_t v8 = 0;
    SocialLibraryCore_frameworkLibrary_4469 = _sl_dlopen();
  }
  if (!SocialLibraryCore_frameworkLibrary_4469)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *SocialLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"WFShareExtensionActionUIKitUserInterface.m", 24, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("SLComposeViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getSLComposeViewControllerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFShareExtensionActionUIKitUserInterface.m", 25, @"Unable to find class %s", "SLComposeViewController");

LABEL_10:
    __break(1u);
  }
  getSLComposeViewControllerClass_softClass_4467 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SocialLibraryCore_block_invoke_4470()
{
  uint64_t result = _sl_dlopen();
  SocialLibraryCore_frameworkLibrary_4469 = result;
  return result;
}

void sub_22BF4DAA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22BF4E6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSBFWallpaperOptionsClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!SpringBoardFoundationLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __SpringBoardFoundationLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_264900C48;
    uint64_t v8 = 0;
    SpringBoardFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpringBoardFoundationLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *SpringBoardFoundationLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"WFSetWallpaperActionUIKitUserInterface.m", 21, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("SBFWallpaperOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getSBFWallpaperOptionsClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFSetWallpaperActionUIKitUserInterface.m", 22, @"Unable to find class %s", "SBFWallpaperOptions");

LABEL_10:
    __break(1u);
  }
  getSBFWallpaperOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSBSUIWallpaperPreviewViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __SpringBoardUIServicesLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_264900C60;
    uint64_t v8 = 0;
    SpringBoardUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *SpringBoardUIServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"WFSetWallpaperActionUIKitUserInterface.m", 23, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("SBSUIWallpaperPreviewViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getSBSUIWallpaperPreviewViewControllerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFSetWallpaperActionUIKitUserInterface.m", 24, @"Unable to find class %s", "SBSUIWallpaperPreviewViewController");

LABEL_10:
    __break(1u);
  }
  getSBSUIWallpaperPreviewViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardUIServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardUIServicesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __SpringBoardFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_22BF4ED38(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __getPRSServiceClass_block_invoke(uint64_t a1)
{
  PosterBoardServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PRSService");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPRSServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPRSServiceClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFSetWallpaperActionUIKitUserInterface.m", 31, @"Unable to find class %s", "PRSService");

    __break(1u);
  }
}

void sub_22BF4F1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPRSPosterUpdateSessionInfoClass_block_invoke(uint64_t a1)
{
  PosterBoardServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PRSPosterUpdateSessionInfo");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPRSPosterUpdateSessionInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPRSPosterUpdateSessionInfoClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFSetWallpaperActionUIKitUserInterface.m", 32, @"Unable to find class %s", "PRSPosterUpdateSessionInfo");

    __break(1u);
  }
}

void __getPRUISModalEntryPointEditingClass_block_invoke(uint64_t a1)
{
  PosterBoardUILibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PRUISModalEntryPointEditing");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPRUISModalEntryPointEditingClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPRUISModalEntryPointEditingClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFSetWallpaperActionUIKitUserInterface.m", 27, @"Unable to find class %s", "PRUISModalEntryPointEditing");

    __break(1u);
  }
}

void __getPRUISModalRemoteViewControllerClass_block_invoke(uint64_t a1)
{
  PosterBoardUILibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PRUISModalRemoteViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPRUISModalRemoteViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPRUISModalRemoteViewControllerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFSetWallpaperActionUIKitUserInterface.m", 28, @"Unable to find class %s", "PRUISModalRemoteViewController");

    __break(1u);
  }
}

void PosterBoardUILibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!PosterBoardUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __PosterBoardUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264900C30;
    uint64_t v5 = 0;
    PosterBoardUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PosterBoardUILibraryCore_frameworkLibrary)
  {
    uint64_t v1 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *PosterBoardUILibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"WFSetWallpaperActionUIKitUserInterface.m", 26, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __PosterBoardUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PosterBoardUILibraryCore_frameworkLibrary = result;
  return result;
}

void PosterBoardServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!PosterBoardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __PosterBoardServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264900C18;
    uint64_t v5 = 0;
    PosterBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PosterBoardServicesLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *PosterBoardServicesLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"WFSetWallpaperActionUIKitUserInterface.m", 30, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __PosterBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PosterBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_22BF51E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getWKWebViewClass_block_invoke_4990(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!WebKitLibraryCore_frameworkLibrary_4993)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __WebKitLibraryCore_block_invoke_4994;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_264900D60;
    uint64_t v8 = 0;
    WebKitLibraryCore_frameworkLibrary_4993 = _sl_dlopen();
  }
  if (!WebKitLibraryCore_frameworkLibrary_4993)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    long long v4 = [NSString stringWithUTF8String:"void *WebKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"WFContentItemViewController.m", 16, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("WKWebView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getWKWebViewClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFContentItemViewController.m", 17, @"Unable to find class %s", "WKWebView");

LABEL_10:
    __break(1u);
  }
  getWKWebViewClass_softClass_4989 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __WebKitLibraryCore_block_invoke_4994()
{
  uint64_t result = _sl_dlopen();
  WebKitLibraryCore_frameworkLibrary_4993 = result;
  return result;
}

void sub_22BF53CBC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void *__getAVCaptureSessionInterruptionReasonKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary_5399();
  uint64_t result = dlsym(v2, "AVCaptureSessionInterruptionReasonKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureSessionInterruptionReasonKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *AVFoundationLibrary_5399()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AVFoundationLibraryCore_frameworkLibrary_5407)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __AVFoundationLibraryCore_block_invoke_5408;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264900E68;
    uint64_t v6 = 0;
    AVFoundationLibraryCore_frameworkLibrary_5407 = _sl_dlopen();
  }
  uint64_t v0 = (void *)AVFoundationLibraryCore_frameworkLibrary_5407;
  if (!AVFoundationLibraryCore_frameworkLibrary_5407)
  {
    uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *AVFoundationLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"CDZQRScanningViewController.m", 25, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AVFoundationLibraryCore_block_invoke_5408()
{
  uint64_t result = _sl_dlopen();
  AVFoundationLibraryCore_frameworkLibrary_5407 = result;
  return result;
}

void sub_22BF5411C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAVCaptureSessionErrorKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary_5399();
  uint64_t result = dlsym(v2, "AVCaptureSessionErrorKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureSessionErrorKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22BF54F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getAVCaptureSessionClass_block_invoke_5418(uint64_t a1)
{
  AVFoundationLibrary_5399();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureSession");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureSessionClass_softClass_5417 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getAVCaptureSessionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CDZQRScanningViewController.m", 26, @"Unable to find class %s", "AVCaptureSession");

    __break(1u);
  }
}

void sub_22BF55860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void __getAVCaptureVideoPreviewLayerClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary_5399();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureVideoPreviewLayer");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureVideoPreviewLayerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getAVCaptureVideoPreviewLayerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CDZQRScanningViewController.m", 30, @"Unable to find class %s", "AVCaptureVideoPreviewLayer");

    __break(1u);
  }
}

void *__getAVLayerVideoGravityResizeAspectFillSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary_5399();
  uint64_t result = dlsym(v2, "AVLayerVideoGravityResizeAspectFill");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getAVCaptureDeviceClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary_5399();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureDevice");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getAVCaptureDeviceClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CDZQRScanningViewController.m", 27, @"Unable to find class %s", "AVCaptureDevice");

    __break(1u);
  }
}

void *__getAVMediaTypeVideoSymbolLoc_block_invoke_5425(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary_5399();
  uint64_t result = dlsym(v2, "AVMediaTypeVideo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMediaTypeVideoSymbolLoc_ptr_5424 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getAVCaptureDeviceInputClass_block_invoke_5429(uint64_t a1)
{
  AVFoundationLibrary_5399();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureDeviceInput");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceInputClass_softClass_5428 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getAVCaptureDeviceInputClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CDZQRScanningViewController.m", 28, @"Unable to find class %s", "AVCaptureDeviceInput");

    __break(1u);
  }
}

void __getAVCaptureMetadataOutputClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary_5399();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureMetadataOutput");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureMetadataOutputClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getAVCaptureMetadataOutputClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CDZQRScanningViewController.m", 29, @"Unable to find class %s", "AVCaptureMetadataOutput");

    __break(1u);
  }
}

void sub_22BF560F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAVMetadataObjectTypeQRCodeSymbolLoc_block_invoke_5437(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary_5399();
  uint64_t result = dlsym(v2, "AVMetadataObjectTypeQRCode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMetadataObjectTypeQRCodeSymbolLoc_ptr_5436 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void getAVCaptureSessionRuntimeErrorNotification()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getAVCaptureSessionRuntimeErrorNotificationSymbolLoc_ptr;
  uint64_t v9 = getAVCaptureSessionRuntimeErrorNotificationSymbolLoc_ptr;
  if (!getAVCaptureSessionRuntimeErrorNotificationSymbolLoc_ptr)
  {
    uint64_t v1 = AVFoundationLibrary_5399();
    v7[3] = (uint64_t)dlsym(v1, "AVCaptureSessionRuntimeErrorNotification");
    getAVCaptureSessionRuntimeErrorNotificationSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    long long v4 = [MEMORY[0x263F08690] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSNotificationName getAVCaptureSessionRuntimeErrorNotification(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"CDZQRScanningViewController.m", 32, @"%s", dlerror());

    __break(1u);
  }
}

void sub_22BF564AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVCaptureSessionWasInterruptedNotification()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getAVCaptureSessionWasInterruptedNotificationSymbolLoc_ptr;
  uint64_t v9 = getAVCaptureSessionWasInterruptedNotificationSymbolLoc_ptr;
  if (!getAVCaptureSessionWasInterruptedNotificationSymbolLoc_ptr)
  {
    uint64_t v1 = AVFoundationLibrary_5399();
    v7[3] = (uint64_t)dlsym(v1, "AVCaptureSessionWasInterruptedNotification");
    getAVCaptureSessionWasInterruptedNotificationSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    long long v4 = [MEMORY[0x263F08690] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSNotificationName getAVCaptureSessionWasInterruptedNotification(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"CDZQRScanningViewController.m", 33, @"%s", dlerror());

    __break(1u);
  }
}

void sub_22BF56614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVCaptureSessionInterruptionEndedNotification()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getAVCaptureSessionInterruptionEndedNotificationSymbolLoc_ptr;
  uint64_t v9 = getAVCaptureSessionInterruptionEndedNotificationSymbolLoc_ptr;
  if (!getAVCaptureSessionInterruptionEndedNotificationSymbolLoc_ptr)
  {
    uint64_t v1 = AVFoundationLibrary_5399();
    v7[3] = (uint64_t)dlsym(v1, "AVCaptureSessionInterruptionEndedNotification");
    getAVCaptureSessionInterruptionEndedNotificationSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    long long v4 = [MEMORY[0x263F08690] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSNotificationName getAVCaptureSessionInterruptionEndedNotification(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"CDZQRScanningViewController.m", 34, @"%s", dlerror());

    __break(1u);
  }
}

void sub_22BF5677C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAVCaptureSessionInterruptionEndedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary_5399();
  uint64_t result = dlsym(v2, "AVCaptureSessionInterruptionEndedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureSessionInterruptionEndedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void *__getAVCaptureSessionWasInterruptedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary_5399();
  uint64_t result = dlsym(v2, "AVCaptureSessionWasInterruptedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureSessionWasInterruptedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVCaptureSessionRuntimeErrorNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = AVFoundationLibrary_5399();
  uint64_t result = dlsym(v2, "AVCaptureSessionRuntimeErrorNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureSessionRuntimeErrorNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22BF575B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNContactPickerViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __ContactsUILibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_264900F18;
    uint64_t v8 = 0;
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    long long v4 = [NSString stringWithUTF8String:"void *ContactsUILibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"WFSelectContactsActionUIKitUserInterface.m", 21, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("CNContactPickerViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"Class getCNContactPickerViewControllerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFSelectContactsActionUIKitUserInterface.m", 22, @"Unable to find class %s", "CNContactPickerViewController");

LABEL_10:
    __break(1u);
  }
  getCNContactPickerViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ContactsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsUILibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t sub_22BF59A38()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_22BF59A48()
{
  return MEMORY[0x270EEDC48]();
}

uint64_t sub_22BF59A58()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_22BF59A68()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_22BF59A78()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_22BF59A88()
{
  return MEMORY[0x270EEF128]();
}

uint64_t sub_22BF59AF8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_22BF59B08()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_22BF59B18()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22BF59B28()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_22BF59B38()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_22BF59B48()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_22BF59B58()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22BF59B68()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_22BF59B78()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22BF59B88()
{
  return MEMORY[0x270EF1458]();
}

uint64_t sub_22BF59B98()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_22BF59BA8()
{
  return MEMORY[0x270F85A00]();
}

uint64_t sub_22BF59BB8()
{
  return MEMORY[0x270F85A08]();
}

uint64_t sub_22BF59BC8()
{
  return MEMORY[0x270F85A10]();
}

uint64_t sub_22BF59BD8()
{
  return MEMORY[0x270F85A18]();
}

uint64_t sub_22BF59BE8()
{
  return MEMORY[0x270F85A20]();
}

uint64_t sub_22BF59BF8()
{
  return MEMORY[0x270F85A28]();
}

uint64_t sub_22BF59C08()
{
  return MEMORY[0x270F85A58]();
}

uint64_t sub_22BF59C18()
{
  return MEMORY[0x270F85A88]();
}

uint64_t sub_22BF59C28()
{
  return MEMORY[0x270F86320]();
}

uint64_t sub_22BF59C38()
{
  return MEMORY[0x270F86328]();
}

uint64_t sub_22BF59C48()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_22BF59C58()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_22BF59C68()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_22BF59C78()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_22BF59C88()
{
  return MEMORY[0x270EFF0E0]();
}

uint64_t sub_22BF59C98()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_22BF59CA8()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_22BF59CB8()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_22BF59CC8()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_22BF59CD8()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_22BF59CE8()
{
  return MEMORY[0x270EFFA20]();
}

uint64_t sub_22BF59CF8()
{
  return MEMORY[0x270EFFA28]();
}

uint64_t sub_22BF59D08()
{
  return MEMORY[0x270EFFAC0]();
}

uint64_t sub_22BF59D18()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_22BF59D28()
{
  return MEMORY[0x270EFFB70]();
}

uint64_t sub_22BF59D38()
{
  return MEMORY[0x270F003B8]();
}

uint64_t sub_22BF59D48()
{
  return MEMORY[0x270F003C0]();
}

uint64_t sub_22BF59D58()
{
  return MEMORY[0x270F003C8]();
}

uint64_t sub_22BF59D68()
{
  return MEMORY[0x270F00528]();
}

uint64_t sub_22BF59D78()
{
  return MEMORY[0x270F00530]();
}

uint64_t sub_22BF59D88()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_22BF59D98()
{
  return MEMORY[0x270F86698]();
}

uint64_t sub_22BF59DA8()
{
  return MEMORY[0x270F866A0]();
}

uint64_t sub_22BF59DB8()
{
  return MEMORY[0x270F00A68]();
}

uint64_t sub_22BF59DC8()
{
  return MEMORY[0x270F00A70]();
}

uint64_t sub_22BF59DD8()
{
  return MEMORY[0x270F00AC0]();
}

uint64_t sub_22BF59DE8()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_22BF59DF8()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_22BF59E08()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_22BF59E18()
{
  return MEMORY[0x270F00E28]();
}

uint64_t sub_22BF59E28()
{
  return MEMORY[0x270F00E30]();
}

uint64_t sub_22BF59E38()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_22BF59E48()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_22BF59E58()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_22BF59E68()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_22BF59E78()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_22BF59E88()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_22BF59E98()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_22BF59EA8()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_22BF59EB8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_22BF59EC8()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_22BF59ED8()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_22BF59EE8()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_22BF59EF8()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_22BF59F18()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_22BF59F28()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_22BF59F38()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_22BF59F48()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_22BF59F58()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_22BF59F68()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_22BF59F88()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_22BF59F98()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_22BF59FA8()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_22BF59FB8()
{
  return MEMORY[0x270F019E8]();
}

uint64_t sub_22BF59FC8()
{
  return MEMORY[0x270F019F0]();
}

uint64_t sub_22BF59FD8()
{
  return MEMORY[0x270F01A28]();
}

uint64_t sub_22BF59FE8()
{
  return MEMORY[0x270F01A40]();
}

uint64_t sub_22BF59FF8()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_22BF5A008()
{
  return MEMORY[0x270F01B20]();
}

uint64_t sub_22BF5A018()
{
  return MEMORY[0x270F01B30]();
}

uint64_t sub_22BF5A028()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_22BF5A038()
{
  return MEMORY[0x270F02120]();
}

uint64_t sub_22BF5A048()
{
  return MEMORY[0x270F02128]();
}

uint64_t sub_22BF5A058()
{
  return MEMORY[0x270F021E0]();
}

uint64_t sub_22BF5A068()
{
  return MEMORY[0x270F021E8]();
}

uint64_t sub_22BF5A078()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_22BF5A088()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_22BF5A098()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_22BF5A0A8()
{
  return MEMORY[0x270F02D78]();
}

uint64_t sub_22BF5A0B8()
{
  return MEMORY[0x270F02DA8]();
}

uint64_t sub_22BF5A0C8()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_22BF5A0D8()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_22BF5A0E8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_22BF5A0F8()
{
  return MEMORY[0x270F03290]();
}

uint64_t sub_22BF5A108()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_22BF5A118()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_22BF5A128()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_22BF5A138()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_22BF5A148()
{
  return MEMORY[0x270F035B8]();
}

uint64_t sub_22BF5A158()
{
  return MEMORY[0x270F036B0]();
}

uint64_t sub_22BF5A168()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_22BF5A178()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_22BF5A188()
{
  return MEMORY[0x270F03880]();
}

uint64_t sub_22BF5A198()
{
  return MEMORY[0x270F039D8]();
}

uint64_t sub_22BF5A1A8()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_22BF5A1B8()
{
  return MEMORY[0x270F03F68]();
}

uint64_t sub_22BF5A1C8()
{
  return MEMORY[0x270F03F70]();
}

uint64_t sub_22BF5A1D8()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_22BF5A1E8()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_22BF5A1F8()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_22BF5A208()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_22BF5A218()
{
  return MEMORY[0x270F86770]();
}

uint64_t sub_22BF5A228()
{
  return MEMORY[0x270F042E8]();
}

uint64_t sub_22BF5A238()
{
  return MEMORY[0x270F042F8]();
}

uint64_t sub_22BF5A248()
{
  return MEMORY[0x270F04310]();
}

uint64_t sub_22BF5A258()
{
  return MEMORY[0x270F04330]();
}

uint64_t sub_22BF5A268()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_22BF5A278()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_22BF5A288()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_22BF5A298()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_22BF5A2A8()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_22BF5A2B8()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_22BF5A2C8()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_22BF5A2D8()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_22BF5A2E8()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_22BF5A2F8()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_22BF5A308()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_22BF5A318()
{
  return MEMORY[0x270F049A8]();
}

uint64_t sub_22BF5A328()
{
  return MEMORY[0x270F04AE0]();
}

uint64_t sub_22BF5A338()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_22BF5A348()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_22BF5A358()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_22BF5A368()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_22BF5A378()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_22BF5A388()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_22BF5A398()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_22BF5A3A8()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_22BF5A3B8()
{
  return MEMORY[0x270F04D80]();
}

uint64_t sub_22BF5A3C8()
{
  return MEMORY[0x270F04E98]();
}

uint64_t sub_22BF5A3D8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_22BF5A3E8()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_22BF5A3F8()
{
  return MEMORY[0x270F052C0]();
}

uint64_t sub_22BF5A408()
{
  return MEMORY[0x270F052D0]();
}

uint64_t sub_22BF5A418()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22BF5A428()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_22BF5A438()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22BF5A448()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22BF5A458()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22BF5A468()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_22BF5A478()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_22BF5A488()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_22BF5A498()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22BF5A4A8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22BF5A4B8()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_22BF5A4C8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22BF5A4D8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_22BF5A4E8()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_22BF5A4F8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22BF5A508()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_22BF5A518()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_22BF5A528()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22BF5A538()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22BF5A548()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22BF5A558()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22BF5A568()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22BF5A578()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22BF5A588()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_22BF5A598()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_22BF5A5A8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_22BF5A5B8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_22BF5A5C8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_22BF5A5D8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_22BF5A5E8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_22BF5A5F8()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_22BF5A608()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_22BF5A618()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_22BF5A628()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_22BF5A638()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_22BF5A648()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22BF5A658()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22BF5A668()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_22BF5A678()
{
  return MEMORY[0x270F867B8]();
}

uint64_t sub_22BF5A688()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_22BF5A698()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22BF5A6A8()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_22BF5A6B8()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_22BF5A6C8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22BF5A6D8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22BF5A6E8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22BF5A6F8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22BF5A708()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22BF5A718()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_22BF5A728()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_22BF5A738()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_22BF5A748()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_22BF5A758()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_22BF5A768()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22BF5A778()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22BF5A788()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22BF5A798()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_22BF5A7A8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22BF5A7E8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22BF5A7F8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22BF5A808()
{
  return MEMORY[0x270F9FC90]();
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
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

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F82BC0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F82DD0](image, compressionQuality);
}

uint64_t WFCNPropertyKeysFromActionProperties()
{
  return MEMORY[0x270F0A598]();
}

uint64_t WFContactFromCNContactProperty()
{
  return MEMORY[0x270F186E0]();
}

uint64_t WFContactPropertyIDsFromActionProperties()
{
  return MEMORY[0x270F0A5A0]();
}

uint64_t WFContentCollectionFromStorageServiceResult()
{
  return MEMORY[0x270F0A5A8]();
}

uint64_t WFFooterTextForHomeAction()
{
  return MEMORY[0x270F86308]();
}

uint64_t WFGetWorkflowEventStore()
{
  return MEMORY[0x270F18738]();
}

uint64_t WFImageAtIndexFromImageSource()
{
  return MEMORY[0x270F18748]();
}

uint64_t WFImageSourceCreateFromFile()
{
  return MEMORY[0x270F18788]();
}

uint64_t WFLivePhotoFileType()
{
  return MEMORY[0x270F18798]();
}

uint64_t WFPinboardStoreSecretForUsername()
{
  return MEMORY[0x270F0A5B0]();
}

uint64_t WFPredicateForEnablingPerson()
{
  return MEMORY[0x270F187D8]();
}

uint64_t WFPredicateForSelectionOfPerson()
{
  return MEMORY[0x270F187E0]();
}

uint64_t WFUserInterfaceFromViewController()
{
  return MEMORY[0x270F86818]();
}

uint64_t WFViewControllerFromUserInterface()
{
  return MEMORY[0x270F86820]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x270EE55A0]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

uint64_t _NSExtensionItemsFromActivityItemValues()
{
  return MEMORY[0x270F631A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270ED9610](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t getWFActionsLogObject()
{
  return MEMORY[0x270F848C0]();
}

uint64_t getWFGeneralLogObject()
{
  return MEMORY[0x270F84900]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

void objc_moveWeak(id *to, id *from)
{
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastMetatypeUnconditional()
{
  return MEMORY[0x270FA0280]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
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