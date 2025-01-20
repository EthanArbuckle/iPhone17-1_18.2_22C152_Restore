uint64_t sub_22B127FC0()
{
  return swift_weakInit();
}

uint64_t sub_22B127FD0(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_22B1389F0();
  v14[1] = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_22B138960();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22B138C20();
  v11 = (void *)(v3
                 + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_probeSampleGenerationHandler);
  void *v11 = 0;
  v11[1] = 0;
  *(void *)(v3 + 16) = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
  sub_22B129838();
  id v12 = a1;
  sub_22B1389A0();
  sub_22B12828C();

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a2, v7);
  return v3;
}

uint64_t sub_22B12828C()
{
  uint64_t v1 = sub_22B1389F0();
  uint64_t v60 = *(void *)(v1 - 8);
  uint64_t v61 = v1;
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v56 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v49 - v4;
  uint64_t v6 = sub_22B138C40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v55 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v59 = (char *)&v49 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v14 = (char *)&v49 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  v17 = (char *)&v49 - v16;
  MEMORY[0x270FA5388](v15);
  v19 = (char *)&v49 - v18;
  uint64_t v53 = v0;
  uint64_t v20 = v0 + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_config;
  swift_beginAccess();
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v21(v19, v20, v6);
  sub_22B138C00();
  swift_beginAccess();
  uint64_t v57 = v7;
  uint64_t v22 = v7;
  uint64_t v23 = v7 + 16;
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 24))(v20, v17, v6);
  swift_endAccess();
  unint64_t v54 = sub_22B129A4C();
  sub_22B138E10();
  v62 = (void (*)(char *, char *, uint64_t))v21;
  v21(v14, (uint64_t)v17, v6);
  v58 = (void (*)(void, void))v5;
  v24 = sub_22B1389E0();
  os_log_type_t v25 = sub_22B138D80();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    v51 = v17;
    v27 = (uint8_t *)v26;
    uint64_t v28 = swift_slowAlloc();
    v50 = v19;
    uint64_t v29 = v28;
    v64[0] = v28;
    uint64_t v52 = v6;
    *(_DWORD *)v27 = 136446210;
    uint64_t v30 = sub_22B138C30();
    uint64_t v63 = sub_22B129B78(v30, v31, v64);
    uint64_t v6 = v52;
    sub_22B138E30();
    swift_bridgeObjectRelease();
    uint64_t v49 = v23;
    v32 = *(void (**)(char *, uint64_t))(v57 + 8);
    v32(v14, v6);
    _os_log_impl(&dword_22B126000, v24, v25, "PlaygroundLoggerProbePoint config updated: (%{public}s)", v27, 0xCu);
    swift_arrayDestroy();
    uint64_t v33 = v29;
    v19 = v50;
    MEMORY[0x230F409D0](v33, -1, -1);
    v34 = v27;
    v17 = v51;
    MEMORY[0x230F409D0](v34, -1, -1);
  }
  else
  {
    v32 = *(void (**)(char *, uint64_t))(v57 + 8);
    v32(v14, v6);
  }

  v35 = v58;
  v58 = *(void (**)(void, void))(v60 + 8);
  v58(v35, v61);
  swift_beginAccess();
  char v36 = sub_22B138C10();
  swift_endAccess();
  v37 = v59;
  v62(v59, v19, v6);
  if (v36)
  {
    char v38 = sub_22B138C10();
    v32(v37, v6);
    if ((v38 & 1) == 0)
    {
      sub_22B129070();
      if (qword_2683E43F0 != -1) {
        swift_once();
      }
      swift_weakAssign();
      *MEMORY[0x263F52248] = sub_22B128F44;
      goto LABEL_19;
    }
  }
  else
  {
    v32(v37, v6);
  }
  swift_beginAccess();
  char v39 = sub_22B138C10();
  swift_endAccess();
  v40 = v55;
  v62(v55, v19, v6);
  if (v39)
  {
    v32(v40, v6);
    v41 = v56;
LABEL_16:
    sub_22B138E10();
    v43 = sub_22B1389E0();
    os_log_type_t v44 = sub_22B138D80();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = v6;
      v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v46 = 0;
      _os_log_impl(&dword_22B126000, v43, v44, "PlaygroundLoggerProbePoint config was updated but nothing changed", v46, 2u);
      v47 = v46;
      uint64_t v6 = v45;
      MEMORY[0x230F409D0](v47, -1, -1);
    }

    v58(v41, v61);
    goto LABEL_19;
  }
  char v42 = sub_22B138C10();
  v32(v40, v6);
  v41 = v56;
  if ((v42 & 1) == 0) {
    goto LABEL_16;
  }
  *MEMORY[0x263F52248] = 0;
  if (qword_2683E43F0 != -1) {
    swift_once();
  }
  swift_weakAssign();
  sub_22B138EF0();
LABEL_19:
  v32(v17, v6);
  return ((uint64_t (*)(char *, uint64_t))v32)(v19, v6);
}

uint64_t sub_22B128990(uint64_t a1)
{
  uint64_t v2 = sub_22B1389F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22B12A230(a1, (uint64_t)v13);
  if (swift_dynamicCast())
  {
    uint64_t v7 = v12[0];
    unint64_t v6 = v12[1];
    if (qword_2683E43F0 != -1) {
      swift_once();
    }
    if (swift_weakLoadStrong())
    {
      sub_22B128B8C(v7, v6);
      sub_22B12A2D4(v7, v6);
      return swift_release();
    }
    else
    {
      return sub_22B12A2D4(v7, v6);
    }
  }
  else
  {
    sub_22B129A4C();
    sub_22B138E10();
    uint64_t v9 = sub_22B1389E0();
    os_log_type_t v10 = sub_22B138D90();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_22B126000, v9, v10, "Error: Received non-Data result from _ler_send_log_data.", v11, 2u);
      MEMORY[0x230F409D0](v11, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_22B128B8C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v30 = a1;
  unint64_t v31 = a2;
  uint64_t v4 = sub_22B138C90();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22B138CB0();
  uint64_t v32 = *(void *)(v8 - 8);
  uint64_t v33 = v8;
  MEMORY[0x270FA5388]();
  os_log_type_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22B1389F0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22B129A4C();
  sub_22B138E10();
  uint64_t v15 = sub_22B1389E0();
  os_log_type_t v16 = sub_22B138D80();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = v10;
    uint64_t v18 = v7;
    uint64_t v19 = v4;
    uint64_t v20 = v3;
    uint64_t v21 = v5;
    uint64_t v22 = v17;
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_22B126000, v15, v16, "PlaygroundLoggerProbePoint did receive logger data.", v17, 2u);
    uint64_t v23 = v22;
    uint64_t v5 = v21;
    uint64_t v3 = v20;
    uint64_t v4 = v19;
    uint64_t v7 = v18;
    os_log_type_t v10 = v29;
    MEMORY[0x230F409D0](v23, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v24 = (void *)swift_allocObject();
  uint64_t v26 = v30;
  unint64_t v25 = v31;
  v24[2] = v30;
  v24[3] = v25;
  v24[4] = v3;
  aBlock[4] = sub_22B12A36C;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22B12902C;
  aBlock[3] = &block_descriptor;
  v27 = _Block_copy(aBlock);
  sub_22B12A390(v26, v25);
  swift_retain();
  sub_22B138CA0();
  uint64_t v34 = MEMORY[0x263F8EE78];
  sub_22B12A3E8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4440);
  sub_22B12A440();
  sub_22B138E80();
  MEMORY[0x230F40420](0, v10, v7, v27);
  _Block_release(v27);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v33);
  return swift_release();
}

uint64_t sub_22B128F44()
{
  swift_unknownObjectRetain();
  sub_22B138E50();
  swift_unknownObjectRelease();
  sub_22B128990((uint64_t)v1);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v1);
}

uint64_t sub_22B128F90(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void (**)(uint64_t, unint64_t, void))(a3
                                                                + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_probeSampleGenerationHandler);
  if (v3)
  {
    uint64_t v5 = result;
    sub_22B12A390(result, a2);
    sub_22B12A4E4((uint64_t)v3);
    v3(v5, a2, 0);
    sub_22B12A4F4((uint64_t)v3);
    return sub_22B12A2D4(v5, a2);
  }
  return result;
}

uint64_t sub_22B12902C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_22B129070()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22B1389F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22B138EE0();
  uint64_t v8 = v7;
  sub_22B129A4C();
  sub_22B138E10();
  sub_22B12A4E4(v6);
  sub_22B12A4E4(v6);
  uint64_t v9 = sub_22B1389E0();
  os_log_type_t v10 = sub_22B138D80();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v22 = v1;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v25 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v21 = v2;
    if (v6)
    {
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = v6;
      *(void *)(v13 + 24) = v8;
      v14 = sub_22B12A5C8;
    }
    else
    {
      v14 = 0;
      uint64_t v13 = 0;
    }
    uint64_t v23 = (uint64_t)v14;
    uint64_t v24 = v13;
    sub_22B12A4E4(v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4450);
    uint64_t v15 = sub_22B138D30();
    uint64_t v23 = sub_22B129B78(v15, v16, &v25);
    sub_22B138E30();
    swift_bridgeObjectRelease();
    sub_22B12A4F4(v6);
    sub_22B12A4F4(v6);
    _os_log_impl(&dword_22B126000, v9, v10, "setupPlaygroundPrintHook() existing playgroundPrintHook: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F409D0](v12, -1, -1);
    MEMORY[0x230F409D0](v11, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v21);
  }
  else
  {
    sub_22B12A4F4(v6);
    sub_22B12A4F4(v6);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v17 = swift_allocObject();
  swift_weakInit();
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v6;
  v18[3] = v8;
  v18[4] = v17;
  return sub_22B138EF0();
}

uint64_t sub_22B129380(void *a1, uint64_t (*a2)(void, void))
{
  return a2(*a1, a1[1]);
}

void sub_22B1293B4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_22B1389F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3(a1, a2);
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_beginAccess();
    char v10 = sub_22B138C10();
    swift_endAccess();
    swift_release();
    if (v10)
    {
      sub_22B129A4C();
      sub_22B138E10();
      uint64_t v11 = sub_22B1389E0();
      os_log_type_t v12 = sub_22B138D80();
      BOOL v13 = os_log_type_enabled(v11, v12);
      v14 = (void (**)(void))MEMORY[0x263F52240];
      if (v13)
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        uint64_t v16 = swift_slowAlloc();
        v23[2] = a2;
        uint64_t v17 = v16;
        v25[0] = v16;
        *(_DWORD *)uint64_t v15 = 136315138;
        v23[1] = v15 + 4;
        uint64_t v24 = *MEMORY[0x263F52240];
        __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4458);
        uint64_t v18 = sub_22B138D30();
        uint64_t v24 = sub_22B129B78(v18, v19, v25);
        sub_22B138E30();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22B126000, v11, v12, "setupPlaygroundPrintHook() sending printed string to _ler_print_hook: %s", v15, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x230F409D0](v17, -1, -1);
        uint64_t v20 = v15;
        v14 = (void (**)(void))MEMORY[0x263F52240];
        MEMORY[0x230F409D0](v20, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      uint64_t v21 = *v14;
      if (*v14)
      {
        uint64_t v22 = (void *)sub_22B138CF0();
        v21();
      }
    }
  }
}

uint64_t sub_22B12967C()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_config;
  uint64_t v2 = sub_22B138C40();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_22B12A4F4(*(uint64_t *)((char *)v0
                           + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_probeSampleGenerationHandler));
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_22B129738()
{
  return type metadata accessor for PlaygroundLoggerProbePoint();
}

uint64_t type metadata accessor for PlaygroundLoggerProbePoint()
{
  uint64_t result = qword_2683E4408;
  if (!qword_2683E4408) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22B12978C()
{
  uint64_t result = sub_22B138C40();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_22B129838()
{
  unint64_t result = qword_2683E4418;
  if (!qword_2683E4418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4418);
  }
  return result;
}

unint64_t sub_22B129890()
{
  unint64_t result = qword_2683E4420;
  if (!qword_2683E4420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4420);
  }
  return result;
}

unint64_t sub_22B1298E4()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_22B129900(void *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_22B127FD0(a1, a2);
  return v4;
}

uint64_t sub_22B129950()
{
  *MEMORY[0x263F52248] = 0;
  if (qword_2683E43F0 != -1) {
    swift_once();
  }
  return swift_weakAssign();
}

uint64_t sub_22B1299BC(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = a1;
    a1 = swift_allocObject();
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = a2;
    uint64_t v5 = sub_22B12A5F8;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = (uint64_t (**)(uint64_t, uint64_t, char))(v2
                                                       + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_probeSampleGenerationHandler);
  uint64_t v7 = *(void *)(v2
                 + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_probeSampleGenerationHandler);
  *uint64_t v6 = v5;
  v6[1] = (uint64_t (*)(uint64_t, uint64_t, char))a1;
  return sub_22B12A4F4(v7);
}

uint64_t sub_22B129A44()
{
  return sub_22B12828C();
}

unint64_t sub_22B129A4C()
{
  unint64_t result = qword_2683E4428;
  if (!qword_2683E4428)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2683E4428);
  }
  return result;
}

uint64_t sub_22B129A8C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_22B129A9C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_22B129AD8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_22B129B00(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_22B129B78(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_22B138E30();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_22B129B78(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22B129C4C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22B12A230((uint64_t)v12, *a3);
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
      sub_22B12A230((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_22B129C4C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_22B138E40();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22B129E08(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_22B138EB0();
  if (!v8)
  {
    sub_22B138EC0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_22B138ED0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_22B129E08(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22B129EA0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22B12A080(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22B12A080(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22B129EA0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
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
      unint64_t v3 = sub_22B12A018(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_22B138E90();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_22B138EC0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_22B138D50();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_22B138ED0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_22B138EC0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_22B12A018(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4430);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22B12A080(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4430);
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
  BOOL v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_22B138ED0();
  __break(1u);
  return result;
}

unsigned char **sub_22B12A1D0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
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

uint64_t sub_22B12A230(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_22B12A2D4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_22B12A32C()
{
  sub_22B12A2D4(*(void *)(v0 + 16), *(void *)(v0 + 24));
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22B12A36C()
{
  return sub_22B128F90(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
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

uint64_t sub_22B12A390(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

unint64_t sub_22B12A3E8()
{
  unint64_t result = qword_2683E4438;
  if (!qword_2683E4438)
  {
    sub_22B138C90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4438);
  }
  return result;
}

unint64_t sub_22B12A440()
{
  unint64_t result = qword_2683E4448;
  if (!qword_2683E4448)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2683E4440);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4448);
  }
  return result;
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

uint64_t sub_22B12A4E4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_22B12A4F4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_22B12A504()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22B12A53C()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_22B12A584(uint64_t a1, uint64_t a2)
{
  sub_22B1293B4(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_22B12A590()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22B12A5C8(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_22B12A5F8(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4 = *(uint64_t (**)(void *))(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  char v7 = a3 & 1;
  return v4(v6);
}

uint64_t sub_22B12A63C(uint64_t a1)
{
  uint64_t v2 = sub_22B138960();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  size_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v6 = sub_22B12C3D8((uint64_t)v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v6;
}

uint64_t sub_22B12A744()
{
  uint64_t v1 = off_2683E45D0;
  off_2683E45D0 = 0;
  qword_2683E45D8 = 0;
  sub_22B12A4F4((uint64_t)v1);

  sub_22B12A8DC((uint64_t)v0 + qword_2683E44C8);
  uint64_t v2 = (char *)v0 + qword_2683E44D0;
  uint64_t v3 = sub_22B138910();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  sub_22B12A4F4(*(uint64_t *)((char *)v0 + qword_2683E46E8));
  swift_release();
  uint64_t v4 = *((unsigned int *)*v0 + 12);
  uint64_t v5 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v4, v5);
}

uint64_t type metadata accessor for LoggingStreamAgent()
{
  uint64_t result = qword_2683E4460;
  if (!qword_2683E4460) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22B12A8A4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22B12A8DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4470);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22B12A940(uint64_t a1, unint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  else {
    return sub_22B12A390(a1, a2);
  }
}

uint64_t sub_22B12A950(uint64_t a1, unint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  else {
    return sub_22B12A2D4(a1, a2);
  }
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerSample_Transport()
{
  return &type metadata for PlaygroundLoggerSample_Transport;
}

uint64_t sub_22B12A994()
{
  return MEMORY[0x263F604F8];
}

uint64_t sub_22B12A9A0(char a1)
{
  if (a1) {
    return 0xD00000000000001DLL;
  }
  else {
    return 0x6144726567676F6CLL;
  }
}

uint64_t sub_22B12A9E0(char *a1, char *a2)
{
  return sub_22B12A9EC(*a1, *a2);
}

uint64_t sub_22B12A9EC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD00000000000001DLL;
  }
  else {
    unint64_t v3 = 0x6144726567676F6CLL;
  }
  if (v2) {
    unint64_t v4 = 0xEA00000000006174;
  }
  else {
    unint64_t v4 = 0x800000022B13A530;
  }
  if (a2) {
    unint64_t v5 = 0xD00000000000001DLL;
  }
  else {
    unint64_t v5 = 0x6144726567676F6CLL;
  }
  if (a2) {
    unint64_t v6 = 0x800000022B13A530;
  }
  else {
    unint64_t v6 = 0xEA00000000006174;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_22B138F20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22B12AA98(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x6F4C656372756F73;
    }
    else {
      unint64_t v3 = 0xD000000000000011;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEE006E6F69746163;
    }
    else {
      unint64_t v4 = 0x800000022B13A620;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0x6F4C656372756F73;
      }
      else {
        unint64_t v6 = 0xD000000000000011;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEE006E6F69746163;
      }
      else {
        unint64_t v7 = 0x800000022B13A620;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v3 = 0x696D697263736964;
    unint64_t v4 = 0xEC000000746E616ELL;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xEC000000746E616ELL;
  if (v3 != 0x696D697263736964)
  {
LABEL_21:
    char v8 = sub_22B138F20();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22B12ABD0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000011;
  }
  else {
    unint64_t v3 = 0x6F4C656372756F73;
  }
  if (v2) {
    unint64_t v4 = 0xEE006E6F69746163;
  }
  else {
    unint64_t v4 = 0x800000022B13A620;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000011;
  }
  else {
    unint64_t v5 = 0x6F4C656372756F73;
  }
  if (a2) {
    unint64_t v6 = 0x800000022B13A620;
  }
  else {
    unint64_t v6 = 0xEE006E6F69746163;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_22B138F20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22B12AC84(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x800000022B13A600;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x626D754E656E696CLL;
      unint64_t v3 = 0xEA00000000007265;
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x6E6D756C6F63;
      break;
    case 3:
      break;
    default:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x68746150656C6966;
      break;
  }
  unint64_t v6 = 0x800000022B13A600;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x626D754E656E696CLL;
      unint64_t v6 = 0xEA00000000007265;
      goto LABEL_9;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      if (v5 == 0x6E6D756C6F63) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 3:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    default:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x68746150656C6966) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_22B138F20();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_22B12AE10(char a1, char a2)
{
  if (*(void *)&aString_1[8 * a1] == *(void *)&aString_1[8 * a2]
    && *(void *)&aTimestamlogsou[8 * a1 + 24] == *(void *)&aTimestamlogsou[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_22B138F20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_22B12AE98(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD00000000000001CLL;
  }
  else {
    unint64_t v3 = 0xD000000000000010;
  }
  if (v2) {
    unint64_t v4 = 0x800000022B13A5A0;
  }
  else {
    unint64_t v4 = 0x800000022B13A5C0;
  }
  if (a2) {
    unint64_t v5 = 0xD00000000000001CLL;
  }
  else {
    unint64_t v5 = 0xD000000000000010;
  }
  if (a2) {
    unint64_t v6 = 0x800000022B13A5C0;
  }
  else {
    unint64_t v6 = 0x800000022B13A5A0;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_22B138F20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22B12AF44()
{
  return sub_22B12AF4C();
}

uint64_t sub_22B12AF4C()
{
  return sub_22B138F60();
}

uint64_t sub_22B12AFD8()
{
  return sub_22B138F60();
}

uint64_t sub_22B12B044()
{
  return sub_22B138F60();
}

uint64_t sub_22B12B0CC()
{
  return sub_22B138F60();
}

uint64_t sub_22B12B1AC()
{
  return sub_22B138F60();
}

uint64_t sub_22B12B240()
{
  return sub_22B138F60();
}

uint64_t sub_22B12B2FC()
{
  return sub_22B12B304();
}

uint64_t sub_22B12B304()
{
  sub_22B138D40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22B12B378()
{
  sub_22B138D40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22B12B41C()
{
  sub_22B138D40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22B12B498()
{
  sub_22B138D40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22B12B564()
{
  sub_22B138D40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22B12B5B8()
{
  return sub_22B12B8D0();
}

uint64_t sub_22B12B5C0()
{
  return sub_22B138F60();
}

uint64_t sub_22B12B644()
{
  return sub_22B138F60();
}

uint64_t sub_22B12B6AC()
{
  return sub_22B138F60();
}

uint64_t sub_22B12B788()
{
  return sub_22B138F60();
}

uint64_t sub_22B12B818()
{
  return sub_22B138F60();
}

uint64_t sub_22B12B8D0()
{
  return sub_22B138F60();
}

uint64_t sub_22B12B958@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_22B138F00();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_22B12B9B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22B12A9A0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22B12B9E4()
{
  return sub_22B12A9A0(*v0);
}

uint64_t sub_22B12B9EC(uint64_t a1)
{
  uint64_t v3 = *(void *)v1;
  unint64_t v2 = *(void *)(v1 + 8);
  int v4 = *(unsigned __int8 *)(v1 + 16);
  MEMORY[0x270FA5388](a1);
  if (v4 == 1) {
    sub_22B12A940(v3, v2, 1);
  }
  else {
    sub_22B12A940(v3, v2, 0);
  }
  sub_22B12BC20();
  sub_22B138950();
  return sub_22B12A950(v3, v2, v4);
}

double sub_22B12BB18@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v8 = &type metadata for PlaygroundLoggerSample_Transport.Key;
  unint64_t v9 = sub_22B12BC20();
  v7[0] = 0;
  sub_22B138930();
  uint64_t v5 = sub_22B138960();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  if (!v2)
  {
    double result = *(double *)&v10;
    *(_OWORD *)a2 = v10;
    *(unsigned char *)(a2 + 16) = 0;
  }
  return result;
}

unint64_t sub_22B12BC20()
{
  unint64_t result = qword_2683E4478;
  if (!qword_2683E4478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4478);
  }
  return result;
}

uint64_t sub_22B12BC74(unsigned char *a1, void *a2)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v3 = *(void *)(v2 + 24);
  *a1 = 1;
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22B12BC8C(unsigned char *a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(v2 + 16);
  unint64_t v4 = *(void *)(v2 + 24);
  *a1 = 0;
  *a2 = v3;
  a2[1] = v4;
  return sub_22B12A390(v3, v4);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlaygroundLoggerSample_Transport.Key(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PlaygroundLoggerSample_Transport.Key(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22B12BE10);
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

uint64_t sub_22B12BE38(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22B12BE44(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerSample_Transport.Key()
{
  return &type metadata for PlaygroundLoggerSample_Transport.Key;
}

uint64_t destroy for PlaygroundLoggerSample_Transport.Payload(uint64_t a1)
{
  return sub_22B12A950(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s25LiveExecutionResultsProbe32PlaygroundLoggerSample_TransportV7PayloadOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_22B12A940(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s25LiveExecutionResultsProbe32PlaygroundLoggerSample_TransportV7PayloadOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_22B12A940(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_22B12A950(v6, v7, v8);
  return a1;
}

uint64_t _s25LiveExecutionResultsProbe32PlaygroundLoggerSample_TransportV7PayloadOwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_22B12A950(v4, v5, v6);
  return a1;
}

uint64_t _s25LiveExecutionResultsProbe32PlaygroundLoggerSample_TransportV7PayloadOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s25LiveExecutionResultsProbe32PlaygroundLoggerSample_TransportV7PayloadOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_22B12BFE8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_22B12BFF0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerSample_Transport.Payload()
{
  return &type metadata for PlaygroundLoggerSample_Transport.Payload;
}

unint64_t sub_22B12C010()
{
  unint64_t result = qword_2683E4480;
  if (!qword_2683E4480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4480);
  }
  return result;
}

uint64_t sub_22B12C068(uint64_t *a1)
{
  int v2 = (uint64_t *)(v1 + qword_2683E44D8);
  if (*(void *)(v1 + qword_2683E44D8 + 8))
  {
    uint64_t v3 = *v2;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a1);
    uint64_t v3 = sub_22B138D30();
    *int v2 = v3;
    v2[1] = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_22B12C124(uint64_t a1)
{
  uint64_t v2 = sub_22B138960();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v6 = sub_22B12C938((uint64_t)v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v6;
}

uint64_t sub_22B12C22C()
{
  *MEMORY[0x263F52248] = 0;
  uint64_t v1 = qword_2683E43F0;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  swift_weakAssign();
  swift_release();

  sub_22B12A8DC((uint64_t)v0 + qword_2683E44C8);
  uint64_t v2 = (char *)v0 + qword_2683E44D0;
  uint64_t v3 = sub_22B138910();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  sub_22B12A4F4(*(uint64_t *)((char *)v0 + qword_2683E46E8));
  swift_release();
  uint64_t v4 = *((unsigned int *)*v0 + 12);
  uint64_t v5 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v4, v5);
}

uint64_t type metadata accessor for PlaygroundLoggerStreamAgent()
{
  uint64_t result = qword_2683E4488;
  if (!qword_2683E4488) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22B12C3D8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v30 = a1;
  uint64_t v3 = sub_22B1389F0();
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v29 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22B138960();
  uint64_t v34 = *(void *)(v5 - 8);
  uint64_t v35 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v31 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22B138DC0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  long long v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22B138DB0();
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = sub_22B138CB0();
  MEMORY[0x270FA5388](v12 - 8);
  sub_22B12CF4C(0, &qword_2683E4498);
  sub_22B138CA0();
  uint64_t v37 = MEMORY[0x263F8EE78];
  sub_22B12CE98();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2683E44A8);
  sub_22B12CEF0();
  v14 = v29;
  uint64_t v13 = v30;
  sub_22B138E80();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F130], v7);
  *(void *)(v1 + 16) = sub_22B138DF0();
  uint64_t v15 = v1 + qword_2683E44C8;
  uint64_t v16 = sub_22B138910();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  sub_22B138900();
  uint64_t v17 = (void *)(v2 + qword_2683E44D8);
  void *v17 = 0;
  v17[1] = 0;
  uint64_t v18 = (void *)(v2 + qword_2683E46E8);
  *uint64_t v18 = 0;
  v18[1] = 0;
  unint64_t v19 = *(void **)(v2 + 16);
  uint64_t v20 = (uint64_t)v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v31, v13, v35);
  type metadata accessor for LoggingProbePoint();
  swift_allocObject();
  *(void *)(v2 + qword_2683E46F0) = sub_22B1311FC(v19, v20);
  sub_22B12CF4C(0, (unint64_t *)&qword_2683E4428);
  sub_22B138E00();
  swift_retain_n();
  uint64_t v21 = sub_22B1389E0();
  os_log_type_t v22 = sub_22B138D70();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v37 = v24;
    *(_DWORD *)uint64_t v23 = 136446210;
    uint64_t v25 = sub_22B12C068(&qword_2683E44C0);
    uint64_t v36 = sub_22B129B78(v25, v26, &v37);
    sub_22B138E30();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22B126000, v21, v22, "Initialize agent: %{public}s)", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F409D0](v24, -1, -1);
    MEMORY[0x230F409D0](v23, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v13, v35);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v33);
  return v2;
}

uint64_t sub_22B12C938(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v30 = a1;
  uint64_t v3 = sub_22B1389F0();
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v29 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22B138960();
  uint64_t v34 = *(void *)(v5 - 8);
  uint64_t v35 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v31 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22B138DC0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  long long v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22B138DB0();
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = sub_22B138CB0();
  MEMORY[0x270FA5388](v12 - 8);
  sub_22B12CF4C(0, &qword_2683E4498);
  sub_22B138CA0();
  uint64_t v37 = MEMORY[0x263F8EE78];
  sub_22B12CE98();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2683E44A8);
  sub_22B12CEF0();
  v14 = v29;
  uint64_t v13 = v30;
  sub_22B138E80();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F130], v7);
  *(void *)(v1 + 16) = sub_22B138DF0();
  uint64_t v15 = v1 + qword_2683E44C8;
  uint64_t v16 = sub_22B138910();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  sub_22B138900();
  uint64_t v17 = (void *)(v2 + qword_2683E44D8);
  void *v17 = 0;
  v17[1] = 0;
  uint64_t v18 = (void *)(v2 + qword_2683E46E8);
  *uint64_t v18 = 0;
  v18[1] = 0;
  unint64_t v19 = *(void **)(v2 + 16);
  uint64_t v20 = (uint64_t)v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v31, v13, v35);
  type metadata accessor for PlaygroundLoggerProbePoint();
  swift_allocObject();
  *(void *)(v2 + qword_2683E46F0) = sub_22B127FD0(v19, v20);
  sub_22B12CF4C(0, (unint64_t *)&qword_2683E4428);
  sub_22B138E00();
  swift_retain_n();
  uint64_t v21 = sub_22B1389E0();
  os_log_type_t v22 = sub_22B138D70();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v37 = v24;
    *(_DWORD *)uint64_t v23 = 136446210;
    uint64_t v25 = sub_22B12C068(&qword_2683E44B8);
    uint64_t v36 = sub_22B129B78(v25, v26, &v37);
    sub_22B138E30();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22B126000, v21, v22, "Initialize agent: %{public}s)", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F409D0](v24, -1, -1);
    MEMORY[0x230F409D0](v23, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v13, v35);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v33);
  return v2;
}

unint64_t sub_22B12CE98()
{
  unint64_t result = qword_2683E44A0;
  if (!qword_2683E44A0)
  {
    sub_22B138DB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E44A0);
  }
  return result;
}

unint64_t sub_22B12CEF0()
{
  unint64_t result = qword_2683E44B0;
  if (!qword_2683E44B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2683E44A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E44B0);
  }
  return result;
}

uint64_t sub_22B12CF4C(uint64_t a1, unint64_t *a2)
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

void sub_22B12CF8C()
{
  sub_22B12DAD4();
  if (v0 <= 0x3F)
  {
    sub_22B138910();
    if (v1 <= 0x3F) {
      swift_initClassMetadata2();
    }
  }
}

id *sub_22B12D07C()
{
  unint64_t v1 = v0;
  uint64_t v2 = *((void *)*v0 + 11);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v2 + 56);
  uint64_t v4 = *((void *)*v0 + 10);
  swift_unknownObjectRetain();
  v3(v4, v2);
  swift_unknownObjectRelease();

  sub_22B12FDE4((uint64_t)v0 + qword_2683E44C8, &qword_2683E4470);
  uint64_t v5 = (char *)v0 + qword_2683E44D0;
  uint64_t v6 = sub_22B138910();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  sub_22B12A4F4(*(uint64_t *)((char *)v1 + qword_2683E46E8));
  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_22B12D1B0()
{
  unint64_t v1 = (uint64_t *)(v0 + qword_2683E44D8);
  if (*(void *)(v0 + qword_2683E44D8 + 8))
  {
    uint64_t v2 = *v1;
  }
  else
  {
    type metadata accessor for AbstractProbePointStreamAgent();
    swift_getMetatypeMetadata();
    uint64_t v2 = sub_22B138D30();
    *unint64_t v1 = v2;
    v1[1] = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_22B12D270(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = (uint64_t *)((char *)v2 + qword_2683E46E8);
  uint64_t v5 = *(uint64_t *)((char *)v2 + qword_2683E46E8);
  *uint64_t v4 = a1;
  v4[1] = a2;
  swift_retain();
  sub_22B12A4F4(v5);
  uint64_t v6 = swift_allocObject();
  swift_weakInit();
  uint64_t v7 = (void *)swift_allocObject();
  uint64_t v8 = *(void *)(v3 + 80);
  v7[2] = v8;
  uint64_t v9 = *(void *)(v3 + 88);
  v7[3] = v9;
  v7[4] = v6;
  long long v10 = *(void (**)(uint64_t (*)(uint64_t), void *, uint64_t, uint64_t))(v9 + 72);
  swift_unknownObjectRetain();
  swift_retain();
  v10(sub_22B12FEC0, v7, v8, v9);
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t sub_22B12D3AC(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 88);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 88);
  uint64_t v5 = *(void *)(*(void *)v1 + 80);
  swift_unknownObjectRetain();
  v4(a1, v5, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_22B12D45C(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_22B12D49C(a1);
  return v2;
}

void *sub_22B12D49C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v37 = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = sub_22B1389F0();
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  MEMORY[0x270FA5388](v4);
  char v39 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22B138960();
  uint64_t v42 = *(void *)(v6 - 8);
  uint64_t v43 = v6;
  MEMORY[0x270FA5388](v6);
  char v38 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_22B138DC0();
  uint64_t v8 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  long long v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22B138DB0();
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = sub_22B138CB0();
  MEMORY[0x270FA5388](v12 - 8);
  v35[3] = sub_22B12CF4C(0, &qword_2683E4498);
  uint64_t v13 = *(void *)(v3 + 80);
  uint64_t v14 = *(void *)(v3 + 88);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 40))(v13, v14);
  v35[1] = v16;
  v35[2] = v15;
  sub_22B138CA0();
  uint64_t v45 = MEMORY[0x263F8EE78];
  sub_22B12FE40((unint64_t *)&qword_2683E44A0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2683E44A8);
  sub_22B12CEF0();
  sub_22B138E80();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F130], v36);
  uint64_t v17 = v37;
  v2[2] = sub_22B138DF0();
  uint64_t v18 = (char *)v2 + qword_2683E44C8;
  uint64_t v19 = sub_22B138910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  sub_22B138900();
  uint64_t v20 = (void *)((char *)v2 + qword_2683E44D8);
  *uint64_t v20 = 0;
  v20[1] = 0;
  uint64_t v21 = (void *)((char *)v2 + qword_2683E46E8);
  *uint64_t v21 = 0;
  v21[1] = 0;
  os_log_type_t v22 = (void *)v2[2];
  uint64_t v23 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v38, v17, v43);
  uint64_t v24 = *(uint64_t (**)(id, char *, uint64_t, uint64_t))(v14 + 48);
  id v25 = v22;
  uint64_t v26 = v14;
  v27 = v39;
  *(void *)((char *)v2 + qword_2683E46F0) = v24(v25, v23, v13, v26);
  sub_22B12CF4C(0, (unint64_t *)&qword_2683E4428);
  sub_22B138E00();
  swift_retain_n();
  uint64_t v28 = sub_22B1389E0();
  os_log_type_t v29 = sub_22B138D70();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v45 = v31;
    *(_DWORD *)uint64_t v30 = 136446210;
    uint64_t v32 = sub_22B12D1B0();
    uint64_t v44 = sub_22B129B78(v32, v33, &v45);
    sub_22B138E30();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22B126000, v28, v29, "Initialize agent: %{public}s)", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F409D0](v31, -1, -1);
    MEMORY[0x230F409D0](v30, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v17, v43);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v27, v41);
  return v2;
}

uint64_t sub_22B12DA64()
{
  sub_22B12D07C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for AbstractProbePointStreamAgent()
{
  return __swift_instantiateGenericMetadata();
}

void sub_22B12DAD4()
{
  if (!qword_2683E4560)
  {
    sub_22B138910();
    unint64_t v0 = sub_22B138E20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2683E4560);
    }
  }
}

uint64_t sub_22B12DB2C(uint64_t a1)
{
  uint64_t v2 = sub_22B1389F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22B138CC0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (uint64_t *)((char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v12 = *(void **)(result + 16);
    *uint64_t v9 = v12;
    (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F0E0], v6);
    id v13 = v12;
    LOBYTE(v12) = sub_22B138CD0();
    uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v7 + 8))(v9, v6);
    if (v12)
    {
      uint64_t v14 = *(void (**)(uint64_t))(v11 + qword_2683E46E8);
      if (v14)
      {
        swift_retain();
        v14(a1);
        sub_22B12A4F4((uint64_t)v14);
        return swift_release();
      }
      else
      {
        sub_22B12CF4C(0, (unint64_t *)&qword_2683E4428);
        sub_22B138E00();
        uint64_t v15 = sub_22B1389E0();
        uint64_t v16 = sub_22B138D90();
        if (os_log_type_enabled(v15, (os_log_type_t)v16))
        {
          uint64_t v17 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v17 = 0;
          _os_log_impl(&dword_22B126000, v15, (os_log_type_t)v16, "Error: Unable to send probe sample without stream.", v17, 2u);
          MEMORY[0x230F409D0](v17, -1, -1);
          swift_release();
        }
        else
        {

          swift_release();
        }
        return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22B12DDFC(uint64_t a1)
{
  uint64_t v47 = a1;
  uint64_t v2 = *v1;
  uint64_t v3 = sub_22B138910();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v43 = v3;
  uint64_t v44 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v41 = v6;
  uint64_t v42 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v48 = (char *)v38 - v7;
  uint64_t v8 = sub_22B1389F0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22B12CF4C(0, (unint64_t *)&qword_2683E4428);
  sub_22B138E00();
  swift_retain_n();
  uint64_t v12 = sub_22B1389E0();
  os_log_type_t v13 = sub_22B138DA0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v46 = v2;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v45 = v8;
    uint64_t v17 = v16;
    uint64_t v50 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v18 = sub_22B12D1B0();
    uint64_t v49 = sub_22B129B78(v18, v19, &v50);
    sub_22B138E30();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22B126000, v12, v13, "%s handleMessageStream", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F409D0](v17, -1, -1);
    uint64_t v20 = v15;
    uint64_t v2 = v46;
    MEMORY[0x230F409D0](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v45);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v22 = *(void *)(v2 + 80);
  uint64_t v21 = *(void *)(v2 + 88);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  uint64_t v23 = swift_allocObject();
  swift_weakInit();
  uint64_t v24 = (void *)swift_allocObject();
  uint64_t v40 = v1;
  v24[2] = v22;
  v24[3] = v21;
  v24[4] = v23;
  uint64_t v45 = v21;
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  swift_retain();
  uint64_t v46 = sub_22B1388A0();
  swift_release();
  swift_release();
  id v25 = v48;
  sub_22B138900();
  uint64_t v26 = swift_allocObject();
  swift_weakInit();
  uint64_t v27 = v43;
  uint64_t v28 = v44;
  char v39 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  os_log_type_t v29 = v42;
  v39(v42, v25, v43);
  uint64_t v30 = *(unsigned __int8 *)(v28 + 80);
  uint64_t v31 = (v30 + 40) & ~v30;
  v41 += v31;
  v38[1] = v30 | 7;
  uint64_t v32 = (void *)swift_allocObject();
  uint64_t v33 = v45;
  v32[2] = v22;
  v32[3] = v33;
  v32[4] = v26;
  v38[0] = *(void *)(v28 + 32);
  ((void (*)(char *, char *, uint64_t))v38[0])((char *)v32 + v31, v29, v27);
  sub_22B1389D0();
  swift_release();
  uint64_t v34 = swift_allocObject();
  swift_weakInit();
  v39(v29, v48, v27);
  uint64_t v35 = (void *)swift_allocObject();
  uint64_t v36 = v45;
  v35[2] = v22;
  v35[3] = v36;
  void v35[4] = v34;
  ((void (*)(char *, char *, uint64_t))v38[0])((char *)v35 + v31, v29, v27);
  sub_22B1388F0();
  sub_22B12FE40(&qword_2683E4568, MEMORY[0x263F607F0]);
  swift_retain();
  sub_22B138970();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v48, v27);
  return swift_release();
}

uint64_t sub_22B12E430(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v45 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v42 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v35 - v6;
  uint64_t v8 = sub_22B1389F0();
  uint64_t v43 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4588);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v35 - v15;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    uint64_t v41 = v8;
    sub_22B12CF4C(0, (unint64_t *)&qword_2683E4428);
    sub_22B138E00();
    uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 16);
    v40(v7, v44, AssociatedTypeWitness);
    swift_retain_n();
    uint64_t v17 = sub_22B1389E0();
    os_log_type_t v18 = sub_22B138D80();
    int v19 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v39 = a2;
      uint64_t v21 = v20;
      uint64_t v38 = swift_slowAlloc();
      uint64_t v47 = v38;
      *(_DWORD *)uint64_t v21 = 136446722;
      os_log_t v37 = v17;
      int v36 = v19;
      uint64_t v22 = sub_22B12D1B0();
      uint64_t v46 = sub_22B129B78(v22, v23, &v47);
      v35[2] = &v47;
      sub_22B138E30();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2082;
      v35[1] = v21 + 14;
      sub_22B138910();
      sub_22B12FE40(&qword_2683E4580, MEMORY[0x263F60460]);
      uint64_t v24 = sub_22B138F10();
      uint64_t v46 = sub_22B129B78(v24, v25, &v47);
      sub_22B138E30();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 22) = 2082;
      v40(v42, (uint64_t)v7, AssociatedTypeWitness);
      uint64_t v26 = sub_22B138D30();
      uint64_t v46 = sub_22B129B78(v26, v27, &v47);
      sub_22B138E30();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v45 + 8))(v7, AssociatedTypeWitness);
      uint64_t v17 = v37;
      _os_log_impl(&dword_22B126000, v37, (os_log_type_t)v36, "%{public}s-%{public}s received message: %{public}s.", (uint8_t *)v21, 0x20u);
      uint64_t v28 = v38;
      swift_arrayDestroy();
      MEMORY[0x230F409D0](v28, -1, -1);
      uint64_t v29 = v21;
      a2 = v39;
      MEMORY[0x230F409D0](v29, -1, -1);
    }
    else
    {
      swift_release_n();
      (*(void (**)(char *, uint64_t))(v45 + 8))(v7, AssociatedTypeWitness);
    }

    (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v41);
    sub_22B12D3AC(v44);
    sub_22B12FD80(a2, (uint64_t)v14, &qword_2683E4588);
    uint64_t v33 = sub_22B1388E0();
    uint64_t v34 = *(void *)(v33 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v14, 1, v33) == 1)
    {
      swift_release();
      return sub_22B12FDE4((uint64_t)v14, &qword_2683E4588);
    }
    else
    {
      sub_22B1388D0();
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v14, v33);
    }
  }
  else
  {
    sub_22B12FD80(a2, (uint64_t)v16, &qword_2683E4588);
    uint64_t v30 = sub_22B1388E0();
    uint64_t v31 = *(void *)(v30 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v16, 1, v30) == 1)
    {
      return sub_22B12FDE4((uint64_t)v16, &qword_2683E4588);
    }
    else
    {
      sub_22B1388D0();
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v16, v30);
    }
  }
}

uint64_t sub_22B12EA70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v56 = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4470);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = &v43[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  v59 = &v43[-v12];
  swift_getAssociatedTypeWitness();
  uint64_t v57 = a4;
  uint64_t v58 = a5;
  swift_getAssociatedConformanceWitness();
  uint64_t v55 = sub_22B1388C0();
  uint64_t v13 = *(void *)(v55 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v55);
  unint64_t v54 = &v43[-v15];
  uint64_t v16 = sub_22B138910();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  int v19 = &v43[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = sub_22B1389F0();
  uint64_t v52 = *(void *)(v20 - 8);
  uint64_t v53 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = &v43[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v24 = result;
    uint64_t v51 = v14;
    sub_22B12CF4C(0, (unint64_t *)&qword_2683E4428);
    sub_22B138E00();
    uint64_t v49 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v17 + 16);
    uint64_t v50 = v17 + 16;
    v49(v19, a3, v16);
    swift_retain_n();
    unint64_t v25 = sub_22B1389E0();
    os_log_type_t v26 = sub_22B138DA0();
    int v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v28 = swift_slowAlloc();
      v48 = v11;
      uint64_t v29 = v28;
      uint64_t v45 = swift_slowAlloc();
      v61[0] = v45;
      *(_DWORD *)uint64_t v29 = 136446466;
      uint64_t v47 = a3;
      int v44 = v27;
      uint64_t v30 = sub_22B12D1B0();
      uint64_t v60 = sub_22B129B78(v30, v31, v61);
      uint64_t v46 = v17;
      sub_22B138E30();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2082;
      sub_22B12FE40(&qword_2683E4580, MEMORY[0x263F60460]);
      uint64_t v32 = sub_22B138F10();
      uint64_t v60 = sub_22B129B78(v32, v33, v61);
      uint64_t v17 = v46;
      a3 = v47;
      sub_22B138E30();
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v17 + 8))(v19, v16);
      _os_log_impl(&dword_22B126000, v25, (os_log_type_t)v44, "%{public}s-%{public}s messageStream.open success", (uint8_t *)v29, 0x16u);
      uint64_t v34 = v45;
      swift_arrayDestroy();
      MEMORY[0x230F409D0](v34, -1, -1);
      uint64_t v35 = v29;
      uint64_t v11 = v48;
      MEMORY[0x230F409D0](v35, -1, -1);
    }
    else
    {
      swift_release_n();
      (*(void (**)(unsigned char *, uint64_t))(v17 + 8))(v19, v16);
    }

    (*(void (**)(unsigned char *, uint64_t))(v52 + 8))(v22, v53);
    os_log_t v37 = v54;
    uint64_t v36 = v55;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v13 + 16))(v54, v56, v55);
    unint64_t v38 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    uint64_t v39 = swift_allocObject();
    uint64_t v40 = v58;
    *(void *)(v39 + 16) = v57;
    *(void *)(v39 + 24) = v40;
    (*(void (**)(unint64_t, unsigned char *, uint64_t))(v13 + 32))(v39 + v38, v37, v36);
    sub_22B12D270((uint64_t)sub_22B12FBD8, v39);
    swift_release();
    uint64_t v41 = (uint64_t)v59;
    v49(v59, a3, v16);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(v41, 0, 1, v16);
    sub_22B12FCB0(v41, (uint64_t)v11);
    uint64_t v42 = v24 + qword_2683E44C8;
    swift_beginAccess();
    sub_22B12FD18((uint64_t)v11, v42);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

uint64_t sub_22B12F098()
{
  return sub_22B1388B0();
}

uint64_t sub_22B12F134(uint64_t a1, uint64_t a2)
{
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4570);
  MEMORY[0x270FA5388](v64);
  uint64_t v4 = &v51[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4470);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  v65 = &v51[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v51[-v9];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v51[-v11];
  uint64_t v13 = sub_22B138910();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = &v51[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v15);
  int v19 = &v51[-v18];
  uint64_t v20 = sub_22B1389F0();
  uint64_t v62 = *(void *)(v20 - 8);
  uint64_t v63 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = &v51[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v24 = result;
    uint64_t v56 = v17;
    uint64_t v60 = v12;
    uint64_t v61 = v10;
    sub_22B12CF4C(0, (unint64_t *)&qword_2683E4428);
    sub_22B138E00();
    uint64_t v58 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v14 + 16);
    uint64_t v59 = a2;
    v58(v19, a2, v13);
    swift_retain_n();
    uint64_t v25 = v24;
    os_log_type_t v26 = sub_22B1389E0();
    os_log_type_t v27 = sub_22B138DA0();
    int v28 = v27;
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v55 = v4;
      uint64_t v30 = v29;
      uint64_t v54 = swift_slowAlloc();
      v67[0] = v54;
      *(_DWORD *)uint64_t v30 = 136446466;
      os_log_t v53 = v26;
      int v52 = v28;
      uint64_t v31 = sub_22B12D1B0();
      uint64_t v66 = sub_22B129B78(v31, v32, v67);
      uint64_t v33 = v14;
      sub_22B138E30();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2082;
      sub_22B12FE40(&qword_2683E4580, MEMORY[0x263F60460]);
      uint64_t v34 = sub_22B138F10();
      uint64_t v66 = sub_22B129B78(v34, v35, v67);
      sub_22B138E30();
      swift_bridgeObjectRelease();
      uint64_t v57 = *(void (**)(unsigned char *, uint64_t))(v14 + 8);
      v57(v19, v13);
      os_log_t v36 = v53;
      _os_log_impl(&dword_22B126000, v53, (os_log_type_t)v52, "%{public}s-%{public}s messageStream invalidating", (uint8_t *)v30, 0x16u);
      uint64_t v37 = v54;
      swift_arrayDestroy();
      MEMORY[0x230F409D0](v37, -1, -1);
      uint64_t v38 = v30;
      uint64_t v4 = v55;
      MEMORY[0x230F409D0](v38, -1, -1);

      (*(void (**)(unsigned char *, uint64_t))(v62 + 8))(v22, v63);
    }
    else
    {
      swift_release_n();
      uint64_t v57 = *(void (**)(unsigned char *, uint64_t))(v14 + 8);
      v57(v19, v13);

      (*(void (**)(unsigned char *, uint64_t))(v62 + 8))(v22, v63);
      uint64_t v33 = v14;
    }
    uint64_t v39 = v25 + qword_2683E44C8;
    swift_beginAccess();
    uint64_t v40 = (uint64_t)v60;
    sub_22B12FD80(v39, (uint64_t)v60, &qword_2683E4470);
    uint64_t v41 = (uint64_t)v61;
    v58(v61, v59, v13);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v33 + 56))(v41, 0, 1, v13);
    uint64_t v42 = (uint64_t)&v4[*(int *)(v64 + 48)];
    sub_22B12FD80(v40, (uint64_t)v4, &qword_2683E4470);
    sub_22B12FD80(v41, v42, &qword_2683E4470);
    uint64_t v43 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
    if (v43((uint64_t)v4, 1, v13) == 1)
    {
      sub_22B12FDE4(v41, &qword_2683E4470);
      sub_22B12FDE4(v40, &qword_2683E4470);
      if (v43(v42, 1, v13) == 1)
      {
        sub_22B12FDE4((uint64_t)v4, &qword_2683E4470);
LABEL_12:
        uint64_t v49 = (void *)(v25 + qword_2683E46E8);
        uint64_t v50 = *(void *)(v25 + qword_2683E46E8);
        *uint64_t v49 = 0;
        v49[1] = 0;
        sub_22B12A4F4(v50);
        return swift_release();
      }
    }
    else
    {
      sub_22B12FD80((uint64_t)v4, (uint64_t)v65, &qword_2683E4470);
      if (v43(v42, 1, v13) != 1)
      {
        int v44 = v56;
        (*(void (**)(unsigned char *, uint64_t, uint64_t))(v33 + 32))(v56, v42, v13);
        sub_22B12FE40(&qword_2683E4578, MEMORY[0x263F60460]);
        uint64_t v45 = v65;
        char v46 = sub_22B138CE0();
        uint64_t v47 = v44;
        v48 = v57;
        v57(v47, v13);
        sub_22B12FDE4((uint64_t)v61, &qword_2683E4470);
        sub_22B12FDE4(v40, &qword_2683E4470);
        v48(v45, v13);
        sub_22B12FDE4((uint64_t)v4, &qword_2683E4470);
        if (v46) {
          goto LABEL_12;
        }
        return swift_release();
      }
      sub_22B12FDE4((uint64_t)v61, &qword_2683E4470);
      sub_22B12FDE4(v40, &qword_2683E4470);
      v57(v65, v13);
    }
    sub_22B12FDE4((uint64_t)v4, &qword_2683E4570);
    return swift_release();
  }
  return result;
}

uint64_t sub_22B12F8B8()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_22B12F8D0()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22B12F908(uint64_t a1, uint64_t a2)
{
  return sub_22B12E430(a1, a2);
}

uint64_t sub_22B12F918(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = *(void *)(sub_22B138910() - 8);
  uint64_t v6 = v1[4];
  uint64_t v7 = (uint64_t)v1 + ((*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_22B12EA70(a1, v6, v7, v3, v4);
}

uint64_t objectdestroy_6Tm()
{
  uint64_t v1 = sub_22B138910();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_22B12FA70()
{
  uint64_t v1 = *(void *)(sub_22B138910() - 8);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_22B12F134(v2, v3);
}

uint64_t sub_22B12FAF0()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v1 = sub_22B1388C0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_22B12FBD8()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_22B1388C0();
  return sub_22B12F098();
}

uint64_t sub_22B12FCB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22B12FD18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22B12FD80(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22B12FDE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22B12FE40(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22B12FE88()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22B12FEC0(uint64_t a1)
{
  return sub_22B12DB2C(a1);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for SourceLocation_Transport(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_22B12FF34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a6 & 1) == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for PrintSample_Transport(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  int v3 = *(unsigned __int8 *)(a1 + 72);
  if (v3 != 255)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    return sub_22B12FFA4(v4, v5, v6, v7, v8, v3 & 1);
  }
  return result;
}

uint64_t sub_22B12FFA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a6 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for PrintSample_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  int v5 = *(unsigned __int8 *)(a2 + 72);
  swift_bridgeObjectRetain();
  if (v5 == 255)
  {
    long long v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v6;
    *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  }
  else
  {
    char v7 = v5 & 1;
    uint64_t v8 = *(void *)(a2 + 32);
    uint64_t v9 = *(void *)(a2 + 40);
    uint64_t v10 = *(void *)(a2 + 48);
    uint64_t v11 = *(void *)(a2 + 56);
    uint64_t v12 = *(void *)(a2 + 64);
    sub_22B12FF34(v8, v9, v10, v11, v12, v7);
    *(void *)(a1 + 32) = v8;
    *(void *)(a1 + 40) = v9;
    *(void *)(a1 + 48) = v10;
    *(void *)(a1 + 56) = v11;
    *(void *)(a1 + 64) = v12;
    *(unsigned char *)(a1 + 72) = v7;
  }
  return a1;
}

uint64_t assignWithCopy for PrintSample_Transport(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = (long long *)(a1 + 32);
  int v5 = (long long *)(a2 + 32);
  int v6 = *(unsigned __int8 *)(a2 + 72);
  if (*(unsigned __int8 *)(a1 + 72) == 255)
  {
    if (v6 == 255)
    {
      long long v9 = *v5;
      long long v10 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
      *uint64_t v4 = v9;
      *(_OWORD *)(a1 + 48) = v10;
    }
    else
    {
      char v23 = v6 & 1;
      uint64_t v24 = *(void *)(a2 + 32);
      uint64_t v25 = *(void *)(a2 + 40);
      uint64_t v26 = *(void *)(a2 + 48);
      uint64_t v27 = *(void *)(a2 + 56);
      uint64_t v28 = *(void *)(a2 + 64);
      sub_22B12FF34(v24, v25, v26, v27, v28, v6 & 1);
      *(void *)(a1 + 32) = v24;
      *(void *)(a1 + 40) = v25;
      *(void *)(a1 + 48) = v26;
      *(void *)(a1 + 56) = v27;
      *(void *)(a1 + 64) = v28;
      *(unsigned char *)(a1 + 72) = v23;
    }
  }
  else if (v6 == 255)
  {
    sub_22B1301CC(a1 + 32);
    long long v7 = *(_OWORD *)(a2 + 57);
    long long v8 = *(_OWORD *)(a2 + 48);
    *uint64_t v4 = *v5;
    *(_OWORD *)(a1 + 48) = v8;
    *(_OWORD *)(a1 + 57) = v7;
  }
  else
  {
    char v11 = v6 & 1;
    uint64_t v12 = *(void *)(a2 + 32);
    uint64_t v13 = *(void *)(a2 + 40);
    uint64_t v14 = *(void *)(a2 + 48);
    uint64_t v15 = *(void *)(a2 + 56);
    uint64_t v16 = *(void *)(a2 + 64);
    sub_22B12FF34(v12, v13, v14, v15, v16, v6 & 1);
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 56);
    uint64_t v21 = *(void *)(a1 + 64);
    char v22 = *(unsigned char *)(a1 + 72);
    *(void *)(a1 + 32) = v12;
    *(void *)(a1 + 40) = v13;
    *(void *)(a1 + 48) = v14;
    *(void *)(a1 + 56) = v15;
    *(void *)(a1 + 64) = v16;
    *(unsigned char *)(a1 + 72) = v11;
    sub_22B12FFA4(v17, v18, v19, v20, v21, v22);
  }
  return a1;
}

uint64_t sub_22B1301CC(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for PrintSample_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  int v5 = *(unsigned __int8 *)(a1 + 72);
  if (v5 != 255)
  {
    int v6 = *(unsigned __int8 *)(a2 + 72);
    if (v6 != 255)
    {
      char v8 = v5 & 1;
      uint64_t v9 = *(void *)(a2 + 64);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 64);
      long long v15 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = v15;
      *(void *)(a1 + 64) = v9;
      *(unsigned char *)(a1 + 72) = v6 & 1;
      sub_22B12FFA4(v10, v11, v12, v13, v14, v8);
      return a1;
    }
    sub_22B1301CC(a1 + 32);
  }
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintSample_Transport(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 73)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintSample_Transport(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 72) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 73) = 1;
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
    *(unsigned char *)(result + 73) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintSample_Transport()
{
  return &type metadata for PrintSample_Transport;
}

BOOL sub_22B1303A8(char *a1, char *a2)
{
  return qword_22B139A98[*a1] == qword_22B139A98[*a2];
}

uint64_t sub_22B1303CC()
{
  return sub_22B138F60();
}

uint64_t sub_22B13041C()
{
  return sub_22B138F50();
}

uint64_t sub_22B130454()
{
  return sub_22B138F60();
}

uint64_t sub_22B1304A0@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_22B130A58(*a1);
  *a2 = result;
  return result;
}

void sub_22B1304CC(void *a1@<X8>)
{
  *a1 = qword_22B139A98[*v1];
}

uint64_t sub_22B1304E4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22B1311A0();
  uint64_t v5 = MEMORY[0x263F60690];
  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_22B130540()
{
  return sub_22B1389C0();
}

uint64_t sub_22B1305AC(char a1)
{
  return *(void *)&aString_2[8 * a1];
}

uint64_t sub_22B1305CC(char *a1, char *a2)
{
  return sub_22B12AE10(*a1, *a2);
}

uint64_t sub_22B1305D8()
{
  return sub_22B12AFD8();
}

uint64_t sub_22B1305E0()
{
  return sub_22B12B564();
}

uint64_t sub_22B1305E8()
{
  return sub_22B12B644();
}

uint64_t sub_22B1305F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22B130ADC();
  *a1 = result;
  return result;
}

uint64_t sub_22B130620@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22B1305AC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22B13064C()
{
  return sub_22B1305AC(*v0);
}

uint64_t sub_22B130654(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  char v4 = *((unsigned char *)a1 + 24);
  sub_22B130EC8((uint64_t)(a1 + 4), (uint64_t)v13);
  char v12 = 0;
  uint64_t v10 = v1;
  uint64_t v11 = v2;
  char v9 = 1;
  uint64_t v7 = v3;
  char v8 = 0;
  v6[47] = 2;
  v6[46] = v4;
  v6[45] = 3;
  sub_22B130EC8((uint64_t)v13, (uint64_t)v6);
  sub_22B130DC4();
  sub_22B130E18();
  sub_22B130E6C();
  return sub_22B138980();
}

uint64_t sub_22B130768()
{
  return sub_22B138940();
}

__n128 sub_22B1307C0@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_22B130B28(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v7[0];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 57) = *(_OWORD *)((char *)v7 + 9);
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_22B13080C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4590);
  MEMORY[0x270FA5388](v2 - 8);
  char v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22B138A40();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22B138A20();
  uint64_t v11 = v10;
  sub_22B138A60();
  uint64_t v13 = v12;
  sub_22B138A50();
  unint64_t v14 = sub_22B138A30();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_22B138A00();
  uint64_t v15 = sub_22B138AD0();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v4, 1, v15) == 1)
  {
    uint64_t result = sub_22B130A7C((uint64_t)v4);
    uint64_t v18 = 0;
    long long v19 = 0uLL;
    char v20 = -1;
    long long v21 = 0uLL;
  }
  else
  {
    sub_22B1371F0((uint64_t)v25);
    long long v23 = v25[1];
    long long v24 = v25[0];
    uint64_t v18 = v26;
    char v20 = v27;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v4, v15);
    long long v21 = v23;
    long long v19 = v24;
  }
  *(void *)a1 = v9;
  *(void *)(a1 + 8) = v11;
  unint64_t v22 = 0x300020100uLL >> (8 * v14);
  if (v14 >= 5) {
    LOBYTE(v22) = 0;
  }
  *(void *)(a1 + 16) = v13;
  *(unsigned char *)(a1 + 24) = v22;
  *(_OWORD *)(a1 + 32) = v19;
  *(_OWORD *)(a1 + 48) = v21;
  *(void *)(a1 + 64) = v18;
  *(unsigned char *)(a1 + 72) = v20;
  return result;
}

uint64_t sub_22B130A58(unint64_t a1)
{
  if (a1 >= 5) {
    return 4;
  }
  else {
    return (0x304020100uLL >> (8 * a1));
  }
}

uint64_t sub_22B130A7C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4590);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22B130ADC()
{
  unint64_t v0 = sub_22B138F00();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_22B130B28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *((void *)&v21 + 1) = &type metadata for PrintSample_Transport.Key;
  unint64_t v5 = sub_22B130DC4();
  unint64_t v22 = v5;
  LOBYTE(v20) = 0;
  sub_22B138930();
  if (v2)
  {
    uint64_t v6 = sub_22B138960();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v20);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v20);
    uint64_t v8 = v25;
    uint64_t v7 = v26;
    *((void *)&v21 + 1) = &type metadata for PrintSample_Transport.Key;
    unint64_t v22 = v5;
    LOBYTE(v20) = 1;
    sub_22B138930();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v20);
    uint64_t v9 = v27;
    *((void *)&v21 + 1) = &type metadata for PrintSample_Transport.Key;
    unint64_t v22 = v5;
    LOBYTE(v20) = 2;
    sub_22B130E18();
    sub_22B138930();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v20);
    char v11 = v24;
    uint64_t v18 = &type metadata for PrintSample_Transport.Key;
    unint64_t v19 = v5;
    v17[0] = 3;
    sub_22B130E6C();
    sub_22B138930();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
    long long v15 = v21;
    long long v16 = v20;
    unint64_t v12 = v22;
    char v13 = v23;
    uint64_t v14 = sub_22B138960();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
    *(void *)a2 = v8;
    *(void *)(a2 + 8) = v7;
    *(void *)(a2 + 16) = v9;
    *(unsigned char *)(a2 + 24) = v11;
    *(_OWORD *)(a2 + 32) = v16;
    *(_OWORD *)(a2 + 48) = v15;
    *(void *)(a2 + 64) = v12;
    *(unsigned char *)(a2 + 72) = v13;
  }
  return result;
}

unint64_t sub_22B130DC4()
{
  unint64_t result = qword_2683E4598;
  if (!qword_2683E4598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4598);
  }
  return result;
}

unint64_t sub_22B130E18()
{
  unint64_t result = qword_2683E45A0;
  if (!qword_2683E45A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E45A0);
  }
  return result;
}

unint64_t sub_22B130E6C()
{
  unint64_t result = qword_2683E45A8;
  if (!qword_2683E45A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E45A8);
  }
  return result;
}

uint64_t sub_22B130EC0()
{
  return sub_22B130654(*(uint64_t **)(v0 + 16));
}

uint64_t sub_22B130EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E45B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unsigned char *sub_22B130F38(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PrintSample_Transport.Key()
{
  return &type metadata for PrintSample_Transport.Key;
}

uint64_t getEnumTagSinglePayload for SourceLocation_Transport.Key(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s25LiveExecutionResultsProbe21PrintSample_TransportV9LogSourceOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22B1310ACLL);
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

ValueMetadata *type metadata accessor for PrintSample_Transport.LogSource()
{
  return &type metadata for PrintSample_Transport.LogSource;
}

unint64_t sub_22B1310E8()
{
  unint64_t result = qword_2683E45B8;
  if (!qword_2683E45B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E45B8);
  }
  return result;
}

unint64_t sub_22B131140()
{
  unint64_t result = qword_2683E45C0;
  if (!qword_2683E45C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E45C0);
  }
  return result;
}

uint64_t sub_22B131194()
{
  return MEMORY[0x263F60690];
}

unint64_t sub_22B1311A0()
{
  unint64_t result = qword_2683E45C8;
  if (!qword_2683E45C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E45C8);
  }
  return result;
}

uint64_t sub_22B1311FC(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_22B138960();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22B138B40();
  uint64_t v10 = OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_stdOutFileHandle;
  *(void *)(v3 + v10) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08840]), sel_initWithFileDescriptor_, posix_openpt(2));
  uint64_t v11 = OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_stdErrFileHandle;
  *(void *)(v3 + v11) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08840]), sel_initWithFileDescriptor_, posix_openpt(2));
  uint64_t v12 = OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_originalStdOutFD;
  char v13 = (FILE *)sub_22B138C80();
  int v14 = fileno(v13);
  *(_DWORD *)(v3 + v12) = dup(v14);
  uint64_t v15 = OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_originalStdErrFD;
  long long v16 = (FILE *)sub_22B138C70();
  int v17 = fileno(v16);
  *(_DWORD *)(v3 + v15) = dup(v17);
  uint64_t v18 = (void *)(v3 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_probeSampleGenerationHandler);
  *uint64_t v18 = 0;
  v18[1] = 0;
  *(void *)(v3 + 16) = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  sub_22B134D98();
  id v19 = a1;
  sub_22B1389A0();
  sub_22B13140C(v21[2], (void (*)(char *, uint64_t))v22);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v3;
}

uint64_t sub_22B13140C(uint64_t a1, void (*a2)(char *, uint64_t))
{
  uint64_t v3 = v2;
  uint64_t v123 = a1;
  v124 = a2;
  uint64_t v104 = sub_22B138A40();
  uint64_t v103 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  v102 = (char *)&v102 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_22B1389F0();
  v112 = *(void (**)(char *, uint64_t))(v119 - 8);
  MEMORY[0x270FA5388](v119);
  v109 = (char *)&v102 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22B138AF0();
  uint64_t v121 = *(void *)(v6 - 8);
  v122 = (void (*)(char *, char *, uint64_t))v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v102 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = sub_22B138BA0();
  uint64_t v117 = *(void *)(v111 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v111);
  v108 = (char *)&v102 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v107 = (char *)&v102 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = sub_22B138BF0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v106 = (char *)&v102 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v114 = (char *)&v102 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v105 = (char *)&v102 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v113 = (char *)&v102 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v110 = (char *)&v102 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v102 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (char *)&v102 - v29;
  MEMORY[0x270FA5388](v28);
  unint64_t v32 = (char *)&v102 - v31;
  uint64_t v116 = v3;
  uint64_t v33 = v3 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_config;
  swift_beginAccess();
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v120 = v32;
  v34(v32, v33, v13);
  sub_22B138B80();
  (*(void (**)(char *, void, void))(v121 + 104))(v8, **((unsigned int **)&unk_26488ABF0 + (char)v124), v122);
  sub_22B138BC0();
  swift_beginAccess();
  unint64_t v35 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 24);
  uint64_t v121 = v33;
  v35(v33, v30, v13);
  swift_endAccess();
  sub_22B12CF4C(0, (unint64_t *)&qword_2683E4428);
  os_log_t v36 = v109;
  sub_22B138E10();
  v115 = v30;
  uint64_t v118 = v13;
  uint64_t v37 = v13;
  uint64_t v38 = v36;
  v122 = (void (*)(char *, char *, uint64_t))v34;
  uint64_t v123 = v14 + 16;
  v34(v27, (uint64_t)v30, v37);
  uint64_t v39 = sub_22B1389E0();
  os_log_type_t v40 = sub_22B138D80();
  BOOL v41 = os_log_type_enabled(v39, v40);
  uint64_t v125 = v14;
  if (v41)
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    v127[0] = v43;
    *(_DWORD *)uint64_t v42 = 136446210;
    uint64_t v44 = sub_22B138BB0();
    uint64_t v126 = sub_22B129B78(v44, v45, v127);
    sub_22B138E30();
    swift_bridgeObjectRelease();
    uint64_t v46 = v118;
    v124 = *(void (**)(char *, uint64_t))(v125 + 8);
    v124(v27, v118);
    _os_log_impl(&dword_22B126000, v39, v40, "LoggingProbePoint config updated: (%{public}s)", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F409D0](v43, -1, -1);
    MEMORY[0x230F409D0](v42, -1, -1);
  }
  else
  {
    uint64_t v46 = v118;
    v124 = *(void (**)(char *, uint64_t))(v125 + 8);
    v124(v27, v118);
  }

  (*((void (**)(char *, uint64_t))v112 + 1))(v38, v119);
  swift_beginAccess();
  uint64_t v47 = v107;
  sub_22B138BD0();
  swift_endAccess();
  v48 = v108;
  sub_22B138B90();
  uint64_t v49 = sub_22B1354C8(&qword_2683E4620, MEMORY[0x263F52230]);
  uint64_t v50 = v111;
  char v51 = sub_22B138E60();
  uint64_t v53 = v117 + 8;
  int v52 = *(void (**)(char *, uint64_t))(v117 + 8);
  v52(v48, v50);
  v52(v47, v50);
  uint64_t v54 = v110;
  uint64_t v55 = v120;
  v122(v110, v120, v46);
  if (v51)
  {
    sub_22B138BD0();
    sub_22B138B90();
    char v56 = sub_22B138E60();
    v52(v48, v50);
    v52(v47, v50);
    uint64_t v55 = v120;
    v124(v54, v46);
    if ((v56 & 1) == 0 && !off_2683E45D0)
    {
      uint64_t v57 = v116;
      swift_retain();
      sub_22B13231C((uint64_t)sub_22B134F74, v57);
      swift_release();
    }
  }
  else
  {
    v124(v54, v46);
  }
  swift_beginAccess();
  sub_22B138BD0();
  swift_endAccess();
  sub_22B138B60();
  char v58 = sub_22B138E60();
  v52(v48, v50);
  v52(v47, v50);
  uint64_t v59 = v113;
  v122(v113, v55, v46);
  uint64_t v119 = v49;
  v112 = v52;
  if (v58)
  {
    sub_22B138BD0();
    sub_22B138B60();
    char v60 = sub_22B138E60();
    v52(v48, v50);
    v52(v47, v50);
    uint64_t v46 = v118;
    v124(v59, v118);
    if ((v60 & 1) == 0)
    {
      uint64_t v61 = (FILE *)sub_22B138C80();
      int v62 = fileno(v61);
      int v63 = dup(v62);
      uint64_t v64 = v116;
      *(_DWORD *)(v116 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_originalStdOutFD) = v63;
      v65 = *(void **)(v64 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_stdOutFileHandle);
      uint64_t v66 = *MEMORY[0x263F521E8];
      uint64_t v67 = v103;
      v68 = *(void (**)(char *, uint64_t, uint64_t))(v103 + 104);
      uint64_t v117 = v53;
      uint64_t v69 = (uint64_t)v102;
      uint64_t v70 = v104;
      v68(v102, v66, v104);
      id v71 = v65;
      sub_22B133EA4(1, v71, v69);

      uint64_t v55 = v120;
      uint64_t v72 = v70;
      uint64_t v46 = v118;
      (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v69, v72);
      v73 = v114;
      goto LABEL_17;
    }
  }
  else
  {
    v124(v59, v46);
  }
  swift_beginAccess();
  sub_22B138BD0();
  swift_endAccess();
  sub_22B138B60();
  char v74 = sub_22B138E60();
  v52(v48, v50);
  v52(v47, v50);
  v75 = v105;
  v122(v105, v55, v46);
  if (v74)
  {
    v124(v75, v46);
    v73 = v114;
  }
  else
  {
    sub_22B138BD0();
    sub_22B138B60();
    char v76 = sub_22B138E60();
    v52(v48, v50);
    v52(v47, v50);
    uint64_t v55 = v120;
    v124(v75, v46);
    v73 = v114;
    if (v76)
    {
      int v77 = *(_DWORD *)(v116 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_originalStdOutFD);
      v78 = (FILE *)sub_22B138C80();
      int v79 = fileno(v78);
      dup2(v77, v79);
    }
  }
LABEL_17:
  swift_beginAccess();
  sub_22B138BD0();
  swift_endAccess();
  sub_22B138B70();
  char v80 = sub_22B138E60();
  v81 = v112;
  v112(v48, v50);
  v81(v47, v50);
  v122(v73, v55, v46);
  if (v80)
  {
    sub_22B138BD0();
    sub_22B138B70();
    char v82 = sub_22B138E60();
    v81(v48, v50);
    v81(v47, v50);
    v83 = v73;
    v84 = (uint64_t (*)(char *, uint64_t))v124;
    v124(v83, v46);
    if ((v82 & 1) == 0)
    {
      v85 = (FILE *)sub_22B138C70();
      int v86 = fileno(v85);
      int v87 = dup(v86);
      uint64_t v88 = v116;
      *(_DWORD *)(v116 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_originalStdErrFD) = v87;
      v89 = *(void **)(v88 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_stdErrFileHandle);
      uint64_t v90 = v103;
      uint64_t v91 = (uint64_t)v102;
      uint64_t v92 = v104;
      (*(void (**)(char *, void, uint64_t))(v103 + 104))(v102, *MEMORY[0x263F521F0], v104);
      id v93 = v89;
      sub_22B133EA4(2, v93, v91);

      (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v91, v92);
      v84 = (uint64_t (*)(char *, uint64_t))v124;
      v124(v115, v46);
      return v84(v120, v46);
    }
  }
  else
  {
    v94 = v73;
    v84 = (uint64_t (*)(char *, uint64_t))v124;
    v124(v94, v46);
  }
  swift_beginAccess();
  sub_22B138BD0();
  swift_endAccess();
  sub_22B138B70();
  char v95 = sub_22B138E60();
  v81(v48, v50);
  v81(v47, v50);
  v96 = v106;
  v122(v106, v120, v46);
  if (v95)
  {
    v84(v96, v46);
  }
  else
  {
    sub_22B138BD0();
    sub_22B138B70();
    char v97 = sub_22B138E60();
    v81(v48, v50);
    v81(v47, v50);
    v84 = (uint64_t (*)(char *, uint64_t))v124;
    v124(v96, v46);
    if (v97)
    {
      int v98 = *(_DWORD *)(v116 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_originalStdErrFD);
      v99 = (FILE *)sub_22B138C70();
      int v100 = fileno(v99);
      dup2(v98, v100);
    }
  }
  v84(v115, v46);
  return v84(v120, v46);
}

uint64_t sub_22B13231C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_22B1389F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22B138EE0();
  uint64_t v12 = v11;
  sub_22B12CF4C(0, (unint64_t *)&qword_2683E4428);
  sub_22B138E10();
  sub_22B12A4E4(v10);
  sub_22B12A4E4(v10);
  uint64_t v13 = sub_22B1389E0();
  os_log_type_t v14 = sub_22B138D80();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v30 = a2;
    uint64_t v31 = v3;
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v34 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v28 = v6;
    uint64_t v29 = a1;
    if (v10)
    {
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = v10;
      *(void *)(v17 + 24) = v12;
      uint64_t v18 = sub_22B135090;
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v17 = 0;
    }
    uint64_t v32 = (uint64_t)v18;
    uint64_t v33 = v17;
    sub_22B12A4E4(v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4450);
    uint64_t v19 = sub_22B138D30();
    uint64_t v32 = sub_22B129B78(v19, v20, &v34);
    sub_22B138E30();
    swift_bridgeObjectRelease();
    sub_22B12A4F4(v10);
    sub_22B12A4F4(v10);
    _os_log_impl(&dword_22B126000, v13, v14, "setupPrintHook() existing playgroundPrintHook: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F409D0](v16, -1, -1);
    MEMORY[0x230F409D0](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v28);
    a2 = v30;
    a1 = v29;
  }
  else
  {
    sub_22B12A4F4(v10);
    sub_22B12A4F4(v10);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v21 = swift_allocObject();
  swift_weakInit();
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = v21;
  v22[3] = a1;
  v22[4] = a2;
  uint64_t v23 = off_2683E45D0;
  off_2683E45D0 = sub_22B134FF4;
  qword_2683E45D8 = (uint64_t)v22;
  swift_retain();
  sub_22B12A4F4((uint64_t)v23);
  uint64_t v24 = swift_allocObject();
  swift_weakInit();
  uint64_t v25 = (void *)swift_allocObject();
  _OWORD v25[2] = v10;
  uint64_t v25[3] = v12;
  v25[4] = v24;
  return sub_22B138EF0();
}

uint64_t sub_22B1326BC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, void), uint64_t a7)
{
  uint64_t v22 = a3;
  uint64_t v23 = a7;
  uint64_t v21 = a2;
  uint64_t v10 = sub_22B138BA0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  os_log_type_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v20 - v15;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_beginAccess();
    sub_22B138BD0();
    swift_endAccess();
    sub_22B138B90();
    sub_22B1354C8(&qword_2683E4620, MEMORY[0x263F52230]);
    char v18 = sub_22B138E60();
    uint64_t v19 = *(void (**)(char *, uint64_t))(v11 + 8);
    v19(v14, v10);
    v19(v16, v10);
    uint64_t result = swift_release();
    if (v18) {
      return a6(a1, v21, v22, a4 & 1);
    }
  }
  return result;
}

uint64_t sub_22B1328AC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_22B138AF0();
  uint64_t v25 = *(void *)(v6 - 8);
  uint64_t v26 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22B138BA0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v23 - v14;
  if (a3) {
    a3(a1, a2);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v24 = a1;
    swift_beginAccess();
    sub_22B138BD0();
    swift_endAccess();
    sub_22B138B90();
    sub_22B1354C8(&qword_2683E4620, MEMORY[0x263F52230]);
    char v17 = sub_22B138E60();
    char v18 = *(void (**)(char *, uint64_t))(v10 + 8);
    v18(v13, v9);
    v18(v15, v9);
    if (v17)
    {
      swift_beginAccess();
      sub_22B138BE0();
      swift_endAccess();
      char v19 = sub_22B138AE0();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v26);
      uint64_t v20 = 0;
      if (v19)
      {
        sub_22B13538C();
        uint64_t v20 = v21;
      }
      uint64_t v22 = (void (*)(uint64_t, uint64_t, uint64_t, BOOL))off_2683E45D0;
      if (off_2683E45D0)
      {
        swift_retain();
        v22(v24, a2, v20, (v19 & 1) == 0);
        sub_22B12A4F4((uint64_t)v22);
      }
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_22B132BBC(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t v35 = a3;
  uint64_t v40 = a1;
  uint64_t v6 = sub_22B138C90();
  uint64_t v39 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v38 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22B138CB0();
  uint64_t v36 = *(void *)(v8 - 8);
  uint64_t v37 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_22B1389F0();
  uint64_t v11 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_22B138890();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  char v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22B138880();
  sub_22B138870();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  sub_22B12CF4C(0, (unint64_t *)&qword_2683E4428);
  sub_22B138E10();
  swift_bridgeObjectRetain_n();
  uint64_t v20 = sub_22B1389E0();
  os_log_type_t v21 = sub_22B138D80();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v32 = v10;
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v33 = v6;
    uint64_t v24 = v23;
    aBlock[0] = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_22B129B78(v40, a2, aBlock);
    uint64_t v10 = v32;
    sub_22B138E30();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22B126000, v20, v21, "Print hook received: \"%s\"", v22, 0xCu);
    swift_arrayDestroy();
    uint64_t v25 = v24;
    uint64_t v6 = v33;
    MEMORY[0x230F409D0](v25, -1, -1);
    MEMORY[0x230F409D0](v22, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v34);
  uint64_t v26 = swift_allocObject();
  swift_weakInit();
  uint64_t v27 = swift_allocObject();
  uint64_t v28 = v35;
  *(void *)(v27 + 16) = v26;
  *(void *)(v27 + 24) = v28;
  *(unsigned char *)(v27 + 32) = a4 & 1;
  *(void *)(v27 + 40) = v40;
  *(void *)(v27 + 48) = a2;
  *(void *)(v27 + 56) = v19;
  aBlock[4] = (uint64_t)sub_22B13549C;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22B12902C;
  aBlock[3] = (uint64_t)&block_descriptor_0;
  uint64_t v29 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22B138CA0();
  uint64_t v41 = MEMORY[0x263F8EE78];
  sub_22B1354C8((unint64_t *)&qword_2683E4438, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4440);
  sub_22B12A440();
  uint64_t v30 = v38;
  sub_22B138E80();
  MEMORY[0x230F40420](0, v10, v30, v29);
  _Block_release(v29);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v30, v6);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v37);
  swift_release();
  return swift_release();
}

uint64_t sub_22B133150(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  v22[0] = a2;
  v22[1] = a4;
  uint64_t v5 = sub_22B138A40();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_22B138A70();
  uint64_t v9 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4590);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  char v17 = (char *)v22 - v16;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v19 = result;
    sub_22B133470(v22[0], a3 & 1, v17);
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F521F8], v5);
    sub_22B135510((uint64_t)v17, (uint64_t)v15);
    swift_bridgeObjectRetain();
    sub_22B138A10();
    uint64_t v20 = (void (**)(unsigned char *))(v19
                                        + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_probeSampleGenerationHandler);
    swift_beginAccess();
    os_log_type_t v21 = *v20;
    if (*v20)
    {
      swift_endAccess();
      swift_retain();
      sub_22B13080C((uint64_t)v24);
      v21(v24);
      sub_22B135578((uint64_t)v24);
      sub_22B12A4F4((uint64_t)v21);
      swift_release();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v23);
      return sub_22B12FDE4((uint64_t)v17, &qword_2683E4590);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v23);
      sub_22B12FDE4((uint64_t)v17, &qword_2683E4590);
      swift_endAccess();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_22B133470@<X0>(uint64_t a1@<X0>, int a2@<W1>, char *a3@<X8>)
{
  LODWORD(v59) = a2;
  uint64_t v55 = a1;
  char v58 = a3;
  uint64_t v57 = sub_22B1389F0();
  uint64_t v54 = *(void *)(v57 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v57);
  uint64_t v53 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  char v51 = (char *)&v47 - v5;
  uint64_t v6 = sub_22B138B10();
  uint64_t v52 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22B138AC0();
  uint64_t v56 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4630);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v47 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v47 - v19;
  uint64_t v21 = sub_22B138AF0();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v47 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v59 & 1) == 0)
  {
    uint64_t v50 = v18;
    uint64_t v47 = v8;
    uint64_t v59 = (uint64_t)v20;
    v48 = v15;
    uint64_t v49 = v11;
    uint64_t v25 = v56;
    swift_beginAccess();
    sub_22B138BE0();
    swift_endAccess();
    int v26 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v24, v21);
    if (v26 == *MEMORY[0x263F52220])
    {
      uint64_t v27 = sub_22B138AD0();
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v58, 1, 1, v27);
    }
    if (v26 == *MEMORY[0x263F52210])
    {
      uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56);
      uint64_t v34 = v59;
      uint64_t v35 = v9;
      v33(v59, 1, 1, v9);
      sub_22B138B30();
      sub_22B138B20();
      uint64_t v36 = (uint64_t)v50;
      sub_22B138B00();
      sub_22B12FDE4(v34, &qword_2683E4630);
      swift_release();
      v33(v36, 0, 1, v35);
      sub_22B135600(v36, v34);
      uint64_t v41 = v58;
      uint64_t v42 = v49;
      uint64_t v43 = (uint64_t)v48;
      sub_22B135600(v34, (uint64_t)v48);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v43, 1, v35) == 1)
      {
        sub_22B12FDE4(v43, &qword_2683E4630);
        uint64_t v44 = sub_22B138AD0();
        return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v41, 1, 1, v44);
      }
      unint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 32);
      v45(v42, v43, v35);
      v45(v41, (uint64_t)v42, v35);
      uint64_t v46 = *MEMORY[0x263F52200];
      uint64_t v38 = sub_22B138AD0();
      uint64_t v39 = *(void *)(v38 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v39 + 104))(v41, v46, v38);
    }
    else
    {
      if (v26 != *MEMORY[0x263F52218])
      {
        uint64_t v40 = sub_22B138AD0();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v58, 1, 1, v40);
        return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
      }
      uint64_t v41 = v58;
      *(void *)char v58 = v55;
      uint64_t v37 = *MEMORY[0x263F52208];
      uint64_t v38 = sub_22B138AD0();
      uint64_t v39 = *(void *)(v38 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v39 + 104))(v41, v37, v38);
    }
    return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v41, 0, 1, v38);
  }
  uint64_t v29 = sub_22B138AD0();
  uint64_t v30 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56);
  uint64_t v31 = v29;
  uint64_t v32 = v58;
  return v30(v32, 1, 1, v31);
}

char *sub_22B133EA4(int a1, void *a2, uint64_t a3)
{
  uint64_t v17 = a3;
  uint64_t v5 = sub_22B138A40();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  int v8 = objc_msgSend(a2, sel_fileDescriptor);
  grantpt(v8);
  unlockpt(v8);
  uint64_t result = ptsname(v8);
  if (result)
  {
    uint64_t v10 = sub_22B138C50();
    sub_22B135098(v8);
    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08840]), sel_initWithFileDescriptor_closeOnDealloc_, v10, 1);
    dup2((int)objc_msgSend(v11, sel_fileDescriptor), a1);
    uint64_t v12 = swift_allocObject();
    swift_weakInit();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v5);
    unint64_t v13 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v12;
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v14 + v13, (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    aBlock[4] = sub_22B135734;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22B1347E4;
    aBlock[3] = &block_descriptor_25;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain();
    sub_22B12A4E4((uint64_t)sub_22B135734);
    swift_release();
    objc_msgSend(a2, sel_setReadabilityHandler_, v15);

    _Block_release(v15);
    swift_release();
    return (char *)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22B134124(void *a1, uint64_t a2, uint64_t a3)
{
  id v50 = a1;
  uint64_t v51 = a3;
  uint64_t v3 = sub_22B138C90();
  uint64_t v48 = *(void *)(v3 - 8);
  uint64_t v49 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v46 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_22B138CB0();
  uint64_t v45 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v44 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22B138A40();
  uint64_t v42 = *(void *)(v6 - 8);
  uint64_t v43 = v6;
  uint64_t v7 = *(void *)(v42 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v41 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22B138D20();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = sub_22B138BA0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22B138CC0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (uint64_t *)((char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22B12CF4C(0, &qword_2683E4498);
  *uint64_t v16 = sub_22B138DD0();
  (*(void (**)(uint64_t *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F8F0D8], v13);
  char v17 = sub_22B138CD0();
  (*(void (**)(uint64_t *, uint64_t))(v14 + 8))(v16, v13);
  if ((v17 & 1) == 0)
  {
    __break(1u);
    JUMPOUT(0x22B1347D4);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v19 = result;
    swift_beginAccess();
    sub_22B138BD0();
    swift_endAccess();
    uint64_t v20 = v51;
    char v21 = sub_22B138B50();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    if (v21)
    {
      id v22 = v50;
      id v23 = objc_msgSend(v50, sel_availableData);
      uint64_t v24 = sub_22B138860();
      unint64_t v26 = v25;

      switch(v26 >> 62)
      {
        case 1uLL:
          if ((int)v24 != v24 >> 32) {
            goto LABEL_6;
          }
          goto LABEL_11;
        case 2uLL:
          if (*(void *)(v24 + 16) == *(void *)(v24 + 24)) {
            goto LABEL_11;
          }
          goto LABEL_6;
        case 3uLL:
          goto LABEL_11;
        default:
          if ((v26 & 0xFF000000000000) != 0)
          {
LABEL_6:
            sub_22B138D10();
            uint64_t v27 = sub_22B138D00();
            if (v28)
            {
              uint64_t v29 = v27;
              uint64_t v30 = v28;
              id v50 = *(id *)(v19 + 16);
              uint64_t v31 = v41;
              uint64_t v32 = v42;
              uint64_t v33 = v43;
              (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v41, v20, v43);
              uint64_t v34 = *(unsigned __int8 *)(v32 + 80);
              uint64_t v51 = v24;
              uint64_t v35 = (v34 + 32) & ~v34;
              uint64_t v36 = swift_allocObject();
              *(void *)(v36 + 16) = v29;
              *(void *)(v36 + 24) = v30;
              (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v36 + v35, v31, v33);
              *(void *)(v36 + ((v7 + v35 + 7) & 0xFFFFFFFFFFFFFFF8)) = v19;
              aBlock[4] = sub_22B135890;
              aBlock[5] = v36;
              aBlock[0] = MEMORY[0x263EF8330];
              aBlock[1] = 1107296256;
              aBlock[2] = sub_22B12902C;
              aBlock[3] = &block_descriptor_31;
              uint64_t v37 = _Block_copy(aBlock);
              swift_retain();
              uint64_t v38 = v44;
              sub_22B138CA0();
              uint64_t v52 = MEMORY[0x263F8EE78];
              sub_22B1354C8((unint64_t *)&qword_2683E4438, MEMORY[0x263F8F030]);
              __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4440);
              sub_22B12A440();
              uint64_t v39 = v46;
              uint64_t v40 = v49;
              sub_22B138E80();
              MEMORY[0x230F40420](0, v38, v39, v37);
              _Block_release(v37);
              sub_22B12A2D4(v51, v26);
              (*(void (**)(char *, uint64_t))(v48 + 8))(v39, v40);
              (*(void (**)(char *, uint64_t))(v45 + 8))(v38, v47);
              swift_release();
              return swift_release();
            }
          }
          else
          {
LABEL_11:
            objc_msgSend(v22, sel_setReadabilityHandler_, 0);
            _Block_release(0);
          }
          sub_22B12A2D4(v24, v26);
          break;
      }
    }
    return swift_release();
  }
  return result;
}

void sub_22B1347E4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_22B13484C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a1;
  uint64_t v25 = a4;
  uint64_t v22 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4590);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22B138A40();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22B138890();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_22B138A70();
  uint64_t v15 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  char v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_22B138880();
  sub_22B138870();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v22, v7);
  uint64_t v18 = sub_22B138AD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 1, 1, v18);
  sub_22B138A10();
  uint64_t v19 = (void (**)(unsigned char *))(v25
                                      + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_probeSampleGenerationHandler);
  swift_beginAccess();
  uint64_t v20 = *v19;
  if (*v19)
  {
    swift_endAccess();
    swift_retain();
    sub_22B13080C((uint64_t)v26);
    v20(v26);
    sub_22B135578((uint64_t)v26);
    sub_22B12A4F4((uint64_t)v20);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v23);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v23);
    return swift_endAccess();
  }
}

uint64_t sub_22B134BA8()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_config;
  uint64_t v2 = sub_22B138BF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  sub_22B12A4F4(*(uint64_t *)((char *)v0
                           + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_probeSampleGenerationHandler));
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_22B134C84()
{
  return type metadata accessor for LoggingProbePoint();
}

uint64_t type metadata accessor for LoggingProbePoint()
{
  uint64_t result = qword_2683E4600;
  if (!qword_2683E4600) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22B134CD8()
{
  uint64_t result = sub_22B138BF0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_22B134D98()
{
  unint64_t result = qword_2683E4610;
  if (!qword_2683E4610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4610);
  }
  return result;
}

unint64_t sub_22B134DF0()
{
  unint64_t result = qword_2683E4618;
  if (!qword_2683E4618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4618);
  }
  return result;
}

unint64_t sub_22B134E44()
{
  return 0xD000000000000013;
}

uint64_t sub_22B134E60(void *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_22B1311FC(a1, a2);
  return v4;
}

uint64_t sub_22B134EB0()
{
  uint64_t v0 = off_2683E45D0;
  off_2683E45D0 = 0;
  qword_2683E45D8 = 0;
  return sub_22B12A4F4((uint64_t)v0);
}

uint64_t sub_22B134EC4(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = a1;
    *(void *)(v5 + 24) = a2;
    uint64_t v6 = sub_22B135920;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_probeSampleGenerationHandler);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *uint64_t v7 = (uint64_t)v6;
  v7[1] = v5;
  return sub_22B12A4F4(v8);
}

uint64_t sub_22B134F64(uint64_t a1)
{
  return sub_22B13140C(*(void *)a1, (void (*)(char *, uint64_t))*(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_22B134F74(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  return sub_22B132BBC(a1, a2, a3, a4 & 1);
}

uint64_t sub_22B134F7C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22B134FB4()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22B134FF4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_22B1326BC(a1, a2, a3, a4 & 1, *(void *)(v4 + 16), *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v4 + 24), *(void *)(v4 + 32));
}

uint64_t sub_22B135004()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22B13504C(uint64_t a1, uint64_t a2)
{
  return sub_22B1328AC(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_22B135058()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22B135090(void *a1)
{
  return sub_22B129380(a1, *(uint64_t (**)(void, void))(v1 + 16));
}

uint64_t sub_22B135098(int a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_22B1389F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v14[-v7];
  memset(&v16, 0, 52);
  v16.c_ispeed = 0;
  v16.c_ospeed = 0;
  if (!tcgetattr(a1, &v16))
  {
    *(int8x16_t *)&v16.c_iflag = vandq_s8(*(int8x16_t *)&v16.c_iflag, (int8x16_t)xmmword_22B139B10);
    uint64_t result = tcsetattr(a1, 0, &v16);
    if (!result) {
      return result;
    }
    sub_22B12CF4C(0, (unint64_t *)&qword_2683E4428);
    sub_22B138E10();
    uint64_t v9 = sub_22B1389E0();
    os_log_type_t v13 = sub_22B138D90();
    if (!os_log_type_enabled(v9, v13))
    {
      uint64_t v6 = v8;
      goto LABEL_9;
    }
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 67240192;
    int v15 = MEMORY[0x230F402A0]();
    sub_22B138E30();
    _os_log_impl(&dword_22B126000, v9, v13, "Error: Could not set tty settings: %{public}d", v11, 8u);
    uint64_t v6 = v8;
    goto LABEL_7;
  }
  sub_22B12CF4C(0, (unint64_t *)&qword_2683E4428);
  sub_22B138E10();
  uint64_t v9 = sub_22B1389E0();
  os_log_type_t v10 = sub_22B138D90();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 67240192;
    int v15 = MEMORY[0x230F402A0]();
    sub_22B138E30();
    _os_log_impl(&dword_22B126000, v9, v10, "Error: Could not get tty settings: %{public}d", v11, 8u);
LABEL_7:
    MEMORY[0x230F409D0](v11, -1, -1);
  }
LABEL_9:

  return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
}

void sub_22B13538C()
{
  id v0 = objc_msgSend(self, sel_callStackReturnAddresses);
  sub_22B12CF4C(0, &qword_2683E4628);
  uint64_t v1 = sub_22B138D60();

  if ((v1 & 0xC000000000000001) != 0)
  {
    id v2 = (id)MEMORY[0x230F404E0](3, v1);
  }
  else
  {
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) < 4uLL)
    {
      __break(1u);
      goto LABEL_8;
    }
    id v2 = *(id *)(v1 + 56);
  }
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v3, sel_unsignedLongLongValue);

  if (!v4) {
LABEL_8:
  }
    __break(1u);
}

uint64_t sub_22B13545C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_22B13549C()
{
  return sub_22B133150(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32), *(void *)(v0 + 40));
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

uint64_t sub_22B1354C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22B135510(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4590);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22B135578(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  unsigned __int8 v7 = *(unsigned char *)(a1 + 72);
  swift_bridgeObjectRelease();
  sub_22B1355E8(v2, v3, v4, v5, v6, v7);
  return a1;
}

uint64_t sub_22B1355E8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 != 255) {
    return sub_22B12FFA4(result, a2, a3, a4, a5, a6 & 1);
  }
  return result;
}

uint64_t sub_22B135600(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683E4630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22B135668()
{
  uint64_t v1 = sub_22B138A40();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_22B135734(void *a1)
{
  uint64_t v3 = *(void *)(sub_22B138A40() - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_22B134124(a1, v4, v5);
}

uint64_t sub_22B1357A8()
{
  uint64_t v1 = sub_22B138A40();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_22B135890()
{
  uint64_t v1 = *(void *)(sub_22B138A40() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_22B13484C(v3, v4, v0 + v2, v5);
}

uint64_t sub_22B135920(_OWORD *a1)
{
  unint64_t v2 = *(uint64_t (**)(_OWORD *))(v1 + 16);
  long long v3 = a1[3];
  void v6[2] = a1[2];
  v7[0] = v3;
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)a1 + 57);
  long long v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return v2(v6);
}

uint64_t sub_22B135980()
{
  return 1;
}

uint64_t sub_22B135988()
{
  return sub_22B138F60();
}

uint64_t sub_22B1359E0()
{
  return sub_22B138D40();
}

uint64_t sub_22B1359FC()
{
  return sub_22B138F60();
}

uint64_t sub_22B135A50@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_22B138F00();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_22B135AA4(void *a1@<X8>)
{
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x800000022B13A580;
}

unint64_t sub_22B135AC4()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_22B135AE0()
{
  return sub_22B138950();
}

uint64_t sub_22B135B50@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v8 = &type metadata for PlaygroundLoggerProbePointConfiguration_Transport.Key;
  unint64_t v9 = sub_22B135C50();
  sub_22B138930();
  uint64_t v5 = sub_22B138960();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  if (!v2) {
    *a2 = v10;
  }
  return result;
}

unint64_t sub_22B135C50()
{
  unint64_t result = qword_2683E4640;
  if (!qword_2683E4640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4640);
  }
  return result;
}

void sub_22B135CA4(uint64_t a1, unsigned char *a2)
{
  *a2 = *(unsigned char *)(v2 + 16);
}

uint64_t getEnumTagSinglePayload for PlaygroundLoggerProbePointConfiguration_Transport.Key(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for PlaygroundLoggerProbePointConfiguration_Transport.Key(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x22B135DA0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22B135DC8()
{
  return 0;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerProbePointConfiguration_Transport.Key()
{
  return &type metadata for PlaygroundLoggerProbePointConfiguration_Transport.Key;
}

uint64_t getEnumTagSinglePayload for PlaygroundLoggerProbePointConfiguration_Transport(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PlaygroundLoggerProbePointConfiguration_Transport(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22B135F4CLL);
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

ValueMetadata *type metadata accessor for PlaygroundLoggerProbePointConfiguration_Transport()
{
  return &type metadata for PlaygroundLoggerProbePointConfiguration_Transport;
}

unint64_t sub_22B135F88()
{
  unint64_t result = qword_2683E4648;
  if (!qword_2683E4648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4648);
  }
  return result;
}

uint64_t sub_22B135FDC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_22B135FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t sub_22B136004(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_22B136018(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_22B13602C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t sub_22B136040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t sub_22B136054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

BOOL sub_22B136068(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22B13607C()
{
  return sub_22B138F60();
}

uint64_t sub_22B1360C4()
{
  return sub_22B138F50();
}

uint64_t sub_22B1360F0()
{
  return sub_22B138F60();
}

uint64_t *sub_22B136134@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_22B13614C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_22B136158(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22B136F58();
  uint64_t v5 = MEMORY[0x263F60690];
  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_22B1361B4()
{
  return sub_22B1389C0();
}

void *sub_22B136220@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_22B13622C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22B136E54();
  uint64_t v5 = MEMORY[0x263F60690];
  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_22B136288()
{
  return sub_22B1389C0();
}

void sub_22B1362F4(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_22B1362FC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_22B136310@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_22B136324@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_22B136338(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_22B136368@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_22B136394@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_22B1363B8(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_22B1363CC(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_22B1363E0(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_22B1363F4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_22B136408(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_22B13641C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_22B136430(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_22B136444()
{
  return *v0 == 0;
}

uint64_t sub_22B136454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_22B13646C(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_22B136480@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_22B136490(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_22B13649C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22B1364B0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_22B136764(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_22B1364F0(char *a1, char *a2)
{
  return sub_22B12AE98(*a1, *a2);
}

uint64_t sub_22B1364FC()
{
  return sub_22B12B044();
}

uint64_t sub_22B136504()
{
  sub_22B138D40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22B136578()
{
  return sub_22B12B5C0();
}

uint64_t sub_22B136580@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_22B138F00();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_22B1365E0(unint64_t *a1@<X8>)
{
  if (*v1) {
    unint64_t v2 = 0xD00000000000001CLL;
  }
  else {
    unint64_t v2 = 0xD000000000000010;
  }
  unint64_t v3 = 0x800000022B13A5A0;
  if (*v1) {
    unint64_t v3 = 0x800000022B13A5C0;
  }
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_22B136624()
{
  if (*v0) {
    return 0xD00000000000001CLL;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_22B136664()
{
  return sub_22B138990();
}

uint64_t sub_22B1366EC()
{
  return sub_22B138940();
}

uint64_t sub_22B136734@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_22B13679C(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_22B136764(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  char v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_22B13679C(uint64_t a1)
{
  int v8 = &type metadata for LoggingProbePointConfiguration_Transport.Key;
  unint64_t v4 = sub_22B1368EC();
  unint64_t v9 = v4;
  v7[0] = 0;
  sub_22B136940();
  sub_22B138930();
  if (!v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
    uint64_t v2 = v10;
    int v8 = &type metadata for LoggingProbePointConfiguration_Transport.Key;
    unint64_t v9 = v4;
    v7[0] = 1;
    sub_22B136994();
    sub_22B138930();
  }
  uint64_t v5 = sub_22B138960();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v2;
}

unint64_t sub_22B1368EC()
{
  unint64_t result = qword_2683E4650;
  if (!qword_2683E4650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4650);
  }
  return result;
}

unint64_t sub_22B136940()
{
  unint64_t result = qword_2683E4658;
  if (!qword_2683E4658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4658);
  }
  return result;
}

unint64_t sub_22B136994()
{
  unint64_t result = qword_2683E4660;
  if (!qword_2683E4660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4660);
  }
  return result;
}

uint64_t sub_22B1369E8()
{
  return sub_22B136664();
}

uint64_t getEnumTagSinglePayload for SourceLocationCollectionMode_Transport(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SourceLocationCollectionMode_Transport(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22B136B50);
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

ValueMetadata *type metadata accessor for SourceLocationCollectionMode_Transport()
{
  return &type metadata for SourceLocationCollectionMode_Transport;
}

ValueMetadata *type metadata accessor for LoggingProbePointConfiguration_Transport.LogSources()
{
  return &type metadata for LoggingProbePointConfiguration_Transport.LogSources;
}

unsigned char *storeEnumTagSinglePayload for LoggingProbePointConfiguration_Transport.Key(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22B136C64);
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

ValueMetadata *type metadata accessor for LoggingProbePointConfiguration_Transport.Key()
{
  return &type metadata for LoggingProbePointConfiguration_Transport.Key;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for LoggingProbePointConfiguration_Transport(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  BOOL v4 = v3 >= 3;
  int v5 = v3 - 3;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for LoggingProbePointConfiguration_Transport(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LoggingProbePointConfiguration_Transport()
{
  return &type metadata for LoggingProbePointConfiguration_Transport;
}

unint64_t sub_22B136D4C()
{
  unint64_t result = qword_2683E4668;
  if (!qword_2683E4668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4668);
  }
  return result;
}

unint64_t sub_22B136DA4()
{
  unint64_t result = qword_2683E4670;
  if (!qword_2683E4670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4670);
  }
  return result;
}

unint64_t sub_22B136DFC()
{
  unint64_t result = qword_2683E4678;
  if (!qword_2683E4678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4678);
  }
  return result;
}

unint64_t sub_22B136E54()
{
  unint64_t result = qword_2683E4680;
  if (!qword_2683E4680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4680);
  }
  return result;
}

unint64_t sub_22B136EAC()
{
  unint64_t result = qword_2683E4688;
  if (!qword_2683E4688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4688);
  }
  return result;
}

unint64_t sub_22B136F04()
{
  unint64_t result = qword_2683E4690;
  if (!qword_2683E4690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4690);
  }
  return result;
}

unint64_t sub_22B136F58()
{
  unint64_t result = qword_2683E4698;
  if (!qword_2683E4698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E4698);
  }
  return result;
}

uint64_t destroy for SourceLocationInfo_Transport(uint64_t a1)
{
  return sub_22B12FFA4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t initializeWithCopy for SourceLocationInfo_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_22B12FF34(*(void *)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for SourceLocationInfo_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_22B12FF34(*(void *)a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  char v14 = *(unsigned char *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  sub_22B12FFA4(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SourceLocationInfo_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 40);
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(void *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 40) = v4;
  sub_22B12FFA4(v5, v7, v6, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for SourceLocationInfo_Transport(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SourceLocationInfo_Transport(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_22B1371CC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_22B1371D4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SourceLocationInfo_Transport()
{
  return &type metadata for SourceLocationInfo_Transport;
}

uint64_t sub_22B1371F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22B138AC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22B138AD0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  long long v11 = (uint64_t *)((char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 16))(v11, v2, v8);
  int v12 = (*(uint64_t (**)(uint64_t *, uint64_t))(v9 + 88))(v11, v8);
  int v13 = v12;
  int v14 = *MEMORY[0x263F52200];
  if (v12 == *MEMORY[0x263F52200])
  {
    (*(void (**)(uint64_t *, uint64_t))(v9 + 96))(v11, v8);
    (*(void (**)(char *, uint64_t *, uint64_t))(v5 + 32))(v7, v11, v4);
    uint64_t v20 = sub_22B138AB0();
    uint64_t v26 = v21;
    uint64_t v17 = sub_22B138A80();
    int v22 = v14;
    uint64_t v23 = v4;
    uint64_t v18 = sub_22B138AA0();
    uint64_t v19 = sub_22B138A90();
    uint64_t v24 = v23;
    int v14 = v22;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v24);
    uint64_t v16 = v26;
  }
  else if (v12 == *MEMORY[0x263F52208])
  {
    uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v9 + 96))(v11, v8);
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = *v11;
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v20 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }
  *(void *)a1 = v20;
  *(void *)(a1 + 8) = v16;
  *(void *)(a1 + 16) = v17;
  *(void *)(a1 + 24) = v18;
  *(void *)(a1 + 32) = v19;
  *(unsigned char *)(a1 + 40) = v13 != v14;
  return result;
}

unint64_t sub_22B137490(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x626D754E656E696CLL;
      break;
    case 2:
      unint64_t result = 0x6E6D756C6F63;
      break;
    case 3:
      return result;
    default:
      unint64_t result = 0x68746150656C6966;
      break;
  }
  return result;
}

uint64_t sub_22B137528(unsigned __int8 *a1, char *a2)
{
  return sub_22B12AC84(*a1, *a2);
}

uint64_t sub_22B137534()
{
  return sub_22B12B0CC();
}

uint64_t sub_22B13753C()
{
  return sub_22B12B498();
}

uint64_t sub_22B137544()
{
  return sub_22B12B6AC();
}

uint64_t sub_22B13754C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22B137B90();
  *a1 = result;
  return result;
}

unint64_t sub_22B13757C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_22B137490(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_22B1375A8()
{
  return sub_22B137490(*v0);
}

uint64_t sub_22B1375B0()
{
  return sub_22B138980();
}

uint64_t sub_22B137690(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 0x6F4C656372756F73;
  }
}

uint64_t sub_22B1376D8()
{
  return sub_22B138940();
}

double sub_22B137728@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_22B137BDC(a1, v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_22B137770(char *a1, char *a2)
{
  return sub_22B12ABD0(*a1, *a2);
}

uint64_t sub_22B13777C()
{
  return sub_22B12B1AC();
}

uint64_t sub_22B137784()
{
  return sub_22B12B41C();
}

uint64_t sub_22B13778C()
{
  return sub_22B12B788();
}

uint64_t sub_22B137794@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_22B138F00();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_22B1377F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22B137690(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22B137820(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22B138650();
  uint64_t v5 = MEMORY[0x263F60648];
  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_22B13787C()
{
  return sub_22B1389C0();
}

uint64_t sub_22B1378E4(char a1)
{
  if (!a1) {
    return 0x696D697263736964;
  }
  if (a1 == 1) {
    return 0x6F4C656372756F73;
  }
  return 0xD000000000000011;
}

uint64_t sub_22B137954(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22B12AA98(*a1, *a2);
}

uint64_t sub_22B137960()
{
  return sub_22B12B240();
}

uint64_t sub_22B137968()
{
  return sub_22B12B378();
}

uint64_t sub_22B137970()
{
  return sub_22B12B818();
}

uint64_t sub_22B137978@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22B137E0C();
  *a1 = result;
  return result;
}

uint64_t sub_22B1379A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22B1378E4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22B1379D4()
{
  return sub_22B1378E4(*v0);
}

uint64_t sub_22B1379DC()
{
  sub_22B138088(v0, v11);
  unint64_t v1 = sub_22B1380A0();
  sub_22B1380F4();
  sub_22B138950();
  sub_22B138088(v0, v12);
  if (v14)
  {
    uint64_t v4 = *(void *)&v12[0];
    char v5 = 0;
    *((void *)&v9 + 1) = &type metadata for SourceLocationInfo_Transport.Key;
    unint64_t v10 = v1;
    LOBYTE(v8) = 2;
    sub_22B138920();
    uint64_t v2 = (uint64_t *)&v8;
  }
  else
  {
    long long v8 = v12[0];
    long long v9 = v12[1];
    unint64_t v10 = v13;
    uint64_t v6 = &type metadata for SourceLocationInfo_Transport.Key;
    unint64_t v7 = v1;
    LOBYTE(v4) = 1;
    sub_22B138148();
    sub_22B138920();
    uint64_t v2 = &v4;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

uint64_t sub_22B137B08()
{
  sub_22B138088(v0, v2);
  return sub_22B1379DC();
}

_OWORD *sub_22B137B48@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t result = (_OWORD *)sub_22B137E58(a1, (uint64_t)v5);
  if (!v2) {
    return sub_22B138088(v5, a2);
  }
  return result;
}

uint64_t sub_22B137B90()
{
  unint64_t v0 = sub_22B138F00();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_22B137BDC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  int v15 = &type metadata for SourceLocation_Transport.Key;
  unint64_t v5 = sub_22B1386A4();
  unint64_t v16 = v5;
  v14[0] = 0;
  sub_22B138930();
  if (v2)
  {
    uint64_t v6 = sub_22B138960();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
    uint64_t v8 = v17;
    uint64_t v7 = v18;
    int v15 = &type metadata for SourceLocation_Transport.Key;
    unint64_t v16 = v5;
    v14[0] = 1;
    sub_22B138930();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
    uint64_t v9 = v19;
    int v15 = &type metadata for SourceLocation_Transport.Key;
    unint64_t v16 = v5;
    v14[0] = 2;
    sub_22B138930();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
    int v15 = &type metadata for SourceLocation_Transport.Key;
    unint64_t v16 = v5;
    v14[0] = 3;
    sub_22B138930();
    uint64_t v11 = sub_22B138960();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
    *a2 = v8;
    a2[1] = v7;
    a2[2] = v9;
    a2[3] = v13;
    a2[4] = v12;
  }
  return result;
}

uint64_t sub_22B137E0C()
{
  unint64_t v0 = sub_22B138F00();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_22B137E58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *((void *)&v17 + 1) = &type metadata for SourceLocationInfo_Transport.Key;
  unint64_t v5 = sub_22B1380A0();
  unint64_t v18 = v5;
  LOBYTE(v16[0]) = 0;
  sub_22B1380F4();
  sub_22B138930();
  if (v2)
  {
    uint64_t v6 = sub_22B138960();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    char v8 = v15[0];
    if (v15[0])
    {
      *((void *)&v17 + 1) = &type metadata for SourceLocationInfo_Transport.Key;
      unint64_t v18 = v5;
      LOBYTE(v16[0]) = 2;
      sub_22B138930();
      uint64_t v9 = sub_22B138960();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
      uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
      uint64_t v10 = 0;
      unint64_t v11 = 0;
      uint64_t v12 = v15[0];
      long long v13 = 0uLL;
    }
    else
    {
      v15[3] = &type metadata for SourceLocationInfo_Transport.Key;
      v15[4] = v5;
      LOBYTE(v15[0]) = 1;
      sub_22B138148();
      sub_22B138930();
      uint64_t v14 = sub_22B138960();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
      uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
      uint64_t v12 = v16[0];
      uint64_t v10 = v16[1];
      long long v13 = v17;
      unint64_t v11 = v18;
    }
    *(void *)a2 = v12;
    *(void *)(a2 + 8) = v10;
    *(_OWORD *)(a2 + 16) = v13;
    *(void *)(a2 + 32) = v11;
    *(unsigned char *)(a2 + 40) = v8;
  }
  return result;
}

_OWORD *sub_22B138088(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(long long *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

unint64_t sub_22B1380A0()
{
  unint64_t result = qword_2683E46A0;
  if (!qword_2683E46A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E46A0);
  }
  return result;
}

unint64_t sub_22B1380F4()
{
  unint64_t result = qword_2683E46A8;
  if (!qword_2683E46A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E46A8);
  }
  return result;
}

unint64_t sub_22B138148()
{
  unint64_t result = qword_2683E46B0;
  if (!qword_2683E46B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E46B0);
  }
  return result;
}

_OWORD *sub_22B13819C(unsigned char *a1, unsigned char *a2)
{
  uint64_t v4 = *(long long **)(v2 + 16);
  *a1 = 0;
  unint64_t result = sub_22B138088(v4, &v6);
  *a2 = v7;
  return result;
}

unsigned char *storeEnumTagSinglePayload for SourceLocationInfo_Transport.Discriminant(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22B1382ACLL);
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

ValueMetadata *type metadata accessor for SourceLocationInfo_Transport.Discriminant()
{
  return &type metadata for SourceLocationInfo_Transport.Discriminant;
}

unsigned char *storeEnumTagSinglePayload for SourceLocationInfo_Transport.Key(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22B1383B0);
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

ValueMetadata *type metadata accessor for SourceLocationInfo_Transport.Key()
{
  return &type metadata for SourceLocationInfo_Transport.Key;
}

uint64_t destroy for SourceLocation_Transport()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SourceLocation_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SourceLocation_Transport(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SourceLocation_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SourceLocation_Transport(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SourceLocation_Transport(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SourceLocation_Transport()
{
  return &type metadata for SourceLocation_Transport;
}

unint64_t sub_22B138598()
{
  unint64_t result = qword_2683E46B8;
  if (!qword_2683E46B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E46B8);
  }
  return result;
}

unint64_t sub_22B1385F0()
{
  unint64_t result = qword_2683E46C0;
  if (!qword_2683E46C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E46C0);
  }
  return result;
}

uint64_t sub_22B138644()
{
  return MEMORY[0x263F60648];
}

unint64_t sub_22B138650()
{
  unint64_t result = qword_2683E46C8;
  if (!qword_2683E46C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E46C8);
  }
  return result;
}

unint64_t sub_22B1386A4()
{
  unint64_t result = qword_2683E46D0;
  if (!qword_2683E46D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E46D0);
  }
  return result;
}

uint64_t sub_22B1386F8()
{
  return sub_22B1375B0();
}

unsigned char *storeEnumTagSinglePayload for SourceLocation_Transport.Key(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22B1387CCLL);
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

ValueMetadata *type metadata accessor for SourceLocation_Transport.Key()
{
  return &type metadata for SourceLocation_Transport.Key;
}

unint64_t sub_22B138808()
{
  unint64_t result = qword_2683E46D8;
  if (!qword_2683E46D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E46D8);
  }
  return result;
}

uint64_t sub_22B138860()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22B138870()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_22B138880()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_22B138890()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22B1388A0()
{
  return MEMORY[0x270F561D8]();
}

uint64_t sub_22B1388B0()
{
  return MEMORY[0x270F561E8]();
}

uint64_t sub_22B1388C0()
{
  return MEMORY[0x270F561F0]();
}

uint64_t sub_22B1388D0()
{
  return MEMORY[0x270F56208]();
}

uint64_t sub_22B1388E0()
{
  return MEMORY[0x270F56210]();
}

uint64_t sub_22B1388F0()
{
  return MEMORY[0x270F56218]();
}

uint64_t sub_22B138900()
{
  return MEMORY[0x270F55618]();
}

uint64_t sub_22B138910()
{
  return MEMORY[0x270F55620]();
}

uint64_t sub_22B138920()
{
  return MEMORY[0x270F55820]();
}

uint64_t sub_22B138930()
{
  return MEMORY[0x270F55828]();
}

uint64_t sub_22B138940()
{
  return MEMORY[0x270F55860]();
}

uint64_t sub_22B138950()
{
  return MEMORY[0x270F55870]();
}

uint64_t sub_22B138960()
{
  return MEMORY[0x270F55880]();
}

uint64_t sub_22B138970()
{
  return MEMORY[0x270F558D8]();
}

uint64_t sub_22B138980()
{
  return MEMORY[0x270F55B00]();
}

uint64_t sub_22B138990()
{
  return MEMORY[0x270F55B10]();
}

uint64_t sub_22B1389A0()
{
  return MEMORY[0x270F55C50]();
}

uint64_t sub_22B1389C0()
{
  return MEMORY[0x270F55C70]();
}

uint64_t sub_22B1389D0()
{
  return MEMORY[0x270F55D20]();
}

uint64_t sub_22B1389E0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22B1389F0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22B138A00()
{
  return MEMORY[0x270F47680]();
}

uint64_t sub_22B138A10()
{
  return MEMORY[0x270F47688]();
}

uint64_t sub_22B138A20()
{
  return MEMORY[0x270F47690]();
}

uint64_t sub_22B138A30()
{
  return MEMORY[0x270F47698]();
}

uint64_t sub_22B138A40()
{
  return MEMORY[0x270F476A0]();
}

uint64_t sub_22B138A50()
{
  return MEMORY[0x270F476A8]();
}

uint64_t sub_22B138A60()
{
  return MEMORY[0x270F476B0]();
}

uint64_t sub_22B138A70()
{
  return MEMORY[0x270F476B8]();
}

uint64_t sub_22B138A80()
{
  return MEMORY[0x270F476C0]();
}

uint64_t sub_22B138A90()
{
  return MEMORY[0x270F476C8]();
}

uint64_t sub_22B138AA0()
{
  return MEMORY[0x270F476D0]();
}

uint64_t sub_22B138AB0()
{
  return MEMORY[0x270F476D8]();
}

uint64_t sub_22B138AC0()
{
  return MEMORY[0x270F476E0]();
}

uint64_t sub_22B138AD0()
{
  return MEMORY[0x270F476E8]();
}

uint64_t sub_22B138AE0()
{
  return MEMORY[0x270F476F0]();
}

uint64_t sub_22B138AF0()
{
  return MEMORY[0x270F476F8]();
}

uint64_t sub_22B138B00()
{
  return MEMORY[0x270F47700]();
}

uint64_t sub_22B138B10()
{
  return MEMORY[0x270F47708]();
}

uint64_t sub_22B138B20()
{
  return MEMORY[0x270F47710]();
}

uint64_t sub_22B138B30()
{
  return MEMORY[0x270F47718]();
}

uint64_t sub_22B138B40()
{
  return MEMORY[0x270F47720]();
}

uint64_t sub_22B138B50()
{
  return MEMORY[0x270F47728]();
}

uint64_t sub_22B138B60()
{
  return MEMORY[0x270F47730]();
}

uint64_t sub_22B138B70()
{
  return MEMORY[0x270F47738]();
}

uint64_t sub_22B138B80()
{
  return MEMORY[0x270F47740]();
}

uint64_t sub_22B138B90()
{
  return MEMORY[0x270F47748]();
}

uint64_t sub_22B138BA0()
{
  return MEMORY[0x270F47750]();
}

uint64_t sub_22B138BB0()
{
  return MEMORY[0x270F47758]();
}

uint64_t sub_22B138BC0()
{
  return MEMORY[0x270F47760]();
}

uint64_t sub_22B138BD0()
{
  return MEMORY[0x270F47768]();
}

uint64_t sub_22B138BE0()
{
  return MEMORY[0x270F47770]();
}

uint64_t sub_22B138BF0()
{
  return MEMORY[0x270F47778]();
}

uint64_t sub_22B138C00()
{
  return MEMORY[0x270F47780]();
}

uint64_t sub_22B138C10()
{
  return MEMORY[0x270F47788]();
}

uint64_t sub_22B138C20()
{
  return MEMORY[0x270F47790]();
}

uint64_t sub_22B138C30()
{
  return MEMORY[0x270F47798]();
}

uint64_t sub_22B138C40()
{
  return MEMORY[0x270F477A0]();
}

uint64_t sub_22B138C50()
{
  return MEMORY[0x270FA08C0]();
}

uint64_t sub_22B138C60()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_22B138C70()
{
  return MEMORY[0x270FA2C58]();
}

uint64_t sub_22B138C80()
{
  return MEMORY[0x270FA2C60]();
}

uint64_t sub_22B138C90()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22B138CA0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22B138CB0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22B138CC0()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_22B138CD0()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_22B138CE0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22B138CF0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22B138D00()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_22B138D10()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_22B138D20()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_22B138D30()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22B138D40()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22B138D50()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22B138D60()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22B138D70()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_22B138D80()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_22B138D90()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22B138DA0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22B138DB0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_22B138DC0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_22B138DD0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22B138DE0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22B138DF0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_22B138E00()
{
  return MEMORY[0x270F477A8]();
}

uint64_t sub_22B138E10()
{
  return MEMORY[0x270F477B0]();
}

uint64_t sub_22B138E20()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22B138E30()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22B138E40()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22B138E50()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22B138E60()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_22B138E80()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22B138E90()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22B138EA0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22B138EB0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22B138EC0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22B138ED0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22B138EE0()
{
  return MEMORY[0x270F9F1D8]();
}

uint64_t sub_22B138EF0()
{
  return MEMORY[0x270F9F1E0]();
}

uint64_t sub_22B138F00()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22B138F10()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22B138F20()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22B138F30()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22B138F40()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22B138F50()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22B138F60()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x270ED9680](*(void *)&a1, *(void *)&a2);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

int grantpt(int a1)
{
  return MEMORY[0x270ED9DE8](*(void *)&a1);
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

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int posix_openpt(int a1)
{
  return MEMORY[0x270EDAC60](*(void *)&a1);
}

char *__cdecl ptsname(int a1)
{
  return (char *)MEMORY[0x270EDB080](*(void *)&a1);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x270EDB8C8](*(void *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x270EDB8D0](*(void *)&a1, *(void *)&a2, a3);
}