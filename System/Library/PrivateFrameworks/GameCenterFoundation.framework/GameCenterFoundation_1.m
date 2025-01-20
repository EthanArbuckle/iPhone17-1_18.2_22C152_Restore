uint64_t sub_1C2E835A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void **v5;
  void *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  void *v17;
  uint64_t *v18;
  uint64_t result;
  uint64_t vars8;

  v5 = (void **)v4;
  v10 = (void *)*v4;
  v11 = sub_1C2E19EE8(a3, a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  v13 = v11;
  v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA33A848);
  if ((sub_1C2E929F8() & 1) == 0) {
    goto LABEL_5;
  }
  v15 = sub_1C2E19EE8(a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    result = sub_1C2E92C38();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  v17 = *v5;
  if (v14)
  {
    v18 = (uint64_t *)(v17[7] + 16 * v13);
    result = swift_bridgeObjectRelease();
    *v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_1C2E83920(v13, a3, a4, a1, a2, v17);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1C2E836E0(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1C2E91BD8();
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

_OWORD *sub_1C2E83798(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1C2E1B6C4(a4, (_OWORD *)(a5[7] + 32 * a1));
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

unint64_t sub_1C2E83804(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (void *)(a5[6] + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_1C2E8384C(unint64_t result, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  a4[(result >> 6) + 8] |= 1 << result;
  v5 = (void *)(a4[6] + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(double *)(a4[7] + 8 * result) = a5;
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

uint64_t type metadata accessor for TransportMonitorPlayerStat()
{
  return self;
}

uint64_t method lookup function for TransportMonitorPlayerStat(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TransportMonitorPlayerStat);
}

uint64_t dispatch thunk of TransportMonitorPlayerStat.__allocating_init(monitoring:latency:averageLatency:sentCount:receivedCount:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t type metadata accessor for TransportMonitorStat()
{
  return self;
}

uint64_t method lookup function for TransportMonitorStat(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TransportMonitorStat);
}

unint64_t sub_1C2E83920(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  void *v6 = a2;
  v6[1] = a3;
  BOOL v7 = (void *)(a6[7] + 16 * result);
  *BOOL v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_18()
{
  *uint64_t v0 = 0x8000000000000000;
  return v1;
}

uint64_t OUTLINED_FUNCTION_1_17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t result = *v10;
  *uint64_t v10 = a10;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_12()
{
  return v0;
}

void OUTLINED_FUNCTION_3_10()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_6_14()
{
  return sub_1C2E92618();
}

uint64_t OUTLINED_FUNCTION_7_12()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_1C2E83A20(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBA1758);
  uint64_t v6 = OUTLINED_FUNCTION_8_3(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_5_3();
  uint64_t v7 = sub_1C2E92568();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  BOOL v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_1EA33A898;
  v9[5] = v8;
  sub_1C2E868F4(v2, (uint64_t)&unk_1EA33A8A8, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_1C2E83B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_1C2E1B6C4((_OWORD *)a1, v6);
    sub_1C2E82F68();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C2E55130(a1, &qword_1EBBA1798);
    sub_1C2E86F98(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_1C2E55130((uint64_t)v6, &qword_1EBBA1798);
  }
}

id LimitedPresentationManager.__allocating_init(defaultsKey:)(uint64_t a1, uint64_t a2)
{
  return LimitedPresentationManager.init(defaultsKey:)(a1, a2);
}

id LimitedPresentationManager.init(defaultsKey:)(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBA1730);
  uint64_t v8 = OUTLINED_FUNCTION_8_3(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_5_3();
  swift_defaultActor_initialize();
  uint64_t v9 = (uint64_t)v2 + OBJC_IVAR___GKLimitedPresentationManager_lastAppearanceDate;
  uint64_t v10 = sub_1C2E91AF8();
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  v2[14] = a1;
  v2[15] = a2;
  if (!a2)
  {
    swift_retain();
LABEL_8:
    uint64_t v15 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    char v17 = 1;
    goto LABEL_9;
  }
  uint64_t v11 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  id v12 = objc_msgSend(v11, sel_standardUserDefaults);
  uint64_t v13 = (void *)sub_1C2E922C8();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_dictionaryForKey_, v13);

  if (!v14) {
    goto LABEL_8;
  }
  uint64_t v15 = sub_1C2E92228();

  if (!v15) {
    goto LABEL_8;
  }
  sub_1C2E14CDC(0x746E756F63, 0xE500000000000000, v15, &v24);
  if (*((void *)&v25 + 1))
  {
    if (OUTLINED_FUNCTION_11_7()) {
      uint64_t v16 = v22;
    }
    else {
      uint64_t v16 = 0;
    }
    v2[16] = v16;
    goto LABEL_14;
  }
  char v17 = 0;
LABEL_9:
  sub_1C2E55130((uint64_t)&v24, &qword_1EBBA1798);
  v2[16] = 0;
  if (v17)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    char v18 = 1;
    goto LABEL_17;
  }
LABEL_14:
  sub_1C2E14CDC(1702125924, 0xE400000000000000, v15, &v24);
  if (*((void *)&v25 + 1))
  {
    int v19 = swift_dynamicCast();
    __swift_storeEnumTagSinglePayload(v3, v19 ^ 1u, 1, v10);
    char v18 = 0;
    goto LABEL_18;
  }
  char v18 = 0;
LABEL_17:
  sub_1C2E55130((uint64_t)&v24, &qword_1EBBA1798);
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v10);
LABEL_18:
  swift_beginAccess();
  sub_1C2E54F68(v3, v9);
  swift_endAccess();
  if (v18)
  {
    long long v24 = 0u;
    long long v25 = 0u;
LABEL_23:
    sub_1C2E55130((uint64_t)&v24, &qword_1EBBA1798);
    goto LABEL_24;
  }
  sub_1C2E14CDC(0x6465646565637865, 0xED000074696D694CLL, v15, &v24);
  if (!*((void *)&v25 + 1)) {
    goto LABEL_23;
  }
  if (!OUTLINED_FUNCTION_11_7())
  {
LABEL_24:
    char v20 = 0;
    goto LABEL_25;
  }
  char v20 = v22;
LABEL_25:
  *((unsigned char *)v2 + OBJC_IVAR___GKLimitedPresentationManager_exceededFirstLimit) = v20;
  swift_bridgeObjectRelease();
  swift_release();
  v23.receiver = v2;
  v23.super_class = ObjectType;
  return objc_msgSendSuper2(&v23, sel_init);
}

uint64_t LimitedPresentationManager.presentationDisabled(config:context:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_6_15((uint64_t)sub_1C2E83F94, v2);
}

uint64_t sub_1C2E83F94()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (void *)v0[2];
  sub_1C2E84014();
  char v3 = sub_1C2E842EC(v2, v1);
  sub_1C2E8505C();
  v4 = (uint64_t (*)(void))v0[1];
  return v4(v3 & 1);
}

void sub_1C2E84014()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBA1730);
  MEMORY[0x1F4188790](v1 - 8);
  char v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v0 + 120))
  {
    id v4 = objc_msgSend(self, sel_standardUserDefaults);
    uint64_t v5 = (void *)sub_1C2E922C8();
    id v6 = objc_msgSend(v4, sel_dictionaryForKey_, v5);

    if (v6)
    {
      uint64_t v7 = sub_1C2E92228();
    }
    else
    {
      uint64_t v7 = sub_1C2E92248();
    }
    sub_1C2E14CDC(0x746E756F63, 0xE500000000000000, v7, &v17);
    if (v18)
    {
      if (swift_dynamicCast())
      {
        uint64_t v8 = v16;
        goto LABEL_10;
      }
    }
    else
    {
      sub_1C2E55130((uint64_t)&v17, &qword_1EBBA1798);
    }
    uint64_t v8 = 0;
LABEL_10:
    *(void *)(v0 + 128) = v8;
    sub_1C2E14CDC(1702125924, 0xE400000000000000, v7, &v17);
    if (v18)
    {
      uint64_t v9 = sub_1C2E91AF8();
      uint64_t v10 = swift_dynamicCast() ^ 1;
      uint64_t v11 = (uint64_t)v3;
      uint64_t v12 = v9;
    }
    else
    {
      sub_1C2E55130((uint64_t)&v17, &qword_1EBBA1798);
      uint64_t v12 = sub_1C2E91AF8();
      uint64_t v11 = (uint64_t)v3;
      uint64_t v10 = 1;
    }
    __swift_storeEnumTagSinglePayload(v11, v10, 1, v12);
    uint64_t v13 = v0 + OBJC_IVAR___GKLimitedPresentationManager_lastAppearanceDate;
    swift_beginAccess();
    sub_1C2E54F68((uint64_t)v3, v13);
    swift_endAccess();
    sub_1C2E14CDC(0x6465646565637865, 0xED000074696D694CLL, v7, &v17);
    swift_bridgeObjectRelease();
    if (v18)
    {
      if (swift_dynamicCast())
      {
        char v14 = v16;
LABEL_18:
        *(unsigned char *)(v0 + OBJC_IVAR___GKLimitedPresentationManager_exceededFirstLimit) = v14;
        return;
      }
    }
    else
    {
      sub_1C2E55130((uint64_t)&v17, &qword_1EBBA1798);
    }
    char v14 = 0;
    goto LABEL_18;
  }
}

uint64_t sub_1C2E842EC(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v128 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBA1730);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v126 = (uint64_t)&v115 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v115 - v8;
  uint64_t v10 = sub_1C2E91AF8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v115 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v115 - v15;
  MEMORY[0x1F4188790](v17);
  int v19 = (char *)&v115 - v18;
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v115 - v21;
  *(void *)&double v24 = MEMORY[0x1F4188790](v23).n128_u64[0];
  v26 = (char *)&v115 - v25;
  if (!objc_msgSend(a1, sel_enabled, v24))
  {
    if (qword_1EBBA1960 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_1C2E92088();
    __swift_project_value_buffer(v35, (uint64_t)qword_1EBBA1948);
    id v36 = v128;
    v37 = sub_1C2E92078();
    os_log_type_t v38 = sub_1C2E92688();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      v130[0] = v40;
      *(_DWORD *)v39 = 136315138;
      uint64_t v41 = sub_1C2E8605C();
      v131[0] = sub_1C2E660DC(v41, v42, v130);
      sub_1C2E92788();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C2D22000, v37, v38, "GKLimitedPresentationManager %s: Disabled by the bag", v39, 0xCu);
      uint64_t v43 = 1;
      swift_arrayDestroy();
      MEMORY[0x1C876CEE0](v40, -1, -1);
      MEMORY[0x1C876CEE0](v39, -1, -1);

      return v43;
    }

    return 1;
  }
  v125 = v16;
  v27 = a1;
  uint64_t v28 = v10;
  uint64_t v29 = v3 + OBJC_IVAR___GKLimitedPresentationManager_lastAppearanceDate;
  swift_beginAccess();
  uint64_t v124 = v29;
  uint64_t v30 = v29;
  uint64_t v31 = v28;
  sub_1C2E49268(v30, (uint64_t)v9);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v28) == 1)
  {
    sub_1C2E55130((uint64_t)v9, &qword_1EBBA1730);
    v32 = v27;
    uint64_t v33 = v11;
    v34 = v125;
    goto LABEL_23;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v26, v9, v28);
  v32 = v27;
  BOOL v44 = sub_1C2E86004(v27);
  v122 = v19;
  v123 = v13;
  if (v44)
  {
    objc_msgSend(v27, sel_resetPeriod);
    BOOL v46 = v45 >= 0.0;
  }
  else
  {
    BOOL v46 = 0;
  }
  v47 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v48 = v26;
  v47(v22, v26, v31);
  if (!v46)
  {
    v52 = *(void (**)(char *, uint64_t))(v11 + 8);
    v52(v22, v31);
    uint64_t v33 = v11;
    goto LABEL_16;
  }
  double v49 = sub_1C2E85F28();
  objc_msgSend(v32, sel_resetPeriod);
  double v51 = v50;
  uint64_t v121 = v11;
  v54 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v53 = v11 + 8;
  v52 = v54;
  v54(v22, v31);
  if (v51 > v49)
  {
    uint64_t v33 = v121;
LABEL_16:
    v52(v48, v31);
    v34 = v125;
    uint64_t v13 = v123;
    goto LABEL_23;
  }
  uint64_t v119 = v53;
  v120 = v52;
  if (qword_1EBBA1960 != -1) {
    swift_once();
  }
  uint64_t v55 = sub_1C2E92088();
  __swift_project_value_buffer(v55, (uint64_t)qword_1EBBA1948);
  v56 = v122;
  v47(v122, v48, v31);
  id v57 = v128;
  id v58 = v32;
  id v59 = v57;
  id v60 = v58;
  v61 = sub_1C2E92078();
  os_log_type_t v62 = sub_1C2E92688();
  int v63 = v62;
  if (os_log_type_enabled(v61, v62))
  {
    uint64_t v64 = swift_slowAlloc();
    v118 = v48;
    uint64_t v65 = v64;
    uint64_t v117 = swift_slowAlloc();
    v131[0] = v117;
    *(_DWORD *)uint64_t v65 = 136315650;
    uint64_t v115 = v65 + 4;
    int v116 = v63;
    uint64_t v66 = sub_1C2E8605C();
    uint64_t v129 = sub_1C2E660DC(v66, v67, v131);
    sub_1C2E92788();

    swift_bridgeObjectRelease();
    *(_WORD *)(v65 + 12) = 2080;
    sub_1C2E871DC();
    uint64_t v68 = sub_1C2E92BB8();
    uint64_t v129 = sub_1C2E660DC(v68, v69, v131);
    sub_1C2E92788();
    swift_bridgeObjectRelease();
    v120(v56, v31);
    *(_WORD *)(v65 + 22) = 2048;
    objc_msgSend(v60, sel_resetPeriod);
    uint64_t v129 = v70;
    sub_1C2E92788();

    _os_log_impl(&dword_1C2D22000, v61, (os_log_type_t)v116, "GKLimitedPresentationManager %s: reset period has passed (lastAppearanceDate = %s, resetPeriod = %f). resetting count to 0", (uint8_t *)v65, 0x20u);
    uint64_t v71 = v117;
    swift_arrayDestroy();
    MEMORY[0x1C876CEE0](v71, -1, -1);
    MEMORY[0x1C876CEE0](v65, -1, -1);

    v120(v118, v31);
  }
  else
  {

    v72 = v56;
    v73 = v120;
    v120(v72, v31);

    v73(v48, v31);
  }
  uint64_t v33 = v121;
  v34 = v125;
  uint64_t v13 = v123;
  *(void *)(v3 + 128) = 0;
  *(unsigned char *)(v3 + OBJC_IVAR___GKLimitedPresentationManager_exceededFirstLimit) = 1;
LABEL_23:
  if (!sub_1C2E86004(v32))
  {
    uint64_t v90 = v126;
    sub_1C2E49268(v124, v126);
    if (__swift_getEnumTagSinglePayload(v90, 1, v31) == 1)
    {
      sub_1C2E55130(v90, &qword_1EBBA1730);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v33 + 32))(v34, v90, v31);
      double v91 = sub_1C2E85F28();
      objc_msgSend(v32, sel_minTimeBetweenAppearances);
      if (v91 < v92 || (objc_msgSend(v32, sel_minTimeBetweenAppearances), v93 < 0.0))
      {
        if (qword_1EBBA1960 != -1) {
          swift_once();
        }
        uint64_t v94 = sub_1C2E92088();
        __swift_project_value_buffer(v94, (uint64_t)qword_1EBBA1948);
        (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v13, v34, v31);
        id v95 = v128;
        v96 = v13;
        v97 = v34;
        id v98 = v32;
        id v99 = v95;
        id v100 = v98;
        v101 = sub_1C2E92078();
        os_log_type_t v102 = sub_1C2E92688();
        int v103 = v102;
        if (os_log_type_enabled(v101, v102))
        {
          uint64_t v104 = swift_slowAlloc();
          id v128 = (id)swift_slowAlloc();
          v131[0] = (uint64_t)v128;
          *(_DWORD *)uint64_t v104 = 136315650;
          v123 = v96;
          LODWORD(ObjectType) = v103;
          uint64_t v105 = sub_1C2E8605C();
          uint64_t v129 = sub_1C2E660DC(v105, v106, v131);
          sub_1C2E92788();

          swift_bridgeObjectRelease();
          *(_WORD *)(v104 + 12) = 2080;
          sub_1C2E871DC();
          v107 = v123;
          uint64_t v108 = sub_1C2E92BB8();
          uint64_t v129 = sub_1C2E660DC(v108, v109, v131);
          sub_1C2E92788();
          swift_bridgeObjectRelease();
          v110 = *(void (**)(char *, uint64_t))(v33 + 8);
          v110(v107, v31);
          *(_WORD *)(v104 + 22) = 2048;
          objc_msgSend(v100, (SEL)&selRef_openDashboardAsRemoteAlertForGame_hostPID_deeplink_launchContext_ + 2);
          uint64_t v129 = v111;
          sub_1C2E92788();

          _os_log_impl(&dword_1C2D22000, v101, (os_log_type_t)ObjectType, "GKLimitedPresentationManager %s: Too soon since last presentation (lastAppearanceDate = %s, minTimeBetween = %f). Disabling presentation.", (uint8_t *)v104, 0x20u);
          id v112 = v128;
          swift_arrayDestroy();
          MEMORY[0x1C876CEE0](v112, -1, -1);
          MEMORY[0x1C876CEE0](v104, -1, -1);

          v110(v125, v31);
        }
        else
        {

          v113 = *(void (**)(char *, uint64_t))(v33 + 8);
          v113(v96, v31);

          v113(v97, v31);
        }
        return 1;
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v31);
    }
    return 0;
  }
  if (*(unsigned char *)(v3 + OBJC_IVAR___GKLimitedPresentationManager_exceededFirstLimit)) {
    v75 = &selRef_limit;
  }
  else {
    v75 = &selRef_initialLimit;
  }
  id v74 = *(id *)(v3 + 128);
  if (v74 != [v32 *v75]) {
    return 1;
  }
  if (qword_1EBBA1960 != -1) {
    swift_once();
  }
  uint64_t v76 = sub_1C2E92088();
  __swift_project_value_buffer(v76, (uint64_t)qword_1EBBA1948);
  swift_retain_n();
  id v77 = v128;
  id v78 = v32;
  id v79 = v77;
  id v80 = v78;
  v81 = sub_1C2E92078();
  os_log_type_t v82 = sub_1C2E92688();
  if (!os_log_type_enabled(v81, v82))
  {

    swift_release_n();
    return 1;
  }
  uint64_t v83 = swift_slowAlloc();
  uint64_t v84 = swift_slowAlloc();
  v131[0] = v84;
  *(_DWORD *)uint64_t v83 = 136315650;
  uint64_t v85 = sub_1C2E8605C();
  uint64_t v129 = sub_1C2E660DC(v85, v86, v131);
  sub_1C2E92788();

  swift_bridgeObjectRelease();
  *(_WORD *)(v83 + 12) = 2048;
  uint64_t v87 = *(void *)(v3 + 128);
  swift_release();
  uint64_t v129 = v87;
  sub_1C2E92788();
  swift_release();
  *(_WORD *)(v83 + 22) = 2048;
  v88 = &selRef_limit;
  if (!*(unsigned char *)(v3 + OBJC_IVAR___GKLimitedPresentationManager_exceededFirstLimit)) {
    v88 = &selRef_initialLimit;
  }
  id v89 = [v80 *v88];

  swift_release();
  uint64_t v129 = (uint64_t)v89;
  sub_1C2E92788();

  swift_release();
  _os_log_impl(&dword_1C2D22000, v81, v82, "GKLimitedPresentationManager %s: limit exceeded (count = %ld, effective limit = %ld). Disabling presentation until reset period passes.", (uint8_t *)v83, 0x20u);
  uint64_t v43 = 1;
  swift_arrayDestroy();
  MEMORY[0x1C876CEE0](v84, -1, -1);
  MEMORY[0x1C876CEE0](v83, -1, -1);

  return v43;
}

void sub_1C2E8505C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBA1730);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1C2E91AF8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v0 + 120))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBA1790);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1C2EBD060;
    *(void *)(inited + 32) = 0x746E756F63;
    *(void *)(inited + 40) = 0xE500000000000000;
    uint64_t v9 = MEMORY[0x1E4FBB550];
    *(void *)(inited + 48) = *(void *)(v0 + 128);
    *(void *)(inited + 72) = v9;
    strcpy((char *)(inited + 80), "exceededLimit");
    *(_WORD *)(inited + 94) = -4864;
    char v10 = *(unsigned char *)(v0 + OBJC_IVAR___GKLimitedPresentationManager_exceededFirstLimit);
    *(void *)(inited + 120) = MEMORY[0x1E4FBB390];
    *(unsigned char *)(inited + 96) = v10;
    v16[23] = sub_1C2E92248();
    uint64_t v11 = v0 + OBJC_IVAR___GKLimitedPresentationManager_lastAppearanceDate;
    swift_beginAccess();
    sub_1C2E49268(v11, (uint64_t)v3);
    if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4) == 1)
    {
      sub_1C2E55130((uint64_t)v3, &qword_1EBBA1730);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
      v16[3] = v4;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
      (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 16))(boxed_opaque_existential_1, v7, v4);
      sub_1C2E83B10((uint64_t)v16, 1702125924, 0xE400000000000000);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    id v13 = objc_msgSend(self, sel_standardUserDefaults);
    uint64_t v14 = (void *)sub_1C2E92218();
    swift_bridgeObjectRelease();
    uint64_t v15 = (void *)sub_1C2E922C8();
    objc_msgSend(v13, sel_setValue_forKey_, v14, v15);
  }
}

uint64_t sub_1C2E8540C(void *a1, void *a2, void *aBlock, uint64_t a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  id v7 = a1;
  id v8 = a2;
  swift_retain();
  uint64_t v9 = (void *)swift_task_alloc();
  v4[6] = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1C2E854E4;
  return LimitedPresentationManager.presentationDisabled(config:context:)((uint64_t)v7, (uint64_t)v8);
}

uint64_t sub_1C2E854E4()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_0_7();
  uint64_t v2 = (const void *)v1[5];
  uint64_t v3 = (void *)v1[3];
  uint64_t v4 = (void *)v1[2];
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_2_1();
  void *v6 = v5;
  swift_task_dealloc();
  swift_release();

  uint64_t v7 = OUTLINED_FUNCTION_14_8();
  v8(v7);
  _Block_release(v2);
  OUTLINED_FUNCTION_9_0();
  return v9();
}

uint64_t LimitedPresentationManager.presentationDisabled(config:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_6_15((uint64_t)sub_1C2E85644, v1);
}

id sub_1C2E85644()
{
  OUTLINED_FUNCTION_11_0();
  id result = objc_msgSend(objc_allocWithZone((Class)GKLimitedPresentationContext), sel_initWithScope_elementType_, 0, 0);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void **)(v0 + 16);
    sub_1C2E84014();
    char v4 = sub_1C2E842EC(v3, v2);
    sub_1C2E8505C();

    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v5(v4 & 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C2E8577C(void *a1, void *aBlock, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v5 = a1;
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  v3[5] = v6;
  void *v6 = v3;
  v6[1] = sub_1C2E85840;
  return LimitedPresentationManager.presentationDisabled(config:)((uint64_t)v5);
}

uint64_t sub_1C2E85840()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_7();
  uint64_t v2 = *(const void **)(v1 + 32);
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_2_1();
  void *v5 = v4;
  swift_task_dealloc();
  swift_release();

  uint64_t v6 = OUTLINED_FUNCTION_14_8();
  v7(v6);
  _Block_release(v2);
  OUTLINED_FUNCTION_9_0();
  return v8();
}

uint64_t LimitedPresentationManager.reset()()
{
  OUTLINED_FUNCTION_5_2();
  *(void *)(v1 + 40) = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBA1730);
  OUTLINED_FUNCTION_8_3(v2);
  *(void *)(v1 + 48) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C2E859F0, v0, 0);
}

uint64_t sub_1C2E859F0()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  *(void *)(v2 + 128) = 0;
  uint64_t v3 = sub_1C2E91AF8();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v3);
  uint64_t v4 = v2 + OBJC_IVAR___GKLimitedPresentationManager_lastAppearanceDate;
  swift_beginAccess();
  sub_1C2E54F68(v1, v4);
  swift_endAccess();
  *(unsigned char *)(v2 + OBJC_IVAR___GKLimitedPresentationManager_exceededFirstLimit) = 0;
  sub_1C2E8505C();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v5();
}

uint64_t sub_1C2E85ADC(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v2[4] = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1C2E8722C;
  return LimitedPresentationManager.reset()();
}

uint64_t LimitedPresentationManager.didPresent()()
{
  OUTLINED_FUNCTION_5_2();
  *(void *)(v1 + 40) = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBA1730);
  OUTLINED_FUNCTION_8_3(v2);
  *(void *)(v1 + 48) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C2E85C10, v0, 0);
}

void sub_1C2E85C10()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v1 + 128);
  BOOL v3 = __OFADD__(v2, 1);
  uint64_t v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 48);
    *(void *)(v1 + 128) = v4;
    sub_1C2E91AE8();
    uint64_t v6 = sub_1C2E91AF8();
    __swift_storeEnumTagSinglePayload(v5, 0, 1, v6);
    uint64_t v7 = v1 + OBJC_IVAR___GKLimitedPresentationManager_lastAppearanceDate;
    swift_beginAccess();
    sub_1C2E54F68(v5, v7);
    swift_endAccess();
    sub_1C2E8505C();
    swift_task_dealloc();
    OUTLINED_FUNCTION_9_0();
    v8();
  }
}

uint64_t sub_1C2E85D0C(uint64_t a1, int a2, void *aBlock, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = _Block_copy(aBlock);
  OUTLINED_FUNCTION_159();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = a1;
  swift_retain();

  return sub_1C2E83A20(a5, v8);
}

uint64_t sub_1C2E85D78(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  BOOL v3 = (void *)swift_task_alloc();
  v2[4] = v3;
  *BOOL v3 = v2;
  v3[1] = sub_1C2E85E20;
  return LimitedPresentationManager.didPresent()();
}

uint64_t sub_1C2E85E20()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_7();
  uint64_t v2 = *(void (***)(void))(v1 + 24);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_2_1();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  swift_release();
  v2[2](v2);
  _Block_release(v2);
  OUTLINED_FUNCTION_9_0();
  return v5();
}

double sub_1C2E85F28()
{
  uint64_t v0 = sub_1C2E91AF8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2E91AE8();
  sub_1C2E91A88();
  double v5 = v4;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return fabs(v5);
}

BOOL sub_1C2E86004(void *a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR___GKLimitedPresentationManager_exceededFirstLimit)) {
    uint64_t v2 = &selRef_limit;
  }
  else {
    uint64_t v2 = &selRef_initialLimit;
  }
  uint64_t v3 = (uint64_t)[a1 *v2];
  return (v3 & 0x8000000000000000) == 0 && *(void *)(v1 + 128) >= v3;
}

uint64_t sub_1C2E8605C()
{
  uint64_t v2 = sub_1C2E863D0((uint64_t)objc_msgSend(v0, sel_scope));
  sub_1C2E92388();
  sub_1C2E864E0((uint64_t)objc_msgSend(v0, sel_elementType));
  sub_1C2E92388();
  swift_bridgeObjectRelease();
  return v2;
}

void LimitedPresentationManager.__allocating_init()()
{
}

void LimitedPresentationManager.init()()
{
}

uint64_t LimitedPresentationManager.deinit()
{
  swift_bridgeObjectRelease();
  sub_1C2E55130(v0 + OBJC_IVAR___GKLimitedPresentationManager_lastAppearanceDate, &qword_1EBBA1730);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t LimitedPresentationManager.__deallocating_deinit()
{
  LimitedPresentationManager.deinit();

  return MEMORY[0x1F4188210](v0);
}

uint64_t LimitedPresentationManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_1C2E861E4()
{
  return LimitedPresentationManager.unownedExecutor.getter();
}

uint64_t sub_1C2E86200()
{
  return type metadata accessor for LimitedPresentationManager();
}

uint64_t type metadata accessor for LimitedPresentationManager()
{
  uint64_t result = qword_1EBBA1680;
  if (!qword_1EBBA1680) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1C2E86250()
{
  sub_1C2E4CA80();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for LimitedPresentationManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LimitedPresentationManager);
}

uint64_t dispatch thunk of LimitedPresentationManager.__allocating_init(defaultsKey:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_1C2E8633C()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C2E05168;
  uint64_t v3 = OUTLINED_FUNCTION_73();
  return v4(v3);
}

uint64_t sub_1C2E863D0(uint64_t result)
{
  switch(result)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x6C61626F6C67;
      break;
    case 2:
      uint64_t result = 0x6576656C20707061;
      break;
    case 3:
      uint64_t result = 0x20737365636F7270;
      break;
    default:
      v3[4] = v1;
      v3[5] = v2;
      strcpy((char *)v3, "unsupported-");
      BYTE5(v3[1]) = 0;
      HIWORD(v3[1]) = -5120;
      sub_1C2E92BB8();
      sub_1C2E92388();
      swift_bridgeObjectRelease();
      uint64_t result = v3[0];
      break;
  }
  return result;
}

uint64_t sub_1C2E864E0(uint64_t result)
{
  if (result)
  {
    if (result == 1 || result == 2)
    {
      return 0x206E692D6E676973;
    }
    else
    {
      strcpy((char *)v1, "unsupported-");
      sub_1C2E92BB8();
      sub_1C2E92388();
      swift_bridgeObjectRelease();
      return v1[0];
    }
  }
  return result;
}

uint64_t sub_1C2E865B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  double v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *double v4 = v3;
  v4[1] = sub_1C2E0F968;
  return v6();
}

uint64_t sub_1C2E86680()
{
  OUTLINED_FUNCTION_22();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C2E0F968;
  uint64_t v3 = OUTLINED_FUNCTION_4_6();
  return v4(v3);
}

uint64_t sub_1C2E86720(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  double v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_1C2E0F968;
  return v7();
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1C2E86830()
{
  OUTLINED_FUNCTION_22();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  double v5 = (int *)v0[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_15(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_1C2E0F968;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EA33A8A0 + dword_1EA33A8A0);
  return v9(v2, v3, v4, v5);
}

uint64_t sub_1C2E868F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C2E92568();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1C2E55130(a1, (uint64_t *)&unk_1EBBA1758);
  }
  else
  {
    sub_1C2E92558();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C2E924E8();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1C2E86A64(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1C2E86B40;
  return v6(a1);
}

uint64_t sub_1C2E86B40()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_7();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v3();
}

uint64_t sub_1C2E86C04()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_159();

  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1C2E86C34()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_15(v4);
  void *v5 = v6;
  v5[1] = sub_1C2E05168;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA33A8B0 + dword_1EA33A8B0);
  return v7(v2, v3);
}

uint64_t objectdestroyTm_1()
{
  _Block_release(*(const void **)(v0 + 16));
  swift_release();
  uint64_t v1 = OUTLINED_FUNCTION_159();

  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_1C2E86D20()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C2E0F968;
  uint64_t v3 = OUTLINED_FUNCTION_73();
  return v4(v3);
}

uint64_t sub_1C2E86DB4()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C2E86DFC()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = (void *)v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_15(v4);
  void *v5 = v6;
  v5[1] = sub_1C2E0F968;
  uint64_t v7 = (uint64_t (*)(void *, void *, uint64_t))((char *)&dword_1EA33A8D0 + dword_1EA33A8D0);
  return v7(v1, v2, v3);
}

uint64_t sub_1C2E86EA8()
{
  _Block_release(*(const void **)(v0 + 32));
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1C2E86EF8()
{
  OUTLINED_FUNCTION_22();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C2E0F968;
  uint64_t v3 = OUTLINED_FUNCTION_4_6();
  return v4(v3);
}

double sub_1C2E86F98@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1C2E19EE8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA338A78);
    sub_1C2E929F8();
    swift_bridgeObjectRelease();
    sub_1C2E1B6C4((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_1C2E92A18();
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1C2E870D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1C2E19EE8(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA33A850);
  sub_1C2E929F8();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 8 * v6);
  type metadata accessor for TransportPeerMonitor();
  sub_1C2E92A18();
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_1C2E871DC()
{
  unint64_t result = qword_1EA33A8F0;
  if (!qword_1EA33A8F0)
  {
    sub_1C2E91AF8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA33A8F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_15(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4188298](a1, a2, 0);
}

uint64_t OUTLINED_FUNCTION_11_7()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_14_8()
{
  return v0;
}

void _gkMarkFileAsPurgeable_cold_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = __error();
  uint64_t v5 = strerror(*v4);
  int v6 = 136315394;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  char v9 = v5;
  _os_log_error_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_ERROR, " Can't open %s : %s\n", (uint8_t *)&v6, 0x16u);
}

void gkEnsureDirectory_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_ERROR, "Could not create target folder: %@,   %@", v2, 0x16u);
}

void __getOBBundleClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getOBBundleClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"GKSoftLinkedClassesFoundation.h", 35, @"Unable to find class %s", "OBBundle");

  __break(1u);
}

void OnBoardingKitLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *OnBoardingKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"GKSoftLinkedClassesFoundation.h", 15, @"%s", *a1);

  __break(1u);
}

void __getOBPrivacyFlowClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getOBPrivacyFlowClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"GKSoftLinkedClassesFoundation.h", 32, @"Unable to find class %s", "OBPrivacyFlow");

  __break(1u);
}

void GKSupportsFriendingViaPushForIDS_cold_1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_DEBUG, "Current friend via push support: %d", (uint8_t *)v2, 8u);
}

void __GKInsecureCacheRoot_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_17(&dword_1C2D22000, v0, v1, "error while trying to create the cache root directory at path:%@ due to:%@");
}

void __GKSupportDataRoot_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_17(&dword_1C2D22000, v0, v1, "error while trying to create the support root directory at:%@ due to %@");
}

void __getASCArtworkClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AppStoreComponentsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"GKGameInternal.m", 25, @"%s", *a1);

  __break(1u);
}

void __getASCArtworkClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getASCArtworkClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"GKGameInternal.m", 27, @"Unable to find class %s", "ASCArtwork");

  __break(1u);
}

void GKGetRuntimeStrategy_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = sRuntimeStrategy;
  _os_log_debug_impl(&dword_1C2D22000, log, OS_LOG_TYPE_DEBUG, "Active runtime strategy defaulted to: %@", (uint8_t *)&v1, 0xCu);
}

void GKSetRuntimeStrategy_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_DEBUG, "Active runtime strategy set to: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_1C2E917E8()
{
  return MEMORY[0x1F40E2ED8]();
}

uint64_t sub_1C2E917F8()
{
  return MEMORY[0x1F40E2F00]();
}

uint64_t sub_1C2E91808()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1C2E91818()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1C2E91828()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1C2E91838()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1C2E91848()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1C2E91858()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1C2E91868()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1C2E91878()
{
  return MEMORY[0x1F40E32B0]();
}

uint64_t sub_1C2E91888()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1C2E91898()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1C2E918A8()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1C2E918B8()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1C2E918C8()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1C2E918D8()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1C2E918E8()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1C2E918F8()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1C2E91908()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1C2E91918()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1C2E91928()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C2E91938()
{
  return MEMORY[0x1F40E4588]();
}

uint64_t sub_1C2E91948()
{
  return MEMORY[0x1F40E45B8]();
}

uint64_t sub_1C2E91958()
{
  return MEMORY[0x1F40E45C0]();
}

uint64_t sub_1C2E91968()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1C2E91978()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1C2E91988()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1C2E91998()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C2E919A8()
{
  return MEMORY[0x1F40E4BB0]();
}

uint64_t sub_1C2E919B8()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1C2E919C8()
{
  return MEMORY[0x1F40E4BD8]();
}

uint64_t sub_1C2E919D8()
{
  return MEMORY[0x1F40E4C18]();
}

uint64_t sub_1C2E919E8()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1C2E919F8()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1C2E91A08()
{
  return MEMORY[0x1F40E4CC8]();
}

uint64_t sub_1C2E91A18()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1C2E91A28()
{
  return MEMORY[0x1F40E4CF8]();
}

uint64_t sub_1C2E91A38()
{
  return MEMORY[0x1F40E4D00]();
}

uint64_t sub_1C2E91A48()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C2E91A58()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C2E91A68()
{
  return MEMORY[0x1F40E4DF0]();
}

uint64_t sub_1C2E91A78()
{
  return MEMORY[0x1F40E4E30]();
}

uint64_t sub_1C2E91A88()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1C2E91A98()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1C2E91AA8()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1C2E91AB8()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1C2E91AC8()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1C2E91AD8()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1C2E91AE8()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1C2E91AF8()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1C2E91B08()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1C2E91B18()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1C2E91B28()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C2E91B38()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C2E91B48()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t sub_1C2E91B58()
{
  return MEMORY[0x1F40E5540]();
}

uint64_t sub_1C2E91B68()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_1C2E91B78()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1C2E91B88()
{
  return MEMORY[0x1F40E5698]();
}

uint64_t sub_1C2E91B98()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1C2E91BA8()
{
  return MEMORY[0x1F40E57F8]();
}

uint64_t sub_1C2E91BB8()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1C2E91BC8()
{
  return MEMORY[0x1F40E5868]();
}

uint64_t sub_1C2E91BD8()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1C2E91BE8()
{
  return MEMORY[0x1F4113418]();
}

uint64_t sub_1C2E91BF8()
{
  return MEMORY[0x1F4113420]();
}

uint64_t sub_1C2E91C08()
{
  return MEMORY[0x1F4113530]();
}

uint64_t sub_1C2E91C18()
{
  return MEMORY[0x1F4113538]();
}

uint64_t sub_1C2E91C38()
{
  return MEMORY[0x1F4186968]();
}

uint64_t sub_1C2E91C48()
{
  return MEMORY[0x1F4186978]();
}

uint64_t sub_1C2E91C58()
{
  return MEMORY[0x1F410B008]();
}

uint64_t sub_1C2E91C68()
{
  return MEMORY[0x1F410B010]();
}

uint64_t sub_1C2E91C78()
{
  return MEMORY[0x1F40E74B0]();
}

uint64_t sub_1C2E91C88()
{
  return MEMORY[0x1F40E74B8]();
}

uint64_t sub_1C2E91C98()
{
  return MEMORY[0x1F40E74C0]();
}

uint64_t sub_1C2E91CA8()
{
  return MEMORY[0x1F40E74C8]();
}

uint64_t sub_1C2E91CF8()
{
  return MEMORY[0x1F40E7558]();
}

uint64_t sub_1C2E91D08()
{
  return MEMORY[0x1F40E7560]();
}

uint64_t sub_1C2E91D18()
{
  return MEMORY[0x1F40E7588]();
}

uint64_t sub_1C2E91D28()
{
  return MEMORY[0x1F40E7598]();
}

uint64_t sub_1C2E91D38()
{
  return MEMORY[0x1F40E75B8]();
}

uint64_t sub_1C2E91D48()
{
  return MEMORY[0x1F40E75C0]();
}

uint64_t sub_1C2E91D58()
{
  return MEMORY[0x1F40E75C8]();
}

uint64_t sub_1C2E91D68()
{
  return MEMORY[0x1F40E75D0]();
}

uint64_t sub_1C2E91D78()
{
  return MEMORY[0x1F40E75D8]();
}

uint64_t sub_1C2E91D88()
{
  return MEMORY[0x1F40E75E0]();
}

uint64_t sub_1C2E91D98()
{
  return MEMORY[0x1F40E75E8]();
}

uint64_t sub_1C2E91DA8()
{
  return MEMORY[0x1F40E75F0]();
}

uint64_t sub_1C2E91DB8()
{
  return MEMORY[0x1F40E75F8]();
}

uint64_t sub_1C2E91DC8()
{
  return MEMORY[0x1F40E7600]();
}

uint64_t sub_1C2E91DE8()
{
  return MEMORY[0x1F40E7628]();
}

uint64_t sub_1C2E91DF8()
{
  return MEMORY[0x1F40E7640]();
}

uint64_t sub_1C2E91E18()
{
  return MEMORY[0x1F40E7668]();
}

uint64_t sub_1C2E91E28()
{
  return MEMORY[0x1F40E7670]();
}

uint64_t sub_1C2E91E38()
{
  return MEMORY[0x1F40E7678]();
}

uint64_t sub_1C2E91E48()
{
  return MEMORY[0x1F40E7680]();
}

uint64_t sub_1C2E91E58()
{
  return MEMORY[0x1F40E7688]();
}

uint64_t sub_1C2E91E68()
{
  return MEMORY[0x1F40E7690]();
}

uint64_t sub_1C2E91E78()
{
  return MEMORY[0x1F40E7698]();
}

uint64_t sub_1C2E91E88()
{
  return MEMORY[0x1F40E76A8]();
}

uint64_t sub_1C2E91E98()
{
  return MEMORY[0x1F40E76C0]();
}

uint64_t sub_1C2E91EA8()
{
  return MEMORY[0x1F40E76D0]();
}

uint64_t sub_1C2E91EB8()
{
  return MEMORY[0x1F40E76E0]();
}

uint64_t sub_1C2E91EC8()
{
  return MEMORY[0x1F40E76E8]();
}

uint64_t sub_1C2E91ED8()
{
  return MEMORY[0x1F40E76F0]();
}

uint64_t sub_1C2E91EE8()
{
  return MEMORY[0x1F40E7700]();
}

uint64_t sub_1C2E91EF8()
{
  return MEMORY[0x1F40E7708]();
}

uint64_t sub_1C2E91F08()
{
  return MEMORY[0x1F40E7710]();
}

uint64_t sub_1C2E91F18()
{
  return MEMORY[0x1F40E7718]();
}

uint64_t sub_1C2E91F28()
{
  return MEMORY[0x1F40E7740]();
}

uint64_t sub_1C2E91F58()
{
  return MEMORY[0x1F40E7770]();
}

uint64_t sub_1C2E91F68()
{
  return MEMORY[0x1F40E7778]();
}

uint64_t sub_1C2E91F78()
{
  return MEMORY[0x1F40E7790]();
}

uint64_t sub_1C2E91F88()
{
  return MEMORY[0x1F40E7798]();
}

uint64_t sub_1C2E91F98()
{
  return MEMORY[0x1F40E77A0]();
}

uint64_t sub_1C2E91FA8()
{
  return MEMORY[0x1F40E77A8]();
}

uint64_t sub_1C2E91FB8()
{
  return MEMORY[0x1F40E77B0]();
}

uint64_t sub_1C2E91FC8()
{
  return MEMORY[0x1F40E77B8]();
}

uint64_t sub_1C2E91FD8()
{
  return MEMORY[0x1F40E77C0]();
}

uint64_t sub_1C2E91FE8()
{
  return MEMORY[0x1F4188358]();
}

uint64_t sub_1C2E91FF8()
{
  return MEMORY[0x1F4188370]();
}

uint64_t sub_1C2E92008()
{
  return MEMORY[0x1F41883B8]();
}

uint64_t sub_1C2E92018()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_1C2E92028()
{
  return MEMORY[0x1F4187918]();
}

uint64_t sub_1C2E92038()
{
  return MEMORY[0x1F4187948]();
}

uint64_t sub_1C2E92048()
{
  return MEMORY[0x1F4187970]();
}

uint64_t sub_1C2E92058()
{
  return MEMORY[0x1F4187980]();
}

uint64_t sub_1C2E92068()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1C2E92078()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C2E92088()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C2E92098()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1C2E920A8()
{
  return MEMORY[0x1F4186BA0]();
}

uint64_t sub_1C2E920B8()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_1C2E920C8()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t sub_1C2E920D8()
{
  return MEMORY[0x1F40D6990]();
}

uint64_t sub_1C2E920E8()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1C2E920F8()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1C2E92108()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1C2E92118()
{
  return MEMORY[0x1F40D6E30]();
}

uint64_t sub_1C2E92128()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1C2E92138()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C2E92148()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1C2E92158()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_1C2E92168()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C2E92178()
{
  return MEMORY[0x1F4186D18]();
}

uint64_t sub_1C2E92188()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C2E92198()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1C2E921A8()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1C2E921B8()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1C2E921C8()
{
  return MEMORY[0x1F40DFF38]();
}

uint64_t sub_1C2E921D8()
{
  return MEMORY[0x1F40DFF40]();
}

uint64_t sub_1C2E921E8()
{
  return MEMORY[0x1F40DFF58]();
}

uint64_t sub_1C2E921F8()
{
  return MEMORY[0x1F40DFF70]();
}

uint64_t sub_1C2E92208()
{
  return MEMORY[0x1F40E04A8]();
}

uint64_t sub_1C2E92218()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C2E92228()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1C2E92238()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1C2E92248()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1C2E92258()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1C2E92268()
{
  return MEMORY[0x1F4183618]();
}

uint64_t sub_1C2E92278()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1C2E92288()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1C2E92298()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C2E922A8()
{
  return MEMORY[0x1F40E6158]();
}

uint64_t sub_1C2E922B8()
{
  return MEMORY[0x1F40E6160]();
}

uint64_t sub_1C2E922C8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C2E922D8()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1C2E922E8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1C2E922F8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C2E92308()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1C2E92318()
{
  return MEMORY[0x1F40E62E0]();
}

uint64_t sub_1C2E92328()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C2E92338()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1C2E92348()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1C2E92358()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C2E92368()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1C2E92378()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1C2E92388()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C2E92398()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C2E923A8()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1C2E923B8()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1C2E923C8()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1C2E923D8()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1C2E923E8()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1C2E923F8()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1C2E92408()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1C2E92418()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_1C2E92428()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1C2E92438()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1C2E92448()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1C2E92458()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1C2E92468()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C2E92478()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C2E92488()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C2E92498()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C2E924A8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C2E924B8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C2E924C8()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1C2E924D8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C2E924E8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1C2E924F8()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1C2E92508()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1C2E92528()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1C2E92538()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1C2E92548()
{
  return MEMORY[0x1F4187CE8]();
}

uint64_t sub_1C2E92558()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1C2E92568()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1C2E92578()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1C2E92588()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1C2E925A8()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1C2E925B8()
{
  return MEMORY[0x1F4187D80]();
}

uint64_t sub_1C2E925C8()
{
  return MEMORY[0x1F4187D88]();
}

uint64_t sub_1C2E925D8()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1C2E925F8()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t sub_1C2E92618()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1C2E92628()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1C2E92638()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1C2E92648()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1C2E92658()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1C2E92668()
{
  return MEMORY[0x1F4187418]();
}

uint64_t sub_1C2E92688()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1C2E92698()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C2E926A8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C2E926B8()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1C2E926C8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C2E926D8()
{
  return MEMORY[0x1F40E77F0]();
}

uint64_t sub_1C2E926E8()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C2E926F8()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1C2E92708()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C2E92718()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1C2E92728()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C2E92738()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C2E92748()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1C2E92758()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1C2E92768()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1C2E92778()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C2E92788()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C2E92798()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C2E927A8()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1C2E927B8()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1C2E927C8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C2E927D8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C2E927E8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1C2E927F8()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1C2E92808()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1C2E92818()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1C2E92828()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1C2E92848()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1C2E92858()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1C2E92868()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1C2E92878()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1C2E92898()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1C2E928A8()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1C2E928B8()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1C2E928C8()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1C2E928D8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C2E928E8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C2E928F8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C2E92908()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1C2E92918()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1C2E92928()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C2E92938()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1C2E92948()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1C2E92958()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1C2E92968()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1C2E92978()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1C2E92998()
{
  return MEMORY[0x1F4187F60]();
}

uint64_t sub_1C2E929A8()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t sub_1C2E929B8()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t sub_1C2E929C8()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t sub_1C2E929D8()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t sub_1C2E929E8()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C2E929F8()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1C2E92A08()
{
  return MEMORY[0x1F41851B8]();
}

uint64_t sub_1C2E92A18()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1C2E92A28()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C2E92A38()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C2E92A48()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C2E92A58()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C2E92A68()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C2E92A78()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C2E92A98()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1C2E92AB8()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1C2E92AC8()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1C2E92AD8()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1C2E92AE8()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1C2E92AF8()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1C2E92B08()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1C2E92B18()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C2E92B28()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1C2E92B38()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1C2E92B48()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1C2E92B58()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1C2E92B68()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1C2E92B78()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1C2E92B88()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1C2E92B98()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C2E92BA8()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1C2E92BB8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C2E92BD8()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1C2E92BE8()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1C2E92BF8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C2E92C28()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1C2E92C38()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C2E92C48()
{
  return MEMORY[0x1F4188170]();
}

uint64_t sub_1C2E92C78()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C2E92C88()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C2E92C98()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C2E92CA8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C2E92CB8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C2E92CC8()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C2E92CD8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C2E92CE8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C2E92CF8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1C2E92D08()
{
  return MEMORY[0x1F4186138]();
}

uint64_t sub_1C2E92D18()
{
  return MEMORY[0x1F41861A8]();
}

uint64_t sub_1C2E92D48()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x1F40D74B0]();
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

uint64_t CGEnterLockdownModeForFonts()
{
  return MEMORY[0x1F40DA390]();
}

uint64_t CGEnterLockdownModeForPDF()
{
  return MEMORY[0x1F40DA398]();
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA8B8](source, decode, shouldInterpolate, *(void *)&intent);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

CFStringRef CGImageGetUTType(CGImageRef image)
{
  return (CFStringRef)MEMORY[0x1F40DA9B0](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

uint64_t CGImageSourceDisableHardwareDecoding()
{
  return MEMORY[0x1F40E99D0]();
}

uint64_t CGImageSourceDisableMetadataParsing()
{
  return MEMORY[0x1F40E99D8]();
}

uint64_t CGImageSourceDisableRAWDecoding()
{
  return MEMORY[0x1F40E99E0]();
}

CGImageSourceStatus CGImageSourceGetStatus(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E9A08](isrc);
}

uint64_t CGImageSourceSetAllowableTypes()
{
  return MEMORY[0x1F40E9A60]();
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x1F41092D8]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1F411CA28]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x1F412A6D8]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x1F412A768]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x1F412A788]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x1F417CDF8]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4101F18](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1F4101F20](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4101F30](target, runLoop, runLoopMode);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1F40C9AB0](aBlock);
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1F40D8EA0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

BOOL class_respondsToSelector(Class cls, SEL sel)
{
  return MEMORY[0x1F4181580](cls, sel);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBA58]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC0D8](*(void *)&a1, a2, a3, *(void *)&a4);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_is_debug_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD368](log);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}

uint64_t proc_disable_wakemon()
{
  return MEMORY[0x1F40CD850]();
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  uint64_t v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1F40CDD48](path, name, *(void *)&options);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1F4181B38](lhs, rhs);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t ubidi_close()
{
  return MEMORY[0x1F417F970]();
}

uint64_t ubidi_getParaLevel()
{
  return MEMORY[0x1F417F9A8]();
}

uint64_t ubidi_open()
{
  return MEMORY[0x1F417F9D0]();
}

uint64_t ubidi_setPara()
{
  return MEMORY[0x1F417F9F8]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}