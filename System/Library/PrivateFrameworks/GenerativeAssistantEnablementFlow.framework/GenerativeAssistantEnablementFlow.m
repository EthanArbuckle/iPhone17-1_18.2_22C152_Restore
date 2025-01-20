uint64_t sub_24FA7E284()
{
  uint64_t v0;

  v0 = sub_24FA82030();
  __swift_allocate_value_buffer(v0, qword_269A4B7D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269A4B7D8);
  return sub_24FA82020();
}

uint64_t sub_24FA7E2F4(char a1)
{
  return *(void *)&aPrecheckinitia[8 * a1];
}

uint64_t sub_24FA7E314(char *a1, char *a2)
{
  return sub_24FA7E320(*a1, *a2);
}

uint64_t sub_24FA7E320(char a1, char a2)
{
  if (*(void *)&aPrecheckinitia[8 * a1] == *(void *)&aPrecheckinitia[8 * a2]
    && *(void *)&aS[8 * a1] == *(void *)&aS[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_24FA82110();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24FA7E3A8()
{
  return sub_24FA7E3B0();
}

uint64_t sub_24FA7E3B0()
{
  return sub_24FA82130();
}

uint64_t sub_24FA7E41C()
{
  return sub_24FA7E424();
}

uint64_t sub_24FA7E424()
{
  sub_24FA82060();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24FA7E478()
{
  return sub_24FA7E480();
}

uint64_t sub_24FA7E480()
{
  return sub_24FA82130();
}

uint64_t sub_24FA7E4E8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24FA81D8C();
  *a1 = result;
  return result;
}

uint64_t sub_24FA7E518@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24FA7E2F4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t GenerativeAssistantEnablementFlow.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = v0 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_source;
  uint64_t v2 = sub_24FA82000();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  *(unsigned char *)(v0
           + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_isExplicitRequest) = 2;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_flowState) = 0;
  uint64_t v3 = v0 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue) = 1;
  uint64_t v4 = *MEMORY[0x263F6FA10];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B760);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104))(v3, v4, v5);
  return v0;
}

uint64_t GenerativeAssistantEnablementFlow.init()()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_source;
  uint64_t v2 = sub_24FA82000();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  *(unsigned char *)(v0
           + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_isExplicitRequest) = 2;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_flowState) = 0;
  uint64_t v3 = v0 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue) = 1;
  uint64_t v4 = *MEMORY[0x263F6FA10];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B760);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104))(v3, v4, v5);
  return v0;
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

uint64_t GenerativeAssistantEnablementFlow.__allocating_init(source:isExplicitRequest:)(uint64_t a1, int a2)
{
  uint64_t v4 = swift_allocObject();
  GenerativeAssistantEnablementFlow.init(source:isExplicitRequest:)(a1, a2);
  return v4;
}

uint64_t GenerativeAssistantEnablementFlow.init(source:isExplicitRequest:)(uint64_t a1, int a2)
{
  int v16 = a2;
  uint64_t v15 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B768);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v2 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_source;
  uint64_t v6 = sub_24FA82000();
  uint64_t v7 = *(void *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v8(v5, 1, 1, v6);
  uint64_t v9 = OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_isExplicitRequest;
  *(unsigned char *)(v2
           + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_isExplicitRequest) = 2;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_flowState) = 0;
  uint64_t v10 = v2 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue) = 1;
  uint64_t v11 = *MEMORY[0x263F6FA10];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B760);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v4, v15, v6);
  v8((uint64_t)v4, 0, 1, v6);
  swift_beginAccess();
  sub_24FA7E9B0((uint64_t)v4, v5);
  swift_endAccess();
  *(unsigned char *)(v2 + v9) = v16;
  return v2;
}

uint64_t sub_24FA7E9B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24FA7EA18@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue;
  swift_beginAccess();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B760);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_24FA7EAA4(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B760);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *a2 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_24FA7EBC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue;
  swift_beginAccess();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B760);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_24FA7EC4C(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue;
  swift_beginAccess();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B760);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_24FA7ECDC())()
{
  return j__swift_endAccess;
}

uint64_t sub_24FA7ED3C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24FA82030();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269A4B7D0 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_269A4B7D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_retain_n();
  uint64_t v7 = sub_24FA82010();
  os_log_type_t v8 = sub_24FA82080();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = v1;
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v9 = 136315394;
    type metadata accessor for GenerativeAssistantEnablementFlow();
    swift_retain();
    uint64_t v10 = sub_24FA82050();
    uint64_t v16 = sub_24FA80F88(v10, v11, &v17);
    sub_24FA820A0();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v16 = sub_24FA80F88(0x7475706E69286E6FLL, 0xEA0000000000293ALL, &v17);
    sub_24FA820A0();
    _os_log_impl(&dword_24FA7C000, v7, v8, "%s - %s", (uint8_t *)v9, 0x16u);
    uint64_t v12 = v15;
    swift_arrayDestroy();
    MEMORY[0x25336B270](v12, -1, -1);
    MEMORY[0x25336B270](v9, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return 1;
}

uint64_t sub_24FA7EFF0(uint64_t a1)
{
  v2[31] = a1;
  v2[32] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B760);
  v2[33] = v3;
  v2[34] = *(void *)(v3 - 8);
  v2[35] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B768);
  v2[36] = swift_task_alloc();
  uint64_t v4 = sub_24FA82000();
  v2[37] = v4;
  v2[38] = *(void *)(v4 - 8);
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  uint64_t v5 = sub_24FA81F10();
  v2[41] = v5;
  v2[42] = *(void *)(v5 - 8);
  v2[43] = swift_task_alloc();
  uint64_t v6 = sub_24FA81FE0();
  v2[44] = v6;
  v2[45] = *(void *)(v6 - 8);
  v2[46] = swift_task_alloc();
  uint64_t v7 = sub_24FA82030();
  v2[47] = v7;
  v2[48] = *(void *)(v7 - 8);
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  v2[52] = swift_task_alloc();
  v2[53] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FA7F298, 0, 0);
}

uint64_t sub_24FA7F298()
{
  v77 = v0;
  if (qword_269A4B7D0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[53];
  uint64_t v2 = v0[48];
  uint64_t v3 = __swift_project_value_buffer(v0[47], (uint64_t)qword_269A4B7D8);
  v0[54] = v3;
  uint64_t v4 = *(void (**)(void))(v2 + 16);
  v0[55] = v4;
  v0[56] = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v73 = (void (*)(void, uint64_t, void))v4;
  uint64_t v75 = v3;
  v4(v1);
  swift_retain_n();
  uint64_t v5 = sub_24FA82010();
  os_log_type_t v6 = sub_24FA82080();
  unint64_t v7 = 0x269A4B000uLL;
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v8 = v0[32];
    uint64_t v9 = swift_slowAlloc();
    uint64_t v72 = swift_slowAlloc();
    uint64_t v76 = v72;
    *(_DWORD *)uint64_t v9 = 136315650;
    v0[27] = v8;
    type metadata accessor for GenerativeAssistantEnablementFlow();
    swift_retain();
    uint64_t v10 = sub_24FA82050();
    v0[28] = sub_24FA80F88(v10, v11, &v76);
    sub_24FA820A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    v0[29] = sub_24FA80F88(0x2865747563657865, 0xE900000000000029, &v76);
    sub_24FA820A0();
    *(_WORD *)(v9 + 22) = 2080;
    uint64_t v12 = 8
        * *(char *)(v8 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_flowState);
    uint64_t v13 = v0[48];
    uint64_t v69 = v0[47];
    uint64_t v70 = v0[53];
    v0[30] = sub_24FA80F88(*(void *)&aPrecheckinitia[v12], *(void *)&aS[v12], &v76);
    sub_24FA820A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA7C000, v5, v6, "%s - %s executing flow with state %s", (uint8_t *)v9, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25336B270](v72, -1, -1);
    MEMORY[0x25336B270](v9, -1, -1);

    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    unint64_t v7 = 0x269A4B000;
    v14(v70, v69);
  }
  else
  {
    uint64_t v15 = v0[53];
    uint64_t v16 = v0[47];
    uint64_t v17 = v0[48];

    swift_release_n();
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v14(v15, v16);
  }
  v0[57] = v14;
  uint64_t v18 = v0[32];
  if (*(unsigned char *)(v18 + *(void *)(v7 + 2032)))
  {
    if (*(unsigned char *)(v18 + *(void *)(v7 + 2032)) == 1)
    {
      v73(v0[52], v75, v0[47]);
      swift_retain_n();
      v19 = sub_24FA82010();
      os_log_type_t v20 = sub_24FA82080();
      BOOL v21 = os_log_type_enabled(v19, v20);
      uint64_t v22 = v0[52];
      uint64_t v23 = v0[47];
      uint64_t v24 = v0[32];
      if (v21)
      {
        uint64_t v74 = v0[47];
        uint64_t v25 = swift_slowAlloc();
        uint64_t v71 = swift_slowAlloc();
        uint64_t v76 = v71;
        *(_DWORD *)uint64_t v25 = 136315394;
        v0[23] = v24;
        type metadata accessor for GenerativeAssistantEnablementFlow();
        swift_retain();
        uint64_t v26 = sub_24FA82050();
        v0[24] = sub_24FA80F88(v26, v27, &v76);
        sub_24FA820A0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 12) = 2080;
        v0[25] = sub_24FA80F88(0x2865747563657865, 0xE900000000000029, &v76);
        sub_24FA820A0();
        _os_log_impl(&dword_24FA7C000, v19, v20, "%s - %s starting SAUIStartGenAIEnablementFlow", (uint8_t *)v25, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25336B270](v71, -1, -1);
        MEMORY[0x25336B270](v25, -1, -1);

        uint64_t v28 = v22;
        uint64_t v29 = v74;
      }
      else
      {

        swift_release_n();
        uint64_t v28 = v22;
        uint64_t v29 = v23;
      }
      v14(v28, v29);
      uint64_t v37 = v0[42];
      uint64_t v36 = v0[43];
      uint64_t v38 = v0[41];
      uint64_t v39 = v0[32];
      id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F65028]), sel_init);
      v0[58] = v40;
      id v41 = v40;
      sub_24FA81F00();
      sub_24FA81EF0();
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
      v42 = (void *)sub_24FA82040();
      swift_bridgeObjectRelease();
      objc_msgSend(v41, sel_setAceId_, v42);

      int v43 = *(unsigned __int8 *)(v39
                               + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_isExplicitRequest);
      if (v43 != 2) {
        objc_msgSend(v41, sel_setExplicitRequest_, v43 & 1);
      }
      uint64_t v44 = v0[37];
      uint64_t v45 = v0[38];
      uint64_t v46 = v0[36];
      uint64_t v47 = v0[32] + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_source;
      swift_beginAccess();
      sub_24FA8162C(v47, v46);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v46, 1, v44) == 1)
      {
        sub_24FA81694(v0[36]);
      }
      else
      {
        uint64_t v49 = v0[39];
        uint64_t v48 = v0[40];
        uint64_t v50 = v0[37];
        uint64_t v51 = v0[38];
        (*(void (**)(uint64_t, void, uint64_t))(v51 + 32))(v48, v0[36], v50);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16))(v49, v48, v50);
        int v52 = (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 88))(v49, v50);
        if (v52 == *MEMORY[0x263F40838])
        {
          uint64_t v53 = v0[40];
          uint64_t v54 = v0[37];
          uint64_t v55 = v0[38];
          v56 = (void *)sub_24FA82040();
          objc_msgSend(v41, sel_setSource_, v56);

          (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v53, v54);
        }
        else
        {
          v57 = (void (**)(uint64_t, uint64_t))(v0[38] + 8);
          uint64_t v58 = v0[40];
          if (v52 == *MEMORY[0x263F40828])
          {
            uint64_t v59 = v0[37];
            v60 = (void *)sub_24FA82040();
            objc_msgSend(v41, sel_setSource_, v60);

            (*v57)(v58, v59);
          }
          else
          {
            uint64_t v61 = v0[39];
            uint64_t v62 = v0[37];
            v63 = (void *)sub_24FA82040();
            objc_msgSend(v41, sel_setSource_, v63);

            v64 = *v57;
            (*v57)(v58, v62);
            v64(v61, v62);
          }
        }
      }
      sub_24FA81F90();
      uint64_t v65 = v0[5];
      uint64_t v66 = v0[6];
      __swift_project_boxed_opaque_existential_1(v0 + 2, v65);
      v67 = (void *)swift_task_alloc();
      v0[59] = v67;
      unint64_t v68 = sub_24FA81738();
      void *v67 = v0;
      v67[1] = sub_24FA7FD28;
      return MEMORY[0x270F67CE0](v41, v65, v68, v66);
    }
    sub_24FA81FC0();
  }
  else
  {
    uint64_t v31 = v0[45];
    uint64_t v30 = v0[46];
    uint64_t v32 = v0[44];
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B788);
    sub_24FA81F50();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_24FA82490;
    sub_24FA81FD0();
    sub_24FA81F40();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    uint64_t v33 = sub_24FA81F20();
    swift_bridgeObjectRelease();
    v0[26] = v33;
    sub_24FA81F30();
    swift_retain();
    sub_24FA81FB0();
    swift_release();
    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v34 = (uint64_t (*)(void))v0[1];
  return v34();
}

uint64_t sub_24FA7FD28(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 480) = a1;
  *(void *)(v3 + 488) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_24FA803EC;
  }
  else {
    uint64_t v4 = sub_24FA7FE3C;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24FA7FE3C()
{
  id v41 = v0;
  uint64_t v1 = (void *)v0[60];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[55];
  uint64_t v3 = v0[54];
  uint64_t v4 = v0[51];
  uint64_t v5 = v0[47];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  v2(v4, v3, v5);
  swift_retain_n();
  id v6 = v1;
  unint64_t v7 = sub_24FA82010();
  os_log_type_t v8 = sub_24FA82080();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (void *)v0[60];
    uint64_t v37 = v0[51];
    uint64_t v38 = (void (*)(uint64_t, uint64_t))v0[57];
    v35 = (void *)v0[58];
    uint64_t v36 = v0[47];
    uint64_t v10 = v0[32];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v33 = (void *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v40 = v34;
    *(_DWORD *)uint64_t v11 = 136315650;
    v0[19] = v10;
    type metadata accessor for GenerativeAssistantEnablementFlow();
    swift_retain();
    uint64_t v12 = sub_24FA82050();
    v0[20] = sub_24FA80F88(v12, v13, &v40);
    sub_24FA820A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    v0[21] = sub_24FA80F88(0x2865747563657865, 0xE900000000000029, &v40);
    sub_24FA820A0();
    *(_WORD *)(v11 + 22) = 2112;
    v0[22] = v9;
    id v14 = v9;
    sub_24FA820A0();
    *uint64_t v33 = v9;

    _os_log_impl(&dword_24FA7C000, v7, v8, "%s - %s completed SAUIStartGenAIEnablementFlow %@", (uint8_t *)v11, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B780);
    swift_arrayDestroy();
    MEMORY[0x25336B270](v33, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25336B270](v34, -1, -1);
    MEMORY[0x25336B270](v11, -1, -1);

    v38(v37, v36);
  }
  else
  {
    uint64_t v15 = (void *)v0[60];
    uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[57];
    uint64_t v16 = (void *)v0[58];
    uint64_t v18 = v0[51];
    uint64_t v19 = v0[47];

    swift_release_n();
    v17(v18, v19);
  }
  ((void (*)(void, void, void))v0[55])(v0[50], v0[54], v0[47]);
  swift_retain_n();
  os_log_type_t v20 = sub_24FA82010();
  os_log_type_t v21 = sub_24FA82080();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v23 = (void (*)(uint64_t, uint64_t))v0[57];
  uint64_t v24 = v0[50];
  uint64_t v25 = v0[47];
  uint64_t v26 = v0[32];
  if (v22)
  {
    uint64_t v39 = v0[47];
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v40 = v28;
    *(_DWORD *)uint64_t v27 = 136315394;
    v0[13] = v26;
    type metadata accessor for GenerativeAssistantEnablementFlow();
    swift_retain();
    uint64_t v29 = sub_24FA82050();
    v0[14] = sub_24FA80F88(v29, v30, &v40);
    sub_24FA820A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2080;
    v0[15] = sub_24FA80F88(0x2865747563657865, 0xE900000000000029, &v40);
    sub_24FA820A0();
    _os_log_impl(&dword_24FA7C000, v20, v21, "%s - %s returning complete", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336B270](v28, -1, -1);
    MEMORY[0x25336B270](v27, -1, -1);

    v23(v24, v39);
  }
  else
  {

    swift_release_n();
    v23(v24, v25);
  }
  sub_24FA81FC0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v31 = (uint64_t (*)(void))v0[1];
  return v31();
}

uint64_t sub_24FA803EC()
{
  uint64_t v39 = v0;
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 440);
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v3 = *(void *)(v0 + 392);
  uint64_t v4 = *(void *)(v0 + 376);

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  v1(v3, v2, v4);
  swift_retain_n();
  uint64_t v5 = sub_24FA82010();
  os_log_type_t v6 = sub_24FA82080();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v35 = *(void *)(v0 + 392);
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v0 + 456);
    uint64_t v34 = *(void *)(v0 + 376);
    uint64_t v7 = *(void *)(v0 + 256);
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v38 = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v0 + 128) = v7;
    type metadata accessor for GenerativeAssistantEnablementFlow();
    swift_retain();
    uint64_t v10 = sub_24FA82050();
    *(void *)(v0 + 136) = sub_24FA80F88(v10, v11, &v38);
    sub_24FA820A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    *(void *)(v0 + 144) = sub_24FA80F88(0x2865747563657865, 0xE900000000000029, &v38);
    sub_24FA820A0();
    _os_log_impl(&dword_24FA7C000, v5, v6, "%s - %s setting exit value to false", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336B270](v9, -1, -1);
    MEMORY[0x25336B270](v8, -1, -1);

    v36(v35, v34);
  }
  else
  {
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0 + 456);
    uint64_t v13 = *(void *)(v0 + 392);
    uint64_t v14 = *(void *)(v0 + 376);

    swift_release_n();
    v12(v13, v14);
  }
  uint64_t v15 = *(void *)(v0 + 488);
  uint64_t v17 = *(void *)(v0 + 272);
  uint64_t v16 = *(unsigned char **)(v0 + 280);
  uint64_t v19 = *(void *)(v0 + 256);
  uint64_t v18 = *(void *)(v0 + 264);
  *uint64_t v16 = 0;
  (*(void (**)(unsigned char *, void, uint64_t))(v17 + 104))(v16, *MEMORY[0x263F6FA10], v18);
  uint64_t v20 = v19 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue;
  swift_beginAccess();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v17 + 40))(v20, v16, v18);
  swift_endAccess();
  MEMORY[0x25336B190](v15);
  (*(void (**)(void, void, void))(v0 + 440))(*(void *)(v0 + 400), *(void *)(v0 + 432), *(void *)(v0 + 376));
  swift_retain_n();
  os_log_type_t v21 = sub_24FA82010();
  os_log_type_t v22 = sub_24FA82080();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v0 + 456);
  uint64_t v25 = *(void *)(v0 + 400);
  uint64_t v26 = *(void *)(v0 + 376);
  uint64_t v27 = *(void *)(v0 + 256);
  if (v23)
  {
    uint64_t v37 = *(void *)(v0 + 376);
    uint64_t v28 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v38 = v29;
    *(_DWORD *)uint64_t v28 = 136315394;
    *(void *)(v0 + 104) = v27;
    type metadata accessor for GenerativeAssistantEnablementFlow();
    swift_retain();
    uint64_t v30 = sub_24FA82050();
    *(void *)(v0 + 112) = sub_24FA80F88(v30, v31, &v38);
    sub_24FA820A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2080;
    *(void *)(v0 + 120) = sub_24FA80F88(0x2865747563657865, 0xE900000000000029, &v38);
    sub_24FA820A0();
    _os_log_impl(&dword_24FA7C000, v21, v22, "%s - %s returning complete", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336B270](v29, -1, -1);
    MEMORY[0x25336B270](v28, -1, -1);

    v24(v25, v37);
  }
  else
  {

    swift_release_n();
    v24(v25, v26);
  }
  sub_24FA81FC0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = *(uint64_t (**)(void))(v0 + 8);
  return v32();
}

uint64_t sub_24FA80970()
{
  return sub_24FA81F60();
}

uint64_t GenerativeAssistantEnablementFlow.deinit()
{
  sub_24FA81694(v0 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_source);
  uint64_t v1 = v0 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B760);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t GenerativeAssistantEnablementFlow.__deallocating_deinit()
{
  sub_24FA81694(v0 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_source);
  uint64_t v1 = v0 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B760);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24FA80AFC()
{
  return 1;
}

uint64_t sub_24FA80B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24FA80BD4;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t sub_24FA80BD4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_24FA80CD0()
{
  return sub_24FA81F60();
}

uint64_t sub_24FA80D30(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24FA80DCC;
  return sub_24FA7EFF0(a1);
}

uint64_t sub_24FA80DCC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24FA80EC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_exitValue;
  swift_beginAccess();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B760);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24FA80F88(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24FA8105C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24FA81E28((uint64_t)v12, *a3);
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
      sub_24FA81E28((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_24FA8105C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24FA820B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24FA81218(a5, a6);
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
  uint64_t v8 = sub_24FA820D0();
  if (!v8)
  {
    sub_24FA820E0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24FA820F0();
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

uint64_t sub_24FA81218(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24FA812B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24FA81490(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24FA81490(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24FA812B0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24FA81428(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24FA820C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24FA820E0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24FA82070();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24FA820F0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24FA820E0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24FA81428(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269A4B7C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24FA81490(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269A4B7C0);
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
  uint64_t result = sub_24FA820F0();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for GenerativeAssistantEnablementFlow()
{
  uint64_t result = qword_269A4B880;
  if (!qword_269A4B880) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24FA8162C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24FA81694(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4B768);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24FA81738()
{
  unint64_t result = qword_269A4B778;
  if (!qword_269A4B778)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269A4B778);
  }
  return result;
}

unsigned char *sub_24FA81778(unsigned char *result)
{
  if (*result) {
    char v2 = 2;
  }
  else {
    char v2 = 1;
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC33GenerativeAssistantEnablementFlow33GenerativeAssistantEnablementFlow_flowState) = v2;
  return result;
}

unint64_t sub_24FA81798()
{
  unint64_t result = qword_269A4B790[0];
  if (!qword_269A4B790[0])
  {
    type metadata accessor for GenerativeAssistantEnablementFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A4B790);
  }
  return result;
}

uint64_t sub_24FA817F0()
{
  return type metadata accessor for GenerativeAssistantEnablementFlow();
}

void sub_24FA817F8()
{
  sub_24FA81ACC();
  if (v0 <= 0x3F)
  {
    sub_24FA81B24();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for GenerativeAssistantEnablementFlow(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GenerativeAssistantEnablementFlow);
}

uint64_t dispatch thunk of GenerativeAssistantEnablementFlow.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of GenerativeAssistantEnablementFlow.__allocating_init(source:isExplicitRequest:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of GenerativeAssistantEnablementFlow.exitValue.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of GenerativeAssistantEnablementFlow.exitValue.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of GenerativeAssistantEnablementFlow.exitValue.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of GenerativeAssistantEnablementFlow.on(input:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of GenerativeAssistantEnablementFlow.execute()(uint64_t a1)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 232) + **(int **)(*(void *)v1 + 232));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24FA81EEC;
  return v6(a1);
}

uint64_t dispatch thunk of GenerativeAssistantEnablementFlow.execute(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

void sub_24FA81ACC()
{
  if (!qword_269A4B7B0)
  {
    sub_24FA82000();
    unint64_t v0 = sub_24FA82090();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269A4B7B0);
    }
  }
}

void sub_24FA81B24()
{
  if (!qword_269A4B7B8)
  {
    unint64_t v0 = sub_24FA81FA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269A4B7B8);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FlowState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FlowState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24FA81CE8);
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

uint64_t sub_24FA81D10(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24FA81D1C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FlowState()
{
  return &type metadata for FlowState;
}

unint64_t sub_24FA81D38()
{
  unint64_t result = qword_269A4B910[0];
  if (!qword_269A4B910[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A4B910);
  }
  return result;
}

uint64_t sub_24FA81D8C()
{
  unint64_t v0 = sub_24FA82100();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24FA81E28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_24FA81EF0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24FA81F00()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24FA81F10()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24FA81F20()
{
  return MEMORY[0x270F66328]();
}

uint64_t sub_24FA81F30()
{
  return MEMORY[0x270F668B8]();
}

uint64_t sub_24FA81F40()
{
  return MEMORY[0x270F66988]();
}

uint64_t sub_24FA81F50()
{
  return MEMORY[0x270F669B0]();
}

uint64_t sub_24FA81F60()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t sub_24FA81F70()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_24FA81F90()
{
  return MEMORY[0x270F670A0]();
}

uint64_t sub_24FA81FA0()
{
  return MEMORY[0x270F67428]();
}

uint64_t sub_24FA81FB0()
{
  return MEMORY[0x270F676E0]();
}

uint64_t sub_24FA81FC0()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_24FA81FD0()
{
  return MEMORY[0x270F67B00]();
}

uint64_t sub_24FA81FE0()
{
  return MEMORY[0x270F67B18]();
}

uint64_t sub_24FA82000()
{
  return MEMORY[0x270F2ED48]();
}

uint64_t sub_24FA82010()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24FA82020()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24FA82030()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24FA82040()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24FA82050()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24FA82060()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24FA82070()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24FA82080()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24FA82090()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24FA820A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24FA820B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24FA820C0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24FA820D0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24FA820E0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24FA820F0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24FA82100()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24FA82110()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24FA82120()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24FA82130()
{
  return MEMORY[0x270F9FC90]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}