void *sub_23BB17ECC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int EnumTagSinglePayload;
  uint64_t v7;
  size_t v8;

  v5 = *(void *)(a3 + 16);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  v7 = *(void *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (*(_DWORD *)(v7 + 84)) {
      v8 = *(void *)(v7 + 64);
    }
    else {
      v8 = *(void *)(v7 + 64) + 1;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

unint64_t sub_23BB17F90()
{
  unint64_t result = qword_26ADCCE78;
  if (!qword_26ADCCE78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCE80);
    sub_23BB196A4((unint64_t *)&qword_26ADCCF18, qword_26ADCCF20);
    sub_23BB196A4(&qword_26ADCCF08, &qword_26ADCCF10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCE78);
  }
  return result;
}

uint64_t sub_23BB18054()
{
  uint64_t result = sub_23BB455BC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23BB180E4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_23BB18160()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23BB18200()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for AppSwiftUIBridge()
{
  return self;
}

uint64_t sub_23BB182D0(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v5 = sub_23BB44AFC();
  __swift_allocate_value_buffer(v5, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  uint64_t result = *a3;
  if (*a3)
  {
    sub_23BB4549C();
    uint64_t result = *MEMORY[0x263F51868];
    if (*MEMORY[0x263F51868])
    {
      sub_23BB4549C();
      return sub_23BB44AEC();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void View.appEntity<A>(_:state:)()
{
  OUTLINED_FUNCTION_6_0();
  sub_23BB455BC();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v0();
  OUTLINED_FUNCTION_2_7();
  uint64_t v1 = OUTLINED_FUNCTION_1_3();
  v2(v1);
  OUTLINED_FUNCTION_5_0();
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return v0;
}

id OUTLINED_FUNCTION_1_2@<X0>(uint64_t a1@<X8>)
{
  v3 = *(void **)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  *uint64_t v1 = *(void *)a1;
  v1[1] = v4;
  v1[2] = v5;
  v1[3] = v6;
  return v3;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return v0;
}

id OUTLINED_FUNCTION_1_4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v5 = a1[3];
  v7 = (void *)a1[4];
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v5;
  v1[4] = v7;
  return v7;
}

id sub_23BB18554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = (void *)sub_23BB4542C();
  v7 = (void *)sub_23BB4542C();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a5, sel_objectForKey_inDomain_, v6, v7);

  return v8;
}

uint64_t sub_23BB185D4()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_standardUserDefaults);
  uint64_t v2 = sub_23BB4545C();
  id v4 = sub_23BB18554(0xD00000000000002ELL, 0x800000023BB4AAE0, v2, v3, v1);

  if (v4)
  {
    sub_23BB455FC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_23BB19EE0((uint64_t)v11, (uint64_t)v12, &qword_26ADCCEF8);
  if (!v13)
  {
    sub_23BB19FA0((uint64_t)v12, &qword_26ADCCEF8);
    goto LABEL_8;
  }
  if (!swift_dynamicCast())
  {
LABEL_8:
    int v5 = 0;
    goto LABEL_9;
  }
  int v5 = v10;
LABEL_9:
  id v6 = objc_msgSend(v0, sel_standardUserDefaults);
  v7 = (void *)sub_23BB4542C();
  unsigned int v8 = objc_msgSend(v6, sel_BOOLForKey_, v7);

  return v5 | v8;
}

uint64_t sub_23BB18744@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v70 = a3;
  uint64_t v68 = sub_23BB44C7C();
  MEMORY[0x270FA5388]();
  v69 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23BB4538C();
  uint64_t v66 = *(void *)(v6 - 8);
  uint64_t v67 = v6;
  MEMORY[0x270FA5388]();
  v65 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_26ADCCF20);
  uint64_t v59 = *(void *)(v8 - 8);
  uint64_t v60 = v8;
  MEMORY[0x270FA5388]();
  v58 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCE80);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCE90);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCEA0);
  MEMORY[0x270FA5388]();
  v64 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCEB0);
  MEMORY[0x270FA5388]();
  v63 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCEC0);
  MEMORY[0x270FA5388]();
  uint64_t v62 = (uint64_t)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_23BB455BC();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388]();
  v21 = (char *)&v55 - v20;
  unsigned int v22 = objc_msgSend(self, sel_isInternalInstall);
  if (qword_26ADCCE60 != -1) {
    swift_once();
  }
  int v23 = byte_268A7CEC0;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, v18);
  uint64_t v24 = 1;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v21, 1, a2);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  if (EnumTagSinglePayload == 1) {
    unsigned int v26 = 0;
  }
  else {
    unsigned int v26 = v22;
  }
  if (v26 == 1)
  {
    uint64_t v27 = v70;
    uint64_t v28 = v16;
    if (v23)
    {
      sub_23BB44EEC();
      v29 = v58;
      sub_23BB4527C();
      uint64_t v30 = sub_23BB450AC();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v33 = v59;
      uint64_t v32 = v60;
      (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v11, v29, v60);
      v34 = (uint64_t *)&v11[*(int *)(v55 + 36)];
      uint64_t *v34 = KeyPath;
      v34[1] = v30;
      (*(void (**)(char *, uint64_t))(v33 + 8))(v29, v32);
      LOBYTE(v32) = sub_23BB4502C();
      sub_23BB248BC((uint64_t)v11, (uint64_t)v13, &qword_26ADCCE80);
      v35 = &v13[*(int *)(v56 + 36)];
      char *v35 = v32;
      *(_OWORD *)(v35 + 8) = 0u;
      *(_OWORD *)(v35 + 24) = 0u;
      v35[40] = 1;
      sub_23BB19FA0((uint64_t)v11, &qword_26ADCCE80);
      v36 = v65;
      sub_23BB4537C();
      LOBYTE(v32) = sub_23BB4502C();
      uint64_t v37 = (uint64_t)v64;
      v38 = &v64[*(int *)(v57 + 36)];
      uint64_t v40 = v66;
      uint64_t v39 = v67;
      (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v38, v36, v67);
      v38[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCEF0) + 36)] = v32;
      sub_23BB248BC((uint64_t)v13, v37, &qword_26ADCCE90);
      (*(void (**)(char *, uint64_t))(v40 + 8))(v36, v39);
      sub_23BB19FA0((uint64_t)v13, &qword_26ADCCE90);
      v41 = v69;
      v42 = &v69[*(int *)(v68 + 20)];
      uint64_t v43 = *MEMORY[0x263F19860];
      uint64_t v44 = sub_23BB44EFC();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v44 - 8) + 104))(v42, v43, v44);
      __asm { FMOV            V0.2D, #8.0 }
      _OWORD *v41 = _Q0;
      uint64_t v50 = (uint64_t)v63;
      uint64_t v51 = (uint64_t)&v63[*(int *)(v61 + 36)];
      sub_23BB38740((uint64_t)v41, v51);
      *(_WORD *)(v51 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCE70) + 36)) = 256;
      sub_23BB248BC(v37, v50, &qword_26ADCCEA0);
      sub_23BB3880C((uint64_t)v41);
      sub_23BB19FA0(v37, &qword_26ADCCEA0);
      uint64_t v52 = v62;
      sub_23BB248BC(v50, v62, &qword_26ADCCEB0);
      uint64_t v53 = v52 + *(int *)(v28 + 36);
      *(void *)uint64_t v53 = 0;
      *(_WORD *)(v53 + 8) = 257;
      sub_23BB19FA0(v50, &qword_26ADCCEB0);
      sub_23BB19EE0(v52, v27, &qword_26ADCCEC0);
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v27 = v70;
    uint64_t v28 = v16;
  }
  return __swift_storeEnumTagSinglePayload(v27, v24, 1, v28);
}

void sub_23BB18E70()
{
  type metadata accessor for AppSwiftUIBridge();
  uint64_t v0 = swift_allocObject();
  sub_23BB445CC();
  sub_23BB445AC();
  sub_23BB1AE94(&qword_26ADCD0C0, v1, (void (*)(uint64_t))type metadata accessor for AppSwiftUIBridge);
  swift_retain();
  sub_23BB445BC();
  swift_release();
  swift_release();
  if (qword_26ADCD0C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23BB44AFC();
  __swift_project_value_buffer(v2, (uint64_t)qword_26ADCDD10);
  uint64_t v3 = sub_23BB44ADC();
  os_log_type_t v4 = sub_23BB4557C();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_23BB16000, v3, v4, "Instantiated AppSwiftUIBridge", v5, 2u);
    MEMORY[0x23ECCFAB0](v5, -1, -1);
  }

  qword_26ADCDD08 = v0;
}

void sub_23BB18FD0()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = v1;
  uint64_t v17 = v3;
  swift_getWitnessTable();
  sub_23BB44F7C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCEE0);
  OUTLINED_FUNCTION_18_1();
  uint64_t v4 = sub_23BB44C2C();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_63();
  uint64_t v9 = v7 - v8;
  MEMORY[0x270FA5388]();
  v11 = (char *)&v16 - v10;
  long long v18 = *(_OWORD *)(v2 + 16);
  uint64_t v19 = *(void *)(v2 + 32);
  uint64_t v20 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCEC8);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_23BB19E40();
  sub_23BB4539C();
  sub_23BB451EC();
  uint64_t v13 = sub_23BB196A4(&qword_26ADCCED8, &qword_26ADCCEE0);
  uint64_t v21 = WitnessTable;
  uint64_t v22 = v13;
  swift_getWitnessTable();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v14(v11, v9, v4);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v15(v9, v4);
  v14(v17, (uint64_t)v11, v4);
  v15((uint64_t)v11, v4);
  OUTLINED_FUNCTION_5_0();
}

void _s7SwiftUI4ViewP012_AppIntents_aB0E011representedD6EntityyQrqd__Sg0dE00dG0Rd__lF_0()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v46 = v1;
  uint64_t v47 = v0;
  uint64_t v45 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  v49 = v9;
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v10;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_3();
  v38[2] = v11;
  sub_23BB446DC();
  OUTLINED_FUNCTION_0();
  uint64_t v43 = v13;
  uint64_t v44 = v12;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_15();
  uint64_t v14 = sub_23BB4480C();
  uint64_t v15 = (void (*)(uint64_t))MEMORY[0x263EFBDA0];
  uint64_t v54 = v8;
  uint64_t v55 = v14;
  uint64_t v42 = v14;
  uint64_t v48 = v4;
  uint64_t v56 = v4;
  uint64_t v57 = sub_23BB19AD4(&qword_26ADCD0D8, MEMORY[0x263EFBDA0]);
  uint64_t v39 = v57;
  v38[0] = sub_23BB19AD4(&qword_26ADCD0E0, v15);
  uint64_t v58 = v38[0];
  OUTLINED_FUNCTION_9_4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCE58);
  uint64_t v16 = OUTLINED_FUNCTION_8_4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26ADCD038);
  OUTLINED_FUNCTION_18_1();
  v38[1] = v16;
  uint64_t v41 = sub_23BB44C2C();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388]();
  uint64_t v17 = sub_23BB455BC();
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v18;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388]();
  uint64_t v21 = (char *)v38 - v20;
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v22;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_63();
  MEMORY[0x270FA5388]();
  v25 = (char *)v38 - v24;
  OUTLINED_FUNCTION_33();
  v26();
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v6) == 1)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v17);
    OUTLINED_FUNCTION_9_0();
    v27();
    uint64_t v28 = sub_23BB4534C();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v25, v21, v6);
    OUTLINED_FUNCTION_33();
    v29();
    uint64_t v30 = v42;
    v31 = (void *)sub_23BB447FC();
    sub_23BB4453C();
    uint64_t v32 = v48;
    sub_23BB196E8();

    OUTLINED_FUNCTION_9_2();
    v33();
    uint64_t v54 = v8;
    uint64_t v55 = v30;
    uint64_t v56 = v32;
    uint64_t v57 = v39;
    uint64_t v58 = v38[0];
    uint64_t v34 = OUTLINED_FUNCTION_17_3();
    uint64_t v35 = sub_23BB196A4(&qword_26ADCCE50, &qword_26ADCCE58);
    uint64_t v52 = v34;
    uint64_t v53 = v35;
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v37 = sub_23BB196A4(&qword_26ADCD030, qword_26ADCD038);
    uint64_t v50 = WitnessTable;
    uint64_t v51 = v37;
    swift_getWitnessTable();
    uint64_t v28 = sub_23BB4534C();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v6);
  }
  uint64_t *v49 = v28;
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_23BB196A4(unint64_t *a1, uint64_t *a2)
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

void sub_23BB196E8()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v39 = v0;
  uint64_t v3 = v2;
  uint64_t v43 = v4;
  uint64_t v44 = v2;
  uint64_t v5 = v4;
  uint64_t v34 = v6;
  uint64_t v41 = v7;
  sub_23BB446DC();
  OUTLINED_FUNCTION_0();
  uint64_t v37 = v9;
  uint64_t v38 = v8;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_3();
  uint64_t v35 = v10;
  uint64_t v32 = sub_23BB444AC();
  OUTLINED_FUNCTION_0();
  uint64_t v36 = v11;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_15_0();
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(qword_26ADCD038);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_63();
  uint64_t v14 = (void *)(v12 - v13);
  MEMORY[0x270FA5388]();
  uint64_t v40 = (uint64_t)&v31 - v15;
  uint64_t v16 = sub_23BB4480C();
  uint64_t v17 = (void (*)(uint64_t))MEMORY[0x263EFBDA0];
  uint64_t v18 = sub_23BB19AD4(&qword_26ADCD0D8, MEMORY[0x263EFBDA0]);
  uint64_t v19 = sub_23BB19AD4(&qword_26ADCD0E0, v17);
  uint64_t v47 = v5;
  uint64_t v48 = v16;
  uint64_t v49 = v3;
  uint64_t v50 = v18;
  uint64_t v51 = v19;
  OUTLINED_FUNCTION_9_4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCE58);
  uint64_t v20 = sub_23BB44C2C();
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v21;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388]();
  sub_23BB446BC();
  uint64_t v47 = v34;
  uint64_t v34 = v16;
  sub_23BB19B1C();
  uint64_t v22 = v32;
  OUTLINED_FUNCTION_9_0();
  v23();
  sub_23BB4448C();
  *uint64_t v14 = 0;
  uint64_t v24 = v36;
  OUTLINED_FUNCTION_33();
  v25();
  if (qword_26ADCCFA8 != -1) {
    swift_once();
  }
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v1, v22);
  uint64_t v26 = v40;
  sub_23BB19EE0((uint64_t)v14, v40, qword_26ADCD038);
  uint64_t v47 = v43;
  uint64_t v48 = v34;
  uint64_t v49 = v44;
  uint64_t v50 = v18;
  uint64_t v51 = v19;
  uint64_t v27 = OUTLINED_FUNCTION_17_3();
  uint64_t v28 = sub_23BB196A4(&qword_26ADCCE50, &qword_26ADCCE58);
  uint64_t v45 = v27;
  uint64_t v46 = v28;
  uint64_t WitnessTable = swift_getWitnessTable();
  MEMORY[0x23ECCEF80](v26, v20, v42, WitnessTable);
  sub_23BB19FA0(v26, qword_26ADCD038);
  OUTLINED_FUNCTION_9_2();
  v30();
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_23BB19AD4(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_23BB19B1C()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  v16[2] = v10;
  uint64_t v17 = v8;
  uint64_t v18 = v6;
  uint64_t v19 = v4;
  uint64_t v20 = v2;
  uint64_t v21 = v0;
  v16[1] = MEMORY[0x263F1B058];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)v16 - v14;
  sub_23BB451DC();
  uint64_t v17 = v9;
  uint64_t v18 = v7;
  uint64_t v19 = v5;
  uint64_t v20 = v3;
  uint64_t v21 = v1;
  swift_getOpaqueTypeConformance2();
  sub_23BB19C58();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, OpaqueTypeMetadata2);
  OUTLINED_FUNCTION_5_0();
}

void sub_23BB19C58()
{
  OUTLINED_FUNCTION_6_0();
  v15[0] = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_23BB455BC();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v15 - v8;
  uint64_t v10 = type metadata accessor for AppIntentIntelligenceProviderAudit();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)v15 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v4, v5);
  sub_23BB19F3C((uint64_t)v9, (uint64_t)v14);
  MEMORY[0x23ECCEF80](v14, v2, v10, v15[0]);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_23BB19DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = __swift_getEnumTagSinglePayload(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v5(a1, v3);
  }
  return result;
}

uint64_t type metadata accessor for AppIntentIntelligenceProviderAudit()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_23BB19E40()
{
  unint64_t result = qword_26ADCCED0;
  if (!qword_26ADCCED0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCEC8);
    sub_23BB180E4(&qword_26ADCCEB8, &qword_26ADCCEC0, (void (*)(void))sub_23BB1ABA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCED0);
  }
  return result;
}

uint64_t sub_23BB19EE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_23BB19F3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_23BB455BC();
  OUTLINED_FUNCTION_2_0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);

  return v6(a2, a1, v4);
}

uint64_t sub_23BB19FA0(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_2();
  v3();
  return a1;
}

uint64_t sub_23BB19FF0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
}

void *sub_23BB1A02C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 16))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_23BB1A0A4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v5);
  int v7 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  uint64_t v8 = *(void *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v5);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
      return a1;
    }
    int v9 = *(_DWORD *)(v8 + 84);
    size_t v10 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 24))(a1, a2, v5);
      return a1;
    }
    uint64_t v11 = v8 + 8;
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v10 + 1;
  }
  memcpy(a1, a2, v12);
  return a1;
}

uint64_t sub_23BB1A1CC@<X0>(uint64_t a1@<X8>)
{
  return sub_23BB18744(*(void *)(v1 + 40), *(void *)(v1 + 16), a1);
}

void *sub_23BB1A1D8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

uint64_t type metadata accessor for AppViewModifier()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
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

uint64_t OUTLINED_FUNCTION_23_2()
{
  return v0;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[8] = a7;
  v8[9] = v7;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = result;
  v8[3] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return swift_getOpaqueTypeMetadata2();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return *(void *)(v0 + 168);
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_23BB4470C();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_23BB4568C();
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  *(void *)(v1 - 184) = v0;
  return sub_23BB4457C();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return sub_23BB44C2C();
}

void OUTLINED_FUNCTION_2_7()
{
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
  _s7SwiftUI4ViewP012_AppIntents_aB0E011representedD6EntityyQrqd__Sg0dE00dG0Rd__lF_0();
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return sub_23BB4556C();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_23BB44E2C();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v3 - 184);
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v4;
  return a1 + v1;
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_17_2()
{
  return sub_23BB4568C();
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_23BB4470C();
}

uint64_t OUTLINED_FUNCTION_8_2(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return sub_23BB44C2C();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return *(void *)(v0 - 192);
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return sub_23BB4475C();
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return sub_23BB4553C();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
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

void type metadata accessor for CGRect(uint64_t a1)
{
}

void sub_23BB1AB58(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_23BB1ABA0()
{
  unint64_t result = qword_26ADCCEA8;
  if (!qword_26ADCCEA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCEB0);
    sub_23BB1AC40();
    sub_23BB196A4(&qword_26ADCCE68, &qword_26ADCCE70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCEA8);
  }
  return result;
}

unint64_t sub_23BB1AC40()
{
  unint64_t result = qword_26ADCCE98;
  if (!qword_26ADCCE98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCEA0);
    sub_23BB180E4(&qword_26ADCCE88, &qword_26ADCCE90, (void (*)(void))sub_23BB17F90);
    sub_23BB196A4(&qword_26ADCCEE8, &qword_26ADCCEF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCE98);
  }
  return result;
}

uint64_t sub_23BB1AD0C(uint64_t a1)
{
  return sub_23BB182D0(a1, qword_26ADCDD10, MEMORY[0x263F51860]);
}

uint64_t sub_23BB1AD20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_23BB1AD28()
{
  uint64_t result = sub_23BB185D4();
  byte_268A7CEC0 = result & 1;
  return result;
}

uint64_t sub_23BB1AD4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BB1AD98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_23BB1ADA0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F00F48](a1, WitnessTable);
}

uint64_t sub_23BB1ADF4()
{
  return swift_getWitnessTable();
}

uint64_t sub_23BB1AE10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

uint64_t type metadata accessor for AppViewPreferenceKey()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23BB1AE30()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BB1AE74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for AppViewAnchor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23BB1AE94(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t IntentParameter.requestConfirmation<A>(for:dialog:view:)()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10_0(v1, v2, v3, v4, v5, v6);
  *(void *)(v0 + 72) = v7;
  *(void *)(v0 + 80) = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0();
  return MEMORY[0x270FA2498](v8, v9, v10, v11, v12, v13, v14, v15);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_34(v1, v2, v3, v4, v5);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  OUTLINED_FUNCTION_22(v6);
  v0[8] = OUTLINED_FUNCTION_8();
  uint64_t v7 = sub_23BB4478C();
  v0[9] = v7;
  OUTLINED_FUNCTION_6(v7);
  v0[10] = v8;
  v0[11] = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0();
  v0[12] = v9;
  v0[13] = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0();
  return MEMORY[0x270FA2498](v10, v11, v12, v13, v14, v15, v16, v17);
}

uint64_t sub_23BB1AF58()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_33_0();
  v1();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_23BB1AFF8;
  OUTLINED_FUNCTION_18();
  return IntentParameter.requestConfirmation<A>(for:dialog:view:)();
}

uint64_t sub_23BB1AFF8()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12_0();
  void *v3 = v2;
  void *v3 = *v1;
  *(void *)(v2 + 96) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_30();
  uint64_t v4 = OUTLINED_FUNCTION_29();
  v5(v4);
  if (v0)
  {
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_11();
    return MEMORY[0x270FA2498](v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_11();
    return v16(v14, v15, v16, v17, v18, v19, v20, v21);
  }
}

uint64_t sub_23BB1B14C()
{
  OUTLINED_FUNCTION_5();
  swift_task_dealloc();
  OUTLINED_FUNCTION_23();
  return v0(0);
}

uint64_t sub_23BB1B280()
{
  uint64_t v1 = OUTLINED_FUNCTION_14_0();
  v2(v1);
  *(void *)(v0 + 112) = OUTLINED_FUNCTION_24();
  sub_23BB1B590();
  OUTLINED_FUNCTION_28();
  sub_23BB4477C();
  uint64_t v3 = OUTLINED_FUNCTION_16_0();
  v4(v3);
  OUTLINED_FUNCTION_20();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_23BB1B37C;
  uint64_t v6 = OUTLINED_FUNCTION_18();
  return MEMORY[0x270EE1210](v6);
}

uint64_t sub_23BB1B37C()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_12_0();
  *uint64_t v5 = v4;
  *uint64_t v5 = *v2;
  *(void *)(v4 + 128) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_30();
  uint64_t v7 = *(void *)(v6 + 64);
  if (!v0) {
    *(unsigned char *)(v4 + 136) = v1 & 1;
  }
  sub_23BB1B5DC(v7);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_11();
  return MEMORY[0x270FA2498](v8, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t sub_23BB1B488()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_19();
  uint64_t v0 = OUTLINED_FUNCTION_4_1();
  v1(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_11();
  return v4(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23BB1B50C()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_19();
  uint64_t v0 = OUTLINED_FUNCTION_4_1();
  v1(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_11();
  return v4(v2, v3, v4, v5, v6, v7, v8, v9);
}

unint64_t sub_23BB1B590()
{
  unint64_t result = qword_268A7C538;
  if (!qword_268A7C538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C538);
  }
  return result;
}

uint64_t sub_23BB1B5DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t IntentParameter.requestValue<A>(_:view:)()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10_0(v1, v2, v3, v4, v5, v6);
  *(void *)(v0 + 72) = v7;
  *(void *)(v0 + 80) = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0();
  return MEMORY[0x270FA2498](v8, v9, v10, v11, v12, v13, v14, v15);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_34(v1, v2, v3, v4, v5);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  OUTLINED_FUNCTION_22(v6);
  v0[8] = OUTLINED_FUNCTION_8();
  uint64_t v7 = sub_23BB4478C();
  v0[9] = v7;
  OUTLINED_FUNCTION_6(v7);
  v0[10] = v8;
  v0[11] = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0();
  v0[12] = v9;
  v0[13] = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0();
  return MEMORY[0x270FA2498](v10, v11, v12, v13, v14, v15, v16, v17);
}

uint64_t sub_23BB1B6B8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_33_0();
  v1();
  swift_task_alloc();
  OUTLINED_FUNCTION_32();
  *(void *)(v0 + 88) = v2;
  *uint64_t v2 = v3;
  v2[1] = sub_23BB1B758;
  OUTLINED_FUNCTION_31();
  return IntentParameter.requestValue<A>(_:view:)();
}

uint64_t sub_23BB1B758()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_12_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_12_0();
  *uint64_t v6 = v5;
  *(void *)(v3 + 96) = v0;
  swift_task_dealloc();
  uint64_t v7 = OUTLINED_FUNCTION_26();
  v8(v7);
  if (v0)
  {
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_11();
    return MEMORY[0x270FA2498](v9, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_11();
    return v18(v17, v18, v19, v20, v21, v22, v23, v24);
  }
}

uint64_t sub_23BB1B8AC()
{
  OUTLINED_FUNCTION_5();
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return v0();
}

uint64_t sub_23BB1B9DC()
{
  uint64_t v1 = OUTLINED_FUNCTION_14_0();
  v2(v1);
  *(void *)(v0 + 112) = OUTLINED_FUNCTION_24();
  sub_23BB1B590();
  OUTLINED_FUNCTION_28();
  sub_23BB4477C();
  uint64_t v3 = OUTLINED_FUNCTION_16_0();
  v4(v3);
  OUTLINED_FUNCTION_20();
  swift_task_alloc();
  OUTLINED_FUNCTION_32();
  *(void *)(v0 + 120) = v5;
  *uint64_t v5 = v6;
  v5[1] = sub_23BB1BAD8;
  uint64_t v7 = OUTLINED_FUNCTION_31();
  return MEMORY[0x270EE11B8](v7);
}

uint64_t sub_23BB1BAD8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  void *v3 = v2;
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_12_0();
  void *v7 = v6;
  *(void *)(v8 + 128) = v0;
  swift_task_dealloc();
  sub_23BB1B5DC(v5);
  OUTLINED_FUNCTION_7_0();
  return MEMORY[0x270FA2498](v9, v10, v11, v12, v13, v14, v15, v16);
}

uint64_t sub_23BB1BBD4()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_19();
  uint64_t v0 = OUTLINED_FUNCTION_4_1();
  v1(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_11();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23BB1BC58()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_19();
  uint64_t v0 = OUTLINED_FUNCTION_4_1();
  v1(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t IntentParameter.needsValueError<A>(_:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_27();
  v10();
  IntentParameter.needsValueError<A>(_:view:)(a1, v4, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v4, a4);
}

uint64_t IntentParameter.needsValueError<A>(_:view:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v6 = OUTLINED_FUNCTION_22(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_15();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_23BB4478C();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_15();
  uint64_t v16 = v15 - v14;
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v19 - v18, a2, a3);
  sub_23BB4534C();
  sub_23BB1B590();
  swift_retain();
  sub_23BB4477C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v9, v16, v10);
  __swift_storeEnumTagSinglePayload(v9, 0, 1, v10);
  sub_23BB4468C();
  swift_release();
  sub_23BB1B5DC(v9);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v16, v10);
}

uint64_t IntentParameterContext.requestConfirmation<A>(for:dialog:view:)()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(v1, v2, v3, v4, v5, v6, v7);
  *(void *)(v0 + 80) = v8;
  *(void *)(v0 + 88) = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0();
  return MEMORY[0x270FA2498](v9, v10, v11, v12, v13, v14, v15, v16);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_25(v1, v2, v3, v4, v5, v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  OUTLINED_FUNCTION_22(v7);
  v0[9] = OUTLINED_FUNCTION_8();
  uint64_t v8 = sub_23BB4478C();
  v0[10] = v8;
  OUTLINED_FUNCTION_6(v8);
  v0[11] = v9;
  v0[12] = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0();
  v0[13] = v10;
  v0[14] = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0();
  return MEMORY[0x270FA2498](v11, v12, v13, v14, v15, v16, v17, v18);
}

uint64_t sub_23BB1C00C()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_33_0();
  v1();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_23BB1C0AC;
  OUTLINED_FUNCTION_18();
  return IntentParameterContext.requestConfirmation<A>(for:dialog:view:)();
}

uint64_t sub_23BB1C0AC()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12_0();
  void *v3 = v2;
  void *v3 = *v1;
  *(void *)(v2 + 104) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_30();
  uint64_t v4 = OUTLINED_FUNCTION_29();
  v5(v4);
  if (v0)
  {
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_11();
    return MEMORY[0x270FA2498](v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_11();
    return v16(v14, v15, v16, v17, v18, v19, v20, v21);
  }
}

uint64_t sub_23BB1C200()
{
  OUTLINED_FUNCTION_5();
  swift_task_dealloc();
  OUTLINED_FUNCTION_23();
  return v0(0);
}

uint64_t sub_23BB1C334()
{
  uint64_t v1 = OUTLINED_FUNCTION_14_0();
  v2(v1);
  *(void *)(v0 + 120) = OUTLINED_FUNCTION_24();
  sub_23BB1B590();
  OUTLINED_FUNCTION_28();
  sub_23BB4477C();
  uint64_t v3 = OUTLINED_FUNCTION_16_0();
  v4(v3);
  OUTLINED_FUNCTION_20();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_23BB1C434;
  uint64_t v6 = OUTLINED_FUNCTION_18();
  return MEMORY[0x270EE1A38](v6);
}

uint64_t sub_23BB1C434()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_12_0();
  *uint64_t v5 = v4;
  *uint64_t v5 = *v2;
  *(void *)(v4 + 136) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_30();
  uint64_t v7 = *(void *)(v6 + 72);
  if (!v0) {
    *(unsigned char *)(v4 + 144) = v1 & 1;
  }
  sub_23BB1B5DC(v7);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_11();
  return MEMORY[0x270FA2498](v8, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t sub_23BB1C540()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_13_0();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_4_1();
  v1(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_11();
  return v4(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23BB1C5D0()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_13_0();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_4_1();
  v1(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_11();
  return v4(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t IntentParameterContext.requestValue<A>(dialog:view:)()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(v1, v2, v3, v4, v5, v6, v7);
  *(void *)(v0 + 80) = v8;
  *(void *)(v0 + 88) = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0();
  return MEMORY[0x270FA2498](v9, v10, v11, v12, v13, v14, v15, v16);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_25(v1, v2, v3, v4, v5, v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  OUTLINED_FUNCTION_22(v7);
  v0[9] = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0();
  v0[10] = v8;
  v0[11] = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0();
  return MEMORY[0x270FA2498](v9, v10, v11, v12, v13, v14, v15, v16);
}

uint64_t sub_23BB1C6DC()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_33_0();
  v1();
  swift_task_alloc();
  OUTLINED_FUNCTION_32();
  *(void *)(v0 + 96) = v2;
  *uint64_t v2 = v3;
  v2[1] = sub_23BB1C77C;
  OUTLINED_FUNCTION_31();
  return IntentParameterContext.requestValue<A>(dialog:view:)();
}

uint64_t sub_23BB1C77C()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_12_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_12_0();
  *uint64_t v6 = v5;
  *(void *)(v3 + 104) = v0;
  swift_task_dealloc();
  uint64_t v7 = OUTLINED_FUNCTION_26();
  v8(v7);
  if (v0)
  {
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_11();
    return MEMORY[0x270FA2498](v9, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_11();
    return v18(v17, v18, v19, v20, v21, v22, v23, v24);
  }
}

uint64_t sub_23BB1C8D0()
{
  OUTLINED_FUNCTION_5();
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return v0();
}

uint64_t sub_23BB1C9D0()
{
  uint64_t v1 = v0[9];
  (*(void (**)(void, void, void))(v0[10] + 16))(v0[11], v0[4], v0[6]);
  v0[12] = sub_23BB4534C();
  sub_23BB1B590();
  swift_retain();
  sub_23BB4477C();
  uint64_t v2 = sub_23BB4478C();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v2);
  swift_task_alloc();
  OUTLINED_FUNCTION_32();
  v0[13] = v3;
  void *v3 = v4;
  v3[1] = sub_23BB1CB00;
  uint64_t v5 = OUTLINED_FUNCTION_31();
  return MEMORY[0x270EE1A28](v5);
}

uint64_t sub_23BB1CB00()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  void *v3 = v2;
  uint64_t v5 = *(void *)(v4 + 72);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_12_0();
  void *v7 = v6;
  *(void *)(v8 + 112) = v0;
  swift_task_dealloc();
  sub_23BB1B5DC(v5);
  OUTLINED_FUNCTION_7_0();
  return MEMORY[0x270FA2498](v9, v10, v11, v12, v13, v14, v15, v16);
}

uint64_t sub_23BB1CBFC()
{
  OUTLINED_FUNCTION_5();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23BB1CC70()
{
  OUTLINED_FUNCTION_5();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return v0();
}

uint64_t IntentParameterContext.needsValueError<A>(_:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_15();
  uint64_t v13 = v12 - v11;
  v14();
  IntentParameterContext.needsValueError<A>(_:view:)(a1, v13, a4, a5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v13, a5);
}

uint64_t IntentParameterContext.needsValueError<A>(_:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v8 = OUTLINED_FUNCTION_22(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_15();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_23BB4478C();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18 - v17, a2, a4);
  sub_23BB4534C();
  sub_23BB1B590();
  swift_retain();
  sub_23BB4477C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v11, v4, v12);
  __swift_storeEnumTagSinglePayload(v11, 0, 1, v12);
  sub_23BB447BC();
  swift_release();
  sub_23BB1B5DC(v11);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v4, v12);
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for ShortcutsLink(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_23BB1D000(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_23BB1D020(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

uint64_t sub_23BB1D04C()
{
  return sub_23BB1D20C(*v0, MEMORY[0x263F07B58]);
}

uint64_t sub_23BB1D080(uint64_t a1, id *a2)
{
  uint64_t result = sub_23BB4543C();
  *a2 = 0;
  return result;
}

uint64_t sub_23BB1D0FC(uint64_t a1, id *a2)
{
  char v3 = sub_23BB4544C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23BB1D17C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23BB1D1A4();
  *a1 = result;
  return result;
}

uint64_t sub_23BB1D1A4()
{
  sub_23BB4545C();
  uint64_t v0 = sub_23BB4542C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23BB1D1DC()
{
  return sub_23BB1D20C(*v0, MEMORY[0x263F8D308]);
}

uint64_t sub_23BB1D20C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_23BB4545C();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23BB1D24C()
{
  return sub_23BB1D254();
}

uint64_t sub_23BB1D254()
{
  sub_23BB4545C();
  sub_23BB4547C();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23BB1D2A8()
{
  return sub_23BB1D2B0();
}

uint64_t sub_23BB1D2B0()
{
  sub_23BB4545C();
  sub_23BB4577C();
  sub_23BB4547C();
  uint64_t v0 = sub_23BB4579C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23BB1D324()
{
  return sub_23BB1D330();
}

uint64_t sub_23BB1D330()
{
  uint64_t v0 = sub_23BB4545C();
  uint64_t v2 = v1;
  if (v0 == sub_23BB4545C() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_23BB4570C();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23BB1D3B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_23BB4542C();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23BB1D400@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23BB1D42C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23BB1D430(uint64_t a1)
{
  uint64_t v2 = sub_23BB1D530(&qword_268A7C590);
  uint64_t v3 = sub_23BB1D530(&qword_268A7C598);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_23BB1D4C8()
{
  return sub_23BB1D530(&qword_268A7C578);
}

uint64_t sub_23BB1D4FC()
{
  return sub_23BB1D530(&qword_268A7C580);
}

uint64_t sub_23BB1D530(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for OpenExternalURLOptionsKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23BB1D574()
{
  return sub_23BB1D530(&qword_268A7C588);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23BB1D5B4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_23BB1D5D4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_21()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_23BB4534C();
}

uint64_t OUTLINED_FUNCTION_25(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_34(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = result;
  v6[3] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return v0 & 1;
}

uint64_t sub_23BB1D7D8()
{
  return sub_23BB446FC();
}

void sub_23BB1D7E0()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v22 = v0;
  sub_23BB4470C();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_63();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = *(void (**)(uint64_t))(v3 + 16);
  OUTLINED_FUNCTION_59();
  v6(v7);
  if (swift_dynamicCast())
  {
    OUTLINED_FUNCTION_42();
    v9(v8);
    OUTLINED_FUNCTION_58();
    v11(v10);
    uint64_t v12 = 1;
    uint64_t v13 = v22;
  }
  else
  {
    OUTLINED_FUNCTION_59();
    v6(v14);
    sub_23BB4534C();
    sub_23BB1B590();
    OUTLINED_FUNCTION_33();
    v16(v15);
    uint64_t v13 = v22;
    sub_23BB4476C();
    OUTLINED_FUNCTION_42();
    v18(v17);
    OUTLINED_FUNCTION_58();
    v20(v19);
    uint64_t v12 = 0;
  }
  uint64_t v21 = sub_23BB4478C();
  __swift_storeEnumTagSinglePayload(v13, v12, 1, v21);
  OUTLINED_FUNCTION_5_0();
}

uint64_t IntentView.init(options:view:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_23BB4470C();
  OUTLINED_FUNCTION_2_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(a2, a1);
  type metadata accessor for IntentView();
  OUTLINED_FUNCTION_4();
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 32);

  return v6();
}

uint64_t type metadata accessor for IntentView()
{
  return __swift_instantiateGenericMetadata();
}

void IntentView.init(options:view:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = OUTLINED_FUNCTION_48();
  uint64_t v13 = *(void *)(v12 - 8);
  OUTLINED_FUNCTION_33();
  uint64_t v15 = v14();
  v4(v15);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v6, v12);
  uint64_t v16 = type metadata accessor for IntentView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v8 + *(int *)(v16 + 36), v0, v2);
  OUTLINED_FUNCTION_5_0();
}

void sub_23BB1DBE4(uint64_t a1)
{
  uint64_t v3 = v1;
  sub_23BB4470C();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_13();
  uint64_t v6 = *(void *)(a1 + 16);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_27();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v2, v3 + *(int *)(a1 + 36), v6);
  uint64_t v9 = OUTLINED_FUNCTION_72();
  v10(v9);
  sub_23BB1D7E0();
}

void static IntentResult.result<A>(view:)()
{
  OUTLINED_FUNCTION_6_0();
  sub_23BB4479C();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_7_1();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v3 = OUTLINED_FUNCTION_22(v2);
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_17();
  uint64_t v5 = OUTLINED_FUNCTION_22(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_15_0();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v8 = OUTLINED_FUNCTION_22(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_34_0();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_59();
  v10(v9);
  sub_23BB446FC();
  sub_23BB1D7E0();
  uint64_t v11 = sub_23BB445DC();
  OUTLINED_FUNCTION_39(v0, 1, 1, v11);
  sub_23BB23AE8(&qword_268A7C5A8, MEMORY[0x263EFBD20]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5B0);
  sub_23BB196A4(&qword_268A7C5B8, &qword_268A7C5B0);
  OUTLINED_FUNCTION_52();
  sub_23BB4560C();
  sub_23BB4478C();
  sub_23BB1DF74();
  sub_23BB1DFC0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_0();
  sub_23BB4479C();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_7_1();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v3 = OUTLINED_FUNCTION_22(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_10();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v5 = OUTLINED_FUNCTION_22(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_71();
  uint64_t v6 = type metadata accessor for IntentView();
  sub_23BB1DBE4(v6);
  uint64_t v7 = sub_23BB445DC();
  OUTLINED_FUNCTION_39(v0, 1, 1, v7);
  sub_23BB23AE8(&qword_268A7C5A8, MEMORY[0x263EFBD20]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5B0);
  sub_23BB196A4(&qword_268A7C5B8, &qword_268A7C5B0);
  OUTLINED_FUNCTION_45();
  sub_23BB4560C();
  sub_23BB4478C();
  sub_23BB1DF74();
  sub_23BB1DFC0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

unint64_t sub_23BB1DF74()
{
  unint64_t result = qword_268A7C5C0;
  if (!qword_268A7C5C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C5C0);
  }
  return result;
}

unint64_t sub_23BB1DFC0()
{
  unint64_t result = qword_268A7C5C8;
  if (!qword_268A7C5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C5C8);
  }
  return result;
}

uint64_t static IntentResult.result<A>(content:)()
{
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_13();
  v1();
  OUTLINED_FUNCTION_72();
  static IntentResult.result<A>(view:)();
  uint64_t v2 = OUTLINED_FUNCTION_72();
  return v3(v2);
}

void static IntentResult.result<A, B>(value:view:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v4 = OUTLINED_FUNCTION_43(v0, v1, v2, v3);
  uint64_t v5 = OUTLINED_FUNCTION_22(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_10();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v7 = OUTLINED_FUNCTION_22(v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = OUTLINED_FUNCTION_8_0();
  uint64_t v9 = OUTLINED_FUNCTION_22(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_16();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v12 = OUTLINED_FUNCTION_22(v11);
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_22(v13);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = &v21[-v15];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v17();
  OUTLINED_FUNCTION_31_0((uint64_t)v16);
  v21[79] = 1;
  uint64_t v18 = OUTLINED_FUNCTION_51();
  v19(v18);
  sub_23BB446FC();
  OUTLINED_FUNCTION_56();
  uint64_t v20 = sub_23BB445DC();
  OUTLINED_FUNCTION_27_0(v20);
  sub_23BB1DFC0();
  OUTLINED_FUNCTION_21_0();
  sub_23BB1E99C();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

void static IntentResult.result<A, B>(value:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_23BB1FEEC(a1, a2, a3, a4, a5, a6, a7, (uint64_t)static IntentResult.result<A, B>(value:view:), a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

void static IntentResult.result<A, B, C>(value:opensIntent:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v65 = v24;
  uint64_t v66 = v25;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v63 = v32;
  uint64_t v64 = v33;
  uint64_t v67 = v34;
  uint64_t v61 = v35;
  uint64_t v62 = a21;
  uint64_t v36 = sub_23BB4479C();
  uint64_t v37 = OUTLINED_FUNCTION_22(v36);
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_24_0(v38, v59);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v40 = OUTLINED_FUNCTION_22(v39);
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_3();
  uint64_t v42 = v41;
  uint64_t v43 = sub_23BB4470C();
  uint64_t v44 = OUTLINED_FUNCTION_22(v43);
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0();
  uint64_t v46 = v45;
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_13();
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v49 = OUTLINED_FUNCTION_22(v48);
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_22_0();
  uint64_t v60 = v23;
  uint64_t v50 = sub_23BB455BC();
  OUTLINED_FUNCTION_22(v50);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v51);
  uint64_t v52 = OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_22(v52);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v53);
  uint64_t v55 = (char *)&v59 - v54;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v56();
  __swift_storeEnumTagSinglePayload((uint64_t)v55, 0, 1, v31);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v57();
  __swift_storeEnumTagSinglePayload(v21, 0, 1, v29);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v22, v64, v27);
  sub_23BB446FC();
  sub_23BB1D7E0();
  uint64_t v58 = sub_23BB445DC();
  __swift_storeEnumTagSinglePayload(v42, 1, 1, v58);
  sub_23BB4478C();
  OUTLINED_FUNCTION_21_0();
  sub_23BB1E99C();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  void (*v52)(void);
  void (*v53)(void);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  long long v63;
  long long v64;
  uint64_t v65;
  uint64_t v66[5];

  OUTLINED_FUNCTION_6_0();
  uint64_t v59 = v22;
  uint64_t v60 = v23;
  uint64_t v61 = v24;
  uint64_t v62 = v25;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v56 = v30;
  uint64_t v57 = a21;
  uint64_t v58 = v31;
  uint64_t v32 = sub_23BB4479C();
  uint64_t v33 = OUTLINED_FUNCTION_22(v32);
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_47(v34, v56);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v36 = OUTLINED_FUNCTION_22(v35);
  MEMORY[0x270FA5388](v36);
  uint64_t v37 = OUTLINED_FUNCTION_8_0();
  uint64_t v38 = OUTLINED_FUNCTION_22(v37);
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v39;
  MEMORY[0x270FA5388](v41);
  uint64_t v43 = (char *)&v56 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v45 = OUTLINED_FUNCTION_22(v44);
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_15_0();
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5D0);
  uint64_t v47 = OUTLINED_FUNCTION_22(v46);
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_46();
  uint64_t v48 = sub_23BB455BC();
  OUTLINED_FUNCTION_22(v48);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v49);
  uint64_t v51 = (char *)&v56 - v50;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v52();
  OUTLINED_FUNCTION_31_0((uint64_t)v51);
  v66[3] = v27;
  v66[4] = v57;
  __swift_allocate_boxed_opaque_existential_1(v66);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v53();
  uint64_t v54 = sub_23BB446AC();
  __swift_storeEnumTagSinglePayload(v21, 1, 1, v54);
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v43, v59, v29);
  sub_23BB446FC();
  OUTLINED_FUNCTION_71();
  sub_23BB1D7E0();
  uint64_t v55 = sub_23BB445DC();
  OUTLINED_FUNCTION_27_0(v55);
  sub_23BB1DFC0();
  uint64_t v63 = 0u;
  uint64_t v64 = 0u;
  uint64_t v65 = 0;
  sub_23BB1E99C();
  sub_23BB4474C();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_23BB1E99C()
{
  return sub_23BB4560C();
}

#error "23BB1EAF8: call analysis failed (funcsize=46)"

#error "23BB1EBB8: call analysis failed (funcsize=48)"

void static IntentResult.result<A, B, C>(value:opensIntent:dialog:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v76 = v26;
  uint64_t v77 = v27;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  v72[3] = v34;
  uint64_t v73 = v35;
  v72[1] = v36;
  v72[2] = v37;
  uint64_t v75 = a21;
  uint64_t v74 = a22;
  uint64_t v38 = sub_23BB4479C();
  uint64_t v39 = OUTLINED_FUNCTION_22(v38);
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_24_0(v40, v72[0]);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v42 = OUTLINED_FUNCTION_22(v41);
  MEMORY[0x270FA5388](v42);
  uint64_t v43 = OUTLINED_FUNCTION_48();
  uint64_t v44 = OUTLINED_FUNCTION_22(v43);
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0();
  uint64_t v46 = v45;
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_14();
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v49 = OUTLINED_FUNCTION_22(v48);
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_16();
  v72[0] = v25;
  uint64_t v50 = sub_23BB455BC();
  OUTLINED_FUNCTION_22(v50);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v51);
  uint64_t v52 = OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_22(v52);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v53);
  uint64_t v55 = (char *)v72 - v54;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v60(v56, v57, v58, v59);
  __swift_storeEnumTagSinglePayload((uint64_t)v55, 0, 1, v33);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v65(v61, v62, v63, v64);
  __swift_storeEnumTagSinglePayload(v23, 0, 1, v31);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v22, v73, v29);
  sub_23BB446FC();
  sub_23BB1D7E0();
  uint64_t v66 = sub_23BB445DC();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  v71(v67, v68, v69, v70);
  __swift_storeEnumTagSinglePayload(v24, 0, 1, v66);
  sub_23BB4478C();
  OUTLINED_FUNCTION_21_0();
  sub_23BB1E99C();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  void v63[2];
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  long long v72;
  long long v73;
  uint64_t v74;
  uint64_t v75[6];

  OUTLINED_FUNCTION_6_0();
  uint64_t v70 = v25;
  v71 = v26;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v66 = v31;
  uint64_t v67 = v32;
  v63[1] = v33;
  uint64_t v68 = a21;
  uint64_t v64 = a22;
  uint64_t v65 = v34;
  uint64_t v35 = sub_23BB4479C();
  uint64_t v36 = OUTLINED_FUNCTION_22(v35);
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_3();
  uint64_t v69 = v37;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v39 = OUTLINED_FUNCTION_22(v38);
  MEMORY[0x270FA5388](v39);
  uint64_t v40 = OUTLINED_FUNCTION_8_0();
  uint64_t v41 = OUTLINED_FUNCTION_22(v40);
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_0();
  uint64_t v43 = v42;
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_7_1();
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v46 = OUTLINED_FUNCTION_22(v45);
  MEMORY[0x270FA5388](v46);
  OUTLINED_FUNCTION_15_0();
  v63[0] = v24;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5D0);
  uint64_t v48 = OUTLINED_FUNCTION_22(v47);
  MEMORY[0x270FA5388](v48);
  OUTLINED_FUNCTION_16();
  uint64_t v49 = sub_23BB455BC();
  OUTLINED_FUNCTION_22(v49);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v50);
  uint64_t v52 = (char *)v63 - v51;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v55(v53, v54);
  OUTLINED_FUNCTION_31_0((uint64_t)v52);
  v75[3] = v28;
  v75[4] = v64;
  __swift_allocate_boxed_opaque_existential_1(v75);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v58(v56, v57);
  uint64_t v59 = sub_23BB446AC();
  __swift_storeEnumTagSinglePayload(v23, 1, 1, v59);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16))(v22, v67, v30);
  sub_23BB446FC();
  sub_23BB1D7E0();
  sub_23BB445DC();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  v62(v60, v61);
  OUTLINED_FUNCTION_32_0();
  sub_23BB1DFC0();
  v72 = 0u;
  uint64_t v73 = 0u;
  uint64_t v74 = 0;
  sub_23BB1E99C();
  sub_23BB4474C();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

#error "23BB1F30C: call analysis failed (funcsize=47)"

#error "23BB1F3C8: call analysis failed (funcsize=47)"

void static IntentResult.result<A, B>(value:dialog:view:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v5 = OUTLINED_FUNCTION_40(v0, v1, v2, v3, v4);
  uint64_t v6 = OUTLINED_FUNCTION_22(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_10();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v8 = OUTLINED_FUNCTION_22(v7);
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = OUTLINED_FUNCTION_8_0();
  uint64_t v10 = OUTLINED_FUNCTION_22(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_22_0();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v13 = OUTLINED_FUNCTION_22(v12);
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_22(v14);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = &v22[-v16];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v18();
  OUTLINED_FUNCTION_31_0((uint64_t)v17);
  v22[95] = 1;
  uint64_t v19 = OUTLINED_FUNCTION_50();
  v20(v19);
  sub_23BB446FC();
  OUTLINED_FUNCTION_55();
  sub_23BB445DC();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  v21();
  OUTLINED_FUNCTION_32_0();
  sub_23BB1DFC0();
  OUTLINED_FUNCTION_21_0();
  sub_23BB1E99C();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

#error "23BB1F67C: call analysis failed (funcsize=12)"

void _s10AppIntents12IntentResultP01_aB8_SwiftUIE6result5value6dialog017suggestedFollowUpB04viewAA0cD9ContainerVyqd__s5NeverOAA012_SnippetViewN0VAA0C6DialogVGqd___AqA0aC0_pdqd_0_tARRszAA01_C5ValueRd__0eF00Q0Rd_0_r0_lFZ_0()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v35 = v4;
  uint64_t v36 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v34 = v9;
  uint64_t v37 = v10;
  uint64_t v38 = v11;
  uint64_t v12 = sub_23BB4479C();
  uint64_t v13 = OUTLINED_FUNCTION_22(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3();
  uint64_t v33 = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v16 = OUTLINED_FUNCTION_22(v15);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_7_1();
  uint64_t v17 = sub_23BB4470C();
  uint64_t v18 = OUTLINED_FUNCTION_22(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_15_0();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v23 = OUTLINED_FUNCTION_22(v22);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_13();
  uint64_t v32 = v1;
  uint64_t v24 = sub_23BB455BC();
  OUTLINED_FUNCTION_22(v24);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)&v31 - v26;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v28();
  __swift_storeEnumTagSinglePayload((uint64_t)v27, 0, 1, v8);
  char v39 = 1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v2, v34, v6);
  sub_23BB446FC();
  sub_23BB1D7E0();
  uint64_t v29 = sub_23BB445DC();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  v30();
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v29);
  sub_23BB4478C();
  sub_23BB1DFC0();
  OUTLINED_FUNCTION_21_0();
  sub_23BB1E99C();
  swift_bridgeObjectRetain();
  sub_23BB4475C();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

void static IntentResult.result<A, B>(opensIntent:view:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v5 = OUTLINED_FUNCTION_43(v1, v2, v3, v4);
  uint64_t v6 = OUTLINED_FUNCTION_22(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_10();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v8 = OUTLINED_FUNCTION_22(v7);
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = OUTLINED_FUNCTION_8_0();
  uint64_t v10 = OUTLINED_FUNCTION_22(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_16();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v13 = OUTLINED_FUNCTION_22(v12);
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_22(v14);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = &v22[-v16];
  v22[79] = 1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v18();
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v0);
  uint64_t v19 = OUTLINED_FUNCTION_51();
  v20(v19);
  sub_23BB446FC();
  OUTLINED_FUNCTION_56();
  uint64_t v21 = sub_23BB445DC();
  OUTLINED_FUNCTION_27_0(v21);
  sub_23BB1DF74();
  OUTLINED_FUNCTION_21_0();
  sub_23BB1E99C();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  void (*v21)(void);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26[5];
  char v27;

  OUTLINED_FUNCTION_6_0();
  uint64_t v24 = v2;
  uint64_t v25 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  sub_23BB4479C();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7_1();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v10 = OUTLINED_FUNCTION_22(v9);
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = OUTLINED_FUNCTION_17();
  uint64_t v12 = OUTLINED_FUNCTION_22(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_14();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v17 = OUTLINED_FUNCTION_22(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_28_0();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5D0);
  uint64_t v19 = OUTLINED_FUNCTION_22(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_49();
  uint64_t v27 = v20;
  v26[3] = v5;
  v26[4] = v24;
  __swift_allocate_boxed_opaque_existential_1(v26);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v21();
  uint64_t v22 = sub_23BB446AC();
  OUTLINED_FUNCTION_65(v22);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v0, v25, v7);
  sub_23BB446FC();
  OUTLINED_FUNCTION_71();
  sub_23BB1D7E0();
  uint64_t v23 = sub_23BB445DC();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v23);
  sub_23BB23AE8(&qword_268A7C5A8, MEMORY[0x263EFBD20]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5B0);
  sub_23BB196A4(&qword_268A7C5B8, &qword_268A7C5B0);
  sub_23BB4560C();
  sub_23BB4478C();
  sub_23BB1DF74();
  sub_23BB1DFC0();
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

void static IntentResult.result<A, B>(opensIntent:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_23BB1FEEC(a1, a2, a3, a4, a5, a6, a7, (uint64_t)static IntentResult.result<A, B>(opensIntent:view:), a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

void sub_23BB1FEEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_6_0();
  a19 = v24;
  a20 = v25;
  OUTLINED_FUNCTION_66();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  OUTLINED_FUNCTION_0();
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&a9 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34(v31);
  v20(v29, v33, v27, v23, v22, v21);
  OUTLINED_FUNCTION_42();
  v35();
  OUTLINED_FUNCTION_5_0();
}

void static IntentResult.result<A, B>(opensIntent:content:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_16();
  v6();
  static IntentResult.result<A, B>(opensIntent:view:)();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0, v2);
  OUTLINED_FUNCTION_5_0();
}

void static IntentResult.result<A, B>(opensIntent:dialog:view:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v6 = OUTLINED_FUNCTION_40(v1, v2, v3, v4, v5);
  uint64_t v7 = OUTLINED_FUNCTION_22(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_10();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v9 = OUTLINED_FUNCTION_22(v8);
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = OUTLINED_FUNCTION_8_0();
  uint64_t v11 = OUTLINED_FUNCTION_22(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_22_0();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v14 = OUTLINED_FUNCTION_22(v13);
  MEMORY[0x270FA5388](v14);
  uint64_t v15 = OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_22(v15);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = &v23[-v17];
  v23[95] = 1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v19();
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v0);
  uint64_t v20 = OUTLINED_FUNCTION_50();
  v21(v20);
  sub_23BB446FC();
  OUTLINED_FUNCTION_55();
  sub_23BB445DC();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  v22();
  OUTLINED_FUNCTION_32_0();
  sub_23BB1DF74();
  OUTLINED_FUNCTION_21_0();
  sub_23BB1E99C();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  void (*v21)(void);
  uint64_t v22;
  void (*v23)(void);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26[5];
  char v27;

  OUTLINED_FUNCTION_6_0();
  uint64_t v24 = v2;
  uint64_t v25 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  sub_23BB4479C();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7_1();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v10 = OUTLINED_FUNCTION_22(v9);
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = OUTLINED_FUNCTION_17();
  uint64_t v12 = OUTLINED_FUNCTION_22(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_13();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v17 = OUTLINED_FUNCTION_22(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_28_0();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5D0);
  uint64_t v19 = OUTLINED_FUNCTION_22(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_49();
  uint64_t v27 = v20;
  v26[3] = v5;
  v26[4] = v24;
  __swift_allocate_boxed_opaque_existential_1(v26);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v21();
  uint64_t v22 = sub_23BB446AC();
  OUTLINED_FUNCTION_65(v22);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v1, v25, v7);
  sub_23BB446FC();
  sub_23BB1D7E0();
  sub_23BB445DC();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  v23();
  OUTLINED_FUNCTION_31_0(v0);
  sub_23BB23AE8(&qword_268A7C5A8, MEMORY[0x263EFBD20]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5B0);
  sub_23BB196A4(&qword_268A7C5B8, &qword_268A7C5B0);
  sub_23BB4560C();
  sub_23BB4478C();
  sub_23BB1DF74();
  sub_23BB1DFC0();
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

#error "23BB2063C: call analysis failed (funcsize=12)"

void sub_23BB2064C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void (*a21)(uint64_t))
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v23 = v22;
  OUTLINED_FUNCTION_0();
  uint64_t v25 = v24;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_37();
  v27();
  uint64_t v28 = OUTLINED_FUNCTION_38();
  a21(v28);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v21, v23);
  OUTLINED_FUNCTION_5_0();
}

void static IntentResult.result<A, B>(opensIntent:dialog:content:)()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_37();
  v1();
  OUTLINED_FUNCTION_38();
  static IntentResult.result<A, B>(opensIntent:dialog:view:)();
  OUTLINED_FUNCTION_42();
  v2();
  OUTLINED_FUNCTION_5_0();
}

void static IntentResult.result<A>(dialog:view:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  sub_23BB4479C();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7_1();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v8 = OUTLINED_FUNCTION_22(v7);
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = OUTLINED_FUNCTION_17();
  uint64_t v10 = OUTLINED_FUNCTION_22(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_14();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v15 = OUTLINED_FUNCTION_22(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_34_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v0, v5, v3);
  sub_23BB446FC();
  sub_23BB1D7E0();
  uint64_t v16 = sub_23BB445DC();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  v17();
  OUTLINED_FUNCTION_39(v1, 0, 1, v16);
  sub_23BB23AE8(&qword_268A7C5A8, MEMORY[0x263EFBD20]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5B0);
  sub_23BB196A4(&qword_268A7C5B8, &qword_268A7C5B0);
  OUTLINED_FUNCTION_52();
  sub_23BB4560C();
  sub_23BB4478C();
  sub_23BB1DF74();
  sub_23BB1DFC0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);

  OUTLINED_FUNCTION_6_0();
  sub_23BB4479C();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_7_1();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v3 = OUTLINED_FUNCTION_22(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_10();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v5 = OUTLINED_FUNCTION_22(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_29_0();
  uint64_t v6 = type metadata accessor for IntentView();
  sub_23BB1DBE4(v6);
  uint64_t v7 = sub_23BB445DC();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  v8();
  OUTLINED_FUNCTION_39(v0, 0, 1, v7);
  sub_23BB23AE8(&qword_268A7C5A8, MEMORY[0x263EFBD20]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5B0);
  sub_23BB196A4(&qword_268A7C5B8, &qword_268A7C5B0);
  OUTLINED_FUNCTION_45();
  sub_23BB4560C();
  sub_23BB4478C();
  sub_23BB1DF74();
  sub_23BB1DFC0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_0();
}

uint64_t static IntentResult.result<A>(dialog:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_28_0();
  v9();
  static IntentResult.result<A>(dialog:view:)();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v4, a4);
}

uint64_t sub_23BB20F08()
{
  swift_bridgeObjectRelease();
  sub_23BB24914(v0+ OBJC_IVAR____TtC19_AppIntents_SwiftUIP33_97ACBAA1CA7D953A93338B906A5780EF24AppViewArchivingDelegate_defaultImageType, &qword_268A7C5E0);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_23BB20F7C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C6B0);
  uint64_t v1 = sub_23BB44ACC();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23BB47B90;
  sub_23BB44ABC();
  sub_23BB44A8C();
  sub_23BB44AAC();
  sub_23BB44A9C();
  *(void *)(v0 + 16) = sub_23BB2379C(v2);
  uint64_t v3 = v0
     + OBJC_IVAR____TtC19_AppIntents_SwiftUIP33_97ACBAA1CA7D953A93338B906A5780EF24AppViewArchivingDelegate_defaultImageType;
  sub_23BB44A8C();
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v1);
  return v0;
}

uint64_t sub_23BB21094()
{
  return nullsub_1();
}

uint64_t sub_23BB210BC()
{
  return sub_23BB44FFC();
}

uint64_t AnyView.archiveDataWithSnippetEnvironment(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5E0);
  OUTLINED_FUNCTION_22(v4);
  v3[7] = swift_task_alloc();
  sub_23BB4554C();
  v3[8] = sub_23BB4553C();
  uint64_t v11 = sub_23BB4552C();
  v3[9] = v11;
  v3[10] = v5;
  return MEMORY[0x270FA2498](sub_23BB211A0, v11, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23BB211A0()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = (int *)v0[4];
  type metadata accessor for AppViewArchivingDelegate();
  swift_allocObject();
  uint64_t v3 = sub_23BB20F7C();
  v0[11] = v3;
  v0[2] = sub_23BB4534C();
  v0[3] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5E8);
  swift_allocObject();
  swift_retain();
  v0[12] = sub_23BB44ECC();
  sub_23BB44EAC();
  swift_bridgeObjectRetain();
  sub_23BB44E9C();
  sub_23BB248BC(v3+ OBJC_IVAR____TtC19_AppIntents_SwiftUIP33_97ACBAA1CA7D953A93338B906A5780EF24AppViewArchivingDelegate_defaultImageType, v1, &qword_268A7C5E0);
  sub_23BB44E8C();
  uint64_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[13] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_23BB21344;
  return v6();
}

uint64_t sub_23BB21344(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 112) = a1;
  swift_task_dealloc();
  uint64_t v8 = *(void *)(v2 + 80);
  uint64_t v9 = *(void *)(v2 + 72);
  return MEMORY[0x270FA2498](sub_23BB2146C, v9, v8, v3, v4, v5, v6, v7);
}

uint64_t sub_23BB2146C()
{
  uint64_t v1 = v0[14];
  swift_release();
  if (v1)
  {
    self;
    uint64_t v2 = (void *)swift_dynamicCastObjCClass();
    uint64_t v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, sel_size);
      uint64_t v5 = v4;
      uint64_t v7 = v6;
      goto LABEL_7;
    }
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v5 = 0x4074000000000000;
  uint64_t v7 = 0x406E000000000000;
LABEL_7:
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[6];
  sub_23BB44EBC();
  uint64_t v10 = (void *)swift_task_alloc();
  v10[2] = v8;
  v10[3] = v9;
  v10[4] = v3;
  v10[5] = v5;
  v10[6] = v7;
  uint64_t v11 = sub_23BB44E7C();
  uint64_t v13 = v12;
  swift_release();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v14(v11, v13);
}

uint64_t type metadata accessor for AppViewArchivingDelegate()
{
  uint64_t result = qword_268A7C680;
  if (!qword_268A7C680) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23BB21654(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C698);
  sub_23BB22470();
  sub_23BB4534C();
  sub_23BB44EDC();
  sub_23BB44E6C();
  return sub_23BB44EBC();
}

uint64_t sub_23BB216F4(uint64_t a1)
{
  return sub_23BB21654(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_23BB21704(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_23BB217B0;
  return AnyView.archiveDataWithSnippetEnvironment(_:)(a1, a2, v6);
}

uint64_t sub_23BB217B0(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_23BB218C0()
{
  uint64_t result = sub_23BB4470C();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_23BB2198C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = sub_23BB4470C();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  int v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v7 + 64) + v10;
  int v13 = *(_DWORD *)(v7 + 80) | v10;
  uint64_t v14 = v13;
  int v15 = v13 & 0x100000;
  if (v14 > 7
    || v15 != 0
    || (v12 & (unint64_t)~v11) + *(void *)(*(void *)(v8 - 8) + 64) > 0x18)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v14 + 16) & ~v14));
    swift_retain();
  }
  else
  {
    uint64_t v19 = ~v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v12) & v19, ((unint64_t)a2 + v12) & v19, v8);
  }
  return a1;
}

uint64_t sub_23BB21AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23BB4470C();
  uint64_t v5 = *(void *)(v4 - 8) + 8;
  (*(void (**)(uint64_t, uint64_t))v5)(a1, v4);
  uint64_t v6 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t))(v6 + 8);
  unint64_t v8 = (*(void *)(v5 + 56) + a1 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);

  return v7(v8);
}

uint64_t sub_23BB21BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BB4470C();
  uint64_t v7 = *(void *)(v6 - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 16))((*(void *)(v7 + 48) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 48) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_23BB21C58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BB4470C();
  uint64_t v7 = *(void *)(v6 - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 24))((*(void *)(v7 + 40) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 40) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_23BB21D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BB4470C();
  uint64_t v7 = *(void *)(v6 - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 32))((*(void *)(v7 + 32) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 32) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_23BB21DC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BB4470C();
  uint64_t v7 = *(void *)(v6 - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 40))((*(void *)(v7 + 24) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 24) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_23BB21E80(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = sub_23BB4470C();
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  uint64_t v10 = *(unsigned int *)(v8 + 84);
  if (v10 <= v9) {
    unsigned int v11 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  else {
    unsigned int v11 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v12 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = *(void *)(v8 + 64);
  if (!a2) {
    return 0;
  }
  uint64_t v14 = v6;
  uint64_t v15 = *(void *)(*(void *)(v6 - 8) + 64) + v12;
  if (a2 <= v11) {
    goto LABEL_24;
  }
  uint64_t v16 = (v15 & ~v12) + v13;
  char v17 = 8 * v16;
  if (v16 <= 3)
  {
    unsigned int v19 = ((a2 - v11 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v19))
    {
      int v18 = *(_DWORD *)((char *)a1 + v16);
      if (!v18) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v19 > 0xFF)
    {
      int v18 = *(unsigned __int16 *)((char *)a1 + v16);
      if (!*(unsigned __int16 *)((char *)a1 + v16)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v19 < 2)
    {
LABEL_24:
      if (v11)
      {
        if (v9 >= v10)
        {
          uint64_t v23 = (uint64_t)a1;
          uint64_t v7 = v14;
        }
        else
        {
          uint64_t v23 = ((unint64_t)a1 + v15) & ~v12;
          uint64_t v9 = v10;
        }
        return __swift_getEnumTagSinglePayload(v23, v9, v7);
      }
      return 0;
    }
  }
  int v18 = *((unsigned __int8 *)a1 + v16);
  if (!*((unsigned char *)a1 + v16)) {
    goto LABEL_24;
  }
LABEL_14:
  int v20 = (v18 - 1) << v17;
  if (v16 > 3) {
    int v20 = 0;
  }
  if (v16)
  {
    if (v16 <= 3) {
      int v21 = v16;
    }
    else {
      int v21 = 4;
    }
    switch(v21)
    {
      case 2:
        int v22 = *a1;
        break;
      case 3:
        int v22 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v22 = *(_DWORD *)a1;
        break;
      default:
        int v22 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v22 = 0;
  }
  return v11 + (v22 | v20) + 1;
}

void sub_23BB220A8(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = sub_23BB4470C();
  uint64_t v9 = *(unsigned int *)(*(void *)(v8 - 8) + 84);
  uint64_t v10 = *(void *)(a4 + 16);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  if (v12 <= v9) {
    unsigned int v13 = *(_DWORD *)(*(void *)(v8 - 8) + 84);
  }
  else {
    unsigned int v13 = *(_DWORD *)(v11 + 84);
  }
  uint64_t v14 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v15 = *(void *)(*(void *)(v8 - 8) + 64) + v14;
  size_t v16 = (v15 & ~v14) + *(void *)(v11 + 64);
  char v17 = 8 * v16;
  if (a3 <= v13)
  {
    int v18 = 0;
  }
  else if (v16 <= 3)
  {
    unsigned int v21 = ((a3 - v13 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v21))
    {
      int v18 = 4;
    }
    else if (v21 >= 0x100)
    {
      int v18 = 2;
    }
    else
    {
      int v18 = v21 > 1;
    }
  }
  else
  {
    int v18 = 1;
  }
  if (v13 < a2)
  {
    unsigned int v19 = ~v13 + a2;
    if (v16 < 4)
    {
      int v20 = (v19 >> v17) + 1;
      if (v16)
      {
        int v22 = v19 & ~(-1 << v17);
        bzero(a1, v16);
        if (v16 == 3)
        {
          *(_WORD *)a1 = v22;
          a1[2] = BYTE2(v22);
        }
        else if (v16 == 2)
        {
          *(_WORD *)a1 = v22;
        }
        else
        {
          *a1 = v22;
        }
      }
    }
    else
    {
      bzero(a1, v16);
      *(_DWORD *)a1 = v19;
      int v20 = 1;
    }
    switch(v18)
    {
      case 1:
        a1[v16] = v20;
        return;
      case 2:
        *(_WORD *)&a1[v16] = v20;
        return;
      case 3:
        goto LABEL_40;
      case 4:
        *(_DWORD *)&a1[v16] = v20;
        return;
      default:
        return;
    }
  }
  switch(v18)
  {
    case 1:
      a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_40:
      __break(1u);
      JUMPOUT(0x23BB22348);
    case 4:
      *(_DWORD *)&a1[v16] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v9 >= v12)
        {
          uint64_t v23 = (uint64_t)a1;
          uint64_t v24 = a2;
          uint64_t v10 = v8;
        }
        else
        {
          uint64_t v23 = (unint64_t)&a1[v15] & ~v14;
          uint64_t v24 = a2;
          uint64_t v9 = v12;
        }
        __swift_storeEnumTagSinglePayload(v23, v24, v9, v10);
      }
      return;
  }
}

uint64_t sub_23BB22370()
{
  return type metadata accessor for AppViewArchivingDelegate();
}

void sub_23BB22378()
{
  sub_23BB22418();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_23BB22418()
{
  if (!qword_268A7C690)
  {
    sub_23BB44ACC();
    unint64_t v0 = sub_23BB455BC();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268A7C690);
    }
  }
}

unint64_t sub_23BB22470()
{
  unint64_t result = qword_268A7C6A0;
  if (!qword_268A7C6A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C698);
    sub_23BB224EC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C6A0);
  }
  return result;
}

unint64_t sub_23BB224EC()
{
  unint64_t result = qword_268A7C6A8;
  if (!qword_268A7C6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C6A8);
  }
  return result;
}

uint64_t sub_23BB22538@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v190 = a1;
  uint64_t v193 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C6D0);
  OUTLINED_FUNCTION_0();
  uint64_t v191 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_25_0(v10);
  uint64_t v192 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C6D8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v11);
  unsigned int v13 = (char *)&v147 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BB44B5C();
  OUTLINED_FUNCTION_0();
  uint64_t v188 = v15;
  uint64_t v189 = v14;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_24_0(v16, v147);
  sub_23BB44F0C();
  OUTLINED_FUNCTION_0();
  uint64_t v185 = v18;
  uint64_t v186 = v17;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_47(v19, v147);
  sub_23BB44B3C();
  OUTLINED_FUNCTION_0();
  uint64_t v182 = v21;
  uint64_t v183 = v20;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_3();
  uint64_t v181 = v22;
  sub_23BB44C1C();
  OUTLINED_FUNCTION_0();
  uint64_t v177 = v24;
  uint64_t v178 = v23;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_25_0(v25);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C6E0);
  uint64_t v27 = OUTLINED_FUNCTION_22(v26);
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_25_0(v28);
  uint64_t v160 = sub_23BB44C0C();
  OUTLINED_FUNCTION_0();
  uint64_t v159 = v29;
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_27();
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCC20);
  uint64_t v32 = OUTLINED_FUNCTION_22(v31);
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_46();
  uint64_t v33 = sub_23BB44A6C();
  OUTLINED_FUNCTION_0();
  uint64_t v156 = v34;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_63();
  uint64_t v38 = v36 - v37;
  MEMORY[0x270FA5388](v39);
  uint64_t v41 = (char *)&v147 - v40;
  uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C6E8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_22_0();
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C6F0);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_25_0(v44);
  uint64_t v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C6F8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_25_0(v46);
  uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C700);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_25_0(v48);
  uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C708);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_25_0(v50);
  uint64_t v163 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C710);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v51);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_25_0(v52);
  uint64_t v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C718);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v53);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_25_0(v54);
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C720);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v55);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_25_0(v56);
  uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C728);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v57);
  OUTLINED_FUNCTION_3();
  uint64_t v176 = v58;
  uint64_t v172 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C730);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v59);
  OUTLINED_FUNCTION_3();
  uint64_t v179 = v60;
  uint64_t v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C738);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v61);
  OUTLINED_FUNCTION_3();
  uint64_t v180 = v62;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C740);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v64);
  OUTLINED_FUNCTION_63();
  MEMORY[0x270FA5388](v65);
  if (!a2)
  {
    uint64_t v73 = *(void (**)(void))(v191 + 16);
    OUTLINED_FUNCTION_59();
    v73();
    OUTLINED_FUNCTION_59();
    v73();
    swift_storeEnumTagMultiPayload();
    sub_23BB23CB0();
    sub_23BB196A4(&qword_268A7C7A8, &qword_268A7C6D0);
    sub_23BB44F6C();
    OUTLINED_FUNCTION_58();
    return v74();
  }
  uint64_t v147 = v4;
  uint64_t v148 = v67;
  uint64_t v149 = (uint64_t)&v147 - v66;
  uint64_t v150 = v63;
  v151 = v13;
  uint64_t v152 = v7;
  uint64_t KeyPath = swift_getKeyPath();
  id v69 = a2;
  id v70 = objc_msgSend(v69, sel_locale);
  if (!v70)
  {
    __swift_storeEnumTagSinglePayload(v3, 1, 1, v33);
    goto LABEL_7;
  }
  v71 = v70;
  sub_23BB44A4C();

  v72 = *(void (**)(uint64_t, uint64_t, uint64_t))(v156 + 32);
  v72(v3, v38, v33);
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v33);
  if (__swift_getEnumTagSinglePayload(v3, 1, v33) == 1)
  {
LABEL_7:
    sub_23BB44A5C();
    sub_23BB24914(v3, &qword_26ADCCC20);
    goto LABEL_8;
  }
  v72((uint64_t)v41, v3, v33);
LABEL_8:
  OUTLINED_FUNCTION_26_0();
  uint64_t v77 = (uint64_t *)(v5 + v76);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C7B8);
  OUTLINED_FUNCTION_33();
  v78();
  *uint64_t v77 = KeyPath;
  OUTLINED_FUNCTION_9_0();
  v79();
  uint64_t v80 = OUTLINED_FUNCTION_72();
  v81(v80);
  uint64_t v82 = swift_getKeyPath();
  uint64_t v83 = v147;
  sub_23BB2342C(v147);
  OUTLINED_FUNCTION_26_0();
  uint64_t v84 = v153;
  v86 = (uint64_t *)(v153 + v85);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C7C8);
  OUTLINED_FUNCTION_57(v87);
  uint64_t v88 = v159;
  uint64_t v89 = v160;
  OUTLINED_FUNCTION_33();
  v90();
  uint64_t *v86 = v82;
  sub_23BB248BC(v5, v84, &qword_268A7C6E8);
  (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v83, v89);
  OUTLINED_FUNCTION_69();
  uint64_t v91 = swift_getKeyPath();
  uint64_t v92 = v165;
  sub_23BB236C8((SEL *)&selRef_legibilityWeight, MEMORY[0x263F18F70], MEMORY[0x263F18F78], MEMORY[0x263F18F68], v165);
  uint64_t v93 = sub_23BB44C3C();
  __swift_storeEnumTagSinglePayload(v92, 0, 1, v93);
  OUTLINED_FUNCTION_26_0();
  uint64_t v94 = v162;
  v96 = (uint64_t *)(v162 + v95);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C7D8);
  sub_23BB248BC(v92, (uint64_t)v96 + *(int *)(v97 + 28), &qword_268A7C6E0);
  uint64_t *v96 = v91;
  sub_23BB248BC(v84, v94, &qword_268A7C6F0);
  sub_23BB24914(v92, &qword_268A7C6E0);
  sub_23BB24914(v84, &qword_268A7C6F0);
  uint64_t v98 = swift_getKeyPath();
  sub_23BB236C8((SEL *)&selRef_layoutDirection, MEMORY[0x263F18DC8], MEMORY[0x263F18DD8], MEMORY[0x263F18DD0], v174);
  OUTLINED_FUNCTION_26_0();
  uint64_t v99 = v164;
  v101 = (uint64_t *)(v164 + v100);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C7E8);
  OUTLINED_FUNCTION_57(v102);
  OUTLINED_FUNCTION_18_0();
  v103();
  uint64_t *v101 = v98;
  OUTLINED_FUNCTION_60();
  uint64_t v104 = OUTLINED_FUNCTION_20_0();
  v105(v104);
  OUTLINED_FUNCTION_69();
  uint64_t v106 = swift_getKeyPath();
  sub_23BB236C8((SEL *)&selRef_colorScheme, MEMORY[0x263F18508], MEMORY[0x263F18520], MEMORY[0x263F184F8], v181);
  OUTLINED_FUNCTION_26_0();
  uint64_t v107 = v167;
  v109 = (uint64_t *)(v167 + v108);
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C7F8);
  OUTLINED_FUNCTION_57(v110);
  OUTLINED_FUNCTION_18_0();
  v111();
  uint64_t *v109 = v106;
  sub_23BB248BC(v99, v107, &qword_268A7C700);
  uint64_t v112 = OUTLINED_FUNCTION_20_0();
  v113(v112);
  sub_23BB24914(v99, &qword_268A7C700);
  uint64_t v114 = swift_getKeyPath();
  sub_23BB236C8((SEL *)&selRef_colorSchemeContrast, MEMORY[0x263F19968], MEMORY[0x263F19988], MEMORY[0x263F19978], v184);
  OUTLINED_FUNCTION_26_0();
  uint64_t v115 = v169;
  v117 = (uint64_t *)(v169 + v116);
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C808);
  OUTLINED_FUNCTION_57(v118);
  OUTLINED_FUNCTION_18_0();
  v119();
  uint64_t *v117 = v114;
  OUTLINED_FUNCTION_60();
  uint64_t v120 = OUTLINED_FUNCTION_20_0();
  v121(v120);
  OUTLINED_FUNCTION_69();
  uint64_t v122 = swift_getKeyPath();
  objc_msgSend(v69, sel_displayScale);
  uint64_t v124 = v123;
  uint64_t v125 = v171;
  sub_23BB248BC(v115, v171, &qword_268A7C710);
  OUTLINED_FUNCTION_26_0();
  v127 = (uint64_t *)(v125 + v126);
  uint64_t *v127 = v122;
  v127[1] = v124;
  sub_23BB24914(v115, &qword_268A7C710);
  uint64_t v128 = swift_getKeyPath();
  sub_23BB236C8((SEL *)&selRef_displayGamut, MEMORY[0x263F18718], MEMORY[0x263F18728], MEMORY[0x263F18720], v187);
  OUTLINED_FUNCTION_26_0();
  uint64_t v129 = v173;
  v131 = (uint64_t *)(v173 + v130);
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C828);
  OUTLINED_FUNCTION_57(v132);
  OUTLINED_FUNCTION_18_0();
  v133();
  uint64_t *v131 = v128;
  OUTLINED_FUNCTION_60();
  uint64_t v134 = OUTLINED_FUNCTION_20_0();
  v135(v134);
  OUTLINED_FUNCTION_69();
  uint64_t v136 = swift_getKeyPath();
  LOBYTE(v131) = objc_msgSend(v69, sel_accessibilityDifferentiateWithoutColor);
  uint64_t v137 = v176;
  sub_23BB248BC(v129, v176, &qword_268A7C720);
  OUTLINED_FUNCTION_26_0();
  uint64_t v139 = v137 + v138;
  *(void *)uint64_t v139 = v136;
  *(unsigned char *)(v139 + 8) = (_BYTE)v131;
  sub_23BB24914(v129, &qword_268A7C720);
  swift_getKeyPath();
  objc_msgSend(v69, sel_accessibilityInvertColors);
  uint64_t v140 = v179;
  sub_23BB248BC(v137, v179, &qword_268A7C728);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_64(v140 + v141);
  uint64_t v142 = swift_getKeyPath();
  LOBYTE(v131) = objc_msgSend(v69, sel_accessibilityReduceMotion);
  uint64_t v143 = v180;
  sub_23BB248BC(v140, v180, &qword_268A7C730);
  uint64_t v144 = v143 + *(int *)(v175 + 36);
  *(void *)uint64_t v144 = v142;
  *(unsigned char *)(v144 + 8) = (_BYTE)v131;
  sub_23BB24914(v140, &qword_268A7C730);
  swift_getKeyPath();
  objc_msgSend(v69, sel_accessibilityReduceTransparency);
  uint64_t v145 = v148;
  sub_23BB248BC(v143, v148, &qword_268A7C738);
  OUTLINED_FUNCTION_64(v145 + *(int *)(v150 + 36));
  uint64_t v146 = v149;
  sub_23BB24854(v145, v149);
  sub_23BB248BC(v146, (uint64_t)v151, &qword_268A7C740);
  swift_storeEnumTagMultiPayload();
  sub_23BB23CB0();
  sub_23BB196A4(&qword_268A7C7A8, &qword_268A7C6D0);
  sub_23BB44F6C();

  return sub_23BB24914(v146, &qword_268A7C740);
}

uint64_t sub_23BB2342C@<X0>(uint64_t a1@<X8>)
{
  switch((unint64_t)objc_msgSend(v1, sel_dynamicTypeSize))
  {
    case 0uLL:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F18D48];
      break;
    case 1uLL:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F18D20];
      break;
    case 2uLL:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F18D28];
      break;
    case 4uLL:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F18D38];
      break;
    case 5uLL:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F18D60];
      break;
    case 6uLL:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F18D70];
      break;
    case 7uLL:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F18CB8];
      break;
    case 8uLL:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F18CC8];
      break;
    case 9uLL:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F18CD8];
      break;
    case 0xAuLL:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F18CF0];
      break;
    case 0xBuLL:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F18CF8];
      break;
    default:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F18D10];
      break;
  }
  uint64_t v4 = *v3;
  sub_23BB44C0C();
  OUTLINED_FUNCTION_2_0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);

  return v7(a1, v4, v5);
}

uint64_t sub_23BB2358C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C6E0);
  MEMORY[0x270FA5388](v2 - 8);
  sub_23BB248BC(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_268A7C6E0);
  return sub_23BB44D2C();
}

uint64_t sub_23BB23620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

uint64_t sub_23BB236C8@<X0>(SEL *a1@<X0>, unsigned int *a2@<X1>, void (*a3)(void)@<X2>, unsigned int *a4@<X3>, uint64_t a5@<X8>)
{
  id v10 = [v5 *a1];
  if ((unint64_t)v10 + 1 >= 2 && v10 == (id)1) {
    uint64_t v11 = *a4;
  }
  else {
    uint64_t v11 = *a2;
  }
  a3(0);
  OUTLINED_FUNCTION_2_0();
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 104);

  return v14(a5, v11, v12);
}

uint64_t sub_23BB23778()
{
  return sub_23BB44B8C();
}

uint64_t sub_23BB23794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23BB22538(a1, *v2, a2);
}

uint64_t sub_23BB2379C(uint64_t a1)
{
  uint64_t v2 = sub_23BB44ACC();
  uint64_t v31 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v35 = (char *)&v26 - v6;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C6B8);
  uint64_t result = sub_23BB4561C();
  uint64_t v8 = result;
  uint64_t v30 = *(void *)(a1 + 16);
  if (!v30)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v8;
  }
  unint64_t v9 = 0;
  uint64_t v29 = a1 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
  uint64_t v33 = v31 + 16;
  uint64_t v34 = result + 56;
  id v10 = (void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v27 = a1;
  uint64_t v28 = (uint64_t (**)(unint64_t, char *, uint64_t))(v31 + 32);
  while (v9 < *(void *)(a1 + 16))
  {
    uint64_t v11 = *(void *)(v31 + 72);
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 16);
    v12(v35, v29 + v11 * v9, v2);
    sub_23BB23AE8(&qword_268A7C6C0, MEMORY[0x263F8F3A0]);
    uint64_t v13 = sub_23BB453FC();
    uint64_t v14 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v15 = v13 & ~v14;
    unint64_t v16 = v15 >> 6;
    uint64_t v17 = *(void *)(v34 + 8 * (v15 >> 6));
    uint64_t v18 = 1 << v15;
    if (((1 << v15) & v17) != 0)
    {
      unint64_t v32 = v9;
      uint64_t v19 = ~v14;
      while (1)
      {
        v12(v5, *(void *)(v8 + 48) + v15 * v11, v2);
        sub_23BB23AE8(&qword_268A7C6C8, MEMORY[0x263F8F3A0]);
        char v20 = sub_23BB4541C();
        uint64_t v21 = *v10;
        (*v10)(v5, v2);
        if (v20) {
          break;
        }
        unint64_t v15 = (v15 + 1) & v19;
        unint64_t v16 = v15 >> 6;
        uint64_t v17 = *(void *)(v34 + 8 * (v15 >> 6));
        uint64_t v18 = 1 << v15;
        if ((v17 & (1 << v15)) == 0)
        {
          a1 = v27;
          unint64_t v9 = v32;
          goto LABEL_10;
        }
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v21)(v35, v2);
      a1 = v27;
      unint64_t v9 = v32;
    }
    else
    {
LABEL_10:
      uint64_t v22 = v35;
      *(void *)(v34 + 8 * v16) = v18 | v17;
      uint64_t result = (*v28)(*(void *)(v8 + 48) + v15 * v11, v22, v2);
      uint64_t v23 = *(void *)(v8 + 16);
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        goto LABEL_18;
      }
      *(void *)(v8 + 16) = v25;
    }
    if (++v9 == v30) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_23BB23AE8(unint64_t *a1, void (*a2)(uint64_t))
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

void **initializeBufferWithCopyOfBuffer for ApplySnippetEnvironmentModifier(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for ApplySnippetEnvironmentModifier(id *a1)
{
}

void **assignWithCopy for ApplySnippetEnvironmentModifier(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  *a1 = *a2;
  id v5 = v4;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for ApplySnippetEnvironmentModifier(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for ApplySnippetEnvironmentModifier(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ApplySnippetEnvironmentModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ApplySnippetEnvironmentModifier()
{
  return &type metadata for ApplySnippetEnvironmentModifier;
}

uint64_t sub_23BB23C94()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_23BB23CB0()
{
  unint64_t result = qword_268A7C748;
  if (!qword_268A7C748)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C740);
    sub_23BB23D50();
    sub_23BB196A4(&qword_268A7C830, &qword_268A7C838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C748);
  }
  return result;
}

unint64_t sub_23BB23D50()
{
  unint64_t result = qword_268A7C750;
  if (!qword_268A7C750)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C738);
    sub_23BB23DF0();
    sub_23BB196A4(&qword_268A7C830, &qword_268A7C838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C750);
  }
  return result;
}

unint64_t sub_23BB23DF0()
{
  unint64_t result = qword_268A7C758;
  if (!qword_268A7C758)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C730);
    sub_23BB23E90();
    sub_23BB196A4(&qword_268A7C830, &qword_268A7C838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C758);
  }
  return result;
}

unint64_t sub_23BB23E90()
{
  unint64_t result = qword_268A7C760;
  if (!qword_268A7C760)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C728);
    sub_23BB23F30();
    sub_23BB196A4(&qword_268A7C830, &qword_268A7C838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C760);
  }
  return result;
}

unint64_t sub_23BB23F30()
{
  unint64_t result = qword_268A7C768;
  if (!qword_268A7C768)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C720);
    sub_23BB23FD0();
    sub_23BB196A4(&qword_268A7C820, &qword_268A7C828);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C768);
  }
  return result;
}

unint64_t sub_23BB23FD0()
{
  unint64_t result = qword_268A7C770;
  if (!qword_268A7C770)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C718);
    sub_23BB24070();
    sub_23BB196A4(&qword_268A7C810, &qword_268A7C818);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C770);
  }
  return result;
}

unint64_t sub_23BB24070()
{
  unint64_t result = qword_268A7C778;
  if (!qword_268A7C778)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C710);
    sub_23BB24110();
    sub_23BB196A4(&qword_268A7C800, &qword_268A7C808);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C778);
  }
  return result;
}

unint64_t sub_23BB24110()
{
  unint64_t result = qword_268A7C780;
  if (!qword_268A7C780)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C708);
    sub_23BB241B0();
    sub_23BB196A4(&qword_268A7C7F0, &qword_268A7C7F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C780);
  }
  return result;
}

unint64_t sub_23BB241B0()
{
  unint64_t result = qword_268A7C788;
  if (!qword_268A7C788)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C700);
    sub_23BB24250();
    sub_23BB196A4(&qword_268A7C7E0, &qword_268A7C7E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C788);
  }
  return result;
}

unint64_t sub_23BB24250()
{
  unint64_t result = qword_268A7C790;
  if (!qword_268A7C790)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C6F8);
    sub_23BB242F0();
    sub_23BB196A4(&qword_268A7C7D0, &qword_268A7C7D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C790);
  }
  return result;
}

unint64_t sub_23BB242F0()
{
  unint64_t result = qword_268A7C798;
  if (!qword_268A7C798)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C6F0);
    sub_23BB24390();
    sub_23BB196A4(&qword_268A7C7C0, &qword_268A7C7C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C798);
  }
  return result;
}

unint64_t sub_23BB24390()
{
  unint64_t result = qword_268A7C7A0;
  if (!qword_268A7C7A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C6E8);
    sub_23BB196A4(&qword_268A7C7A8, &qword_268A7C6D0);
    sub_23BB196A4(&qword_268A7C7B0, &qword_268A7C7B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C7A0);
  }
  return result;
}

uint64_t sub_23BB24454()
{
  return sub_23BB44DEC();
}

uint64_t sub_23BB24478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BB23620(a1, a2, a3, a4, MEMORY[0x263F07690], MEMORY[0x263F19590]);
}

uint64_t sub_23BB244B8()
{
  return sub_23BB44CDC();
}

uint64_t sub_23BB244DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BB23620(a1, a2, a3, a4, MEMORY[0x263F18D80], MEMORY[0x263F19318]);
}

uint64_t sub_23BB2451C()
{
  return sub_23BB44D1C();
}

uint64_t sub_23BB24544()
{
  return sub_23BB44D0C();
}

uint64_t sub_23BB24568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BB23620(a1, a2, a3, a4, MEMORY[0x263F18DD8], MEMORY[0x263F19340]);
}

uint64_t sub_23BB245A8()
{
  return sub_23BB44C9C();
}

uint64_t sub_23BB245CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BB23620(a1, a2, a3, a4, MEMORY[0x263F18520], MEMORY[0x263F19230]);
}

uint64_t sub_23BB2460C()
{
  return sub_23BB44D3C();
}

uint64_t sub_23BB24630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BB23620(a1, a2, a3, a4, MEMORY[0x263F19988], MEMORY[0x263F19470]);
}

uint64_t sub_23BB24670()
{
  OUTLINED_FUNCTION_61();
  uint64_t result = sub_23BB44CBC();
  *unint64_t v0 = v2;
  return result;
}

uint64_t sub_23BB24698()
{
  return sub_23BB44CCC();
}

uint64_t sub_23BB246C0()
{
  return sub_23BB44CAC();
}

uint64_t sub_23BB246E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BB23620(a1, a2, a3, a4, MEMORY[0x263F18728], MEMORY[0x263F19288]);
}

uint64_t sub_23BB24724()
{
  OUTLINED_FUNCTION_61();
  uint64_t v0 = sub_23BB44DAC();
  return OUTLINED_FUNCTION_68(v0);
}

uint64_t sub_23BB2474C(unsigned __int8 *a1)
{
  return sub_23BB44DBC();
}

uint64_t sub_23BB24770()
{
  OUTLINED_FUNCTION_61();
  uint64_t v0 = sub_23BB44D4C();
  return OUTLINED_FUNCTION_68(v0);
}

uint64_t sub_23BB24798(unsigned __int8 *a1)
{
  return sub_23BB44D5C();
}

uint64_t sub_23BB247BC()
{
  OUTLINED_FUNCTION_61();
  uint64_t v0 = sub_23BB44D6C();
  return OUTLINED_FUNCTION_68(v0);
}

uint64_t sub_23BB247E4(unsigned __int8 *a1)
{
  return sub_23BB44D7C();
}

uint64_t sub_23BB24808()
{
  OUTLINED_FUNCTION_61();
  uint64_t v0 = sub_23BB44D8C();
  return OUTLINED_FUNCTION_68(v0);
}

uint64_t sub_23BB24830(unsigned __int8 *a1)
{
  return sub_23BB44D9C();
}

uint64_t sub_23BB24854(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C740);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BB248BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  v4();
  return a2;
}

uint64_t sub_23BB24914(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_23BB2496C()
{
  unint64_t result = qword_268A7C840;
  if (!qword_268A7C840)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7C848);
    sub_23BB23CB0();
    sub_23BB196A4(&qword_268A7C7A8, &qword_268A7C6D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C840);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return sub_23BB455BC();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return v0;
}

double OUTLINED_FUNCTION_21_0()
{
  double result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  *(void *)(v0 - 96) = 0;
  return result;
}

void OUTLINED_FUNCTION_24_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_25_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_27_0(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return sub_23BB4478C();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  *(unsigned char *)(v0 - 81) = 1;
  *(unsigned char *)(v0 - 82) = 1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_31_0(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
  return sub_23BB4478C();
}

void OUTLINED_FUNCTION_34_0()
{
  *(unsigned char *)(v0 - 81) = 1;
  *(unsigned char *)(v0 - 82) = 1;
}

uint64_t OUTLINED_FUNCTION_38()
{
  return v0;
}

double OUTLINED_FUNCTION_39(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
  *(void *)(v4 - 96) = 0;
  double result = 0.0;
  *(_OWORD *)(v4 - 128) = 0u;
  *(_OWORD *)(v4 - 112) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_40@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  *(void *)(v5 - 168) = a2;
  *(void *)(v5 - 160) = a4;
  *(void *)(v5 - 152) = a1;
  *(void *)(v5 - 144) = a3;
  *(void *)(v5 - 136) = a5;
  return sub_23BB4479C();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return sub_23BB4474C();
}

uint64_t OUTLINED_FUNCTION_43@<X0>(uint64_t a1@<X1>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X8>)
{
  *(void *)(v4 - 152) = a3;
  *(void *)(v4 - 144) = a2;
  *(void *)(v4 - 160) = a1;
  *(void *)(v4 - 136) = a4;
  return sub_23BB4479C();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return v0 - 136;
}

uint64_t OUTLINED_FUNCTION_46()
{
  return 0;
}

void OUTLINED_FUNCTION_47(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 184) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_48()
{
  return sub_23BB4470C();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_51()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_52()
{
  return v0 - 136;
}

uint64_t OUTLINED_FUNCTION_53()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_54()
{
  return v0;
}

void OUTLINED_FUNCTION_55()
{
  sub_23BB1D7E0();
}

void OUTLINED_FUNCTION_56()
{
  sub_23BB1D7E0();
}

uint64_t OUTLINED_FUNCTION_57(uint64_t a1)
{
  return v1 + *(int *)(a1 + 28);
}

uint64_t OUTLINED_FUNCTION_60()
{
  return sub_23BB248BC(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_62()
{
  return sub_23BB455BC();
}

uint64_t OUTLINED_FUNCTION_64@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = v2;
  return sub_23BB24914(v4, v3);
}

uint64_t OUTLINED_FUNCTION_65(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_67(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t OUTLINED_FUNCTION_68(uint64_t result)
{
  *uint64_t v1 = result & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_69()
{
  return sub_23BB24914(v1, v0);
}

uint64_t OUTLINED_FUNCTION_72()
{
  return v0;
}

id sub_23BB24F8C()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F02AE8]), sel_init);
  qword_26ADCCA48 = (uint64_t)result;
  return result;
}

id static CSSearchableItemAttributeSetKey.defaultValue.getter()
{
  if (qword_26ADCCA50 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26ADCCA48;

  return v0;
}

id sub_23BB2501C@<X0>(void *a1@<X8>)
{
  id result = static CSSearchableItemAttributeSetKey.defaultValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_23BB25044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_23BB27100(&qword_268A7C860, (void (*)(uint64_t))sub_23BB26ED4);

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

BOOL static DisplayLocation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DisplayLocation.hash(into:)()
{
  return sub_23BB4578C();
}

uint64_t DisplayLocation.hashValue.getter()
{
  return sub_23BB4579C();
}

uint64_t sub_23BB2516C()
{
  return sub_23BB4579C();
}

uint64_t static SearchString.defaultValue.getter()
{
  return 0;
}

void sub_23BB251BC(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
}

uint64_t sub_23BB251C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, MEMORY[0x263F8D338]);
}

void static DisplayLocationKey.defaultValue.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23BB251E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_23BB25814();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t EnvironmentValues.attributeSet.getter()
{
  sub_23BB25284();
  sub_23BB44E1C();
  return v1;
}

unint64_t sub_23BB25284()
{
  unint64_t result = qword_26ADCCA58;
  if (!qword_26ADCCA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCA58);
  }
  return result;
}

uint64_t EnvironmentValues.attributeSet.setter()
{
  return sub_23BB44E2C();
}

void (*EnvironmentValues.attributeSet.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  *(void *)(a1 + 24) = sub_23BB25284();
  sub_23BB44E1C();
  return sub_23BB2536C;
}

void sub_23BB2536C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)(a1 + 8) = *(void *)a1;
  if (a2)
  {
    id v4 = v2;
    OUTLINED_FUNCTION_3_1();
    uint64_t v5 = *(void **)a1;
  }
  else
  {
    OUTLINED_FUNCTION_3_1();
  }
}

uint64_t EnvironmentValues.displayLocation.getter()
{
  sub_23BB25430();

  return sub_23BB44E1C();
}

unint64_t sub_23BB25430()
{
  unint64_t result = qword_26ADCCA40;
  if (!qword_26ADCCA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCA40);
  }
  return result;
}

uint64_t EnvironmentValues.displayLocation.setter()
{
  return sub_23BB44E2C();
}

uint64_t (*EnvironmentValues.displayLocation.modify(void *a1))(uint64_t a1)
{
  *a1 = v1;
  a1[1] = sub_23BB25430();
  sub_23BB44E1C();
  return sub_23BB25528;
}

uint64_t sub_23BB25528(uint64_t a1)
{
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 16);
  return sub_23BB44E2C();
}

uint64_t EnvironmentValues.searchString.getter()
{
  sub_23BB2559C();
  sub_23BB44E1C();
  return v1;
}

unint64_t sub_23BB2559C()
{
  unint64_t result = qword_26ADCCA30;
  if (!qword_26ADCCA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCA30);
  }
  return result;
}

uint64_t EnvironmentValues.searchString.setter()
{
  return sub_23BB44E2C();
}

void (*EnvironmentValues.searchString.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_23BB2559C();
  sub_23BB44E1C();
  uint64_t v4 = v3[3];
  void *v3 = v3[2];
  v3[1] = v4;
  return sub_23BB256A8;
}

void sub_23BB256A8(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  v2[2] = v4;
  v2[3] = v3;
  if (a2)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_3_1();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_3_1();
  }

  free(v2);
}

uint64_t static ViewCodableError.== infix(_:_:)()
{
  return 1;
}

uint64_t ViewCodableError.hash(into:)()
{
  return sub_23BB4578C();
}

uint64_t ViewCodableError.hashValue.getter()
{
  return sub_23BB4579C();
}

uint64_t sub_23BB25798()
{
  return 1;
}

uint64_t sub_23BB257A0()
{
  return ViewCodableError.hashValue.getter();
}

uint64_t sub_23BB257B8()
{
  return ViewCodableError.hash(into:)();
}

uint64_t sub_23BB257D0()
{
  return sub_23BB4579C();
}

unint64_t sub_23BB25814()
{
  unint64_t result = qword_268A7C850;
  if (!qword_268A7C850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C850);
  }
  return result;
}

unint64_t sub_23BB25864()
{
  unint64_t result = qword_268A7C858;
  if (!qword_268A7C858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C858);
  }
  return result;
}

void type metadata accessor for CSSearchableItemAttributeSetKey()
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DisplayLocation(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DisplayLocation(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23BB25A44);
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

uint64_t sub_23BB25A6C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23BB25A74(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

void type metadata accessor for DisplayLocation()
{
}

void type metadata accessor for SearchString()
{
}

void type metadata accessor for DisplayLocationKey()
{
}

uint64_t getEnumTagSinglePayload for ViewCodableError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ViewCodableError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x23BB25B90);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23BB25BB8()
{
  return 0;
}

void type metadata accessor for ViewCodableError()
{
}

void *sub_23BB25BCC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = a2[6];
    v4[5] = a2[5];
    v4[6] = v8;
    uint64_t v9 = *(int *)(a3 + 20);
    id v10 = (char *)v4 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = sub_23BB446EC();
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
  }
  return v4;
}

uint64_t sub_23BB25CF8(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_23BB446EC();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_23BB25DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_23BB446EC();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  return a1;
}

uint64_t *sub_23BB25E98(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_23BB446EC();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    int v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          uint64_t *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t sub_23BB26168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_23BB446EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_23BB261F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23BB446EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_23BB26294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23BB262A8);
}

uint64_t sub_23BB262A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_23BB446EC();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_23BB26330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23BB26344);
}

uint64_t sub_23BB26344(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_23BB446EC();
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for SharedIndexedViewFormatDecodable()
{
  uint64_t result = qword_26ADCCA68;
  if (!qword_26ADCCA68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23BB2640C()
{
  uint64_t result = sub_23BB446EC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23BB264A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_getDynamicType();
  uint64_t result = sub_23BB4566C();
  if (v7)
  {
    v10[3] = a2;
    long long v11 = *(_OWORD *)(a3 + 8);
    __swift_allocate_boxed_opaque_existential_2Tm(v10);
    OUTLINED_FUNCTION_1_0();
    uint64_t v9 = v8;
    (*(void (**)(void))(v8 + 16))();
    sub_23BB4462C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, a2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23BB2656C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v5 = sub_23BB4466C();
  OUTLINED_FUNCTION_0_0();
  uint64_t v34 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCAA8);
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_14();
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v16 = a1[3];
  uint64_t v44 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_23BB27100(&qword_26ADCCA18, MEMORY[0x263EFB910]);
  sub_23BB457AC();
  if (!v3)
  {
    uint64_t v32 = v14;
    uint64_t v17 = v34;
    uint64_t v18 = *(void (**)(char *, void, uint64_t))(v34 + 104);
    v18(v12, *MEMORY[0x263EFB908], v5);
    sub_23BB456BC();
    uint64_t v19 = v12;
    char v20 = *(void (**)(void))(v17 + 8);
    ((void (*)(char *, uint64_t))v20)(v19, v5);
    v18(v10, *MEMORY[0x263EFB900], v5);
    uint64_t v21 = v35;
    sub_23BB456CC();
    uint64_t v23 = v22;
    OUTLINED_FUNCTION_6_1();
    v20();
    if (v23)
    {
      uint64_t v24 = sub_23BB4564C();
      swift_bridgeObjectRelease();
      if (v24)
      {
        uint64_t v25 = dynamic_cast_existential_1_conditional(v24);
        if (v25)
        {
          uint64_t v27 = v25;
          uint64_t v28 = v26;
          __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v39, v40);
          uint64_t v37 = v27;
          uint64_t v38 = v28;
          __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&v36);
          sub_23BB456FC();
          uint64_t v29 = OUTLINED_FUNCTION_7_2();
          v30(v29);
          sub_23BB272C0(&v36, (uint64_t)v41);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
          sub_23BB272D8((uint64_t)v41, v33);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
          return sub_23BB26DE4((uint64_t)v41);
        }
      }
    }
    sub_23BB27148();
    swift_allocError();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v2, v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23BB26924@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23BB2656C(a1, a2);
}

uint64_t sub_23BB2693C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v36 = sub_23BB446EC();
  OUTLINED_FUNCTION_0_0();
  uint64_t v34 = v4;
  MEMORY[0x270FA5388](v5);
  uint64_t v37 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23BB448CC();
  OUTLINED_FUNCTION_0_0();
  uint64_t v47 = v8;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v38 = (char *)&v32 - v13;
  __swift_instantiateConcreteTypeFromMangledName(qword_26ADCCAB0);
  OUTLINED_FUNCTION_0_0();
  uint64_t v40 = v15;
  uint64_t v41 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for SharedIndexedViewFormatDecodable();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_14();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BB27100(&qword_26ADCCA28, MEMORY[0x263EFBF70]);
  uint64_t v39 = v17;
  uint64_t v19 = (uint64_t)v42;
  sub_23BB457AC();
  if (v19) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v32 = v18;
  uint64_t v33 = v2;
  uint64_t v42 = a1;
  uint64_t v21 = v37;
  char v20 = v38;
  uint64_t v22 = *(void (**)(char *, void, uint64_t))(v47 + 104);
  v22(v38, *MEMORY[0x263EFBF60], v7);
  sub_23BB26D98();
  sub_23BB456DC();
  uint64_t v23 = v20;
  uint64_t v24 = *(void (**)(char *, uint64_t))(v47 + 8);
  v47 += 8;
  v24(v23, v7);
  long long v25 = v44;
  uint64_t v26 = (uint64_t)v33;
  *uint64_t v33 = v43;
  *(_OWORD *)(v26 + 16) = v25;
  *(_OWORD *)(v26 + 32) = v45;
  *(void *)(v26 + 48) = v46;
  v22(v12, *MEMORY[0x263EFBF68], v7);
  sub_23BB27100(&qword_26ADCCA20, MEMORY[0x263EFBA08]);
  uint64_t v27 = v21;
  uint64_t v28 = v36;
  sub_23BB456DC();
  v24(v12, v7);
  uint64_t v29 = OUTLINED_FUNCTION_2_1();
  v30(v29);
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v26 + *(int *)(v32 + 20), v27, v28);
  sub_23BB26E14(v26, v35);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  return sub_23BB26E78(v26);
}

uint64_t sub_23BB26D3C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23BB2693C(a1, a2);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23BB26D98()
{
  unint64_t result = qword_26ADCCA38;
  if (!qword_26ADCCA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCA38);
  }
  return result;
}

uint64_t sub_23BB26DE4(uint64_t a1)
{
  return a1;
}

uint64_t sub_23BB26E14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SharedIndexedViewFormatDecodable();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BB26E78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SharedIndexedViewFormatDecodable();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23BB26ED4()
{
  unint64_t result = qword_268A7C868;
  if (!qword_268A7C868)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268A7C868);
  }
  return result;
}

uint64_t sub_23BB26F14(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_23BB26F4C(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *sub_23BB26FB4(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_23BB2701C(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23BB27068(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
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

uint64_t sub_23BB270A8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ViewDecodable()
{
}

uint64_t sub_23BB27100(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_23BB27148()
{
  unint64_t result = qword_268A7C870;
  if (!qword_268A7C870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7C870);
  }
  return result;
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

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_2Tm(uint64_t *a1)
{
  OUTLINED_FUNCTION_1_0();
  if ((*(unsigned char *)(v2 + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v3;
  }
  return a1;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x23ECCFAB0);
  }
  return result;
}

uint64_t sub_23BB272C0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_23BB272D8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return v0;
}

uint64_t Toggle.init<A>(isOn:intent:label:)@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  v24[3] = a1;
  uint64_t v25 = a9;
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14;
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](v18);
  sub_23BB4457C();
  sub_23BB27530();
  if (swift_dynamicCast())
  {
    uint64_t v19 = v28;
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), a2, a6);
    unint64_t v20 = (*(unsigned __int8 *)(v15 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    uint64_t v21 = (char *)swift_allocObject();
    *((void *)v21 + 2) = a5;
    *((void *)v21 + 3) = a6;
    *((void *)v21 + 4) = a7;
    *((void *)v21 + 5) = a8;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v21[v20], (char *)v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), a6);
    id v22 = v19;
    sub_23BB4533C();

    return (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(a2, a6);
  }
  else
  {
    uint64_t result = sub_23BB4568C();
    __break(1u);
  }
  return result;
}

unint64_t sub_23BB27530()
{
  unint64_t result = qword_26ADCD0E8[0];
  if (!qword_26ADCD0E8[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_26ADCD0E8);
  }
  return result;
}

uint64_t sub_23BB27570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C878);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_23BB4556C();
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, a3);
  sub_23BB4554C();
  uint64_t v17 = sub_23BB4553C();
  unint64_t v18 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v19 = (char *)swift_allocObject();
  uint64_t v20 = MEMORY[0x263F8F500];
  *((void *)v19 + 2) = v17;
  *((void *)v19 + 3) = v20;
  *((void *)v19 + 4) = a2;
  *((void *)v19 + 5) = a3;
  *((void *)v19 + 6) = a4;
  *((void *)v19 + 7) = a5;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v19[v18], v12, a3);
  sub_23BB32594((uint64_t)v15, (uint64_t)&unk_268A7C888, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_23BB27740()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_23BB277C8()
{
  return sub_23BB27570((uint64_t)v0+ ((*(unsigned __int8 *)(*(void *)(v0[3] - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0[3] - 8) + 80)), v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_23BB2780C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[3] = a6;
  v8[4] = a8;
  v8[2] = a4;
  sub_23BB4554C();
  v8[5] = sub_23BB4553C();
  uint64_t v10 = sub_23BB4552C();
  return MEMORY[0x270FA2498](sub_23BB278A8, v10, v9, v9, v11, v12, v13, v14);
}

uint64_t sub_23BB278A8()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[3];
  swift_release();
  sub_23BB32410(v2, v1);
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t Toggle<>.init<A>(_:isOn:intent:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v26 = a8;
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v25 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, v22, v23);
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  char v30 = a3;
  uint64_t v31 = a4;
  Toggle.init<A>(isOn:intent:label:)(a5, (uint64_t)v21, (uint64_t)sub_23BB27AFC, (uint64_t)v27, MEMORY[0x263F1A830], a7, MEMORY[0x263F1A820], v26, a9);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a6, a7);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23BB27A64@<X0>(uint64_t a1@<X8>)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = sub_23BB450FC();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23BB27AFC@<X0>(uint64_t a1@<X8>)
{
  return sub_23BB27A64(a1);
}

uint64_t Toggle<>.init<A, B>(_:isOn:intent:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = &v24[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v17 + 16))(v20, v21, v22);
  uint64_t v25 = a4;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a7;
  uint64_t v29 = a1;
  Toggle.init<A>(isOn:intent:label:)(a2, (uint64_t)v20, (uint64_t)sub_23BB27D48, (uint64_t)v24, MEMORY[0x263F1A830], a5, MEMORY[0x263F1A820], a7, a8);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a3, a5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a1, a4);
}

uint64_t sub_23BB27C6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v4 + 16))((char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = sub_23BB4511C();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v7 & 1;
  *(void *)(a2 + 24) = v8;
  return result;
}

uint64_t sub_23BB27D48@<X0>(uint64_t a1@<X8>)
{
  return sub_23BB27C6C(*(void *)(v1 + 48), a1);
}

uint64_t sub_23BB27D58()
{
  uint64_t v1 = *(void *)(v0 + 40);
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 64) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_23BB27DF8(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v7 = v1[7];
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = (uint64_t)v1
      + ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_23BB27F08;
  return sub_23BB2780C(a1, v8, v9, v10, v4, v5, v6, v7);
}

uint64_t sub_23BB27F08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for WrappedLabelStyle(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for WrappedLabelStyle(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for WrappedLabelStyle()
{
  return &type metadata for WrappedLabelStyle;
}

uint64_t sub_23BB2806C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BB28088@<X0>(uint64_t a1@<X0>, double *a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
  uint64_t v10 = (char *)a2 + *(int *)(type metadata accessor for WrappedLabelStyleView() + 28);
  sub_23BB44FCC();
  OUTLINED_FUNCTION_2_0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 16))(v10, a1);
  *a2 = a3;
  a2[1] = a4;
  a2[2] = a5;
  return result;
}

uint64_t sub_23BB2811C@<X0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  return sub_23BB28088(a1, a2, *v2, v2[1], v2[2]);
}

uint64_t type metadata accessor for WrappedLabelStyleView()
{
  uint64_t result = qword_26ADCCC78;
  if (!qword_26ADCCC78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_23BB28170(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  char v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    uint64_t *v3 = *a2;
    char v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    uint64_t v5 = *(int *)(a3 + 28);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_23BB44FCC();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_23BB28244(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 28);
  uint64_t v3 = sub_23BB44FCC();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

uint64_t sub_23BB282AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_23BB44FCC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *sub_23BB28330(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_23BB44FCC();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

uint64_t sub_23BB283BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_23BB44FCC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_23BB28440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_23BB44FCC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_23BB284C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23BB284D8);
}

uint64_t sub_23BB284D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 28);
  uint64_t v5 = sub_23BB44FCC();

  return __swift_getEnumTagSinglePayload(v4, a2, v5);
}

uint64_t sub_23BB28524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23BB28538);
}

uint64_t sub_23BB28538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 28);
  uint64_t v6 = sub_23BB44FCC();

  return __swift_storeEnumTagSinglePayload(v5, a2, a2, v6);
}

uint64_t sub_23BB28588()
{
  uint64_t result = sub_23BB44FCC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23BB28628()
{
  return sub_23BB28D44(&qword_26ADCCC70, (void (*)(uint64_t))type metadata accessor for WrappedLabelStyleView);
}

uint64_t sub_23BB28670()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BB2868C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_23BB44E4C();
  uint64_t v4 = *(void *)(v1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCC98);
  return sub_23BB286D8(a1 + *(int *)(v5 + 44));
}

uint64_t sub_23BB286D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v60 = a1;
  uint64_t v59 = sub_23BB44FAC();
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v54 = (char *)&v48 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCD60);
  uint64_t v55 = *(void *)(v2 - 8);
  uint64_t v56 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v53 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCCC0);
  uint64_t v4 = MEMORY[0x270FA5388](v52);
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v58 = (uint64_t)&v48 - v7;
  uint64_t v8 = sub_23BB44F8C();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCCA8);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCCF8);
  uint64_t v16 = MEMORY[0x270FA5388](v49);
  uint64_t v51 = (uint64_t)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v48 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v50 = (uint64_t)&v48 - v21;
  type metadata accessor for WrappedLabelStyleView();
  sub_23BB44F9C();
  sub_23BB4539C();
  sub_23BB44B9C();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v15, v11, v8);
  uint64_t v22 = &v15[*(int *)(v13 + 44)];
  long long v23 = v62;
  *(_OWORD *)uint64_t v22 = v61;
  *((_OWORD *)v22 + 1) = v23;
  *((_OWORD *)v22 + 2) = v63;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  unsigned __int8 v24 = sub_23BB4505C();
  unsigned __int8 v25 = sub_23BB4503C();
  unsigned __int8 v26 = sub_23BB4504C();
  char v27 = sub_23BB4506C();
  sub_23BB4506C();
  if (sub_23BB4506C() != v24) {
    char v27 = sub_23BB4506C();
  }
  sub_23BB4506C();
  if (sub_23BB4506C() != v25) {
    char v27 = sub_23BB4506C();
  }
  sub_23BB4506C();
  if (sub_23BB4506C() != v26) {
    char v27 = sub_23BB4506C();
  }
  sub_23BB44B2C();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  sub_23BB28D8C((uint64_t)v15, (uint64_t)v20, &qword_26ADCCCA8);
  uint64_t v36 = &v20[*(int *)(v49 + 36)];
  char *v36 = v27;
  *((void *)v36 + 1) = v29;
  *((void *)v36 + 2) = v31;
  *((void *)v36 + 3) = v33;
  *((void *)v36 + 4) = v35;
  v36[40] = 0;
  sub_23BB24914((uint64_t)v15, &qword_26ADCCCA8);
  uint64_t v37 = v50;
  sub_23BB19EE0((uint64_t)v20, v50, &qword_26ADCCCF8);
  uint64_t v38 = v54;
  sub_23BB44FBC();
  sub_23BB28D44(&qword_268A7C890, MEMORY[0x263F1A020]);
  uint64_t v39 = v53;
  uint64_t v40 = v59;
  sub_23BB451AC();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v38, v40);
  uint64_t v42 = v55;
  uint64_t v41 = v56;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v6, v39, v56);
  *(_WORD *)&v6[*(int *)(v52 + 36)] = 256;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v39, v41);
  uint64_t v43 = v58;
  sub_23BB19EE0((uint64_t)v6, v58, &qword_26ADCCCC0);
  uint64_t v44 = v51;
  sub_23BB28D8C(v37, v51, &qword_26ADCCCF8);
  sub_23BB28D8C(v43, (uint64_t)v6, &qword_26ADCCCC0);
  uint64_t v45 = v60;
  sub_23BB28D8C(v44, v60, &qword_26ADCCCF8);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCD00);
  sub_23BB28D8C((uint64_t)v6, v45 + *(int *)(v46 + 48), &qword_26ADCCCC0);
  sub_23BB24914(v43, &qword_26ADCCCC0);
  sub_23BB24914(v37, &qword_26ADCCCF8);
  sub_23BB24914((uint64_t)v6, &qword_26ADCCCC0);
  return sub_23BB24914(v44, &qword_26ADCCCF8);
}

uint64_t sub_23BB28D24()
{
  return sub_23BB4519C();
}

uint64_t sub_23BB28D44(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23BB28D8C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_23BB28DEC()
{
  unint64_t result = qword_26ADCCD80;
  if (!qword_26ADCCD80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCD88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCD80);
  }
  return result;
}

void View.accessibilityAction<A, B>(intent:label:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v37 = v22;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  OUTLINED_FUNCTION_0();
  uint64_t v30 = v29;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_45_0();
  uint64_t v36 = v32;
  sub_23BB4457C();
  sub_23BB27530();
  if (!OUTLINED_FUNCTION_12())
  {
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_24_1();
  }
  OUTLINED_FUNCTION_33();
  v33();
  unint64_t v34 = (*(unsigned __int8 *)(v30 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v35 = (char *)swift_allocObject();
  *((void *)v35 + 2) = v28;
  *((void *)v35 + 3) = v26;
  *((void *)v35 + 4) = v24;
  *((void *)v35 + 5) = v37;
  *((void *)v35 + 6) = v36;
  *((void *)v35 + 7) = a21;
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(&v35[v34], v21, v26);
  sub_23BB451BC();
  swift_release();

  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_23BB28FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a6;
  uint64_t v26 = a7;
  uint64_t v12 = *(void *)(a3 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C878);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_23BB4556C();
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, a3);
  sub_23BB4554C();
  uint64_t v19 = sub_23BB4553C();
  unint64_t v20 = (*(unsigned __int8 *)(v12 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v21 = (char *)swift_allocObject();
  uint64_t v22 = MEMORY[0x263F8F500];
  *((void *)v21 + 2) = v19;
  *((void *)v21 + 3) = v22;
  *((void *)v21 + 4) = a2;
  *((void *)v21 + 5) = a3;
  *((void *)v21 + 6) = a4;
  *((void *)v21 + 7) = a5;
  uint64_t v23 = v26;
  *((void *)v21 + 8) = v25;
  *((void *)v21 + 9) = v23;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v21[v20], v14, a3);
  sub_23BB32594((uint64_t)v17, (uint64_t)&unk_268A7C9A0, (uint64_t)v21);
  return swift_release();
}

uint64_t sub_23BB291D8()
{
  OUTLINED_FUNCTION_28_1();
  uint64_t v0 = OUTLINED_FUNCTION_14_1();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_27_1();

  return MEMORY[0x270FA0238](v2, v3, v4);
}

uint64_t sub_23BB29240()
{
  OUTLINED_FUNCTION_1_0();
  return sub_23BB28FF4(v0 + ((*(unsigned __int8 *)(v1 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)), v2, v3, v4, v5, v6, v7);
}

uint64_t sub_23BB29270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a6;
  v6[4] = v15;
  v6[2] = a4;
  sub_23BB4554C();
  v6[5] = sub_23BB4553C();
  uint64_t v8 = sub_23BB4552C();
  return MEMORY[0x270FA2498](sub_23BB2C4F8, v8, v7, v7, v9, v10, v11, v12);
}

#error "23BB29358: call analysis failed (funcsize=19)"

void sub_23BB2936C()
{
}

uint64_t sub_23BB2938C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[3] = a6;
  v8[4] = a8;
  v8[2] = a4;
  sub_23BB4554C();
  v8[5] = sub_23BB4553C();
  uint64_t v10 = sub_23BB4552C();
  return MEMORY[0x270FA2498](sub_23BB2C4F8, v10, v9, v9, v11, v12, v13, v14);
}

#error "23BB29474: call analysis failed (funcsize=21)"

void sub_23BB29488()
{
}

void sub_23BB294A8()
{
}

#error "23BB29534: call analysis failed (funcsize=21)"

void sub_23BB29548()
{
}

uint64_t sub_23BB29568(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

#error "23BB295BC: call analysis failed (funcsize=19)"

uint64_t sub_23BB295D0()
{
  return sub_23BB2A79C(&unk_26EF0B5B0, &unk_268A7C960);
}

uint64_t sub_23BB295F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[3] = a7;
  v7[4] = v16;
  v7[2] = a4;
  sub_23BB4554C();
  v7[5] = sub_23BB4553C();
  uint64_t v9 = sub_23BB4552C();
  return MEMORY[0x270FA2498](sub_23BB2C4F8, v9, v8, v8, v10, v11, v12, v13);
}

void ModifiedContent<>.accessibilityAction<A>(_:intent:)()
{
}

{
  sub_23BB2A864();
}

void sub_23BB296F0()
{
}

uint64_t sub_23BB29710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[3] = a6;
  v7[4] = a7;
  v7[2] = a4;
  sub_23BB4554C();
  v7[5] = sub_23BB4553C();
  uint64_t v9 = sub_23BB4552C();
  return MEMORY[0x270FA2498](sub_23BB2C4F8, v9, v8, v8, v10, v11, v12, v13);
}

#error "23BB297F0: call analysis failed (funcsize=19)"

void sub_23BB29804()
{
}

void sub_23BB29824()
{
}

#error "23BB298A8: call analysis failed (funcsize=19)"

void sub_23BB298BC()
{
}

uint64_t sub_23BB298DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[3] = a6;
  v7[4] = a7;
  v7[2] = a4;
  sub_23BB4554C();
  v7[5] = sub_23BB4553C();
  uint64_t v9 = sub_23BB4552C();
  return MEMORY[0x270FA2498](sub_23BB278A8, v9, v8, v8, v10, v11, v12, v13);
}

#error "23BB299BC: call analysis failed (funcsize=19)"

void sub_23BB299D0()
{
}

uint64_t sub_23BB299F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[3] = a7;
  v7[4] = v16;
  v7[2] = a4;
  sub_23BB4554C();
  v7[5] = sub_23BB4553C();
  uint64_t v9 = sub_23BB4552C();
  return MEMORY[0x270FA2498](sub_23BB2C4F8, v9, v8, v8, v10, v11, v12, v13);
}

#error "23BB29AD8: call analysis failed (funcsize=19)"

void sub_23BB29AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void (*a21)(uint64_t, void *, uint64_t, char *, uint64_t, uint64_t))
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v43 = v22;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v42 = v31;
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v32;
  uint64_t v35 = MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_32_1(v35, v36, v37, v38);
  sub_23BB4457C();
  sub_23BB27530();
  if (!OUTLINED_FUNCTION_12())
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_24_1();
  }
  OUTLINED_FUNCTION_33();
  v39();
  unint64_t v40 = (*(unsigned __int8 *)(v33 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v41 = (char *)swift_allocObject();
  *((void *)v41 + 2) = v30;
  *((void *)v41 + 3) = v28;
  *((void *)v41 + 4) = v26;
  *((void *)v41 + 5) = v24;
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 32))(&v41[v40], v21, v28);
  a21(v42, v44, v43, v41, v30, v26);
  swift_release();

  OUTLINED_FUNCTION_5_0();
}

void sub_23BB29C5C()
{
}

#error "23BB29CC8: call analysis failed (funcsize=21)"

void sub_23BB29CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void (*a24)(uint64_t, uint64_t, void, uint64_t, void *, uint64_t, char *, uint64_t, uint64_t))
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v52 = v24;
  uint64_t v50 = v26;
  uint64_t v51 = v25;
  uint64_t v28 = v27;
  int v46 = v29;
  uint64_t v48 = v30;
  uint64_t v49 = v31;
  uint64_t v47 = v32;
  OUTLINED_FUNCTION_0();
  uint64_t v34 = v33;
  uint64_t v36 = *(void *)(v35 + 64);
  MEMORY[0x270FA5388](v37);
  uint64_t v38 = (char *)&v45 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BB4457C();
  sub_23BB27530();
  if (!OUTLINED_FUNCTION_42_0())
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_24_1();
  }
  uint64_t v45 = a24;
  uint64_t v39 = v53;
  OUTLINED_FUNCTION_33();
  v40();
  unint64_t v41 = (*(unsigned __int8 *)(v34 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  uint64_t v42 = (char *)swift_allocObject();
  uint64_t v43 = v52;
  *((void *)v42 + 2) = v52;
  *((void *)v42 + 3) = v28;
  uint64_t v44 = v50;
  *((void *)v42 + 4) = v50;
  *((void *)v42 + 5) = a21;
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))(&v42[v41], v38, v28);
  v45(v48, v49, v46 & 1, v51, v39, a23, v42, v43, v44);
  swift_release();

  OUTLINED_FUNCTION_5_0();
}

void sub_23BB29E90()
{
}

#error "23BB29EFC: call analysis failed (funcsize=21)"

void sub_23BB29F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void (*a24)(uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, char *, uint64_t, void *))
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v45 = v25;
  uint64_t v44 = v26;
  uint64_t v28 = v27;
  OUTLINED_FUNCTION_0();
  uint64_t v30 = v29;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_39_0();
  uint64_t v43 = v32;
  sub_23BB4457C();
  sub_23BB27530();
  if (!OUTLINED_FUNCTION_12())
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_24_1();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_44_0();
  uint64_t v33 = OUTLINED_FUNCTION_47_0();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38 & 1;
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_33();
  v40();
  unint64_t v41 = (*(unsigned __int8 *)(v30 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v42 = (char *)swift_allocObject();
  *((void *)v42 + 2) = v45;
  *((void *)v42 + 3) = v28;
  *((void *)v42 + 4) = v44;
  *((void *)v42 + 5) = v43;
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(&v42[v41], v24, v28);
  a24(v33, v35, v39, v37, v44, a23, v42, v45, v44);
  sub_23BB29568(v33, v35, v39);
  swift_release();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_0();
}

void sub_23BB2A108()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v21 = v2;
  uint64_t v22 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_39_0();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C878);
  uint64_t v14 = OUTLINED_FUNCTION_22(v13);
  MEMORY[0x270FA5388](v14);
  uint64_t v15 = OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_43_0(v15);
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_33();
  v16();
  sub_23BB4554C();
  uint64_t v17 = sub_23BB4553C();
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v19 = (char *)swift_allocObject();
  uint64_t v20 = MEMORY[0x263F8F500];
  *((void *)v19 + 2) = v17;
  *((void *)v19 + 3) = v20;
  *((void *)v19 + 4) = v9;
  *((void *)v19 + 5) = v7;
  *((void *)v19 + 6) = v5;
  *((void *)v19 + 7) = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(&v19[v18], v0, v7);
  sub_23BB32594(v1, v22, (uint64_t)v19);
  swift_release();
  OUTLINED_FUNCTION_5_0();
}

uint64_t objectdestroy_2Tm()
{
  OUTLINED_FUNCTION_28_1();
  uint64_t v0 = OUTLINED_FUNCTION_14_1();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_27_1();

  return MEMORY[0x270FA0238](v2, v3, v4);
}

void sub_23BB2A2C0()
{
}

#error "23BB2A324: call analysis failed (funcsize=19)"

void sub_23BB2A334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void (*a23)(uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, char *, uint64_t, uint64_t))
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v55 = v24;
  uint64_t v26 = v25;
  uint64_t v54 = v27;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v34;
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_46_0();
  uint64_t v52 = v37;
  OUTLINED_FUNCTION_0();
  uint64_t v39 = v38;
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_7_1();
  uint64_t v53 = v41;
  sub_23BB4457C();
  sub_23BB27530();
  if (!OUTLINED_FUNCTION_42_0())
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_24_1();
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v23, v33, v31);
  uint64_t v42 = sub_23BB4511C();
  uint64_t v50 = v43;
  uint64_t v51 = v44;
  uint64_t v46 = v45 & 1;
  OUTLINED_FUNCTION_33();
  v47();
  unint64_t v48 = (*(unsigned __int8 *)(v35 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  uint64_t v49 = (char *)swift_allocObject();
  *((void *)v49 + 2) = v55;
  *((void *)v49 + 3) = v31;
  *((void *)v49 + 4) = v29;
  *((void *)v49 + 5) = v54;
  *((void *)v49 + 6) = v26;
  *((void *)v49 + 7) = v53;
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(&v49[v48], v52, v29);
  a23(v42, v50, v46, v51, v56, a22, v49, v55, v54);
  sub_23BB29568(v42, v50, v46);
  swift_release();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_0();
}

void sub_23BB2A57C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v49 = v22;
  uint64_t v50 = v23;
  uint64_t v47 = v24;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  OUTLINED_FUNCTION_0();
  uint64_t v32 = v31;
  uint64_t v34 = *(void *)(v33 + 64);
  uint64_t v48 = a21;
  MEMORY[0x270FA5388](v35);
  uint64_t v36 = (char *)&v47 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C878);
  uint64_t v38 = OUTLINED_FUNCTION_22(v37);
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_7_1();
  uint64_t v39 = sub_23BB4556C();
  __swift_storeEnumTagSinglePayload(v21, 1, 1, v39);
  OUTLINED_FUNCTION_33();
  v40();
  sub_23BB4554C();
  uint64_t v41 = sub_23BB4553C();
  unint64_t v42 = (*(unsigned __int8 *)(v32 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  uint64_t v43 = (char *)swift_allocObject();
  uint64_t v44 = MEMORY[0x263F8F500];
  *((void *)v43 + 2) = v41;
  *((void *)v43 + 3) = v44;
  *((void *)v43 + 4) = v30;
  *((void *)v43 + 5) = v28;
  uint64_t v45 = v47;
  *((void *)v43 + 6) = v26;
  *((void *)v43 + 7) = v45;
  uint64_t v46 = v50;
  *((void *)v43 + 8) = v49;
  *((void *)v43 + 9) = v46;
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(&v43[v42], v36, v26);
  sub_23BB32594(v21, v48, (uint64_t)v43);
  swift_release();
  OUTLINED_FUNCTION_5_0();
}

uint64_t objectdestroy_11Tm()
{
  OUTLINED_FUNCTION_28_1();
  uint64_t v0 = OUTLINED_FUNCTION_14_1();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_27_1();

  return MEMORY[0x270FA0238](v2, v3, v4);
}

uint64_t sub_23BB2A77C()
{
  return sub_23BB2A79C(&unk_26EF0B470, &unk_268A7C8E0);
}

#error "23BB2A7FC: call analysis failed (funcsize=28)"

void sub_23BB2A864()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v22 = v1;
  uint64_t v20 = v2;
  uint64_t v21 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_32_1(v13, v14, v15, v16);
  sub_23BB4457C();
  sub_23BB27530();
  if (!OUTLINED_FUNCTION_12())
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_24_1();
  }
  OUTLINED_FUNCTION_33();
  v17();
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v19 = (char *)swift_allocObject();
  *((void *)v19 + 2) = *(void *)(v9 + 16);
  *((void *)v19 + 3) = v7;
  *((void *)v19 + 4) = v5;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(&v19[v18], v0, v7);
  v22(v20, v23, v21, v19, v9);
  swift_release();

  OUTLINED_FUNCTION_5_0();
}

void sub_23BB2A9D8()
{
}

#error "23BB2AA3C: call analysis failed (funcsize=19)"

void sub_23BB2AA4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void (*a23)(uint64_t, uint64_t, void, uint64_t, void *, uint64_t, char *, uint64_t))
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v43 = v24;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v41 = v29;
  uint64_t v42 = v30;
  char v39 = v31;
  uint64_t v40 = v32;
  OUTLINED_FUNCTION_0();
  uint64_t v34 = v33;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_45_0();
  sub_23BB4457C();
  sub_23BB27530();
  if (!OUTLINED_FUNCTION_12())
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_24_1();
  }
  OUTLINED_FUNCTION_33();
  v36();
  unint64_t v37 = (*(unsigned __int8 *)(v34 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  uint64_t v38 = (char *)swift_allocObject();
  *((void *)v38 + 2) = *(void *)(v43 + 16);
  *((void *)v38 + 3) = v28;
  *((void *)v38 + 4) = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(&v38[v37], v23, v28);
  a23(v40, v41, v39 & 1, v42, v44, a22, v38, v43);
  swift_release();

  OUTLINED_FUNCTION_5_0();
}

void sub_23BB2ABE8()
{
}

#error "23BB2AC4C: call analysis failed (funcsize=19)"

void sub_23BB2AC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void (*a23)(uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, char *, uint64_t))
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v42 = v24;
  uint64_t v26 = v25;
  OUTLINED_FUNCTION_0();
  uint64_t v28 = v27;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_38_0();
  uint64_t v41 = v30;
  sub_23BB4457C();
  sub_23BB27530();
  if (!OUTLINED_FUNCTION_12())
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_24_1();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_44_0();
  uint64_t v31 = OUTLINED_FUNCTION_47_0();
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36 & 1;
  OUTLINED_FUNCTION_33();
  v38();
  unint64_t v39 = (*(unsigned __int8 *)(v28 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v40 = (char *)swift_allocObject();
  *((void *)v40 + 2) = *(void *)(v42 + 16);
  *((void *)v40 + 3) = v26;
  *((void *)v40 + 4) = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(&v40[v39], v23, v26);
  a23(v31, v33, v37, v35, v43, a22, v40, v42);
  sub_23BB29568(v31, v33, v37);
  swift_release();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_0();
}

void sub_23BB2AE58()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v20 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_38_0();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C878);
  uint64_t v13 = OUTLINED_FUNCTION_22(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_22_0();
  uint64_t v14 = sub_23BB4556C();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v14);
  OUTLINED_FUNCTION_33();
  v15();
  sub_23BB4554C();
  uint64_t v16 = sub_23BB4553C();
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v18 = (char *)swift_allocObject();
  uint64_t v19 = MEMORY[0x263F8F500];
  *((void *)v18 + 2) = v16;
  *((void *)v18 + 3) = v19;
  *((void *)v18 + 4) = v8;
  *((void *)v18 + 5) = v6;
  *((void *)v18 + 6) = v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(&v18[v17], v0, v6);
  sub_23BB32594(v1, v20, (uint64_t)v18);
  swift_release();
  OUTLINED_FUNCTION_5_0();
}

uint64_t objectdestroy_14Tm()
{
  OUTLINED_FUNCTION_28_1();
  uint64_t v0 = OUTLINED_FUNCTION_14_1();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_27_1();

  return MEMORY[0x270FA0238](v2, v3, v4);
}

void sub_23BB2B02C()
{
}

#error "23BB2B090: call analysis failed (funcsize=19)"

void sub_23BB2B0A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void (*a22)(uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, char *, uint64_t))
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v53 = v23;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v50 = v30;
  OUTLINED_FUNCTION_0();
  uint64_t v32 = v31;
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_46_0();
  uint64_t v35 = v34;
  OUTLINED_FUNCTION_0();
  uint64_t v37 = v36;
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_22_0();
  uint64_t v52 = v39;
  sub_23BB4457C();
  sub_23BB27530();
  if (!OUTLINED_FUNCTION_12())
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_24_1();
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v22, v50, v29);
  uint64_t v49 = v25;
  uint64_t v40 = sub_23BB4511C();
  uint64_t v42 = v41;
  uint64_t v51 = v43;
  uint64_t v45 = v44 & 1;
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_33();
  v46();
  unint64_t v47 = (*(unsigned __int8 *)(v32 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  uint64_t v48 = (char *)swift_allocObject();
  *((void *)v48 + 2) = *(void *)(v53 + 16);
  *((void *)v48 + 3) = v29;
  *((void *)v48 + 4) = v27;
  *((void *)v48 + 5) = v49;
  *((void *)v48 + 6) = v52;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 32))(&v48[v47], v35, v27);
  a22(v40, v42, v45, v51, v54, a21, v48, v53);
  sub_23BB29568(v40, v42, v45);
  swift_release();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_0();
}

void sub_23BB2B2E0()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v27 = v1;
  uint64_t v28 = v2;
  uint64_t v26 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v14);
  uint64_t v15 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C878);
  uint64_t v17 = OUTLINED_FUNCTION_22(v16);
  MEMORY[0x270FA5388](v17);
  uint64_t v18 = OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_43_0(v18);
  OUTLINED_FUNCTION_33();
  v19();
  sub_23BB4554C();
  uint64_t v20 = sub_23BB4553C();
  unint64_t v21 = (*(unsigned __int8 *)(v11 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v22 = (char *)swift_allocObject();
  uint64_t v23 = MEMORY[0x263F8F500];
  *((void *)v22 + 2) = v20;
  *((void *)v22 + 3) = v23;
  *((void *)v22 + 4) = v9;
  *((void *)v22 + 5) = v7;
  uint64_t v24 = v26;
  *((void *)v22 + 6) = v5;
  *((void *)v22 + 7) = v24;
  *((void *)v22 + 8) = v27;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v22[v21], v15, v5);
  sub_23BB32594(v0, v28, (uint64_t)v22);
  swift_release();
  OUTLINED_FUNCTION_5_0();
}

uint64_t objectdestroy_23Tm()
{
  OUTLINED_FUNCTION_28_1();
  uint64_t v0 = OUTLINED_FUNCTION_14_1();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_27_1();

  return MEMORY[0x270FA0238](v2, v3, v4);
}

void sub_23BB2B4BC()
{
}

void sub_23BB2B4DC()
{
}

uint64_t sub_23BB2B520()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BB2B578()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_11_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_17_1();
  return sub_23BB299F0(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23BB2B63C()
{
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_15_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_22_1();
  return sub_23BB29710(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23BB2B6F8()
{
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_15_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_22_1();
  return sub_23BB29710(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23BB2B7B4()
{
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_15_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_22_1();
  return sub_23BB29710(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23BB2B870()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_11_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_17_1();
  return sub_23BB295F0(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23BB2B94C()
{
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_11_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_21_1();
  return sub_23BB2938C(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23BB2BA0C()
{
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_11_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_21_1();
  return sub_23BB2938C(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23BB2BACC()
{
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_11_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_21_1();
  return sub_23BB2938C(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t objectdestroy_52Tm()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_25_1();
  uint64_t v0 = OUTLINED_FUNCTION_13_1();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_26_1();

  return MEMORY[0x270FA0238](v2, v3, v4);
}

uint64_t sub_23BB2BC08()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_11_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_17_1();
  return sub_23BB299F0(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23BB2BCCC()
{
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_15_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB27F08;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_22_1();
  return sub_23BB298DC(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23BB2BD88()
{
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_15_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_22_1();
  return sub_23BB29710(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t objectdestroy_56Tm()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_25_1();
  uint64_t v0 = OUTLINED_FUNCTION_13_1();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_26_1();

  return MEMORY[0x270FA0238](v2, v3, v4);
}

uint64_t sub_23BB2BEC0()
{
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_15_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_22_1();
  return sub_23BB29710(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t objectdestroy_68Tm()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_25_1();
  uint64_t v0 = OUTLINED_FUNCTION_13_1();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_26_1();

  return MEMORY[0x270FA0238](v2, v3, v4);
}

uint64_t sub_23BB2BFF8()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_11_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_17_1();
  return sub_23BB295F0(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23BB2C0D4()
{
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_11_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_21_1();
  return sub_23BB2938C(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23BB2C194()
{
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_11_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_21_1();
  return sub_23BB2938C(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t objectdestroy_72Tm()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_25_1();
  uint64_t v0 = OUTLINED_FUNCTION_13_1();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_26_1();

  return MEMORY[0x270FA0238](v2, v3, v4);
}

uint64_t sub_23BB2C2D0()
{
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_11_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_21_1();
  return sub_23BB2938C(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23BB2C38C()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_25_1();
  uint64_t v0 = OUTLINED_FUNCTION_13_1();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_26_1();

  return MEMORY[0x270FA0238](v2, v3, v4);
}

uint64_t sub_23BB2C408()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_11_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB2C4FC;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_17_1();
  return sub_23BB29270(v3, v4, v5, v6, v7, v8);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return v0 + v1;
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return v1 + v0;
}

void OUTLINED_FUNCTION_24_1()
{
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a4;
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_43_0(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return sub_23BB450FC();
}

uint64_t View.suggestedIntent<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a4;
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SuggestedIntent();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v19 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, a3);
  sub_23BB2C8E8((uint64_t)v11, a3, (uint64_t)v17);
  MEMORY[0x23ECCEF80](v17, a2, v12, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v12);
}

uint64_t type metadata accessor for SuggestedIntent()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23BB2C8E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA30);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_13();
  type metadata accessor for SuggestedIntent();
  uint64_t v8 = sub_23BB4484C();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v8);
  sub_23BB2DAEC(v3);
  OUTLINED_FUNCTION_4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(a3, a1, a2);
}

uint64_t sub_23BB2C9D0()
{
  return swift_getWitnessTable();
}

void sub_23BB2CA64()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_23BB2DA4C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_23BB2CB30(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_23BB4484C();
  uint64_t v9 = *(void *)(v8 - 8);
  int v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v10 & 0xF8 | 7;
  uint64_t v12 = v7 + v11;
  uint64_t v13 = (v7 + v11) & ~v11;
  if (*(_DWORD *)(v9 + 84)) {
    size_t v14 = *(void *)(v9 + 64);
  }
  else {
    size_t v14 = *(void *)(v9 + 64) + 1;
  }
  uint64_t v15 = *(_DWORD *)(v6 + 80) & 0xF8 | v11;
  int v16 = (*(_DWORD *)(v6 + 80) | v10) & 0x100000;
  if (v15 != 7 || v16 != 0 || v13 + ((v14 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v15 + 16) & ~v15));
  }
  else
  {
    uint64_t v20 = v8;
    uint64_t v21 = ~v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    uint64_t v22 = (const void *)(((unint64_t)a2 + v12) & v21);
    if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v20))
    {
      memcpy((void *)(((unint64_t)a1 + v12) & v21), v22, v14);
    }
    else
    {
      (*(void (**)(unint64_t, const void *, uint64_t))(v9 + 16))(((unint64_t)a1 + v12) & v21, v22, v20);
      __swift_storeEnumTagSinglePayload(((unint64_t)a1 + v12) & v21, 0, 1, v20);
    }
    *(void *)((v14 + 7 + (((unint64_t)a1 + v12) & v21)) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v22 + v14 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_23BB2CD1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = sub_23BB4484C();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80) & 0xF8 | 7;
  uint64_t v8 = (v4 + a1 + v7) & ~v7;
  if (!__swift_getEnumTagSinglePayload(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  }

  return swift_release();
}

uint64_t sub_23BB2CE24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = sub_23BB4484C();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  uint64_t v10 = v6 + v9;
  uint64_t v11 = (v6 + v9 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  if (__swift_getEnumTagSinglePayload(v12, 1, v7))
  {
    int v13 = *(_DWORD *)(v8 + 84);
    size_t v14 = *(void *)(v8 + 64);
    if (v13) {
      size_t v15 = v14;
    }
    else {
      size_t v15 = v14 + 1;
    }
    memcpy((void *)v11, (const void *)v12, v15);
  }
  else
  {
    uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    uint64_t v16 = v8 + 16;
    v17(v11, v12, v7);
    __swift_storeEnumTagSinglePayload(v11, 0, 1, v7);
    int v13 = *(_DWORD *)(v16 + 68);
    size_t v14 = *(void *)(v16 + 48);
  }
  if (v13) {
    size_t v18 = v14;
  }
  else {
    size_t v18 = v14 + 1;
  }
  *(void *)(((v11 | 7) + v18) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((v12 | 7) + v18) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

uint64_t sub_23BB2CF7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = sub_23BB4484C();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  uint64_t v10 = v6 + v9;
  uint64_t v11 = (v6 + v9 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v11, 1, v7);
  int v14 = __swift_getEnumTagSinglePayload(v12, 1, v7);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v12, v7);
      __swift_storeEnumTagSinglePayload(v11, 0, 1, v7);
      goto LABEL_12;
    }
    int v15 = *(_DWORD *)(v8 + 84);
    size_t v16 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v14)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v11, v12, v7);
      goto LABEL_12;
    }
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
    int v15 = *(_DWORD *)(v8 + 84);
    size_t v16 = *(void *)(v8 + 64);
  }
  if (v15) {
    size_t v17 = v16;
  }
  else {
    size_t v17 = v16 + 1;
  }
  memcpy((void *)v11, (const void *)v12, v17);
LABEL_12:
  if (*(_DWORD *)(v8 + 84)) {
    uint64_t v18 = *(void *)(v8 + 64);
  }
  else {
    uint64_t v18 = *(void *)(v8 + 64) + 1;
  }
  *(void *)(((v11 | 7) + v18) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((v12 | 7) + v18) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23BB2D14C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = sub_23BB4484C();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  uint64_t v10 = v6 + v9;
  uint64_t v11 = (v6 + v9 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  if (__swift_getEnumTagSinglePayload(v12, 1, v7))
  {
    int v13 = *(_DWORD *)(v8 + 84);
    size_t v14 = *(void *)(v8 + 64);
    if (v13) {
      size_t v15 = v14;
    }
    else {
      size_t v15 = v14 + 1;
    }
    memcpy((void *)v11, (const void *)v12, v15);
  }
  else
  {
    size_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
    uint64_t v16 = v8 + 32;
    v17(v11, v12, v7);
    __swift_storeEnumTagSinglePayload(v11, 0, 1, v7);
    int v13 = *(_DWORD *)(v16 + 52);
    size_t v14 = *(void *)(v16 + 32);
  }
  if (v13) {
    size_t v18 = v14;
  }
  else {
    size_t v18 = v14 + 1;
  }
  *(void *)(((v11 | 7) + v18) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((v12 | 7) + v18) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23BB2D2A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = sub_23BB4484C();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  uint64_t v10 = v6 + v9;
  uint64_t v11 = (v6 + v9 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v11, 1, v7);
  int v14 = __swift_getEnumTagSinglePayload(v12, 1, v7);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v11, v12, v7);
      __swift_storeEnumTagSinglePayload(v11, 0, 1, v7);
      goto LABEL_12;
    }
    int v15 = *(_DWORD *)(v8 + 84);
    size_t v16 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v14)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v11, v12, v7);
      goto LABEL_12;
    }
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
    int v15 = *(_DWORD *)(v8 + 84);
    size_t v16 = *(void *)(v8 + 64);
  }
  if (v15) {
    size_t v17 = v16;
  }
  else {
    size_t v17 = v16 + 1;
  }
  memcpy((void *)v11, (const void *)v12, v17);
LABEL_12:
  if (*(_DWORD *)(v8 + 84)) {
    uint64_t v18 = *(void *)(v8 + 64);
  }
  else {
    uint64_t v18 = *(void *)(v8 + 64) + 1;
  }
  *(void *)(((v11 | 7) + v18) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((v12 | 7) + v18) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_23BB2D468(int *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = sub_23BB4484C();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  if (v10) {
    unsigned int v11 = v10 - 1;
  }
  else {
    unsigned int v11 = 0;
  }
  if (v11 <= 0x7FFFFFFE) {
    unsigned int v12 = 2147483646;
  }
  else {
    unsigned int v12 = v11;
  }
  if (v12 <= v7) {
    unsigned int v13 = v7;
  }
  else {
    unsigned int v13 = v12;
  }
  uint64_t v14 = *(void *)(*(void *)(v8 - 8) + 64);
  if (!v10) {
    ++v14;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v15 = v8;
  uint64_t v16 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
  uint64_t v17 = *(void *)(v6 + 64) + v16;
  uint64_t v18 = v14 + 7;
  if (v13 < a2)
  {
    unint64_t v19 = (v18 & 0xFFFFFFFFFFFFFFF8) + (v17 & ~v16) + 8;
    uint64_t v20 = v19 & 0xFFFFFFF8;
    if ((v19 & 0xFFFFFFF8) != 0) {
      unsigned int v21 = 2;
    }
    else {
      unsigned int v21 = a2 - v13 + 1;
    }
    if (v21 >= 0x10000) {
      unsigned int v22 = 4;
    }
    else {
      unsigned int v22 = 2;
    }
    if (v21 < 0x100) {
      unsigned int v22 = 1;
    }
    if (v21 >= 2) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 0;
    }
    switch(v23)
    {
      case 1:
        int v24 = *((unsigned __int8 *)a1 + v19);
        if (!v24) {
          break;
        }
        goto LABEL_30;
      case 2:
        int v24 = *(unsigned __int16 *)((char *)a1 + v19);
        if (v24) {
          goto LABEL_30;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x23BB2D6B4);
      case 4:
        int v24 = *(int *)((char *)a1 + v19);
        if (!v24) {
          break;
        }
LABEL_30:
        unsigned int v26 = v24 - 1;
        if (v20)
        {
          unsigned int v26 = 0;
          int v27 = *a1;
        }
        else
        {
          int v27 = 0;
        }
        return v13 + (v27 | v26) + 1;
      default:
        break;
    }
  }
  if (v7 >= v12)
  {
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v7, v5);
  }
  else
  {
    uint64_t v28 = ((unint64_t)a1 + v17) & ~v16;
    if (v11 < 0x7FFFFFFE)
    {
      unint64_t v30 = *(void *)((v18 + v28) & 0xFFFFFFFFFFFFFFF8);
      if (v30 >= 0xFFFFFFFF) {
        LODWORD(v30) = -1;
      }
      if ((v30 + 1) >= 2) {
        return v30;
      }
      else {
        return 0;
      }
    }
    else
    {
      unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v28, v10, v15);
      if (EnumTagSinglePayload >= 2) {
        return EnumTagSinglePayload - 1;
      }
      else {
        return 0;
      }
    }
  }
}

void sub_23BB2D6C8(_DWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = sub_23BB4484C();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  unsigned int v13 = v12 - 1;
  if (!v12) {
    unsigned int v13 = 0;
  }
  if (v13 <= 0x7FFFFFFE) {
    unsigned int v14 = 2147483646;
  }
  else {
    unsigned int v14 = v13;
  }
  if (v14 <= v9) {
    unsigned int v15 = v9;
  }
  else {
    unsigned int v15 = v14;
  }
  uint64_t v16 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  uint64_t v17 = *(void *)(v8 + 64) + v16;
  if (v12) {
    size_t v18 = *(void *)(*(void *)(v10 - 8) + 64);
  }
  else {
    size_t v18 = *(void *)(*(void *)(v10 - 8) + 64) + 1;
  }
  unint64_t v19 = ((v18 + 7) & 0xFFFFFFFFFFFFFFF8) + (v17 & ~v16) + 8;
  if (((v18 + 7) & 0xFFFFFFF8) + (v17 & ~(*(_DWORD *)(v11 + 80) & 0xF8 | 7)) == -8) {
    unsigned int v20 = a3 - v15 + 1;
  }
  else {
    unsigned int v20 = 2;
  }
  if (v20 >= 0x10000) {
    int v21 = 4;
  }
  else {
    int v21 = 2;
  }
  if (v20 < 0x100) {
    int v21 = 1;
  }
  if (v20 >= 2) {
    unsigned int v22 = v21;
  }
  else {
    unsigned int v22 = 0;
  }
  if (v15 < a3) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = 0;
  }
  if (a2 > v15)
  {
    if (((v18 + 7) & 0xFFFFFFF8) + (v17 & ~(*(_DWORD *)(v11 + 80) & 0xF8 | 7)) == -8) {
      int v24 = a2 - v15;
    }
    else {
      int v24 = 1;
    }
    if (((v18 + 7) & 0xFFFFFFF8) + (v17 & ~(*(_DWORD *)(v11 + 80) & 0xF8 | 7)) != -8)
    {
      int v25 = ~v15 + a2;
      bzero(a1, ((v18 + 7) & 0xFFFFFFFFFFFFFFF8) + (v17 & ~v16) + 8);
      *a1 = v25;
    }
    switch(v23)
    {
      case 1:
        *((unsigned char *)a1 + v19) = v24;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v19) = v24;
        return;
      case 3:
        goto LABEL_70;
      case 4:
        *(_DWORD *)((char *)a1 + v19) = v24;
        return;
      default:
        return;
    }
  }
  uint64_t v26 = v10;
  switch(v23)
  {
    case 1:
      *((unsigned char *)a1 + v19) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_41;
    case 2:
      *(_WORD *)((char *)a1 + v19) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_41;
    case 3:
LABEL_70:
      __break(1u);
      JUMPOUT(0x23BB2DA14);
    case 4:
      *(_DWORD *)((char *)a1 + v19) = 0;
      goto LABEL_40;
    default:
LABEL_40:
      if (!a2) {
        return;
      }
LABEL_41:
      if (v9 >= v14)
      {
        uint64_t v30 = (uint64_t)a1;
        uint64_t v31 = a2;
        uint64_t v12 = v9;
        uint64_t v26 = v7;
      }
      else
      {
        int v27 = (unsigned char *)(((unint64_t)a1 + v17) & ~v16);
        if (v14 < a2)
        {
          int v28 = (v18 + 7) & 0xFFFFFFF8;
          if (v28 != -8)
          {
            int v29 = ~v14 + a2;
            bzero(v27, (v28 + 8));
LABEL_45:
            *(_DWORD *)int v27 = v29;
          }
          return;
        }
        if (v13 < 0x7FFFFFFE)
        {
          uint64_t v34 = (void *)((unint64_t)&v27[v18 + 7] & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            void *v34 = 0;
            *(_DWORD *)uint64_t v34 = a2 - 0x7FFFFFFF;
          }
          else
          {
            void *v34 = a2;
          }
          return;
        }
        if (v13 < a2)
        {
          if (v18 <= 3) {
            int v32 = ~(-1 << (8 * v18));
          }
          else {
            int v32 = -1;
          }
          if (v18)
          {
            int v29 = v32 & (~v13 + a2);
            if (v18 <= 3) {
              int v33 = v18;
            }
            else {
              int v33 = 4;
            }
            bzero(v27, v18);
            switch(v33)
            {
              case 2:
                *(_WORD *)int v27 = v29;
                break;
              case 3:
                *(_WORD *)int v27 = v29;
                v27[2] = BYTE2(v29);
                break;
              case 4:
                goto LABEL_45;
              default:
                *int v27 = v29;
                break;
            }
          }
          return;
        }
        uint64_t v31 = (a2 + 1);
        uint64_t v30 = (uint64_t)v27;
      }
      __swift_storeEnumTagSinglePayload(v30, v31, v12, v26);
      return;
  }
}

void sub_23BB2DA4C()
{
  if (!qword_268A7CA28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7CA30);
    unint64_t v0 = sub_23BB452EC();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268A7CA28);
    }
  }
}

uint64_t sub_23BB2DAA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BB2DAEC(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA30);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_13();
  sub_23BB2F3D8(a1, v1);
  sub_23BB452BC();
  return sub_23BB2F17C(a1, &qword_268A7CA30);
}

uint64_t sub_23BB2DB8C()
{
  return sub_23BB452CC();
}

uint64_t sub_23BB2DBC8(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA30);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_13();
  sub_23BB2F3D8(a1, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA38);
  sub_23BB452DC();
  return sub_23BB2F17C(a1, &qword_268A7CA30);
}

uint64_t sub_23BB2DC74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v43 = a1;
  uint64_t v47 = a3;
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v10);
  swift_getWitnessTable();
  uint64_t v39 = sub_23BB44F7C();
  uint64_t v41 = sub_23BB44C2C();
  OUTLINED_FUNCTION_0();
  uint64_t v45 = v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v48 = (char *)v36 - v13;
  uint64_t v44 = sub_23BB44C2C();
  OUTLINED_FUNCTION_0();
  uint64_t v46 = v14;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v40 = (char *)v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v42 = (char *)v36 - v18;
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v37((char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v4, a2);
  uint64_t v19 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v20 = (v19 + 32) & ~v19;
  v36[1] = v19 | 7;
  v36[2] = v20 + v9;
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = *(void *)(a2 + 16);
  uint64_t v23 = *(void *)(a2 + 24);
  *(void *)(v21 + 16) = v22;
  *(void *)(v21 + 24) = v23;
  v36[0] = *(void *)(v7 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v36[0])(v21 + v20, (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_23BB4520C();
  swift_release();
  int v25 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37(v25, v38, a2);
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v22;
  *(void *)(v26 + 24) = v23;
  ((void (*)(uint64_t, char *, uint64_t))v36[0])(v26 + v20, v25, a2);
  uint64_t v27 = MEMORY[0x263F1A240];
  uint64_t v51 = WitnessTable;
  uint64_t v52 = MEMORY[0x263F1A240];
  uint64_t v28 = swift_getWitnessTable();
  int v29 = v40;
  sub_23BB4518C();
  swift_release();
  OUTLINED_FUNCTION_9_2();
  v30();
  uint64_t v49 = v28;
  uint64_t v50 = v27;
  uint64_t v31 = v44;
  uint64_t v32 = swift_getWitnessTable();
  int v33 = v42;
  sub_23BB3EE9C(v29, v31, v32);
  uint64_t v34 = *(void (**)(char *, uint64_t))(v46 + 8);
  v34(v29, v31);
  sub_23BB3EE9C(v33, v31, v32);
  return ((uint64_t (*)(char *, uint64_t))v34)(v33, v31);
}

uint64_t sub_23BB2E044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SuggestedIntent();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C878);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA40);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_23BB48300;
  *(void *)(v13 + 56) = MEMORY[0x263F8D310];
  *(void *)(v13 + 32) = 0xD000000000000028;
  *(void *)(v13 + 40) = 0x800000023BB4A530;
  sub_23BB4576C();
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_23BB4556C();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  sub_23BB4554C();
  uint64_t v15 = sub_23BB4553C();
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = (char *)swift_allocObject();
  uint64_t v18 = MEMORY[0x263F8F500];
  *((void *)v17 + 2) = v15;
  *((void *)v17 + 3) = v18;
  *((void *)v17 + 4) = a2;
  *((void *)v17 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v17[v16], v9, v6);
  sub_23BB2E610((uint64_t)v12, (uint64_t)&unk_268A7CA60, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_23BB2E280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA30);
  v6[5] = swift_task_alloc();
  sub_23BB4554C();
  v6[6] = sub_23BB4553C();
  uint64_t v13 = sub_23BB4552C();
  v6[7] = v13;
  v6[8] = v7;
  return MEMORY[0x270FA2498](sub_23BB2E34C, v13, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_23BB2E34C()
{
  OUTLINED_FUNCTION_5();
  sub_23BB4487C();
  v0[9] = sub_23BB4486C();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_2();
  v0[10] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23BB2E3FC;
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  return v7(v2, v4, v5, v3);
}

uint64_t sub_23BB2E3FC()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_7();
  *uint64_t v5 = v4;
  v3[11] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v11 = v3[7];
    uint64_t v12 = v3[8];
    uint64_t v13 = sub_23BB2E59C;
  }
  else
  {
    swift_release();
    uint64_t v11 = v3[7];
    uint64_t v12 = v3[8];
    uint64_t v13 = sub_23BB2E4E8;
  }
  return MEMORY[0x270FA2498](v13, v11, v12, v6, v7, v8, v9, v10);
}

uint64_t sub_23BB2E4E8()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  uint64_t v2 = sub_23BB4484C();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v2);
  type metadata accessor for SuggestedIntent();
  sub_23BB2DBC8(v1);
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_23BB2E59C()
{
  OUTLINED_FUNCTION_5();
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23BB2E610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_23BB4556C();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_23BB2F17C(a1, &qword_268A7C878);
  }
  else
  {
    sub_23BB4555C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23BB4552C();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_23BB2E758()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C878);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v22 = (uint64_t)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA30);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23BB4484C();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v21 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA40);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_23BB48300;
  *(void *)(v12 + 56) = MEMORY[0x263F8D310];
  *(void *)(v12 + 32) = 0xD00000000000002ALL;
  *(void *)(v12 + 40) = 0x800000023BB4A500;
  sub_23BB4576C();
  swift_bridgeObjectRelease();
  type metadata accessor for SuggestedIntent();
  sub_23BB2DB8C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_23BB2F17C((uint64_t)v4, &qword_268A7CA30);
  }
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v11, v4, v5);
  uint64_t v15 = sub_23BB4556C();
  uint64_t v16 = v22;
  __swift_storeEnumTagSinglePayload(v22, 1, 1, v15);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  sub_23BB4554C();
  uint64_t v17 = sub_23BB4553C();
  unint64_t v18 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = MEMORY[0x263F8F500];
  *(void *)(v19 + 16) = v17;
  *(void *)(v19 + 24) = v20;
  v14((char *)(v19 + v18), v9, v5);
  sub_23BB2E610(v16, (uint64_t)&unk_268A7CA50, v19);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

uint64_t sub_23BB2EA7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  sub_23BB4554C();
  v4[3] = sub_23BB4553C();
  uint64_t v11 = sub_23BB4552C();
  v4[4] = v11;
  v4[5] = v5;
  return MEMORY[0x270FA2498](sub_23BB2EB14, v11, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23BB2EB14()
{
  OUTLINED_FUNCTION_5();
  sub_23BB4487C();
  v0[6] = sub_23BB4486C();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_2();
  v0[7] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23BB2EBC0;
  uint64_t v2 = v0[2];
  return v4(v2);
}

uint64_t sub_23BB2EBC0()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_7();
  *uint64_t v5 = v4;
  v3[8] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v11 = v3[4];
    uint64_t v12 = v3[5];
    uint64_t v13 = sub_23BB2ED0C;
  }
  else
  {
    swift_release();
    uint64_t v11 = v3[4];
    uint64_t v12 = v3[5];
    uint64_t v13 = sub_23BB2ECAC;
  }
  return MEMORY[0x270FA2498](v13, v11, v12, v6, v7, v8, v9, v10);
}

uint64_t sub_23BB2ECAC()
{
  OUTLINED_FUNCTION_5();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23BB2ED0C()
{
  OUTLINED_FUNCTION_5();
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23BB2ED80()
{
  return sub_23BB2EECC(sub_23BB2E044);
}

uint64_t objectdestroyTm()
{
  type metadata accessor for SuggestedIntent();
  OUTLINED_FUNCTION_3_3();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_2();
  v7();
  uint64_t v8 = v0 + v4 + *(int *)(v1 + 44);
  uint64_t v9 = sub_23BB4484C();
  if (!OUTLINED_FUNCTION_8_2(v9))
  {
    OUTLINED_FUNCTION_4();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA38);
  swift_release();

  return MEMORY[0x270FA0238](v0, v4 + v6, v3 | 7);
}

uint64_t sub_23BB2EEB4()
{
  return sub_23BB2EECC((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23BB2E758);
}

uint64_t sub_23BB2EECC(uint64_t (*a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = type metadata accessor for SuggestedIntent();
  OUTLINED_FUNCTION_2_3(v4);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a1(v6, v2, v3);
}

uint64_t sub_23BB2EF44()
{
  uint64_t v1 = sub_23BB4484C();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 32) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_23BB2EFEC(uint64_t a1)
{
  uint64_t v4 = sub_23BB4484C();
  OUTLINED_FUNCTION_2_3(v4);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_23BB2F0B8;
  return sub_23BB2EA7C(a1, v6, v7, v8);
}

uint64_t sub_23BB2F0B8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_7();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_23BB2F17C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_2();
  v3();
  return a1;
}

uint64_t sub_23BB2F1D0()
{
  type metadata accessor for SuggestedIntent();
  OUTLINED_FUNCTION_3_3();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_2();
  v7();
  uint64_t v8 = v0 + v4 + *(int *)(v1 + 44);
  uint64_t v9 = sub_23BB4484C();
  if (!OUTLINED_FUNCTION_8_2(v9))
  {
    OUTLINED_FUNCTION_4();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA38);
  swift_release();

  return MEMORY[0x270FA0238](v0, v4 + v6, v3 | 7);
}

uint64_t sub_23BB2F2F0(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = type metadata accessor for SuggestedIntent();
  OUTLINED_FUNCTION_2_3(v6);
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = (uint64_t)v1 + ((*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_23BB2F53C;
  return sub_23BB2E280(a1, v8, v9, v10, v4, v5);
}

uint64_t sub_23BB2F3D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BB2F440()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return swift_task_alloc();
}

uint64_t sub_23BB2F560(uint64_t a1)
{
  return sub_23BB182D0(a1, qword_268A7D840, MEMORY[0x263F51858]);
}

uint64_t AppIntent.requestConfirmation<A>(conditions:actionName:dialog:showDialogAsPrompt:content:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 80) = v25;
  *(void *)(v9 + 88) = v8;
  *(void *)(v9 + 64) = a8;
  *(void *)(v9 + 72) = v24;
  *(void *)(v9 + 48) = a6;
  *(void *)(v9 + 56) = a7;
  *(unsigned char *)(v9 + 208) = a4;
  *(void *)(v9 + 32) = a3;
  *(void *)(v9 + 40) = a5;
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA70);
  *(void *)(v9 + 96) = v10;
  OUTLINED_FUNCTION_6(v10);
  *(void *)(v9 + 104) = v11;
  *(void *)(v9 + 112) = OUTLINED_FUNCTION_8();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA78);
  *(void *)(v9 + 120) = v12;
  OUTLINED_FUNCTION_6(v12);
  *(void *)(v9 + 128) = v13;
  *(void *)(v9 + 136) = OUTLINED_FUNCTION_8();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  OUTLINED_FUNCTION_22(v14);
  *(void *)(v9 + 144) = OUTLINED_FUNCTION_8();
  uint64_t v15 = sub_23BB445DC();
  *(void *)(v9 + 152) = v15;
  OUTLINED_FUNCTION_6(v15);
  *(void *)(v9 + 160) = v16;
  *(void *)(v9 + 168) = OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](sub_23BB2F6B0, 0, 0, v17, v18, v19, v20, v21);
}

uint64_t sub_23BB2F6B0()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 152);
  sub_23BB2FD48(*(void *)(v0 + 32), v1);
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    uint64_t v3 = *(void *)(v0 + 64);
    uint64_t v5 = *(void *)(v0 + 40);
    uint64_t v4 = *(void *)(v0 + 48);
    uint64_t v6 = *(void *)(v0 + 16);
    sub_23BB2FDB0(*(void *)(v0 + 144));
    sub_23BB2FEE0(v6, v5, v4, v3);
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v7;
    uint64_t v8 = sub_23BB2FFA8(&qword_268A7CA80, &qword_268A7CA70);
    void *v7 = v0;
    v7[1] = sub_23BB2FA90;
    uint64_t v9 = *(void *)(v0 + 112);
    uint64_t v10 = *(void *)(v0 + 96);
    uint64_t v11 = *(void *)(v0 + 72);
    uint64_t v12 = *(void *)(v0 + 56);
    uint64_t v14 = *(void *)(v0 + 16);
    uint64_t v13 = *(void *)(v0 + 24);
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v16 = *(void *)(v0 + 168);
    uint64_t v17 = *(void *)(v0 + 64);
    uint64_t v19 = *(void *)(v0 + 40);
    uint64_t v18 = *(void *)(v0 + 48);
    uint64_t v20 = *(void *)(v0 + 16);
    (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 160) + 32))(v16, *(void *)(v0 + 144), *(void *)(v0 + 152));
    sub_23BB2FE10(v20, v16, v19, v18, v17);
    uint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v21;
    uint64_t v8 = sub_23BB2FFA8(&qword_268A7CA88, &qword_268A7CA78);
    void *v21 = v0;
    v21[1] = sub_23BB2F8C0;
    uint64_t v9 = *(void *)(v0 + 136);
    uint64_t v10 = *(void *)(v0 + 120);
    uint64_t v11 = *(void *)(v0 + 72);
    uint64_t v12 = *(void *)(v0 + 56);
    uint64_t v15 = *(unsigned __int8 *)(v0 + 208);
    uint64_t v14 = *(void *)(v0 + 16);
    uint64_t v13 = *(void *)(v0 + 24);
  }
  return MEMORY[0x270EE0D00](v9, v13, v15, v14, v12, v10, v11, v8);
}

uint64_t sub_23BB2F8C0()
{
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  void *v3 = v2;
  uint64_t v5 = v4[17];
  uint64_t v6 = v4[16];
  uint64_t v7 = v4[15];
  uint64_t v8 = *v1;
  OUTLINED_FUNCTION_12_0();
  *uint64_t v9 = v8;
  *(void *)(v10 + 184) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  if (v0) {
    uint64_t v16 = sub_23BB2FC30;
  }
  else {
    uint64_t v16 = sub_23BB2FA00;
  }
  return MEMORY[0x270FA2498](v16, 0, 0, v11, v12, v13, v14, v15);
}

uint64_t sub_23BB2FA00()
{
  OUTLINED_FUNCTION_13_2();
  uint64_t v1 = OUTLINED_FUNCTION_6_2();
  v2(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_23BB2FA90()
{
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_12_0();
  *uint64_t v4 = v3;
  uint64_t v6 = v5[14];
  uint64_t v7 = v5[13];
  uint64_t v8 = v5[12];
  uint64_t v9 = *v1;
  OUTLINED_FUNCTION_12_0();
  *uint64_t v10 = v9;
  *(void *)(v3 + 200) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_23BB2FCC0, 0, 0, v11, v12, v13, v14, v15);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = *(uint64_t (**)(void))(v9 + 8);
    return v16();
  }
}

uint64_t sub_23BB2FC30()
{
  OUTLINED_FUNCTION_13_2();
  uint64_t v1 = OUTLINED_FUNCTION_6_2();
  v2(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_23BB2FCC0()
{
  OUTLINED_FUNCTION_13_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23BB2FD48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BB2FDB0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23BB2FE10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_15();
  uint64_t v13 = v12 - v11;
  v14();
  sub_23BB30234(a1, a2, v13, a5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v13, a5);
}

uint64_t sub_23BB2FEE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_15();
  uint64_t v11 = v10 - v9;
  v12();
  sub_23BB2FFF8(a1, v11, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v11, a4);
}

uint64_t sub_23BB2FFA8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_23BB2FFF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_23BB4479C();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_7_3();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v12 = OUTLINED_FUNCTION_22(v11);
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = OUTLINED_FUNCTION_17();
  uint64_t v14 = OUTLINED_FUNCTION_22(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_14();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v19 = OUTLINED_FUNCTION_22(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v3, a2, a3);
  sub_23BB1D7D8();
  sub_23BB1D7E0();
  uint64_t v20 = sub_23BB445DC();
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v4, a1, v7);
  sub_23BB4478C();
  sub_23BB1DF74();
  sub_23BB1DFC0();
  OUTLINED_FUNCTION_10_3();
  return OUTLINED_FUNCTION_14_2();
}

uint64_t sub_23BB30234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_23BB4479C();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_7_3();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C5A0);
  uint64_t v12 = OUTLINED_FUNCTION_22(v11);
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = OUTLINED_FUNCTION_17();
  uint64_t v14 = OUTLINED_FUNCTION_22(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_15();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  uint64_t v22 = OUTLINED_FUNCTION_22(v21);
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_15_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v20, a3, a4);
  sub_23BB1D7D8();
  sub_23BB1D7E0();
  uint64_t v23 = sub_23BB445DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v5, a2, v23);
  __swift_storeEnumTagSinglePayload(v5, 0, 1, v23);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v4, a1, v7);
  sub_23BB4478C();
  sub_23BB1DF74();
  sub_23BB1DFC0();
  OUTLINED_FUNCTION_10_3();
  return OUTLINED_FUNCTION_14_2();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return v0 - 81;
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return sub_23BB4475C();
}

uint64_t PlaybackButton.init<A>(interval:state:intent:systemImage:alignment:)(uint64_t a1)
{
  OUTLINED_FUNCTION_0();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_7_4(v3, v4, v5, v6, v7, v8, v9, v10, v25);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_9_3();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA90);
  MEMORY[0x270FA5388](v12 - 8);
  OUTLINED_FUNCTION_2_4();
  sub_23BB27530();
  if (OUTLINED_FUNCTION_12())
  {
    sub_23BB30994(a1, v1, &qword_268A7CA90);
    uint64_t v13 = OUTLINED_FUNCTION_5_1();
    v14(v13);
    uint64_t v15 = OUTLINED_FUNCTION_4_3();
    v16(v15);
    OUTLINED_FUNCTION_12_2();
    uint64_t v17 = swift_allocObject();
    uint64_t v18 = OUTLINED_FUNCTION_3_4(v17);
    v19(v18);
    OUTLINED_FUNCTION_11_2();
    sub_23BB44BEC();
    uint64_t v20 = OUTLINED_FUNCTION_8_3();
    v21(v20);
    uint64_t v22 = OUTLINED_FUNCTION_13_3();
    v23(v22);
    return sub_23BB30C74(a1, &qword_268A7CA90);
  }
  else
  {
    uint64_t result = OUTLINED_FUNCTION_10_4();
    __break(1u);
  }
  return result;
}

uint64_t sub_23BB306F0()
{
  return sub_23BB30C38();
}

uint64_t sub_23BB30710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_23BB4554C();
  v6[5] = sub_23BB4553C();
  uint64_t v8 = sub_23BB4552C();
  return MEMORY[0x270FA2498](sub_23BB278A8, v8, v7, v7, v9, v10, v11, v12);
}

uint64_t PlaybackButton.init<A>(interval:state:intent:playSystemImage:pauseSystemImage:)(uint64_t a1)
{
  OUTLINED_FUNCTION_0();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_7_4(v3, v4, v5, v6, v7, v8, v9, v10, v25);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_9_3();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCDC0);
  MEMORY[0x270FA5388](v12 - 8);
  OUTLINED_FUNCTION_2_4();
  sub_23BB27530();
  if (OUTLINED_FUNCTION_12())
  {
    sub_23BB30994(a1, v1, &qword_26ADCCDC0);
    uint64_t v13 = OUTLINED_FUNCTION_5_1();
    v14(v13);
    uint64_t v15 = OUTLINED_FUNCTION_4_3();
    v16(v15);
    OUTLINED_FUNCTION_12_2();
    uint64_t v17 = swift_allocObject();
    uint64_t v18 = OUTLINED_FUNCTION_3_4(v17);
    v19(v18);
    OUTLINED_FUNCTION_11_2();
    sub_23BB44BFC();
    uint64_t v20 = OUTLINED_FUNCTION_8_3();
    v21(v20);
    uint64_t v22 = OUTLINED_FUNCTION_13_3();
    v23(v22);
    return sub_23BB30C74(a1, &qword_26ADCCDC0);
  }
  else
  {
    uint64_t result = OUTLINED_FUNCTION_10_4();
    __break(1u);
  }
  return result;
}

uint64_t sub_23BB30994(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23BB309F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C878);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_23BB4556C();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  sub_23BB4554C();
  uint64_t v18 = sub_23BB4553C();
  unint64_t v19 = (*(unsigned __int8 *)(v10 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v20 = (char *)swift_allocObject();
  uint64_t v21 = MEMORY[0x263F8F500];
  *((void *)v20 + 2) = v18;
  *((void *)v20 + 3) = v21;
  *((void *)v20 + 4) = a2;
  *((void *)v20 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v20[v19], (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  sub_23BB32594((uint64_t)v16, a5, (uint64_t)v20);
  return swift_release();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_23BB30C18()
{
  return sub_23BB30C38();
}

uint64_t sub_23BB30C38()
{
  OUTLINED_FUNCTION_1_0();
  return sub_23BB309F8(v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)), v2, v3, v4, v5);
}

uint64_t sub_23BB30C74(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23BB30CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_23BB4554C();
  v6[5] = sub_23BB4553C();
  uint64_t v8 = sub_23BB4552C();
  return MEMORY[0x270FA2498](sub_23BB2C4F8, v8, v7, v7, v9, v10, v11, v12);
}

uint64_t sub_23BB30D70()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_14_3();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23BB2C4FC;
  uint64_t v2 = OUTLINED_FUNCTION_6_3();
  return sub_23BB30CD0(v2, v3, v4, v5, v6, v7);
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v1 = *(void *)(v0 + 32);
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 48) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_23BB30ECC()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_14_3();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23BB27F08;
  uint64_t v2 = OUTLINED_FUNCTION_6_3();
  return sub_23BB30710(v2, v3, v4, v5, v6, v7);
}

uint64_t OUTLINED_FUNCTION_7_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 192) = (char *)&a9 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  return MEMORY[0x270EFFBC8](0);
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return sub_23BB4568C();
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return *(void *)(v0 - 136);
}

uint64_t Scene._handle<A>(intent:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_23BB31774(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&unk_26EF0B7B8, (uint64_t)sub_23BB31A38, (void (*)(uint64_t, void *, uint64_t, uint64_t))sub_23BB34CE4);
}

uint64_t sub_23BB3106C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for _AppIntentExecution();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23BB44A3C();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v27 - v12;
  sub_23BB4452C();
  sub_23BB4450C();
  sub_23BB4451C();
  swift_release();
  if (v30)
  {
    sub_23BB272C0(&v29, (uint64_t)v31);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, a1, v7);
    sub_23BB31D14((uint64_t)v31, (uint64_t)&v29);
    uint64_t v14 = (uint64_t)&v6[*(int *)(v4 + 20)];
    *(void *)(v14 + 32) = 0;
    *(_OWORD *)uint64_t v14 = 0u;
    *(_OWORD *)(v14 + 16) = 0u;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v6, v13, v7);
    sub_23BB30C74(v14, &qword_268A7CAC8);
    sub_23BB272C0(&v29, v14);
    sub_23BB31B98((uint64_t)v6, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
  }
  else
  {
    sub_23BB30C74((uint64_t)&v29, &qword_268A7CAC8);
    if (qword_268A7C4C0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_23BB44AFC();
    __swift_project_value_buffer(v17, (uint64_t)qword_268A7D840);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
    uint64_t v18 = sub_23BB44ADC();
    os_log_type_t v19 = sub_23BB4558C();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v28 = a2;
      uint64_t v22 = v21;
      v31[0] = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v27 = v20 + 4;
      sub_23BB31CC4();
      uint64_t v23 = sub_23BB456EC();
      *(void *)&long long v29 = sub_23BB39318(v23, v24, v31);
      sub_23BB455CC();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      _os_log_impl(&dword_23BB16000, v18, v19, "Failed to find contents for %s", v20, 0xCu);
      swift_arrayDestroy();
      uint64_t v25 = v22;
      a2 = v28;
      MEMORY[0x23ECCFAB0](v25, -1, -1);
      MEMORY[0x23ECCFAB0](v20, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    }

    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v15, v16, 1, v4);
}

uint64_t sub_23BB3143C(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v25 = a3;
  uint64_t v26 = a2;
  v23[1] = a5;
  uint64_t v24 = sub_23BB4443C();
  uint64_t v7 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v9 = (char *)v23 - v8;
  uint64_t v10 = sub_23BB455BC();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v23 - v13;
  uint64_t v15 = *(void *)(a4 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v12);
  uint64_t v18 = (char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v23 - v19;
  uint64_t v21 = type metadata accessor for _AppIntentExecution();
  sub_23BB31C5C(v5 + *(int *)(v21 + 20), (uint64_t)v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CAC8);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, a4);
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v14, a4);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v20, a4);
    sub_23BB4442C();
    v26(v9);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v20, a4);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, a4);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
}

uint64_t View._handle<A>(intent:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_23BB31774(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&unk_26EF0B7E0, (uint64_t)sub_23BB31A38, (void (*)(uint64_t, void *, uint64_t, uint64_t))sub_23BB34CFC);
}

uint64_t sub_23BB31774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t, void *, uint64_t, uint64_t))
{
  if (qword_26ADCCFA8 != -1) {
    swift_once();
  }
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a4;
  void v16[3] = a5;
  v16[4] = a6;
  v16[5] = a7;
  v16[6] = a2;
  v16[7] = a3;
  swift_retain();
  a10(a9, v16, a4, a6);

  return swift_release();
}

uint64_t sub_23BB31870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(char *))
{
  uint64_t v24 = a8;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CAC0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for _AppIntentExecution();
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BB3106C(a1, (uint64_t)v17);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18) == 1) {
    return sub_23BB30C74((uint64_t)v17, &qword_268A7CAC0);
  }
  uint64_t v22 = sub_23BB31B98((uint64_t)v17, (uint64_t)v20);
  MEMORY[0x270FA5388](v22);
  *(&v23 - 6) = a4;
  *(&v23 - 5) = a5;
  *(&v23 - 4) = a6;
  *(&v23 - 3) = a7;
  *(&v23 - 2) = a2;
  *(&v23 - 1) = a3;
  sub_23BB3143C(a5, v24, (uint64_t)(&v23 - 8), a5, a7);
  return sub_23BB31C00((uint64_t)v20);
}

uint64_t sub_23BB31A00()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_23BB31A38(uint64_t a1)
{
  return sub_23BB31A50(a1, (void (*)(char *))sub_23BB31BFC);
}

uint64_t sub_23BB31A50(uint64_t a1, void (*a2)(char *))
{
  return sub_23BB31870(a1, v2[6], v2[7], v2[2], v2[3], v2[4], v2[5], a2);
}

uint64_t sub_23BB31A78()
{
  return get_witness_table_7SwiftUI5SceneRz10AppIntents0D6IntentRd__r__lqd0__AaBHD3_AaBPAAE25onConnectionOptionPayload_7performQrqd__m_y0J0Qyd__ct5UIKit07UIScenehI10DefinitionRd__lFQOyx_01_de1_aB00N0OQo_HOTm();
}

unint64_t sub_23BB31A90()
{
  unint64_t result = qword_268A7CAB8;
  if (!qword_268A7CAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7CAB8);
  }
  return result;
}

uint64_t sub_23BB31ADC()
{
  return get_witness_table_7SwiftUI5SceneRz10AppIntents0D6IntentRd__r__lqd0__AaBHD3_AaBPAAE25onConnectionOptionPayload_7performQrqd__m_y0J0Qyd__ct5UIKit07UIScenehI10DefinitionRd__lFQOyx_01_de1_aB00N0OQo_HOTm();
}

uint64_t get_witness_table_7SwiftUI5SceneRz10AppIntents0D6IntentRd__r__lqd0__AaBHD3_AaBPAAE25onConnectionOptionPayload_7performQrqd__m_y0J0Qyd__ct5UIKit07UIScenehI10DefinitionRd__lFQOyx_01_de1_aB00N0OQo_HOTm()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for _AppIntentExecution()
{
  uint64_t result = qword_268A7CAD8;
  if (!qword_268A7CAD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23BB31B98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _AppIntentExecution();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BB31C00(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for _AppIntentExecution();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23BB31C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CAC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23BB31CC4()
{
  unint64_t result = qword_268A7CAD0;
  if (!qword_268A7CAD0)
  {
    sub_23BB44A3C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7CAD0);
  }
  return result;
}

uint64_t sub_23BB31D14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23BB31D78()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t *sub_23BB31DA0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23BB44A3C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8 + 24);
    if (v11)
    {
      uint64_t v12 = *((void *)v10 + 4);
      *((void *)v9 + 3) = v11;
      *((void *)v9 + 4) = v12;
      (**(void (***)(void))(v11 - 8))();
    }
    else
    {
      long long v14 = *((_OWORD *)v10 + 1);
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v14;
      *((void *)v9 + 4) = *((void *)v10 + 4);
    }
  }
  return a1;
}

uint64_t sub_23BB31EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23BB44A3C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t result = a1 + *(int *)(a2 + 20);
  if (*(void *)(result + 24))
  {
    return __swift_destroy_boxed_opaque_existential_1(result);
  }
  return result;
}

uint64_t sub_23BB31F40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BB44A3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 24);
  if (v10)
  {
    uint64_t v11 = *(void *)(v9 + 32);
    *(void *)(v8 + 24) = v10;
    *(void *)(v8 + 32) = v11;
    (**(void (***)(void))(v10 - 8))();
  }
  else
  {
    long long v12 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v12;
    *(void *)(v8 + 32) = *(void *)(v9 + 32);
  }
  return a1;
}

uint64_t sub_23BB32008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BB44A3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (long long *)(a2 + v7);
  uint64_t v10 = *((void *)v9 + 3);
  if (!*(void *)(a1 + v7 + 24))
  {
    if (v10)
    {
      *(void *)(v8 + 24) = v10;
      *(void *)(v8 + 32) = *((void *)v9 + 4);
      (**(void (***)(uint64_t, long long *))(v10 - 8))(v8, v9);
      return a1;
    }
LABEL_7:
    long long v11 = *v9;
    long long v12 = v9[1];
    *(void *)(v8 + 32) = *((void *)v9 + 4);
    *(_OWORD *)uint64_t v8 = v11;
    *(_OWORD *)(v8 + 16) = v12;
    return a1;
  }
  if (!v10)
  {
    __swift_destroy_boxed_opaque_existential_1(v8);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v8, (uint64_t *)v9);
  return a1;
}

uint64_t sub_23BB32100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BB44A3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  return a1;
}

uint64_t sub_23BB3218C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BB44A3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  if (*(void *)(a1 + v7 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + v7);
  }
  long long v9 = *(_OWORD *)(a2 + v7 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(v8 + 16) = v9;
  *(void *)(v8 + 32) = *(void *)(a2 + v7 + 32);
  return a1;
}

uint64_t sub_23BB32228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23BB3223C);
}

uint64_t sub_23BB3223C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23BB44A3C();
  OUTLINED_FUNCTION_0_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_23BB322D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23BB322EC);
}

void sub_23BB322EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_23BB44A3C();
  OUTLINED_FUNCTION_0_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = a2;
  }
}

uint64_t sub_23BB32378()
{
  uint64_t result = sub_23BB44A3C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23BB32410(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C878);
  uint64_t v11 = OUTLINED_FUNCTION_22(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_15();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_23BB4556C();
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v15);
  OUTLINED_FUNCTION_33();
  v16();
  sub_23BB4554C();
  uint64_t v17 = sub_23BB4553C();
  unint64_t v18 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v19 = (char *)swift_allocObject();
  uint64_t v20 = MEMORY[0x263F8F500];
  *((void *)v19 + 2) = v17;
  *((void *)v19 + 3) = v20;
  *((void *)v19 + 4) = a1;
  *((void *)v19 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v19[v18], v9, a1);
  sub_23BB32594(v14, (uint64_t)&unk_268A7CB18, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_23BB32594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BB4556C();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_23BB2F17C(a1, &qword_268A7C878);
  }
  else
  {
    sub_23BB4555C();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_9_2();
    v7();
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23BB4552C();
    swift_unknownObjectRelease();
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void Button.init<A>(intent:label:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  v27[1] = v8;
  v27[2] = v9;
  uint64_t v11 = v10;
  v27[0] = v12;
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v17);
  unint64_t v18 = (char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BB4457C();
  sub_23BB27530();
  if (OUTLINED_FUNCTION_12())
  {
    uint64_t v19 = (void *)v27[3];
    OUTLINED_FUNCTION_33();
    v23(v20, v21, v22);
    unint64_t v24 = (*(unsigned __int8 *)(v14 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v25 = (char *)swift_allocObject();
    *((void *)v25 + 2) = v7;
    *((void *)v25 + 3) = v5;
    *((void *)v25 + 4) = v3;
    *((void *)v25 + 5) = v1;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v25[v24], v18, v5);
    id v26 = v19;
    sub_23BB4532C();

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v11, v5);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    OUTLINED_FUNCTION_17_2();
    __break(1u);
  }
}

void sub_23BB328BC()
{
}

uint64_t sub_23BB328DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[3] = a6;
  v8[4] = a8;
  v8[2] = a4;
  sub_23BB4554C();
  v8[5] = sub_23BB4553C();
  uint64_t v10 = sub_23BB4552C();
  return MEMORY[0x270FA2498](sub_23BB34C54, v10, v9, v9, v11, v12, v13, v14);
}

void Button<>.init<A>(_:intent:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_33();
  v7();
  Button.init<A>(intent:label:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_0();
}

void Button<>.init<A, B>(_:intent:)()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_33();
  v1();
  Button.init<A>(intent:label:)();
  uint64_t v2 = OUTLINED_FUNCTION_23_2();
  v3(v2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_2();
  v4();
  OUTLINED_FUNCTION_5_0();
}

void Button.init<A>(role:intent:label:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = v1;
  uint64_t v34 = v3;
  uint64_t v35 = v4;
  uint64_t v6 = v5;
  uint64_t v32 = v7;
  uint64_t v33 = v8;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v31 = v13;
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14;
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](v18);
  uint64_t v19 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CAE8);
  uint64_t v21 = OUTLINED_FUNCTION_22(v20);
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_28_0();
  sub_23BB4457C();
  sub_23BB27530();
  if (OUTLINED_FUNCTION_12())
  {
    uint64_t v22 = v36;
    sub_23BB32DD0(v12, v0);
    OUTLINED_FUNCTION_33();
    v23();
    uint64_t v24 = *(unsigned __int8 *)(v15 + 80);
    uint64_t v29 = v10;
    uint64_t v30 = v12;
    uint64_t v25 = (v24 + 48) & ~v24;
    id v26 = (char *)swift_allocObject();
    uint64_t v27 = v35;
    *((void *)v26 + 2) = v34;
    *((void *)v26 + 3) = v6;
    *((void *)v26 + 4) = v27;
    *((void *)v26 + 5) = v2;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v26[v25], v19, v6);
    id v28 = v22;
    sub_23BB4530C();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v29, v6);
    sub_23BB2F17C(v30, &qword_268A7CAE8);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    OUTLINED_FUNCTION_17_2();
    __break(1u);
  }
}

uint64_t sub_23BB32DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CAE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_23BB32E38()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v23 = v1;
  uint64_t v24 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C878);
  uint64_t v15 = OUTLINED_FUNCTION_22(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_15_0();
  uint64_t v16 = sub_23BB4556C();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v16);
  OUTLINED_FUNCTION_33();
  v17();
  sub_23BB4554C();
  uint64_t v18 = sub_23BB4553C();
  unint64_t v19 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v20 = (char *)swift_allocObject();
  uint64_t v21 = MEMORY[0x263F8F500];
  *((void *)v20 + 2) = v18;
  *((void *)v20 + 3) = v21;
  *((void *)v20 + 4) = v8;
  *((void *)v20 + 5) = v6;
  uint64_t v22 = v23;
  *((void *)v20 + 6) = v4;
  *((void *)v20 + 7) = v22;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v20[v19], (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  sub_23BB32594(v0, v24, (uint64_t)v20);
  swift_release();
  OUTLINED_FUNCTION_5_0();
}

uint64_t objectdestroyTm_1()
{
  OUTLINED_FUNCTION_4();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = ((v2 + 48) & ~v2) + *(void *)(v1 + 56);
  uint64_t v4 = v2 | 7;
  OUTLINED_FUNCTION_9_2();
  v5();

  return MEMORY[0x270FA0238](v0, v3, v4);
}

void sub_23BB33038()
{
}

void sub_23BB33058()
{
}

uint64_t sub_23BB33098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[3] = a6;
  v8[4] = a8;
  v8[2] = a4;
  sub_23BB4554C();
  v8[5] = sub_23BB4553C();
  uint64_t v10 = sub_23BB4552C();
  return MEMORY[0x270FA2498](sub_23BB33134, v10, v9, v9, v11, v12, v13, v14);
}

uint64_t sub_23BB33134()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 24);
  swift_release();
  sub_23BB32410(v2, v1);
  OUTLINED_FUNCTION_21();
  return v3();
}

void Button<>.init<A>(_:role:intent:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_16();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CAE8);
  uint64_t v5 = OUTLINED_FUNCTION_22(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_28_0();
  sub_23BB32DD0(v2, v0);
  OUTLINED_FUNCTION_33();
  v6();
  Button.init<A>(role:intent:label:)();
  uint64_t v7 = OUTLINED_FUNCTION_24_2();
  v8(v7);
  sub_23BB2F17C(v2, &qword_268A7CAE8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_23BB33300@<X0>(uint64_t a1@<X8>)
{
  return sub_23BB27A64(a1);
}

void Button<>.init<A, B>(_:role:intent:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_15_0();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CAE8);
  uint64_t v5 = OUTLINED_FUNCTION_22(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_16();
  sub_23BB32DD0(v2, v0);
  OUTLINED_FUNCTION_33();
  v6();
  OUTLINED_FUNCTION_25_2();
  Button.init<A>(role:intent:label:)();
  uint64_t v7 = OUTLINED_FUNCTION_24_2();
  v8(v7);
  sub_23BB2F17C(v2, &qword_268A7CAE8);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_2();
  v9();
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_23BB3348C@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t))(v5 + 16))(v4 - v3);
  uint64_t result = sub_23BB4511C();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8 & 1;
  *(void *)(a1 + 24) = v9;
  return result;
}

uint64_t sub_23BB3353C@<X0>(uint64_t a1@<X8>)
{
  return sub_23BB3348C(a1);
}

void Button<>.init<A>(_:systemImage:role:intent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v33 = v25;
  OUTLINED_FUNCTION_0();
  uint64_t v27 = v26;
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_15_0();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CAE8);
  uint64_t v30 = OUTLINED_FUNCTION_22(v29);
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_13_4(v31, v33);
  OUTLINED_FUNCTION_33();
  v32();
  __swift_instantiateConcreteTypeFromMangledName(qword_26ADCCF20);
  sub_23BB33784();
  OUTLINED_FUNCTION_19_2();
  Button.init<A>(role:intent:label:)();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v22, a21);
  sub_23BB2F17C(v24, &qword_268A7CAE8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_23BB336DC()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  return sub_23BB4527C();
}

uint64_t sub_23BB33770()
{
  return sub_23BB336DC();
}

unint64_t sub_23BB33784()
{
  unint64_t result = qword_26ADCCF18;
  if (!qword_26ADCCF18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26ADCCF20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCF18);
  }
  return result;
}

void Button<>.init<A, B>(_:systemImage:role:intent:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v15 = v4;
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_15_0();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CAE8);
  uint64_t v10 = OUTLINED_FUNCTION_22(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_15();
  sub_23BB32DD0(v5, v12 - v11);
  OUTLINED_FUNCTION_33();
  v13();
  __swift_instantiateConcreteTypeFromMangledName(qword_26ADCCF20);
  sub_23BB33784();
  Button.init<A>(role:intent:label:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v3, v1);
  sub_23BB2F17C(v15, &qword_268A7CAE8);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_2();
  v14();
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_23BB33988(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_bridgeObjectRetain();
  return sub_23BB4528C();
}

uint64_t sub_23BB33A78()
{
  return sub_23BB33988(*(void *)(v0 + 48));
}

void Button<>.init<A>(_:image:role:intent:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_15_0();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CAE8);
  uint64_t v4 = OUTLINED_FUNCTION_22(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_13_4(v5, v10);
  OUTLINED_FUNCTION_33();
  v6();
  __swift_instantiateConcreteTypeFromMangledName(qword_26ADCCF20);
  sub_23BB33784();
  OUTLINED_FUNCTION_19_2();
  Button.init<A>(role:intent:label:)();
  uint64_t v7 = OUTLINED_FUNCTION_23_2();
  v8(v7);
  sub_23BB2F17C(v1, &qword_268A7CAE8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23BB44A7C();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_2();
  v9();
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_23BB33C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = sub_23BB44A7C();
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_23BB4529C();
}

uint64_t sub_23BB33D20()
{
  return sub_23BB33C14(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

void Button<>.init<A, B>(_:image:role:intent:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_15_0();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CAE8);
  uint64_t v11 = OUTLINED_FUNCTION_22(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_16();
  sub_23BB32DD0(v6, v0);
  OUTLINED_FUNCTION_33();
  v12();
  __swift_instantiateConcreteTypeFromMangledName(qword_26ADCCF20);
  sub_23BB33784();
  OUTLINED_FUNCTION_25_2();
  Button.init<A>(role:intent:label:)();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v4, v2);
  sub_23BB2F17C(v6, &qword_268A7CAE8);
  sub_23BB44A7C();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_2();
  v13();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_2();
  v14();
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_23BB33EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BB44A7C();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a2, v6);
  return sub_23BB452AC();
}

uint64_t sub_23BB34078()
{
  return sub_23BB33EF0(v0[6], v0[7], v0[2]);
}

uint64_t sub_23BB3408C()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_26_2();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB34C5C;
  uint64_t v3 = OUTLINED_FUNCTION_1_1();
  return sub_23BB33098(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23BB34158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[7] = a5;
  v6[8] = a6;
  v6[6] = a4;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  uint64_t v7 = sub_23BB455BC();
  v6[9] = v7;
  v6[10] = *(void *)(v7 - 8);
  v6[11] = swift_task_alloc();
  sub_23BB4554C();
  v6[12] = sub_23BB4553C();
  uint64_t v14 = sub_23BB4552C();
  v6[13] = v14;
  v6[14] = v8;
  return MEMORY[0x270FA2498](sub_23BB342C8, v14, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_23BB342C8()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[15] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23BB34368;
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[8];
  return MEMORY[0x270EE0CF0](v2, 1, v3, v4);
}

uint64_t sub_23BB34368()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_7();
  *uint64_t v5 = v4;
  v3[16] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v11 = v3[13];
    uint64_t v12 = v3[14];
    uint64_t v13 = sub_23BB344C4;
  }
  else
  {
    (*(void (**)(void, void))(v3[10] + 8))(v3[11], v3[9]);
    uint64_t v11 = v3[13];
    uint64_t v12 = v3[14];
    uint64_t v13 = sub_23BB34464;
  }
  return MEMORY[0x270FA2498](v13, v11, v12, v6, v7, v8, v9, v10);
}

uint64_t sub_23BB34464()
{
  OUTLINED_FUNCTION_5();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return v0();
}

uint64_t sub_23BB344C4()
{
  uint64_t v1 = *(void **)(v0 + 128);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CA40);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23BB48300;
  sub_23BB4562C();
  swift_getDynamicType();
  uint64_t v3 = sub_23BB457BC();
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  sub_23BB4548C();
  swift_getErrorValue();
  sub_23BB4571C();
  sub_23BB4548C();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = MEMORY[0x263F8D310];
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v5;
  sub_23BB4576C();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return v6();
}

uint64_t sub_23BB34648(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_23BB34724;
  return v6(a1);
}

uint64_t sub_23BB34724()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_7();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return v3();
}

uint64_t sub_23BB347E8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23BB34820(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_4_2(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_23BB348D0;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268A7CB00 + dword_268A7CB00);
  return v7(a1, v3);
}

uint64_t sub_23BB348D0()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_7();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return v3();
}

uint64_t sub_23BB34990()
{
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 48) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  swift_unknownObjectRelease();
  uint64_t v8 = OUTLINED_FUNCTION_13_1();
  v9(v8);

  return MEMORY[0x270FA0238](v0, v6, v7);
}

uint64_t sub_23BB34A20(uint64_t a1)
{
  uint64_t v3 = v1[4];
  uint64_t v4 = v1[5];
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = (void *)OUTLINED_FUNCTION_4_2(v9);
  *uint64_t v10 = v11;
  v10[1] = sub_23BB348D0;
  return sub_23BB34158(a1, v6, v7, v8, v3, v4);
}

uint64_t objectdestroy_5Tm_0()
{
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 64) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  swift_unknownObjectRelease();
  uint64_t v8 = OUTLINED_FUNCTION_13_1();
  v9(v8);

  return MEMORY[0x270FA0238](v0, v6, v7);
}

uint64_t sub_23BB34B88()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_26_2();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23BB34C5C;
  uint64_t v3 = OUTLINED_FUNCTION_1_1();
  return sub_23BB328DC(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t OUTLINED_FUNCTION_13_4@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return sub_23BB32DD0(v2, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0));
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25_2()
{
  return v0;
}

uint64_t sub_23BB34CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BB34D14(a1, a2, a3, a4, MEMORY[0x263F1B5A0]);
}

uint64_t sub_23BB34CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BB34D14(a1, a2, a3, a4, MEMORY[0x263F1B008]);
}

uint64_t sub_23BB34D14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(ValueMetadata *, uint64_t, uint64_t, uint64_t, ValueMetadata *, uint64_t, unint64_t))
{
  unint64_t v9 = sub_23BB31A90();

  return a5(&type metadata for Definition, a1, a2, a3, &type metadata for Definition, a4, v9);
}

uint64_t (*sub_23BB34DA0(uint64_t a1, uint64_t a2))(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_unknownObjectRetain();
  return sub_23BB355F8;
}

ValueMetadata *type metadata accessor for Definition()
{
  return &type metadata for Definition;
}

uint64_t sub_23BB34E1C()
{
  return sub_23BB34E84(&qword_268A7CB90);
}

uint64_t sub_23BB34E50()
{
  return sub_23BB34E84(&qword_268A7CB98);
}

uint64_t sub_23BB34E84(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_23BB44A3C();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23BB34EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(a1, a2, ObjectType, a4);
}

uint64_t sub_23BB34F28(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *))
{
  uint64_t v4 = a1;
  a3(&v4);

  return swift_release();
}

uint64_t (*sub_23BB34F74())@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v1 = off_26ADCCB40;
  uint64_t v0 = unk_26ADCCB48;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0;
  swift_retain();
  return sub_23BB350EC;
}

uint64_t sub_23BB34FE4@<X0>(void *a1@<X0>, uint64_t (*a2)(void, void)@<X1>, void *a3@<X8>)
{
  uint64_t v4 = a2(*a1, a1[1]);
  uint64_t v6 = v5;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v4;
  *(void *)(result + 24) = v6;
  *a3 = sub_23BB350F4;
  a3[1] = result;
  return result;
}

uint64_t sub_23BB35058(void (**a1)(uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  swift_retain();

  return sub_23BB34F28(a2, a3, v5);
}

uint64_t sub_23BB350B4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23BB350EC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_23BB34FE4(a1, *(uint64_t (**)(void, void))(v2 + 16), a2);
}

uint64_t sub_23BB350F4(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_23BB35120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[4] = a2;
  v8[5] = a3;
  v8[3] = a1;
  return MEMORY[0x270FA2498](sub_23BB35144, 0, 0, a4, a5, a6, a7, a8);
}

uint64_t sub_23BB35144()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CBA8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23BB483E0;
  sub_23BB35428();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  swift_retain();
  id v5 = sub_23BB35490((uint64_t)sub_23BB35468, v4);
  sub_23BB31A90();
  uint64_t v6 = sub_23BB44B0C();

  *(void *)(v3 + 32) = v6;
  sub_23BB454DC();
  uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
  return v7(v3);
}

unint64_t sub_23BB35428()
{
  unint64_t result = qword_268A7CBB0;
  if (!qword_268A7CBB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268A7CBB0);
  }
  return result;
}

uint64_t sub_23BB35468()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_23BB35490(uint64_t a1, uint64_t a2)
{
  v5[4] = a1;
  v5[5] = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_23BB35540;
  v5[3] = &block_descriptor;
  uint64_t v2 = _Block_copy(v5);
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_responderWithHandler_, v2);
  _Block_release(v2);
  swift_release();
  return v3;
}

void sub_23BB35540(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
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

uint64_t sub_23BB355C0()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23BB355F8(uint64_t a1, uint64_t a2)
{
  return sub_23BB34EC8(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_23BB35608@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.attributeSet.getter();
  *a1 = result;
  return result;
}

uint64_t sub_23BB35634(id *a1)
{
  id v1 = *a1;
  return EnvironmentValues.attributeSet.setter();
}

uint64_t sub_23BB35660@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.displayLocation.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_23BB3569C()
{
  return EnvironmentValues.displayLocation.setter();
}

uint64_t sub_23BB356D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.searchString.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23BB35700()
{
  return EnvironmentValues.searchString.setter();
}

uint64_t DisplayRepresentation.init<A>(content:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v37 = a3;
  uint64_t v40 = a1;
  uint64_t v34 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCA10);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v33 = v6;
  uint64_t v32 = sub_23BB449EC();
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_3();
  v31[1] = v7;
  sub_23BB446EC();
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v9;
  uint64_t v36 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_15();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_23BB4463C();
  MEMORY[0x270FA5388](v13 - 8);
  OUTLINED_FUNCTION_15();
  uint64_t v14 = sub_23BB448BC();
  OUTLINED_FUNCTION_0();
  uint64_t v38 = v15;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_15();
  uint64_t v19 = v18 - v17;
  OUTLINED_FUNCTION_0();
  uint64_t v21 = v20;
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)v31 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)v31 - v27;
  v40(v26);
  sub_23BB4494C();
  swift_allocObject();
  sub_23BB4493C();
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v25, v28, a2);
  uint64_t v40 = (void (*)(uint64_t))a2;
  sub_23BB264A4((uint64_t)v25, a2, v37);
  (*(void (**)(uint64_t, void, uint64_t))(v35 + 104))(v12, *MEMORY[0x263EFBA00], v36);
  sub_23BB448AC();
  sub_23BB35EFC(&qword_26ADCCF00, MEMORY[0x263EFBF50]);
  uint64_t v29 = v39;
  sub_23BB4492C();
  if (v29)
  {
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v19, v14);
  }
  else
  {
    sub_23BB449DC();
    uint64_t v39 = v14;
    __swift_storeEnumTagSinglePayload(v33, 1, 1, v32);
    sub_23BB4473C();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v19, v39);
  }
  return (*(uint64_t (**)(char *, void (*)(uint64_t)))(v21 + 8))(v28, v40);
}

void static DisplayRepresentation.view(from:attributeSet:displayLocation:searchString:)(uint64_t a1@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v4 = type metadata accessor for SharedIndexedViewFormatDecodable();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_15();
  uint64_t v7 = v6 - v5;
  sub_23BB4491C();
  swift_allocObject();
  sub_23BB4490C();
  sub_23BB35EFC(&qword_26ADCCA60, (void (*)(uint64_t))type metadata accessor for SharedIndexedViewFormatDecodable);
  sub_23BB448FC();
  if (v2)
  {
    swift_release();
    sub_23BB27148();
    swift_allocError();
    swift_willThrow();
  }
  else
  {
    sub_23BB31D14(v7, (uint64_t)v19);
    uint64_t v8 = v19[4];
    __swift_project_boxed_opaque_existential_1(v19, v19[3]);
    swift_getKeyPath();
    v11[0] = a1;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCAA0);
    uint64_t v17 = OUTLINED_FUNCTION_2_5();
    uint64_t v14 = *(void *)(v8 + 24);
    uint64_t v15 = sub_23BB35FAC(&qword_26ADCCA98, &qword_26ADCCAA0);
    uint64_t WitnessTable = swift_getWitnessTable();
    __swift_allocate_boxed_opaque_existential_1(v16);
    sub_23BB4517C();
    swift_release();
    __swift_project_boxed_opaque_existential_1(v16, v17);
    swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCA80);
    uint64_t v12 = OUTLINED_FUNCTION_2_5();
    sub_23BB35FAC(&qword_26ADCCA78, &qword_26ADCCA80);
    uint64_t v13 = swift_getWitnessTable();
    __swift_allocate_boxed_opaque_existential_1(v11);
    sub_23BB4517C();
    swift_release();
    __swift_project_boxed_opaque_existential_1(v11, v12);
    swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCA90);
    uint64_t v9 = OUTLINED_FUNCTION_2_5();
    uint64_t v10 = v20;
    v20[3] = v9;
    sub_23BB35FAC(&qword_26ADCCA88, &qword_26ADCCA90);
    uint64_t v10[4] = swift_getWitnessTable();
    __swift_allocate_boxed_opaque_existential_1(v10);
    swift_bridgeObjectRetain();
    sub_23BB4517C();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    sub_23BB26E78(v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  }
}

uint64_t sub_23BB35EFC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23BB35F44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.attributeSet.getter();
  *a1 = result;
  return result;
}

uint64_t sub_23BB35F7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.searchString.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23BB35FAC(unint64_t *a1, uint64_t *a2)
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

id sub_23BB35FFC()
{
  if (qword_268A7C500 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268A7C508;
  id v1 = (id)qword_268A7D878;
  if (v0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_268A7D880;
  uint64_t v3 = self;
  id v4 = v2;
  id result = objc_msgSend(v3, sel_clearColor);
  qword_268A7CC30 = (uint64_t)v1;
  *(void *)algn_268A7CC38 = v4;
  qword_268A7CC40 = (uint64_t)result;
  qword_268A7CC48 = 0;
  return result;
}

id static ShortcutsLinkStyle.automatic.getter()
{
  if (qword_268A7C4C8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_2((uint64_t)&qword_268A7CC30);
  id v1 = v0;

  return v3;
}

id sub_23BB36154()
{
  if (qword_268A7C508 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268A7C500;
  id v1 = (id)qword_268A7D880;
  if (v0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_268A7D878;
  id result = objc_msgSend(v2, sel_colorWithAlphaComponent_, 0.3);
  qword_268A7CC50 = (uint64_t)v1;
  *(void *)algn_268A7CC58 = v2;
  qword_268A7CC60 = (uint64_t)result;
  unk_268A7CC68 = 0x3FF0000000000000;
  return result;
}

id static ShortcutsLinkStyle.automaticOutline.getter()
{
  if (qword_268A7C4D0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_2((uint64_t)&qword_268A7CC50);
  id v1 = v0;

  return v3;
}

id sub_23BB3629C()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_whiteColor);
  id v2 = objc_msgSend(v0, sel_blackColor);
  id result = objc_msgSend(v0, sel_clearColor);
  qword_268A7CC70 = (uint64_t)v1;
  *(void *)algn_268A7CC78 = v2;
  qword_268A7CC80 = (uint64_t)result;
  unk_268A7CC88 = 0;
  return result;
}

id static ShortcutsLinkStyle.light.getter()
{
  if (qword_268A7C4D8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_2((uint64_t)&qword_268A7CC70);
  id v1 = v0;

  return v3;
}

void sub_23BB363A8()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_whiteColor);
  id v2 = objc_msgSend(v0, sel_blackColor);
  id v3 = objc_msgSend(v0, sel_blackColor);
  id v4 = objc_msgSend(v3, sel_colorWithAlphaComponent_, 0.3);

  qword_268A7CC90 = (uint64_t)v1;
  *(void *)algn_268A7CC98 = v2;
  qword_268A7CCA0 = (uint64_t)v4;
  unk_268A7CCA8 = 0x3FF0000000000000;
}

id static ShortcutsLinkStyle.lightOutline.getter()
{
  if (qword_268A7C4E0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_2((uint64_t)&qword_268A7CC90);
  id v1 = v0;

  return v3;
}

id sub_23BB364DC()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_blackColor);
  id v2 = objc_msgSend(v0, sel_whiteColor);
  id result = objc_msgSend(v0, sel_clearColor);
  qword_268A7CCB0 = (uint64_t)v1;
  *(void *)algn_268A7CCB8 = v2;
  qword_268A7CCC0 = (uint64_t)result;
  unk_268A7CCC8 = 0;
  return result;
}

id static ShortcutsLinkStyle.dark.getter()
{
  if (qword_268A7C4E8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_2((uint64_t)&qword_268A7CCB0);
  id v1 = v0;

  return v3;
}

void sub_23BB365E8()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_blackColor);
  id v2 = objc_msgSend(v0, sel_whiteColor);
  id v3 = objc_msgSend(v0, sel_whiteColor);
  id v4 = objc_msgSend(v3, sel_colorWithAlphaComponent_, 0.3);

  qword_268A7CCD0 = (uint64_t)v1;
  *(void *)algn_268A7CCD8 = v2;
  qword_268A7CCE0 = (uint64_t)v4;
  unk_268A7CCE8 = 0x3FF0000000000000;
}

id static ShortcutsLinkStyle.darkOutline.getter()
{
  if (qword_268A7C4F0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_2((uint64_t)&qword_268A7CCD0);
  id v1 = v0;

  return v3;
}

uint64_t ShortcutsLink.init(action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = swift_getKeyPath();
  *(void *)a3 = result;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(unsigned char *)(a3 + 32) = 0;
  *(void *)(a3 + 40) = a1;
  *(void *)(a3 + 48) = a2;
  return result;
}

uint64_t ShortcutsLink.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCC88) - 8;
  MEMORY[0x270FA5388](v77);
  OUTLINED_FUNCTION_3();
  uint64_t v76 = v3;
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CCF0) - 8;
  MEMORY[0x270FA5388](v71);
  OUTLINED_FUNCTION_3();
  uint64_t v69 = v4;
  uint64_t v79 = sub_23BB44C7C() - 8;
  MEMORY[0x270FA5388](v79);
  OUTLINED_FUNCTION_10();
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CCF8) - 8;
  MEMORY[0x270FA5388](v70);
  OUTLINED_FUNCTION_3();
  uint64_t v67 = v5;
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD00) - 8;
  MEMORY[0x270FA5388](v73);
  OUTLINED_FUNCTION_3();
  uint64_t v72 = v6;
  uint64_t v66 = sub_23BB44C5C();
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_15();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD08);
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_15();
  uint64_t v19 = v18 - v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD10);
  OUTLINED_FUNCTION_0_0();
  uint64_t v74 = v21;
  uint64_t v75 = v20;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_15();
  uint64_t v68 = v23 - v22;
  long long v24 = v1[1];
  long long v89 = *v1;
  long long v90 = v24;
  long long v91 = v1[2];
  uint64_t v92 = *((void *)v1 + 6);
  uint64_t v25 = swift_allocObject();
  long long v26 = v1[1];
  *(_OWORD *)(v25 + 16) = *v1;
  *(_OWORD *)(v25 + 32) = v26;
  *(_OWORD *)(v25 + 48) = v1[2];
  *(void *)(v25 + 64) = *((void *)v1 + 6);
  sub_23BB37F30((uint64_t)&v89);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD18);
  sub_23BB37FD0();
  sub_23BB4531C();
  sub_23BB44C4C();
  sub_23BB196A4(&qword_268A7CD38, &qword_268A7CD08);
  sub_23BB39F48(&qword_268A7CD40, MEMORY[0x263F18FD0]);
  sub_23BB4516C();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v66);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v19, v13);
  uint64_t v27 = &v2[*(int *)(v79 + 28)];
  uint64_t v28 = *MEMORY[0x263F19860];
  unsigned int v65 = *MEMORY[0x263F19860];
  uint64_t v29 = sub_23BB44EFC();
  OUTLINED_FUNCTION_2_0();
  uint64_t v64 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 104);
  v64(v27, v28, v29);
  __asm { FMOV            V0.2D, #13.0 }
  long long v63 = _Q0;
  *(_OWORD *)id v2 = _Q0;
  v93[0] = v89;
  v93[1] = v90;
  char v94 = v91;
  long long v86 = v89;
  long long v87 = v90;
  char v88 = v91;
  sub_23BB37F30((uint64_t)&v89);
  sub_23BB386C8((uint64_t)v93);
  sub_23BB38458((uint64_t)&v83);
  sub_23BB386C8((uint64_t)v93);
  sub_23BB386FC((uint64_t)&v89);
  uint64_t v36 = (void *)v83;
  uint64_t v37 = v84;

  uint64_t v38 = MEMORY[0x23ECCEFA0](v37);
  sub_23BB37F30((uint64_t)&v89);
  sub_23BB386C8((uint64_t)v93);
  sub_23BB38458((uint64_t)&v80);
  sub_23BB386C8((uint64_t)v93);
  sub_23BB386FC((uint64_t)&v89);
  uint64_t v39 = v80;
  uint64_t v40 = v81;

  sub_23BB44B4C();
  sub_23BB38740((uint64_t)v2, v67);
  double v41 = *(double *)&v83 * 0.5;
  sub_23BB38740((uint64_t)v2, v69);
  *(double *)(v69 + *(int *)(sub_23BB44C6C() + 20)) = v41;
  uint64_t v42 = v69 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD48) + 36);
  long long v43 = v84;
  *(_OWORD *)uint64_t v42 = v83;
  *(_OWORD *)(v42 + 16) = v43;
  *(void *)(v42 + 32) = v85;
  *(void *)(v69 + *(int *)(v71 + 60)) = v38;
  *(_WORD *)(v69 + *(int *)(v71 + 64)) = 256;
  uint64_t v44 = sub_23BB4539C();
  uint64_t v46 = v45;
  uint64_t v47 = v67 + *(int *)(v70 + 76);
  uint64_t v48 = (uint64_t *)(v47 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD50) + 36));
  *uint64_t v48 = v44;
  v48[1] = v46;
  sub_23BB387A4(v69, v47);
  sub_23BB3880C((uint64_t)v2);
  v64(&v2[*(int *)(v79 + 28)], v65, v29);
  *(_OWORD *)id v2 = v63;
  sub_23BB37F30((uint64_t)&v89);
  sub_23BB386C8((uint64_t)v93);
  sub_23BB38458((uint64_t)&v80);
  sub_23BB386C8((uint64_t)v93);
  sub_23BB386FC((uint64_t)&v89);
  uint64_t v49 = v80;
  uint64_t v50 = v81;

  uint64_t v51 = MEMORY[0x23ECCEFA0](v49);
  sub_23BB38740((uint64_t)v2, v76);
  *(void *)(v76 + *(int *)(v77 + 60)) = v51;
  *(_WORD *)(v76 + *(int *)(v77 + 64)) = 256;
  sub_23BB3880C((uint64_t)v2);
  uint64_t v52 = sub_23BB4539C();
  uint64_t v54 = v53;
  uint64_t v55 = v72 + *(int *)(v73 + 44);
  sub_23BB28D8C(v76, v55, &qword_26ADCCC88);
  uint64_t v56 = (uint64_t *)(v55 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD58) + 36));
  *uint64_t v56 = v52;
  v56[1] = v54;
  sub_23BB28D8C(v67, v72, &qword_268A7CCF8);
  sub_23BB24914(v76, &qword_26ADCCC88);
  sub_23BB24914(v67, &qword_268A7CCF8);
  uint64_t v57 = sub_23BB4539C();
  uint64_t v59 = v58;
  uint64_t v60 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD60) + 36);
  sub_23BB28D8C(v72, v60, &qword_268A7CD00);
  long long v61 = (uint64_t *)(v60 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD68) + 36));
  *long long v61 = v57;
  v61[1] = v59;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 16))(a1, v68, v75);
  sub_23BB24914(v72, &qword_268A7CD00);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v74 + 8))(v68, v75);
}

uint64_t sub_23BB36F40(uint64_t a1)
{
  return sub_23BB37A0C();
}

uint64_t sub_23BB36F78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v3 = sub_23BB44C7C();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (_OWORD *)((char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD28);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD98);
  uint64_t v11 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = a1;
  uint64_t v29 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CDA0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CDA8);
  sub_23BB39B40();
  sub_23BB39BB4();
  sub_23BB4526C();
  long long v31 = xmmword_23BB48510;
  uint64_t v32 = 0x4024000000000000;
  sub_23BB196A4(&qword_268A7CD30, &qword_268A7CD28);
  sub_23BB380E4();
  sub_23BB4515C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v14 = (char *)v6 + *(int *)(v4 + 28);
  uint64_t v15 = *MEMORY[0x263F19860];
  uint64_t v16 = sub_23BB44EFC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v14, v15, v16);
  __asm { FMOV            V0.2D, #13.0 }
  *uint64_t v6 = _Q0;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD18);
  uint64_t v23 = v28;
  uint64_t v24 = v28 + *(int *)(v22 + 36);
  sub_23BB38740((uint64_t)v6, v24);
  *(_WORD *)(v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCE70) + 36)) = 256;
  uint64_t v25 = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v23, v13, v27);
  sub_23BB3880C((uint64_t)v6);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v25);
}

uint64_t sub_23BB372D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&v35[0] = sub_23BB374E4();
  *((void *)&v35[0] + 1) = v3;
  sub_23BB39C60();
  uint64_t v4 = sub_23BB4511C();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_23BB450BC();
  uint64_t v9 = sub_23BB450EC();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  sub_23BB29568(v4, v6, v8);
  swift_bridgeObjectRelease();
  sub_23BB4508C();
  uint64_t v14 = sub_23BB450CC();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_23BB29568(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  long long v19 = *(_OWORD *)(a1 + 16);
  v35[0] = *(_OWORD *)a1;
  v35[1] = v19;
  char v36 = *(unsigned char *)(a1 + 32);
  sub_23BB37F30(a1);
  sub_23BB386C8((uint64_t)v35);
  sub_23BB38458((uint64_t)v34);
  sub_23BB386C8((uint64_t)v35);
  sub_23BB386FC(a1);
  uint64_t v21 = (void *)v34[0];
  uint64_t v20 = v34[1];

  MEMORY[0x23ECCEFA0](v20);
  uint64_t v22 = sub_23BB450DC();
  uint64_t v24 = v23;
  LOBYTE(v11) = v25;
  uint64_t v27 = v26;
  swift_release();
  sub_23BB29568(v14, v16, v18);
  swift_bridgeObjectRelease();
  LOBYTE(v20) = sub_23BB4507C();
  uint64_t result = sub_23BB44B2C();
  *(void *)a2 = v22;
  *(void *)(a2 + 8) = v24;
  *(unsigned char *)(a2 + 16) = v11 & 1;
  *(void *)(a2 + 24) = v27;
  *(unsigned char *)(a2 + 32) = v20;
  *(void *)(a2 + 40) = v29;
  *(void *)(a2 + 48) = v30;
  *(void *)(a2 + 56) = v31;
  *(void *)(a2 + 64) = v32;
  *(unsigned char *)(a2 + 72) = 0;
  return result;
}

uint64_t sub_23BB374E4()
{
  uint64_t v0 = self;
  uint64_t v1 = sub_23BB39E78(objc_msgSend(v0, sel_mainBundle), (SEL *)&selRef_localizedInfoDictionary);
  if (v1)
  {
    uint64_t v2 = v1;
  }
  else
  {
    uint64_t v2 = sub_23BB39E78(objc_msgSend(v0, sel_mainBundle), (SEL *)&selRef_infoDictionary);
    if (!v2)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      goto LABEL_9;
    }
  }
  uint64_t result = *MEMORY[0x263EFFB68];
  if (*MEMORY[0x263EFFB68])
  {
    uint64_t v4 = sub_23BB4545C();
    uint64_t v6 = v5;
    swift_bridgeObjectRetain();
    sub_23BB379A8(v4, v6, v2, &v13);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((void *)&v14 + 1))
    {
      swift_bridgeObjectRelease();
      sub_23BB39F38(&v13, &v15);
      goto LABEL_10;
    }
    sub_23BB379A8(0xD000000000000013, 0x800000023BB4A950, v2, &v15);
    swift_bridgeObjectRelease();
LABEL_9:
    sub_23BB24914((uint64_t)&v13, &qword_26ADCCEF8);
LABEL_10:
    uint64_t v7 = MEMORY[0x263F8D310];
    if (*((void *)&v16 + 1))
    {
      if (swift_dynamicCast())
      {
        unint64_t v9 = *((void *)&v13 + 1);
        uint64_t v8 = v13;
LABEL_15:
        type metadata accessor for AppSwiftUIBridge();
        id v10 = objc_msgSend(v0, sel_bundleForClass_, swift_getObjCClassFromMetadata());
        sub_23BB449AC();

        __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CDC8);
        uint64_t v11 = swift_allocObject();
        *(_OWORD *)(v11 + 16) = xmmword_23BB48300;
        *(void *)(v11 + 56) = v7;
        *(void *)(v11 + 64) = sub_23BB39EEC();
        *(void *)(v11 + 32) = v8;
        *(void *)(v11 + 40) = v9;
        uint64_t v12 = sub_23BB4546C();
        swift_bridgeObjectRelease();
        return v12;
      }
    }
    else
    {
      sub_23BB24914((uint64_t)&v15, &qword_26ADCCEF8);
    }
    uint64_t v8 = 0;
    unint64_t v9 = 0xE000000000000000;
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void sub_23BB37780(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_23BB4524C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v8 = *(_OWORD *)(a1 + 16);
  v17[0] = *(_OWORD *)a1;
  v17[1] = v8;
  char v18 = *(unsigned char *)(a1 + 32);
  sub_23BB37F30(a1);
  sub_23BB386C8((uint64_t)v17);
  sub_23BB38458((uint64_t)v16);
  sub_23BB386C8((uint64_t)v17);
  sub_23BB386FC(a1);
  unint64_t v9 = (void *)v16[1];
  id v10 = (void *)v16[2];
  uint64_t v11 = (void *)v16[0];
  sub_23BB39C20();
  type metadata accessor for AppSwiftUIBridge();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v13 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  long long v14 = sub_23BB4093C(0x74756374726F6853, 0xE900000000000073, v13, 0);

  if (v14)
  {
    id v15 = v14;
    sub_23BB4522C();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F1B4B8], v4);
    long long v14 = (void *)sub_23BB4525C();

    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  *a2 = v14;
}

double sub_23BB379A8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_23BB39CAC(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_23BB39544(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_23BB37A0C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CDD8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23BB44A2C();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(self, sel_mainBundle);
  sub_23BB39E08(v7);
  unint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  sub_23BB4562C();
  swift_bridgeObjectRelease();
  unint64_t v12 = 0xD000000000000019;
  unint64_t v13 = 0x800000023BB4A970;
  sub_23BB4548C();
  swift_bridgeObjectRelease();
  sub_23BB44A1C();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) == 1) {
    return sub_23BB24914((uint64_t)v2, &qword_268A7CDD8);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  id v9 = objc_msgSend(self, sel_sharedApplication);
  id v10 = (void *)sub_23BB44A0C();
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_23BB39F48(&qword_268A7C590, type metadata accessor for OpenExternalURLOptionsKey);
  sub_23BB453EC();
  uint64_t v11 = (void *)sub_23BB453CC();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_openURL_options_completionHandler_, v10, v11, 0);

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t View.shortcutsLinkStyle(_:)()
{
  return swift_release();
}

uint64_t sub_23BB37D84()
{
  sub_23BB39F90();

  return sub_23BB44E1C();
}

double sub_23BB37DCC@<D0>(uint64_t a1@<X8>)
{
  sub_23BB37D84();
  double result = v5;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(double *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23BB37E1C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  uint64_t v2 = *(void **)(a1 + 16);
  id v3 = *(id *)a1;
  id v4 = v1;
  id v5 = v2;
  return sub_23BB38130();
}

uint64_t sub_23BB37E7C()
{
  sub_23BB37EC4(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48));
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

void sub_23BB37EC4(void *a1, void *a2, void *a3, uint64_t a4, char a5)
{
  if (a5)
  {
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_23BB37F20()
{
  return sub_23BB36F40(v0 + 16);
}

uint64_t sub_23BB37F28@<X0>(uint64_t a1@<X8>)
{
  return sub_23BB36F78(*(void *)(v1 + 16), a1);
}

uint64_t sub_23BB37F30(uint64_t a1)
{
  return a1;
}

id sub_23BB37F74(void *a1, void *a2, void *a3, uint64_t a4, char a5)
{
  if (a5)
  {
    id v7 = a1;
    id v8 = a2;
    return a3;
  }
  else
  {
    return (id)swift_retain();
  }
}

unint64_t sub_23BB37FD0()
{
  unint64_t result = qword_268A7CD20;
  if (!qword_268A7CD20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7CD18);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7CD28);
    sub_23BB196A4(&qword_268A7CD30, &qword_268A7CD28);
    sub_23BB380E4();
    swift_getOpaqueTypeConformance2();
    sub_23BB196A4(&qword_26ADCCE68, &qword_26ADCCE70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7CD20);
  }
  return result;
}

unint64_t sub_23BB380E4()
{
  unint64_t result = qword_26ADCCC68;
  if (!qword_26ADCCC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCC68);
  }
  return result;
}

uint64_t sub_23BB38130()
{
  return sub_23BB44E2C();
}

id sub_23BB38180()
{
  if (qword_268A7C4C8 != -1) {
    swift_once();
  }
  uint64_t v0 = *(void **)algn_268A7CC38;
  id v4 = (id)qword_268A7CC40;
  qword_268A7D858 = qword_268A7CC30;
  unk_268A7D860 = *(void *)algn_268A7CC38;
  qword_268A7D868 = qword_268A7CC40;
  qword_268A7D870 = qword_268A7CC48;
  id v1 = (id)qword_268A7CC30;
  id v2 = v0;

  return v4;
}

uint64_t *sub_23BB3821C()
{
  if (qword_268A7C4F8 != -1) {
    swift_once();
  }
  return &qword_268A7D858;
}

id sub_23BB38268@<X0>(void *a1@<X8>)
{
  sub_23BB3821C();
  id v2 = (void *)qword_268A7D858;
  id v3 = (void *)unk_268A7D860;
  uint64_t v4 = qword_268A7D868;
  id v9 = (id)qword_268A7D868;
  uint64_t v5 = qword_268A7D870;
  *a1 = qword_268A7D858;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  id v6 = v2;
  id v7 = v3;

  return v9;
}

id sub_23BB382D8()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F825C8]);
  id result = sub_23BB3920C((uint64_t)sub_23BB38328, 0);
  qword_268A7D878 = (uint64_t)result;
  return result;
}

id sub_23BB38328(void *a1)
{
  unint64_t v1 = (unint64_t)objc_msgSend(a1, sel_userInterfaceStyle);
  if (v1 > 2) {
    id v2 = &selRef_blackColor;
  }
  else {
    id v2 = off_264E08F00[v1];
  }
  id v3 = [self *v2];

  return v3;
}

id sub_23BB38398()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F825C8]);
  id result = sub_23BB3920C((uint64_t)sub_23BB383E8, 0);
  qword_268A7D880 = (uint64_t)result;
  return result;
}

id sub_23BB383E8(void *a1)
{
  unint64_t v1 = (unint64_t)objc_msgSend(a1, sel_userInterfaceStyle);
  if (v1 > 2) {
    id v2 = &selRef_whiteColor;
  }
  else {
    id v2 = off_264E08F18[v1];
  }
  id v3 = [self *v2];

  return v3;
}

uint64_t sub_23BB38458@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_23BB44E0C();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)v1;
  if (*(unsigned char *)(v1 + 32) == 1)
  {
    uint64_t v8 = *(void *)(v1 + 24);
    *(void *)a1 = v7;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
    *(void *)(a1 + 24) = v8;
    return sub_23BB386C8(v1);
  }
  else
  {
    sub_23BB386C8(v1);
    os_log_type_t v10 = sub_23BB4559C();
    uint64_t v11 = sub_23BB4501C();
    os_log_type_t v12 = v10;
    if (os_log_type_enabled(v11, v10))
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v16[1] = v7;
      uint64_t v15 = v14;
      uint64_t v17 = v14;
      *(_DWORD *)unint64_t v13 = 136315138;
      v16[0] = v13 + 4;
      v16[2] = sub_23BB39318(0xD000000000000012, 0x800000023BB48580, &v17);
      sub_23BB455CC();
      _os_log_impl(&dword_23BB16000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECCFAB0](v15, -1, -1);
      MEMORY[0x23ECCFAB0](v13, -1, -1);
    }

    sub_23BB44DFC();
    swift_getAtKeyPath();
    sub_23BB386C8(v1);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_23BB386C8(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_7_5(a1);
  v3(v2);
  return v1;
}

uint64_t sub_23BB386FC(uint64_t a1)
{
  return a1;
}

uint64_t sub_23BB38740(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23BB44C7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BB387A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CCF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BB3880C(uint64_t a1)
{
  uint64_t v2 = sub_23BB44C7C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23BB38868()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for ShortcutsLinkStyle(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
}

void *initializeWithCopy for ShortcutsLinkStyle(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v6 = *(void **)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = v6;
  a1[3] = v5;
  id v7 = v3;
  id v8 = v4;
  id v9 = v6;
  return a1;
}

uint64_t assignWithCopy for ShortcutsLinkStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  os_log_type_t v10 = *(void **)(a2 + 16);
  uint64_t v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for ShortcutsLinkStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ShortcutsLinkStyle(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 32))
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

uint64_t storeEnumTagSinglePayload for ShortcutsLinkStyle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)id result = a2 ^ 0x80000000;
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
      *(void *)id result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ShortcutsLinkStyle()
{
}

uint64_t destroy for ShortcutsLink(uint64_t a1)
{
  sub_23BB37EC4(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));

  return swift_release();
}

uint64_t initializeWithCopy for ShortcutsLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)(a2 + 8);
  id v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  char v8 = *(unsigned char *)(a2 + 32);
  sub_23BB37F74(*(void **)a2, v5, v6, v7, v8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v9;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ShortcutsLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)(a2 + 8);
  id v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  char v8 = *(unsigned char *)(a2 + 32);
  sub_23BB37F74(*(void **)a2, v5, v6, v7, v8);
  uint64_t v9 = *(void **)a1;
  os_log_type_t v10 = *(void **)(a1 + 8);
  uint64_t v11 = *(void **)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  char v13 = *(unsigned char *)(a1 + 32);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  sub_23BB37EC4(v9, v10, v11, v12, v13);
  uint64_t v14 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ShortcutsLink(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void **)a1;
  id v6 = *(void **)(a1 + 8);
  uint64_t v7 = *(void **)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  char v9 = *(unsigned char *)(a1 + 32);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(unsigned char *)(a1 + 32) = v4;
  sub_23BB37EC4(v5, v6, v7, v8, v9);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShortcutsLink(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 40);
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

uint64_t storeEnumTagSinglePayload for ShortcutsLink(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)id result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ShortcutsLink()
{
}

unint64_t sub_23BB38CBC()
{
  unint64_t result = qword_268A7CD70;
  if (!qword_268A7CD70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7CD60);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7CD08);
    sub_23BB44C5C();
    sub_23BB196A4(&qword_268A7CD38, &qword_268A7CD08);
    sub_23BB39F48(&qword_268A7CD40, MEMORY[0x263F18FD0]);
    swift_getOpaqueTypeConformance2();
    sub_23BB196A4(&qword_268A7CD78, &qword_268A7CD68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7CD70);
  }
  return result;
}

uint64_t sub_23BB38E04()
{
  return swift_getWitnessTable();
}

uint64_t sub_23BB38EA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = sub_23BB44E0C();
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_10();
  if (*(unsigned char *)(v1 + 40) == 1)
  {
    uint64_t v9 = *(void *)(v1 + 24);
    uint64_t v8 = *(void *)(v1 + 32);
    *(void *)a1 = *(void *)v1;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
    *(void *)(a1 + 24) = v9;
    *(void *)(a1 + 32) = v8;
    return sub_23BB39164(v1);
  }
  else
  {
    sub_23BB39164(v1);
    os_log_type_t v11 = sub_23BB4559C();
    uint64_t v12 = sub_23BB4501C();
    os_log_type_t v13 = v11;
    if (os_log_type_enabled(v12, v11))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      sub_23BB39318(0xD000000000000010, 0x800000023BB4A610, &v16);
      sub_23BB455CC();
      _os_log_impl(&dword_23BB16000, v12, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECCFAB0](v15, -1, -1);
      MEMORY[0x23ECCFAB0](v14, -1, -1);
    }

    sub_23BB44DFC();
    swift_getAtKeyPath();
    sub_23BB39164(v1);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
  }
}

id sub_23BB390D8(void *a1, void *a2, void *a3, void *a4, void *a5, char a6)
{
  if (a6)
  {
    id v9 = a5;
    id v10 = a1;
    id v11 = a2;
    id v12 = a3;
    return a4;
  }
  else
  {
    return (id)swift_retain();
  }
}

uint64_t sub_23BB39164(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_7_5(a1);
  v3(v2);
  return v1;
}

void sub_23BB39198(void *a1, void *a2, void *a3, void *a4, void *a5, char a6)
{
  if (a6)
  {
  }
  else
  {
    swift_release();
  }
}

id sub_23BB3920C(uint64_t a1, uint64_t a2)
{
  v6[4] = a1;
  v6[5] = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_23BB392B0;
  v6[3] = &block_descriptor_0;
  uint64_t v3 = _Block_copy(v6);
  id v4 = objc_msgSend(v2, sel_initWithDynamicProvider_, v3);
  _Block_release(v3);
  swift_release();
  return v4;
}

id sub_23BB392B0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_23BB39318(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23BB393EC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23BB39544((uint64_t)v12, *a3);
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
      sub_23BB39544((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23BB393EC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_23BB395A0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_23BB455DC();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_23BB39678(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_23BB4565C();
    if (!v8)
    {
      uint64_t result = sub_23BB4567C();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_23BB39544(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_23BB395A0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_23BB4569C();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_23BB39678(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23BB39710(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_23BB398EC(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_23BB398EC((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23BB39710(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_23BB454AC();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_23BB39884(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_23BB4563C();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_23BB4569C();
  __break(1u);
LABEL_14:
  uint64_t result = sub_23BB4567C();
  __break(1u);
  return result;
}

void *sub_23BB39884(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD90);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23BB398EC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CD90);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  os_log_type_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_23BB39A9C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_23BB399C4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_23BB399C4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_23BB4569C();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_23BB39A9C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_23BB4569C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_23BB39B30@<X0>(uint64_t a1@<X8>)
{
  return sub_23BB372D4(*(void *)(v1 + 16), a1);
}

void sub_23BB39B38(void *a1@<X8>)
{
  sub_23BB37780(*(void *)(v1 + 16), a1);
}

unint64_t sub_23BB39B40()
{
  unint64_t result = qword_268A7CDB0;
  if (!qword_268A7CDB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7CDA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7CDB0);
  }
  return result;
}

unint64_t sub_23BB39BB4()
{
  unint64_t result = qword_268A7CDB8;
  if (!qword_268A7CDB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7CDA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7CDB8);
  }
  return result;
}

unint64_t sub_23BB39C20()
{
  unint64_t result = qword_268A7CDC0;
  if (!qword_268A7CDC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268A7CDC0);
  }
  return result;
}

unint64_t sub_23BB39C60()
{
  unint64_t result = qword_26ADCCDA0;
  if (!qword_26ADCCDA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCDA0);
  }
  return result;
}

unint64_t sub_23BB39CAC(uint64_t a1, uint64_t a2)
{
  sub_23BB4577C();
  sub_23BB4547C();
  uint64_t v4 = sub_23BB4579C();

  return sub_23BB39D24(a1, a2, v4);
}

unint64_t sub_23BB39D24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23BB4570C() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        os_log_type_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_23BB4570C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23BB39E08(void *a1)
{
  id v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_23BB4545C();

  return v3;
}

uint64_t sub_23BB39E78(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_23BB453DC();

  return v4;
}

unint64_t sub_23BB39EEC()
{
  unint64_t result = qword_268A7CDD0;
  if (!qword_268A7CDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7CDD0);
  }
  return result;
}

_OWORD *sub_23BB39F38(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23BB39F48(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_23BB39F90()
{
  unint64_t result = qword_268A7CDE0[0];
  if (!qword_268A7CDE0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268A7CDE0);
  }
  return result;
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

void type metadata accessor for ShortcutsLinkStyleKey()
{
}

uint64_t OUTLINED_FUNCTION_7_5(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t _ProjectedIntentParameter.requestConfirmation<A>(for:dialog:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_15();
  uint64_t v15 = v14 - v13;
  v16();
  uint64_t v17 = _ProjectedIntentParameter.requestConfirmation<A>(for:dialog:view:)(a1, a2, v15, a5, a6);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, a6);
  return v17;
}

uint64_t _ProjectedIntentParameter.requestConfirmation<A>(for:dialog:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7C530);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_15();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_23BB4478C();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_15();
  uint64_t v17 = v16 - v15;
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20 - v19, a3, a5);
  sub_23BB4534C();
  sub_23BB1B590();
  swift_retain();
  sub_23BB4477C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v10, v17, v11);
  __swift_storeEnumTagSinglePayload(v10, 0, 1, v11);
  uint64_t v22 = sub_23BB4485C();
  swift_release();
  sub_23BB1B5DC(v10);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v17, v11);
  return v22;
}

uint64_t static AppManager.registerSwiftUIHooks()()
{
  if (qword_26ADCCFA8 != -1) {
    return swift_once();
  }
  return result;
}

uint64_t sub_23BB3A32C()
{
  OUTLINED_FUNCTION_5();
  sub_23BB4554C();
  *(void *)(v0 + 16) = OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_13_5();
  OUTLINED_FUNCTION_12_3();
  return MEMORY[0x270FA2498](v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_23BB3A3A4()
{
  swift_release();
  uint64_t v1 = sub_23BB3A77C();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_23BB3A444@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t v18 = a1;
  uint64_t v20 = sub_23BB4460C();
  uint64_t v17 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_23BB444FC();
  uint64_t v4 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_23BB4465C();
  uint64_t v7 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(qword_26ADCCDC8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BB4447C();
  sub_23BB4449C();
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CEA8);
  type metadata accessor for CGRect(0);
  sub_23BB44F1C();
  sub_23BB445EC();
  sub_23BB4464C();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v3, v20);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v19);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v16);
  uint64_t v13 = sub_23BB4471C();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v15, v12, v13);
  }
  __break(1u);
  return result;
}

uint64_t sub_23BB3A77C()
{
  sub_23BB44F5C();
  uint64_t v2 = MEMORY[0x263F8EE78];
  sub_23BB44F3C();
  sub_23BB44F4C();
  swift_release();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t sub_23BB3A820()
{
  OUTLINED_FUNCTION_5();
  sub_23BB4554C();
  *(void *)(v0 + 16) = OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_13_5();
  OUTLINED_FUNCTION_12_3();
  return MEMORY[0x270FA2498](v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_23BB3A898()
{
  swift_release();
  uint64_t v1 = sub_23BB3A77C();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_23BB3A938()
{
  uint64_t v0 = sub_23BB4460C();
  MEMORY[0x270FA5388](v0 - 8);
  sub_23BB444CC();
  sub_23BB4454C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CE60);
  sub_23BB453BC();
  swift_getObjectType();
  type metadata accessor for CGRect(0);
  sub_23BB44F1C();
  sub_23BB445EC();
  return sub_23BB4472C();
}

uint64_t sub_23BB3AA7C()
{
  OUTLINED_FUNCTION_5();
  *(unsigned char *)(v0 + 64) = v1;
  *(void *)(v0 + 40) = v2;
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 32) = v4;
  sub_23BB4554C();
  *(void *)(v0 + 56) = OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_13_5();
  OUTLINED_FUNCTION_12_3();
  return MEMORY[0x270FA2498](v5, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_23BB3AB00()
{
  char v1 = *(unsigned char *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 48);
  long long v8 = *(_OWORD *)(v0 + 32);
  swift_release();
  sub_23BB44F5C();
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 16) = 0;
  sub_23BB44F3C();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v2;
  *(unsigned char *)(v3 + 24) = v1 & 1;
  *(_OWORD *)(v3 + 32) = v8;
  *(void *)(v3 + 48) = v0 + 16;
  sub_23BB44F4C();
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v6(v4, v5);
}

uint64_t sub_23BB3ABFC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v33 = a7;
  uint64_t v37 = a3;
  uint64_t v38 = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CE60);
  uint64_t v34 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v32 = (uint64_t)&v32 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CE68);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v35 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v36 = (uint64_t)&v32 - v16;
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CE70);
  sub_23BB196A4(&qword_268A7CE78, &qword_268A7CE70);
  sub_23BB44F2C();
  uint64_t v17 = *(void *)(v39 + 16);
  if (v17)
  {
    uint64_t v18 = v39 + ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80));
    uint64_t v19 = *(void *)(v34 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_23BB28D8C(v18, (uint64_t)v11, &qword_268A7CE60);
      if (a4)
      {
        uint64_t v20 = sub_23BB444CC();
        uint64_t v21 = v38;
      }
      else
      {
        uint64_t v20 = sub_23BB453BC();
        uint64_t v21 = v37;
      }
      if (v20 == v21) {
        break;
      }
      sub_23BB19FA0((uint64_t)v11, &qword_268A7CE60);
      v18 += v19;
      if (!--v17)
      {
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v23 = v36;
    sub_23BB3CE68((uint64_t)v11, v36);
    uint64_t v22 = 0;
  }
  else
  {
LABEL_9:
    uint64_t v22 = 1;
    uint64_t v23 = v36;
  }
  uint64_t v24 = (uint64_t)v35;
  __swift_storeEnumTagSinglePayload(v23, v22, 1, v8);
  swift_bridgeObjectRelease();
  sub_23BB28D8C(v23, v24, &qword_268A7CE68);
  if (__swift_getEnumTagSinglePayload(v24, 1, v8) == 1)
  {
    sub_23BB19FA0(v23, &qword_268A7CE68);
    return sub_23BB19FA0(v24, &qword_268A7CE68);
  }
  else
  {
    uint64_t v26 = v32;
    sub_23BB3CE68(v24, v32);
    uint64_t v27 = sub_23BB444DC();
    uint64_t v29 = v28;
    sub_23BB19FA0(v26, &qword_268A7CE60);
    sub_23BB19FA0(v23, &qword_268A7CE68);
    uint64_t v30 = v33;
    uint64_t v31 = *v33;
    *uint64_t v33 = v27;
    v30[1] = v29;
    return sub_23BB3CED0(v31);
  }
}

uint64_t sub_23BB3AF44()
{
  OUTLINED_FUNCTION_5();
  sub_23BB4554C();
  *(void *)(v0 + 16) = OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_13_5();
  OUTLINED_FUNCTION_12_3();
  return MEMORY[0x270FA2498](v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_23BB3AFBC()
{
  OUTLINED_FUNCTION_5();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23BB3B01C()
{
  OUTLINED_FUNCTION_5();
  v0[3] = v1;
  uint64_t v2 = sub_23BB4460C();
  v0[4] = v2;
  OUTLINED_FUNCTION_6(v2);
  v0[5] = v3;
  v0[6] = OUTLINED_FUNCTION_8();
  uint64_t v4 = sub_23BB444FC();
  v0[7] = v4;
  OUTLINED_FUNCTION_6(v4);
  v0[8] = v5;
  v0[9] = OUTLINED_FUNCTION_8();
  __swift_instantiateConcreteTypeFromMangledName(qword_26ADCCDC8);
  v0[10] = OUTLINED_FUNCTION_8();
  uint64_t v6 = sub_23BB4471C();
  v0[11] = v6;
  OUTLINED_FUNCTION_6(v6);
  v0[12] = v7;
  v0[13] = swift_task_alloc();
  v0[14] = swift_task_alloc();
  uint64_t v8 = sub_23BB4465C();
  v0[15] = v8;
  OUTLINED_FUNCTION_6(v8);
  v0[16] = v9;
  v0[17] = OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](sub_23BB3B17C, 0, 0, v10, v11, v12, v13, v14);
}

uint64_t sub_23BB3B17C()
{
  sub_23BB4483C();
  sub_23BB4481C();
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_23BB3CBC0(v1);
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_23BB4482C();
  swift_release();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v0[16];
    uint64_t v24 = *(void (**)(void, unint64_t, void))(v4 + 16);
    unint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v23 = *(void *)(v4 + 72);
    uint64_t v21 = v0[12];
    uint64_t v22 = (void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32);
    swift_bridgeObjectRetain();
    uint64_t v25 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v27 = v3;
      uint64_t v6 = v0[10];
      uint64_t v26 = v0[11];
      v24(v0[17], v5, v0[15]);
      v0[2] = MEMORY[0x263F8EE78];
      sub_23BB1AE94(&qword_268A7CE28, 255, MEMORY[0x263EFB6A0]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CE30);
      sub_23BB196A4(&qword_268A7CE38, &qword_268A7CE30);
      sub_23BB4560C();
      sub_23BB445FC();
      sub_23BB4464C();
      OUTLINED_FUNCTION_9_2();
      v7();
      OUTLINED_FUNCTION_9_2();
      v8();
      OUTLINED_FUNCTION_9_2();
      v9();
      if (__swift_getEnumTagSinglePayload(v6, 1, v26) == 1)
      {
        sub_23BB19FA0(v0[10], qword_26ADCCDC8);
      }
      else
      {
        uint64_t v10 = v0[13];
        uint64_t v11 = v0[14];
        uint64_t v12 = v0[11];
        uint64_t v13 = *v22;
        (*v22)(v11, v0[10], v12);
        v13(v10, v11, v12);
        uint64_t v14 = v25;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v14 = sub_23BB3C4B4();
        }
        unint64_t v15 = *(void *)(v14 + 16);
        if (v15 >= *(void *)(v14 + 24) >> 1) {
          uint64_t v14 = sub_23BB3C4B4();
        }
        uint64_t v16 = v0[13];
        uint64_t v17 = v0[11];
        *(void *)(v14 + 16) = v15 + 1;
        uint64_t v25 = v14;
        v13(v14+ ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ *(void *)(v21 + 72) * v15, v16, v17);
      }
      v5 += v23;
      uint64_t v3 = v27 - 1;
    }
    while (v27 != 1);
    swift_bridgeObjectRelease_n();
    uint64_t v18 = v25;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v18 = MEMORY[0x263F8EE78];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(uint64_t))v0[1];
  return v19(v18);
}

uint64_t sub_23BB3B5C0()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_23BB3B5D0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23BB3D69C;
  return sub_23BB3A32C();
}

uint64_t sub_23BB3B65C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23BB3B6E8;
  return sub_23BB3A820();
}

uint64_t sub_23BB3B6E8()
{
  OUTLINED_FUNCTION_5();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_7();
  *unint64_t v5 = v4;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_23BB3B7B8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23BB3B86C;
  return sub_23BB3AA7C();
}

uint64_t sub_23BB3B86C(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2();
  uint64_t v6 = *v3;
  OUTLINED_FUNCTION_7();
  void *v7 = v6;
  uint64_t v8 = swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  if (!v2)
  {
    uint64_t v8 = a1;
    uint64_t v9 = a2;
  }
  return v10(v8, v9);
}

uint64_t sub_23BB3B950()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23BB2F0B8;
  return sub_23BB3AF44();
}

uint64_t sub_23BB3B9DC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23BB3D69C;
  return sub_23BB3B01C();
}

uint64_t sub_23BB3BA70(uint64_t a1)
{
  return MEMORY[0x270EE0A68](a1, *v1);
}

uint64_t sub_23BB3BA9C(uint64_t a1)
{
  return MEMORY[0x270EE0A68](a1, *v1);
}

uint64_t sub_23BB3BAC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *v5;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  *uint64_t v12 = v6;
  v12[1] = sub_23BB3D698;
  return MEMORY[0x270EE0A60](a1, a2, a3, v11, a5);
}

uint64_t sub_23BB3BBB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_23BB3BC60;
  return sub_23BB35120(a1, a2, a3, v8, v9, v10, v11, v12);
}

uint64_t sub_23BB3BC60()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_2();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_7();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  unint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_23BB3BD2C(uint64_t a1)
{
  return MEMORY[0x270F9DC10](0, a1);
}

uint64_t sub_23BB3BD38(uint64_t a1, void (*a2)(void))
{
  return sub_23BB454FC();
}

uint64_t sub_23BB3BDC0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v6 = *v4;
  uint64_t v7 = *(void *)(*v4 + 16);
  if (__OFADD__(v7, v5))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v9 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v7 + v5 > *(void *)(v6 + 24) >> 1)
  {
    uint64_t result = sub_23BB3C4B4();
    uint64_t v6 = result;
  }
  if (!*(void *)(v9 + 16))
  {
    if (!v5) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  uint64_t v10 = *(void *)(v6 + 16);
  uint64_t v11 = (*(void *)(v6 + 24) >> 1) - v10;
  uint64_t v12 = OUTLINED_FUNCTION_3_5();
  uint64_t v13 = a4(v12);
  uint64_t v15 = *(void *)(v13 - 8);
  uint64_t result = v13 - 8;
  uint64_t v14 = v15;
  if (v11 < v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v16 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t result = sub_23BB3C8E4(v9 + v16, v5, v6 + v16 + *(void *)(v14 + 72) * v10);
  if (!v5)
  {
LABEL_11:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v4 = v6;
    return result;
  }
  uint64_t v17 = *(void *)(v6 + 16);
  BOOL v18 = __OFADD__(v17, v5);
  uint64_t v19 = v17 + v5;
  if (!v18)
  {
    *(void *)(v6 + 16) = v19;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_23BB3BF04@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_23BB3BD2C(*(void *)(a1 + 16));
  *a2 = result;
  return result;
}

uint64_t sub_23BB3BF30(uint64_t a1)
{
  return sub_23BB3BD38(a1, (void (*)(void))sub_23BB3D660);
}

uint64_t sub_23BB3BF78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a5, a1, a4);
  uint64_t result = type metadata accessor for AppViewAnchor();
  *(void *)(a5 + *(int *)(result + 28)) = a2;
  *(void *)(a5 + *(int *)(result + 32)) = a3;
  return result;
}

uint64_t sub_23BB3BFFC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CE98);
  swift_getObjectType();
  sub_23BB196A4(&qword_268A7CEA0, &qword_268A7CE98);
  sub_23BB44F2C();
  swift_unknownObjectRetain();
  uint64_t v9 = sub_23BB3C29C(v11, a3, a4, a1, a2, MEMORY[0x263EFBCC0], (void (*)(void, uint64_t, void))sub_23BB3C9DC, &qword_268A7CEA8);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v4) {
    return sub_23BB3BDC0(v9, (uint64_t)&unk_268A7CE40, MEMORY[0x263EFBCC0], MEMORY[0x263EFBCC0]);
  }
  return result;
}

uint64_t sub_23BB3C14C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CE70);
  swift_getObjectType();
  sub_23BB196A4(&qword_268A7CE78, &qword_268A7CE70);
  sub_23BB44F2C();
  swift_unknownObjectRetain();
  uint64_t v9 = sub_23BB3C29C(v11, a3, a4, a1, a2, MEMORY[0x263EFBCC8], (void (*)(void, uint64_t, void))sub_23BB3CA1C, &qword_268A7CE60);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v4) {
    return sub_23BB3BDC0(v9, (uint64_t)&unk_268A7CE88, MEMORY[0x263EFBCC8], MEMORY[0x263EFBCC8]);
  }
  return result;
}

uint64_t sub_23BB3C29C(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void, uint64_t, void), uint64_t *a8)
{
  uint64_t v31 = a5;
  uint64_t v32 = a4;
  uint64_t v29 = a2;
  uint64_t v30 = a3;
  uint64_t v12 = OUTLINED_FUNCTION_3_5();
  uint64_t v28 = v13(v12);
  uint64_t v14 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  unint64_t v16 = (char *)v26 - v15;
  uint64_t v17 = *(void *)(a1 + 16);
  uint64_t v18 = MEMORY[0x263F8EE78];
  if (v17)
  {
    uint64_t v33 = MEMORY[0x263F8EE78];
    v26[0] = a7;
    a7(0, v17, 0);
    uint64_t v18 = v33;
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(a8);
    OUTLINED_FUNCTION_6(v19);
    uint64_t v21 = a1 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
    uint64_t v27 = *(void *)(v22 + 72);
    v26[1] = v14 + 32;
    while (1)
    {
      v29(v21, v32, v31);
      if (v8) {
        break;
      }
      uint64_t v33 = v18;
      unint64_t v24 = *(void *)(v18 + 16);
      unint64_t v23 = *(void *)(v18 + 24);
      if (v24 >= v23 >> 1)
      {
        ((void (*)(BOOL, unint64_t, uint64_t))v26[0])(v23 > 1, v24 + 1, 1);
        uint64_t v18 = v33;
      }
      *(void *)(v18 + 16) = v24 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v18+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(void *)(v14 + 72) * v24, v16, v28);
      v21 += v27;
      if (!--v17) {
        goto LABEL_7;
      }
    }
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
LABEL_7:
    swift_unknownObjectRelease();
  }
  return v18;
}

uint64_t sub_23BB3C4B4()
{
  OUTLINED_FUNCTION_14_4();
  if (v7)
  {
    unint64_t v8 = *(void *)(v0 + 24);
    uint64_t v9 = v8 >> 1;
    if ((uint64_t)(v8 >> 1) < v5)
    {
      if (v9 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
      }
      uint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v8 & 0xFFFFFFFFFFFFFFFELL) <= v5) {
        uint64_t v9 = v5;
      }
    }
  }
  else
  {
    uint64_t v9 = v5;
  }
  uint64_t v10 = *(void *)(v0 + 16);
  if (v9 <= v10) {
    uint64_t v11 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v11 = v9;
  }
  if (!v11)
  {
    unint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(v6);
  uint64_t v12 = OUTLINED_FUNCTION_3_5();
  uint64_t v13 = v3(v12);
  OUTLINED_FUNCTION_6(v13);
  uint64_t v15 = *(void *)(v14 + 72);
  unint64_t v16 = (void *)OUTLINED_FUNCTION_7_6();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v15 || (v17 - v4 == 0x8000000000000000 ? (BOOL v18 = v15 == -1) : (BOOL v18 = 0), v18))
  {
LABEL_24:
    OUTLINED_FUNCTION_2_6();
    uint64_t result = sub_23BB4567C();
    __break(1u);
    return result;
  }
  v16[2] = v10;
  void v16[3] = 2 * ((uint64_t)(v17 - v4) / v15);
LABEL_19:
  uint64_t v19 = OUTLINED_FUNCTION_3_5();
  uint64_t v20 = *(void *)(v3(v19) - 8);
  unint64_t v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v22 = (unint64_t)v16 + v21;
  if (v2)
  {
    sub_23BB3C7DC(v0 + v21, v10, v22, v1);
    *(void *)(v0 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23BB3C694(0, v10, v22, v0);
  }
  return (uint64_t)v16;
}

uint64_t sub_23BB3C694(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = OUTLINED_FUNCTION_3_5();
    uint64_t v10 = *(void *)(v9(v8) - 8);
    uint64_t v11 = a4 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    uint64_t v12 = *(void *)(v10 + 72);
    unint64_t v13 = v11 + v12 * a1;
    unint64_t v14 = a3 + v12 * v4;
    if (v13 >= v14 || v13 + v12 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v14;
    }
  }
  OUTLINED_FUNCTION_2_6();
  uint64_t result = sub_23BB4569C();
  __break(1u);
  return result;
}

void sub_23BB3C7DC(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(uint64_t))
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_6();
    uint64_t v10 = sub_23BB4569C();
    __break(1u);
_swift_arrayInitWithTakeBackToFront:
    MEMORY[0x270FA01D0](v10);
    return;
  }
  if (a3 < a1 || (uint64_t v8 = OUTLINED_FUNCTION_3_5(), a4(v8), OUTLINED_FUNCTION_2_0(), a1 + *(void *)(v9 + 72) * a2 <= a3))
  {
    uint64_t v11 = OUTLINED_FUNCTION_3_5();
    a4(v11);
    uint64_t v12 = OUTLINED_FUNCTION_15_2();
    MEMORY[0x270FA01D8](v12);
  }
  else if (a3 != a1)
  {
    uint64_t v10 = OUTLINED_FUNCTION_15_2();
    goto _swift_arrayInitWithTakeBackToFront;
  }
}

uint64_t sub_23BB3C8E4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v6 = OUTLINED_FUNCTION_3_5(),
         v7(v6),
         OUTLINED_FUNCTION_2_0(),
         uint64_t v9 = *(void *)(v8 + 72) * a2,
         unint64_t v10 = a3 + v9,
         unint64_t v11 = a1 + v9,
         v10 > a1)
      ? (BOOL v12 = v11 > a3)
      : (BOOL v12 = 0),
        v12))
  {
    OUTLINED_FUNCTION_2_6();
    uint64_t result = sub_23BB4569C();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

void sub_23BB3C9DC()
{
  sub_23BB3CA5C();
  *uint64_t v0 = v1;
}

void sub_23BB3CA1C()
{
  sub_23BB3CA5C();
  *uint64_t v0 = v1;
}

void sub_23BB3CA5C()
{
  OUTLINED_FUNCTION_14_4();
  if (v7)
  {
    unint64_t v8 = *(void *)(v0 + 24);
    uint64_t v9 = v8 >> 1;
    if ((uint64_t)(v8 >> 1) < v5)
    {
      if (v9 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return;
      }
      uint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v8 & 0xFFFFFFFFFFFFFFFELL) <= v5) {
        uint64_t v9 = v5;
      }
    }
  }
  else
  {
    uint64_t v9 = v5;
  }
  uint64_t v10 = *(void *)(v0 + 16);
  if (v9 <= v10) {
    uint64_t v11 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v11 = v9;
  }
  if (!v11)
  {
    unint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(v6);
  uint64_t v12 = OUTLINED_FUNCTION_3_5();
  uint64_t v13 = v3(v12);
  OUTLINED_FUNCTION_6(v13);
  uint64_t v15 = *(void *)(v14 + 72);
  unint64_t v16 = (void *)OUTLINED_FUNCTION_7_6();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v15)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v17 - v4 == 0x8000000000000000 && v15 == -1) {
    goto LABEL_24;
  }
  v16[2] = v10;
  void v16[3] = 2 * ((uint64_t)(v17 - v4) / v15);
LABEL_19:
  uint64_t v19 = OUTLINED_FUNCTION_3_5();
  uint64_t v20 = *(void *)(v3(v19) - 8);
  unint64_t v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v22 = (unint64_t)v16 + v21;
  unint64_t v23 = v0 + v21;
  if (v2)
  {
    sub_23BB3C7DC(v23, v10, v22, v1);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_23BB3C8E4(v23, v10, v22);
  }
  swift_release();
}

uint64_t sub_23BB3CBC0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CE48);
  uint64_t v3 = swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 4);
  int64_t v5 = sub_23BB3CCA4(&v7, (_DWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_23BB3CE38();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_23BB3CCA4(void *result, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_36:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_19:
    ++v9;
    *a2++ = *(_DWORD *)(*(void *)(a4 + 48) + 4 * v12);
    if (v9 == a3) {
      goto LABEL_36;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v13 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_18;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_14:
    int64_t v13 = v8;
LABEL_18:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_19;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_17:
    int64_t v13 = v15;
    goto LABEL_18;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_14;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_31:
    unint64_t v7 = 0;
LABEL_35:
    a3 = v9;
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23BB3CE38()
{
  return swift_release();
}

uint64_t sub_23BB3CE40(uint64_t a1, uint64_t a2)
{
  return sub_23BB3ABFC(a1, a2, *(void *)(v2 + 16), *(unsigned char *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(uint64_t **)(v2 + 48));
}

uint64_t sub_23BB3CE68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CE60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BB3CED0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_23BB3CEE0(uint64_t a1, uint64_t a2)
{
  return sub_23BB3C14C(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_23BB3CF00(uint64_t a1, uint64_t a2)
{
  return sub_23BB3BFFC(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16), *(void *)(v2 + 24));
}

uint64_t *sub_23BB3CF20(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    int64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *int64_t v10 = *v11;
    *(void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  }
  swift_retain();
  return v4;
}

uint64_t sub_23BB3D030(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();

  return swift_release();
}

uint64_t sub_23BB3D0A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  int64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

uint64_t sub_23BB3D138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  int64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23BB3D1D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  int64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23BB3D260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  int64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_23BB3D2F4(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x23BB3D440);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  }
  unint64_t v17 = *(void *)(((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_23BB3D454(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  unint64_t v10 = ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
  }
  if (a2 > v8)
  {
    if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x23BB3D638);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if (v7 < 0x7FFFFFFF)
        {
          unint64_t v17 = (void *)((((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0) {
            uint64_t v18 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v18 = (a2 - 1);
          }
          *unint64_t v17 = v18;
        }
        else
        {
          __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t sub_23BB3D660()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 24))(&v2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  return sub_23BB4552C();
}

void View.appEntity<A>(entityType:identifier:state:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v10 = v0;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = sub_23BB455BC();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v9(v8);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, AssociatedTypeWitness);
  _s7SwiftUI4ViewP012_AppIntents_aB0E011representedD6Entity_10identifierQrqd__m_2IDQyd__Sgt0dE00dG0Rd__lF_0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  OUTLINED_FUNCTION_5_0();
}

void View.linkIntent<A>(_:perform:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v77 = v1;
  uint64_t v78 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v81 = v7;
  uint64_t v82 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v80 = v12;
  OUTLINED_FUNCTION_0();
  uint64_t v66 = v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v15 = sub_23BB4480C();
  uint64_t v16 = sub_23BB3DEBC(&qword_26ADCD0D8);
  uint64_t v17 = sub_23BB3DEBC(&qword_26ADCD0E0);
  uint64_t v18 = v9;
  uint64_t v91 = v9;
  uint64_t v92 = v15;
  uint64_t v71 = v15;
  uint64_t v79 = v5;
  uint64_t v93 = v5;
  uint64_t v94 = v16;
  uint64_t v70 = v16;
  uint64_t v68 = v17;
  uint64_t v95 = v17;
  swift_getOpaqueTypeMetadata2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCE58);
  uint64_t v19 = sub_23BB44C2C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7CEB0);
  uint64_t v69 = v19;
  uint64_t v20 = sub_23BB44C2C();
  OUTLINED_FUNCTION_0();
  uint64_t v72 = v21;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v22);
  unint64_t v24 = (char *)v64 - v23;
  sub_23BB44C2C();
  OUTLINED_FUNCTION_0();
  uint64_t v76 = v25;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v26);
  uint64_t v67 = (char *)v64 - v27;
  uint64_t v74 = v28;
  uint64_t v75 = sub_23BB44C2C();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v29);
  uint64_t v73 = (char *)v64 - v30;
  sub_23BB444EC();
  OUTLINED_FUNCTION_0();
  uint64_t v32 = MEMORY[0x270FA5388](v31);
  uint64_t v34 = (char *)v64 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v38 = (char *)v64 - v37;
  if (v11)
  {
    uint64_t v39 = v11;
    uint64_t v40 = v35;
    v64[2] = v35;
    uint64_t v66 = v20;
    uint64_t v41 = v36;
    v64[3] = v36;
    swift_retain_n();
    uint64_t v42 = v77;
    v64[0] = v24;
    uint64_t v65 = v39;
    uint64_t v43 = v81;
    sub_23BB444BC();
    uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
    v64[1] = v38;
    v44(v34, v38, v40);
    uint64_t v45 = v71;
    uint64_t v46 = (void *)sub_23BB447EC();
    uint64_t v47 = v3;
    uint64_t v48 = v79;
    sub_23BB3F414();

    uint64_t v49 = (void *)swift_allocObject();
    v49[2] = v18;
    v49[3] = v43;
    v49[4] = v48;
    v49[5] = v47;
    v49[6] = v42;
    uint64_t v91 = v18;
    uint64_t v92 = v45;
    uint64_t v93 = v48;
    uint64_t v94 = v70;
    uint64_t v95 = v68;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v51 = sub_23BB196A4(&qword_26ADCCE50, &qword_26ADCCE58);
    uint64_t v89 = OpaqueTypeConformance2;
    uint64_t v90 = v51;
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v53 = sub_23BB196A4(&qword_268A7CEB8, &qword_268A7CEB0);
    uint64_t v87 = WitnessTable;
    uint64_t v88 = v53;
    uint64_t v54 = swift_getWitnessTable();
    sub_23BB4520C();
    swift_release();
    OUTLINED_FUNCTION_9_2();
    v55();
    uint64_t v56 = (void *)swift_allocObject();
    uint64_t v57 = v81;
    v56[2] = v18;
    v56[3] = v57;
    v56[4] = v48;
    v56[5] = v47;
    v56[6] = v42;
    uint64_t v58 = MEMORY[0x263F1A240];
    uint64_t v85 = v54;
    uint64_t v86 = MEMORY[0x263F1A240];
    uint64_t v59 = swift_getWitnessTable();
    sub_23BB4518C();
    swift_release();
    OUTLINED_FUNCTION_9_2();
    v60();
    uint64_t v83 = v59;
    uint64_t v84 = v58;
    swift_getWitnessTable();
    uint64_t v61 = sub_23BB4534C();
    sub_23BB3CED0(v65);
    OUTLINED_FUNCTION_9_2();
    v62();
  }
  else
  {
    OUTLINED_FUNCTION_9_0();
    v63();
    uint64_t v61 = sub_23BB4534C();
  }
  *uint64_t v80 = v61;
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_23BB3DEBC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_23BB4480C();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23BB3DF04()
{
  return sub_23BB3DFA0(MEMORY[0x263EFB720]);
}

uint64_t sub_23BB3DF1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  sub_23BB445CC();
  sub_23BB445AC();
  a6(a1, a5);

  return swift_release();
}

uint64_t sub_23BB3DF88()
{
  return sub_23BB3DFA0(MEMORY[0x263EFB718]);
}

uint64_t sub_23BB3DFA0(void (*a1)(uint64_t, uint64_t))
{
  return sub_23BB3DF1C(v1[6], v1[2], v1[3], v1[4], v1[5], a1);
}

void View.linkEntity<A>(_:)()
{
  OUTLINED_FUNCTION_6_0();
  sub_23BB455BC();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v1();
  OUTLINED_FUNCTION_2_7();
  uint64_t v2 = OUTLINED_FUNCTION_1_3();
  v3(v2);
  OUTLINED_FUNCTION_5_0();
}

void View.representedAppEntity(_:)()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2[3];
  __swift_project_boxed_opaque_existential_1(v2, v3);
  sub_23BB455BC();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v10 - v5;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  v7();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v3);
  _s7SwiftUI4ViewP012_AppIntents_aB0E011representedD6EntityyQrqd__Sg0dE00dG0Rd__lF_0();
  uint64_t v8 = OUTLINED_FUNCTION_1_3();
  v9(v8);
  v10[0] = v10[1];
  *uint64_t v1 = sub_23BB4534C();
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_23BB3E1C0()
{
  return MEMORY[0x263F1B718];
}

uint64_t sub_23BB3E1CC()
{
  return MEMORY[0x263F1B718];
}

uint64_t sub_23BB3E1D8()
{
  return MEMORY[0x263F1B718];
}

uint64_t *sub_23BB3E1E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 > 7
    || (*(_DWORD *)(v4 + 80) & 0x100000) != 0
    || ((v5 + 8) & (unint64_t)~v5) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) > 0x18)
  {
    uint64_t v8 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 & 0xF8 ^ 0x1F8) & (v5 + 16)));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    (*(void (**)(unint64_t, unint64_t))(v4 + 16))(((unint64_t)a1 + v5 + 8) & ~v5, ((unint64_t)a2 + v5 + 8) & ~v5);
  }
  return v3;
}

void *sub_23BB3E2D0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_23BB3E340(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

uint64_t sub_23BB3E3B0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v6;
  if (a2 <= v6) {
    goto LABEL_19;
  }
  uint64_t v9 = ((v7 + 8) & ~v7) + *(void *)(*(void *)(v4 - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v12 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v12))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v12 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v12 < 2)
    {
LABEL_19:
      if (v6) {
        return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v7 + 8) & ~v7, v6, v4);
      }
      return 0;
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_19;
  }
LABEL_11:
  int v13 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v13 = 0;
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
  return v6 + (v9 | v13) + 1;
}

void sub_23BB3E51C(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  size_t v10 = ((v9 + 8) & ~v9) + *(void *)(v7 + 64);
  char v11 = 8 * v10;
  BOOL v12 = a3 >= v8;
  int v13 = a3 - v8;
  if (v13 != 0 && v12)
  {
    if (v10 <= 3)
    {
      unsigned int v17 = ((v13 + ~(-1 << v11)) >> v11) + 1;
      if (HIWORD(v17))
      {
        int v14 = 4;
      }
      else if (v17 >= 0x100)
      {
        int v14 = 2;
      }
      else
      {
        int v14 = v17 > 1;
      }
    }
    else
    {
      int v14 = 1;
    }
  }
  else
  {
    int v14 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v15 = ~v8 + a2;
    if (v10 < 4)
    {
      int v16 = (v15 >> v11) + 1;
      if (v10)
      {
        int v18 = v15 & ~(-1 << v11);
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v15;
      int v16 = 1;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v16;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v10] = v16;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x23BB3E740);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        unint64_t v19 = (unint64_t)&a1[v9 + 8] & ~v9;
        __swift_storeEnumTagSinglePayload(v19, a2, v8, v6);
      }
      return;
  }
}

void sub_23BB3E768()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v29 = v0;
  uint64_t v2 = v1;
  uint64_t v31 = v3;
  uint64_t v32 = v4;
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v9);
  swift_getWitnessTable();
  v25[1] = sub_23BB44F7C();
  type metadata accessor for CGRect(255);
  uint64_t v26 = *(void *)(v2 + 16);
  uint64_t v27 = v10;
  type metadata accessor for AppViewAnchor();
  type metadata accessor for AppViewPreferenceKey();
  v25[2] = swift_getWitnessTable();
  uint64_t v28 = sub_23BB44FDC();
  uint64_t v11 = sub_23BB44C2C();
  OUTLINED_FUNCTION_0();
  uint64_t v30 = v12;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  int v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  int v18 = (char *)v25 - v17;
  sub_23BB452FC();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v2);
  unint64_t v19 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v26;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v20 + v19, (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_23BB451CC();
  swift_release();
  swift_release();
  uint64_t v22 = swift_getWitnessTable();
  uint64_t v33 = WitnessTable;
  uint64_t v34 = v22;
  uint64_t v23 = swift_getWitnessTable();
  sub_23BB3EE9C(v16, v11, v23);
  unint64_t v24 = *(void (**)(char *, uint64_t))(v30 + 8);
  v24(v16, v11);
  sub_23BB3EE9C(v18, v11, v23);
  v24(v18, v11);
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_23BB3EA88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for AppViewAnchor();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v16 - v11;
  uint64_t v13 = type metadata accessor for AppViewModifier();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3 + *(int *)(v13 + 28), a4);
  uint64_t v14 = sub_23BB453AC();
  sub_23BB3BF78((uint64_t)v9, v14, a2, a4, (uint64_t)v12);
  sub_23BB4551C();
  swift_retain();
  return sub_23BB4550C();
}

uint64_t sub_23BB3EBFC()
{
  uint64_t v1 = *(void *)(type metadata accessor for AppViewModifier() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 24) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_2();
  v5();

  return MEMORY[0x270FA0238](v0, v3, v4);
}

uint64_t sub_23BB3ECD0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(type metadata accessor for AppViewModifier() - 8);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_23BB3EA88(a1, a2, v7, v5);
}

uint64_t sub_23BB3ED5C()
{
  return swift_getWitnessTable();
}

uint64_t sub_23BB3EEA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

void _s7SwiftUI4ViewP012_AppIntents_aB0E011representedD6Entity_10identifierQrqd__m_2IDQyd__Sgt0dE00dG0Rd__lF_0()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v64 = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v61 = v9;
  uint64_t v55 = v10;
  uint64_t v66 = v11;
  OUTLINED_FUNCTION_0();
  v51[2] = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3();
  v51[1] = v14;
  uint64_t v15 = sub_23BB4480C();
  uint64_t v16 = (void (*)(uint64_t))MEMORY[0x263EFBDA0];
  uint64_t v71 = v8;
  uint64_t v72 = v15;
  uint64_t v60 = v15;
  uint64_t v65 = v4;
  uint64_t v73 = v4;
  uint64_t v74 = sub_23BB19AD4(&qword_26ADCD0D8, MEMORY[0x263EFBDA0]);
  uint64_t v56 = v74;
  uint64_t v52 = sub_23BB19AD4(&qword_26ADCD0E0, v16);
  uint64_t v75 = v52;
  OUTLINED_FUNCTION_9_4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCE58);
  uint64_t v17 = OUTLINED_FUNCTION_8_4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26ADCD038);
  OUTLINED_FUNCTION_18_1();
  uint64_t v53 = v17;
  uint64_t v58 = sub_23BB44C2C();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v18);
  long long v62 = (char *)v51 - v19;
  uint64_t v63 = sub_23BB446DC();
  OUTLINED_FUNCTION_0();
  uint64_t v54 = v20;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_63();
  MEMORY[0x270FA5388](v22);
  unint64_t v24 = (char *)v51 - v23;
  uint64_t v59 = v2;
  uint64_t v57 = v6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v26 = sub_23BB455BC();
  OUTLINED_FUNCTION_0();
  uint64_t v28 = v27;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)v51 - v30;
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v32;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_11_4();
  MEMORY[0x270FA5388](v35);
  uint64_t v37 = (char *)v51 - v36;
  OUTLINED_FUNCTION_33();
  v38();
  if (__swift_getEnumTagSinglePayload((uint64_t)v31, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v31, v26);
    OUTLINED_FUNCTION_9_0();
    v39();
    uint64_t v40 = sub_23BB4534C();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v37, v31, AssociatedTypeWitness);
    OUTLINED_FUNCTION_33();
    v41();
    sub_23BB446CC();
    uint64_t v42 = v54;
    OUTLINED_FUNCTION_33();
    v43();
    uint64_t v44 = v60;
    uint64_t v45 = (void *)sub_23BB447DC();
    uint64_t v46 = v65;
    sub_23BB196E8();

    uint64_t v71 = v8;
    uint64_t v72 = v44;
    uint64_t v73 = v46;
    uint64_t v74 = v56;
    uint64_t v75 = v52;
    uint64_t v47 = OUTLINED_FUNCTION_17_3();
    uint64_t v48 = sub_23BB196A4(&qword_26ADCCE50, &qword_26ADCCE58);
    uint64_t v69 = v47;
    uint64_t v70 = v48;
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v50 = sub_23BB196A4(&qword_26ADCD030, qword_26ADCD038);
    uint64_t v67 = WitnessTable;
    uint64_t v68 = v50;
    swift_getWitnessTable();
    uint64_t v40 = sub_23BB4534C();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v24, v63);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v37, AssociatedTypeWitness);
  }
  *uint64_t v66 = v40;
  OUTLINED_FUNCTION_5_0();
}

void sub_23BB3F414()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v38 = v0;
  uint64_t v2 = v1;
  uint64_t v41 = v3;
  uint64_t v42 = v1;
  uint64_t v4 = v3;
  uint64_t v40 = v5;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CEB0);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_63();
  uint64_t v34 = (void *)(v7 - v8);
  MEMORY[0x270FA5388](v9);
  uint64_t v39 = (uint64_t)&v31 - v10;
  sub_23BB444EC();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_15();
  uint64_t v14 = sub_23BB4480C();
  uint64_t v15 = (void (*)(uint64_t))MEMORY[0x263EFBDA0];
  uint64_t v16 = sub_23BB19AD4(&qword_26ADCD0D8, MEMORY[0x263EFBDA0]);
  uint64_t v31 = sub_23BB19AD4(&qword_26ADCD0E0, v15);
  uint64_t v45 = v4;
  uint64_t v46 = v14;
  uint64_t v47 = v2;
  uint64_t v48 = v16;
  uint64_t v49 = v31;
  OUTLINED_FUNCTION_9_4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCE58);
  uint64_t v17 = sub_23BB44C2C();
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v18;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v19);
  uint64_t v37 = v12;
  uint64_t v20 = *(void (**)(void))(v12 + 16);
  OUTLINED_FUNCTION_15_3();
  v20();
  uint64_t v21 = (void *)sub_23BB447EC();
  uint64_t v45 = v21;
  uint64_t v32 = v14;
  uint64_t v33 = v16;
  uint64_t v22 = v31;
  sub_23BB19B1C();
  uint64_t v23 = v34;

  uint64_t v24 = v36;
  OUTLINED_FUNCTION_15_3();
  v20();
  *uint64_t v23 = 0;
  OUTLINED_FUNCTION_15_3();
  v20();
  if (qword_26ADCCFA8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_9_2();
  v25();
  uint64_t v26 = v39;
  sub_23BB19EE0((uint64_t)v23, v39, &qword_268A7CEB0);
  uint64_t v45 = v41;
  uint64_t v46 = v32;
  uint64_t v47 = v42;
  uint64_t v48 = v33;
  uint64_t v49 = v22;
  uint64_t v27 = OUTLINED_FUNCTION_17_3();
  uint64_t v28 = sub_23BB196A4(&qword_26ADCCE50, &qword_26ADCCE58);
  uint64_t v43 = v27;
  uint64_t v44 = v28;
  uint64_t WitnessTable = swift_getWitnessTable();
  MEMORY[0x23ECCEF80](v26, v17, v24, WitnessTable);
  sub_23BB19FA0(v26, &qword_268A7CEB0);
  OUTLINED_FUNCTION_9_2();
  v30();
  OUTLINED_FUNCTION_5_0();
}

void sub_23BB3F7C4()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v35 = v2;
  uint64_t v36 = v0;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v38 = v7;
  OUTLINED_FUNCTION_0();
  v32[2] = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_15();
  uint64_t v10 = sub_23BB4480C();
  uint64_t v11 = (void (*)(uint64_t))MEMORY[0x263EFBDA0];
  uint64_t v43 = v6;
  uint64_t v44 = v10;
  uint64_t v33 = sub_23BB19AD4(&qword_26ADCD0D8, MEMORY[0x263EFBDA0]);
  uint64_t v34 = v10;
  uint64_t v37 = v4;
  uint64_t v45 = v4;
  uint64_t v46 = v33;
  v32[0] = sub_23BB19AD4(&qword_26ADCD0E0, v11);
  uint64_t v47 = v32[0];
  swift_getOpaqueTypeMetadata2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCE58);
  uint64_t v12 = OUTLINED_FUNCTION_8_4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26ADCD038);
  OUTLINED_FUNCTION_18_1();
  v32[1] = v12;
  sub_23BB44C2C();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CEF8);
  MEMORY[0x270FA5388](v14 - 8);
  OUTLINED_FUNCTION_15_0();
  uint64_t v15 = sub_23BB446DC();
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_11_4();
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)v32 - v20;
  sub_23BB248BC(v35, v1, &qword_268A7CEF8);
  if (__swift_getEnumTagSinglePayload(v1, 1, v15) == 1)
  {
    sub_23BB19FA0(v1, &qword_268A7CEF8);
    OUTLINED_FUNCTION_9_0();
    v22();
    uint64_t v23 = sub_23BB4534C();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v21, v1, v15);
    OUTLINED_FUNCTION_33();
    v24();
    uint64_t v25 = v34;
    uint64_t v26 = (void *)sub_23BB447DC();
    uint64_t v27 = v37;
    sub_23BB196E8();

    uint64_t v43 = v6;
    uint64_t v44 = v25;
    uint64_t v45 = v27;
    uint64_t v46 = v33;
    uint64_t v47 = v32[0];
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v29 = sub_23BB196A4(&qword_26ADCCE50, &qword_26ADCCE58);
    uint64_t v41 = OpaqueTypeConformance2;
    uint64_t v42 = v29;
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v31 = sub_23BB196A4(&qword_26ADCD030, qword_26ADCD038);
    uint64_t v39 = WitnessTable;
    uint64_t v40 = v31;
    swift_getWitnessTable();
    uint64_t v23 = sub_23BB4534C();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v15);
  }
  uint64_t *v38 = v23;
  OUTLINED_FUNCTION_5_0();
}

uint64_t View.appEntityIdentifier<A>(forSelectionType:identifier:)@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t View.setEntityProvider<A>(_:)()
{
  OUTLINED_FUNCTION_0();
  uint64_t v1 = v0;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_15_0();
  v9[3] = v3;
  v9[4] = v4;
  __swift_allocate_boxed_opaque_existential_1(v9);
  uint64_t v5 = *(void (**)(void))(v1 + 16);
  OUTLINED_FUNCTION_16_2();
  v5();
  sub_23BB4489C();
  swift_allocObject();
  uint64_t v6 = sub_23BB4488C();
  sub_23BB445CC();
  sub_23BB445AC();
  sub_23BB448DC();
  OUTLINED_FUNCTION_16_2();
  v5();
  type metadata accessor for DummyView();
  swift_allocObject();
  sub_23BB19AD4(&qword_268A7CEC8, (void (*)(uint64_t))type metadata accessor for DummyView);
  sub_23BB19AD4(&qword_268A7CED0, (void (*)(uint64_t))type metadata accessor for DummyView);
  sub_23BB448EC();
  sub_23BB445BC();
  swift_release();
  swift_release();
  v9[0] = v6;
  uint64_t v7 = (void (*)(uint64_t))MEMORY[0x263EFBF48];
  sub_23BB19AD4(&qword_268A7CED8, MEMORY[0x263EFBF48]);
  sub_23BB19AD4(&qword_268A7CEE0, v7);
  sub_23BB19B1C();
  return swift_release();
}

uint64_t type metadata accessor for DummyView()
{
  return self;
}

uint64_t sub_23BB3FE94()
{
  return MEMORY[0x270EE0FD8](0.0, 0.0, 1.79769313e308, 1.79769313e308);
}

double sub_23BB3FEAC()
{
  return 0.0;
}

uint64_t sub_23BB3FEC4()
{
  return sub_23BB3FE94();
}

uint64_t sub_23BB3FEE8(uint64_t a1, uint64_t a2)
{
  return sub_23BB3FF00(a1, a2, (uint64_t (*)(void))sub_23BB3FEAC);
}

uint64_t sub_23BB3FF00(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_23BB3FF28()
{
  return sub_23BB25798() & 1;
}

uint64_t sub_23BB3FF50()
{
  return MEMORY[0x263F1B718];
}

uint64_t sub_23BB3FF5C(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t sub_23BB3FF64()
{
  sub_23BB4489C();
  uint64_t v0 = (void (*)(uint64_t))MEMORY[0x263EFBF48];
  sub_23BB19AD4(&qword_268A7CED8, MEMORY[0x263EFBF48]);
  sub_23BB19AD4(&qword_268A7CEE0, v0);
  swift_getOpaqueTypeMetadata2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7CEE8);
  sub_23BB44C2C();
  swift_getOpaqueTypeConformance2();
  sub_23BB196A4(&qword_268A7CEF0, &qword_268A7CEE8);
  return swift_getWitnessTable();
}

uint64_t *sub_23BB400DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v7 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v8 + 16) & ~v8));
    swift_retain();
  }
  else if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_23BB401F8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (*(_DWORD *)(v7 + 84)) {
      size_t v8 = *(void *)(v7 + 64);
    }
    else {
      size_t v8 = *(void *)(v7 + 64) + 1;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_23BB402BC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v5);
  int v7 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  uint64_t v8 = *(void *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v5);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
      return a1;
    }
    int v9 = *(_DWORD *)(v8 + 84);
    size_t v10 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a1, a2, v5);
      return a1;
    }
    uint64_t v11 = v8 + 8;
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v10 + 1;
  }
  memcpy(a1, a2, v12);
  return a1;
}

uint64_t sub_23BB403E4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(v4 - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  unsigned int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    if (v7 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_23;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_23;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 > 3) {
            LODWORD(v7) = 4;
          }
          switch((int)v7)
          {
            case 2:
              LODWORD(v7) = *a1;
              break;
            case 3:
              LODWORD(v7) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              LODWORD(v7) = *(_DWORD *)a1;
              break;
            default:
              LODWORD(v7) = *(unsigned __int8 *)a1;
              break;
          }
        }
        return v6 + (v7 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_23:
  if (v5 < 2) {
    return 0;
  }
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  if (EnumTagSinglePayload >= 2) {
    return EnumTagSinglePayload - 1;
  }
  else {
    return 0;
  }
}

void sub_23BB40568(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9) {
    unsigned int v10 = v9 - 1;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v9) {
    size_t v11 = *(void *)(v8 + 64);
  }
  else {
    size_t v11 = *(void *)(v8 + 64) + 1;
  }
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v10;
  unsigned int v14 = a3 - v10;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v15 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v15))
      {
        int v6 = 4;
      }
      else if (v15 >= 0x100)
      {
        int v6 = 2;
      }
      else
      {
        int v6 = v15 > 1;
      }
    }
    else
    {
      int v6 = 1;
    }
  }
  if (v10 < a2)
  {
    unsigned int v16 = ~v10 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v18 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_28;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_28;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x23BB40788);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_27;
    default:
LABEL_27:
      if (a2)
      {
LABEL_28:
        if (v9 >= 2)
        {
          uint64_t v19 = a2 + 1;
          __swift_storeEnumTagSinglePayload((uint64_t)a1, v19, v9, v7);
        }
      }
      return;
  }
}

uint64_t sub_23BB407B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23BB44DCC();
  *a1 = result;
  return result;
}

uint64_t sub_23BB407DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23BB44DCC();
  *a1 = result;
  return result;
}

uint64_t sub_23BB40808()
{
  return sub_23BB44DDC();
}

uint64_t sub_23BB40838()
{
  return swift_getWitnessTable();
}

id sub_23BB4093C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  int v6 = (void *)sub_23BB4542C();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v6, a3, a4);

  return v7;
}

id sub_23BB409C0()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_secondarySystemBackgroundColor);
  id v2 = objc_msgSend(v0, sel_secondaryLabelColor);
  id v3 = objc_msgSend(v0, sel_labelColor);
  id v4 = objc_msgSend(v0, sel_tertiaryLabelColor);
  sub_23BB39C20();
  type metadata accessor for AppSwiftUIBridge();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v7 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 1);
  id result = sub_23BB4093C(0x697269687053, 0xE600000000000000, v6, v7);
  qword_26ADCCC38 = (uint64_t)v1;
  unk_26ADCCC40 = v2;
  qword_26ADCCC48 = (uint64_t)v3;
  unk_26ADCCC50 = v4;
  qword_26ADCCC58 = (uint64_t)result;
  return result;
}

id static SiriTipViewStyle.automatic.getter()
{
  if (qword_26ADCCC60 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_4(&qword_26ADCCC38);
  id v3 = v0;
  id v4 = v1;
  id v5 = v2;

  return v7;
}

id sub_23BB40B8C()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_secondarySystemBackgroundColor);
  id v2 = self;
  id v3 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 1);
  id v4 = objc_msgSend(v1, sel_resolvedColorWithTraitCollection_, v3);

  id v5 = objc_msgSend(v0, sel_secondaryLabelColor);
  id v6 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 1);
  id v7 = objc_msgSend(v5, sel_resolvedColorWithTraitCollection_, v6);

  id v8 = objc_msgSend(v0, sel_labelColor);
  id v9 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 1);
  id v10 = objc_msgSend(v8, sel_resolvedColorWithTraitCollection_, v9);

  id v11 = objc_msgSend(v0, sel_tertiaryLabelColor);
  id v12 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 1);
  id v13 = objc_msgSend(v11, sel_resolvedColorWithTraitCollection_, v12);

  sub_23BB39C20();
  type metadata accessor for AppSwiftUIBridge();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v15 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id result = sub_23BB4093C(0x697269687053, 0xE600000000000000, v15, objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 1));
  qword_268A7CF00 = (uint64_t)v4;
  *(void *)algn_268A7CF08 = v7;
  qword_268A7CF10 = (uint64_t)v10;
  unk_268A7CF18 = v13;
  qword_268A7CF20 = (uint64_t)result;
  return result;
}

id static SiriTipViewStyle.light.getter()
{
  if (qword_268A7C510 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_4(&qword_268A7CF00);
  id v3 = v0;
  id v4 = v1;
  id v5 = v2;

  return v7;
}

id sub_23BB40E70()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_secondarySystemBackgroundColor);
  id v2 = self;
  id v3 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 2);
  id v4 = objc_msgSend(v1, sel_resolvedColorWithTraitCollection_, v3);

  id v5 = objc_msgSend(v0, sel_secondaryLabelColor);
  id v6 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 2);
  id v7 = objc_msgSend(v5, sel_resolvedColorWithTraitCollection_, v6);

  id v8 = objc_msgSend(v0, sel_labelColor);
  id v9 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 2);
  id v10 = objc_msgSend(v8, sel_resolvedColorWithTraitCollection_, v9);

  id v11 = objc_msgSend(v0, sel_tertiaryLabelColor);
  id v12 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 2);
  id v13 = objc_msgSend(v11, sel_resolvedColorWithTraitCollection_, v12);

  sub_23BB39C20();
  type metadata accessor for AppSwiftUIBridge();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v15 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id result = sub_23BB4093C(0x697269687053, 0xE600000000000000, v15, objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 1));
  qword_268A7CF28 = (uint64_t)v4;
  unk_268A7CF30 = v7;
  qword_268A7CF38 = (uint64_t)v10;
  unk_268A7CF40 = v13;
  qword_268A7CF48 = (uint64_t)result;
  return result;
}

id static SiriTipViewStyle.dark.getter()
{
  if (qword_268A7C518 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_4(&qword_268A7CF28);
  id v3 = v0;
  id v4 = v1;
  id v5 = v2;

  return v7;
}

double SiriTipView.init<A>(intent:isVisible:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  sub_23BB445CC();
  sub_23BB445AC();
  uint64_t v13 = sub_23BB4458C();
  uint64_t v15 = v14;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a5 - 8) + 8))(a1, a5);
  sub_23BB43458(0, 0);
  *(void *)a6 = KeyPath;
  double result = 0.0;
  *(_OWORD *)(a6 + 8) = 0u;
  *(_OWORD *)(a6 + 24) = 0u;
  *(unsigned char *)(a6 + 40) = 0;
  *(void *)(a6 + 48) = a2;
  *(void *)(a6 + 56) = a3;
  *(unsigned char *)(a6 + 64) = a4;
  *(void *)(a6 + 72) = v13;
  *(void *)(a6 + 80) = v15;
  return result;
}

uint64_t SiriTipView.init(phrase:isVisible:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t result = swift_getKeyPath();
  *(void *)a6 = result;
  *(_OWORD *)(a6 + 8) = 0u;
  if (a2) {
    uint64_t v13 = a1;
  }
  else {
    uint64_t v13 = 0;
  }
  unint64_t v14 = 0xE000000000000000;
  *(_OWORD *)(a6 + 24) = 0uLL;
  if (a2) {
    unint64_t v14 = a2;
  }
  *(unsigned char *)(a6 + 40) = 0;
  *(void *)(a6 + 48) = a3;
  *(void *)(a6 + 56) = a4;
  *(unsigned char *)(a6 + 64) = a5;
  *(void *)(a6 + 72) = v13;
  *(void *)(a6 + 80) = v14;
  return result;
}

uint64_t SiriTipView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v63 = a1;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCD28);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_3();
  uint64_t v64 = v3;
  uint64_t v57 = sub_23BB44C7C();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_15();
  id v7 = (_OWORD *)(v6 - v5);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCC88);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_15();
  uint64_t v11 = v10 - v9;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCCA0);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_3();
  uint64_t v61 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCD78);
  MEMORY[0x270FA5388](v14 - 8);
  OUTLINED_FUNCTION_15();
  uint64_t v17 = v16 - v15;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCCF0);
  OUTLINED_FUNCTION_2_0();
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v60 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v62 = (uint64_t)&v55 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCC18);
  MEMORY[0x270FA5388](v22 - 8);
  OUTLINED_FUNCTION_15();
  uint64_t v25 = v24 - v23;
  uint64_t v26 = sub_23BB4498C();
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_3();
  uint64_t v29 = v28;
  memcpy(v70, v1, sizeof(v70));
  sub_23BB19EE0((uint64_t)&v70[48], (uint64_t)v71, &qword_26ADCCD98);
  sub_23BB19EE0((uint64_t)v71, (uint64_t)&v74, &qword_26ADCCD98);
  if (v75)
  {
    v77[0] = v74;
    v67[0] = v74;
    v67[1] = v75;
    LOBYTE(v67[2]) = v76;
    sub_23BB4371C((uint64_t)v70);
    sub_23BB43874(v71);
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCD90);
    MEMORY[0x23ECCF0E0](&v72, v30);
    sub_23BB438A8((uint64_t)v77);
    swift_release();
    sub_23BB43808((uint64_t)v70);
    if (v72 != 1) {
      goto LABEL_5;
    }
  }
  memcpy(v67, v70, 0x58uLL);
  sub_23BB419A8(v25);
  if (__swift_getEnumTagSinglePayload(v25, 1, v26) == 1)
  {
    sub_23BB24914(v25, &qword_26ADCCC18);
LABEL_5:
    swift_storeEnumTagMultiPayload();
    sub_23BB4349C();
    return sub_23BB44F6C();
  }
  uint64_t v55 = v29;
  uint64_t v56 = v27;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v29, v25, v26);
  *(void *)uint64_t v17 = sub_23BB44E5C();
  *(void *)(v17 + 8) = 0;
  *(unsigned char *)(v17 + 16) = 1;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCC90);
  sub_23BB42230(v29, v70, v17 + *(int *)(v32 + 44));
  uint64_t v33 = (char *)v7 + *(int *)(v57 + 20);
  uint64_t v34 = *MEMORY[0x263F19860];
  sub_23BB44EFC();
  OUTLINED_FUNCTION_2_0();
  (*(void (**)(char *, uint64_t))(v35 + 104))(v33, v34);
  __asm { FMOV            V0.2D, #8.0 }
  _OWORD *v7 = _Q0;
  long long v72 = *(_OWORD *)v70;
  v73[0] = *(_OWORD *)&v70[16];
  *(_OWORD *)((char *)v73 + 9) = *(_OWORD *)&v70[25];
  long long v68 = *(_OWORD *)v70;
  v69[0] = *(_OWORD *)&v70[16];
  *(_OWORD *)((char *)v69 + 9) = *(_OWORD *)&v70[25];
  sub_23BB4371C((uint64_t)v70);
  sub_23BB437C8((uint64_t)&v72, (void (*)(void, void, void, void, void, void))sub_23BB390D8);
  sub_23BB38EA0((uint64_t)v67);
  sub_23BB437C8((uint64_t)&v72, (void (*)(void, void, void, void, void, void))sub_23BB39198);
  sub_23BB43808((uint64_t)v70);
  uint64_t v41 = v67[0];
  uint64_t v42 = (void *)v67[1];
  uint64_t v43 = (void *)v67[2];
  uint64_t v44 = (void *)v67[4];

  uint64_t v45 = MEMORY[0x23ECCEFA0](v41);
  sub_23BB38740((uint64_t)v7, v11);
  uint64_t v46 = v58;
  *(void *)(v11 + *(int *)(v58 + 52)) = v45;
  *(_WORD *)(v11 + *(int *)(v46 + 56)) = 256;
  sub_23BB3880C((uint64_t)v7);
  sub_23BB4539C();
  sub_23BB44C8C();
  uint64_t v47 = v61;
  sub_23BB28D8C(v11, v61, &qword_26ADCCC88);
  memcpy((void *)(v47 + *(int *)(v59 + 36)), v67, 0x70uLL);
  sub_23BB24914(v11, &qword_26ADCCC88);
  uint64_t v48 = sub_23BB4539C();
  uint64_t v50 = v49;
  uint64_t v51 = (uint64_t)v60;
  uint64_t v52 = (uint64_t)&v60[*(int *)(v65 + 36)];
  sub_23BB28D8C(v47, v52, &qword_26ADCCCA0);
  uint64_t v53 = (uint64_t *)(v52 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCD20) + 36));
  *uint64_t v53 = v48;
  v53[1] = v50;
  sub_23BB28D8C(v17, v51, &qword_26ADCCD78);
  sub_23BB24914(v47, &qword_26ADCCCA0);
  sub_23BB24914(v17, &qword_26ADCCD78);
  uint64_t v54 = v62;
  sub_23BB19EE0(v51, v62, &qword_26ADCCCF0);
  sub_23BB28D8C(v54, v64, &qword_26ADCCCF0);
  swift_storeEnumTagMultiPayload();
  sub_23BB4349C();
  sub_23BB44F6C();
  sub_23BB24914(v54, &qword_26ADCCCF0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v56 + 8))(v55, v26);
}

uint64_t sub_23BB419A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCC20);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCDB0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCDA8);
  uint64_t v9 = MEMORY[0x270FA5388](v87);
  uint64_t v85 = (uint64_t)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v84 = (uint64_t)&v67 - v11;
  uint64_t v12 = sub_23BB4498C();
  uint64_t v88 = *(void *)(v12 - 8);
  uint64_t v89 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  unint64_t v17 = *(void *)(v1 + 80);
  if (!v17) {
    goto LABEL_5;
  }
  uint64_t v18 = (char *)&v67 - v16;
  uint64_t v19 = *(void **)(v1 + 8);
  uint64_t v81 = *(void **)v1;
  uint64_t v80 = *(void **)(v1 + 16);
  uint64_t v79 = *(void **)(v1 + 24);
  uint64_t v78 = *(void **)(v1 + 32);
  int v77 = *(unsigned __int8 *)(v1 + 40);
  uint64_t v86 = *(void *)(v1 + 48);
  uint64_t v83 = *(void *)(v1 + 56);
  int v82 = *(unsigned __int8 *)(v1 + 64);
  uint64_t v20 = *(void *)(v1 + 72);
  uint64_t v21 = sub_23BB42EFC();
  if (v22)
  {
    uint64_t v75 = a1;
    uint64_t v97 = v21;
    uint64_t v98 = v22;
    uint64_t v90 = 16421;
    unint64_t v91 = 0xE200000000000000;
    uint64_t v95 = v20;
    unint64_t v96 = v17;
    unint64_t v73 = sub_23BB39C60();
    sub_23BB455EC();
    swift_bridgeObjectRelease();
    char v76 = v18;
    sub_23BB4497C();
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    uint64_t v69 = swift_getKeyPath();
    unint64_t v68 = v17;
    uint64_t v71 = v20;
    uint64_t v24 = v81;
    uint64_t v97 = (uint64_t)v81;
    uint64_t v98 = v19;
    uint64_t v25 = v80;
    uint64_t v74 = (uint64_t)v8;
    uint64_t v26 = v79;
    uint64_t v99 = v80;
    uint64_t v100 = v79;
    uint64_t v70 = v15;
    uint64_t v27 = v78;
    v101 = v78;
    long long v72 = v5;
    char v28 = v77;
    char v102 = v77;
    sub_23BB390D8(v81, v19, v80, v79, v78, v77);
    uint64_t v29 = v86;
    uint64_t v30 = v83;
    sub_23BB43788(v86, v83);
    swift_bridgeObjectRetain();
    sub_23BB390D8(v24, v19, v25, v26, v27, v28);
    sub_23BB38EA0((uint64_t)&v90);
    sub_23BB39198(v24, v19, v25, v26, v27, v28);
    uint64_t v31 = v26;
    uint64_t v32 = v74;
    sub_23BB39198(v24, v19, v25, v31, v27, v28);
    sub_23BB43458(v29, v30);
    unint64_t v33 = v68;
    swift_bridgeObjectRelease();
    uint64_t v35 = (void *)v90;
    unint64_t v34 = v91;
    uint64_t v36 = v92;
    uint64_t v37 = v94;

    uint64_t v38 = v89;
    uint64_t v90 = MEMORY[0x23ECCEFA0](v34);
    unint64_t v39 = sub_23BB442DC();
    uint64_t v40 = v76;
    sub_23BB4496C();
    uint64_t v41 = v88;
    uint64_t v42 = v70;
    (*(void (**)(char *, char *, uint64_t))(v88 + 16))(v70, v40, v38);
    uint64_t v90 = v71;
    unint64_t v91 = v33;
    uint64_t v43 = sub_23BB44A6C();
    uint64_t v44 = (uint64_t)v72;
    __swift_storeEnumTagSinglePayload((uint64_t)v72, 1, 1, v43);
    sub_23BB44360();
    sub_23BB449FC();
    sub_23BB24914(v44, &qword_26ADCCC20);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v38);
    if (__swift_getEnumTagSinglePayload(v32, 1, v87) == 1)
    {
      sub_23BB24914(v32, &qword_26ADCCDB0);
      uint64_t v45 = v76;
    }
    else
    {
      uint64_t v48 = v32;
      uint64_t v49 = v84;
      sub_23BB19EE0(v48, v84, &qword_26ADCCDA8);
      sub_23BB28D8C(v49, v85, &qword_26ADCCDA8);
      uint64_t v50 = swift_getKeyPath();
      MEMORY[0x270FA5388](v50);
      uint64_t v74 = swift_getKeyPath();
      uint64_t v51 = v81;
      uint64_t v52 = v19;
      uint64_t v53 = v80;
      uint64_t v54 = v79;
      uint64_t v55 = v19;
      uint64_t v56 = v78;
      unint64_t v73 = v39;
      char v57 = v77;
      sub_23BB390D8(v81, v52, v80, v79, v78, v77);
      uint64_t v58 = v83;
      sub_23BB43788(v86, v83);
      swift_bridgeObjectRetain();
      sub_23BB390D8(v51, v55, v53, v54, v56, v57);
      sub_23BB38EA0((uint64_t)&v90);
      sub_23BB39198(v51, v55, v53, v54, v56, v57);
      sub_23BB39198(v51, v55, v53, v54, v56, v57);
      sub_23BB43458(v86, v58);
      swift_bridgeObjectRelease();
      uint64_t v59 = (void *)v90;
      uint64_t v60 = (void *)v91;
      uint64_t v61 = v92;
      uint64_t v62 = v76;
      uint64_t v63 = v94;

      uint64_t v38 = v89;
      uint64_t v95 = MEMORY[0x23ECCEFA0](v61);
      sub_23BB196A4(&qword_26ADCCDB8, &qword_26ADCCDA8);
      uint64_t v64 = v85;
      uint64_t v65 = (void (*)(uint64_t *, void))sub_23BB4499C();
      sub_23BB449BC();
      v65(&v90, 0);
      sub_23BB24914(v64, &qword_26ADCCDA8);
      sub_23BB24914(v84, &qword_26ADCCDA8);
      uint64_t v45 = v62;
    }
    uint64_t v66 = v75;
    (*(void (**)(uint64_t, char *, uint64_t))(v88 + 32))(v75, v45, v38);
    return __swift_storeEnumTagSinglePayload(v66, 0, 1, v38);
  }
  else
  {
LABEL_5:
    uint64_t v46 = v89;
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v46);
  }
}

uint64_t sub_23BB42230@<X0>(uint64_t a1@<X0>, const void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v64 = a1;
  uint64_t v69 = a3;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCD68);
  uint64_t v61 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v60 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCCD8);
  MEMORY[0x270FA5388](v67);
  uint64_t v59 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCCE0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v68 = (uint64_t)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v65 = (uint64_t)&v58 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(qword_26ADCCF20);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCD58);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  unint64_t v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCCB0);
  uint64_t v19 = v18 - 8;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v66 = (uint64_t)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v58 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v58 - v25;
  uint64_t v71 = v64;
  uint64_t v70 = a2;
  sub_23BB4526C();
  long long v74 = xmmword_23BB48910;
  uint64_t v75 = 0x401C000000000000;
  sub_23BB196A4((unint64_t *)&qword_26ADCCF18, qword_26ADCCF20);
  sub_23BB380E4();
  sub_23BB4515C();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v24, v17, v14);
  *(_WORD *)&v24[*(int *)(v19 + 44)] = 256;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v27 = (uint64_t)v24;
  char v28 = v63;
  sub_23BB19EE0(v27, (uint64_t)v26, &qword_26ADCCCB0);
  sub_23BB19EE0((uint64_t)v28 + 48, (uint64_t)v76, &qword_26ADCCD98);
  sub_23BB19EE0((uint64_t)v76, (uint64_t)&v74, &qword_26ADCCD98);
  if (*((void *)&v74 + 1))
  {
    uint64_t v29 = swift_allocObject();
    uint64_t v30 = memcpy((void *)(v29 + 16), v28, 0x58uLL);
    MEMORY[0x270FA5388](v30);
    *(&v58 - 2) = (uint64_t)v28;
    sub_23BB4371C((uint64_t)v28);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCD50);
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCD10);
    unint64_t v32 = sub_23BB44118();
    uint64_t v72 = v31;
    unint64_t v73 = v32;
    swift_getOpaqueTypeConformance2();
    unint64_t v33 = v60;
    sub_23BB4531C();
    char v34 = sub_23BB4507C();
    sub_23BB44B2C();
    uint64_t v36 = v35;
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    uint64_t v43 = v61;
    uint64_t v44 = v59;
    uint64_t v45 = v62;
    (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v59, v33, v62);
    uint64_t v46 = v67;
    uint64_t v47 = &v44[*(int *)(v67 + 36)];
    *uint64_t v47 = v34;
    *((void *)v47 + 1) = v36;
    *((void *)v47 + 2) = v38;
    *((void *)v47 + 3) = v40;
    *((void *)v47 + 4) = v42;
    v47[40] = 0;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v33, v45);
    uint64_t v48 = (uint64_t)v44;
    uint64_t v49 = v65;
    sub_23BB19EE0(v48, v65, &qword_26ADCCCD8);
    uint64_t v50 = 0;
    uint64_t v51 = v46;
  }
  else
  {
    uint64_t v50 = 1;
    uint64_t v49 = v65;
    uint64_t v51 = v67;
  }
  __swift_storeEnumTagSinglePayload(v49, v50, 1, v51);
  uint64_t v52 = v66;
  sub_23BB28D8C((uint64_t)v26, v66, &qword_26ADCCCB0);
  uint64_t v53 = v68;
  sub_23BB28D8C(v49, v68, &qword_26ADCCCE0);
  uint64_t v54 = v69;
  sub_23BB28D8C(v52, v69, &qword_26ADCCCB0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCCB8);
  uint64_t v56 = v54 + *(int *)(v55 + 48);
  *(void *)uint64_t v56 = 0;
  *(unsigned char *)(v56 + 8) = 1;
  sub_23BB28D8C(v53, v54 + *(int *)(v55 + 64), &qword_26ADCCCE0);
  sub_23BB24914(v49, &qword_26ADCCCE0);
  sub_23BB24914((uint64_t)v26, &qword_26ADCCCB0);
  sub_23BB24914(v53, &qword_26ADCCCE0);
  return sub_23BB24914(v52, &qword_26ADCCCB0);
}

uint64_t sub_23BB42980@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_23BB4498C();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v7 = sub_23BB4510C();
  uint64_t v9 = v8;
  char v11 = v10 & 1;
  sub_23BB450BC();
  uint64_t v12 = sub_23BB450EC();
  uint64_t v14 = v13;
  char v16 = v15;
  swift_release();
  sub_23BB29568(v7, v9, v11);
  swift_bridgeObjectRelease();
  sub_23BB4509C();
  uint64_t v17 = sub_23BB450CC();
  uint64_t v19 = v18;
  char v21 = v20;
  uint64_t v23 = v22;
  sub_23BB29568(v12, v14, v16 & 1);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v17;
  *(void *)(a2 + 8) = v19;
  *(unsigned char *)(a2 + 16) = v21 & 1;
  *(void *)(a2 + 24) = v23;
  return result;
}

uint64_t sub_23BB42B1C@<X0>(long long *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_23BB4524C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v8 = a1[1];
  long long v17 = *a1;
  v18[0] = v8;
  *(_OWORD *)((char *)v18 + 9) = *(long long *)((char *)a1 + 25);
  sub_23BB4371C((uint64_t)a1);
  sub_23BB437C8((uint64_t)&v17, (void (*)(void, void, void, void, void, void))sub_23BB390D8);
  sub_23BB38EA0((uint64_t)v16);
  sub_23BB437C8((uint64_t)&v17, (void (*)(void, void, void, void, void, void))sub_23BB39198);
  sub_23BB43808((uint64_t)a1);
  uint64_t v9 = (void *)v16[0];
  char v10 = (void *)v16[1];
  char v11 = (void *)v16[2];
  uint64_t v12 = v16[4];

  if (!v12) {
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
  }
  sub_23BB4522C();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F1B4B8], v4);
  uint64_t v13 = sub_23BB4525C();
  swift_release();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v13;
  return result;
}

uint64_t sub_23BB42CF0(uint64_t result)
{
  if (*(void *)(result + 56))
  {
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCD90);
    sub_23BB4536C();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_23BB42D78(long long *a1)
{
  uint64_t v2 = sub_23BB4523C();
  long long v3 = a1[1];
  long long v18 = *a1;
  v19[0] = v3;
  *(_OWORD *)((char *)v19 + 9) = *(long long *)((char *)a1 + 25);
  sub_23BB4371C((uint64_t)a1);
  sub_23BB437C8((uint64_t)&v18, (void (*)(void, void, void, void, void, void))sub_23BB390D8);
  sub_23BB38EA0((uint64_t)&v13);
  sub_23BB437C8((uint64_t)&v18, (void (*)(void, void, void, void, void, void))sub_23BB39198);
  sub_23BB43808((uint64_t)a1);
  uint64_t v4 = v13;
  uint64_t v5 = v14;
  uint64_t v6 = v16;
  uint64_t v7 = v17;

  long long v8 = (void *)MEMORY[0x23ECCEFA0](v6);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v10 = sub_23BB450BC();
  uint64_t v11 = swift_getKeyPath();
  uint64_t v13 = (void *)v2;
  uint64_t v14 = (void *)KeyPath;
  id v15 = v8;
  uint64_t v16 = v11;
  long long v17 = (void *)v10;
  sub_23BB4509C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ADCCD10);
  sub_23BB44118();
  sub_23BB4514C();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23BB42EFC()
{
  sub_23BB445CC();
  sub_23BB445AC();
  uint64_t v0 = sub_23BB4459C();
  uint64_t v2 = v1;
  swift_release();
  if (v2)
  {
    type metadata accessor for AppSwiftUIBridge();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v4 = self;
    id v5 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
    id v6 = objc_msgSend(v5, sel_localizations);
    if (!v6)
    {
      sub_23BB454CC();
      id v6 = (id)sub_23BB454BC();
      swift_bridgeObjectRelease();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A7CF68);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_23BB48300;
    *(void *)(v7 + 32) = v0;
    *(void *)(v7 + 40) = v2;
    long long v8 = (void *)sub_23BB454BC();
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(v4, sel_preferredLocalizationsFromArray_forPreferences_, v6, v8);

    uint64_t v10 = sub_23BB454CC();
    if (*(void *)(v10 + 16))
    {
      uint64_t v11 = *(void *)(v10 + 40);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v11 = 0;
    }
    swift_bridgeObjectRelease();
    long long v17 = (void *)sub_23BB4542C();
    long long v18 = (void *)sub_23BB4542C();
    if (v11)
    {
      uint64_t v19 = (void *)sub_23BB4542C();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v19 = 0;
    }
    id v20 = objc_msgSend(v5, sel_localizedStringForKey_value_table_localization_, v17, v18, 0, v19);

    uint64_t v16 = sub_23BB4545C();
  }
  else
  {
    if (qword_26ADCD0C8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_23BB44AFC();
    __swift_project_value_buffer(v12, (uint64_t)qword_26ADCDD10);
    uint64_t v13 = sub_23BB44ADC();
    os_log_type_t v14 = sub_23BB455AC();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_23BB16000, v13, v14, "Siri language unavailable, hiding tip", v15, 2u);
      MEMORY[0x23ECCFAB0](v15, -1, -1);
    }

    return 0;
  }
  return v16;
}

uint64_t sub_23BB43200()
{
  return sub_23BB4541C() & 1;
}

uint64_t sub_23BB4325C()
{
  return sub_23BB4540C();
}

void sub_23BB432A4()
{
}

uint64_t View.siriTipViewStyle(_:)()
{
  return swift_release();
}

uint64_t sub_23BB43358()
{
  sub_23BB443B0();

  return sub_23BB44E1C();
}

double sub_23BB433A0@<D0>(uint64_t a1@<X8>)
{
  sub_23BB43358();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_23BB433E8(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void **)(a1 + 8);
  long long v3 = *(void **)(a1 + 16);
  long long v4 = *(void **)(a1 + 24);
  id v5 = *(id *)(a1 + 32);
  id v6 = v1;
  id v7 = v2;
  id v8 = v3;
  id v9 = v4;
  return sub_23BB43560();
}

uint64_t sub_23BB43458(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_23BB4349C()
{
  unint64_t result = qword_26ADCCCE8;
  if (!qword_26ADCCCE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCCF0);
    sub_23BB196A4(&qword_26ADCCD70, &qword_26ADCCD78);
    sub_23BB196A4(&qword_26ADCCD18, &qword_26ADCCD20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCCE8);
  }
  return result;
}

uint64_t sub_23BB43560()
{
  return sub_23BB44E2C();
}

id sub_23BB435A8()
{
  if (qword_26ADCCC60 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26ADCCC38;
  uint64_t v1 = (void *)unk_26ADCCC40;
  uint64_t v2 = (void *)qword_26ADCCC48;
  id v8 = (id)unk_26ADCCC50;
  qword_26ADCDCE0 = qword_26ADCCC38;
  *(void *)algn_26ADCDCE8 = unk_26ADCCC40;
  qword_26ADCDCF0 = qword_26ADCCC48;
  unk_26ADCDCF8 = unk_26ADCCC50;
  qword_26ADCDD00 = qword_26ADCCC58;
  id v3 = (id)qword_26ADCCC58;
  id v4 = v0;
  id v5 = v1;
  id v6 = v2;

  return v8;
}

uint64_t *sub_23BB43654()
{
  if (qword_26ADCCC28 != -1) {
    swift_once();
  }
  return &qword_26ADCDCE0;
}

id sub_23BB436A0@<X0>(void *a1@<X8>)
{
  sub_23BB43654();
  uint64_t v2 = (void *)qword_26ADCDCE0;
  id v3 = *(void **)algn_26ADCDCE8;
  id v5 = (void *)qword_26ADCDCF0;
  uint64_t v4 = unk_26ADCDCF8;
  id v12 = (id)unk_26ADCDCF8;
  id v6 = (void *)qword_26ADCDD00;
  *a1 = qword_26ADCDCE0;
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v6;
  id v7 = v6;
  id v8 = v2;
  id v9 = v3;
  id v10 = v5;

  return v12;
}

uint64_t sub_23BB4371C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  sub_23BB390D8(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(void **)(a1 + 32), *(unsigned char *)(a1 + 40));
  sub_23BB43788(v2, v3);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23BB43788(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_23BB437C8(uint64_t a1, void (*a2)(void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_23BB43808(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  sub_23BB39198(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(void **)(a1 + 32), *(unsigned char *)(a1 + 40));
  sub_23BB43458(v2, v3);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *sub_23BB43874(uint64_t *a1)
{
  return a1;
}

uint64_t sub_23BB438A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_23BB438D4()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for SiriTipViewStyle(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for SiriTipViewStyle(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = *(void **)(a2 + 16);
  id v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  id v7 = *(void **)(a2 + 32);
  a1[4] = v7;
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  return a1;
}

uint64_t assignWithCopy for SiriTipViewStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  id v10 = *(void **)(a2 + 16);
  id v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  uint64_t v13 = *(void **)(a2 + 24);
  os_log_type_t v14 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v13;
  id v15 = v13;

  uint64_t v16 = *(void **)(a1 + 32);
  long long v17 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v17;
  id v18 = v17;

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

uint64_t assignWithTake for SiriTipViewStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  id v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTipViewStyle(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 40))
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

uint64_t storeEnumTagSinglePayload for SiriTipViewStyle(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for SiriTipViewStyle()
{
}

uint64_t destroy for SiriTipView(uint64_t a1)
{
  sub_23BB39198(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(void **)(a1 + 32), *(unsigned char *)(a1 + 40));
  if (*(void *)(a1 + 56))
  {
    swift_release();
    swift_release();
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriTipView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)(a2 + 8);
  id v6 = *(void **)(a2 + 16);
  id v7 = *(void **)(a2 + 24);
  id v8 = *(void **)(a2 + 32);
  char v9 = *(unsigned char *)(a2 + 40);
  sub_23BB390D8(*(void **)a2, v5, v6, v7, v8, v9);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  uint64_t v10 = *(void *)(a2 + 56);
  if (v10)
  {
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = v10;
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    swift_retain();
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  }
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v11;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriTipView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)(a2 + 8);
  id v6 = *(void **)(a2 + 16);
  id v7 = *(void **)(a2 + 24);
  id v8 = *(void **)(a2 + 32);
  char v9 = *(unsigned char *)(a2 + 40);
  sub_23BB390D8(*(void **)a2, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void **)a1;
  uint64_t v11 = *(void **)(a1 + 8);
  id v12 = *(void **)(a1 + 16);
  uint64_t v13 = *(void **)(a1 + 24);
  os_log_type_t v14 = *(void **)(a1 + 32);
  char v15 = *(unsigned char *)(a1 + 40);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  sub_23BB39198(v10, v11, v12, v13, v14, v15);
  uint64_t v16 = (_OWORD *)(a1 + 48);
  long long v17 = (_OWORD *)(a2 + 48);
  uint64_t v18 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56))
  {
    if (v18)
    {
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      swift_retain();
      swift_release();
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      swift_retain();
      swift_release();
      *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    }
    else
    {
      sub_23BB24914(a1 + 48, &qword_26ADCCD90);
      char v19 = *(unsigned char *)(a2 + 64);
      *uint64_t v16 = *v17;
      *(unsigned char *)(a1 + 64) = v19;
    }
  }
  else if (v18)
  {
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    swift_retain();
    swift_retain();
  }
  else
  {
    long long v20 = *v17;
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    *uint64_t v16 = v20;
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t assignWithTake for SiriTipView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  char v5 = *(unsigned char *)(a2 + 40);
  id v6 = *(void **)a1;
  id v7 = *(void **)(a1 + 8);
  id v8 = *(void **)(a1 + 16);
  char v9 = *(void **)(a1 + 24);
  uint64_t v10 = *(void **)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 40);
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v12;
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = v5;
  sub_23BB39198(v6, v7, v8, v9, v10, v11);
  if (!*(void *)(a1 + 56)) {
    goto LABEL_5;
  }
  uint64_t v13 = *(void *)(a2 + 56);
  if (!v13)
  {
    sub_23BB24914(a1 + 48, &qword_26ADCCD90);
LABEL_5:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    goto LABEL_6;
  }
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 56) = v13;
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
LABEL_6:
  uint64_t v14 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTipView(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 88))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 56);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriTipView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 88) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 88) = 0;
    }
    if (a2) {
      *(void *)(result + 56) = a2;
    }
  }
  return result;
}

void type metadata accessor for SiriTipView()
{
}

unint64_t sub_23BB43F7C()
{
  unint64_t result = qword_26ADCCD30;
  if (!qword_26ADCCD30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCD38);
    sub_23BB4349C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCD30);
  }
  return result;
}

uint64_t sub_23BB43FF8()
{
  return swift_getWitnessTable();
}

uint64_t sub_23BB44094@<X0>(uint64_t a1@<X8>)
{
  return sub_23BB42980(*(void *)(v1 + 16), a1);
}

uint64_t sub_23BB4409C@<X0>(uint64_t *a1@<X8>)
{
  return sub_23BB42B1C(*(long long **)(v1 + 16), a1);
}

uint64_t sub_23BB440A4()
{
  sub_23BB39198(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48), *(unsigned char *)(v0 + 56));
  if (*(void *)(v0 + 72))
  {
    swift_release();
    swift_release();
  }
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_23BB44108()
{
  return sub_23BB42CF0(v0 + 16);
}

uint64_t sub_23BB44110()
{
  return sub_23BB42D78(*(long long **)(v0 + 16));
}

unint64_t sub_23BB44118()
{
  unint64_t result = qword_26ADCCD08;
  if (!qword_26ADCCD08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCD10);
    sub_23BB441B8();
    sub_23BB196A4(&qword_26ADCCF08, &qword_26ADCCF10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCD08);
  }
  return result;
}

unint64_t sub_23BB441B8()
{
  unint64_t result = qword_26ADCCCC8;
  if (!qword_26ADCCCC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ADCCCD0);
    sub_23BB196A4(&qword_26ADCCD40, &qword_26ADCCD48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCCC8);
  }
  return result;
}

uint64_t sub_23BB44258@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23BB44CEC();
  *a1 = result;
  return result;
}

uint64_t sub_23BB44284()
{
  return sub_23BB44CFC();
}

void sub_23BB442BC()
{
}

unint64_t sub_23BB442DC()
{
  unint64_t result = qword_26ADCCC08;
  if (!qword_26ADCCC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCC08);
  }
  return result;
}

uint64_t sub_23BB4432C()
{
  return 8;
}

uint64_t sub_23BB44338()
{
  return swift_release();
}

uint64_t sub_23BB44340(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_23BB44354(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_23BB44360()
{
  unint64_t result = qword_26ADCCC10;
  if (!qword_26ADCCC10)
  {
    sub_23BB4498C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCC10);
  }
  return result;
}

unint64_t sub_23BB443B0()
{
  unint64_t result = qword_26ADCCC30;
  if (!qword_26ADCCC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADCCC30);
  }
  return result;
}

void type metadata accessor for SiriTipStyleKey()
{
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_23BB4442C()
{
  return MEMORY[0x270EE09B8]();
}

uint64_t sub_23BB4443C()
{
  return MEMORY[0x270EE09C8]();
}

uint64_t sub_23BB4446C()
{
  return MEMORY[0x270EE0A70]();
}

uint64_t sub_23BB4447C()
{
  return MEMORY[0x270EE0AE8]();
}

uint64_t sub_23BB4448C()
{
  return MEMORY[0x270EE0AF0]();
}

uint64_t sub_23BB4449C()
{
  return MEMORY[0x270EE0AF8]();
}

uint64_t sub_23BB444AC()
{
  return MEMORY[0x270EE0B00]();
}

uint64_t sub_23BB444BC()
{
  return MEMORY[0x270EE0B08]();
}

uint64_t sub_23BB444CC()
{
  return MEMORY[0x270EE0B10]();
}

uint64_t sub_23BB444DC()
{
  return MEMORY[0x270EE0B18]();
}

uint64_t sub_23BB444EC()
{
  return MEMORY[0x270EE0B20]();
}

uint64_t sub_23BB444FC()
{
  return MEMORY[0x270EE0BA8]();
}

uint64_t sub_23BB4450C()
{
  return MEMORY[0x270EE0BD8]();
}

uint64_t sub_23BB4451C()
{
  return MEMORY[0x270EE0BE0]();
}

uint64_t sub_23BB4452C()
{
  return MEMORY[0x270EE0BE8]();
}

uint64_t sub_23BB4453C()
{
  return MEMORY[0x270EE0C60]();
}

uint64_t sub_23BB4454C()
{
  return MEMORY[0x270EE0CA0]();
}

uint64_t sub_23BB4457C()
{
  return MEMORY[0x270EE0D48]();
}

uint64_t sub_23BB4458C()
{
  return MEMORY[0x270EE0D50]();
}

uint64_t sub_23BB4459C()
{
  return MEMORY[0x270EE0D58]();
}

uint64_t sub_23BB445AC()
{
  return MEMORY[0x270EE0D70]();
}

uint64_t sub_23BB445BC()
{
  return MEMORY[0x270EE0D80]();
}

uint64_t sub_23BB445CC()
{
  return MEMORY[0x270EE0D88]();
}

uint64_t sub_23BB445DC()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_23BB445EC()
{
  return MEMORY[0x270EE0FC0]();
}

uint64_t sub_23BB445FC()
{
  return MEMORY[0x270EE0FC8]();
}

uint64_t sub_23BB4460C()
{
  return MEMORY[0x270EE0FD0]();
}

uint64_t sub_23BB4462C()
{
  return MEMORY[0x270EE1018]();
}

uint64_t sub_23BB4463C()
{
  return MEMORY[0x270EE1020]();
}

uint64_t sub_23BB4464C()
{
  return MEMORY[0x270EE1140]();
}

uint64_t sub_23BB4465C()
{
  return MEMORY[0x270EE1148]();
}

uint64_t sub_23BB4466C()
{
  return MEMORY[0x270EE1150]();
}

uint64_t sub_23BB4468C()
{
  return MEMORY[0x270EE1200]();
}

uint64_t sub_23BB446AC()
{
  return MEMORY[0x270EE1348]();
}

uint64_t sub_23BB446BC()
{
  return MEMORY[0x270EE13A8]();
}

uint64_t sub_23BB446CC()
{
  return MEMORY[0x270EE13B8]();
}

uint64_t sub_23BB446DC()
{
  return MEMORY[0x270EE13C0]();
}

uint64_t sub_23BB446EC()
{
  return MEMORY[0x270EE1568]();
}

uint64_t sub_23BB446FC()
{
  return MEMORY[0x270EE15D0]();
}

uint64_t sub_23BB4470C()
{
  return MEMORY[0x270EE15D8]();
}

uint64_t sub_23BB4471C()
{
  return MEMORY[0x270EE1878]();
}

uint64_t sub_23BB4472C()
{
  return MEMORY[0x270EE1880]();
}

uint64_t sub_23BB4473C()
{
  return MEMORY[0x270EE18B0]();
}

uint64_t sub_23BB4474C()
{
  return MEMORY[0x270EE1988]();
}

uint64_t sub_23BB4475C()
{
  return MEMORY[0x270EE1990]();
}

uint64_t sub_23BB4476C()
{
  return MEMORY[0x270EE19B0]();
}

uint64_t sub_23BB4477C()
{
  return MEMORY[0x270EE19B8]();
}

uint64_t sub_23BB4478C()
{
  return MEMORY[0x270EE19C0]();
}

uint64_t sub_23BB4479C()
{
  return MEMORY[0x270EE1A00]();
}

uint64_t sub_23BB447BC()
{
  return MEMORY[0x270EE1A30]();
}

uint64_t sub_23BB447DC()
{
  return MEMORY[0x270EE1AF8]();
}

uint64_t sub_23BB447EC()
{
  return MEMORY[0x270EE1B08]();
}

uint64_t sub_23BB447FC()
{
  return MEMORY[0x270EE1B10]();
}

uint64_t sub_23BB4480C()
{
  return MEMORY[0x270EE1B18]();
}

uint64_t sub_23BB4481C()
{
  return MEMORY[0x270EE1B38]();
}

uint64_t sub_23BB4482C()
{
  return MEMORY[0x270EE1B40]();
}

uint64_t sub_23BB4483C()
{
  return MEMORY[0x270EE1B48]();
}

uint64_t sub_23BB4484C()
{
  return MEMORY[0x270EE1C30]();
}

uint64_t sub_23BB4485C()
{
  return MEMORY[0x270EE1CD0]();
}

uint64_t sub_23BB4486C()
{
  return MEMORY[0x270EE1E50]();
}

uint64_t sub_23BB4487C()
{
  return MEMORY[0x270EE1E58]();
}

uint64_t sub_23BB4488C()
{
  return MEMORY[0x270EE1E78]();
}

uint64_t sub_23BB4489C()
{
  return MEMORY[0x270EE1E80]();
}

uint64_t sub_23BB448AC()
{
  return MEMORY[0x270EE1E88]();
}

uint64_t sub_23BB448BC()
{
  return MEMORY[0x270EE1E90]();
}

uint64_t sub_23BB448CC()
{
  return MEMORY[0x270EE1E98]();
}

uint64_t sub_23BB448DC()
{
  return MEMORY[0x270EE1EB8]();
}

uint64_t sub_23BB448EC()
{
  return MEMORY[0x270EE1EC0]();
}

uint64_t sub_23BB448FC()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_23BB4490C()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_23BB4491C()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_23BB4492C()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_23BB4493C()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_23BB4494C()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_23BB4495C()
{
  return MEMORY[0x270EFEAE8]();
}

uint64_t sub_23BB4496C()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_23BB4497C()
{
  return MEMORY[0x270EEEB40]();
}

uint64_t sub_23BB4498C()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_23BB4499C()
{
  return MEMORY[0x270EEEE18]();
}

uint64_t sub_23BB449AC()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_23BB449BC()
{
  return MEMORY[0x270EEF180]();
}

uint64_t sub_23BB449CC()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_23BB449DC()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_23BB449EC()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_23BB449FC()
{
  return MEMORY[0x270EEF930]();
}

uint64_t sub_23BB44A0C()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_23BB44A1C()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_23BB44A2C()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23BB44A3C()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_23BB44A4C()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_23BB44A5C()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_23BB44A6C()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_23BB44A7C()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_23BB44A8C()
{
  return MEMORY[0x270FA17C0]();
}

uint64_t sub_23BB44A9C()
{
  return MEMORY[0x270FA1808]();
}

uint64_t sub_23BB44AAC()
{
  return MEMORY[0x270FA1810]();
}

uint64_t sub_23BB44ABC()
{
  return MEMORY[0x270FA1828]();
}

uint64_t sub_23BB44ACC()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_23BB44ADC()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23BB44AEC()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23BB44AFC()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23BB44B0C()
{
  return MEMORY[0x270F82250]();
}

uint64_t sub_23BB44B1C()
{
  return MEMORY[0x270F82258]();
}

uint64_t sub_23BB44B2C()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_23BB44B3C()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_23BB44B4C()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_23BB44B5C()
{
  return MEMORY[0x270EFF290]();
}

uint64_t sub_23BB44B6C()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_23BB44B7C()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_23BB44B8C()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_23BB44B9C()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_23BB44BAC()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_23BB44BBC()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_23BB44BEC()
{
  return MEMORY[0x270EFFBD0]();
}

uint64_t sub_23BB44BFC()
{
  return MEMORY[0x270EFFBD8]();
}

uint64_t sub_23BB44C0C()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_23BB44C1C()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_23BB44C2C()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_23BB44C3C()
{
  return MEMORY[0x270F00470]();
}

uint64_t sub_23BB44C4C()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_23BB44C5C()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_23BB44C6C()
{
  return MEMORY[0x270F00590]();
}

uint64_t sub_23BB44C7C()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_23BB44C8C()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_23BB44C9C()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_23BB44CAC()
{
  return MEMORY[0x270F00938]();
}

uint64_t sub_23BB44CBC()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_23BB44CCC()
{
  return MEMORY[0x270F00948]();
}

uint64_t sub_23BB44CDC()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_23BB44CEC()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_23BB44CFC()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_23BB44D0C()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_23BB44D1C()
{
  return MEMORY[0x270F00AA8]();
}

uint64_t sub_23BB44D2C()
{
  return MEMORY[0x270F00AB0]();
}

uint64_t sub_23BB44D3C()
{
  return MEMORY[0x270F00BF0]();
}

uint64_t sub_23BB44D4C()
{
  return MEMORY[0x270F00CE0]();
}

uint64_t sub_23BB44D5C()
{
  return MEMORY[0x270F00CE8]();
}

uint64_t sub_23BB44D6C()
{
  return MEMORY[0x270F00CF0]();
}

uint64_t sub_23BB44D7C()
{
  return MEMORY[0x270F00CF8]();
}

uint64_t sub_23BB44D8C()
{
  return MEMORY[0x270F00D40]();
}

uint64_t sub_23BB44D9C()
{
  return MEMORY[0x270F00D48]();
}

uint64_t sub_23BB44DAC()
{
  return MEMORY[0x270F00D70]();
}

uint64_t sub_23BB44DBC()
{
  return MEMORY[0x270F00D78]();
}

uint64_t sub_23BB44DCC()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_23BB44DDC()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_23BB44DEC()
{
  return MEMORY[0x270F00DC0]();
}

uint64_t sub_23BB44DFC()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_23BB44E0C()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_23BB44E1C()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_23BB44E2C()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_23BB44E4C()
{
  return MEMORY[0x270F01040]();
}

uint64_t sub_23BB44E5C()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_23BB44E6C()
{
  return MEMORY[0x270F01098]();
}

uint64_t sub_23BB44E7C()
{
  return MEMORY[0x270F010A0]();
}

uint64_t sub_23BB44E8C()
{
  return MEMORY[0x270F010A8]();
}

uint64_t sub_23BB44E9C()
{
  return MEMORY[0x270F010B0]();
}

uint64_t sub_23BB44EAC()
{
  return MEMORY[0x270F010B8]();
}

uint64_t sub_23BB44EBC()
{
  return MEMORY[0x270F010C8]();
}

uint64_t sub_23BB44ECC()
{
  return MEMORY[0x270F010D8]();
}

uint64_t sub_23BB44EDC()
{
  return MEMORY[0x270F010E8]();
}

uint64_t sub_23BB44EEC()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_23BB44EFC()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_23BB44F0C()
{
  return MEMORY[0x270F01490]();
}

uint64_t sub_23BB44F1C()
{
  return MEMORY[0x270F01540]();
}

uint64_t sub_23BB44F2C()
{
  return MEMORY[0x270F01548]();
}

uint64_t sub_23BB44F3C()
{
  return MEMORY[0x270F01550]();
}

uint64_t sub_23BB44F4C()
{
  return MEMORY[0x270F01558]();
}

uint64_t sub_23BB44F5C()
{
  return MEMORY[0x270F01560]();
}

uint64_t sub_23BB44F6C()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_23BB44F7C()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_23BB44F8C()
{
  return MEMORY[0x270F01FF8]();
}

uint64_t sub_23BB44F9C()
{
  return MEMORY[0x270F02000]();
}

uint64_t sub_23BB44FAC()
{
  return MEMORY[0x270F02008]();
}

uint64_t sub_23BB44FBC()
{
  return MEMORY[0x270F02010]();
}

uint64_t sub_23BB44FCC()
{
  return MEMORY[0x270F02018]();
}

uint64_t sub_23BB44FDC()
{
  return MEMORY[0x270F02228]();
}

uint64_t sub_23BB44FEC()
{
  return MEMORY[0x270F02338]();
}

uint64_t sub_23BB44FFC()
{
  return MEMORY[0x270F02340]();
}

uint64_t sub_23BB4500C()
{
  return MEMORY[0x270F02348]();
}

uint64_t sub_23BB4501C()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_23BB4502C()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_23BB4503C()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_23BB4504C()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_23BB4505C()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_23BB4506C()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_23BB4507C()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_23BB4508C()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_23BB4509C()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_23BB450AC()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_23BB450BC()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_23BB450CC()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_23BB450DC()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_23BB450EC()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_23BB450FC()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_23BB4510C()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_23BB4511C()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_23BB4512C()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_23BB4513C()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_23BB4514C()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_23BB4515C()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_23BB4516C()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_23BB4517C()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_23BB4518C()
{
  return MEMORY[0x270F034E8]();
}

uint64_t sub_23BB4519C()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_23BB451AC()
{
  return MEMORY[0x270F03768]();
}

uint64_t sub_23BB451BC()
{
  return MEMORY[0x270F03DB0]();
}

uint64_t sub_23BB451CC()
{
  return MEMORY[0x270F03DF0]();
}

uint64_t sub_23BB451DC()
{
  return MEMORY[0x270F03E50]();
}

uint64_t sub_23BB451EC()
{
  return MEMORY[0x270F040E0]();
}

uint64_t sub_23BB451FC()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_23BB4520C()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_23BB4521C()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_23BB4522C()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_23BB4523C()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_23BB4524C()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_23BB4525C()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_23BB4526C()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_23BB4527C()
{
  return MEMORY[0x270F04760]();
}

uint64_t sub_23BB4528C()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_23BB4529C()
{
  return MEMORY[0x270F04778]();
}

uint64_t sub_23BB452AC()
{
  return MEMORY[0x270F04780]();
}

uint64_t sub_23BB452BC()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_23BB452CC()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_23BB452DC()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_23BB452EC()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_23BB452FC()
{
  return MEMORY[0x270F04870]();
}

uint64_t sub_23BB4530C()
{
  return MEMORY[0x270F048A0]();
}

uint64_t sub_23BB4531C()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_23BB4532C()
{
  return MEMORY[0x270F048B8]();
}

uint64_t sub_23BB4533C()
{
  return MEMORY[0x270F04AB8]();
}

uint64_t sub_23BB4534C()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_23BB4535C()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_23BB4536C()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_23BB4537C()
{
  return MEMORY[0x270F04F98]();
}

uint64_t sub_23BB4538C()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_23BB4539C()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_23BB453AC()
{
  return MEMORY[0x270F05238]();
}

uint64_t sub_23BB453BC()
{
  return MEMORY[0x270F05250]();
}

uint64_t sub_23BB453CC()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23BB453DC()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23BB453EC()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_23BB453FC()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_23BB4540C()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_23BB4541C()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23BB4542C()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23BB4543C()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_23BB4544C()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_23BB4545C()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23BB4546C()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_23BB4547C()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23BB4548C()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23BB4549C()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_23BB454AC()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23BB454BC()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23BB454CC()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23BB454DC()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23BB454FC()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t sub_23BB4550C()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_23BB4551C()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_23BB4552C()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_23BB4553C()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_23BB4554C()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_23BB4555C()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_23BB4556C()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_23BB4557C()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_23BB4558C()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23BB4559C()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23BB455AC()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23BB455BC()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23BB455CC()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23BB455DC()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23BB455EC()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_23BB455FC()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23BB4560C()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23BB4561C()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_23BB4562C()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23BB4563C()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23BB4564C()
{
  return MEMORY[0x270F9E9B8]();
}

uint64_t sub_23BB4565C()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23BB4566C()
{
  return MEMORY[0x270F9EDD8]();
}

uint64_t sub_23BB4567C()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23BB4568C()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23BB4569C()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23BB456BC()
{
  return MEMORY[0x270F9F248]();
}

uint64_t sub_23BB456CC()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_23BB456DC()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_23BB456EC()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23BB456FC()
{
  return MEMORY[0x270F9F578]();
}

uint64_t sub_23BB4570C()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23BB4571C()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_23BB4572C()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_23BB4573C()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_23BB4574C()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_23BB4575C()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_23BB4576C()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_23BB4577C()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23BB4578C()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23BB4579C()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23BB457AC()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_23BB457BC()
{
  return MEMORY[0x270FA0128]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}