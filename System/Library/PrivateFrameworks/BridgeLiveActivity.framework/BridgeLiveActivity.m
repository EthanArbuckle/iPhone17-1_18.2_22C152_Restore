Swift::String *LiveActivitySharedAppGroupName.unsafeMutableAddressor()
{
  return &LiveActivitySharedAppGroupName;
}

uint64_t sub_249363FD0(uint64_t a1)
{
  return sub_24936404C(a1, LiveActivitySetupLogger, &qword_2696A1BB8, (uint64_t)qword_2696A6388);
}

uint64_t LiveActivitySetupLogger.unsafeMutableAddressor()
{
  return sub_249364138(&qword_2696A1BA0, (uint64_t)LiveActivitySetupLogger);
}

uint64_t sub_249364020(uint64_t a1)
{
  return sub_24936404C(a1, qword_2696A6358, &qword_2696A1BB0, (uint64_t)qword_2696A6370);
}

uint64_t sub_24936404C(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = sub_24937AB20();
  __swift_allocate_value_buffer(v7, a2);
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v7, a4);
  v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  return v10(v8, v9, v7);
}

uint64_t sub_249364114()
{
  return sub_249364138(&qword_2696A1BA8, (uint64_t)qword_2696A6358);
}

uint64_t sub_249364138(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24937AB20();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_24936418C(uint64_t a1)
{
  return sub_2493641D4(a1, qword_2696A6370);
}

uint64_t sub_2493641B0(uint64_t a1)
{
  return sub_2493641D4(a1, qword_2696A6388);
}

uint64_t sub_2493641D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24937AB20();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24937AB10();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t Encodable.stringValue.getter()
{
  sub_24937AB60();
  MEMORY[0x270FA5388]();
  sub_24937A9F0();
  MEMORY[0x270FA5388]();
  sub_24937AA30();
  swift_allocObject();
  sub_24937AA20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A18A0);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_24937B1F0;
  sub_24937A9E0();
  sub_249364510();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A18B0);
  sub_249364568();
  sub_24937AC30();
  sub_24937AA00();
  uint64_t v0 = sub_24937AA10();
  unint64_t v2 = v1;
  sub_24937AB50();
  uint64_t v3 = sub_24937AB40();
  uint64_t v5 = v4;
  sub_24936460C(v0, v2);
  swift_release();
  if (!v5) {
    return 4283470;
  }
  return v3;
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

unint64_t sub_249364510()
{
  unint64_t result = qword_2696A18A8;
  if (!qword_2696A18A8)
  {
    sub_24937A9F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A18A8);
  }
  return result;
}

unint64_t sub_249364568()
{
  unint64_t result = qword_2696A18B8;
  if (!qword_2696A18B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A18B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A18B8);
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

uint64_t sub_24936460C(uint64_t a1, unint64_t a2)
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

void *LiveActivitySetupStateProvider.imageMap.getter@<X0>(void *a1@<X8>)
{
  memset(v6, 0, sizeof(v6));
  uint64_t v7 = 255;
  long long v8 = 0u;
  long long v9 = 0u;
  char v10 = 0;
  sub_24937A9C4((uint64_t)v3);
  sub_24936A1C4((uint64_t)v4);
  LiveActivityImageMap.init(dynamicIslandCompact:dynamicIslandMinimal:dynamicIslandExpanded:lockScreen:)((uint64_t)v3, (uint64_t)v6, v4, (uint64_t)v6, (uint64_t)__src);
  return memcpy(a1, __src, 0x139uLL);
}

void *LiveActivitySetupStateProvider.state.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  (*(void (**)(void *__return_ptr))(a2 + 24))(v7);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(a2 + 16))(v8, a1, a2);
  sub_24936856C((uint64_t)v9);
  sub_249368584();
  LiveActivitySetupState.init(textMap:imageMap:metadata:shouldSuppressAlert:)((uint64_t)v7, v8, v9, (uint64_t)__src);
  return memcpy(a3, __src, 0x1AAuLL);
}

uint64_t sub_2493647EC()
{
  type metadata accessor for LiveActivityService();
  uint64_t result = swift_initStaticObject();
  static LiveActivityService.shared = result;
  return result;
}

uint64_t sub_249364818()
{
  return swift_allocObject();
}

uint64_t *LiveActivityService.shared.unsafeMutableAddressor()
{
  if (qword_2696A1BC0 != -1) {
    swift_once();
  }
  return &static LiveActivityService.shared;
}

uint64_t static LiveActivityService.shared.getter()
{
  type metadata accessor for LiveActivityService();
  return swift_initStaticObject();
}

uint64_t LiveActivityService.start<A>(with:state:)(char *a1, uint64_t a2)
{
  uint64_t v61 = a2;
  v56 = a1;
  uint64_t v59 = sub_24937AB20();
  uint64_t v62 = *(void *)(v59 - 8);
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v60 = (char *)v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  v49 = (char *)v47 - v4;
  uint64_t v5 = sub_24937AAD0();
  uint64_t v53 = *(void *)(v5 - 8);
  uint64_t v54 = v5;
  MEMORY[0x270FA5388](v5);
  v55 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A18C0);
  MEMORY[0x270FA5388](v7 - 8);
  long long v9 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  v51 = (char *)v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v15 = (char *)v47 - v14;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v17 = swift_getAssociatedConformanceWitness();
  uint64_t v18 = swift_getAssociatedConformanceWitness();
  v64[0] = AssociatedTypeWitness;
  v64[1] = AssociatedConformanceWitness;
  v64[2] = v17;
  v64[3] = v18;
  uint64_t v19 = sub_24937AAF0();
  uint64_t v57 = *(void *)(v19 - 8);
  uint64_t v58 = v19;
  MEMORY[0x270FA5388](v19);
  v21 = (char *)v47 - v20;
  uint64_t v50 = v11;
  v48 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v48(v15, v61, AssociatedTypeWitness);
  sub_24937AA40();
  uint64_t v22 = sub_24937AA50();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v9, 0, 1, v22);
  uint64_t v52 = AssociatedTypeWitness;
  v47[1] = v17;
  sub_24937AAE0();
  sub_24937AA80();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A18C8);
  uint64_t v23 = sub_24937AA90();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(void *)(v24 + 72);
  unint64_t v26 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_24937B270;
  v28 = (void *)(v27 + v26);
  void *v28 = 0;
  v28[1] = 0;
  v29 = *(void (**)(void))(v24 + 104);
  ((void (*)(unint64_t, void, uint64_t))v29)(v27 + v26, *MEMORY[0x263EFB550], v23);
  v30 = (void *)((char *)v28 + v25);
  v31 = v55;
  void *v30 = 0xD00000000000001DLL;
  v30[1] = 0x800000024937D1E0;
  v29();
  sub_24937AAB0();
  sub_24937AAC0();
  v56 = v21;
  uint64_t v32 = sub_24937AA70();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v31, v54);
  swift_bridgeObjectRelease();
  uint64_t v33 = sub_249364114();
  v34 = v49;
  uint64_t v35 = v59;
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v49, v33, v59);
  v48(v51, v61, v52);
  swift_retain_n();
  v36 = sub_24937AB00();
  os_log_type_t v37 = sub_24937ABF0();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    v64[0] = v61;
    *(_DWORD *)uint64_t v38 = 136315394;
    uint64_t v39 = sub_24937AA60();
    uint64_t v63 = sub_249366D20(v39, v40, v64);
    sub_24937AC10();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2080;
    uint64_t v41 = v52;
    v42 = v51;
    uint64_t v43 = Encodable.stringValue.getter();
    uint64_t v63 = sub_249366D20(v43, v44, v64);
    sub_24937AC10();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v42, v41);
    _os_log_impl(&dword_249362000, v36, v37, "Live Activity requested %s and content state: %s", (uint8_t *)v38, 0x16u);
    uint64_t v45 = v61;
    swift_arrayDestroy();
    MEMORY[0x24C59CB30](v45, -1, -1);
    MEMORY[0x24C59CB30](v38, -1, -1);

    (*(void (**)(char *, uint64_t))(v62 + 8))(v34, v59);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v34, v35);
  }
  (*(void (**)(char *, uint64_t))(v57 + 8))(v56, v58);
  return v32;
}

uint64_t LiveActivityService.end<A>(activity:with:dismissalPolicy:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v97 = a2;
  uint64_t v98 = a3;
  uint64_t v4 = *a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A18D0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v99 = (uint64_t)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A18C0);
  MEMORY[0x270FA5388](v7 - 8);
  v89 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v9 = (uint64_t *)(v4 + *MEMORY[0x263EFB510]);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v14 = swift_getAssociatedConformanceWitness();
  uint64_t v92 = v11;
  uint64_t v93 = v10;
  uint64_t v15 = swift_getAssociatedConformanceWitness();
  v102[0] = AssociatedTypeWitness;
  v102[1] = AssociatedConformanceWitness;
  uint64_t v87 = AssociatedConformanceWitness;
  uint64_t v77 = v14;
  v102[2] = v14;
  v102[3] = v15;
  uint64_t v80 = v15;
  uint64_t v16 = sub_24937AAF0();
  uint64_t v90 = *(void *)(v16 - 8);
  uint64_t v91 = v16;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  v88 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v96 = (char *)&v71 - v20;
  uint64_t v21 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  v83 = (char *)&v71 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v71 - v24;
  uint64_t v26 = sub_24937AAA0();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v85 = (char *)&v71 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = v29;
  MEMORY[0x270FA5388](v28);
  v31 = (char *)&v71 - v30;
  uint64_t v32 = sub_24937AB20();
  uint64_t v33 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v71 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_249364114();
  uint64_t v76 = v33;
  os_log_type_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v33 + 16);
  uint64_t v78 = v32;
  v37(v35, v36, v32);
  uint64_t v94 = v27;
  uint64_t v95 = v26;
  uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
  uint64_t v82 = v27 + 16;
  v81 = v38;
  v38(v31, v98, v26);
  uint64_t v79 = v21;
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v75 = v25;
  v39(v25, v97, AssociatedTypeWitness);
  v100 = a1;
  swift_retain_n();
  unint64_t v40 = sub_24937AB00();
  os_log_type_t v41 = sub_24937ABF0();
  int v42 = v41;
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v43 = swift_slowAlloc();
    v74 = v39;
    uint64_t v44 = v43;
    uint64_t v73 = swift_slowAlloc();
    v102[0] = v73;
    *(_DWORD *)uint64_t v44 = 136315650;
    os_log_t v71 = v40;
    int v72 = v42;
    uint64_t v45 = sub_24937AA60();
    uint64_t v101 = sub_249366D20(v45, v46, v102);
    sub_24937AC10();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    sub_249367840();
    uint64_t v47 = v95;
    uint64_t v48 = Encodable.stringValue.getter();
    uint64_t v101 = sub_249366D20(v48, v49, v102);
    sub_24937AC10();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v94 + 8))(v31, v47);
    *(_WORD *)(v44 + 22) = 2080;
    uint64_t v50 = v75;
    uint64_t v51 = Encodable.stringValue.getter();
    uint64_t v101 = sub_249366D20(v51, v52, v102);
    sub_24937AC10();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v79 + 8))(v50, AssociatedTypeWitness);
    os_log_t v53 = v71;
    _os_log_impl(&dword_249362000, v71, (os_log_type_t)v72, "Ending activity: %s with policy: %s and content state: %s", (uint8_t *)v44, 0x20u);
    uint64_t v54 = v73;
    swift_arrayDestroy();
    MEMORY[0x24C59CB30](v54, -1, -1);
    uint64_t v55 = v44;
    uint64_t v39 = v74;
    MEMORY[0x24C59CB30](v55, -1, -1);
  }
  else
  {
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v94 + 8))(v31, v95);
    (*(void (**)(char *, uint64_t))(v79 + 8))(v75, AssociatedTypeWitness);
  }
  (*(void (**)(char *, uint64_t))(v76 + 8))(v35, v78);
  v39(v83, v97, AssociatedTypeWitness);
  v56 = v89;
  sub_24937AA40();
  uint64_t v57 = sub_24937AA50();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v56, 0, 1, v57);
  uint64_t v58 = v96;
  sub_24937AAE0();
  uint64_t v59 = sub_24937ABD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v99, 1, 1, v59);
  uint64_t v61 = v90;
  uint64_t v60 = v91;
  uint64_t v62 = v88;
  (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v88, v58, v91);
  uint64_t v63 = v85;
  uint64_t v64 = v95;
  v81(v85, v98, v95);
  unint64_t v65 = (*(unsigned __int8 *)(v61 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
  uint64_t v66 = v94;
  unint64_t v67 = (v86 + *(unsigned __int8 *)(v94 + 80) + v65) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80);
  v68 = (char *)swift_allocObject();
  *((void *)v68 + 2) = 0;
  *((void *)v68 + 3) = 0;
  uint64_t v69 = v93;
  *((void *)v68 + 4) = v92;
  *((void *)v68 + 5) = v69;
  *((void *)v68 + 6) = v100;
  (*(void (**)(char *, char *, uint64_t))(v61 + 32))(&v68[v65], v62, v60);
  (*(void (**)(char *, char *, uint64_t))(v66 + 32))(&v68[v67], v63, v64);
  swift_retain();
  sub_249365FFC(v99, (uint64_t)&unk_2696A18E0, (uint64_t)v68);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v96, v60);
}

uint64_t sub_249365BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[7] = a5;
  v6[8] = a6;
  v6[6] = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v9 = swift_getAssociatedConformanceWitness();
  uint64_t v10 = swift_getAssociatedConformanceWitness();
  _OWORD v6[2] = AssociatedTypeWitness;
  v6[3] = AssociatedConformanceWitness;
  v6[4] = v9;
  v6[5] = v10;
  v6[9] = sub_24937AAF0();
  uint64_t v11 = sub_24937AC00();
  v6[10] = v11;
  v6[11] = *(void *)(v11 - 8);
  v6[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249365D64, 0, 0);
}

uint64_t sub_249365D64()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[9];
  uint64_t v3 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v1, v0[7], v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((int)*MEMORY[0x263EFB4F8] + MEMORY[0x263EFB4F8]);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[13] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_249365EA4;
  uint64_t v5 = v0[12];
  uint64_t v6 = v0[8];
  return v8(v5, v6);
}

uint64_t sub_249365EA4()
{
  uint64_t v1 = *(void *)(*v0 + 96);
  uint64_t v2 = *(void *)(*v0 + 88);
  uint64_t v3 = *(void *)(*v0 + 80);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_249365FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24937ABD0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24937ABC0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2493678DC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24937ABB0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t LiveActivityService.update<A>(activity:with:alertConfiguration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  uint64_t v4 = sub_24937AB20();
  v3[11] = v4;
  v3[12] = *(void *)(v4 - 8);
  v3[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A18C0);
  v3[14] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3[15] = AssociatedTypeWitness;
  v3[16] = *(void *)(AssociatedTypeWitness - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v3[19] = AssociatedConformanceWitness;
  uint64_t v7 = swift_getAssociatedConformanceWitness();
  v3[20] = v7;
  uint64_t v8 = swift_getAssociatedConformanceWitness();
  v3[21] = v8;
  v3[2] = AssociatedTypeWitness;
  v3[3] = AssociatedConformanceWitness;
  v3[4] = v7;
  v3[5] = v8;
  uint64_t v9 = sub_24937AAF0();
  v3[22] = v9;
  v3[23] = *(void *)(v9 - 8);
  v3[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249366444, 0, 0);
}

uint64_t sub_249366444()
{
  uint64_t v39 = v0;
  uint64_t v1 = v0;
  uint64_t v34 = v0[17];
  uint64_t v3 = v0[14];
  uint64_t v2 = v0[15];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[13];
  uint64_t v32 = v0[11];
  uint64_t v6 = v0[9];
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[16] + 16);
  v7(v0[18], v6, v2);
  sub_24937AA40();
  uint64_t v8 = sub_24937AA50();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 0, 1, v8);
  sub_24937AAE0();
  uint64_t v9 = sub_249364114();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v5, v9, v32);
  v7(v34, v6, v2);
  swift_retain_n();
  uint64_t v10 = sub_24937AB00();
  os_log_type_t v11 = sub_24937ABF0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = v0[17];
    uint64_t v30 = v0[16];
    log = v10;
    uint64_t v13 = v0[15];
    uint64_t v33 = v0[12];
    uint64_t v35 = v0[11];
    uint64_t v36 = v0[13];
    uint64_t v14 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v38 = v29;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v15 = sub_24937AA60();
    v0[6] = sub_249366D20(v15, v16, &v38);
    sub_24937AC10();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v17 = Encodable.stringValue.getter();
    v0[7] = sub_249366D20(v17, v18, &v38);
    sub_24937AC10();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v12, v13);
    _os_log_impl(&dword_249362000, log, v11, "Updating activity: %s with state: %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C59CB30](v29, -1, -1);
    MEMORY[0x24C59CB30](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v36, v35);
  }
  else
  {
    uint64_t v20 = v0[16];
    uint64_t v19 = v0[17];
    uint64_t v21 = v0[15];
    uint64_t v23 = v1[12];
    uint64_t v22 = v1[13];
    uint64_t v24 = v1[11];
    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  }
  os_log_type_t v37 = (uint64_t (*)(uint64_t, uint64_t))((int)*MEMORY[0x263EFB508] + MEMORY[0x263EFB508]);
  uint64_t v25 = (void *)swift_task_alloc();
  v1[25] = v25;
  *uint64_t v25 = v1;
  v25[1] = sub_249366814;
  uint64_t v26 = v1[10];
  uint64_t v27 = v1[24];
  return v37(v27, v26);
}

uint64_t sub_249366814()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_249366910, 0, 0);
}

uint64_t sub_249366910()
{
  (*(void (**)(void, void))(v0[23] + 8))(v0[24], v0[22]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t LiveActivityService.deinit()
{
  return v0;
}

uint64_t type metadata accessor for LiveActivityService()
{
  return self;
}

uint64_t *LiveActivityServiceDebugUtils.debugCallback.unsafeMutableAddressor()
{
  return &static LiveActivityServiceDebugUtils.debugCallback;
}

uint64_t static LiveActivityServiceDebugUtils.debugCallback.getter()
{
  swift_beginAccess();
  uint64_t v0 = static LiveActivityServiceDebugUtils.debugCallback;
  sub_249367898(static LiveActivityServiceDebugUtils.debugCallback);
  return v0;
}

uint64_t static LiveActivityServiceDebugUtils.debugCallback.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v4 = static LiveActivityServiceDebugUtils.debugCallback;
  static LiveActivityServiceDebugUtils.debugCallback = a1;
  unk_2696A63B0 = a2;
  sub_249367898(a1);
  sub_2493678A8(v4);
  return sub_2493678A8(a1);
}

uint64_t (*static LiveActivityServiceDebugUtils.debugCallback.modify())()
{
  return j__swift_endAccess;
}

uint64_t LiveActivityServiceDebugUtils.deinit()
{
  return v0;
}

uint64_t LiveActivityServiceDebugUtils.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_249366B4C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_249366C28;
  return v6(a1);
}

uint64_t sub_249366C28()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_249366D20(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_249366DF4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_249367B70((uint64_t)v12, *a3);
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
      sub_249367B70((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_249366DF4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24937AC20();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_249366FB0(a5, a6);
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
  uint64_t v8 = sub_24937AC70();
  if (!v8)
  {
    sub_24937AC80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24937AC90();
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

uint64_t sub_249366FB0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_249367048(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_249367228(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_249367228(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_249367048(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2493671C0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24937AC40();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24937AC80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24937AB80();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24937AC90();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24937AC80();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2493671C0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1908);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_249367228(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1908);
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
  uint64_t result = sub_24937AC90();
  __break(1u);
  return result;
}

uint64_t sub_249367378()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v1 = sub_24937AAF0();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = sub_24937AAA0();
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_249367568()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v4 = swift_getAssociatedConformanceWitness();
  uint64_t v5 = swift_getAssociatedConformanceWitness();
  v1[2] = AssociatedTypeWitness;
  v1[3] = AssociatedConformanceWitness;
  v1[4] = v4;
  v1[5] = v5;
  uint64_t v6 = *(void *)(sub_24937AAF0() - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(sub_24937AAA0() - 8) + 80);
  unint64_t v10 = v7 + v8 + v9;
  uint64_t v11 = *(void *)(v0 + 48);
  uint64_t v12 = v0 + v7;
  uint64_t v13 = v0 + (v10 & ~v9);
  uint64_t v14 = (void *)swift_task_alloc();
  v1[6] = v14;
  *uint64_t v14 = v1;
  v14[1] = sub_24936774C;
  return sub_249365BB4((uint64_t)v14, v15, v16, v11, v12, v13);
}

uint64_t sub_24936774C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_249367840()
{
  unint64_t result = qword_2696A18E8;
  if (!qword_2696A18E8)
  {
    sub_24937AAA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A18E8);
  }
  return result;
}

uint64_t sub_249367898(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2493678A8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for LiveActivityServiceDebugUtils()
{
  return self;
}

uint64_t sub_2493678DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A18D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24936793C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_249367974(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_249367A2C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2696A18F8 + dword_2696A18F8);
  return v6(a1, v4);
}

uint64_t sub_249367A2C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
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

uint64_t sub_249367B70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

double LiveActivityPlacement.imageHeight.getter(char a1)
{
  return dbl_24937B2E8[a1];
}

uint64_t LiveActivitySetupAttributes.startTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24937AA50();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t LiveActivitySetupAttributes.init(startTime:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24937AA50();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t sub_249367CBC()
{
  return 1;
}

uint64_t sub_249367CCC()
{
  return 0x6D69547472617473;
}

uint64_t sub_249367CE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6D69547472617473 && a2 == 0xE900000000000065)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24937AD90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_249367D8C()
{
  return 0;
}

void sub_249367D98(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_249367DA4(uint64_t a1)
{
  unint64_t v2 = sub_249367FD4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249367DE0(uint64_t a1)
{
  unint64_t v2 = sub_249367FD4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LiveActivitySetupAttributes.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1910);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249367FD4();
  sub_24937AE10();
  sub_24937AA50();
  sub_24937A0AC(&qword_2696A1918, MEMORY[0x263F07490]);
  sub_24937AD80();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_249367FD4()
{
  unint64_t result = qword_2696A1BE0;
  if (!qword_2696A1BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1BE0);
  }
  return result;
}

uint64_t LiveActivitySetupAttributes.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t v4 = sub_24937AA50();
  uint64_t v14 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v17 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1920);
  uint64_t v16 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for LiveActivitySetupAttributes();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249367FD4();
  sub_24937AE00();
  if (!v2)
  {
    sub_24937A0AC(&qword_2696A1928, MEMORY[0x263F07490]);
    sub_24937AD10();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v6);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v17, v4);
    sub_2493682F4((uint64_t)v11, v15);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t type metadata accessor for LiveActivitySetupAttributes()
{
  uint64_t result = qword_26B15EAA0;
  if (!qword_26B15EAA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2493682F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LiveActivitySetupAttributes();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_249368358@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return LiveActivitySetupAttributes.init(from:)(a1, a2);
}

uint64_t sub_249368370(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1910);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249367FD4();
  sub_24937AE10();
  sub_24937AA50();
  sub_24937A0AC(&qword_2696A1918, MEMORY[0x263F07490]);
  sub_24937AD80();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void *LiveActivitySetupState.textMap.getter@<X0>(void *a1@<X8>)
{
  return sub_2493684F0(v1, a1);
}

void *sub_2493684F0(void *a1, void *a2)
{
  return initializeWithCopy for LiveActivityTextMap(a2, a1);
}

uint64_t LiveActivitySetupState.imageMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24936850C(v1 + 64, a1);
}

uint64_t sub_24936850C(uint64_t a1, uint64_t a2)
{
  return initializeWithCopy for LiveActivityImageMap(a2, a1);
}

uint64_t LiveActivitySetupState.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_249368528(v1 + 384, a1);
}

uint64_t sub_249368528(uint64_t a1, uint64_t a2)
{
  return initializeWithCopy for LiveActivityMetadata(a2, a1);
}

uint64_t LiveActivitySetupState.shouldSuppressAlert.getter()
{
  return *(unsigned __int8 *)(v0 + 425);
}

uint64_t LiveActivitySetupState.shouldSuppressAlert.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 425) = result;
  return result;
}

uint64_t (*LiveActivitySetupState.shouldSuppressAlert.modify())()
{
  return nullsub_1;
}

double sub_24936856C@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 40) = 0x80;
  return result;
}

uint64_t sub_249368584()
{
  return 0;
}

__n128 LiveActivitySetupState.init(textMap:imageMap:metadata:shouldSuppressAlert:)@<Q0>(uint64_t a1@<X0>, const void *a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  sub_24936861C(a3, v13);
  uint64_t v7 = v14;
  char v8 = v15;
  memcpy((void *)(a4 + 64), a2, 0x139uLL);
  uint64_t v9 = *(void *)(a1 + 8);
  __n128 result = (__n128)v13[0];
  long long v11 = v13[1];
  *(void *)a4 = *(void *)a1;
  *(void *)(a4 + 8) = v9;
  long long v12 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a4 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a4 + 32) = v12;
  *(_OWORD *)(a4 + 48) = *(_OWORD *)(a1 + 48);
  *(__n128 *)(a4 + 384) = result;
  *(_OWORD *)(a4 + 400) = v11;
  *(void *)(a4 + 416) = v7;
  *(unsigned char *)(a4 + 424) = v8;
  *(unsigned char *)(a4 + 425) = 0;
  return result;
}

_OWORD *sub_24936861C(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(long long *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

uint64_t LiveActivitySetupState.hash(into:)()
{
  long long v1 = v0[1];
  v6[0] = *v0;
  v6[1] = v1;
  long long v2 = v0[3];
  _OWORD v6[2] = v0[2];
  v6[3] = v2;
  sub_24936C950((uint64_t)v6);
  LiveActivityTextMap.hash(into:)();
  sub_24936C9F8((uint64_t)v6);
  memcpy(__dst, v0 + 4, 0x139uLL);
  sub_24936CB14((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CB00, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  LiveActivityImageMap.hash(into:)();
  sub_24936CB14((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CD44, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  sub_24936861C(v0 + 24, v4);
  sub_24936DFFC((uint64_t)v4, (void (*)(void, void, void, void, void, void))sub_24936DFB0);
  LiveActivityMetadata.hash(into:)();
  sub_24936DFFC((uint64_t)v4, (void (*)(void, void, void, void, void, void))sub_24936E03C);
  return sub_24937ADD0();
}

uint64_t static LiveActivitySetupState.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a1 + 16);
  v15[0] = *(_OWORD *)a1;
  v15[1] = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  v15[2] = *(_OWORD *)(a1 + 32);
  v15[3] = v5;
  long long v6 = *(_OWORD *)(a2 + 16);
  v14[0] = *(_OWORD *)a2;
  v14[1] = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  v14[2] = *(_OWORD *)(a2 + 32);
  v14[3] = v7;
  if ((_s18BridgeLiveActivity0bC7TextMapV23__derived_struct_equalsySbAC_ACtFZ_0(v15, v14) & 1) != 0
    && (memcpy(__dst, (const void *)(a1 + 64), 0x139uLL),
        memcpy(v12, (const void *)(a2 + 64), 0x139uLL),
        _s18BridgeLiveActivity0bC8ImageMapV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)__dst, (uint64_t)v12))
    && (sub_24936861C((long long *)(a1 + 384), v11),
        sub_24936861C((long long *)(a2 + 384), v10),
        _s18BridgeLiveActivity0bC8MetadataO21__derived_enum_equalsySbAC_ACtFZ_0(v11, v10)))
  {
    char v8 = ((*(unsigned char *)(a1 + 425) & 1) == 0) ^ *(unsigned char *)(a2 + 425);
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

BOOL sub_249368868(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_249368880()
{
  return sub_24937ADC0();
}

unint64_t sub_2493688B0()
{
  unint64_t result = 0x70614D74786574;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x70614D6567616D69;
      break;
    case 2:
      unint64_t result = 0x617461646174656DLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_249368944@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249370500(a1, a2);
  *a3 = result;
  return result;
}

void sub_24936896C(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_249368978(uint64_t a1)
{
  unint64_t v2 = sub_2493703B0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2493689B4(uint64_t a1)
{
  unint64_t v2 = sub_2493703B0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LiveActivitySetupState.encode(to:)(void *a1)
{
  long long v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1930);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2493703B0();
  sub_24937AE10();
  long long v9 = v3[1];
  v12[0] = *v3;
  v12[1] = v9;
  long long v10 = v3[3];
  v12[2] = v3[2];
  uint64_t v12[3] = v10;
  char v14 = 0;
  sub_249370404();
  sub_24937AD80();
  if (!v2)
  {
    memcpy(v12, v3 + 4, 0x139uLL);
    char v14 = 1;
    sub_249370458();
    sub_24937AD80();
    sub_24936861C(v3 + 24, v13);
    sub_24936861C(v13, v12);
    char v14 = 2;
    sub_2493704AC();
    sub_24937AD80();
    LOBYTE(v12[0]) = 3;
    sub_24937AD60();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t LiveActivitySetupState.hashValue.getter()
{
  sub_24937ADB0();
  long long v1 = v0[1];
  v6[0] = *v0;
  v6[1] = v1;
  long long v2 = v0[3];
  _OWORD v6[2] = v0[2];
  v6[3] = v2;
  sub_24936C950((uint64_t)v6);
  LiveActivityTextMap.hash(into:)();
  sub_24936C9F8((uint64_t)v6);
  memcpy(__dst, v0 + 4, 0x139uLL);
  sub_24936CB14((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CB00, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  LiveActivityImageMap.hash(into:)();
  sub_24936CB14((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CD44, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  sub_24936861C(v0 + 24, v4);
  sub_24936DFFC((uint64_t)v4, (void (*)(void, void, void, void, void, void))sub_24936DFB0);
  LiveActivityMetadata.hash(into:)();
  sub_24936DFFC((uint64_t)v4, (void (*)(void, void, void, void, void, void))sub_24936E03C);
  sub_24937ADD0();
  return sub_24937ADF0();
}

void *LiveActivitySetupState.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_2493706B8(a1, v5);
  if (!v2) {
    return memcpy(a2, v5, 0x1AAuLL);
  }
  return result;
}

void *sub_249368DC4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_2493706B8(a1, v5);
  if (!v2) {
    return memcpy(a2, v5, 0x1AAuLL);
  }
  return result;
}

uint64_t sub_249368E18(void *a1)
{
  memcpy(v4, v1, sizeof(v4));
  return LiveActivitySetupState.encode(to:)(a1);
}

uint64_t sub_249368E6C()
{
  long long v1 = v0[1];
  v6[0] = *v0;
  v6[1] = v1;
  long long v2 = v0[3];
  _OWORD v6[2] = v0[2];
  v6[3] = v2;
  memcpy(__dst, v0 + 4, 0x139uLL);
  sub_24936861C(v0 + 24, v4);
  sub_24937ADB0();
  sub_24936C950((uint64_t)v6);
  LiveActivityTextMap.hash(into:)();
  sub_24936C9F8((uint64_t)v6);
  sub_24936CB14((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CB00, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  LiveActivityImageMap.hash(into:)();
  sub_24936CB14((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CD44, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  sub_24936DFFC((uint64_t)v4, (void (*)(void, void, void, void, void, void))sub_24936DFB0);
  LiveActivityMetadata.hash(into:)();
  sub_24936DFFC((uint64_t)v4, (void (*)(void, void, void, void, void, void))sub_24936E03C);
  sub_24937ADD0();
  return sub_24937ADF0();
}

uint64_t sub_249368FC8()
{
  long long v1 = v0[1];
  v6[0] = *v0;
  v6[1] = v1;
  long long v2 = v0[3];
  _OWORD v6[2] = v0[2];
  v6[3] = v2;
  memcpy(__dst, v0 + 4, 0x139uLL);
  sub_24936861C(v0 + 24, v4);
  sub_24936C950((uint64_t)v6);
  LiveActivityTextMap.hash(into:)();
  sub_24936C9F8((uint64_t)v6);
  sub_24936CB14((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CB00, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  LiveActivityImageMap.hash(into:)();
  sub_24936CB14((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CD44, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  sub_24936DFFC((uint64_t)v4, (void (*)(void, void, void, void, void, void))sub_24936DFB0);
  LiveActivityMetadata.hash(into:)();
  sub_24936DFFC((uint64_t)v4, (void (*)(void, void, void, void, void, void))sub_24936E03C);
  return sub_24937ADD0();
}

uint64_t sub_249369110()
{
  long long v1 = v0[1];
  v6[0] = *v0;
  v6[1] = v1;
  long long v2 = v0[3];
  _OWORD v6[2] = v0[2];
  v6[3] = v2;
  memcpy(__dst, v0 + 4, 0x139uLL);
  sub_24936861C(v0 + 24, v4);
  sub_24937ADB0();
  sub_24936C950((uint64_t)v6);
  LiveActivityTextMap.hash(into:)();
  sub_24936C9F8((uint64_t)v6);
  sub_24936CB14((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CB00, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  LiveActivityImageMap.hash(into:)();
  sub_24936CB14((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CD44, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  sub_24936DFFC((uint64_t)v4, (void (*)(void, void, void, void, void, void))sub_24936DFB0);
  LiveActivityMetadata.hash(into:)();
  sub_24936DFFC((uint64_t)v4, (void (*)(void, void, void, void, void, void))sub_24936E03C);
  sub_24937ADD0();
  return sub_24937ADF0();
}

uint64_t sub_249369270(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a1 + 16);
  v15[0] = *(_OWORD *)a1;
  v15[1] = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  v15[2] = *(_OWORD *)(a1 + 32);
  v15[3] = v5;
  memcpy(__dst, (const void *)(a1 + 64), 0x139uLL);
  sub_24936861C((long long *)(a1 + 384), v11);
  int v6 = *(unsigned __int8 *)(a1 + 425);
  long long v7 = *(_OWORD *)(a2 + 16);
  v16[0] = *(_OWORD *)a2;
  v16[1] = v7;
  long long v8 = *(_OWORD *)(a2 + 48);
  v16[2] = *(_OWORD *)(a2 + 32);
  v16[3] = v8;
  memcpy(v14, (const void *)(a2 + 64), 0x139uLL);
  sub_24936861C((long long *)(a2 + 384), v12);
  int v9 = *(unsigned __int8 *)(a2 + 425);
  if ((_s18BridgeLiveActivity0bC7TextMapV23__derived_struct_equalsySbAC_ACtFZ_0(v15, v16) & 1) == 0
    || !_s18BridgeLiveActivity0bC8ImageMapV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)__dst, (uint64_t)v14))
  {
    return 0;
  }
  if (_s18BridgeLiveActivity0bC8MetadataO21__derived_enum_equalsySbAC_ACtFZ_0(v11, v12)) {
    return v6 ^ v9 ^ 1u;
  }
  return 0;
}

uint64_t LiveActivityImageSource.hash(into:)()
{
  sub_249370DA0(v0, (uint64_t)&v2);
  if (v3 && v3 != 1)
  {
    sub_24937ADC0();
    sub_24937AB70();
  }
  else
  {
    sub_24937ADC0();
  }
  return sub_24937AB70();
}

BOOL sub_2493693FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_249369414()
{
  if (*v0) {
    return 0x6150656C646E7562;
  }
  else {
    return 0x6D614E6567616D69;
  }
}

uint64_t sub_249369458@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249371050(a1, a2);
  *a3 = result;
  return result;
}

void sub_249369480(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24936948C(uint64_t a1)
{
  unint64_t v2 = sub_249370F54();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2493694C8(uint64_t a1)
{
  unint64_t v2 = sub_249370F54();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_249369504()
{
  uint64_t v1 = 1752457584;
  if (*v0 != 1) {
    uint64_t v1 = 0x6D49656C646E7562;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6D496D6574737973;
  }
}

uint64_t sub_24936955C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24937115C(a1, a2);
  *a3 = result;
  return result;
}

void sub_249369584(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_249369590(uint64_t a1)
{
  unint64_t v2 = sub_249370F00();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2493695CC(uint64_t a1)
{
  unint64_t v2 = sub_249370F00();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_249369608()
{
  return 12383;
}

uint64_t sub_249369618(uint64_t a1)
{
  unint64_t v2 = sub_249370FA8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249369654(uint64_t a1)
{
  unint64_t v2 = sub_249370FA8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_249369690()
{
  return sub_24937ADC0();
}

uint64_t sub_2493696B8()
{
  return 0x6D496D6574737973;
}

uint64_t sub_2493696DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6D496D6574737973 && a2 == 0xEF656D614E656761)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24937AD90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_249369798(uint64_t a1)
{
  unint64_t v2 = sub_249370FFC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2493697D4(uint64_t a1)
{
  unint64_t v2 = sub_249370FFC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LiveActivityImageSource.encode(to:)(void *a1)
{
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1950);
  uint64_t v18 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v22 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1958);
  uint64_t v20 = *(void *)(v3 - 8);
  uint64_t v21 = v3;
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1960);
  uint64_t v19 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1968);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  long long v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249370F00();
  sub_24937AE10();
  sub_249370DA0(v25, (uint64_t)&v26);
  if (v27)
  {
    uint64_t v13 = v24;
    uint64_t v25 = (long long *)v10;
    if (v27 == 1)
    {
      char v28 = 1;
      sub_249370FA8();
      sub_24937AD30();
      uint64_t v14 = v21;
      sub_24937AD50();
      uint64_t v15 = v20;
    }
    else
    {
      char v28 = 2;
      sub_249370F54();
      char v5 = v22;
      sub_24937AD30();
      char v28 = 0;
      uint64_t v14 = v23;
      sub_24937AD50();
      if (!v13)
      {
        char v28 = 1;
        sub_24937AD50();
      }
      uint64_t v15 = v18;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v14);
    return (*((uint64_t (**)(char *, uint64_t))v25 + 1))(v12, v9);
  }
  else
  {
    char v28 = 0;
    sub_249370FFC();
    sub_24937AD30();
    sub_24937AD50();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

uint64_t LiveActivityImageSource.hashValue.getter()
{
  sub_24937ADB0();
  sub_249370DA0(v0, (uint64_t)&v2);
  if (v3 && v3 != 1)
  {
    sub_24937ADC0();
    sub_24937AB70();
  }
  else
  {
    sub_24937ADC0();
  }
  sub_24937AB70();
  return sub_24937ADF0();
}

uint64_t LiveActivityImageSource.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_2493712D0(a1, (uint64_t *)v5);
  if (!v2) {
    return sub_249370DA0(v5, a2);
  }
  return result;
}

uint64_t sub_249369D60@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_2493712D0(a1, (uint64_t *)v5);
  if (!v2) {
    return sub_249370DA0(v5, a2);
  }
  return result;
}

uint64_t sub_249369DA8(void *a1)
{
  sub_249370DA0(v1, (uint64_t)v4);
  return LiveActivityImageSource.encode(to:)(a1);
}

uint64_t sub_249369DF8()
{
  unsigned int v1 = *(unsigned __int8 *)(v0 + 32);
  sub_24937ADB0();
  sub_24937ADC0();
  if (v1 > 1) {
    sub_24937AB70();
  }
  sub_24937AB70();
  return sub_24937ADF0();
}

uint64_t sub_249369EAC()
{
  if (*(unsigned char *)(v0 + 32) && *(unsigned char *)(v0 + 32) != 1)
  {
    sub_24937ADC0();
    sub_24937AB70();
  }
  else
  {
    sub_24937ADC0();
  }
  return sub_24937AB70();
}

uint64_t sub_249369F50()
{
  unsigned int v1 = *(unsigned __int8 *)(v0 + 32);
  sub_24937ADB0();
  sub_24937ADC0();
  if (v1 > 1) {
    sub_24937AB70();
  }
  sub_24937AB70();
  return sub_24937ADF0();
}

uint64_t sub_24936A000(long long *a1, long long *a2)
{
  sub_249370DA0(a1, (uint64_t)v4);
  sub_249370DA0(a2, (uint64_t)v5);
  return _s18BridgeLiveActivity0bC11ImageSourceO21__derived_enum_equalsySbAC_ACtFZ_0(v4, v5) & 1;
}

void *LiveActivityImageSource.defaultSystemImageName.unsafeMutableAddressor()
{
  return &static LiveActivityImageSource.defaultSystemImageName;
}

void *LiveActivityImageSource.systemAppleWatchSFSymbol.unsafeMutableAddressor()
{
  return &static LiveActivityImageSource.systemAppleWatchSFSymbol;
}

void static LiveActivityImageSource.systemAppleWatchSFSymbol.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0xD000000000000015;
  *(void *)(a1 + 8) = 0x800000024937D4C0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 0;
}

const char *LiveActivityImageSource.systemXCircleSFSymbol.unsafeMutableAddressor()
{
  return "x.circle.fill";
}

double static LiveActivityImageSource.systemXCircleSFSymbol.getter@<D0>(uint64_t a1@<X8>)
{
  double result = 3.68119924e180;
  *(_OWORD *)a1 = xmmword_24937B310;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 0;
  return result;
}

unint64_t static LiveActivityImageSource.defaultSystemImageName.getter()
{
  return 0xD000000000000015;
}

uint64_t LiveActivityImageMap.dynamicIslandCompact.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_249371948(v1, a1);
}

uint64_t LiveActivityImageMap.dynamicIslandMinimal.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_249372854(v1 + 80, a1, &qword_2696A1970);
}

uint64_t LiveActivityImageMap.dynamicIslandExpanded.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_249371948(v1 + 160, a1);
}

uint64_t LiveActivityImageMap.lockScreen.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_249372854(v1 + 240, a1, &qword_2696A1970);
}

__n128 LiveActivityImages.init(leadingImageSource:trailingImageSource:)@<Q0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_249372DFC(a2, (uint64_t)&v14, &qword_2696A1978);
  __n128 v11 = v14;
  uint64_t v5 = v15;
  uint64_t v6 = v16;
  char v7 = v17;
  sub_249370DA0(a1, (uint64_t)v12);
  char v8 = v13;
  long long v9 = v12[1];
  *(_OWORD *)a3 = v12[0];
  *(_OWORD *)(a3 + 16) = v9;
  *(unsigned char *)(a3 + 32) = v8;
  __n128 result = v11;
  *(__n128 *)(a3 + 40) = v11;
  *(void *)(a3 + 56) = v5;
  *(void *)(a3 + 64) = v6;
  *(unsigned char *)(a3 + 72) = v7;
  return result;
}

double sub_24936A1C4@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0xD000000000000015;
  *(void *)(a1 + 8) = 0x800000024937D4C0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(unsigned char *)(a1 + 72) = -1;
  return result;
}

__n128 LiveActivityImageMap.init(dynamicIslandCompact:dynamicIslandMinimal:dynamicIslandExpanded:lockScreen:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_249372DFC(a4, (uint64_t)v35, &qword_2696A1970);
  long long v30 = v35[1];
  long long v31 = v35[0];
  __n128 v28 = (__n128)v35[3];
  long long v29 = v35[2];
  uint64_t v27 = v36;
  char v26 = v37;
  uint64_t v9 = *((void *)a3 + 2);
  uint64_t v10 = *((void *)a3 + 3);
  char v11 = *((unsigned char *)a3 + 32);
  long long v24 = *(long long *)((char *)a3 + 40);
  long long v25 = *a3;
  uint64_t v12 = *((void *)a3 + 7);
  uint64_t v13 = *((void *)a3 + 8);
  LOBYTE(a3) = *((unsigned char *)a3 + 72);
  sub_249372DFC(a2, (uint64_t)v32, &qword_2696A1970);
  uint64_t v14 = v33;
  char v15 = v34;
  char v16 = *(unsigned char *)(a1 + 32);
  char v17 = *(unsigned char *)(a1 + 72);
  long long v18 = v32[0];
  long long v19 = v32[1];
  long long v20 = v32[2];
  long long v21 = v32[3];
  long long v22 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a5 = *(_OWORD *)a1;
  *(_OWORD *)(a5 + 16) = v22;
  *(unsigned char *)(a5 + 32) = v16;
  *(_OWORD *)(a5 + 40) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a5 + 56) = *(_OWORD *)(a1 + 56);
  *(unsigned char *)(a5 + 72) = v17;
  *(_OWORD *)(a5 + 80) = v18;
  *(_OWORD *)(a5 + 96) = v19;
  *(_OWORD *)(a5 + 112) = v20;
  *(_OWORD *)(a5 + 128) = v21;
  *(void *)(a5 + 144) = v14;
  *(unsigned char *)(a5 + 152) = v15;
  *(_OWORD *)(a5 + 160) = v25;
  *(void *)(a5 + 176) = v9;
  *(void *)(a5 + 184) = v10;
  *(unsigned char *)(a5 + 192) = v11;
  *(_OWORD *)(a5 + 200) = v24;
  *(void *)(a5 + 216) = v12;
  *(void *)(a5 + 224) = v13;
  *(unsigned char *)(a5 + 232) = (_BYTE)a3;
  *(_OWORD *)(a5 + 240) = v31;
  *(_OWORD *)(a5 + 256) = v30;
  __n128 result = v28;
  *(_OWORD *)(a5 + 272) = v29;
  *(__n128 *)(a5 + 288) = v28;
  *(void *)(a5 + 304) = v27;
  *(unsigned char *)(a5 + 312) = v26;
  return result;
}

double LiveActivityImageMap.init(imageName:bundlePath:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5 = a4;
  if (!a4)
  {
    id v10 = objc_msgSend(self, sel_mainBundle);
    id v11 = objc_msgSend(v10, sel_bundlePath);

    a3 = sub_24937AB30();
    uint64_t v5 = v12;
  }
  *(void *)a5 = 0xD000000000000015;
  *(void *)(a5 + 8) = 0x800000024937D4C0;
  *(void *)(a5 + 16) = 0;
  *(void *)(a5 + 24) = 0;
  *(unsigned char *)(a5 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)(a5 + 40) = 0u;
  *(_OWORD *)(a5 + 56) = 0u;
  *(unsigned char *)(a5 + 72) = -1;
  *(_OWORD *)(a5 + 80) = 0u;
  *(_OWORD *)(a5 + 96) = 0u;
  *(void *)(a5 + 112) = 255;
  *(_OWORD *)(a5 + 120) = 0u;
  *(_OWORD *)(a5 + 136) = 0u;
  *(unsigned char *)(a5 + 152) = 0;
  *(void *)(a5 + 160) = 0xD000000000000015;
  *(void *)(a5 + 168) = 0x800000024937D4C0;
  *(unsigned char *)(a5 + 192) = 0;
  *(void *)(a5 + 176) = 0;
  *(void *)(a5 + 184) = 0;
  *(_OWORD *)(a5 + 216) = 0u;
  *(_OWORD *)(a5 + 200) = 0u;
  *(unsigned char *)(a5 + 232) = -1;
  *(void *)(a5 + 240) = a1;
  *(void *)(a5 + 248) = a2;
  *(void *)(a5 + 256) = a3;
  *(void *)(a5 + 264) = v5;
  *(void *)(a5 + 272) = 2;
  *(_OWORD *)(a5 + 280) = 0u;
  *(_OWORD *)(a5 + 296) = 0u;
  *(unsigned char *)(a5 + 312) = -1;
  return result;
}

double LiveActivityImageMap.init(imagePath:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = 0xD000000000000015;
  *(void *)(a3 + 8) = 0x800000024937D4C0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(unsigned char *)(a3 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_OWORD *)(a3 + 56) = 0u;
  *(unsigned char *)(a3 + 72) = -1;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(void *)(a3 + 112) = 255;
  *(_OWORD *)(a3 + 120) = 0u;
  *(_OWORD *)(a3 + 136) = 0u;
  *(unsigned char *)(a3 + 152) = 0;
  *(void *)(a3 + 160) = 0xD000000000000015;
  *(void *)(a3 + 168) = 0x800000024937D4C0;
  *(unsigned char *)(a3 + 192) = 0;
  *(void *)(a3 + 176) = 0;
  *(void *)(a3 + 184) = 0;
  *(_OWORD *)(a3 + 216) = 0u;
  *(_OWORD *)(a3 + 200) = 0u;
  *(unsigned char *)(a3 + 232) = -1;
  *(void *)(a3 + 240) = a1;
  *(void *)(a3 + 248) = a2;
  *(void *)(a3 + 256) = 0;
  *(void *)(a3 + 264) = 0;
  *(void *)(a3 + 272) = 1;
  *(_OWORD *)(a3 + 280) = 0u;
  *(_OWORD *)(a3 + 296) = 0u;
  *(unsigned char *)(a3 + 312) = -1;
  return result;
}

uint64_t LiveActivityImageMap.subscript.getter@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = *((unsigned __int8 *)v2 + 112);
      if (v4 == 255) {
        goto LABEL_3;
      }
      unsigned __int8 v9 = *((unsigned char *)v2 + 152);
      long long v20 = *(long long *)((char *)v2 + 120);
      long long v22 = *(long long *)((char *)v2 + 136);
      long long v17 = v2[6];
      long long v19 = v2[5];
      sub_24936CAA0(*((void *)v2 + 10), *((void *)v2 + 11), *((void *)v2 + 12), *((void *)v2 + 13), v4);
      uint64_t result = sub_24936CB00(v20, *((uint64_t *)&v20 + 1), v22, *((uint64_t *)&v22 + 1), v9);
      goto LABEL_7;
    case 2:
      goto LABEL_5;
    case 3:
      uint64_t v4 = *((unsigned __int8 *)v2 + 272);
      if (v4 == 255)
      {
LABEL_5:
        long long v8 = v2[13];
        *(_OWORD *)long long v25 = v2[12];
        *(_OWORD *)&v25[16] = v8;
        *(_OWORD *)&v25[25] = *(long long *)((char *)v2 + 217);
        long long v6 = v2[10];
        long long v7 = v2[11];
LABEL_6:
        v24[0] = v6;
        v24[1] = v7;
        long long v20 = *(_OWORD *)&v25[8];
        long long v22 = *(_OWORD *)&v25[24];
        unsigned __int8 v9 = v25[40];
        long long v17 = v7;
        long long v19 = v6;
        LOBYTE(v4) = v25[0];
        uint64_t result = sub_249371998((uint64_t)v24, (void (*)(void, void, void, void, void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CB00);
LABEL_7:
        long long v12 = v17;
        long long v11 = v19;
        long long v13 = v20;
        long long v14 = v22;
      }
      else
      {
        long long v16 = v2[15];
        char v15 = v2 + 15;
        unsigned __int8 v9 = *((unsigned char *)v15 + 72);
        long long v23 = *(long long *)((char *)v15 + 56);
        long long v21 = *(long long *)((char *)v15 + 40);
        long long v18 = v15[1];
        sub_24936CAA0(v16, *((uint64_t *)&v16 + 1), *((void *)v15 + 2), *((void *)v15 + 3), v4);
        uint64_t result = sub_24936CB00(v21, *((uint64_t *)&v21 + 1), v23, *((uint64_t *)&v23 + 1), v9);
        long long v12 = v18;
        long long v11 = v16;
        long long v13 = v21;
        long long v14 = v23;
      }
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v12;
      *(unsigned char *)(a2 + 32) = v4;
      *(_OWORD *)(a2 + 40) = v13;
      *(_OWORD *)(a2 + 56) = v14;
      *(unsigned char *)(a2 + 72) = v9;
      return result;
    default:
LABEL_3:
      long long v5 = v2[3];
      *(_OWORD *)long long v25 = v2[2];
      *(_OWORD *)&v25[16] = v5;
      *(_OWORD *)&v25[25] = *(long long *)((char *)v2 + 57);
      long long v6 = *v2;
      long long v7 = v2[1];
      goto LABEL_6;
  }
}

void LiveActivityImageMap.hash(into:)()
{
  long long v1 = *(_OWORD *)(v0 + 48);
  long long v63 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)uint64_t v64 = v1;
  *(_OWORD *)&v64[9] = *(_OWORD *)(v0 + 57);
  long long v2 = *(_OWORD *)(v0 + 16);
  v62[0] = *(_OWORD *)v0;
  v62[1] = v2;
  sub_249370DA0(v62, (uint64_t)v65);
  sub_249370DA0(v65, (uint64_t)&v66);
  if (v67 && v67 != 1)
  {
    sub_24937ADC0();
    sub_249371998((uint64_t)v62, (void (*)(void, void, void, void, void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CB00);
    sub_249371958((uint64_t)v65, (void (*)(void, void, void, void, void))sub_24936CAA0);
    sub_24937AB70();
  }
  else
  {
    sub_24937ADC0();
    sub_249371998((uint64_t)v62, (void (*)(void, void, void, void, void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CB00);
    sub_249371958((uint64_t)v65, (void (*)(void, void, void, void, void))sub_24936CAA0);
  }
  sub_24937AB70();
  sub_249371958((uint64_t)v65, (void (*)(void, void, void, void, void))sub_24936CCE4);
  int v3 = v64[24];
  if (v64[24] == 255)
  {
    sub_24937ADD0();
  }
  else
  {
    uint64_t v4 = *((void *)&v63 + 1);
    long long v6 = *(_OWORD *)v64;
    uint64_t v5 = *(void *)&v64[16];
    sub_24937ADD0();
    if (v3)
    {
      sub_24937ADC0();
      if (v3 == 1)
      {
        sub_24936CAA0(v4, v6, *((uint64_t *)&v6 + 1), v5, 1u);
        sub_24937AB70();
        uint64_t v7 = v4;
        uint64_t v9 = *((void *)&v6 + 1);
        uint64_t v8 = v6;
        uint64_t v10 = v5;
        unsigned __int8 v11 = 1;
      }
      else
      {
        sub_24936CAA0(v4, v6, *((uint64_t *)&v6 + 1), v5, 2u);
        sub_24937AB70();
        sub_24937AB70();
        uint64_t v7 = v4;
        uint64_t v9 = *((void *)&v6 + 1);
        uint64_t v8 = v6;
        uint64_t v10 = v5;
        unsigned __int8 v11 = 2;
      }
    }
    else
    {
      sub_24937ADC0();
      sub_24936CAA0(v4, v6, *((uint64_t *)&v6 + 1), v5, 0);
      sub_24937AB70();
      uint64_t v7 = v4;
      uint64_t v9 = *((void *)&v6 + 1);
      uint64_t v8 = v6;
      uint64_t v10 = v5;
      unsigned __int8 v11 = 0;
    }
    sub_24936CD44(v7, v8, v9, v10, v11);
  }
  sub_249371998((uint64_t)v62, (void (*)(void, void, void, void, void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CD44);
  uint64_t v12 = *(void *)(v0 + 112);
  if (*(unsigned char *)(v0 + 112) == 0xFF)
  {
    sub_24937ADD0();
    goto LABEL_29;
  }
  uint64_t v14 = *(void *)(v0 + 80);
  uint64_t v13 = *(void *)(v0 + 88);
  uint64_t v15 = *(void *)(v0 + 104);
  uint64_t v16 = *(void *)(v0 + 120);
  uint64_t v54 = *(void *)(v0 + 128);
  uint64_t v17 = *(void *)(v0 + 144);
  uint64_t v55 = *(void *)(v0 + 136);
  uint64_t v56 = *(void *)(v0 + 96);
  int v18 = *(unsigned __int8 *)(v0 + 152);
  sub_24937ADD0();
  if (!(_BYTE)v12)
  {
    sub_24937ADC0();
    sub_24936CD58(v14, v13, v56, v15, v12, v16, v54, v55, v17, v18, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
    uint64_t v19 = v14;
    uint64_t v20 = v13;
    uint64_t v21 = v56;
    uint64_t v22 = v15;
    unsigned __int8 v23 = 0;
    goto LABEL_19;
  }
  if (v12 == 1)
  {
    sub_24937ADC0();
    sub_24936CD58(v14, v13, v56, v15, v12, v16, v54, v55, v17, v18, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
    uint64_t v19 = v14;
    uint64_t v20 = v13;
    uint64_t v21 = v56;
    uint64_t v22 = v15;
    unsigned __int8 v23 = 1;
LABEL_19:
    sub_24936CAA0(v19, v20, v21, v22, v23);
    goto LABEL_21;
  }
  sub_24937ADC0();
  sub_24936CD58(v14, v13, v56, v15, v12, v16, v54, v55, v17, v18, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  sub_24936CAA0(v14, v13, v56, v15, 2u);
  sub_24937AB70();
LABEL_21:
  sub_24937AB70();
  sub_24936CCE4(v14, v13, v56, v15, v12);
  if (v18 == 255)
  {
    sub_24937ADD0();
    sub_24936CD58(v14, v13, v56, v15, v12, v16, v54, v55, v17, 0xFFu, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  }
  else
  {
    sub_24937ADD0();
    if (v18)
    {
      if (v18 != 1)
      {
        sub_24937ADC0();
        sub_24936CAA0(v16, v54, v55, v17, 2u);
        sub_24937AB70();
        sub_24937AB70();
        sub_24936CD44(v16, v54, v55, v17, 2u);
        sub_24936CD58(v14, v13, v56, v15, v12, v16, v54, v55, v17, 2u, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
        goto LABEL_29;
      }
      sub_24937ADC0();
      uint64_t v25 = v54;
      uint64_t v24 = v55;
      sub_24936CAA0(v16, v54, v55, v17, 1u);
      sub_24937AB70();
      sub_24936CD44(v16, v54, v55, v17, 1u);
      unsigned __int8 v53 = 1;
    }
    else
    {
      sub_24937ADC0();
      uint64_t v25 = v54;
      uint64_t v24 = v55;
      sub_24936CAA0(v16, v54, v55, v17, 0);
      sub_24937AB70();
      sub_24936CD44(v16, v54, v55, v17, 0);
      unsigned __int8 v53 = 0;
    }
    sub_24936CD58(v14, v13, v56, v15, v12, v16, v25, v24, v17, v53, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  }
LABEL_29:
  long long v26 = *(_OWORD *)(v0 + 208);
  long long v59 = *(_OWORD *)(v0 + 192);
  *(_OWORD *)uint64_t v60 = v26;
  *(_OWORD *)&v60[9] = *(_OWORD *)(v0 + 217);
  long long v27 = *(_OWORD *)(v0 + 176);
  v58[0] = *(_OWORD *)(v0 + 160);
  v58[1] = v27;
  sub_249370DA0(v58, (uint64_t)v61);
  sub_249370DA0(v61, (uint64_t)&v68);
  if (v69 && v69 != 1)
  {
    sub_24937ADC0();
    sub_249371998((uint64_t)v58, (void (*)(void, void, void, void, void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CB00);
    sub_249371958((uint64_t)v61, (void (*)(void, void, void, void, void))sub_24936CAA0);
    sub_24937AB70();
  }
  else
  {
    sub_24937ADC0();
    sub_249371998((uint64_t)v58, (void (*)(void, void, void, void, void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CB00);
    sub_249371958((uint64_t)v61, (void (*)(void, void, void, void, void))sub_24936CAA0);
  }
  sub_24937AB70();
  sub_249371958((uint64_t)v61, (void (*)(void, void, void, void, void))sub_24936CCE4);
  int v28 = v60[24];
  if (v60[24] == 255)
  {
    sub_24937ADD0();
  }
  else
  {
    uint64_t v29 = *((void *)&v59 + 1);
    long long v31 = *(_OWORD *)v60;
    uint64_t v30 = *(void *)&v60[16];
    sub_24937ADD0();
    if (v28)
    {
      sub_24937ADC0();
      if (v28 == 1)
      {
        sub_24936CAA0(v29, v31, *((uint64_t *)&v31 + 1), v30, 1u);
        sub_24937AB70();
        uint64_t v32 = v29;
        uint64_t v34 = *((void *)&v31 + 1);
        uint64_t v33 = v31;
        uint64_t v35 = v30;
        unsigned __int8 v36 = 1;
      }
      else
      {
        sub_24936CAA0(v29, v31, *((uint64_t *)&v31 + 1), v30, 2u);
        sub_24937AB70();
        sub_24937AB70();
        uint64_t v32 = v29;
        uint64_t v34 = *((void *)&v31 + 1);
        uint64_t v33 = v31;
        uint64_t v35 = v30;
        unsigned __int8 v36 = 2;
      }
    }
    else
    {
      sub_24937ADC0();
      sub_24936CAA0(v29, v31, *((uint64_t *)&v31 + 1), v30, 0);
      sub_24937AB70();
      uint64_t v32 = v29;
      uint64_t v34 = *((void *)&v31 + 1);
      uint64_t v33 = v31;
      uint64_t v35 = v30;
      unsigned __int8 v36 = 0;
    }
    sub_24936CD44(v32, v33, v34, v35, v36);
  }
  sub_249371998((uint64_t)v58, (void (*)(void, void, void, void, void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CD44);
  uint64_t v37 = *(void *)(v0 + 272);
  if (*(unsigned char *)(v0 + 272) == 0xFF)
  {
    sub_24937ADD0();
    return;
  }
  uint64_t v39 = *(void *)(v0 + 240);
  uint64_t v38 = *(void *)(v0 + 248);
  uint64_t v41 = *(void *)(v0 + 256);
  uint64_t v40 = *(void *)(v0 + 264);
  uint64_t v43 = *(void *)(v0 + 280);
  uint64_t v42 = *(void *)(v0 + 288);
  uint64_t v44 = *(void *)(v0 + 304);
  uint64_t v57 = *(void *)(v0 + 296);
  int v45 = *(unsigned __int8 *)(v0 + 312);
  sub_24937ADD0();
  if (!(_BYTE)v37)
  {
    sub_24937ADC0();
    sub_24936CD58(v39, v38, v41, v40, v37, v43, v42, v57, v44, v45, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
    uint64_t v46 = v39;
    uint64_t v47 = v38;
    uint64_t v48 = v41;
    uint64_t v49 = v40;
    unsigned __int8 v50 = 0;
    goto LABEL_47;
  }
  if (v37 == 1)
  {
    sub_24937ADC0();
    sub_24936CD58(v39, v38, v41, v40, v37, v43, v42, v57, v44, v45, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
    uint64_t v46 = v39;
    uint64_t v47 = v38;
    uint64_t v48 = v41;
    uint64_t v49 = v40;
    unsigned __int8 v50 = 1;
LABEL_47:
    sub_24936CAA0(v46, v47, v48, v49, v50);
    goto LABEL_49;
  }
  sub_24937ADC0();
  sub_24936CD58(v39, v38, v41, v40, v37, v43, v42, v57, v44, v45, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  sub_24936CAA0(v39, v38, v41, v40, 2u);
  sub_24937AB70();
LABEL_49:
  sub_24937AB70();
  sub_24936CCE4(v39, v38, v41, v40, v37);
  if (v45 == 255)
  {
    sub_24937ADD0();
    sub_24936CD58(v39, v38, v41, v40, v37, v43, v42, v57, v44, 0xFFu, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  }
  else
  {
    sub_24937ADD0();
    if (v45)
    {
      sub_24937ADC0();
      if (v45 == 1)
      {
        uint64_t v51 = v57;
        sub_24936CAA0(v43, v42, v57, v44, 1u);
        sub_24937AB70();
        sub_24936CD44(v43, v42, v57, v44, 1u);
        unsigned __int8 v52 = 1;
      }
      else
      {
        uint64_t v51 = v57;
        sub_24936CAA0(v43, v42, v57, v44, 2u);
        sub_24937AB70();
        sub_24937AB70();
        sub_24936CD44(v43, v42, v57, v44, 2u);
        unsigned __int8 v52 = 2;
      }
      sub_24936CD58(v39, v38, v41, v40, v37, v43, v42, v51, v44, v52, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
    }
    else
    {
      sub_24937ADC0();
      sub_24936CAA0(v43, v42, v57, v44, 0);
      sub_24937AB70();
      sub_24936CD44(v43, v42, v57, v44, 0);
      sub_24936CD58(v39, v38, v41, v40, v37, v43, v42, v57, v44, 0, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
    }
  }
}

unint64_t sub_24936B464(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 0x657263536B636F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24936B4F4()
{
  return sub_24936B464(*v0);
}

uint64_t sub_24936B4FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249371BD4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24936B524(uint64_t a1)
{
  unint64_t v2 = sub_249371A1C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936B560(uint64_t a1)
{
  unint64_t v2 = sub_249371A1C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LiveActivityImageMap.encode(to:)(void *a1)
{
  int v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1980);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249371A1C();
  sub_24937AE10();
  long long v9 = v3[3];
  long long v16 = v3[2];
  v17[0] = v9;
  *(_OWORD *)((char *)v17 + 9) = *(long long *)((char *)v3 + 57);
  long long v10 = *v3;
  long long v15 = v3[1];
  long long v14 = v10;
  char v20 = 0;
  sub_249371A70();
  sub_24937AD80();
  if (!v2)
  {
    sub_249372DFC((uint64_t)(v3 + 5), (uint64_t)v19, &qword_2696A1970);
    sub_249372DFC((uint64_t)v19, (uint64_t)&v14, &qword_2696A1970);
    char v20 = 1;
    sub_24937AD40();
    long long v11 = v3[13];
    long long v16 = v3[12];
    v17[0] = v11;
    *(_OWORD *)((char *)v17 + 9) = *(long long *)((char *)v3 + 217);
    long long v12 = v3[10];
    long long v15 = v3[11];
    long long v14 = v12;
    char v20 = 2;
    sub_24937AD80();
    sub_249372DFC((uint64_t)(v3 + 15), (uint64_t)v18, &qword_2696A1970);
    sub_249372DFC((uint64_t)v18, (uint64_t)&v14, &qword_2696A1970);
    char v20 = 3;
    sub_24937AD40();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t LiveActivityImageMap.hashValue.getter()
{
  return sub_24937ADF0();
}

void *LiveActivityImageMap.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_249371D84(a1, v5);
  if (!v2) {
    return memcpy(a2, v5, 0x139uLL);
  }
  return result;
}

void *sub_24936B8D8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_249371D84(a1, v5);
  if (!v2) {
    return memcpy(a2, v5, 0x139uLL);
  }
  return result;
}

uint64_t sub_24936B92C(void *a1)
{
  memcpy(v4, v1, sizeof(v4));
  return LiveActivityImageMap.encode(to:)(a1);
}

uint64_t sub_24936B980()
{
  return sub_24937ADF0();
}

uint64_t sub_24936B9C4()
{
  return sub_24937ADF0();
}

BOOL sub_24936BA00(void *__src, const void *a2)
{
  memcpy(v4, __src, 0x139uLL);
  memcpy(__dst, a2, 0x139uLL);
  return _s18BridgeLiveActivity0bC8ImageMapV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v4, (uint64_t)__dst);
}

uint64_t LiveActivityImages.leadingImageSource.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2493727F0(v1, a1);
}

uint64_t LiveActivityImages.trailingImageSource.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_249372854(v1 + 40, a1, &qword_2696A1978);
}

uint64_t LiveActivityImages.hash(into:)()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  int v5 = *(unsigned __int8 *)(v0 + 32);
  if (*(unsigned char *)(v0 + 32) && v5 != 1)
  {
    sub_24937ADC0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24937AB70();
  }
  else
  {
    sub_24937ADC0();
    swift_bridgeObjectRetain();
  }
  sub_24937AB70();
  sub_24936CCE4(v1, v2, v3, v4, v5);
  int v6 = *(unsigned __int8 *)(v0 + 72);
  if (v6 == 255) {
    return sub_24937ADD0();
  }
  uint64_t v9 = *(void *)(v0 + 40);
  uint64_t v8 = *(void *)(v0 + 48);
  uint64_t v11 = *(void *)(v0 + 56);
  uint64_t v10 = *(void *)(v0 + 64);
  sub_24937ADD0();
  if (v6)
  {
    sub_24937ADC0();
    if (v6 == 1)
    {
      sub_24936CAA0(v9, v8, v11, v10, 1u);
      sub_24937AB70();
      uint64_t v12 = v9;
      uint64_t v13 = v8;
      uint64_t v14 = v11;
      uint64_t v15 = v10;
      unsigned __int8 v16 = 1;
    }
    else
    {
      sub_24936CAA0(v9, v8, v11, v10, 2u);
      sub_24937AB70();
      sub_24937AB70();
      uint64_t v12 = v9;
      uint64_t v13 = v8;
      uint64_t v14 = v11;
      uint64_t v15 = v10;
      unsigned __int8 v16 = 2;
    }
  }
  else
  {
    sub_24937ADC0();
    sub_24936CAA0(v9, v8, v11, v10, 0);
    sub_24937AB70();
    uint64_t v12 = v9;
    uint64_t v13 = v8;
    uint64_t v14 = v11;
    uint64_t v15 = v10;
    unsigned __int8 v16 = 0;
  }
  return sub_24936CD44(v12, v13, v14, v15, v16);
}

unint64_t sub_24936BC94()
{
  if (*v0) {
    return 0xD000000000000013;
  }
  else {
    return 0xD000000000000012;
  }
}

uint64_t sub_24936BCD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249372960(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24936BCFC(uint64_t a1)
{
  unint64_t v2 = sub_2493728B8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936BD38(uint64_t a1)
{
  unint64_t v2 = sub_2493728B8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LiveActivityImages.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1990);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2493728B8();
  sub_24937AE10();
  sub_249370DA0(v3, (uint64_t)v13);
  sub_249370DA0(v13, (uint64_t)v11);
  HIBYTE(v10) = 0;
  sub_24937290C();
  sub_24937AD80();
  if (!v2)
  {
    sub_249372DFC((uint64_t)v3 + 40, (uint64_t)v12, &qword_2696A1978);
    sub_249372DFC((uint64_t)v12, (uint64_t)v11, &qword_2696A1978);
    HIBYTE(v10) = 1;
    sub_24937AD40();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t LiveActivityImages.hashValue.getter()
{
  sub_24937ADB0();
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  int v5 = *(unsigned __int8 *)(v0 + 32);
  if (*(unsigned char *)(v0 + 32) && v5 != 1)
  {
    sub_24937ADC0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24937AB70();
  }
  else
  {
    sub_24937ADC0();
    swift_bridgeObjectRetain();
  }
  sub_24937AB70();
  sub_24936CCE4(v1, v2, v3, v4, v5);
  int v6 = *(unsigned __int8 *)(v0 + 72);
  if (v6 == 255)
  {
    sub_24937ADD0();
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 40);
    uint64_t v7 = *(void *)(v0 + 48);
    uint64_t v10 = *(void *)(v0 + 56);
    uint64_t v9 = *(void *)(v0 + 64);
    sub_24937ADD0();
    if (v6)
    {
      sub_24937ADC0();
      swift_bridgeObjectRetain();
      if (v6 == 1)
      {
        sub_24937AB70();
        uint64_t v11 = v8;
        uint64_t v12 = v7;
        uint64_t v13 = v10;
        uint64_t v14 = v9;
        unsigned __int8 v15 = 1;
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_24937AB70();
        sub_24937AB70();
        uint64_t v11 = v8;
        uint64_t v12 = v7;
        uint64_t v13 = v10;
        uint64_t v14 = v9;
        unsigned __int8 v15 = 2;
      }
    }
    else
    {
      sub_24937ADC0();
      swift_bridgeObjectRetain();
      sub_24937AB70();
      uint64_t v11 = v8;
      uint64_t v12 = v7;
      uint64_t v13 = v10;
      uint64_t v14 = v9;
      unsigned __int8 v15 = 0;
    }
    sub_24936CD44(v11, v12, v13, v14, v15);
  }
  return sub_24937ADF0();
}

__n128 LiveActivityImages.init(from:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_249372A4C(a1, (uint64_t)v6);
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

__n128 sub_24936C16C@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_249372A4C(a1, (uint64_t)v6);
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

uint64_t sub_24936C1B8(void *a1)
{
  return LiveActivityImages.encode(to:)(a1);
}

uint64_t sub_24936C204()
{
  return sub_24937ADF0();
}

BOOL sub_24936C240(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[3];
  _OWORD v7[2] = a1[2];
  v8[0] = v2;
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)((char *)a1 + 57);
  long long v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  long long v4 = a2[3];
  v9[2] = a2[2];
  v10[0] = v4;
  *(_OWORD *)((char *)v10 + 9) = *(_OWORD *)((char *)a2 + 57);
  long long v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return _s18BridgeLiveActivity0bC6ImagesV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v7, (uint64_t)v9);
}

uint64_t LiveActivityTextMap.dynamicIslandExpanded.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LiveActivityTextMap.lockScreen.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_24936C9B4(v1, *(void *)(v0 + 40));
  return v1;
}

void __swiftcall LiveActivityTextMap.init(dynamicIslandExpanded:lockScreen:)(BridgeLiveActivity::LiveActivityTextMap *__return_ptr retstr, BridgeLiveActivity::LiveActivityText dynamicIslandExpanded, BridgeLiveActivity::LiveActivityText_optional lockScreen)
{
  retstr->dynamicIslandExpanded = dynamicIslandExpanded;
  retstr->lockScreen = lockScreen;
}

uint64_t LiveActivityTextMap.subscript.getter(unsigned __int8 a1)
{
  if (a1 > 2u && v1[5]) {
    uint64_t v2 = v1[4];
  }
  else {
    uint64_t v2 = *v1;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t LiveActivityTextMap.hash(into:)()
{
  uint64_t v1 = v0[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  sub_24937AB70();
  swift_bridgeObjectRelease();
  if (!v1)
  {
    sub_24937ADD0();
    swift_bridgeObjectRelease();
    uint64_t v2 = v0[5];
    if (v2) {
      goto LABEL_3;
    }
    return sub_24937ADD0();
  }
  sub_24937ADD0();
  swift_bridgeObjectRetain();
  sub_24937AB70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  uint64_t v2 = v0[5];
  if (!v2) {
    return sub_24937ADD0();
  }
LABEL_3:
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[7];
  sub_24937ADD0();
  sub_24936C9B4(v3, v2);
  sub_24936C9B4(v3, v2);
  swift_bridgeObjectRetain();
  sub_24937AB70();
  swift_bridgeObjectRelease();
  sub_24937ADD0();
  if (v4)
  {
    swift_bridgeObjectRetain();
    sub_24937AB70();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return sub_24936CA5C(v3, v2);
}

uint64_t sub_24936C574()
{
  if (*v0) {
    return 0x657263536B636F6CLL;
  }
  else {
    return 0xD000000000000015;
  }
}

uint64_t sub_24936C5B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249372E60(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24936C5E0(uint64_t a1)
{
  unint64_t v2 = sub_249372D54();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936C61C(uint64_t a1)
{
  unint64_t v2 = sub_249372D54();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LiveActivityTextMap.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A19A0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249372D54();
  sub_24937AE10();
  long long v9 = v3[1];
  v13[0] = *v3;
  v13[1] = v9;
  char v12 = 0;
  sub_249372DA8();
  sub_24937AD80();
  if (!v2)
  {
    sub_249372DFC((uint64_t)(v3 + 2), (uint64_t)v14, &qword_2696A19B0);
    sub_249372DFC((uint64_t)v14, (uint64_t)v13, &qword_2696A19B0);
    char v12 = 1;
    sub_24937AD40();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t LiveActivityTextMap.hashValue.getter()
{
  return sub_24937ADF0();
}

double LiveActivityTextMap.init(from:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_249372F5C(a1, (uint64_t *)v7);
  if (!v2)
  {
    long long v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    double result = *(double *)&v8;
    long long v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

double sub_24936C88C@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_249372F5C(a1, (uint64_t *)v7);
  if (!v2)
  {
    long long v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    double result = *(double *)&v8;
    long long v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

uint64_t sub_24936C8D0(void *a1)
{
  return LiveActivityTextMap.encode(to:)(a1);
}

uint64_t sub_24936C90C()
{
  return sub_24937ADF0();
}

uint64_t sub_24936C950(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24936C9B4(v2, v3);
  return a1;
}

uint64_t sub_24936C9B4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24936C9F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24936CA5C(v2, v3);
  return a1;
}

uint64_t sub_24936CA5C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24936CAA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 >= 2u)
  {
    if (a5 != 2) {
      return result;
    }
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_24936CB00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 0xFF) {
    return sub_24936CAA0(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t sub_24936CB14(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), void (*a4)(void), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v25 = *(void *)(a1 + 88);
  uint64_t v26 = *(void *)(a1 + 80);
  uint64_t v23 = *(void *)(a1 + 104);
  uint64_t v24 = *(void *)(a1 + 96);
  uint64_t v21 = *(void *)(a1 + 120);
  uint64_t v22 = *(void *)(a1 + 112);
  uint64_t v19 = *(void *)(a1 + 136);
  uint64_t v20 = *(void *)(a1 + 128);
  uint64_t v16 = *(void *)(a1 + 144);
  uint64_t v17 = *(void *)(a1 + 48);
  unsigned __int8 v12 = *(unsigned char *)(a1 + 152);
  uint64_t v29 = *(void *)(a1 + 168);
  uint64_t v30 = *(void *)(a1 + 160);
  uint64_t v27 = *(void *)(a1 + 184);
  uint64_t v28 = *(void *)(a1 + 176);
  uint64_t v35 = *(void *)(a1 + 208);
  uint64_t v36 = *(void *)(a1 + 200);
  uint64_t v33 = *(void *)(a1 + 224);
  uint64_t v34 = *(void *)(a1 + 216);
  uint64_t v44 = *(void *)(a1 + 248);
  uint64_t v45 = *(void *)(a1 + 240);
  uint64_t v42 = *(void *)(a1 + 264);
  uint64_t v43 = *(void *)(a1 + 256);
  uint64_t v40 = *(void *)(a1 + 280);
  uint64_t v41 = *(void *)(a1 + 272);
  uint64_t v38 = *(void *)(a1 + 296);
  uint64_t v39 = *(void *)(a1 + 288);
  uint64_t v32 = *(void *)(a1 + 304);
  unsigned __int8 v31 = *(unsigned char *)(a1 + 312);
  uint64_t v13 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 192);
  unsigned int v18 = *(unsigned __int8 *)(a1 + 232);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  a3(v9, v17, v10, v11, v13);
  sub_24936CD58(v26, v25, v24, v23, v22, v21, v20, v19, v16, v12, a4, a5);
  a2(v30, v29, v28, v27, v14);
  a3(v36, v35, v34, v33, v18);
  sub_24936CD58(v45, v44, v43, v42, v41, v40, v39, v38, v32, v31, a4, a5);
  return a1;
}

uint64_t sub_24936CCE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 >= 2u)
  {
    if (a5 != 2) {
      return result;
    }
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_24936CD44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 0xFF) {
    return sub_24936CCE4(a1, a2, a3, a4, a5);
  }
  return a1;
}

void sub_24936CD58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10, void (*a11)(void), void (*a12)(uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  if (a5 != -1)
  {
    a11();
    a12(a6, a7, a8, a9, a10);
  }
}

uint64_t sub_24936CDF0()
{
  return sub_24937ADF0();
}

uint64_t sub_24936CE2C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = a1[3];
  _OWORD v7[2] = a1[2];
  _OWORD v7[3] = v3;
  long long v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  long long v5 = a2[3];
  _OWORD v8[2] = a2[2];
  v8[3] = v5;
  return _s18BridgeLiveActivity0bC7TextMapV23__derived_struct_equalsySbAC_ACtFZ_0(v7, v8) & 1;
}

uint64_t LiveActivityText.title.getter(uint64_t a1)
{
  return a1;
}

uint64_t LiveActivityText.subtitle.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t LiveActivityText.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_bridgeObjectRetain();
  sub_24937AB70();
  swift_bridgeObjectRelease();
  if (!a5) {
    return sub_24937ADD0();
  }
  sub_24937ADD0();
  swift_bridgeObjectRetain();
  sub_24937AB70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24936CF98()
{
  if (*v0) {
    return 0x656C746974627573;
  }
  else {
    return 0x656C746974;
  }
}

uint64_t sub_24936CFD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249373240(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24936CFF8(uint64_t a1)
{
  unint64_t v2 = sub_2493731EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936D034(uint64_t a1)
{
  unint64_t v2 = sub_2493731EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LiveActivityText.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_24936E3E0(a1, a2, a3, a4, a5, &qword_2696A19B8, (void (*)(void))sub_2493731EC, (uint64_t)&type metadata for LiveActivityText.CodingKeys, MEMORY[0x263F8E050]);
}

uint64_t LiveActivityText.hashValue.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    swift_bridgeObjectRetain();
    sub_24937AB70();
    swift_bridgeObjectRelease();
  }
  return sub_24937ADF0();
}

uint64_t LiveActivityText.init(from:)(uint64_t a1)
{
  return sub_24936E618(a1, (uint64_t (*)(void))sub_24937332C);
}

uint64_t sub_24936D1A0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_24937332C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_24936D1D0(void *a1)
{
  return LiveActivityText.encode(to:)(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_24936D1F0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_24937ADB0();
  swift_bridgeObjectRetain();
  sub_24937AB70();
  swift_bridgeObjectRelease();
  sub_24937ADD0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_24937AB70();
    swift_bridgeObjectRelease();
  }
  return sub_24937ADF0();
}

uint64_t sub_24936D29C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  sub_24937AB70();
  swift_bridgeObjectRelease();
  if (!v1) {
    return sub_24937ADD0();
  }
  sub_24937ADD0();
  swift_bridgeObjectRetain();
  sub_24937AB70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24936D350()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_24937ADB0();
  swift_bridgeObjectRetain();
  sub_24937AB70();
  swift_bridgeObjectRelease();
  sub_24937ADD0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_24937AB70();
    swift_bridgeObjectRelease();
  }
  return sub_24937ADF0();
}

uint64_t sub_24936D3F8(uint64_t *a1, uint64_t *a2)
{
  return _s18BridgeLiveActivity0bC4TextV23__derived_struct_equalsySbAC_ACtFZ_0(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t LiveActivityMetadata.hash(into:)()
{
  sub_24936861C(v0, &v3);
  int v1 = v4 >> 6;
  if (v1)
  {
    if (v1 == 1)
    {
      v4 &= 0x3Fu;
      sub_24937ADC0();
      sub_24937ADE0();
      sub_24937ADE0();
      sub_24937ADE0();
      sub_24937ADE0();
      sub_24937ADE0();
    }
    return sub_24937ADC0();
  }
  else
  {
    v4 &= 0x3Fu;
    sub_24937ADC0();
    swift_bridgeObjectRetain();
    sub_24937AB70();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24937AB70();
    return swift_bridgeObjectRelease();
  }
}

uint64_t static LiveActivityMetadata.WristSelectionMetadata.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 == a5 && a2 == a6 || (v12 = sub_24937AD90(), uint64_t result = 0, (v12 & 1) != 0))
  {
    if (a3 == a7 && a4 == a8)
    {
      return 1;
    }
    else
    {
      return sub_24937AD90();
    }
  }
  return result;
}

uint64_t sub_24936D5E8()
{
  uint64_t v1 = 0x6C65537473697277;
  if (*v0 != 1) {
    uint64_t v1 = 0x73736572676F7270;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701736302;
  }
}

uint64_t sub_24936D648@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24937372C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24936D670(uint64_t a1)
{
  unint64_t v2 = sub_249373534();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936D6AC(uint64_t a1)
{
  unint64_t v2 = sub_249373534();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24936D6E8()
{
  return 0;
}

uint64_t sub_24936D6F4(uint64_t a1)
{
  unint64_t v2 = sub_2493736D8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936D730(uint64_t a1)
{
  unint64_t v2 = sub_2493736D8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24936D76C(uint64_t a1)
{
  unint64_t v2 = sub_249373588();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936D7A8(uint64_t a1)
{
  unint64_t v2 = sub_249373588();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24936D7E4()
{
  return sub_24937ADF0();
}

uint64_t sub_24936D828()
{
  return sub_24937ADF0();
}

uint64_t sub_24936D868@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24937AD90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24936D8E8(uint64_t a1)
{
  unint64_t v2 = sub_249373630();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936D924(uint64_t a1)
{
  unint64_t v2 = sub_249373630();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LiveActivityMetadata.encode(to:)(void *a1)
{
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A19C0);
  uint64_t v22 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v21 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A19C8);
  uint64_t v19 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  unsigned __int8 v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A19D0);
  uint64_t v18 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A19D8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249373534();
  sub_24937AE10();
  sub_24936861C(v24, &v27);
  int v12 = v28[24] >> 6;
  if (!v12)
  {
    v28[24] &= 0x3Fu;
    long long v29 = v27;
    long long v30 = *(_OWORD *)v28;
    LOBYTE(v25) = 1;
    sub_249373630();
    sub_24937AD30();
    long long v25 = v29;
    v26[0] = v30;
    sub_249373684();
    uint64_t v15 = v20;
    sub_24937AD80();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v15);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  if (v12 == 1)
  {
    v28[24] &= 0x3Fu;
    long long v31 = v27;
    v32[0] = *(_OWORD *)v28;
    *(_OWORD *)((char *)v32 + 9) = *(_OWORD *)&v28[9];
    LOBYTE(v25) = 2;
    sub_249373588();
    uint64_t v13 = v21;
    sub_24937AD30();
    long long v25 = v31;
    v26[0] = v32[0];
    *(_OWORD *)((char *)v26 + 9) = *(_OWORD *)((char *)v32 + 9);
    sub_2493735DC();
    uint64_t v14 = v23;
    sub_24937AD80();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v14);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  LOBYTE(v25) = 0;
  sub_2493736D8();
  sub_24937AD30();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t LiveActivityMetadata.hashValue.getter()
{
  return sub_24937ADF0();
}

_OWORD *LiveActivityMetadata.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t result = (_OWORD *)sub_249373898(a1, v5);
  if (!v2) {
    return sub_24936861C(v5, a2);
  }
  return result;
}

_OWORD *sub_24936DE88@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t result = (_OWORD *)sub_249373898(a1, v5);
  if (!v2) {
    return sub_24936861C(v5, a2);
  }
  return result;
}

uint64_t sub_24936DED0(void *a1)
{
  sub_24936861C(v1, v4);
  return LiveActivityMetadata.encode(to:)(a1);
}

uint64_t sub_24936DF20()
{
  sub_24936861C(v0, v2);
  sub_24937ADB0();
  LiveActivityMetadata.hash(into:)();
  return sub_24937ADF0();
}

uint64_t sub_24936DF70()
{
  sub_24936861C(v0, v2);
  return LiveActivityMetadata.hash(into:)();
}

uint64_t sub_24936DFB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 <= 0x3Fu)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24936DFFC(uint64_t a1, void (*a2)(void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_24936E03C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 <= 0x3Fu)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24936E088()
{
  sub_24936861C(v0, v2);
  sub_24937ADB0();
  LiveActivityMetadata.hash(into:)();
  return sub_24937ADF0();
}

BOOL sub_24936E0DC(long long *a1, long long *a2)
{
  sub_24936861C(a1, v4);
  sub_24936861C(a2, v5);
  return _s18BridgeLiveActivity0bC8MetadataO21__derived_enum_equalsySbAC_ACtFZ_0(v4, v5);
}

uint64_t LiveActivityMetadata.WristSelectionMetadata.leftText.getter(uint64_t a1)
{
  return a1;
}

uint64_t LiveActivityMetadata.WristSelectionMetadata.rightText.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t LiveActivityMetadata.WristSelectionMetadata.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_24937AB70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24937AB70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24936E21C()
{
  return sub_24937ADF0();
}

uint64_t sub_24936E264()
{
  return sub_24937ADF0();
}

uint64_t sub_24936E2A8()
{
  if (*v0) {
    return 0x7865547468676972;
  }
  else {
    return 0x747865547466656CLL;
  }
}

uint64_t sub_24936E2E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249373F44(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24936E310(uint64_t a1)
{
  unint64_t v2 = sub_249373EF0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936E34C(uint64_t a1)
{
  unint64_t v2 = sub_249373EF0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LiveActivityMetadata.WristSelectionMetadata.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_24936E3E0(a1, a2, a3, a4, a5, &qword_2696A19F0, (void (*)(void))sub_249373EF0, (uint64_t)&type metadata for LiveActivityMetadata.WristSelectionMetadata.CodingKeys, MEMORY[0x263F8E060]);
}

uint64_t sub_24936E3E0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, void (*a7)(void), uint64_t a8, void (*a9)(uint64_t, uint64_t, unsigned char *, uint64_t))
{
  uint64_t v19 = a3;
  uint64_t v17 = a4;
  uint64_t v18 = a5;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(a6);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a7();
  sub_24937AE10();
  v21[1] = 0;
  uint64_t v15 = v20;
  sub_24937AD50();
  if (!v15)
  {
    v21[0] = 1;
    a9(v17, v18, v21, v11);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t LiveActivityMetadata.WristSelectionMetadata.hashValue.getter()
{
  return sub_24937ADF0();
}

uint64_t LiveActivityMetadata.WristSelectionMetadata.init(from:)(uint64_t a1)
{
  return sub_24936E618(a1, (uint64_t (*)(void))sub_249374044);
}

uint64_t sub_24936E618(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2();
  if (v2) {
    return v4;
  }
  return result;
}

uint64_t sub_24936E648@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_249374044(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_24936E678(void *a1)
{
  return LiveActivityMetadata.WristSelectionMetadata.encode(to:)(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_24936E698()
{
  return sub_24937ADF0();
}

uint64_t sub_24936E720()
{
  swift_bridgeObjectRetain();
  sub_24937AB70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24937AB70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24936E7A4()
{
  return sub_24937ADF0();
}

uint64_t sub_24936E828(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (char v7 = sub_24937AD90(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return sub_24937AD90();
    }
  }
  return result;
}

double LiveActivityMetadata.ProgressMetadata.progress.getter()
{
  return *(double *)v0;
}

double LiveActivityMetadata.ProgressMetadata.positionFactor.getter()
{
  return *(double *)(v0 + 8);
}

double LiveActivityMetadata.ProgressMetadata.sizeFactor.getter()
{
  return *(double *)(v0 + 24);
}

uint64_t LiveActivityMetadata.ProgressMetadata.watchAssetType.getter()
{
  return *(unsigned __int8 *)(v0 + 40);
}

void __swiftcall LiveActivityMetadata.ProgressMetadata.init(progress:positionFactor:sizeFactor:watchAssetType:)(BridgeLiveActivity::LiveActivityMetadata::ProgressMetadata *__return_ptr retstr, Swift::Double progress, CGPoint positionFactor, CGPoint sizeFactor, BridgeLiveActivity::LiveActivityWatchAssetType watchAssetType)
{
  retstr->progress = progress;
  retstr->positionFactor.x = positionFactor.x;
  retstr->positionFactor.y = positionFactor.y;
  retstr->sizeFactor.x = sizeFactor.x;
  retstr->sizeFactor.y = sizeFactor.y;
  retstr->watchAssetType = watchAssetType;
}

uint64_t LiveActivityMetadata.ProgressMetadata.hash(into:)()
{
  return sub_24937ADC0();
}

BOOL static LiveActivityWatchAssetType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24936E98C()
{
  uint64_t result = 0x73736572676F7270;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6E6F697469736F70;
      break;
    case 2:
      uint64_t result = 0x74636146657A6973;
      break;
    case 3:
      uint64_t result = 0x7373416863746177;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24936EA38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24937434C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24936EA60(uint64_t a1)
{
  unint64_t v2 = sub_24937424C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936EA9C(uint64_t a1)
{
  unint64_t v2 = sub_24937424C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LiveActivityMetadata.ProgressMetadata.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A19F8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24937424C();
  sub_24937AE10();
  LOBYTE(v12) = 0;
  sub_24937AD70();
  if (!v2)
  {
    long long v12 = *(_OWORD *)(v3 + 8);
    char v11 = 1;
    type metadata accessor for CGPoint();
    sub_24937A0AC(&qword_2696A1A00, (void (*)(uint64_t))type metadata accessor for CGPoint);
    sub_24937AD80();
    long long v12 = *(_OWORD *)(v3 + 24);
    char v11 = 2;
    sub_24937AD80();
    LOBYTE(v12) = *(unsigned char *)(v3 + 40);
    char v11 = 3;
    sub_2493742F8();
    sub_24937AD80();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t LiveActivityMetadata.ProgressMetadata.hashValue.getter()
{
  return sub_24937ADF0();
}

double LiveActivityMetadata.ProgressMetadata.init(from:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_24937455C(a1, (uint64_t)&v6);
  if (!v2)
  {
    long long v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

double sub_24936ED88@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_24937455C(a1, (uint64_t)&v6);
  if (!v2)
  {
    long long v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

uint64_t sub_24936EDCC(void *a1)
{
  return LiveActivityMetadata.ProgressMetadata.encode(to:)(a1);
}

uint64_t sub_24936EDE4()
{
  return sub_24937ADF0();
}

uint64_t sub_24936EE28()
{
  return sub_24937ADF0();
}

BOOL sub_24936EE64(long long *a1, long long *a2)
{
  long long v2 = a1[1];
  long long v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  long long v3 = a2[1];
  long long v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 9) = *(long long *)((char *)a2 + 25);
  return _s18BridgeLiveActivity0bC8MetadataO08ProgressD0V23__derived_struct_equalsySbAE_AEtFZ_0((uint64_t)&v5, (uint64_t)&v7);
}

uint64_t LiveActivityPlacement.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t sub_24936EEBC@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s18BridgeLiveActivity0bC9PlacementO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_24936EEE8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24936EEF4()
{
  return sub_24937ABA0();
}

uint64_t sub_24936EF54()
{
  return sub_24937AB90();
}

uint64_t LiveActivityWatchAssetType.hash(into:)()
{
  return sub_24937ADC0();
}

uint64_t sub_24936EFCC(uint64_t a1)
{
  unint64_t v2 = sub_2493748AC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936F008(uint64_t a1)
{
  unint64_t v2 = sub_2493748AC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24936F044@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24936F074(uint64_t a1)
{
  unint64_t v2 = sub_249374900();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936F0B0(uint64_t a1)
{
  unint64_t v2 = sub_249374900();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24936F0EC(uint64_t a1)
{
  unint64_t v2 = sub_249374858();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936F128(uint64_t a1)
{
  unint64_t v2 = sub_249374858();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24936F164()
{
  uint64_t v1 = 0x6576616761;
  if (*v0 != 1) {
    uint64_t v1 = 0x61696E6F7661;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701801057;
  }
}

uint64_t sub_24936F1B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249374954(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24936F1D8(uint64_t a1)
{
  unint64_t v2 = sub_249374804();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24936F214(uint64_t a1)
{
  unint64_t v2 = sub_249374804();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LiveActivityWatchAssetType.encode(to:)(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1A10);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1A18);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x270FA5388](v5);
  long long v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1A20);
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1A28);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249374804();
  sub_24937AE10();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_2493748AC();
      sub_24937AD30();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_249374858();
      uint64_t v15 = v21;
      sub_24937AD30();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_249374900();
    sub_24937AD30();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t LiveActivityWatchAssetType.hashValue.getter()
{
  return sub_24937ADF0();
}

void *LiveActivityWatchAssetType.init(from:)(void *a1)
{
  return sub_249374A8C(a1);
}

void *sub_24936F61C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_249374A8C(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24936F648(void *a1)
{
  return LiveActivityWatchAssetType.encode(to:)(a1, *v1);
}

uint64_t _s18BridgeLiveActivity0bC7TextMapV23__derived_struct_equalsySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v7 = a2[2];
  uint64_t v6 = a2[3];
  if (*a1 != *a2 || a1[1] != a2[1])
  {
    char v9 = sub_24937AD90();
    uint64_t result = 0;
    if ((v9 & 1) == 0) {
      return result;
    }
  }
  if (!v5)
  {
    if (!v6) {
      goto LABEL_15;
    }
    return 0;
  }
  if (!v6) {
    return 0;
  }
  BOOL v11 = v4 == v7 && v5 == v6;
  if (v11 || (v12 = sub_24937AD90(), uint64_t result = 0, (v12 & 1) != 0))
  {
LABEL_15:
    uint64_t v14 = a1[4];
    uint64_t v13 = a1[5];
    uint64_t v16 = a1[6];
    uint64_t v15 = a1[7];
    uint64_t v18 = a2[4];
    uint64_t v17 = a2[5];
    uint64_t v20 = a2[6];
    uint64_t v19 = a2[7];
    if (v13)
    {
      if (v17)
      {
        if (v14 == v18 && v13 == v17 || (sub_24937AD90() & 1) != 0)
        {
          if (!v15)
          {
            sub_24936C9B4(v14, v13);
            sub_24936C9B4(v14, v13);
            if (!v19)
            {
              uint64_t v21 = v18;
              uint64_t v22 = v17;
              goto LABEL_30;
            }
            goto LABEL_32;
          }
          if (v19)
          {
            if (v16 == v20 && v15 == v19)
            {
              sub_24936C9B4(v14, v13);
              sub_24936C9B4(v14, v13);
              uint64_t v21 = v18;
              uint64_t v22 = v17;
LABEL_30:
              sub_24936C9B4(v21, v22);
              swift_bridgeObjectRelease();
LABEL_38:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_24936CA5C(v14, v13);
              return 1;
            }
            char v25 = sub_24937AD90();
            sub_24936C9B4(v14, v13);
            sub_24936C9B4(v14, v13);
            sub_24936C9B4(v18, v17);
            swift_bridgeObjectRelease();
            if (v25) {
              goto LABEL_38;
            }
            goto LABEL_33;
          }
        }
        sub_24936C9B4(v14, v13);
        sub_24936C9B4(v14, v13);
LABEL_32:
        sub_24936C9B4(v18, v17);
        swift_bridgeObjectRelease();
LABEL_33:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v23 = v14;
        uint64_t v24 = v13;
        goto LABEL_34;
      }
    }
    else if (!v17)
    {
      return 1;
    }
    sub_24936C9B4(v14, v13);
    sub_24936C9B4(v18, v17);
    sub_24936CA5C(v14, v13);
    uint64_t v23 = v18;
    uint64_t v24 = v17;
LABEL_34:
    sub_24936CA5C(v23, v24);
    return 0;
  }
  return result;
}

BOOL _s18BridgeLiveActivity0bC6ImagesV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  sub_249370DA0((long long *)a1, (uint64_t)v26);
  sub_249370DA0((long long *)a2, (uint64_t)v25);
  sub_249370DA0(v26, (uint64_t)&v27);
  if (!v31)
  {
    uint64_t v4 = v27;
    uint64_t v5 = v28;
    sub_249370DA0(v25, (uint64_t)&v32);
    if (v36) {
      return 0;
    }
LABEL_6:
    if (v4 == v32 && v5 == v33) {
      goto LABEL_16;
    }
LABEL_15:
    char v14 = sub_24937AD90();
    BOOL result = 0;
    if ((v14 & 1) == 0) {
      return result;
    }
LABEL_16:
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 64);
    int v19 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v21 = *(void *)(a2 + 40);
    uint64_t v20 = *(void *)(a2 + 48);
    uint64_t v22 = *(void *)(a2 + 56);
    uint64_t v23 = *(void *)(a2 + 64);
    int v24 = *(unsigned __int8 *)(a2 + 72);
    if (v19 == 255)
    {
      if (v24 == 255) {
        return 1;
      }
    }
    else if (v24 != 255)
    {
      if (!v19)
      {
        if (v24) {
          return 0;
        }
        if (v16 == v21 && v15 == v20) {
          return 1;
        }
        return (sub_24937AD90() & 1) != 0;
      }
      if (v19 == 1)
      {
        if (v24 != 1) {
          return 0;
        }
        if (v16 == v21 && v15 == v20) {
          return 1;
        }
        return (sub_24937AD90() & 1) != 0;
      }
      if (v24 != 2 || (v16 != v21 || v15 != v20) && (sub_24937AD90() & 1) == 0) {
        return 0;
      }
      if (v17 != v22 || v18 != v23) {
        return (sub_24937AD90() & 1) != 0;
      }
      return 1;
    }
    sub_24936CB00(v16, v15, v17, v18, v19);
    sub_24936CB00(v21, v20, v22, v23, v24);
    sub_24936CD44(v16, v15, v17, v18, v19);
    sub_24936CD44(v21, v20, v22, v23, v24);
    return 0;
  }
  if (v31 == 1)
  {
    uint64_t v4 = v27;
    uint64_t v5 = v28;
    sub_249370DA0(v25, (uint64_t)&v32);
    if (v36 != 1) {
      return 0;
    }
    goto LABEL_6;
  }
  uint64_t v6 = v27;
  uint64_t v7 = v28;
  uint64_t v8 = v29;
  uint64_t v9 = v30;
  sub_249370DA0(v25, (uint64_t)&v32);
  if (v36 != 2) {
    return 0;
  }
  uint64_t v10 = v34;
  uint64_t v11 = v35;
  if (v6 == v32 && v7 == v33 || (v12 = sub_24937AD90(), BOOL result = 0, (v12 & 1) != 0))
  {
    if (v8 == v10 && v9 == v11) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  return result;
}

BOOL _s18BridgeLiveActivity0bC8ImageMapV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a1 + 48);
  v124[2] = *(_OWORD *)(a1 + 32);
  v125[0] = v4;
  *(_OWORD *)((char *)v125 + 9) = *(_OWORD *)(a1 + 57);
  long long v5 = *(_OWORD *)(a1 + 16);
  v124[0] = *(_OWORD *)a1;
  v124[1] = v5;
  long long v6 = *(_OWORD *)(a2 + 48);
  v122[2] = *(_OWORD *)(a2 + 32);
  v123[0] = v6;
  *(_OWORD *)((char *)v123 + 9) = *(_OWORD *)(a2 + 57);
  long long v7 = *(_OWORD *)(a2 + 16);
  v122[0] = *(_OWORD *)a2;
  v122[1] = v7;
  if (!_s18BridgeLiveActivity0bC6ImagesV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v124, (uint64_t)v122)) {
    return 0;
  }
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 88);
  uint64_t v10 = *(void *)(a1 + 96);
  uint64_t v11 = *(void *)(a1 + 104);
  uint64_t v13 = *(void *)(a1 + 112);
  uint64_t v12 = *(void *)(a1 + 120);
  uint64_t v14 = *(void *)(a1 + 128);
  uint64_t v15 = *(void *)(a1 + 136);
  uint64_t v16 = *(void *)(a1 + 144);
  unsigned __int8 v17 = *(unsigned char *)(a1 + 152);
  uint64_t v19 = *(void *)(a2 + 80);
  uint64_t v18 = *(void *)(a2 + 88);
  uint64_t v21 = *(void *)(a2 + 96);
  uint64_t v20 = *(void *)(a2 + 104);
  uint64_t v23 = *(void *)(a2 + 112);
  uint64_t v22 = *(void *)(a2 + 120);
  uint64_t v25 = *(void *)(a2 + 128);
  uint64_t v24 = *(void *)(a2 + 136);
  uint64_t v26 = *(void *)(a2 + 144);
  unsigned __int8 v27 = *(unsigned char *)(a2 + 152);
  if (*(unsigned char *)(a1 + 112) == 0xFF)
  {
    if (v23 == 255) {
      goto LABEL_9;
    }
LABEL_6:
    uint64_t v98 = *(void *)(a1 + 80);
    uint64_t v99 = v9;
    uint64_t v100 = v10;
    uint64_t v101 = v11;
    uint64_t v102 = v13;
    uint64_t v103 = v12;
    uint64_t v104 = v14;
    uint64_t v105 = v15;
    uint64_t v106 = v16;
    unsigned __int8 v107 = v17;
    uint64_t v108 = v19;
    uint64_t v109 = v18;
    uint64_t v110 = v21;
    uint64_t v111 = v20;
    uint64_t v112 = v23;
    uint64_t v113 = v22;
    uint64_t v114 = v25;
    uint64_t v115 = v24;
    uint64_t v116 = v26;
    unsigned __int8 v117 = v27;
    unsigned __int8 v90 = v27;
    unsigned __int8 v65 = v17;
    char v94 = v23;
    char v28 = v13;
    uint64_t v29 = v25;
    uint64_t v30 = v22;
    uint64_t v31 = v20;
    sub_24936CD58(v8, v9, v10, v11, v28, v12, v14, v15, v16, v65, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
    sub_24936CD58(v19, v18, v21, v31, v94, v30, v29, v24, v26, v90, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
LABEL_7:
    sub_24937A8C4((uint64_t)&v98);
    return 0;
  }
  if (v23 == 255) {
    goto LABEL_6;
  }
  v133[0] = *(void *)(a1 + 80);
  v133[1] = v9;
  v133[2] = v10;
  v133[3] = v11;
  char v134 = v13;
  uint64_t v135 = v12;
  uint64_t v136 = v14;
  uint64_t v137 = v15;
  uint64_t v138 = v16;
  unsigned __int8 v139 = v17;
  v140[0] = v19;
  v140[1] = v18;
  v140[2] = v21;
  v140[3] = v20;
  char v141 = v23;
  uint64_t v142 = v22;
  uint64_t v143 = v25;
  uint64_t v86 = v11;
  uint64_t v88 = v24;
  uint64_t v144 = v24;
  uint64_t v145 = v26;
  unsigned __int8 v146 = v27;
  unsigned __int8 v91 = v27;
  uint64_t v67 = v22;
  uint64_t v74 = v8;
  uint64_t v76 = v12;
  uint64_t v78 = v9;
  uint64_t v80 = v14;
  uint64_t v82 = v10;
  uint64_t v84 = v15;
  char v95 = v23;
  unsigned __int8 v70 = v17;
  uint64_t v32 = v22;
  uint64_t v33 = v20;
  uint64_t v72 = v16;
  sub_24936CD58(v8, v9, v10, v11, v13, v12, v14, v15, v16, v17, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  sub_24936CD58(v19, v18, v21, v33, v95, v32, v25, v88, v26, v91, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  BOOL v68 = _s18BridgeLiveActivity0bC6ImagesV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v133, (uint64_t)v140);
  sub_24936CD58(v19, v18, v21, v33, v95, v67, v25, v88, v26, v91, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  sub_24936CD58(v74, v78, v82, v86, v13, v76, v80, v84, v72, v70, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  if (!v68) {
    return 0;
  }
LABEL_9:
  long long v34 = *(_OWORD *)(a1 + 208);
  v120[2] = *(_OWORD *)(a1 + 192);
  v121[0] = v34;
  *(_OWORD *)((char *)v121 + 9) = *(_OWORD *)(a1 + 217);
  long long v35 = *(_OWORD *)(a1 + 176);
  v120[0] = *(_OWORD *)(a1 + 160);
  v120[1] = v35;
  long long v36 = *(_OWORD *)(a2 + 208);
  v118[2] = *(_OWORD *)(a2 + 192);
  v119[0] = v36;
  *(_OWORD *)((char *)v119 + 9) = *(_OWORD *)(a2 + 217);
  long long v37 = *(_OWORD *)(a2 + 176);
  v118[0] = *(_OWORD *)(a2 + 160);
  v118[1] = v37;
  if (!_s18BridgeLiveActivity0bC6ImagesV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v120, (uint64_t)v118)) {
    return 0;
  }
  uint64_t v38 = *(void *)(a1 + 240);
  uint64_t v39 = *(void *)(a1 + 248);
  uint64_t v40 = *(void *)(a1 + 256);
  uint64_t v41 = *(void *)(a1 + 264);
  uint64_t v43 = *(void *)(a1 + 272);
  uint64_t v42 = *(void *)(a1 + 280);
  uint64_t v44 = *(void *)(a1 + 288);
  uint64_t v45 = *(void *)(a1 + 296);
  uint64_t v46 = *(void *)(a1 + 304);
  unsigned __int8 v47 = *(unsigned char *)(a1 + 312);
  uint64_t v49 = *(void *)(a2 + 240);
  uint64_t v48 = *(void *)(a2 + 248);
  uint64_t v51 = *(void *)(a2 + 256);
  uint64_t v50 = *(void *)(a2 + 264);
  uint64_t v53 = *(void *)(a2 + 272);
  uint64_t v52 = *(void *)(a2 + 280);
  uint64_t v55 = *(void *)(a2 + 288);
  uint64_t v54 = *(void *)(a2 + 296);
  uint64_t v56 = *(void *)(a2 + 304);
  unsigned __int8 v57 = *(unsigned char *)(a2 + 312);
  if (*(unsigned char *)(a1 + 272) == 0xFF)
  {
    if (v53 == 255) {
      return 1;
    }
    goto LABEL_14;
  }
  if (v53 == 255)
  {
LABEL_14:
    uint64_t v98 = *(void *)(a1 + 240);
    uint64_t v99 = v39;
    uint64_t v100 = v40;
    uint64_t v101 = v41;
    uint64_t v102 = v43;
    uint64_t v103 = v42;
    uint64_t v104 = v44;
    uint64_t v105 = v45;
    uint64_t v106 = v46;
    unsigned __int8 v107 = v47;
    uint64_t v108 = v49;
    uint64_t v109 = v48;
    uint64_t v110 = v51;
    uint64_t v111 = v50;
    uint64_t v112 = v53;
    uint64_t v113 = v52;
    uint64_t v114 = v55;
    uint64_t v115 = v54;
    uint64_t v116 = v56;
    unsigned __int8 v117 = v57;
    unsigned __int8 v66 = v47;
    char v58 = v43;
    uint64_t v92 = v55;
    uint64_t v96 = v54;
    uint64_t v59 = v52;
    char v60 = v53;
    uint64_t v61 = v56;
    sub_24936CD58(v38, v39, v40, v41, v58, v42, v44, v45, v46, v66, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
    sub_24936CD58(v49, v48, v51, v50, v60, v59, v92, v96, v61, v57, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
    goto LABEL_7;
  }
  v126[0] = *(void *)(a1 + 240);
  v126[1] = v39;
  v126[2] = v40;
  v126[3] = v41;
  char v127 = v43;
  uint64_t v128 = v42;
  uint64_t v129 = v44;
  uint64_t v130 = v45;
  uint64_t v131 = v46;
  unsigned __int8 v132 = v47;
  uint64_t v98 = v49;
  uint64_t v99 = v48;
  uint64_t v100 = v51;
  uint64_t v101 = v50;
  LOBYTE(v102) = v53;
  uint64_t v103 = v52;
  uint64_t v104 = v55;
  uint64_t v105 = v54;
  uint64_t v106 = v56;
  unsigned __int8 v107 = v57;
  uint64_t v71 = v52;
  uint64_t v69 = v56;
  uint64_t v79 = v41;
  uint64_t v81 = v38;
  uint64_t v83 = v42;
  uint64_t v85 = v39;
  uint64_t v87 = v44;
  uint64_t v89 = v40;
  unsigned __int8 v75 = v47;
  uint64_t v93 = v45;
  uint64_t v97 = v54;
  uint64_t v62 = v52;
  uint64_t v63 = v56;
  uint64_t v77 = v46;
  sub_24936CD58(v38, v39, v40, v41, v43, v42, v44, v45, v46, v47, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  sub_24936CD58(v49, v48, v51, v50, v53, v62, v55, v97, v63, v57, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  BOOL v73 = _s18BridgeLiveActivity0bC6ImagesV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v126, (uint64_t)&v98);
  sub_24936CD58(v49, v48, v51, v50, v53, v71, v55, v97, v69, v57, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  sub_24936CD58(v81, v85, v89, v79, v43, v83, v87, v93, v77, v75, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  return v73;
}

BOOL _s18BridgeLiveActivity0bC8MetadataO21__derived_enum_equalsySbAC_ACtFZ_0(long long *a1, long long *a2)
{
  sub_24936861C(a1, &v16);
  int v3 = v19 >> 6;
  if (!v3)
  {
    v19 &= 0x3Fu;
    float64x2_t v8 = v16;
    float64x2_t v9 = v17;
    sub_24936861C(a2, v14);
    if (v15 > 0x3Fu) {
      return 0;
    }
    long long v10 = *(_OWORD *)&v14[16];
    if (*(_OWORD *)&v8 != *(_OWORD *)v14 && (sub_24937AD90() & 1) == 0) {
      return 0;
    }
    return *(_OWORD *)&v9 == v10 || (sub_24937AD90() & 1) != 0;
  }
  if (v3 != 1)
  {
    sub_24936861C(a2, v14);
    if ((v15 & 0xC0) != 0x80) {
      return 0;
    }
    if (v15 != 128) {
      return 0;
    }
    int8x16_t v11 = vorrq_s8(*(int8x16_t *)&v14[8], *(int8x16_t *)&v14[24]);
    return !(*(void *)&vorr_s8(*(int8x8_t *)v11.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL)) | *(void *)v14);
  }
  int v4 = v19 & 0x3F;
  v19 &= 0x3Fu;
  float64x2_t v12 = v16;
  float64x2_t v13 = v17;
  double v5 = v18;
  sub_24936861C(a2, v14);
  if ((v15 & 0xC0) != 0x40) {
    return 0;
  }
  uint16x4_t v6 = (uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v12, *(float64x2_t *)v14), (int32x4_t)vceqq_f64(v13, *(float64x2_t *)&v14[16]))));
  v6.i16[0] = vmaxv_u16(v6);
  if (v4 == (v15 & 0x3F)) {
    return (v5 == *(double *)&v14[32]) & ~v6.i32[0];
  }
  else {
    return 0;
  }
}

unint64_t sub_2493703B0()
{
  unint64_t result = qword_2696A1BE8;
  if (!qword_2696A1BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1BE8);
  }
  return result;
}

unint64_t sub_249370404()
{
  unint64_t result = qword_2696A1938;
  if (!qword_2696A1938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1938);
  }
  return result;
}

unint64_t sub_249370458()
{
  unint64_t result = qword_2696A1940;
  if (!qword_2696A1940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1940);
  }
  return result;
}

unint64_t sub_2493704AC()
{
  unint64_t result = qword_2696A1948;
  if (!qword_2696A1948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1948);
  }
  return result;
}

uint64_t sub_249370500(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x70614D74786574 && a2 == 0xE700000000000000;
  if (v2 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x70614D6567616D69 && a2 == 0xE800000000000000 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x617461646174656DLL && a2 == 0xE800000000000000 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024937D4E0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24937AD90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

void *sub_2493706B8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1B80);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  float64x2_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  uint64_t v43 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_2493703B0();
  sub_24937AE00();
  if (v2) {
    return (void *)__swift_destroy_boxed_opaque_existential_0((uint64_t)v43);
  }
  uint64_t v41 = a2;
  uint64_t v42 = v6;
  LOBYTE(v44[0]) = 0;
  sub_24937A2EC();
  sub_24937AD10();
  uint64_t v10 = v46;
  uint64_t v33 = v45;
  uint64_t v34 = v47;
  uint64_t v11 = v49;
  uint64_t v12 = v50;
  uint64_t v13 = v51;
  uint64_t v14 = v52;
  char v66 = 1;
  uint64_t v15 = v48;
  swift_bridgeObjectRetain();
  uint64_t v38 = v10;
  swift_bridgeObjectRetain();
  uint64_t v39 = v12;
  uint64_t v40 = v11;
  sub_24936C9B4(v11, v12);
  sub_24937A340();
  sub_24937AD10();
  uint64_t v31 = v14;
  uint64_t v32 = v15;
  uint64_t v30 = v13;
  memcpy(v61, v62, 0x139uLL);
  memcpy(v63, v62, sizeof(v63));
  LOBYTE(v44[0]) = 2;
  sub_24936CB14((uint64_t)v61, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CB00, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  sub_24937A394();
  sub_24937AD10();
  uint64_t v29 = 0;
  uint64_t v16 = v45;
  uint64_t v17 = v46;
  uint64_t v18 = v47;
  char v65 = 3;
  uint64_t v19 = v48;
  uint64_t v37 = v49;
  int v64 = v50;
  sub_24936DFB0(v45, v46, v47, v48, v49, v50);
  char v20 = sub_24937ACF0();
  uint64_t v35 = v19;
  uint64_t v36 = v18;
  LOBYTE(v11) = v20;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v5);
  LODWORD(v42) = v11 & 1;
  v44[0] = v33;
  v44[1] = v38;
  v44[2] = v34;
  v44[3] = v32;
  v44[4] = v40;
  v44[5] = v39;
  v44[6] = v30;
  v44[7] = v31;
  memcpy(&v44[8], v61, 0x139uLL);
  v44[48] = v16;
  v44[49] = v17;
  v44[50] = v18;
  v44[51] = v19;
  uint64_t v21 = v37;
  v44[52] = v37;
  unsigned __int8 v22 = v64;
  LOBYTE(v44[53]) = v64;
  BYTE1(v44[53]) = v11 & 1;
  sub_24937A3E8((uint64_t)v44);
  sub_24936E03C(v16, v17, v18, v19, v21, v22);
  sub_24936CB14((uint64_t)v61, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CD44, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  swift_bridgeObjectRelease();
  uint64_t v23 = v38;
  swift_bridgeObjectRelease();
  uint64_t v25 = v39;
  uint64_t v24 = v40;
  uint64_t v27 = v30;
  uint64_t v26 = v31;
  sub_24936CA5C(v40, v39);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v43);
  uint64_t v45 = v33;
  uint64_t v46 = v23;
  uint64_t v47 = v34;
  uint64_t v48 = v32;
  uint64_t v49 = v24;
  uint64_t v50 = v25;
  uint64_t v51 = v27;
  uint64_t v52 = v26;
  memcpy(v53, v63, sizeof(v53));
  uint64_t v54 = v16;
  uint64_t v55 = v17;
  uint64_t v56 = v36;
  uint64_t v57 = v35;
  uint64_t v58 = v37;
  char v59 = v64;
  char v60 = v42;
  sub_24937A658((uint64_t)&v45);
  return memcpy(v41, v44, 0x1AAuLL);
}

uint64_t sub_249370DA0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t _s18BridgeLiveActivity0bC11ImageSourceO21__derived_enum_equalsySbAC_ACtFZ_0(long long *a1, long long *a2)
{
  sub_249370DA0(a1, (uint64_t)&v22);
  if (!v26)
  {
    uint64_t v5 = v22;
    uint64_t v6 = v23;
    sub_249370DA0(a2, (uint64_t)&v17);
    if (v21) {
      goto LABEL_20;
    }
    if (v5 != v17 || v6 != v18) {
      goto LABEL_21;
    }
LABEL_19:
    char v15 = 1;
    return v15 & 1;
  }
  if (v26 == 1)
  {
    uint64_t v3 = v22;
    uint64_t v4 = v23;
    sub_249370DA0(a2, (uint64_t)&v17);
    if (v21 == 1)
    {
      if (v3 != v17 || v4 != v18)
      {
LABEL_21:
        char v15 = sub_24937AD90();
        return v15 & 1;
      }
      goto LABEL_19;
    }
LABEL_20:
    char v15 = 0;
    return v15 & 1;
  }
  uint64_t v8 = v22;
  uint64_t v9 = v23;
  uint64_t v10 = v24;
  uint64_t v11 = v25;
  sub_249370DA0(a2, (uint64_t)&v17);
  if (v21 != 2) {
    goto LABEL_20;
  }
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  if (v8 == v17 && v9 == v18 || (char v14 = sub_24937AD90(), v15 = 0, (v14 & 1) != 0))
  {
    if (v10 != v12 || v11 != v13) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  return v15 & 1;
}

unint64_t sub_249370F00()
{
  unint64_t result = qword_2696A1BF0;
  if (!qword_2696A1BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1BF0);
  }
  return result;
}

unint64_t sub_249370F54()
{
  unint64_t result = qword_2696A1BF8;
  if (!qword_2696A1BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1BF8);
  }
  return result;
}

unint64_t sub_249370FA8()
{
  unint64_t result = qword_2696A1C00;
  if (!qword_2696A1C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C00);
  }
  return result;
}

unint64_t sub_249370FFC()
{
  unint64_t result = qword_2696A1C08;
  if (!qword_2696A1C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C08);
  }
  return result;
}

uint64_t sub_249371050(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D614E6567616D69 && a2 == 0xE900000000000065;
  if (v2 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6150656C646E7562 && a2 == 0xEA00000000006874)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24937AD90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24937115C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D496D6574737973 && a2 == 0xEB00000000656761;
  if (v2 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1752457584 && a2 == 0xE400000000000000 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D49656C646E7562 && a2 == 0xEB00000000656761)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24937AD90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_2493712D0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1B60);
  uint64_t v47 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v48 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1B68);
  uint64_t v46 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1B70);
  uint64_t v44 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1B78);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  uint64_t v49 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_249370F00();
  uint64_t v14 = v50;
  sub_24937AE00();
  if (v14) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v49);
  }
  char v15 = v48;
  uint64_t v50 = v10;
  uint64_t v16 = sub_24937AD20();
  uint64_t v17 = v16;
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v20 = sub_24937AC60();
    swift_allocError();
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1AD0);
    *uint64_t v22 = &type metadata for LiveActivityImageSource;
    sub_24937ACB0();
    sub_24937AC50();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v12, v9);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v49);
  }
  uint64_t v41 = v12;
  int v18 = *(unsigned __int8 *)(v16 + 32);
  if (!*(unsigned char *)(v16 + 32))
  {
    char v51 = 0;
    sub_249370FFC();
    uint64_t v24 = v8;
    sub_24937ACA0();
    uint64_t v25 = v6;
    uint64_t v29 = sub_24937ACE0();
    uint64_t v31 = v32;
    (*(void (**)(char *, uint64_t))(v44 + 8))(v24, v25);
    goto LABEL_10;
  }
  if (v18 == 1)
  {
    char v52 = 1;
    sub_249370FA8();
    sub_24937ACA0();
    uint64_t v19 = v43;
    uint64_t v29 = sub_24937ACE0();
    uint64_t v31 = v30;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v5, v19);
LABEL_10:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v41, v9);
    uint64_t v38 = 0;
    uint64_t v40 = 0;
    goto LABEL_11;
  }
  char v55 = 2;
  sub_249370F54();
  sub_24937ACA0();
  char v54 = 0;
  uint64_t v26 = v45;
  uint64_t v27 = v15;
  uint64_t v28 = sub_24937ACE0();
  uint64_t v31 = v34;
  uint64_t v44 = v28;
  uint64_t v46 = v17;
  char v53 = 1;
  uint64_t v35 = sub_24937ACE0();
  uint64_t v36 = v26;
  uint64_t v37 = (void (**)(char *, uint64_t))(v50 + 8);
  uint64_t v38 = v35;
  uint64_t v40 = v39;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v27, v36);
  swift_bridgeObjectRelease();
  (*v37)(v41, v9);
  uint64_t v29 = v44;
LABEL_11:
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v49);
  uint64_t v33 = v42;
  uint64_t *v42 = v29;
  v33[1] = v31;
  v33[2] = v38;
  v33[3] = v40;
  *((unsigned char *)v33 + 32) = v18;
  return result;
}

uint64_t sub_249371948(uint64_t a1, uint64_t a2)
{
  return initializeWithCopy for LiveActivityImages(a2, a1);
}

uint64_t sub_249371958(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_249371998(uint64_t a1, void (*a2)(void, void, void, void, void), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 72);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  a3(v5, v6, v7, v8, v9);
  return a1;
}

unint64_t sub_249371A1C()
{
  unint64_t result = qword_2696A1C10;
  if (!qword_2696A1C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C10);
  }
  return result;
}

unint64_t sub_249371A70()
{
  unint64_t result = qword_2696A1988;
  if (!qword_2696A1988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1988);
  }
  return result;
}

uint64_t _s18BridgeLiveActivity0bC4TextV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 == a5 && a2 == a6 || (v12 = sub_24937AD90(), uint64_t result = 0, (v12 & 1) != 0))
  {
    if (a4)
    {
      if (a8 && (a3 == a7 && a4 == a8 || (sub_24937AD90() & 1) != 0)) {
        return 1;
      }
    }
    else if (!a8)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

BOOL _s18BridgeLiveActivity0bC8MetadataO08ProgressD0V23__derived_struct_equalsySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  return *(double *)a1 == *(double *)a2
      && *(double *)(a1 + 8) == *(double *)(a2 + 8)
      && *(double *)(a1 + 16) == *(double *)(a2 + 16)
      && *(double *)(a1 + 24) == *(double *)(a2 + 24)
      && *(double *)(a1 + 32) == *(double *)(a2 + 32)
      && *(unsigned __int8 *)(a1 + 40) == *(unsigned __int8 *)(a2 + 40);
}

uint64_t sub_249371BD4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x800000024937D500 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000024937D520 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000024937D540 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x657263536B636F6CLL && a2 == 0xEA00000000006E65)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_24937AD90();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

void *sub_249371D84@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1B50);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  unsigned __int8 v139 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_249371A1C();
  sub_24937AE00();
  if (v2) {
    return (void *)__swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
  }
  uint64_t v80 = v6;
  unsigned __int8 v75 = a2;
  LOBYTE(v81[0]) = 0;
  unint64_t v10 = sub_24937A298();
  sub_24937AD10();
  uint64_t v11 = v87;
  uint64_t v12 = v88;
  uint64_t v13 = v89;
  unint64_t v70 = v10;
  uint64_t v14 = v90;
  int v15 = v91;
  LOBYTE(v81[0]) = 1;
  uint64_t v74 = v82;
  uint64_t v72 = v83;
  uint64_t v76 = v84;
  uint64_t v79 = v85;
  int v78 = v86;
  sub_24936CAA0(v82, v83, v84, v85, v86);
  uint64_t v71 = v11;
  uint64_t v77 = v12;
  uint64_t v73 = v13;
  sub_24936CB00(v11, v12, v13, v14, v15);
  sub_24937ACD0();
  int v48 = v15;
  uint64_t v49 = v14;
  uint64_t v16 = v85;
  uint64_t v17 = v89;
  LODWORD(v13) = v91;
  LOBYTE(v81[0]) = 2;
  uint64_t v55 = v90;
  uint64_t v56 = v82;
  uint64_t v57 = v83;
  uint64_t v58 = v84;
  uint64_t v59 = v86;
  uint64_t v60 = v87;
  uint64_t v61 = v88;
  sub_24936CD58(v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  uint64_t v47 = 0;
  sub_24937AD10();
  uint64_t v51 = v16;
  uint64_t v52 = v17;
  int v50 = v13;
  uint64_t v18 = v87;
  uint64_t v19 = v88;
  uint64_t v20 = v89;
  uint64_t v62 = v90;
  LODWORD(v16) = v91;
  char v125 = 3;
  uint64_t v66 = v83;
  uint64_t v67 = v82;
  uint64_t v64 = v85;
  uint64_t v65 = v84;
  int v68 = v86;
  sub_24936CAA0(v82, v83, v84, v85, v86);
  uint64_t v69 = v18;
  uint64_t v21 = v18;
  uint64_t v22 = v19;
  uint64_t v63 = v20;
  uint64_t v23 = v20;
  uint64_t v24 = v62;
  sub_24936CB00(v21, v19, v23, v62, v16);
  sub_24937ACD0();
  uint64_t v54 = v19;
  int v53 = v16;
  (*(void (**)(char *, uint64_t))(v80 + 8))(v8, v5);
  unint64_t v70 = v127;
  uint64_t v46 = v129;
  uint64_t v47 = v128;
  uint64_t v44 = v131;
  uint64_t v45 = v130;
  uint64_t v42 = v133;
  uint64_t v43 = v132;
  uint64_t v41 = v134;
  int v40 = v135;
  uint64_t v80 = v126;
  v81[0] = v74;
  v81[1] = v72;
  v81[2] = v76;
  v81[3] = v79;
  LOBYTE(v81[4]) = v78;
  uint64_t v25 = v66;
  unsigned __int8 v26 = v16;
  v81[5] = v71;
  v81[6] = v77;
  v81[7] = v73;
  v81[8] = v49;
  LOBYTE(v81[9]) = v48;
  v81[10] = v56;
  v81[11] = v57;
  v81[12] = v58;
  v81[13] = v51;
  v81[14] = v59;
  v81[15] = v60;
  v81[16] = v61;
  v81[17] = v52;
  v81[18] = v55;
  LOBYTE(v81[19]) = v50;
  uint64_t v27 = v67;
  v81[20] = v67;
  v81[21] = v66;
  uint64_t v28 = v64;
  uint64_t v29 = v65;
  v81[22] = v65;
  v81[23] = v64;
  LOBYTE(v81[24]) = v68;
  v81[25] = v69;
  v81[26] = v22;
  uint64_t v30 = v63;
  v81[27] = v63;
  v81[28] = v24;
  LOBYTE(v81[29]) = v26;
  v81[30] = v126;
  v81[31] = v127;
  v81[32] = v128;
  v81[33] = v129;
  v81[34] = v130;
  v81[35] = v131;
  v81[36] = v132;
  v81[37] = v133;
  v81[38] = v134;
  LOBYTE(v81[39]) = v135;
  sub_24936CB14((uint64_t)v81, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CB00, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  sub_24936CCE4(v27, v25, v29, v28, v68);
  sub_24936CD44(v69, v54, v30, v24, v26);
  uint64_t v39 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CD44;
  uint64_t v38 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24936CCE4;
  sub_24936CD58(v56, v57, v58, v51, v59, v60, v61, v52, v55, v50, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  uint64_t v31 = v72;
  uint64_t v32 = v76;
  sub_24936CCE4(v74, v72, v76, v79, v78);
  uint64_t v33 = v71;
  uint64_t v34 = v77;
  uint64_t v35 = v73;
  uint64_t v36 = v49;
  LOBYTE(v30) = v48;
  sub_24936CD44(v71, v77, v73, v49, v48);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
  uint64_t v82 = v74;
  uint64_t v83 = v31;
  uint64_t v84 = v32;
  uint64_t v85 = v79;
  LOBYTE(v86) = v78;
  uint64_t v87 = v33;
  uint64_t v88 = v34;
  uint64_t v89 = v35;
  uint64_t v90 = v36;
  unsigned __int8 v91 = v30;
  uint64_t v92 = v56;
  uint64_t v93 = v57;
  uint64_t v94 = v58;
  uint64_t v95 = v51;
  uint64_t v96 = v59;
  uint64_t v97 = v60;
  uint64_t v98 = v61;
  uint64_t v99 = v52;
  uint64_t v100 = v55;
  char v101 = v50;
  *(_DWORD *)uint64_t v102 = v138[0];
  *(_DWORD *)&v102[3] = *(_DWORD *)((char *)v138 + 3);
  uint64_t v103 = v67;
  uint64_t v104 = v66;
  uint64_t v105 = v65;
  uint64_t v106 = v64;
  char v107 = v68;
  *(_DWORD *)uint64_t v108 = *(_DWORD *)v137;
  *(_DWORD *)&v108[3] = *(_DWORD *)&v137[3];
  uint64_t v109 = v69;
  uint64_t v110 = v54;
  uint64_t v111 = v63;
  uint64_t v112 = v62;
  char v113 = v53;
  *(_DWORD *)&v114[3] = *(_DWORD *)&v136[3];
  *(_DWORD *)uint64_t v114 = *(_DWORD *)v136;
  uint64_t v115 = v80;
  unint64_t v116 = v70;
  uint64_t v117 = v47;
  uint64_t v118 = v46;
  uint64_t v119 = v45;
  uint64_t v120 = v44;
  uint64_t v121 = v43;
  uint64_t v122 = v42;
  uint64_t v123 = v41;
  char v124 = v40;
  sub_24936CB14((uint64_t)&v82, v38, v39, (void (*)(void))v38, v39);
  return memcpy(v75, v81, 0x139uLL);
}

uint64_t sub_2493727F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a1 + 32);
  sub_24936CAA0(*(void *)a1, v4, v5, v6, v7);
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v4;
  *(void *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v6;
  *(unsigned char *)(a2 + 32) = v7;
  return a2;
}

uint64_t sub_249372854(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_2493728B8()
{
  unint64_t result = qword_2696A1C18;
  if (!qword_2696A1C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C18);
  }
  return result;
}

unint64_t sub_24937290C()
{
  unint64_t result = qword_2696A1998;
  if (!qword_2696A1998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1998);
  }
  return result;
}

uint64_t sub_249372960(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000024937D560 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024937D580)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_24937AD90();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_249372A4C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1B40);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2493728B8();
  sub_24937AE00();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v40 = 0;
  sub_24937A244();
  sub_24937AD10();
  uint64_t v9 = v36;
  char v40 = 1;
  uint64_t v31 = v34;
  uint64_t v32 = v37;
  uint64_t v33 = v35;
  int v39 = v38;
  sub_24936CAA0(v34, v35, v36, v37, v38);
  sub_24937ACD0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v10 = v35;
  uint64_t v28 = v35;
  uint64_t v29 = v34;
  uint64_t v26 = v36;
  uint64_t v30 = v37;
  unsigned __int8 v11 = v38;
  int v27 = v38;
  uint64_t v13 = v31;
  uint64_t v12 = v32;
  unsigned __int8 v14 = v39;
  sub_24936CAA0(v31, v33, v9, v32, v39);
  uint64_t v15 = v10;
  uint64_t v16 = v26;
  sub_24936CB00(v29, v15, v26, v30, v11);
  uint64_t v17 = v33;
  sub_24936CCE4(v13, v33, v9, v12, v14);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  sub_24936CCE4(v13, v17, v9, v12, v14);
  uint64_t v19 = v28;
  uint64_t v18 = v29;
  uint64_t v20 = v30;
  char v21 = v27;
  uint64_t result = sub_24936CD44(v29, v28, v16, v30, v27);
  uint64_t v23 = v33;
  *(void *)a2 = v13;
  *(void *)(a2 + 8) = v23;
  uint64_t v24 = v32;
  *(void *)(a2 + 16) = v9;
  *(void *)(a2 + 24) = v24;
  *(unsigned char *)(a2 + 32) = v39;
  *(void *)(a2 + 40) = v18;
  *(void *)(a2 + 48) = v19;
  *(void *)(a2 + 56) = v16;
  *(void *)(a2 + 64) = v20;
  *(unsigned char *)(a2 + 72) = v21;
  return result;
}

unint64_t sub_249372D54()
{
  unint64_t result = qword_2696A1C20;
  if (!qword_2696A1C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C20);
  }
  return result;
}

unint64_t sub_249372DA8()
{
  unint64_t result = qword_2696A19A8;
  if (!qword_2696A19A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A19A8);
  }
  return result;
}

uint64_t sub_249372DFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_249372E60(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x800000024937D540 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657263536B636F6CLL && a2 == 0xEA00000000006E65)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_24937AD90();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_249372F5C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1B30);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249372D54();
  sub_24937AE00();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v20 = a2;
  char v25 = 0;
  sub_24937A1F0();
  sub_24937AD10();
  uint64_t v9 = v22;
  uint64_t v10 = v24;
  uint64_t v18 = v23;
  uint64_t v19 = v21;
  char v25 = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24937ACD0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v11 = v21;
  uint64_t v12 = v22;
  uint64_t v13 = v23;
  uint64_t v14 = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24936C9B4(v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24936CA5C(v11, v12);
  uint64_t v16 = v20;
  *uint64_t v20 = v19;
  v16[1] = v9;
  v16[2] = v18;
  v16[3] = v10;
  _OWORD v16[4] = v11;
  v16[5] = v12;
  v16[6] = v13;
  v16[7] = v14;
  return result;
}

unint64_t sub_2493731EC()
{
  unint64_t result = qword_2696A1C28;
  if (!qword_2696A1C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C28);
  }
  return result;
}

uint64_t sub_249373240(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v2 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24937AD90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24937332C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1B28);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2493731EC();
  sub_24937AE00();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_24937ACE0();
    char v10 = 1;
    swift_bridgeObjectRetain();
    sub_24937ACC0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_249373534()
{
  unint64_t result = qword_2696A1C30;
  if (!qword_2696A1C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C30);
  }
  return result;
}

unint64_t sub_249373588()
{
  unint64_t result = qword_2696A1C38;
  if (!qword_2696A1C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C38);
  }
  return result;
}

unint64_t sub_2493735DC()
{
  unint64_t result = qword_2696A19E0;
  if (!qword_2696A19E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A19E0);
  }
  return result;
}

unint64_t sub_249373630()
{
  unint64_t result = qword_2696A1C40;
  if (!qword_2696A1C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C40);
  }
  return result;
}

unint64_t sub_249373684()
{
  unint64_t result = qword_2696A19E8;
  if (!qword_2696A19E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A19E8);
  }
  return result;
}

unint64_t sub_2493736D8()
{
  unint64_t result = qword_2696A1C48;
  if (!qword_2696A1C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C48);
  }
  return result;
}

uint64_t sub_24937372C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701736302 && a2 == 0xE400000000000000;
  if (v2 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C65537473697277 && a2 == 0xEE006E6F69746365 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x73736572676F7270 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24937AD90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_249373898@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1AF8);
  uint64_t v41 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v44 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1B00);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  uint64_t v40 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1B08);
  uint64_t v43 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1B10);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[3];
  uint64_t v45 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_249373534();
  uint64_t v16 = v52;
  sub_24937AE00();
  if (v16) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
  }
  uint64_t v37 = v8;
  uint64_t v18 = v43;
  uint64_t v17 = v44;
  uint64_t v52 = v12;
  uint64_t v19 = sub_24937AD20();
  if (*(void *)(v19 + 16) != 1)
  {
    uint64_t v27 = sub_24937AC60();
    swift_allocError();
    uint64_t v28 = v14;
    uint64_t v29 = v11;
    uint64_t v31 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1AD0);
    void *v31 = &type metadata for LiveActivityMetadata;
    sub_24937ACB0();
    sub_24937AC50();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v27 - 8) + 104))(v31, *MEMORY[0x263F8DCB0], v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v28, v29);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
  }
  if (*(unsigned char *)(v19 + 32))
  {
    if (*(unsigned char *)(v19 + 32) == 1)
    {
      LOBYTE(v46) = 1;
      sub_249373630();
      sub_24937ACA0();
      sub_24937A19C();
      uint64_t v20 = v39;
      sub_24937AD10();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v20);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v11);
      uint64_t v21 = 0;
      char v22 = 0;
      uint64_t v23 = v46;
      uint64_t v24 = v47;
      uint64_t v25 = v48;
      uint64_t v26 = v49;
    }
    else
    {
      LOBYTE(v46) = 2;
      sub_249373588();
      sub_24937ACA0();
      sub_24937A148();
      uint64_t v33 = v38;
      sub_24937AD10();
      uint64_t v34 = v52;
      (*(void (**)(char *, uint64_t))(v41 + 8))(v17, v33);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v11);
      uint64_t v23 = v46;
      uint64_t v24 = v47;
      uint64_t v25 = v48;
      uint64_t v26 = v49;
      uint64_t v21 = v50;
      char v22 = v51 | 0x40;
    }
  }
  else
  {
    LOBYTE(v46) = 0;
    sub_2493736D8();
    sub_24937ACA0();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v37);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v11);
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v21 = 0;
    char v22 = 0x80;
  }
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
  uint64_t v35 = v42;
  void *v42 = v23;
  v35[1] = v24;
  v35[2] = v25;
  v35[3] = v26;
  _OWORD v35[4] = v21;
  *((unsigned char *)v35 + 40) = v22;
  return result;
}

unint64_t sub_249373EF0()
{
  unint64_t result = qword_2696A1C50;
  if (!qword_2696A1C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C50);
  }
  return result;
}

uint64_t sub_249373F44(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x747865547466656CLL && a2 == 0xE800000000000000;
  if (v2 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7865547468676972 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24937AD90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_249374044(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1AF0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249373EF0();
  sub_24937AE00();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_24937ACE0();
    char v10 = 1;
    swift_bridgeObjectRetain();
    sub_24937ACE0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_24937424C()
{
  unint64_t result = qword_2696A1C58;
  if (!qword_2696A1C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C58);
  }
  return result;
}

void type metadata accessor for CGPoint()
{
  if (!qword_2696A1AA0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2696A1AA0);
    }
  }
}

unint64_t sub_2493742F8()
{
  unint64_t result = qword_2696A1A08;
  if (!qword_2696A1A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A08);
  }
  return result;
}

uint64_t sub_24937434C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73736572676F7270 && a2 == 0xE800000000000000;
  if (v2 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697469736F70 && a2 == 0xEE00726F74636146 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74636146657A6973 && a2 == 0xEA0000000000726FLL || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7373416863746177 && a2 == 0xEE00657079547465)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24937AD90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_24937455C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1AD8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24937424C();
  sub_24937AE00();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  LOBYTE(v19) = 0;
  sub_24937AD00();
  uint64_t v10 = v9;
  type metadata accessor for CGPoint();
  char v18 = 1;
  sub_24937A0AC(&qword_2696A1AE0, (void (*)(uint64_t))type metadata accessor for CGPoint);
  sub_24937AD10();
  uint64_t v11 = v19;
  uint64_t v12 = v20;
  char v18 = 2;
  sub_24937AD10();
  uint64_t v13 = v19;
  uint64_t v14 = v20;
  char v18 = 3;
  sub_24937A0F4();
  sub_24937AD10();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v15 = v19;
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = v13;
  *(void *)(a2 + 32) = v14;
  *(unsigned char *)(a2 + 40) = v15;
  return result;
}

unint64_t _s18BridgeLiveActivity0bC9PlacementO8rawValueACSgSi_tcfC_0(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

unint64_t sub_249374804()
{
  unint64_t result = qword_2696A1C60;
  if (!qword_2696A1C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C60);
  }
  return result;
}

unint64_t sub_249374858()
{
  unint64_t result = qword_2696A1C68;
  if (!qword_2696A1C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C68);
  }
  return result;
}

unint64_t sub_2493748AC()
{
  unint64_t result = qword_2696A1C70;
  if (!qword_2696A1C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1C70);
  }
  return result;
}

unint64_t sub_249374900()
{
  unint64_t result = qword_2696A1C78[0];
  if (!qword_2696A1C78[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A1C78);
  }
  return result;
}

uint64_t sub_249374954(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701801057 && a2 == 0xE400000000000000;
  if (v2 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6576616761 && a2 == 0xE500000000000000 || (sub_24937AD90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x61696E6F7661 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24937AD90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_249374A8C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1AB0);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1AB8);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1AC0);
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1AC8);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249374804();
  uint64_t v12 = (uint64_t)v30;
  sub_24937AE00();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  uint64_t v30 = a1;
  uint64_t v14 = v11;
  uint64_t v15 = sub_24937AD20();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_24937AC60();
    swift_allocError();
    uint64_t v11 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696A1AD0);
    *uint64_t v11 = &type metadata for LiveActivityWatchAssetType;
    sub_24937ACB0();
    sub_24937AC50();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, *MEMORY[0x263F8DCB0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    return v11;
  }
  uint64_t v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      sub_2493748AC();
      sub_24937ACA0();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_249374858();
      sub_24937ACA0();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_249374900();
    sub_24937ACA0();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
  return v11;
}

uint64_t sub_249374FFC()
{
  return sub_24937A0AC((unint64_t *)&unk_26B15EA10, (void (*)(uint64_t))type metadata accessor for LiveActivitySetupAttributes);
}

uint64_t sub_249375044()
{
  return sub_24937A0AC(&qword_26B15EA08, (void (*)(uint64_t))type metadata accessor for LiveActivitySetupAttributes);
}

unint64_t sub_249375090()
{
  unint64_t result = qword_2696A1A30;
  if (!qword_2696A1A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A30);
  }
  return result;
}

unint64_t sub_2493750E8()
{
  unint64_t result = qword_2696A1A38;
  if (!qword_2696A1A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A38);
  }
  return result;
}

unint64_t sub_249375140()
{
  unint64_t result = qword_2696A1A40;
  if (!qword_2696A1A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A40);
  }
  return result;
}

unint64_t sub_249375198()
{
  unint64_t result = qword_2696A1A48;
  if (!qword_2696A1A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A48);
  }
  return result;
}

unint64_t sub_2493751F0()
{
  unint64_t result = qword_2696A1A50;
  if (!qword_2696A1A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A50);
  }
  return result;
}

unint64_t sub_249375248()
{
  unint64_t result = qword_2696A1A58;
  if (!qword_2696A1A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A58);
  }
  return result;
}

unint64_t sub_2493752A0()
{
  unint64_t result = qword_2696A1A60;
  if (!qword_2696A1A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A60);
  }
  return result;
}

unint64_t sub_2493752F8()
{
  unint64_t result = qword_2696A1A68;
  if (!qword_2696A1A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A68);
  }
  return result;
}

unint64_t sub_249375350()
{
  unint64_t result = qword_2696A1A70;
  if (!qword_2696A1A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A70);
  }
  return result;
}

unint64_t sub_2493753A8()
{
  unint64_t result = qword_2696A1A78;
  if (!qword_2696A1A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A78);
  }
  return result;
}

unint64_t sub_249375400()
{
  unint64_t result = qword_2696A1A80;
  if (!qword_2696A1A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A80);
  }
  return result;
}

unint64_t sub_249375458()
{
  unint64_t result = qword_2696A1A88;
  if (!qword_2696A1A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A88);
  }
  return result;
}

unint64_t sub_2493754B0()
{
  unint64_t result = qword_2696A1A90;
  if (!qword_2696A1A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A90);
  }
  return result;
}

unint64_t sub_249375508()
{
  unint64_t result = qword_2696A1A98;
  if (!qword_2696A1A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1A98);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LiveActivitySetupAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24937AA50();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for LiveActivitySetupAttributes(uint64_t a1)
{
  uint64_t v2 = sub_24937AA50();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for LiveActivitySetupAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24937AA50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for LiveActivitySetupAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24937AA50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for LiveActivitySetupAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24937AA50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for LiveActivitySetupAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24937AA50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivitySetupAttributes(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2493757D0);
}

uint64_t sub_2493757D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24937AA50();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for LiveActivitySetupAttributes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249375850);
}

uint64_t sub_249375850(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24937AA50();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_2493758C0()
{
  uint64_t result = sub_24937AA50();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LiveActivitySetupState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LiveActivitySetupState(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_24936CCE4(*(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(unsigned char *)(a1 + 96));
  int v2 = *(unsigned __int8 *)(a1 + 136);
  if (v2 != 255) {
    sub_24936CCE4(*(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), v2);
  }
  uint64_t v3 = *(unsigned __int8 *)(a1 + 176);
  if (v3 != 255)
  {
    sub_24936CCE4(*(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168), v3);
    int v4 = *(unsigned __int8 *)(a1 + 216);
    if (v4 != 255) {
      sub_24936CCE4(*(void *)(a1 + 184), *(void *)(a1 + 192), *(void *)(a1 + 200), *(void *)(a1 + 208), v4);
    }
  }
  sub_24936CCE4(*(void *)(a1 + 224), *(void *)(a1 + 232), *(void *)(a1 + 240), *(void *)(a1 + 248), *(unsigned char *)(a1 + 256));
  int v5 = *(unsigned __int8 *)(a1 + 296);
  if (v5 != 255) {
    sub_24936CCE4(*(void *)(a1 + 264), *(void *)(a1 + 272), *(void *)(a1 + 280), *(void *)(a1 + 288), v5);
  }
  uint64_t v6 = *(unsigned __int8 *)(a1 + 336);
  if (v6 != 255)
  {
    sub_24936CCE4(*(void *)(a1 + 304), *(void *)(a1 + 312), *(void *)(a1 + 320), *(void *)(a1 + 328), v6);
    int v7 = *(unsigned __int8 *)(a1 + 376);
    if (v7 != 255) {
      sub_24936CCE4(*(void *)(a1 + 344), *(void *)(a1 + 352), *(void *)(a1 + 360), *(void *)(a1 + 368), v7);
    }
  }
  uint64_t v8 = *(void *)(a1 + 384);
  uint64_t v9 = *(void *)(a1 + 392);
  uint64_t v10 = *(void *)(a1 + 400);
  uint64_t v11 = *(void *)(a1 + 408);
  uint64_t v12 = *(void *)(a1 + 416);
  unsigned __int8 v13 = *(unsigned char *)(a1 + 424);
  return sub_24936E03C(v8, v9, v10, v11, v12, v13);
}

uint64_t initializeWithCopy for LiveActivitySetupState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v6)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v6;
    uint64_t v7 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
  }
  uint64_t v9 = *(void *)(a2 + 64);
  uint64_t v10 = *(void *)(a2 + 72);
  uint64_t v11 = *(void *)(a2 + 80);
  uint64_t v12 = *(void *)(a2 + 88);
  unsigned __int8 v13 = *(unsigned char *)(a2 + 96);
  sub_24936CAA0(v9, v10, v11, v12, v13);
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 80) = v11;
  *(void *)(a1 + 88) = v12;
  *(unsigned char *)(a1 + 96) = v13;
  int v14 = *(unsigned __int8 *)(a2 + 136);
  if (v14 == 255)
  {
    long long v19 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v19;
    *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  }
  else
  {
    uint64_t v15 = *(void *)(a2 + 104);
    uint64_t v16 = *(void *)(a2 + 112);
    uint64_t v17 = *(void *)(a2 + 120);
    uint64_t v18 = *(void *)(a2 + 128);
    sub_24936CAA0(v15, v16, v17, v18, *(unsigned char *)(a2 + 136));
    *(void *)(a1 + 104) = v15;
    *(void *)(a1 + 112) = v16;
    *(void *)(a1 + 120) = v17;
    *(void *)(a1 + 128) = v18;
    *(unsigned char *)(a1 + 136) = v14;
  }
  uint64_t v20 = *(unsigned __int8 *)(a2 + 176);
  if (v20 == 255)
  {
    long long v21 = *(_OWORD *)(a2 + 192);
    *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
    *(_OWORD *)(a1 + 192) = v21;
    *(_OWORD *)(a1 + 201) = *(_OWORD *)(a2 + 201);
    long long v22 = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 160) = v22;
  }
  else
  {
    uint64_t v23 = *(void *)(a2 + 144);
    uint64_t v24 = *(void *)(a2 + 152);
    uint64_t v25 = *(void *)(a2 + 160);
    uint64_t v26 = *(void *)(a2 + 168);
    sub_24936CAA0(v23, v24, v25, v26, *(unsigned char *)(a2 + 176));
    *(void *)(a1 + 144) = v23;
    *(void *)(a1 + 152) = v24;
    *(void *)(a1 + 160) = v25;
    *(void *)(a1 + 168) = v26;
    *(unsigned char *)(a1 + 176) = v20;
    int v27 = *(unsigned __int8 *)(a2 + 216);
    if (v27 == 255)
    {
      long long v32 = *(_OWORD *)(a2 + 200);
      *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
      *(_OWORD *)(a1 + 200) = v32;
      *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
    }
    else
    {
      uint64_t v28 = *(void *)(a2 + 184);
      uint64_t v29 = *(void *)(a2 + 192);
      uint64_t v30 = *(void *)(a2 + 200);
      uint64_t v31 = *(void *)(a2 + 208);
      sub_24936CAA0(v28, v29, v30, v31, *(unsigned char *)(a2 + 216));
      *(void *)(a1 + 184) = v28;
      *(void *)(a1 + 192) = v29;
      *(void *)(a1 + 200) = v30;
      *(void *)(a1 + 208) = v31;
      *(unsigned char *)(a1 + 216) = v27;
    }
  }
  uint64_t v33 = *(void *)(a2 + 224);
  uint64_t v34 = *(void *)(a2 + 232);
  uint64_t v35 = *(void *)(a2 + 240);
  uint64_t v36 = *(void *)(a2 + 248);
  unsigned __int8 v37 = *(unsigned char *)(a2 + 256);
  sub_24936CAA0(v33, v34, v35, v36, v37);
  *(void *)(a1 + 224) = v33;
  *(void *)(a1 + 232) = v34;
  *(void *)(a1 + 240) = v35;
  *(void *)(a1 + 248) = v36;
  *(unsigned char *)(a1 + 256) = v37;
  int v38 = *(unsigned __int8 *)(a2 + 296);
  if (v38 == 255)
  {
    long long v43 = *(_OWORD *)(a2 + 280);
    *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
    *(_OWORD *)(a1 + 280) = v43;
    *(unsigned char *)(a1 + 296) = *(unsigned char *)(a2 + 296);
  }
  else
  {
    uint64_t v39 = *(void *)(a2 + 264);
    uint64_t v40 = *(void *)(a2 + 272);
    uint64_t v41 = *(void *)(a2 + 280);
    uint64_t v42 = *(void *)(a2 + 288);
    sub_24936CAA0(v39, v40, v41, v42, *(unsigned char *)(a2 + 296));
    *(void *)(a1 + 264) = v39;
    *(void *)(a1 + 272) = v40;
    *(void *)(a1 + 280) = v41;
    *(void *)(a1 + 288) = v42;
    *(unsigned char *)(a1 + 296) = v38;
  }
  uint64_t v44 = *(unsigned __int8 *)(a2 + 336);
  if (v44 == 255)
  {
    long long v45 = *(_OWORD *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
    *(_OWORD *)(a1 + 352) = v45;
    *(_OWORD *)(a1 + 361) = *(_OWORD *)(a2 + 361);
    long long v46 = *(_OWORD *)(a2 + 320);
    *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 320) = v46;
  }
  else
  {
    uint64_t v47 = *(void *)(a2 + 304);
    uint64_t v48 = *(void *)(a2 + 312);
    uint64_t v49 = *(void *)(a2 + 320);
    uint64_t v50 = *(void *)(a2 + 328);
    sub_24936CAA0(v47, v48, v49, v50, *(unsigned char *)(a2 + 336));
    *(void *)(a1 + 304) = v47;
    *(void *)(a1 + 312) = v48;
    *(void *)(a1 + 320) = v49;
    *(void *)(a1 + 328) = v50;
    *(unsigned char *)(a1 + 336) = v44;
    int v51 = *(unsigned __int8 *)(a2 + 376);
    if (v51 == 255)
    {
      long long v56 = *(_OWORD *)(a2 + 360);
      *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
      *(_OWORD *)(a1 + 360) = v56;
      *(unsigned char *)(a1 + 376) = *(unsigned char *)(a2 + 376);
    }
    else
    {
      uint64_t v52 = *(void *)(a2 + 344);
      uint64_t v53 = *(void *)(a2 + 352);
      uint64_t v54 = *(void *)(a2 + 360);
      uint64_t v55 = *(void *)(a2 + 368);
      sub_24936CAA0(v52, v53, v54, v55, *(unsigned char *)(a2 + 376));
      *(void *)(a1 + 344) = v52;
      *(void *)(a1 + 352) = v53;
      *(void *)(a1 + 360) = v54;
      *(void *)(a1 + 368) = v55;
      *(unsigned char *)(a1 + 376) = v51;
    }
  }
  uint64_t v57 = *(void *)(a2 + 384);
  uint64_t v58 = *(void *)(a2 + 392);
  uint64_t v59 = *(void *)(a2 + 400);
  uint64_t v60 = *(void *)(a2 + 408);
  uint64_t v61 = *(void *)(a2 + 416);
  unsigned __int8 v62 = *(unsigned char *)(a2 + 424);
  sub_24936DFB0(v57, v58, v59, v60, v61, v62);
  *(void *)(a1 + 384) = v57;
  *(void *)(a1 + 392) = v58;
  *(void *)(a1 + 400) = v59;
  *(void *)(a1 + 408) = v60;
  *(void *)(a1 + 416) = v61;
  *(unsigned char *)(a1 + 424) = v62;
  *(unsigned char *)(a1 + 425) = *(unsigned char *)(a2 + 425);
  return a1;
}

uint64_t assignWithCopy for LiveActivitySetupState(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (_OWORD *)(a1 + 32);
  uint64_t v5 = (_OWORD *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v6)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_249376500(a1 + 32);
      long long v7 = *(_OWORD *)(a2 + 48);
      *uint64_t v4 = *v5;
      *(_OWORD *)(a1 + 48) = v7;
    }
  }
  else if (v6)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 48);
    *uint64_t v4 = *v5;
    *(_OWORD *)(a1 + 48) = v8;
  }
  uint64_t v9 = *(void *)(a2 + 64);
  uint64_t v10 = *(void *)(a2 + 72);
  uint64_t v11 = *(void *)(a2 + 80);
  uint64_t v12 = *(void *)(a2 + 88);
  unsigned __int8 v13 = *(unsigned char *)(a2 + 96);
  sub_24936CAA0(v9, v10, v11, v12, v13);
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 80);
  uint64_t v17 = *(void *)(a1 + 88);
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 80) = v11;
  *(void *)(a1 + 88) = v12;
  unsigned __int8 v18 = *(unsigned char *)(a1 + 96);
  *(unsigned char *)(a1 + 96) = v13;
  sub_24936CCE4(v14, v15, v16, v17, v18);
  long long v19 = (long long *)(a1 + 104);
  uint64_t v20 = (long long *)(a2 + 104);
  int v21 = *(unsigned __int8 *)(a2 + 136);
  if (*(unsigned __int8 *)(a1 + 136) == 255)
  {
    if (v21 == 255)
    {
      long long v37 = *v20;
      long long v38 = *(_OWORD *)(a2 + 120);
      *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
      *long long v19 = v37;
      *(_OWORD *)(a1 + 120) = v38;
    }
    else
    {
      uint64_t v31 = *(void *)(a2 + 104);
      uint64_t v32 = *(void *)(a2 + 112);
      uint64_t v33 = *(void *)(a2 + 120);
      uint64_t v34 = *(void *)(a2 + 128);
      sub_24936CAA0(v31, v32, v33, v34, *(unsigned char *)(a2 + 136));
      *(void *)(a1 + 104) = v31;
      *(void *)(a1 + 112) = v32;
      *(void *)(a1 + 120) = v33;
      *(void *)(a1 + 128) = v34;
      *(unsigned char *)(a1 + 136) = v21;
    }
  }
  else if (v21 == 255)
  {
    sub_249376534(a1 + 104);
    char v35 = *(unsigned char *)(a2 + 136);
    long long v36 = *(_OWORD *)(a2 + 120);
    *long long v19 = *v20;
    *(_OWORD *)(a1 + 120) = v36;
    *(unsigned char *)(a1 + 136) = v35;
  }
  else
  {
    uint64_t v22 = *(void *)(a2 + 104);
    uint64_t v23 = *(void *)(a2 + 112);
    uint64_t v24 = *(void *)(a2 + 120);
    uint64_t v25 = *(void *)(a2 + 128);
    sub_24936CAA0(v22, v23, v24, v25, *(unsigned char *)(a2 + 136));
    uint64_t v26 = *(void *)(a1 + 104);
    uint64_t v27 = *(void *)(a1 + 112);
    uint64_t v28 = *(void *)(a1 + 120);
    uint64_t v29 = *(void *)(a1 + 128);
    *(void *)(a1 + 104) = v22;
    *(void *)(a1 + 112) = v23;
    *(void *)(a1 + 120) = v24;
    *(void *)(a1 + 128) = v25;
    unsigned __int8 v30 = *(unsigned char *)(a1 + 136);
    *(unsigned char *)(a1 + 136) = v21;
    sub_24936CCE4(v26, v27, v28, v29, v30);
  }
  uint64_t v39 = (_OWORD *)(a1 + 144);
  uint64_t v40 = (_OWORD *)(a2 + 144);
  uint64_t v41 = *(unsigned __int8 *)(a2 + 176);
  if (*(unsigned char *)(a1 + 176) == 0xFF)
  {
    if (v41 == 255)
    {
      *uint64_t v39 = *v40;
      long long v42 = *(_OWORD *)(a2 + 160);
      long long v43 = *(_OWORD *)(a2 + 176);
      long long v44 = *(_OWORD *)(a2 + 192);
      *(_OWORD *)(a1 + 201) = *(_OWORD *)(a2 + 201);
      *(_OWORD *)(a1 + 176) = v43;
      *(_OWORD *)(a1 + 192) = v44;
      *(_OWORD *)(a1 + 160) = v42;
      goto LABEL_29;
    }
    uint64_t v48 = *(void *)(a2 + 144);
    uint64_t v49 = *(void *)(a2 + 152);
    uint64_t v50 = *(void *)(a2 + 160);
    uint64_t v51 = *(void *)(a2 + 168);
    sub_24936CAA0(v48, v49, v50, v51, *(unsigned char *)(a2 + 176));
    *(void *)(a1 + 144) = v48;
    *(void *)(a1 + 152) = v49;
    *(void *)(a1 + 160) = v50;
    *(void *)(a1 + 168) = v51;
    *(unsigned char *)(a1 + 176) = v41;
    int v52 = *(unsigned __int8 *)(a2 + 216);
    if (v52 == 255)
    {
      long long v53 = *(_OWORD *)(a2 + 184);
      long long v54 = *(_OWORD *)(a2 + 200);
      *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
      *(_OWORD *)(a1 + 184) = v53;
      *(_OWORD *)(a1 + 200) = v54;
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  if (v41 == 255)
  {
    sub_24937656C(a1 + 144);
    *uint64_t v39 = *v40;
    long long v46 = *(_OWORD *)(a2 + 176);
    long long v45 = *(_OWORD *)(a2 + 192);
    long long v47 = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 201) = *(_OWORD *)(a2 + 201);
    *(_OWORD *)(a1 + 176) = v46;
    *(_OWORD *)(a1 + 192) = v45;
    *(_OWORD *)(a1 + 160) = v47;
    goto LABEL_29;
  }
  uint64_t v55 = *(void *)(a2 + 144);
  uint64_t v56 = *(void *)(a2 + 152);
  uint64_t v57 = *(void *)(a2 + 160);
  uint64_t v58 = *(void *)(a2 + 168);
  sub_24936CAA0(v55, v56, v57, v58, *(unsigned char *)(a2 + 176));
  uint64_t v59 = *(void *)(a1 + 144);
  uint64_t v60 = *(void *)(a1 + 152);
  uint64_t v61 = *(void *)(a1 + 160);
  uint64_t v62 = *(void *)(a1 + 168);
  *(void *)(a1 + 144) = v55;
  *(void *)(a1 + 152) = v56;
  *(void *)(a1 + 160) = v57;
  *(void *)(a1 + 168) = v58;
  unsigned __int8 v63 = *(unsigned char *)(a1 + 176);
  *(unsigned char *)(a1 + 176) = v41;
  sub_24936CCE4(v59, v60, v61, v62, v63);
  uint64_t v64 = (_OWORD *)(a1 + 184);
  uint64_t v65 = (_OWORD *)(a2 + 184);
  int v52 = *(unsigned __int8 *)(a2 + 216);
  if (*(unsigned __int8 *)(a1 + 216) != 255)
  {
    if (v52 == 255)
    {
      sub_249376534(a1 + 184);
      char v79 = *(unsigned char *)(a2 + 216);
      long long v80 = *(_OWORD *)(a2 + 200);
      *uint64_t v64 = *v65;
      *(_OWORD *)(a1 + 200) = v80;
      *(unsigned char *)(a1 + 216) = v79;
    }
    else
    {
      uint64_t v66 = *(void *)(a2 + 184);
      uint64_t v67 = *(void *)(a2 + 192);
      uint64_t v68 = *(void *)(a2 + 200);
      uint64_t v69 = *(void *)(a2 + 208);
      sub_24936CAA0(v66, v67, v68, v69, *(unsigned char *)(a2 + 216));
      uint64_t v70 = *(void *)(a1 + 184);
      uint64_t v71 = *(void *)(a1 + 192);
      uint64_t v72 = *(void *)(a1 + 200);
      uint64_t v73 = *(void *)(a1 + 208);
      *(void *)(a1 + 184) = v66;
      *(void *)(a1 + 192) = v67;
      *(void *)(a1 + 200) = v68;
      *(void *)(a1 + 208) = v69;
      unsigned __int8 v74 = *(unsigned char *)(a1 + 216);
      *(unsigned char *)(a1 + 216) = v52;
      sub_24936CCE4(v70, v71, v72, v73, v74);
    }
    goto LABEL_29;
  }
  if (v52 != 255)
  {
LABEL_26:
    uint64_t v75 = *(void *)(a2 + 184);
    uint64_t v76 = *(void *)(a2 + 192);
    uint64_t v77 = *(void *)(a2 + 200);
    uint64_t v78 = *(void *)(a2 + 208);
    sub_24936CAA0(v75, v76, v77, v78, v52);
    *(void *)(a1 + 184) = v75;
    *(void *)(a1 + 192) = v76;
    *(void *)(a1 + 200) = v77;
    *(void *)(a1 + 208) = v78;
    *(unsigned char *)(a1 + 216) = v52;
    goto LABEL_29;
  }
  long long v81 = *v65;
  long long v82 = *(_OWORD *)(a2 + 200);
  *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
  *uint64_t v64 = v81;
  *(_OWORD *)(a1 + 200) = v82;
LABEL_29:
  uint64_t v83 = *(void *)(a2 + 224);
  uint64_t v84 = *(void *)(a2 + 232);
  uint64_t v85 = *(void *)(a2 + 240);
  uint64_t v86 = *(void *)(a2 + 248);
  unsigned __int8 v87 = *(unsigned char *)(a2 + 256);
  sub_24936CAA0(v83, v84, v85, v86, v87);
  uint64_t v88 = *(void *)(a1 + 224);
  uint64_t v89 = *(void *)(a1 + 232);
  uint64_t v90 = *(void *)(a1 + 240);
  uint64_t v91 = *(void *)(a1 + 248);
  *(void *)(a1 + 224) = v83;
  *(void *)(a1 + 232) = v84;
  *(void *)(a1 + 240) = v85;
  *(void *)(a1 + 248) = v86;
  unsigned __int8 v92 = *(unsigned char *)(a1 + 256);
  *(unsigned char *)(a1 + 256) = v87;
  sub_24936CCE4(v88, v89, v90, v91, v92);
  uint64_t v93 = (long long *)(a1 + 264);
  uint64_t v94 = (long long *)(a2 + 264);
  int v95 = *(unsigned __int8 *)(a2 + 296);
  if (*(unsigned __int8 *)(a1 + 296) == 255)
  {
    if (v95 == 255)
    {
      long long v111 = *v94;
      long long v112 = *(_OWORD *)(a2 + 280);
      *(unsigned char *)(a1 + 296) = *(unsigned char *)(a2 + 296);
      *uint64_t v93 = v111;
      *(_OWORD *)(a1 + 280) = v112;
    }
    else
    {
      uint64_t v105 = *(void *)(a2 + 264);
      uint64_t v106 = *(void *)(a2 + 272);
      uint64_t v107 = *(void *)(a2 + 280);
      uint64_t v108 = *(void *)(a2 + 288);
      sub_24936CAA0(v105, v106, v107, v108, *(unsigned char *)(a2 + 296));
      *(void *)(a1 + 264) = v105;
      *(void *)(a1 + 272) = v106;
      *(void *)(a1 + 280) = v107;
      *(void *)(a1 + 288) = v108;
      *(unsigned char *)(a1 + 296) = v95;
    }
  }
  else if (v95 == 255)
  {
    sub_249376534(a1 + 264);
    char v109 = *(unsigned char *)(a2 + 296);
    long long v110 = *(_OWORD *)(a2 + 280);
    *uint64_t v93 = *v94;
    *(_OWORD *)(a1 + 280) = v110;
    *(unsigned char *)(a1 + 296) = v109;
  }
  else
  {
    uint64_t v96 = *(void *)(a2 + 264);
    uint64_t v97 = *(void *)(a2 + 272);
    uint64_t v98 = *(void *)(a2 + 280);
    uint64_t v99 = *(void *)(a2 + 288);
    sub_24936CAA0(v96, v97, v98, v99, *(unsigned char *)(a2 + 296));
    uint64_t v100 = *(void *)(a1 + 264);
    uint64_t v101 = *(void *)(a1 + 272);
    uint64_t v102 = *(void *)(a1 + 280);
    uint64_t v103 = *(void *)(a1 + 288);
    *(void *)(a1 + 264) = v96;
    *(void *)(a1 + 272) = v97;
    *(void *)(a1 + 280) = v98;
    *(void *)(a1 + 288) = v99;
    unsigned __int8 v104 = *(unsigned char *)(a1 + 296);
    *(unsigned char *)(a1 + 296) = v95;
    sub_24936CCE4(v100, v101, v102, v103, v104);
  }
  char v113 = (_OWORD *)(a1 + 304);
  uint64_t v114 = (_OWORD *)(a2 + 304);
  uint64_t v115 = *(unsigned __int8 *)(a2 + 336);
  if (*(unsigned char *)(a1 + 336) == 0xFF)
  {
    if (v115 == 255)
    {
      *char v113 = *v114;
      long long v116 = *(_OWORD *)(a2 + 320);
      long long v117 = *(_OWORD *)(a2 + 336);
      long long v118 = *(_OWORD *)(a2 + 352);
      *(_OWORD *)(a1 + 361) = *(_OWORD *)(a2 + 361);
      *(_OWORD *)(a1 + 336) = v117;
      *(_OWORD *)(a1 + 352) = v118;
      *(_OWORD *)(a1 + 320) = v116;
      goto LABEL_50;
    }
    uint64_t v122 = *(void *)(a2 + 304);
    uint64_t v123 = *(void *)(a2 + 312);
    uint64_t v124 = *(void *)(a2 + 320);
    uint64_t v125 = *(void *)(a2 + 328);
    sub_24936CAA0(v122, v123, v124, v125, *(unsigned char *)(a2 + 336));
    *(void *)(a1 + 304) = v122;
    *(void *)(a1 + 312) = v123;
    *(void *)(a1 + 320) = v124;
    *(void *)(a1 + 328) = v125;
    *(unsigned char *)(a1 + 336) = v115;
    int v126 = *(unsigned __int8 *)(a2 + 376);
    if (v126 == 255)
    {
      long long v127 = *(_OWORD *)(a2 + 344);
      long long v128 = *(_OWORD *)(a2 + 360);
      *(unsigned char *)(a1 + 376) = *(unsigned char *)(a2 + 376);
      *(_OWORD *)(a1 + 344) = v127;
      *(_OWORD *)(a1 + 360) = v128;
      goto LABEL_50;
    }
LABEL_47:
    uint64_t v149 = *(void *)(a2 + 344);
    uint64_t v150 = *(void *)(a2 + 352);
    uint64_t v151 = *(void *)(a2 + 360);
    uint64_t v152 = *(void *)(a2 + 368);
    sub_24936CAA0(v149, v150, v151, v152, v126);
    *(void *)(a1 + 344) = v149;
    *(void *)(a1 + 352) = v150;
    *(void *)(a1 + 360) = v151;
    *(void *)(a1 + 368) = v152;
    *(unsigned char *)(a1 + 376) = v126;
    goto LABEL_50;
  }
  if (v115 == 255)
  {
    sub_24937656C(a1 + 304);
    *char v113 = *v114;
    long long v120 = *(_OWORD *)(a2 + 336);
    long long v119 = *(_OWORD *)(a2 + 352);
    long long v121 = *(_OWORD *)(a2 + 320);
    *(_OWORD *)(a1 + 361) = *(_OWORD *)(a2 + 361);
    *(_OWORD *)(a1 + 336) = v120;
    *(_OWORD *)(a1 + 352) = v119;
    *(_OWORD *)(a1 + 320) = v121;
    goto LABEL_50;
  }
  uint64_t v129 = *(void *)(a2 + 304);
  uint64_t v130 = *(void *)(a2 + 312);
  uint64_t v131 = *(void *)(a2 + 320);
  uint64_t v132 = *(void *)(a2 + 328);
  sub_24936CAA0(v129, v130, v131, v132, *(unsigned char *)(a2 + 336));
  uint64_t v133 = *(void *)(a1 + 304);
  uint64_t v134 = *(void *)(a1 + 312);
  uint64_t v135 = *(void *)(a1 + 320);
  uint64_t v136 = *(void *)(a1 + 328);
  *(void *)(a1 + 304) = v129;
  *(void *)(a1 + 312) = v130;
  *(void *)(a1 + 320) = v131;
  *(void *)(a1 + 328) = v132;
  unsigned __int8 v137 = *(unsigned char *)(a1 + 336);
  *(unsigned char *)(a1 + 336) = v115;
  sub_24936CCE4(v133, v134, v135, v136, v137);
  uint64_t v138 = (long long *)(a1 + 344);
  unsigned __int8 v139 = (long long *)(a2 + 344);
  int v126 = *(unsigned __int8 *)(a2 + 376);
  if (*(unsigned __int8 *)(a1 + 376) == 255)
  {
    if (v126 == 255)
    {
      long long v155 = *v139;
      long long v156 = *(_OWORD *)(a2 + 360);
      *(unsigned char *)(a1 + 376) = *(unsigned char *)(a2 + 376);
      *uint64_t v138 = v155;
      *(_OWORD *)(a1 + 360) = v156;
      goto LABEL_50;
    }
    goto LABEL_47;
  }
  if (v126 == 255)
  {
    sub_249376534(a1 + 344);
    char v153 = *(unsigned char *)(a2 + 376);
    long long v154 = *(_OWORD *)(a2 + 360);
    *uint64_t v138 = *v139;
    *(_OWORD *)(a1 + 360) = v154;
    *(unsigned char *)(a1 + 376) = v153;
  }
  else
  {
    uint64_t v140 = *(void *)(a2 + 344);
    uint64_t v141 = *(void *)(a2 + 352);
    uint64_t v142 = *(void *)(a2 + 360);
    uint64_t v143 = *(void *)(a2 + 368);
    sub_24936CAA0(v140, v141, v142, v143, *(unsigned char *)(a2 + 376));
    uint64_t v144 = *(void *)(a1 + 344);
    uint64_t v145 = *(void *)(a1 + 352);
    uint64_t v146 = *(void *)(a1 + 360);
    uint64_t v147 = *(void *)(a1 + 368);
    *(void *)(a1 + 344) = v140;
    *(void *)(a1 + 352) = v141;
    *(void *)(a1 + 360) = v142;
    *(void *)(a1 + 368) = v143;
    unsigned __int8 v148 = *(unsigned char *)(a1 + 376);
    *(unsigned char *)(a1 + 376) = v126;
    sub_24936CCE4(v144, v145, v146, v147, v148);
  }
LABEL_50:
  uint64_t v157 = *(void *)(a2 + 384);
  uint64_t v158 = *(void *)(a2 + 392);
  uint64_t v159 = *(void *)(a2 + 400);
  uint64_t v160 = *(void *)(a2 + 408);
  uint64_t v161 = *(void *)(a2 + 416);
  unsigned __int8 v162 = *(unsigned char *)(a2 + 424);
  sub_24936DFB0(v157, v158, v159, v160, v161, v162);
  uint64_t v163 = *(void *)(a1 + 384);
  uint64_t v164 = *(void *)(a1 + 392);
  uint64_t v165 = *(void *)(a1 + 400);
  uint64_t v166 = *(void *)(a1 + 408);
  uint64_t v167 = *(void *)(a1 + 416);
  *(void *)(a1 + 384) = v157;
  *(void *)(a1 + 392) = v158;
  *(void *)(a1 + 400) = v159;
  *(void *)(a1 + 408) = v160;
  *(void *)(a1 + 416) = v161;
  unsigned __int8 v168 = *(unsigned char *)(a1 + 424);
  *(unsigned char *)(a1 + 424) = v162;
  sub_24936E03C(v163, v164, v165, v166, v167, v168);
  *(unsigned char *)(a1 + 425) = *(unsigned char *)(a2 + 425);
  return a1;
}

uint64_t sub_249376500(uint64_t a1)
{
  return a1;
}

uint64_t sub_249376534(uint64_t a1)
{
  return a1;
}

uint64_t sub_24937656C(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy426_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1AAuLL);
}

uint64_t assignWithTake for LiveActivitySetupState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    uint64_t v6 = *(void *)(a2 + 40);
    if (v6)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v6;
      swift_bridgeObjectRelease();
      uint64_t v7 = *(void *)(a2 + 56);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = v7;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_249376500(a1 + 32);
  }
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v8;
LABEL_6:
  char v9 = *(unsigned char *)(a2 + 96);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 88);
  long long v14 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v14;
  unsigned __int8 v15 = *(unsigned char *)(a1 + 96);
  *(unsigned char *)(a1 + 96) = v9;
  sub_24936CCE4(v10, v11, v12, v13, v15);
  int v16 = *(unsigned __int8 *)(a1 + 136);
  if (v16 != 255)
  {
    int v17 = *(unsigned __int8 *)(a2 + 136);
    if (v17 != 255)
    {
      uint64_t v18 = *(void *)(a1 + 104);
      uint64_t v19 = *(void *)(a1 + 112);
      uint64_t v20 = *(void *)(a1 + 120);
      uint64_t v21 = *(void *)(a1 + 128);
      *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
      *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
      *(unsigned char *)(a1 + 136) = v17;
      sub_24936CCE4(v18, v19, v20, v21, v16);
      goto LABEL_11;
    }
    sub_249376534(a1 + 104);
  }
  long long v22 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = v22;
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
LABEL_11:
  uint64_t v23 = (_OWORD *)(a1 + 264);
  uint64_t v24 = (_OWORD *)(a2 + 264);
  uint64_t v25 = *(unsigned __int8 *)(a1 + 176);
  if (v25 == 255)
  {
LABEL_14:
    long long v27 = *(_OWORD *)(a2 + 192);
    *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
    *(_OWORD *)(a1 + 192) = v27;
    *(_OWORD *)(a1 + 201) = *(_OWORD *)(a2 + 201);
    long long v28 = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 160) = v28;
    goto LABEL_15;
  }
  uint64_t v26 = *(unsigned __int8 *)(a2 + 176);
  if (v26 == 255)
  {
    sub_24937656C(a1 + 144);
    goto LABEL_14;
  }
  uint64_t v43 = *(void *)(a1 + 144);
  uint64_t v44 = *(void *)(a1 + 152);
  uint64_t v45 = *(void *)(a1 + 160);
  uint64_t v46 = *(void *)(a1 + 168);
  long long v47 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v47;
  *(unsigned char *)(a1 + 176) = v26;
  sub_24936CCE4(v43, v44, v45, v46, v25);
  int v48 = *(unsigned __int8 *)(a1 + 216);
  if (v48 != 255)
  {
    int v49 = *(unsigned __int8 *)(a2 + 216);
    if (v49 != 255)
    {
      uint64_t v50 = *(void *)(a1 + 184);
      uint64_t v51 = *(void *)(a1 + 192);
      uint64_t v52 = *(void *)(a1 + 200);
      uint64_t v53 = *(void *)(a1 + 208);
      *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
      *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
      *(unsigned char *)(a1 + 216) = v49;
      sub_24936CCE4(v50, v51, v52, v53, v48);
      goto LABEL_15;
    }
    sub_249376534(a1 + 184);
  }
  long long v81 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = v81;
  *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
LABEL_15:
  char v29 = *(unsigned char *)(a2 + 256);
  uint64_t v30 = *(void *)(a1 + 224);
  uint64_t v31 = *(void *)(a1 + 232);
  uint64_t v32 = *(void *)(a1 + 240);
  uint64_t v33 = *(void *)(a1 + 248);
  long long v34 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v34;
  unsigned __int8 v35 = *(unsigned char *)(a1 + 256);
  *(unsigned char *)(a1 + 256) = v29;
  sub_24936CCE4(v30, v31, v32, v33, v35);
  int v36 = *(unsigned __int8 *)(a1 + 296);
  if (v36 != 255)
  {
    int v37 = *(unsigned __int8 *)(a2 + 296);
    if (v37 != 255)
    {
      uint64_t v38 = *(void *)(a1 + 264);
      uint64_t v39 = *(void *)(a1 + 272);
      uint64_t v40 = *(void *)(a1 + 280);
      uint64_t v41 = *(void *)(a1 + 288);
      long long v42 = *(_OWORD *)(a2 + 280);
      *uint64_t v23 = *v24;
      *(_OWORD *)(a1 + 280) = v42;
      *(unsigned char *)(a1 + 296) = v37;
      sub_24936CCE4(v38, v39, v40, v41, v36);
      goto LABEL_23;
    }
    sub_249376534(a1 + 264);
  }
  long long v54 = *(_OWORD *)(a2 + 280);
  *uint64_t v23 = *v24;
  *(_OWORD *)(a1 + 280) = v54;
  *(unsigned char *)(a1 + 296) = *(unsigned char *)(a2 + 296);
LABEL_23:
  uint64_t v55 = *(unsigned __int8 *)(a1 + 336);
  if (v55 != 255)
  {
    uint64_t v56 = *(unsigned __int8 *)(a2 + 336);
    if (v56 != 255)
    {
      uint64_t v69 = *(void *)(a1 + 304);
      uint64_t v70 = *(void *)(a1 + 312);
      uint64_t v71 = *(void *)(a1 + 320);
      uint64_t v72 = *(void *)(a1 + 328);
      long long v73 = *(_OWORD *)(a2 + 320);
      *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
      *(_OWORD *)(a1 + 320) = v73;
      *(unsigned char *)(a1 + 336) = v56;
      sub_24936CCE4(v69, v70, v71, v72, v55);
      int v74 = *(unsigned __int8 *)(a1 + 376);
      if (v74 != 255)
      {
        int v75 = *(unsigned __int8 *)(a2 + 376);
        if (v75 != 255)
        {
          uint64_t v76 = *(void *)(a1 + 344);
          uint64_t v77 = *(void *)(a1 + 352);
          uint64_t v78 = *(void *)(a1 + 360);
          uint64_t v79 = *(void *)(a1 + 368);
          long long v80 = *(_OWORD *)(a2 + 360);
          *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
          *(_OWORD *)(a1 + 360) = v80;
          *(unsigned char *)(a1 + 376) = v75;
          sub_24936CCE4(v76, v77, v78, v79, v74);
          goto LABEL_27;
        }
        sub_249376534(a1 + 344);
      }
      long long v82 = *(_OWORD *)(a2 + 360);
      *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
      *(_OWORD *)(a1 + 360) = v82;
      *(unsigned char *)(a1 + 376) = *(unsigned char *)(a2 + 376);
      goto LABEL_27;
    }
    sub_24937656C(a1 + 304);
  }
  long long v57 = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 352) = v57;
  *(_OWORD *)(a1 + 361) = *(_OWORD *)(a2 + 361);
  long long v58 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 320) = v58;
LABEL_27:
  uint64_t v59 = *(void *)(a2 + 416);
  char v60 = *(unsigned char *)(a2 + 424);
  uint64_t v61 = *(void *)(a1 + 384);
  uint64_t v62 = *(void *)(a1 + 392);
  uint64_t v63 = *(void *)(a1 + 400);
  uint64_t v64 = *(void *)(a1 + 408);
  uint64_t v65 = *(void *)(a1 + 416);
  long long v66 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
  *(_OWORD *)(a1 + 400) = v66;
  *(void *)(a1 + 416) = v59;
  unsigned __int8 v67 = *(unsigned char *)(a1 + 424);
  *(unsigned char *)(a1 + 424) = v60;
  sub_24936E03C(v61, v62, v63, v64, v65, v67);
  *(unsigned char *)(a1 + 425) = *(unsigned char *)(a2 + 425);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivitySetupState(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 426)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivitySetupState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
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
    *(_WORD *)(result + 424) = 0;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 426) = 1;
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
    *(unsigned char *)(result + 426) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivitySetupState()
{
  return &type metadata for LiveActivitySetupState;
}

uint64_t destroy for LiveActivityImageSource(uint64_t a1)
{
  return sub_24936CCE4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t initializeWithCopy for LiveActivityImageSource(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_24936CAA0(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for LiveActivityImageSource(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_24936CAA0(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  unsigned __int8 v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_24936CCE4(v8, v9, v10, v11, v12);
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

uint64_t assignWithTake for LiveActivityImageSource(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_24936CCE4(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivityImageSource(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivityImageSource(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_249376BAC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_249376BB4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LiveActivityImageSource()
{
  return &type metadata for LiveActivityImageSource;
}

uint64_t destroy for LiveActivityImageMap(uint64_t a1)
{
  sub_24936CCE4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
  int v2 = *(unsigned __int8 *)(a1 + 72);
  if (v2 != 255) {
    sub_24936CCE4(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), v2);
  }
  uint64_t v3 = *(unsigned __int8 *)(a1 + 112);
  if (v3 != 255)
  {
    sub_24936CCE4(*(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), v3);
    int v4 = *(unsigned __int8 *)(a1 + 152);
    if (v4 != 255) {
      sub_24936CCE4(*(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), v4);
    }
  }
  uint64_t result = sub_24936CCE4(*(void *)(a1 + 160), *(void *)(a1 + 168), *(void *)(a1 + 176), *(void *)(a1 + 184), *(unsigned char *)(a1 + 192));
  int v6 = *(unsigned __int8 *)(a1 + 232);
  if (v6 != 255) {
    uint64_t result = sub_24936CCE4(*(void *)(a1 + 200), *(void *)(a1 + 208), *(void *)(a1 + 216), *(void *)(a1 + 224), v6);
  }
  uint64_t v7 = *(unsigned __int8 *)(a1 + 272);
  if (v7 != 255)
  {
    uint64_t result = sub_24936CCE4(*(void *)(a1 + 240), *(void *)(a1 + 248), *(void *)(a1 + 256), *(void *)(a1 + 264), v7);
    int v8 = *(unsigned __int8 *)(a1 + 312);
    if (v8 != 255)
    {
      uint64_t v9 = *(void *)(a1 + 280);
      uint64_t v10 = *(void *)(a1 + 288);
      uint64_t v11 = *(void *)(a1 + 296);
      uint64_t v12 = *(void *)(a1 + 304);
      return sub_24936CCE4(v9, v10, v11, v12, v8);
    }
  }
  return result;
}

uint64_t initializeWithCopy for LiveActivityImageMap(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 32);
  sub_24936CAA0(*(void *)a2, v5, v6, v7, v8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  int v9 = *(unsigned __int8 *)(a2 + 72);
  if (v9 == 255)
  {
    long long v14 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v14;
    *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  }
  else
  {
    uint64_t v10 = *(void *)(a2 + 40);
    uint64_t v11 = *(void *)(a2 + 48);
    uint64_t v12 = *(void *)(a2 + 56);
    uint64_t v13 = *(void *)(a2 + 64);
    sub_24936CAA0(v10, v11, v12, v13, *(unsigned char *)(a2 + 72));
    *(void *)(a1 + 40) = v10;
    *(void *)(a1 + 48) = v11;
    *(void *)(a1 + 56) = v12;
    *(void *)(a1 + 64) = v13;
    *(unsigned char *)(a1 + 72) = v9;
  }
  uint64_t v15 = *(unsigned __int8 *)(a2 + 112);
  if (v15 == 255)
  {
    long long v16 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 128) = v16;
    *(_OWORD *)(a1 + 137) = *(_OWORD *)(a2 + 137);
    long long v17 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v17;
  }
  else
  {
    uint64_t v18 = *(void *)(a2 + 80);
    uint64_t v19 = *(void *)(a2 + 88);
    uint64_t v20 = *(void *)(a2 + 96);
    uint64_t v21 = *(void *)(a2 + 104);
    sub_24936CAA0(v18, v19, v20, v21, *(unsigned char *)(a2 + 112));
    *(void *)(a1 + 80) = v18;
    *(void *)(a1 + 88) = v19;
    *(void *)(a1 + 96) = v20;
    *(void *)(a1 + 104) = v21;
    *(unsigned char *)(a1 + 112) = v15;
    int v22 = *(unsigned __int8 *)(a2 + 152);
    if (v22 == 255)
    {
      long long v27 = *(_OWORD *)(a2 + 136);
      *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
      *(_OWORD *)(a1 + 136) = v27;
      *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
    }
    else
    {
      uint64_t v23 = *(void *)(a2 + 120);
      uint64_t v24 = *(void *)(a2 + 128);
      uint64_t v25 = *(void *)(a2 + 136);
      uint64_t v26 = *(void *)(a2 + 144);
      sub_24936CAA0(v23, v24, v25, v26, *(unsigned char *)(a2 + 152));
      *(void *)(a1 + 120) = v23;
      *(void *)(a1 + 128) = v24;
      *(void *)(a1 + 136) = v25;
      *(void *)(a1 + 144) = v26;
      *(unsigned char *)(a1 + 152) = v22;
    }
  }
  uint64_t v28 = *(void *)(a2 + 160);
  uint64_t v29 = *(void *)(a2 + 168);
  uint64_t v30 = *(void *)(a2 + 176);
  uint64_t v31 = *(void *)(a2 + 184);
  unsigned __int8 v32 = *(unsigned char *)(a2 + 192);
  sub_24936CAA0(v28, v29, v30, v31, v32);
  *(void *)(a1 + 160) = v28;
  *(void *)(a1 + 168) = v29;
  *(void *)(a1 + 176) = v30;
  *(void *)(a1 + 184) = v31;
  *(unsigned char *)(a1 + 192) = v32;
  int v33 = *(unsigned __int8 *)(a2 + 232);
  if (v33 == 255)
  {
    long long v38 = *(_OWORD *)(a2 + 216);
    *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
    *(_OWORD *)(a1 + 216) = v38;
    *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  }
  else
  {
    uint64_t v34 = *(void *)(a2 + 200);
    uint64_t v35 = *(void *)(a2 + 208);
    uint64_t v36 = *(void *)(a2 + 216);
    uint64_t v37 = *(void *)(a2 + 224);
    sub_24936CAA0(v34, v35, v36, v37, *(unsigned char *)(a2 + 232));
    *(void *)(a1 + 200) = v34;
    *(void *)(a1 + 208) = v35;
    *(void *)(a1 + 216) = v36;
    *(void *)(a1 + 224) = v37;
    *(unsigned char *)(a1 + 232) = v33;
  }
  uint64_t v39 = *(unsigned __int8 *)(a2 + 272);
  if (v39 == 255)
  {
    long long v40 = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 288) = v40;
    *(_OWORD *)(a1 + 297) = *(_OWORD *)(a2 + 297);
    long long v41 = *(_OWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
    *(_OWORD *)(a1 + 256) = v41;
  }
  else
  {
    uint64_t v42 = *(void *)(a2 + 240);
    uint64_t v43 = *(void *)(a2 + 248);
    uint64_t v44 = *(void *)(a2 + 256);
    uint64_t v45 = *(void *)(a2 + 264);
    sub_24936CAA0(v42, v43, v44, v45, *(unsigned char *)(a2 + 272));
    *(void *)(a1 + 240) = v42;
    *(void *)(a1 + 248) = v43;
    *(void *)(a1 + 256) = v44;
    *(void *)(a1 + 264) = v45;
    *(unsigned char *)(a1 + 272) = v39;
    int v46 = *(unsigned __int8 *)(a2 + 312);
    if (v46 == 255)
    {
      long long v51 = *(_OWORD *)(a2 + 296);
      *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
      *(_OWORD *)(a1 + 296) = v51;
      *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
    }
    else
    {
      uint64_t v47 = *(void *)(a2 + 280);
      uint64_t v48 = *(void *)(a2 + 288);
      uint64_t v50 = *(void *)(a2 + 296);
      uint64_t v49 = *(void *)(a2 + 304);
      sub_24936CAA0(v47, v48, v50, v49, v46);
      *(void *)(a1 + 280) = v47;
      *(void *)(a1 + 288) = v48;
      *(void *)(a1 + 296) = v50;
      *(void *)(a1 + 304) = v49;
      *(unsigned char *)(a1 + 312) = v46;
    }
  }
  return a1;
}

uint64_t assignWithCopy for LiveActivityImageMap(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 32);
  sub_24936CAA0(*(void *)a2, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  unsigned __int8 v13 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v8;
  sub_24936CCE4(v9, v10, v11, v12, v13);
  long long v14 = (long long *)(a1 + 40);
  uint64_t v15 = (long long *)(a2 + 40);
  int v16 = *(unsigned __int8 *)(a2 + 72);
  if (*(unsigned __int8 *)(a1 + 72) == 255)
  {
    if (v16 == 255)
    {
      long long v32 = *v15;
      long long v33 = *(_OWORD *)(a2 + 56);
      *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
      *long long v14 = v32;
      *(_OWORD *)(a1 + 56) = v33;
    }
    else
    {
      uint64_t v26 = *(void *)(a2 + 40);
      uint64_t v27 = *(void *)(a2 + 48);
      uint64_t v28 = *(void *)(a2 + 56);
      uint64_t v29 = *(void *)(a2 + 64);
      sub_24936CAA0(v26, v27, v28, v29, *(unsigned char *)(a2 + 72));
      *(void *)(a1 + 40) = v26;
      *(void *)(a1 + 48) = v27;
      *(void *)(a1 + 56) = v28;
      *(void *)(a1 + 64) = v29;
      *(unsigned char *)(a1 + 72) = v16;
    }
  }
  else if (v16 == 255)
  {
    sub_249376534(a1 + 40);
    char v30 = *(unsigned char *)(a2 + 72);
    long long v31 = *(_OWORD *)(a2 + 56);
    *long long v14 = *v15;
    *(_OWORD *)(a1 + 56) = v31;
    *(unsigned char *)(a1 + 72) = v30;
  }
  else
  {
    uint64_t v17 = *(void *)(a2 + 40);
    uint64_t v18 = *(void *)(a2 + 48);
    uint64_t v19 = *(void *)(a2 + 56);
    uint64_t v20 = *(void *)(a2 + 64);
    sub_24936CAA0(v17, v18, v19, v20, *(unsigned char *)(a2 + 72));
    uint64_t v21 = *(void *)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 56);
    uint64_t v24 = *(void *)(a1 + 64);
    *(void *)(a1 + 40) = v17;
    *(void *)(a1 + 48) = v18;
    *(void *)(a1 + 56) = v19;
    *(void *)(a1 + 64) = v20;
    unsigned __int8 v25 = *(unsigned char *)(a1 + 72);
    *(unsigned char *)(a1 + 72) = v16;
    sub_24936CCE4(v21, v22, v23, v24, v25);
  }
  uint64_t v34 = (_OWORD *)(a1 + 80);
  uint64_t v35 = (_OWORD *)(a2 + 80);
  uint64_t v36 = *(unsigned __int8 *)(a2 + 112);
  if (*(unsigned char *)(a1 + 112) == 0xFF)
  {
    if (v36 == 255)
    {
      _OWORD *v34 = *v35;
      long long v37 = *(_OWORD *)(a2 + 96);
      long long v38 = *(_OWORD *)(a2 + 112);
      long long v39 = *(_OWORD *)(a2 + 128);
      *(_OWORD *)(a1 + 137) = *(_OWORD *)(a2 + 137);
      *(_OWORD *)(a1 + 112) = v38;
      *(_OWORD *)(a1 + 128) = v39;
      *(_OWORD *)(a1 + 96) = v37;
      goto LABEL_22;
    }
    uint64_t v43 = *(void *)(a2 + 80);
    uint64_t v44 = *(void *)(a2 + 88);
    uint64_t v45 = *(void *)(a2 + 96);
    uint64_t v46 = *(void *)(a2 + 104);
    sub_24936CAA0(v43, v44, v45, v46, *(unsigned char *)(a2 + 112));
    *(void *)(a1 + 80) = v43;
    *(void *)(a1 + 88) = v44;
    *(void *)(a1 + 96) = v45;
    *(void *)(a1 + 104) = v46;
    *(unsigned char *)(a1 + 112) = v36;
    int v47 = *(unsigned __int8 *)(a2 + 152);
    if (v47 == 255)
    {
      long long v48 = *(_OWORD *)(a2 + 120);
      long long v49 = *(_OWORD *)(a2 + 136);
      *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
      *(_OWORD *)(a1 + 120) = v48;
      *(_OWORD *)(a1 + 136) = v49;
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  if (v36 == 255)
  {
    sub_24937656C(a1 + 80);
    _OWORD *v34 = *v35;
    long long v41 = *(_OWORD *)(a2 + 112);
    long long v40 = *(_OWORD *)(a2 + 128);
    long long v42 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 137) = *(_OWORD *)(a2 + 137);
    *(_OWORD *)(a1 + 112) = v41;
    *(_OWORD *)(a1 + 128) = v40;
    *(_OWORD *)(a1 + 96) = v42;
    goto LABEL_22;
  }
  uint64_t v50 = *(void *)(a2 + 80);
  uint64_t v51 = *(void *)(a2 + 88);
  uint64_t v52 = *(void *)(a2 + 96);
  uint64_t v53 = *(void *)(a2 + 104);
  sub_24936CAA0(v50, v51, v52, v53, *(unsigned char *)(a2 + 112));
  uint64_t v54 = *(void *)(a1 + 80);
  uint64_t v55 = *(void *)(a1 + 88);
  uint64_t v56 = *(void *)(a1 + 96);
  uint64_t v57 = *(void *)(a1 + 104);
  *(void *)(a1 + 80) = v50;
  *(void *)(a1 + 88) = v51;
  *(void *)(a1 + 96) = v52;
  *(void *)(a1 + 104) = v53;
  unsigned __int8 v58 = *(unsigned char *)(a1 + 112);
  *(unsigned char *)(a1 + 112) = v36;
  sub_24936CCE4(v54, v55, v56, v57, v58);
  uint64_t v59 = (_OWORD *)(a1 + 120);
  char v60 = (_OWORD *)(a2 + 120);
  int v47 = *(unsigned __int8 *)(a2 + 152);
  if (*(unsigned __int8 *)(a1 + 152) != 255)
  {
    if (v47 == 255)
    {
      sub_249376534(a1 + 120);
      char v74 = *(unsigned char *)(a2 + 152);
      long long v75 = *(_OWORD *)(a2 + 136);
      *uint64_t v59 = *v60;
      *(_OWORD *)(a1 + 136) = v75;
      *(unsigned char *)(a1 + 152) = v74;
    }
    else
    {
      uint64_t v61 = *(void *)(a2 + 120);
      uint64_t v62 = *(void *)(a2 + 128);
      uint64_t v63 = *(void *)(a2 + 136);
      uint64_t v64 = *(void *)(a2 + 144);
      sub_24936CAA0(v61, v62, v63, v64, *(unsigned char *)(a2 + 152));
      uint64_t v65 = *(void *)(a1 + 120);
      uint64_t v66 = *(void *)(a1 + 128);
      uint64_t v67 = *(void *)(a1 + 136);
      uint64_t v68 = *(void *)(a1 + 144);
      *(void *)(a1 + 120) = v61;
      *(void *)(a1 + 128) = v62;
      *(void *)(a1 + 136) = v63;
      *(void *)(a1 + 144) = v64;
      unsigned __int8 v69 = *(unsigned char *)(a1 + 152);
      *(unsigned char *)(a1 + 152) = v47;
      sub_24936CCE4(v65, v66, v67, v68, v69);
    }
    goto LABEL_22;
  }
  if (v47 != 255)
  {
LABEL_19:
    uint64_t v70 = *(void *)(a2 + 120);
    uint64_t v71 = *(void *)(a2 + 128);
    uint64_t v72 = *(void *)(a2 + 136);
    uint64_t v73 = *(void *)(a2 + 144);
    sub_24936CAA0(v70, v71, v72, v73, v47);
    *(void *)(a1 + 120) = v70;
    *(void *)(a1 + 128) = v71;
    *(void *)(a1 + 136) = v72;
    *(void *)(a1 + 144) = v73;
    *(unsigned char *)(a1 + 152) = v47;
    goto LABEL_22;
  }
  long long v76 = *v60;
  long long v77 = *(_OWORD *)(a2 + 136);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *uint64_t v59 = v76;
  *(_OWORD *)(a1 + 136) = v77;
LABEL_22:
  uint64_t v78 = *(void *)(a2 + 160);
  uint64_t v79 = *(void *)(a2 + 168);
  uint64_t v80 = *(void *)(a2 + 176);
  uint64_t v81 = *(void *)(a2 + 184);
  unsigned __int8 v82 = *(unsigned char *)(a2 + 192);
  sub_24936CAA0(v78, v79, v80, v81, v82);
  uint64_t v83 = *(void *)(a1 + 160);
  uint64_t v84 = *(void *)(a1 + 168);
  uint64_t v85 = *(void *)(a1 + 176);
  uint64_t v86 = *(void *)(a1 + 184);
  *(void *)(a1 + 160) = v78;
  *(void *)(a1 + 168) = v79;
  *(void *)(a1 + 176) = v80;
  *(void *)(a1 + 184) = v81;
  unsigned __int8 v87 = *(unsigned char *)(a1 + 192);
  *(unsigned char *)(a1 + 192) = v82;
  sub_24936CCE4(v83, v84, v85, v86, v87);
  uint64_t v88 = (long long *)(a1 + 200);
  uint64_t v89 = (long long *)(a2 + 200);
  int v90 = *(unsigned __int8 *)(a2 + 232);
  if (*(unsigned __int8 *)(a1 + 232) == 255)
  {
    if (v90 == 255)
    {
      long long v106 = *v89;
      long long v107 = *(_OWORD *)(a2 + 216);
      *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
      long long *v88 = v106;
      *(_OWORD *)(a1 + 216) = v107;
    }
    else
    {
      uint64_t v100 = *(void *)(a2 + 200);
      uint64_t v101 = *(void *)(a2 + 208);
      uint64_t v102 = *(void *)(a2 + 216);
      uint64_t v103 = *(void *)(a2 + 224);
      sub_24936CAA0(v100, v101, v102, v103, *(unsigned char *)(a2 + 232));
      *(void *)(a1 + 200) = v100;
      *(void *)(a1 + 208) = v101;
      *(void *)(a1 + 216) = v102;
      *(void *)(a1 + 224) = v103;
      *(unsigned char *)(a1 + 232) = v90;
    }
  }
  else if (v90 == 255)
  {
    sub_249376534(a1 + 200);
    char v104 = *(unsigned char *)(a2 + 232);
    long long v105 = *(_OWORD *)(a2 + 216);
    long long *v88 = *v89;
    *(_OWORD *)(a1 + 216) = v105;
    *(unsigned char *)(a1 + 232) = v104;
  }
  else
  {
    uint64_t v91 = *(void *)(a2 + 200);
    uint64_t v92 = *(void *)(a2 + 208);
    uint64_t v93 = *(void *)(a2 + 216);
    uint64_t v94 = *(void *)(a2 + 224);
    sub_24936CAA0(v91, v92, v93, v94, *(unsigned char *)(a2 + 232));
    uint64_t v95 = *(void *)(a1 + 200);
    uint64_t v96 = *(void *)(a1 + 208);
    uint64_t v97 = *(void *)(a1 + 216);
    uint64_t v98 = *(void *)(a1 + 224);
    *(void *)(a1 + 200) = v91;
    *(void *)(a1 + 208) = v92;
    *(void *)(a1 + 216) = v93;
    *(void *)(a1 + 224) = v94;
    unsigned __int8 v99 = *(unsigned char *)(a1 + 232);
    *(unsigned char *)(a1 + 232) = v90;
    sub_24936CCE4(v95, v96, v97, v98, v99);
  }
  uint64_t v108 = (_OWORD *)(a1 + 240);
  char v109 = (_OWORD *)(a2 + 240);
  uint64_t v110 = *(unsigned __int8 *)(a2 + 272);
  if (*(unsigned char *)(a1 + 272) == 0xFF)
  {
    if (v110 == 255)
    {
      *uint64_t v108 = *v109;
      long long v111 = *(_OWORD *)(a2 + 256);
      long long v112 = *(_OWORD *)(a2 + 272);
      long long v113 = *(_OWORD *)(a2 + 288);
      *(_OWORD *)(a1 + 297) = *(_OWORD *)(a2 + 297);
      *(_OWORD *)(a1 + 272) = v112;
      *(_OWORD *)(a1 + 288) = v113;
      *(_OWORD *)(a1 + 256) = v111;
      return a1;
    }
    uint64_t v117 = *(void *)(a2 + 240);
    uint64_t v118 = *(void *)(a2 + 248);
    uint64_t v119 = *(void *)(a2 + 256);
    uint64_t v120 = *(void *)(a2 + 264);
    sub_24936CAA0(v117, v118, v119, v120, *(unsigned char *)(a2 + 272));
    *(void *)(a1 + 240) = v117;
    *(void *)(a1 + 248) = v118;
    *(void *)(a1 + 256) = v119;
    *(void *)(a1 + 264) = v120;
    *(unsigned char *)(a1 + 272) = v110;
    int v121 = *(unsigned __int8 *)(a2 + 312);
    if (v121 == 255)
    {
      long long v122 = *(_OWORD *)(a2 + 280);
      long long v123 = *(_OWORD *)(a2 + 296);
      *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
      *(_OWORD *)(a1 + 280) = v122;
      *(_OWORD *)(a1 + 296) = v123;
      return a1;
    }
LABEL_40:
    uint64_t v144 = *(void *)(a2 + 280);
    uint64_t v145 = *(void *)(a2 + 288);
    uint64_t v147 = *(void *)(a2 + 296);
    uint64_t v146 = *(void *)(a2 + 304);
    sub_24936CAA0(v144, v145, v147, v146, v121);
    *(void *)(a1 + 280) = v144;
    *(void *)(a1 + 288) = v145;
    *(void *)(a1 + 296) = v147;
    *(void *)(a1 + 304) = v146;
    *(unsigned char *)(a1 + 312) = v121;
    return a1;
  }
  if (v110 == 255)
  {
    sub_24937656C(a1 + 240);
    *uint64_t v108 = *v109;
    long long v115 = *(_OWORD *)(a2 + 272);
    long long v114 = *(_OWORD *)(a2 + 288);
    long long v116 = *(_OWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 297) = *(_OWORD *)(a2 + 297);
    *(_OWORD *)(a1 + 272) = v115;
    *(_OWORD *)(a1 + 288) = v114;
    *(_OWORD *)(a1 + 256) = v116;
    return a1;
  }
  uint64_t v124 = *(void *)(a2 + 240);
  uint64_t v125 = *(void *)(a2 + 248);
  uint64_t v126 = *(void *)(a2 + 256);
  uint64_t v127 = *(void *)(a2 + 264);
  sub_24936CAA0(v124, v125, v126, v127, *(unsigned char *)(a2 + 272));
  uint64_t v128 = *(void *)(a1 + 240);
  uint64_t v129 = *(void *)(a1 + 248);
  uint64_t v130 = *(void *)(a1 + 256);
  uint64_t v131 = *(void *)(a1 + 264);
  *(void *)(a1 + 240) = v124;
  *(void *)(a1 + 248) = v125;
  *(void *)(a1 + 256) = v126;
  *(void *)(a1 + 264) = v127;
  unsigned __int8 v132 = *(unsigned char *)(a1 + 272);
  *(unsigned char *)(a1 + 272) = v110;
  sub_24936CCE4(v128, v129, v130, v131, v132);
  uint64_t v133 = (long long *)(a1 + 280);
  uint64_t v134 = (long long *)(a2 + 280);
  int v121 = *(unsigned __int8 *)(a2 + 312);
  if (*(unsigned __int8 *)(a1 + 312) == 255)
  {
    if (v121 == 255)
    {
      long long v150 = *v134;
      long long v151 = *(_OWORD *)(a2 + 296);
      *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
      *uint64_t v133 = v150;
      *(_OWORD *)(a1 + 296) = v151;
      return a1;
    }
    goto LABEL_40;
  }
  if (v121 == 255)
  {
    sub_249376534(a1 + 280);
    char v148 = *(unsigned char *)(a2 + 312);
    long long v149 = *(_OWORD *)(a2 + 296);
    *uint64_t v133 = *v134;
    *(_OWORD *)(a1 + 296) = v149;
    *(unsigned char *)(a1 + 312) = v148;
  }
  else
  {
    uint64_t v135 = *(void *)(a2 + 280);
    uint64_t v136 = *(void *)(a2 + 288);
    uint64_t v138 = *(void *)(a2 + 296);
    uint64_t v137 = *(void *)(a2 + 304);
    sub_24936CAA0(v135, v136, v138, v137, v121);
    uint64_t v139 = *(void *)(a1 + 280);
    uint64_t v140 = *(void *)(a1 + 288);
    uint64_t v141 = *(void *)(a1 + 296);
    uint64_t v142 = *(void *)(a1 + 304);
    *(void *)(a1 + 280) = v135;
    *(void *)(a1 + 288) = v136;
    *(void *)(a1 + 296) = v138;
    *(void *)(a1 + 304) = v137;
    unsigned __int8 v143 = *(unsigned char *)(a1 + 312);
    *(unsigned char *)(a1 + 312) = v121;
    sub_24936CCE4(v139, v140, v141, v142, v143);
  }
  return a1;
}

void *__swift_memcpy313_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x139uLL);
}

uint64_t assignWithTake for LiveActivityImageMap(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  unsigned __int8 v10 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v4;
  sub_24936CCE4(v5, v6, v7, v8, v10);
  int v11 = *(unsigned __int8 *)(a1 + 72);
  if (v11 != 255)
  {
    int v12 = *(unsigned __int8 *)(a2 + 72);
    if (v12 != 255)
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 56);
      uint64_t v16 = *(void *)(a1 + 64);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
      *(unsigned char *)(a1 + 72) = v12;
      sub_24936CCE4(v13, v14, v15, v16, v11);
      goto LABEL_6;
    }
    sub_249376534(a1 + 40);
  }
  long long v17 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v17;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
LABEL_6:
  uint64_t v18 = *(unsigned __int8 *)(a1 + 112);
  if (v18 == 255)
  {
LABEL_9:
    long long v20 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 128) = v20;
    *(_OWORD *)(a1 + 137) = *(_OWORD *)(a2 + 137);
    long long v21 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v21;
    goto LABEL_10;
  }
  uint64_t v19 = *(unsigned __int8 *)(a2 + 112);
  if (v19 == 255)
  {
    sub_24937656C(a1 + 80);
    goto LABEL_9;
  }
  uint64_t v35 = *(void *)(a1 + 80);
  uint64_t v36 = *(void *)(a1 + 88);
  uint64_t v37 = *(void *)(a1 + 96);
  uint64_t v38 = *(void *)(a1 + 104);
  long long v39 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v39;
  *(unsigned char *)(a1 + 112) = v19;
  sub_24936CCE4(v35, v36, v37, v38, v18);
  int v40 = *(unsigned __int8 *)(a1 + 152);
  if (v40 != 255)
  {
    int v41 = *(unsigned __int8 *)(a2 + 152);
    if (v41 != 255)
    {
      uint64_t v42 = *(void *)(a1 + 120);
      uint64_t v43 = *(void *)(a1 + 128);
      uint64_t v44 = *(void *)(a1 + 136);
      uint64_t v45 = *(void *)(a1 + 144);
      *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
      *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
      *(unsigned char *)(a1 + 152) = v41;
      sub_24936CCE4(v42, v43, v44, v45, v40);
      goto LABEL_10;
    }
    sub_249376534(a1 + 120);
  }
  long long v66 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v66;
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
LABEL_10:
  char v22 = *(unsigned char *)(a2 + 192);
  uint64_t v23 = *(void *)(a1 + 160);
  uint64_t v24 = *(void *)(a1 + 168);
  uint64_t v25 = *(void *)(a1 + 176);
  uint64_t v26 = *(void *)(a1 + 184);
  long long v27 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v27;
  unsigned __int8 v28 = *(unsigned char *)(a1 + 192);
  *(unsigned char *)(a1 + 192) = v22;
  sub_24936CCE4(v23, v24, v25, v26, v28);
  int v29 = *(unsigned __int8 *)(a1 + 232);
  if (v29 != 255)
  {
    int v30 = *(unsigned __int8 *)(a2 + 232);
    if (v30 != 255)
    {
      uint64_t v31 = *(void *)(a1 + 200);
      uint64_t v32 = *(void *)(a1 + 208);
      uint64_t v33 = *(void *)(a1 + 216);
      uint64_t v34 = *(void *)(a1 + 224);
      *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
      *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
      *(unsigned char *)(a1 + 232) = v30;
      sub_24936CCE4(v31, v32, v33, v34, v29);
      goto LABEL_18;
    }
    sub_249376534(a1 + 200);
  }
  long long v46 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = v46;
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
LABEL_18:
  uint64_t v47 = *(unsigned __int8 *)(a1 + 272);
  if (v47 != 255)
  {
    uint64_t v48 = *(unsigned __int8 *)(a2 + 272);
    if (v48 != 255)
    {
      uint64_t v52 = (_OWORD *)(a1 + 280);
      uint64_t v53 = (_OWORD *)(a2 + 280);
      uint64_t v54 = *(void *)(a1 + 240);
      uint64_t v55 = *(void *)(a1 + 248);
      uint64_t v56 = *(void *)(a1 + 256);
      uint64_t v57 = *(void *)(a1 + 264);
      long long v58 = *(_OWORD *)(a2 + 256);
      *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
      *(_OWORD *)(a1 + 256) = v58;
      *(unsigned char *)(a1 + 272) = v48;
      sub_24936CCE4(v54, v55, v56, v57, v47);
      int v59 = *(unsigned __int8 *)(a1 + 312);
      if (v59 != 255)
      {
        int v60 = *(unsigned __int8 *)(a2 + 312);
        if (v60 != 255)
        {
          uint64_t v61 = *(void *)(a1 + 280);
          uint64_t v62 = *(void *)(a1 + 288);
          uint64_t v63 = *(void *)(a1 + 296);
          uint64_t v64 = *(void *)(a1 + 304);
          long long v65 = *(_OWORD *)(a2 + 296);
          *uint64_t v52 = *v53;
          *(_OWORD *)(a1 + 296) = v65;
          *(unsigned char *)(a1 + 312) = v60;
          sub_24936CCE4(v61, v62, v63, v64, v59);
          return a1;
        }
        sub_249376534(a1 + 280);
      }
      long long v67 = *(_OWORD *)(a2 + 296);
      *uint64_t v52 = *v53;
      *(_OWORD *)(a1 + 296) = v67;
      *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
      return a1;
    }
    sub_24937656C(a1 + 240);
  }
  long long v49 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 288) = v49;
  *(_OWORD *)(a1 + 297) = *(_OWORD *)(a2 + 297);
  long long v50 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v50;
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivityImageMap(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 313)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivityImageMap(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
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
    *(unsigned char *)(result + 312) = 0;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 313) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 313) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivityImageMap()
{
  return &type metadata for LiveActivityImageMap;
}

uint64_t destroy for LiveActivityImages(uint64_t a1)
{
  uint64_t result = sub_24936CCE4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
  int v3 = *(unsigned __int8 *)(a1 + 72);
  if (v3 != 255)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    return sub_24936CCE4(v4, v5, v6, v7, v3);
  }
  return result;
}

uint64_t initializeWithCopy for LiveActivityImages(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 32);
  sub_24936CAA0(*(void *)a2, v5, v6, v7, v8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  int v9 = *(unsigned __int8 *)(a2 + 72);
  if (v9 == 255)
  {
    long long v14 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v14;
    *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  }
  else
  {
    uint64_t v10 = *(void *)(a2 + 40);
    uint64_t v11 = *(void *)(a2 + 48);
    uint64_t v13 = *(void *)(a2 + 56);
    uint64_t v12 = *(void *)(a2 + 64);
    sub_24936CAA0(v10, v11, v13, v12, v9);
    *(void *)(a1 + 40) = v10;
    *(void *)(a1 + 48) = v11;
    *(void *)(a1 + 56) = v13;
    *(void *)(a1 + 64) = v12;
    *(unsigned char *)(a1 + 72) = v9;
  }
  return a1;
}

uint64_t assignWithCopy for LiveActivityImages(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 32);
  sub_24936CAA0(*(void *)a2, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  unsigned __int8 v13 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v8;
  sub_24936CCE4(v9, v10, v11, v12, v13);
  long long v14 = (long long *)(a1 + 40);
  uint64_t v15 = (long long *)(a2 + 40);
  int v16 = *(unsigned __int8 *)(a2 + 72);
  if (*(unsigned __int8 *)(a1 + 72) == 255)
  {
    if (v16 == 255)
    {
      long long v32 = *v15;
      long long v33 = *(_OWORD *)(a2 + 56);
      *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
      *long long v14 = v32;
      *(_OWORD *)(a1 + 56) = v33;
    }
    else
    {
      uint64_t v26 = *(void *)(a2 + 40);
      uint64_t v27 = *(void *)(a2 + 48);
      uint64_t v29 = *(void *)(a2 + 56);
      uint64_t v28 = *(void *)(a2 + 64);
      sub_24936CAA0(v26, v27, v29, v28, v16);
      *(void *)(a1 + 40) = v26;
      *(void *)(a1 + 48) = v27;
      *(void *)(a1 + 56) = v29;
      *(void *)(a1 + 64) = v28;
      *(unsigned char *)(a1 + 72) = v16;
    }
  }
  else if (v16 == 255)
  {
    sub_249376534(a1 + 40);
    char v30 = *(unsigned char *)(a2 + 72);
    long long v31 = *(_OWORD *)(a2 + 56);
    *long long v14 = *v15;
    *(_OWORD *)(a1 + 56) = v31;
    *(unsigned char *)(a1 + 72) = v30;
  }
  else
  {
    uint64_t v17 = *(void *)(a2 + 40);
    uint64_t v18 = *(void *)(a2 + 48);
    uint64_t v20 = *(void *)(a2 + 56);
    uint64_t v19 = *(void *)(a2 + 64);
    sub_24936CAA0(v17, v18, v20, v19, v16);
    uint64_t v21 = *(void *)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 56);
    uint64_t v24 = *(void *)(a1 + 64);
    *(void *)(a1 + 40) = v17;
    *(void *)(a1 + 48) = v18;
    *(void *)(a1 + 56) = v20;
    *(void *)(a1 + 64) = v19;
    unsigned __int8 v25 = *(unsigned char *)(a1 + 72);
    *(unsigned char *)(a1 + 72) = v16;
    sub_24936CCE4(v21, v22, v23, v24, v25);
  }
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

uint64_t assignWithTake for LiveActivityImages(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  unsigned __int8 v10 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v4;
  sub_24936CCE4(v5, v6, v7, v8, v10);
  int v11 = *(unsigned __int8 *)(a1 + 72);
  if (v11 == 255) {
    goto LABEL_5;
  }
  int v12 = *(unsigned __int8 *)(a2 + 72);
  if (v12 == 255)
  {
    sub_249376534(a1 + 40);
LABEL_5:
    long long v17 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v17;
    *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
    return a1;
  }
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 64);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 72) = v12;
  sub_24936CCE4(v13, v14, v15, v16, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivityImages(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 73)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivityImages(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 72) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 73) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 73) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivityImages()
{
  return &type metadata for LiveActivityImages;
}

uint64_t destroy for LiveActivityTextMap(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for LiveActivityTextMap(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v6)
  {
    a1[4] = a2[4];
    a1[5] = v6;
    uint64_t v7 = a2[6];
    uint64_t v8 = a2[7];
    a1[6] = v7;
    a1[7] = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v9 = *((_OWORD *)a2 + 3);
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    *((_OWORD *)a1 + 3) = v9;
  }
  return a1;
}

void *assignWithCopy for LiveActivityTextMap(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + 4;
  uint64_t v5 = a2 + 4;
  uint64_t v6 = a2[5];
  if (a1[5])
  {
    if (v6)
    {
      a1[4] = a2[4];
      a1[5] = a2[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[6] = a2[6];
      a1[7] = a2[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_249376500((uint64_t)(a1 + 4));
      long long v7 = *((_OWORD *)a2 + 3);
      *uint64_t v4 = *v5;
      *((_OWORD *)a1 + 3) = v7;
    }
  }
  else if (v6)
  {
    a1[4] = a2[4];
    a1[5] = a2[5];
    a1[6] = a2[6];
    a1[7] = a2[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *((_OWORD *)a2 + 3);
    *uint64_t v4 = *v5;
    *((_OWORD *)a1 + 3) = v8;
  }
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LiveActivityTextMap(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  if (!*(void *)(a1 + 40)) {
    goto LABEL_5;
  }
  uint64_t v6 = *(void *)(a2 + 40);
  if (!v6)
  {
    sub_249376500(a1 + 32);
LABEL_5:
    long long v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
    return a1;
  }
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivityTextMap(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivityTextMap(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivityTextMap()
{
  return &type metadata for LiveActivityTextMap;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for LiveActivityText()
{
  return &type metadata for LiveActivityText;
}

uint64_t destroy for LiveActivityMetadata(uint64_t a1)
{
  return sub_24936E03C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t initializeWithCopy for LiveActivityMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 40);
  sub_24936DFB0(*(void *)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for LiveActivityMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 40);
  sub_24936DFB0(*(void *)a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  unsigned __int8 v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v8;
  sub_24936E03C(v9, v10, v11, v12, v13, v14);
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

uint64_t assignWithTake for LiveActivityMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(void *)(a1 + 32) = v3;
  unsigned __int8 v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v4;
  sub_24936E03C(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivityMetadata(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3E && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 62);
  }
  unsigned int v3 = (*(unsigned char *)(a1 + 40) & 0x3C | (*(unsigned __int8 *)(a1 + 40) >> 6)) ^ 0x3F;
  if (v3 >= 0x3D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for LiveActivityMetadata(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3D)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 62;
    if (a3 >= 0x3E) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3E) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2)
    {
      *(void *)(result + 32) = 0;
      *(_OWORD *)__n128 result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(unsigned char *)(result + 40) = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
    }
  }
  return result;
}

uint64_t sub_24937828C(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 40);
  int v2 = (char)v1;
  unsigned int v3 = v1 >> 6;
  if (v2 >= 0) {
    return v3;
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_2493782AC(uint64_t result)
{
  *(unsigned char *)(result + 40) &= 0x3Fu;
  return result;
}

uint64_t sub_2493782BC(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    *(unsigned char *)(result + 40) = *(unsigned char *)(result + 40) & 3 | ((_BYTE)a2 << 6);
  }
  else
  {
    *(void *)__n128 result = a2 - 2;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(unsigned char *)(result + 40) = 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivityMetadata()
{
  return &type metadata for LiveActivityMetadata;
}

uint64_t _s18BridgeLiveActivity16LiveActivityTextVwxx_0()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s18BridgeLiveActivity16LiveActivityTextVwcp_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s18BridgeLiveActivity16LiveActivityTextVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *_s18BridgeLiveActivity16LiveActivityTextVwta_0(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18BridgeLiveActivity16LiveActivityTextVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_249378480(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LiveActivityMetadata.WristSelectionMetadata()
{
  return &type metadata for LiveActivityMetadata.WristSelectionMetadata;
}

uint64_t getEnumTagSinglePayload for LiveActivityMetadata.ProgressMetadata(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  BOOL v4 = v3 >= 3;
  int v5 = v3 - 3;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivityMetadata.ProgressMetadata(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivityMetadata.ProgressMetadata()
{
  return &type metadata for LiveActivityMetadata.ProgressMetadata;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for LiveActivityPlacement()
{
  return &type metadata for LiveActivityPlacement;
}

ValueMetadata *type metadata accessor for LiveActivityWatchAssetType()
{
  return &type metadata for LiveActivityWatchAssetType;
}

ValueMetadata *type metadata accessor for LiveActivityWatchAssetType.CodingKeys()
{
  return &type metadata for LiveActivityWatchAssetType.CodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityWatchAssetType.AloeCodingKeys()
{
  return &type metadata for LiveActivityWatchAssetType.AloeCodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityWatchAssetType.AgaveCodingKeys()
{
  return &type metadata for LiveActivityWatchAssetType.AgaveCodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityWatchAssetType.AvoniaCodingKeys()
{
  return &type metadata for LiveActivityWatchAssetType.AvoniaCodingKeys;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_249378600(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_249378620(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LiveActivityMetadata.ProgressMetadata.CodingKeys()
{
  return &type metadata for LiveActivityMetadata.ProgressMetadata.CodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityMetadata.WristSelectionMetadata.CodingKeys()
{
  return &type metadata for LiveActivityMetadata.WristSelectionMetadata.CodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityMetadata.CodingKeys()
{
  return &type metadata for LiveActivityMetadata.CodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityMetadata.NoneCodingKeys()
{
  return &type metadata for LiveActivityMetadata.NoneCodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityMetadata.WristSelectionCodingKeys()
{
  return &type metadata for LiveActivityMetadata.WristSelectionCodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityMetadata.ProgressCodingKeys()
{
  return &type metadata for LiveActivityMetadata.ProgressCodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityText.CodingKeys()
{
  return &type metadata for LiveActivityText.CodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityTextMap.CodingKeys()
{
  return &type metadata for LiveActivityTextMap.CodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityImages.CodingKeys()
{
  return &type metadata for LiveActivityImages.CodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityImageMap.CodingKeys()
{
  return &type metadata for LiveActivityImageMap.CodingKeys;
}

uint64_t _s18BridgeLiveActivity26LiveActivityWatchAssetTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s18BridgeLiveActivity26LiveActivityWatchAssetTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x249378858);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivityImageSource.CodingKeys()
{
  return &type metadata for LiveActivityImageSource.CodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityImageSource.SystemImageCodingKeys()
{
  return &type metadata for LiveActivityImageSource.SystemImageCodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityImageSource.PathCodingKeys()
{
  return &type metadata for LiveActivityImageSource.PathCodingKeys;
}

uint64_t _s18BridgeLiveActivity20LiveActivityMetadataO22WristSelectionMetadataV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s18BridgeLiveActivity20LiveActivityMetadataO22WristSelectionMetadataV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x249378A0CLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_249378A34(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_249378A3C(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LiveActivityImageSource.BundleImageCodingKeys()
{
  return &type metadata for LiveActivityImageSource.BundleImageCodingKeys;
}

uint64_t _s18BridgeLiveActivity21LiveActivityPlacementOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s18BridgeLiveActivity21LiveActivityPlacementOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x249378BB4);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

unsigned char *sub_249378BDC(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LiveActivitySetupState.CodingKeys()
{
  return &type metadata for LiveActivitySetupState.CodingKeys;
}

uint64_t _s18BridgeLiveActivity20LiveActivityMetadataO24WristSelectionCodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s18BridgeLiveActivity20LiveActivityMetadataO24WristSelectionCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x249378CE0);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivitySetupAttributes.CodingKeys()
{
  return &type metadata for LiveActivitySetupAttributes.CodingKeys;
}

unint64_t sub_249378D1C()
{
  unint64_t result = qword_2696A3400[0];
  if (!qword_2696A3400[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A3400);
  }
  return result;
}

unint64_t sub_249378D74()
{
  unint64_t result = qword_2696A3610[0];
  if (!qword_2696A3610[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A3610);
  }
  return result;
}

unint64_t sub_249378DCC()
{
  unint64_t result = qword_2696A3820[0];
  if (!qword_2696A3820[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A3820);
  }
  return result;
}

unint64_t sub_249378E24()
{
  unint64_t result = qword_2696A3A30[0];
  if (!qword_2696A3A30[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A3A30);
  }
  return result;
}

unint64_t sub_249378E7C()
{
  unint64_t result = qword_2696A3C40[0];
  if (!qword_2696A3C40[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A3C40);
  }
  return result;
}

unint64_t sub_249378ED4()
{
  unint64_t result = qword_2696A3E50[0];
  if (!qword_2696A3E50[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A3E50);
  }
  return result;
}

unint64_t sub_249378F2C()
{
  unint64_t result = qword_2696A4060[0];
  if (!qword_2696A4060[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A4060);
  }
  return result;
}

unint64_t sub_249378F84()
{
  unint64_t result = qword_2696A4270[0];
  if (!qword_2696A4270[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A4270);
  }
  return result;
}

unint64_t sub_249378FDC()
{
  unint64_t result = qword_2696A4480[0];
  if (!qword_2696A4480[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A4480);
  }
  return result;
}

unint64_t sub_249379034()
{
  unint64_t result = qword_2696A4690[0];
  if (!qword_2696A4690[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A4690);
  }
  return result;
}

unint64_t sub_24937908C()
{
  unint64_t result = qword_2696A48A0[0];
  if (!qword_2696A48A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A48A0);
  }
  return result;
}

unint64_t sub_2493790E4()
{
  unint64_t result = qword_2696A4AB0[0];
  if (!qword_2696A4AB0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A4AB0);
  }
  return result;
}

unint64_t sub_24937913C()
{
  unint64_t result = qword_2696A4DC0[0];
  if (!qword_2696A4DC0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A4DC0);
  }
  return result;
}

unint64_t sub_249379194()
{
  unint64_t result = qword_2696A4FD0[0];
  if (!qword_2696A4FD0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A4FD0);
  }
  return result;
}

unint64_t sub_2493791EC()
{
  unint64_t result = qword_2696A51E0[0];
  if (!qword_2696A51E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A51E0);
  }
  return result;
}

unint64_t sub_249379244()
{
  unint64_t result = qword_2696A56F0;
  if (!qword_2696A56F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A56F0);
  }
  return result;
}

unint64_t sub_24937929C()
{
  unint64_t result = qword_2696A5800;
  if (!qword_2696A5800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5800);
  }
  return result;
}

unint64_t sub_2493792F4()
{
  unint64_t result = qword_2696A5808[0];
  if (!qword_2696A5808[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5808);
  }
  return result;
}

unint64_t sub_24937934C()
{
  unint64_t result = qword_2696A5890;
  if (!qword_2696A5890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5890);
  }
  return result;
}

unint64_t sub_2493793A4()
{
  unint64_t result = qword_2696A5898[0];
  if (!qword_2696A5898[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5898);
  }
  return result;
}

unint64_t sub_2493793FC()
{
  unint64_t result = qword_2696A5920;
  if (!qword_2696A5920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5920);
  }
  return result;
}

unint64_t sub_249379454()
{
  unint64_t result = qword_2696A5928[0];
  if (!qword_2696A5928[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5928);
  }
  return result;
}

unint64_t sub_2493794AC()
{
  unint64_t result = qword_2696A59B0;
  if (!qword_2696A59B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A59B0);
  }
  return result;
}

unint64_t sub_249379504()
{
  unint64_t result = qword_2696A59B8[0];
  if (!qword_2696A59B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A59B8);
  }
  return result;
}

unint64_t sub_24937955C()
{
  unint64_t result = qword_2696A5A40;
  if (!qword_2696A5A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5A40);
  }
  return result;
}

unint64_t sub_2493795B4()
{
  unint64_t result = qword_2696A5A48[0];
  if (!qword_2696A5A48[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5A48);
  }
  return result;
}

unint64_t sub_24937960C()
{
  unint64_t result = qword_2696A5AD0;
  if (!qword_2696A5AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5AD0);
  }
  return result;
}

unint64_t sub_249379664()
{
  unint64_t result = qword_2696A5AD8[0];
  if (!qword_2696A5AD8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5AD8);
  }
  return result;
}

unint64_t sub_2493796BC()
{
  unint64_t result = qword_2696A5B60;
  if (!qword_2696A5B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5B60);
  }
  return result;
}

unint64_t sub_249379714()
{
  unint64_t result = qword_2696A5B68[0];
  if (!qword_2696A5B68[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5B68);
  }
  return result;
}

unint64_t sub_24937976C()
{
  unint64_t result = qword_2696A5BF0;
  if (!qword_2696A5BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5BF0);
  }
  return result;
}

unint64_t sub_2493797C4()
{
  unint64_t result = qword_2696A5BF8[0];
  if (!qword_2696A5BF8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5BF8);
  }
  return result;
}

unint64_t sub_24937981C()
{
  unint64_t result = qword_2696A5C80;
  if (!qword_2696A5C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5C80);
  }
  return result;
}

unint64_t sub_249379874()
{
  unint64_t result = qword_2696A5C88[0];
  if (!qword_2696A5C88[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5C88);
  }
  return result;
}

unint64_t sub_2493798CC()
{
  unint64_t result = qword_2696A5D10;
  if (!qword_2696A5D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5D10);
  }
  return result;
}

unint64_t sub_249379924()
{
  unint64_t result = qword_2696A5D18[0];
  if (!qword_2696A5D18[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5D18);
  }
  return result;
}

unint64_t sub_24937997C()
{
  unint64_t result = qword_2696A5DA0;
  if (!qword_2696A5DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5DA0);
  }
  return result;
}

unint64_t sub_2493799D4()
{
  unint64_t result = qword_2696A5DA8[0];
  if (!qword_2696A5DA8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5DA8);
  }
  return result;
}

unint64_t sub_249379A2C()
{
  unint64_t result = qword_2696A5E30;
  if (!qword_2696A5E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5E30);
  }
  return result;
}

unint64_t sub_249379A84()
{
  unint64_t result = qword_2696A5E38[0];
  if (!qword_2696A5E38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5E38);
  }
  return result;
}

unint64_t sub_249379ADC()
{
  unint64_t result = qword_2696A5EC0;
  if (!qword_2696A5EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5EC0);
  }
  return result;
}

unint64_t sub_249379B34()
{
  unint64_t result = qword_2696A5EC8[0];
  if (!qword_2696A5EC8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5EC8);
  }
  return result;
}

unint64_t sub_249379B8C()
{
  unint64_t result = qword_2696A5F50;
  if (!qword_2696A5F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5F50);
  }
  return result;
}

unint64_t sub_249379BE4()
{
  unint64_t result = qword_2696A5F58[0];
  if (!qword_2696A5F58[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5F58);
  }
  return result;
}

unint64_t sub_249379C3C()
{
  unint64_t result = qword_2696A5FE0;
  if (!qword_2696A5FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A5FE0);
  }
  return result;
}

unint64_t sub_249379C94()
{
  unint64_t result = qword_2696A5FE8[0];
  if (!qword_2696A5FE8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A5FE8);
  }
  return result;
}

unint64_t sub_249379CEC()
{
  unint64_t result = qword_2696A6070;
  if (!qword_2696A6070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A6070);
  }
  return result;
}

unint64_t sub_249379D44()
{
  unint64_t result = qword_2696A6078;
  if (!qword_2696A6078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A6078);
  }
  return result;
}

unint64_t sub_249379D9C()
{
  unint64_t result = qword_2696A6100;
  if (!qword_2696A6100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A6100);
  }
  return result;
}

unint64_t sub_249379DF4()
{
  unint64_t result = qword_2696A6108[0];
  if (!qword_2696A6108[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A6108);
  }
  return result;
}

unint64_t sub_249379E4C()
{
  unint64_t result = qword_2696A6190;
  if (!qword_2696A6190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A6190);
  }
  return result;
}

unint64_t sub_249379EA4()
{
  unint64_t result = qword_2696A6198[0];
  if (!qword_2696A6198[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A6198);
  }
  return result;
}

unint64_t sub_249379EFC()
{
  unint64_t result = qword_2696A6220;
  if (!qword_2696A6220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A6220);
  }
  return result;
}

unint64_t sub_249379F54()
{
  unint64_t result = qword_2696A6228[0];
  if (!qword_2696A6228[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A6228);
  }
  return result;
}

unint64_t sub_249379FAC()
{
  unint64_t result = qword_2696A62B0;
  if (!qword_2696A62B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A62B0);
  }
  return result;
}

unint64_t sub_24937A004()
{
  unint64_t result = qword_2696A62B8[0];
  if (!qword_2696A62B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A62B8);
  }
  return result;
}

unint64_t sub_24937A058()
{
  unint64_t result = qword_2696A1AA8;
  if (!qword_2696A1AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1AA8);
  }
  return result;
}

uint64_t sub_24937A0AC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24937A0F4()
{
  unint64_t result = qword_2696A1AE8;
  if (!qword_2696A1AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1AE8);
  }
  return result;
}

unint64_t sub_24937A148()
{
  unint64_t result = qword_2696A1B18;
  if (!qword_2696A1B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1B18);
  }
  return result;
}

unint64_t sub_24937A19C()
{
  unint64_t result = qword_2696A1B20;
  if (!qword_2696A1B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1B20);
  }
  return result;
}

unint64_t sub_24937A1F0()
{
  unint64_t result = qword_2696A1B38;
  if (!qword_2696A1B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1B38);
  }
  return result;
}

unint64_t sub_24937A244()
{
  unint64_t result = qword_2696A1B48;
  if (!qword_2696A1B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1B48);
  }
  return result;
}

unint64_t sub_24937A298()
{
  unint64_t result = qword_2696A1B58;
  if (!qword_2696A1B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1B58);
  }
  return result;
}

unint64_t sub_24937A2EC()
{
  unint64_t result = qword_2696A1B88;
  if (!qword_2696A1B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1B88);
  }
  return result;
}

unint64_t sub_24937A340()
{
  unint64_t result = qword_2696A1B90;
  if (!qword_2696A1B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1B90);
  }
  return result;
}

unint64_t sub_24937A394()
{
  unint64_t result = qword_2696A1B98;
  if (!qword_2696A1B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A1B98);
  }
  return result;
}

uint64_t sub_24937A3E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 80);
  uint64_t v15 = *(void *)(a1 + 112);
  uint64_t v16 = *(void *)(a1 + 104);
  uint64_t v13 = *(void *)(a1 + 128);
  uint64_t v14 = *(void *)(a1 + 120);
  uint64_t v25 = *(void *)(a1 + 152);
  uint64_t v26 = *(void *)(a1 + 144);
  uint64_t v23 = *(void *)(a1 + 168);
  uint64_t v24 = *(void *)(a1 + 160);
  uint64_t v21 = *(void *)(a1 + 184);
  uint64_t v22 = *(void *)(a1 + 176);
  uint64_t v19 = *(void *)(a1 + 200);
  uint64_t v20 = *(void *)(a1 + 192);
  uint64_t v18 = *(void *)(a1 + 208);
  unsigned __int8 v17 = *(unsigned char *)(a1 + 216);
  uint64_t v29 = *(void *)(a1 + 232);
  uint64_t v30 = *(void *)(a1 + 224);
  uint64_t v27 = *(void *)(a1 + 248);
  uint64_t v28 = *(void *)(a1 + 240);
  uint64_t v35 = *(void *)(a1 + 272);
  uint64_t v36 = *(void *)(a1 + 264);
  uint64_t v34 = *(void *)(a1 + 280);
  uint64_t v33 = *(void *)(a1 + 288);
  uint64_t v44 = *(void *)(a1 + 312);
  uint64_t v45 = *(void *)(a1 + 304);
  uint64_t v42 = *(void *)(a1 + 328);
  uint64_t v43 = *(void *)(a1 + 320);
  uint64_t v40 = *(void *)(a1 + 344);
  uint64_t v41 = *(void *)(a1 + 336);
  uint64_t v38 = *(void *)(a1 + 360);
  uint64_t v39 = *(void *)(a1 + 352);
  uint64_t v32 = *(void *)(a1 + 368);
  unsigned __int8 v31 = *(unsigned char *)(a1 + 376);
  uint64_t v49 = *(void *)(a1 + 392);
  uint64_t v50 = *(void *)(a1 + 384);
  uint64_t v47 = *(void *)(a1 + 408);
  uint64_t v48 = *(void *)(a1 + 400);
  uint64_t v46 = *(void *)(a1 + 416);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 96);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 136);
  unsigned __int8 v7 = *(unsigned char *)(a1 + 256);
  unsigned __int8 v12 = *(unsigned char *)(a1 + 296);
  unsigned __int8 v37 = *(unsigned char *)(a1 + 424);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24936C9B4(v2, v3);
  sub_24936CAA0(v11, v10, v9, v4, v5);
  sub_24936CB00(v16, v15, v14, v13, v6);
  sub_24936CD58(v26, v25, v24, v23, v22, v21, v20, v19, v18, v17, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  sub_24936CAA0(v30, v29, v28, v27, v7);
  sub_24936CB00(v36, v35, v34, v33, v12);
  sub_24936CD58(v45, v44, v43, v42, v41, v40, v39, v38, v32, v31, (void (*)(void))sub_24936CAA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CB00);
  sub_24936DFB0(v50, v49, v48, v47, v46, v37);
  return a1;
}

uint64_t sub_24937A658(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 80);
  uint64_t v15 = *(void *)(a1 + 112);
  uint64_t v16 = *(void *)(a1 + 104);
  uint64_t v13 = *(void *)(a1 + 128);
  uint64_t v14 = *(void *)(a1 + 120);
  uint64_t v25 = *(void *)(a1 + 152);
  uint64_t v26 = *(void *)(a1 + 144);
  uint64_t v23 = *(void *)(a1 + 168);
  uint64_t v24 = *(void *)(a1 + 160);
  uint64_t v21 = *(void *)(a1 + 184);
  uint64_t v22 = *(void *)(a1 + 176);
  uint64_t v19 = *(void *)(a1 + 200);
  uint64_t v20 = *(void *)(a1 + 192);
  uint64_t v18 = *(void *)(a1 + 208);
  unsigned __int8 v17 = *(unsigned char *)(a1 + 216);
  uint64_t v29 = *(void *)(a1 + 232);
  uint64_t v30 = *(void *)(a1 + 224);
  uint64_t v27 = *(void *)(a1 + 248);
  uint64_t v28 = *(void *)(a1 + 240);
  uint64_t v35 = *(void *)(a1 + 272);
  uint64_t v36 = *(void *)(a1 + 264);
  uint64_t v34 = *(void *)(a1 + 280);
  uint64_t v33 = *(void *)(a1 + 288);
  uint64_t v44 = *(void *)(a1 + 312);
  uint64_t v45 = *(void *)(a1 + 304);
  uint64_t v42 = *(void *)(a1 + 328);
  uint64_t v43 = *(void *)(a1 + 320);
  uint64_t v40 = *(void *)(a1 + 344);
  uint64_t v41 = *(void *)(a1 + 336);
  uint64_t v38 = *(void *)(a1 + 360);
  uint64_t v39 = *(void *)(a1 + 352);
  uint64_t v32 = *(void *)(a1 + 368);
  unsigned __int8 v31 = *(unsigned char *)(a1 + 376);
  uint64_t v49 = *(void *)(a1 + 392);
  uint64_t v50 = *(void *)(a1 + 384);
  uint64_t v47 = *(void *)(a1 + 408);
  uint64_t v48 = *(void *)(a1 + 400);
  uint64_t v46 = *(void *)(a1 + 416);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 96);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 136);
  unsigned __int8 v7 = *(unsigned char *)(a1 + 256);
  unsigned __int8 v12 = *(unsigned char *)(a1 + 296);
  unsigned __int8 v37 = *(unsigned char *)(a1 + 424);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24936CA5C(v2, v3);
  sub_24936CCE4(v11, v10, v9, v4, v5);
  sub_24936CD44(v16, v15, v14, v13, v6);
  sub_24936CD58(v26, v25, v24, v23, v22, v21, v20, v19, v18, v17, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  sub_24936CCE4(v30, v29, v28, v27, v7);
  sub_24936CD44(v36, v35, v34, v33, v12);
  sub_24936CD58(v45, v44, v43, v42, v41, v40, v39, v38, v32, v31, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  sub_24936E03C(v50, v49, v48, v47, v46, v37);
  return a1;
}

uint64_t sub_24937A8C4(uint64_t a1)
{
  uint64_t v11 = *(void *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 80);
  uint64_t v2 = *(void *)(a1 + 104);
  uint64_t v10 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 112);
  uint64_t v4 = *(void *)(a1 + 120);
  uint64_t v5 = *(void *)(a1 + 128);
  uint64_t v6 = *(void *)(a1 + 136);
  uint64_t v7 = *(void *)(a1 + 144);
  unsigned __int8 v8 = *(unsigned char *)(a1 + 152);
  sub_24936CD58(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned char *)(a1 + 72), (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  sub_24936CD58(v12, v11, v10, v2, v3, v4, v5, v6, v7, v8, (void (*)(void))sub_24936CCE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24936CD44);
  return a1;
}

uint64_t sub_24937A9E0()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t sub_24937A9F0()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_24937AA00()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_24937AA10()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24937AA20()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24937AA30()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24937AA40()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_24937AA50()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24937AA60()
{
  return MEMORY[0x270EE06E8]();
}

uint64_t sub_24937AA70()
{
  return MEMORY[0x270EE0700]();
}

uint64_t sub_24937AA80()
{
  return MEMORY[0x270EE0708]();
}

uint64_t sub_24937AA90()
{
  return MEMORY[0x270EE0740]();
}

uint64_t sub_24937AAA0()
{
  return MEMORY[0x270EE0798]();
}

uint64_t sub_24937AAB0()
{
  return MEMORY[0x270EE07A0]();
}

uint64_t sub_24937AAC0()
{
  return MEMORY[0x270EE07B0]();
}

uint64_t sub_24937AAD0()
{
  return MEMORY[0x270EE07C8]();
}

uint64_t sub_24937AAE0()
{
  return MEMORY[0x270EE0828]();
}

uint64_t sub_24937AAF0()
{
  return MEMORY[0x270EE0840]();
}

uint64_t sub_24937AB00()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24937AB10()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24937AB20()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24937AB30()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24937AB40()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_24937AB50()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_24937AB60()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_24937AB70()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24937AB80()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24937AB90()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_24937ABA0()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_24937ABB0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24937ABC0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24937ABD0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24937ABE0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24937ABF0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24937AC00()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24937AC10()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24937AC20()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24937AC30()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24937AC40()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24937AC50()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24937AC60()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24937AC70()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24937AC80()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24937AC90()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24937ACA0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24937ACB0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24937ACC0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24937ACD0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24937ACE0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24937ACF0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24937AD00()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24937AD10()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24937AD20()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24937AD30()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24937AD40()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24937AD50()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24937AD60()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24937AD70()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24937AD80()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24937AD90()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24937ADA0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24937ADB0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24937ADC0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24937ADD0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24937ADE0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24937ADF0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24937AE00()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24937AE10()
{
  return MEMORY[0x270F9FD98]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
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