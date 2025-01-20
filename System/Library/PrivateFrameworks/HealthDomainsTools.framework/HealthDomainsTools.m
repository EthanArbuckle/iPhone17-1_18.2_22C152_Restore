uint64_t static UsoEntity_common_HealthLog.with(healthLogName:areaType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  _s12SiriOntology26UsoEntity_common_HealthLogC0F12DomainsToolsE7builder06healthG4Name8areaType0kgL19IdentifierNamespace17measurementNeededAA0cd8Builder_e1_fG0CSSSg_A2LSbtFZ_0(a1, a2, a3, a4, 0, 0, 0);
  MEMORY[0x22A6C3FC0]();
  sub_22A305150();
  sub_22A305130();
  swift_release();
  swift_release();
  return v5;
}

uint64_t variable initialization expression of DialogFlow.parameters()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of DialogFlow.snippets()
{
  return MEMORY[0x263F8EE78];
}

double variable initialization expression of FlowConfigModel.deviceState@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of FlowConfigModel.aceService@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of FlowConfigModel.aceServiceAsync@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of FlowConfigModel.sharedContextService@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of FlowConfigModel.outputPublisher@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of FlowConfigModel.flowFinder@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of FlowConfigModel.networkStatusProvider@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t variable initialization expression of OutputFlow.rrEntities()
{
  return 0;
}

uint64_t _s12SiriOntology26UsoEntity_common_HealthLogC0F12DomainsToolsE7builder06healthG4Name8areaType0kgL19IdentifierNamespace17measurementNeededAA0cd8Builder_e1_fG0CSSSg_A2LSbtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v23 = a7;
  uint64_t v22 = a1;
  uint64_t v21 = sub_22A304F60();
  uint64_t v10 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388]();
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A3054E0();
  swift_allocObject();
  uint64_t v13 = sub_22A3054D0();
  if (a2)
  {
    sub_22A3050F0();
    uint64_t v20 = a4;
    swift_allocObject();
    swift_bridgeObjectRetain_n();
    uint64_t v14 = MEMORY[0x22A6C4000](v22, a2);
    uint64_t v18 = v13;
    uint64_t v19 = a3;
    uint64_t v15 = v14;
    swift_bridgeObjectRetain();
    sub_22A304F30();
    sub_22A304EF0();
    uint64_t v13 = v18;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v21);
    uint64_t v24 = v15;
    a4 = v20;
    sub_22A304F80();
    a3 = v19;
    swift_release();
  }
  if (a4)
  {
    _s12SiriOntology31UsoEntity_common_GeographicAreaC18HealthDomainsToolsE7builder8areaTypeAA0cd8Builder_e1_fG0CSSSg_tFZ_0(a3, a4);
    sub_22A3054B0();
    swift_release();
  }
  if (v23)
  {
    sub_22A3055A0();
    swift_allocObject();
    sub_22A305590();
    sub_22A3054C0();
    swift_release();
  }
  return v13;
}

uint64_t static USOParse.startWorkout(_:appIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v60 = a3;
  uint64_t v61 = a5;
  uint64_t v59 = sub_22A305C80();
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  v58 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683717F0);
  MEMORY[0x270FA5388](v9 - 8);
  v56 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683717F8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_22A304DA0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v55 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v54 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371800);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371808);
  MEMORY[0x270FA5388](v23 - 8);
  v25 = (char *)&v54 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371810);
  MEMORY[0x270FA5388](v26 - 8);
  v28 = (char *)&v54 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_22A3051B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 1, 1, v29);
  uint64_t v30 = sub_22A305480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v25, 1, 1, v30);
  uint64_t v31 = sub_22A3051E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v22, 1, 1, v31);
  uint64_t v53 = v60;
  uint64_t v54 = a1;
  uint64_t v60 = a2;
  sub_22A3042DC(a1, a2, (uint64_t)v28, (uint64_t)v25, 0, 1, 0, 0, (uint64_t)v22, v53, a4);
  sub_22A3056E0();
  swift_allocObject();
  uint64_t v32 = sub_22A3056D0();
  sub_22A3052E0();
  swift_release();
  sub_22A2E2868((uint64_t)v22, &qword_268371800);
  sub_22A2E2868((uint64_t)v25, &qword_268371808);
  sub_22A2E2868((uint64_t)v28, &qword_268371810);
  static Siri_Nlu_External_UserParse.with(task:hasCancelled:)(v32, 0, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_22A2E2868((uint64_t)v13, &qword_2683717F8);
    if (qword_268371458 != -1) {
      swift_once();
    }
    uint64_t v33 = v59;
    uint64_t v34 = __swift_project_value_buffer(v59, (uint64_t)static Logger.common);
    swift_beginAccess();
    uint64_t v36 = v57;
    v35 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v58, v34, v33);
    uint64_t v37 = v60;
    swift_bridgeObjectRetain_n();
    v38 = sub_22A305C60();
    os_log_type_t v39 = sub_22A305E50();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v63 = v37;
      uint64_t v64 = v41;
      *(_DWORD *)v40 = 136315138;
      uint64_t v62 = v54;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268371818);
      uint64_t v42 = sub_22A305EC0();
      uint64_t v62 = sub_22A2E2200(v42, v43, &v64);
      sub_22A305ED0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A2DE000, v38, v39, "Failed to create USOParse for workout task: %s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6C55A0](v41, -1, -1);
      MEMORY[0x22A6C55A0](v40, -1, -1);
      swift_release();

      (*(void (**)(char *, uint64_t))(v36 + 8))(v58, v59);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v33);
    }
    uint64_t v51 = v61;
    uint64_t v52 = sub_22A304D30();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v51, 1, 1, v52);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v19, v13, v14);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v55, v19, v14);
    uint64_t v44 = *MEMORY[0x263F71468];
    uint64_t v45 = sub_22A304D40();
    uint64_t v46 = *(void *)(v45 - 8);
    v47 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 104))(v56, v44, v45);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v47, 0, 1, v45);
    uint64_t v48 = v61;
    sub_22A304D20();
    swift_release();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v14);
    uint64_t v49 = sub_22A304D30();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 0, 1, v49);
  }
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

uint64_t static USOParse.pauseWorkout(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return static USOParse.modifyWorkout(_:verb:)(a1, a2, 0, a3);
}

uint64_t static USOParse.modifyWorkout(_:verb:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v46 = a4;
  uint64_t v7 = sub_22A305C80();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v44 = v7;
  uint64_t v45 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683717F0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683717F8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_22A304DA0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)v42 - v22;
  uint64_t v43 = a1;
  uint64_t v24 = _s12SiriOntology7UsoTaskC18HealthDomainsToolsE13modifyWorkout_4verbAA0C37_VerbTemplateBuilder_ReferenceControlCyAA0c6Entitym8_common_I0CGSSSg_AD06ModifyidK0OtFZ_0(a1, a2, a3);
  static Siri_Nlu_External_UserParse.with(task:hasCancelled:)(v24, 0, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_22A2E2868((uint64_t)v16, &qword_2683717F8);
    if (qword_268371458 != -1) {
      swift_once();
    }
    uint64_t v25 = v44;
    uint64_t v26 = __swift_project_value_buffer(v44, (uint64_t)static Logger.common);
    swift_beginAccess();
    uint64_t v27 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v10, v26, v25);
    swift_bridgeObjectRetain_n();
    v28 = sub_22A305C60();
    os_log_type_t v29 = sub_22A305E50();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v48 = a2;
      uint64_t v49 = v31;
      *(_DWORD *)uint64_t v30 = 136315138;
      v42[1] = v30 + 4;
      uint64_t v47 = v43;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268371818);
      uint64_t v32 = sub_22A305EC0();
      uint64_t v47 = sub_22A2E2200(v32, v33, &v49);
      sub_22A305ED0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A2DE000, v28, v29, "Failed to create USOParse for workout task: %s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6C55A0](v31, -1, -1);
      MEMORY[0x22A6C55A0](v30, -1, -1);
      swift_release();

      (*(void (**)(char *, uint64_t))(v45 + 8))(v10, v25);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v25);
    }
    uint64_t v40 = v46;
    uint64_t v41 = sub_22A304D30();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v40, 1, 1, v41);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v23, v16, v17);
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, v17);
    uint64_t v34 = *MEMORY[0x263F71468];
    uint64_t v35 = sub_22A304D40();
    uint64_t v36 = *(void *)(v35 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 104))(v13, v34, v35);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v13, 0, 1, v35);
    uint64_t v37 = v46;
    sub_22A304D20();
    swift_release();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v23, v17);
    uint64_t v38 = sub_22A304D30();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v37, 0, 1, v38);
  }
}

uint64_t static USOParse.endWorkout(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return static USOParse.modifyWorkout(_:verb:)(a1, a2, 1, a3);
}

uint64_t static USOParse.resumeWorkout(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return static USOParse.modifyWorkout(_:verb:)(a1, a2, 2, a3);
}

uint64_t static USOParse.cancelWorkout(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22A2E1438(a1, a2, MEMORY[0x263F73530], MEMORY[0x263F73528], MEMORY[0x263F733C8], a3);
}

uint64_t static USOParse.noVerbWorkout(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22A2E1438(a1, a2, MEMORY[0x263F73540], MEMORY[0x263F73538], MEMORY[0x263F72440], a3);
}

uint64_t sub_22A2E1438@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(void)@<X2>, uint64_t (*a4)(void)@<X3>, void (*a5)(uint64_t)@<X4>, uint64_t a6@<X8>)
{
  uint64_t v63 = a4;
  uint64_t v64 = a5;
  uint64_t v62 = a3;
  uint64_t v65 = a6;
  uint64_t v61 = sub_22A305C80();
  uint64_t v59 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v60 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683717F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v57 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683717F8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_22A304DA0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v56 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v54 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371800);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371808);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (char *)&v54 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371810);
  MEMORY[0x270FA5388](v26 - 8);
  v28 = (char *)&v54 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_22A3051B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 1, 1, v29);
  uint64_t v30 = sub_22A305480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v25, 1, 1, v30);
  uint64_t v31 = sub_22A3051E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v22, 1, 1, v31);
  uint64_t v55 = a1;
  uint64_t v58 = a2;
  uint64_t v32 = sub_22A3042DC(a1, a2, (uint64_t)v28, (uint64_t)v25, 0, 1, 0, 0, (uint64_t)v22, 0, 0);
  sub_22A2E2868((uint64_t)v22, &qword_268371800);
  sub_22A2E2868((uint64_t)v25, &qword_268371808);
  sub_22A2E2868((uint64_t)v28, &qword_268371810);
  v62(0);
  swift_allocObject();
  uint64_t v33 = v63();
  v64(v32);
  swift_release();
  static Siri_Nlu_External_UserParse.with(task:hasCancelled:)(v33, 1, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_22A2E2868((uint64_t)v13, &qword_2683717F8);
    if (qword_268371458 != -1) {
      swift_once();
    }
    uint64_t v34 = v61;
    uint64_t v35 = __swift_project_value_buffer(v61, (uint64_t)static Logger.common);
    swift_beginAccess();
    uint64_t v37 = v59;
    uint64_t v36 = v60;
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v60, v35, v34);
    uint64_t v38 = v58;
    swift_bridgeObjectRetain_n();
    os_log_type_t v39 = sub_22A305C60();
    os_log_type_t v40 = sub_22A305E50();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      uint64_t v67 = v38;
      uint64_t v68 = v42;
      *(_DWORD *)uint64_t v41 = 136315138;
      uint64_t v66 = v55;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268371818);
      uint64_t v43 = sub_22A305EC0();
      uint64_t v66 = sub_22A2E2200(v43, v44, &v68);
      sub_22A305ED0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A2DE000, v39, v40, "Failed to create USOParse for workout task: %s", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6C55A0](v42, -1, -1);
      MEMORY[0x22A6C55A0](v41, -1, -1);
      swift_release();

      (*(void (**)(char *, uint64_t))(v37 + 8))(v60, v61);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v36, v34);
    }
    uint64_t v52 = v65;
    uint64_t v53 = sub_22A304D30();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v52, 1, 1, v53);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v19, v13, v14);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v56, v19, v14);
    uint64_t v45 = *MEMORY[0x263F71468];
    uint64_t v46 = sub_22A304D40();
    uint64_t v47 = *(void *)(v46 - 8);
    uint64_t v48 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 104))(v57, v45, v46);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v48, 0, 1, v46);
    uint64_t v49 = v65;
    sub_22A304D20();
    swift_release();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v14);
    uint64_t v50 = sub_22A304D30();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v49, 0, 1, v50);
  }
}

uint64_t static USOParse.accept()@<X0>(uint64_t a1@<X8>)
{
  return sub_22A2E1C68((Class *)0x263F739A0, "Failed to create USOParse for accepted UDA", a1);
}

uint64_t static USOParse.reject()@<X0>(uint64_t a1@<X8>)
{
  return sub_22A2E1C68((Class *)0x263F739C0, "Failed to create USOParse for reject UDA", a1);
}

uint64_t sub_22A2E1C68@<X0>(Class *a1@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v36 = a3;
  uint64_t v4 = sub_22A305C80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683717F0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683717F8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_22A304DA0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v34 - v19;
  id v21 = objc_msgSend(objc_allocWithZone(*a1), sel_init);
  sub_22A304EA0();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    uint64_t v22 = v36;
    sub_22A2E2868((uint64_t)v13, &qword_2683717F8);
    if (qword_268371458 != -1) {
      swift_once();
    }
    uint64_t v23 = __swift_project_value_buffer(v4, (uint64_t)static Logger.common);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v23, v4);
    uint64_t v24 = sub_22A305C60();
    os_log_type_t v25 = sub_22A305E50();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_22A2DE000, v24, v25, v35, v26, 2u);
      MEMORY[0x22A6C55A0](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v27 = sub_22A304D30();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v22, 1, 1, v27);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v13, v14);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v20, v14);
    uint64_t v29 = *MEMORY[0x263F71468];
    uint64_t v30 = sub_22A304D40();
    uint64_t v31 = *(void *)(v30 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 104))(v10, v29, v30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v10, 0, 1, v30);
    uint64_t v32 = v36;
    sub_22A304D20();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
    uint64_t v33 = sub_22A304D30();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v32, 0, 1, v33);
  }
}

uint64_t sub_22A2E2114(uint64_t result, unsigned char **a2)
{
  v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_22A2E2124(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_22A2E2160(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_22A2E2188(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_22A2E2200(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_22A305ED0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_22A2E2200(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22A2E22D4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22A2E294C((uint64_t)v12, *a3);
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
      sub_22A2E294C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_22A2E22D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22A305EE0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22A2E2490(a5, a6);
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
  uint64_t v8 = sub_22A305F70();
  if (!v8)
  {
    sub_22A306030();
    __break(1u);
LABEL_17:
    uint64_t result = sub_22A306070();
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

uint64_t sub_22A2E2490(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22A2E2528(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22A2E2708(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22A2E2708(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22A2E2528(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_22A2E26A0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_22A305F40();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_22A306030();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_22A305D90();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_22A306070();
    __break(1u);
LABEL_14:
    uint64_t result = sub_22A306030();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_22A2E26A0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268371820);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22A2E2708(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268371820);
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
  uint64_t result = sub_22A306070();
  __break(1u);
  return result;
}

unsigned char **sub_22A2E2858(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_22A2E2868(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t sub_22A2E294C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t DialogFlow.catId.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DialogFlow.init(catId:wrapper:parameters:snippets:deviceState:aceService:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, long long *a6@<X5>, long long *a7@<X6>, void *a8@<X8>)
{
  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  sub_22A2E2A30(a6, (uint64_t)(a8 + 5));
  return sub_22A2E2A30(a7, (uint64_t)(a8 + 10));
}

uint64_t sub_22A2E2A30(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t DialogFlow.on(input:)()
{
  return 1;
}

uint64_t DialogFlow.execute(completion:)(void (*a1)(char *), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v78 = a2;
  v77 = a1;
  uint64_t v67 = sub_22A304C50();
  uint64_t v66 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v65 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_22A304C70();
  uint64_t v5 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v63 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371828);
  uint64_t v7 = MEMORY[0x270FA5388](v68);
  v69 = (void **)((char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v60 - v9;
  uint64_t v11 = sub_22A305C80();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v62 = (char *)&v60 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v60 - v18;
  if (qword_268371458 != -1) {
    swift_once();
  }
  uint64_t v20 = __swift_project_value_buffer(v11, (uint64_t)static Logger.common);
  swift_beginAccess();
  id v21 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v72 = v20;
  uint64_t v71 = v12 + 16;
  v70 = v21;
  v21(v19, v20, v11);
  sub_22A2E38B0(v3, (uint64_t)&v81);
  uint64_t v22 = sub_22A305C60();
  os_log_type_t v23 = sub_22A305E40();
  BOOL v24 = os_log_type_enabled(v22, v23);
  v76 = v10;
  uint64_t v75 = v11;
  uint64_t v74 = v12;
  uint64_t v64 = v15;
  if (v24)
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v61 = v5;
    uint64_t v26 = (uint8_t *)v25;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v80 = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    uint64_t v28 = v81;
    unint64_t v29 = v82;
    swift_bridgeObjectRetain();
    uint64_t v79 = sub_22A2E2200(v28, v29, &v80);
    uint64_t v12 = v74;
    uint64_t v10 = v76;
    sub_22A305ED0();
    swift_bridgeObjectRelease();
    sub_22A2E38E8((uint64_t)&v81);
    _os_log_impl(&dword_22A2DE000, v22, v23, "Executing dialog: %s", v26, 0xCu);
    swift_arrayDestroy();
    uint64_t v30 = v27;
    uint64_t v11 = v75;
    MEMORY[0x22A6C55A0](v30, -1, -1);
    uint64_t v31 = v26;
    uint64_t v5 = v61;
    MEMORY[0x22A6C55A0](v31, -1, -1);
  }
  else
  {
    sub_22A2E38E8((uint64_t)&v81);
  }

  uint64_t v32 = *(void (**)(char *, uint64_t))(v12 + 8);
  v32(v19, v11);
  sub_22A305AA0();
  uint64_t v33 = v69;
  sub_22A2E3918((uint64_t)v10, (uint64_t)v69);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v34 = *v33;
    uint64_t v35 = v62;
    v70(v62, v72, v11);
    sub_22A2E38B0(v3, (uint64_t)&v81);
    uint64_t v36 = sub_22A305C60();
    os_log_type_t v37 = sub_22A305E50();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v73 = (uint64_t)v32;
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      uint64_t v80 = v39;
      *(_DWORD *)uint64_t v38 = 136315138;
      uint64_t v40 = v81;
      unint64_t v41 = v82;
      swift_bridgeObjectRetain();
      uint64_t v79 = sub_22A2E2200(v40, v41, &v80);
      uint64_t v32 = (void (*)(char *, uint64_t))v73;
      sub_22A305ED0();
      swift_bridgeObjectRelease();
      sub_22A2E38E8((uint64_t)&v81);
      _os_log_impl(&dword_22A2DE000, v36, v37, "Failed to execute CAT: %s", v38, 0xCu);
      swift_arrayDestroy();
      uint64_t v42 = v39;
      uint64_t v11 = v75;
      MEMORY[0x22A6C55A0](v42, -1, -1);
      MEMORY[0x22A6C55A0](v38, -1, -1);
    }
    else
    {
      sub_22A2E38E8((uint64_t)&v81);
    }

    v32(v35, v11);
    uint64_t v48 = v64;
    v70(v64, v72, v11);
    id v49 = v34;
    id v50 = v34;
    uint64_t v51 = sub_22A305C60();
    os_log_type_t v52 = sub_22A305E50();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v80 = (uint64_t)v34;
      uint64_t v81 = v54;
      *(_DWORD *)uint64_t v53 = 136315138;
      id v55 = v34;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268371830);
      uint64_t v56 = sub_22A305D30();
      uint64_t v80 = sub_22A2E2200(v56, v57, &v81);
      sub_22A305ED0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22A2DE000, v51, v52, "Error: %s", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6C55A0](v54, -1, -1);
      MEMORY[0x22A6C55A0](v53, -1, -1);

      v32(v48, v75);
    }
    else
    {

      v32(v48, v11);
    }
    uint64_t v58 = (uint64_t)v76;
    uint64_t v59 = v65;
    sub_22A304C30();
    v77(v59);

    (*(void (**)(char *, uint64_t))(v66 + 8))(v59, v67);
    return sub_22A2E3980(v58);
  }
  else
  {
    uint64_t v43 = v63;
    (*(void (**)(char *, void **, uint64_t))(v5 + 32))(v63, v33, v73);
    __swift_project_boxed_opaque_existential_1((void *)(v3 + 40), *(void *)(v3 + 64));
    sub_22A304B10();
    sub_22A304BC0();
    swift_allocObject();
    sub_22A304BB0();
    __swift_project_boxed_opaque_existential_1((void *)(v3 + 40), *(void *)(v3 + 64));
    sub_22A304B10();
    unint64_t v44 = (void *)sub_22A304BA0();
    swift_release();
    sub_22A2E3A24(v3 + 80, (uint64_t)&v81);
    __swift_project_boxed_opaque_existential_1(&v81, v83);
    uint64_t v45 = swift_allocObject();
    uint64_t v46 = v78;
    *(void *)(v45 + 16) = v77;
    *(void *)(v45 + 24) = v46;
    sub_22A2E3AC8();
    swift_retain();
    sub_22A304C90();

    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v43, v73);
    sub_22A2E3980((uint64_t)v10);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v81);
  }
}

uint64_t sub_22A2E346C(uint64_t a1, void (*a2)(char *))
{
  uint64_t v3 = sub_22A304C50();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A304C30();
  a2(v6);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_22A2E3548()
{
  return 1;
}

uint64_t sub_22A2E3550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_22A2E3600;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t sub_22A2E3600(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_22A2E3700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_22A2E37B4;
  return MEMORY[0x270F66CD0](a1, a2, a3);
}

uint64_t sub_22A2E37B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22A2E38B0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22A2E38E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_22A2E3918(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371828);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A2E3980(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371828);
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

uint64_t sub_22A2E3A24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22A2E3A88()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A2E3AC0(uint64_t a1)
{
  return sub_22A2E346C(a1, *(void (**)(char *))(v1 + 16));
}

unint64_t sub_22A2E3AC8()
{
  unint64_t result = qword_268371838[0];
  if (!qword_268371838[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_268371838);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DialogFlow(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DialogFlow(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a1 + 40);
  return __swift_destroy_boxed_opaque_existential_0(a1 + 80);
}

uint64_t initializeWithCopy for DialogFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v6 = a2 + 40;
  long long v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v7;
  uint64_t v8 = v7;
  uint64_t v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(a1 + 40, v6, v8);
  long long v10 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 80, a2 + 80);
  return a1;
}

void *assignWithCopy for DialogFlow(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
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
        *uint64_t v3 = v12;
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
          *uint64_t v3 = *a2;
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

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for DialogFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_0(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for DialogFlow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DialogFlow(uint64_t result, int a2, int a3)
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
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DialogFlow()
{
  return &type metadata for DialogFlow;
}

uint64_t static DialogCalendar.make(date:)()
{
  sub_22A305A90();
  swift_allocObject();
  sub_22A305A80();
  sub_22A3048C0();
  sub_22A305A70();
  swift_release();
  uint64_t v0 = sub_22A305A60();
  swift_release();
  return v0;
}

uint64_t static Siri_Nlu_External_UserParse.with(task:hasCancelled:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v45 = a2;
  uint64_t v49 = a3;
  sub_22A304DC0();
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v41 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_22A304E20();
  uint64_t v42 = *(void *)(v47 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v46 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_22A304E60();
  uint64_t v48 = *(void *)(v44 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v43 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  int v9 = (char *)&v38 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371850);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22A304D60();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v38 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371858);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2683719F0);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_22A3067E0;
  *(void *)(v23 + 32) = a1;
  uint64_t v50 = v23;
  sub_22A305DF0();
  uint64_t v24 = v50;
  uint64_t v25 = sub_22A304FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v22, 1, 1, v25);
  swift_retain();
  MEMORY[0x22A6C3E90](v24, v22);
  swift_bridgeObjectRelease();
  sub_22A2E2868((uint64_t)v22, &qword_268371858);
  sub_22A304EB0();
  uint64_t v26 = v42;
  uint64_t v27 = v49;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
  sub_22A304E50();
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  uint64_t v39 = v19;
  v28(v17, v19, v13);
  sub_22A304E40();
  unint64_t v29 = v46;
  sub_22A304E10();
  uint64_t v30 = *(void (**)(char *, char *))(v48 + 16);
  uint64_t v40 = v9;
  uint64_t v31 = v44;
  v30(v43, v9);
  sub_22A304DF0();
  if (v45)
  {
    sub_22A304DB0();
    sub_22A304E00();
  }
  sub_22A304D90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268371860);
  unint64_t v32 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_22A3067F0;
  unint64_t v34 = v33 + v32;
  uint64_t v35 = v47;
  (*(void (**)(unint64_t, char *, uint64_t))(v26 + 16))(v34, v29, v47);
  sub_22A304D80();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v35);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v40, v31);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v39, v13);
  uint64_t v36 = sub_22A304DA0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v27, 0, 1, v36);
}

uint64_t GuardedFlow.init(mainFlow:guards:enforceProtectedHealthApp:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_22A305C80();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v34 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22A3049F0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v30 - v16;
  sub_22A2E3A24(a1, a4);
  *(void *)(a4 + 40) = a2;
  if (a3)
  {
    unint64_t v31 = (unint64_t)"com.apple.Fitness";
    uint64_t v32 = a1;
    sub_22A3049E0();
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = v12;
    uint64_t v33 = v9;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      a2 = sub_22A2E5128(0, *(void *)(a2 + 16) + 1, 1, a2);
    }
    unint64_t v21 = *(void *)(a2 + 16);
    unint64_t v20 = *(void *)(a2 + 24);
    if (v21 >= v20 >> 1) {
      a2 = sub_22A2E5128(v20 > 1, v21 + 1, 1, a2);
    }
    *(void *)(a2 + 16) = v21 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(a2+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * v21, v15, v11);
    *(void *)(a4 + 40) = a2;
    if (qword_268371438 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v8, (uint64_t)static Logger.wellness);
    swift_beginAccess();
    uint64_t v24 = v33;
    uint64_t v23 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v34, v22, v8);
    uint64_t v25 = sub_22A305C60();
    os_log_type_t v26 = sub_22A305E40();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v36 = v28;
      uint64_t v30 = v8;
      *(_DWORD *)uint64_t v27 = 136315138;
      uint64_t v35 = sub_22A2E2200(0xD000000000000010, v31 | 0x8000000000000000, &v36);
      sub_22A305ED0();
      _os_log_impl(&dword_22A2DE000, v25, v26, "Protected app check needed for %s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6C55A0](v28, -1, -1);
      MEMORY[0x22A6C55A0](v27, -1, -1);

      __swift_destroy_boxed_opaque_existential_0(v32);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v23, v30);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_0(v32);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v23, v8);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v17, v11);
  }
  else
  {
    return __swift_destroy_boxed_opaque_existential_0(a1);
  }
}

uint64_t GuardedFlow.on(input:)()
{
  return 1;
}

uint64_t GuardedFlow.execute(completion:)()
{
  sub_22A2E54B8();
  return sub_22A304A10();
}

uint64_t GuardedFlow.execute()(uint64_t a1)
{
  v2[16] = a1;
  v2[17] = v1;
  uint64_t v3 = sub_22A305C80();
  v2[18] = v3;
  v2[19] = *(void *)(v3 - 8);
  v2[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22A2E4D00, 0, 0);
}

uint64_t sub_22A2E4D00()
{
  uint64_t v24 = v0;
  if (qword_268371458 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[20];
  uint64_t v4 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v5 = __swift_project_value_buffer(v3, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v5, v3);
  sub_22A2E550C(v4, (uint64_t)(v0 + 2));
  uint64_t v6 = sub_22A305C60();
  os_log_type_t v7 = sub_22A305E40();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[19];
  uint64_t v10 = v0[20];
  uint64_t v11 = v0[18];
  if (v8)
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v23 = v13;
    v0[14] = sub_22A2E2200(0x4664656472617547, 0xEB00000000776F6CLL, &v23);
    sub_22A305ED0();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v22 = v11;
    uint64_t v14 = sub_22A3049F0();
    uint64_t v15 = swift_bridgeObjectRetain();
    uint64_t v16 = MEMORY[0x22A6C4D00](v15, v14);
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    v0[15] = sub_22A2E2200(v16, v18, &v23);
    sub_22A305ED0();
    swift_bridgeObjectRelease();
    sub_22A2E557C((uint64_t)(v0 + 2));
    _os_log_impl(&dword_22A2DE000, v6, v7, "Executing %s with guards: %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v13, -1, -1);
    MEMORY[0x22A6C55A0](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v22);
  }
  else
  {
    sub_22A2E557C((uint64_t)(v0 + 2));

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  }
  __swift_project_boxed_opaque_existential_1((void *)v0[17], *(void *)(v0[17] + 24));
  v0[11] = sub_22A304A00();
  v0[12] = sub_22A3049B0();
  sub_22A3049C0();
  sub_22A3049D0();
  uint64_t v19 = sub_22A304A40();
  swift_release();
  swift_release();
  v0[13] = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268371878);
  sub_22A2E55AC();
  sub_22A304C20();
  swift_release();
  swift_task_dealloc();
  unint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_22A2E5090(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22A2E37B4;
  return GuardedFlow.execute()(a1);
}

uint64_t sub_22A2E5128(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2683718A8);
  uint64_t v10 = *(void *)(sub_22A3049F0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_22A306030();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_22A3049F0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_22A2E586C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_22A2E5390(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268371898);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_22A2E59C4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_22A2E54B8()
{
  unint64_t result = qword_268371868;
  if (!qword_268371868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371868);
  }
  return result;
}

uint64_t sub_22A2E550C(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  *(void *)(a2 + 40) = *(void *)(a1 + 40);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_22A2E557C(uint64_t a1)
{
  return a1;
}

unint64_t sub_22A2E55AC()
{
  unint64_t result = qword_268371880[0];
  if (!qword_268371880[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268371878);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268371880);
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

uint64_t sub_22A2E5650(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  return MEMORY[0x270FA0128](v1, 0);
}

uint64_t destroy for GuardedFlow(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GuardedFlow(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for GuardedFlow(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for GuardedFlow(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GuardedFlow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GuardedFlow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GuardedFlow()
{
  return &type metadata for GuardedFlow;
}

uint64_t sub_22A2E586C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_22A3049F0() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_22A306070();
  __break(1u);
  return result;
}

uint64_t sub_22A2E59C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2683718A0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_22A306070();
  __break(1u);
  return result;
}

uint64_t static UsoEntity_common_DurationComponent.builder(unit:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22A305860();
  swift_allocObject();
  uint64_t v5 = sub_22A305850();
  if (a1)
  {
    swift_retain();
    sub_22A305830();
    swift_release();
  }
  if (a3)
  {
    swift_retain();
    sub_22A305840();
    swift_release();
  }
  return v5;
}

uint64_t static UsoEntity_common_DurationComponent.with(unit:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22A305860();
  swift_allocObject();
  uint64_t v5 = sub_22A305850();
  if (a1)
  {
    swift_retain();
    sub_22A305830();
    swift_release();
  }
  if (a3)
  {
    swift_retain();
    sub_22A305840();
    swift_release();
  }
  MEMORY[0x22A6C3FC0](v5);
  sub_22A305540();
  sub_22A305130();
  swift_release();
  swift_release();
  return v7;
}

uint64_t LocationService.init(with:geocoder:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_22A2E2A30(a1, a3);
  *(void *)(a3 + 40) = a2;
  return result;
}

uint64_t LocationService.getCurrentLocation()()
{
  v1[14] = v0;
  uint64_t v2 = sub_22A305C80();
  v1[15] = v2;
  v1[16] = *(void *)(v2 - 8);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22A2E5D44, 0, 0);
}

uint64_t sub_22A2E5D44()
{
  uint64_t v1 = (void *)v0[14];
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F648F0]), sel_init);
  v0[19] = v2;
  objc_msgSend(v2, sel_setDesiredAccuracy_, *MEMORY[0x263F651F0]);
  sub_22A2E7940(0, &qword_2683718B8);
  long long v3 = (void *)sub_22A305E80();
  objc_msgSend(v2, sel_setMaxAge_, v3);

  uint64_t v4 = (void *)sub_22A305E80();
  objc_msgSend(v2, sel_setSearchTimeout_, v4);

  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v5);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[20] = v7;
  uint64_t v8 = sub_22A2E7940(0, &qword_2683718C0);
  *uint64_t v7 = v0;
  v7[1] = sub_22A2E5EC8;
  return MEMORY[0x270F67CE0](v2, v5, v8, v6);
}

uint64_t sub_22A2E5EC8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 168) = a1;
  *(void *)(v3 + 176) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_22A2E628C;
  }
  else {
    uint64_t v4 = sub_22A2E5FDC;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_22A2E5FDC()
{
  uint64_t v1 = (void *)v0[21];
  objc_msgSend(v1, sel_latitude);
  double v3 = v2;
  objc_msgSend(v1, sel_longitude);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A50]), sel_initWithLatitude_longitude_, v3, v4);
  if (qword_268371458 != -1) {
    swift_once();
  }
  uint64_t v6 = v0[18];
  uint64_t v7 = v0[15];
  uint64_t v8 = v0[16];
  uint64_t v9 = __swift_project_value_buffer(v7, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v9, v7);
  id v10 = v5;
  unint64_t v11 = sub_22A305C60();
  os_log_type_t v12 = sub_22A305E40();
  BOOL v13 = os_log_type_enabled(v11, v12);
  size_t v14 = (void *)v0[21];
  BOOL v15 = (void *)v0[19];
  if (v13)
  {
    unint64_t v21 = (void *)v0[21];
    uint64_t v22 = (void *)v0[19];
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    unint64_t v17 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 138412290;
    v0[13] = v10;
    id v18 = v10;
    sub_22A305ED0();
    *unint64_t v17 = v10;

    _os_log_impl(&dword_22A2DE000, v11, v12, "Fetched location: %@", v16, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683718C8);
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v17, -1, -1);
    MEMORY[0x22A6C55A0](v16, -1, -1);
  }
  else
  {
  }
  (*(void (**)(void, void))(v0[16] + 8))(v0[18], v0[15]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(id))v0[1];
  return v19(v10);
}

uint64_t sub_22A2E628C()
{
  uint64_t v25 = v0;
  if (qword_268371458 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_22A305C60();
  os_log_type_t v9 = sub_22A305E50();
  BOOL v10 = os_log_type_enabled(v8, v9);
  unint64_t v11 = *(void **)(v0 + 176);
  uint64_t v12 = *(void *)(v0 + 128);
  uint64_t v13 = *(void *)(v0 + 136);
  uint64_t v14 = *(void *)(v0 + 120);
  if (v10)
  {
    uint64_t v23 = *(void *)(v0 + 136);
    unint64_t v21 = *(void **)(v0 + 152);
    uint64_t v22 = *(void *)(v0 + 120);
    BOOL v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v24 = v16;
    *(_DWORD *)BOOL v15 = 136315138;
    swift_getErrorValue();
    uint64_t v17 = sub_22A3060F0();
    *(void *)(v0 + 96) = sub_22A2E2200(v17, v18, &v24);
    sub_22A305ED0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22A2DE000, v8, v9, "Error submitting SAGetRequestOrigin: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v16, -1, -1);
    MEMORY[0x22A6C55A0](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v23, v22);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19(0);
}

uint64_t LocationService.getLocationCountryCode()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22A2E65C8;
  return LocationService.getCurrentPlacemark()();
}

uint64_t sub_22A2E65C8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 24) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_22A2E66C8, 0, 0);
}

uint64_t sub_22A2E66C8()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (v1)
  {
    id v2 = objc_msgSend(*(id *)(v0 + 24), sel_ISOcountryCode);

    if (v2)
    {
      uint64_t v1 = (void *)sub_22A305D20();
      uint64_t v4 = v3;

      goto LABEL_6;
    }
    uint64_t v1 = 0;
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = *(uint64_t (**)(void *, uint64_t))(v0 + 8);
  return v5(v1, v4);
}

uint64_t LocationService.getCurrentPlacemark()()
{
  v1[31] = v0;
  uint64_t v2 = sub_22A305C80();
  v1[32] = v2;
  v1[33] = *(void *)(v2 - 8);
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  uint64_t v3 = (void *)swift_task_alloc();
  v1[37] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22A2E6884;
  return LocationService.getCurrentLocation()();
}

uint64_t sub_22A2E6884(uint64_t a1)
{
  *(void *)(*(void *)v1 + 304) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_22A2E6984, 0, 0);
}

uint64_t sub_22A2E6984()
{
  uint64_t v1 = v0[38];
  if (v1)
  {
    uint64_t v2 = *(void **)(v0[31] + 40);
    v0[2] = v0;
    v0[7] = v0 + 29;
    v0[3] = sub_22A2E6BFC;
    uint64_t v3 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_22A2E7554;
    v0[13] = &block_descriptor;
    v0[14] = v3;
    objc_msgSend(v2, sel_reverseGeocodeLocation_completionHandler_, v1, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    if (qword_268371458 != -1) {
      swift_once();
    }
    uint64_t v4 = v0[35];
    uint64_t v5 = v0[32];
    uint64_t v6 = v0[33];
    uint64_t v7 = __swift_project_value_buffer(v5, (uint64_t)static Logger.common);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
    uint64_t v8 = sub_22A305C60();
    os_log_type_t v9 = sub_22A305E50();
    if (os_log_type_enabled(v8, v9))
    {
      BOOL v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v10 = 0;
      _os_log_impl(&dword_22A2DE000, v8, v9, "Could not acquire location, so unable to determine placemark", v10, 2u);
      MEMORY[0x22A6C55A0](v10, -1, -1);
    }
    uint64_t v11 = v0[35];
    uint64_t v12 = v0[32];
    uint64_t v13 = v0[33];

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
    return v14(0);
  }
}

uint64_t sub_22A2E6BFC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 312) = v1;
  if (v1) {
    uint64_t v2 = sub_22A2E7050;
  }
  else {
    uint64_t v2 = sub_22A2E6D0C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22A2E6D0C()
{
  unint64_t v29 = v0;
  unint64_t v1 = v0[29];
  if (qword_268371458 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[36];
  uint64_t v3 = v0[32];
  uint64_t v4 = v0[33];
  uint64_t v5 = __swift_project_value_buffer(v3, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_22A305C60();
  os_log_type_t v7 = sub_22A305E40();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[36];
  uint64_t v10 = v0[32];
  uint64_t v11 = v0[33];
  if (v8)
  {
    uint64_t v27 = v0[36];
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v28 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v14 = sub_22A2E7940(0, &qword_2683718E0);
    uint64_t v15 = swift_bridgeObjectRetain();
    uint64_t v16 = MEMORY[0x22A6C4D00](v15, v14);
    uint64_t v26 = v10;
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    v0[30] = sub_22A2E2200(v16, v18, &v28);
    sub_22A305ED0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22A2DE000, v6, v7, "Reverse geocoding returned placemarks: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v13, -1, -1);
    MEMORY[0x22A6C55A0](v12, -1, -1);

    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v27, v26);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_22A306050();
    uint64_t result = swift_bridgeObjectRelease();
    if (v23) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v24 = (void *)v0[38];
    swift_bridgeObjectRelease();

    id v21 = 0;
    goto LABEL_14;
  }
  if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_13;
  }
LABEL_8:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v20 = (id)MEMORY[0x22A6C4E70](0, v1);
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v20 = *(id *)(v1 + 32);
  }
  id v21 = v20;
  uint64_t v22 = (void *)v0[38];
  swift_bridgeObjectRelease();

LABEL_14:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(id))v0[1];
  return v25(v21);
}

uint64_t sub_22A2E7050()
{
  uint64_t v25 = v0;
  swift_willThrow();
  if (qword_268371458 != -1) {
    swift_once();
  }
  unint64_t v1 = *(void **)(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  BOOL v8 = sub_22A305C60();
  os_log_type_t v9 = sub_22A305E50();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void **)(v0 + 312);
  uint64_t v13 = *(void *)(v0 + 264);
  uint64_t v12 = *(void *)(v0 + 272);
  uint64_t v14 = *(void *)(v0 + 256);
  if (v10)
  {
    uint64_t v23 = *(void *)(v0 + 272);
    id v21 = *(void **)(v0 + 304);
    uint64_t v22 = *(void *)(v0 + 256);
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v24 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    swift_getErrorValue();
    uint64_t v17 = sub_22A3060F0();
    *(void *)(v0 + 224) = sub_22A2E2200(v17, v18, &v24);
    sub_22A305ED0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22A2DE000, v8, v9, "Error reverse geocoding: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v16, -1, -1);
    MEMORY[0x22A6C55A0](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v23, v22);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19(0);
}

uint64_t LocationService.getCurrentCity()()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_22A2E73A0;
  return LocationService.getCurrentPlacemark()();
}

uint64_t sub_22A2E73A0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 24) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_22A2E74A0, 0, 0);
}

uint64_t sub_22A2E74A0()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (v1)
  {
    id v2 = objc_msgSend(*(id *)(v0 + 24), sel_locality);

    if (v2)
    {
      uint64_t v1 = (void *)sub_22A305D20();
      uint64_t v4 = v3;

      goto LABEL_6;
    }
    uint64_t v1 = 0;
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = *(uint64_t (**)(void *, uint64_t))(v0 + 8);
  return v5(v1, v4);
}

uint64_t sub_22A2E7554(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268371830);
    uint64_t v5 = swift_allocError();
    *id v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    sub_22A2E7940(0, &qword_2683718E0);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_22A305DD0();
    return MEMORY[0x270FA2408](v3);
  }
}

uint64_t sub_22A2E7630()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22A2E3600;
  return LocationService.getCurrentLocation()();
}

uint64_t sub_22A2E76BC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22A2E65C8;
  return LocationService.getCurrentPlacemark()();
}

uint64_t sub_22A2E7748()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22A2E73A0;
  return LocationService.getCurrentPlacemark()();
}

uint64_t sub_22A2E77D4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22A2E7AB0;
  return LocationService.getCurrentPlacemark()();
}

uint64_t sub_22A2E7860(uint64_t (*a1)(void))
{
  return a1();
}

void sub_22A2E7888(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_22A305ED0();
  *a1 = v7;
  BOOL v8 = *a2;
  if (*a2)
  {
    *BOOL v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_22A2E7940(uint64_t a1, unint64_t *a2)
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

void destroy for LocationService(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  id v2 = *(void **)(a1 + 40);
}

uint64_t initializeWithCopy for LocationService(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v5;
  id v6 = v5;
  return a1;
}

uint64_t *assignWithCopy for LocationService(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  long long v4 = (void *)a2[5];
  uint64_t v5 = (void *)a1[5];
  a1[5] = (uint64_t)v4;
  id v6 = v4;

  return a1;
}

uint64_t assignWithTake for LocationService(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  id v6 = *(void **)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;

  return a1;
}

ValueMetadata *type metadata accessor for LocationService()
{
  return &type metadata for LocationService;
}

uint64_t FlowConfigModel.init(deviceState:aceService:aceServiceAsync:sharedContextService:outputPublisher:flowFinder:networkStatusProvider:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(void *)(a8 + 272) = 0;
  *(_OWORD *)(a8 + 256) = 0u;
  *(_OWORD *)(a8 + 208) = 0u;
  *(_OWORD *)(a8 + 224) = 0u;
  uint64_t v12 = a8 + 40;
  uint64_t v13 = a8 + 120;
  *(_OWORD *)(a8 + 176) = 0u;
  *(_OWORD *)(a8 + 192) = 0u;
  uint64_t v14 = a8 + 200;
  *(_OWORD *)(a8 + 128) = 0u;
  *(_OWORD *)(a8 + 144) = 0u;
  *(_OWORD *)(a8 + 96) = 0u;
  *(_OWORD *)(a8 + 112) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)a8 = 0u;
  *(_OWORD *)(a8 + 240) = 0u;
  uint64_t v15 = a8 + 240;
  *(_OWORD *)(a8 + 160) = 0u;
  uint64_t v16 = a8 + 160;
  *(_OWORD *)(a8 + 80) = 0u;
  uint64_t v17 = a8 + 80;
  sub_22A2E7BE0(a1, a8, &qword_268371910);
  sub_22A2E7BE0(a2, v12, &qword_268371918);
  sub_22A2E7BE0(a3, v17, &qword_268371920);
  sub_22A2E7BE0(a4, v13, &qword_268371928);
  sub_22A2E7BE0(a5, v16, &qword_268371930);
  sub_22A2E7BE0(a6, v14, &qword_268371938);
  return sub_22A2E7BE0(a7, v15, &qword_268371940);
}

uint64_t sub_22A2E7BE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t FlowConfigModel.getDeviceState()@<X0>(uint64_t a1@<X8>)
{
  sub_22A2E7F88(v1, (uint64_t)&v4, &qword_268371910);
  if (v5) {
    return sub_22A2E2A30(&v4, a1);
  }
  sub_22A2E2868((uint64_t)&v4, &qword_268371910);
  return sub_22A304D00();
}

uint64_t FlowConfigModel.getAceService()@<X0>(uint64_t a1@<X8>)
{
  sub_22A2E7F88(v1 + 40, (uint64_t)&v4, &qword_268371918);
  if (v5) {
    return sub_22A2E2A30(&v4, a1);
  }
  sub_22A2E2868((uint64_t)&v4, &qword_268371918);
  return sub_22A304B00();
}

uint64_t FlowConfigModel.getAceServiceAsync()@<X0>(uint64_t a1@<X8>)
{
  sub_22A2E7F88(v1 + 80, (uint64_t)&v4, &qword_268371920);
  if (v5) {
    return sub_22A2E2A30(&v4, a1);
  }
  sub_22A304AF0();
  return sub_22A2E2868((uint64_t)&v4, &qword_268371920);
}

uint64_t FlowConfigModel.getSharedContextService()@<X0>(uint64_t a1@<X8>)
{
  sub_22A2E7F88(v1 + 120, (uint64_t)&v4, &qword_268371928);
  if (v5) {
    return sub_22A2E2A30(&v4, a1);
  }
  sub_22A2E2868((uint64_t)&v4, &qword_268371928);
  return sub_22A305BA0();
}

uint64_t FlowConfigModel.getOutputPublisher()@<X0>(uint64_t a1@<X8>)
{
  sub_22A2E7F88(v1 + 160, (uint64_t)&v4, &qword_268371930);
  if (v5) {
    return sub_22A2E2A30(&v4, a1);
  }
  sub_22A2E2868((uint64_t)&v4, &qword_268371930);
  return sub_22A304CD0();
}

uint64_t FlowConfigModel.getFlowFinder()@<X0>(uint64_t *a1@<X8>)
{
  sub_22A2E7F88(v1 + 200, (uint64_t)&v5, &qword_268371938);
  if (v6)
  {
    sub_22A2E2A30(&v5, (uint64_t)v7);
    return sub_22A2E2A30(v7, (uint64_t)a1);
  }
  else
  {
    sub_22A2E2868((uint64_t)&v5, &qword_268371938);
    uint64_t v4 = type metadata accessor for FlowFinder();
    uint64_t result = swift_allocObject();
    a1[3] = v4;
    a1[4] = (uint64_t)&protocol witness table for FlowFinder;
    *a1 = result;
  }
  return result;
}

uint64_t FlowConfigModel.getNetworkStatusProvider()@<X0>(uint64_t *a1@<X8>)
{
  sub_22A2E7F88(v1 + 240, (uint64_t)&v6, &qword_268371940);
  if (v7) {
    return sub_22A2E2A30(&v6, (uint64_t)a1);
  }
  uint64_t v4 = type metadata accessor for NetworkStatusProvider();
  uint64_t v5 = swift_allocObject();
  a1[3] = v4;
  a1[4] = (uint64_t)&protocol witness table for NetworkStatusProvider;
  *a1 = v5;
  return sub_22A2E2868((uint64_t)&v6, &qword_268371940);
}

uint64_t sub_22A2E7F88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22A2E7FEC@<X0>(uint64_t a1@<X8>)
{
  sub_22A2E7F88(v1, (uint64_t)&v4, &qword_268371910);
  if (v5) {
    return sub_22A2E2A30(&v4, a1);
  }
  sub_22A2E2868((uint64_t)&v4, &qword_268371910);
  return sub_22A304D00();
}

uint64_t sub_22A2E8058@<X0>(uint64_t a1@<X8>)
{
  sub_22A2E7F88(v1 + 40, (uint64_t)&v4, &qword_268371918);
  if (v5) {
    return sub_22A2E2A30(&v4, a1);
  }
  sub_22A2E2868((uint64_t)&v4, &qword_268371918);
  return sub_22A304B00();
}

uint64_t sub_22A2E80C4@<X0>(uint64_t a1@<X8>)
{
  sub_22A2E7F88(v1 + 80, (uint64_t)&v4, &qword_268371920);
  if (v5) {
    return sub_22A2E2A30(&v4, a1);
  }
  sub_22A304AF0();
  return sub_22A2E2868((uint64_t)&v4, &qword_268371920);
}

uint64_t sub_22A2E8130@<X0>(uint64_t a1@<X8>)
{
  sub_22A2E7F88(v1 + 120, (uint64_t)&v4, &qword_268371928);
  if (v5) {
    return sub_22A2E2A30(&v4, a1);
  }
  sub_22A2E2868((uint64_t)&v4, &qword_268371928);
  return sub_22A305BA0();
}

uint64_t sub_22A2E819C@<X0>(uint64_t a1@<X8>)
{
  sub_22A2E7F88(v1 + 160, (uint64_t)&v4, &qword_268371930);
  if (v5) {
    return sub_22A2E2A30(&v4, a1);
  }
  sub_22A2E2868((uint64_t)&v4, &qword_268371930);
  return sub_22A304CD0();
}

uint64_t sub_22A2E820C@<X0>(uint64_t *a1@<X8>)
{
  sub_22A2E7F88(v1 + 200, (uint64_t)&v5, &qword_268371938);
  if (v6)
  {
    sub_22A2E2A30(&v5, (uint64_t)v7);
    return sub_22A2E2A30(v7, (uint64_t)a1);
  }
  else
  {
    sub_22A2E2868((uint64_t)&v5, &qword_268371938);
    uint64_t v4 = type metadata accessor for FlowFinder();
    uint64_t result = swift_allocObject();
    a1[3] = v4;
    a1[4] = (uint64_t)&protocol witness table for FlowFinder;
    *a1 = result;
  }
  return result;
}

uint64_t sub_22A2E82A4@<X0>(uint64_t *a1@<X8>)
{
  sub_22A2E7F88(v1 + 240, (uint64_t)&v6, &qword_268371940);
  if (v7) {
    return sub_22A2E2A30(&v6, (uint64_t)a1);
  }
  uint64_t v4 = type metadata accessor for NetworkStatusProvider();
  uint64_t v5 = swift_allocObject();
  a1[3] = v4;
  a1[4] = (uint64_t)&protocol witness table for NetworkStatusProvider;
  *a1 = v5;
  return sub_22A2E2868((uint64_t)&v6, &qword_268371940);
}

uint64_t destroy for FlowConfigModel(uint64_t result)
{
  uint64_t v1 = (void *)result;
  if (*(void *)(result + 24)) {
    uint64_t result = __swift_destroy_boxed_opaque_existential_0(result);
  }
  if (v1[8]) {
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 5));
  }
  if (v1[13]) {
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 10));
  }
  if (v1[18]) {
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 15));
  }
  if (v1[23]) {
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 20));
  }
  if (v1[28]) {
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 25));
  }
  if (v1[33])
  {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 30));
  }
  return result;
}

uint64_t initializeWithCopy for FlowConfigModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = v5;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  uint64_t v7 = (_OWORD *)(a1 + 40);
  BOOL v8 = (_OWORD *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 64);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = v9;
    *(void *)(a1 + 72) = v10;
    (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
  }
  else
  {
    long long v11 = *(_OWORD *)(a2 + 56);
    *uint64_t v7 = *v8;
    *(_OWORD *)(a1 + 56) = v11;
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
  }
  uint64_t v12 = (_OWORD *)(a1 + 80);
  uint64_t v13 = (_OWORD *)(a2 + 80);
  uint64_t v14 = *(void *)(a2 + 104);
  if (v14)
  {
    uint64_t v15 = *(void *)(a2 + 112);
    *(void *)(a1 + 104) = v14;
    *(void *)(a1 + 112) = v15;
    (**(void (***)(_OWORD *, _OWORD *))(v14 - 8))(v12, v13);
  }
  else
  {
    long long v16 = *(_OWORD *)(a2 + 96);
    _OWORD *v12 = *v13;
    *(_OWORD *)(a1 + 96) = v16;
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
  }
  uint64_t v17 = (_OWORD *)(a1 + 120);
  unint64_t v18 = (_OWORD *)(a2 + 120);
  uint64_t v19 = *(void *)(a2 + 144);
  if (v19)
  {
    uint64_t v20 = *(void *)(a2 + 152);
    *(void *)(a1 + 144) = v19;
    *(void *)(a1 + 152) = v20;
    (**(void (***)(_OWORD *, _OWORD *))(v19 - 8))(v17, v18);
  }
  else
  {
    long long v21 = *(_OWORD *)(a2 + 136);
    *uint64_t v17 = *v18;
    *(_OWORD *)(a1 + 136) = v21;
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
  }
  uint64_t v22 = (_OWORD *)(a1 + 160);
  uint64_t v23 = (_OWORD *)(a2 + 160);
  uint64_t v24 = *(void *)(a2 + 184);
  if (v24)
  {
    uint64_t v25 = *(void *)(a2 + 192);
    *(void *)(a1 + 184) = v24;
    *(void *)(a1 + 192) = v25;
    (**(void (***)(_OWORD *, _OWORD *))(v24 - 8))(v22, v23);
  }
  else
  {
    long long v26 = *(_OWORD *)(a2 + 176);
    *uint64_t v22 = *v23;
    *(_OWORD *)(a1 + 176) = v26;
    *(void *)(a1 + 192) = *(void *)(a2 + 192);
  }
  uint64_t v27 = (_OWORD *)(a1 + 200);
  uint64_t v28 = (_OWORD *)(a2 + 200);
  uint64_t v29 = *(void *)(a2 + 224);
  if (v29)
  {
    uint64_t v30 = *(void *)(a2 + 232);
    *(void *)(a1 + 224) = v29;
    *(void *)(a1 + 232) = v30;
    (**(void (***)(_OWORD *, _OWORD *))(v29 - 8))(v27, v28);
  }
  else
  {
    long long v31 = *(_OWORD *)(a2 + 216);
    *uint64_t v27 = *v28;
    *(_OWORD *)(a1 + 216) = v31;
    *(void *)(a1 + 232) = *(void *)(a2 + 232);
  }
  uint64_t v32 = (_OWORD *)(a1 + 240);
  uint64_t v33 = (_OWORD *)(a2 + 240);
  uint64_t v34 = *(void *)(a2 + 264);
  if (v34)
  {
    uint64_t v35 = *(void *)(a2 + 272);
    *(void *)(a1 + 264) = v34;
    *(void *)(a1 + 272) = v35;
    (**(void (***)(_OWORD *, _OWORD *))(v34 - 8))(v32, v33);
  }
  else
  {
    long long v36 = *(_OWORD *)(a2 + 256);
    *uint64_t v32 = *v33;
    *(_OWORD *)(a1 + 256) = v36;
    *(void *)(a1 + 272) = *(void *)(a2 + 272);
  }
  return a1;
}

uint64_t assignWithCopy for FlowConfigModel(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 3);
  if (*(void *)(a1 + 24))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_0(a1);
  }
  else if (v4)
  {
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
    goto LABEL_8;
  }
  long long v5 = *a2;
  long long v6 = a2[1];
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  *(_OWORD *)a1 = v5;
  *(_OWORD *)(a1 + 16) = v6;
LABEL_8:
  uint64_t v7 = *((void *)a2 + 8);
  if (*(void *)(a1 + 64))
  {
    if (v7)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)a2 + 5);
      goto LABEL_15;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 40);
  }
  else if (v7)
  {
    *(void *)(a1 + 64) = v7;
    *(void *)(a1 + 72) = *((void *)a2 + 9);
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, (uint64_t)a2 + 40);
    goto LABEL_15;
  }
  long long v8 = *(long long *)((char *)a2 + 40);
  long long v9 = *(long long *)((char *)a2 + 56);
  *(void *)(a1 + 72) = *((void *)a2 + 9);
  *(_OWORD *)(a1 + 40) = v8;
  *(_OWORD *)(a1 + 56) = v9;
LABEL_15:
  uint64_t v10 = *((void *)a2 + 13);
  if (*(void *)(a1 + 104))
  {
    if (v10)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)a2 + 10);
      goto LABEL_22;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 80);
  }
  else if (v10)
  {
    *(void *)(a1 + 104) = v10;
    *(void *)(a1 + 112) = *((void *)a2 + 14);
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 80, (uint64_t)(a2 + 5));
    goto LABEL_22;
  }
  long long v11 = a2[5];
  long long v12 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v11;
  *(_OWORD *)(a1 + 96) = v12;
LABEL_22:
  uint64_t v13 = *((void *)a2 + 18);
  if (*(void *)(a1 + 144))
  {
    if (v13)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)a2 + 15);
      goto LABEL_29;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 120);
  }
  else if (v13)
  {
    *(void *)(a1 + 144) = v13;
    *(void *)(a1 + 152) = *((void *)a2 + 19);
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 120, (uint64_t)a2 + 120);
    goto LABEL_29;
  }
  long long v14 = *(long long *)((char *)a2 + 120);
  long long v15 = *(long long *)((char *)a2 + 136);
  *(void *)(a1 + 152) = *((void *)a2 + 19);
  *(_OWORD *)(a1 + 120) = v14;
  *(_OWORD *)(a1 + 136) = v15;
LABEL_29:
  uint64_t v16 = *((void *)a2 + 23);
  if (*(void *)(a1 + 184))
  {
    if (v16)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 160), (uint64_t *)a2 + 20);
      goto LABEL_36;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 160);
  }
  else if (v16)
  {
    *(void *)(a1 + 184) = v16;
    *(void *)(a1 + 192) = *((void *)a2 + 24);
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 160, (uint64_t)(a2 + 10));
    goto LABEL_36;
  }
  long long v17 = a2[10];
  long long v18 = a2[11];
  *(void *)(a1 + 192) = *((void *)a2 + 24);
  *(_OWORD *)(a1 + 160) = v17;
  *(_OWORD *)(a1 + 176) = v18;
LABEL_36:
  uint64_t v19 = *((void *)a2 + 28);
  if (*(void *)(a1 + 224))
  {
    if (v19)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 200), (uint64_t *)a2 + 25);
      goto LABEL_43;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 200);
  }
  else if (v19)
  {
    *(void *)(a1 + 224) = v19;
    *(void *)(a1 + 232) = *((void *)a2 + 29);
    (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 200, (uint64_t)a2 + 200);
    goto LABEL_43;
  }
  long long v20 = *(long long *)((char *)a2 + 200);
  long long v21 = *(long long *)((char *)a2 + 216);
  *(void *)(a1 + 232) = *((void *)a2 + 29);
  *(_OWORD *)(a1 + 200) = v20;
  *(_OWORD *)(a1 + 216) = v21;
LABEL_43:
  uint64_t v22 = *((void *)a2 + 33);
  if (!*(void *)(a1 + 264))
  {
    if (v22)
    {
      *(void *)(a1 + 264) = v22;
      *(void *)(a1 + 272) = *((void *)a2 + 34);
      (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 240, (uint64_t)(a2 + 15));
      return a1;
    }
LABEL_49:
    long long v23 = a2[15];
    long long v24 = a2[16];
    *(void *)(a1 + 272) = *((void *)a2 + 34);
    *(_OWORD *)(a1 + 240) = v23;
    *(_OWORD *)(a1 + 256) = v24;
    return a1;
  }
  if (!v22)
  {
    __swift_destroy_boxed_opaque_existential_0(a1 + 240);
    goto LABEL_49;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 240), (uint64_t *)a2 + 30);
  return a1;
}

void *__swift_memcpy280_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x118uLL);
}

uint64_t assignWithTake for FlowConfigModel(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_0(a1);
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (*(void *)(a1 + 64)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 40);
  }
  long long v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  if (*(void *)(a1 + 104)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 80);
  }
  long long v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  if (*(void *)(a1 + 144)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 120);
  }
  long long v7 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v7;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  if (*(void *)(a1 + 184)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 160);
  }
  long long v8 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v8;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  if (*(void *)(a1 + 224)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 200);
  }
  long long v9 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = v9;
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  if (*(void *)(a1 + 264)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 240);
  }
  long long v10 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v10;
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  return a1;
}

uint64_t getEnumTagSinglePayload for FlowConfigModel(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 280)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FlowConfigModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 280) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 280) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FlowConfigModel()
{
  return &type metadata for FlowConfigModel;
}

uint64_t static UsoEntity_common_WorkoutGoal.builder(definedValue:measurement:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371810);
  MEMORY[0x270FA5388](v4 - 8);
  long long v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22A3051B0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  long long v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A3055E0();
  swift_allocObject();
  uint64_t v11 = sub_22A3055D0();
  sub_22A2E7F88(a1, (uint64_t)v6, &qword_268371810);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_22A2E2868((uint64_t)v6, &qword_268371810);
    if (!a2) {
      return v11;
    }
    goto LABEL_5;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  sub_22A3055C0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (a2)
  {
LABEL_5:
    swift_retain();
    sub_22A3055B0();
    swift_release();
  }
  return v11;
}

uint64_t static UsoEntity_common_WorkoutGoal.builder(definedValue:unitType:value:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_22A2E905C(a1, a2, a3, a4 & 1);
}

uint64_t static UsoEntity_common_WorkoutGoal.with(definedValue:measurement:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371810);
  MEMORY[0x270FA5388](v4 - 8);
  long long v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22A3051B0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  long long v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A3055E0();
  swift_allocObject();
  uint64_t v11 = sub_22A3055D0();
  sub_22A2E7F88(a1, (uint64_t)v6, &qword_268371810);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_22A2E2868((uint64_t)v6, &qword_268371810);
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  sub_22A3055C0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (a2)
  {
LABEL_5:
    swift_retain();
    sub_22A3055B0();
    swift_release();
  }
LABEL_6:
  MEMORY[0x22A6C3FC0](v11);
  sub_22A3051C0();
  sub_22A305130();
  swift_release();
  swift_release();
  return v13[1];
}

uint64_t sub_22A2E905C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v28 = a4;
  uint64_t v27 = a3;
  uint64_t v29 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371808);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  long long v26 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v25 - v8;
  uint64_t v10 = sub_22A305480();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v30 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371810);
  MEMORY[0x270FA5388](v13 - 8);
  long long v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22A3051B0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A3055E0();
  swift_allocObject();
  uint64_t v20 = sub_22A3055D0();
  sub_22A2E7F88(a1, (uint64_t)v15, &qword_268371810);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_22A2E2868((uint64_t)v15, &qword_268371810);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
    sub_22A3055C0();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
  sub_22A2E7F88(v29, (uint64_t)v9, &qword_268371808);
  int v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  uint64_t v22 = v30;
  if (v21 == 1)
  {
    sub_22A2E2868((uint64_t)v9, &qword_268371808);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v30, v9, v10);
    if ((v28 & 1) == 0)
    {
      uint64_t v23 = (uint64_t)v26;
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v26, v22, v10);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v23, 0, 1, v10);
      sub_22A2F7A14(v23, v27, 0);
      sub_22A2E2868(v23, &qword_268371808);
      swift_retain();
      sub_22A3055B0();
      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v22, v10);
  }
  return v20;
}

uint64_t static UsoEntity_common_MeasurementComponent.builder(unit:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22A305910();
  swift_allocObject();
  uint64_t v5 = sub_22A305900();
  if (a1)
  {
    swift_retain();
    sub_22A3058E0();
    swift_release();
  }
  if (a3)
  {
    swift_retain();
    sub_22A3058F0();
    swift_release();
  }
  return v5;
}

uint64_t static UsoEntity_common_MeasurementComponent.builder(unitType:value:)(uint64_t a1, uint64_t a2, char a3)
{
  return sub_22A2E95A4(a1, a2, a3 & 1);
}

uint64_t static UsoEntity_common_MeasurementComponent.with(unit:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22A305910();
  swift_allocObject();
  uint64_t v5 = sub_22A305900();
  if (a1)
  {
    swift_retain();
    sub_22A3058E0();
    swift_release();
  }
  if (a3)
  {
    swift_retain();
    sub_22A3058F0();
    swift_release();
  }
  MEMORY[0x22A6C3FC0](v5);
  sub_22A305720();
  sub_22A305130();
  swift_release();
  swift_release();
  return v7;
}

uint64_t sub_22A2E95A4(uint64_t a1, uint64_t a2, int a3)
{
  int v29 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371808);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v24 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v24 - v12;
  uint64_t v14 = sub_22A305480();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v27 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v24 - v18;
  sub_22A305910();
  swift_allocObject();
  uint64_t v28 = sub_22A305900();
  sub_22A2E9930(a1, (uint64_t)v13);
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v20(v13, 1, v14) == 1)
  {
    sub_22A2E9998((uint64_t)v13);
    uint64_t v21 = v28;
    if (v29) {
      return v21;
    }
    goto LABEL_8;
  }
  uint64_t v26 = a2;
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
  v25(v19, v13, v14);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v11, v19, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, v14);
  sub_22A3057D0();
  swift_allocObject();
  sub_22A3057C0();
  sub_22A2E9930((uint64_t)v11, (uint64_t)v8);
  if (v20(v8, 1, v14) == 1)
  {
    sub_22A2E9998((uint64_t)v8);
  }
  else
  {
    uint64_t v22 = v27;
    v25(v27, v8, v14);
    sub_22A305790();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v22, v14);
  }
  uint64_t v21 = v28;
  sub_22A2E9998((uint64_t)v11);
  swift_retain();
  sub_22A3058E0();
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v14);
  if ((v29 & 1) == 0)
  {
LABEL_8:
    sub_22A305370();
    swift_allocObject();
    sub_22A305360();
    sub_22A305340();
    sub_22A3058F0();
    swift_release();
  }
  return v21;
}

uint64_t sub_22A2E9930(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371808);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A2E9998(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371808);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static UsoEntity_common_GeographicArea.with(areaType:)(uint64_t a1, uint64_t a2)
{
  _s12SiriOntology31UsoEntity_common_GeographicAreaC18HealthDomainsToolsE7builder8areaTypeAA0cd8Builder_e1_fG0CSSSg_tFZ_0(a1, a2);
  MEMORY[0x22A6C3FC0]();
  sub_22A3053E0();
  sub_22A305130();
  swift_release();
  swift_release();
  return v3;
}

uint64_t _s12SiriOntology31UsoEntity_common_GeographicAreaC18HealthDomainsToolsE7builder8areaTypeAA0cd8Builder_e1_fG0CSSSg_tFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22A304F60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A305740();
  swift_allocObject();
  uint64_t v8 = sub_22A305730();
  if (a2)
  {
    sub_22A3050F0();
    swift_allocObject();
    swift_bridgeObjectRetain_n();
    uint64_t v9 = MEMORY[0x22A6C4000](a1, a2);
    sub_22A304F30();
    sub_22A304EF0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v11[1] = v9;
    sub_22A304F80();
    swift_release();
  }
  return v8;
}

uint64_t static UsoEntity_common_MeasurementUnit.builder(name:type:definedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371808);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22A305480();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A3057D0();
  swift_allocObject();
  uint64_t v15 = sub_22A3057C0();
  if (a2) {
    sub_22A3057A0();
  }
  if (a3)
  {
    swift_retain();
    sub_22A3057B0();
    swift_release();
  }
  sub_22A2E9930(a5, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_22A2E9998((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    sub_22A305790();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return v15;
}

uint64_t static UsoEntity_common_MeasurementUnit.with(name:type:definedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371808);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22A305480();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A3057D0();
  swift_allocObject();
  uint64_t v15 = sub_22A3057C0();
  if (a2) {
    sub_22A3057A0();
  }
  if (a3)
  {
    swift_retain();
    sub_22A3057B0();
    swift_release();
  }
  sub_22A2E9930(a5, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_22A2E9998((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    sub_22A305790();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  MEMORY[0x22A6C3FC0](v15);
  sub_22A305490();
  sub_22A305130();
  swift_release();
  swift_release();
  return v17[1];
}

uint64_t currentIdiom(deviceState:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (sub_22A304B70())
  {
    uint64_t v4 = (unsigned int *)MEMORY[0x263F75620];
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    if (sub_22A304B80())
    {
      uint64_t v4 = (unsigned int *)MEMORY[0x263F75650];
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(a1, a1[3]);
      if (sub_22A304B20())
      {
        uint64_t v4 = (unsigned int *)MEMORY[0x263F75628];
      }
      else
      {
        __swift_project_boxed_opaque_existential_1(a1, a1[3]);
        if (sub_22A304B30())
        {
          uint64_t v4 = (unsigned int *)MEMORY[0x263F75630];
        }
        else
        {
          __swift_project_boxed_opaque_existential_1(a1, a1[3]);
          if (sub_22A304B40())
          {
            uint64_t v4 = (unsigned int *)MEMORY[0x263F75640];
          }
          else
          {
            __swift_project_boxed_opaque_existential_1(a1, a1[3]);
            if ((sub_22A304B60() & 1) == 0)
            {
              __swift_project_boxed_opaque_existential_1(a1, a1[3]);
              char v12 = sub_22A304B50();
              uint64_t v8 = sub_22A3059D0();
              uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 104);
              if (v12) {
                uint64_t v13 = (unsigned int *)MEMORY[0x263F75648];
              }
              else {
                uint64_t v13 = (unsigned int *)MEMORY[0x263F75660];
              }
              uint64_t v10 = *v13;
              uint64_t v9 = a2;
              goto LABEL_14;
            }
            uint64_t v4 = (unsigned int *)MEMORY[0x263F75618];
          }
        }
      }
    }
  }
  uint64_t v5 = *v4;
  uint64_t v6 = sub_22A3059D0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104);
  uint64_t v8 = v6;
  uint64_t v9 = a2;
  uint64_t v10 = v5;
LABEL_14:
  return v7(v9, v10, v8);
}

uint64_t static UsoEntity_common_Duration.builder(durationComponent:)(uint64_t a1)
{
  sub_22A305420();
  swift_allocObject();
  uint64_t v2 = sub_22A305410();
  if (a1)
  {
    swift_retain();
    sub_22A305400();
    swift_release();
  }
  return v2;
}

uint64_t static UsoEntity_common_Duration.with(durationComponent:)(uint64_t a1)
{
  sub_22A305420();
  swift_allocObject();
  uint64_t v2 = sub_22A305410();
  if (a1)
  {
    swift_retain();
    sub_22A305400();
    swift_release();
  }
  MEMORY[0x22A6C3FC0](v2);
  sub_22A3050B0();
  sub_22A305130();
  swift_release();
  swift_release();
  return v4;
}

uint64_t static UsoEntity_common_TimeUnit.builder(name:type:definedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371948);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22A3050C0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A305470();
  swift_allocObject();
  uint64_t v15 = sub_22A305460();
  if (a2) {
    sub_22A305440();
  }
  if (a3)
  {
    swift_retain();
    sub_22A305450();
    swift_release();
  }
  sub_22A2EA510(a5, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_22A2EA578((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    sub_22A305430();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return v15;
}

uint64_t sub_22A2EA510(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371948);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A2EA578(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371948);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static UsoEntity_common_TimeUnit.with(name:type:definedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371948);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22A3050C0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A305470();
  swift_allocObject();
  uint64_t v15 = sub_22A305460();
  if (a2) {
    sub_22A305440();
  }
  if (a3)
  {
    swift_retain();
    sub_22A305450();
    swift_release();
  }
  sub_22A2EA510(a5, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_22A2EA578((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    sub_22A305430();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  MEMORY[0x22A6C3FC0](v15);
  sub_22A3050D0();
  sub_22A305130();
  swift_release();
  swift_release();
  return v17[1];
}

uint64_t Logger.common.unsafeMutableAddressor()
{
  return sub_22A2EB4DC(&qword_268371458, (uint64_t)static Logger.common);
}

uint64_t Logger.wellness.unsafeMutableAddressor()
{
  return sub_22A2EB4DC(&qword_268371438, (uint64_t)static Logger.wellness);
}

uint64_t sub_22A2EA840()
{
  sub_22A2EB80C();
  uint64_t result = sub_22A305EB0();
  static Log.health = result;
  return result;
}

uint64_t *Log.health.unsafeMutableAddressor()
{
  if (qword_268371410 != -1) {
    swift_once();
  }
  return &static Log.health;
}

id static Log.health.getter()
{
  return sub_22A2EAC80(&qword_268371410, (void **)&static Log.health);
}

uint64_t sub_22A2EA914()
{
  sub_22A2EB80C();
  uint64_t result = sub_22A305EB0();
  static Log.workout = result;
  return result;
}

uint64_t *Log.workout.unsafeMutableAddressor()
{
  if (qword_268371418 != -1) {
    swift_once();
  }
  return &static Log.workout;
}

id static Log.workout.getter()
{
  return sub_22A2EAC80(&qword_268371418, (void **)&static Log.workout);
}

uint64_t sub_22A2EA9EC()
{
  sub_22A2EB80C();
  uint64_t result = sub_22A305EB0();
  static Log.wellness = result;
  return result;
}

uint64_t *Log.wellness.unsafeMutableAddressor()
{
  if (qword_268371420 != -1) {
    swift_once();
  }
  return &static Log.wellness;
}

id static Log.wellness.getter()
{
  return sub_22A2EAC80(&qword_268371420, (void **)&static Log.wellness);
}

uint64_t sub_22A2EAAC4()
{
  sub_22A2EB80C();
  uint64_t result = sub_22A305EB0();
  static Log.emergency = result;
  return result;
}

uint64_t *Log.emergency.unsafeMutableAddressor()
{
  if (qword_268371428 != -1) {
    swift_once();
  }
  return &static Log.emergency;
}

id static Log.emergency.getter()
{
  return sub_22A2EAC80(&qword_268371428, (void **)&static Log.emergency);
}

uint64_t sub_22A2EABA0()
{
  sub_22A2EB80C();
  uint64_t result = sub_22A305EB0();
  static Log.common = result;
  return result;
}

uint64_t *Log.common.unsafeMutableAddressor()
{
  if (qword_268371430 != -1) {
    swift_once();
  }
  return &static Log.common;
}

id static Log.common.getter()
{
  return sub_22A2EAC80(&qword_268371430, (void **)&static Log.common);
}

id sub_22A2EAC80(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  return v3;
}

uint64_t sub_22A2EACCC(uint64_t a1)
{
  return sub_22A2EB184(a1, static Logger.wellness, &qword_268371420, (id *)&static Log.wellness);
}

uint64_t static Logger.wellness.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22A2EB554(&qword_268371438, (uint64_t)static Logger.wellness, a1);
}

uint64_t static Logger.wellness.setter(uint64_t a1)
{
  return sub_22A2EB620(a1, &qword_268371438, (uint64_t)static Logger.wellness);
}

uint64_t (*static Logger.wellness.modify())()
{
  if (qword_268371438 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22A305C80();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.wellness);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22A2EADD4(uint64_t a1)
{
  return sub_22A2EB184(a1, static Logger.health, &qword_268371410, (id *)&static Log.health);
}

uint64_t Logger.health.unsafeMutableAddressor()
{
  return sub_22A2EB4DC(&qword_268371440, (uint64_t)static Logger.health);
}

uint64_t static Logger.health.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22A2EB554(&qword_268371440, (uint64_t)static Logger.health, a1);
}

uint64_t static Logger.health.setter(uint64_t a1)
{
  return sub_22A2EB620(a1, &qword_268371440, (uint64_t)static Logger.health);
}

uint64_t (*static Logger.health.modify())()
{
  if (qword_268371440 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22A305C80();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.health);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22A2EAF00(uint64_t a1)
{
  return sub_22A2EB184(a1, static Logger.emergency, &qword_268371428, (id *)&static Log.emergency);
}

uint64_t Logger.emergency.unsafeMutableAddressor()
{
  return sub_22A2EB4DC(&qword_268371448, (uint64_t)static Logger.emergency);
}

uint64_t static Logger.emergency.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22A2EB554(&qword_268371448, (uint64_t)static Logger.emergency, a1);
}

uint64_t static Logger.emergency.setter(uint64_t a1)
{
  return sub_22A2EB620(a1, &qword_268371448, (uint64_t)static Logger.emergency);
}

uint64_t (*static Logger.emergency.modify())()
{
  if (qword_268371448 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22A305C80();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.emergency);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22A2EB02C(uint64_t a1)
{
  return sub_22A2EB184(a1, static Logger.workout, &qword_268371418, (id *)&static Log.workout);
}

uint64_t Logger.workout.unsafeMutableAddressor()
{
  return sub_22A2EB4DC(&qword_268371450, (uint64_t)static Logger.workout);
}

uint64_t static Logger.workout.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22A2EB554(&qword_268371450, (uint64_t)static Logger.workout, a1);
}

uint64_t static Logger.workout.setter(uint64_t a1)
{
  return sub_22A2EB620(a1, &qword_268371450, (uint64_t)static Logger.workout);
}

uint64_t (*static Logger.workout.modify())()
{
  if (qword_268371450 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22A305C80();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.workout);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22A2EB158(uint64_t a1)
{
  return sub_22A2EB184(a1, static Logger.common, &qword_268371430, (id *)&static Log.common);
}

uint64_t sub_22A2EB184(uint64_t a1, uint64_t *a2, void *a3, id *a4)
{
  uint64_t v7 = sub_22A305C80();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  id v8 = *a4;
  return sub_22A305C90();
}

uint64_t static Logger.common.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22A2EB554(&qword_268371458, (uint64_t)static Logger.common, a1);
}

uint64_t static Logger.common.setter(uint64_t a1)
{
  return sub_22A2EB620(a1, &qword_268371458, (uint64_t)static Logger.common);
}

uint64_t (*static Logger.common.modify())()
{
  if (qword_268371458 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22A305C80();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.common);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22A2EB2EC(uint64_t a1)
{
  return sub_22A2EB438(a1, static Logger.cycleTracking);
}

uint64_t Logger.cycleTracking.unsafeMutableAddressor()
{
  return sub_22A2EB4DC(&qword_268371460, (uint64_t)static Logger.cycleTracking);
}

uint64_t static Logger.cycleTracking.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22A2EB554(&qword_268371460, (uint64_t)static Logger.cycleTracking, a1);
}

uint64_t static Logger.cycleTracking.setter(uint64_t a1)
{
  return sub_22A2EB620(a1, &qword_268371460, (uint64_t)static Logger.cycleTracking);
}

uint64_t (*static Logger.cycleTracking.modify())()
{
  if (qword_268371460 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22A305C80();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.cycleTracking);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_22A2EB41C(uint64_t a1)
{
  return sub_22A2EB438(a1, static Logger.sleep);
}

uint64_t sub_22A2EB438(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_22A305C80();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_22A305C70();
}

uint64_t Logger.sleep.unsafeMutableAddressor()
{
  return sub_22A2EB4DC(&qword_268371468, (uint64_t)static Logger.sleep);
}

uint64_t sub_22A2EB4DC(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_22A305C80();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.sleep.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22A2EB554(&qword_268371468, (uint64_t)static Logger.sleep, a1);
}

uint64_t sub_22A2EB554@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_22A305C80();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t static Logger.sleep.setter(uint64_t a1)
{
  return sub_22A2EB620(a1, &qword_268371468, (uint64_t)static Logger.sleep);
}

uint64_t sub_22A2EB620(uint64_t a1, void *a2, uint64_t a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_22A305C80();
  uint64_t v6 = __swift_project_value_buffer(v5, a3);
  swift_beginAccess();
  uint64_t v7 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v6, a1, v5);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v5);
}

uint64_t (*static Logger.sleep.modify())()
{
  if (qword_268371468 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22A305C80();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.sleep);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
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

unint64_t sub_22A2EB80C()
{
  unint64_t result = qword_268371950;
  if (!qword_268371950)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268371950);
  }
  return result;
}

uint64_t static UsoEntity_common_MeasurementUnitType.builder(definedValue:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371958);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22A3056B0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A3058D0();
  swift_allocObject();
  uint64_t v9 = sub_22A3058C0();
  sub_22A2EB9E8(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_22A2EBA50((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    sub_22A3058B0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v9;
}

uint64_t sub_22A2EB9E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371958);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A2EBA50(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371958);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static UsoEntity_common_MeasurementUnitType.with(definedValue:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371958);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22A3056B0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A3058D0();
  swift_allocObject();
  uint64_t v9 = sub_22A3058C0();
  sub_22A2EB9E8(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_22A2EBA50((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    sub_22A3058B0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  MEMORY[0x22A6C3FC0](v9);
  sub_22A3056C0();
  sub_22A305130();
  swift_release();
  swift_release();
  return v11[1];
}

uint64_t UsoEntity_common_Number.asDouble.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22A305C80();
  uint64_t v67 = *(void *)(v2 - 8);
  uint64_t v68 = v2;
  MEMORY[0x270FA5388](v2);
  v69 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22A305020();
  uint64_t v66 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v65 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371960);
  MEMORY[0x270FA5388](v6);
  id v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371968);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v62 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v62 - v16;
  sub_22A304F10();
  sub_22A305060();
  sub_22A305130();
  swift_release();
  if (v72)
  {
    uint64_t v18 = sub_22A305050();
    char v20 = v19;
    swift_release();
    if ((v20 & 1) == 0)
    {
      *(double *)&uint64_t result = (double)v18;
      return result;
    }
  }
  sub_22A304F10();
  sub_22A3052D0();
  sub_22A305130();
  swift_release();
  if (v72)
  {
    uint64_t v22 = sub_22A3052A0();
    if (v23) {
      double v24 = 0.0;
    }
    else {
      double v24 = (double)v22;
    }
    uint64_t v25 = sub_22A3052B0();
    if (v26)
    {
      swift_release();
    }
    else
    {
      uint64_t v27 = v25;
      uint64_t v28 = sub_22A3052C0();
      char v30 = v29;
      swift_release();
      if ((v30 & 1) == 0)
      {
        *(double *)&uint64_t result = v24 + (double)v27 / (double)v28;
        return result;
      }
    }
LABEL_43:
    *(double *)&uint64_t result = 0.0;
    return result;
  }
  sub_22A304F10();
  uint64_t v64 = sub_22A305040();
  sub_22A305130();
  swift_release();
  if (!v72) {
    goto LABEL_25;
  }
  uint64_t v31 = sub_22A305030();
  if (!v32)
  {
    swift_release();
    goto LABEL_25;
  }
  uint64_t v33 = v32;
  uint64_t v63 = &v62;
  uint64_t v71 = 0;
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  *(&v62 - 2) = (uint64_t)&v71;
  if ((v33 & 0x1000000000000000) != 0 || !(v33 & 0x2000000000000000 | v35 & 0x1000000000000000))
  {
    sub_22A305F20();
    swift_release();
    swift_bridgeObjectRelease();
    if ((v70 & 1) == 0) {
      goto LABEL_25;
    }
    return v71;
  }
  uint64_t v62 = (uint64_t)&v62;
  MEMORY[0x270FA5388](v34);
  *(&v62 - 2) = (uint64_t)sub_22A2EC810;
  *(&v62 - 1) = v37;
  if ((v33 & 0x2000000000000000) == 0)
  {
    if ((v36 & 0x1000000000000000) != 0)
    {
      uint64_t v38 = (v33 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v39 = v36 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v38 = sub_22A305F70();
    }
    char v40 = sub_22A2EC6F0(v38, v39, (void (*)(uint64_t *__return_ptr))sub_22A2EC880);
    swift_release();
    swift_bridgeObjectRelease();
    if (v40) {
      return v71;
    }
    goto LABEL_25;
  }
  uint64_t v72 = v36;
  uint64_t v73 = v33 & 0xFFFFFFFFFFFFFFLL;
  if (v36 <= 0x20u && ((1 << v36) & 0x100003E01) != 0
    || (uint64_t v60 = (unsigned __int8 *)_swift_stdlib_strtod_clocale()) == 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  int v61 = *v60;
  swift_release();
  swift_bridgeObjectRelease();
  if (!v61) {
    return v71;
  }
LABEL_25:
  sub_22A304F10();
  sub_22A305510();
  sub_22A305130();
  swift_release();
  if (!v72)
  {
    uint64_t v41 = v68;
LABEL_38:
    if (qword_268371458 != -1) {
      swift_once();
    }
    uint64_t v45 = __swift_project_value_buffer(v41, (uint64_t)static Logger.common);
    swift_beginAccess();
    uint64_t v46 = v67;
    uint64_t v47 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v69, v45, v41);
    swift_retain_n();
    uint64_t v48 = sub_22A305C60();
    os_log_type_t v49 = sub_22A305E50();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v70 = v1;
      uint64_t v71 = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      sub_22A304FF0();
      swift_retain();
      uint64_t v52 = sub_22A305D30();
      uint64_t v70 = sub_22A2E2200(v52, v53, &v71);
      sub_22A305ED0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A2DE000, v48, v49, "UsoEntityCommonNumber#asDouble got unexpected number entityType %s", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6C55A0](v51, -1, -1);
      MEMORY[0x22A6C55A0](v50, -1, -1);

      (*(void (**)(char *, uint64_t))(v46 + 8))(v69, v41);
      *(double *)&uint64_t result = 0.0;
      return result;
    }

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v41);
    goto LABEL_43;
  }
  if (sub_22A3054F0())
  {
    sub_22A304F10();
    swift_release();
  }
  sub_22A305130();
  swift_release();
  if (!v72)
  {
    swift_release();
    uint64_t v41 = v68;
    goto LABEL_38;
  }
  uint64_t v64 = v72;
  sub_22A305010();
  uint64_t v42 = v66;
  (*(void (**)(char *, void, uint64_t))(v66 + 104))(v15, *MEMORY[0x263F72AC8], v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v15, 0, 1, v4);
  uint64_t v43 = (uint64_t)&v8[*(int *)(v6 + 48)];
  sub_22A2EC750((uint64_t)v17, (uint64_t)v8);
  sub_22A2EC750((uint64_t)v15, v43);
  uint64_t v44 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48);
  if (v44((uint64_t)v8, 1, v4) == 1)
  {
    sub_22A2E2868((uint64_t)v15, &qword_268371968);
    sub_22A2E2868((uint64_t)v17, &qword_268371968);
    if (v44(v43, 1, v4) == 1)
    {
      sub_22A2E2868((uint64_t)v8, &qword_268371968);
      uint64_t v41 = v68;
      goto LABEL_45;
    }
    goto LABEL_36;
  }
  sub_22A2EC750((uint64_t)v8, (uint64_t)v12);
  if (v44(v43, 1, v4) == 1)
  {
    sub_22A2E2868((uint64_t)v15, &qword_268371968);
    sub_22A2E2868((uint64_t)v17, &qword_268371968);
    (*(void (**)(char *, uint64_t))(v66 + 8))(v12, v4);
LABEL_36:
    sub_22A2E2868((uint64_t)v8, &qword_268371960);
    uint64_t v41 = v68;
LABEL_37:
    swift_release();
    swift_release();
    goto LABEL_38;
  }
  id v55 = v65;
  uint64_t v54 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 32))(v65, v43, v4);
  sub_22A2EC7B8();
  LODWORD(v63) = sub_22A305D00();
  uint64_t v56 = *(void (**)(char *, uint64_t))(v54 + 8);
  v56(v55, v4);
  sub_22A2E2868((uint64_t)v15, &qword_268371968);
  sub_22A2E2868((uint64_t)v17, &qword_268371968);
  v56(v12, v4);
  sub_22A2E2868((uint64_t)v8, &qword_268371968);
  uint64_t v41 = v68;
  if ((v63 & 1) == 0) {
    goto LABEL_37;
  }
LABEL_45:
  if (!sub_22A305500()) {
    goto LABEL_37;
  }
  double v57 = COERCE_DOUBLE(UsoEntity_common_Number.asDouble.getter());
  char v59 = v58;
  swift_release();
  swift_release();
  swift_release();
  if (v59) {
    goto LABEL_38;
  }
  *(double *)&uint64_t result = v57 / 100.0;
  return result;
}

uint64_t sub_22A2EC6F0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

uint64_t sub_22A2EC750(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371968);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_22A2EC7B8()
{
  unint64_t result = qword_268371970;
  if (!qword_268371970)
  {
    sub_22A305020();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371970);
  }
  return result;
}

unsigned char *sub_22A2EC810@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (unint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_22A2EC880@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t FlowFinder.deinit()
{
  return v0;
}

uint64_t FlowFinder.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FlowFinder()
{
  return self;
}

uint64_t static UsoEntity_common_WorkoutClass.builder(name:duration:equipment:instructor:episodeNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_22A3056A0();
  swift_allocObject();
  uint64_t v13 = sub_22A305690();
  if (a2) {
    sub_22A305680();
  }
  if (a3)
  {
    swift_retain();
    sub_22A305640();
    swift_release();
  }
  if (a5)
  {
    swift_retain();
    sub_22A305650();
    swift_release();
  }
  if (a7)
  {
    swift_retain();
    sub_22A305660();
    swift_release();
  }
  if (a9)
  {
    swift_retain();
    sub_22A305670();
    swift_release();
  }
  return v13;
}

uint64_t static UsoEntity_common_WorkoutClass.with(name:duration:equipment:instructor:episodeNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_22A3056A0();
  swift_allocObject();
  uint64_t v13 = sub_22A305690();
  if (a2) {
    sub_22A305680();
  }
  if (a3)
  {
    swift_retain();
    sub_22A305640();
    swift_release();
  }
  if (a5)
  {
    swift_retain();
    sub_22A305650();
    swift_release();
  }
  if (a7)
  {
    swift_retain();
    sub_22A305660();
    swift_release();
  }
  if (a9)
  {
    swift_retain();
    sub_22A305670();
    swift_release();
  }
  MEMORY[0x22A6C3FC0](v13);
  sub_22A3051F0();
  sub_22A305130();
  swift_release();
  swift_release();
  return v15;
}

Swift::String __swiftcall String.firstLetterCapitalized()()
{
  uint64_t v2 = sub_22A2ECB88(v0, v1, MEMORY[0x263F8D958]);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

Swift::String __swiftcall String.firstLetterLowerCase()()
{
  uint64_t v2 = sub_22A2ECB88(v0, v1, MEMORY[0x263F8D948]);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t sub_22A2ECB88(unint64_t a1, unint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_22A2ECD24(1, a1, a2, v6);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  uint64_t v14 = a3(v7, v9, v11, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22A2ECDC0(1uLL, a1, a2, v15);
  swift_bridgeObjectRelease();
  sub_22A2ECE70();
  swift_bridgeObjectRetain();
  sub_22A305D70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t String.toDialogPhoneNumber.getter()
{
  sub_22A305A50();
  swift_allocObject();
  sub_22A305A40();
  sub_22A305A30();
  swift_release();
  uint64_t v0 = sub_22A305A20();
  swift_release();
  return v0;
}

uint64_t sub_22A2ECD24(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_22A305D60();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

uint64_t sub_22A2ECDC0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
  }
  unint64_t v4 = a3;
  unint64_t v5 = a2;
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v6 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v7 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v7 = 11;
  }
  unint64_t v8 = v7 | (v6 << 16);
  a1 = sub_22A305D60();
  if (a2) {
    a1 = v8;
  }
  if (4 * v6 < a1 >> 14) {
    goto LABEL_14;
  }
  a2 = v8;
  a3 = v5;
  a4 = v4;
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

unint64_t sub_22A2ECE70()
{
  unint64_t result = qword_268371978;
  if (!qword_268371978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371978);
  }
  return result;
}

unint64_t TaskLoggerNames.rawValue.getter(char a1)
{
  unint64_t result = 0xD00000000000001CLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 0xD000000000000019;
      break;
    case 4:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 5:
      unint64_t result = 0xD00000000000001ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22A2ECF88(char *a1, char *a2)
{
  return sub_22A2ED098(*a1, *a2);
}

uint64_t sub_22A2ECF94(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 6778732;
    }
    else {
      uint64_t v3 = 0x7972657571;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE300000000000000;
    }
    else {
      unint64_t v4 = 0xE500000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 6778732;
      }
      else {
        uint64_t v6 = 0x7972657571;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE300000000000000;
      }
      else {
        unint64_t v7 = 0xE500000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE700000000000000;
    uint64_t v3 = 0x6E776F6E6B6E75;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE700000000000000;
  if (v3 != 0x6E776F6E6B6E75)
  {
LABEL_21:
    char v8 = sub_22A3060C0();
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

uint64_t sub_22A2ED098(char a1, char a2)
{
  unint64_t v3 = 0xD00000000000001CLL;
  unint64_t v4 = 0x800000022A3074D0;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xD00000000000001DLL;
      int v5 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v4 = 0x800000022A307510;
      unint64_t v3 = 0xD000000000000015;
      break;
    case 3:
      unint64_t v3 = 0xD000000000000019;
      int v5 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      unint64_t v3 = 0xD00000000000001BLL;
      int v5 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      unint64_t v3 = 0xD00000000000001ELL;
      int v5 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD00000000000001CLL;
  unint64_t v7 = 0x800000022A3074D0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xD00000000000001DLL;
      char v8 = "com.apple.siri.health.fitness";
      goto LABEL_14;
    case 2:
      unint64_t v7 = 0x800000022A307510;
      unint64_t v6 = 0xD000000000000015;
      break;
    case 3:
      unint64_t v6 = 0xD000000000000019;
      char v8 = "com.apple.siri.health.log";
      goto LABEL_14;
    case 4:
      unint64_t v6 = 0xD00000000000001BLL;
      char v8 = "com.apple.siri.health.query";
      goto LABEL_14;
    case 5:
      unint64_t v6 = 0xD00000000000001ELL;
      char v8 = "com.apple.siri.health.fedstats";
LABEL_14:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_22A3060C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_22A2ED260()
{
  return sub_22A2ED268();
}

uint64_t sub_22A2ED268()
{
  return sub_22A306160();
}

uint64_t sub_22A2ED378()
{
  return sub_22A2ED380();
}

uint64_t sub_22A2ED380()
{
  sub_22A305D50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22A2ED474()
{
  return sub_22A2ED47C();
}

uint64_t sub_22A2ED47C()
{
  return sub_22A306160();
}

uint64_t sub_22A2ED588@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s18HealthDomainsTools15TaskLoggerNamesO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_22A2ED5B8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = TaskLoggerNames.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t FederatedTaskKind.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x6E776F6E6B6E75;
  }
  if (a1 == 1) {
    return 6778732;
  }
  return 0x7972657571;
}

uint64_t sub_22A2ED634(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22A2ECF94(*a1, *a2);
}

uint64_t sub_22A2ED640()
{
  return sub_22A306160();
}

uint64_t sub_22A2ED6D8()
{
  sub_22A305D50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22A2ED75C()
{
  return sub_22A306160();
}

uint64_t sub_22A2ED7F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s18HealthDomainsTools17FederatedTaskKindO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_22A2ED820(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE700000000000000;
  unint64_t v4 = 0xE300000000000000;
  uint64_t v5 = 6778732;
  if (v2 != 1)
  {
    uint64_t v5 = 0x7972657571;
    unint64_t v4 = 0xE500000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6E776F6E6B6E75;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

HealthDomainsTools::FlowTaskLogger __swiftcall FlowTaskLogger.init()()
{
  return 0;
}

Swift::Void __swiftcall FlowTaskLogger.taskStart()()
{
  uint64_t v1 = 0xD00000000000001CLL;
  unint64_t v2 = 0x800000022A3074D0;
  switch(v0)
  {
    case 1:
      uint64_t v1 = 0xD00000000000001DLL;
      unint64_t v3 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v2 = 0x800000022A307510;
      uint64_t v1 = 0xD000000000000015;
      break;
    case 3:
      uint64_t v1 = 0xD000000000000019;
      unint64_t v3 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      uint64_t v1 = 0xD00000000000001BLL;
      unint64_t v3 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      uint64_t v1 = 0xD00000000000001ELL;
      unint64_t v3 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v2 = (unint64_t)(v3 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_22A2EEF44(1, v1, v2, 0x100000000);
  swift_bridgeObjectRelease();
}

uint64_t FlowTaskLogger.task(_:)(int a1, char a2)
{
  uint64_t v3 = 0xD00000000000001CLL;
  unint64_t v4 = 0x800000022A3074D0;
  switch(a2)
  {
    case 1:
      uint64_t v3 = 0xD00000000000001DLL;
      uint64_t v5 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v4 = 0x800000022A307510;
      uint64_t v3 = 0xD000000000000015;
      break;
    case 3:
      uint64_t v3 = 0xD000000000000019;
      uint64_t v5 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      uint64_t v3 = 0xD00000000000001BLL;
      uint64_t v5 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      uint64_t v3 = 0xD00000000000001ELL;
      uint64_t v5 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_22A2EEF44(a1, v3, v4, 0x100000000);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.taskCanceled()()
{
  uint64_t v1 = 0xD00000000000001CLL;
  unint64_t v2 = 0x800000022A3074D0;
  switch(v0)
  {
    case 1:
      uint64_t v1 = 0xD00000000000001DLL;
      uint64_t v3 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v2 = 0x800000022A307510;
      uint64_t v1 = 0xD000000000000015;
      break;
    case 3:
      uint64_t v1 = 0xD000000000000019;
      uint64_t v3 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      uint64_t v1 = 0xD00000000000001BLL;
      uint64_t v3 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      uint64_t v1 = 0xD00000000000001ELL;
      uint64_t v3 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v2 = (unint64_t)(v3 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_22A2EEF44(5, v1, v2, 0x100000000);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.taskNeedsAuthorization()()
{
  uint64_t v1 = 0xD00000000000001CLL;
  unint64_t v2 = 0x800000022A3074D0;
  switch(v0)
  {
    case 1:
      uint64_t v1 = 0xD00000000000001DLL;
      uint64_t v3 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v2 = 0x800000022A307510;
      uint64_t v1 = 0xD000000000000015;
      break;
    case 3:
      uint64_t v1 = 0xD000000000000019;
      uint64_t v3 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      uint64_t v1 = 0xD00000000000001BLL;
      uint64_t v3 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      uint64_t v1 = 0xD00000000000001ELL;
      uint64_t v3 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v2 = (unint64_t)(v3 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_22A2EEF44(7, v1, v2, 3);
  swift_bridgeObjectRelease();
}

uint64_t FlowTaskLogger.task(reason:)(uint64_t result, char a2)
{
  switch((int)result)
  {
    case 1:
      uint64_t v3 = 0xD00000000000001CLL;
      unint64_t v4 = 0x800000022A3074D0;
      switch(a2)
      {
        case 1:
          uint64_t v3 = 0xD00000000000001DLL;
          uint64_t v5 = "com.apple.siri.health.fitness";
          goto LABEL_14;
        case 2:
          unint64_t v4 = 0x800000022A307510;
          uint64_t v3 = 0xD000000000000015;
          break;
        case 3:
          uint64_t v3 = 0xD000000000000019;
          uint64_t v5 = "com.apple.siri.health.log";
          goto LABEL_14;
        case 4:
          uint64_t v3 = 0xD00000000000001BLL;
          uint64_t v5 = "com.apple.siri.health.query";
          goto LABEL_14;
        case 5:
          uint64_t v3 = 0xD00000000000001ELL;
          uint64_t v5 = "com.apple.siri.health.fedstats";
LABEL_14:
          unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
          break;
        default:
          break;
      }
      uint64_t v9 = 1;
      int v10 = 2;
      goto LABEL_34;
    case 3:
      uint64_t v3 = 0xD00000000000001CLL;
      unint64_t v4 = 0x800000022A3074D0;
      switch(a2)
      {
        case 1:
          uint64_t v3 = 0xD00000000000001DLL;
          BOOL v6 = "com.apple.siri.health.fitness";
          goto LABEL_20;
        case 2:
          unint64_t v4 = 0x800000022A307510;
          uint64_t v3 = 0xD000000000000015;
          break;
        case 3:
          uint64_t v3 = 0xD000000000000019;
          BOOL v6 = "com.apple.siri.health.log";
          goto LABEL_20;
        case 4:
          uint64_t v3 = 0xD00000000000001BLL;
          BOOL v6 = "com.apple.siri.health.query";
          goto LABEL_20;
        case 5:
          uint64_t v3 = 0xD00000000000001ELL;
          BOOL v6 = "com.apple.siri.health.fedstats";
LABEL_20:
          unint64_t v4 = (unint64_t)(v6 - 32) | 0x8000000000000000;
          break;
        default:
          break;
      }
      uint64_t v9 = 3;
      int v10 = 7;
      goto LABEL_34;
    case 21:
      uint64_t v3 = 0xD00000000000001CLL;
      unint64_t v4 = 0x800000022A3074D0;
      switch(a2)
      {
        case 1:
          uint64_t v3 = 0xD00000000000001DLL;
          uint64_t v7 = "com.apple.siri.health.fitness";
          goto LABEL_26;
        case 2:
          unint64_t v4 = 0x800000022A307510;
          uint64_t v3 = 0xD000000000000015;
          break;
        case 3:
          uint64_t v3 = 0xD000000000000019;
          uint64_t v7 = "com.apple.siri.health.log";
          goto LABEL_26;
        case 4:
          uint64_t v3 = 0xD00000000000001BLL;
          uint64_t v7 = "com.apple.siri.health.query";
          goto LABEL_26;
        case 5:
          uint64_t v3 = 0xD00000000000001ELL;
          uint64_t v7 = "com.apple.siri.health.fedstats";
LABEL_26:
          unint64_t v4 = (unint64_t)(v7 - 32) | 0x8000000000000000;
          break;
        default:
          break;
      }
      uint64_t v9 = 21;
      int v10 = 4;
      goto LABEL_34;
    case 36:
      uint64_t v3 = 0xD00000000000001CLL;
      unint64_t v4 = 0x800000022A3074D0;
      switch(a2)
      {
        case 1:
          uint64_t v3 = 0xD00000000000001DLL;
          char v8 = "com.apple.siri.health.fitness";
          goto LABEL_32;
        case 2:
          unint64_t v4 = 0x800000022A307510;
          uint64_t v3 = 0xD000000000000015;
          break;
        case 3:
          uint64_t v3 = 0xD000000000000019;
          char v8 = "com.apple.siri.health.log";
          goto LABEL_32;
        case 4:
          uint64_t v3 = 0xD00000000000001BLL;
          char v8 = "com.apple.siri.health.query";
          goto LABEL_32;
        case 5:
          uint64_t v3 = 0xD00000000000001ELL;
          char v8 = "com.apple.siri.health.fedstats";
LABEL_32:
          unint64_t v4 = (unint64_t)(v8 - 32) | 0x8000000000000000;
          break;
        default:
          break;
      }
      uint64_t v9 = 36;
      int v10 = 26;
LABEL_34:
      sub_22A2EEF44(v10, v3, v4, v9);
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

Swift::Void __swiftcall FlowTaskLogger.taskCompleted()()
{
  uint64_t v1 = 0xD00000000000001CLL;
  unint64_t v2 = 0x800000022A3074D0;
  switch(v0)
  {
    case 1:
      uint64_t v1 = 0xD00000000000001DLL;
      uint64_t v3 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v2 = 0x800000022A307510;
      uint64_t v1 = 0xD000000000000015;
      break;
    case 3:
      uint64_t v1 = 0xD000000000000019;
      uint64_t v3 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      uint64_t v1 = 0xD00000000000001BLL;
      uint64_t v3 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      uint64_t v1 = 0xD00000000000001ELL;
      uint64_t v3 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v2 = (unint64_t)(v3 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_22A2EEF44(2, v1, v2, 0x100000000);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.taskPartial()()
{
  uint64_t v1 = 0xD00000000000001CLL;
  unint64_t v2 = 0x800000022A3074D0;
  switch(v0)
  {
    case 1:
      uint64_t v1 = 0xD00000000000001DLL;
      uint64_t v3 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v2 = 0x800000022A307510;
      uint64_t v1 = 0xD000000000000015;
      break;
    case 3:
      uint64_t v1 = 0xD000000000000019;
      uint64_t v3 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      uint64_t v1 = 0xD00000000000001BLL;
      uint64_t v3 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      uint64_t v1 = 0xD00000000000001ELL;
      uint64_t v3 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v2 = (unint64_t)(v3 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_22A2EEF44(3, v1, v2, 0x100000000);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.taskDisambiguate()()
{
  uint64_t v1 = 0xD00000000000001CLL;
  unint64_t v2 = 0x800000022A3074D0;
  switch(v0)
  {
    case 1:
      uint64_t v1 = 0xD00000000000001DLL;
      uint64_t v3 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v2 = 0x800000022A307510;
      uint64_t v1 = 0xD000000000000015;
      break;
    case 3:
      uint64_t v1 = 0xD000000000000019;
      uint64_t v3 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      uint64_t v1 = 0xD00000000000001BLL;
      uint64_t v3 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      uint64_t v1 = 0xD00000000000001ELL;
      uint64_t v3 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v2 = (unint64_t)(v3 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_22A2EEF44(10, v1, v2, 0x100000000);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.taskFailed()()
{
  uint64_t v1 = 0xD00000000000001CLL;
  unint64_t v2 = 0x800000022A3074D0;
  switch(v0)
  {
    case 1:
      uint64_t v1 = 0xD00000000000001DLL;
      uint64_t v3 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v2 = 0x800000022A307510;
      uint64_t v1 = 0xD000000000000015;
      break;
    case 3:
      uint64_t v1 = 0xD000000000000019;
      uint64_t v3 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      uint64_t v1 = 0xD00000000000001BLL;
      uint64_t v3 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      uint64_t v1 = 0xD00000000000001ELL;
      uint64_t v3 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v2 = (unint64_t)(v3 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_22A2EEF44(4, v1, v2, 0x100000000);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.genericError()()
{
  uint64_t v1 = 0xD00000000000001CLL;
  unint64_t v2 = 0x800000022A3074D0;
  switch(v0)
  {
    case 1:
      uint64_t v1 = 0xD00000000000001DLL;
      uint64_t v3 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v2 = 0x800000022A307510;
      uint64_t v1 = 0xD000000000000015;
      break;
    case 3:
      uint64_t v1 = 0xD000000000000019;
      uint64_t v3 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      uint64_t v1 = 0xD00000000000001BLL;
      uint64_t v3 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      uint64_t v1 = 0xD00000000000001ELL;
      uint64_t v3 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v2 = (unint64_t)(v3 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_22A2EEF44(4, v1, v2, 21);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.success()()
{
  uint64_t v1 = 0xD00000000000001CLL;
  unint64_t v2 = 0x800000022A3074D0;
  switch(v0)
  {
    case 1:
      uint64_t v1 = 0xD00000000000001DLL;
      uint64_t v3 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v2 = 0x800000022A307510;
      uint64_t v1 = 0xD000000000000015;
      break;
    case 3:
      uint64_t v1 = 0xD000000000000019;
      uint64_t v3 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      uint64_t v1 = 0xD00000000000001BLL;
      uint64_t v3 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      uint64_t v1 = 0xD00000000000001ELL;
      uint64_t v3 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v2 = (unint64_t)(v3 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_22A2EEF44(2, v1, v2, 1);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.unsupported()()
{
  uint64_t v1 = 0xD00000000000001CLL;
  unint64_t v2 = 0x800000022A3074D0;
  switch(v0)
  {
    case 1:
      uint64_t v1 = 0xD00000000000001DLL;
      uint64_t v3 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v2 = 0x800000022A307510;
      uint64_t v1 = 0xD000000000000015;
      break;
    case 3:
      uint64_t v1 = 0xD000000000000019;
      uint64_t v3 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      uint64_t v1 = 0xD00000000000001BLL;
      uint64_t v3 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      uint64_t v1 = 0xD00000000000001ELL;
      uint64_t v3 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v2 = (unint64_t)(v3 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_22A2EEF44(26, v1, v2, 36);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.taskUnsupported()()
{
  uint64_t v1 = 0xD00000000000001CLL;
  unint64_t v2 = 0x800000022A3074D0;
  switch(v0)
  {
    case 1:
      uint64_t v1 = 0xD00000000000001DLL;
      uint64_t v3 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v2 = 0x800000022A307510;
      uint64_t v1 = 0xD000000000000015;
      break;
    case 3:
      uint64_t v1 = 0xD000000000000019;
      uint64_t v3 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      uint64_t v1 = 0xD00000000000001BLL;
      uint64_t v3 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      uint64_t v1 = 0xD00000000000001ELL;
      uint64_t v3 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v2 = (unint64_t)(v3 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_22A2EEF44(26, v1, v2, 0x100000000);
  swift_bridgeObjectRelease();
}

uint64_t FlowTaskLogger.task(_:name:)(int a1, char a2)
{
  uint64_t v3 = 0xD00000000000001CLL;
  unint64_t v4 = 0x800000022A3074D0;
  switch(a2)
  {
    case 1:
      uint64_t v3 = 0xD00000000000001DLL;
      uint64_t v5 = "com.apple.siri.health.fitness";
      goto LABEL_7;
    case 2:
      unint64_t v4 = 0x800000022A307510;
      uint64_t v3 = 0xD000000000000015;
      break;
    case 3:
      uint64_t v3 = 0xD000000000000019;
      uint64_t v5 = "com.apple.siri.health.log";
      goto LABEL_7;
    case 4:
      uint64_t v3 = 0xD00000000000001BLL;
      uint64_t v5 = "com.apple.siri.health.query";
      goto LABEL_7;
    case 5:
      uint64_t v3 = 0xD00000000000001ELL;
      uint64_t v5 = "com.apple.siri.health.fedstats";
LABEL_7:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_22A2EEF44(a1, v3, v4, 0x100000000);
  return swift_bridgeObjectRelease();
}

uint64_t FlowTaskLogger.task(_:name:reason:)(int a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_22A2EEF44(a1, a2, a3, a4 | ((HIDWORD(a4) & 1) << 32));
}

Swift::Void __swiftcall FlowTaskLogger.federatedStats(kind:dataTypeString:)(HealthDomainsTools::FederatedTaskKind kind, Swift::String dataTypeString)
{
  object = dataTypeString._object;
  uint64_t countAndFlagsBits = dataTypeString._countAndFlagsBits;
  uint64_t v4 = kind;
  uint64_t v5 = sub_22A305C80();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268371438 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v5, (uint64_t)static Logger.wellness);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  swift_bridgeObjectRetain_n();
  int v10 = sub_22A305C60();
  os_log_type_t v11 = sub_22A305E40();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v25 = countAndFlagsBits;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v27 = v23;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v24 = v4;
    if ((_BYTE)v4)
    {
      if (v4 == 1) {
        uint64_t v13 = 6778732;
      }
      else {
        uint64_t v13 = 0x7972657571;
      }
      if (v4 == 1) {
        unint64_t v14 = 0xE300000000000000;
      }
      else {
        unint64_t v14 = 0xE500000000000000;
      }
    }
    else
    {
      unint64_t v14 = 0xE700000000000000;
      uint64_t v13 = 0x6E776F6E6B6E75;
    }
    uint64_t v26 = sub_22A2E2200(v13, v14, &v27);
    sub_22A305ED0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_22A2E2200(v25, (unint64_t)object, &v27);
    sub_22A305ED0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22A2DE000, v10, v11, "Federated Task Log: %s for %s", (uint8_t *)v12, 0x16u);
    uint64_t v4 = v23;
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v4, -1, -1);
    MEMORY[0x22A6C55A0](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    LOBYTE(v4) = v24;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v15 = dword_22A306B34[(char)v4];
  id v16 = objc_allocWithZone(MEMORY[0x263F2A3E0]);
  swift_bridgeObjectRetain();
  uint64_t v17 = (void *)sub_22A305D10();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v16, sel_initWithAction_typeIdentifier_, v15, v17);

  id v19 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
  swift_unknownObjectRelease();
  id v20 = objc_msgSend(v19, sel_Health);
  swift_unknownObjectRelease();
  id v21 = objc_msgSend(v20, sel_Federated);
  swift_unknownObjectRelease();
  id v22 = objc_msgSend(v21, sel_source);
  objc_msgSend(v22, sel_sendEvent_, v18);
}

uint64_t _s18HealthDomainsTools15TaskLoggerNamesO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_22A306080();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t _s18HealthDomainsTools17FederatedTaskKindO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_22A306080();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_22A2EEF44(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = a2;
  uint64_t v7 = sub_22A305C80();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  int v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268371438 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v7, (uint64_t)static Logger.wellness);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_22A305C60();
  os_log_type_t v13 = sub_22A305E40();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v24 = a4;
    uint64_t v15 = v14;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v26 = v22;
    *(_DWORD *)uint64_t v15 = 136315394;
    uint64_t v16 = sub_22A305E70();
    int v23 = a1;
    v27[0] = sub_22A2E2200(v16, v17, &v26);
    sub_22A305ED0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    v27[0] = v25;
    v27[1] = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268371818);
    uint64_t v18 = sub_22A305EC0();
    v27[0] = sub_22A2E2200(v18, v19, &v26);
    sub_22A305ED0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22A2DE000, v12, v13, "logging STC: %s in %s", (uint8_t *)v15, 0x16u);
    uint64_t v20 = v22;
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v20, -1, -1);
    MEMORY[0x22A6C55A0](v15, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_22A304AE0();
  swift_bridgeObjectRetain();
  sub_22A304AD0();
  sub_22A304A90();
  __swift_project_boxed_opaque_existential_1(v27, v27[3]);
  sub_22A304AA0();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
}

unint64_t sub_22A2EF2F8()
{
  unint64_t result = qword_268371980;
  if (!qword_268371980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371980);
  }
  return result;
}

unint64_t sub_22A2EF350()
{
  unint64_t result = qword_268371988;
  if (!qword_268371988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371988);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_22A2EF3BC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22A2EF3C4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TaskLoggerNames()
{
  return &type metadata for TaskLoggerNames;
}

uint64_t getEnumTagSinglePayload for FederatedTaskKind(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FederatedTaskKind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22A2EF538);
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

ValueMetadata *type metadata accessor for FederatedTaskKind()
{
  return &type metadata for FederatedTaskKind;
}

uint64_t _s18HealthDomainsTools15TaskLoggerNamesOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s18HealthDomainsTools15TaskLoggerNamesOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22A2EF6CCLL);
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

ValueMetadata *type metadata accessor for FlowTaskLogger()
{
  return &type metadata for FlowTaskLogger;
}

uint64_t static UsoEntity_common_ListPosition.builder(definedValue:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371800);
  MEMORY[0x270FA5388](v2 - 8);
  unsigned int v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22A3051E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A305630();
  swift_allocObject();
  uint64_t v9 = sub_22A305620();
  sub_22A2EF8A4(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_22A2EF90C((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    sub_22A305610();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v9;
}

uint64_t sub_22A2EF8A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A2EF90C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371800);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Bool __swiftcall NetworkStatusProvider.isNetworkingDisabled()()
{
  if ((_s18HealthDomainsTools21NetworkStatusProviderC9isOfflineSbyF_0() & 1) == 0) {
    return 0;
  }
  sub_22A3059C0();
  sub_22A3059B0();
  sub_22A3059A0();
  swift_release();
  char v0 = sub_22A3059E0();
  swift_release();
  return v0 & 1;
}

uint64_t NetworkStatusProvider.deinit()
{
  return v0;
}

uint64_t NetworkStatusProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22A2EF9F4()
{
  if ((_s18HealthDomainsTools21NetworkStatusProviderC9isOfflineSbyF_0() & 1) == 0) {
    return 0;
  }
  sub_22A3059C0();
  sub_22A3059B0();
  sub_22A3059A0();
  swift_release();
  char v0 = sub_22A3059E0();
  swift_release();
  return v0 & 1;
}

uint64_t static NetworkErrors.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t NetworkErrors.hash(into:)()
{
  return sub_22A306150();
}

uint64_t NetworkErrors.hashValue.getter()
{
  return sub_22A306160();
}

uint64_t sub_22A2EFAD0()
{
  return sub_22A306160();
}

uint64_t sub_22A2EFB14()
{
  return sub_22A306150();
}

uint64_t sub_22A2EFB3C()
{
  return sub_22A306160();
}

uint64_t _s18HealthDomainsTools21NetworkStatusProviderC9isOfflineSbyF_0()
{
  uint64_t v0 = sub_22A305C80();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22A305A00();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  int v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  int v10 = (char *)v18 - v9;
  sub_22A3059C0();
  sub_22A3059B0();
  sub_22A3059A0();
  swift_release();
  sub_22A305A10();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, *MEMORY[0x263F75840], v4);
  char v11 = sub_22A3059F0();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v12(v10, v4);
  if (qword_268371458 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v0, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v13, v0);
  uint64_t v14 = sub_22A305C60();
  os_log_type_t v15 = sub_22A305E40();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 67109120;
    v18[1] = v11 & 1;
    sub_22A305ED0();
    _os_log_impl(&dword_22A2DE000, v14, v15, "NetworkStatusProvider isOffline=%{BOOL}d", v16, 8u);
    MEMORY[0x22A6C55A0](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v11 & 1;
}

unint64_t sub_22A2EFEAC()
{
  unint64_t result = qword_268371990;
  if (!qword_268371990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371990);
  }
  return result;
}

uint64_t type metadata accessor for NetworkStatusProvider()
{
  return self;
}

uint64_t getEnumTagSinglePayload for NetworkErrors(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for NetworkErrors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x22A2F0014);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22A2F003C()
{
  return 0;
}

ValueMetadata *type metadata accessor for NetworkErrors()
{
  return &type metadata for NetworkErrors;
}

uint64_t sub_22A2F0054(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_22A305FD0();
    uint64_t v5 = v4;
    uint64_t v6 = sub_22A306020();
    char v8 = MEMORY[0x22A6C4F10](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_3:
      sub_22A2F1388(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_22A2F11DC(v3, v5, v2 != 0, a1);
    uint64_t v9 = v13;
    sub_22A2F1388(v3, v5, v2 != 0);
    return v9;
  }
  uint64_t result = sub_22A2F1394(a1);
  if ((v12 & 1) == 0)
  {
    uint64_t v5 = v11;
    if (*(_DWORD *)(a1 + 36) == v11)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t findRemoteDevice(with:deviceResolutionService:)(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_22A3059D0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22A2F0224, 0, 0);
}

uint64_t sub_22A2F0224()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v1, v0[2], v3);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x263F75640] || v4 == *MEMORY[0x263F75648])
  {
    uint64_t v6 = (void *)v0[3];
    uint64_t v7 = v6[3];
    uint64_t v8 = v6[4];
    __swift_project_boxed_opaque_existential_1(v6, v7);
    uint64_t v9 = (void *)swift_task_alloc();
    v0[7] = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_22A2F04BC;
    return MEMORY[0x270F72EB8](v7, v8);
  }
  else if (v4 == *MEMORY[0x263F75618])
  {
    int v10 = (void *)v0[3];
    sub_22A305C50();
    uint64_t v11 = (void *)sub_22A305C40();
    v0[8] = v11;
    uint64_t v12 = v10[3];
    uint64_t v13 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v12);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2683719F0);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_22A3067E0;
    *(void *)(v14 + 32) = v11;
    uint64_t v19 = v14;
    sub_22A305DF0();
    v0[9] = v19;
    id v15 = v11;
    uint64_t v16 = (void *)swift_task_alloc();
    v0[10] = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_22A2F05DC;
    return MEMORY[0x270F72ED0](v19, v12, v13);
  }
  else
  {
    (*(void (**)(void, void))(v0[5] + 8))(v0[6], v0[4]);
    swift_task_dealloc();
    unint64_t v17 = (uint64_t (*)(void))v0[1];
    return v17(0);
  }
}

uint64_t sub_22A2F04BC(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {

    a1 = 0;
  }
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
  return v5(a1);
}

uint64_t sub_22A2F05DC(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {

    uint64_t v5 = sub_22A2F07B8;
  }
  else
  {
    *(void *)(v4 + 88) = a1;
    uint64_t v5 = sub_22A2F072C;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_22A2F072C()
{
  uint64_t v1 = (void *)v0[8];
  uint64_t v2 = sub_22A2F0054(v0[11]);

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

uint64_t sub_22A2F07B8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t isRemoteDeviceReachable(remoteDevice:aceService:)(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t v3 = sub_22A305C80();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22A2F090C, 0, 0);
}

uint64_t sub_22A2F090C()
{
  if (qword_268371450 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)static Logger.workout);
  v0[15] = v4;
  swift_beginAccess();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[16] = v5;
  v0[17] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = sub_22A305C60();
  os_log_type_t v7 = sub_22A305E40();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_22A2DE000, v6, v7, "Checking to see if remote device is reachable", v8, 2u);
    MEMORY[0x22A6C55A0](v8, -1, -1);
  }
  uint64_t v9 = v0[14];
  uint64_t v10 = v0[9];
  uint64_t v11 = v0[10];

  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[18] = v12;
  v0[19] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v12(v9, v10);
  uint64_t v13 = sub_22A305C00();
  unint64_t v15 = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0) {
    uint64_t v16 = v13 & 0xFFFFFFFFFFFFLL;
  }
  if (v16)
  {
    unint64_t v17 = (void *)v0[8];
    uint64_t v19 = v17[3];
    uint64_t v18 = v17[4];
    __swift_project_boxed_opaque_existential_1(v17, v19);
    id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64B70]), sel_init);
    v0[20] = v20;
    uint64_t v21 = sub_22A305C00();
    uint64_t v23 = v22;
    v0[21] = v22;
    uint64_t v24 = (void *)swift_task_alloc();
    v0[22] = v24;
    unint64_t v25 = sub_22A2E3AC8();
    *uint64_t v24 = v0;
    v24[1] = sub_22A2F0C74;
    return MEMORY[0x270F67CC0](v20, v21, v23, v19, v25, v18);
  }
  else
  {
    v5(v0[12], v4, v0[9]);
    uint64_t v26 = sub_22A305C60();
    os_log_type_t v27 = sub_22A305E50();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_22A2DE000, v26, v27, "The assistantId for remote device was an empty string. Marking the device as unreachable", v28, 2u);
      MEMORY[0x22A6C55A0](v28, -1, -1);
    }

    ((void (*)(void, void))v0[18])(v0[12], v0[9]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v29 = (uint64_t (*)(void))v0[1];
    return v29(0);
  }
}

uint64_t sub_22A2F0C74(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[23] = a1;
  v3[24] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_22A2F0F88;
  }
  else
  {
    uint64_t v5 = (void *)v3[20];
    swift_bridgeObjectRelease();

    uint64_t v4 = sub_22A2F0D94;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_22A2F0D94()
{
  uint64_t v1 = *(void **)(v0 + 184);
  (*(void (**)(void, void, void))(v0 + 128))(*(void *)(v0 + 104), *(void *)(v0 + 120), *(void *)(v0 + 72));
  id v2 = v1;
  uint64_t v3 = sub_22A305C60();
  os_log_type_t v4 = sub_22A305E40();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void **)(v0 + 184);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    *(void *)(v0 + 48) = v5;
    id v7 = v5;
    sub_22A305ED0();
    *uint64_t v11 = v5;

    _os_log_impl(&dword_22A2DE000, v3, v4, "Pinged remote device and got response: %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683718C8);
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v11, -1, -1);
    MEMORY[0x22A6C55A0](v6, -1, -1);
    uint64_t v8 = *(NSObject **)(v0 + 184);
  }
  else
  {

    uint64_t v8 = *(NSObject **)(v0 + 184);
    uint64_t v3 = v8;
  }

  (*(void (**)(void, void))(v0 + 144))(*(void *)(v0 + 104), *(void *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v9(1);
}

uint64_t sub_22A2F0F88()
{
  uint64_t v1 = *(void **)(v0 + 192);
  id v2 = *(void **)(v0 + 160);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 72);
  swift_bridgeObjectRelease();

  v3(v5, v4, v6);
  id v7 = v1;
  id v8 = v1;
  uint64_t v9 = sub_22A305C60();
  os_log_type_t v10 = sub_22A305E50();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = *(void **)(v0 + 192);
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    id v14 = v11;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v15;
    sub_22A305ED0();
    *uint64_t v13 = v15;

    _os_log_impl(&dword_22A2DE000, v9, v10, "Unable to ping the remote device. Error: %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683718C8);
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v13, -1, -1);
    MEMORY[0x22A6C55A0](v12, -1, -1);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 192);
  }
  (*(void (**)(void, void))(v0 + 144))(*(void *)(v0 + 88), *(void *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17(0);
}

uint64_t sub_22A2F11A4(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

void sub_22A2F11DC(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v5 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_22A305FE0();
      sub_22A305C10();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_19;
  }
  if (a3)
  {
LABEL_10:
    if (sub_22A306000() == *(_DWORD *)(a4 + 36))
    {
      sub_22A306010();
      sub_22A305C10();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      unint64_t v5 = sub_22A2FBBC4((uint64_t)v10);
      char v7 = v6;

      if (v7) {
        goto LABEL_12;
      }
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
      return;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 64) >> a1) & 1) == 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  id v8 = *(void **)(*(void *)(a4 + 48) + 8 * v5);
  id v9 = v8;
}

uint64_t sub_22A2F1388(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22A2F1394(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    uint64_t v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4) {
    unint64_t v7 = 4;
  }
  unint64_t v8 = v7 - 4;
  id v9 = (unint64_t *)(a1 + 96);
  uint64_t v2 = 192;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t static UsoEntity_common_Integer.builder(name:value:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_22A305370();
  swift_allocObject();
  uint64_t v6 = sub_22A305360();
  if (a2) {
    sub_22A305350();
  }
  if ((a4 & 1) == 0) {
    sub_22A305340();
  }
  return v6;
}

uint64_t static UsoEntity_common_Number.with(name:definedValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _s12SiriOntology23UsoEntity_common_NumberC18HealthDomainsToolsE7builder4name12definedValueAA0cd8Builder_e1_F0CSSSg_AC13DefinedValuesOSgtFZ_0(a1, a2, a3);
  MEMORY[0x22A6C3FC0]();
  sub_22A304FF0();
  sub_22A305130();
  swift_release();
  swift_release();
  return v4;
}

uint64_t static UsoEntity_common_Integer.with(name:value:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_22A305370();
  swift_allocObject();
  uint64_t v6 = sub_22A305360();
  if (a2) {
    sub_22A305350();
  }
  if ((a4 & 1) == 0) {
    sub_22A305340();
  }
  MEMORY[0x22A6C3FC0](v6);
  sub_22A305060();
  sub_22A305130();
  swift_release();
  swift_release();
  return v8;
}

uint64_t static UsoEntity_common_Decimal.with(name:canonicalString:definedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _s12SiriOntology24UsoEntity_common_DecimalC18HealthDomainsToolsE7builder4name15canonicalString12definedValueAA0cd8Builder_e1_F0CSSSg_AkC13DefinedValuesOSgtFZ_0(a1, a2, a3, a4, a5);
  MEMORY[0x22A6C3FC0]();
  sub_22A305040();
  sub_22A305130();
  swift_release();
  swift_release();
  return v6;
}

uint64_t _s12SiriOntology23UsoEntity_common_NumberC18HealthDomainsToolsE7builder4name12definedValueAA0cd8Builder_e1_F0CSSSg_AC13DefinedValuesOSgtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683719A8);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22A304FE0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A305290();
  swift_allocObject();
  uint64_t v12 = sub_22A305280();
  if (a2) {
    sub_22A305270();
  }
  sub_22A2E7F88(a3, (uint64_t)v7, &qword_2683719A8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_22A2E2868((uint64_t)v7, &qword_2683719A8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    sub_22A305260();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v12;
}

uint64_t _s12SiriOntology24UsoEntity_common_DecimalC18HealthDomainsToolsE7builder4name15canonicalString12definedValueAA0cd8Builder_e1_F0CSSSg_AkC13DefinedValuesOSgtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371968);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22A305020();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A305330();
  swift_allocObject();
  uint64_t v15 = sub_22A305320();
  if (a2) {
    sub_22A305310();
  }
  if (a4) {
    sub_22A305300();
  }
  sub_22A2E7F88(a5, (uint64_t)v10, &qword_268371968);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_22A2E2868((uint64_t)v10, &qword_268371968);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    sub_22A3052F0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return v15;
}

void __swiftcall DirectInvocationButton.init(label:payloadIdentifier:payloadUserData:)(HealthDomainsTools::DirectInvocationButton *__return_ptr retstr, Swift::String label, Swift::String payloadIdentifier, Swift::OpaquePointer payloadUserData)
{
  retstr->label = label;
  retstr->payloadIdentifier = payloadIdentifier;
  retstr->payloadUserData = payloadUserData;
}

uint64_t destroy for DirectInvocationButton()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for DirectInvocationButton(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DirectInvocationButton(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for DirectInvocationButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DirectInvocationButton(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DirectInvocationButton(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DirectInvocationButton()
{
  return &type metadata for DirectInvocationButton;
}

uint64_t isFitnessPlusSubscriber()()
{
  uint64_t v1 = sub_22A305970();
  v0[7] = v1;
  v0[8] = *(void *)(v1 - 8);
  v0[9] = swift_task_alloc();
  uint64_t v2 = sub_22A304990();
  v0[10] = v2;
  v0[11] = *(void *)(v2 - 8);
  v0[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22A2F1D54, 0, 0);
}

uint64_t sub_22A2F1D54()
{
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v4 = v0[7];
  sub_22A304980();
  sub_22A305940();
  sub_22A2F2104();
  sub_22A305E60();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, *MEMORY[0x263F68950], v4);
  uint64_t v5 = sub_22A305960();
  uint64_t v6 = MEMORY[0x263F68940];
  v0[5] = v5;
  v0[6] = v6;
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_22A305950();
  sub_22A305990();
  swift_allocObject();
  sub_22A305980();
  sub_22A305E60();
  uint64_t v7 = sub_22A305930();
  v0[13] = v7;
  uint64_t v8 = swift_task_alloc();
  v0[14] = v8;
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v1;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[15] = (uint64_t)v9;
  *uint64_t v9 = v0;
  v9[1] = sub_22A2F1F4C;
  uint64_t v10 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2318](v0 + 16, 0, 0, 0xD000000000000019, 0x800000022A308070, sub_22A2F258C, v8, v10);
}

uint64_t sub_22A2F1F4C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_22A2F2064, 0, 0);
}

uint64_t sub_22A2F2064()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 88);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 128);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v5(v4);
}

unint64_t sub_22A2F2104()
{
  unint64_t result = qword_2683719B8;
  if (!qword_2683719B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2683719B8);
  }
  return result;
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

uint64_t sub_22A2F21A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = a3;
  uint64_t v31 = a2;
  uint64_t v33 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683719C0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v32 = v5;
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683719C8);
  uint64_t v34 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22A305C80();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268371450 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v10, (uint64_t)static Logger.workout);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  uint64_t v15 = sub_22A305C60();
  os_log_type_t v16 = sub_22A305E40();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    char v29 = v9;
    uint64_t v18 = v6;
    uint64_t v19 = v3;
    uint64_t v20 = v7;
    uint64_t v21 = v17;
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_22A2DE000, v15, v16, "Fetching Fitness+ subscription status", v17, 2u);
    uint64_t v22 = v21;
    uint64_t v7 = v20;
    uint64_t v3 = v19;
    uint64_t v6 = v18;
    uint64_t v9 = v29;
    MEMORY[0x22A6C55A0](v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_22A305920();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v33, v3);
  unint64_t v23 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v24 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v24 + v23, v6, v3);
  unint64_t v25 = (void (*)(uint64_t (*)(), uint64_t))sub_22A3049A0();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_22A2F2AC4;
  *(void *)(v26 + 24) = v24;
  swift_retain();
  v25(sub_22A2F2B78, v26);
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v9, v7);
}

uint64_t sub_22A2F258C(uint64_t a1)
{
  return sub_22A2F21A8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_22A2F2594(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = a2;
  uint64_t v3 = sub_22A305C80();
  uint64_t v29 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v28 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22A3048E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22A304970();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683719D0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (void **)((char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22A2F2BA8(a1, (uint64_t)v15);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    os_log_type_t v16 = *v15;
    if (qword_268371450 != -1) {
      swift_once();
    }
    uint64_t v17 = __swift_project_value_buffer(v3, (uint64_t)static Logger.workout);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v28, v17, v3);
    id v18 = v16;
    id v19 = v16;
    uint64_t v20 = sub_22A305C60();
    os_log_type_t v21 = sub_22A305E50();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      unint64_t v23 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 138412290;
      id v24 = v16;
      uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v31 = v25;
      sub_22A305ED0();
      *unint64_t v23 = v25;

      _os_log_impl(&dword_22A2DE000, v20, v21, "Error fetching Fitness+ subscription: %@", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2683718C8);
      swift_arrayDestroy();
      MEMORY[0x22A6C55A0](v23, -1, -1);
      MEMORY[0x22A6C55A0](v22, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v3);
    LOBYTE(v31) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683719C0);
    sub_22A305E30();
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v10 + 32))(v12, v15, v9);
    sub_22A3048D0();
    char v26 = sub_22A304960();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v32 = v26 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683719C0);
    sub_22A305E30();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

uint64_t sub_22A2F2A30()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683719C0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_22A2F2AC4(uint64_t a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2683719C0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  sub_22A2F2594(a1, v4);
}

uint64_t sub_22A2F2B38()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A2F2B78()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_22A2F2BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683719D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

Swift::Double __swiftcall DispatchTimeInterval.toSeconds()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22A305CB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x263F8F018])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v5, v2);
    return (double)*v5;
  }
  if (v6 == *MEMORY[0x263F8F000])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v5, v2);
    double v8 = (double)*v5;
    double v9 = 1000.0;
  }
  else if (v6 == *MEMORY[0x263F8EFE8])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v5, v2);
    double v8 = (double)*v5;
    double v9 = 100000.0;
  }
  else
  {
    if (v6 != *MEMORY[0x263F8EFE0])
    {
      (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
      return 9.22337204e18;
    }
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v5, v2);
    double v8 = (double)*v5;
    double v9 = 100000000.0;
  }
  return v8 / v9;
}

uint64_t UsoEntity_common_App.appIdentifier.getter()
{
  uint64_t v0 = sub_22A304F60();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v80 = (char *)&v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  v77 = (char *)&v68 - v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v81 = (char *)&v68 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v68 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v68 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v68 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683719D8);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  id v19 = (char *)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v68 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v68 - v24;
  MEMORY[0x270FA5388](v23);
  v76 = (char *)&v68 - v26;
  uint64_t v27 = sub_22A304FA0();
  if (!v27) {
    return 0;
  }
  uint64_t v28 = v27;
  uint64_t v29 = v10;
  uint64_t v74 = v1;
  uint64_t v75 = v25;
  uint64_t v30 = *(char **)(v27 + 16);
  uint64_t v72 = v22;
  uint64_t v73 = v29;
  uint64_t v70 = v27;
  uint64_t v71 = v19;
  if (!v30)
  {
LABEL_17:
    uint64_t v41 = (uint64_t)v76;
    uint64_t v68 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
    v68(v76, 1, 1, v0);
    goto LABEL_19;
  }
  uint64_t v31 = v1 + 16;
  char v32 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
  unint64_t v33 = v27 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  uint64_t v34 = (void (**)(char *, uint64_t))(v31 - 8);
  uint64_t v79 = *(void *)(v31 + 56);
  swift_bridgeObjectRetain();
  uint64_t v78 = (const char *)((v31 - 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
  v69 = v30;
  while (1)
  {
    v32(v15, v33, v0);
    uint64_t v37 = sub_22A304F50();
    if (!v38)
    {
      v32(v13, (unint64_t)v15, v0);
LABEL_15:
      uint64_t v36 = *v34;
      (*v34)(v13, v0);
      goto LABEL_5;
    }
    if (v37 == 0x64695F6D657469 && v38 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      v32(v13, (unint64_t)v15, v0);
    }
    else
    {
      char v39 = sub_22A3060C0();
      swift_bridgeObjectRelease();
      v32(v13, (unint64_t)v15, v0);
      if ((v39 & 1) == 0) {
        goto LABEL_15;
      }
    }
    if (sub_22A304F20() == 0x746163696C707041 && v40 == 0xEC000000736E6F69) {
      break;
    }
    char v35 = sub_22A3060C0();
    swift_bridgeObjectRelease();
    uint64_t v36 = *v34;
    (*v34)(v13, v0);
    if (v35) {
      goto LABEL_18;
    }
LABEL_5:
    v36(v15, v0);
    v33 += v79;
    if (!--v30)
    {
      uint64_t v28 = v70;
      swift_bridgeObjectRelease();
      uint64_t v29 = v73;
      uint64_t v1 = v74;
      id v19 = v71;
      uint64_t v22 = v72;
      uint64_t v30 = v69;
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  (*v34)(v13, v0);
LABEL_18:
  uint64_t v28 = v70;
  swift_bridgeObjectRelease();
  uint64_t v1 = v74;
  uint64_t v41 = (uint64_t)v76;
  (*(void (**)(void))(v74 + 32))();
  uint64_t v68 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
  v68((char *)v41, 0, 1, v0);
  uint64_t v22 = v72;
  uint64_t v29 = v73;
  id v19 = v71;
  uint64_t v30 = v69;
LABEL_19:
  uint64_t v42 = (uint64_t)v75;
  sub_22A2F375C(v41, (uint64_t)v75);
  v69 = *(char **)(v1 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v69)(v42, 1, v0) != 1)
  {
    uint64_t v63 = v29;
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v29, v42, v0);
    uint64_t v64 = sub_22A304F40();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v63, v0);
    sub_22A2F37C4(v41);
    swift_bridgeObjectRelease();
    return v64;
  }
  sub_22A2F37C4(v41);
  if (!v30)
  {
    uint64_t v66 = v69;
    uint64_t v65 = v29;
    v68(v22, 1, 1, v0);
    goto LABEL_42;
  }
  uint64_t v75 = (char *)(v1 + 48);
  uint64_t v45 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
  uint64_t v44 = v1 + 16;
  uint64_t v43 = v45;
  unint64_t v46 = v28 + ((*(unsigned __int8 *)(v44 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 64));
  uint64_t v47 = (void (**)(char *, uint64_t))(v44 - 8);
  uint64_t v79 = *(void *)(v44 + 56);
  swift_bridgeObjectRetain();
  uint64_t v78 = "isFitnessPlusSubscriber()";
  v76 = (char *)0x800000022A308090;
  uint64_t v48 = v81;
  while (2)
  {
    os_log_type_t v49 = v30;
    v43(v48, v46, v0);
    uint64_t v50 = sub_22A304F50();
    char v52 = v51;
    if (v51)
    {
      unint64_t v53 = v77;
      if (v50 == 0x656D614E707061 && v51 == 0xE700000000000000)
      {
        swift_bridgeObjectRelease();
        v43(v53, (unint64_t)v48, v0);
LABEL_30:
        if (sub_22A304F20() == 0xD000000000000015 && v56 == v76)
        {
          swift_bridgeObjectRelease();
          char v52 = 1;
        }
        else
        {
          char v52 = sub_22A3060C0();
          swift_bridgeObjectRelease();
        }
        uint64_t v54 = v81;
      }
      else
      {
        uint64_t v54 = v48;
        char v55 = sub_22A3060C0();
        swift_bridgeObjectRelease();
        v43(v53, (unint64_t)v54, v0);
        char v52 = 0;
        if (v55) {
          goto LABEL_30;
        }
      }
    }
    else
    {
      unint64_t v53 = v77;
      v43(v77, (unint64_t)v48, v0);
      uint64_t v54 = v48;
    }
    double v57 = v53;
    char v58 = *v47;
    (*v47)(v57, v0);
    char v59 = v80;
    v43(v80, (unint64_t)v54, v0);
    if (v52)
    {
      uint64_t v84 = sub_22A304F40();
      uint64_t v85 = v60;
      uint64_t v82 = 46;
      unint64_t v83 = 0xE100000000000000;
      sub_22A2F3824();
      char v61 = sub_22A305EF0();
      swift_bridgeObjectRelease();
      v58(v80, v0);
      if (v61)
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = v74;
        uint64_t v22 = v72;
        (*(void (**)(char *, char *, uint64_t))(v74 + 32))(v72, v81, v0);
        uint64_t v62 = 0;
        id v19 = v71;
        goto LABEL_40;
      }
    }
    else
    {
      v58(v59, v0);
    }
    uint64_t v48 = v81;
    v58(v81, v0);
    v46 += v79;
    uint64_t v30 = v49 - 1;
    if (v49 != (char *)1) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  uint64_t v62 = 1;
  id v19 = v71;
  uint64_t v22 = v72;
  uint64_t v1 = v74;
LABEL_40:
  uint64_t v65 = v73;
  uint64_t v66 = v69;
  v68(v22, v62, 1, v0);
LABEL_42:
  swift_bridgeObjectRelease();
  sub_22A2F375C((uint64_t)v22, (uint64_t)v19);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v66)(v19, 1, v0) == 1)
  {
    sub_22A2F37C4((uint64_t)v22);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v65, v19, v0);
  uint64_t v64 = sub_22A304F40();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v65, v0);
  sub_22A2F37C4((uint64_t)v22);
  return v64;
}

uint64_t sub_22A2F375C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683719D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A2F37C4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683719D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22A2F3824()
{
  unint64_t result = qword_2683719E0;
  if (!qword_2683719E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683719E0);
  }
  return result;
}

uint64_t makeConfirmationButtons(confirmButton:rejectButton:device:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = objc_allocWithZone(MEMORY[0x263F70030]);
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)sub_22A305D10();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_initWithIdentifier_, v7);

  sub_22A2F3DE4(*(void *)(a1 + 32));
  uint64_t v9 = (void *)sub_22A305CC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setUserData_, v9);

  uint64_t v10 = self;
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  uint64_t v11 = (void *)sub_22A304B90();
  uint64_t v40 = v8;
  id v12 = objc_msgSend(v10, sel_runSiriKitExecutorCommandWithContext_payload_, v11, v8);

  id v13 = objc_allocWithZone(MEMORY[0x263F70030]);
  swift_bridgeObjectRetain();
  uint64_t v14 = (void *)sub_22A305D10();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v13, sel_initWithIdentifier_, v14);

  sub_22A2F3DE4(*(void *)(a2 + 32));
  uint64_t v16 = (void *)sub_22A305CC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setUserData_, v16);

  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  uint64_t v17 = (void *)sub_22A304B90();
  uint64_t v38 = v15;
  id v18 = objc_msgSend(v10, sel_runSiriKitExecutorCommandWithContext_payload_, v17, v15);

  char v39 = v12;
  id v19 = objc_msgSend(v10, sel_wrapCommandInStartLocalRequest_, v12);
  uint64_t v37 = v18;
  id v20 = objc_msgSend(v10, sel_wrapCommandInStartLocalRequest_, v18);
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  char v36 = sub_22A304B50();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2683719F0);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_22A3067E0;
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_22A3067E0;
  *(void *)(v22 + 32) = v19;
  unint64_t v41 = v22;
  sub_22A305DF0();
  id v23 = objc_allocWithZone(MEMORY[0x263F64F20]);
  id v35 = v19;
  id v24 = objc_msgSend(v23, sel_init);
  uint64_t v25 = (void *)sub_22A305D10();
  objc_msgSend(v24, sel_setLabel_, v25);

  swift_bridgeObjectRetain();
  if (v41 >> 62)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268371B40);
    sub_22A306040();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22A3060D0();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268371B40);
  uint64_t v26 = (void *)sub_22A305DC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_setCommands_, v26);
  swift_bridgeObjectRelease();

  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_22A3067E0;
  *(void *)(v27 + 32) = v20;
  unint64_t v42 = v27;
  sub_22A305DF0();
  id v28 = objc_allocWithZone(MEMORY[0x263F64F20]);
  id v29 = v20;
  id v30 = objc_msgSend(v28, sel_init);
  uint64_t v31 = (void *)sub_22A305D10();
  objc_msgSend(v30, sel_setLabel_, v31);

  swift_bridgeObjectRetain();
  if (v42 >> 62)
  {
    sub_22A306040();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22A3060D0();
  }
  char v32 = (void *)sub_22A305DC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_setCommands_, v32);
  swift_bridgeObjectRelease();

  id v33 = sub_22A2F41AC(v24, v30, 0, v36 & 1);
  *(void *)(v21 + 32) = v33;
  sub_22A305DF0();

  return v21;
}

uint64_t sub_22A2F3DE4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268371A78);
    uint64_t v2 = sub_22A306060();
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
    sub_22A2E294C(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_22A2F4AC8(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_22A2F4AC8(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_22A2F4AC8(v36, v37);
    sub_22A2F4AC8(v37, &v33);
    uint64_t result = sub_22A305F00();
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
    uint64_t result = (uint64_t)sub_22A2F4AC8(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_22A2F4AD8();
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

id sub_22A2F41AC(id a1, void *a2, void *a3, char a4)
{
  if ((a4 & 1) == 0)
  {
    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64F30]), sel_init);
    id v27 = objc_msgSend(a1, sel_label);
    objc_msgSend(v21, sel_setConfirmText_, v27);

    id v28 = objc_msgSend(a1, sel_commands);
    objc_msgSend(v21, sel_setConfirmCommands_, v28);

    id v29 = objc_msgSend(a2, sel_label);
    objc_msgSend(v21, sel_setDenyText_, v29);

    id v30 = objc_msgSend(a2, sel_commands);
    objc_msgSend(v21, sel_setDenyCommands_, v30);

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2683719F0);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_22A306D00;
    *(void *)(v31 + 32) = a1;
    *(void *)(v31 + 40) = a2;
    uint64_t v38 = v31;
    sub_22A305DF0();
    if (a3)
    {
      id v32 = a1;
      id v33 = a2;
      id v34 = a3;
      MEMORY[0x22A6C4CD0]();
      if (*(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_22A305E00();
      }
      sub_22A305E20();
      sub_22A305DF0();
    }
    else
    {
      id v35 = a1;
      id v36 = a2;
    }
    sub_22A2E7940(0, &qword_268371A00);
    uint64_t v37 = (void *)sub_22A305DC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_setAllConfirmationOptions_, v37);

    return v21;
  }
  id result = objc_msgSend(a1, sel_label);
  if (!result)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v7 = result;
  uint64_t v8 = sub_22A305D20();
  uint64_t v10 = v9;

  id result = objc_msgSend(a1, sel_commands);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  unint64_t v11 = result;
  sub_22A2E7940(0, &qword_268371A08);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268371B40);
  uint64_t v12 = sub_22A305DD0();

  id v13 = SASTButtonItem.init(label:commands:centered:)(v8, v10, v12, 1);
  id result = objc_msgSend(a2, sel_label);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  unint64_t v14 = result;
  uint64_t v15 = sub_22A305D20();
  uint64_t v17 = v16;

  id result = objc_msgSend(a2, sel_commands);
  if (result)
  {
    uint64_t v18 = result;
    uint64_t v19 = sub_22A305DD0();

    id v20 = SASTButtonItem.init(label:commands:centered:)(v15, v17, v19, 1);
    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64C68]), sel_init);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2683719F0);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_22A306D00;
    *(void *)(v22 + 32) = v13;
    *(void *)(v22 + 40) = v20;
    sub_22A305DF0();
    id v23 = v13;
    id v24 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268371A70);
    BOOL v25 = (void *)sub_22A305DC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_setTemplateItems_, v25);

    return v21;
  }
LABEL_17:
  __break(1u);
  return result;
}

id makeRFConfirmationButtons(confirmButton:rejectButton:device:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = objc_allocWithZone(MEMORY[0x263F70030]);
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)sub_22A305D10();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_initWithIdentifier_, v7);

  sub_22A2F3DE4(*(void *)(a1 + 32));
  uint64_t v9 = (void *)sub_22A305CC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setUserData_, v9);

  uint64_t v10 = self;
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  unint64_t v11 = (void *)sub_22A304B90();
  id v35 = v8;
  id v12 = objc_msgSend(v10, sel_runSiriKitExecutorCommandWithContext_payload_, v11, v8);

  id v13 = objc_allocWithZone(MEMORY[0x263F70030]);
  swift_bridgeObjectRetain();
  unint64_t v14 = (void *)sub_22A305D10();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v13, sel_initWithIdentifier_, v14);

  sub_22A2F3DE4(*(void *)(a2 + 32));
  uint64_t v16 = (void *)sub_22A305CC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setUserData_, v16);

  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  uint64_t v17 = (void *)sub_22A304B90();
  id v18 = objc_msgSend(v10, sel_runSiriKitExecutorCommandWithContext_payload_, v17, v15);

  id v19 = objc_msgSend(v10, sel_wrapCommandInStartLocalRequest_, v12);
  id v34 = v18;
  id v20 = objc_msgSend(v10, sel_wrapCommandInStartLocalRequest_, v18);
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  sub_22A304B50();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2683719F0);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_22A3067E0;
  *(void *)(v21 + 32) = v19;
  unint64_t v36 = v21;
  sub_22A305DF0();
  id v22 = objc_allocWithZone(MEMORY[0x263F64F20]);
  id v33 = v19;
  id v23 = objc_msgSend(v22, sel_init);
  id v24 = (void *)sub_22A305D10();
  objc_msgSend(v23, sel_setLabel_, v24);

  swift_bridgeObjectRetain();
  if (v36 >> 62)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268371B40);
    sub_22A306040();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22A3060D0();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268371B40);
  BOOL v25 = (void *)sub_22A305DC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_setCommands_, v25);
  swift_bridgeObjectRelease();

  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_22A3067E0;
  *(void *)(v26 + 32) = v20;
  unint64_t v37 = v26;
  sub_22A305DF0();
  id v27 = objc_allocWithZone(MEMORY[0x263F64F20]);
  id v28 = v20;
  id v29 = objc_msgSend(v27, sel_init);
  id v30 = (void *)sub_22A305D10();
  objc_msgSend(v29, sel_setLabel_, v30);

  swift_bridgeObjectRetain();
  if (v37 >> 62)
  {
    sub_22A306040();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22A3060D0();
  }
  uint64_t v31 = (void *)sub_22A305DC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v29, sel_setCommands_, v31);

  swift_bridgeObjectRelease();
  return v23;
}

_OWORD *sub_22A2F4AC8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22A2F4AD8()
{
  return swift_release();
}

uint64_t static UsoEntity_common_App.with(appIdentifier:usoIdentifierNamespace:usoIdentifierAppBundleId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _s12SiriOntology20UsoEntity_common_AppC18HealthDomainsToolsE7builder7appName0K10Identifier03usoM9Namespace0nmF8BundleIdAA0cd8Builder_e1_F0CSSSg_A3LtFZ_0(0, 0, a1, a2, a3, a4, a5);
  MEMORY[0x22A6C3FC0]();
  sub_22A304FD0();
  sub_22A305130();
  swift_release();
  swift_release();
  return v6;
}

uint64_t _s12SiriOntology20UsoEntity_common_AppC18HealthDomainsToolsE7builder7appName0K10Identifier03usoM9Namespace0nmF8BundleIdAA0cd8Builder_e1_F0CSSSg_A3LtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v19 = a7;
  uint64_t v20 = a3;
  uint64_t v21 = a5;
  uint64_t v10 = sub_22A304F60();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A305180();
  swift_allocObject();
  uint64_t v14 = sub_22A305170();
  if (a4)
  {
    sub_22A3050F0();
    uint64_t v18 = v10;
    swift_allocObject();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v15 = MEMORY[0x22A6C4000](a1, a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_22A304F30();
    sub_22A304EF0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v18);
    uint64_t v22 = v15;
    sub_22A304F80();
    swift_release();
  }
  return v14;
}

uint64_t Date.startOfDay.getter()
{
  uint64_t v0 = sub_22A304940();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A304920();
  sub_22A3048F0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t Date.endOfDay.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_22A3048E0();
  uint64_t v32 = *(void *)(v1 - 8);
  uint64_t v33 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v31 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22A304940();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371A80);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371A88);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371A90);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_22A304860();
  uint64_t v19 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v18, 1, 1, v3);
  uint64_t v22 = sub_22A304950();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v15, 1, 1, v22);
  sub_22A304850();
  sub_22A304830();
  sub_22A304840();
  sub_22A304920();
  sub_22A304920();
  id v23 = v31;
  sub_22A3048F0();
  id v24 = *(void (**)(char *, uint64_t))(v4 + 8);
  v24(v7, v3);
  BOOL v25 = v23;
  sub_22A304910();
  uint64_t v27 = v32;
  uint64_t v26 = v33;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v25, v33);
  v24(v9, v3);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48))(v12, 1, v26);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v29);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v30, v12, v26);
  }
  return result;
}

uint64_t Calendar.numberOfDaysBetween(_:and:)()
{
  uint64_t v0 = sub_22A305C80();
  uint64_t v42 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v43 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_22A304860();
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  long long v39 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v34 - v5;
  uint64_t v7 = sub_22A3048E0();
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v34 - v11;
  sub_22A3048F0();
  sub_22A3048F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268371A98);
  uint64_t v13 = sub_22A304930();
  uint64_t v14 = *(void *)(v13 - 8);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_22A3067F0;
  (*(void (**)(unint64_t, void, uint64_t))(v14 + 104))(v16 + v15, *MEMORY[0x263F07870], v13);
  sub_22A2F58B8(v16);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  id v35 = v12;
  unint64_t v36 = v10;
  sub_22A304900();
  swift_bridgeObjectRelease();
  if (qword_268371438 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v0, (uint64_t)static Logger.wellness);
  swift_beginAccess();
  uint64_t v18 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v43, v17, v0);
  uint64_t v19 = v39;
  uint64_t v20 = v40;
  uint64_t v21 = v41;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v39, v6, v41);
  uint64_t v22 = sub_22A305C60();
  os_log_type_t v23 = sub_22A305E40();
  uint64_t v24 = v18;
  if (os_log_type_enabled(v22, v23))
  {
    BOOL v25 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)BOOL v25 = 134217984;
    uint64_t result = sub_22A304820();
    if (v27)
    {
LABEL_12:
      __break(1u);
      return result;
    }
    uint64_t v28 = result;
    uint64_t v29 = *(void (**)(char *, uint64_t))(v20 + 8);
    v29(v19, v21);
    uint64_t v44 = v28;
    sub_22A305ED0();
    _os_log_impl(&dword_22A2DE000, v22, v23, "Number of days: %ld", v25, 0xCu);
    MEMORY[0x22A6C55A0](v25, -1, -1);
    uint64_t v24 = v42;
  }
  else
  {
    uint64_t v29 = *(void (**)(char *, uint64_t))(v20 + 8);
    v29(v19, v21);
  }

  (*(void (**)(char *, uint64_t))(v24 + 8))(v43, v0);
  uint64_t result = sub_22A304820();
  if (v30)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v31 = result;
  v29(v6, v21);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v37 + 8);
  uint64_t v33 = v38;
  v32(v36, v38);
  v32(v35, v33);
  uint64_t result = v31 + 1;
  if (__OFADD__(v31, 1))
  {
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

void *sub_22A2F57E4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_22A306070();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_22A2F5888@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_22A2F58B8(uint64_t a1)
{
  uint64_t v2 = sub_22A304930();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268371AA0);
    uint64_t v9 = sub_22A305F10();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    id v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_22A2F5BA8(&qword_268371AA8);
      uint64_t v16 = sub_22A305CE0();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_22A2F5BA8(&qword_268371AB0);
          char v23 = sub_22A305D00();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        BOOL v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_22A2F5BA8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_22A304930();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t static UsoEntity_common_WorkoutEquipment.builder(name:)(uint64_t a1, uint64_t a2)
{
  sub_22A305810();
  swift_allocObject();
  uint64_t v3 = sub_22A305800();
  if (a2) {
    sub_22A3057F0();
  }
  return v3;
}

uint64_t static UsoEntity_common_WorkoutEquipment.with(name:)(uint64_t a1, uint64_t a2)
{
  sub_22A305810();
  swift_allocObject();
  uint64_t v3 = sub_22A305800();
  if (a2) {
    sub_22A3057F0();
  }
  MEMORY[0x22A6C3FC0](v3);
  sub_22A305520();
  sub_22A305130();
  swift_release();
  swift_release();
  return v5;
}

Swift::Bool __swiftcall App.isFirstParty()()
{
  sub_22A305B80();
  if (v0)
  {
    sub_22A2F5D88();
    sub_22A2F5DDC();
    char v1 = sub_22A305CF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v1 = 0;
  }
  return v1 & 1;
}

unint64_t sub_22A2F5D88()
{
  unint64_t result = qword_268371AB8;
  if (!qword_268371AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371AB8);
  }
  return result;
}

unint64_t sub_22A2F5DDC()
{
  unint64_t result = qword_268371AC0;
  if (!qword_268371AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371AC0);
  }
  return result;
}

void *static HealthLogName.allCases.getter()
{
  return &unk_26DDDDB90;
}

uint64_t HealthLogName.rawValue.getter(char a1)
{
  uint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return 0x79726568637261;
    case 2:
      return 0xD000000000000012;
    case 3:
      return 0x6F746E696D646162;
    case 4:
      return 0x6572726162;
    case 5:
      unsigned int v3 = 1702060386;
      return v3 | 0x6C6C616200000000;
    case 6:
      uint64_t v4 = 0x74656B736162;
      return v4 & 0xFFFFFFFFFFFFLL | 0x6162000000000000;
    case 7:
      unsigned int v5 = 1819766626;
      return v5 | 0x676E6900000000;
    case 8:
      return 0x676E69786F62;
    case 9:
      uint64_t v6 = 0x6F6964726163;
      return v6 & 0xFFFFFFFFFFFFLL | 0x6144000000000000;
    case 10:
      return 0x676E69626D696C63;
    case 11:
      return 0x6E776F646C6F6F63;
    case 12:
      unsigned int v7 = 1701998435;
      return v7 | 0x6961727400000000;
    case 13:
      return 0x74656B63697263;
    case 14:
      return 0xD000000000000012;
    case 15:
      return 0x61727473736F7263;
    case 16:
      unsigned int v5 = 1819440483;
      return v5 | 0x676E6900000000;
    case 17:
      return 0x65636E6164;
    case 18:
      unsigned int v8 = 1668508004;
      return v8 | 0x726F707300000000;
    case 19:
      return 0x6C6C69686E776F64;
    case 20:
      return 0x63697470696C6C65;
    case 22:
      return 0x6573696372657865;
    case 23:
      unsigned int v5 = 1668179302;
      return v5 | 0x676E6900000000;
    case 24:
      unsigned int v5 = 1752394086;
      return v5 | 0x676E6900000000;
    case 25:
      return 0x677373656E746966;
    case 26:
      return 0x6C69626978656C66;
    case 27:
      return 0xD00000000000001ALL;
    case 28:
      return 1718382439;
    case 29:
      return 0x697473616E6D7967;
    case 30:
      unsigned int v3 = 1684955496;
      return v3 | 0x6C6C616200000000;
    case 31:
      return 0x6C637963646E6168;
    case 32:
      return 0xD00000000000001DLL;
    case 33:
      return 1701538152;
    case 34:
      return 0x79656B636F68;
    case 35:
      unsigned int v5 = 1953396072;
      return v5 | 0x676E6900000000;
    case 36:
      return 0x7963726F6F646E69;
    case 37:
      return 0x7572726F6F646E69;
    case 38:
      return 0x6177726F6F646E69;
    case 39:
      return 0x65706F72706D756ALL;
    case 40:
      return 0x69786F626B63696BLL;
    case 41:
      return 0x6573736F7263616CLL;
    case 42:
      return 0x616C61697472616DLL;
    case 43:
      return 0x62646E61646E696DLL;
    case 44:
      return 0x726163646578696DLL;
    case 45:
      return 0x726F57726568746FLL;
    case 46:
      return 0x7073656C64646170;
    case 47:
      uint64_t v4 = 0x656C6B636970;
      return v4 & 0xFFFFFFFFFFFFLL | 0x6162000000000000;
    case 48:
      return 0x736574616C6970;
    case 49:
      return 2036427888;
    case 50:
      return 0xD000000000000016;
    case 51:
      return 0x6274657571636172;
    case 52:
      return 0x7265776F72;
    case 53:
      return 0x7962677572;
    case 54:
      unsigned int v5 = 1818845555;
      return v5 | 0x676E6900000000;
    case 55:
      return 0x756E696D5F786973;
    case 56:
      unsigned int v9 = 1952541555;
      return v9 | 0x73676E6900000000;
    case 57:
      return 0x72616F62776F6E73;
    case 58:
      unsigned int v8 = 2003791475;
      return v8 | 0x726F707300000000;
    case 59:
      return 0x726563636F73;
    case 60:
      uint64_t v6 = 0x6C6169636F73;
      return v6 & 0xFFFFFFFFFFFFLL | 0x6144000000000000;
    case 61:
      unsigned int v3 = 1952870259;
      return v3 | 0x6C6C616200000000;
    case 62:
      return 0x687361757173;
    case 63:
      unsigned int v7 = 1885697139;
      return v7 | 0x6961727400000000;
    case 64:
      unsigned int v9 = 1718777203;
      return v9 | 0x73676E6900000000;
    case 65:
      return 0x6E6574656C626174;
    case 66:
      return 0x696863696174;
    case 67:
      return 0x73696E6E6574;
    case 68:
      return 0x61576F54656D6974;
    case 69:
      return 0x646E616B63617274;
    case 70:
      return 0xD000000000000019;
    case 71:
      uint64_t v4 = 0x79656C6C6F76;
      return v4 & 0xFFFFFFFFFFFFLL | 0x6162000000000000;
    case 72:
      return 0x7469667265746177;
    case 73:
      return 0x6C6F707265746177;
    case 74:
      return 0x6F70737265746177;
    case 75:
      return 0x7374756F6B726F77;
    case 76:
      uint64_t v10 = 0x6C7473657277;
      goto LABEL_88;
    case 77:
      return 1634168697;
    case 78:
      uint64_t v10 = 0x6C6379636962;
LABEL_88:
      uint64_t result = v10 & 0xFFFFFFFFFFFFLL | 0x6E69000000000000;
      break;
    case 79:
      uint64_t result = 7239026;
      break;
    case 80:
      uint64_t result = 0x635F737269617473;
      break;
    case 81:
      uint64_t result = 1835628403;
      break;
    case 82:
      uint64_t result = 1802264951;
      break;
    case 83:
      uint64_t result = 0x6168636C65656877;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22A2F67C0(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = HealthLogName.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == HealthLogName.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_22A3060C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22A2F684C()
{
  char v1 = *v0;
  sub_22A306140();
  HealthLogName.rawValue.getter(v1);
  sub_22A305D50();
  swift_bridgeObjectRelease();
  return sub_22A306160();
}

uint64_t sub_22A2F68B0()
{
  HealthLogName.rawValue.getter(*v0);
  sub_22A305D50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22A2F6904()
{
  char v1 = *v0;
  sub_22A306140();
  HealthLogName.rawValue.getter(v1);
  sub_22A305D50();
  swift_bridgeObjectRelease();
  return sub_22A306160();
}

uint64_t sub_22A2F6964@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s18HealthDomainsTools0A7LogNameO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22A2F6994@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HealthLogName.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_22A2F69C0(void *a1@<X8>)
{
  *a1 = &unk_26DDDDB90;
}

Swift::String_optional __swiftcall vocabularyIdentifier(for:)(HealthDomainsTools::HealthLogName_optional a1)
{
  if (a1.value == HealthDomainsTools_HealthLogName_unknownDefault)
  {
    uint64_t v1 = 0;
    unint64_t v2 = 0;
  }
  else
  {
    uint64_t v1 = sub_22A2F6ADC(a1.value);
    unint64_t v2 = v4;
    if (qword_268371470 != -1) {
      swift_once();
    }
    uint64_t v5 = qword_268372BE0;
    swift_bridgeObjectRetain();
    char v6 = sub_22A2F6B64(a1.value, v5);
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
    {
      sub_22A305F30();
      swift_bridgeObjectRelease();
      sub_22A305D80();
      swift_bridgeObjectRelease();
      uint64_t v1 = 0xD000000000000028;
      unint64_t v2 = 0x800000022A308130;
    }
  }
  uint64_t v7 = v1;
  char v8 = (void *)v2;
  result.value._object = v8;
  result.value._uint64_t countAndFlagsBits = v7;
  return result;
}

uint64_t sub_22A2F6ADC(char a1)
{
  uint64_t v2 = 0x6E776F6E6B6E55;
  unint64_t v3 = sub_22A2F9568((uint64_t)&unk_26DDDDC08);
  if (*(void *)(v3 + 16))
  {
    unint64_t v4 = sub_22A2FBC08(a1);
    if (v5)
    {
      uint64_t v2 = *(void *)(*(void *)(v3 + 56) + 16 * v4);
      swift_bridgeObjectRetain();
    }
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_22A2F6B64(char a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v5 = HealthLogName.rawValue.getter(*(unsigned char *)(a2 + 32));
  uint64_t v7 = v6;
  uint64_t v8 = HealthLogName.rawValue.getter(a1);
  if (v5 == v8 && v7 == v9)
  {
LABEL_8:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  uint64_t v11 = v8;
  uint64_t v12 = v9;
  char v13 = sub_22A3060C0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v13)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v15 = 33;
  while (1)
  {
    uint64_t v16 = v15 - 31;
    if (__OFADD__(v15 - 32, 1)) {
      break;
    }
    if (HealthLogName.rawValue.getter(*(unsigned char *)(a2 + v15)) == v11 && v17 == v12)
    {
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    char v19 = sub_22A3060C0();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_7;
    }
    ++v15;
    if (v16 == v2) {
      goto LABEL_18;
    }
  }
  __break(1u);
  return result;
}

void sub_22A2F6CB4()
{
  qword_268372BE0 = (uint64_t)&unk_26DDDE408;
}

uint64_t _s18HealthDomainsTools0A7LogNameO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_22A3060E0();
  swift_bridgeObjectRelease();
  if (v0 >= 0x54) {
    return 84;
  }
  else {
    return v0;
  }
}

unint64_t sub_22A2F6D20()
{
  unint64_t result = qword_268371AC8;
  if (!qword_268371AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371AC8);
  }
  return result;
}

unint64_t sub_22A2F6D78()
{
  unint64_t result = qword_268371AD0;
  if (!qword_268371AD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268371AD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371AD0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HealthLogName(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xAD) {
    goto LABEL_17;
  }
  if (a2 + 83 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 83) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 83;
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
      return (*a1 | (v4 << 8)) - 83;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 83;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x54;
  int v8 = v6 - 84;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HealthLogName(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 83 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 83) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xAD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xAC)
  {
    unsigned int v6 = ((a2 - 173) >> 8) + 1;
    *unint64_t result = a2 + 83;
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
        JUMPOUT(0x22A2F6F30);
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
          *unint64_t result = a2 + 83;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthLogName()
{
  return &type metadata for HealthLogName;
}

id SASTButtonItem.init(label:commands:centered:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  id v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v5, sel_setCentered_, a4 & 1);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64C58]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268371B40);
  BOOL v7 = (void *)sub_22A305DC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setCommands_, v7);

  objc_msgSend(v5, sel_setAction_, v6);
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64F38]), sel_init);
  uint64_t v9 = (void *)sub_22A305D10();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setText_, v9);

  objc_msgSend(v5, sel_setDecoratedLabel_, v8);
  return v5;
}

id SASTCommandTemplateAction.init(commands:)()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268371B40);
  uint64_t v1 = (void *)sub_22A305DC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setCommands_, v1);

  return v0;
}

id SASTSideBySideButtonsItem.init(primaryButtonConfirmationOption:secondaryButtonConfirmationOption:)(void *a1, void *a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v5 = *MEMORY[0x263F65EF8];
  id v6 = v4;
  objc_msgSend(v6, sel_setButtonsViewStyle_, v5);
  id result = objc_msgSend(a1, sel_commands);
  if (result)
  {
    id v8 = result;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268371B40);
    sub_22A305DD0();

    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64C58]), sel_init);
    uint64_t v10 = (void *)sub_22A305DC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setCommands_, v10);

    objc_msgSend(v6, sel_setPrimaryButtonAction_, v9);
    objc_msgSend(v6, sel_setPrimaryButtonEnabled_, 1);
    id v11 = objc_msgSend(a1, sel_label);
    objc_msgSend(v6, sel_setPrimaryButtonLabel_, v11);

    uint64_t v12 = (void *)sub_22A304C00();
    objc_msgSend(v6, sel_setPrimaryButtonTextColor_, v12);

    id result = objc_msgSend(a2, sel_commands);
    if (result)
    {
      char v13 = result;
      sub_22A305DD0();

      id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64C58]), sel_init);
      uint64_t v15 = (void *)sub_22A305DC0();
      swift_bridgeObjectRelease();
      objc_msgSend(v14, sel_setCommands_, v15);

      objc_msgSend(v6, sel_setSecondaryButtonAction_, v14);
      objc_msgSend(v6, sel_setSecondaryButtonEnabled_, 1);
      id v16 = objc_msgSend(a2, sel_label);
      objc_msgSend(v6, sel_setSecondaryButtonLabel_, v16);

      return v6;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id SASTCountdownTimerItem.init(sashTitle:commands:delay:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  id v7 = v6;
  swift_bridgeObjectRetain();
  if (a3 >> 62)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268371B40);
    sub_22A306040();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22A3060D0();
  }
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64C58]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268371B40);
  id v9 = (void *)sub_22A305DC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setCommands_, v9);

  objc_msgSend(v6, sel_setAction_, v8);
  objc_msgSend(v6, sel_setActionDelayInSeconds_, a4);
  uint64_t v10 = (void *)sub_22A304C00();
  objc_msgSend(v6, sel_setBodyBackgroundColor_, v10);

  id v11 = (void *)sub_22A304BF0();
  objc_msgSend(v6, sel_setCountdownTextColor_, v11);

  uint64_t v12 = (void *)sub_22A304C00();
  objc_msgSend(v6, sel_setHeaderBackgroundColor_, v12);

  char v13 = (void *)sub_22A305D10();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setHeaderText_, v13);

  id v14 = (void *)sub_22A304BE0();
  objc_msgSend(v6, sel_setHeaderTextColor_, v14);

  return v6;
}

uint64_t SABaseCommand.asVCatString.getter()
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = objc_msgSend(v0, sel_dictionary);
  if (!v1) {
    return 0;
  }
  int v2 = v1;
  v12[0] = 0;
  id v3 = objc_msgSend(self, sel_dataWithPropertyList_format_options_error_, v1, 200, 0, v12);
  id v4 = v12[0];
  if (!v3)
  {
    id v9 = v4;
    uint64_t v10 = (void *)sub_22A304870();

    swift_willThrow();
    return 0;
  }
  uint64_t v5 = sub_22A3048B0();
  unint64_t v7 = v6;

  sub_22A2F772C(v5, v7);
  uint64_t v8 = sub_22A3048A0();

  sub_22A2F7784(v5, v7);
  sub_22A2F7784(v5, v7);
  return v8;
}

uint64_t sub_22A2F772C(uint64_t a1, unint64_t a2)
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

uint64_t sub_22A2F7784(uint64_t a1, unint64_t a2)
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

id SAUIAppPunchOut.init(aceService:url:)(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v5 = (void *)sub_22A304880();
  objc_msgSend(v4, sel_setPunchOutUri_, v5);

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22A304C80();
  if (v6)
  {
    unint64_t v7 = (void *)sub_22A305D10();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v7 = 0;
  }
  objc_msgSend(v4, sel_setAceId_, v7);

  uint64_t v8 = sub_22A304890();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a2, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v4;
}

uint64_t static UsoEntity_common_Measurement.builder(component:)(uint64_t a1)
{
  sub_22A3055A0();
  swift_allocObject();
  uint64_t v2 = sub_22A305590();
  if (a1)
  {
    swift_retain();
    sub_22A305580();
    swift_release();
  }
  return v2;
}

uint64_t static UsoEntity_common_Measurement.builder(unitType:value:)(uint64_t a1, uint64_t a2, char a3)
{
  return sub_22A2F7A14(a1, a2, a3 & 1);
}

uint64_t static UsoEntity_common_Measurement.with(component:)(uint64_t a1)
{
  sub_22A3055A0();
  swift_allocObject();
  uint64_t v2 = sub_22A305590();
  if (a1)
  {
    swift_retain();
    sub_22A305580();
    swift_release();
  }
  MEMORY[0x22A6C3FC0](v2);
  sub_22A3051A0();
  sub_22A305130();
  swift_release();
  swift_release();
  return v4;
}

uint64_t sub_22A2F7A14(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371808);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  id v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v18 - v10;
  uint64_t v12 = sub_22A305480();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A3055A0();
  swift_allocObject();
  uint64_t v16 = sub_22A305590();
  sub_22A2E9930(a1, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_22A2E9998((uint64_t)v11);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    if ((a3 & 1) == 0)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v9, v15, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      sub_22A2E95A4((uint64_t)v9, a2, 0);
      sub_22A2E9998((uint64_t)v9);
      swift_retain();
      sub_22A305580();
      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  return v16;
}

uint64_t ServerFallbackFlow.on(input:)()
{
  return 1;
}

uint64_t ServerFallbackFlow.execute(completion:)()
{
  return sub_22A304A10();
}

unint64_t sub_22A2F7CAC()
{
  unint64_t result = qword_268371B50;
  if (!qword_268371B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371B50);
  }
  return result;
}

uint64_t ServerFallbackFlow.execute()(uint64_t a1)
{
  v1[6] = a1;
  uint64_t v2 = sub_22A304A70();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  uint64_t v3 = sub_22A305C80();
  v1[10] = v3;
  v1[11] = *(void *)(v3 - 8);
  v1[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22A2F7E1C, 0, 0);
}

uint64_t sub_22A2F7E1C()
{
  char v19 = v0;
  if (qword_268371458 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_22A305C60();
  os_log_type_t v6 = sub_22A305E40();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[11];
  uint64_t v8 = v0[12];
  uint64_t v10 = v0[10];
  if (v7)
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v18 = v12;
    *(_DWORD *)id v11 = 136315138;
    v0[5] = sub_22A2E2200(0xD000000000000012, 0x800000022A306E20, &v18);
    sub_22A305ED0();
    _os_log_impl(&dword_22A2DE000, v5, v6, "Executing %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v12, -1, -1);
    MEMORY[0x22A6C55A0](v11, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  uint64_t v14 = v0[8];
  uint64_t v13 = v0[9];
  uint64_t v15 = v0[7];
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, *MEMORY[0x263F6F698], v15);
  sub_22A304C40();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_22A2F809C()
{
  return sub_22A304A10();
}

uint64_t sub_22A2F80B4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22A2E37B4;
  return ServerFallbackFlow.execute()(a1);
}

ValueMetadata *type metadata accessor for ServerFallbackFlow()
{
  return &type metadata for ServerFallbackFlow;
}

uint64_t static UsoTask.startWorkout(_:goalDefinedValue:goalUnitType:goalValue:areaType:sequenceLabel:appIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  sub_22A3042DC(a1, a2, a3, a4, a5, a6 & 1, a7, a8, a9, a10, a11);
  sub_22A3056E0();
  swift_allocObject();
  uint64_t v11 = sub_22A3056D0();
  sub_22A3052E0();
  swift_release();
  return v11;
}

uint64_t static UsoTask.cancelWorkout(_:)(uint64_t a1, uint64_t a2)
{
  return sub_22A2F8FF0(a1, a2, MEMORY[0x263F73530], MEMORY[0x263F73528], MEMORY[0x263F733C8]);
}

uint64_t static UsoTask.noVerbWorkout(_:)(uint64_t a1, uint64_t a2)
{
  return sub_22A2F8FF0(a1, a2, MEMORY[0x263F73540], MEMORY[0x263F73538], MEMORY[0x263F72440]);
}

uint64_t static UsoTask.pauseWorkout(_:)(uint64_t a1, uint64_t a2)
{
  return sub_22A2F82D4(a1, a2, MEMORY[0x263F734B8], MEMORY[0x263F734B0]);
}

uint64_t static UsoTask.endWorkout(_:)(uint64_t a1, uint64_t a2)
{
  return sub_22A2F82D4(a1, a2, MEMORY[0x263F73438], MEMORY[0x263F73430]);
}

uint64_t sub_22A2F82D4(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371800);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371808);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371810);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_22A3051B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  uint64_t v18 = sub_22A305480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v13, 1, 1, v18);
  uint64_t v19 = sub_22A3051E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v10, 1, 1, v19);
  sub_22A3042DC(a1, a2, (uint64_t)v16, (uint64_t)v13, 0, 1, 0, 0, (uint64_t)v10, 0, 0);
  sub_22A2E2868((uint64_t)v10, &qword_268371800);
  sub_22A2E2868((uint64_t)v13, &qword_268371808);
  sub_22A2E2868((uint64_t)v16, &qword_268371810);
  a3(0);
  swift_allocObject();
  uint64_t v20 = a4();
  sub_22A305820();
  swift_release();
  return v20;
}

uint64_t static UsoTask.resumeWorkout(_:)(uint64_t a1, uint64_t a2)
{
  return sub_22A2F82D4(a1, a2, MEMORY[0x263F73550], MEMORY[0x263F73548]);
}

uint64_t static UsoTask.createHealthLog(_:measurementNeeded:)(uint64_t a1, uint64_t a2, int a3)
{
  _s12SiriOntology26UsoEntity_common_HealthLogC0F12DomainsToolsE7builder06healthG4Name8areaType0kgL19IdentifierNamespace17measurementNeededAA0cd8Builder_e1_fG0CSSSg_A2LSbtFZ_0(a1, a2, 0, 0, 0, 0, a3);
  sub_22A305760();
  swift_allocObject();
  uint64_t v3 = sub_22A305750();
  sub_22A3052E0();
  swift_release();
  return v3;
}

uint64_t static UsoTask.noVerbHealthLog(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22A304F60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A3054E0();
  swift_allocObject();
  sub_22A3054D0();
  if (a2)
  {
    sub_22A3050F0();
    swift_allocObject();
    swift_bridgeObjectRetain_n();
    uint64_t v8 = MEMORY[0x22A6C4000](a1, a2);
    sub_22A304F30();
    sub_22A304EF0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v11[1] = v8;
    sub_22A304F80();
    swift_release();
  }
  sub_22A305780();
  swift_allocObject();
  uint64_t v9 = sub_22A305770();
  sub_22A304ED0();
  swift_release();
  return v9;
}

uint64_t UsoTaskBuilder.build()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371858);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2683719F0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22A3067E0;
  *(void *)(v4 + 32) = v0;
  uint64_t v13 = v4;
  sub_22A305DF0();
  uint64_t v5 = v13;
  uint64_t v6 = sub_22A304FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
  swift_retain();
  uint64_t v7 = MEMORY[0x22A6C3E90](v5, v3);
  swift_bridgeObjectRelease();
  sub_22A2E2868((uint64_t)v3, &qword_268371858);
  unint64_t v8 = MEMORY[0x22A6C3EE0](v7);
  unint64_t v9 = v8;
  if (!(v8 >> 62))
  {
    uint64_t result = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    swift_release();
    return 0;
  }
  uint64_t result = sub_22A306050();
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v9 & 0xC000000000000001) != 0)
  {
    uint64_t v11 = MEMORY[0x22A6C4E70](0, v9);
    goto LABEL_6;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v11 = *(void *)(v9 + 32);
    swift_retain();
LABEL_6:
    swift_bridgeObjectRelease();
    swift_release();
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t UsoTaskBuilder.toProtobufUsoGraph()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371858);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2683719F0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_22A3067E0;
  *(void *)(v6 + 32) = v1;
  uint64_t v12 = v6;
  sub_22A305DF0();
  uint64_t v7 = v12;
  uint64_t v8 = sub_22A304FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  swift_retain();
  MEMORY[0x22A6C3E90](v7, v5);
  swift_bridgeObjectRelease();
  sub_22A2E2868((uint64_t)v5, &qword_268371858);
  sub_22A304EB0();
  swift_release();
  uint64_t v9 = sub_22A304D60();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 0, 1, v9);
}

BOOL static ModifyWorkoutTaskVerb.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t ModifyWorkoutTaskVerb.hash(into:)()
{
  return sub_22A306150();
}

uint64_t ModifyWorkoutTaskVerb.hashValue.getter()
{
  return sub_22A306160();
}

BOOL sub_22A2F8BD4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22A2F8BE8()
{
  return sub_22A306160();
}

uint64_t sub_22A2F8C30()
{
  return sub_22A306150();
}

uint64_t sub_22A2F8C5C()
{
  return sub_22A306160();
}

uint64_t _s12SiriOntology7UsoTaskC18HealthDomainsToolsE13modifyWorkout_4verbAA0C37_VerbTemplateBuilder_ReferenceControlCyAA0c6Entitym8_common_I0CGSSSg_AD06ModifyidK0OtFZ_0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371800);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371808);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371810);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_22A3051B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = sub_22A305480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v11, 1, 1, v16);
  uint64_t v17 = sub_22A3051E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v8, 1, 1, v17);
  sub_22A3042DC(a1, a2, (uint64_t)v14, (uint64_t)v11, 0, 1, 0, 0, (uint64_t)v8, 0, 0);
  sub_22A2E2868((uint64_t)v8, &qword_268371800);
  sub_22A2E2868((uint64_t)v11, &qword_268371808);
  sub_22A2E2868((uint64_t)v14, &qword_268371810);
  if (a3)
  {
    if (a3 == 1)
    {
      sub_22A305570();
      swift_allocObject();
      uint64_t v18 = sub_22A305560();
    }
    else
    {
      sub_22A305700();
      swift_allocObject();
      uint64_t v18 = sub_22A3056F0();
    }
  }
  else
  {
    sub_22A305600();
    swift_allocObject();
    uint64_t v18 = sub_22A3055F0();
  }
  uint64_t v19 = v18;
  sub_22A305820();
  swift_release();
  return v19;
}

uint64_t sub_22A2F8F70(uint64_t a1, uint64_t a2)
{
  return sub_22A2F8FF0(a1, a2, MEMORY[0x263F73530], MEMORY[0x263F73528], MEMORY[0x263F733C8]);
}

uint64_t sub_22A2F8FB0(uint64_t a1, uint64_t a2)
{
  return sub_22A2F8FF0(a1, a2, MEMORY[0x263F73540], MEMORY[0x263F73538], MEMORY[0x263F72440]);
}

uint64_t sub_22A2F8FF0(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(void), void (*a5)(uint64_t))
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371800);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371808);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371810);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_22A3051B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  uint64_t v20 = sub_22A305480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v15, 1, 1, v20);
  uint64_t v21 = sub_22A3051E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v12, 1, 1, v21);
  uint64_t v22 = sub_22A3042DC(a1, a2, (uint64_t)v18, (uint64_t)v15, 0, 1, 0, 0, (uint64_t)v12, 0, 0);
  sub_22A2E2868((uint64_t)v12, &qword_268371800);
  sub_22A2E2868((uint64_t)v15, &qword_268371808);
  sub_22A2E2868((uint64_t)v18, &qword_268371810);
  a3(0);
  swift_allocObject();
  uint64_t v23 = a4();
  a5(v22);
  swift_release();
  return v23;
}

unint64_t sub_22A2F9288()
{
  unint64_t result = qword_268371B70;
  if (!qword_268371B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371B70);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ModifyWorkoutTaskVerb(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22A2F93A8);
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

ValueMetadata *type metadata accessor for ModifyWorkoutTaskVerb()
{
  return &type metadata for ModifyWorkoutTaskVerb;
}

unint64_t USOIdentifierNamespace.rawValue.getter(char a1)
{
  unint64_t result = 0x4E74756F6B726F77;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7974697669746361;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0x4C7373656E746966;
      break;
    case 4:
      unint64_t result = 0x6F4C68746C616568;
      break;
    case 5:
      unint64_t result = 0x6E5568746C616568;
      break;
    case 6:
      unint64_t result = 0x697461636964656DLL;
      break;
    case 7:
      unint64_t result = 0x6D6572757361656DLL;
      break;
    case 8:
      unint64_t result = 0x4E676F4C646F6F6DLL;
      break;
    case 9:
      unint64_t result = 0x4C6E6F69746F6D65;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_22A2F9568(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268371BC0);
  uint64_t v2 = (void *)sub_22A306060();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (void *)(a1 + 48);
  while (1)
  {
    char v5 = *((unsigned char *)v4 - 16);
    uint64_t v7 = *(v4 - 1);
    uint64_t v6 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_22A2FBC08(v5);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    uint64_t v10 = (void *)(v2[7] + 16 * result);
    *uint64_t v10 = v7;
    v10[1] = v6;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_22A2F9678(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268371BB8);
  uint64_t v2 = (void *)sub_22A306060();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_22A2FBC90(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_22A2F9790(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = USOIdentifierNamespace.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == USOIdentifierNamespace.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_22A3060C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22A2F981C()
{
  char v1 = *v0;
  sub_22A306140();
  USOIdentifierNamespace.rawValue.getter(v1);
  sub_22A305D50();
  swift_bridgeObjectRelease();
  return sub_22A306160();
}

uint64_t sub_22A2F9880()
{
  USOIdentifierNamespace.rawValue.getter(*v0);
  sub_22A305D50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22A2F98D4()
{
  char v1 = *v0;
  sub_22A306140();
  USOIdentifierNamespace.rawValue.getter(v1);
  sub_22A305D50();
  swift_bridgeObjectRelease();
  return sub_22A306160();
}

uint64_t sub_22A2F9934@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s18HealthDomainsTools22USOIdentifierNamespaceO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_22A2F9964@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = USOIdentifierNamespace.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void *sub_22A2F9990(uint64_t a1, uint64_t a2)
{
  uint64_t v76 = a2;
  uint64_t v82 = a1;
  uint64_t v75 = sub_22A305BC0();
  uint64_t v81 = *(char **)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  uint64_t v80 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22A304E90();
  uint64_t v64 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v83 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_22A304E60();
  uint64_t v79 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v71 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_22A304D60();
  uint64_t v77 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  uint64_t v63 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22A304DA0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22A304D30();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_22A304CF0();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v82, v15);
  if ((*(unsigned int (**)(char *, uint64_t))(v16 + 88))(v18, v15) == *MEMORY[0x263F6FF80])
  {
    (*(void (**)(char *, uint64_t))(v16 + 96))(v18, v15);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v18, v11);
    uint64_t v62 = v14;
    sub_22A304D10();
    uint64_t v19 = sub_22A304D70();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v20 = (void *)MEMORY[0x263F8EE78];
    uint64_t v84 = (void *)MEMORY[0x263F8EE78];
    uint64_t v69 = *(void *)(v19 + 16);
    uint64_t v61 = v12;
    if (v69)
    {
      uint64_t v60 = v11;
      uint64_t v21 = *(void *)(sub_22A304E20() - 8);
      unint64_t v68 = v19 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
      uint64_t v67 = (void (**)(char *, uint64_t))(v79 + 8);
      uint64_t v66 = *(void *)(v21 + 72);
      uint64_t v78 = (void (**)(char *, uint64_t))(v81 + 8);
      uint64_t v79 = v64 + 16;
      uint64_t v22 = (void (**)(char *, uint64_t))(v64 + 8);
      uint64_t v65 = (void (**)(char *, uint64_t))(v77 + 8);
      uint64_t v59 = v19;
      swift_bridgeObjectRetain();
      uint64_t v23 = 0;
      uint64_t v25 = v75;
      uint64_t v24 = v76;
      uint64_t v26 = v63;
      do
      {
        uint64_t v27 = v71;
        sub_22A304DE0();
        sub_22A304E30();
        (*v67)(v27, v72);
        uint64_t v28 = sub_22A304D50();
        uint64_t v29 = *(void *)(v28 + 16);
        if (v29)
        {
          uint64_t v74 = v23;
          unint64_t v30 = v28 + ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80));
          uint64_t v31 = *(void *)(v64 + 72);
          uint64_t v81 = *(char **)(v64 + 16);
          uint64_t v82 = v31;
          uint64_t v73 = v28;
          swift_bridgeObjectRetain();
          uint64_t v32 = (void *)MEMORY[0x263F8EE78];
          do
          {
            uint64_t v33 = v3;
            ((void (*)(char *, unint64_t, uint64_t))v81)(v83, v30, v3);
            uint64_t v34 = v80;
            sub_22A304E80();
            uint64_t v35 = sub_22A305BB0();
            uint64_t v37 = v36;
            (*v78)(v34, v25);
            if (*(void *)(v24 + 16) && (unint64_t v38 = sub_22A2FBC90(v35, v37), (v39 & 1) != 0))
            {
              uint64_t v77 = *(void *)(*(void *)(v24 + 56) + 8 * v38);
              swift_bridgeObjectRelease();
              uint64_t v40 = v83;
              uint64_t v41 = sub_22A304E70();
              uint64_t v43 = v42;
              uint64_t v3 = v33;
              (*v22)(v40, v33);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v32 = sub_22A2E5390(0, v32[2] + 1, 1, v32);
              }
              unint64_t v45 = v32[2];
              unint64_t v44 = v32[3];
              if (v45 >= v44 >> 1) {
                uint64_t v32 = sub_22A2E5390((void *)(v44 > 1), v45 + 1, 1, v32);
              }
              _OWORD v32[2] = v45 + 1;
              unint64_t v46 = &v32[3 * v45];
              uint64_t v24 = v76;
              v46[4] = v77;
              v46[5] = v41;
              v46[6] = v43;
              uint64_t v25 = v75;
            }
            else
            {
              swift_bridgeObjectRelease();
              uint64_t v3 = v33;
              (*v22)(v83, v33);
            }
            v30 += v82;
            --v29;
          }
          while (v29);
          swift_bridgeObjectRelease_n();
          uint64_t v26 = v63;
          uint64_t v23 = v74;
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v32 = (void *)MEMORY[0x263F8EE78];
        }
        ++v23;
        (*v65)(v26, v70);
        sub_22A2FC604((uint64_t)v32);
      }
      while (v23 != v69);
      swift_bridgeObjectRelease_n();
      uint64_t v47 = v84;
      uint64_t v11 = v60;
      uint64_t v12 = v61;
      uint64_t v20 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v47 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v84 = v47;
    swift_bridgeObjectRetain();
    sub_22A2FC770(&v84);
    uint64_t v48 = v62;
    swift_bridgeObjectRelease();
    os_log_type_t v49 = v84;
    int64_t v50 = v84[2];
    if (v50)
    {
      uint64_t v51 = v11;
      uint64_t v84 = v20;
      sub_22A2FC070(0, v50, 0);
      uint64_t v20 = v84;
      char v52 = v49 + 6;
      do
      {
        uint64_t v54 = *(v52 - 1);
        uint64_t v53 = *v52;
        uint64_t v84 = v20;
        unint64_t v55 = v20[2];
        unint64_t v56 = v20[3];
        swift_bridgeObjectRetain();
        if (v55 >= v56 >> 1)
        {
          sub_22A2FC070(v56 > 1, v55 + 1, 1);
          uint64_t v20 = v84;
        }
        v20[2] = v55 + 1;
        double v57 = &v20[2 * v55];
        v57[4] = v54;
        v57[5] = v53;
        v52 += 3;
        --v50;
      }
      while (v50);
      swift_release();
      uint64_t v11 = v51;
      uint64_t v12 = v61;
      uint64_t v48 = v62;
    }
    else
    {
      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v48, v11);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v20;
}

BOOL hasMoodLoggingIdentifier(from:)(uint64_t a1)
{
  return sub_22A2FA2B8(a1, (uint64_t)&unk_26DDDE540);
}

BOOL hasWorkoutIdentifier(from:)(uint64_t a1)
{
  return sub_22A2FA2B8(a1, (uint64_t)&unk_26DDDE590);
}

BOOL sub_22A2FA2B8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = sub_22A2F9678(a2);
  uint64_t v4 = sub_22A2F9990(a1, v3);
  swift_bridgeObjectRelease();
  uint64_t v5 = v4[2];
  swift_bridgeObjectRelease();
  return v5 != 0;
}

uint64_t isProbablyWorkout(from:requireWorkoutIdentifier:)(uint64_t a1, char a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371B78);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22A304DA0();
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_22A304E20();
  uint64_t v42 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v40 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_22A304D30();
  uint64_t v41 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  char v39 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22A304CF0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v36 - v17;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v19((char *)&v36 - v17, a1, v12);
  unint64_t v45 = v6;
  if (a2)
  {
    unint64_t v20 = sub_22A2F9678((uint64_t)&unk_26DDDE5E0);
    uint64_t v21 = sub_22A2F9990((uint64_t)v18, v20);
    swift_bridgeObjectRelease();
    uint64_t v22 = v21[2];
    swift_bridgeObjectRelease();
    uint64_t v23 = *(void (**)(char *, uint64_t))(v13 + 8);
    v23(v18, v12);
    if (!v22) {
      return 0;
    }
  }
  else
  {
    uint64_t v23 = *(void (**)(char *, uint64_t))(v13 + 8);
    v23(v18, v12);
  }
  v19(v16, a1, v12);
  if ((*(unsigned int (**)(char *, uint64_t))(v13 + 88))(v16, v12) != *MEMORY[0x263F6FF80])
  {
    v23(v16, v12);
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v13 + 96))(v16, v12);
  uint64_t v24 = v41;
  uint64_t v25 = v39;
  uint64_t v26 = v43;
  (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v39, v16, v43);
  sub_22A304D10();
  uint64_t v27 = sub_22A304D70();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v38);
  if (*(void *)(v27 + 16))
  {
    uint64_t v28 = v42;
    uint64_t v30 = v44;
    uint64_t v29 = (uint64_t)v45;
    (*(void (**)(char *, unint64_t, uint64_t))(v42 + 16))(v45, v27 + ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80)), v44);
    uint64_t v31 = 0;
  }
  else
  {
    uint64_t v31 = 1;
    uint64_t v30 = v44;
    uint64_t v29 = (uint64_t)v45;
    uint64_t v28 = v42;
  }
  uint64_t v32 = v40;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 56))(v29, v31, 1, v30);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v29, 1, v30) == 1)
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
    sub_22A2E2868(v29, &qword_268371B78);
    return 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v32, v29, v30);
  uint64_t v33 = sub_22A304DD0();
  if (v33)
  {
    sub_22A305090();
    swift_release();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v32, v30);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
    if (v47)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268371B90);
      if (swift_dynamicCast())
      {
        uint64_t v35 = *((void *)&v49 + 1);
      }
      else
      {
        uint64_t v35 = 0;
        uint64_t v50 = 0;
        long long v48 = 0u;
        long long v49 = 0u;
      }
    }
    else
    {
      sub_22A2E2868((uint64_t)v46, &qword_268371B80);
      uint64_t v35 = 0;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v50 = 0;
    }
    uint64_t v33 = v35 != 0;
    sub_22A2E2868((uint64_t)&v48, &qword_268371B88);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v32, v30);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
  }
  return v33;
}

uint64_t getWorkoutName(from:fallback:)(uint64_t a1, int a2)
{
  uint64_t v4 = sub_22A304F60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683719D8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return 0;
  }
  swift_retain();
  if (!sub_22A305070() || (uint64_t v11 = sub_22A304FA0(), swift_release(), !v11))
  {
LABEL_37:
    if (!sub_22A305070() || (sub_22A304F00(), swift_release(), !v42))
    {
      swift_release();
      return 0;
    }
    uint64_t v27 = v41;
    if (v41 == 0x7374756F6B726F77 && v42 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      char v30 = sub_22A3060C0();
      swift_release();
      if (v30 & 1) == 0 && (a2) {
        return v27;
      }
      swift_bridgeObjectRelease();
    }
    return 0;
  }
  uint64_t v36 = *(void *)(v11 + 16);
  if (!v36)
  {
    uint64_t v26 = 1;
LABEL_31:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, v26, 1, v4);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
    {
      sub_22A2E2868((uint64_t)v10, &qword_2683719D8);
    }
    else
    {
      uint64_t v27 = sub_22A304F40();
      uint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      if ((v27 != 0x7374756F6B726F77 || v29 != 0xE800000000000000) && (sub_22A3060C0() & 1) == 0)
      {
        swift_release();
        return v27;
      }
      swift_bridgeObjectRelease();
    }
    goto LABEL_37;
  }
  int v33 = a2;
  uint64_t v31 = v11;
  uint64_t v32 = v5;
  uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
  uint64_t v12 = v5 + 16;
  unint64_t v38 = v11 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
  char v39 = v13;
  uint64_t v34 = a1;
  uint64_t v35 = (void (**)(char *, uint64_t))(v12 - 8);
  uint64_t v40 = v12;
  uint64_t v37 = *(void *)(v12 + 56);
  swift_bridgeObjectRetain();
  uint64_t v14 = 0;
  while (1)
  {
    v39(v7, v38 + v37 * v14, v4);
    uint64_t v15 = sub_22A304F50();
    uint64_t v17 = v16 ? v15 : 0;
    unint64_t v18 = v16 ? v16 : 0xE000000000000000;
    uint64_t v19 = qword_26DDDE640;
    if (qword_26DDDE640)
    {
      BOOL v20 = aWorkoutname_1[0] == v17 && aWorkoutname_1[1] == v18;
      if (v20 || (uint64_t result = sub_22A3060C0(), (result & 1) != 0))
      {
LABEL_29:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v5 = v32;
        (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v10, v7, v4);
        uint64_t v26 = 0;
        LOBYTE(a2) = v33;
        goto LABEL_31;
      }
      if (v19 != 1) {
        break;
      }
    }
LABEL_6:
    ++v14;
    swift_bridgeObjectRelease();
    (*v35)(v7, v4);
    if (v14 == v36)
    {
      swift_bridgeObjectRelease();
      uint64_t v26 = 1;
      LOBYTE(a2) = v33;
      uint64_t v5 = v32;
      goto LABEL_31;
    }
  }
  uint64_t v22 = aName_0;
  uint64_t v23 = 1;
  while (1)
  {
    uint64_t v24 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (*((void *)v22 - 1) == v17 && *(void *)v22 == v18) {
      goto LABEL_29;
    }
    uint64_t result = sub_22A3060C0();
    if (result) {
      goto LABEL_29;
    }
    v22 += 16;
    ++v23;
    if (v24 == v19) {
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t getHealthDataTypeName(from:)(uint64_t a1)
{
  uint64_t v2 = sub_22A304F60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683719D8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return 0;
  }
  swift_retain();
  uint64_t v9 = sub_22A304FA0();
  if (!v9)
  {
    swift_arrayDestroy();
    swift_release();
    return 0;
  }
  uint64_t v31 = *(void *)(v9 + 16);
  if (!v31)
  {
    uint64_t v24 = 1;
LABEL_31:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, v24, 1, v2);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) != 1)
    {
      uint64_t v25 = sub_22A304F40();
      swift_release();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      return v25;
    }
    swift_release();
    sub_22A2E2868((uint64_t)v8, &qword_2683719D8);
    return 0;
  }
  uint64_t v27 = v8;
  uint64_t v28 = v3;
  uint64_t v11 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
  uint64_t v10 = v3 + 16;
  unint64_t v33 = v9 + ((*(unsigned __int8 *)(v10 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 64));
  uint64_t v34 = v11;
  uint64_t v29 = a1;
  char v30 = (void (**)(char *, uint64_t))(v10 - 8);
  uint64_t v32 = *(void *)(v10 + 56);
  v26[1] = v9;
  swift_bridgeObjectRetain();
  uint64_t v12 = 0;
  while (1)
  {
    v34(v5, v33 + v32 * v12, v2);
    uint64_t v13 = sub_22A304F50();
    uint64_t v15 = v14 ? v13 : 0;
    unint64_t v16 = v14 ? v14 : 0xE000000000000000;
    uint64_t v17 = qword_26DDDE680;
    if (qword_26DDDE680)
    {
      BOOL v18 = aHealthlogname_2[0] == v15 && aHealthlogname_2[1] == v16;
      if (v18 || (uint64_t result = sub_22A3060C0(), (result & 1) != 0))
      {
LABEL_29:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v8 = v27;
        uint64_t v3 = v28;
        (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v27, v5, v2);
        uint64_t v24 = 0;
        goto LABEL_31;
      }
      if (v17 != 1) {
        break;
      }
    }
LABEL_5:
    ++v12;
    swift_bridgeObjectRelease();
    (*v30)(v5, v2);
    if (v12 == v31)
    {
      swift_bridgeObjectRelease();
      uint64_t v24 = 1;
      uint64_t v3 = v28;
      uint64_t v8 = v27;
      goto LABEL_31;
    }
  }
  BOOL v20 = aOgname;
  uint64_t v21 = 1;
  while (1)
  {
    uint64_t v22 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (*((void *)v20 - 1) == v15 && *(void *)v20 == v16) {
      goto LABEL_29;
    }
    uint64_t result = sub_22A3060C0();
    if (result) {
      goto LABEL_29;
    }
    v20 += 16;
    ++v21;
    if (v22 == v17) {
      goto LABEL_5;
    }
  }
  __break(1u);
  return result;
}

uint64_t isExerciseRequest(in:)(uint64_t a1)
{
  uint64_t v2 = sub_22A304F60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683719D8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    goto LABEL_33;
  }
  swift_retain();
  uint64_t v9 = sub_22A304FA0();
  if (!v9)
  {
LABEL_32:
    swift_release();
LABEL_33:
    char v25 = 0;
    return v25 & 1;
  }
  uint64_t v34 = *(void *)(v9 + 16);
  if (!v34)
  {
    uint64_t v24 = 1;
LABEL_30:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, v24, 1, v2);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) != 1)
    {
      uint64_t v26 = sub_22A304F40();
      uint64_t v28 = v27;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      if (v26 == 0x6573696372657865 && v28 == 0xE800000000000000)
      {
        swift_bridgeObjectRelease();
        swift_release();
        char v25 = 1;
      }
      else
      {
        char v25 = sub_22A3060C0();
        swift_bridgeObjectRelease();
        swift_release();
      }
      return v25 & 1;
    }
    sub_22A2E2868((uint64_t)v8, &qword_2683719D8);
    goto LABEL_32;
  }
  char v30 = v8;
  uint64_t v31 = v3;
  uint64_t v11 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
  uint64_t v10 = v3 + 16;
  unint64_t v36 = v9 + ((*(unsigned __int8 *)(v10 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 64));
  uint64_t v37 = v11;
  uint64_t v32 = a1;
  unint64_t v33 = (void (**)(char *, uint64_t))(v10 - 8);
  uint64_t v35 = *(void *)(v10 + 56);
  v29[1] = v9;
  swift_bridgeObjectRetain();
  uint64_t v12 = 0;
  while (1)
  {
    v37(v5, v36 + v35 * v12, v2);
    uint64_t v13 = sub_22A304F50();
    uint64_t v15 = v14 ? v13 : 0;
    unint64_t v16 = v14 ? v14 : 0xE000000000000000;
    uint64_t v17 = qword_26DDDE6D0;
    if (qword_26DDDE6D0)
    {
      BOOL v18 = aWorkoutname_2[0] == v15 && aWorkoutname_2[1] == v16;
      if (v18 || (uint64_t result = sub_22A3060C0(), (result & 1) != 0))
      {
LABEL_28:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v8 = v30;
        uint64_t v3 = v31;
        (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v30, v5, v2);
        uint64_t v24 = 0;
        goto LABEL_30;
      }
      if (v17 != 1) {
        break;
      }
    }
LABEL_5:
    ++v12;
    swift_bridgeObjectRelease();
    (*v33)(v5, v2);
    if (v12 == v34)
    {
      swift_bridgeObjectRelease();
      uint64_t v24 = 1;
      uint64_t v3 = v31;
      uint64_t v8 = v30;
      goto LABEL_30;
    }
  }
  BOOL v20 = &unk_26DDDE6F8;
  uint64_t v21 = 1;
  while (1)
  {
    uint64_t v22 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (*(v20 - 1) == v15 && *v20 == v16) {
      goto LABEL_28;
    }
    uint64_t result = sub_22A3060C0();
    if (result) {
      goto LABEL_28;
    }
    v20 += 2;
    ++v21;
    if (v22 == v17) {
      goto LABEL_5;
    }
  }
  __break(1u);
  return result;
}

uint64_t getMeasurementUnit(from:)(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = sub_22A305710();
  }
  else {
    uint64_t v1 = 0;
  }
  uint64_t v2 = getMeasurementUnit(from:)(v1);
  swift_release();
  return v2;
}

{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  void (**v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void v22[2];
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  uint64_t v26 = sub_22A304F60();
  uint64_t v2 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (a1)
  {
    swift_retain();
    uint64_t v6 = sub_22A304FA0();
    if (v6)
    {
      uint64_t v7 = sub_22A2FD3F4(v6, &qword_26DDDE6F0);
      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      uint64_t v8 = *(void *)(v7 + 16);
      if (v8)
      {
        v22[1] = a1;
        uint64_t v27 = v5;
        sub_22A2FC070(0, v8, 0);
        uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
        uint64_t v9 = v2 + 16;
        uint64_t v11 = *(unsigned __int8 *)(v9 + 64);
        v22[0] = v7;
        uint64_t v12 = v7 + ((v11 + 32) & ~v11);
        uint64_t v23 = *(void *)(v9 + 56);
        uint64_t v24 = v10;
        char v25 = v9;
        uint64_t v13 = (void (**)(char *, uint64_t))(v9 - 8);
        do
        {
          unint64_t v14 = v26;
          v24(v4, v12, v26);
          uint64_t v15 = sub_22A304F40();
          uint64_t v17 = v16;
          (*v13)(v4, v14);
          uint64_t v5 = v27;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_22A2FC070(0, *(void *)(v5 + 16) + 1, 1);
            uint64_t v5 = v27;
          }
          uint64_t v19 = *(void *)(v5 + 16);
          BOOL v18 = *(void *)(v5 + 24);
          if (v19 >= v18 >> 1)
          {
            sub_22A2FC070(v18 > 1, v19 + 1, 1);
            uint64_t v5 = v27;
          }
          *(void *)(v5 + 16) = v19 + 1;
          BOOL v20 = v5 + 16 * v19;
          *(void *)(v20 + 32) = v15;
          *(void *)(v20 + 40) = v17;
          v12 += v23;
          --v8;
        }
        while (v8);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_arrayDestroy();
    }
    swift_release();
  }
  return v5;
}

uint64_t getAreaType(from:)(uint64_t a1)
{
  uint64_t v2 = sub_22A304F60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683719D8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return 0;
  }
  swift_retain();
  if (!sub_22A305070()
    || (uint64_t v9 = sub_22A305140(), swift_release(), !v9)
    || (uint64_t v10 = sub_22A304FA0(), swift_release(), !v10))
  {
    swift_release();
    return 0;
  }
  uint64_t v11 = *(void *)(v10 + 16);
  if (!v11)
  {
    uint64_t v22 = 1;
    goto LABEL_19;
  }
  uint64_t v24 = v8;
  uint64_t v25 = v3;
  uint64_t v26 = a1;
  unint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
  uint64_t v13 = v3 + 16;
  uint64_t v12 = v14;
  unint64_t v15 = v10 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
  uint64_t v16 = *(void *)(v13 + 56);
  uint64_t v23 = v10;
  swift_bridgeObjectRetain();
  uint64_t v28 = "outName";
  unint64_t v27 = 0x800000022A307AB0;
  while (1)
  {
    v12(v5, v15, v2);
    uint64_t v18 = sub_22A304F50();
    if (!v19) {
      goto LABEL_8;
    }
    if (v18 == 0xD000000000000016 && v19 == v27) {
      break;
    }
    char v17 = sub_22A3060C0();
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_18;
    }
LABEL_8:
    (*(void (**)(char *, uint64_t))(v13 - 8))(v5, v2);
    v15 += v16;
    if (!--v11)
    {
      swift_bridgeObjectRelease();
      uint64_t v22 = 1;
      uint64_t v3 = v25;
      uint64_t v8 = v24;
      goto LABEL_19;
    }
  }
  swift_bridgeObjectRelease();
LABEL_18:
  swift_bridgeObjectRelease();
  uint64_t v8 = v24;
  uint64_t v3 = v25;
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v24, v5, v2);
  uint64_t v22 = 0;
LABEL_19:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, v22, 1, v2);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    swift_release();
    sub_22A2E2868((uint64_t)v8, &qword_2683719D8);
    return 0;
  }
  uint64_t v20 = sub_22A304F40();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  return v20;
}

unint64_t sub_22A2FBBC4(uint64_t a1)
{
  uint64_t v2 = sub_22A305E90();
  return sub_22A2FBD08(a1, v2);
}

unint64_t sub_22A2FBC08(char a1)
{
  sub_22A306140();
  HealthLogName.rawValue.getter(a1);
  sub_22A305D50();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_22A306160();
  return sub_22A2FBE14(a1, v2);
}

unint64_t sub_22A2FBC90(uint64_t a1, uint64_t a2)
{
  sub_22A306140();
  sub_22A305D50();
  uint64_t v4 = sub_22A306160();
  return sub_22A2FBF8C(a1, a2, v4);
}

unint64_t sub_22A2FBD08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_22A305C10();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_22A305EA0();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_22A305EA0();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_22A2FBE14(char a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v7 = HealthLogName.rawValue.getter(*(unsigned char *)(*(void *)(v2 + 48) + v5));
    uint64_t v9 = v8;
    if (v7 == HealthLogName.rawValue.getter(a1) && v9 == v10)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v12 = sub_22A3060C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
    {
      uint64_t v13 = ~v4;
      unint64_t v5 = (v5 + 1) & v13;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v14 = HealthLogName.rawValue.getter(*(unsigned char *)(*(void *)(v2 + 48) + v5));
          uint64_t v16 = v15;
          if (v14 == HealthLogName.rawValue.getter(a1) && v16 == v17) {
            break;
          }
          char v19 = sub_22A3060C0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v19 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v13;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_22A2FBF8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22A3060C0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_22A3060C0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_22A2FC070(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22A2FC0B0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_22A2FC090(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22A2FC3C4(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_22A2FC0B0(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268371BA0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_22A306070();
  __break(1u);
  return result;
}

uint64_t sub_22A2FC21C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268371898);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683718A0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_22A306070();
  __break(1u);
  return result;
}

uint64_t sub_22A2FC3C4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268371BA8);
  uint64_t v10 = *(void *)(sub_22A304F60() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_22A304F60() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  char v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_22A306070();
  __break(1u);
  return result;
}

uint64_t sub_22A2FC604(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_22A2E5390(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[3 * v8 + 4];
  if (a1 + 32 < v9 + 24 * v2 && v9 < a1 + 32 + 24 * v2) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2683718A0);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_22A306070();
  __break(1u);
  return result;
}

uint64_t sub_22A2FC770(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (void *)sub_22A2FD394(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_22A2FC7DC(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_22A2FC7DC(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_22A306090();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v88 = 0;
      uint64_t v89 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v91 = *(void *)(v89 + 24 * i);
        uint64_t v92 = v88;
        do
        {
          uint64_t v93 = v89 + v92;
          if (v91 >= *(void *)(v89 + v92)) {
            break;
          }
          if (!v89) {
            goto LABEL_140;
          }
          v94 = (void *)(v89 + v92);
          uint64_t v95 = *(void *)(v89 + v92 + 32);
          uint64_t v96 = *(void *)(v89 + v92 + 40);
          *(_OWORD *)(v89 + v92 + 24) = *(_OWORD *)v93;
          *(void *)(v89 + v92 + 40) = *(void *)(v93 + 16);
          void *v94 = v91;
          v94[1] = v95;
          v94[2] = v96;
          v92 -= 24;
        }
        while (v92 != -24);
        v88 += 24;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_145;
  }
  uint64_t v6 = result;
  v106 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      BOOL v12 = (char *)MEMORY[0x263F8EE78];
LABEL_102:
      v97 = v12;
      uint64_t v108 = v9;
      if (v13 >= 2)
      {
        uint64_t v98 = *v106;
        do
        {
          unint64_t v99 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v98) {
            goto LABEL_144;
          }
          v100 = v97;
          uint64_t v101 = *(void *)&v97[16 * v99 + 32];
          uint64_t v102 = *(void *)&v97[16 * v13 + 24];
          sub_22A2FCEFC((char *)(v98 + 24 * v101), (char *)(v98 + 24 * *(void *)&v97[16 * v13 + 16]), v98 + 24 * v102, __dst);
          if (v1) {
            break;
          }
          if (v102 < v101) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v100 = sub_22A2FD380((uint64_t)v100);
          }
          if (v99 >= *((void *)v100 + 2)) {
            goto LABEL_133;
          }
          v103 = &v100[16 * v99 + 32];
          *(void *)v103 = v101;
          *((void *)v103 + 1) = v102;
          unint64_t v104 = *((void *)v100 + 2);
          if (v13 > v104) {
            goto LABEL_134;
          }
          memmove(&v100[16 * v13 + 16], &v100[16 * v13 + 32], 16 * (v104 - v13));
          v97 = v100;
          *((void *)v100 + 2) = v104 - 1;
          unint64_t v13 = v104 - 1;
        }
        while (v104 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(void *)(v108 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v108 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683718A0);
    uint64_t v8 = sub_22A305E10();
    *(void *)(v8 + 16) = v7;
    uint64_t v108 = v8;
    __dst = (char *)(v8 + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v107 = *a1 + 48;
  uint64_t v105 = *a1 - 24;
  BOOL v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v109 = v6;
  uint64_t v110 = v3;
  uint64_t v111 = v11;
  while (1)
  {
    uint64_t v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 24 * v10);
      uint64_t v16 = *(void *)(v11 + 24 * v14);
      uint64_t v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        unint64_t v17 = (uint64_t *)(v107 + 24 * v14);
        uint64_t v18 = v15;
        while (1)
        {
          uint64_t v20 = *v17;
          v17 += 3;
          uint64_t v19 = v20;
          if (v15 < v16 == v20 >= v18) {
            break;
          }
          ++v10;
          uint64_t v18 = v19;
          if (v3 == v10)
          {
            uint64_t v10 = v3;
            break;
          }
        }
      }
      if (v15 < v16)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          uint64_t v21 = 24 * v10;
          uint64_t v22 = 24 * v14;
          uint64_t v23 = v10;
          uint64_t v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11) {
                goto LABEL_143;
              }
              uint64_t v25 = v11 + v22;
              uint64_t v26 = v11 + v21;
              uint64_t v27 = *(void *)(v11 + v22 + 16);
              long long v28 = *(_OWORD *)(v11 + v22);
              uint64_t v29 = *(void *)(v11 + v21 - 8);
              *(_OWORD *)uint64_t v25 = *(_OWORD *)(v11 + v21 - 24);
              *(void *)(v25 + 16) = v29;
              *(_OWORD *)(v26 - 24) = v28;
              *(void *)(v26 - 8) = v27;
            }
            ++v24;
            v21 -= 24;
            v22 += 24;
          }
          while (v24 < v23);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_135;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_46;
    }
    uint64_t v30 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v30 >= v3) {
      uint64_t v30 = v3;
    }
    if (v30 < v14) {
      break;
    }
    if (v10 != v30)
    {
      uint64_t v31 = v105 + 24 * v10;
      do
      {
        uint64_t v32 = *(void *)(v11 + 24 * v10);
        uint64_t v33 = v14;
        uint64_t v34 = v31;
        do
        {
          if (v32 >= *(void *)v34) {
            break;
          }
          if (!v11) {
            goto LABEL_141;
          }
          uint64_t v35 = *(void *)(v34 + 32);
          uint64_t v36 = *(void *)(v34 + 40);
          *(_OWORD *)(v34 + 24) = *(_OWORD *)v34;
          *(void *)(v34 + 40) = *(void *)(v34 + 16);
          *(void *)uint64_t v34 = v32;
          *(void *)(v34 + 8) = v35;
          *(void *)(v34 + 16) = v36;
          v34 -= 24;
          ++v33;
        }
        while (v10 != v33);
        ++v10;
        v31 += 24;
      }
      while (v10 != v30);
      uint64_t v10 = v30;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v12 = sub_22A2FD1B4(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v38 = *((void *)v12 + 2);
    unint64_t v37 = *((void *)v12 + 3);
    unint64_t v13 = v38 + 1;
    uint64_t v11 = v111;
    if (v38 >= v37 >> 1)
    {
      v87 = sub_22A2FD1B4((char *)(v37 > 1), v38 + 1, 1, v12);
      uint64_t v11 = v111;
      BOOL v12 = v87;
    }
    *((void *)v12 + 2) = v13;
    char v39 = v12 + 32;
    uint64_t v40 = &v12[16 * v38 + 32];
    *(void *)uint64_t v40 = v14;
    *((void *)v40 + 1) = v10;
    if (v38)
    {
      while (1)
      {
        unint64_t v41 = v13 - 1;
        if (v13 >= 4)
        {
          unint64_t v46 = &v39[16 * v13];
          uint64_t v47 = *((void *)v46 - 8);
          uint64_t v48 = *((void *)v46 - 7);
          BOOL v52 = __OFSUB__(v48, v47);
          uint64_t v49 = v48 - v47;
          if (v52) {
            goto LABEL_119;
          }
          uint64_t v51 = *((void *)v46 - 6);
          uint64_t v50 = *((void *)v46 - 5);
          BOOL v52 = __OFSUB__(v50, v51);
          uint64_t v44 = v50 - v51;
          char v45 = v52;
          if (v52) {
            goto LABEL_120;
          }
          unint64_t v53 = v13 - 2;
          uint64_t v54 = &v39[16 * v13 - 32];
          uint64_t v56 = *(void *)v54;
          uint64_t v55 = *((void *)v54 + 1);
          BOOL v52 = __OFSUB__(v55, v56);
          uint64_t v57 = v55 - v56;
          if (v52) {
            goto LABEL_122;
          }
          BOOL v52 = __OFADD__(v44, v57);
          uint64_t v58 = v44 + v57;
          if (v52) {
            goto LABEL_125;
          }
          if (v58 >= v49)
          {
            uint64_t v76 = &v39[16 * v41];
            uint64_t v78 = *(void *)v76;
            uint64_t v77 = *((void *)v76 + 1);
            BOOL v52 = __OFSUB__(v77, v78);
            uint64_t v79 = v77 - v78;
            if (v52) {
              goto LABEL_129;
            }
            BOOL v69 = v44 < v79;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v70 = *((void *)v12 + 4);
            uint64_t v71 = *((void *)v12 + 5);
            BOOL v52 = __OFSUB__(v71, v70);
            uint64_t v63 = v71 - v70;
            char v64 = v52;
            goto LABEL_77;
          }
          uint64_t v43 = *((void *)v12 + 4);
          uint64_t v42 = *((void *)v12 + 5);
          BOOL v52 = __OFSUB__(v42, v43);
          uint64_t v44 = v42 - v43;
          char v45 = v52;
        }
        if (v45) {
          goto LABEL_121;
        }
        unint64_t v53 = v13 - 2;
        uint64_t v59 = &v39[16 * v13 - 32];
        uint64_t v61 = *(void *)v59;
        uint64_t v60 = *((void *)v59 + 1);
        BOOL v62 = __OFSUB__(v60, v61);
        uint64_t v63 = v60 - v61;
        char v64 = v62;
        if (v62) {
          goto LABEL_124;
        }
        uint64_t v65 = &v39[16 * v41];
        uint64_t v67 = *(void *)v65;
        uint64_t v66 = *((void *)v65 + 1);
        BOOL v52 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v52) {
          goto LABEL_127;
        }
        if (__OFADD__(v63, v68)) {
          goto LABEL_128;
        }
        if (v63 + v68 >= v44)
        {
          BOOL v69 = v44 < v68;
LABEL_83:
          if (v69) {
            unint64_t v41 = v53;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v64) {
          goto LABEL_123;
        }
        uint64_t v72 = &v39[16 * v41];
        uint64_t v74 = *(void *)v72;
        uint64_t v73 = *((void *)v72 + 1);
        BOOL v52 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v52) {
          goto LABEL_126;
        }
        if (v75 < v63) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v80 = v41 - 1;
        if (v41 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11) {
          goto LABEL_142;
        }
        uint64_t v81 = v12;
        uint64_t v82 = &v39[16 * v80];
        uint64_t v83 = *(void *)v82;
        uint64_t v84 = &v39[16 * v41];
        uint64_t v85 = *((void *)v84 + 1);
        sub_22A2FCEFC((char *)(v11 + 24 * *(void *)v82), (char *)(v11 + 24 * *(void *)v84), v11 + 24 * v85, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v85 < v83) {
          goto LABEL_116;
        }
        if (v41 > *((void *)v81 + 2)) {
          goto LABEL_117;
        }
        *(void *)uint64_t v82 = v83;
        *(void *)&v39[16 * v80 + 8] = v85;
        unint64_t v86 = *((void *)v81 + 2);
        if (v41 >= v86) {
          goto LABEL_118;
        }
        BOOL v12 = v81;
        unint64_t v13 = v86 - 1;
        memmove(&v39[16 * v41], v84 + 16, 16 * (v86 - 1 - v41));
        *((void *)v81 + 2) = v86 - 1;
        uint64_t v11 = v111;
        if (v86 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    uint64_t v6 = v109;
    uint64_t v3 = v110;
    if (v10 >= v110)
    {
      uint64_t v9 = v108;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  uint64_t result = sub_22A306030();
  __break(1u);
  return result;
}

uint64_t sub_22A2FCEFC(char *__src, char *a2, unint64_t a3, char *__dst)
{
  int64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 24;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 24;
  uint64_t v26 = __src;
  uint64_t v25 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -23)
    {
      if (__dst != a2 || &a2[24 * v11] <= __dst) {
        memmove(__dst, a2, 24 * v11);
      }
      uint64_t v16 = &v4[24 * v11];
      uint64_t v24 = v16;
      uint64_t v26 = v6;
      if (v7 < v6 && v10 >= 24)
      {
        unint64_t v17 = a3 - 24;
        uint64_t v18 = v6;
        while (1)
        {
          uint64_t v19 = (char *)(v17 + 24);
          uint64_t v20 = *((void *)v18 - 3);
          v18 -= 24;
          if (*((void *)v16 - 3) >= v20)
          {
            uint64_t v24 = v16 - 24;
            if (v19 < v16 || v17 >= (unint64_t)v16 || v19 != v16)
            {
              long long v22 = *(_OWORD *)(v16 - 24);
              *(void *)(v17 + 16) = *((void *)v16 - 1);
              *(_OWORD *)unint64_t v17 = v22;
            }
            uint64_t v18 = v6;
            v16 -= 24;
            if (v6 <= v7) {
              goto LABEL_38;
            }
          }
          else
          {
            if (v19 != v6 || v17 >= (unint64_t)v6)
            {
              long long v21 = *(_OWORD *)v18;
              *(void *)(v17 + 16) = *((void *)v18 + 2);
              *(_OWORD *)unint64_t v17 = v21;
            }
            uint64_t v26 = v18;
            if (v18 <= v7) {
              goto LABEL_38;
            }
          }
          v17 -= 24;
          uint64_t v6 = v18;
          if (v16 <= v4) {
            goto LABEL_38;
          }
        }
      }
      goto LABEL_38;
    }
  }
  else if (v8 >= -23)
  {
    if (__dst != __src || &__src[24 * v9] <= __dst) {
      memmove(__dst, __src, 24 * v9);
    }
    BOOL v12 = &v4[24 * v9];
    uint64_t v24 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 24)
    {
      do
      {
        if (*(void *)v6 >= *(void *)v4)
        {
          if (v7 != v4)
          {
            long long v15 = *(_OWORD *)v4;
            *((void *)v7 + 2) = *((void *)v4 + 2);
            *(_OWORD *)uint64_t v7 = v15;
          }
          v4 += 24;
          uint64_t v25 = v4;
          unint64_t v13 = v6;
        }
        else
        {
          unint64_t v13 = v6 + 24;
          if (v7 < v6 || v7 >= v13 || v7 != v6)
          {
            long long v14 = *(_OWORD *)v6;
            *((void *)v7 + 2) = *((void *)v6 + 2);
            *(_OWORD *)uint64_t v7 = v14;
          }
        }
        v7 += 24;
        if (v4 >= v12) {
          break;
        }
        uint64_t v6 = v13;
      }
      while ((unint64_t)v13 < a3);
      uint64_t v26 = v7;
    }
LABEL_38:
    sub_22A2FD2B0((void **)&v26, (const void **)&v25, &v24);
    return 1;
  }
  uint64_t result = sub_22A306070();
  __break(1u);
  return result;
}

char *sub_22A2FD1B4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268371BB0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  long long v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_22A2FD2B0(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -24)
  {
    uint64_t result = (char *)sub_22A306070();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 24;
    if (result != v3 || result >= &v3[24 * v6])
    {
      return (char *)memmove(result, v3, 24 * v6);
    }
  }
  return result;
}

char *sub_22A2FD380(uint64_t a1)
{
  return sub_22A2FD1B4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_22A2FD394(void *a1)
{
  return sub_22A2FC21C(0, a1[2], 0, a1);
}

uint64_t _s18HealthDomainsTools22USOIdentifierNamespaceO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_22A306080();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA) {
    return 10;
  }
  else {
    return v0;
  }
}

uint64_t sub_22A2FD3F4(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_22A304F60();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  unint64_t v41 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v44 = MEMORY[0x263F8EE78];
  uint64_t v39 = *(void *)(a1 + 16);
  if (!v39) {
    return result;
  }
  uint64_t v32 = v2;
  uint64_t v12 = 0;
  long long v14 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v13 = v8 + 16;
  unint64_t v35 = (*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64);
  uint64_t v36 = v13;
  uint64_t v37 = a1 + v35;
  unint64_t v38 = v14;
  uint64_t v15 = *(void *)(v13 + 56);
  uint64_t v42 = a2;
  uint64_t v43 = v15;
  uint64_t v40 = (void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v33 = a2 + 7;
  uint64_t v34 = (void (**)(char *, uint64_t))(v13 - 8);
  while (1)
  {
    uint64_t v16 = v5;
    v38(v10, v37 + v43 * v12, v5);
    unint64_t v17 = v10;
    uint64_t v18 = sub_22A304F50();
    uint64_t v20 = v19 ? v18 : 0;
    unint64_t v21 = v19 ? v19 : 0xE000000000000000;
    uint64_t v22 = a2[2];
    if (v22)
    {
      BOOL v23 = a2[4] == v20 && a2[5] == v21;
      if (v23 || (uint64_t result = sub_22A3060C0(), (result & 1) != 0))
      {
LABEL_17:
        swift_bridgeObjectRelease();
        uint64_t v24 = *v40;
        uint64_t v10 = v17;
        uint64_t v5 = v16;
        (*v40)(v41, v17, v16);
        uint64_t v25 = v44;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22A2FC090(0, *(void *)(v25 + 16) + 1, 1);
          uint64_t v25 = v44;
        }
        unint64_t v27 = *(void *)(v25 + 16);
        unint64_t v26 = *(void *)(v25 + 24);
        if (v27 >= v26 >> 1)
        {
          sub_22A2FC090(v26 > 1, v27 + 1, 1);
          uint64_t v25 = v44;
        }
        *(void *)(v25 + 16) = v27 + 1;
        v24((char *)(v25 + v35 + v27 * v43), v41, v16);
        uint64_t v44 = v25;
        a2 = v42;
        goto LABEL_4;
      }
      a2 = v42;
      if (v22 != 1) {
        break;
      }
    }
LABEL_3:
    swift_bridgeObjectRelease();
    uint64_t v10 = v17;
    uint64_t v5 = v16;
    (*v34)(v17, v16);
LABEL_4:
    if (++v12 == v39) {
      return v44;
    }
  }
  long long v28 = v33;
  uint64_t v29 = 1;
  while (1)
  {
    uint64_t v30 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (*(v28 - 1) == v20 && *v28 == v21) {
      goto LABEL_17;
    }
    uint64_t result = sub_22A3060C0();
    if (result) {
      goto LABEL_17;
    }
    v28 += 2;
    ++v29;
    BOOL v23 = v30 == v22;
    a2 = v42;
    if (v23) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_22A2FD714()
{
  unint64_t result = qword_268371B98;
  if (!qword_268371B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371B98);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for USOIdentifierNamespace(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for USOIdentifierNamespace(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22A2FD8C4);
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

ValueMetadata *type metadata accessor for USOIdentifierNamespace()
{
  return &type metadata for USOIdentifierNamespace;
}

uint64_t getWorkoutEntity(from:)()
{
  sub_22A305090();
  sub_22A2FDB1C((uint64_t)v6, (uint64_t)v4);
  if (v5)
  {
    sub_22A2FDB1C((uint64_t)v4, (uint64_t)v3);
    sub_22A305210();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_22A305000();
LABEL_10:
      swift_release_n();
      sub_22A2FDB84((uint64_t)v6);
      uint64_t v0 = v2;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
      goto LABEL_11;
    }
    sub_22A305190();
    if (swift_dynamicCast()
      || (sub_22A3051D0(), swift_dynamicCast())
      || (sub_22A305240(), swift_dynamicCast()))
    {
      swift_retain();
      sub_22A305530();
      goto LABEL_10;
    }
    sub_22A305200();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_22A305160();
      goto LABEL_10;
    }
    sub_22A305250();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_22A3054A0();
      goto LABEL_10;
    }
    sub_22A305220();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_22A304EC0();
      goto LABEL_10;
    }
    sub_22A2FDB84((uint64_t)v6);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  }
  else
  {
    sub_22A2FDB84((uint64_t)v6);
  }
  uint64_t v0 = 0;
LABEL_11:
  sub_22A2FDB84((uint64_t)v4);
  return v0;
}

uint64_t sub_22A2FDB1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371B80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A2FDB84(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371B80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getHealthLogEntity(from:)()
{
  sub_22A305090();
  sub_22A2FDB1C((uint64_t)v6, (uint64_t)v4);
  if (v5)
  {
    sub_22A2FDB1C((uint64_t)v4, (uint64_t)v3);
    sub_22A3053F0();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_22A305000();
LABEL_11:
      swift_release_n();
      sub_22A2FDB84((uint64_t)v6);
      uint64_t v0 = v2;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
      goto LABEL_12;
    }
    sub_22A304EE0();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_22A3058A0();
      goto LABEL_11;
    }
    sub_22A305230();
    if (swift_dynamicCast() || (sub_22A3057E0(), swift_dynamicCast()))
    {
      swift_retain();
      sub_22A305160();
      goto LABEL_11;
    }
    sub_22A2FDB84((uint64_t)v6);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  }
  else
  {
    sub_22A2FDB84((uint64_t)v6);
  }
  uint64_t v0 = 0;
LABEL_12:
  sub_22A2FDB84((uint64_t)v4);
  return v0;
}

uint64_t getAppEntity(from:)()
{
  sub_22A305090();
  sub_22A2FDB1C((uint64_t)v6, (uint64_t)v4);
  if (v5)
  {
    sub_22A2FDB1C((uint64_t)v4, (uint64_t)v3);
    sub_22A305210();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_22A305000();
      goto LABEL_10;
    }
    sub_22A305190();
    if (swift_dynamicCast()
      || (sub_22A3051D0(), swift_dynamicCast())
      || (sub_22A305240(), swift_dynamicCast()))
    {
      swift_retain();
      sub_22A305530();
      goto LABEL_10;
    }
    sub_22A305200();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_22A305160();
      goto LABEL_10;
    }
    sub_22A305250();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_22A3054A0();
      goto LABEL_10;
    }
    sub_22A305220();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_22A304EC0();
LABEL_10:
      swift_release();
      if (v2)
      {
        uint64_t v0 = sub_22A304F90();
        swift_release();
        swift_release();
        sub_22A2FDB84((uint64_t)v6);
      }
      else
      {
        sub_22A2FDB84((uint64_t)v6);
        swift_release();
        uint64_t v0 = 0;
      }
      goto LABEL_13;
    }
    sub_22A305100();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_22A304EC0();
      swift_release_n();
      sub_22A2FDB84((uint64_t)v6);
      uint64_t v0 = v2;
LABEL_13:
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
      goto LABEL_14;
    }
    sub_22A2FDB84((uint64_t)v6);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  }
  else
  {
    sub_22A2FDB84((uint64_t)v6);
  }
  uint64_t v0 = 0;
LABEL_14:
  sub_22A2FDB84((uint64_t)v4);
  return v0;
}

unint64_t HealthApps.rawValue.getter(char a1)
{
  unint64_t result = 0xD00000000000002ALL;
  switch(a1)
  {
    case 1:
    case 9:
      unint64_t result = 0xD000000000000019;
      break;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
    case 7:
      unint64_t result = 0x6C7070612E6D6F63;
      break;
    case 4:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 5:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 6:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    case 10:
      unint64_t result = 0xD000000000000011;
      break;
    case 11:
      unint64_t result = 0xD000000000000010;
      break;
    case 12:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 13:
      unint64_t result = 0xD00000000000003FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22A2FE19C(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371BC8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v29 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v5)
  {
    v24[1] = v1;
    uint64_t v35 = MEMORY[0x263F8EE78];
    sub_22A305FA0();
    uint64_t result = sub_22A2FEF50(a1);
    uint64_t v8 = result;
    uint64_t v9 = 0;
    uint64_t v10 = a1 + 64;
    uint64_t v25 = a1 + 80;
    uint64_t v26 = v5;
    uint64_t v27 = v7;
    uint64_t v28 = a1 + 64;
    uint64_t v11 = (uint64_t)v29;
    while ((v8 & 0x8000000000000000) == 0 && v8 < 1 << *(unsigned char *)(a1 + 32))
    {
      unint64_t v13 = (unint64_t)v8 >> 6;
      if ((*(void *)(v10 + 8 * ((unint64_t)v8 >> 6)) & (1 << v8)) == 0) {
        goto LABEL_22;
      }
      if (*(_DWORD *)(a1 + 36) != v7) {
        goto LABEL_23;
      }
      uint64_t v30 = v9;
      uint64_t v31 = 1 << v8;
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 16 * v8 + 8);
      uint64_t v15 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v8);
      uint64_t v16 = v15[1];
      uint64_t v34 = *v15;
      uint64_t v32 = v16;
      sub_22A305B60();
      swift_allocObject();
      uint64_t v33 = v14;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_22A305B50();
      sub_22A305D40();
      uint64_t v17 = sub_22A305B10();
      uint64_t v18 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
      v18(v11, 0, 1, v17);
      sub_22A305B30();
      swift_release();
      sub_22A2FEEF0(v11);
      sub_22A305D40();
      v18(v11, 0, 1, v17);
      sub_22A305B20();
      swift_release();
      sub_22A2FEEF0(v11);
      sub_22A305B40();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      sub_22A305F80();
      sub_22A305FB0();
      sub_22A305FC0();
      uint64_t result = sub_22A305F90();
      int64_t v12 = 1 << *(unsigned char *)(a1 + 32);
      if (v8 >= v12) {
        goto LABEL_24;
      }
      uint64_t v10 = v28;
      uint64_t v19 = *(void *)(v28 + 8 * v13);
      if ((v19 & v31) == 0) {
        goto LABEL_25;
      }
      LODWORD(v7) = v27;
      if (*(_DWORD *)(a1 + 36) != v27) {
        goto LABEL_26;
      }
      unint64_t v20 = v19 & (-2 << (v8 & 0x3F));
      if (v20)
      {
        int64_t v12 = __clz(__rbit64(v20)) | v8 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        unint64_t v21 = v13 + 1;
        unint64_t v22 = (unint64_t)(v12 + 63) >> 6;
        if (v13 + 1 < v22)
        {
          unint64_t v23 = *(void *)(v28 + 8 * v21);
          if (v23)
          {
LABEL_18:
            int64_t v12 = __clz(__rbit64(v23)) + (v21 << 6);
          }
          else
          {
            while (v22 - 2 != v13)
            {
              unint64_t v23 = *(void *)(v25 + 8 * v13++);
              if (v23)
              {
                unint64_t v21 = v13 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      uint64_t v9 = v30 + 1;
      uint64_t v8 = v12;
      if (v30 + 1 == v26) {
        return v35;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  return result;
}

id getApplicationState(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22A305C80();
  MEMORY[0x270FA5388](v4);
  id v5 = objc_allocWithZone(MEMORY[0x263F01878]);
  swift_bridgeObjectRetain();
  id v6 = sub_22A2FEE14(a1, a2, 0);
  id v7 = objc_msgSend(v6, sel_applicationState);

  return v7;
}

Swift::Bool __swiftcall appBundleIsInstalled(_:)(Swift::String a1)
{
  return sub_22A2FE8A4(a1._countAndFlagsBits, (uint64_t)a1._object, (SEL *)&selRef_isInstalled);
}

Swift::Bool __swiftcall appBundleIsRestricted(_:)(Swift::String a1)
{
  return sub_22A2FE8A4(a1._countAndFlagsBits, (uint64_t)a1._object, (SEL *)&selRef_isRestricted);
}

id sub_22A2FE8A4(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v4 = getApplicationState(_:)(a1, a2);
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  if (objc_msgSend(v4, sel_isValid)) {
    id v6 = [v5 *a3];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

uint64_t HealthApps.app.getter(char a1)
{
  return sub_22A305B70();
}

uint64_t HealthApps.sirikitApp.getter(char a1)
{
  return SirikitApp.init(_:)();
}

uint64_t SirikitApp.init(_:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371BC8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = &v8[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22A305B90();
  swift_bridgeObjectRetain();
  sub_22A305B70();
  uint64_t v3 = (void *)sub_22A304C60();
  swift_release();
  if (v3 && (id v4 = objc_msgSend(v3, sel_appNameMap), v3, v4))
  {
    uint64_t v5 = sub_22A305CD0();

    sub_22A2FE19C(v5);
    swift_bridgeObjectRelease();
    sub_22A305AE0();
    swift_allocObject();
    sub_22A305AD0();
    sub_22A305D40();
    swift_bridgeObjectRelease();
    uint64_t v6 = sub_22A305B10();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v2, 0, 1, v6);
    sub_22A305AC0();
    swift_release();
    sub_22A2FEEF0((uint64_t)v2);
    sub_22A305AB0();
    swift_release();
    swift_bridgeObjectRelease();
    return sub_22A305AF0();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

id HealthApps.isInstalled.getter(char a1)
{
  return sub_22A2FEB84(a1, (SEL *)&selRef_isInstalled);
}

id HealthApps.isRestricted.getter(char a1)
{
  return sub_22A2FEB84(a1, (SEL *)&selRef_isRestricted);
}

id sub_22A2FEB84(char a1, SEL *a2)
{
  unint64_t v3 = HealthApps.rawValue.getter(a1);
  id v5 = getApplicationState(_:)(v3, v4);
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v6 = v5;
  if ((objc_msgSend(v5, sel_isValid) & 1) == 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  id v7 = [v6 *a2];
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t sub_22A2FEC14(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = HealthApps.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == HealthApps.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_22A3060C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22A2FECA0()
{
  char v1 = *v0;
  sub_22A306140();
  HealthApps.rawValue.getter(v1);
  sub_22A305D50();
  swift_bridgeObjectRelease();
  return sub_22A306160();
}

uint64_t sub_22A2FED04()
{
  HealthApps.rawValue.getter(*v0);
  sub_22A305D50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22A2FED58()
{
  char v1 = *v0;
  sub_22A306140();
  HealthApps.rawValue.getter(v1);
  sub_22A305D50();
  swift_bridgeObjectRelease();
  return sub_22A306160();
}

uint64_t sub_22A2FEDB8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s18HealthDomainsTools0A4AppsO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_22A2FEDE8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = HealthApps.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_22A2FEE14(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_22A305D10();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_22A304870();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_22A2FEEF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371BC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22A2FEF50(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t _s18HealthDomainsTools0A4AppsO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_22A306080();
  swift_bridgeObjectRelease();
  if (v0 >= 0xE) {
    return 14;
  }
  else {
    return v0;
  }
}

unint64_t sub_22A2FF028()
{
  unint64_t result = qword_268371BD0;
  if (!qword_268371BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371BD0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HealthApps(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HealthApps(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *unint64_t result = a2 + 13;
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
        JUMPOUT(0x22A2FF1D8);
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
          *unint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthApps()
{
  return &type metadata for HealthApps;
}

uint64_t LaunchAppFlow.init(app:)@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_22A304AF0();
  *(unsigned char *)(a2 + 40) = a1;
  return result;
}

uint64_t LaunchAppFlow.init(aceService:app:)@<X0>(long long *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_22A2E2A30(a1, a3);
  *(unsigned char *)(a3 + 40) = a2;
  return result;
}

id sub_22A2FF26C()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F647B0]), sel_init);
  HealthApps.rawValue.getter(*(unsigned char *)(v0 + 40));
  int v2 = (void *)sub_22A305D10();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setLaunchId_, v2);

  __swift_project_boxed_opaque_existential_1((void *)v0, *(void *)(v0 + 24));
  id v3 = v1;
  sub_22A304CA0();
  if (v4)
  {
    uint64_t v5 = (void *)sub_22A305D10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  objc_msgSend(v3, sel_setRefId_, v5);

  return v3;
}

uint64_t LaunchAppFlow.on(input:)()
{
  return 1;
}

uint64_t LaunchAppFlow.execute(completion:)()
{
  sub_22A2FF3A4();
  return sub_22A304A10();
}

unint64_t sub_22A2FF3A4()
{
  unint64_t result = qword_268371BD8;
  if (!qword_268371BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371BD8);
  }
  return result;
}

uint64_t LaunchAppFlow.execute()(uint64_t a1)
{
  v2[28] = a1;
  v2[29] = v1;
  uint64_t v3 = sub_22A305C80();
  v2[30] = v3;
  v2[31] = *(void *)(v3 - 8);
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22A2FF4D4, 0, 0);
}

uint64_t sub_22A2FF4D4()
{
  uint64_t v26 = v0;
  if (qword_268371458 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 232);
  uint64_t v5 = __swift_project_value_buffer(v2, (uint64_t)static Logger.common);
  *(void *)(v0 + 280) = v5;
  swift_beginAccess();
  unsigned int v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(void *)(v0 + 288) = v6;
  *(void *)(v0 + 296) = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v5, v2);
  sub_22A2FFF6C(v4, v0 + 16);
  BOOL v7 = sub_22A305C60();
  os_log_type_t v8 = sub_22A305E40();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = *(void *)(v0 + 272);
  uint64_t v11 = *(void *)(v0 + 240);
  uint64_t v12 = *(void *)(v0 + 248);
  if (v9)
  {
    unint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = v14;
    *(_DWORD *)unint64_t v13 = 136315138;
    unint64_t v15 = HealthApps.rawValue.getter(*(unsigned char *)(v0 + 56));
    *(void *)(v0 + 216) = sub_22A2E2200(v15, v16, &v25);
    sub_22A305ED0();
    swift_bridgeObjectRelease();
    sub_22A2FFFD8(v0 + 16);
    _os_log_impl(&dword_22A2DE000, v7, v8, "Launching app : %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v14, -1, -1);
    MEMORY[0x22A6C55A0](v13, -1, -1);

    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(v10, v11);
  }
  else
  {
    sub_22A2FFFD8(v0 + 16);

    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(v10, v11);
  }
  *(void *)(v0 + 304) = v17;
  uint64_t v18 = *(void **)(v0 + 232);
  uint64_t v19 = v18[3];
  uint64_t v20 = v18[4];
  __swift_project_boxed_opaque_existential_1(v18, v19);
  id v21 = sub_22A2FF26C();
  *(void *)(v0 + 312) = v21;
  unint64_t v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 320) = v22;
  unint64_t v23 = sub_22A2E3AC8();
  *unint64_t v22 = v0;
  v22[1] = sub_22A2FF7B0;
  return MEMORY[0x270F67CE0](v21, v19, v23, v20);
}

uint64_t sub_22A2FF7B0(void *a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 328) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_22A2FFB00;
  }
  else
  {
    unsigned int v6 = *(void **)(v4 + 312);

    uint64_t v5 = sub_22A2FF8DC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_22A2FF8DC()
{
  uint64_t v17 = v0;
  uint64_t v1 = *(void *)(v0 + 232);
  (*(void (**)(void, void, void))(v0 + 288))(*(void *)(v0 + 264), *(void *)(v0 + 280), *(void *)(v0 + 240));
  sub_22A2FFF6C(v1, v0 + 112);
  uint64_t v2 = sub_22A305C60();
  os_log_type_t v3 = sub_22A305E40();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v14 = *(void *)(v0 + 264);
    unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
    uint64_t v13 = *(void *)(v0 + 240);
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v16 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    unint64_t v6 = HealthApps.rawValue.getter(*(unsigned char *)(v0 + 152));
    *(void *)(v0 + 184) = sub_22A2E2200(v6, v7, &v16);
    sub_22A305ED0();
    swift_bridgeObjectRelease();
    sub_22A2FFFD8(v0 + 112);
    _os_log_impl(&dword_22A2DE000, v2, v3, "App launch submitted : %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v5, -1, -1);
    MEMORY[0x22A6C55A0](v4, -1, -1);

    v15(v14, v13);
  }
  else
  {
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
    uint64_t v9 = *(void *)(v0 + 264);
    uint64_t v10 = *(void *)(v0 + 240);
    sub_22A2FFFD8(v0 + 112);

    v8(v9, v10);
  }
  sub_22A304C30();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_22A2FFB00()
{
  uint64_t v43 = v0;
  uint64_t v1 = v0 + 112;
  uint64_t v2 = *(void **)(v0 + 328);
  os_log_type_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 288);
  uint64_t v4 = *(void *)(v0 + 280);
  uint64_t v5 = *(void *)(v0 + 256);
  uint64_t v7 = *(void *)(v0 + 232);
  uint64_t v6 = *(void *)(v0 + 240);

  v3(v5, v4, v6);
  sub_22A2FFF6C(v7, v0 + 64);
  id v8 = v2;
  id v9 = v2;
  uint64_t v10 = sub_22A305C60();
  os_log_type_t v11 = sub_22A305E50();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = *(void **)(v0 + 328);
    uint64_t v39 = *(void *)(v0 + 256);
    uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
    uint64_t v38 = *(void *)(v0 + 240);
    uint64_t v13 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v14 = v42;
    *(_DWORD *)uint64_t v13 = 136315394;
    unint64_t v15 = HealthApps.rawValue.getter(*(unsigned char *)(v0 + 104));
    *(void *)(v0 + 192) = sub_22A2E2200(v15, v16, &v42);
    sub_22A305ED0();
    swift_bridgeObjectRelease();
    sub_22A2FFFD8(v0 + 64);
    *(_WORD *)(v13 + 12) = 2080;
    *(void *)(v0 + 200) = v12;
    id v17 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268371830);
    uint64_t v18 = sub_22A305D30();
    *(void *)(v0 + 208) = sub_22A2E2200(v18, v19, &v42);
    sub_22A305ED0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22A2DE000, v10, v11, "Error launching app %s: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    uint64_t v20 = v14;
    uint64_t v1 = v0 + 112;
    MEMORY[0x22A6C55A0](v20, -1, -1);
    MEMORY[0x22A6C55A0](v13, -1, -1);

    v40(v39, v38);
  }
  else
  {
    id v21 = *(void **)(v0 + 328);
    unint64_t v22 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
    uint64_t v23 = *(void *)(v0 + 256);
    uint64_t v24 = *(void *)(v0 + 240);

    sub_22A2FFFD8(v0 + 64);
    v22(v23, v24);
  }
  uint64_t v25 = *(void *)(v0 + 232);
  (*(void (**)(void, void, void))(v0 + 288))(*(void *)(v0 + 264), *(void *)(v0 + 280), *(void *)(v0 + 240));
  sub_22A2FFF6C(v25, v1);
  uint64_t v26 = sub_22A305C60();
  os_log_type_t v27 = sub_22A305E40();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
  uint64_t v30 = *(void *)(v0 + 264);
  uint64_t v31 = *(void *)(v0 + 240);
  if (v28)
  {
    uint64_t v41 = *(void *)(v0 + 240);
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v42 = v33;
    *(_DWORD *)uint64_t v32 = 136315138;
    unint64_t v34 = HealthApps.rawValue.getter(*(unsigned char *)(v0 + 152));
    *(void *)(v0 + 184) = sub_22A2E2200(v34, v35, &v42);
    sub_22A305ED0();
    swift_bridgeObjectRelease();
    sub_22A2FFFD8(v1);
    _os_log_impl(&dword_22A2DE000, v26, v27, "App launch submitted : %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v33, -1, -1);
    MEMORY[0x22A6C55A0](v32, -1, -1);

    v29(v30, v41);
  }
  else
  {
    sub_22A2FFFD8(v1);

    v29(v30, v31);
  }
  sub_22A304C30();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
  return v36();
}

uint64_t sub_22A2FFF6C(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  *(unsigned char *)(a2 + 40) = *(unsigned char *)(a1 + 40);
  return a2;
}

uint64_t sub_22A2FFFD8(uint64_t a1)
{
  return a1;
}

uint64_t sub_22A300000(uint64_t a1)
{
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *os_log_type_t v3 = v1;
  v3[1] = sub_22A2E37B4;
  return LaunchAppFlow.execute()(a1);
}

uint64_t SACommandFlow.init(closure:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, void *a2@<X8>)
{
  sub_22A304AF0();
  sub_22A2E3A24((uint64_t)v7, (uint64_t)a2);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v4 = sub_22A304CA0();
  uint64_t v5 = a1(v4);
  swift_bridgeObjectRelease();
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  a2[5] = v5;
  return result;
}

uint64_t SACommandFlow.init(aceService:closure:)@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, void *a3@<X8>)
{
  sub_22A2E3A24(a1, (uint64_t)a3);
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  uint64_t v6 = sub_22A304CA0();
  uint64_t v7 = a2(v6);
  swift_bridgeObjectRelease();
  uint64_t result = __swift_destroy_boxed_opaque_existential_0(a1);
  a3[5] = v7;
  return result;
}

uint64_t SACommandFlow.execute(completion:)()
{
  sub_22A300DCC();
  return sub_22A304A10();
}

uint64_t SACommandFlow.execute()(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v3 = sub_22A305C80();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22A3002F8, 0, 0);
}

uint64_t sub_22A3002F8()
{
  if (qword_268371458 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)static Logger.common);
  v0[13] = v4;
  swift_beginAccess();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[14] = v5;
  v0[15] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = sub_22A305C60();
  os_log_type_t v7 = sub_22A305E40();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_22A2DE000, v6, v7, "Sending command", v8, 2u);
    MEMORY[0x22A6C55A0](v8, -1, -1);
  }
  uint64_t v9 = v0[12];
  uint64_t v10 = v0[8];
  uint64_t v11 = v0[9];
  uint64_t v12 = (void *)v0[7];

  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[16] = v13;
  v0[17] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v9, v10);
  uint64_t v15 = v12[3];
  uint64_t v14 = v12[4];
  __swift_project_boxed_opaque_existential_1(v12, v15);
  uint64_t v16 = v12[5];
  id v17 = (void *)swift_task_alloc();
  v0[18] = v17;
  unint64_t v18 = sub_22A2E3AC8();
  *id v17 = v0;
  v17[1] = sub_22A3004FC;
  return MEMORY[0x270F67CE0](v16, v15, v18, v14);
}

uint64_t sub_22A3004FC(void *a1)
{
  *(void *)(*(void *)v2 + 152) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_22A30074C;
  }
  else
  {

    uint64_t v4 = sub_22A300618;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_22A300618()
{
  (*(void (**)(void, void, void))(v0 + 112))(*(void *)(v0 + 88), *(void *)(v0 + 104), *(void *)(v0 + 64));
  uint64_t v1 = sub_22A305C60();
  os_log_type_t v2 = sub_22A305E40();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_22A2DE000, v1, v2, "command submitted", v3, 2u);
    MEMORY[0x22A6C55A0](v3, -1, -1);
  }
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 64);

  v4(v5, v6);
  sub_22A304C30();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_22A30074C()
{
  uint64_t v1 = *(void **)(v0 + 152);
  (*(void (**)(void, void, void))(v0 + 112))(*(void *)(v0 + 80), *(void *)(v0 + 104), *(void *)(v0 + 64));
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_22A305C60();
  os_log_type_t v5 = sub_22A305E50();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 152);
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    id v8 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v10;
    sub_22A305ED0();
    *id v8 = v10;

    _os_log_impl(&dword_22A2DE000, v4, v5, "Error sending command %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683718C8);
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v8, -1, -1);
    MEMORY[0x22A6C55A0](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 152);
  }
  (*(void (**)(void, void))(v0 + 128))(*(void *)(v0 + 80), *(void *)(v0 + 64));
  (*(void (**)(void, void, void))(v0 + 112))(*(void *)(v0 + 88), *(void *)(v0 + 104), *(void *)(v0 + 64));
  uint64_t v12 = sub_22A305C60();
  os_log_type_t v13 = sub_22A305E40();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_22A2DE000, v12, v13, "command submitted", v14, 2u);
    MEMORY[0x22A6C55A0](v14, -1, -1);
  }
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
  uint64_t v16 = *(void *)(v0 + 88);
  uint64_t v17 = *(void *)(v0 + 64);

  v15(v16, v17);
  sub_22A304C30();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_22A3009EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *os_log_type_t v7 = v3;
  v7[1] = sub_22A2E7AB0;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t sub_22A300A9C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22A300FD0;
  return SACommandFlow.execute()(a1);
}

uint64_t closeAppFlow(app:)@<X0>(char a1@<W0>, void *a2@<X8>)
{
  sub_22A304AF0();
  sub_22A2E3A24((uint64_t)v8, (uint64_t)a2);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v4 = sub_22A304CA0();
  id v6 = sub_22A300BC8(v4, v5, a1);
  swift_bridgeObjectRelease();
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  a2[5] = v6;
  return result;
}

id sub_22A300BC8(uint64_t a1, void *a2, char a3)
{
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F647B8]), sel_init);
  HealthApps.rawValue.getter(a3);
  id v6 = (void *)sub_22A305D10();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setAppBundleId_, v6);

  os_log_type_t v7 = (void *)sub_22A305D10();
  objc_msgSend(v5, sel_setSceneId_, v7);

  id v8 = v5;
  if (a2) {
    a2 = (void *)sub_22A305D10();
  }
  objc_msgSend(v5, sel_setRefId_, a2);

  return v5;
}

uint64_t openAppFlow(app:)@<X0>(void *a1@<X8>)
{
  sub_22A304AF0();
  sub_22A2E3A24((uint64_t)v9, (uint64_t)a1);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22A304CA0();
  uint64_t v3 = v2;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F647B0]), sel_init);
  id v5 = (void *)sub_22A305D10();
  objc_msgSend(v4, sel_setLaunchId_, v5);

  id v6 = v4;
  if (v3) {
    os_log_type_t v7 = (void *)sub_22A305D10();
  }
  else {
    os_log_type_t v7 = 0;
  }
  objc_msgSend(v4, sel_setRefId_, v7);
  swift_bridgeObjectRelease();

  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  a1[5] = v4;
  return result;
}

unint64_t sub_22A300DCC()
{
  unint64_t result = qword_268371BE8;
  if (!qword_268371BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268371BE8);
  }
  return result;
}

uint64_t initializeWithCopy for LaunchAppFlow(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t assignWithCopy for LaunchAppFlow(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
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

uint64_t assignWithTake for LaunchAppFlow(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for LaunchAppFlow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LaunchAppFlow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchAppFlow()
{
  return &type metadata for LaunchAppFlow;
}

ValueMetadata *type metadata accessor for SACommandFlow()
{
  return &type metadata for SACommandFlow;
}

uint64_t static UsoEntity_common_WorkoutInstructor.builder(name:)(uint64_t a1, uint64_t a2)
{
  sub_22A305890();
  swift_allocObject();
  uint64_t v3 = sub_22A305880();
  if (a2) {
    sub_22A305870();
  }
  return v3;
}

uint64_t static UsoEntity_common_WorkoutInstructor.with(name:)(uint64_t a1, uint64_t a2)
{
  sub_22A305890();
  swift_allocObject();
  uint64_t v3 = sub_22A305880();
  if (a2) {
    sub_22A305870();
  }
  MEMORY[0x22A6C3FC0](v3);
  sub_22A305550();
  sub_22A305130();
  swift_release();
  swift_release();
  return v5;
}

uint64_t OutputFlow.init(templatingResult:snippets:flowConfig:rrEntities:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = (int *)type metadata accessor for OutputFlow();
  uint64_t v11 = v10[7];
  sub_22A2E3918(a1, a5);
  *(void *)(a5 + v10[5]) = a2;
  sub_22A2E3A24(a3, a5 + v10[6]);
  *(void *)(a5 + v11) = a4;
  sub_22A305BF0();
  uint64_t v12 = sub_22A305BE0();
  __swift_destroy_boxed_opaque_existential_0(a3);
  uint64_t result = sub_22A2E2868(a1, &qword_268371828);
  *(void *)(a5 + v10[8]) = v12;
  return result;
}

uint64_t type metadata accessor for OutputFlow()
{
  uint64_t result = qword_268371C30;
  if (!qword_268371C30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t OutputFlow.on(input:)()
{
  return 1;
}

uint64_t OutputFlow.execute(completion:)(void (*a1)(char *), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  uint64_t v4 = sub_22A304C50();
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v38 = v4;
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22A305C80();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_268371C18);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v36 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371828);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22A304C70();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  unint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A2E3918(v3, (uint64_t)v15);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22A2E2868((uint64_t)v15, &qword_268371828);
    if (qword_268371458 != -1) {
      swift_once();
    }
    uint64_t v20 = __swift_project_value_buffer(v7, (uint64_t)static Logger.common);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v20, v7);
    id v21 = sub_22A305C60();
    os_log_type_t v22 = sub_22A305E50();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_22A2DE000, v21, v22, "Received error in TemplatingResult", v23, 2u);
      MEMORY[0x22A6C55A0](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_22A304C30();
    v39(v6);
    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v6, v38);
  }
  else
  {
    uint64_t v37 = v17;
    uint64_t v38 = v16;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
    uint64_t v25 = type metadata accessor for OutputFlow();
    uint64_t v26 = (void *)(v3 + *(int *)(v25 + 24));
    uint64_t v27 = v26[3];
    uint64_t v28 = v26[4];
    __swift_project_boxed_opaque_existential_1(v26, v27);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v28 + 8))(v41, v27, v28);
    __swift_project_boxed_opaque_existential_1(v41, v42);
    sub_22A304B10();
    sub_22A304BC0();
    swift_allocObject();
    sub_22A304BB0();
    __swift_project_boxed_opaque_existential_1(v41, v42);
    sub_22A304B10();
    uint64_t v29 = (void *)sub_22A304BA0();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v41);
    if (*(void *)(v3 + *(int *)(v25 + 28)))
    {
      uint64_t v30 = sub_22A305CA0();
      uint64_t v31 = (uint64_t)v36;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v36, 1, 1, v30);
      sub_22A305BD0();
      sub_22A2E2868(v31, qword_268371C18);
    }
    uint64_t v32 = v26[3];
    uint64_t v33 = v26[4];
    __swift_project_boxed_opaque_existential_1(v26, v32);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v33 + 16))(v41, v32, v33);
    __swift_project_boxed_opaque_existential_1(v41, v42);
    uint64_t v34 = swift_allocObject();
    uint64_t v35 = v40;
    *(void *)(v34 + 16) = v39;
    *(void *)(v34 + 24) = v35;
    sub_22A2E3AC8();
    swift_retain();
    sub_22A304C90();

    swift_release();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v19, v38);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v41);
  }
}

uint64_t sub_22A3017E8(uint64_t a1, void (*a2)(char *))
{
  uint64_t v3 = sub_22A304C50();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A304C30();
  a2(v6);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t OutputFlow.getReferenceResolutionClient_ForTesting()()
{
  type metadata accessor for OutputFlow();
  return swift_retain();
}

uint64_t sub_22A3018F8(uint64_t a1, char a2)
{
  uint64_t v3 = sub_22A305C80();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if (qword_268371458 != -1) {
      swift_once();
    }
    uint64_t v8 = __swift_project_value_buffer(v3, (uint64_t)static Logger.common);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v8, v3);
    uint64_t v9 = sub_22A305C60();
    os_log_type_t v10 = sub_22A305E50();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_22A2DE000, v9, v10, "Failed to donate entities to Siri Reference Resolution", v11, 2u);
      MEMORY[0x22A6C55A0](v11, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  return result;
}

uint64_t sub_22A301AA8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A301AE0(uint64_t a1)
{
  return sub_22A3017E8(a1, *(void (**)(char *))(v1 + 16));
}

id *initializeBufferWithCopyOfBuffer for OutputFlow(id *a1, id *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = (char *)*a2;
    *a1 = *a2;
    uint64_t v4 = (id *)&v9[(v5 + 16) & ~(unint64_t)v5];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268371828);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      id v7 = *a2;
      id v8 = *a2;
      *uint64_t v4 = v7;
    }
    else
    {
      uint64_t v10 = sub_22A304C70();
      (*(void (**)(id *, id *, uint64_t))(*(void *)(v10 - 8) + 16))(v4, a2, v10);
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[6];
    *(id *)((char *)v4 + a3[5]) = *(id *)((char *)a2 + a3[5]);
    uint64_t v12 = (char *)v4 + v11;
    uint64_t v13 = (char *)a2 + v11;
    long long v14 = *(_OWORD *)((char *)a2 + v11 + 24);
    *(_OWORD *)((char *)v4 + v11 + 24) = v14;
    uint64_t v15 = v14;
    uint64_t v16 = **(void (***)(char *, char *, uint64_t))(v14 - 8);
    swift_bridgeObjectRetain();
    v16(v12, v13, v15);
    uint64_t v17 = a3[8];
    *(id *)((char *)v4 + a3[7]) = *(id *)((char *)a2 + a3[7]);
    *(id *)((char *)v4 + v17) = *(id *)((char *)a2 + v17);
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for OutputFlow(id *a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268371828);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
  }
  else
  {
    uint64_t v4 = sub_22A304C70();
    (*(void (**)(id *, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1 + *(int *)(a2 + 24));
  swift_bridgeObjectRelease();
  return swift_release();
}

void *initializeWithCopy for OutputFlow(void *a1, id *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268371828);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    id v6 = *a2;
    id v7 = *a2;
    *a1 = v6;
  }
  else
  {
    uint64_t v8 = sub_22A304C70();
    (*(void (**)(void *, id *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = a3[6];
  *(void *)((char *)a1 + a3[5]) = *(id *)((char *)a2 + a3[5]);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  long long v12 = *(_OWORD *)((char *)a2 + v9 + 24);
  *(_OWORD *)((char *)a1 + v9 + 24) = v12;
  uint64_t v13 = v12;
  long long v14 = **(void (***)(char *, char *, uint64_t))(v12 - 8);
  swift_bridgeObjectRetain();
  v14(v10, v11, v13);
  uint64_t v15 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(id *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v15) = *(id *)((char *)a2 + v15);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

id *assignWithCopy for OutputFlow(id *a1, id *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_22A2E2868((uint64_t)a1, &qword_268371828);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268371828);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      id v6 = *a2;
      id v7 = *a2;
      *a1 = v6;
    }
    else
    {
      uint64_t v8 = sub_22A304C70();
      (*(void (**)(id *, id *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  *(id *)((char *)a1 + a3[5]) = *(id *)((char *)a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + a3[6]), (uint64_t *)((char *)a2 + a3[6]));
  *(id *)((char *)a1 + a3[7]) = *(id *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(id *)((char *)a1 + a3[8]) = *(id *)((char *)a2 + a3[8]);
  swift_retain();
  swift_release();
  return a1;
}

char *initializeWithTake for OutputFlow(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371828);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_22A304C70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  long long v11 = *((_OWORD *)v10 + 1);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v11;
  *((void *)v9 + 4) = *((void *)v10 + 4);
  uint64_t v12 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  return a1;
}

char *assignWithTake for OutputFlow(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_22A2E2868((uint64_t)a1, &qword_268371828);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371828);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_22A304C70();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[6];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&a1[v8]);
  long long v11 = *((_OWORD *)v10 + 1);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v11;
  *((void *)v9 + 4) = *((void *)v10 + 4);
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for OutputFlow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22A30222C);
}

uint64_t sub_22A30222C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371828);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for OutputFlow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22A302304);
}

uint64_t sub_22A302304(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268371828);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

void sub_22A3023C4()
{
  sub_22A302480();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22A302480()
{
  if (!qword_268371C40)
  {
    sub_22A304C70();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268371830);
    unint64_t v0 = sub_22A306170();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268371C40);
    }
  }
}

uint64_t AppPunchOutFlow.init(aceService:url:instrumentationTask:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v19 = a4;
  uint64_t v9 = sub_22A304890();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A2E3A24(a1, a5);
  uint64_t v13 = (int *)type metadata accessor for AppPunchOutFlow();
  long long v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v14(a5 + v13[5], a2, v9);
  uint64_t v15 = (void *)(a5 + v13[6]);
  uint64_t v16 = v19;
  *uint64_t v15 = a3;
  v15[1] = v16;
  sub_22A2E7940(0, &qword_268371C48);
  sub_22A2E3A24(a1, (uint64_t)v20);
  v14((uint64_t)v12, a2, v9);
  id v17 = SAUIAppPunchOut.init(aceService:url:)(v20, (uint64_t)v12);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  uint64_t result = __swift_destroy_boxed_opaque_existential_0(a1);
  *(void *)(a5 + v13[7]) = v17;
  return result;
}

uint64_t type metadata accessor for AppPunchOutFlow()
{
  uint64_t result = qword_268371C70;
  if (!qword_268371C70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AppPunchOutFlow.on(input:)()
{
  return 1;
}

uint64_t AppPunchOutFlow.execute(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371C50);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v42 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22A304BD0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v41 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AppPunchOutFlow();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22A305C80();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268371458 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v12, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  sub_22A302CC4(v3, (uint64_t)v11);
  uint64_t v17 = v13;
  uint64_t v18 = sub_22A305C60();
  os_log_type_t v19 = sub_22A305E40();
  if (os_log_type_enabled(v18, v19))
  {
    os_log_t v37 = v18;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v40 = v3;
    id v21 = (uint8_t *)v20;
    uint64_t v36 = swift_slowAlloc();
    v46[0] = v36;
    uint64_t v39 = v6;
    *(_DWORD *)id v21 = 136315138;
    uint64_t v35 = v21 + 4;
    sub_22A304890();
    uint64_t v38 = (void *)v12;
    sub_22A302EA4();
    uint64_t v22 = sub_22A3060A0();
    uint64_t v45 = sub_22A2E2200(v22, v23, v46);
    uint64_t v6 = v39;
    sub_22A305ED0();
    swift_bridgeObjectRelease();
    sub_22A302D28((uint64_t)v11);
    os_log_t v24 = v37;
    _os_log_impl(&dword_22A2DE000, v37, v19, "Punching out to: %s", v21, 0xCu);
    uint64_t v25 = v36;
    swift_arrayDestroy();
    MEMORY[0x22A6C55A0](v25, -1, -1);
    uint64_t v26 = v21;
    uint64_t v3 = v40;
    MEMORY[0x22A6C55A0](v26, -1, -1);

    (*(void (**)(char *, void *))(v17 + 8))(v15, v38);
  }
  else
  {
    sub_22A302D28((uint64_t)v11);

    (*(void (**)(char *, uint64_t))(v17 + 8))(v15, v12);
  }
  uint64_t v27 = (uint64_t *)(v3 + *(int *)(v9 + 24));
  if (v27[1])
  {
    uint64_t v39 = *v27;
    swift_bridgeObjectRetain();
    sub_22A304A90();
    uint64_t v40 = v48;
    uint64_t v38 = __swift_project_boxed_opaque_existential_1(v46, v47);
    sub_22A304AE0();
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v41, *MEMORY[0x263F6F988], v6);
    uint64_t v28 = *MEMORY[0x263F6F740];
    uint64_t v29 = sub_22A304AB0();
    uint64_t v30 = *(void *)(v29 - 8);
    uint64_t v31 = v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v30 + 104))(v42, v28, v29);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v31, 0, 1, v29);
    sub_22A304AC0();
    sub_22A304AA0();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v46);
  }
  sub_22A2E3A24(v3, (uint64_t)v46);
  __swift_project_boxed_opaque_existential_1(v46, v47);
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = v44;
  *(void *)(v32 + 16) = v43;
  *(void *)(v32 + 24) = v33;
  sub_22A2E7940(0, qword_268371838);
  swift_retain();
  sub_22A304C90();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v46);
}

uint64_t sub_22A302CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppPunchOutFlow();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A302D28(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppPunchOutFlow();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22A302D84(uint64_t a1, void (*a2)(char *))
{
  uint64_t v3 = sub_22A304C50();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A304C30();
  a2(v6);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_22A302E60()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A302E98(uint64_t a1)
{
  return sub_22A302D84(a1, *(void (**)(char *))(v1 + 16));
}

unint64_t sub_22A302EA4()
{
  unint64_t result = qword_268371C58[0];
  if (!qword_268371C58[0])
  {
    sub_22A304890();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268371C58);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for AppPunchOutFlow(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_22A304890();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = a3[7];
    uint64_t v14 = (void *)((char *)v4 + v12);
    uint64_t v15 = (uint64_t *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = *(void **)((char *)a2 + v13);
    *(void *)((char *)v4 + v13) = v17;
    swift_bridgeObjectRetain();
    id v18 = v17;
  }
  return v4;
}

void destroy for AppPunchOutFlow(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_22A304890();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 28));
}

uint64_t initializeWithCopy for AppPunchOutFlow(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22A304890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v11);
  uint64_t v14 = (void *)(a2 + v11);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = *(void **)(a2 + v12);
  *(void *)(a1 + v12) = v16;
  swift_bridgeObjectRetain();
  id v17 = v16;
  return a1;
}

uint64_t *assignWithCopy for AppPunchOutFlow(uint64_t *a1, uint64_t *a2, int *a3)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22A304890();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (uint64_t *)((char *)a1 + v10);
  uint64_t v12 = (uint64_t *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = *(void **)((char *)a2 + v13);
  uint64_t v15 = *(void **)((char *)a1 + v13);
  *(uint64_t *)((char *)a1 + v13) = (uint64_t)v14;
  id v16 = v14;

  return a1;
}

uint64_t initializeWithTake for AppPunchOutFlow(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22A304890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  return a1;
}

uint64_t assignWithTake for AppPunchOutFlow(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22A304890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  void *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[7];
  id v17 = *(void **)(a1 + v16);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppPunchOutFlow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22A3033F4);
}

uint64_t sub_22A3033F4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_22A304890();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AppPunchOutFlow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22A3034B8);
}

uint64_t sub_22A3034B8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22A304890();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22A303560()
{
  uint64_t result = sub_22A304890();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t SequenceFlow.flows.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SequenceFlow.flows.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 56) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*SequenceFlow.flows.modify())()
{
  return j__swift_endAccess;
}

uint64_t SequenceFlow.__allocating_init(aceService:flows:)(long long *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_22A2E2A30(a1, v4 + 16);
  *(void *)(v4 + 56) = a2;
  return v4;
}

uint64_t SequenceFlow.init(aceService:flows:)(long long *a1, uint64_t a2)
{
  sub_22A2E2A30(a1, v2 + 16);
  *(void *)(v2 + 56) = a2;
  return v2;
}

uint64_t SequenceFlow.__allocating_init(with:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_22A304B00();
  *(void *)(v2 + 56) = a1;
  return v2;
}

uint64_t SequenceFlow.init(with:)(uint64_t a1)
{
  sub_22A304B00();
  sub_22A2E2A30(&v4, v1 + 16);
  *(void *)(v1 + 56) = a1;
  return v1;
}

uint64_t SequenceFlow.on(input:)()
{
  return 1;
}

uint64_t SequenceFlow.execute(completion:)(void (*a1)(void), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_22A304C50();
  uint64_t v30 = *(void *)(v6 - 8);
  uint64_t v31 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v29 = (char *)&v27 - v10;
  uint64_t v11 = sub_22A305C80();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (uint64_t)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t *)(v3 + 56);
  swift_beginAccess();
  unint64_t v16 = *(void *)(v3 + 56);
  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_22A306050();
    swift_bridgeObjectRelease();
    if (v23) {
      goto LABEL_3;
    }
LABEL_21:
    sub_22A304C30();
    goto LABEL_22;
  }
  if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_21;
  }
LABEL_3:
  uint64_t v28 = a2;
  if (qword_268371458 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v11, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v14, v17, v11);
  swift_retain();
  id v18 = sub_22A305C60();
  os_log_type_t v19 = sub_22A305E40();
  if (!os_log_type_enabled(v18, v19))
  {

    swift_release();
    goto LABEL_10;
  }
  uint64_t v27 = a1;
  uint64_t v20 = swift_slowAlloc();
  *(_DWORD *)uint64_t v20 = 134217984;
  if ((unint64_t)*v15 >> 62) {
    goto LABEL_31;
  }
  uint64_t v21 = *(void *)((*v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v32 = v21;
    sub_22A305ED0();
    swift_release();
    _os_log_impl(&dword_22A2DE000, v18, v19, "Flows remaining : %ld", (uint8_t *)v20, 0xCu);
    MEMORY[0x22A6C55A0](v20, -1, -1);

    a1 = v27;
LABEL_10:
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v12 += 8;
    v22(v14, v11);
    swift_beginAccess();
    uint64_t v20 = *v15;
    os_log_type_t v19 = v28;
    if ((unint64_t)*v15 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_22A306050();
      swift_bridgeObjectRelease();
      if (!v25)
      {
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
    }
    else if (!*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_24;
    }
    uint64_t v20 = *v15;
    if (!((unint64_t)*v15 >> 62))
    {
      uint64_t v14 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v14) {
        goto LABEL_26;
      }
      goto LABEL_14;
    }
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_22A306050();
    swift_bridgeObjectRelease();
    if (!v14)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
LABEL_14:
    if ((v20 & 0xC000000000000001) == 0) {
      break;
    }
LABEL_27:
    uint64_t v20 = MEMORY[0x22A6C4E70](0, v20);
LABEL_17:
    uint64_t v14 = *v15;
    if ((unint64_t)*v15 >> 62) {
      goto LABEL_29;
    }
    if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_19;
    }
LABEL_30:
    __break(1u);
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_22A306050();
    swift_bridgeObjectRelease();
  }
  if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v20 = *(void *)(v20 + 32);
    swift_retain();
    goto LABEL_17;
  }
  __break(1u);
LABEL_29:
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_22A306050();
  swift_bridgeObjectRelease();
  if (!v26) {
    goto LABEL_30;
  }
LABEL_19:
  sub_22A303D8C(0, 1);
  swift_endAccess();
  uint64_t v9 = v29;
  sub_22A304C10();
  swift_release();
LABEL_22:
  a1(v9);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v9, v31);
}

uint64_t SequenceFlow.deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SequenceFlow.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_22A303D30(void (*a1)(void), uint64_t a2)
{
  return SequenceFlow.execute(completion:)(a1, a2);
}

uint64_t sub_22A303D54()
{
  type metadata accessor for SequenceFlow();
  return sub_22A304A60();
}

uint64_t sub_22A303D8C(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_22A306050();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22A306050();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_22A306050();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *uint64_t v3 = MEMORY[0x22A6C4E80](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(v11 + 32 + 8 * v4);
  sub_22A3049C0();
  swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_22A306050();
      swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_21:
        if (v16 < 0)
        {
LABEL_46:
          uint64_t result = sub_22A306070();
          __break(1u);
          return result;
        }
        uint64_t v17 = (char *)(v13 + 8 * v2);
        if (v4 != v2 || v14 >= &v17[8 * v16]) {
          memmove(v14, v17, 8 * v16);
        }
        if (!(*v3 >> 62))
        {
          uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + v5;
          if (!__OFADD__(v18, v5))
          {
LABEL_27:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_22A306050();
        swift_bridgeObjectRelease();
        uint64_t v19 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = v15 - v2;
      if (!__OFSUB__(v15, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  return sub_22A305DF0();
}

uint64_t type metadata accessor for SequenceFlow()
{
  return self;
}

uint64_t static UsoEntity_common_Workout.builder(workoutName:goalDefinedValue:goalUnitType:goalValue:areaType:sequenceLabel:usoAssociatedAppIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return sub_22A3042DC(a1, a2, a3, a4, a5, a6 & 1, a7, a8, a9, a10, a11);
}

uint64_t static UsoEntity_common_Workout.builder(name:goal:healthLog:workoutClass:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_22A3053D0();
  swift_allocObject();
  uint64_t v11 = sub_22A3053C0();
  if (a2) {
    sub_22A3053B0();
  }
  if (a3)
  {
    swift_retain();
    sub_22A3053A0();
    swift_release();
  }
  if (a5)
  {
    swift_retain();
    sub_22A305390();
    swift_release();
  }
  if (a7)
  {
    swift_retain();
    sub_22A305380();
    swift_release();
  }
  return v11;
}

uint64_t static UsoEntity_common_Workout.with(name:goal:healthLog:workoutClass:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_22A3053D0();
  swift_allocObject();
  uint64_t v11 = sub_22A3053C0();
  if (a2) {
    sub_22A3053B0();
  }
  if (a3)
  {
    swift_retain();
    sub_22A3053A0();
    swift_release();
  }
  if (a5)
  {
    swift_retain();
    sub_22A305390();
    swift_release();
  }
  if (a7)
  {
    swift_retain();
    sub_22A305380();
    swift_release();
  }
  MEMORY[0x22A6C3FC0](v11);
  sub_22A305080();
  sub_22A305130();
  swift_release();
  swift_release();
  return v13;
}

uint64_t sub_22A3042DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v48 = a8;
  uint64_t v49 = a5;
  uint64_t v44 = a7;
  uint64_t v46 = a3;
  uint64_t v47 = a4;
  uint64_t v50 = a11;
  int v45 = a6 & 1;
  uint64_t v13 = sub_22A304F60();
  uint64_t v43 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v42 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268371800);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v41 = (uint64_t)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v40 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v40 - v21;
  uint64_t v23 = sub_22A3051E0();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v40 = (char *)&v40 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v40 - v27;
  sub_22A3053D0();
  swift_allocObject();
  uint64_t v29 = sub_22A3053C0();
  uint64_t v48 = _s12SiriOntology26UsoEntity_common_HealthLogC0F12DomainsToolsE7builder06healthG4Name8areaType0kgL19IdentifierNamespace17measurementNeededAA0cd8Builder_e1_fG0CSSSg_A2LSbtFZ_0(a1, a2, v44, v48, 0, 0, 0);
  sub_22A305390();
  uint64_t v47 = sub_22A2E905C(v46, v47, v49, v45);
  uint64_t v49 = v29;
  sub_22A3053A0();
  sub_22A2EF8A4(a9, (uint64_t)v22);
  uint64_t v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
  if (v30(v22, 1, v23) == 1)
  {
    sub_22A2EF90C((uint64_t)v22);
    uint64_t v31 = v49;
    if (!v50) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v46 = v13;
  uint64_t v32 = v22;
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
  v33(v28, v32, v23);
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v20, v28, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v20, 0, 1, v23);
  sub_22A305630();
  swift_allocObject();
  sub_22A305620();
  uint64_t v34 = v41;
  sub_22A2EF8A4((uint64_t)v20, v41);
  if (v30((char *)v34, 1, v23) == 1)
  {
    sub_22A2EF90C(v34);
  }
  else
  {
    uint64_t v35 = v40;
    v33(v40, (char *)v34, v23);
    sub_22A305610();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v35, v23);
  }
  uint64_t v36 = v50;
  sub_22A2EF90C((uint64_t)v20);
  swift_retain();
  uint64_t v31 = v49;
  sub_22A305110();
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v28, v23);
  uint64_t v13 = v46;
  if (v36)
  {
LABEL_8:
    sub_22A305180();
    swift_allocObject();
    sub_22A305170();
    sub_22A3050F0();
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v37 = MEMORY[0x22A6C4000](0, 0);
    uint64_t v38 = v42;
    sub_22A304F30();
    sub_22A304EF0();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v38, v13);
    uint64_t v51 = v37;
    sub_22A304F80();
    swift_release();
    sub_22A305120();
    swift_release();
  }
LABEL_9:
  swift_release();
  swift_release();
  return v31;
}

uint64_t sub_22A304820()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_22A304830()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_22A304840()
{
  return MEMORY[0x270EEE850]();
}

uint64_t sub_22A304850()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_22A304860()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_22A304870()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22A304880()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22A304890()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22A3048A0()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_22A3048B0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22A3048C0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_22A3048D0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_22A3048E0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22A3048F0()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_22A304900()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_22A304910()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_22A304920()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_22A304930()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_22A304940()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_22A304950()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_22A304960()
{
  return MEMORY[0x270F5D2A0]();
}

uint64_t sub_22A304970()
{
  return MEMORY[0x270F604A0]();
}

uint64_t sub_22A304980()
{
  return MEMORY[0x270F614D0]();
}

uint64_t sub_22A304990()
{
  return MEMORY[0x270F614D8]();
}

uint64_t sub_22A3049A0()
{
  return MEMORY[0x270F61D68]();
}

uint64_t sub_22A3049B0()
{
  return MEMORY[0x270F66328]();
}

uint64_t sub_22A3049C0()
{
  return MEMORY[0x270F66888]();
}

uint64_t sub_22A3049D0()
{
  return MEMORY[0x270F668B8]();
}

uint64_t sub_22A3049E0()
{
  return MEMORY[0x270F66960]();
}

uint64_t sub_22A3049F0()
{
  return MEMORY[0x270F669B0]();
}

uint64_t sub_22A304A00()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t sub_22A304A10()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t sub_22A304A20()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_22A304A40()
{
  return MEMORY[0x270F66CD8]();
}

uint64_t sub_22A304A60()
{
  return MEMORY[0x270F66CE8]();
}

uint64_t sub_22A304A70()
{
  return MEMORY[0x270F66D60]();
}

uint64_t _s18HealthDomainsTools10FlowFinderC04findD013forInvocation07SiriKitD003AnyD0CSgAF5ParseO06DirectH0V_tF_0()
{
  return MEMORY[0x270F66D88]();
}

uint64_t sub_22A304A90()
{
  return MEMORY[0x270F66DA0]();
}

uint64_t sub_22A304AA0()
{
  return MEMORY[0x270F66DB8]();
}

uint64_t sub_22A304AB0()
{
  return MEMORY[0x270F66E28]();
}

uint64_t sub_22A304AC0()
{
  return MEMORY[0x270F67030]();
}

uint64_t sub_22A304AD0()
{
  return MEMORY[0x270F67058]();
}

uint64_t sub_22A304AE0()
{
  return MEMORY[0x270F67068]();
}

uint64_t sub_22A304AF0()
{
  return MEMORY[0x270F670A0]();
}

uint64_t sub_22A304B00()
{
  return MEMORY[0x270F670A8]();
}

uint64_t sub_22A304B10()
{
  return MEMORY[0x270F671E8]();
}

uint64_t sub_22A304B20()
{
  return MEMORY[0x270F67208]();
}

uint64_t sub_22A304B30()
{
  return MEMORY[0x270F67210]();
}

uint64_t sub_22A304B40()
{
  return MEMORY[0x270F67220]();
}

uint64_t sub_22A304B50()
{
  return MEMORY[0x270F67228]();
}

uint64_t sub_22A304B60()
{
  return MEMORY[0x270F67230]();
}

uint64_t sub_22A304B70()
{
  return MEMORY[0x270F67238]();
}

uint64_t sub_22A304B80()
{
  return MEMORY[0x270F67240]();
}

uint64_t sub_22A304B90()
{
  return MEMORY[0x270F672B0]();
}

uint64_t sub_22A304BA0()
{
  return MEMORY[0x270F67380]();
}

uint64_t sub_22A304BB0()
{
  return MEMORY[0x270F67388]();
}

uint64_t sub_22A304BC0()
{
  return MEMORY[0x270F67398]();
}

uint64_t sub_22A304BD0()
{
  return MEMORY[0x270F673A8]();
}

uint64_t sub_22A304BE0()
{
  return MEMORY[0x270F673B8]();
}

uint64_t sub_22A304BF0()
{
  return MEMORY[0x270F673C0]();
}

uint64_t sub_22A304C00()
{
  return MEMORY[0x270F673C8]();
}

uint64_t sub_22A304C10()
{
  return MEMORY[0x270F676F8]();
}

uint64_t sub_22A304C20()
{
  return MEMORY[0x270F67718]();
}

uint64_t sub_22A304C30()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_22A304C40()
{
  return MEMORY[0x270F67740]();
}

uint64_t sub_22A304C50()
{
  return MEMORY[0x270F67750]();
}

uint64_t sub_22A304C60()
{
  return MEMORY[0x270F678D0]();
}

uint64_t sub_22A304C70()
{
  return MEMORY[0x270F67930]();
}

uint64_t sub_22A304C80()
{
  return MEMORY[0x270F67960]();
}

uint64_t sub_22A304C90()
{
  return MEMORY[0x270F67970]();
}

uint64_t sub_22A304CA0()
{
  return MEMORY[0x270F67CA8]();
}

uint64_t sub_22A304CD0()
{
  return MEMORY[0x270F67D50]();
}

uint64_t _s18HealthDomainsTools15FlowConfigModelV23getOutputPublisherAsync07SiriKitD00hiJ0_pyF_0()
{
  return MEMORY[0x270F67D58]();
}

uint64_t sub_22A304CF0()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_22A304D00()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_22A304D10()
{
  return MEMORY[0x270F68378]();
}

uint64_t sub_22A304D20()
{
  return MEMORY[0x270F68380]();
}

uint64_t sub_22A304D30()
{
  return MEMORY[0x270F68388]();
}

uint64_t sub_22A304D40()
{
  return MEMORY[0x270F6A2D0]();
}

uint64_t sub_22A304D50()
{
  return MEMORY[0x270F6A350]();
}

uint64_t sub_22A304D60()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_22A304D70()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_22A304D80()
{
  return MEMORY[0x270F6A4A0]();
}

uint64_t sub_22A304D90()
{
  return MEMORY[0x270F6A4F0]();
}

uint64_t sub_22A304DA0()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_22A304DB0()
{
  return MEMORY[0x270F6A748]();
}

uint64_t sub_22A304DC0()
{
  return MEMORY[0x270F6A750]();
}

uint64_t sub_22A304DD0()
{
  return MEMORY[0x270F683C8]();
}

uint64_t sub_22A304DE0()
{
  return MEMORY[0x270F6A7B0]();
}

uint64_t sub_22A304DF0()
{
  return MEMORY[0x270F6A7B8]();
}

uint64_t sub_22A304E00()
{
  return MEMORY[0x270F6A848]();
}

uint64_t sub_22A304E10()
{
  return MEMORY[0x270F6A860]();
}

uint64_t sub_22A304E20()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_22A304E30()
{
  return MEMORY[0x270F6AAB0]();
}

uint64_t sub_22A304E40()
{
  return MEMORY[0x270F6AAB8]();
}

uint64_t sub_22A304E50()
{
  return MEMORY[0x270F6AAC0]();
}

uint64_t sub_22A304E60()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_22A304E70()
{
  return MEMORY[0x270F6AFB0]();
}

uint64_t sub_22A304E80()
{
  return MEMORY[0x270F6AFC0]();
}

uint64_t sub_22A304E90()
{
  return MEMORY[0x270F6AFC8]();
}

uint64_t sub_22A304EA0()
{
  return MEMORY[0x270F6BB08]();
}

uint64_t sub_22A304EB0()
{
  return MEMORY[0x270F6BB38]();
}

uint64_t sub_22A304EC0()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_22A304ED0()
{
  return MEMORY[0x270F6C048]();
}

uint64_t sub_22A304EE0()
{
  return MEMORY[0x270F6C0D0]();
}

uint64_t sub_22A304EF0()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_22A304F00()
{
  return MEMORY[0x270F6C828]();
}

uint64_t sub_22A304F10()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_22A304F20()
{
  return MEMORY[0x270F6C960]();
}

uint64_t sub_22A304F30()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t sub_22A304F40()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t sub_22A304F50()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_22A304F60()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_22A304F70()
{
  return MEMORY[0x270F6CCA0]();
}

uint64_t sub_22A304F80()
{
  return MEMORY[0x270F6CCD8]();
}

uint64_t sub_22A304F90()
{
  return MEMORY[0x270F6CD38]();
}

uint64_t sub_22A304FA0()
{
  return MEMORY[0x270F6CD60]();
}

uint64_t sub_22A304FB0()
{
  return MEMORY[0x270F6CD70]();
}

uint64_t sub_22A304FC0()
{
  return MEMORY[0x270F6CDA8]();
}

uint64_t sub_22A304FD0()
{
  return MEMORY[0x270F6CE48]();
}

uint64_t sub_22A304FE0()
{
  return MEMORY[0x270F6D038]();
}

uint64_t sub_22A304FF0()
{
  return MEMORY[0x270F6D040]();
}

uint64_t sub_22A305000()
{
  return MEMORY[0x270F6D0D8]();
}

uint64_t sub_22A305010()
{
  return MEMORY[0x270F6D0F8]();
}

uint64_t sub_22A305020()
{
  return MEMORY[0x270F6D108]();
}

uint64_t sub_22A305030()
{
  return MEMORY[0x270F6D110]();
}

uint64_t sub_22A305040()
{
  return MEMORY[0x270F6D118]();
}

uint64_t sub_22A305050()
{
  return MEMORY[0x270F6D120]();
}

uint64_t sub_22A305060()
{
  return MEMORY[0x270F6D128]();
}

uint64_t sub_22A305070()
{
  return MEMORY[0x270F6D1F0]();
}

uint64_t sub_22A305080()
{
  return MEMORY[0x270F6D1F8]();
}

uint64_t sub_22A305090()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_22A3050A0()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_22A3050B0()
{
  return MEMORY[0x270F6D2A0]();
}

uint64_t sub_22A3050C0()
{
  return MEMORY[0x270F6D318]();
}

uint64_t sub_22A3050D0()
{
  return MEMORY[0x270F6D320]();
}

uint64_t sub_22A3050E0()
{
  return MEMORY[0x270F6D328]();
}

uint64_t sub_22A3050F0()
{
  return MEMORY[0x270F6D338]();
}

uint64_t sub_22A305100()
{
  return MEMORY[0x270F6D348]();
}

uint64_t sub_22A305110()
{
  return MEMORY[0x270F6D3D0]();
}

uint64_t sub_22A305120()
{
  return MEMORY[0x270F6D3D8]();
}

uint64_t sub_22A305130()
{
  return MEMORY[0x270F6D3F8]();
}

uint64_t sub_22A305140()
{
  return MEMORY[0x270F6D420]();
}

uint64_t sub_22A305150()
{
  return MEMORY[0x270F6D428]();
}

uint64_t sub_22A305160()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_22A305170()
{
  return MEMORY[0x270F6D530]();
}

uint64_t sub_22A305180()
{
  return MEMORY[0x270F6D538]();
}

uint64_t sub_22A305190()
{
  return MEMORY[0x270F6D680]();
}

uint64_t sub_22A3051A0()
{
  return MEMORY[0x270F6D750]();
}

uint64_t sub_22A3051B0()
{
  return MEMORY[0x270F6D7C8]();
}

uint64_t sub_22A3051C0()
{
  return MEMORY[0x270F6D7D0]();
}

uint64_t sub_22A3051D0()
{
  return MEMORY[0x270F6D808]();
}

uint64_t sub_22A3051E0()
{
  return MEMORY[0x270F6D970]();
}

uint64_t sub_22A3051F0()
{
  return MEMORY[0x270F6DA20]();
}

uint64_t sub_22A305200()
{
  return MEMORY[0x270F6DA30]();
}

uint64_t sub_22A305210()
{
  return MEMORY[0x270F6DA38]();
}

uint64_t sub_22A305220()
{
  return MEMORY[0x270F6DA70]();
}

uint64_t sub_22A305230()
{
  return MEMORY[0x270F6DA78]();
}

uint64_t sub_22A305240()
{
  return MEMORY[0x270F6DAA0]();
}

uint64_t sub_22A305250()
{
  return MEMORY[0x270F6DAD0]();
}

uint64_t sub_22A305260()
{
  return MEMORY[0x270F6DB08]();
}

uint64_t sub_22A305270()
{
  return MEMORY[0x270F6DB10]();
}

uint64_t sub_22A305280()
{
  return MEMORY[0x270F6DB20]();
}

uint64_t sub_22A305290()
{
  return MEMORY[0x270F6DB28]();
}

uint64_t sub_22A3052A0()
{
  return MEMORY[0x270F6DC38]();
}

uint64_t sub_22A3052B0()
{
  return MEMORY[0x270F6DC40]();
}

uint64_t sub_22A3052C0()
{
  return MEMORY[0x270F6DC48]();
}

uint64_t sub_22A3052D0()
{
  return MEMORY[0x270F6DC50]();
}

uint64_t sub_22A3052E0()
{
  return MEMORY[0x270F6DD48]();
}

uint64_t sub_22A3052F0()
{
  return MEMORY[0x270F6DD50]();
}

uint64_t sub_22A305300()
{
  return MEMORY[0x270F6DD58]();
}

uint64_t sub_22A305310()
{
  return MEMORY[0x270F6DD60]();
}

uint64_t sub_22A305320()
{
  return MEMORY[0x270F6DD68]();
}

uint64_t sub_22A305330()
{
  return MEMORY[0x270F6DD70]();
}

uint64_t sub_22A305340()
{
  return MEMORY[0x270F6DD78]();
}

uint64_t sub_22A305350()
{
  return MEMORY[0x270F6DD80]();
}

uint64_t sub_22A305360()
{
  return MEMORY[0x270F6DD88]();
}

uint64_t sub_22A305370()
{
  return MEMORY[0x270F6DD90]();
}

uint64_t sub_22A305380()
{
  return MEMORY[0x270F6DE38]();
}

uint64_t sub_22A305390()
{
  return MEMORY[0x270F6DE40]();
}

uint64_t sub_22A3053A0()
{
  return MEMORY[0x270F6DE48]();
}

uint64_t sub_22A3053B0()
{
  return MEMORY[0x270F6DE50]();
}

uint64_t sub_22A3053C0()
{
  return MEMORY[0x270F6DE58]();
}

uint64_t sub_22A3053D0()
{
  return MEMORY[0x270F6DE60]();
}

uint64_t sub_22A3053E0()
{
  return MEMORY[0x270F6DEC8]();
}

uint64_t sub_22A3053F0()
{
  return MEMORY[0x270F6DF18]();
}

uint64_t sub_22A305400()
{
  return MEMORY[0x270F6DFC8]();
}

uint64_t sub_22A305410()
{
  return MEMORY[0x270F6DFD0]();
}

uint64_t sub_22A305420()
{
  return MEMORY[0x270F6DFD8]();
}

uint64_t sub_22A305430()
{
  return MEMORY[0x270F6E040]();
}

uint64_t sub_22A305440()
{
  return MEMORY[0x270F6E048]();
}

uint64_t sub_22A305450()
{
  return MEMORY[0x270F6E050]();
}

uint64_t sub_22A305460()
{
  return MEMORY[0x270F6E058]();
}

uint64_t sub_22A305470()
{
  return MEMORY[0x270F6E060]();
}

uint64_t sub_22A305480()
{
  return MEMORY[0x270F6E0C8]();
}

uint64_t sub_22A305490()
{
  return MEMORY[0x270F6E0D0]();
}

uint64_t sub_22A3054A0()
{
  return MEMORY[0x270F6E208]();
}

uint64_t sub_22A3054B0()
{
  return MEMORY[0x270F6E240]();
}

uint64_t sub_22A3054C0()
{
  return MEMORY[0x270F6E248]();
}

uint64_t sub_22A3054D0()
{
  return MEMORY[0x270F6E250]();
}

uint64_t sub_22A3054E0()
{
  return MEMORY[0x270F6E258]();
}

uint64_t sub_22A3054F0()
{
  return MEMORY[0x270F6E2E0]();
}

uint64_t sub_22A305500()
{
  return MEMORY[0x270F6E2E8]();
}

uint64_t sub_22A305510()
{
  return MEMORY[0x270F6E2F0]();
}

uint64_t sub_22A305520()
{
  return MEMORY[0x270F6E310]();
}

uint64_t sub_22A305530()
{
  return MEMORY[0x270F6E408]();
}

uint64_t sub_22A305540()
{
  return MEMORY[0x270F6E4E8]();
}

uint64_t sub_22A305550()
{
  return MEMORY[0x270F6E500]();
}

uint64_t sub_22A305560()
{
  return MEMORY[0x270F6E538]();
}

uint64_t sub_22A305570()
{
  return MEMORY[0x270F6E540]();
}

uint64_t sub_22A305580()
{
  return MEMORY[0x270F6E5C8]();
}

uint64_t sub_22A305590()
{
  return MEMORY[0x270F6E5D0]();
}

uint64_t sub_22A3055A0()
{
  return MEMORY[0x270F6E5D8]();
}

uint64_t sub_22A3055B0()
{
  return MEMORY[0x270F6E668]();
}

uint64_t sub_22A3055C0()
{
  return MEMORY[0x270F6E670]();
}

uint64_t sub_22A3055D0()
{
  return MEMORY[0x270F6E678]();
}

uint64_t sub_22A3055E0()
{
  return MEMORY[0x270F6E680]();
}

uint64_t sub_22A3055F0()
{
  return MEMORY[0x270F6E6C0]();
}

uint64_t sub_22A305600()
{
  return MEMORY[0x270F6E6C8]();
}

uint64_t sub_22A305610()
{
  return MEMORY[0x270F6E7F8]();
}

uint64_t sub_22A305620()
{
  return MEMORY[0x270F6E818]();
}

uint64_t sub_22A305630()
{
  return MEMORY[0x270F6E820]();
}

uint64_t sub_22A305640()
{
  return MEMORY[0x270F6E8A8]();
}

uint64_t sub_22A305650()
{
  return MEMORY[0x270F6E8B0]();
}

uint64_t sub_22A305660()
{
  return MEMORY[0x270F6E8B8]();
}

uint64_t sub_22A305670()
{
  return MEMORY[0x270F6E8C0]();
}

uint64_t sub_22A305680()
{
  return MEMORY[0x270F6E8C8]();
}

uint64_t sub_22A305690()
{
  return MEMORY[0x270F6E8D0]();
}

uint64_t sub_22A3056A0()
{
  return MEMORY[0x270F6E8D8]();
}

uint64_t sub_22A3056B0()
{
  return MEMORY[0x270F6E8E0]();
}

uint64_t sub_22A3056C0()
{
  return MEMORY[0x270F6E8E8]();
}

uint64_t sub_22A3056D0()
{
  return MEMORY[0x270F6E900]();
}

uint64_t sub_22A3056E0()
{
  return MEMORY[0x270F6E908]();
}

uint64_t sub_22A3056F0()
{
  return MEMORY[0x270F6E940]();
}

uint64_t sub_22A305700()
{
  return MEMORY[0x270F6E948]();
}

uint64_t sub_22A305710()
{
  return MEMORY[0x270F6EB00]();
}

uint64_t sub_22A305720()
{
  return MEMORY[0x270F6EB10]();
}

uint64_t sub_22A305730()
{
  return MEMORY[0x270F6EC40]();
}

uint64_t sub_22A305740()
{
  return MEMORY[0x270F6EC48]();
}

uint64_t sub_22A305750()
{
  return MEMORY[0x270F6EC90]();
}

uint64_t sub_22A305760()
{
  return MEMORY[0x270F6EC98]();
}

uint64_t sub_22A305770()
{
  return MEMORY[0x270F6ECA0]();
}

uint64_t sub_22A305780()
{
  return MEMORY[0x270F6ECA8]();
}

uint64_t sub_22A305790()
{
  return MEMORY[0x270F6ED20]();
}

uint64_t sub_22A3057A0()
{
  return MEMORY[0x270F6ED28]();
}

uint64_t sub_22A3057B0()
{
  return MEMORY[0x270F6ED30]();
}

uint64_t sub_22A3057C0()
{
  return MEMORY[0x270F6ED38]();
}

uint64_t sub_22A3057D0()
{
  return MEMORY[0x270F6ED40]();
}

uint64_t sub_22A3057E0()
{
  return MEMORY[0x270F6EE00]();
}

uint64_t sub_22A3057F0()
{
  return MEMORY[0x270F6EE68]();
}

uint64_t sub_22A305800()
{
  return MEMORY[0x270F6EE70]();
}

uint64_t sub_22A305810()
{
  return MEMORY[0x270F6EE78]();
}

uint64_t sub_22A305820()
{
  return MEMORY[0x270F6EF00]();
}

uint64_t sub_22A305830()
{
  return MEMORY[0x270F6EF28]();
}

uint64_t sub_22A305840()
{
  return MEMORY[0x270F6EF30]();
}

uint64_t sub_22A305850()
{
  return MEMORY[0x270F6EF38]();
}

uint64_t sub_22A305860()
{
  return MEMORY[0x270F6EF40]();
}

uint64_t sub_22A305870()
{
  return MEMORY[0x270F6EF60]();
}

uint64_t sub_22A305880()
{
  return MEMORY[0x270F6EF68]();
}

uint64_t sub_22A305890()
{
  return MEMORY[0x270F6EF70]();
}

uint64_t sub_22A3058A0()
{
  return MEMORY[0x270F6EF98]();
}

uint64_t sub_22A3058B0()
{
  return MEMORY[0x270F6F030]();
}

uint64_t sub_22A3058C0()
{
  return MEMORY[0x270F6F038]();
}

uint64_t sub_22A3058D0()
{
  return MEMORY[0x270F6F040]();
}

uint64_t sub_22A3058E0()
{
  return MEMORY[0x270F6F060]();
}

uint64_t sub_22A3058F0()
{
  return MEMORY[0x270F6F068]();
}

uint64_t sub_22A305900()
{
  return MEMORY[0x270F6F070]();
}

uint64_t sub_22A305910()
{
  return MEMORY[0x270F6F078]();
}

uint64_t sub_22A305920()
{
  return MEMORY[0x270F5D890]();
}

uint64_t sub_22A305930()
{
  return MEMORY[0x270F5D8A0]();
}

uint64_t sub_22A305940()
{
  return MEMORY[0x270F5D8A8]();
}

uint64_t sub_22A305950()
{
  return MEMORY[0x270F5E3A0]();
}

uint64_t sub_22A305960()
{
  return MEMORY[0x270F5E3A8]();
}

uint64_t sub_22A305970()
{
  return MEMORY[0x270F5E3D0]();
}

uint64_t sub_22A305980()
{
  return MEMORY[0x270F5E9D8]();
}

uint64_t sub_22A305990()
{
  return MEMORY[0x270F5E9E0]();
}

uint64_t sub_22A3059A0()
{
  return MEMORY[0x270F72900]();
}

uint64_t sub_22A3059B0()
{
  return MEMORY[0x270F72910]();
}

uint64_t sub_22A3059C0()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_22A3059D0()
{
  return MEMORY[0x270F729E8]();
}

uint64_t sub_22A3059E0()
{
  return MEMORY[0x270F72C00]();
}

uint64_t sub_22A3059F0()
{
  return MEMORY[0x270F72C08]();
}

uint64_t sub_22A305A00()
{
  return MEMORY[0x270F72C10]();
}

uint64_t sub_22A305A10()
{
  return MEMORY[0x270F72C18]();
}

uint64_t sub_22A305A20()
{
  return MEMORY[0x270F64830]();
}

uint64_t sub_22A305A30()
{
  return MEMORY[0x270F64840]();
}

uint64_t sub_22A305A40()
{
  return MEMORY[0x270F64850]();
}

uint64_t sub_22A305A50()
{
  return MEMORY[0x270F64858]();
}

uint64_t sub_22A305A60()
{
  return MEMORY[0x270F64CF8]();
}

uint64_t sub_22A305A70()
{
  return MEMORY[0x270F64D08]();
}

uint64_t sub_22A305A80()
{
  return MEMORY[0x270F64D10]();
}

uint64_t sub_22A305A90()
{
  return MEMORY[0x270F64D18]();
}

uint64_t sub_22A305AA0()
{
  return MEMORY[0x270F64EB8]();
}

uint64_t sub_22A305AB0()
{
  return MEMORY[0x270F64EE0]();
}

uint64_t sub_22A305AC0()
{
  return MEMORY[0x270F64EF0]();
}

uint64_t sub_22A305AD0()
{
  return MEMORY[0x270F64F08]();
}

uint64_t sub_22A305AE0()
{
  return MEMORY[0x270F64F10]();
}

uint64_t sub_22A305AF0()
{
  return MEMORY[0x270F64F18]();
}

uint64_t sub_22A305B00()
{
  return MEMORY[0x270F64F20]();
}

uint64_t sub_22A305B10()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t sub_22A305B20()
{
  return MEMORY[0x270F650F0]();
}

uint64_t sub_22A305B30()
{
  return MEMORY[0x270F650F8]();
}

uint64_t sub_22A305B40()
{
  return MEMORY[0x270F65100]();
}

uint64_t sub_22A305B50()
{
  return MEMORY[0x270F65110]();
}

uint64_t sub_22A305B60()
{
  return MEMORY[0x270F65118]();
}

uint64_t sub_22A305B70()
{
  return MEMORY[0x270F63AE0]();
}

uint64_t sub_22A305B80()
{
  return MEMORY[0x270F63AE8]();
}

uint64_t sub_22A305B90()
{
  return MEMORY[0x270F63B10]();
}

uint64_t sub_22A305BA0()
{
  return MEMORY[0x270F652C8]();
}

uint64_t sub_22A305BB0()
{
  return MEMORY[0x270F446F8]();
}

uint64_t sub_22A305BC0()
{
  return MEMORY[0x270F44710]();
}

uint64_t sub_22A305BD0()
{
  return MEMORY[0x270F706B0]();
}

uint64_t sub_22A305BE0()
{
  return MEMORY[0x270F706F0]();
}

uint64_t sub_22A305BF0()
{
  return MEMORY[0x270F706F8]();
}

uint64_t sub_22A305C00()
{
  return MEMORY[0x270F72E50]();
}

uint64_t sub_22A305C10()
{
  return MEMORY[0x270F72E80]();
}

uint64_t sub_22A305C40()
{
  return MEMORY[0x270F72F68]();
}

uint64_t sub_22A305C50()
{
  return MEMORY[0x270F72F70]();
}

uint64_t sub_22A305C60()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22A305C70()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22A305C80()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22A305C90()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_22A305CA0()
{
  return MEMORY[0x270F70AC8]();
}

uint64_t sub_22A305CB0()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_22A305CC0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22A305CD0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22A305CE0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22A305CF0()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_22A305D00()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22A305D10()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22A305D20()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22A305D30()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22A305D40()
{
  return MEMORY[0x270F65190]();
}

uint64_t sub_22A305D50()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22A305D60()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_22A305D70()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_22A305D80()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22A305D90()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22A305DB0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_22A305DC0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22A305DD0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22A305DE0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_22A305DF0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22A305E00()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_22A305E10()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22A305E20()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_22A305E30()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_22A305E40()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_22A305E50()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22A305E60()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22A305E70()
{
  return MEMORY[0x270F66268]();
}

uint64_t sub_22A305E80()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_22A305E90()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_22A305EA0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_22A305EB0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_22A305EC0()
{
  return MEMORY[0x270F62148]();
}

uint64_t sub_22A305ED0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22A305EE0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22A305EF0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_22A305F00()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_22A305F10()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22A305F20()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_22A305F30()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22A305F40()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22A305F50()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22A305F60()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_22A305F70()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22A305F80()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_22A305F90()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_22A305FA0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_22A305FB0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_22A305FC0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_22A305FD0()
{
  return MEMORY[0x270F9EF48]();
}

uint64_t sub_22A305FE0()
{
  return MEMORY[0x270F9EF58]();
}

uint64_t sub_22A305FF0()
{
  return MEMORY[0x270F9EF70]();
}

uint64_t sub_22A306000()
{
  return MEMORY[0x270F9EF78]();
}

uint64_t sub_22A306010()
{
  return MEMORY[0x270F9EF80]();
}

uint64_t sub_22A306020()
{
  return MEMORY[0x270F9EFD8]();
}

uint64_t sub_22A306030()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22A306040()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_22A306050()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22A306060()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22A306070()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22A306080()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22A306090()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_22A3060A0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22A3060C0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22A3060D0()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_22A3060E0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_22A3060F0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22A306100()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22A306110()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22A306120()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22A306130()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22A306140()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22A306150()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22A306160()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22A306170()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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