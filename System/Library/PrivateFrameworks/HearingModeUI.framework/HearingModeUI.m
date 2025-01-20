void sub_251288A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2512890C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_251289950(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_25128B130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25128BABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25128FF08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_251291F08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t sub_251292884()
{
  uint64_t v0 = sub_2512C42B8();
  __swift_allocate_value_buffer(v0, qword_269B313A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B313A8);
  return sub_2512C42A8();
}

uint64_t sub_251292900()
{
  if (qword_269B2E2B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2512C42B8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B313A8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25129299C@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B2E2B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B313A8);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_251292A44()
{
  return 0;
}

void *sub_251292A4C()
{
  v1 = (void **)(v0 + OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_headphoneDevice);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_251292A9C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_headphoneDevice);
  swift_beginAccess();
  v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_251292AF0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_251292B4C()
{
  return MEMORY[0x263F8EE80];
}

uint64_t sub_251292B58()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_251292BA4(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_eventPayload);
  swift_beginAccess();
  *id v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_251292BF8())()
{
  return j__swift_endAccess;
}

id HMAnalyticManager.__allocating_init(hpDevice:)(void *a1)
{
  id v3 = (char *)objc_allocWithZone(v1);
  v4 = (void **)&v3[OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_headphoneDevice];
  *(void *)&v3[OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_headphoneDevice] = 0;
  *(void *)&v3[OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_eventPayload] = MEMORY[0x263F8EE80];
  swift_beginAccess();
  v5 = *v4;
  void *v4 = a1;
  id v6 = a1;

  v9.receiver = v3;
  v9.super_class = v1;
  id v7 = objc_msgSendSuper2(&v9, sel_init);

  return v7;
}

id HMAnalyticManager.init(hpDevice:)(void *a1)
{
  id v3 = (void **)&v1[OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_headphoneDevice];
  *(void *)&v1[OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_headphoneDevice] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_eventPayload] = MEMORY[0x263F8EE80];
  swift_beginAccess();
  v4 = *v3;
  *id v3 = a1;
  id v5 = a1;

  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for HMAnalyticManager();
  id v6 = objc_msgSendSuper2(&v8, sel_init);

  return v6;
}

uint64_t type metadata accessor for HMAnalyticManager()
{
  return self;
}

id HMAnalyticManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id HMAnalyticManager.init()()
{
  id v1 = (void **)&v0[OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_headphoneDevice];
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_headphoneDevice] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_eventPayload] = MEMORY[0x263F8EE80];
  swift_beginAccess();
  uint64_t v2 = *v1;
  char *v1 = 0;

  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for HMAnalyticManager();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t sub_251292FAC(unint64_t a1)
{
  if (a1 <= 1) {
    return 0xD000000000000014;
  }
  uint64_t result = sub_2512C4BD8();
  __break(1u);
  return result;
}

BOOL HMAnalyticManager.EventName.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

void *sub_251293040@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

unint64_t sub_251293070(uint64_t a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 0:
      unint64_t result = 0x726F737365636341;
      break;
    case 1:
    case 6:
      return result;
    case 2:
      unint64_t result = 0x6C6C6F726E454148;
      break;
    case 3:
    case 4:
    case 12:
      unint64_t result = 0xD000000000000015;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0xD000000000000026;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 9:
      unint64_t result = 0xD000000000000018;
      break;
    case 10:
      unint64_t result = 0xD000000000000022;
      break;
    case 11:
      unint64_t result = 0xD000000000000023;
      break;
    case 13:
      unint64_t result = 0xD000000000000011;
      break;
    case 14:
      unint64_t result = 0x65756C615652534CLL;
      break;
    default:
      sub_2512C4BD8();
      __break(1u);
      JUMPOUT(0x251293200);
  }
  return result;
}

unint64_t HMAnalyticManager.EventKey.init(rawValue:)(unint64_t a1)
{
  return sub_251296FC4(a1);
}

BOOL sub_25129325C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_251293270()
{
  return sub_2512C4C38();
}

unint64_t sub_25129329C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_251296FC4(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_2512932D0(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_2512932DC()
{
}

unint64_t sub_251293314(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    BOOL v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D808);
  BOOL v2 = (void *)sub_2512C4B88();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  char v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    id v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_251295C50(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

id sub_251293430(uint64_t a1)
{
  id v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_251297CD0();
    char v4 = (void *)sub_2512C4728();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v4 = 0;
  }
  return v4;
}

void sub_251293504()
{
}

void sub_25129353C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v4) + 0x60))();
  if (v8)
  {
    objc_super v9 = (void *)v8;
    if (qword_269B2E2B0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2512C42B8();
    __swift_project_value_buffer(v10, (uint64_t)qword_269B313A8);
    v11 = sub_2512C4298();
    os_log_type_t v12 = sub_2512C4978();
    if (os_log_type_enabled(v11, v12))
    {
      BOOL v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      aBlock[0] = v14;
      *(_DWORD *)BOOL v13 = 136315138;
      sub_2512955F8(0xD000000000000014, a1, aBlock);
      sub_2512C4A68();
      _os_log_impl(&dword_251285000, v11, v12, "Analytics: Sending data for %s event", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25339B730](v14, -1, -1);
      MEMORY[0x25339B730](v13, -1, -1);
    }

    v15 = (void *)sub_2512C47C8();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v9;
    aBlock[4] = a3;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_251293430;
    aBlock[3] = a4;
    v17 = _Block_copy(aBlock);
    id v18 = v9;
    swift_release();
    AnalyticsSendEventLazy();
    _Block_release(v17);
  }
  else
  {
    if (qword_269B2E2B0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_2512C42B8();
    __swift_project_value_buffer(v19, (uint64_t)qword_269B313A8);
    oslog = sub_2512C4298();
    os_log_type_t v20 = sub_2512C4988();
    if (os_log_type_enabled(oslog, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_251285000, oslog, v20, "Analytics: HeadphoneDevice is not set", v21, 2u);
      MEMORY[0x25339B730](v21, -1, -1);
    }
  }
}

uint64_t sub_2512938E8(uint64_t a1, uint64_t a2, void *a3)
{
  char v4 = v3;
  uint64_t v8 = sub_2512C42B8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (self == a3)
  {
    if (qword_269B2E2B0 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v8, (uint64_t)qword_269B313A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v13, v8);
    uint64_t v14 = sub_2512C4298();
    os_log_type_t v15 = sub_2512C4988();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v48[0] = v17;
      *(_DWORD *)uint64_t v16 = 136315394;
      uint64_t v45 = v17;
      if (a1)
      {
        if (a1 != 1) {
          goto LABEL_29;
        }
        id v18 = "com.apple.HPSettings";
      }
      else
      {
        id v18 = "com.apple.HASettings";
      }
      v47[0] = sub_2512955F8(0xD000000000000014, (unint64_t)(v18 - 32) | 0x8000000000000000, v48);
      sub_2512C4A68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2080;
      unint64_t v41 = sub_251293070(a2);
      v47[0] = sub_2512955F8(v41, v42, v48);
      sub_2512C4A68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_251285000, v14, v15, "Analytics: Reject addCustomEvent for %s, %s", (uint8_t *)v16, 0x16u);
      uint64_t v43 = v45;
      swift_arrayDestroy();
      MEMORY[0x25339B730](v43, -1, -1);
      MEMORY[0x25339B730](v16, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    if (a1)
    {
      if (a1 != 1)
      {
        v48[0] = a1;
        while (1)
        {
          sub_2512C4BD8();
          __break(1u);
LABEL_29:
          v47[0] = a1;
        }
      }
      uint64_t v12 = 0x80000002512CAB50;
    }
    else
    {
      uint64_t v12 = 0x80000002512CAB70;
    }
    uint64_t v19 = (void *)MEMORY[0x263F8EED0];
    if (*(void *)((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v4) + 0x78))() + 16)
      && (sub_251295C50(0xD000000000000014, v12), (v20 & 1) != 0))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (a1) {
        uint64_t v21 = 0x80000002512CAB50;
      }
      else {
        uint64_t v21 = 0x80000002512CAB70;
      }
      v32 = (uint64_t (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))((*v19 & *v4) + 0x88))(v48);
      v34 = sub_251293EB8(v47, 0xD000000000000014, v21);
      if (*v33)
      {
        v35 = v33;
        unint64_t v36 = sub_251293070(a2);
        uint64_t v38 = v37;
        id v39 = a3;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v46 = *v35;
        uint64_t *v35 = 0x8000000000000000;
        sub_25129683C((uint64_t)v39, v36, v38, isUniquelyReferenced_nonNull_native);
        uint64_t *v35 = v46;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      ((void (*)(void *, void))v34)(v47, 0);
      swift_bridgeObjectRelease();
      return v32(v48, 0);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (a1) {
        uint64_t v22 = 0x80000002512CAB50;
      }
      else {
        uint64_t v22 = 0x80000002512CAB70;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D780);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2512C6440;
      *(void *)(inited + 32) = sub_251293070(a2);
      *(void *)(inited + 40) = v24;
      *(void *)(inited + 48) = a3;
      id v25 = a3;
      unint64_t v26 = sub_251293314(inited);
      v27 = (uint64_t (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))((*v19 & *v4) + 0x88))(v48);
      v29 = v28;
      char v30 = swift_isUniquelyReferenced_nonNull_native();
      v47[0] = *v29;
      void *v29 = 0x8000000000000000;
      sub_2512966CC(v26, 0xD000000000000014, v22, v30);
      void *v29 = v47[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v27(v48, 0);
    }
  }
}

void (*sub_251293EB8(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_251295DAC(v6, a2, a3);
  return sub_251293F38;
}

void sub_251293F38(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

void sub_251294004()
{
  id v1 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78);
  uint64_t v2 = *(void *)(v1() + 16);
  uint64_t v3 = swift_bridgeObjectRelease();
  if (!v2)
  {
    if (qword_269B2E2B0 != -1) {
      goto LABEL_36;
    }
    goto LABEL_29;
  }
  v34 = v0;
  uint64_t v4 = ((uint64_t (*)(uint64_t))v1)(v3);
  uint64_t v5 = 0;
  uint64_t v35 = v4 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(v4 + 64);
  int64_t v36 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = v40;
  while (1)
  {
    if (v8)
    {
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_23;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v15 >= v36) {
      goto LABEL_27;
    }
    unint64_t v16 = *(void *)(v35 + 8 * v15);
    ++v5;
    if (!v16)
    {
      uint64_t v5 = v15 + 1;
      if (v15 + 1 >= v36) {
        goto LABEL_27;
      }
      unint64_t v16 = *(void *)(v35 + 8 * v5);
      if (!v16)
      {
        uint64_t v5 = v15 + 2;
        if (v15 + 2 >= v36) {
          goto LABEL_27;
        }
        unint64_t v16 = *(void *)(v35 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_23:
    os_log_t oslog = (os_log_t)v5;
    id v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v14);
    uint64_t v19 = *v18;
    unint64_t v20 = v18[1];
    uint64_t v21 = *(void *)(*(void *)(v4 + 56) + 8 * v14);
    uint64_t v22 = qword_269B2E2B0;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v22 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_2512C42B8();
    __swift_project_value_buffer(v23, (uint64_t)qword_269B313A8);
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_2512C4298();
    os_log_type_t v25 = sub_2512C4978();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = v4;
      v27 = v9;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      aBlock[0] = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v28 + 4) = sub_2512955F8(v19, v20, aBlock);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_251285000, v24, v25, "Analytics: Sending data for %s event", (uint8_t *)v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25339B730](v29, -1, -1);
      uint64_t v30 = v28;
      uint64_t v9 = v27;
      uint64_t v4 = v26;
      MEMORY[0x25339B730](v30, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v5 = (uint64_t)oslog;
    uint64_t v10 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v21;
    v40[2] = sub_2512974E4;
    v40[3] = v11;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    v40[0] = sub_251293430;
    v40[1] = &block_descriptor_12;
    uint64_t v12 = _Block_copy(aBlock);
    swift_release();
    AnalyticsSendEventLazy();
    _Block_release(v12);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v36)
  {
LABEL_27:
    swift_release();
    (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v34) + 0x80))(MEMORY[0x263F8EE80]);
    return;
  }
  unint64_t v16 = *(void *)(v35 + 8 * v17);
  if (v16)
  {
    uint64_t v5 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    uint64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v36) {
      goto LABEL_27;
    }
    unint64_t v16 = *(void *)(v35 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_35:
  __break(1u);
LABEL_36:
  swift_once();
LABEL_29:
  uint64_t v31 = sub_2512C42B8();
  __swift_project_value_buffer(v31, (uint64_t)qword_269B313A8);
  osloga = sub_2512C4298();
  os_log_type_t v32 = sub_2512C4988();
  if (os_log_type_enabled(osloga, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_251285000, osloga, v32, "Analytics: Event payload is empty", v33, 2u);
    MEMORY[0x25339B730](v33, -1, -1);
  }
}

id HMAnalyticManager.__deallocating_deinit()
{
  return sub_2512955BC(type metadata accessor for HMAnalyticManager);
}

uint64_t sub_2512945E8()
{
  return 1;
}

id sub_2512945F0()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for EnrollmentAnalyticManager()), sel_init);
  qword_269B2E2C0 = (uint64_t)result;
  return result;
}

uint64_t *sub_251294620()
{
  if (qword_269B2E2B8 != -1) {
    swift_once();
  }
  return &qword_269B2E2C0;
}

id static EnrollmentAnalyticManager.shared.getter()
{
  if (qword_269B2E2B8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_269B2E2C0;
  return v0;
}

id sub_251294724()
{
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_accessoryPID] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_agType] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_agCategoryLeft] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_agCategoryRight] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_enrollmentResult] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_enrollmentType] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_entrance] = 1;
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for EnrollmentAnalyticManager();
  id v1 = objc_msgSendSuper2(&v9, sel_init);
  uint64_t v2 = qword_269B2E2B0;
  id v3 = v1;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2512C42B8();
  __swift_project_value_buffer(v4, (uint64_t)qword_269B313A8);
  uint64_t v5 = sub_2512C4298();
  os_log_type_t v6 = sub_2512C4978();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_251285000, v5, v6, "Analytics: EnrollmentAnalyticManager initialized", v7, 2u);
    MEMORY[0x25339B730](v7, -1, -1);
  }

  return v3;
}

unint64_t EnrollmentAnalyticManager.EnrollmentType.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t *sub_2512948C0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

unint64_t sub_2512948DC(uint64_t a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 0:
      unint64_t result = 0x726F737365636341;
      break;
    case 1:
      unint64_t result = 0x657079544741;
      break;
    case 2:
    case 3:
      unint64_t result = 0x6F67657461434741;
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 0x656D6C6C6F726E45;
      break;
    case 6:
      unint64_t result = 0x65636E6172746E45;
      break;
    default:
      sub_2512C4BD8();
      __break(1u);
      JUMPOUT(0x2512949FCLL);
  }
  return result;
}

unint64_t EnrollmentAnalyticManager.HAEventKey.init(rawValue:)(unint64_t a1)
{
  return sub_2512974EC(a1);
}

unint64_t sub_251294A38@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_2512974EC(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_251294A6C(uint64_t a1)
{
  if (!a1) {
    return 0xD000000000000016;
  }
  uint64_t result = sub_2512C4BD8();
  __break(1u);
  return result;
}

uint64_t EnrollmentAnalyticManager.HAEventName.init(rawValue:)()
{
  return 0;
}

void *sub_251294AD4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 0;
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

unint64_t EnrollmentAnalyticManager.EnrollmentResult.init(rawValue:)(unint64_t a1)
{
  return sub_2512974FC(a1);
}

unint64_t sub_251294B10@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_2512974FC(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

unint64_t EnrollmentAnalyticManager.HearingLevelClassification.init(rawValue:)(unint64_t a1)
{
  return sub_25129750C(a1);
}

uint64_t sub_251294B64()
{
  return sub_2512C4C48();
}

uint64_t sub_251294BAC()
{
  return sub_2512C4C48();
}

unint64_t sub_251294BF0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_25129750C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_251294C24(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_2512C42B8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v9 = &OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_accessoryPID;
  uint64_t v10 = a2;
  switch(a1)
  {
    case 0:
      break;
    case 1:
      uint64_t v10 = a2 == 1;
      if (a2 == 2) {
        uint64_t v10 = 2;
      }
      objc_super v9 = &OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_agType;
      break;
    case 2:
      if (a2 >= 6) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = a2;
      }
      objc_super v9 = &OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_agCategoryLeft;
      break;
    case 3:
      if (a2 >= 6) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = a2;
      }
      objc_super v9 = &OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_agCategoryRight;
      break;
    case 4:
      unint64_t v11 = sub_2512974FC(a2);
      if (v12) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = v11;
      }
      objc_super v9 = &OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_enrollmentResult;
      break;
    case 5:
      uint64_t v10 = a2 == 1;
      if (a2 == 2) {
        uint64_t v10 = 2;
      }
      objc_super v9 = &OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_enrollmentType;
      break;
    case 6:
      if (a2 >= 3) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = a2;
      }
      objc_super v9 = &OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_entrance;
      break;
    default:
      uint64_t v25 = a1;
LABEL_39:
      sub_2512C4BD8();
      __break(1u);
      JUMPOUT(0x251295064);
  }
  *(void *)(v2 + *v9) = v10;
  if (qword_269B2E2B0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v5, (uint64_t)qword_269B313A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v13, v5);
  unint64_t v14 = sub_2512C4298();
  os_log_type_t v15 = sub_2512C4978();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v25 = v17;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v23 = v17;
    unint64_t v18 = 0x80000002512C6480;
    uint64_t v19 = 0xD000000000000010;
    switch(a1)
    {
      case 0:
        unint64_t v18 = 0xEC00000044495079;
        uint64_t v19 = 0x726F737365636341;
        goto LABEL_35;
      case 1:
        unint64_t v18 = 0xE600000000000000;
        uint64_t v19 = 0x657079544741;
        goto LABEL_35;
      case 2:
        unint64_t v18 = 0xEE007466654C7972;
        goto LABEL_32;
      case 3:
        unint64_t v18 = 0xEF74686769527972;
LABEL_32:
        uint64_t v19 = 0x6F67657461434741;
        goto LABEL_35;
      case 4:
        goto LABEL_35;
      case 5:
        unint64_t v18 = 0xEE0065707954746ELL;
        uint64_t v19 = 0x656D6C6C6F726E45;
        goto LABEL_35;
      case 6:
        unint64_t v18 = 0xE800000000000000;
        uint64_t v19 = 0x65636E6172746E45;
LABEL_35:
        uint64_t v24 = sub_2512955F8(v19, v18, &v25);
        sub_2512C4A68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 12) = 2048;
        uint64_t v24 = a2;
        sub_2512C4A68();
        _os_log_impl(&dword_251285000, v14, v15, "Analytics: Updated key %s with value - %ld", (uint8_t *)v16, 0x16u);
        uint64_t v20 = v23;
        swift_arrayDestroy();
        MEMORY[0x25339B730](v20, -1, -1);
        MEMORY[0x25339B730](v16, -1, -1);
        break;
      default:
        uint64_t v24 = a1;
        goto LABEL_39;
    }
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2512950F8()
{
  id v1 = v0;
  if (qword_269B2E2B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B313A8);
  BOOL v3 = sub_2512C4298();
  os_log_type_t v4 = sub_2512C4978();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    aBlock[0] = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_2512955F8(0xD000000000000016, 0x80000002512CAD60, aBlock);
    sub_2512C4A68();
    _os_log_impl(&dword_251285000, v3, v4, "Analytics: Sending data for %s event", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339B730](v6, -1, -1);
    MEMORY[0x25339B730](v5, -1, -1);
  }

  uint64_t v7 = (void *)sub_2512C47C8();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v1;
  aBlock[4] = (uint64_t)sub_25129751C;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = (uint64_t)sub_251293430;
  aBlock[3] = (uint64_t)&block_descriptor_18;
  objc_super v9 = _Block_copy(aBlock);
  uint64_t v10 = v1;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v9);

  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v10) + 0x140))();
}

void sub_2512953CC()
{
  uint64_t v1 = v0;
  if (qword_269B2E2B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B313A8);
  BOOL v3 = sub_2512C4298();
  os_log_type_t v4 = sub_2512C4978();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_2512955F8(0xD000000000000016, 0x80000002512CAD60, &v7);
    sub_2512C4A68();
    _os_log_impl(&dword_251285000, v3, v4, "Analytics: Reset after Sending data for %s event", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339B730](v6, -1, -1);
    MEMORY[0x25339B730](v5, -1, -1);
  }

  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_accessoryPID) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_agType) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_agCategoryLeft) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_agCategoryRight) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_enrollmentResult) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_enrollmentType) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI25EnrollmentAnalyticManager_entrance) = 1;
}

id EnrollmentAnalyticManager.__deallocating_deinit()
{
  return sub_2512955BC(type metadata accessor for EnrollmentAnalyticManager);
}

id sub_2512955BC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_2512955F8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2512956CC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_251297C70((uint64_t)v12, *a3);
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
      sub_251297C70((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2512956CC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2512C4A78();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_251295888(a5, a6);
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
  uint64_t v8 = sub_2512C4B18();
  if (!v8)
  {
    sub_2512C4B38();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2512C4B98();
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

uint64_t sub_251295888(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_251295920(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_251295B00(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_251295B00(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_251295920(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_251295A98(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2512C4AF8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2512C4B38();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2512C4848();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2512C4B98();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2512C4B38();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_251295A98(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D818);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_251295B00(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D818);
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
  uint64_t result = sub_2512C4B98();
  __break(1u);
  return result;
}

unint64_t sub_251295C50(uint64_t a1, uint64_t a2)
{
  sub_2512C4C28();
  sub_2512C4828();
  uint64_t v4 = sub_2512C4C48();
  return sub_251295CC8(a1, a2, v4);
}

unint64_t sub_251295CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2512C4BC8() & 1) == 0)
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
      while (!v14 && (sub_2512C4BC8() & 1) == 0);
    }
  }
  return v6;
}

void (*sub_251295DAC(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  unint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_251296EB0(v6);
  v6[10] = sub_251296D18(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_251295E58;
}

void sub_251295E58(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

uint64_t sub_251295ECC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D810);
  char v36 = a2;
  uint64_t v6 = sub_2512C4B78();
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
    sub_2512C4C28();
    sub_2512C4828();
    uint64_t result = sub_2512C4C48();
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
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2512961E4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D808);
  char v38 = a2;
  uint64_t v6 = sub_2512C4B78();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_2512C4C28();
    sub_2512C4828();
    uint64_t result = sub_2512C4C48();
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
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_2512964F4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2512C4AD8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2512C4C28();
        swift_bridgeObjectRetain();
        sub_2512C4828();
        uint64_t v9 = sub_2512C4C48();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2512966CC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_251295C50(a2, a3);
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
    sub_2512969AC();
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
  sub_251295ECC(v15, a4 & 1);
  unint64_t v21 = sub_251295C50(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_2512C4C08();
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
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
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

void sub_25129683C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_251295C50(a2, a3);
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
    sub_251296B64();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_2512961E4(v15, a4 & 1);
  unint64_t v20 = sub_251295C50(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_2512C4C08();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v22 = (uint64_t *)(v18[6] + 16 * v12);
  *char v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

void *sub_2512969AC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D810);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2512C4B68();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
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

id sub_251296B64()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D808);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2512C4B68();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

void (*sub_251296D18(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t v5 = v4;
  uint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_251295C50(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *uint64_t v10 = v19;
        return sub_251296E60;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_2512969AC();
      goto LABEL_7;
    }
    sub_251295ECC(v16, a4 & 1);
    unint64_t v20 = sub_251295C50(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  id result = (void (*)(uint64_t **))sub_2512C4C08();
  __break(1u);
  return result;
}

void sub_251296E60(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_251296EEC(*a1, *((unsigned char *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_251296EB0(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  void *v1 = 0x8000000000000000;
  return sub_251296EE0;
}

uint64_t sub_251296EE0(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t *sub_251296EEC(uint64_t *result, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = *result;
  if (*result)
  {
    int64_t v9 = (void *)*a3;
    if (a2)
    {
      *(void *)(v9[7] + 8 * a4) = v8;
    }
    else
    {
      v9[(a4 >> 6) + 8] |= 1 << a4;
      uint64_t v10 = (void *)(v9[6] + 16 * a4);
      *uint64_t v10 = a5;
      v10[1] = a6;
      *(void *)(v9[7] + 8 * a4) = v8;
      uint64_t v11 = v9[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12)
      {
        __break(1u);
        return result;
      }
      v9[2] = v13;
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_2512964F4(a4, *a3);
  }
  return (uint64_t *)swift_bridgeObjectRetain();
}

unint64_t sub_251296FC4(unint64_t result)
{
  if (result > 0xE) {
    return 0;
  }
  return result;
}

uint64_t sub_251296FD4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_25129700C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D780);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2512C6450;
  strcpy((char *)(inited + 32), "AccessoryPID");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  uint64_t v1 = (void *)sub_2512C4138();
  objc_msgSend(v1, sel_productID);

  *(void *)(inited + 48) = sub_2512C4C58();
  *(void *)(inited + 56) = 0xD000000000000014;
  *(void *)(inited + 64) = 0x80000002512CAD20;
  uint64_t v2 = (void *)sub_2512C4148();
  sub_2512C4208();

  *(void *)(inited + 72) = sub_2512C4BF8();
  *(void *)(inited + 80) = 0xD000000000000015;
  *(void *)(inited + 88) = 0x80000002512CAD00;
  uint64_t v3 = (void *)sub_2512C4148();
  sub_2512C41C8();

  *(void *)(inited + 96) = sub_2512C48D8();
  *(void *)(inited + 104) = 0xD000000000000015;
  *(void *)(inited + 112) = 0x80000002512CACE0;
  uint64_t v4 = (void *)sub_2512C4148();
  sub_2512C41D8();

  *(void *)(inited + 120) = sub_2512C48D8();
  *(void *)(inited + 128) = 0xD000000000000011;
  *(void *)(inited + 136) = 0x80000002512CACC0;
  uint64_t v5 = (void *)sub_2512C4148();
  sub_2512C4228();

  *(void *)(inited + 144) = sub_2512C4C18();
  *(void *)(inited + 152) = 0xD000000000000014;
  *(void *)(inited + 160) = 0x80000002512CAC80;
  uint64_t v6 = (void *)sub_2512C4148();
  sub_2512C4218();

  *(void *)(inited + 168) = sub_2512C48D8();
  *(void *)(inited + 176) = 0xD000000000000026;
  *(void *)(inited + 184) = 0x80000002512CAC50;
  unint64_t v7 = (void *)sub_2512C4148();
  sub_2512C41E8();

  *(void *)(inited + 192) = sub_2512C4948();
  *(void *)(inited + 200) = 0xD00000000000001ELL;
  *(void *)(inited + 208) = 0x80000002512CAC30;
  uint64_t v8 = (void *)sub_2512C4148();
  sub_2512C41A8();

  *(void *)(inited + 216) = sub_2512C4948();
  *(void *)(inited + 224) = 0xD000000000000018;
  *(void *)(inited + 232) = 0x80000002512CAC10;
  int64_t v9 = (void *)sub_2512C4148();
  sub_2512C4258();

  *(void *)(inited + 240) = sub_2512C4948();
  *(void *)(inited + 248) = 0xD000000000000022;
  *(void *)(inited + 256) = 0x80000002512CABE0;
  uint64_t v10 = (void *)sub_2512C4148();
  sub_2512C4198();

  *(void *)(inited + 264) = sub_2512C48D8();
  *(void *)(inited + 272) = 0xD000000000000023;
  *(void *)(inited + 280) = 0x80000002512CABB0;
  uint64_t v11 = (void *)sub_2512C4148();
  sub_2512C41F8();

  *(void *)(inited + 288) = sub_2512C48D8();
  *(void *)(inited + 296) = 0xD000000000000015;
  *(void *)(inited + 304) = 0x80000002512CAB90;
  BOOL v12 = (void *)sub_2512C4148();
  sub_2512C4248();

  *(void *)(inited + 312) = sub_2512C4948();
  return sub_251293314(inited);
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

unint64_t sub_251297388()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D780);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2512C6460;
  strcpy((char *)(inited + 32), "AccessoryPID");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  uint64_t v1 = (void *)sub_2512C4138();
  objc_msgSend(v1, sel_productID);

  *(void *)(inited + 48) = sub_2512C4C58();
  *(void *)(inited + 56) = 0xD000000000000011;
  *(void *)(inited + 64) = 0x80000002512CACA0;
  uint64_t v2 = (void *)sub_2512C4148();
  sub_2512C4238();

  *(void *)(inited + 72) = sub_2512C4C18();
  return sub_251293314(inited);
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

uint64_t sub_2512974AC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2512974E4()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_2512974EC(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

unint64_t sub_2512974FC(unint64_t result)
{
  if (result > 0xC) {
    return 0;
  }
  return result;
}

unint64_t sub_25129750C(unint64_t result)
{
  if (result > 5) {
    return 0;
  }
  return result;
}

unint64_t sub_25129751C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D780);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2512C6470;
  strcpy((char *)(inited + 32), "AccessoryPID");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 48) = sub_2512C4968();
  *(void *)(inited + 56) = 0x657079544741;
  *(void *)(inited + 64) = 0xE600000000000000;
  *(void *)(inited + 72) = sub_2512C4968();
  strcpy((char *)(inited + 80), "AGCategoryLeft");
  *(unsigned char *)(inited + 95) = -18;
  *(void *)(inited + 96) = sub_2512C4968();
  *(void *)(inited + 104) = 0x6F67657461434741;
  *(void *)(inited + 112) = 0xEF74686769527972;
  *(void *)(inited + 120) = sub_2512C4968();
  *(void *)(inited + 128) = 0xD000000000000010;
  *(void *)(inited + 136) = 0x80000002512C6480;
  *(void *)(inited + 144) = sub_2512C4968();
  strcpy((char *)(inited + 152), "EnrollmentType");
  *(unsigned char *)(inited + 167) = -18;
  *(void *)(inited + 168) = sub_2512C4968();
  *(void *)(inited + 176) = 0x65636E6172746E45;
  *(void *)(inited + 184) = 0xE800000000000000;
  *(void *)(inited + 192) = sub_2512C4968();
  return sub_251293314(inited);
}

uint64_t type metadata accessor for EnrollmentAnalyticManager()
{
  return self;
}

unint64_t sub_2512976F0()
{
  unint64_t result = qword_269B2D7C0;
  if (!qword_269B2D7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2D7C0);
  }
  return result;
}

unint64_t sub_251297748()
{
  unint64_t result = qword_269B2D7C8;
  if (!qword_269B2D7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2D7C8);
  }
  return result;
}

unint64_t sub_2512977A0()
{
  unint64_t result = qword_269B2D7D0;
  if (!qword_269B2D7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2D7D0);
  }
  return result;
}

unint64_t sub_2512977F8()
{
  unint64_t result = qword_269B2D7D8;
  if (!qword_269B2D7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2D7D8);
  }
  return result;
}

unint64_t sub_251297850()
{
  unint64_t result = qword_269B2D7E0;
  if (!qword_269B2D7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2D7E0);
  }
  return result;
}

unint64_t sub_2512978A8()
{
  unint64_t result = qword_269B2D7E8;
  if (!qword_269B2D7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2D7E8);
  }
  return result;
}

unint64_t sub_251297900()
{
  unint64_t result = qword_269B2D7F0;
  if (!qword_269B2D7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2D7F0);
  }
  return result;
}

unint64_t sub_251297958()
{
  unint64_t result = qword_269B2D7F8;
  if (!qword_269B2D7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2D7F8);
  }
  return result;
}

unint64_t sub_2512979B0()
{
  unint64_t result = qword_269B2D800;
  if (!qword_269B2D800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2D800);
  }
  return result;
}

uint64_t method lookup function for HMAnalyticManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HMAnalyticManager);
}

uint64_t dispatch thunk of HMAnalyticManager.__allocating_init(hpDevice:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of HMAnalyticManager.sendHASettingsEvent()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of HMAnalyticManager.sendHPSettingsEvent()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of HMAnalyticManager.addCustomEvent(eventName:key:value:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of HMAnalyticManager.sendCustomEvent()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

ValueMetadata *type metadata accessor for HMAnalyticManager.EventName()
{
  return &type metadata for HMAnalyticManager.EventName;
}

ValueMetadata *type metadata accessor for HMAnalyticManager.EventKey()
{
  return &type metadata for HMAnalyticManager.EventKey;
}

uint64_t method lookup function for EnrollmentAnalyticManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for EnrollmentAnalyticManager);
}

uint64_t dispatch thunk of EnrollmentAnalyticManager.updateKey(key:value:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of EnrollmentAnalyticManager.submitEvent()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

ValueMetadata *type metadata accessor for EnrollmentAnalyticManager.Entrance()
{
  return &type metadata for EnrollmentAnalyticManager.Entrance;
}

ValueMetadata *type metadata accessor for EnrollmentAnalyticManager.EnrollmentType()
{
  return &type metadata for EnrollmentAnalyticManager.EnrollmentType;
}

ValueMetadata *type metadata accessor for EnrollmentAnalyticManager.HAEventKey()
{
  return &type metadata for EnrollmentAnalyticManager.HAEventKey;
}

ValueMetadata *type metadata accessor for EnrollmentAnalyticManager.HAEventName()
{
  return &type metadata for EnrollmentAnalyticManager.HAEventName;
}

ValueMetadata *type metadata accessor for EnrollmentAnalyticManager.AudiogramType()
{
  return &type metadata for EnrollmentAnalyticManager.AudiogramType;
}

ValueMetadata *type metadata accessor for EnrollmentAnalyticManager.EnrollmentResult()
{
  return &type metadata for EnrollmentAnalyticManager.EnrollmentResult;
}

ValueMetadata *type metadata accessor for EnrollmentAnalyticManager.HearingLevelClassification()
{
  return &type metadata for EnrollmentAnalyticManager.HearingLevelClassification;
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

uint64_t sub_251297C70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_251297CD0()
{
  unint64_t result = qword_269B2D820;
  if (!qword_269B2D820)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B2D820);
  }
  return result;
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

void sub_251297D74()
{
}

uint64_t sub_251297DC4()
{
  uint64_t v0 = sub_2512C42B8();
  __swift_allocate_value_buffer(v0, qword_269B313C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B313C0);
  return sub_2512C42A8();
}

uint64_t sub_251297E48()
{
  if (qword_269B2F050 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2512C42B8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B313C0);
}

uint64_t sub_251297EAC@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B2F050 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B313C0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_251297F54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_url;
  uint64_t v4 = sub_2512C3E98();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

double sub_251297FC8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_desiredBounds;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_251298014(double a1, double a2, double a3, double a4)
{
  int64_t v9 = (double *)(v4 + OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_desiredBounds);
  uint64_t result = swift_beginAccess();
  *int64_t v9 = a1;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = a4;
  return result;
}

uint64_t (*sub_251298080())()
{
  return j_j__swift_endAccess;
}

id sub_2512980DC()
{
  id v0 = objc_msgSend(self, sel_playerLayerWithPlayer_, 0);
  objc_msgSend(v0, sel_setOpacity_, 0.0);
  return v0;
}

id sub_251298134()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFA860]), sel_init);
  objc_msgSend(v0, sel_setMuted_, 1);
  objc_msgSend(v0, sel_setAllowsExternalPlayback_, 0);
  return v0;
}

id sub_251298194()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_videoPlayer);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_2512981EC(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_videoPlayer);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = a1;
}

uint64_t (*sub_251298240())()
{
  return j__swift_endAccess;
}

char *sub_25129829C(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  id v19 = objc_allocWithZone(v9);
  return sub_251298330(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

char *sub_251298330(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  uint64_t v10 = v9;
  v63[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v20 = OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_playerLayer;
  char v21 = self;
  int64_t v22 = v10;
  id v23 = objc_msgSend(v21, sel_playerLayerWithPlayer_, 0);
  objc_msgSend(v23, sel_setOpacity_, 0.0);
  *(void *)&v10[v20] = v23;
  int64_t v24 = &v22[OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_videoPlayer];
  id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFA860]), sel_init);
  objc_msgSend(v25, sel_setMuted_, 1);
  objc_msgSend(v25, sel_setAllowsExternalPlayback_, 0);
  *(void *)int64_t v24 = v25;
  uint64_t v26 = &v22[OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_url];
  uint64_t v27 = sub_2512C3E98();
  uint64_t v28 = *(void *)(v27 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v26, a1, v27);
  uint64_t v29 = (double *)&v22[OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_desiredBounds];
  double *v29 = a6;
  v29[1] = a7;
  v29[2] = a8;
  v29[3] = a9;
  id v30 = objc_msgSend(self, sel_sharedInstance);
  uint64_t v31 = *MEMORY[0x263EF9048];
  v63[0] = 0;
  unsigned int v32 = objc_msgSend(v30, sel_setCategory_withOptions_error_, v31, 1, v63);

  if (v32)
  {
    uint64_t v33 = qword_269B2F050;
    id v34 = v63[0];
    if (v33 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_2512C42B8();
    __swift_project_value_buffer(v35, (uint64_t)qword_269B313C0);
    int64_t v36 = sub_2512C4298();
    os_log_type_t v37 = sub_2512C4988();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v60 = v27;
      uint64_t v38 = v20;
      uint64_t v39 = a1;
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_251285000, v36, v37, "Unable to set AVAudioSession category for HMSUIMovieLoopPlayer", v40, 2u);
      unint64_t v41 = v40;
      a1 = v39;
      uint64_t v20 = v38;
      uint64_t v27 = v60;
      MEMORY[0x25339B730](v41, -1, -1);
    }
  }
  else
  {
    id v42 = v63[0];
    uint64_t v43 = (void *)sub_2512C3E58();

    swift_willThrow();
  }
  uint64_t v44 = *(void **)&v10[v20];
  swift_beginAccess();
  objc_msgSend(v44, sel_setPlayer_, *(void *)v24);
  uint64_t v45 = *(void **)v24;
  id v46 = objc_allocWithZone(MEMORY[0x263EFA800]);
  id v47 = v45;
  v48 = (void *)sub_2512C3E68();
  id v49 = objc_msgSend(v46, sel_initWithURL_, v48);

  id v50 = objc_msgSend(self, sel_playerLooperWithPlayer_templateItem_, v47, v49);
  *(void *)&v22[OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_playerLooper] = v50;

  v62.receiver = v22;
  v62.super_class = (Class)type metadata accessor for HMSUIMovieLoopPLayer(0);
  v51 = (char *)objc_msgSendSuper2(&v62, sel_initWithFrame_, a2, a3, a4, a5);
  v52 = (void **)&v51[OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_videoPlayer];
  swift_beginAccess();
  v53 = *v52;
  uint64_t v54 = MEMORY[0x263F010E0];
  uint64_t v55 = *MEMORY[0x263F010E0];
  uint64_t v56 = *(void *)(MEMORY[0x263F010E0] + 16);
  v57 = v51;
  v61[0] = v55;
  v61[1] = *(void *)(v54 + 8);
  v61[2] = v56;
  objc_msgSend(v53, sel_seekToTime_, v61);
  id v58 = objc_msgSend(v57, sel_layer);
  objc_msgSend(v58, sel_addSublayer_, *(void *)&v57[OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_playerLayer]);

  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *(void *)v57) + 0xF0))();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(a1, v27);
  return v57;
}

uint64_t type metadata accessor for HMSUIMovieLoopPLayer(uint64_t a1)
{
  return sub_251299CE8(a1, (uint64_t *)&unk_269B2F200);
}

uint64_t sub_251298884()
{
  return sub_25129A74C(0, &qword_269B2D828);
}

void sub_2512988B0()
{
  uint64_t v1 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0);
  uint64_t v2 = (void *)v1();
  uint64_t v3 = *(void *)(MEMORY[0x263F010E0] + 16);
  v6[0] = *MEMORY[0x263F010E0];
  v6[1] = *(void *)(MEMORY[0x263F010E0] + 8);
  v6[2] = v3;
  objc_msgSend(v2, sel_seekToTime_, v6);

  uint64_t v4 = (void *)v1();
  LODWORD(v5) = 1.0;
  objc_msgSend(v4, sel_playImmediatelyAtRate_, v5);
}

void sub_25129896C()
{
  uint64_t v1 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0);
  uint64_t v2 = (void *)v1();
  id v3 = objc_msgSend(v2, sel_timeControlStatus);

  if (v3 == (id)2)
  {
    id v4 = (id)v1();
    objc_msgSend(v4, sel_pause);
  }
}

id sub_251298A3C()
{
  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for HMSUIMovieLoopPLayer(0);
  objc_msgSendSuper2(&v14, sel_layoutSubviews);
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_playerLayer;
  uint64_t v2 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78);
  id v3 = *(id *)((char *)v0 + OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_playerLayer);
  v2();
  objc_msgSend(v3, sel_setBounds_);

  id v4 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v4, sel_setMasksToBounds_, 0);

  id v5 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v5, sel_setCornerRadius_, 0.0);

  id v6 = *(id *)((char *)v0 + v1);
  id v7 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v7, sel_bounds);
  double v9 = v8;

  id v10 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v10, sel_bounds);
  double v12 = v11;

  CGPointMake(v9 * 0.5, v12 * 0.5);
  objc_msgSend(v6, sel_setPosition_);

  return objc_msgSend(*(id *)((char *)v0 + v1), sel_setVideoGravity_, *MEMORY[0x263EF9C78]);
}

void sub_251298C40()
{
  uint64_t v1 = self;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  v5[4] = sub_251299B98;
  v5[5] = v2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_251298D30;
  v5[3] = &block_descriptor_0;
  id v3 = _Block_copy(v5);
  id v4 = v0;
  swift_release();
  objc_msgSend(v1, sel_animateWithDuration_animations_, v3, 0.15);
  _Block_release(v3);
}

uint64_t sub_251298D30(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_251298DA0(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void sub_251298E04()
{
}

id sub_251298E64()
{
  return sub_251299AC0(type metadata accessor for HMSUIMovieLoopPLayer);
}

double sub_251298F1C()
{
  id v0 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v0, sel_userInterfaceIdiom);

  return 0.0;
}

uint64_t sub_251298FAC@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2512C3E98();
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D830);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  double v12 = (char *)&v25 - v11;
  type metadata accessor for HearingFitNoiseVideoLoopPlayer(0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v14 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  if ((a1 & 1) == 0)
  {
    BOOL v15 = (void *)sub_2512C47C8();
    uint64_t v16 = (void *)sub_2512C47C8();
    id v10 = (char *)objc_msgSend(v14, sel_URLForResource_withExtension_, v15, v16);

    if (v10)
    {
      sub_2512C3E78();

      id v10 = (char *)(v5 + 32);
      char v17 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v17(v12, v7, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v12, 0, 1, v4);
      uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
      v5 += 48;
      if (v18(v12, 1, v4) != 1)
      {

        return ((uint64_t (*)(uint64_t, char *, uint64_t))v17)(a2, v12, v4);
      }
    }
    else
    {
      int64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
      v5 += 56;
      v24(v12, 1, 1, v4);
    }
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v20 = (void *)sub_2512C47C8();
  char v21 = (void *)sub_2512C47C8();
  id v22 = objc_msgSend(v14, sel_URLForResource_withExtension_, v20, v21);

  if (!v22)
  {
LABEL_11:
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
    goto LABEL_12;
  }
  sub_2512C3E78();

  id v23 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v23(v10, v7, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4);
  if (result == 1)
  {
LABEL_12:
    __break(1u);
    return result;
  }

  return ((uint64_t (*)(uint64_t, char *, uint64_t))v23)(a2, v10, v4);
}

uint64_t sub_251299350(uint64_t a1)
{
  if (a1 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_251299368(char a1)
{
  return a1 & 1;
}

BOOL sub_251299370(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_251299388()
{
  return sub_2512C4C48();
}

uint64_t sub_2512993D0()
{
  return sub_2512C4C38();
}

uint64_t sub_2512993FC()
{
  return sub_2512C4C48();
}

void *sub_251299440@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_251299460(void *a1@<X8>)
{
  *a1 = *v1;
}

id sub_25129946C()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F82908]);
  return objc_msgSend(v0, sel_init);
}

id sub_2512994A4()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_videoContainerLayoutGuide));
}

uint64_t sub_2512994B4()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_videoUseCase);
}

void sub_2512994C4(char a1, double a2, double a3, double a4, double a5)
{
  char v10 = a1 & 1;
  id v11 = objc_allocWithZone(v5);
  sub_251299D20(v10, a2, a3, a4, a5);
}

void sub_251299528(char a1, double a2, double a3, double a4, double a5)
{
}

void sub_251299530()
{
  int v1 = *((unsigned __int8 *)v0 + OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_videoUseCase);
  objc_msgSend(v0, sel_bounds);
  double v3 = v2;
  double v5 = v4;
  id v6 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v6, sel_userInterfaceIdiom);

  if (v1) {
    v7.n128_f64[0] = v3 * 1.071;
  }
  else {
    v7.n128_f64[0] = v5 * 1.682;
  }
  uint64_t v8 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(double, double, __n128, double))((*MEMORY[0x263F8EED0] & *v0) + 0x80))(0.0, 0.0, v7, v5);
  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for HearingFitNoiseVideoLoopPlayer(0);
  objc_msgSendSuper2(&v14, sel_layoutSubviews);
  uint64_t v9 = *(void **)((char *)v0 + OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_heightConstraint);
  if (v9)
  {
    char v10 = *(double (**)(void))((*v8 & *v0) + 0x78);
    id v11 = v9;
    v15.origin.x = v10();
    objc_msgSend(v11, sel_setConstant_, CGRectGetHeight(v15));

    double v12 = *(void **)((char *)v0 + OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_widthConstraint);
    if (v12)
    {
      id v13 = v12;
      v16.origin.x = v10();
      objc_msgSend(v13, sel_setConstant_, CGRectGetWidth(v16) * 0.44);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_251299730(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_251299774()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_videoContainerLayoutGuide;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82908]), sel_init);
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_heightConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_widthConstraint] = 0;

  sub_2512C4B48();
  __break(1u);
}

void sub_2512998CC(uint64_t a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for HearingFitNoiseVideoLoopPlayer(0);
  objc_msgSendSuper2(&v6, sel_traitCollectionDidChange_, a1);
  id v3 = objc_msgSend(v1, sel_traitCollection);
  objc_msgSend(v3, sel_userInterfaceStyle);

  sub_25129A130();
  id v4 = *(id *)&v1[OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_playerLayer];
  double v5 = (void *)sub_2512C4868();
  objc_msgSend(v4, sel_setFilters_, v5);
  swift_bridgeObjectRelease();
}

void sub_251299A28()
{
}

void sub_251299A58()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_widthConstraint);
}

id sub_251299AA8()
{
  return sub_251299AC0(type metadata accessor for HearingFitNoiseVideoLoopPlayer);
}

id sub_251299AC0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_251299B60()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_251299B98(double a1)
{
  LODWORD(a1) = 1.0;
  return objc_msgSend(*(id *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_playerLayer), sel_setOpacity_, a1);
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

void sub_251299BD0()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_playerLayer;
  id v2 = objc_msgSend(self, sel_playerLayerWithPlayer_, 0);
  objc_msgSend(v2, sel_setOpacity_, 0.0);
  *(void *)&v0[v1] = v2;
  uint64_t v3 = OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_videoPlayer;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFA860]), sel_init);
  objc_msgSend(v4, sel_setMuted_, 1);
  objc_msgSend(v4, sel_setAllowsExternalPlayback_, 0);
  *(void *)&v0[v3] = v4;

  sub_2512C4B48();
  __break(1u);
}

uint64_t type metadata accessor for HearingFitNoiseVideoLoopPlayer(uint64_t a1)
{
  return sub_251299CE8(a1, (uint64_t *)&unk_269B2F210);
}

uint64_t sub_251299CE8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_251299D20(char a1, double a2, double a3, double a4, double a5)
{
  char v10 = a1 & 1;
  uint64_t v11 = sub_2512C3E98();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  CGRect v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  char v17 = (char *)&v47 - v16;
  uint64_t v18 = OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_videoContainerLayoutGuide;
  id v19 = objc_allocWithZone(MEMORY[0x263F82908]);
  uint64_t v20 = v5;
  *(void *)&v5[v18] = objc_msgSend(v19, sel_init);
  *(void *)&v20[OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_heightConstraint] = 0;
  *(void *)&v20[OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_widthConstraint] = 0;
  sub_251298FAC(v10, (uint64_t)v17);
  v20[OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_videoUseCase] = v10;

  id v47 = v17;
  uint64_t v48 = v12;
  char v21 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  uint64_t v49 = v11;
  v21(v15, v17, v11);
  id v22 = sub_251298330((uint64_t)v15, 0.0, 0.0, 0.0, 0.0, a2, a3, a4, a5);
  uint64_t v23 = OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_videoContainerLayoutGuide;
  int64_t v24 = *(void **)&v22[OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_videoContainerLayoutGuide];
  uint64_t v25 = v22;
  objc_msgSend(v25, sel_addLayoutGuide_, v24);
  id v26 = objc_msgSend(v24, sel_heightAnchor);
  id v27 = objc_msgSend(v26, sel_constraintEqualToConstant_, 0.0);

  uint64_t v28 = OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_heightConstraint;
  uint64_t v29 = *(void **)&v25[OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_heightConstraint];
  *(void *)&v25[OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_heightConstraint] = v27;

  id v30 = objc_msgSend(*(id *)&v22[v23], sel_widthAnchor);
  id v31 = objc_msgSend(v30, sel_constraintEqualToConstant_, 0.0);

  uint64_t v32 = OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_widthConstraint;
  uint64_t v33 = *(void **)&v25[OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_widthConstraint];
  *(void *)&v25[OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_widthConstraint] = v31;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2D900);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_2512C6B50;
  id v35 = objc_msgSend(v25, sel_centerXAnchor);
  id v36 = objc_msgSend(*(id *)&v22[v23], sel_centerXAnchor);
  id v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

  *(void *)(v34 + 32) = v37;
  id v38 = objc_msgSend(v25, sel_centerYAnchor);
  id v39 = objc_msgSend(*(id *)&v22[v23], sel_centerYAnchor);
  id v40 = objc_msgSend(v38, sel_constraintEqualToAnchor_, v39);

  *(void *)(v34 + 40) = v40;
  unint64_t v41 = *(void **)&v25[v28];
  if (v41)
  {
    *(void *)(v34 + 48) = v41;
    id v42 = *(void **)&v25[v32];
    if (v42)
    {
      uint64_t v43 = self;
      *(void *)(v34 + 56) = v42;
      uint64_t v50 = v34;
      sub_2512C4898();
      sub_25129A74C(0, &qword_269B2D858);
      id v44 = v41;
      id v45 = v42;
      id v46 = (void *)sub_2512C4868();
      swift_bridgeObjectRelease();
      objc_msgSend(v43, sel_activateConstraints_, v46);

      (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v49);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_25129A130()
{
  sub_2512C47F8();
  id v0 = objc_allocWithZone(MEMORY[0x263F157C8]);
  uint64_t v1 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithType_, v1);

  sub_2512C47F8();
  id v3 = objc_allocWithZone(MEMORY[0x263F157C8]);
  id v4 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel_initWithType_, v4);

  uint64_t v6 = MEMORY[0x263F15720];
  int v7 = *(_DWORD *)(MEMORY[0x263F15720] + 20);
  int v8 = *(_DWORD *)(MEMORY[0x263F15720] + 44);
  int v9 = *(_DWORD *)(MEMORY[0x263F15720] + 76);
  char v10 = self;
  int v18 = 1066695393;
  long long v19 = *(_OWORD *)(v6 + 4);
  int v20 = v7;
  int v21 = 1066695393;
  long long v22 = *(_OWORD *)(v6 + 28);
  int v23 = v8;
  int v24 = 1066695393;
  long long v25 = *(_OWORD *)(v6 + 52);
  uint64_t v26 = *(void *)(v6 + 68);
  int v27 = v9;
  id v11 = objc_msgSend(v10, sel_valueWithCAColorMatrix_, &v18);
  uint64_t v12 = (void *)sub_2512C47C8();
  objc_msgSend(v2, sel_setValue_forKey_, v11, v12);

  uint64_t v13 = (void *)sub_2512C4948();
  uint64_t v14 = (void *)sub_2512C47C8();
  objc_msgSend(v5, sel_setValue_forKey_, v13, v14);

  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D848);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_2512C6460;
  uint64_t v16 = sub_25129A74C(0, &qword_269B2D850);
  *(void *)(v15 + 32) = v2;
  *(void *)(v15 + 88) = v16;
  *(void *)(v15 + 56) = v16;
  *(void *)(v15 + 64) = v5;
  return v15;
}

unint64_t sub_25129A388()
{
  unint64_t result = qword_269B2D838;
  if (!qword_269B2D838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2D838);
  }
  return result;
}

uint64_t sub_25129A3DC()
{
  return type metadata accessor for HMSUIMovieLoopPLayer(0);
}

uint64_t sub_25129A3E4()
{
  uint64_t result = sub_2512C3E98();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25129A490()
{
  return type metadata accessor for HearingFitNoiseVideoLoopPlayer(0);
}

uint64_t sub_25129A498()
{
  return swift_updateClassMetadata2();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HearingFitNoiseVideoLoopPlayer.VideoUseCase(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HearingFitNoiseVideoLoopPlayer.VideoUseCase(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25129A660);
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

uint64_t sub_25129A688(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25129A690(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HearingFitNoiseVideoLoopPlayer.VideoUseCase()
{
  return &type metadata for HearingFitNoiseVideoLoopPlayer.VideoUseCase;
}

uint64_t initializeBufferWithCopyOfBuffer for AnyBindable(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_25129A6EC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25129A70C(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_25129A74C(uint64_t a1, unint64_t *a2)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_25129A794(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25129A7B4(uint64_t result, int a2, int a3)
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

void sub_25129A804(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25129A858()
{
  uint64_t v0 = sub_2512C42B8();
  __swift_allocate_value_buffer(v0, qword_269B31400);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B31400);
  return sub_2512C42A8();
}

uint64_t sub_25129A8E0()
{
  if (qword_269B2F220 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2512C42B8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B31400);
}

uint64_t sub_25129A944@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B2F220 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B31400);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_25129A9EC()
{
  return 0;
}

uint64_t sub_25129A9F8()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25129AA28(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_25129AA60())()
{
  return CGPointMake;
}

uint64_t sub_25129AA80()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25129AAB0(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_25129AAE8())()
{
  return CGPointMake;
}

double sub_25129AB08@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_25129AB14@<X0>(uint64_t a1@<X8>)
{
  return sub_25129AB20(v1 + 32, a1);
}

uint64_t sub_25129AB20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DBD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25129AB88(uint64_t a1)
{
  return sub_25129AB90(a1, v1 + 32);
}

uint64_t sub_25129AB90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DBD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_25129ABF8())()
{
  return CGPointMake;
}

uint64_t sub_25129AC18()
{
  return *(void *)(v0 + 64);
}

uint64_t sub_25129AC20(uint64_t result)
{
  *(void *)(v1 + 64) = result;
  return result;
}

uint64_t (*sub_25129AC28())()
{
  return CGPointMake;
}

uint64_t sub_25129AC48()
{
  return *(void *)(v0 + 72);
}

uint64_t sub_25129AC50(uint64_t result)
{
  *(void *)(v1 + 72) = result;
  return result;
}

uint64_t (*sub_25129AC58())()
{
  return CGPointMake;
}

uint64_t sub_25129AC78()
{
  return *(void *)(v0 + 80);
}

uint64_t sub_25129AC80(uint64_t result)
{
  *(void *)(v1 + 80) = result;
  return result;
}

uint64_t (*sub_25129AC88())()
{
  return CGPointMake;
}

uint64_t sub_25129ACA8()
{
  return *(void *)(v0 + 88);
}

uint64_t sub_25129ACB0(uint64_t result)
{
  *(void *)(v1 + 88) = result;
  return result;
}

uint64_t (*sub_25129ACB8())()
{
  return CGPointMake;
}

uint64_t sub_25129ACD8()
{
  return 0;
}

uint64_t sub_25129ACE0()
{
  return *(unsigned __int8 *)(v0 + 96);
}

uint64_t sub_25129ACE8(uint64_t result)
{
  *(unsigned char *)(v1 + 96) = result;
  return result;
}

uint64_t (*sub_25129ACF0())()
{
  return CGPointMake;
}

uint64_t sub_25129AD10()
{
  return *(void *)(v0 + 104);
}

uint64_t sub_25129AD18(uint64_t result)
{
  *(void *)(v1 + 104) = result;
  return result;
}

uint64_t (*sub_25129AD20())()
{
  return CGPointMake;
}

uint64_t sub_25129AD40()
{
  uint64_t v1 = *(void *)(v0 + 112);
  sub_25129AE8C(v1);
  return v1;
}

uint64_t sub_25129AD74(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_25129AED4(*(void *)(v2 + 112));
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;
  return result;
}

uint64_t (*sub_25129ADAC())()
{
  return CGPointMake;
}

uint64_t sub_25129ADCC()
{
  uint64_t v1 = *(void *)(v0 + 128);
  sub_25129AE8C(v1);
  return v1;
}

uint64_t sub_25129AE00(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_25129AED4(*(void *)(v2 + 128));
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return result;
}

uint64_t (*sub_25129AE38())()
{
  return CGPointMake;
}

uint64_t sub_25129AE58()
{
  uint64_t v1 = *(void *)(v0 + 144);
  sub_25129AE8C(v1);
  return v1;
}

uint64_t sub_25129AE8C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_25129AE9C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_25129AED4(*(void *)(v2 + 144));
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 152) = a2;
  return result;
}

uint64_t sub_25129AED4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*sub_25129AEE4())()
{
  return CGPointMake;
}

__n128 sub_25129AF04@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11, long long a12, long long a13, __n128 a14, uint64_t a15)
{
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  sub_25129AFB0(a5, a9 + 32);
  *(void *)(a9 + 64) = a6;
  *(void *)(a9 + 72) = a7;
  *(void *)(a9 + 80) = a8;
  *(void *)(a9 + 88) = a10;
  *(unsigned char *)(a9 + 96) = a11;
  *(_OWORD *)(a9 + 104) = a12;
  *(_OWORD *)(a9 + 120) = a13;
  __n128 result = a14;
  *(__n128 *)(a9 + 136) = a14;
  *(void *)(a9 + 152) = a15;
  return result;
}

uint64_t sub_25129AFB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DBD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25129B018()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25129B024()
{
  return 0;
}

uint64_t sub_25129B030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  sub_25129B098(a1, a2, a3, a4);
  return v8;
}

void sub_25129B098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = MEMORY[0x263F8EE78];
  if (a2)
  {
    unsigned int v6 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    if (a4)
    {
LABEL_3:
      BOOL v7 = (void *)sub_2512C47C8();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v6 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  BOOL v7 = 0;
LABEL_6:
  id v8 = objc_msgSend(self, sel_groupSpecifierWithID_name_, v6, v7);

  if (v8)
  {
    *(void *)(v4 + 16) = v8;
    swift_beginAccess();
    id v9 = v8;
    MEMORY[0x25339AAC0]();
    if (*(void *)((*(void *)(v4 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v4 + 24) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_2512C48A8();
    sub_2512C48C8();
    sub_2512C4898();
    swift_endAccess();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25129B1D0(void (*a1)(void))
{
  a1(*(void *)(v1 + 16));
  return swift_retain();
}

uint64_t sub_25129B218()
{
  uint64_t v1 = *(void *)(*v0 + 88);
  uint64_t v2 = *(void *)(*v0 + 80);
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v2, v1);
  if (v3)
  {
    uint64_t v4 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v1 + 24))(v18, v2, v1);
  uint64_t v5 = v19;
  if (v19)
  {
    unsigned int v6 = __swift_project_boxed_opaque_existential_0(v18, v19);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x270FA5388](v6);
    id v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = sub_2512C4BB8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 40))(v2, v1);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 32))(v2, v1);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v1 + 72))(v2, v1)) {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  }
  else {
    uint64_t ObjCClassFromMetadata = 0;
  }
  uint64_t v14 = self;
  id v15 = objc_msgSend(v14, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v4, v10, v11, v12, ObjCClassFromMetadata, (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 48))(v2, v1), 0);

  uint64_t result = swift_unknownObjectRelease();
  if (v15)
  {
    swift_beginAccess();
    id v17 = v15;
    MEMORY[0x25339AAC0]();
    if (*(void *)((v0[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v0[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2512C48A8();
    }
    sub_2512C48C8();
    sub_2512C4898();
    swift_endAccess();

    return swift_retain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_25129B570(uint64_t a1)
{
  sub_251297C70(a1, (uint64_t)v5);
  sub_25129A74C(0, &qword_269B2D870);
  if (swift_dynamicCast())
  {
    swift_beginAccess();
    id v2 = v4;
    MEMORY[0x25339AAC0]();
    if (*(void *)((*(void *)(v1 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 24) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_2512C48A8();
    sub_2512C48C8();
    sub_2512C4898();
    swift_endAccess();
  }
  return swift_retain();
}

uint64_t sub_25129B65C()
{
  uint64_t v1 = v0;
  id v2 = *(uint64_t (***)(void, void))(*(void *)v0 + 88);
  uint64_t v3 = *(void *)(*(void *)v0 + 80);
  uint64_t v4 = v2[2](v3, v2);
  uint64_t v22 = v5;
  uint64_t v23 = v4;
  uint64_t v6 = v2[11](v3, v2);
  uint64_t v8 = v7;
  uint64_t v9 = v2[10](v3, v2);
  uint64_t v11 = v10;
  uint64_t v12 = v2[9](v3, v2);
  uint64_t v13 = v2[6](v3, v2);
  uint64_t v14 = v2[12](v3, v2);
  uint64_t v16 = v15;
  id v17 = objc_allocWithZone((Class)type metadata accessor for HeadphoneSpecifier());
  HeadphoneSpecifier.init(name:setAction:getAction:detail:cell:edit:buttonAction:)(v23, v22, v6, v8, v9, v11, v12, v13, 0, v14, v16);
  uint64_t v19 = v18;
  swift_beginAccess();
  id v20 = v19;
  MEMORY[0x25339AAC0]();
  if (*(void *)((*(void *)(v1 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 24) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_2512C48A8();
  sub_2512C48C8();
  sub_2512C4898();
  swift_endAccess();

  return swift_retain();
}

__n128 HeadphoneSpecifier.__allocating_init(name:setAction:getAction:detail:cell:edit:buttonAction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10)
{
  id v19 = objc_allocWithZone(v10);
  HeadphoneSpecifier.init(name:setAction:getAction:detail:cell:edit:buttonAction:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10);
  return result;
}

uint64_t type metadata accessor for HeadphoneSpecifier()
{
  return self;
}

unint64_t sub_25129B920(void (*a1)(void *))
{
  swift_beginAccess();
  unint64_t v3 = *(void *)(v1 + 24);
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    swift_retain();
    return v1;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2512C4B58();
  if (!v4) {
    goto LABEL_10;
  }
LABEL_3:
  unint64_t result = v4 - 1;
  if (__OFSUB__(v4, 1))
  {
    __break(1u);
    goto LABEL_13;
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_13:
    id v6 = (id)MEMORY[0x25339AD70](result, v3);
    goto LABEL_8;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v6 = *(id *)(v3 + 8 * result + 32);
LABEL_8:
    uint64_t v7 = v6;
    swift_bridgeObjectRelease();
    a1(v7);
    swift_retain();

    return v1;
  }
  __break(1u);
  return result;
}

uint64_t sub_25129BA3C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25129BA74()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25129BA9C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

void sub_25129BADC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v38 = a5;
  uint64_t v39 = a6;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D878);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = a1;
  uint64_t v40 = a1;
  unint64_t v41 = a2;
  swift_bridgeObjectRetain();
  sub_2512C4838();
  swift_bridgeObjectRetain();
  sub_2512C4838();
  swift_bridgeObjectRelease();
  uint64_t v16 = v40;
  unint64_t v15 = v41;
  id v17 = (void *)sub_2512C47C8();
  objc_msgSend(v7, sel_setProperty_forKey_, v17, *MEMORY[0x263F600F8]);

  uint64_t v40 = v16;
  unint64_t v41 = v15;
  uint64_t v37 = a3;
  uint64_t v43 = a3;
  unint64_t v44 = a4;
  uint64_t v18 = sub_2512C3EF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v14, 1, 1, v18);
  sub_25129C378();
  uint64_t v19 = sub_2512C4A98();
  unint64_t v21 = v20;
  LOBYTE(a3) = v22;
  sub_25129C3CC((uint64_t)v14);
  if (a3)
  {
    if (qword_269B2F220 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_2512C42B8();
    __swift_project_value_buffer(v31, (uint64_t)qword_269B31400);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_2512C4298();
    os_log_type_t v33 = sub_2512C4988();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v40 = v35;
      *(_DWORD *)uint64_t v34 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_2512955F8(v16, v15, &v40);
      sub_2512C4A68();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v34 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_2512955F8(v36, a2, &v40);
      sub_2512C4A68();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v34 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_2512955F8(v37, a4, &v40);
      sub_2512C4A68();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_251285000, v32, v33, "updateSpecifierLinkedFooter: ERROR: range not found footer.range(of: linkString) %s %s %s", (uint8_t *)v34, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x25339B730](v35, -1, -1);
      MEMORY[0x25339B730](v34, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    sub_25129A74C(0, &qword_269B2D888);
    uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    int v24 = NSStringFromClass(ObjCClassFromMetadata);
    if (!v24)
    {
      sub_2512C47F8();
      int v24 = (NSString *)sub_2512C47C8();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v7, sel_setProperty_forKey_, v24, *MEMORY[0x263F600C0]);

    long long v25 = (void *)sub_2512C47C8();
    objc_msgSend(v7, sel_setProperty_forKey_, v25, *MEMORY[0x263F600E8]);

    uint64_t v40 = v19;
    unint64_t v41 = v21;
    uint64_t v43 = v16;
    unint64_t v44 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D890);
    sub_25129CA2C();
    v45.location = sub_2512C4A58();
    uint64_t v26 = NSStringFromRange(v45);
    if (!v26)
    {
      sub_2512C47F8();
      uint64_t v26 = (NSString *)sub_2512C47C8();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v7, sel_setProperty_forKey_, v26, *MEMORY[0x263F600D0]);

    uint64_t v27 = v38;
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v40 = v27;
    swift_unknownObjectRetain();
    uint64_t v28 = sub_2512C4BB8();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v40);
    id v29 = objc_msgSend(self, sel_valueWithNonretainedObject_, v28);
    swift_unknownObjectRelease();
    objc_msgSend(v7, sel_setProperty_forKey_, v29, *MEMORY[0x263F600E0]);

    sub_2512C3F38();
    id v30 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setProperty_forKey_, v30, *MEMORY[0x263F600C8]);
  }
}

uint64_t HeadphoneSpecifier.getAction.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_getAction);
  sub_25129AE8C(v1);
  return v1;
}

uint64_t HeadphoneSpecifier.setAction.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_setAction);
  sub_25129AE8C(v1);
  return v1;
}

uint64_t HeadphoneSpecifier.buttonTapAction.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_buttonTapAction);
  sub_25129AE8C(v1);
  return v1;
}

void HeadphoneSpecifier.init(name:setAction:getAction:detail:cell:edit:buttonAction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  unint64_t v15 = (uint64_t *)&v11[OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_getAction];
  uint64_t *v15 = a5;
  v15[1] = a6;
  uint64_t v16 = (uint64_t *)&v11[OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_setAction];
  *uint64_t v16 = a3;
  v16[1] = a4;
  id v17 = (uint64_t *)&v11[OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_buttonTapAction];
  uint64_t *v17 = a10;
  v17[1] = a11;
  if (a2)
  {
    sub_25129AE8C(a10);
    sub_25129AE8C(a3);
    sub_25129AE8C(a5);
    uint64_t v18 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    uint64_t v19 = a9;
    if (a7) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_25129AE8C(a10);
    sub_25129AE8C(a3);
    sub_25129AE8C(a5);
    uint64_t v18 = 0;
    uint64_t v19 = a9;
    if (a7)
    {
LABEL_3:
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      uint64_t v25 = a3;
      if (!v19) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  uint64_t ObjCClassFromMetadata = 0;
  uint64_t v25 = a3;
  if (v19) {
LABEL_4:
  }
    uint64_t v19 = swift_getObjCClassFromMetadata();
LABEL_5:
  unint64_t v21 = (objc_class *)type metadata accessor for HeadphoneSpecifier();
  v29.receiver = v11;
  v29.super_class = v21;
  id v22 = objc_msgSendSuper2(&v29, sel_initWithName_target_set_get_detail_cell_edit_, v18, 0, sel_setSepcifierEnabledWithEnabled_, sel_specifierEnabled, ObjCClassFromMetadata, a8, v19);

  if (v22)
  {
    v28.receiver = v22;
    v28.super_class = v21;
    id v23 = v22;
    objc_msgSendSuper2(&v28, sel_setTarget_, v23);
    v27.receiver = v23;
    v27.super_class = v21;
    id v24 = v23;
    objc_msgSendSuper2(&v27, sel_setButtonAction_, sel_buttonTappedWithSender_);
    sub_25129AED4(a10);
    sub_25129AED4(a5);
    sub_25129AED4(v25);
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_25129C378()
{
  unint64_t result = qword_269B2D880;
  if (!qword_269B2D880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2D880);
  }
  return result;
}

uint64_t sub_25129C3CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D878);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25129C42C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_buttonTapAction);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_25129C4E4()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_getAction);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t sub_25129C590()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_setAction);
  if (v1) {
    return v1();
  }
  return result;
}

id HeadphoneSpecifier.__allocating_init(name:target:set:get:detail:cell:edit:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t ObjCClassFromMetadata, uint64_t a7, uint64_t a8)
{
  uint64_t v24 = a5;
  uint64_t v25 = a7;
  uint64_t v23 = a4;
  if (a2)
  {
    uint64_t v12 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    uint64_t v13 = a3[3];
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = a3[3];
    if (v13)
    {
LABEL_3:
      uint64_t v14 = __swift_project_boxed_opaque_existential_0(a3, v13);
      uint64_t v15 = *(void *)(v13 - 8);
      MEMORY[0x270FA5388](v14);
      id v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v15 + 16))(v17);
      uint64_t v18 = sub_2512C4BB8();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)a3);
      if (!ObjCClassFromMetadata) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  uint64_t v18 = 0;
  if (ObjCClassFromMetadata) {
LABEL_4:
  }
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
LABEL_5:
  if (a8) {
    a8 = swift_getObjCClassFromMetadata();
  }
  id v19 = objc_allocWithZone(v8);
  id v20 = objc_msgSend(v19, sel_initWithName_target_set_get_detail_cell_edit_, v12, v18, v23, v24, ObjCClassFromMetadata, v25, a8);

  swift_unknownObjectRelease();
  return v20;
}

void HeadphoneSpecifier.init(name:target:set:get:detail:cell:edit:)()
{
}

id HeadphoneSpecifier.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HeadphoneSpecifier.init()()
{
}

id HeadphoneSpecifier.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneSpecifier();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25129C9E4()
{
  return sub_2512C4A38();
}

unint64_t sub_25129CA2C()
{
  unint64_t result = qword_269B2D898;
  if (!qword_269B2D898)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2D890);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2D898);
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

uint64_t sub_25129CAD0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25129CAE4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25129CAF8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25129CB0C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_25129CB20(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_25129CB34(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_25129CB48(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_25129CB5C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_25129CB70(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_25129CB84(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_25129CB98(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t sub_25129CBAC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t destroy for AnyBindable(void *a1)
{
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (a1[7]) {
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(a1 + 4));
  }
  if (a1[14]) {
    uint64_t result = swift_release();
  }
  if (a1[16]) {
    uint64_t result = swift_release();
  }
  if (a1[18])
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for AnyBindable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  id v6 = (_OWORD *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    *(void *)(a1 + 56) = v7;
    (**(void (***)(uint64_t, _OWORD *, uint64_t))(v7 - 8))(a1 + 32, v6, v7);
  }
  else
  {
    long long v8 = v6[1];
    *(_OWORD *)(a1 + 32) = *v6;
    *(_OWORD *)(a1 + 48) = v8;
  }
  uint64_t v9 = *(void *)(a2 + 112);
  long long v10 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v10;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  if (v9)
  {
    uint64_t v11 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = v9;
    *(void *)(a1 + 120) = v11;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  }
  uint64_t v12 = *(void *)(a2 + 128);
  if (v12)
  {
    uint64_t v13 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = v12;
    *(void *)(a1 + 136) = v13;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  }
  uint64_t v14 = *(void *)(a2 + 144);
  if (v14)
  {
    uint64_t v15 = *(void *)(a2 + 152);
    *(void *)(a1 + 144) = v14;
    *(void *)(a1 + 152) = v15;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  }
  return a1;
}

uint64_t assignWithCopy for AnyBindable(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_0((uint64_t *)(a1 + 32), (uint64_t *)(a2 + 32));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 32);
  }
  else if (v4)
  {
    *(void *)(a1 + 56) = v4;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 32, a2 + 32);
    goto LABEL_8;
  }
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
LABEL_8:
  uint64_t v6 = *(void *)(a1 + 112);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v7 = *(void *)(a2 + 112);
  if (v6)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a2 + 120);
      *(void *)(a1 + 112) = v7;
      *(void *)(a1 + 120) = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = v7;
    *(void *)(a1 + 120) = v9;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
LABEL_15:
  uint64_t v10 = *(void *)(a2 + 128);
  if (*(void *)(a1 + 128))
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = v10;
      *(void *)(a1 + 136) = v11;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = v10;
    *(void *)(a1 + 136) = v12;
    swift_retain();
    goto LABEL_22;
  }
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
LABEL_22:
  uint64_t v13 = *(void *)(a2 + 144);
  if (!*(void *)(a1 + 144))
  {
    if (v13)
    {
      uint64_t v15 = *(void *)(a2 + 152);
      *(void *)(a1 + 144) = v13;
      *(void *)(a1 + 152) = v15;
      swift_retain();
      return a1;
    }
LABEL_28:
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    return a1;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_28;
  }
  uint64_t v14 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = v13;
  *(void *)(a1 + 152) = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    unint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *unint64_t v3 = v12;
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
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
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
          *unint64_t v3 = *a2;
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

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t assignWithTake for AnyBindable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 56)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 32);
  }
  long long v6 = *(_OWORD *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 112);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  uint64_t v8 = *(void *)(a1 + 112);
  long long v9 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v9;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  if (v8)
  {
    if (v7)
    {
      uint64_t v10 = *(void *)(a2 + 120);
      *(void *)(a1 + 112) = v7;
      *(void *)(a1 + 120) = v10;
      swift_release();
      goto LABEL_10;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v11 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = v7;
    *(void *)(a1 + 120) = v11;
    goto LABEL_10;
  }
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
LABEL_10:
  uint64_t v12 = *(void *)(a2 + 128);
  if (*(void *)(a1 + 128))
  {
    if (v12)
    {
      uint64_t v13 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = v12;
      *(void *)(a1 + 136) = v13;
      swift_release();
      goto LABEL_17;
    }
    swift_release();
  }
  else if (v12)
  {
    uint64_t v14 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = v12;
    *(void *)(a1 + 136) = v14;
    goto LABEL_17;
  }
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
LABEL_17:
  uint64_t v15 = *(void *)(a2 + 144);
  if (!*(void *)(a1 + 144))
  {
    if (v15)
    {
      uint64_t v17 = *(void *)(a2 + 152);
      *(void *)(a1 + 144) = v15;
      *(void *)(a1 + 152) = v17;
      return a1;
    }
LABEL_23:
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    return a1;
  }
  if (!v15)
  {
    swift_release();
    goto LABEL_23;
  }
  uint64_t v16 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = v15;
  *(void *)(a1 + 152) = v16;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyBindable(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 160)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyBindable(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 160) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 160) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyBindable()
{
  return &type metadata for AnyBindable;
}

uint64_t sub_25129D448()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PSSpecifierGroupBuilder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for HeadphoneSpecifier(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HeadphoneSpecifier);
}

uint64_t dispatch thunk of HeadphoneSpecifier.__allocating_init(name:setAction:getAction:detail:cell:edit:buttonAction:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void type metadata accessor for PSTableCellType()
{
  if (!qword_269B2D8C0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269B2D8C0);
    }
  }
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25129D578()
{
  uint64_t v0 = sub_2512C42B8();
  __swift_allocate_value_buffer(v0, qword_269B2F2B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B2F2B8);
  return sub_2512C42A8();
}

uint64_t sub_25129D5F8()
{
  if (qword_269B2F2B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2512C42B8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B2F2B8);
}

uint64_t static Logger.fitNoseEnrollment.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B2F2B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B2F2B8);
  int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_25129D704()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController_delegate;
  swift_beginAccess();
  return MEMORY[0x25339B7D0](v1);
}

uint64_t sub_25129D750()
{
  return swift_unknownObjectRelease();
}

void (*sub_25129D7AC(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x25339B7D0](v5);
  return sub_25129D830;
}

void sub_25129D830(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_25129D8B0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController_deviceAddress);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_25129D8EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return sub_25129D938(a1, a2, a3);
}

id sub_25129D938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  swift_getObjectType();
  uint64_t v7 = sub_2512C47B8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController____lazy_storage___continueButton] = 0;
  *(void *)&v3[OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController____lazy_storage___movieLoopView] = 0;
  uint64_t v11 = &v3[OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController_listener];
  *(_OWORD *)uint64_t v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  uint64_t v12 = &v3[OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController_deviceAddress];
  *(void *)uint64_t v12 = a2;
  *((void *)v12 + 1) = a3;
  sub_2512C4758();
  sub_2512B1764((uint64_t)v10);
  uint64_t v13 = *(void (**)(char *, uint64_t))(v8 + 8);
  v13(v10, v7);
  uint64_t v14 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  sub_2512C4758();
  sub_2512B1764((uint64_t)v10);
  v13(v10, v7);
  uint64_t v15 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  uint64_t v16 = (objc_class *)type metadata accessor for FitNoiseAirpodAdjustmentVideoController();
  v20.receiver = v4;
  v20.super_class = v16;
  id v17 = objc_msgSendSuper2(&v20, sel_initWithTitle_detailText_symbolName_contentLayout_, v14, v15, 0, 1);
  swift_unknownObjectRelease();

  return v17;
}

uint64_t type metadata accessor for FitNoiseAirpodAdjustmentVideoController()
{
  return self;
}

id sub_25129DBBC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2512C47B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController____lazy_storage___continueButton;
  uint64_t v7 = *(void **)(v0
                + OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController____lazy_storage___continueButton);
  if (v7)
  {
    id v8 = *(id *)(v0
               + OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController____lazy_storage___continueButton);
  }
  else
  {
    id v9 = objc_msgSend(self, sel_boldButton);
    v15[1] = v0;
    sub_2512C4758();
    type metadata accessor for FitNoiseAirpodAdjustmentVideoController();
    sub_2512B1764((uint64_t)v5);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v10 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setTitle_forState_, v10, 0);

    sub_25129A74C(0, &qword_269B2D8F8);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v11 = (void *)sub_2512C4A48();
    objc_msgSend(v9, sel_addAction_forControlEvents_, v11, 64);

    uint64_t v12 = *(void **)(v1 + v6);
    *(void *)(v1 + v6) = v9;
    id v8 = v9;

    uint64_t v7 = 0;
  }
  id v13 = v7;
  return v8;
}

uint64_t sub_25129DDFC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25129DE34()
{
  uint64_t v1 = v0 + 16;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x25339B7D0](v0 + 16);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x78))();

    if (v4)
    {
      swift_beginAccess();
      uint64_t v5 = MEMORY[0x25339B7D0](v1);
      if (v5)
      {
        uint64_t v6 = (void *)v5;
        swift_bridgeObjectRetain();
      }
      id v7 = objc_allocWithZone((Class)HMFitNoiseCheckContentViewController);
      id v8 = (void *)sub_2512C47C8();
      swift_bridgeObjectRelease();
      id v9 = objc_msgSend(v7, sel_initWithDeviceAddress_, v8);

      objc_msgSend(v9, sel_setFitNoiseCheckDelegate_, v4);
      swift_beginAccess();
      uint64_t v10 = (void *)MEMORY[0x25339B7D0](v1);
      if (v10)
      {
        uint64_t v11 = v10;
        id v12 = objc_msgSend(v10, sel_navigationController);

        if (v12)
        {
          objc_msgSend(v12, sel_pushViewController_animated_, v9, 1);
        }
      }
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_25129DFE0(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController____lazy_storage___continueButton) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_25129DFF4(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = sub_25129DBBC();
  return sub_25129E03C;
}

void sub_25129E03C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = *(void **)(v1
                + OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController____lazy_storage___continueButton);
  *(void *)(v1
            + OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController____lazy_storage___continueButton) = v2;
}

id sub_25129E054()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController____lazy_storage___movieLoopView;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController____lazy_storage___movieLoopView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController____lazy_storage___movieLoopView);
  }
  else
  {
    uint64_t v4 = v0;
    type metadata accessor for HearingFitNoiseVideoLoopPlayer(0);
    sub_2512945E8();
    sub_2512994C4(1, 0.0, 0.0, 0.0, 0.0);
    uint64_t v6 = v5;
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v7 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

void sub_25129E0F4(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for FitNoiseAirpodAdjustmentVideoController();
  objc_msgSendSuper2(&v4, sel_viewWillAppear_, a1 & 1);
  id v3 = sub_25129E054();
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0xE0))();
}

void sub_25129E21C()
{
  uint64_t v1 = v0;
  uint64_t v63 = sub_2512C47B8();
  uint64_t v2 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  objc_super v4 = (char *)v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (objc_class *)type metadata accessor for FitNoiseAirpodAdjustmentVideoController();
  v70.receiver = v0;
  v70.super_class = v5;
  v62[1] = v5;
  objc_msgSendSuper2(&v70, sel_viewDidLoad);
  id v6 = objc_msgSend(v0, sel_scrollView);
  id v7 = objc_msgSend(v6, sel_layer);

  objc_msgSend(v7, sel_setMasksToBounds_, 0);
  id v8 = objc_msgSend(v1, sel_contentView);
  id v9 = objc_msgSend(v8, sel_layer);

  objc_msgSend(v9, sel_setMasksToBounds_, 0);
  id v10 = objc_msgSend(v1, sel_contentView);
  id v11 = objc_msgSend(self, sel_systemBackgroundColor);
  objc_msgSend(v10, sel_setBackgroundColor_, v11);

  objc_msgSend(v1, sel_fitNoiseSetupCancelButtonWithFitDelegate_, (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x78))());
  swift_unknownObjectRelease();
  id v12 = objc_msgSend(v1, sel_contentView);
  id v13 = sub_25129E054();
  objc_msgSend(v12, sel_addSubview_, v13);

  id v14 = objc_msgSend(v1, sel_navigationController);
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = objc_msgSend(v14, sel_navigationBar);

    objc_msgSend(v16, sel_bounds);
    double v18 = v17;
  }
  else
  {
    double v18 = 44.0;
  }
  uint64_t v19 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2D900);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_2512C6B50;
  id v21 = sub_25129E054();
  id v22 = objc_msgSend(v21, sel_topAnchor);

  id v23 = objc_msgSend(v1, sel_contentView);
  id v24 = objc_msgSend(v23, sel_topAnchor);

  id v25 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v24, -v18);
  *(void *)(v20 + 32) = v25;
  id v26 = sub_25129E054();
  id v27 = objc_msgSend(v26, sel_leadingAnchor);

  id v28 = objc_msgSend(v1, sel_contentView);
  id v29 = objc_msgSend(v28, sel_leadingAnchor);

  id v30 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v29);
  *(void *)(v20 + 40) = v30;
  id v31 = sub_25129E054();
  id v32 = objc_msgSend(v31, sel_trailingAnchor);

  id v33 = objc_msgSend(v1, sel_contentView);
  id v34 = objc_msgSend(v33, sel_trailingAnchor);

  id v35 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v34);
  *(void *)(v20 + 48) = v35;
  id v36 = sub_25129E054();
  id v37 = objc_msgSend(v36, sel_bottomAnchor);

  id v38 = objc_msgSend(v1, sel_contentView);
  id v39 = objc_msgSend(v38, sel_bottomAnchor);

  id v40 = objc_msgSend(v37, sel_constraintEqualToAnchor_, v39);
  *(void *)(v20 + 56) = v40;
  aBlock = (void *)v20;
  sub_2512C4898();
  sub_25129A74C(0, &qword_269B2D858);
  unint64_t v41 = (void *)sub_2512C4868();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_activateConstraints_, v41);

  id v42 = objc_msgSend(self, sel_accessoryButton);
  aBlock = v1;
  sub_2512C4758();
  sub_2512B1764((uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v63);
  uint64_t v43 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v42, sel_setTitle_forStates_, v43, 0);

  sub_25129A74C(0, &qword_269B2D8F8);
  unint64_t v44 = (void *)sub_2512C4A48();
  objc_msgSend(v42, sel_addAction_forControlEvents_, v44, 64);

  id v45 = objc_msgSend(v1, sel_headerView);
  objc_msgSend(v45, sel_addAccessoryButton_, v42);

  id v46 = objc_msgSend(v1, sel_buttonTray);
  id v47 = (void *)MEMORY[0x263F8EED0];
  uint64_t v48 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x98))();
  objc_msgSend(v46, sel_addButton_, v48);

  uint64_t v49 = sub_25129E054();
  uint64_t v50 = (void *)(*(uint64_t (**)(void))((*v47 & *v49) + 0xC0))();

  uint64_t v51 = sub_2512C4A18();
  unsigned int v53 = v52;
  uint64_t v55 = v54;
  unint64_t v56 = HIDWORD(v52);
  sub_25129A74C(0, (unint64_t *)&qword_269B2D910);
  v57 = (void *)sub_2512C4A08();
  uint64_t v58 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v68 = sub_25129EE5C;
  uint64_t v69 = v58;
  aBlock = (void *)MEMORY[0x263EF8330];
  unint64_t v65 = 1107296256;
  v66 = sub_25129EF30;
  v67 = &block_descriptor_1;
  v59 = _Block_copy(&aBlock);
  swift_release();
  aBlock = (void *)v51;
  unint64_t v65 = __PAIR64__(v56, v53);
  v66 = v55;
  id v60 = objc_msgSend(v50, sel_addPeriodicTimeObserverForInterval_queue_usingBlock_, &aBlock, v57, v59);
  _Block_release(v59);

  sub_2512C4AB8();
  swift_unknownObjectRelease();
  uint64_t v61 = (uint64_t)v1 + OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController_listener;
  swift_beginAccess();
  sub_25129AB90((uint64_t)&aBlock, v61);
  swift_endAccess();
}

uint64_t sub_25129EAFC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D830);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2512C3E98();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C3E88();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    return sub_25129F330((uint64_t)v2, &qword_269B2D830);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  id v8 = objc_msgSend(self, sel_sharedApplication);
  id v9 = (void *)sub_2512C3E68();
  sub_25129ED40(MEMORY[0x263F8EE78]);
  type metadata accessor for OpenExternalURLOptionsKey();
  sub_25129FB14(&qword_269B2D920);
  id v10 = (void *)sub_2512C4728();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_openURL_options_completionHandler_, v9, v10, 0);

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_25129ED40(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D928);
  uint64_t v2 = sub_2512C4B88();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25129F888(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_25129F7F4(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_25129F8F0(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

void sub_25129EE5C(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3)
{
  swift_beginAccess();
  uint64_t v7 = MEMORY[0x25339B7D0](v3 + 16);
  if (v7)
  {
    id v8 = (void *)v7;
    v10.value = a1;
    *(void *)&v10.timescale = a2;
    v10.epoch = a3;
    if (CMTimeGetSeconds(&v10) >= 5.0)
    {
      char v9 = sub_25129E054();
      (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v9) + 0xE8))();
    }
  }
}

uint64_t sub_25129EF30(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v4 = a2[2];
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(v2, v3, v4);
  return swift_release();
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

id sub_25129EFFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v8 = v7;
  uint64_t v12 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    long long v14 = 0;
    goto LABEL_6;
  }
  uint64_t v13 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  long long v14 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v12, v13, v14, a7);

  return v15;
}

void sub_25129F0DC()
{
}

id sub_25129F13C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v7 = v6;
  BOOL v11 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v12 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, a5, a6);

  return v13;
}

void sub_25129F1F4()
{
}

id sub_25129F258()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FitNoiseAirpodAdjustmentVideoController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25129F308(uint64_t a1)
{
  return a1;
}

uint64_t sub_25129F330(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for OpenExternalURLOptionsKey()
{
  if (!qword_269B2D938)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269B2D938);
    }
  }
}

uint64_t sub_25129F3E4(uint64_t a1, uint64_t a2)
{
  return sub_25129F550(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_25129F3FC(uint64_t a1, id *a2)
{
  uint64_t result = sub_2512C47D8();
  *a2 = 0;
  return result;
}

uint64_t sub_25129F474(uint64_t a1, id *a2)
{
  char v3 = sub_2512C47E8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25129F4F4@<X0>(uint64_t *a1@<X8>)
{
  sub_2512C47F8();
  uint64_t v2 = sub_2512C47C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25129F538(uint64_t a1, uint64_t a2)
{
  return sub_25129F550(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_25129F550(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2512C47F8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25129F594()
{
  sub_2512C47F8();
  sub_2512C4828();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25129F5E8()
{
  sub_2512C47F8();
  sub_2512C4C28();
  sub_2512C4828();
  uint64_t v0 = sub_2512C4C48();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25129F65C()
{
  uint64_t v0 = sub_2512C47F8();
  uint64_t v2 = v1;
  if (v0 == sub_2512C47F8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2512C4BC8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_25129F6E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2512C47C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25129F730@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2512C47F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25129F75C(uint64_t a1)
{
  uint64_t v2 = sub_25129FB14(&qword_269B2D920);
  uint64_t v3 = sub_25129FB14(&qword_269B2D958);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

unint64_t sub_25129F7F4(uint64_t a1)
{
  sub_2512C47F8();
  sub_2512C4C28();
  sub_2512C4828();
  uint64_t v2 = sub_2512C4C48();
  swift_bridgeObjectRelease();
  return sub_25129F900(a1, v2);
}

uint64_t sub_25129F888(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D930);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_25129F8F0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_25129F900(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_2512C47F8();
    uint64_t v8 = v7;
    if (v6 == sub_2512C47F8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_2512C4BC8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_2512C47F8();
          uint64_t v15 = v14;
          if (v13 == sub_2512C47F8() && v15 == v16) {
            break;
          }
          char v18 = sub_2512C4BC8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
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

uint64_t sub_25129FA78()
{
  return sub_25129FB14(&qword_269B2D940);
}

uint64_t sub_25129FAAC()
{
  return sub_25129FB14(&qword_269B2D948);
}

uint64_t sub_25129FAE0()
{
  return sub_25129FB14(&qword_269B2D950);
}

uint64_t sub_25129FB14(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25129FB58()
{
  uint64_t v0 = sub_2512C42B8();
  __swift_allocate_value_buffer(v0, qword_269B31418);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B31418);
  return sub_2512C42A8();
}

uint64_t sub_25129FBDC()
{
  if (qword_269B2F5D0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2512C42B8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B31418);
}

uint64_t sub_25129FC40@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B2F5D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B31418);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

void sub_25129FCEC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id OcclusionTutorialController.__allocating_init(airPodName:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return OcclusionTutorialController.init(airPodName:)(a1, a2);
}

id static OcclusionAlertProvider.makeAlertForOcclusionTutorial(name:presentTutorialUIHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s13HearingModeUI22OcclusionAlertProviderV04makee3ForD8Tutorial10deviceName17subsequentAttempt07presentI9UIHandlerSo17UIAlertControllerCSS_SbySo06UIViewQ0CctFZ_0(a1, a2, 0, a3, a4);
}

id static OcclusionAlertProvider.makeAlertForOcclusionTryLater(address:)(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v2 = sub_2512C47B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C4758();
  sub_2512B1764((uint64_t)v5);
  uint64_t v6 = *(void (**)(char *, uint64_t))(v3 + 8);
  v6(v5, v2);
  sub_2512C4758();
  sub_2512B1764((uint64_t)v5);
  v6(v5, v2);
  uint64_t v7 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v7, v8, 1);

  sub_2512C4758();
  sub_2512B1764((uint64_t)v5);
  v6(v5, v2);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v15;
  *(void *)(v10 + 24) = v16;
  swift_bridgeObjectRetain();
  char v11 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_2512A39A8;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_25129FCEC;
  aBlock[3] = &block_descriptor_2;
  uint64_t v12 = _Block_copy(aBlock);
  swift_release();
  id v13 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v11, 0, v12);
  _Block_release(v12);

  objc_msgSend(v9, sel_addAction_, v13);
  return v9;
}

id static OcclusionAlertProvider.makeAlertForOcclusionTutorial(deviceName:subsequentAttempt:address:presentTutorialUIHandler:)(void *a1, void (**a2)(uint64_t a1, void *a2), int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v44 = a6;
  uint64_t v45 = a4;
  uint64_t v39 = a5;
  int v41 = a3;
  id v42 = a1;
  uint64_t v43 = a2;
  uint64_t v8 = sub_2512C47B8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C4758();
  sub_2512B1764((uint64_t)v11);
  uint64_t v12 = *(void (**)(char *, uint64_t))(v9 + 8);
  v12(v11, v8);
  sub_2512C4758();
  sub_2512B1764((uint64_t)v11);
  v12(v11, v8);
  id v13 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  id v38 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v13, v14, 1);

  uint64_t v15 = v12;
  sub_2512C4758();
  uint64_t v16 = v39;
  sub_2512B1764((uint64_t)v11);
  uint64_t v40 = v8;
  uint64_t v17 = v8;
  uint64_t v18 = v45;
  v12(v11, v17);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = v42;
  uint64_t v20 = v44;
  v19[3] = v43;
  v19[4] = v20;
  v19[5] = a7;
  v19[6] = v18;
  v19[7] = v16;
  swift_bridgeObjectRetain();
  uint64_t v37 = a7;
  swift_retain();
  swift_bridgeObjectRetain();
  id v21 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  uint64_t v50 = sub_2512A3A18;
  uint64_t v51 = v19;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v47 = 1107296256;
  uint64_t v43 = &v48;
  uint64_t v48 = sub_25129FCEC;
  uint64_t v49 = &block_descriptor_6_0;
  id v22 = _Block_copy(&aBlock);
  swift_release();
  id v42 = self;
  id v23 = objc_msgSend(v42, sel_actionWithTitle_style_handler_, v21, 0, v22);
  _Block_release(v22);

  id v24 = v38;
  objc_msgSend(v38, sel_addAction_, v23);

  if (v41)
  {
    sub_2512C4758();
    sub_2512B1764((uint64_t)v11);
    uint64_t v25 = v40;
    v15(v11, v40);
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v44;
    *(void *)(v26 + 24) = v37;
    *(void *)(v26 + 32) = v18;
    *(void *)(v26 + 40) = v16;
    int v27 = 4;
    *(_DWORD *)(v26 + 48) = 4;
    swift_retain();
    swift_bridgeObjectRetain();
    id v28 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    uint64_t v50 = sub_2512A3C58;
    uint64_t v51 = (void *)v26;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v47 = 1107296256;
    uint64_t v48 = sub_25129FCEC;
    uint64_t v49 = &block_descriptor_18_0;
    id v29 = _Block_copy(&aBlock);
    swift_release();
    id v30 = objc_msgSend(v42, sel_actionWithTitle_style_handler_, v28, 0, v29);
    _Block_release(v29);

    objc_msgSend(v24, sel_addAction_, v30);
  }
  else
  {
    uint64_t v25 = v40;
    int v27 = 3;
  }
  sub_2512C4758();
  sub_2512B1764((uint64_t)v11);
  v15(v11, v25);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v45;
  *(void *)(v31 + 24) = v16;
  *(_DWORD *)(v31 + 32) = v27;
  swift_bridgeObjectRetain();
  id v32 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  uint64_t v50 = sub_2512A3C18;
  uint64_t v51 = (void *)v31;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v47 = 1107296256;
  uint64_t v48 = sub_25129FCEC;
  uint64_t v49 = &block_descriptor_12_0;
  id v33 = _Block_copy(&aBlock);
  swift_release();
  id v34 = objc_msgSend(v42, sel_actionWithTitle_style_handler_, v32, 1, v33);
  _Block_release(v33);

  objc_msgSend(v24, (SEL)&selRef_transitionToCheckReady + 3, v34);
  return v24;
}

uint64_t sub_2512A0708()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController_deviceName);
  swift_bridgeObjectRetain();
  return v1;
}

id OcclusionTutorialController.init(airPodName:)(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___table] = 0;
  *(void *)&v2[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonCell] = 0;
  *(void *)&v2[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___learnButton] = 0;
  *(void *)&v2[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonSpecifier] = 0;
  *(void *)&v2[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewCell] = 0;
  *(void *)&v2[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewSpecifier] = 0;
  uint64_t v3 = &v2[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController_deviceName];
  *(void *)uint64_t v3 = a1;
  *((void *)v3 + 1) = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for OcclusionTutorialController();
  return objc_msgSendSuper2(&v5, sel_initWithNibName_bundle_, 0, 0);
}

id sub_2512A0804()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___table;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___table);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___table);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82C78]), sel_initWithFrame_style_, 2, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v4, sel_setDataSource_, v0);
    objc_msgSend(v4, sel_setDelegate_, v0);
    objc_msgSend(v4, sel_setAllowsSelection_, 0);
    objc_super v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_2512A08DC(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___table) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_2512A08F0(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_2512A0804();
  return sub_2512A0938;
}

void sub_2512A0938(uint64_t *a1, uint64_t a2)
{
}

id sub_2512A0944()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonCell;
  uint64_t v2 = *(void **)((char *)v0 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonCell);
  if (v2)
  {
    id v3 = *(id *)((char *)v0 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonCell);
LABEL_5:
    id v8 = v2;
    return v3;
  }
  id v4 = v0;
  type metadata accessor for HeadphoneAccessoryCellUIContainer();
  objc_super v5 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
  id result = sub_2512A4D94(3, 0, 0xE000000000000000, v5);
  if (result)
  {
    uint64_t v7 = *(void **)((char *)v0 + v1);
    *(void *)((char *)v4 + v1) = result;
    id v3 = result;

    uint64_t v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_2512A0A04(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonCell) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_2512A0A18(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_2512A0944();
  return sub_2512A0A60;
}

void sub_2512A0A60(uint64_t *a1, uint64_t a2)
{
}

id sub_2512A0A6C()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___learnButton;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___learnButton);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___learnButton);
LABEL_9:
    id v23 = v2;
    return v3;
  }
  uint64_t v4 = v0;
  uint64_t ObjectType = swift_getObjectType();
  id v6 = objc_msgSend(self, sel_buttonWithType_, 1);
  id v7 = objc_msgSend(v6, sel_titleLabel);
  if (v7)
  {
    id v8 = v7;
    objc_msgSend(v7, sel_setAdjustsFontForContentSizeCategory_, 1);
  }
  id v9 = objc_msgSend(v6, sel_titleLabel);
  if (!v9)
  {
LABEL_8:
    sub_2512B7824();
    id v13 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setTitle_forState_, v13, 0);

    objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v6, sel_setContentHorizontalAlignment_, 4);
    sub_25129A74C(0, &qword_269B2D8F8);
    uint64_t v14 = (void *)sub_2512C4A48();
    objc_msgSend(v6, sel_addAction_forControlEvents_, v14, 64, 0, 0, 0, sub_2512A0D78, 0);

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2DB40);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_2512C6460;
    uint64_t v16 = sub_2512C42C8();
    uint64_t v17 = MEMORY[0x263F81EF0];
    *(void *)(v15 + 32) = v16;
    *(void *)(v15 + 40) = v17;
    uint64_t v18 = sub_2512C4328();
    uint64_t v19 = MEMORY[0x263F82018];
    *(void *)(v15 + 48) = v18;
    *(void *)(v15 + 56) = v19;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v6;
    *(void *)(v20 + 24) = ObjectType;
    id v21 = v6;
    sub_2512C49E8();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    id v22 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v21;
    id v3 = v21;

    uint64_t v2 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = v9;
  id result = objc_msgSend(self, sel__preferredFontForTextStyle_weight_, *MEMORY[0x263F83570], *MEMORY[0x263F81838]);
  if (result)
  {
    uint64_t v12 = result;
    objc_msgSend(v10, sel_setFont_, result);

    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t sub_2512A0D78()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D830);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2512C3E98();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C3E88();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    id v8 = self;
    id v9 = objc_msgSend(v8, sel_sharedApplication);
    uint64_t v10 = (void *)sub_2512C3E68();
    unsigned int v11 = objc_msgSend(v9, sel_canOpenURL_, v10);

    if (v11)
    {
      id v12 = objc_msgSend(v8, sel_sharedApplication);
      id v13 = (void *)sub_2512C3E68();
      sub_25129ED40(MEMORY[0x263F8EE78]);
      type metadata accessor for OpenExternalURLOptionsKey();
      sub_25129FB14(&qword_269B2D920);
      uint64_t v14 = (void *)sub_2512C4728();
      swift_bridgeObjectRelease();
      objc_msgSend(v12, sel_openURL_options_completionHandler_, v13, v14, 0);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

unint64_t sub_2512A0FF4(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_2512C4B88();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    id v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_251295C50(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v12 = (uint64_t *)(v3[6] + 16 * result);
    *id v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
    if (!--v4)
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

uint64_t sub_2512A110C(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___learnButton) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_2512A1120(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_2512A0A6C();
  return sub_2512A1168;
}

void sub_2512A1168(uint64_t *a1, uint64_t a2)
{
}

unint64_t sub_2512A1174()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonSpecifier;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonSpecifier];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonSpecifier];
LABEL_11:
    id v33 = v2;
    return (unint64_t)v3;
  }
  uint64_t v4 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DB00);
  uint64_t v5 = sub_25129B024();
  uint64_t v7 = v6;
  uint64_t v8 = sub_25129B024();
  uint64_t v10 = sub_25129B030(v5, v7, v8, v9);
  uint64_t v11 = sub_2512B7824();
  uint64_t v13 = v12;
  v35[3] = type metadata accessor for OcclusionTutorialController();
  v35[0] = v4;
  uint64_t v14 = type metadata accessor for HeadphoneAccessoryCellUIContainer();
  uint64_t v15 = v4;
  char v16 = sub_25129ACD8();
  memset((char *)v34 + 8, 0, 24);
  *(void *)&v34[0] = v14;
  __n128 v17 = sub_25129AF04(0, 0, v11, v13, (uint64_t)v35, 0, 0, 2, (uint64_t)v36, 0, v16 & 1, v34[0], v34[1], (__n128)0, 0);
  uint64_t v18 = (*(uint64_t (**)(unsigned char *, __n128))(*(void *)v10 + 152))(v36, v17);
  swift_release();
  uint64_t v19 = sub_2512A441C((uint64_t)v36);
  unint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v18 + 184))(v19);
  swift_release();
  if (!(v20 >> 62))
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v21) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_2512C4B58();
  swift_bridgeObjectRelease();
  if (!v21) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v21 - 1;
  if (__OFSUB__(v21, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v20 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v23 = (id)MEMORY[0x25339AD70](result, v20);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v23 = *(id *)(v20 + 8 * result + 32);
LABEL_10:
    id v24 = v23;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DB20);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2512C6440;
    uint64_t v26 = (uint64_t *)sub_2512A4B64();
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    *(void *)(inited + 32) = v28;
    *(void *)(inited + 40) = v27;
    id v29 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *(void *)v15) + 0xC0);
    uint64_t v30 = swift_bridgeObjectRetain();
    *(void *)(inited + 48) = v29(v30);
    sub_2512A0FF4(inited, (uint64_t *)&unk_269B2DB30);
    sub_25129A74C(0, &qword_269B2DB28);
    uint64_t v31 = (void *)sub_2512C4728();
    swift_bridgeObjectRelease();
    objc_msgSend(v24, sel_setUserInfo_, v31);

    v35[0] = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DB10);
    objc_msgSend(v24, sel_setProperty_forKey_, sub_2512C4BE8(), *MEMORY[0x263F5FFE0]);
    swift_unknownObjectRelease();
    id v32 = *(void **)&v4[v1];
    *(void *)&v4[v1] = v24;
    id v3 = v24;

    uint64_t v2 = 0;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_2512A1534(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonSpecifier) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_2512A1548(unint64_t *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_2512A1174();
  return sub_2512A1590;
}

void sub_2512A1590(uint64_t *a1, uint64_t a2)
{
}

id sub_2512A159C()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewCell;
  uint64_t v2 = *(void **)((char *)v0 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewCell);
  if (v2)
  {
    id v3 = *(id *)((char *)v0 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewCell);
LABEL_5:
    id v8 = v2;
    return v3;
  }
  uint64_t v4 = v0;
  type metadata accessor for HeadphoneAccessoryCellUIContainer();
  uint64_t v5 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
  id result = sub_2512A4D94(3, 0, 0xE000000000000000, v5);
  if (result)
  {
    uint64_t v7 = *(void **)((char *)v0 + v1);
    *(void *)((char *)v4 + v1) = result;
    id v3 = result;

    uint64_t v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_2512A1664(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewCell) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_2512A1678(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_2512A159C();
  return sub_2512A16C0;
}

void sub_2512A16C0(uint64_t *a1, uint64_t a2)
{
}

unint64_t sub_2512A16CC()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewSpecifier;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewSpecifier];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewSpecifier];
LABEL_11:
    id v95 = v2;
    return (unint64_t)v3;
  }
  uint64_t v4 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DB00);
  uint64_t v5 = sub_25129B024();
  uint64_t v7 = v6;
  uint64_t v8 = sub_25129B024();
  uint64_t v10 = sub_25129B030(v5, v7, v8, v9);
  uint64_t v11 = sub_2512B7824();
  uint64_t v13 = v12;
  v105[3] = type metadata accessor for OcclusionTutorialController();
  v105[0] = v4;
  uint64_t v14 = type metadata accessor for HeadphoneAccessoryCellUIContainer();
  uint64_t v15 = v4;
  char v16 = sub_25129ACD8();
  memset((char *)v96 + 8, 0, 24);
  *(void *)&v96[0] = v14;
  __n128 v17 = sub_25129AF04(0, 0, v11, v13, (uint64_t)v105, 0, 0, 2, (uint64_t)&v106, 0, v16 & 1, v96[0], v96[1], (__n128)0, 0);
  uint64_t v18 = (*(uint64_t (**)(objc_super *, __n128))(*(void *)v10 + 152))(&v106, v17);
  swift_release();
  uint64_t v19 = sub_2512A441C((uint64_t)&v106);
  unint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v18 + 184))(v19);
  swift_release();
  if (!(v20 >> 62))
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v21) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_2512C4B58();
  swift_bridgeObjectRelease();
  if (!v21) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v21 - 1;
  if (__OFSUB__(v21, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v103 = v1;
  v104 = v4;
  uint64_t v102 = v14;
  if ((v20 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v23 = (id)MEMORY[0x25339AD70](result, v20);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v23 = *(id *)(v20 + 8 * result + 32);
LABEL_10:
    id v101 = v23;
    swift_bridgeObjectRelease();
    id v24 = &v15[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController_deviceName];
    uint64_t v26 = *(void *)&v15[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController_deviceName];
    uint64_t v25 = *((void *)v24 + 1);
    Class v100 = (Class)type metadata accessor for OcclusionTutorialController.TopView();
    uint64_t v27 = (char *)objc_allocWithZone(v100);
    swift_bridgeObjectRetain();
    *(void *)&v27[OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView____lazy_storage___spacerLabel] = 0;
    uint64_t v28 = OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_leftBudImageView;
    id v29 = v27;
    *(void *)&v27[v28] = sub_2512A2960();
    uint64_t v30 = OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_rightBudImageView;
    *(void *)&v29[v30] = sub_2512A2A78();
    uint64_t v31 = OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_leftStatusMarkImage;
    *(void *)&v29[v31] = sub_2512A2B90();
    uint64_t v32 = OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_rightStatusMarkImage;
    *(void *)&v29[v32] = sub_2512A2B90();
    id v33 = &v29[OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_deviceName];
    *(void *)id v33 = v26;
    *((void *)v33 + 1) = v25;

    v106.receiver = v29;
    v106.super_class = v100;
    id v34 = objc_msgSendSuper2(&v106, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v34, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v35 = self;
    uint64_t v36 = (char *)v34;
    id v37 = objc_msgSend(v35, sel_clearColor);
    objc_msgSend(v36, sel_setBackgroundColor_, v37);

    uint64_t v38 = OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_leftBudImageView;
    objc_msgSend(v36, sel_addSubview_, *(void *)&v36[OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_leftBudImageView]);
    uint64_t v39 = OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_rightBudImageView;
    objc_msgSend(v36, sel_addSubview_, *(void *)&v36[OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_rightBudImageView]);
    uint64_t v97 = OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_leftStatusMarkImage;
    objc_msgSend(v36, sel_addSubview_, *(void *)&v36[OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_leftStatusMarkImage]);
    uint64_t v98 = OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_rightStatusMarkImage;
    objc_msgSend(v36, sel_addSubview_, *(void *)&v36[OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_rightStatusMarkImage]);
    uint64_t v40 = v36;
    id v41 = sub_2512A267C();
    objc_msgSend(v40, sel_addSubview_, v41);

    id v42 = objc_msgSend(v40, sel_layer);
    objc_msgSend(v42, sel_setMasksToBounds_, 0);

    id v99 = self;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2D900);
    uint64_t v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_2512C6FC0;
    id v44 = objc_msgSend(*(id *)&v36[v38], sel_topAnchor);
    id v45 = objc_msgSend(v40, sel_topAnchor);
    id v46 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v45);

    *(void *)(v43 + 32) = v46;
    id v47 = objc_msgSend(*(id *)&v36[v39], sel_topAnchor);
    id v48 = objc_msgSend(v40, sel_topAnchor);
    id v49 = objc_msgSend(v47, byte_2653662EE, v48);

    *(void *)(v43 + 40) = v49;
    id v50 = objc_msgSend(*(id *)&v36[v38], sel_centerXAnchor);
    id v51 = objc_msgSend(v40, sel_centerXAnchor);
    id v52 = objc_msgSend(v50, sel_constraintEqualToAnchor_constant_, v51, -60.0);

    *(void *)(v43 + 48) = v52;
    id v53 = objc_msgSend(*(id *)&v36[v39], sel_centerXAnchor);
    id v54 = objc_msgSend(v40, sel_centerXAnchor);
    id v55 = objc_msgSend(v53, sel_constraintEqualToAnchor_constant_, v54, 60.0);

    *(void *)(v43 + 56) = v55;
    id v56 = objc_msgSend(*(id *)&v36[v38], sel_heightAnchor);
    id v57 = objc_msgSend(*(id *)&v36[v39], sel_heightAnchor);
    id v58 = objc_msgSend(v56, sel_constraintEqualToAnchor_, v57);

    *(void *)(v43 + 64) = v58;
    id v59 = objc_msgSend(*(id *)&v36[v97], sel_centerXAnchor);
    id v60 = objc_msgSend(*(id *)&v36[v38], sel_centerXAnchor);
    id v61 = objc_msgSend(v59, sel_constraintEqualToAnchor_constant_, v60, 12.0);

    *(void *)(v43 + 72) = v61;
    id v62 = objc_msgSend(*(id *)&v36[v97], sel_topAnchor);
    id v63 = objc_msgSend(*(id *)&v36[v38], sel_bottomAnchor);
    id v64 = objc_msgSend(v62, sel_constraintEqualToAnchor_constant_, v63, 20.0);

    *(void *)(v43 + 80) = v64;
    id v65 = objc_msgSend(*(id *)&v36[v98], sel_centerXAnchor);
    id v66 = objc_msgSend(*(id *)&v36[v39], sel_centerXAnchor);
    id v67 = objc_msgSend(v65, sel_constraintEqualToAnchor_constant_, v66, -12.0);

    *(void *)(v43 + 88) = v67;
    id v68 = objc_msgSend(*(id *)&v36[v98], sel_topAnchor);
    id v69 = objc_msgSend(*(id *)&v36[v39], sel_bottomAnchor);
    id v70 = objc_msgSend(v68, sel_constraintEqualToAnchor_constant_, v69, 20.0);

    *(void *)(v43 + 96) = v70;
    id v71 = sub_2512A267C();
    id v72 = objc_msgSend(v71, sel_leadingAnchor);

    id v73 = objc_msgSend(v40, sel_leadingAnchor);
    id v74 = objc_msgSend(v72, sel_constraintEqualToAnchor_, v73);

    *(void *)(v43 + 104) = v74;
    id v75 = sub_2512A267C();
    id v76 = objc_msgSend(v75, sel_trailingAnchor);

    id v77 = objc_msgSend(v40, sel_trailingAnchor);
    id v78 = objc_msgSend(v76, sel_constraintEqualToAnchor_, v77);

    *(void *)(v43 + 112) = v78;
    id v79 = sub_2512A267C();
    id v80 = objc_msgSend(v79, sel_topAnchor);

    id v81 = objc_msgSend(*(id *)&v36[v98], sel_bottomAnchor);
    id v82 = objc_msgSend(v80, sel_constraintEqualToAnchor_constant_, v81, 20.0);

    *(void *)(v43 + 120) = v82;
    id v83 = sub_2512A267C();
    id v84 = objc_msgSend(v83, sel_bottomAnchor);

    id v85 = objc_msgSend(v40, sel_bottomAnchor);
    id v86 = objc_msgSend(v84, sel_constraintEqualToAnchor_, v85);

    *(void *)(v43 + 128) = v86;
    v105[0] = v43;
    sub_2512C4898();
    sub_25129A74C(0, &qword_269B2D858);
    v87 = (void *)sub_2512C4868();
    swift_bridgeObjectRelease();
    objc_msgSend(v99, sel_activateConstraints_, v87);

    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DB08);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2512C6440;
    v89 = (uint64_t *)sub_2512A4B64();
    uint64_t v91 = *v89;
    uint64_t v90 = v89[1];
    *(void *)(inited + 32) = v91;
    *(void *)(inited + 40) = v90;
    *(void *)(inited + 48) = v40;
    swift_bridgeObjectRetain();
    v92 = v40;
    sub_2512A0FF4(inited, &qword_269B2DB18);
    v93 = (void *)sub_2512C4728();
    swift_bridgeObjectRelease();
    objc_msgSend(v101, sel_setUserInfo_, v93);

    v105[0] = v102;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DB10);
    objc_msgSend(v101, sel_setProperty_forKey_, sub_2512C4BE8(), *MEMORY[0x263F5FFE0]);

    swift_unknownObjectRelease();
    v94 = *(void **)&v104[v103];
    *(void *)&v104[v103] = v101;
    id v3 = v101;

    uint64_t v2 = 0;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_2512A2210(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewSpecifier) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_2512A2224(unint64_t *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_2512A16CC();
  return sub_2512A226C;
}

void sub_2512A226C(uint64_t *a1, uint64_t a2)
{
}

void sub_2512A2278(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = *(void **)(v3 + *a3);
  *(void *)(v3 + *a3) = v4;
}

void sub_2512A228C()
{
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for OcclusionTutorialController();
  objc_msgSendSuper2(&v9, sel_viewDidLoad);
  sub_2512B7824();
  unint64_t v1 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setTitle_, v1);

  id v2 = objc_msgSend(v0, sel_view);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90);
    uint64_t v5 = (void *)v4();
    objc_msgSend(v3, sel_addSubview_, v5);

    uint64_t v6 = (void *)v4();
    id v7 = objc_msgSend(v0, sel_view);
    if (v7)
    {
      uint64_t v8 = v7;
      objc_msgSend(v6, sel_pinToOther_, v7);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_2512A2444()
{
  return 2;
}

uint64_t sub_2512A245C()
{
  return sub_2512A3FE4();
}

uint64_t sub_2512A2574(uint64_t a1, uint64_t a2)
{
  if (a2 == 1) {
    return sub_2512B7824();
  }
  else {
    return 0;
  }
}

id sub_2512A267C()
{
  uint64_t v1 = OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView____lazy_storage___spacerLabel;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView____lazy_storage___spacerLabel);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView____lazy_storage___spacerLabel);
  }
  else
  {
    id v4 = sub_2512A26E0(v0);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_2512A26E0(uint64_t a1)
{
  uint64_t v2 = sub_2512C47B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2512C4798();
  MEMORY[0x270FA5388](v6 - 8);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v7, sel_setTextAlignment_, 1);
  objc_msgSend(v7, sel_setNumberOfLines_, 0);
  LODWORD(v8) = 1148846080;
  objc_msgSend(v7, sel_setContentCompressionResistancePriority_forAxis_, 1, v8);
  LODWORD(v9) = 1148846080;
  objc_msgSend(v7, sel_setContentHuggingPriority_forAxis_, 1, v9);
  v13[1] = a1;
  sub_2512C4788();
  sub_2512C4778();
  sub_2512C4768();
  sub_2512C4778();
  sub_2512C47A8();
  type metadata accessor for OcclusionTutorialController.TopView();
  sub_2512B1764((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setText_, v10);

  LODWORD(v11) = 1144750080;
  objc_msgSend(v7, sel_setContentHuggingPriority_forAxis_, 1, v11);
  return v7;
}

id sub_2512A2960()
{
  type metadata accessor for OcclusionTutorialController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_2512C47C8();
  id v3 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v2, v1, 0);

  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v3);
  objc_msgSend(v4, sel_setContentMode_, 1);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v4, sel_setContentHuggingPriority_forAxis_, 1, v5);

  return v4;
}

id sub_2512A2A78()
{
  type metadata accessor for OcclusionTutorialController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_2512C47C8();
  id v3 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v2, v1, 0);

  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v3);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v4, sel_setContentMode_, 1);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v4, sel_setContentHuggingPriority_forAxis_, 1, v5);

  return v4;
}

id sub_2512A2B90()
{
  uint64_t v0 = (void *)sub_2512C47C8();
  id v1 = objc_msgSend(self, sel_systemImageNamed_, v0);

  if (v1)
  {
    id v2 = objc_msgSend(self, sel_redColor);
    id v3 = objc_msgSend(v1, sel_imageWithTintColor_renderingMode_, v2, 1);
  }
  else
  {
    id v3 = 0;
  }
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v3);

  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v5 = objc_msgSend(v4, sel_heightAnchor);
  id v6 = objc_msgSend(v5, sel_constraintEqualToConstant_, 25.0);

  objc_msgSend(v6, sel_setActive_, 1);
  id v7 = objc_msgSend(v4, sel_widthAnchor);
  id v8 = objc_msgSend(v7, sel_constraintEqualToConstant_, 25.0);

  objc_msgSend(v8, sel_setActive_, 1);
  return v4;
}

id sub_2512A2E48()
{
  return sub_2512A2FE4(type metadata accessor for OcclusionTutorialController.TopView);
}

id OcclusionTutorialController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void OcclusionTutorialController.init(nibName:bundle:)()
{
}

id OcclusionTutorialController.__deallocating_deinit()
{
  return sub_2512A2FE4(type metadata accessor for OcclusionTutorialController);
}

id sub_2512A2FE4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id _s13HearingModeUI22OcclusionAlertProviderV04makee3ForD8TryLaterSo17UIAlertControllerCyFZ_0()
{
  uint64_t v0 = sub_2512C47B8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  objc_super v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C4758();
  sub_2512B1764((uint64_t)v3);
  id v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v13 = v0;
  v4(v3, v0);
  sub_2512C4758();
  sub_2512B1764((uint64_t)v3);
  v4(v3, v0);
  id v5 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  id v6 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v5, v6, 1);

  sub_2512C4758();
  sub_2512B1764((uint64_t)v3);
  v4(v3, v13);
  id v8 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  aBlock[4] = CGPointMake;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_25129FCEC;
  aBlock[3] = &block_descriptor_65;
  double v9 = _Block_copy(aBlock);
  swift_release();
  id v10 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v8, 0, v9);
  _Block_release(v9);

  objc_msgSend(v7, sel_addAction_, v10);
  return v7;
}

id _s13HearingModeUI22OcclusionAlertProviderV04makee3ForD8Tutorial10deviceName17subsequentAttempt07presentI9UIHandlerSo17UIAlertControllerCSS_SbySo06UIViewQ0CctFZ_0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v30 = a2;
  uint64_t v31 = a5;
  uint64_t v33 = a4;
  int v32 = a3;
  uint64_t v29 = a1;
  uint64_t v5 = sub_2512C47B8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C4758();
  sub_2512B1764((uint64_t)v8);
  double v9 = *(void (**)(char *, uint64_t))(v6 + 8);
  v9(v8, v5);
  sub_2512C4758();
  sub_2512B1764((uint64_t)v8);
  v9(v8, v5);
  id v10 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  double v11 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v10, v11, 1);

  sub_2512C4758();
  sub_2512B1764((uint64_t)v8);
  id v34 = v9;
  v9(v8, v5);
  uint64_t v13 = (void *)swift_allocObject();
  void v13[2] = v29;
  uint64_t v14 = v31;
  uint64_t v15 = v33;
  v13[3] = v30;
  v13[4] = v15;
  v13[5] = v14;
  swift_bridgeObjectRetain();
  uint64_t v16 = v14;
  swift_retain();
  __n128 v17 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  uint64_t v39 = sub_2512A463C;
  uint64_t v40 = v13;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  id v37 = sub_25129FCEC;
  uint64_t v38 = &block_descriptor_50;
  uint64_t v18 = _Block_copy(&aBlock);
  swift_release();
  uint64_t v19 = self;
  id v20 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v17, 0, v18);
  _Block_release(v18);

  objc_msgSend(v12, sel_addAction_, v20);
  if (v32)
  {
    sub_2512C4758();
    sub_2512B1764((uint64_t)v8);
    v34(v8, v5);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v33;
    *(void *)(v21 + 24) = v16;
    swift_retain();
    id v22 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    uint64_t v39 = sub_2512A481C;
    uint64_t v40 = (void *)v21;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v36 = 1107296256;
    id v37 = sub_25129FCEC;
    uint64_t v38 = &block_descriptor_59;
    id v23 = _Block_copy(&aBlock);
    swift_release();
    id v24 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v22, 0, v23);
    _Block_release(v23);

    objc_msgSend(v12, sel_addAction_, v24);
  }
  sub_2512C4758();
  sub_2512B1764((uint64_t)v8);
  v34(v8, v5);
  uint64_t v25 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  uint64_t v39 = (void (*)())CGPointMake;
  uint64_t v40 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  id v37 = sub_25129FCEC;
  uint64_t v38 = &block_descriptor_53;
  uint64_t v26 = _Block_copy(&aBlock);
  swift_release();
  id v27 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v25, 1, v26);
  _Block_release(v26);

  objc_msgSend(v12, sel_addAction_, v27);
  return v12;
}

uint64_t sub_2512A3970()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2512A39A8()
{
  sub_2512A3CF4(*(void *)(v0 + 16), *(void *)(v0 + 24), 6, 1);
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

uint64_t sub_2512A39D0()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_2512A3A18()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  objc_super v3 = (void (*)(void))v0[4];
  uint64_t v4 = v0[6];
  unint64_t v5 = v0[7];
  id v6 = objc_allocWithZone((Class)type metadata accessor for OcclusionTutorialController());
  swift_bridgeObjectRetain();
  id v7 = OcclusionTutorialController.init(airPodName:)(v1, v2);
  objc_msgSend(v7, sel_setModalInPresentation_, 1);
  id v8 = objc_msgSend(v7, sel_navigationItem);
  sub_25129A74C(0, (unint64_t *)&unk_269B2DB50);
  sub_25129A74C(0, &qword_269B2D8F8);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v12 = v7;
  sub_2512C4A48();
  id v10 = (void *)sub_2512C49B8();
  objc_msgSend(v8, sel_setRightBarButtonItem_, v10, 0, 0, 0, sub_2512A45A4, v9);

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829B8]), sel_initWithRootViewController_, v12);
  v3();
  sub_2512A3CF4(v4, v5, 3, 3);
}

uint64_t sub_2512A3BE0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 36, 7);
}

void sub_2512A3C18()
{
  sub_2512A3CF4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned int *)(v0 + 32), 1);
}

uint64_t sub_2512A3C28()
{
  return objectdestroy_14Tm(MEMORY[0x263F8EED8], MEMORY[0x263F8EEA0], 52);
}

void sub_2512A3C58()
{
  uint64_t v1 = *(void (**)(void))(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(unsigned int *)(v0 + 48);
  id v5 = _s13HearingModeUI22OcclusionAlertProviderV04makee3ForD8TryLaterSo17UIAlertControllerCyFZ_0();
  v1();

  sub_2512A3CF4(v2, v3, v4, 4);
}

uint64_t type metadata accessor for OcclusionTutorialController()
{
  return self;
}

void sub_2512A3CF4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_269B2F5D0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2512C42B8();
  __swift_project_value_buffer(v8, (uint64_t)qword_269B31418);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_2512C4298();
  os_log_type_t v10 = sub_2512C49A8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v15 = v12;
    *(_DWORD *)uint64_t v11 = 136315650;
    swift_bridgeObjectRetain();
    sub_2512955F8(a1, a2, &v15);
    sub_2512C4A68();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 12) = 1024;
    sub_2512C4A68();
    *(_WORD *)(v11 + 18) = 1024;
    sub_2512C4A68();
    _os_log_impl(&dword_251285000, v9, v10, "sendOcclusionUserInteractions: with input %s %d %d", (uint8_t *)v11, 0x18u);
    swift_arrayDestroy();
    MEMORY[0x25339B730](v12, -1, -1);
    MEMORY[0x25339B730](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F472F8]), sel_init);
  uint64_t v14 = (void *)sub_2512C47C8();
  objc_msgSend(v13, sel_occlusionIndicationShownForDeviceAddress_featureID_type_action_, v14, 3, a3, a4);
}

void sub_2512A3F3C()
{
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___table] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonCell] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___learnButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonSpecifier] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewCell] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewSpecifier] = 0;

  sub_2512C4B48();
  __break(1u);
}

uint64_t sub_2512A3FE4()
{
  uint64_t v1 = sub_2512C3F18();
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  if (v1)
  {
    uint64_t v11 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8);
    unint64_t v3 = (void *)v11();
    uint64_t v4 = (void *)(*(uint64_t (**)(void))((*v2 & *v0) + 0xD8))();
    objc_msgSend(v3, sel_refreshCellContentsWithSpecifier_, v4);

    id v5 = v11;
  }
  else
  {
    uint64_t v12 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0);
    id v6 = (void *)v12();
    id v7 = (void *)(*(uint64_t (**)(void))((*v2 & *v0) + 0x108))();
    objc_msgSend(v6, sel_refreshCellContentsWithSpecifier_, v7);

    uint64_t v8 = (void *)v12();
    id v9 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v8, sel_setBackgroundColor_, v9);

    id v5 = v12;
  }
  return v5();
}

ValueMetadata *type metadata accessor for OcclusionAlertProvider()
{
  return &type metadata for OcclusionAlertProvider;
}

uint64_t method lookup function for OcclusionTutorialController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for OcclusionTutorialController);
}

uint64_t dispatch thunk of OcclusionTutorialController.__allocating_init(airPodName:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of OcclusionTutorialController.numberOfSections(in:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of OcclusionTutorialController.tableView(_:numberOfRowsInSection:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of OcclusionTutorialController.tableView(_:cellForRowAt:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of OcclusionTutorialController.tableView(_:titleForFooterInSection:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t type metadata accessor for OcclusionTutorialController.TopView()
{
  return self;
}

void type metadata accessor for HMOcclusionIndicationType(uint64_t a1)
{
}

void sub_2512A4338()
{
  *(void *)&v0[OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView____lazy_storage___spacerLabel] = 0;
  uint64_t v1 = OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_leftBudImageView;
  *(void *)&v0[v1] = sub_2512A2960();
  uint64_t v2 = OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_rightBudImageView;
  *(void *)&v0[v2] = sub_2512A2A78();
  uint64_t v3 = OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_leftStatusMarkImage;
  *(void *)&v0[v3] = sub_2512A2B90();
  uint64_t v4 = OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_rightStatusMarkImage;
  *(void *)&v0[v4] = sub_2512A2B90();

  sub_2512C4B48();
  __break(1u);
}

uint64_t sub_2512A441C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2512A4470()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2512A44A8()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_titleLabel);
  if (v1)
  {
    id v4 = v1;
    id v2 = objc_msgSend(self, sel__preferredFontForTextStyle_weight_, *MEMORY[0x263F83570], *MEMORY[0x263F81838]);
    if (v2)
    {
      uint64_t v3 = v2;
      objc_msgSend(v4, sel_setFont_, v2);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_2512A456C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2512A45A8()
{
  return objectdestroy_14Tm(MEMORY[0x263F8EEA0], MEMORY[0x263F8EED8], 48);
}

uint64_t objectdestroy_14Tm(void (*a1)(void), void (*a2)(void), uint64_t a3)
{
  a1(*(void *)(v3 + 24));
  a2(*(void *)(v3 + 40));
  return MEMORY[0x270FA0238](v3, a3, 7);
}

void sub_2512A463C()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (void (*)(void))v0[4];
  id v4 = objc_allocWithZone((Class)type metadata accessor for OcclusionTutorialController());
  swift_bridgeObjectRetain();
  id v5 = OcclusionTutorialController.init(airPodName:)(v1, v2);
  objc_msgSend(v5, sel_setModalInPresentation_, 1);
  id v6 = objc_msgSend(v5, sel_navigationItem);
  sub_25129A74C(0, (unint64_t *)&unk_269B2DB50);
  sub_25129A74C(0, &qword_269B2D8F8);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  id v10 = v5;
  sub_2512C4A48();
  uint64_t v8 = (void *)sub_2512C49B8();
  objc_msgSend(v6, sel_setRightBarButtonItem_, v8, 0, 0, 0, sub_2512A45A4, v7);

  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829B8]), sel_initWithRootViewController_, v10);
  v3();
}

uint64_t sub_2512A47E4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2512A481C()
{
  uint64_t v1 = *(void (**)(void))(v0 + 16);
  id v2 = _s13HearingModeUI22OcclusionAlertProviderV04makee3ForD8TryLaterSo17UIAlertControllerCyFZ_0();
  v1();
}

void sub_2512A4868()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_navigationController);
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(v1, sel_presentingViewController);

    if (v3)
    {
      objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, 0);
    }
  }
}

uint64_t sub_2512A4948()
{
  uint64_t v0 = sub_2512C42B8();
  __swift_allocate_value_buffer(v0, qword_269B31430);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B31430);
  return sub_2512C42A8();
}

uint64_t sub_2512A49C8()
{
  if (qword_269B2F8E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2512C42B8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B31430);
}

uint64_t sub_2512A4A2C@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B2F8E0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B31430);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

BOOL static HeadphoneAccessoryCellUIContainer.ContentViewStyleType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t HeadphoneAccessoryCellUIContainer.ContentViewStyleType.hash(into:)()
{
  return sub_2512C4C38();
}

uint64_t HeadphoneAccessoryCellUIContainer.ContentViewStyleType.hashValue.getter()
{
  return sub_2512C4C48();
}

void *sub_2512A4B64()
{
  return &unk_2653663C0;
}

unint64_t static HeadphoneAccessoryCellUIContainer.embeddedViewKey.getter()
{
  return 0xD000000000000031;
}

void *sub_2512A4BCC()
{
  return &unk_2653663D0;
}

unint64_t static HeadphoneAccessoryCellUIContainer.fullBoundsTreatmentKey.getter()
{
  return 0xD000000000000038;
}

void sub_2512A4C34()
{
  qword_269B2F8F0 = 0x656369766564;
  unk_269B2F8F8 = 0xE600000000000000;
}

uint64_t *sub_2512A4C54()
{
  if (qword_269B2F8E8 != -1) {
    swift_once();
  }
  return &qword_269B2F8F0;
}

uint64_t static HeadphoneAccessoryCellUIContainer.deviceKey.getter()
{
  if (qword_269B2F8E8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_269B2F8F0;
  swift_bridgeObjectRetain();
  return v0;
}

id sub_2512A4D94(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = v4;
  if (a3)
  {
    uint64_t v8 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(objc_allocWithZone(v5), sel_initWithStyle_reuseIdentifier_specifier_, a1, v8, a4);

  return v9;
}

id sub_2512A4E24(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)&v4[OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer____lazy_storage___stackView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer_traiRegestration] = 0;
  if (a3)
  {
    uint64_t v7 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for HeadphoneAccessoryCellUIContainer();
  id v8 = objc_msgSendSuper2(&v11, sel_initWithStyle_reuseIdentifier_specifier_, a1, v7, a4);

  if (v8)
  {

    id v9 = v8;
    objc_msgSend(v9, sel_setAccessoryType_, 1);
  }
  return v8;
}

uint64_t type metadata accessor for HeadphoneAccessoryCellUIContainer()
{
  return self;
}

id sub_2512A4F9C()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer____lazy_storage___stackView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer____lazy_storage___stackView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer____lazy_storage___stackView);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_2512A5010(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer____lazy_storage___stackView) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_2512A5024(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = sub_2512A4F9C();
  return sub_2512A506C;
}

void sub_2512A506C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer____lazy_storage___stackView);
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer____lazy_storage___stackView) = v2;
}

id sub_2512A5084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  if (a3)
  {
    id v6 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id sub_2512A5100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer____lazy_storage___stackView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer_traiRegestration] = 0;
  if (a3)
  {
    id v5 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for HeadphoneAccessoryCellUIContainer();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithStyle_reuseIdentifier_, a1, v5);

  objc_msgSend(v6, sel_setAccessoryType_, 0);
  return v6;
}

void sub_2512A51FC()
{
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer____lazy_storage___stackView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer_traiRegestration] = 0;

  sub_2512C4B48();
  __break(1u);
}

uint64_t sub_2512A52F8()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_2512A5344(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer_traiRegestration);
  swift_beginAccess();
  *id v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_2512A5398())()
{
  return j__swift_endAccess;
}

void sub_2512A53F4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = sub_2512C4318();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  objc_super v11 = (char *)&v62 - v10;
  if (!a1)
  {
    __break(1u);
    return;
  }
  if (objc_msgSend(a1, sel_userInfo))
  {
    sub_2512C4AB8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v69 = 0u;
    long long v70 = 0u;
  }
  sub_25129AFB0((uint64_t)&v69, (uint64_t)v72);
  if (!v73) {
    goto LABEL_16;
  }
  sub_25129A74C(0, &qword_269B2DBE0);
  if (swift_dynamicCast())
  {
    uint64_t v64 = v5;
    uint64_t v65 = v6;
    uint64_t v12 = *(void **)&v68[0];
    *(void *)&long long v69 = 0xD000000000000031;
    *((void *)&v69 + 1) = 0x80000002512CC010;
    uint64_t v13 = sub_2512C4BE8();
    id v66 = v12;
    id v14 = objc_msgSend(v12, sel___swift_objectForKeyedSubscript_, v13);
    swift_unknownObjectRelease();
    if (v14)
    {
      sub_2512C4AB8();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v69 = 0u;
      long long v70 = 0u;
    }
    sub_25129AFB0((uint64_t)&v69, (uint64_t)v72);
    if (v73)
    {
      sub_25129A74C(0, &qword_269B2DBE8);
      if ((swift_dynamicCast() & 1) == 0)
      {

        goto LABEL_18;
      }
      id v15 = *(id *)&v68[0];
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DBF0);
      if (swift_dynamicCast())
      {
        id v63 = v15;
        sub_2512A61CC(&v69, (uint64_t)v72);
        sub_2512C42D8();
        *(void *)&v68[0] = 0xD000000000000038;
        *((void *)&v68[0] + 1) = 0x80000002512CC050;
        id v16 = objc_msgSend(v66, sel___swift_objectForKeyedSubscript_, sub_2512C4BE8());
        swift_unknownObjectRelease();
        if (v16)
        {
          sub_2512C4AB8();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v68, 0, sizeof(v68));
        }
        sub_25129AFB0((uint64_t)v68, (uint64_t)&v69);
        if (*((void *)&v70 + 1))
        {
          if (swift_dynamicCast())
          {
            id v26 = v63;
            if (v67)
            {
              id v27 = objc_msgSend(v2, sel_contentView);
              objc_msgSend(v27, sel_addSubview_, v26);

              sub_2512A5EC4(v72);
              id v28 = objc_msgSend(v2, sel_contentView);
              objc_msgSend(v26, sel_pinToOther_, v28);

              objc_msgSend(v2, sel_setAccessoryType_, 0);
              objc_msgSend(v2, sel_setNeedsLayout);
              objc_msgSend(v2, sel_layoutIfNeeded);

              (*(void (**)(char *, uint64_t))(v65 + 8))(v11, v64);
LABEL_35:
              __swift_destroy_boxed_opaque_existential_0((uint64_t)v72);
              return;
            }
LABEL_32:
            uint64_t v29 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x78))();
            swift_unknownObjectRelease();
            if (!v29)
            {
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2DB40);
              uint64_t v30 = swift_allocObject();
              *(_OWORD *)(v30 + 16) = xmmword_2512C6440;
              uint64_t v31 = sub_2512C4328();
              uint64_t v32 = MEMORY[0x263F82018];
              *(void *)(v30 + 32) = v31;
              *(void *)(v30 + 40) = v32;
              uint64_t v33 = v64;
              (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v9, v11, v64);
              sub_2512A61E4((uint64_t)v72, (uint64_t)&v69);
              unint64_t v34 = (*(unsigned __int8 *)(v65 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80);
              unint64_t v35 = (v7 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
              unint64_t v36 = (v35 + 47) & 0xFFFFFFFFFFFFFFF8;
              uint64_t v37 = swift_allocObject();
              (*(void (**)(unint64_t, char *, uint64_t))(v65 + 32))(v37 + v34, v9, v33);
              uint64_t v38 = v37 + v35;
              id v26 = v63;
              sub_2512A61CC(&v69, v38);
              *(void *)(v37 + v36) = ObjectType;
              uint64_t v39 = sub_2512C4A28();
              swift_bridgeObjectRelease();
              swift_release();
              (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v2) + 0x80))(v39);
            }
            id v40 = objc_msgSend(v2, sel_contentView);
            objc_msgSend(v40, sel_addSubview_, v26);

            sub_2512A5EC4(v72);
            id v63 = self;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2D900);
            uint64_t v41 = swift_allocObject();
            *(_OWORD *)(v41 + 16) = xmmword_2512C6B50;
            id v42 = objc_msgSend(v26, sel_leadingAnchor);
            id v43 = objc_msgSend(v2, sel_layoutMarginsGuide);
            id v44 = objc_msgSend(v43, sel_leadingAnchor);

            id v45 = objc_msgSend(v42, sel_constraintEqualToAnchor_, v44);
            *(void *)(v41 + 32) = v45;
            id v46 = objc_msgSend(v26, sel_trailingAnchor);
            id v47 = objc_msgSend(v2, sel_layoutMarginsGuide);
            id v48 = objc_msgSend(v47, sel_trailingAnchor);

            id v49 = objc_msgSend(v46, byte_2653662EE, v48);
            *(void *)(v41 + 40) = v49;
            id v50 = objc_msgSend(v26, sel_topAnchor);
            uint64_t v51 = v65;
            id v52 = objc_msgSend(v2, sel_contentView);
            id v53 = objc_msgSend(v52, sel_layoutMarginsGuide);

            id v54 = objc_msgSend(v53, sel_topAnchor);
            id v55 = objc_msgSend(v50, sel_constraintEqualToAnchor_, v54);

            *(void *)(v41 + 48) = v55;
            id v56 = objc_msgSend(v26, sel_bottomAnchor);
            id v57 = objc_msgSend(v2, sel_contentView);
            id v58 = objc_msgSend(v57, sel_layoutMarginsGuide);

            id v59 = objc_msgSend(v58, sel_bottomAnchor);
            id v60 = objc_msgSend(v56, sel_constraintEqualToAnchor_, v59);

            *(void *)(v41 + 56) = v60;
            *(void *)&long long v69 = v41;
            sub_2512C4898();
            sub_25129A74C(0, &qword_269B2D858);
            id v61 = (void *)sub_2512C4868();
            swift_bridgeObjectRelease();
            objc_msgSend(v63, sel_activateConstraints_, v61);

            objc_msgSend(v2, sel_setAccessoryType_, 0);
            objc_msgSend(v2, sel_setNeedsLayout);
            objc_msgSend(v2, sel_layoutIfNeeded);

            (*(void (**)(char *, uint64_t))(v51 + 8))(v11, v64);
            goto LABEL_35;
          }
        }
        else
        {
          sub_25129F330((uint64_t)&v69, &qword_269B2DBD0);
        }
        id v26 = v63;
        goto LABEL_32;
      }
      uint64_t v71 = 0;
      long long v69 = 0u;
      long long v70 = 0u;

      __n128 v17 = (uint64_t *)&unk_269B2DBF8;
      uint64_t v18 = &v69;
      goto LABEL_17;
    }

LABEL_16:
    __n128 v17 = &qword_269B2DBD0;
    uint64_t v18 = (long long *)v72;
LABEL_17:
    sub_25129F330((uint64_t)v18, v17);
  }
LABEL_18:
  if (qword_269B2F8E0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_2512C42B8();
  __swift_project_value_buffer(v19, (uint64_t)qword_269B31430);
  id v20 = a1;
  uint64_t v21 = sub_2512C4298();
  os_log_type_t v22 = sub_2512C4988();
  if (os_log_type_enabled(v21, v22))
  {
    id v23 = (uint8_t *)swift_slowAlloc();
    id v24 = (void *)swift_slowAlloc();
    *(_DWORD *)id v23 = 138412290;
    v72[0] = v20;
    id v25 = v20;
    sub_2512C4A68();
    *id v24 = a1;

    _os_log_impl(&dword_251285000, v21, v22, "HearingTopLevelCell refreshCellContents dependencies not meet %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DBD8);
    swift_arrayDestroy();
    MEMORY[0x25339B730](v24, -1, -1);
    MEMORY[0x25339B730](v23, -1, -1);
  }
  else
  {
  }
}

void sub_2512A5EC4(void *a1)
{
  uint64_t v2 = sub_2512C42F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_0(a1, v6);
  uint64_t v8 = self;
  double v9 = *MEMORY[0x263F81838];
  id v10 = objc_msgSend(v8, sel__preferredFontForTextStyle_weight_, *MEMORY[0x263F83570], *MEMORY[0x263F81838]);
  if (v10)
  {
    objc_super v11 = v10;
    sub_2512C4308();
    uint64_t v12 = (void *)sub_2512C42E8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    char v19 = 0;
    uint64_t v13 = *(void (**)(void *, void *, char *, uint64_t, uint64_t))(v7 + 8);
    v13(v11, v12, &v19, v6, v7);

    id v14 = objc_msgSend(v8, sel__preferredFontForTextStyle_weight_, *MEMORY[0x263F83580], v9);
    if (v14)
    {
      id v15 = v14;
      id v16 = objc_msgSend(self, sel_secondaryLabelColor);
      char v18 = 1;
      v13(v15, v16, &v18, v6, v7);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id HeadphoneAccessoryCellUIContainer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneAccessoryCellUIContainer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2512A61CC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2512A61E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2512A6248()
{
  uint64_t v1 = sub_2512C4318();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  __swift_destroy_boxed_opaque_existential_0(v0 + v6);
  return MEMORY[0x270FA0238](v0, ((v6 + 47) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

void sub_2512A62F4()
{
  uint64_t v1 = *(void *)(sub_2512C4318() - 8);
  uint64_t v2 = (void *)(v0
                + ((*(void *)(v1 + 64)
                  + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
                  + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_2512A5EC4(v2);
}

unint64_t sub_2512A6384()
{
  unint64_t result = qword_269B2DC08;
  if (!qword_269B2DC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2DC08);
  }
  return result;
}

uint64_t dispatch thunk of ContentViewStyleable.update(newFont:newColor:styleType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t method lookup function for HeadphoneAccessoryCellUIContainer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HeadphoneAccessoryCellUIContainer);
}

unsigned char *storeEnumTagSinglePayload for HeadphoneAccessoryCellUIContainer.ContentViewStyleType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2512A64D0);
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

ValueMetadata *type metadata accessor for HeadphoneAccessoryCellUIContainer.ContentViewStyleType()
{
  return &type metadata for HeadphoneAccessoryCellUIContainer.ContentViewStyleType;
}

unint64_t FaultCheckResultType.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t sub_2512A651C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_2512A655C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

uint64_t sub_2512A6568(uint64_t a1)
{
  return sub_2512A65B8(a1, 0x80000002512CC1D0, MEMORY[0x263F47348]);
}

uint64_t sub_2512A6590(uint64_t a1)
{
  return sub_2512A65B8(a1, 0x80000002512CC200, MEMORY[0x263F47448]);
}

uint64_t sub_2512A65B8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2512A6668(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24)) {
    return 1;
  }
  else {
    return sub_2512C4BC8();
  }
}

uint64_t sub_2512A6698()
{
  swift_bridgeObjectRetain();
  sub_2512C4828();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2512A66F0()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2512A6710()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_2512A6748()
{
  sub_2512C4C28();
  (*(void (**)(unsigned char *))(*(void *)v0 + 112))(v2);
  return sub_2512C4C48();
}

uint64_t sub_2512A67AC()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t sub_2512A67EC()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t sub_2512A6810()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

uint64_t sub_2512A6854()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 112))();
}

uint64_t sub_2512A6898()
{
  sub_2512C4C28();
  (*(void (**)(unsigned char *))(**(void **)v0 + 112))(v2);
  return sub_2512C4C48();
}

uint64_t sub_2512A68F8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)a1 + 16) == *(void *)(*(void *)a2 + 16)
    && *(void *)(*(void *)a1 + 24) == *(void *)(*(void *)a2 + 24))
  {
    return 1;
  }
  else
  {
    return sub_2512C4BC8();
  }
}

uint64_t sub_2512A6924()
{
  type metadata accessor for HMFaultCheckService.FaultCheckObserver();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0xD000000000000012;
  *(void *)(result + 24) = 0x80000002512CC230;
  return result;
}

uint64_t type metadata accessor for HMFaultCheckService.FaultCheckObserver()
{
  return self;
}

uint64_t sub_2512A6988()
{
  return swift_retain();
}

uint64_t sub_2512A699C()
{
  return swift_retain();
}

uint64_t sub_2512A69AC()
{
  uint64_t v0 = sub_2512C3F48();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C3FD8();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x263F47338])
  {
    sub_2512C3ED8();
    return 0;
  }
  else if (v4 == *MEMORY[0x263F47330])
  {
    sub_2512C3ED8();
    return 1;
  }
  else
  {
    if (v4 == *MEMORY[0x263F47340])
    {
      sub_2512C3ED8();
    }
    else
    {
      sub_2512C3ED8();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    }
    return 2;
  }
}

id HMFaultCheckService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id HMFaultCheckService.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI19HMFaultCheckService_observer;
  type metadata accessor for HMFaultCheckService.FaultCheckObserver();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0xD000000000000012;
  *(void *)(v2 + 24) = 0x80000002512CC230;
  *(void *)&v0[v1] = v2;
  uint64_t v3 = OBJC_IVAR____TtC13HearingModeUI19HMFaultCheckService_manager;
  int v4 = v0;
  *(void *)&v0[v3] = sub_2512C40C8();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for HMFaultCheckService();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for HMFaultCheckService()
{
  return self;
}

id HMFaultCheckService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HMFaultCheckService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2512A6DC4()
{
  unint64_t result = qword_269B2DCF0;
  if (!qword_269B2DCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2DCF0);
  }
  return result;
}

uint64_t sub_2512A6E18()
{
  return sub_2512A6E80(&qword_269B2DCF8);
}

uint64_t sub_2512A6E4C()
{
  return sub_2512A6E80(&qword_269B2DD00);
}

uint64_t sub_2512A6E80(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for HMFaultCheckService.FaultCheckObserver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for FaultCheckResultType()
{
  return &type metadata for FaultCheckResultType;
}

uint64_t method lookup function for HMFaultCheckService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HMFaultCheckService);
}

uint64_t dispatch thunk of HMFaultCheckService.faultCheckResult()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

BOOL sub_2512A6F1C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2512A6F2C()
{
  return sub_2512C4C38();
}

uint64_t sub_2512A6F54()
{
  return sub_2512C4C48();
}

uint64_t sub_2512A6F9C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC13HearingModeUI23HMSuggestionsController_suggestionType);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2512A6FE4(char a1)
{
  char v2 = a1 & 1;
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC13HearingModeUI23HMSuggestionsController_suggestionType);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t (*sub_2512A7038())()
{
  return j__swift_endAccess;
}

char *sub_2512A7094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char v6 = a5 & 1;
  uint64_t v7 = objc_allocWithZone(v5);
  v7[OBJC_IVAR____TtC13HearingModeUI23HMSuggestionsController_suggestionType] = 0;
  uint64_t v8 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  double v9 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  v13.receiver = v7;
  v13.super_class = v5;
  id v10 = (char *)objc_msgSendSuper2(&v13, sel_initWithTitle_detailText_icon_contentLayout_, v8, v9, 0, 2);

  objc_super v11 = &v10[OBJC_IVAR____TtC13HearingModeUI23HMSuggestionsController_suggestionType];
  swift_beginAccess();
  char *v11 = v6;
  return v10;
}

char *sub_2512A7180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char v6 = a5 & 1;
  v5[OBJC_IVAR____TtC13HearingModeUI23HMSuggestionsController_suggestionType] = 0;
  uint64_t v7 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for HMSuggestionsController();
  double v9 = (char *)objc_msgSendSuper2(&v12, sel_initWithTitle_detailText_icon_contentLayout_, v7, v8, 0, 2);

  id v10 = &v9[OBJC_IVAR____TtC13HearingModeUI23HMSuggestionsController_suggestionType];
  swift_beginAccess();
  *id v10 = v6;
  return v9;
}

uint64_t type metadata accessor for HMSuggestionsController()
{
  return self;
}

void sub_2512A727C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2512C47B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v6 = (objc_class *)type metadata accessor for HMSuggestionsController();
  v51.receiver = v0;
  v51.super_class = v6;
  uint64_t v7 = v6;
  id v8 = objc_msgSendSuper2(&v51, sel_viewDidLoad);
  char v9 = (*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v0) + 0x58))(v8);
  id v10 = (void (**)(char *, uint64_t))(v3 + 8);
  id v49 = v7;
  id v50 = v0;
  if (v9)
  {
    sub_2512C4758();
    sub_2512B1764((uint64_t)v5);
    id v48 = *v10;
    uint64_t v30 = v2;
    v48(v5, v2);
    uint64_t v31 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    uint64_t v32 = (void *)sub_2512C47C8();
    uint64_t v33 = (void *)sub_2512C47C8();
    unint64_t v34 = (void (*)(char *, uint64_t))self;
    id v46 = v34;
    id v35 = objc_msgSend(v34, sel_systemBlueColor);
    objc_msgSend(v1, sel_addBulletedListItemWithTitle_description_symbolName_tintColor_, v31, v32, v33, v35);

    id v50 = v1;
    sub_2512C4758();
    sub_2512B1764((uint64_t)v5);
    unint64_t v36 = v48;
    v48(v5, v30);
    uint64_t v37 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    uint64_t v38 = (void *)sub_2512C47C8();
    uint64_t v39 = (void *)sub_2512C47C8();
    id v40 = objc_msgSend(v34, sel_systemBlueColor);
    objc_msgSend(v1, sel_addBulletedListItemWithTitle_description_symbolName_tintColor_, v37, v38, v39, v40);

    id v50 = v1;
    sub_2512C4758();
    sub_2512B1764((uint64_t)v5);
    v36(v5, v30);
    uint64_t v41 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    id v42 = (void *)sub_2512C47C8();
    id v27 = (id)sub_2512C47C8();
    id v29 = objc_msgSend(v46, sel_systemBlueColor);
    objc_msgSend(v1, sel_addBulletedListItemWithTitle_description_symbolName_tintColor_, v41, v42, v27, v29);
  }
  else
  {
    sub_2512C4758();
    sub_2512B1764((uint64_t)v5);
    objc_super v11 = *v10;
    uint64_t v47 = v2;
    v11(v5, v2);
    objc_super v12 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    id v50 = v0;
    sub_2512C4758();
    sub_2512B1764((uint64_t)v5);
    v11(v5, v2);
    objc_super v13 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    id v14 = (void *)sub_2512C47C8();
    id v48 = (void (*)(char *, uint64_t))self;
    id v15 = objc_msgSend(v48, sel_systemBlueColor);
    objc_msgSend(v1, sel_addBulletedListItemWithTitle_description_symbolName_tintColor_, v12, v13, v14, v15);

    id v50 = v1;
    sub_2512C4758();
    sub_2512B1764((uint64_t)v5);
    uint64_t v16 = v47;
    uint64_t v17 = v11;
    id v46 = v11;
    v11(v5, v47);
    char v18 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    id v50 = v1;
    sub_2512C4758();
    sub_2512B1764((uint64_t)v5);
    v17(v5, v16);
    char v19 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    id v20 = (void *)sub_2512C47C8();
    id v21 = objc_msgSend(v48, sel_systemBlueColor);
    objc_msgSend(v1, sel_addBulletedListItemWithTitle_description_symbolName_tintColor_, v18, v19, v20, v21);

    id v50 = v1;
    sub_2512C4758();
    sub_2512B1764((uint64_t)v5);
    os_log_type_t v22 = v46;
    v46(v5, v16);
    uint64_t v45 = sub_2512C47C8();
    swift_bridgeObjectRelease();
    id v50 = v1;
    sub_2512C4758();
    sub_2512B1764((uint64_t)v5);
    v22(v5, v16);
    id v23 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    id v24 = (void *)sub_2512C47C8();
    id v25 = objc_msgSend(v48, sel_systemBlueColor);
    id v26 = (void *)v45;
    objc_msgSend(v1, sel_addBulletedListItemWithTitle_description_symbolName_tintColor_, v45, v23, v24, v25);

    id v27 = objc_msgSend(self, sel_linkButton);
    id v50 = v1;
    sub_2512C4758();
    sub_2512B1764((uint64_t)v5);
    v22(v5, v16);
    id v28 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    objc_msgSend(v27, sel_setTitle_forState_, v28, 0);

    objc_msgSend(v27, sel_addTarget_action_forControlEvents_, v1, sel_earTipSuggestionTapped, 64);
    id v29 = objc_msgSend(v1, sel_buttonTray);
    objc_msgSend(v29, sel_addButton_, v27);
  }

  id v43 = objc_msgSend(v1, sel_navigationItem);
  id v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 0, v1, sel_buttonTapped);
  objc_msgSend(v43, sel_setRightBarButtonItem_, v44);
}

void sub_2512A7C7C()
{
  id v1 = objc_msgSend(v0, sel_navigationController);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

void sub_2512A7D74()
{
}

void sub_2512A7DD4()
{
}

id sub_2512A7E38()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HMSuggestionsController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2512A80AC()
{
  unint64_t result = qword_269B2DD10;
  if (!qword_269B2DD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2DD10);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SuggestionType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2512A81CCLL);
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

ValueMetadata *type metadata accessor for SuggestionType()
{
  return &type metadata for SuggestionType;
}

uint64_t sub_2512A8204(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D830);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL sub_2512A8268(unsigned __int8 a1, unsigned __int8 a2)
{
  return a1 < a2;
}

uint64_t sub_2512A8278(uint64_t result)
{
  return result;
}

double sub_2512A8280(char a1)
{
  return dbl_2512C76E8[a1];
}

uint64_t sub_2512A8294(unsigned __int8 a1)
{
  uint64_t v2 = sub_2512C47B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = a1;
  switch(a1)
  {
    case 1u:
    case 2u:
      type metadata accessor for FitNoiseAirpodPlacementVideoController();
      sub_2512C4758();
      uint64_t v6 = sub_2512B1764((uint64_t)v5);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      break;
    case 3u:
      type metadata accessor for FitNoiseAirpodPlacementVideoController();
      sub_2512C4758();
      uint64_t v6 = sub_2512B1764((uint64_t)v5);
      uint64_t v7 = *(void (**)(char *, uint64_t))(v3 + 8);
      v7(v5, v2);
      sub_2512C4758();
      sub_2512B1764((uint64_t)v5);
      v7(v5, v2);
      break;
    default:
      return v6;
  }
  return v6;
}

BOOL sub_2512A84D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_2512A84E4@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_2512AAAD0(*a1);
  *a2 = result;
  return result;
}

BOOL sub_2512A8510(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_2512A8524(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_2512A8538(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_2512A854C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

id sub_2512A8560()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_movieView));
}

id sub_2512A8570()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_firstLabel));
}

id sub_2512A8580()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_secondLabel));
}

id sub_2512A8590()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_centerLabel));
}

uint64_t sub_2512A85A0()
{
  id v1 = v0;
  uint64_t v2 = sub_2512C46C8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2512C46E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2512C4708();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  id v50 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  objc_super v51 = (char *)&v48 - v14;
  id v15 = (unsigned __int8 *)&v0[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_viewState];
  swift_beginAccess();
  uint64_t v16 = *v15;
  uint64_t v57 = v3;
  uint64_t v58 = v2;
  uint64_t v55 = v6;
  id v56 = v5;
  id v53 = v9;
  uint64_t v54 = v7;
  uint64_t v59 = v10;
  uint64_t v52 = v11;
  switch(v16)
  {
    case 1:
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = v1;
      id v29 = *(void **)&v1[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_centerLabel];
      uint64_t v30 = v1;
      sub_2512A8294(1u);
      swift_bridgeObjectRelease();
      uint64_t v31 = (void *)sub_2512C47C8();
      swift_bridgeObjectRelease();
      objc_msgSend(v29, sel_setText_, v31);

      char v19 = sub_2512AB5CC;
      break;
    case 2:
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = v1;
      id v20 = *(void **)&v1[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_centerLabel];
      id v21 = v1;
      sub_2512A8294(2u);
      swift_bridgeObjectRelease();
      os_log_type_t v22 = (void *)sub_2512C47C8();
      swift_bridgeObjectRelease();
      objc_msgSend(v20, sel_setText_, v22);

      char v19 = sub_2512AB5CC;
      break;
    case 3:
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = v1;
      id v23 = v1;
      id v24 = objc_msgSend(v23, sel_traitCollection);
      id v25 = objc_msgSend(v24, sel_layoutDirection);

      id v26 = *(void **)&v23[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_firstLabel];
      sub_2512A8294(*v15);
      swift_bridgeObjectRelease();
      if (v25 == (id)1)
      {
        id v27 = (void *)sub_2512C47C8();
        swift_bridgeObjectRelease();
        objc_msgSend(v26, sel_setText_, v27);
      }
      else
      {
        uint64_t v32 = (void *)sub_2512C47C8();
        swift_bridgeObjectRelease();
        objc_msgSend(v26, sel_setText_, v32);
      }
      id v28 = *(void **)&v23[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_secondLabel];
      sub_2512A8294(*v15);
      swift_bridgeObjectRelease();
      uint64_t v33 = (void *)sub_2512C47C8();
      swift_bridgeObjectRelease();
      objc_msgSend(v28, sel_setText_, v33);

      char v19 = (uint64_t (*)())sub_2512AB280;
      break;
    default:
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = v1;
      char v18 = v1;
      char v19 = (uint64_t (*)())sub_2512AB600;
      break;
  }
  unint64_t v34 = v19;
  id v35 = self;
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = v34;
  *(void *)(v36 + 24) = v17;
  uint64_t v64 = sub_2512AB354;
  uint64_t v65 = (void *)v36;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v61 = 1107296256;
  uint64_t v62 = sub_251298D30;
  id v63 = &block_descriptor_28;
  uint64_t v37 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v35, sel_animateWithDuration_animations_, v37, 0.3);
  _Block_release(v37);
  if (*v15 == 3) {
    return swift_release();
  }
  sub_25129A74C(0, (unint64_t *)&qword_269B2D910);
  uint64_t v49 = sub_2512C4A08();
  uint64_t v39 = v50;
  sub_2512C46F8();
  id v40 = v51;
  MEMORY[0x25339A980](v39, 2.0);
  uint64_t v52 = *(void *)(v52 + 8);
  ((void (*)(char *, uint64_t))v52)(v39, v59);
  uint64_t v41 = (void *)swift_allocObject();
  v41[2] = v34;
  v41[3] = v17;
  v41[4] = v1;
  uint64_t v64 = sub_2512AB3C0;
  uint64_t v65 = v41;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v61 = 1107296256;
  uint64_t v62 = sub_251298D30;
  id v63 = &block_descriptor_34;
  id v42 = _Block_copy(&aBlock);
  id v43 = v1;
  swift_retain();
  swift_release();
  id v44 = v53;
  sub_2512C46D8();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_2512AB518();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE00);
  sub_2512AB570();
  uint64_t v45 = v56;
  uint64_t v46 = v58;
  sub_2512C4AC8();
  uint64_t v47 = (void *)v49;
  MEMORY[0x25339AC60](v40, v44, v45, v42);
  _Block_release(v42);

  swift_release();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v45, v46);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v44, v55);
  return ((uint64_t (*)(char *, uint64_t))v52)(v40, v59);
}

uint64_t sub_2512A8D48()
{
  id v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_viewState);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2512A8D90(char a1)
{
  uint64_t v3 = (unsigned char *)(v1
               + OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_viewState);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return sub_2512A85A0();
}

uint64_t (*sub_2512A8DE8(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2512A8E48;
}

uint64_t sub_2512A8E48(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_2512A85A0();
  }
  return result;
}

char *sub_2512A8E7C(void *a1, double a2, double a3, double a4, double a5)
{
  id v11 = objc_allocWithZone(v5);
  return sub_2512A8EE0(a1, a2, a3, a4, a5);
}

char *sub_2512A8EE0(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v11 = OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_firstLabel;
  uint64_t v12 = v5;
  *(void *)&v5[v11] = sub_2512AA964();
  uint64_t v13 = OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_secondLabel;
  *(void *)&v12[v13] = sub_2512AA964();
  uint64_t v14 = OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_centerLabel;
  *(void *)&v12[v14] = sub_2512AA964();
  v12[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_viewState] = 0;
  id v15 = &v12[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_listener];
  *(_OWORD *)id v15 = 0u;
  *((_OWORD *)v15 + 1) = 0u;
  *(void *)&v12[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_movieView] = a1;
  uint64_t v16 = a1;

  v77.receiver = v12;
  v77.super_class = (Class)type metadata accessor for FitNoiseAirpodPlacementVideoController.TopVideoPlacmentView();
  uint64_t v17 = (char *)objc_msgSendSuper2(&v77, sel_initWithFrame_, a2, a3, a4, a5);
  objc_msgSend(v17, sel_addSubview_, v16);
  objc_msgSend(v17, sel_pinToOther_, v16);
  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v69 = OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_firstLabel;
  uint64_t v68 = OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_secondLabel;
  char v18 = *(void **)&v17[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_secondLabel];
  uint64_t v70 = OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_centerLabel;
  char v19 = *(void **)&v17[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_centerLabel];
  uint64_t v20 = OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_videoContainerLayoutGuide;
  id v21 = *(id *)&v17[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_firstLabel];
  id v22 = v18;
  id v66 = v19;
  objc_msgSend(v17, byte_265366298, v21);
  id v23 = objc_msgSend(v21, sel_topAnchor);
  id v24 = objc_msgSend(*(id *)((char *)v16 + v20), sel_bottomAnchor);
  id v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v24);

  objc_msgSend(v25, sel_setActive_, 1);
  id v26 = v22;
  objc_msgSend(v17, sel_addSubview_, v26);
  id v27 = objc_msgSend(v26, sel_topAnchor);
  id v28 = objc_msgSend(*(id *)((char *)v16 + v20), sel_bottomAnchor);
  id v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v28);

  objc_msgSend(v29, sel_setActive_, 1);
  id v30 = v66;
  objc_msgSend(v17, sel_addSubview_, v30);
  id v31 = objc_msgSend(v30, sel_topAnchor);
  id v32 = objc_msgSend(*(id *)((char *)v16 + v20), sel_bottomAnchor);
  id v33 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v32);

  objc_msgSend(v33, sel_setActive_, 1);
  id v67 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2D900);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_2512C7560;
  id v35 = objc_msgSend(*(id *)&v17[v70], sel_centerXAnchor);
  id v36 = objc_msgSend(*(id *)((char *)v16 + v20), sel_centerXAnchor);
  id v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

  *(void *)(v34 + 32) = v37;
  id v38 = objc_msgSend(*(id *)&v17[v69], sel_centerXAnchor);
  id v39 = objc_msgSend(*(id *)((char *)v16 + v20), sel_leadingAnchor);
  id v40 = objc_msgSend(v38, sel_constraintEqualToAnchor_, v39);

  *(void *)(v34 + 40) = v40;
  id v41 = objc_msgSend(*(id *)&v17[v68], sel_centerXAnchor);
  id v42 = objc_msgSend(*(id *)((char *)v16 + v20), sel_trailingAnchor);
  id v43 = objc_msgSend(v41, sel_constraintEqualToAnchor_, v42);

  *(void *)(v34 + 48) = v43;
  uint64_t aBlock = v34;
  sub_2512C4898();
  sub_25129A74C(0, &qword_269B2D858);
  id v44 = (void *)sub_2512C4868();
  swift_bridgeObjectRelease();
  objc_msgSend(v67, sel_activateConstraints_, v44);

  uint64_t v45 = *(void **)&v17[v68];
  uint64_t v46 = *(void **)&v17[v70];
  id v47 = *(id *)&v17[v69];
  id v48 = v45;
  id v49 = v46;
  objc_msgSend(v47, sel_setAlpha_, 0.0);
  objc_msgSend(v48, sel_setAlpha_, 0.0);
  objc_msgSend(v49, sel_setAlpha_, 0.0);

  id v50 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v16) + 0xC0);
  objc_super v51 = v16;
  uint64_t v52 = (void *)v50();

  uint64_t v53 = sub_2512C4A18();
  LODWORD(v41) = v54;
  id v56 = v55;
  unint64_t v57 = HIDWORD(v54);
  sub_25129A74C(0, (unint64_t *)&qword_269B2D910);
  uint64_t v58 = (void *)sub_2512C4A08();
  uint64_t v59 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v60 = swift_allocObject();
  *(void *)(v60 + 16) = v59;
  *(void *)(v60 + 24) = v51;
  id v75 = sub_2512AAB7C;
  uint64_t v76 = v60;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v72 = 1107296256;
  uint64_t v73 = sub_25129EF30;
  id v74 = &block_descriptor_3;
  uint64_t v61 = _Block_copy(&aBlock);
  uint64_t v62 = v51;
  swift_release();
  uint64_t aBlock = v53;
  unint64_t v72 = __PAIR64__(v57, v41);
  uint64_t v73 = v56;
  id v63 = objc_msgSend(v52, sel_addPeriodicTimeObserverForInterval_queue_usingBlock_, &aBlock, v58, v61);
  _Block_release(v61);

  sub_2512C4AB8();
  swift_unknownObjectRelease();
  uint64_t v64 = (uint64_t)&v17[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_listener];
  swift_beginAccess();
  sub_25129AB90((uint64_t)&aBlock, v64);
  swift_endAccess();
  return v17;
}

void sub_2512A964C()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  if (!(*(unsigned __int8 (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))())
  {
    id v2 = (id)(*(uint64_t (**)(void))((*v1 & **(void **)((char *)v0
                                                       + OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_movieView))
                                  + 0xC0))();
    objc_msgSend(v2, sel_play);
  }
}

void sub_2512A9718()
{
}

id sub_2512A9778()
{
  return sub_2512AA8AC(type metadata accessor for FitNoiseAirpodPlacementVideoController.TopVideoPlacmentView);
}

uint64_t sub_2512A980C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController_delegate;
  swift_beginAccess();
  return MEMORY[0x25339B7D0](v1);
}

uint64_t sub_2512A9858()
{
  return swift_unknownObjectRelease();
}

void (*sub_2512A98B4(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x25339B7D0](v5);
  return sub_25129D830;
}

uint64_t sub_2512A9938()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController_deviceAddress);
  swift_bridgeObjectRetain();
  return v1;
}

id FitNoiseAirpodPlacementVideoController.__allocating_init(noiseDelegate:btAddress:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return FitNoiseAirpodPlacementVideoController.init(noiseDelegate:btAddress:)(a1, a2, a3);
}

id FitNoiseAirpodPlacementVideoController.init(noiseDelegate:btAddress:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v18 = a1;
  swift_getObjectType();
  uint64_t v7 = sub_2512C47B8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___continueButton] = 0;
  *(void *)&v3[OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___movieLoopView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___topAsset] = 0;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  uint64_t v11 = &v3[OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController_deviceAddress];
  *(void *)uint64_t v11 = a2;
  *((void *)v11 + 1) = a3;
  sub_2512C4758();
  sub_2512B1764((uint64_t)v10);
  uint64_t v12 = *(void (**)(char *, uint64_t))(v8 + 8);
  v12(v10, v7);
  uint64_t v13 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  sub_2512C4758();
  sub_2512B1764((uint64_t)v10);
  v12(v10, v7);
  uint64_t v14 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  id v15 = (objc_class *)type metadata accessor for FitNoiseAirpodPlacementVideoController();
  v19.receiver = v4;
  v19.super_class = v15;
  id v16 = objc_msgSendSuper2(&v19, sel_initWithTitle_detailText_symbolName_contentLayout_, v13, v14, 0, 1, v18);
  swift_unknownObjectRelease();

  return v16;
}

id sub_2512A9C6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2512C47B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___continueButton;
  uint64_t v7 = *(void **)(v0
                + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___continueButton);
  if (v7)
  {
    id v8 = *(id *)(v0
               + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___continueButton);
  }
  else
  {
    id v9 = objc_msgSend(self, sel_boldButton);
    v15[1] = v0;
    sub_2512C4758();
    type metadata accessor for FitNoiseAirpodPlacementVideoController();
    sub_2512B1764((uint64_t)v5);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v10 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setTitle_forState_, v10, 0);

    sub_25129A74C(0, &qword_269B2D8F8);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v11 = (void *)sub_2512C4A48();
    objc_msgSend(v9, sel_addAction_forControlEvents_, v11, 64);

    uint64_t v12 = *(void **)(v1 + v6);
    *(void *)(v1 + v6) = v9;
    id v8 = v9;

    uint64_t v7 = 0;
  }
  id v13 = v7;
  return v8;
}

uint64_t sub_2512A9EAC(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___continueButton) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_2512A9EC0(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = sub_2512A9C6C();
  return sub_2512A9F08;
}

void sub_2512A9F08(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = *(void **)(v1
                + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___continueButton);
  *(void *)(v1
            + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___continueButton) = v2;
}

id sub_2512A9F20()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___movieLoopView;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___movieLoopView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___movieLoopView);
  }
  else
  {
    uint64_t v4 = v0;
    type metadata accessor for HearingFitNoiseVideoLoopPlayer(0);
    sub_2512945E8();
    sub_2512994C4(0, 0.0, 0.0, 0.0, 0.0);
    uint64_t v6 = v5;
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    uint64_t v7 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

char *sub_2512A9FC0()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___topAsset;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___topAsset);
  if (v2)
  {
    id v3 = *(char **)(v0
                  + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___topAsset);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = sub_2512A9F20();
    id v6 = objc_allocWithZone((Class)type metadata accessor for FitNoiseAirpodPlacementVideoController.TopVideoPlacmentView());
    uint64_t v7 = sub_2512A8EE0(v5, 0.0, 0.0, 0.0, 0.0);
    id v8 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

void sub_2512AA050(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for FitNoiseAirpodPlacementVideoController();
  objc_msgSendSuper2(&v4, sel_viewWillAppear_, a1 & 1);
  id v3 = sub_2512A9FC0();
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *(void *)v3) + 0xB8))();
}

id sub_2512AA178()
{
  uint64_t v1 = v0;
  v33.receiver = v0;
  v33.super_class = (Class)type metadata accessor for FitNoiseAirpodPlacementVideoController();
  id v2 = objc_msgSendSuper2(&v33, sel_viewDidLoad);
  objc_msgSend(v0, sel_fitNoiseSetupCancelButtonWithFitDelegate_, (*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v0) + 0x78))(v2));
  swift_unknownObjectRelease();
  id v3 = objc_msgSend(v0, sel_contentView);
  objc_super v4 = sub_2512A9FC0();
  objc_msgSend(v3, sel_addSubview_, v4);

  id v5 = objc_msgSend(v1, sel_contentView);
  id v6 = objc_msgSend(self, sel_systemBackgroundColor);
  objc_msgSend(v5, sel_setBackgroundColor_, v6);

  uint64_t v7 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2D900);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2512C6B50;
  id v9 = sub_2512A9FC0();
  id v10 = objc_msgSend(v9, sel_widthAnchor);

  id v11 = objc_msgSend(v1, sel_contentView);
  id v12 = objc_msgSend(v11, sel_widthAnchor);

  id v13 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v12);
  *(void *)(v8 + 32) = v13;
  uint64_t v14 = sub_2512A9FC0();
  id v15 = objc_msgSend(v14, sel_heightAnchor);

  id v16 = objc_msgSend(v1, sel_contentView);
  id v17 = objc_msgSend(v16, sel_heightAnchor);

  id v18 = objc_msgSend(v15, sel_constraintEqualToAnchor_constant_, v17, -30.0);
  *(void *)(v8 + 40) = v18;
  objc_super v19 = sub_2512A9FC0();
  id v20 = objc_msgSend(v19, sel_centerXAnchor);

  id v21 = objc_msgSend(v1, sel_contentView);
  id v22 = objc_msgSend(v21, sel_centerXAnchor);

  id v23 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v22);
  *(void *)(v8 + 48) = v23;
  id v24 = sub_2512A9FC0();
  id v25 = objc_msgSend(v24, sel_centerYAnchor);

  id v26 = objc_msgSend(v1, sel_contentView);
  id v27 = objc_msgSend(v26, sel_centerYAnchor);

  id v28 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v27, -15.0);
  *(void *)(v8 + 56) = v28;
  sub_2512C4898();
  sub_25129A74C(0, &qword_269B2D858);
  id v29 = (void *)sub_2512C4868();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_activateConstraints_, v29);

  id v30 = objc_msgSend(v1, sel_buttonTray);
  id v31 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x98))();
  objc_msgSend(v30, sel_addButton_, v31);

  return objc_msgSend(v1, sel_setModalInPresentation_, 1);
}

id FitNoiseAirpodPlacementVideoController.__allocating_init(title:detailText:symbolName:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  id v12 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    id v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  id v13 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v12, v13, v14, a7);

  return v15;
}

void FitNoiseAirpodPlacementVideoController.init(title:detailText:symbolName:contentLayout:)()
{
}

id FitNoiseAirpodPlacementVideoController.__allocating_init(title:detailText:icon:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v7 = v6;
  id v11 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v12 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v12 = 0;
  }
  id v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, a5, a6);

  return v13;
}

void FitNoiseAirpodPlacementVideoController.init(title:detailText:icon:contentLayout:)()
{
}

id FitNoiseAirpodPlacementVideoController.__deallocating_deinit()
{
  return sub_2512AA8AC(type metadata accessor for FitNoiseAirpodPlacementVideoController);
}

id sub_2512AA8AC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_2512AA964()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_setTextAlignment_, 1);
  objc_msgSend(v0, sel_setNumberOfLines_, 0);
  LODWORD(v1) = 1148846080;
  objc_msgSend(v0, sel_setContentCompressionResistancePriority_forAxis_, 1, v1);
  LODWORD(v2) = 1148846080;
  objc_msgSend(v0, sel_setContentHuggingPriority_forAxis_, 1, v2);
  id v3 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F83628]);
  objc_msgSend(v0, sel_setFont_, v3);

  id v4 = objc_msgSend(self, sel_secondaryLabelColor);
  objc_msgSend(v0, sel_setTextColor_, v4);

  return v0;
}

uint64_t type metadata accessor for FitNoiseAirpodPlacementVideoController()
{
  return self;
}

unint64_t sub_2512AAAD0(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

uint64_t type metadata accessor for FitNoiseAirpodPlacementVideoController.TopVideoPlacmentView()
{
  return self;
}

uint64_t sub_2512AAB04()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2512AAB3C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2512AAB7C(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3)
{
  uint64_t v7 = *(void **)(v3 + 24);
  uint64_t v8 = *(void *)(v3 + 16) + 16;
  swift_beginAccess();
  uint64_t v9 = MEMORY[0x25339B7D0](v8);
  if (v9)
  {
    id v10 = (void *)v9;
    v14.value = a1;
    *(void *)&v14.timescale = a2;
    v14.epoch = a3;
    double Seconds = CMTimeGetSeconds(&v14);
    id v12 = (void *)MEMORY[0x263F8EED0];
    if (Seconds < 8.39 || (*(unsigned __int8 (**)(void))((*MEMORY[0x263F8EED0] & *v10) + 0x80))())
    {
      if (Seconds < 12.31 || (*(unsigned __int8 (**)(void))((*v12 & *v10) + 0x80))() >= 2u)
      {
        if (Seconds < 14.81 || (*(unsigned __int8 (**)(void))((*v12 & *v10) + 0x80))() > 2u) {
          goto LABEL_12;
        }
        uint64_t v13 = 3;
      }
      else
      {
        uint64_t v13 = 2;
      }
    }
    else
    {
      uint64_t v13 = 1;
    }
    (*(void (**)(void))((*v12 & *v7) + 0xE8))();
    (*(void (**)(uint64_t))((*v12 & *v10) + 0x88))(v13);
LABEL_12:
  }
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

void sub_2512AAD98()
{
  uint64_t v1 = OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_firstLabel;
  *(void *)&v0[v1] = sub_2512AA964();
  uint64_t v2 = OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_secondLabel;
  *(void *)&v0[v2] = sub_2512AA964();
  uint64_t v3 = OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_centerLabel;
  *(void *)&v0[v3] = sub_2512AA964();
  v0[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_viewState] = 0;
  id v4 = &v0[OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_listener];
  _OWORD *v4 = 0u;
  v4[1] = 0u;

  sub_2512C4B48();
  __break(1u);
}

uint64_t sub_2512AAE4C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DBD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2512AAEAC()
{
  uint64_t v1 = v0 + 16;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x25339B7D0](v0 + 16);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x78))();

    if (v4)
    {
      swift_beginAccess();
      uint64_t v5 = MEMORY[0x25339B7D0](v1);
      if (v5)
      {
        id v6 = (void *)v5;
        uint64_t v7 = *(void *)(v5 + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController_deviceAddress);
        uint64_t v8 = *(void *)(v5 + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController_deviceAddress + 8);
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v7 = 0;
        uint64_t v8 = 0xE000000000000000;
      }
      type metadata accessor for FitNoiseAirpodAdjustmentVideoController();
      uint64_t v9 = swift_unknownObjectRetain();
      id v10 = sub_25129D8EC(v9, v7, v8);
      swift_beginAccess();
      id v11 = (void *)MEMORY[0x25339B7D0](v1);
      if (v11)
      {
        id v12 = v11;
        id v13 = objc_msgSend(v11, sel_navigationController);

        if (v13)
        {
          objc_msgSend(v13, sel_pushViewController_animated_, v10, 1);
        }
      }
      swift_unknownObjectRelease();
    }
  }
}

unint64_t sub_2512AB02C()
{
  unint64_t result = qword_269B2DD80;
  if (!qword_269B2DD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2DD80);
  }
  return result;
}

uint64_t method lookup function for FitNoiseAirpodPlacementVideoController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FitNoiseAirpodPlacementVideoController);
}

uint64_t dispatch thunk of FitNoiseAirpodPlacementVideoController.__allocating_init(noiseDelegate:btAddress:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t getEnumTagSinglePayload for FitNoiseAirpodPlacementVideoController.TopVideoPlacmentView.ViewState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FitNoiseAirpodPlacementVideoController.TopVideoPlacmentView.ViewState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2512AB208);
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

unsigned char *sub_2512AB230(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FitNoiseAirpodPlacementVideoController.TopVideoPlacmentView.ViewState()
{
  return &type metadata for FitNoiseAirpodPlacementVideoController.TopVideoPlacmentView.ViewState;
}

uint64_t sub_2512AB248()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_2512AB280(char a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  double v4 = 0.0;
  objc_msgSend(*(id *)(v3+ OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_centerLabel), sel_setAlpha_, 0.0);
  if (a1) {
    double v4 = 1.0;
  }
  objc_msgSend(*(id *)(v3+ OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_firstLabel), sel_setAlpha_, v4);
  uint64_t v5 = *(void **)(v3
                + OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_secondLabel);
  return objc_msgSend(v5, sel_setAlpha_, v4);
}

uint64_t sub_2512AB31C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2512AB354()
{
  return (*(uint64_t (**)(uint64_t))(v0 + 16))(1);
}

uint64_t sub_2512AB380()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2512AB3C0()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[4];
  double v4 = self;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v1;
  v8[4] = sub_2512AB620;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_251298D30;
  v8[3] = &block_descriptor_49;
  unsigned int v6 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_animateWithDuration_animations_, v6, 0.3);
  _Block_release(v6);
  BOOL v7 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **(void **)(v3
                                                                          + OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_movieView))
                                    + 0xC0))();
  objc_msgSend(v7, sel_play);
}

unint64_t sub_2512AB518()
{
  unint64_t result = qword_269B2DDF8;
  if (!qword_269B2DDF8)
  {
    sub_2512C46C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2DDF8);
  }
  return result;
}

unint64_t sub_2512AB570()
{
  unint64_t result = qword_269B2DE08;
  if (!qword_269B2DE08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2DE00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2DE08);
  }
  return result;
}

id sub_2512AB5D0(char a1)
{
  double v2 = 0.0;
  if (a1) {
    double v2 = 1.0;
  }
  return objc_msgSend(*(id *)(*(void *)(v1 + 16)+ OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_centerLabel), sel_setAlpha_, v2);
}

id sub_2512AB600()
{
  return objc_msgSend(*(id *)(*(void *)(v0 + 16)+ OBJC_IVAR____TtCC13HearingModeUI38FitNoiseAirpodPlacementVideoController20TopVideoPlacmentView_centerLabel), sel_setAlpha_, 0.0);
}

uint64_t sub_2512AB620()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

unint64_t NoiseCheckResultType.init(rawValue:)(unint64_t a1)
{
  return sub_2512AD6F0(a1);
}

unint64_t sub_2512AB698@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_2512AD6F0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_2512AB6CC(uint64_t a1)
{
  return sub_2512AB71C(a1, 0x80000002512CC990, MEMORY[0x263F474C0]);
}

uint64_t sub_2512AB6F4(uint64_t a1)
{
  return sub_2512AB71C(a1, 0x80000002512CC9C0, MEMORY[0x263F47448]);
}

uint64_t sub_2512AB71C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2512AB7CC()
{
  sub_2512C4C28();
  (*(void (**)(unsigned char *))(*(void *)v0 + 112))(v2);
  return sub_2512C4C48();
}

uint64_t sub_2512AB830()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t sub_2512AB854()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t sub_2512AB878()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

uint64_t sub_2512AB8BC()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 112))();
}

uint64_t sub_2512AB900()
{
  sub_2512C4C28();
  (*(void (**)(unsigned char *))(**(void **)v0 + 112))(v2);
  return sub_2512C4C48();
}

uint64_t sub_2512AB960()
{
  return swift_retain();
}

uint64_t sub_2512AB970()
{
  type metadata accessor for HMNoiseCheckService.NoiseCheckObserver();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0xD000000000000012;
  *(void *)(result + 24) = 0x80000002512CC9F0;
  return result;
}

uint64_t sub_2512AB9B0()
{
  return swift_retain();
}

uint64_t sub_2512AB9C0()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC13HearingModeUI19HMNoiseCheckService_noiseCheckOngoing);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2512ABA08(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC13HearingModeUI19HMNoiseCheckService_noiseCheckOngoing);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_2512ABA54())()
{
  return j__swift_endAccess;
}

uint64_t sub_2512ABAB0()
{
  uint64_t v0 = sub_2512C3FA8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C3ED8();
  sub_2512C4018();
  sub_2512AD8F0((unint64_t *)&unk_269B2DE28);
  sub_2512C3F98();
  sub_2512AD724();
  char v4 = (void *)sub_2512C4A08();
  sub_2512C3FE8();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2512ABC1C()
{
  uint64_t v0 = sub_2512C3FB8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  char v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v13 - v5;
  sub_2512C3ED8();
  sub_2512C3FC8();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  int v7 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v4, v0);
  if (v7 == *MEMORY[0x263F474A8])
  {
    (*(void (**)(char *, uint64_t))(v1 + 96))(v4, v0);
    sub_2512C3ED8();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
    uint64_t v8 = sub_2512C3F88();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v4, v8);
    return 1;
  }
  else if (v7 == *MEMORY[0x263F474B8])
  {
    (*(void (**)(char *, uint64_t))(v1 + 96))(v4, v0);
    sub_2512C3ED8();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
    uint64_t v10 = sub_2512C3F88();
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v4, v10);
    return 2;
  }
  else if (v7 == *MEMORY[0x263F474B0])
  {
    (*(void (**)(char *, uint64_t))(v1 + 96))(v4, v0);
    sub_2512C3ED8();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
    uint64_t v11 = sub_2512C3F88();
    (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v4, v11);
    return 3;
  }
  else
  {
    sub_2512C3ED8();
    id v12 = *(void (**)(char *, uint64_t))(v1 + 8);
    v12(v6, v0);
    v12(v4, v0);
    return 0;
  }
}

uint64_t sub_2512ABFA8()
{
  uint64_t v1 = sub_2512C3FA8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  char v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C3ED8();
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))(0);
  sub_2512AD8F0((unint64_t *)&unk_269B2DE28);
  sub_2512C3F98();
  sub_2512C3FF8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_2512C4008();
}

uint64_t sub_2512AC168()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2512AC188, 0, 0);
}

uint64_t sub_2512AC188()
{
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & **(void **)(v0 + 16)) + 0x88))();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_2512AC25C;
  return MEMORY[0x270FA1FF0](5000000000);
}

uint64_t sub_2512AC25C()
{
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v1 = sub_2512AE0E0;
  }
  else
  {
    uint64_t v1 = sub_2512AC374;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_2512AC374()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x90))();
  (*(void (**)(void))((*v2 & *v1) + 0x98))();
  char v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v3);
}

uint64_t sub_2512AC5A8(const void *a1, void *a2)
{
  *(void *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = _Block_copy(a1);
  id v4 = a2;
  return MEMORY[0x270FA2498](sub_2512AC620, 0, 0);
}

uint64_t sub_2512AC620()
{
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & **(void **)(v0 + 16)) + 0x88))();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_2512AC6F4;
  return MEMORY[0x270FA1FF0](5000000000);
}

uint64_t sub_2512AC6F4()
{
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v1 = sub_2512AE0E8;
  }
  else
  {
    uint64_t v1 = sub_2512AC80C;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_2512AC80C()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v1 = (void (**)(void, void))v0[3];
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  uint64_t v4 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x90))();
  (*(void (**)(void))((*v3 & *v2) + 0x98))();

  v1[2](v1, v4);
  _Block_release(v1);
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_2512AC8F4()
{
  uint64_t v1 = sub_2512C3EC8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NoiseDataProvider();
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI19HMNoiseCheckService_manager);
  v10[3] = sub_2512C4028();
  v10[4] = &protocol witness table for HTRequirementStatusManager;
  v10[0] = v5;
  swift_retain();
  sub_2512C3EB8();
  sub_2512C3EA8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v8 = 0xD000000000000014;
  uint64_t v9 = 0x80000002512CCBB0;
  sub_2512C4838();
  swift_bridgeObjectRelease();
  return sub_2512BBCE4((uint64_t)v10, v8, v9);
}

uint64_t sub_2512ACA54()
{
  return MEMORY[0x263F8EE88];
}

uint64_t sub_2512ACA60()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2512ACAAC(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC13HearingModeUI19HMNoiseCheckService_listeners);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2512ACB00())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2512ACB5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a3;
  uint64_t v21 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE40);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE48);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  CMTime v14 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x88))(v11);
  uint64_t v15 = (*(uint64_t (**)(uint64_t))((*v14 & *v3) + 0x78))(1);
  (*(void (**)(uint64_t))(**(void **)(a1 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_provider)
                                  + 232))(v15);
  sub_2512AD7C8(&qword_269B2DE50, &qword_269B2DE40);
  sub_2512C43C8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = v20;
  *(void *)(v16 + 16) = v21;
  *(void *)(v16 + 24) = v17;
  sub_2512AD7C8(&qword_269B2DE58, &qword_269B2DE48);
  swift_retain();
  sub_2512C43D8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  id v18 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))((*MEMORY[0x263F8EED0] & *v3)
                                                                                    + 0xC0))(v22);
  sub_2512C4338();
  swift_release();
  return v18(v22, 0);
}

BOOL sub_2512ACEC0@<W0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  unsigned __int8 v5 = *a1;
  unsigned __int8 v4 = 0;
  BOOL result = static HTUINoiseView.Mode.== infix(_:_:)(&v5, &v4);
  *a2 = result;
  return result;
}

id HMNoiseCheckService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id HMNoiseCheckService.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI19HMNoiseCheckService_manager;
  uint64_t v2 = v0;
  *(void *)&v0[v1] = sub_2512C40C8();
  uint64_t v3 = OBJC_IVAR____TtC13HearingModeUI19HMNoiseCheckService_observer;
  type metadata accessor for HMNoiseCheckService.NoiseCheckObserver();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0xD000000000000012;
  *(void *)(v4 + 24) = 0x80000002512CC9F0;
  *(void *)&v2[v3] = v4;
  v2[OBJC_IVAR____TtC13HearingModeUI19HMNoiseCheckService_noiseCheckOngoing] = 0;
  *(void *)&v2[OBJC_IVAR____TtC13HearingModeUI19HMNoiseCheckService_listeners] = MEMORY[0x263F8EE88];

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for HMNoiseCheckService();
  return objc_msgSendSuper2(&v6, sel_init);
}

id HMNoiseCheckService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HMNoiseCheckService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2512AD1E0(uint64_t a1, uint64_t a2, int *a3)
{
  objc_super v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_2512AE0E4;
  return v6();
}

uint64_t sub_2512AD2AC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  unsigned __int8 v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_2512AE0E4;
  return v7();
}

uint64_t sub_2512AD378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2512C4928();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2512C4918();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2512ADFC4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2512C48E8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2512AD51C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_2512AD5F8;
  return v6(a1);
}

uint64_t sub_2512AD5F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_2512AD6F0(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for HMNoiseCheckService.NoiseCheckObserver()
{
  return self;
}

unint64_t sub_2512AD724()
{
  unint64_t result = qword_269B2D910;
  if (!qword_269B2D910)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B2D910);
  }
  return result;
}

uint64_t sub_2512AD764()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2512AD79C(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_2512AD7C8(unint64_t *a1, uint64_t *a2)
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

uint64_t type metadata accessor for HMNoiseCheckService()
{
  return self;
}

unint64_t sub_2512AD834()
{
  unint64_t result = qword_269B2DE60;
  if (!qword_269B2DE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2DE60);
  }
  return result;
}

uint64_t sub_2512AD888()
{
  return sub_2512AD8F0(&qword_269B2DE68);
}

uint64_t sub_2512AD8BC()
{
  return sub_2512AD8F0(&qword_269B2DE70);
}

uint64_t sub_2512AD8F0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for HMNoiseCheckService.NoiseCheckObserver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for NoiseCheckResultType()
{
  return &type metadata for NoiseCheckResultType;
}

uint64_t method lookup function for HMNoiseCheckService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HMNoiseCheckService);
}

uint64_t dispatch thunk of HMNoiseCheckService.stopNoiseCheck()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of HMNoiseCheckService.runNoiseCheck()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0xA0);
  unsigned __int8 v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2512ADA90;
  return v5();
}

uint64_t sub_2512ADA90(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of HMNoiseCheckService.runNoiseCheckNudging(topView:passAction:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t sub_2512ADBC0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2512ADBF8(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_2512ADC10()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2512ADC50()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_2512ADCFC;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_269B2DE88 + dword_269B2DE88);
  return v5(v2, v3);
}

uint64_t sub_2512ADCFC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2512ADDF4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_2512AE0E4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_269B2DE98 + dword_269B2DE98);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_14Tm_0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2512ADEF8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2512AE0E4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_269B2DEA8 + dword_269B2DEA8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_2512ADFC4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2512AE024(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2512ADCFC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269B2DEB8 + dword_269B2DEB8);
  return v6(a1, v4);
}

uint64_t sub_2512AE0F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_retain();
  uint64_t v4 = sub_2512C4688();
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)a1 + 232))();
  sub_2512C4608();
  uint64_t v6 = sub_2512C4638();
  swift_release();
  uint64_t result = sub_2512C4558();
  *(void *)a2 = sub_2512AE2D8;
  *(void *)(a2 + 8) = a1;
  *(void *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v5;
  *(void *)(a2 + 32) = v6;
  *(unsigned char *)(a2 + 40) = result;
  return result;
}

uint64_t sub_2512AE1AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DF28);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_2512C44E8();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DF30);
  sub_2512AE2E0(a2, a1, &v8[*(int *)(v9 + 44)]);
  sub_2512C4408();
  sub_2512C4678();
  sub_2512C43F8();
  sub_2512B031C((uint64_t)v8, a3, &qword_269B2DF28);
  uint64_t v10 = (_OWORD *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B2DF38) + 36));
  long long v11 = v13[1];
  *uint64_t v10 = v13[0];
  v10[1] = v11;
  v10[2] = v13[2];
  return sub_25129F330((uint64_t)v8, &qword_269B2DF28);
}

uint64_t sub_2512AE2D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2512AE1AC(a1, v2, a2);
}

uint64_t sub_2512AE2E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v28 = a2;
  id v31 = a3;
  uint64_t v4 = sub_2512C4418();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DF40);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v30 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v27 - v12;
  uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 232))(v11);
  uint64_t v15 = sub_2512AFE40(v14);
  swift_bridgeObjectRelease();
  uint64_t v32 = v15;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v28, v4);
  unint64_t v16 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v17 + v16, (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_2512B0088;
  *(void *)(v18 + 24) = v17;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DF48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DF50);
  sub_2512AD7C8(&qword_269B2DF58, &qword_269B2DF48);
  sub_2512B0178();
  sub_2512C4658();
  objc_super v19 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v20 = v30;
  v19(v30, v13, v7);
  uint64_t v21 = v31;
  *id v31 = 0;
  *((unsigned char *)v21 + 8) = 1;
  id v22 = (char *)v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DF98);
  v19(&v22[*(int *)(v23 + 48)], v20, v7);
  id v24 = &v22[*(int *)(v23 + 64)];
  *(void *)id v24 = 0;
  v24[8] = 1;
  id v25 = *(void (**)(char *, uint64_t))(v8 + 8);
  v25(v13, v7);
  return ((uint64_t (*)(char *, uint64_t))v25)(v20, v7);
}

uint64_t sub_2512AE660@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void (*v10)(uint64_t *__return_ptr);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void v35[5];
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;

  uint64_t v34 = a2;
  objc_super v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DF90);
  MEMORY[0x270FA5388](v33);
  id v31 = (uint64_t)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2512C4448();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (double *)((char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DF50);
  MEMORY[0x270FA5388](v32);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DFA0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2512C6460;
  uint64_t v10 = *(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 136);
  v10(&v36);
  sub_2512B4E3C();
  uint64_t v11 = sub_2512C4638();
  uint64_t v12 = swift_release();
  *(void *)(v9 + 32) = v11;
  ((void (*)(uint64_t *__return_ptr, uint64_t))v10)(&v36, v12);
  sub_2512B4E3C();
  uint64_t v13 = sub_2512C4638();
  swift_release();
  *(void *)(v9 + 40) = v13;
  id v36 = v9;
  sub_2512C4898();
  MEMORY[0x25339A8D0](v36);
  sub_2512C46A8();
  sub_2512C46B8();
  sub_2512C4428();
  id v30 = v35[0];
  uint64_t v14 = v35[1];
  uint64_t v15 = v35[2];
  unint64_t v16 = v35[3];
  uint64_t v17 = v35[4];
  if (qword_269B30600 != -1) {
    swift_once();
  }
  uint64_t v18 = *(double *)&qword_269B30608;
  sub_2512C4408();
  sub_2512C4678();
  sub_2512C43F8();
  objc_super v19 = v36;
  uint64_t v20 = v37;
  uint64_t v21 = v38;
  id v22 = v39;
  uint64_t v23 = v41;
  id v29 = v40;
  id v24 = (char *)v6 + *(int *)(v4 + 20);
  id v25 = *MEMORY[0x263F19860];
  id v26 = sub_2512C44F8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104))(v24, v25, v26);
  *uint64_t v6 = v18 * 0.5;
  v6[1] = v18 * 0.5;
  uint64_t v27 = v31;
  sub_2512B02B8((uint64_t)v6, v31);
  *(_WORD *)(v27 + *(int *)(v33 + 36)) = 256;
  sub_2512B031C(v27, (uint64_t)&v8[*(int *)(v32 + 36)], &qword_269B2DF90);
  *(void *)uint64_t v8 = v30;
  *((void *)v8 + 1) = v14;
  *((void *)v8 + 2) = v15;
  *((void *)v8 + 3) = v16;
  *((void *)v8 + 4) = v17;
  *((_WORD *)v8 + 20) = 256;
  *((void *)v8 + 6) = v19;
  v8[56] = v20;
  *((void *)v8 + 8) = v21;
  v8[72] = v22;
  *((void *)v8 + 10) = v29;
  *((void *)v8 + 11) = v23;
  swift_bridgeObjectRetain();
  sub_25129F330(v27, &qword_269B2DF90);
  sub_2512B0380((uint64_t)v6);
  sub_2512B03DC((uint64_t)v35);
  return sub_2512B0408((uint64_t)v8, v34);
}

uint64_t (*sub_2512AEA5C())()
{
  return j__swift_endAccess;
}

unsigned char *sub_2512AEAB0@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2512AEABC@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v1 + 272))();
  swift_release();
  uint64_t result = swift_beginAccess();
  *a1 = v1[16];
  return result;
}

void *sub_2512AEB4C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(**(void **)a1 + 136))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_2512AEBA8(char *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  char v4 = *a1;
  return (*(uint64_t (**)(char *))(*(void *)v2 + 144))(&v4);
}

uint64_t sub_2512AEC00(char *a1)
{
  char v2 = *a1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v6 = v1;
  char v7 = v2;
  (*(void (**)(uint64_t, uint64_t (*)(), uint64_t *, uint64_t))(*(void *)v1 + 280))(KeyPath, sub_2512AECB0, &v5, MEMORY[0x263F8EE60] + 8);
  return swift_release();
}

uint64_t sub_2512AECB0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 24);
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 16) = v2;
  return result;
}

void (*sub_2512AED04(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t))(*(void *)v1 + 272))(KeyPath);
  swift_release();
  v3[5] = OBJC_IVAR____TtCV13HearingModeUI17NoiseWaveformView5Model___observationRegistrar;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  v3[6] = sub_2512AEE14();
  sub_2512C4108();
  swift_release();
  v3[7] = sub_2512AEA5C();
  return sub_2512AEE08;
}

void sub_2512AEE08(void *a1)
{
}

unint64_t sub_2512AEE14()
{
  unint64_t result = qword_269B2DEC8;
  if (!qword_269B2DEC8)
  {
    type metadata accessor for NoiseWaveformView.Model();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2DEC8);
  }
  return result;
}

uint64_t type metadata accessor for NoiseWaveformView.Model()
{
  uint64_t result = qword_269B30730;
  if (!qword_269B30730) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t (*sub_2512AEEB8(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2512AEF10;
}

uint64_t sub_2512AEF10(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_2512AF5C8();
  }
  return result;
}

uint64_t sub_2512AEF44@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_2512AEF4C()
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v0 + 272))();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2512AEFD0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 184))();
  *a2 = result;
  return result;
}

uint64_t sub_2512AF01C(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 192);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_2512AF070()
{
  return sub_2512AF444();
}

uint64_t sub_2512AF090()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  swift_beginAccess();
  *(void *)(v2 + 24) = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return sub_2512AF5C8();
}

void (*sub_2512AF0FC(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t))(*(void *)v1 + 272))(KeyPath);
  swift_release();
  v3[5] = OBJC_IVAR____TtCV13HearingModeUI17NoiseWaveformView5Model___observationRegistrar;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  v3[6] = sub_2512AEE14();
  sub_2512C4108();
  swift_release();
  v3[7] = sub_2512AEEB8((uint64_t)v3);
  return sub_2512AF200;
}

void sub_2512AF200(void *a1)
{
}

void sub_2512AF20C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  void *v1 = v1[4];
  swift_getKeyPath();
  sub_2512C40F8();
  swift_release();
  free(v1);
}

uint64_t sub_2512AF298()
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v0 + 272))();
  swift_release();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2512AF30C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 232))();
  *a2 = result;
  return result;
}

uint64_t sub_2512AF358(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t KeyPath = swift_getKeyPath();
  v7[2] = v3;
  v7[3] = v2;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t (*)(), void *, uint64_t))(*(void *)v3 + 280);
  swift_bridgeObjectRetain();
  v5(KeyPath, sub_2512AF4E4, v7, MEMORY[0x263F8EE60] + 8);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2512AF424()
{
  return sub_2512AF444();
}

uint64_t sub_2512AF444()
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v0 + 280))();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2512AF4E4()
{
  return sub_2512AFE04();
}

uint64_t sub_2512AF4FC(unsigned char *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  LOBYTE(a1) = *a1;
  *(void *)(v4 + 32) = MEMORY[0x263F8EE78];
  sub_2512C4118();
  *(unsigned char *)(v4 + 16) = (_BYTE)a1;
  *(void *)(v4 + 24) = a2;
  sub_2512AF5C8();
  return v4;
}

uint64_t sub_2512AF56C(char *a1, uint64_t a2)
{
  char v4 = *a1;
  *(void *)(v2 + 32) = MEMORY[0x263F8EE78];
  sub_2512C4118();
  *(unsigned char *)(v2 + 16) = v4;
  *(void *)(v2 + 24) = a2;
  sub_2512AF5C8();
  return v2;
}

uint64_t sub_2512AF5C8()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 184))();
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
    sub_2512AFCE8(0, v2, 0);
    uint64_t v3 = 0;
    unint64_t v4 = *(void *)(v10 + 16);
    do
    {
      double v5 = *(double *)(v1 + 8 * v3 + 32);
      unint64_t v6 = *(void *)(v10 + 24);
      if (v4 >= v6 >> 1) {
        sub_2512AFCE8((char *)(v6 > 1), v4 + 1, 1);
      }
      ++v3;
      *(void *)(v10 + 16) = v4 + 1;
      *(double *)(v10 + 8 * v4++ + 32) = v5 / 90.0;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v8 = MEMORY[0x270FA5388](KeyPath);
  (*(void (**)(uint64_t, uint64_t (*)()))(*(void *)v0 + 280))(v8, sub_2512AF4E4);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2512AF7A0()
{
  return sub_2512C40E8();
}

uint64_t sub_2512AF7F8()
{
  return sub_2512C40D8();
}

uint64_t sub_2512AF888()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtCV13HearingModeUI17NoiseWaveformView5Model___observationRegistrar;
  uint64_t v2 = sub_2512C4128();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_2512AF8FC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtCV13HearingModeUI17NoiseWaveformView5Model___observationRegistrar;
  uint64_t v2 = sub_2512C4128();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

void sub_2512AF9AC()
{
  qword_269B30608 = 0x4014000000000000;
}

uint64_t sub_2512AF9BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2512AF9E0()
{
  return sub_2512C45D8();
}

uint64_t sub_2512AF9FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_retain();
  uint64_t v4 = sub_2512C4688();
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)v3 + 232))();
  sub_2512C4608();
  uint64_t v6 = sub_2512C4638();
  swift_release();
  uint64_t result = sub_2512C4558();
  *(void *)a1 = sub_2512AE2D8;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = result;
  return result;
}

ValueMetadata *type metadata accessor for NoiseWaveformView()
{
  return &type metadata for NoiseWaveformView;
}

uint64_t sub_2512AFACC()
{
  return type metadata accessor for NoiseWaveformView.Model();
}

uint64_t sub_2512AFAD4()
{
  uint64_t result = sub_2512C4128();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_2512AFB84()
{
  unint64_t result = qword_269B2DED0;
  if (!qword_269B2DED0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2DED8);
    sub_2512AFC24();
    sub_2512AD7C8(&qword_269B2DF10, &qword_269B2DF18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2DED0);
  }
  return result;
}

unint64_t sub_2512AFC24()
{
  unint64_t result = qword_269B2DEE0;
  if (!qword_269B2DEE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2DEE8);
    sub_2512AD7C8(&qword_269B2DEF0, &qword_269B2DEF8);
    sub_2512AD7C8(&qword_269B2DF00, &qword_269B2DF08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2DEE0);
  }
  return result;
}

char *sub_2512AFCE8(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_2512AFD08(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_2512AFD08(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DF20);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_2512AFE04()
{
  *(void *)(*(void *)(v0 + 16) + 32) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2512AFE40(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  uint64_t v2 = (void *)MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v3 = result;
    unint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    unint64_t v6 = v2 + 4;
    while (1)
    {
      uint64_t v7 = *(void *)(v3 + 8 * v5 + 32);
      if (!v4)
      {
        unint64_t v8 = v2[3];
        if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_28;
        }
        int64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
        if (v9 <= 1) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = v9;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DFA8);
        int64_t v11 = (void *)swift_allocObject();
        int64_t v12 = _swift_stdlib_malloc_size(v11);
        uint64_t v13 = v12 - 32;
        if (v12 < 32) {
          uint64_t v13 = v12 - 17;
        }
        uint64_t v14 = v13 >> 4;
        v11[2] = v10;
        v11[3] = 2 * (v13 >> 4);
        unint64_t v15 = (unint64_t)(v11 + 4);
        uint64_t v16 = v2[3] >> 1;
        if (v2[2])
        {
          if (v11 != v2 || v15 >= (unint64_t)&v2[2 * v16 + 4]) {
            memmove(v11 + 4, v2 + 4, 16 * v16);
          }
          v2[2] = 0;
        }
        unint64_t v6 = (void *)(v15 + 16 * v16);
        uint64_t v4 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - v16;
        unint64_t result = swift_release();
        uint64_t v2 = v11;
      }
      BOOL v18 = __OFSUB__(v4--, 1);
      if (v18) {
        break;
      }
      *unint64_t v6 = v5;
      v6[1] = v7;
      v6 += 2;
      if (v1 == ++v5)
      {
        unint64_t result = swift_bridgeObjectRelease();
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v4 = 0;
LABEL_23:
  unint64_t v19 = v2[3];
  if (v19 < 2) {
    return (uint64_t)v2;
  }
  unint64_t v20 = v19 >> 1;
  BOOL v18 = __OFSUB__(v20, v4);
  uint64_t v21 = v20 - v4;
  if (!v18)
  {
    v2[2] = v21;
    return (uint64_t)v2;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_2512AFFBC()
{
  uint64_t v1 = sub_2512C4418();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2512B0088@<X0>(uint64_t a1@<X8>)
{
  sub_2512C4418();
  uint64_t v3 = *(void *)(v1 + 16);
  return sub_2512AE660(v3, a1);
}

uint64_t sub_2512B010C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2512B0144(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(v1 + 16))(*(void *)a1, *(double *)(a1 + 8));
}

unint64_t sub_2512B0178()
{
  unint64_t result = qword_269B2DF60;
  if (!qword_269B2DF60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2DF50);
    sub_2512B0218();
    sub_2512AD7C8(&qword_269B2DF88, &qword_269B2DF90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2DF60);
  }
  return result;
}

unint64_t sub_2512B0218()
{
  unint64_t result = qword_269B2DF68;
  if (!qword_269B2DF68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2DF70);
    sub_2512AD7C8(&qword_269B2DF78, &qword_269B2DF80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2DF68);
  }
  return result;
}

uint64_t sub_2512B02B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2512C4448();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2512B031C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2512B0380(uint64_t a1)
{
  uint64_t v2 = sub_2512C4448();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2512B03DC(uint64_t a1)
{
  return a1;
}

uint64_t sub_2512B0408(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DF50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_2512B0478(double a1, double a2)
{
  return a2;
}

uint64_t sub_2512B0480(uint64_t a1, uint64_t a2)
{
  return a2;
}

double sub_2512B0488()
{
  return 1.0;
}

double sub_2512B0490()
{
  return 5.0;
}

double sub_2512B0498()
{
  return *(double *)v0;
}

id sub_2512B04A0()
{
  return *(id *)(v0 + 16);
}

double sub_2512B04A8()
{
  double v1 = *(double *)(v0 + 32);
  id v2 = *(id *)(v0 + 24);
  return v1;
}

double sub_2512B04EC()
{
  return *(double *)(v0 + 56);
}

double sub_2512B04F4()
{
  return *(double *)(v0 + 72);
}

double sub_2512B04FC()
{
  return 0.0;
}

id sub_2512B0508()
{
  id v0 = objc_msgSend(self, sel_clearColor);
  return v0;
}

double sub_2512B0548()
{
  id v0 = objc_msgSend(self, sel_grayColor);
  return 1.0;
}

double sub_2512B0588()
{
  return 0.5;
}

double sub_2512B0594()
{
  return 0.5;
}

uint64_t sub_2512B059C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>)
{
  *(double *)a4 = a5;
  *(double *)(a4 + 8) = a6;
  *(void *)(a4 + 16) = result;
  *(void *)(a4 + 24) = a2;
  *(double *)(a4 + 32) = a7;
  *(double *)(a4 + 40) = a8;
  *(_DWORD *)(a4 + 48) = a3;
  *(double *)(a4 + 56) = a9;
  *(double *)(a4 + 64) = a10;
  *(double *)(a4 + 72) = a11;
  return result;
}

id sub_2512B05B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, void *a4@<X3>, id a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, long long a10, char a11, uint64_t a12, char a13)
{
  if (a3)
  {
    long long v19 = *v13;
  }
  else
  {
    *(void *)&long long v19 = a1;
    *((void *)&v19 + 1) = a2;
  }
  id v31 = a5;
  if (a4)
  {
    id v21 = a4;
    if (a5) {
      goto LABEL_6;
    }
  }
  else
  {
    long long v29 = v19;
    id v25 = *((id *)v13 + 2);
    long long v19 = v29;
    a5 = v31;
    id v21 = v25;
    if (v31)
    {
LABEL_6:
      *(void *)&long long v22 = a6;
      *((void *)&v22 + 1) = a7;
      id v23 = a5;
      if ((a11 & 1) == 0) {
        goto LABEL_7;
      }
LABEL_11:
      a10 = *(long long *)((char *)v13 + 56);
      if ((a13 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  long long v28 = v13[2];
  a8 = *((_DWORD *)v13 + 12);
  long long v30 = v19;
  id v23 = *((id *)v13 + 3);
  long long v22 = v28;
  long long v19 = v30;
  if (a11) {
    goto LABEL_11;
  }
LABEL_7:
  if (a13) {
LABEL_12:
  }
    a12 = *((void *)v13 + 9);
LABEL_13:
  *(_OWORD *)a9 = v19;
  *(void *)(a9 + 16) = v21;
  *(void *)(a9 + 24) = v23;
  *(_OWORD *)(a9 + 32) = v22;
  *(_DWORD *)(a9 + 48) = a8;
  *(_OWORD *)(a9 + 56) = a10;
  *(void *)(a9 + 72) = a12;
  id v26 = a4;
  return v31;
}

ValueMetadata *type metadata accessor for Waveform()
{
  return &type metadata for Waveform;
}

void destroy for Waveform.LineStyle(id *a1)
{
}

uint64_t initializeWithCopy for Waveform.LineStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for Waveform.LineStyle(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy28_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 12);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Waveform.LineStyle(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for Waveform.LineStyle(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 28)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Waveform.LineStyle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 28) = 1;
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
    *(unsigned char *)(result + 28) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Waveform.LineStyle()
{
  return &type metadata for Waveform.LineStyle;
}

void destroy for Waveform.Configuration(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for Waveform.Configuration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 16);
  id v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  id v5 = v3;
  id v6 = v4;
  return a1;
}

uint64_t assignWithCopy for Waveform.Configuration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  id v4 = *(void **)(a2 + 16);
  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 24);
  unint64_t v8 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  id v9 = v7;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for Waveform.Configuration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;

  long long v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for Waveform.Configuration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Waveform.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Waveform.Configuration()
{
  return &type metadata for Waveform.Configuration;
}

void type metadata accessor for CGLineCap(uint64_t a1)
{
}

Swift::Void __swiftcall UIView.pinToOther(_:)(UIView *a1)
{
  unint64_t v2 = v1;
  long long v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2D900);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2512C6B50;
  id v6 = objc_msgSend(v2, sel_leadingAnchor);
  uint64_t v7 = [(UIView *)a1 leadingAnchor];
  id v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

  *(void *)(v5 + 32) = v8;
  id v9 = objc_msgSend(v2, sel_trailingAnchor);
  uint64_t v10 = [(UIView *)a1 trailingAnchor];
  id v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(void *)(v5 + 40) = v11;
  id v12 = objc_msgSend(v2, sel_topAnchor);
  uint64_t v13 = [(UIView *)a1 topAnchor];
  id v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

  *(void *)(v5 + 48) = v14;
  id v15 = objc_msgSend(v2, sel_bottomAnchor);
  uint64_t v16 = [(UIView *)a1 bottomAnchor];
  id v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(void *)(v5 + 56) = v17;
  sub_2512C4898();
  sub_25129A74C(0, &qword_269B2D858);
  id v18 = (id)sub_2512C4868();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_activateConstraints_, v18);
}

void sub_2512B0D74(void *a1, uint64_t a2, void *a3)
{
  long long v4 = a3;
  id v5 = a1;
  UIView.pinToOther(_:)(v4);
}

unint64_t sub_2512B0DE0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    long long v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E000);
  uint64_t v2 = sub_2512C4B88();
  long long v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2512B16FC(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_25129F7F4(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_25129F8F0(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

void type metadata accessor for Key()
{
  if (!qword_269B2DFD8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269B2DFD8);
    }
  }
}

id sub_2512B0F54(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DFC0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2512C6440;
  uint64_t v5 = (void *)*MEMORY[0x263F814F0];
  *(void *)(inited + 32) = *MEMORY[0x263F814F0];
  *(void *)(inited + 64) = sub_25129A74C(0, &qword_269B2DFC8);
  *(void *)(inited + 40) = a3;
  swift_bridgeObjectRetain();
  id v6 = v5;
  id v7 = a3;
  sub_2512B0DE0(inited);
  id v8 = objc_allocWithZone(MEMORY[0x263F086A0]);
  char v9 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  type metadata accessor for Key();
  sub_2512B16B8(&qword_269B2DFD0);
  uint64_t v10 = (void *)sub_2512C4728();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v8, sel_initWithString_attributes_, v9, v10);

  objc_msgSend(v13, sel_appendAttributedString_, v11);
  return v13;
}

void OBWelcomeController.fitNoiseSetupCancelButton(fitDelegate:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2512C42B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v8 = objc_allocWithZone(MEMORY[0x263F824A8]);
    swift_unknownObjectRetain();
    id v9 = objc_msgSend(v8, sel_initWithBarButtonSystemItem_target_action_, 1, 0, 0);
    sub_25129A74C(0, &qword_269B2D8F8);
    uint64_t v10 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    *(void *)(v11 + 24) = a1;
    swift_unknownObjectRetain();
    uint64_t v12 = (void *)sub_2512C4A48();
    objc_msgSend(v9, sel_setPrimaryAction_, v12);

    id v13 = objc_msgSend(v2, sel_navigationItem);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2D900);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_2512C7AE0;
    *(void *)(v14 + 32) = v9;
    v21[1] = v14;
    sub_2512C4898();
    sub_25129A74C(0, (unint64_t *)&unk_269B2DB50);
    id v15 = v9;
    v21[0] = sub_2512C4868();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_setRightBarButtonItems_, v21[0]);
    swift_unknownObjectRelease();

    uint64_t v16 = (void *)v21[0];
  }
  else
  {
    uint64_t v17 = sub_25129D5F8();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v17, v4);
    id v18 = sub_2512C4298();
    os_log_type_t v19 = sub_2512C4988();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v20 = 0;
      _os_log_impl(&dword_251285000, v18, v19, "No delegate", v20, 2u);
      MEMORY[0x25339B730](v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void sub_2512B141C(void *a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  id v5 = a1;
  OBWelcomeController.fitNoiseSetupCancelButton(fitDelegate:)(a3);
  swift_unknownObjectRelease();
}

uint64_t sub_2512B1484(uint64_t a1)
{
  uint64_t v2 = sub_2512B16B8(&qword_269B2DFD0);
  uint64_t v3 = sub_2512B16B8(&qword_269B2DFF8);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2512B151C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2512B1554()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2512B1594()
{
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 16) + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x25339B7D0](v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (objc_msgSend(v1, sel_respondsToSelector_, sel_fitNoiseCheckCancelled_)) {
      objc_msgSend(v1, sel_fitNoiseCheckCancelled_, v4);
    }
  }
}

uint64_t sub_2512B161C()
{
  return sub_2512B16B8(&qword_269B2DFE0);
}

uint64_t sub_2512B1650()
{
  return sub_2512B16B8(&qword_269B2DFE8);
}

uint64_t sub_2512B1684()
{
  return sub_2512B16B8(&qword_269B2DFF0);
}

uint64_t sub_2512B16B8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2512B16FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2512B1764(uint64_t a1)
{
  uint64_t v2 = sub_2512C3EF8();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_2512C47B8();
  MEMORY[0x270FA5388](v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_2512B18CC();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2512C3EE8();
  return sub_2512C4808();
}

unint64_t sub_2512B18CC()
{
  unint64_t result = qword_269B2E010;
  if (!qword_269B2E010)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B2E010);
  }
  return result;
}

uint64_t sub_2512B190C(uint64_t a1)
{
  uint64_t v2 = sub_2512C3EF8();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_2512C47B8();
  MEMORY[0x270FA5388](v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_2512B18CC();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2512C3EE8();
  return sub_2512C4808();
}

Swift::Void __swiftcall HMFitNoiseCheckContentViewController.showAirpodsFitSuggestionsController()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2512C47B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for HMSuggestionsController();
  id v18 = v0;
  sub_2512C4758();
  sub_2512B1C90();
  uint64_t v6 = sub_2512B1764((uint64_t)v5);
  uint64_t v8 = v7;
  uint64_t v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  v9(v5, v2);
  id v18 = v0;
  sub_2512C4758();
  uint64_t v10 = sub_2512B1764((uint64_t)v5);
  uint64_t v12 = v11;
  v9(v5, v2);
  id v13 = sub_2512A7094(v6, v8, v10, v12, 0);
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5B8E0]), sel_initWithRootViewController_, v13);
  id v15 = objc_msgSend(v1, sel_navigationController);
  if (v15)
  {
    uint64_t v16 = v15;
    objc_msgSend(v15, sel_presentViewController_animated_completion_, v14, 1, 0);
  }
}

unint64_t sub_2512B1C90()
{
  unint64_t result = qword_269B2E018;
  if (!qword_269B2E018)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_269B2E018);
  }
  return result;
}

Swift::Void __swiftcall OBWelcomeController.showAirpodsNoiseReductionController()()
{
  uint64_t v1 = v0;
  type metadata accessor for HMSuggestionsController();
  uint64_t v2 = sub_2512B7824();
  uint64_t v4 = v3;
  uint64_t v5 = sub_2512B7824();
  uint64_t v10 = sub_2512A7094(v2, v4, v5, v6, 1);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5B8E0]), sel_initWithRootViewController_, v10);
  id v8 = objc_msgSend(v1, sel_navigationController);
  if (v8)
  {
    uint64_t v9 = v8;
    objc_msgSend(v8, sel_presentViewController_animated_completion_, v7, 1, 0);
  }
}

void sub_2512B1E54(void *a1)
{
  id v1 = a1;
  OBWelcomeController.showAirpodsNoiseReductionController()();
}

uint64_t sub_2512B1EA8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2512B1EB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2512C42B8();
  uint64_t v42 = *(void *)(v4 - 8);
  uint64_t v43 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2512C3FB8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  id v14 = (char *)&v36 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v36 - v15;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v17((char *)&v36 - v15, v2, v7);
  int v18 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v16, v7);
  if (v18 == *MEMORY[0x263F474A8] || v18 == *MEMORY[0x263F474B8])
  {
    (*(void (**)(char *, uint64_t))(v8 + 96))(v16, v7);
    uint64_t v19 = sub_2512C3F88();
    *(void *)(a1 + 24) = v19;
    *(void *)(a1 + 32) = &protocol witness table for HTEnvNoiseData;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a1);
    uint64_t result = (*(uint64_t (**)(uint64_t *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(boxed_opaque_existential_1, v16, v19);
    *(unsigned char *)(a1 + 40) = 0;
  }
  else if (v18 == *MEMORY[0x263F474B0])
  {
    (*(void (**)(char *, uint64_t))(v8 + 96))(v16, v7);
    uint64_t v22 = sub_2512C3F88();
    *(void *)(a1 + 24) = v22;
    *(void *)(a1 + 32) = &protocol witness table for HTEnvNoiseData;
    id v23 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a1);
    uint64_t result = (*(uint64_t (**)(uint64_t *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v23, v16, v22);
    *(unsigned char *)(a1 + 40) = 1;
  }
  else if (v18 == *MEMORY[0x263F474A0])
  {
    (*(void (**)(char *, uint64_t))(v8 + 96))(v16, v7);
    uint64_t v24 = sub_2512C3F88();
    *(void *)(a1 + 24) = v24;
    *(void *)(a1 + 32) = &protocol witness table for HTEnvNoiseData;
    id v25 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a1);
    uint64_t result = (*(uint64_t (**)(uint64_t *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v25, v16, v24);
    *(unsigned char *)(a1 + 40) = 2;
  }
  else
  {
    uint64_t v26 = sub_2512BB3DC();
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v6, v26, v43);
    v17(v14, v2, v7);
    uint64_t v27 = sub_2512C4298();
    os_log_type_t v28 = sub_2512C4988();
    int v41 = v28;
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      os_log_t v39 = v27;
      id v40 = v6;
      uint64_t v30 = v29;
      uint64_t v38 = swift_slowAlloc();
      uint64_t v45 = v38;
      *(_DWORD *)uint64_t v30 = 136315394;
      uint64_t v37 = v30 + 4;
      uint64_t v44 = sub_2512955F8(0xD00000000000001ALL, 0x80000002512CCE20, &v45);
      sub_2512C4A68();
      *(_WORD *)(v30 + 12) = 2080;
      uint64_t v37 = v30 + 14;
      v17(v11, (uint64_t)v14, v7);
      uint64_t v31 = sub_2512C4818();
      uint64_t v44 = sub_2512955F8(v31, v32, &v45);
      sub_2512C4A68();
      swift_bridgeObjectRelease();
      objc_super v33 = *(void (**)(char *, uint64_t))(v8 + 8);
      v33(v14, v7);
      os_log_t v34 = v39;
      _os_log_impl(&dword_251285000, v39, (os_log_type_t)v41, "[%s] Encountered an unknown noise status: %s", (uint8_t *)v30, 0x16u);
      uint64_t v35 = v38;
      swift_arrayDestroy();
      MEMORY[0x25339B730](v35, -1, -1);
      MEMORY[0x25339B730](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v43);
    }
    else
    {
      objc_super v33 = *(void (**)(char *, uint64_t))(v8 + 8);
      v33(v14, v7);

      (*(void (**)(char *, uint64_t))(v42 + 8))(v6, v43);
    }
    *(void *)(a1 + 24) = &type metadata for MockNoiseData;
    *(void *)(a1 + 32) = &off_27021EAE0;
    *(void *)a1 = MEMORY[0x263F8EE78];
    *(unsigned char *)(a1 + 40) = 2;
    return ((uint64_t (*)(char *, uint64_t))v33)(v16, v7);
  }
  return result;
}

uint64_t HTRequirementStatusManager.waveFormNoiseStatus()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2512C3FB8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C3FC8();
  sub_2512B1EB0(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t HTRequirementStatusManager.addNoiseStatusObserver(_:queue:)()
{
  uint64_t v0 = sub_2512C3FA8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C3F98();
  sub_2512C3FE8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t HTRequirementStatusManager.removeNoiseStatusObserver(_:)()
{
  uint64_t v0 = sub_2512C3FA8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C3F98();
  sub_2512C3FF8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2512B26FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2512C3FB8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C3FC8();
  sub_2512B1EB0(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2512B27D8()
{
  uint64_t v0 = sub_2512C3FA8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C3F98();
  sub_2512C3FE8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2512B28CC()
{
  uint64_t v0 = sub_2512C3FA8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C3F98();
  sub_2512C3FF8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
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

uint64_t sub_2512B2A14(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for MockNoiseData()
{
  return &type metadata for MockNoiseData;
}

uint64_t static HMFitNoiseCheckViewController.prepareFitTest()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE80);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2512C4928();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  sub_2512C4908();
  uint64_t v4 = sub_2512C48F8();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = MEMORY[0x263F8F500];
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v6;
  sub_2512B2EE8((uint64_t)v2, (uint64_t)&unk_269B2E028, v5);
  return swift_release();
}

uint64_t sub_2512B2B38()
{
  sub_2512C4908();
  v0[2] = sub_2512C48F8();
  uint64_t v2 = sub_2512C48E8();
  v0[3] = v2;
  v0[4] = v1;
  return MEMORY[0x270FA2498](sub_2512B2BCC, v2, v1);
}

uint64_t sub_2512B2BCC()
{
  sub_2512C3F58();
  swift_allocObject();
  *(void *)(v0 + 40) = sub_2512C3F68();
  uint64_t v3 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F473C8] + MEMORY[0x263F473C8]);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  void *v1 = v0;
  v1[1] = sub_2512B2C98;
  return v3(20);
}

uint64_t sub_2512B2C98()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 32);
  uint64_t v3 = *(void *)(v1 + 24);
  return MEMORY[0x270FA2498](sub_2512B2DB8, v3, v2);
}

uint64_t sub_2512B2DB8()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2512B2E24()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2512B2E5C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2512AE0E4;
  return sub_2512B2B38();
}

uint64_t sub_2512B2EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2512C4928();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2512C4918();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25129F330(a1, &qword_269B2DE80);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2512C48E8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

Swift::Void __swiftcall HMFitNoiseCheckViewController.startListeningForNoiseLevelChange()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE40);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE48);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_2512B3540())
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2512C4348();
    sub_2512B3C08();
    uint64_t v10 = (void *)sub_2512C4958();
    swift_beginAccess();
    objc_setAssociatedObject(v1, &byte_269B31448, v10, (void *)1);
    swift_endAccess();
  }
  uint64_t v11 = (char *)objc_msgSend(v1, sel_fitNoiseCheckTopView);
  uint64_t v12 = *(void *)&v11[OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_provider];
  swift_retain();

  (*(void (**)(void))(*(void *)v12 + 232))();
  swift_release();
  sub_2512AD7C8(&qword_269B2DE50, &qword_269B2DE40);
  sub_2512C43C8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_getKeyPath();
  v14[1] = v1;
  sub_2512AD7C8(&qword_269B2DE58, &qword_269B2DE48);
  sub_2512C43E8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v14[0] = sub_2512B3540();
  if (v14[0])
  {
    sub_2512C4338();
    swift_release();
    if (v14[0])
    {
      sub_2512C4348();
      sub_2512B3C08();
      uint64_t v13 = (void *)sub_2512C4958();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v13 = 0;
    }
    swift_beginAccess();
    objc_setAssociatedObject(v1, &byte_269B31448, v13, (void *)1);
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2512B3540()
{
  swift_beginAccess();
  id v1 = objc_getAssociatedObject(v0, &byte_269B31448);
  swift_endAccess();
  if (v1)
  {
    sub_2512C4AB8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_25129AFB0((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E058);
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_25129F330((uint64_t)v5, &qword_269B2DBD0);
  }
  return 0;
}

BOOL sub_2512B3624@<W0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = sub_2512C42B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 v8 = *a1;
  uint64_t v9 = sub_25129D5F8();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
  uint64_t v10 = sub_2512C4298();
  os_log_type_t v11 = sub_2512C49A8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 67109120;
    unsigned __int8 v17 = v8;
    unsigned __int8 v16 = 0;
    LOBYTE(v15) = static HTUINoiseView.Mode.== infix(_:_:)(&v17, &v16);
    int v15 = v15;
    sub_2512C4A68();
    _os_log_impl(&dword_251285000, v10, v11, "$noiseViewMode listender called with value accecptable: %{BOOL}d", v12, 8u);
    MEMORY[0x25339B730](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  unsigned __int8 v19 = v8;
  unsigned __int8 v18 = 0;
  BOOL result = static HTUINoiseView.Mode.== infix(_:_:)(&v19, &v18);
  *a2 = result;
  return result;
}

id sub_2512B37F4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_buttonTray);
  *a2 = result;
  return result;
}

void sub_2512B3830(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_allButtons);
  sub_2512B3E40();
  uint64_t v4 = sub_2512C4878();

  *a2 = v4;
}

uint64_t sub_2512B3894@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2512C4B58();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4)
    {
LABEL_7:
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = v4;
      return result;
    }
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x25339AD70](0, v3);
    goto LABEL_6;
  }
  if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v6 = *(id *)(v3 + 32);
LABEL_6:
    uint64_t v4 = (uint64_t)v6;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

id sub_2512B3944@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2512B3978(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEnabled_, *a1);
}

Swift::Void __swiftcall HMFitNoiseCheckViewController.stopListeningForNoiseLevelChange()()
{
  sub_2512C4348();
  sub_2512B3C08();
  id v1 = (void *)sub_2512C4958();
  swift_beginAccess();
  objc_setAssociatedObject(v0, &byte_269B31448, v1, (void *)1);
  swift_endAccess();

  uint64_t v2 = (char *)objc_msgSend(v0, sel_fitNoiseCheckTopView);
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_provider];
  swift_retain();

  (*(void (**)(void))(*(void *)v3 + 296))();
  swift_release();
}

char *sub_2512B3BFC()
{
  return &byte_269B31448;
}

unint64_t sub_2512B3C08()
{
  unint64_t result = qword_269B2E030;
  if (!qword_269B2E030)
  {
    sub_2512C4348();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2E030);
  }
  return result;
}

char *keypath_get_selector_buttonTray()
{
  return sel_buttonTray;
}

char *keypath_get_selector_allButtons()
{
  return sel_allButtons;
}

uint64_t sub_2512B3C78()
{
  return sub_2512AD7C8(&qword_269B2E038, &qword_269B2E040);
}

char *keypath_get_selector_isEnabled()
{
  return sel_isEnabled;
}

uint64_t sub_2512B3CC0()
{
  return byte_269B31448;
}

uint64_t sub_2512B3D04(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_269B31448 = a1;
  return result;
}

uint64_t (*sub_2512B3D4C())()
{
  return j__swift_endAccess;
}

ValueMetadata *type metadata accessor for HMFitNoiseCheckViewController.AssociatedKeys()
{
  return &type metadata for HMFitNoiseCheckViewController.AssociatedKeys;
}

uint64_t sub_2512B3DB4()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2512ADCFC;
  return sub_2512B2B38();
}

unint64_t sub_2512B3E40()
{
  unint64_t result = qword_269B2E050;
  if (!qword_269B2E050)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B2E050);
  }
  return result;
}

uint64_t sub_2512B3E80()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2512B3EB8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2512ADCFC;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269B2E060 + dword_269B2E060);
  return v6(a1, v4);
}

uint64_t sub_2512B3F74()
{
  uint64_t v0 = sub_2512C42B8();
  __swift_allocate_value_buffer(v0, qword_269B31450);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B31450);
  return sub_2512C42A8();
}

uint64_t sub_2512B3FF8()
{
  if (qword_269B30A60 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2512C42B8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B31450);
}

uint64_t sub_2512B405C@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B30A60 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B31450);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_2512B4104()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id sub_2512B4114()
{
  _s24HearingTestUIBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269B31468 = (uint64_t)result;
  return result;
}

uint64_t *sub_2512B4168()
{
  if (qword_269B30A68 != -1) {
    swift_once();
  }
  return &qword_269B31468;
}

id sub_2512B41B4()
{
  if (qword_269B30A68 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_269B31468;
  return v0;
}

uint64_t sub_2512B4210()
{
  if (qword_269B30A68 != -1) {
    swift_once();
  }
  return sub_2512C3E48();
}

unint64_t sub_2512B42B8()
{
  unint64_t v1 = 0xD00000000000001BLL;
  if (*v0 != 1) {
    unint64_t v1 = 0;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000015;
  }
}

uint64_t sub_2512B4308()
{
  uint64_t v1 = sub_2512C47B8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*v0)
  {
    if (*v0 == 1) {
      v7[15] = 1;
    }
    else {
      v7[14] = 2;
    }
    sub_2512C4758();
  }
  else
  {
    v7[13] = 0;
    sub_2512C4758();
  }
  uint64_t v5 = sub_2512B1764((uint64_t)v4);
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  return v5;
}

void sub_2512B44B4(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_2512B44C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v68 = a1;
  uint64_t v2 = sub_2512C4518();
  uint64_t v66 = *(void *)(v2 - 8);
  uint64_t v67 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v65 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E070);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v64 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E078);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E080);
  MEMORY[0x270FA5388](v9);
  os_log_type_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E088);
  MEMORY[0x270FA5388](v53);
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E090);
  uint64_t v58 = *(void *)(v14 - 8);
  uint64_t v59 = v14;
  MEMORY[0x270FA5388](v14);
  unint64_t v57 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E098);
  MEMORY[0x270FA5388](v55);
  unsigned __int8 v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E0A0);
  MEMORY[0x270FA5388](v56);
  unsigned __int8 v19 = (char *)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E0A8);
  MEMORY[0x270FA5388](v60);
  uint64_t v54 = (uint64_t)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E0B0);
  uint64_t v21 = MEMORY[0x270FA5388](v62);
  id v63 = (char *)&v53 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v61 = (char *)&v53 - v23;
  int v24 = *v1;
  *(void *)uint64_t v8 = sub_2512C44E8();
  *((void *)v8 + 1) = 0x4010000000000000;
  v8[16] = 0;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E0B8);
  sub_2512B4C1C(v24, (uint64_t)&v8[*(int *)(v25 + 44)]);
  if (v24)
  {
    if (v24 == 1) {
      uint64_t v26 = sub_2512C4628();
    }
    else {
      uint64_t v26 = sub_2512C4608();
    }
  }
  else
  {
    uint64_t v26 = sub_2512C4618();
  }
  uint64_t v27 = v26;
  uint64_t KeyPath = swift_getKeyPath();
  sub_2512B031C((uint64_t)v8, (uint64_t)v11, &qword_269B2E078);
  uint64_t v29 = (uint64_t *)&v11[*(int *)(v9 + 36)];
  uint64_t *v29 = KeyPath;
  v29[1] = v27;
  sub_25129F330((uint64_t)v8, &qword_269B2E078);
  uint64_t v30 = sub_2512C4578();
  uint64_t v31 = swift_getKeyPath();
  sub_2512B031C((uint64_t)v11, (uint64_t)v13, &qword_269B2E080);
  unint64_t v32 = (uint64_t *)&v13[*(int *)(v53 + 36)];
  *unint64_t v32 = v31;
  v32[1] = v30;
  sub_25129F330((uint64_t)v11, &qword_269B2E080);
  sub_2512C4568();
  sub_2512B6334();
  objc_super v33 = v57;
  sub_2512C45C8();
  sub_25129F330((uint64_t)v13, &qword_269B2E088);
  uint64_t v34 = *MEMORY[0x263F1A7B8];
  uint64_t v35 = sub_2512C4588();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = (uint64_t)v64;
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 104))(v64, v34, v35);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v36 + 56))(v37, 0, 1, v35);
  uint64_t v38 = swift_getKeyPath();
  os_log_t v39 = (uint64_t *)&v17[*(int *)(v55 + 36)];
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E0F8);
  sub_2512B031C(v37, (uint64_t)v39 + *(int *)(v40 + 28), &qword_269B2E070);
  *os_log_t v39 = v38;
  uint64_t v42 = v58;
  uint64_t v41 = v59;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v17, v33, v59);
  sub_25129F330(v37, &qword_269B2E070);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v33, v41);
  uint64_t v43 = swift_getKeyPath();
  sub_2512B031C((uint64_t)v17, (uint64_t)v19, &qword_269B2E098);
  uint64_t v44 = (uint64_t *)&v19[*(int *)(v56 + 36)];
  *uint64_t v44 = v43;
  v44[1] = 0x3FE0000000000000;
  sub_25129F330((uint64_t)v17, &qword_269B2E098);
  uint64_t v45 = sub_2512C4698();
  uint64_t v46 = v54;
  sub_2512B031C((uint64_t)v19, v54, &qword_269B2E0A0);
  uint64_t v47 = v46 + *(int *)(v60 + 36);
  *(void *)uint64_t v47 = v45;
  *(unsigned char *)(v47 + 8) = v24;
  sub_25129F330((uint64_t)v19, &qword_269B2E0A0);
  LOBYTE(v69) = v24;
  uint64_t v69 = sub_2512B4308();
  uint64_t v70 = v48;
  sub_2512B65A4();
  sub_25129C378();
  uint64_t v49 = (uint64_t)v63;
  sub_2512C45E8();
  swift_bridgeObjectRelease();
  sub_25129F330(v46, &qword_269B2E0A8);
  id v50 = v65;
  sub_2512C4508();
  uint64_t v51 = (uint64_t)v61;
  sub_2512C4438();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v50, v67);
  sub_25129F330(v49, &qword_269B2E0B0);
  return sub_2512B6F18(v51, v68, &qword_269B2E0B0);
}

uint64_t sub_2512B4C1C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E180);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)v23 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v23 - v11;
  v23[0] = sub_2512C4648();
  sub_2512C45F8();
  swift_release();
  sub_2512B6F18((uint64_t)v10, (uint64_t)v12, &qword_269B2E180);
  LOBYTE(v23[0]) = a1;
  v23[0] = sub_2512B4308();
  v23[1] = v13;
  sub_25129C378();
  uint64_t v14 = sub_2512C4598();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  sub_2512B031C((uint64_t)v12, (uint64_t)v7, &qword_269B2E180);
  sub_2512B031C((uint64_t)v7, a2, &qword_269B2E180);
  uint64_t v21 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B2E188) + 48);
  *(void *)uint64_t v21 = v14;
  *(void *)(v21 + 8) = v16;
  *(unsigned char *)(v21 + 16) = v20;
  *(void *)(v21 + 24) = v18;
  sub_2512B6F7C(v14, v16, v20);
  swift_bridgeObjectRetain();
  sub_25129F330((uint64_t)v12, &qword_269B2E180);
  sub_2512B6F8C(v14, v16, v20);
  swift_bridgeObjectRelease();
  return sub_25129F330((uint64_t)v7, &qword_269B2E180);
}

uint64_t sub_2512B4E3C()
{
  if (!*v0) {
    return sub_2512C4618();
  }
  if (*v0 == 1) {
    return sub_2512C4628();
  }
  return sub_2512C4608();
}

uint64_t sub_2512B4E5C()
{
  return swift_retain();
}

uint64_t HTUINoiseView.init(model:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

double HTUINoiseView.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2512C4528();
  if (qword_269B30A90 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_269B30A98;
  sub_2512B4FAC(v3, (uint64_t)v13);
  *(_OWORD *)&v15[71] = v13[4];
  *(_OWORD *)&v15[87] = v13[5];
  *(_OWORD *)&v15[103] = v14[0];
  *(_OWORD *)&v15[112] = *(_OWORD *)((char *)v14 + 9);
  *(_OWORD *)&v15[7] = v13[0];
  *(_OWORD *)&v15[23] = v13[1];
  *(_OWORD *)&v15[39] = v13[2];
  char v16 = 0;
  *(_OWORD *)&v15[55] = v13[3];
  sub_2512C4608();
  uint64_t v6 = sub_2512C4638();
  swift_release();
  char v7 = sub_2512C4558();
  long long v8 = *(_OWORD *)&v15[80];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v15[64];
  *(_OWORD *)(a1 + 97) = v8;
  long long v9 = *(_OWORD *)&v15[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v15[96];
  *(_OWORD *)(a1 + 129) = v9;
  long long v10 = *(_OWORD *)&v15[16];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v15;
  *(_OWORD *)(a1 + 33) = v10;
  double result = *(double *)&v15[32];
  long long v12 = *(_OWORD *)&v15[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v15[32];
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 65) = v12;
  *(void *)(a1 + 152) = v6;
  *(unsigned char *)(a1 + 160) = v7;
  return result;
}

void *sub_2512B4FAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = (*(double (**)(uint64_t))(*(void *)a1 + 176))(a1);
  uint64_t v6 = CGPointMake(v4, v5);
  if (qword_269B30A70 != -1) {
    swift_once();
  }
  double v7 = *(double *)&qword_269B30A78;
  if (qword_269B30A80 != -1) {
    swift_once();
  }
  double v8 = *(double *)&qword_269B30A88;
  uint64_t v9 = sub_2512C4678();
  sub_2512B51C8(0.0, 1, v7, 0, 0.0, 1, 0.0, 1, (uint64_t)v28, v8, 0, 0.0, 1, v9, v10, v6);
  uint64_t v11 = swift_release();
  uint64_t v26 = v28[1];
  uint64_t v27 = v28[0];
  LOBYTE(v8) = v29;
  char v12 = v31;
  uint64_t v13 = v32;
  char v14 = v33;
  uint64_t v15 = v34;
  char v16 = v35;
  uint64_t v24 = v36;
  uint64_t v25 = v30;
  char v17 = v37;
  char v18 = v39;
  uint64_t v22 = v40;
  uint64_t v23 = v38;
  uint64_t v21 = v41;
  double result = (*(void *(**)(void *__return_ptr, uint64_t))(*(void *)a1 + 128))(v28, v11);
  char v20 = v28[0];
  *(void *)a2 = v27;
  *(void *)(a2 + 8) = v26;
  *(unsigned char *)(a2 + 16) = LOBYTE(v8);
  *(void *)(a2 + 24) = v25;
  *(unsigned char *)(a2 + 32) = v12;
  *(void *)(a2 + 40) = v13;
  *(unsigned char *)(a2 + 48) = v14;
  *(void *)(a2 + 56) = v15;
  *(unsigned char *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v24;
  *(unsigned char *)(a2 + 80) = v17;
  *(void *)(a2 + 88) = v23;
  *(unsigned char *)(a2 + 96) = v18;
  *(void *)(a2 + 104) = v22;
  *(void *)(a2 + 112) = v21;
  *(unsigned char *)(a2 + 120) = v20;
  return result;
}

uint64_t sub_2512B51C8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16)
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
    sub_2512C4998();
    uint64_t v25 = (void *)sub_2512C4548();
    sub_2512C4288();
  }
  sub_2512C4458();
  *(_OWORD *)(a9 + 56) = v30;
  *(_OWORD *)(a9 + 72) = v31;
  *(_OWORD *)(a9 + 88) = v32;
  *(_OWORD *)(a9 + 104) = v33;
  *(_OWORD *)(a9 + 8) = v27;
  *(_OWORD *)(a9 + 24) = v28;
  *(void *)a9 = a16;
  *(_OWORD *)(a9 + 40) = v29;
  return swift_retain();
}

BOOL static HTUINoiseView.Mode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HTUINoiseView.Mode.hash(into:)()
{
  return sub_2512C4C38();
}

uint64_t HTUINoiseView.Mode.hashValue.getter()
{
  return sub_2512C4C48();
}

uint64_t (*sub_2512B540C(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2512B5464;
}

uint64_t sub_2512B5464(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 24);
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 176))(result);
    (*(void (**)(uint64_t *__return_ptr))(*(void *)v5 + 128))(&v7);
    (*(void (**)(uint64_t *))(*(void *)v6 + 144))(&v7);
    return swift_release();
  }
  return result;
}

void *sub_2512B5520@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(**(void **)a1 + 128))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_2512B557C(char *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  char v4 = *a1;
  return (*(uint64_t (**)(char *))(*(void *)v2 + 136))(&v4);
}

uint64_t sub_2512B55D4@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v1 + 232))();
  swift_release();
  uint64_t result = swift_beginAccess();
  *a1 = v1[16];
  return result;
}

uint64_t sub_2512B565C(char *a1)
{
  char v2 = *a1;
  swift_getKeyPath();
  uint64_t v4 = v1;
  char v5 = v2;
  (*(void (**)(void))(*(void *)v1 + 240))();
  return swift_release();
}

void (*sub_2512B56F8(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v1 + 232))();
  swift_release();
  v3[5] = OBJC_IVAR____TtCV13HearingModeUI13HTUINoiseView5Model___observationRegistrar;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  v3[6] = sub_2512B6DCC(&qword_269B2E140, (void (*)(uint64_t))type metadata accessor for HTUINoiseView.Model);
  sub_2512C4108();
  swift_release();
  v3[7] = sub_2512B540C((uint64_t)v3);
  return sub_2512B5818;
}

void sub_2512B5818(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  void *v1 = v1[4];
  swift_getKeyPath();
  sub_2512C40F8();
  swift_release();
  free(v1);
}

uint64_t sub_2512B58A4()
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v0 + 232))();
  swift_release();
  return swift_retain();
}

uint64_t sub_2512B5910@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 176))();
  *a2 = result;
  return result;
}

uint64_t sub_2512B595C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t KeyPath = swift_getKeyPath();
  v7[2] = v3;
  v7[3] = v2;
  char v5 = *(void (**)(uint64_t, uint64_t (*)(), void *, uint64_t))(*(void *)v3 + 240);
  swift_retain();
  v5(KeyPath, sub_2512B68E0, v7, MEMORY[0x263F8EE60] + 8);
  swift_release();
  return swift_release();
}

uint64_t sub_2512B5A14(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v4 = v1;
  uint64_t v5 = a1;
  (*(void (**)(void))(*(void *)v1 + 240))();
  swift_release();
  return swift_release();
}

uint64_t sub_2512B5AB4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 200))();
  *a2 = result;
  return result;
}

uint64_t sub_2512B5B00(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 208);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_2512B5B54()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 176))();
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 184))(v1);
  swift_release();
  return v2;
}

uint64_t sub_2512B5BCC(uint64_t a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v1 + 176))();
  (*(void (**)(uint64_t))(*(void *)v3 + 192))(a1);
  return swift_release();
}

uint64_t (*sub_2512B5C50(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)v1 + 176);
  unint64_t v4 = (*(void *)v1 + 176) & 0xFFFFFFFFFFFFLL | 0xBEF9000000000000;
  a1[2] = (uint64_t)v3;
  a1[3] = v4;
  uint64_t v5 = v3();
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 184))(v5);
  swift_release();
  *a1 = v6;
  return sub_2512B5D00;
}

uint64_t sub_2512B5D00(uint64_t *a1, char a2)
{
  uint64_t v2 = (uint64_t (*)(void))a1[2];
  uint64_t v3 = *a1;
  if (a2)
  {
    uint64_t v4 = swift_bridgeObjectRetain();
    uint64_t v5 = ((uint64_t (*)(uint64_t))v2)(v4);
    (*(void (**)(uint64_t))(*(void *)v5 + 192))(v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = v2();
    (*(void (**)(uint64_t))(*(void *)v6 + 192))(v3);
  }
  return swift_release();
}

uint64_t HTUINoiseView.Model.__allocating_init(mode:samples:)(unsigned char *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  LOBYTE(a1) = *a1;
  sub_2512C4118();
  *(unsigned char *)(v4 + 16) = (_BYTE)a1;
  type metadata accessor for NoiseWaveformView.Model();
  char v6 = (char)a1;
  *(void *)(v4 + 24) = sub_2512AF4FC(&v6, a2);
  return v4;
}

uint64_t HTUINoiseView.Model.init(mode:samples:)(char *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  char v5 = *a1;
  sub_2512C4118();
  *(unsigned char *)(v3 + 16) = v5;
  type metadata accessor for NoiseWaveformView.Model();
  char v7 = v5;
  *(void *)(v3 + 24) = sub_2512AF4FC(&v7, a2);
  return v3;
}

uint64_t sub_2512B5EB0()
{
  return sub_2512C40E8();
}

uint64_t sub_2512B5F38()
{
  return sub_2512C40D8();
}

uint64_t HTUINoiseView.Model.deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtCV13HearingModeUI13HTUINoiseView5Model___observationRegistrar;
  uint64_t v2 = sub_2512C4128();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t HTUINoiseView.Model.__deallocating_deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtCV13HearingModeUI13HTUINoiseView5Model___observationRegistrar;
  uint64_t v2 = sub_2512C4128();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

void sub_2512B610C()
{
  qword_269B30A78 = 0x4071D00000000000;
}

void sub_2512B6120()
{
  qword_269B30A88 = 0x4062C00000000000;
}

void sub_2512B6134()
{
  qword_269B30A98 = 0x4040000000000000;
}

double sub_2512B6144@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2512C4528();
  if (qword_269B30A90 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_269B30A98;
  sub_2512B4FAC(v3, (uint64_t)v13);
  *(_OWORD *)&v15[71] = v13[4];
  *(_OWORD *)&v15[87] = v13[5];
  *(_OWORD *)&v15[103] = v14[0];
  *(_OWORD *)&v15[112] = *(_OWORD *)((char *)v14 + 9);
  *(_OWORD *)&v15[7] = v13[0];
  *(_OWORD *)&v15[23] = v13[1];
  *(_OWORD *)&v15[39] = v13[2];
  char v16 = 0;
  *(_OWORD *)&v15[55] = v13[3];
  sub_2512C4608();
  uint64_t v6 = sub_2512C4638();
  swift_release();
  char v7 = sub_2512C4558();
  long long v8 = *(_OWORD *)&v15[80];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v15[64];
  *(_OWORD *)(a1 + 97) = v8;
  long long v9 = *(_OWORD *)&v15[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v15[96];
  *(_OWORD *)(a1 + 129) = v9;
  long long v10 = *(_OWORD *)&v15[16];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v15;
  *(_OWORD *)(a1 + 33) = v10;
  double result = *(double *)&v15[32];
  long long v12 = *(_OWORD *)&v15[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v15[32];
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 65) = v12;
  *(void *)(a1 + 152) = v6;
  *(unsigned char *)(a1 + 160) = v7;
  return result;
}

uint64_t sub_2512B6284@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2512C4468();
  *a1 = result;
  return result;
}

uint64_t sub_2512B62B0()
{
  return sub_2512C4478();
}

uint64_t sub_2512B62DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2512C44A8();
  *a1 = result;
  return result;
}

uint64_t sub_2512B6308()
{
  return sub_2512C44B8();
}

unint64_t sub_2512B6334()
{
  unint64_t result = qword_269B2E0C0;
  if (!qword_269B2E0C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2E088);
    sub_2512B63D4();
    sub_2512AD7C8(&qword_269B2E0E8, &qword_269B2E0F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2E0C0);
  }
  return result;
}

unint64_t sub_2512B63D4()
{
  unint64_t result = qword_269B2E0C8;
  if (!qword_269B2E0C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2E080);
    sub_2512AD7C8(&qword_269B2E0D0, &qword_269B2E078);
    sub_2512AD7C8(&qword_269B2E0D8, &qword_269B2E0E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2E0C8);
  }
  return result;
}

uint64_t sub_2512B6498()
{
  return sub_2512C44C8();
}

uint64_t sub_2512B64BC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E070);
  MEMORY[0x270FA5388](v2 - 8);
  sub_2512B031C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269B2E070);
  return sub_2512C44D8();
}

uint64_t sub_2512B6550@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_2512C4488();
  *a1 = v3;
  return result;
}

uint64_t sub_2512B657C()
{
  return sub_2512C4498();
}

unint64_t sub_2512B65A4()
{
  unint64_t result = qword_269B2E100;
  if (!qword_269B2E100)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2E0A8);
    sub_2512B6644();
    sub_2512AD7C8(&qword_269B2E130, &qword_269B2E138);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2E100);
  }
  return result;
}

unint64_t sub_2512B6644()
{
  unint64_t result = qword_269B2E108;
  if (!qword_269B2E108)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2E0A0);
    sub_2512B66E4();
    sub_2512AD7C8(&qword_269B2E120, &qword_269B2E128);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2E108);
  }
  return result;
}

unint64_t sub_2512B66E4()
{
  unint64_t result = qword_269B2E110;
  if (!qword_269B2E110)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2E098);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2E088);
    sub_2512B6334();
    swift_getOpaqueTypeConformance2();
    sub_2512AD7C8(&qword_269B2E118, &qword_269B2E0F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2E110);
  }
  return result;
}

uint64_t sub_2512B67B8()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 24);
  uint64_t v3 = swift_beginAccess();
  v1[16] = v2;
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 176))(v3);
  (*(void (**)(void *__return_ptr))(*(void *)v1 + 128))(v6);
  (*(void (**)(void *))(*(void *)v4 + 144))(v6);
  return swift_release();
}

uint64_t type metadata accessor for HTUINoiseView.Model()
{
  uint64_t result = qword_269B30D60;
  if (!qword_269B30D60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2512B68E0()
{
  return sub_2512B6EDC();
}

uint64_t sub_2512B68F8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2512B6918()
{
  unint64_t result = qword_269B2E148;
  if (!qword_269B2E148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2E148);
  }
  return result;
}

uint64_t sub_2512B696C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t _s24HearingTestUIBundleClassCMa()
{
  return self;
}

ValueMetadata *type metadata accessor for NoiseLabelView()
{
  return &type metadata for NoiseLabelView;
}

ValueMetadata *type metadata accessor for HTUINoiseView()
{
  return &type metadata for HTUINoiseView;
}

uint64_t _s13HearingModeUI13HTUINoiseViewV4ModeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s13HearingModeUI13HTUINoiseViewV4ModeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2512B6B30);
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

ValueMetadata *type metadata accessor for HTUINoiseView.Mode()
{
  return &type metadata for HTUINoiseView.Mode;
}

uint64_t sub_2512B6B68()
{
  return type metadata accessor for HTUINoiseView.Model();
}

uint64_t sub_2512B6B70()
{
  uint64_t result = sub_2512C4128();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for HTUINoiseView.Model(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HTUINoiseView.Model);
}

uint64_t dispatch thunk of HTUINoiseView.Model.mode.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of HTUINoiseView.Model.mode.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of HTUINoiseView.Model.mode.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of HTUINoiseView.Model.samples.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of HTUINoiseView.Model.samples.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of HTUINoiseView.Model.samples.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of HTUINoiseView.Model.__allocating_init(mode:samples:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

unint64_t sub_2512B6D20()
{
  unint64_t result = qword_269B2E150;
  if (!qword_269B2E150)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2E0B0);
    sub_2512B65A4();
    sub_2512B6DCC(&qword_269B2E158, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2E150);
  }
  return result;
}

uint64_t sub_2512B6DCC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2512B6E18()
{
  unint64_t result = qword_269B2E160;
  if (!qword_269B2E160)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2E168);
    sub_2512AD7C8(&qword_269B2E170, &qword_269B2E178);
    sub_2512AD7C8(&qword_269B2DF10, &qword_269B2DF18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2E160);
  }
  return result;
}

uint64_t sub_2512B6EDC()
{
  *(void *)(*(void *)(v0 + 16) + 24) = *(void *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_2512B6F18(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2512B6F7C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_2512B6F8C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

void *sub_2512B6FA0()
{
  return &unk_2512C8110;
}

double sub_2512B6FAC()
{
  return 0.0;
}

void *sub_2512B6FB4()
{
  return &unk_2512C8114;
}

float sub_2512B6FC0()
{
  return 100.0;
}

uint64_t sub_2512B6FCC(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 16)) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v2 + 88))(a2, result);
  }
  return result;
}

void sub_2512B7008(CGContext *a1, uint64_t a2, uint64_t a3)
{
  CGContextSetAlpha(a1, 1.0);
  unsigned int v6 = (CGColor *)objc_msgSend(*(id *)(a3 + 16), sel_CGColor);
  CGContextSetFillColorWithColor(a1, v6);

  double v7 = *(double *)a3;
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = *(CGFloat *)a3;
  v24.size.height = *(CGFloat *)(a3 + 8);
  CGContextFillRect(a1, v24);
  CGMutablePathRef Mutable = CGPathCreateMutable();
  sub_2512C49C8();
  *(_OWORD *)((char *)&v17[1] + 4) = *(_OWORD *)(a3 + 36);
  *(_OWORD *)char v17 = *(_OWORD *)(a3 + 24);
  uint64_t v9 = *(void *)(a2 + 16);
  if (v7 - (*(double *)&v17[1] + *(double *)&v17[2]) * (double)v9 <= 0.0)
  {
    if (!v9) {
      goto LABEL_8;
    }
  }
  else if (!v9)
  {
    goto LABEL_8;
  }
  uint64_t v18 = 0x3FF0000000000000;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0x3FF0000000000000;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  sub_2512B729C(v17);
  swift_bridgeObjectRetain();
  uint64_t v10 = 0;
  do
  {
    uint64_t v11 = v10 + 1;
    sub_2512C49C8();
    sub_2512C49D8();
    uint64_t v10 = v11;
  }
  while (v9 != v11);
  swift_bridgeObjectRelease();
  sub_2512C49C8();
  sub_2512B72C8(v17);
LABEL_8:
  long long v12 = Mutable;
  CGPathCloseSubpath(v12);
  CGContextAddPath(a1, v12);

  uint64_t v13 = *(void **)(a3 + 24);
  CGFloat v14 = *(double *)(a3 + 32);
  CGLineCap v15 = *(_DWORD *)(a3 + 48);
  CGContextSetLineWidth(a1, v14);
  CGContextSetLineCap(a1, v15);
  char v16 = (CGColor *)objc_msgSend(v13, sel_CGColor, 0x3FF0000000000000, 0, 0, 0x3FF0000000000000, 0, 0, v17[0]);
  CGContextSetStrokeColorWithColor(a1, v16);

  CGContextStrokePath(a1);
}

uint64_t sub_2512B7260()
{
  return v0;
}

uint64_t sub_2512B7268()
{
  return swift_allocObject();
}

uint64_t type metadata accessor for WaveformRenderer()
{
  return self;
}

id *sub_2512B729C(id *a1)
{
  id v2 = *a1;
  return a1;
}

id *sub_2512B72C8(id *a1)
{
  return a1;
}

uint64_t sub_2512B72F4()
{
  sub_2512B739C(v0, (uint64_t)v4);
  uint64_t v1 = 0x7065636341746F4ELL;
  if (v5 != 1) {
    uint64_t v1 = 0x6572676F72506E49;
  }
  if (v5) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0x6261747065636341;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v2;
}

uint64_t sub_2512B739C(uint64_t a1, uint64_t a2)
{
  return initializeWithCopy for NoiseStatus(a2, a1);
}

uint64_t _s13HearingModeUI11NoiseStatusO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0x6261747065636341;
  sub_2512B739C(a1, (uint64_t)v13);
  uint64_t v4 = 0x7065636341746F4ELL;
  unint64_t v5 = 0xED0000656C626174;
  if (v14 != 1)
  {
    uint64_t v4 = 0x6572676F72506E49;
    unint64_t v5 = 0xEA00000000007373;
  }
  if (v14) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0x6261747065636341;
  }
  if (v14) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = 0xEA0000000000656CLL;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  sub_2512B739C(a2, (uint64_t)v13);
  uint64_t v8 = 0x7065636341746F4ELL;
  unint64_t v9 = 0xED0000656C626174;
  if (v14 != 1)
  {
    uint64_t v8 = 0x6572676F72506E49;
    unint64_t v9 = 0xEA00000000007373;
  }
  if (v14)
  {
    uint64_t v3 = v8;
    unint64_t v10 = v9;
  }
  else
  {
    unint64_t v10 = 0xEA0000000000656CLL;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  if (v6 == v3 && v7 == v10) {
    char v11 = 1;
  }
  else {
    char v11 = sub_2512C4BC8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t initializeWithCopy for NoiseStatus(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 3) {
    LOBYTE(v3) = *(unsigned char *)a2 + 3;
  }
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(uint64_t))(v4 - 8))(a1);
  *(unsigned char *)(a1 + 40) = v3;
  return a1;
}

uint64_t assignWithCopy for NoiseStatus(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    unsigned int v4 = *(unsigned __int8 *)(a2 + 40);
    if (v4 >= 3) {
      LOBYTE(v4) = *(unsigned char *)a2 + 3;
    }
    uint64_t v5 = *(void *)(a2 + 24);
    *(void *)(a1 + 24) = v5;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
    *(unsigned char *)(a1 + 40) = v4;
  }
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

uint64_t assignWithTake for NoiseStatus(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    unsigned int v4 = *(unsigned __int8 *)(a2 + 40);
    if (v4 >= 3) {
      LOBYTE(v4) = *(unsigned char *)a2 + 3;
    }
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(unsigned char *)(a1 + 40) = v4;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for NoiseStatus(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 3) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for NoiseStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 254;
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
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2512B771C(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 3) {
    return (*(_DWORD *)a1 + 3);
  }
  return result;
}

uint64_t sub_2512B7738(uint64_t result, unsigned int a2)
{
  if (a2 > 2)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for NoiseStatus()
{
  return &type metadata for NoiseStatus;
}

uint64_t sub_2512B7770()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_2512C3E48();

  return v2;
}

uint64_t sub_2512B7824()
{
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_2512C3E48();

  return v2;
}

uint64_t sub_2512B78DC()
{
  uint64_t v0 = sub_2512C42B8();
  __swift_allocate_value_buffer(v0, qword_269B31470);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B31470);
  return sub_2512C42A8();
}

uint64_t sub_2512B7960()
{
  if (qword_269B30DF0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2512C42B8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B31470);
}

uint64_t sub_2512B79C4@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B30DF0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B31470);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

id sub_2512B7A6C()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F472F8]);
  return objc_msgSend(v0, sel_init);
}

id sub_2512B7AA4()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_hearingModeClient);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_2512B7AFC(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_hearingModeClient);
  swift_beginAccess();
  unsigned int v4 = *v3;
  *uint64_t v3 = a1;
}

uint64_t (*sub_2512B7B50())()
{
  return j__swift_endAccess;
}

uint64_t sub_2512B7BAC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceAddress);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2512B7BE8()
{
  return 0x4E574F4E4B4E55;
}

id sub_2512B7C00()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_selectedAudiogram));
}

void *sub_2512B7C10()
{
  sub_2512C4188();
  uint64_t v1 = (void *)sub_2512C4178();
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceAddress);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceAddress + 8);
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2512C4168();

  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_251295C50(v3, v2), (v6 & 1) != 0))
  {
    unint64_t v7 = *(void **)(*(void *)(v4 + 56) + 8 * v5);
    id v8 = v7;
  }
  else
  {
    unint64_t v7 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

char *HMMediaAssistEnrollmentViewController.__allocating_init(deviceAddress:audiogramSample:)(uint64_t a1, NSObject *a2, NSObject *a3)
{
  id v7 = objc_allocWithZone(v3);
  return HMMediaAssistEnrollmentViewController.init(deviceAddress:audiogramSample:)(a1, a2, a3);
}

char *HMMediaAssistEnrollmentViewController.init(deviceAddress:audiogramSample:)(uint64_t a1, NSObject *a2, NSObject *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_hearingModeClient;
  id v9 = objc_allocWithZone(MEMORY[0x263F472F8]);
  unint64_t v10 = v4;
  *(void *)&v4[v8] = objc_msgSend(v9, sel_init);
  char v11 = (uint64_t *)&v10[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceName];
  uint64_t *v11 = 0;
  v11[1] = 0xE000000000000000;
  long long v12 = &v10[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceIdentifier];
  *(void *)long long v12 = 0x4E574F4E4B4E55;
  *((void *)v12 + 1) = 0xE700000000000000;
  if (!a2)
  {
    if (qword_269B30DF0 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_2512C42B8();
    __swift_project_value_buffer(v26, (uint64_t)qword_269B31470);
    long long v27 = sub_2512C4298();
    os_log_type_t v28 = sub_2512C4988();
    if (os_log_type_enabled(v27, v28))
    {
      long long v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v29 = 0;
      _os_log_impl(&dword_251285000, v27, v28, "Media Assist: Cannot Start Enrollment, Invalid address", v29, 2u);
      MEMORY[0x25339B730](v29, -1, -1);
    }

    goto LABEL_24;
  }
  if (!a3)
  {
    swift_bridgeObjectRelease();
    if (qword_269B30DF0 != -1) {
      swift_once();
    }
    uint64_t v63 = sub_2512C42B8();
    __swift_project_value_buffer(v63, (uint64_t)qword_269B31470);
    a3 = sub_2512C4298();
    os_log_type_t v64 = sub_2512C4988();
    if (os_log_type_enabled(a3, v64))
    {
      uint64_t v65 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v65 = 0;
      _os_log_impl(&dword_251285000, a3, v64, "Media Assist: Cannot Start Enrollment, Invalid audiogram", v65, 2u);
      MEMORY[0x25339B730](v65, -1, -1);
    }
LABEL_24:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for HMMediaAssistEnrollmentViewController();
    swift_deallocPartialClassInstance();
    return 0;
  }
  sub_2512C4188();
  uint64_t v13 = a3;
  char v14 = (void *)sub_2512C4178();
  v79[0] = a1;
  v79[1] = (uint64_t)a2;
  uint64_t v77 = 58;
  unint64_t v78 = 0xE100000000000000;
  uint64_t v75 = 45;
  unint64_t v76 = 0xE100000000000000;
  unint64_t v68 = sub_25129C378();
  uint64_t v67 = MEMORY[0x263F8D310];
  uint64_t v15 = sub_2512C4A88();
  uint64_t v17 = v16;
  uint64_t v18 = sub_2512C4168();

  uint64_t v72 = a1;
  if (*(void *)(v18 + 16) && (unint64_t v19 = sub_251295C50(v15, v17), (v20 & 1) != 0))
  {
    id v21 = *(id *)(*(void *)(v18 + 56) + 8 * v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v22 = v21;
    uint64_t v23 = sub_2512C4158();
    unint64_t v25 = v24;
    uint64_t v70 = v22;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v23 = 0;
    uint64_t v70 = 0;
    unint64_t v25 = 0xE000000000000000;
  }
  uint64_t *v11 = v23;
  v11[1] = v25;
  swift_bridgeObjectRelease();
  long long v30 = sub_251294620();
  long long v31 = (id)*v30;
  if ([v13 isFirstPartyHearingTestResult])uint64_t v32 = 1; {
  else
  }
    uint64_t v32 = 2;
  uint64_t v33 = EnrollmentAnalyticManager.AudiogramType.rawValue.getter(v32);
  uint64_t v34 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v31) + 0x130))(1, v33);

  id v35 = [v13 hearingLevelSummary];
  id v36 = objc_msgSend(v35, sel_leftEarMetrics);

  id v37 = objc_msgSend(v36, sel_averageSensitivity);
  id v38 = [v13 hearingLevelSummary];
  id v39 = objc_msgSend(v38, sel_rightEarMetrics);

  id v40 = objc_msgSend(v39, sel_averageSensitivity);
  uint64_t v41 = (id)*v30;
  uint64_t v71 = v37;
  uint64_t v42 = HKHearingLevelClassificationForSensitivity();
  if (v42 < 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  (*(void (**)(uint64_t, uint64_t))((*v34 & *v41) + 0x130))(2, v42);

  uint64_t v43 = (id)*v30;
  uint64_t v44 = HKHearingLevelClassificationForSensitivity();
  if (v44 < 0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v69 = v40;
  (*(void (**)(uint64_t, uint64_t))((*v34 & *v43) + 0x130))(3, v44);

  uint64_t v45 = (uint64_t *)&v10[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceAddress];
  *uint64_t v45 = v72;
  v45[1] = (uint64_t)a2;
  *(void *)&v10[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_selectedAudiogram] = v13;
  uint64_t v46 = (objc_class *)type metadata accessor for HMMediaAssistEnrollmentViewController();
  a2 = v13;
  sub_2512B7770();
  sub_2512B7770();
  swift_getObjectType();

  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v48 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v49 = (void *)sub_2512C47C8();
  id v37 = objc_msgSend(self, sel_imageNamed_inBundle_, v49, v48);

  id v50 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  uint64_t v51 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  v74.receiver = v10;
  v74.super_class = v46;
  id v52 = objc_msgSendSuper2(&v74, sel_initWithTitle_detailText_icon_contentLayout_, v50, v51, v37, 2);

  uint64_t v53 = qword_269B30DF0;
  unint64_t v10 = (char *)v52;
  if (v53 != -1) {
LABEL_30:
  }
    swift_once();
  uint64_t v54 = sub_2512C42B8();
  __swift_project_value_buffer(v54, (uint64_t)qword_269B31470);
  uint64_t v55 = v10;
  uint64_t v56 = sub_2512C4298();
  os_log_type_t v57 = sub_2512C49A8();
  if (os_log_type_enabled(v56, v57))
  {
    uint64_t v58 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    *(_DWORD *)uint64_t v58 = 136315138;
    v79[0] = v59;
    id v73 = v37;
    uint64_t v60 = a2;
    uint64_t v62 = *(void *)&v55[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceAddress];
    unint64_t v61 = *(void *)&v55[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceAddress + 8];
    swift_bridgeObjectRetain();
    uint64_t v77 = sub_2512955F8(v62, v61, v79);
    sub_2512C4A68();

    a2 = v60;
    id v37 = v73;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_251285000, v56, v57, "Media Assist: Init with Device: %s", v58, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339B730](v59, -1, -1);
    MEMORY[0x25339B730](v58, -1, -1);
  }
  else
  {
  }
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *(void *)v55) + 0xD0))();

  return v55;
}

uint64_t type metadata accessor for HMMediaAssistEnrollmentViewController()
{
  return self;
}

void sub_2512B8678()
{
  uint64_t v1 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78);
  uint64_t v2 = (void *)v1();
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v16 = sub_2512BAB9C;
  uint64_t v17 = v3;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 1107296256;
  char v14 = sub_251298D30;
  uint64_t v15 = &block_descriptor_4;
  uint64_t v4 = _Block_copy(&v12);
  swift_release();
  objc_msgSend(v2, sel_setInterruptionHandler_, v4);
  _Block_release(v4);

  unint64_t v5 = (void *)v1();
  uint64_t v16 = sub_2512B895C;
  uint64_t v17 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 1107296256;
  char v14 = sub_251298D30;
  uint64_t v15 = &block_descriptor_3;
  char v6 = _Block_copy(&v12);
  objc_msgSend(v5, sel_setInvalidationHandler_, v6);
  _Block_release(v6);

  id v7 = (void *)v1();
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v16 = sub_2512BAD60;
  uint64_t v17 = v8;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 1107296256;
  char v14 = sub_25129FCEC;
  uint64_t v15 = &block_descriptor_7;
  id v9 = _Block_copy(&v12);
  swift_release();
  objc_msgSend(v7, sel_setDeviceRecordChangedHandler_, v9);
  _Block_release(v9);

  unint64_t v10 = (void *)v1();
  uint64_t v16 = sub_2512B8A44;
  uint64_t v17 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 1107296256;
  char v14 = sub_2512B8BB4;
  uint64_t v15 = &block_descriptor_10;
  char v11 = _Block_copy(&v12);
  objc_msgSend(v10, sel_activateWithCompletion_, v11);
  _Block_release(v11);
}

void sub_2512B895C()
{
  if (qword_269B30DF0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2512C42B8();
  __swift_project_value_buffer(v0, (uint64_t)qword_269B31470);
  os_log_t oslog = sub_2512C4298();
  os_log_type_t v1 = sub_2512C49A8();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_251285000, oslog, v1, "Media Assist: HMS Invalidted", v2, 2u);
    MEMORY[0x25339B730](v2, -1, -1);
  }
}

void sub_2512B8A44(uint64_t a1)
{
  if (a1)
  {
    if (qword_269B30DF0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_2512C42B8();
    __swift_project_value_buffer(v1, (uint64_t)qword_269B31470);
    os_log_t oslog = sub_2512C4298();
    os_log_type_t v2 = sub_2512C4988();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      uint64_t v4 = "Media Assist: Fail to Activate HMS";
LABEL_10:
      _os_log_impl(&dword_251285000, oslog, v2, v4, v3, 2u);
      MEMORY[0x25339B730](v3, -1, -1);
    }
  }
  else
  {
    if (qword_269B30DF0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_2512C42B8();
    __swift_project_value_buffer(v5, (uint64_t)qword_269B31470);
    os_log_t oslog = sub_2512C4298();
    os_log_type_t v2 = sub_2512C49A8();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      uint64_t v4 = "Media Assist: HMS Activated";
      goto LABEL_10;
    }
  }
}

void sub_2512B8BB4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id HMMediaAssistEnrollmentViewController.__deallocating_deinit()
{
  uint64_t v1 = v0;
  os_log_type_t v2 = (id *)&v0[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_hearingModeClient];
  swift_beginAccess();
  objc_msgSend(*v2, sel_invalidate);
  if (qword_269B30DF0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2512C42B8();
  __swift_project_value_buffer(v3, (uint64_t)qword_269B31470);
  id v4 = sub_2512C4298();
  os_log_type_t v5 = sub_2512C49A8();
  if (os_log_type_enabled(v4, v5))
  {
    char v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_251285000, v4, v5, "Media Assist: HMS Invalidation Triggered", v6, 2u);
    MEMORY[0x25339B730](v6, -1, -1);
  }

  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for HMMediaAssistEnrollmentViewController();
  return objc_msgSendSuper2(&v8, sel_dealloc);
}

void sub_2512B8DFC()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  v21.receiver = v0;
  v21.super_class = (Class)type metadata accessor for HMMediaAssistEnrollmentViewController();
  id v2 = objc_msgSendSuper2(&v21, sel_viewDidLoad);
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(id))((*MEMORY[0x263F8EED0] & *v0) + 0x100))(v2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2DB40);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2512C6440;
  uint64_t v5 = sub_2512C42C8();
  uint64_t v6 = MEMORY[0x263F81EF0];
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
  sub_2512C49E8();
  swift_unknownObjectRelease();
  uint64_t v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))((*v3 & *v0) + 0xE0))(v7);
  id v8 = objc_msgSend(v0, sel_buttonTray);
  id v9 = objc_msgSend(v8, sel_allButtons);

  sub_2512B3E40();
  unint64_t v10 = sub_2512C4878();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    char v11 = (void *)sub_2512C4B58();
    swift_bridgeObjectRelease();
    if (!v11) {
      goto LABEL_7;
    }
  }
  else
  {
    char v11 = *(void **)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v11) {
      goto LABEL_7;
    }
  }
  if ((v10 & 0xC000000000000001) != 0)
  {
    id v12 = (id)MEMORY[0x25339AD70](0, v10);
  }
  else
  {
    if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v12 = *(id *)(v10 + 32);
  }
  char v11 = v12;
LABEL_7:
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_showsBusyIndicator);

  uint64_t v13 = sub_2512B7C10();
  if (v13)
  {
    char v14 = v13;
    uint64_t v15 = (void *)sub_2512C4148();

    uint64_t v16 = sub_2512C41B8();
    uint64_t v18 = v17;

    unint64_t v19 = (void *)((char *)v1 + OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceIdentifier);
    *unint64_t v19 = v16;
    v19[1] = v18;
    uint64_t v20 = swift_bridgeObjectRelease();
    (*(void (**)(uint64_t))((*v3 & *v1) + 0xD0))(v20);
  }
}

uint64_t sub_2512B90E0(char a1)
{
  id v2 = v1;
  v34.receiver = v2;
  v34.super_class = (Class)type metadata accessor for HMMediaAssistEnrollmentViewController();
  objc_msgSendSuper2(&v34, sel_viewDidAppear_, a1 & 1);
  if (qword_269B30DF0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2512C42B8();
  __swift_project_value_buffer(v4, (uint64_t)qword_269B31470);
  uint64_t v5 = sub_2512C4298();
  os_log_type_t v6 = sub_2512C49A8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_251285000, v5, v6, "Media Assist: viewDidAppear", v7, 2u);
    MEMORY[0x25339B730](v7, -1, -1);
  }

  id v8 = sub_251294620();
  id v9 = (id)*v8;
  uint64_t v10 = EnrollmentAnalyticManager.EnrollmentResult.rawValue.getter(6);
  char v11 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v9) + 0x130))(4, v10);

  id v12 = (id)*v8;
  uint64_t v13 = EnrollmentAnalyticManager.EnrollmentType.rawValue.getter(2);
  (*(void (**)(uint64_t, uint64_t))((*v11 & *v12) + 0x130))(5, v13);

  id v14 = objc_msgSend(self, sel_processInfo);
  id v15 = objc_msgSend(v14, sel_processName);

  uint64_t v16 = sub_2512C47F8();
  uint64_t v18 = v17;

  if (v16 == 0x68746C616548 && v18 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v19 = sub_2512C4BC8();
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0) {
      goto LABEL_10;
    }
  }
  uint64_t v20 = (id)*v8;
  uint64_t v21 = EnrollmentAnalyticManager.Entrance.rawValue.getter(2);
  (*(void (**)(uint64_t, uint64_t))((*v11 & *v20) + 0x130))(6, v21);

LABEL_10:
  id v22 = objc_msgSend(v2, sel_navigationController);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E1B8);
  sub_2512C4818();
  sub_25129C378();
  char v23 = sub_2512C4AA8();
  uint64_t v24 = swift_bridgeObjectRelease();
  if (v23)
  {
    unint64_t v25 = sub_2512C4298();
    os_log_type_t v26 = sub_2512C49A8();
    if (os_log_type_enabled(v25, v26))
    {
      long long v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v27 = 0;
      _os_log_impl(&dword_251285000, v25, v26, "Media Assist: Submit Event from VC", v27, 2u);
      MEMORY[0x25339B730](v27, -1, -1);
    }

    os_log_type_t v28 = *(void (**)(id, uint64_t, uint64_t, uint64_t))((*v11 & *(void *)*v8) + 0x138);
    id v29 = (id)*v8;
    v28(v29, v30, v31, v32);
  }
  return (*(uint64_t (**)(uint64_t))((*v11 & *v2) + 0xD8))(v24);
}

void sub_2512B959C()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F472D8]), sel_init);
  objc_msgSend(v1, sel_setSelectedAudiogram_, *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_selectedAudiogram]);
  objc_msgSend(v1, sel_setEnrollHearingAssist_, 1);
  objc_msgSend(v1, sel_setEnableMediaAssist_, 1);
  objc_msgSend(v1, sel_setEnablePMEMedia_, 1);
  objc_msgSend(v1, sel_setEnablePMEVoice_, 1);
  if (qword_269B30DF0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B31470);
  uint64_t v3 = v0;
  uint64_t v4 = sub_2512C4298();
  os_log_type_t v5 = sub_2512C49A8();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v6 = 136315138;
    aBlock[0] = v7;
    uint64_t v8 = *(void *)&v3[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceIdentifier];
    unint64_t v9 = *(void *)&v3[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceIdentifier + 8];
    swift_bridgeObjectRetain();
    sub_2512955F8(v8, v9, aBlock);
    sub_2512C4A68();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_251285000, v4, v5, "Media Assist: Enroll Media Assist for device: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339B730](v7, -1, -1);
    MEMORY[0x25339B730](v6, -1, -1);
  }
  else
  {
  }
  uint64_t v10 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *(void *)v3) + 0x78))();
  swift_bridgeObjectRetain();
  char v11 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  aBlock[4] = (uint64_t)sub_2512B99B8;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = (uint64_t)sub_2512B8BB4;
  aBlock[3] = (uint64_t)&block_descriptor_13;
  id v12 = _Block_copy(aBlock);
  objc_msgSend(v10, sel_modifyDeviceConfig_identifier_completion_, v1, v11, v12);
  _Block_release(v12);

  id v13 = objc_msgSend(v3, sel_buttonTray);
  id v14 = objc_msgSend(v13, sel_allButtons);

  sub_2512B3E40();
  unint64_t v15 = sub_2512C4878();

  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = (void *)sub_2512C4B58();
    swift_bridgeObjectRelease();
    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v16 = *(void **)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v16)
    {
LABEL_12:
      swift_bridgeObjectRelease();
      objc_msgSend(v16, sel_hidesBusyIndicator);

      return;
    }
  }
  if ((v15 & 0xC000000000000001) != 0)
  {
    id v17 = (id)MEMORY[0x25339AD70](0, v15);
    goto LABEL_11;
  }
  if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v17 = *(id *)(v15 + 32);
LABEL_11:
    uint64_t v16 = v17;
    goto LABEL_12;
  }
  __break(1u);
}

void sub_2512B99B8(void *a1)
{
  if (a1)
  {
    if (qword_269B30DF0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2512C42B8();
    __swift_project_value_buffer(v2, (uint64_t)qword_269B31470);
    id v3 = a1;
    id v4 = a1;
    os_log_t oslog = sub_2512C4298();
    os_log_type_t v5 = sub_2512C49A8();
    if (os_log_type_enabled(oslog, v5))
    {
      os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v6 = 138412290;
      id v8 = a1;
      uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
      sub_2512C4A68();
      *uint64_t v7 = v13;

      _os_log_impl(&dword_251285000, oslog, v5, "Media Assist: MA Config Update Failed: %@", v6, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DBD8);
      swift_arrayDestroy();
      MEMORY[0x25339B730](v7, -1, -1);
      MEMORY[0x25339B730](v6, -1, -1);

      return;
    }
  }
  else
  {
    if (qword_269B30DF0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2512C42B8();
    __swift_project_value_buffer(v9, (uint64_t)qword_269B31470);
    os_log_t oslog = sub_2512C4298();
    os_log_type_t v10 = sub_2512C49A8();
    if (os_log_type_enabled(oslog, v10))
    {
      char v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v11 = 0;
      _os_log_impl(&dword_251285000, oslog, v10, "Media Assist: MA Config Update Succeeded", v11, 2u);
      MEMORY[0x25339B730](v11, -1, -1);
    }
  }
}

void sub_2512B9C44()
{
  id v1 = v0;
  swift_getObjectType();
  if (*(void *)&v0[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceName]) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceName + 8] == 0xE000000000000000;
  }
  if (v2 || (sub_2512C4BC8() & 1) != 0)
  {
    id v3 = objc_msgSend(v0, sel_buttonTray);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_2512C3E48();

    os_log_type_t v6 = (void *)sub_2512C47C8();
  }
  else
  {
    id v3 = objc_msgSend(v0, sel_buttonTray);
    sub_2512C4AE8();
    sub_2512C4838();
    swift_bridgeObjectRetain();
    sub_2512C4838();
    swift_bridgeObjectRelease();
    sub_2512C4838();
    uint64_t v7 = swift_getObjCClassFromMetadata();
    id v8 = objc_msgSend(self, sel_bundleForClass_, v7);
    sub_2512C3E48();
    swift_bridgeObjectRelease();

    os_log_type_t v6 = (void *)sub_2512C47C8();
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setCaptionText_, v6, 0xEB00000000747865);

  id v9 = objc_msgSend(self, sel_boldButton);
  uint64_t v10 = swift_getObjCClassFromMetadata();
  char v11 = self;
  id v12 = objc_msgSend(v11, sel_bundleForClass_, v10);
  sub_2512C3E48();

  uint64_t v13 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setTitle_forState_, v13, 0, 0xEC000000656C7469);

  objc_msgSend(v9, sel_addTarget_action_forControlEvents_, v1, sel_mainButtonTapped, 64);
  id v14 = objc_msgSend(v1, sel_buttonTray);
  objc_msgSend(v14, sel_addButton_, v9);

  id v15 = objc_msgSend(self, sel_linkButton);
  id v16 = objc_msgSend(v11, (SEL)&selRef_fitNoiseCheckTopTestingView + 5, v10);
  sub_2512C3E48();

  id v17 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setTitle_forState_, v17, 0, 0xEC000000656C7469);

  objc_msgSend(v15, sel_addTarget_action_forControlEvents_, v1, sel_secondaryButtonTapped, 64);
  id v18 = objc_msgSend(v1, sel_buttonTray);
  objc_msgSend(v18, sel_addButton_, v15);
}

uint64_t sub_2512BA10C()
{
  id v1 = v0;
  if (qword_269B30DF0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B31470);
  id v3 = sub_2512C4298();
  os_log_type_t v4 = sub_2512C49A8();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_251285000, v3, v4, "Media Assist: mainButtonTapped", v5, 2u);
    MEMORY[0x25339B730](v5, -1, -1);
  }

  os_log_type_t v6 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0xF8);
  return v6();
}

void sub_2512BA360()
{
  if (qword_269B30DF0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2512C42B8();
  __swift_project_value_buffer(v1, (uint64_t)qword_269B31470);
  uint64_t v2 = sub_2512C4298();
  os_log_type_t v3 = sub_2512C49A8();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl(&dword_251285000, v2, v3, "Media Assist: secondaryButtonTapped", v4, 2u);
    MEMORY[0x25339B730](v4, -1, -1);
  }

  id v5 = *(void **)&v0[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_selectedAudiogram];
  id v6 = objc_allocWithZone((Class)HMHearingAidEnrollmentViewController);
  swift_bridgeObjectRetain();
  id v7 = v5;
  id v8 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  os_log_t oslog = objc_msgSend(v6, sel_initWithBluetoothUUID_withAudiogramSample_, v8, v7);

  if (oslog)
  {
    id v9 = objc_msgSend(v0, sel_navigationController);
    if (v9)
    {
      uint64_t v10 = v9;
      objc_msgSend(v9, sel_pushViewController_animated_, oslog, 1);
    }
  }
  else
  {
    os_log_t oslog = sub_2512C4298();
    os_log_type_t v11 = sub_2512C4988();
    if (os_log_type_enabled(oslog, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_251285000, oslog, v11, "Media Assist: Cannot trigger Hearing Aid Enrollment", v12, 2u);
      MEMORY[0x25339B730](v12, -1, -1);
    }
  }
}

void sub_2512BA5CC()
{
  uint64_t v1 = v0;
  if (qword_269B30DF0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B31470);
  os_log_type_t v3 = sub_2512C4298();
  os_log_type_t v4 = sub_2512C49A8();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_251285000, v3, v4, "Media Assist: dismissMediaAssistEnrollment", v5, 2u);
    MEMORY[0x25339B730](v5, -1, -1);
  }

  id v6 = objc_msgSend(self, sel_defaultCenter);
  id v7 = (void *)sub_2512C47C8();
  objc_msgSend(v6, sel_postNotificationName_object_, v7, 0);

  id v8 = objc_msgSend(v1, sel_navigationController);
  if (v8)
  {
    id v9 = v8;
    objc_msgSend(v8, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

void sub_2512BA770()
{
  id v1 = objc_msgSend(self, sel_currentTraitCollection);
  objc_msgSend(v1, sel_userInterfaceStyle);

  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  os_log_type_t v4 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_imageNamed_inBundle_, v4, v3);

  id v6 = objc_msgSend(v0, sel_headerView);
  if (v5)
  {
    id v7 = v6;
    id v8 = v5;
    id v9 = (id)sub_2512C47C8();
    objc_msgSend(v7, sel_setIcon_accessibilityLabel_, v8, v9);
  }
  else
  {
    __break(1u);
  }
}

id HMMediaAssistEnrollmentViewController.__allocating_init(title:detailText:symbolName:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v8 = v7;
  id v12 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    id v14 = 0;
    goto LABEL_6;
  }
  uint64_t v13 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  id v14 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v12, v13, v14, a7);

  return v15;
}

void HMMediaAssistEnrollmentViewController.init(title:detailText:symbolName:contentLayout:)()
{
}

id HMMediaAssistEnrollmentViewController.__allocating_init(title:detailText:icon:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v7 = v6;
  os_log_type_t v11 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v12 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v12 = 0;
  }
  id v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, a5, a6);

  return v13;
}

void HMMediaAssistEnrollmentViewController.init(title:detailText:icon:contentLayout:)()
{
}

uint64_t sub_2512BAB64()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2512BAB9C()
{
  uint64_t v1 = v0 + 16;
  if (qword_269B30DF0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B31470);
  id v3 = sub_2512C4298();
  os_log_type_t v4 = sub_2512C49A8();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_251285000, v3, v4, "Media Assist: HMS Interrupted", v5, 2u);
    MEMORY[0x25339B730](v5, -1, -1);
  }

  swift_beginAccess();
  id v6 = (void *)MEMORY[0x25339B7D0](v1);
  id v7 = (void *)MEMORY[0x263F8EED0];
  if (v6)
  {
    id v8 = v6;
    (*(void (**)(id))((*MEMORY[0x263F8EED0] & *v6) + 0x80))(objc_msgSend(objc_allocWithZone(MEMORY[0x263F472F8]), sel_init));
  }
  swift_beginAccess();
  id v9 = (void *)MEMORY[0x25339B7D0](v1);
  if (v9)
  {
    uint64_t v10 = v9;
    (*(void (**)(void))((*v7 & *v9) + 0xD0))();
  }
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

void sub_2512BAD60(void *a1)
{
  uint64_t v3 = v1 + 16;
  if (qword_269B30DF0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2512C42B8();
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_269B31470);
  id v6 = a1;
  uint64_t v50 = v5;
  id v7 = sub_2512C4298();
  os_log_type_t v8 = sub_2512C49A8();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)id v9 = 138412290;
    v51[9] = (uint64_t)v6;
    id v11 = v6;
    sub_2512C4A68();
    *uint64_t v10 = v6;

    _os_log_impl(&dword_251285000, v7, v8, "Media Assist: Device Found: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DBD8);
    swift_arrayDestroy();
    MEMORY[0x25339B730](v10, -1, -1);
    MEMORY[0x25339B730](v9, -1, -1);
  }
  else
  {
  }
  swift_beginAccess();
  uint64_t v12 = MEMORY[0x25339B7D0](v3);
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v15 = *(void *)(v12 + OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceAddress);
    uint64_t v14 = *(void *)(v12 + OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceAddress + 8);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v14 = 0;
  }
  id v16 = objc_msgSend(v6, sel_bluetoothAddress, v50);
  uint64_t v17 = sub_2512C47F8();
  uint64_t v19 = v18;

  if (!v14)
  {
    swift_bridgeObjectRelease();
LABEL_15:
    swift_beginAccess();
    uint64_t v21 = MEMORY[0x25339B7D0](v3);
    if (v21)
    {
      id v22 = (void *)v21;
      uint64_t v24 = *(void *)(v21 + OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceAddress);
      uint64_t v23 = *(void *)(v21 + OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceAddress + 8);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v23 = 0;
    }
    id v25 = objc_msgSend(v6, sel_bluetoothUUID);
    uint64_t v26 = sub_2512C47F8();
    uint64_t v28 = v27;

    if (!v23)
    {
      swift_bridgeObjectRelease();
      return;
    }
    if (v24 != v26 || v23 != v28)
    {
      char v49 = sub_2512C4BC8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v49 & 1) == 0) {
        return;
      }
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v15 != v17 || v14 != v19)
  {
    char v20 = sub_2512C4BC8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v20) {
      goto LABEL_22;
    }
    goto LABEL_15;
  }
LABEL_21:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_22:
  swift_beginAccess();
  uint64_t v29 = MEMORY[0x25339B7D0](v3);
  if (v29)
  {
    uint64_t v30 = (char *)v29;
    id v31 = objc_msgSend(v6, sel_bluetoothUUID);
    uint64_t v32 = sub_2512C47F8();
    uint64_t v34 = v33;

    id v35 = (uint64_t *)&v30[OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_deviceIdentifier];
    uint64_t *v35 = v32;
    v35[1] = v34;
    swift_bridgeObjectRelease();
  }
  id v36 = v6;
  id v37 = sub_2512C4298();
  os_log_type_t v38 = sub_2512C49A8();
  if (os_log_type_enabled(v37, v38))
  {
    id v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    v51[0] = v40;
    *(_DWORD *)id v39 = 136315138;
    id v41 = objc_msgSend(v36, sel_bluetoothUUID);
    uint64_t v42 = v3;
    uint64_t v43 = sub_2512C47F8();
    unint64_t v45 = v44;

    uint64_t v46 = v43;
    uint64_t v3 = v42;
    sub_2512955F8(v46, v45, v51);
    sub_2512C4A68();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_251285000, v37, v38, "Media Assist: Update Device Indentifier: %s calling setupHearingModeClient()", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339B730](v40, -1, -1);
    MEMORY[0x25339B730](v39, -1, -1);
  }
  else
  {
  }
  swift_beginAccess();
  uint64_t v47 = (void *)MEMORY[0x25339B7D0](v3);
  if (v47)
  {
    id v48 = v47;
    (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v47) + 0xD0))();
  }
}

uint64_t sub_2512BB2B8(void *a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x100))();
}

uint64_t method lookup function for HMMediaAssistEnrollmentViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HMMediaAssistEnrollmentViewController);
}

uint64_t dispatch thunk of HMMediaAssistEnrollmentViewController.__allocating_init(deviceAddress:audiogramSample:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t sub_2512BB360()
{
  uint64_t v0 = sub_2512C42B8();
  __swift_allocate_value_buffer(v0, qword_269B31488);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B31488);
  return sub_2512C42A8();
}

uint64_t sub_2512BB3DC()
{
  if (qword_269B30E00 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2512C42B8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B31488);
}

uint64_t sub_2512BB440@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B30E00 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2512C42B8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B31488);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_2512BB4E8()
{
  swift_beginAccess();
  return MEMORY[0x25339B7D0](v0 + 16);
}

uint64_t sub_2512BB530(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_2512BB594(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x25339B7D0](v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  v3[3] = v4;
  v3[4] = v5;
  return sub_2512BB614;
}

void sub_2512BB614(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + 24) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_2512BB698()
{
  return sub_2512C4368();
}

uint64_t sub_2512BB6E0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2512C4398();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2512BB754@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 160))();
  *a2 = result;
  return result;
}

uint64_t sub_2512BB7A0()
{
  return sub_2512C43A8();
}

uint64_t sub_2512BB81C()
{
  return sub_2512C43A8();
}

uint64_t sub_2512BB88C()
{
  return sub_2512BBAC8((uint64_t)&OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider__samples, &qword_269B2E1C8);
}

uint64_t sub_2512BB8A0(uint64_t a1)
{
  return sub_2512BBB4C(a1, &qword_269B2E1D0, (uint64_t)&OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider__samples, &qword_269B2E1C8);
}

uint64_t sub_2512BB8BC()
{
  return sub_2512C4368();
}

uint64_t sub_2512BB8F0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2512C4398();
  swift_release();
  return swift_release();
}

void *sub_2512BB968@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(**(void **)a1 + 208))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_2512BB9C4()
{
  return sub_2512C43A8();
}

uint64_t sub_2512BBA38()
{
  return sub_2512C43A8();
}

void sub_2512BBAA8(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2512BBAB4()
{
  return sub_2512BBAC8((uint64_t)&OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider__noiseViewMode, &qword_269B2E1D8);
}

uint64_t sub_2512BBAC8(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_2512BBB30(uint64_t a1)
{
  return sub_2512BBB4C(a1, &qword_269B2DE40, (uint64_t)&OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider__noiseViewMode, &qword_269B2E1D8);
}

uint64_t sub_2512BBB4C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_2512C4388();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t sub_2512BBC7C@<X0>(uint64_t a1@<X8>)
{
  return sub_2512A61E4(v1 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_noiseStatusProvider, a1);
}

double sub_2512BBC90@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 40) = -1;
  return result;
}

uint64_t NoiseDataProvider.id.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2512BBCE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  sub_2512BBD3C(a1, a2, a3);
  return v6;
}

uint64_t sub_2512BBD3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v34 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E1D8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E1C8);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v4 + 24) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v15 = v4 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider__samples;
  uint64_t v36 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E1C0);
  sub_2512C4368();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v15, v14, v11);
  uint64_t v16 = v4 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider__noiseViewMode;
  LOBYTE(v36) = 2;
  sub_2512C4368();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v16, v10, v7);
  uint64_t v17 = v4 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_currentStatus;
  *(_OWORD *)uint64_t v17 = 0u;
  *(_OWORD *)(v17 + 16) = 0u;
  *(void *)(v17 + 32) = 0;
  *(unsigned char *)(v17 + 40) = -1;
  uint64_t v18 = OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_noiseModel;
  type metadata accessor for HTUINoiseView.Model();
  LOBYTE(v36) = 1;
  uint64_t v19 = sub_2512C48B8();
  *(void *)(v19 + 16) = 16;
  *(_OWORD *)(v19 + 32) = 0u;
  *(_OWORD *)(v19 + 48) = 0u;
  *(_OWORD *)(v19 + 64) = 0u;
  *(_OWORD *)(v19 + 80) = 0u;
  *(_OWORD *)(v19 + 96) = 0u;
  *(_OWORD *)(v19 + 112) = 0u;
  *(_OWORD *)(v19 + 128) = 0u;
  *(_OWORD *)(v19 + 144) = 0u;
  *(void *)(v4 + v18) = HTUINoiseView.Model.__allocating_init(mode:samples:)(&v36, v19);
  uint64_t v20 = a1;
  sub_2512A61E4(a1, v4 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_noiseStatusProvider);
  uint64_t v21 = (void *)(v4 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id);
  uint64_t v22 = v34;
  void *v21 = a2;
  v21[1] = v22;
  if (qword_269B30E00 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_2512C42B8();
  __swift_project_value_buffer(v23, (uint64_t)qword_269B31488);
  swift_retain_n();
  uint64_t v24 = sub_2512C4298();
  os_log_type_t v25 = sub_2512C49A8();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v36 = v27;
    *(_DWORD *)uint64_t v26 = 136315394;
    uint64_t v28 = sub_2512C4738();
    uint64_t v35 = sub_2512955F8(v28, v29, &v36);
    sub_2512C4A68();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    uint64_t v30 = *(void *)(v4 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id);
    unint64_t v31 = *(void *)(v4 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id + 8);
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_2512955F8(v30, v31, &v36);
    sub_2512C4A68();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_251285000, v24, v25, "NoisDataProvider Creation :: %s : %s", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25339B730](v27, -1, -1);
    MEMORY[0x25339B730](v26, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  __swift_destroy_boxed_opaque_existential_0(v20);
  return v4;
}

uint64_t sub_2512BC198()
{
  type metadata accessor for HTUINoiseView.Model();
  char v2 = 1;
  uint64_t v0 = sub_2512C48B8();
  *(void *)(v0 + 16) = 16;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  *(_OWORD *)(v0 + 144) = 0u;
  return HTUINoiseView.Model.__allocating_init(mode:samples:)(&v2, v0);
}

uint64_t sub_2512BC208()
{
  uint64_t v1 = v0;
  char v2 = (void *)(v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_noiseStatusProvider);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_noiseStatusProvider + 24);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_noiseStatusProvider + 32);
  __swift_project_boxed_opaque_existential_0((void *)(v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_noiseStatusProvider), v3);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v4 + 8))(v20, v3, v4);
  sub_2512BC854((uint64_t)v20);
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  __swift_project_boxed_opaque_existential_0(v2, v5);
  uint64_t v7 = sub_2512BDA5C(&qword_269B2E1E0);
  sub_2512AD724();
  uint64_t v8 = (void *)sub_2512C4A08();
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t))(v6 + 16))(v0, v7, v8, v5, v6);

  if (qword_269B30E00 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_2512C42B8();
  __swift_project_value_buffer(v9, (uint64_t)qword_269B31488);
  swift_retain_n();
  uint64_t v10 = sub_2512C4298();
  os_log_type_t v11 = sub_2512C49A8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v19 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v14 = sub_2512C4738();
    sub_2512955F8(v14, v15, &v19);
    sub_2512C4A68();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id);
    unint64_t v17 = *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id + 8);
    swift_bridgeObjectRetain();
    sub_2512955F8(v16, v17, &v19);
    sub_2512C4A68();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_251285000, v10, v11, "start: observer added :: %s : %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25339B730](v13, -1, -1);
    MEMORY[0x25339B730](v12, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  return sub_2512BD8E4((uint64_t)v20);
}

void sub_2512BC4E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_noiseStatusProvider + 24);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_noiseStatusProvider + 32);
  __swift_project_boxed_opaque_existential_0((void *)(v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_noiseStatusProvider), v2);
  uint64_t v4 = sub_2512BDA5C(&qword_269B2E1E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 24))(v0, v4, v2, v3);
  if (qword_269B30E00 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2512C42B8();
  __swift_project_value_buffer(v5, (uint64_t)qword_269B31488);
  swift_retain_n();
  uint64_t v6 = sub_2512C4298();
  os_log_type_t v7 = sub_2512C49A8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v14 = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v10 = sub_2512C4738();
    sub_2512955F8(v10, v11, &v14);
    sub_2512C4A68();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id);
    unint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id + 8);
    swift_bridgeObjectRetain();
    sub_2512955F8(v12, v13, &v14);
    sub_2512C4A68();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_251285000, v6, v7, "stopped: observer removed :: %s : %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25339B730](v9, -1, -1);
    MEMORY[0x25339B730](v8, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

void *sub_2512BC74C()
{
  return &unk_2512C81F0;
}

uint64_t sub_2512BC758()
{
  return swift_retain();
}

uint64_t sub_2512BC7A4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_noiseModel);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_release();
}

uint64_t (*sub_2512BC7F8())()
{
  return j__swift_endAccess;
}

void sub_2512BC854(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_2512B739C(a1, (uint64_t)v59);
  char v4 = v60;
  if (v60)
  {
    if (v60 == 1)
    {
      sub_2512A61CC(v59, (uint64_t)v56);
      uint64_t v5 = v57;
      uint64_t v6 = v58;
      __swift_project_boxed_opaque_existential_0(v56, v57);
      uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
      int64_t v8 = *(void *)(v7 + 16);
      if (v8)
      {
        uint64_t v53 = MEMORY[0x263F8EE78];
        sub_2512AFCE8(0, v8, 0);
        uint64_t v9 = 0;
        uint64_t v10 = v53;
        unint64_t v11 = *(void *)(v53 + 16);
        do
        {
          float v12 = *(float *)(v7 + 4 * v9 + 32);
          unint64_t v13 = *(void *)(v53 + 24);
          if (v11 >= v13 >> 1) {
            sub_2512AFCE8((char *)(v13 > 1), v11 + 1, 1);
          }
          ++v9;
          *(void *)(v53 + 16) = v11 + 1;
          *(double *)(v53 + 8 * v11++ + 32) = v12;
        }
        while (v8 != v9);
LABEL_20:
        swift_bridgeObjectRelease();
        goto LABEL_25;
      }
    }
    else
    {
      sub_2512A61CC(v59, (uint64_t)v56);
      uint64_t v22 = v57;
      uint64_t v23 = v58;
      __swift_project_boxed_opaque_existential_0(v56, v57);
      uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v22, v23);
      int64_t v25 = *(void *)(v24 + 16);
      if (v25)
      {
        uint64_t v55 = MEMORY[0x263F8EE78];
        sub_2512AFCE8(0, v25, 0);
        uint64_t v26 = 0;
        uint64_t v10 = v55;
        unint64_t v27 = *(void *)(v55 + 16);
        do
        {
          float v28 = *(float *)(v24 + 4 * v26 + 32);
          unint64_t v29 = *(void *)(v55 + 24);
          if (v27 >= v29 >> 1) {
            sub_2512AFCE8((char *)(v29 > 1), v27 + 1, 1);
          }
          ++v26;
          *(void *)(v55 + 16) = v27 + 1;
          *(double *)(v55 + 8 * v27++ + 32) = v28;
        }
        while (v25 != v26);
        goto LABEL_20;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  else
  {
    sub_2512A61CC(v59, (uint64_t)v56);
    uint64_t v14 = v57;
    uint64_t v15 = v58;
    __swift_project_boxed_opaque_existential_0(v56, v57);
    uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
    int64_t v17 = *(void *)(v16 + 16);
    if (v17)
    {
      uint64_t v54 = MEMORY[0x263F8EE78];
      sub_2512AFCE8(0, v17, 0);
      uint64_t v18 = 0;
      uint64_t v10 = v54;
      unint64_t v19 = *(void *)(v54 + 16);
      do
      {
        float v20 = *(float *)(v16 + 4 * v18 + 32);
        unint64_t v21 = *(void *)(v54 + 24);
        if (v19 >= v21 >> 1) {
          sub_2512AFCE8((char *)(v21 > 1), v19 + 1, 1);
        }
        ++v18;
        *(void *)(v54 + 16) = v19 + 1;
        *(double *)(v54 + 8 * v19++ + 32) = v20;
      }
      while (v17 != v18);
      uint64_t v30 = swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v30 = swift_bridgeObjectRelease();
      uint64_t v10 = MEMORY[0x263F8EE78];
    }
    if ((*(uint64_t (**)(uint64_t))(*(void *)v1 + 136))(v30))
    {
      uint64_t v32 = v31;
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 8))(1, ObjectType, v32);
      swift_unknownObjectRelease();
    }
  }
LABEL_25:
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v56);
  sub_2512B739C(a1, (uint64_t)v59);
  uint64_t v34 = v1 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_currentStatus;
  swift_beginAccess();
  sub_2512BDD54((uint64_t)v59, v34);
  uint64_t v35 = swift_endAccess();
  uint64_t v36 = *(uint64_t (**)(void))(*(void *)v2 + 304);
  uint64_t v37 = ((uint64_t (*)(uint64_t))v36)(v35);
  LOBYTE(v59[0]) = v4;
  (*(void (**)(long long *))(*(void *)v37 + 136))(v59);
  uint64_t v38 = swift_release();
  uint64_t v39 = ((uint64_t (*)(uint64_t))v36)(v38);
  (*(void (**)(uint64_t))(*(void *)v39 + 208))(v10);
  uint64_t v40 = swift_release();
  (*(void (**)(long long *__return_ptr, uint64_t))(*(void *)v2 + 208))(v59, v40);
  LOBYTE(v56[0]) = v4;
  sub_2512B6918();
  if ((sub_2512C4748() & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v59[0]) = v4;
    swift_retain();
    sub_2512C43A8();
  }
  if (qword_269B30E00 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_2512C42B8();
  __swift_project_value_buffer(v41, (uint64_t)qword_269B31488);
  sub_2512B739C(a1, (uint64_t)v59);
  swift_retain_n();
  uint64_t v42 = sub_2512C4298();
  os_log_type_t v43 = sub_2512C49A8();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    v56[0] = v45;
    *(_DWORD *)uint64_t v44 = 136315394;
    uint64_t v46 = v36();
    uint64_t v47 = (*(uint64_t (**)(uint64_t))(*(void *)v46 + 200))(v46);
    swift_release();
    uint64_t v48 = MEMORY[0x25339AAF0](v47, MEMORY[0x263F8D538]);
    unint64_t v50 = v49;
    swift_bridgeObjectRelease();
    sub_2512955F8(v48, v50, v56);
    sub_2512C4A68();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    uint64_t v51 = sub_2512B72F4();
    sub_2512955F8(v51, v52, v56);
    sub_2512C4A68();
    swift_bridgeObjectRelease();
    sub_2512BD8E4((uint64_t)v59);
    _os_log_impl(&dword_251285000, v42, v43, "processNoiseStatus: %s %s", (uint8_t *)v44, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25339B730](v45, -1, -1);
    MEMORY[0x25339B730](v44, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_2512BD8E4((uint64_t)v59);
  }
}

uint64_t sub_2512BCF80(uint64_t a1)
{
  uint64_t v2 = sub_2512C3FB8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269B30E00 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2512C42B8();
  __swift_project_value_buffer(v6, (uint64_t)qword_269B31488);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v7 = sub_2512C4298();
  os_log_type_t v8 = sub_2512C49A8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v18 = a1;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v19 = v17;
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v16 = v10 + 4;
    sub_2512B1EB0((uint64_t)v20);
    uint64_t v11 = sub_2512B72F4();
    unint64_t v13 = v12;
    sub_2512BD8E4((uint64_t)v20);
    v20[0] = sub_2512955F8(v11, v13, &v19);
    sub_2512C4A68();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    _os_log_impl(&dword_251285000, v7, v8, "noiseStatusChanged: %s", v10, 0xCu);
    uint64_t v14 = v17;
    swift_arrayDestroy();
    MEMORY[0x25339B730](v14, -1, -1);
    MEMORY[0x25339B730](v10, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  sub_2512B1EB0((uint64_t)v20);
  sub_2512BC854((uint64_t)v20);
  return sub_2512BD8E4((uint64_t)v20);
}

void sub_2512BD224()
{
  qword_269B314A0 = 0x4030000000000000;
}

uint64_t *sub_2512BD234()
{
  if (qword_269B30E08 != -1) {
    swift_once();
  }
  return &qword_269B314A0;
}

double sub_2512BD280()
{
  if (qword_269B30E08 != -1) {
    swift_once();
  }
  return *(double *)&qword_269B314A0;
}

uint64_t sub_2512BD2CC()
{
  return 16;
}

uint64_t NoiseDataProvider.deinit()
{
  sub_25129F308(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider__samples;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E1C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider__noiseViewMode;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E1D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_noiseStatusProvider);
  sub_2512BD938(v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_currentStatus);
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t NoiseDataProvider.__deallocating_deinit()
{
  sub_25129F308(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider__samples;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E1C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider__noiseViewMode;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E1D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_noiseStatusProvider);
  sub_2512BD938(v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_currentStatus);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_2512BD508()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t sub_2512BD52C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2512BD568()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t sub_2512BD594()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t sub_2512BD5C0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = (void *)(*v1 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id);
  uint64_t v3 = v2[1];
  *a1 = *v2;
  a1[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2512BD5DC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for NoiseDataProvider();
  uint64_t result = sub_2512C4358();
  *a1 = result;
  return result;
}

uint64_t static NoiseDataProvider.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id) == *(void *)(a2
                                                                                            + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id)
    && *(void *)(a1 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id + 8) == *(void *)(a2
                                                                                                + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id
                                                                                                + 8))
  {
    return 1;
  }
  else
  {
    return sub_2512C4BC8();
  }
}

uint64_t NoiseDataProvider.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2512C4828();
  return swift_bridgeObjectRelease();
}

uint64_t NoiseDataProvider.hashValue.getter()
{
  return sub_2512C4C48();
}

uint64_t sub_2512BD720()
{
  return sub_2512C4C48();
}

uint64_t sub_2512BD78C()
{
  swift_bridgeObjectRetain();
  sub_2512C4828();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2512BD7F4()
{
  return sub_2512C4C48();
}

uint64_t sub_2512BD85C(void *a1, void *a2)
{
  uint64_t v2 = (void *)(*a1 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id);
  if (*v2 == *(void *)(*a2 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id)
    && v2[1] == *(void *)(*a2 + OBJC_IVAR____TtC13HearingModeUI17NoiseDataProvider_id + 8))
  {
    return 1;
  }
  else
  {
    return sub_2512C4BC8();
  }
}

uint64_t type metadata accessor for NoiseDataProvider()
{
  uint64_t result = qword_269B31150;
  if (!qword_269B31150) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2512BD8E4(uint64_t a1)
{
  return a1;
}

uint64_t sub_2512BD938(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E1E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2512BD998(uint64_t a1)
{
  uint64_t result = sub_2512BDA5C(&qword_269B2E1F0);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2512BD9DC()
{
  return sub_2512BDA5C(&qword_269B2E1F8);
}

uint64_t sub_2512BDA10()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_2512BDA1C()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_2512BDA28()
{
  return sub_2512BDA5C(&qword_269B2E200);
}

uint64_t sub_2512BDA5C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for NoiseDataProvider();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of NoiseData.samples.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2512BDAB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of NoiseStatusProviding.waveFormNoiseStatus()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NoiseStatusProviding.addNoiseStatusObserver(_:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of NoiseStatusProviding.removeNoiseStatusObserver(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_2512BDB04(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_2512BDB18()
{
  return type metadata accessor for NoiseDataProvider();
}

void sub_2512BDB20()
{
  sub_2512BDC90();
  if (v0 <= 0x3F)
  {
    sub_2512BDCEC();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for NoiseDataProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NoiseDataProvider);
}

uint64_t dispatch thunk of NoiseDataProvider.inEarStatusChanged(status:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of NoiseDataProvider.environmentalNoiseStatusChanged(status:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

void sub_2512BDC90()
{
  if (!qword_269B2E208)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2E1C0);
    unint64_t v0 = sub_2512C43B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B2E208);
    }
  }
}

void sub_2512BDCEC()
{
  if (!qword_269B2E210)
  {
    unint64_t v0 = sub_2512C43B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B2E210);
    }
  }
}

ValueMetadata *type metadata accessor for NoiseDataProvider.Constants()
{
  return &type metadata for NoiseDataProvider.Constants;
}

uint64_t sub_2512BDD54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2E1E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

BOOL sub_2512BDDC0(uint64_t a1)
{
  return a1 == 1 || a1 == 4;
}

BOOL sub_2512BDDD0(uint64_t a1)
{
  return a1 == 2 || a1 == 4;
}

uint64_t sub_2512BDDE0(char a1, char a2)
{
  uint64_t v2 = 4;
  if ((a2 & 1) == 0) {
    uint64_t v2 = 1;
  }
  uint64_t v3 = 5;
  if (a2) {
    uint64_t v3 = 2;
  }
  if (a1) {
    return v2;
  }
  else {
    return v3;
  }
}

uint64_t sub_2512BDE04(uint64_t a1)
{
  uint64_t v2 = sub_2512C47B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a1)
  {
    case 1:
    case 2:
    case 4:
    case 5:
      type metadata accessor for HMFitNoiseCheckTopView();
      sub_2512C4758();
      uint64_t v6 = sub_2512B1764((uint64_t)v5);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return v6;
    default:
      v8[1] = a1;
      sub_2512C4BD8();
      __break(1u);
      JUMPOUT(0x2512BDFDCLL);
  }
}

unint64_t HMFitNoiseCheckTopView.FitNoiseCheckBudStatus.init(rawValue:)(unint64_t a1)
{
  return sub_2512C2994(a1);
}

unint64_t sub_2512BE010@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_2512C2994(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t type metadata accessor for HMFitNoiseCheckTopView()
{
  return self;
}

uint64_t static HMFitNoiseCheckTopView.budStatus(leftBudGood:rightBudGood:)(char a1, char a2)
{
  uint64_t v2 = 4;
  if ((a2 & 1) == 0) {
    uint64_t v2 = 1;
  }
  uint64_t v3 = 5;
  if (a2) {
    uint64_t v3 = 2;
  }
  if (a1) {
    return v2;
  }
  else {
    return v3;
  }
}

void sub_2512BE0B0(uint64_t a1)
{
}

void sub_2512BE0DC(uint64_t a1)
{
}

void sub_2512BE108(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4, void *a5)
{
  uint64_t v7 = (void *)sub_2512C47C8();
  id v8 = objc_msgSend(self, sel_systemImageNamed_, v7);

  if (v8)
  {
    id v9 = [self *a4];
    id v10 = objc_msgSend(v8, sel_imageWithTintColor_renderingMode_, v9, 1);

    *a5 = v10;
  }
  else
  {
    __break(1u);
  }
}

id sub_2512BE1C8()
{
  uint64_t v0 = sub_2512C47B8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v4, sel_setTextAlignment_, 1);
  objc_msgSend(v4, sel_setNumberOfLines_, 0);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v4, sel_setContentCompressionResistancePriority_forAxis_, 1, v5);
  LODWORD(v6) = 1148846080;
  objc_msgSend(v4, sel_setContentHuggingPriority_forAxis_, 1, v6);
  type metadata accessor for HMFitNoiseCheckTopView.FitNoiseCheckBudsView();
  sub_2512C4758();
  sub_2512B1764((uint64_t)v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v7 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setText_, v7);

  return v4;
}

id sub_2512BE398(double a1)
{
  uint64_t v2 = sub_2512C47B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v6, sel_setTextAlignment_, 1);
  objc_msgSend(v6, sel_setNumberOfLines_, 0);
  LODWORD(v7) = 1148846080;
  objc_msgSend(v6, sel_setContentCompressionResistancePriority_forAxis_, 1, v7);
  LODWORD(v8) = 1148846080;
  objc_msgSend(v6, sel_setContentHuggingPriority_forAxis_, 1, v8);
  type metadata accessor for HMFitNoiseCheckTopView.FitNoiseCheckBudsView();
  sub_2512C4758();
  sub_2512B1764((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setText_, v9);

  id v10 = objc_msgSend(v6, sel_widthAnchor);
  id v11 = objc_msgSend(v10, sel_constraintEqualToConstant_, 100.0);

  objc_msgSend(v11, sel_setActive_, 1);
  LODWORD(v12) = 1144750080;
  objc_msgSend(v6, sel_setContentHuggingPriority_forAxis_, 1, v12);
  objc_msgSend(v6, sel_setAlpha_, a1);
  return v6;
}

id sub_2512BE5F8()
{
  type metadata accessor for HMFitNoiseCheckTopView.FitNoiseCheckBudsView();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_2512C47C8();
  id v3 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v2, v1, 0);

  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v3);
  objc_msgSend(v4, sel_setContentMode_, 1);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v4, sel_setContentHuggingPriority_forAxis_, 1, v5);

  return v4;
}

id sub_2512BE714()
{
  type metadata accessor for HMFitNoiseCheckTopView.FitNoiseCheckBudsView();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_2512C47C8();
  id v3 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v2, v1, 0);

  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v3);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v4, sel_setContentMode_, 1);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v4, sel_setContentHuggingPriority_forAxis_, 1, v5);

  return v4;
}

id sub_2512BE830()
{
  if (qword_269B31170 != -1) {
    swift_once();
  }
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, qword_269B31178[0]);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v1 = objc_msgSend(v0, sel_heightAnchor);
  id v2 = objc_msgSend(v1, sel_constraintEqualToConstant_, 35.0);

  objc_msgSend(v2, sel_setActive_, 1);
  id v3 = objc_msgSend(v0, sel_widthAnchor);
  id v4 = objc_msgSend(v3, sel_constraintEqualToConstant_, 35.0);

  objc_msgSend(v4, sel_setActive_, 1);
  objc_msgSend(v0, sel_setAlpha_, 0.0);
  return v0;
}

id sub_2512BE990()
{
  type metadata accessor for HMFitNoiseCheckTopView.FitNoiseCheckBudsView();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v2 = objc_allocWithZone(MEMORY[0x263F29D30]);
  id v3 = (void *)sub_2512C47C8();
  id v4 = objc_msgSend(v2, sel_initWithPackageName_inBundle_, v3, v1);

  if (v4)
  {
    double v5 = (void *)sub_2512C47C8();
    objc_msgSend(v4, sel_setState_animated_, v5, 1);

    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v6 = objc_msgSend(v4, sel_heightAnchor);
    id v7 = objc_msgSend(v6, sel_constraintEqualToConstant_, 50.0);

    objc_msgSend(v7, sel_setActive_, 1);
    id v8 = objc_msgSend(v4, sel_widthAnchor);
    id v9 = objc_msgSend(v8, sel_constraintEqualToConstant_, 100.0);

    objc_msgSend(v9, sel_setActive_, 1);
    objc_msgSend(v4, sel_setAlpha_, 0.0);
    return v4;
  }
  else
  {
    id v11 = objc_allocWithZone(MEMORY[0x263F82E00]);
    return objc_msgSend(v11, sel_init);
  }
}

char *sub_2512BEB9C(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = sub_2512C47B8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  double v12 = (char *)&v126 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = (uint64_t *)&v4[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_budResultTextGoodFit];
  uint64_t v14 = (objc_class *)type metadata accessor for HMFitNoiseCheckTopView.FitNoiseCheckBudsView();
  uint64_t v15 = v4;
  sub_2512C4758();
  uint64_t v16 = sub_2512B1764((uint64_t)v12);
  uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v12, v9);
  *unint64_t v13 = v16;
  v13[1] = v18;
  float v20 = (uint64_t *)&v15[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_budResultTextBadFit];
  sub_2512C4758();
  uint64_t v21 = sub_2512B1764((uint64_t)v12);
  uint64_t v23 = v22;
  v19(v12, v9);
  *float v20 = v21;
  v20[1] = v23;
  uint64_t v24 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudLabel;
  *(void *)&v15[v24] = sub_2512BE1C8();
  uint64_t v25 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudLabel;
  *(void *)&v15[v25] = sub_2512BE1C8();
  uint64_t v26 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftResultLabel;
  *(void *)&v15[v26] = sub_2512BE398(0.0);
  uint64_t v27 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_spacerLabel;
  *(void *)&v15[v27] = sub_2512BE398(0.01);
  uint64_t v28 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightResultLabel;
  *(void *)&v15[v28] = sub_2512BE398(0.0);
  uint64_t v29 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudImageView;
  *(void *)&v15[v29] = sub_2512BE5F8();
  uint64_t v30 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudImageView;
  *(void *)&v15[v30] = sub_2512BE714();
  uint64_t v31 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftStatusMarkImage;
  *(void *)&v15[v31] = sub_2512BE830();
  uint64_t v32 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightStatusMarkImage;
  *(void *)&v15[v32] = sub_2512BE830();
  uint64_t v33 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_micaView;
  *(void *)&v15[v33] = sub_2512BE990();

  v136.receiver = v15;
  v136.super_class = v14;
  uint64_t v34 = (char *)objc_msgSendSuper2(&v136, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v35 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_micaView;
  uint64_t v36 = *(void *)&v34[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_micaView];
  uint64_t v37 = v34;
  objc_msgSend(v37, sel_addSubview_, v36);
  uint64_t v38 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudLabel;
  objc_msgSend(v37, sel_addSubview_, *(void *)&v37[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudLabel]);
  uint64_t v127 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudLabel;
  objc_msgSend(v37, sel_addSubview_, *(void *)&v37[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudLabel]);
  uint64_t v39 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudImageView;
  objc_msgSend(v37, sel_addSubview_, *(void *)&v37[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudImageView]);
  uint64_t v128 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudImageView;
  objc_msgSend(v37, sel_addSubview_, *(void *)&v37[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudImageView]);
  uint64_t v132 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftStatusMarkImage;
  objc_msgSend(v37, sel_addSubview_, *(void *)&v37[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftStatusMarkImage]);
  uint64_t v133 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightStatusMarkImage;
  objc_msgSend(v37, sel_addSubview_, *(void *)&v37[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightStatusMarkImage]);
  uint64_t v134 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftResultLabel;
  objc_msgSend(v37, sel_addSubview_, *(void *)&v37[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftResultLabel]);
  uint64_t v129 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightResultLabel;
  objc_msgSend(v37, sel_addSubview_, *(void *)&v37[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightResultLabel]);
  uint64_t v130 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_spacerLabel;
  objc_msgSend(v37, sel_addSubview_, *(void *)&v37[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_spacerLabel]);
  id v40 = objc_msgSend(v37, sel_layer);
  objc_msgSend(v40, sel_setMasksToBounds_, 0);

  id v131 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2D900);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_2512C8520;
  id v42 = objc_msgSend(*(id *)&v34[v35], sel_centerYAnchor);
  id v43 = objc_msgSend(*(id *)&v37[v39], sel_centerYAnchor);
  id v44 = objc_msgSend(v42, sel_constraintEqualToAnchor_, v43);

  *(void *)(v41 + 32) = v44;
  id v45 = objc_msgSend(*(id *)&v34[v35], sel_centerXAnchor);
  id v46 = objc_msgSend(v37, (SEL)&selRef_isEqualToString_);
  id v47 = objc_msgSend(v45, sel_constraintEqualToAnchor_constant_, v46, 0.0);

  *(void *)(v41 + 40) = v47;
  id v48 = objc_msgSend(*(id *)&v37[v38], sel_topAnchor);
  id v49 = objc_msgSend(v37, sel_topAnchor);
  id v50 = objc_msgSend(v48, byte_2653662EE, v49);

  *(void *)(v41 + 48) = v50;
  uint64_t v51 = v127;
  id v52 = objc_msgSend(*(id *)&v37[v127], sel_topAnchor);
  id v53 = objc_msgSend(v37, sel_topAnchor);
  id v54 = objc_msgSend(v52, byte_2653662EE, v53);

  *(void *)(v41 + 56) = v54;
  id v55 = objc_msgSend(*(id *)&v37[v38], sel_centerXAnchor);
  id v56 = objc_msgSend(*(id *)&v37[v39], sel_centerXAnchor);
  id v57 = objc_msgSend(v55, byte_2653662EE, v56);

  *(void *)(v41 + 64) = v57;
  id v58 = objc_msgSend(*(id *)&v37[v38], sel_bottomAnchor);
  id v59 = objc_msgSend(*(id *)&v37[v39], sel_topAnchor);
  id v60 = objc_msgSend(v58, sel_constraintEqualToAnchor_constant_, v59, -20.0);

  *(void *)(v41 + 72) = v60;
  id v61 = objc_msgSend(*(id *)&v37[v51], sel_centerXAnchor);
  uint64_t v62 = v128;
  id v63 = objc_msgSend(*(id *)&v37[v128], sel_centerXAnchor);
  id v64 = objc_msgSend(v61, sel_constraintEqualToAnchor_, v63);

  *(void *)(v41 + 80) = v64;
  id v65 = objc_msgSend(*(id *)&v37[v51], (SEL)&selRef_addAccessoryButton_ + 5);
  id v66 = objc_msgSend(*(id *)&v37[v62], sel_topAnchor);
  id v67 = objc_msgSend(v65, sel_constraintEqualToAnchor_constant_, v66, -20.0);

  *(void *)(v41 + 88) = v67;
  id v68 = objc_msgSend(*(id *)&v37[v39], sel_centerXAnchor);
  id v69 = objc_msgSend(v37, sel_centerXAnchor);
  id v70 = objc_msgSend(v68, sel_constraintEqualToAnchor_constant_, v69, -100.0);

  *(void *)(v41 + 96) = v70;
  id v71 = objc_msgSend(*(id *)&v37[v62], sel_centerXAnchor);
  id v72 = objc_msgSend(v37, sel_centerXAnchor);
  id v73 = objc_msgSend(v71, sel_constraintEqualToAnchor_constant_, v72, 100.0);

  *(void *)(v41 + 104) = v73;
  id v74 = objc_msgSend(*(id *)&v37[v39], sel_heightAnchor);
  id v75 = objc_msgSend(*(id *)&v37[v62], sel_heightAnchor);
  id v76 = objc_msgSend(v74, sel_constraintEqualToAnchor_, v75);

  *(void *)(v41 + 112) = v76;
  uint64_t v77 = v132;
  id v78 = objc_msgSend(*(id *)&v37[v132], sel_centerXAnchor);
  id v79 = *(void **)&v37[v39];
  uint64_t v126 = v39;
  id v80 = objc_msgSend(v79, (SEL)&selRef_isEqualToString_);
  id v81 = objc_msgSend(v78, sel_constraintEqualToAnchor_, v80);

  *(void *)(v41 + 120) = v81;
  id v82 = objc_msgSend(*(id *)&v37[v77], sel_topAnchor);
  id v83 = objc_msgSend(*(id *)&v37[v39], sel_bottomAnchor);
  id v84 = objc_msgSend(v82, sel_constraintEqualToAnchor_constant_, v83, 10.0);

  *(void *)(v41 + 128) = v84;
  uint64_t v85 = v133;
  id v86 = objc_msgSend(*(id *)&v37[v133], sel_centerXAnchor);
  id v87 = objc_msgSend(*(id *)&v37[v62], sel_centerXAnchor);
  id v88 = objc_msgSend(v86, byte_2653662EE, v87);

  *(void *)(v41 + 136) = v88;
  id v89 = objc_msgSend(*(id *)&v37[v85], sel_topAnchor);
  uint64_t v90 = v62;
  id v91 = objc_msgSend(*(id *)&v37[v62], sel_bottomAnchor);
  id v92 = objc_msgSend(v89, sel_constraintEqualToAnchor_constant_, v91, 10.0);

  *(void *)(v41 + 144) = v92;
  uint64_t v93 = v134;
  id v94 = objc_msgSend(*(id *)&v37[v134], sel_centerXAnchor);
  id v95 = objc_msgSend(*(id *)&v37[v126], sel_centerXAnchor);
  id v96 = objc_msgSend(v94, sel_constraintEqualToAnchor_, v95);

  *(void *)(v41 + 152) = v96;
  id v97 = objc_msgSend(*(id *)&v37[v93], sel_topAnchor);
  id v98 = objc_msgSend(*(id *)&v37[v132], sel_bottomAnchor);
  id v99 = objc_msgSend(v97, sel_constraintEqualToAnchor_constant_, v98, 10.0);

  *(void *)(v41 + 160) = v99;
  uint64_t v100 = v129;
  id v101 = objc_msgSend(*(id *)&v37[v129], sel_centerXAnchor);
  id v102 = objc_msgSend(*(id *)&v37[v62], sel_centerXAnchor);
  id v103 = objc_msgSend(v101, sel_constraintEqualToAnchor_, v102);

  *(void *)(v41 + 168) = v103;
  id v104 = objc_msgSend(*(id *)&v37[v100], sel_topAnchor);
  uint64_t v105 = v133;
  id v106 = objc_msgSend(*(id *)&v37[v133], sel_bottomAnchor);
  id v107 = objc_msgSend(v104, sel_constraintEqualToAnchor_constant_, v106, 10.0);

  *(void *)(v41 + 176) = v107;
  id v108 = objc_msgSend(*(id *)&v37[v100], sel_bottomAnchor);
  id v109 = objc_msgSend(v37, sel_bottomAnchor);
  id v110 = objc_msgSend(v108, sel_constraintLessThanOrEqualToAnchor_, v109);

  *(void *)(v41 + 184) = v110;
  id v111 = objc_msgSend(*(id *)&v37[v134], sel_bottomAnchor);
  id v112 = objc_msgSend(v37, sel_bottomAnchor);
  id v113 = objc_msgSend(v111, sel_constraintLessThanOrEqualToAnchor_, v112);

  *(void *)(v41 + 192) = v113;
  uint64_t v114 = v130;
  id v115 = objc_msgSend(*(id *)&v37[v130], sel_centerXAnchor);
  id v116 = objc_msgSend(*(id *)&v37[v90], sel_centerXAnchor);
  id v117 = objc_msgSend(v115, sel_constraintEqualToAnchor_, v116);

  *(void *)(v41 + 200) = v117;
  id v118 = objc_msgSend(*(id *)&v37[v114], sel_topAnchor);
  id v119 = objc_msgSend(*(id *)&v37[v105], sel_bottomAnchor);
  id v120 = objc_msgSend(v118, sel_constraintEqualToAnchor_constant_, v119, 10.0);

  *(void *)(v41 + 208) = v120;
  id v121 = objc_msgSend(*(id *)&v37[v114], sel_bottomAnchor);
  id v122 = objc_msgSend(v37, sel_bottomAnchor);
  id v123 = objc_msgSend(v121, sel_constraintEqualToAnchor_, v122);

  *(void *)(v41 + 216) = v123;
  uint64_t v135 = v41;
  sub_2512C4898();
  sub_25129A74C(0, &qword_269B2D858);
  v124 = (void *)sub_2512C4868();
  swift_bridgeObjectRelease();
  objc_msgSend(v131, sel_activateConstraints_, v124);

  return v37;
}

uint64_t sub_2512BF97C(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_2512BF9D0()
{
  id v1 = *(void **)(v0
                + OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudImageView);
  uint64_t v3 = *(void *)(MEMORY[0x263F000D0] + 8);
  uint64_t v4 = *(void *)(MEMORY[0x263F000D0] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x263F000D0] + 24);
  uint64_t v6 = *(void *)(MEMORY[0x263F000D0] + 32);
  uint64_t v7 = *(void *)(MEMORY[0x263F000D0] + 40);
  uint64_t v10 = *MEMORY[0x263F000D0];
  uint64_t v2 = v10;
  uint64_t v11 = v3;
  uint64_t v12 = v4;
  uint64_t v13 = v5;
  uint64_t v14 = v6;
  uint64_t v15 = v7;
  objc_msgSend(v1, sel_setTransform_, &v10);
  id v8 = *(void **)(v0
                + OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudImageView);
  uint64_t v10 = v2;
  uint64_t v11 = v3;
  uint64_t v12 = v4;
  uint64_t v13 = v5;
  uint64_t v14 = v6;
  uint64_t v15 = v7;
  objc_msgSend(v8, sel_setTransform_, &v10);
  objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudLabel), sel_setAlpha_, 1.0);
  objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudLabel), sel_setAlpha_, 1.0);
  objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftStatusMarkImage), sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightStatusMarkImage), sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftResultLabel), sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightResultLabel), sel_setAlpha_, 0.0);
  return objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_micaView), sel_setAlpha_, 0.0);
}

void sub_2512BFB18(uint64_t a1, char a2, char a3)
{
  uint64_t v5 = *(void **)&v3[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftStatusMarkImage];
  uint64_t v32 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftStatusMarkImage;
  if (a1 == 4 || a1 == 1)
  {
    uint64_t v6 = qword_269B31160;
    id v7 = v5;
    if (v6 != -1) {
      swift_once();
    }
    id v8 = &qword_269B31168;
  }
  else
  {
    uint64_t v9 = qword_269B31170;
    id v10 = v5;
    if (v9 != -1) {
      swift_once();
    }
    id v8 = qword_269B31178;
  }
  objc_msgSend(v5, sel_setImage_, *v8, v32);

  uint64_t v11 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightStatusMarkImage;
  uint64_t v12 = *(void **)&v3[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightStatusMarkImage];
  if (a1 == 4 || a1 == 2)
  {
    uint64_t v13 = qword_269B31160;
    id v14 = v12;
    if (v13 != -1) {
      swift_once();
    }
    uint64_t v15 = &qword_269B31168;
  }
  else
  {
    uint64_t v16 = qword_269B31170;
    id v17 = v12;
    if (v16 != -1) {
      swift_once();
    }
    uint64_t v15 = qword_269B31178;
  }
  objc_msgSend(v12, sel_setImage_, *v15);

  uint64_t v18 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftResultLabel;
  uint64_t v19 = *(void **)&v3[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftResultLabel];
  swift_bridgeObjectRetain();
  id v20 = v19;
  uint64_t v21 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v20, sel_setText_, v21);

  uint64_t v22 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightResultLabel;
  uint64_t v23 = *(void **)&v3[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightResultLabel];
  swift_bridgeObjectRetain();
  id v24 = v23;
  uint64_t v25 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_setText_, v25);

  if (a3)
  {
    objc_msgSend(*(id *)&v3[v33], sel_setAlpha_, 0.0);
    objc_msgSend(*(id *)&v3[v11], sel_setAlpha_, 0.0);
    objc_msgSend(*(id *)&v3[v18], sel_setAlpha_, 0.0);
    objc_msgSend(*(id *)&v3[v22], sel_setAlpha_, 0.0);
  }
  if (a2) {
    double v26 = 0.7;
  }
  else {
    double v26 = 0.0;
  }
  uint64_t v27 = self;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v3;
  *(unsigned char *)(v28 + 24) = a3 & 1;
  id v40 = sub_2512C3250;
  uint64_t v41 = v28;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v37 = 1107296256;
  uint64_t v38 = sub_251298D30;
  uint64_t v39 = &block_descriptor_83;
  uint64_t v29 = _Block_copy(&aBlock);
  uint64_t v30 = v3;
  swift_release();
  id v40 = (id (*)())CGPointMake;
  uint64_t v41 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v37 = 1107296256;
  uint64_t v38 = sub_2512BF97C;
  uint64_t v39 = &block_descriptor_86;
  uint64_t v31 = _Block_copy(&aBlock);
  objc_msgSend(v27, sel_animateWithDuration_animations_completion_, v29, v31, v26);
  _Block_release(v31);
  _Block_release(v29);
}

id sub_2512BFF38()
{
  return sub_2512C28E0(type metadata accessor for HMFitNoiseCheckTopView.FitNoiseCheckBudsView);
}

id sub_2512C0044()
{
  id v0 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v0, sel_bounds);
  double v2 = v1;

  id v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HMFitNoiseCheckTopView.FitNoiseCheckBudsView()), sel_initWithFrame_, 0.0, 0.0, v2, 300.0);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v3;
}

id sub_2512C00E4()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topFitNudgingView;
  double v2 = *(void **)(v0 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topFitNudgingView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topFitNudgingView);
  }
  else
  {
    swift_getObjectType();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v6 = (void *)sub_2512C47C8();
    id v7 = objc_msgSend(self, sel_imageNamed_inBundle_withConfiguration_, v6, v5, 0);

    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v7);
    objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    uint64_t v9 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v8;
    id v3 = v8;

    double v2 = 0;
  }
  id v10 = v2;
  return v3;
}

uint64_t sub_2512C0218(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topFitNudgingView) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_2512C022C(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_2512C00E4();
  return sub_2512C0274;
}

void sub_2512C0274(uint64_t *a1, uint64_t a2)
{
}

id sub_2512C0280()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topNoiseNudgingView;
  double v2 = *(void **)(v0 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topNoiseNudgingView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topNoiseNudgingView);
  }
  else
  {
    uint64_t v4 = v0;
    uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(v0 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_provider)
                              + 304))();
    HTUINoiseView.init(model:)(v5, &v13);
    id v6 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269B2E2A8));
    id v7 = (void *)sub_2512C4538();
    id v8 = objc_msgSend(v7, sel_view);

    if (!v8) {
      id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
    }
    id v9 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v8, sel_setBackgroundColor_, v9);

    objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v10 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v8;
    id v3 = v8;

    double v2 = 0;
  }
  id v11 = v2;
  return v3;
}

uint64_t sub_2512C03D4(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topNoiseNudgingView) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_2512C03E8(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_2512C0280();
  return sub_2512C0430;
}

void sub_2512C0430(uint64_t *a1, uint64_t a2)
{
}

uint64_t sub_2512C043C()
{
  return swift_retain();
}

uint64_t sub_2512C044C()
{
  return swift_retain();
}

void *HMFitNoiseCheckTopView.__allocating_init(service:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return HMFitNoiseCheckTopView.init(service:)(a1);
}

void *HMFitNoiseCheckTopView.init(service:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_topFitCheckView;
  uint64_t v4 = self;
  uint64_t v5 = v1;
  id v6 = objc_msgSend(v4, sel_mainScreen);
  objc_msgSend(v6, sel_bounds);
  double v8 = v7;

  id v9 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HMFitNoiseCheckTopView.FitNoiseCheckBudsView()), sel_initWithFrame_, 0.0, 0.0, v8, 300.0);
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v1[v3] = v9;
  *(void *)&v5[OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topFitNudgingView] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topNoiseNudgingView] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_manager] = *(void *)((char *)a1
                                                                                              + OBJC_IVAR____TtC13HearingModeUI19HMNoiseCheckService_manager);
  id v10 = (void *)MEMORY[0x263F8EED0];
  id v11 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *a1) + 0xA8);
  uint64_t v12 = swift_retain();
  uint64_t v13 = v11(v12);
  *(void *)&v5[OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_provider] = v13;
  id v14 = *(void (**)(uint64_t))(*(void *)v13 + 288);
  uint64_t v15 = swift_retain();
  v14(v15);
  swift_release();

  v20.receiver = v5;
  v20.super_class = (Class)type metadata accessor for HMFitNoiseCheckTopView();
  uint64_t v16 = objc_msgSendSuper2(&v20, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v17 = objc_msgSend(v16, sel_layer);
  objc_msgSend(v17, sel_setMasksToBounds_, 0);

  uint64_t v18 = (*(uint64_t (**)(void))((*v10 & *v16) + 0xB0))();
  (*(void (**)(uint64_t))((*v10 & *v16) + 0xC0))(v18);

  return v16;
}

void sub_2512C0754()
{
  id v1 = objc_msgSend(v0, sel_addSubview_, *(void *)((char *)v0 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_topFitCheckView));
  double v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = (void *)(*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v0) + 0x78))(v1);
  objc_msgSend(v0, sel_addSubview_, v3);

  id v4 = (id)(*(uint64_t (**)(void))((*v2 & *v0) + 0x90))();
  objc_msgSend(v0, sel_addSubview_, v4);
}

void sub_2512C083C()
{
  id v1 = objc_msgSend(v0, sel_layer);
  id v2 = objc_msgSend(self, sel_grayColor);
  id v3 = objc_msgSend(v2, sel_CGColor);

  objc_msgSend(v1, sel_setBorderColor_, v3);
  id v4 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v4, sel_setBorderWidth_, 1.0);
}

void sub_2512C0924()
{
  id v1 = objc_msgSend(*(id *)((char *)v0 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_topFitCheckView), sel_pinToOther_, v0);
  id v2 = (void *)MEMORY[0x263F8EED0];
  id v3 = (void *)(*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v0) + 0x78))(v1);
  objc_msgSend(v3, sel_pinToOther_, v0);

  id v4 = *(uint64_t (**)(void))((*v2 & *v0) + 0x90);
  uint64_t v5 = (void *)v4();
  objc_msgSend(v5, sel_hk_alignCenterConstraintsWithView_, v0);

  id v6 = (void *)v4();
  id v7 = objc_msgSend(v6, sel_leadingAnchor);

  id v8 = objc_msgSend(v0, sel_leadingAnchor);
  id v9 = objc_msgSend(v7, sel_constraintEqualToAnchor_constant_, v8, 16.0);

  objc_msgSend(v9, sel_setActive_, 1);
  id v10 = (void *)v4();
  id v11 = objc_msgSend(v10, sel_trailingAnchor);

  id v12 = objc_msgSend(v0, sel_trailingAnchor);
  id v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_constant_, v12, -16.0);

  objc_msgSend(v13, sel_setActive_, 1);
}

void sub_2512C0B20()
{
  id v1 = v0;
  id v2 = *(void **)((char *)v0 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_topFitCheckView);
  sub_2512BFB18(4, 1, 1);
  sub_2512C4008();
  id v3 = objc_msgSend(v2, sel_setHidden_, 0);
  id v4 = (void *)MEMORY[0x263F8EED0];
  uint64_t v5 = (void *)(*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v0) + 0x78))(v3);
  objc_msgSend(v5, sel_setHidden_, 1);

  id v6 = (id)(*(uint64_t (**)(void))((*v4 & *v1) + 0x90))();
  objc_msgSend(v6, sel_setHidden_, 1);
}

void sub_2512C0C7C()
{
  id v1 = v0;
  id v2 = *(void **)((char *)v0 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_topFitCheckView);
  sub_2512BF9D0();
  sub_2512C4008();
  objc_msgSend(v2, sel_setHidden_, 0);
  id v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  uint64_t v15 = sub_2512C2DA8;
  uint64_t v16 = v4;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 1107296256;
  id v13 = sub_251298D30;
  id v14 = &block_descriptor_5;
  uint64_t v5 = _Block_copy(&v11);
  id v6 = v2;
  swift_release();
  uint64_t v15 = (id (*)())CGPointMake;
  uint64_t v16 = 0;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 1107296256;
  id v13 = sub_2512BF97C;
  id v14 = &block_descriptor_4;
  id v7 = _Block_copy(&v11);
  objc_msgSend(v3, sel_animateWithDuration_animations_completion_, v5, v7, 0.7);
  _Block_release(v7);
  _Block_release(v5);
  id v8 = (void *)MEMORY[0x263F8EED0];
  id v9 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x78))();
  objc_msgSend(v9, sel_setHidden_, 1);

  id v10 = (void *)(*(uint64_t (**)(void))((*v8 & *v1) + 0x90))();
  objc_msgSend(v10, sel_setHidden_, 1);
}

uint64_t sub_2512C0EF8(uint64_t a1, void (*a2)(uint64_t))
{
  sub_2512C4008();
  sub_2512BFB18(a1, 1, 0);
  uint64_t v4 = sub_2512BDE04(a1);
  a2(v4);
  return swift_bridgeObjectRelease();
}

void sub_2512C1054()
{
  id v1 = (void *)MEMORY[0x263F8EED0];
  id v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78);
  id v3 = (void *)v2();
  objc_msgSend(v3, sel_setHidden_, 0);

  uint64_t v4 = (void *)v2();
  id v5 = objc_msgSend(self, sel_systemOrangeColor);
  objc_msgSend(v4, sel_setBackgroundColor_, v5);

  id v6 = (id)(*(uint64_t (**)(id))((*v1 & *v0) + 0x90))(objc_msgSend(*(id *)((char *)v0 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_topFitCheckView), sel_setHidden_, 1));
  objc_msgSend(v6, sel_setHidden_, 1);
}

id sub_2512C11D4()
{
  id v1 = v0;
  id v2 = *(void **)((char *)v0 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_topFitCheckView);
  sub_2512BFB18(4, 0, 0);
  uint64_t v3 = sub_2512C4018();
  uint64_t v4 = (void *)MEMORY[0x263F8EED0];
  id v5 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x90))(v3);
  objc_msgSend(v5, sel_setHidden_, 0);

  id v6 = (void *)(*(uint64_t (**)(void))((*v4 & *v1) + 0x78))();
  objc_msgSend(v6, sel_setHidden_, 1);

  return objc_msgSend(v2, sel_setHidden_, 1);
}

id sub_2512C132C()
{
  id v1 = v0;
  uint64_t v2 = sub_2512C4008();
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  uint64_t v4 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x90))(v2);
  objc_msgSend(v4, sel_setHidden_, 0);

  id v5 = (void *)(*(uint64_t (**)(void))((*v3 & *v1) + 0x78))();
  objc_msgSend(v5, sel_setHidden_, 1);

  id v6 = *(void **)((char *)v1 + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_topFitCheckView);
  return objc_msgSend(v6, sel_setHidden_, 1);
}

uint64_t sub_2512C1530()
{
  uint64_t v1 = sub_2512C46C8();
  uint64_t v24 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2512C46E8();
  uint64_t v22 = *(void *)(v4 - 8);
  uint64_t v23 = v4;
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2512C4708();
  uint64_t v21 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  id v14 = (char *)&v21 - v13;
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))(v12);
  sub_25129A74C(0, (unint64_t *)&qword_269B2D910);
  uint64_t v15 = (void *)sub_2512C4A08();
  sub_2512C46F8();
  MEMORY[0x25339A980](v11, 3.0);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v11, v7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v0;
  aBlock[4] = sub_2512C2F2C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_251298D30;
  aBlock[3] = &block_descriptor_10_0;
  uint64_t v18 = _Block_copy(aBlock);
  uint64_t v19 = v0;
  swift_release();
  sub_2512C46D8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2512AB518();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE00);
  sub_2512AB570();
  sub_2512C4AC8();
  MEMORY[0x25339AC60](v14, v6, v3, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v23);
  return ((uint64_t (*)(char *, uint64_t))v16)(v14, v21);
}

uint64_t sub_2512C18D4(void *a1)
{
  uint64_t v23 = sub_2512C46C8();
  uint64_t v26 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2512C46E8();
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2512C4708();
  uint64_t v22 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v21 - v12;
  (*(void (**)(uint64_t, uint64_t (*)(double, double), void))((*MEMORY[0x263F8EED0] & *a1) + 0xD8))(1, CGPointMake, 0);
  sub_25129A74C(0, (unint64_t *)&qword_269B2D910);
  id v14 = (void *)sub_2512C4A08();
  sub_2512C46F8();
  MEMORY[0x25339A980](v11, 3.0);
  uint64_t v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  aBlock[4] = sub_2512C3134;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_251298D30;
  aBlock[3] = &block_descriptor_53_0;
  uint64_t v17 = _Block_copy(aBlock);
  uint64_t v18 = a1;
  swift_release();
  sub_2512C46D8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2512AB518();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE00);
  sub_2512AB570();
  uint64_t v19 = v23;
  sub_2512C4AC8();
  MEMORY[0x25339AC60](v13, v6, v3, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v3, v19);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v25);
  return ((uint64_t (*)(char *, uint64_t))v15)(v13, v22);
}

uint64_t sub_2512C1C98(void *a1)
{
  uint64_t v23 = sub_2512C46C8();
  uint64_t v26 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2512C46E8();
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2512C4708();
  uint64_t v22 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v21 - v12;
  (*(void (**)(uint64_t, uint64_t (*)(double, double), void))((*MEMORY[0x263F8EED0] & *a1) + 0xD8))(2, j__CGPointMake, 0);
  sub_25129A74C(0, (unint64_t *)&qword_269B2D910);
  id v14 = (void *)sub_2512C4A08();
  sub_2512C46F8();
  MEMORY[0x25339A980](v11, 3.0);
  uint64_t v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  aBlock[4] = sub_2512C317C;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_251298D30;
  aBlock[3] = &block_descriptor_65_0;
  uint64_t v17 = _Block_copy(aBlock);
  uint64_t v18 = a1;
  swift_release();
  sub_2512C46D8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2512AB518();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE00);
  sub_2512AB570();
  uint64_t v19 = v23;
  sub_2512C4AC8();
  MEMORY[0x25339AC60](v13, v6, v3, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v3, v19);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v25);
  return ((uint64_t (*)(char *, uint64_t))v15)(v13, v22);
}

uint64_t sub_2512C205C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v27 = a2;
  uint64_t v5 = sub_2512C46C8();
  uint64_t v32 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2512C46E8();
  uint64_t v30 = *(void *)(v8 - 8);
  uint64_t v31 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2512C4708();
  uint64_t v26 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v25 - v17;
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *a1) + 0xD0))(v16);
  sub_25129A74C(0, (unint64_t *)&qword_269B2D910);
  uint64_t v19 = (void *)sub_2512C4A08();
  sub_2512C46F8();
  MEMORY[0x25339A980](v15, 3.0);
  objc_super v20 = *(void (**)(char *, uint64_t))(v12 + 8);
  v20(v15, v11);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a1;
  aBlock[4] = v28;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_251298D30;
  aBlock[3] = v29;
  uint64_t v22 = _Block_copy(aBlock);
  uint64_t v23 = a1;
  swift_release();
  sub_2512C46D8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2512AB518();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE00);
  sub_2512AB570();
  sub_2512C4AC8();
  MEMORY[0x25339AC60](v18, v10, v7, v22);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v31);
  return ((uint64_t (*)(char *, uint64_t))v20)(v18, v26);
}

uint64_t sub_2512C23F8(void *a1)
{
  uint64_t v23 = sub_2512C46C8();
  uint64_t v26 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2512C46E8();
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2512C4708();
  uint64_t v22 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v21 - v12;
  (*(void (**)(uint64_t, uint64_t (*)(double, double), void))((*MEMORY[0x263F8EED0] & *a1) + 0xD8))(4, j__CGPointMake, 0);
  sub_25129A74C(0, (unint64_t *)&qword_269B2D910);
  uint64_t v14 = (void *)sub_2512C4A08();
  sub_2512C46F8();
  MEMORY[0x25339A980](v11, 3.0);
  uint64_t v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  aBlock[4] = sub_2512C31C4;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_251298D30;
  aBlock[3] = &block_descriptor_77;
  uint64_t v17 = _Block_copy(aBlock);
  uint64_t v18 = a1;
  swift_release();
  sub_2512C46D8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2512AB518();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE00);
  sub_2512AB570();
  uint64_t v19 = v23;
  sub_2512C4AC8();
  MEMORY[0x25339AC60](v13, v6, v3, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v3, v19);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v25);
  return ((uint64_t (*)(char *, uint64_t))v15)(v13, v22);
}

id HMFitNoiseCheckTopView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void HMFitNoiseCheckTopView.init(frame:)()
{
}

id HMFitNoiseCheckTopView.__deallocating_deinit()
{
  return sub_2512C28E0(type metadata accessor for HMFitNoiseCheckTopView);
}

id sub_2512C28E0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_2512C2994(unint64_t result)
{
  if (result > 5 || ((1 << result) & 0x36) == 0) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for HMFitNoiseCheckTopView.FitNoiseCheckBudsView()
{
  return self;
}

void sub_2512C29E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2512C47B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (uint64_t *)&v0[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_budResultTextGoodFit];
  type metadata accessor for HMFitNoiseCheckTopView.FitNoiseCheckBudsView();
  sub_2512C4758();
  uint64_t v7 = sub_2512B1764((uint64_t)v5);
  uint64_t v9 = v8;
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v5, v2);
  *uint64_t v6 = v7;
  v6[1] = v9;
  uint64_t v11 = (uint64_t *)&v0[OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_budResultTextBadFit];
  sub_2512C4758();
  uint64_t v12 = sub_2512B1764((uint64_t)v5);
  uint64_t v14 = v13;
  v10(v5, v2);
  uint64_t *v11 = v12;
  v11[1] = v14;
  uint64_t v15 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudLabel;
  *(void *)&v1[v15] = sub_2512BE1C8();
  uint64_t v16 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudLabel;
  *(void *)&v1[v16] = sub_2512BE1C8();
  uint64_t v17 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftResultLabel;
  *(void *)&v1[v17] = sub_2512BE398(0.0);
  uint64_t v18 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_spacerLabel;
  *(void *)&v1[v18] = sub_2512BE398(0.01);
  uint64_t v19 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightResultLabel;
  *(void *)&v1[v19] = sub_2512BE398(0.0);
  uint64_t v20 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudImageView;
  *(void *)&v1[v20] = sub_2512BE5F8();
  uint64_t v21 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudImageView;
  *(void *)&v1[v21] = sub_2512BE714();
  uint64_t v22 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftStatusMarkImage;
  *(void *)&v1[v22] = sub_2512BE830();
  uint64_t v23 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightStatusMarkImage;
  *(void *)&v1[v23] = sub_2512BE830();
  uint64_t v24 = OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_micaView;
  *(void *)&v1[v24] = sub_2512BE990();

  sub_2512C4B48();
  __break(1u);
}

void sub_2512C2C68()
{
  uint64_t v1 = OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_topFitCheckView;
  id v2 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v2, sel_bounds);
  double v4 = v3;

  id v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HMFitNoiseCheckTopView.FitNoiseCheckBudsView()), sel_initWithFrame_, 0.0, 0.0, v4, 300.0);
  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v0[v1] = v5;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topFitNudgingView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topNoiseNudgingView] = 0;

  sub_2512C4B48();
  __break(1u);
}

uint64_t sub_2512C2D70()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_2512C2DA8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = *(void **)(v1
                + OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudImageView);
  CGAffineTransformMakeScale(&v5, 0.7, 0.7);
  objc_msgSend(v2, sel_setTransform_, &v5);
  double v3 = *(void **)(v1
                + OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudImageView);
  CGAffineTransformMakeScale(&v5, 0.7, 0.7);
  objc_msgSend(v3, sel_setTransform_, &v5);
  objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftStatusMarkImage), sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightStatusMarkImage), sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudLabel), sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudLabel), sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftResultLabel), sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightResultLabel), sel_setAlpha_, 0.0);
  return objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_micaView), sel_setAlpha_, 1.0);
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

uint64_t sub_2512C2F2C()
{
  return sub_2512C18D4(*(void **)(v0 + 16));
}

unint64_t sub_2512C2F38()
{
  unint64_t result = qword_269B2E240;
  if (!qword_269B2E240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2E240);
  }
  return result;
}

uint64_t method lookup function for HMFitNoiseCheckTopView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HMFitNoiseCheckTopView);
}

uint64_t dispatch thunk of HMFitNoiseCheckTopView.__allocating_init(service:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of HMFitNoiseCheckTopView.transitionToCheckReady()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of HMFitNoiseCheckTopView.transitionToFitCheck()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of HMFitNoiseCheckTopView.transitionToFitCheckResult(budState:actionStringBlock:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of HMFitNoiseCheckTopView.transitionToFitNudging()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of HMFitNoiseCheckTopView.transitionToNoiseNudging()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of HMFitNoiseCheckTopView.transitionToNoiseNudgingPassed()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of HMFitNoiseCheckTopView.testRun()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

ValueMetadata *type metadata accessor for HMFitNoiseCheckTopView.FitNoiseCheckBudStatus()
{
  return &type metadata for HMFitNoiseCheckTopView.FitNoiseCheckBudStatus;
}

uint64_t sub_2512C3134()
{
  return sub_2512C205C(*(void **)(v0 + 16), (uint64_t)&unk_27021F030, (uint64_t)sub_2512C3174, (uint64_t)&block_descriptor_59_0);
}

uint64_t sub_2512C3174()
{
  return sub_2512C1C98(*(void **)(v0 + 16));
}

uint64_t sub_2512C317C()
{
  return sub_2512C205C(*(void **)(v0 + 16), (uint64_t)&unk_27021F0D0, (uint64_t)sub_2512C31BC, (uint64_t)&block_descriptor_71);
}

uint64_t sub_2512C31BC()
{
  return sub_2512C23F8(*(void **)(v0 + 16));
}

uint64_t sub_2512C31C4()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **(void **)(v0 + 16)) + 0xF8))();
}

uint64_t sub_2512C3218()
{
  return MEMORY[0x270FA0238](v0, 25, 7);
}

id sub_2512C3250()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 24);
  double v3 = *(void **)(v1
                + OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudImageView);
  uint64_t v5 = *(void *)(MEMORY[0x263F000D0] + 8);
  uint64_t v6 = *(void *)(MEMORY[0x263F000D0] + 16);
  uint64_t v7 = *(void *)(MEMORY[0x263F000D0] + 24);
  uint64_t v8 = *(void *)(MEMORY[0x263F000D0] + 32);
  uint64_t v9 = *(void *)(MEMORY[0x263F000D0] + 40);
  uint64_t v12 = *MEMORY[0x263F000D0];
  uint64_t v4 = v12;
  uint64_t v13 = v5;
  uint64_t v14 = v6;
  uint64_t v15 = v7;
  uint64_t v16 = v8;
  uint64_t v17 = v9;
  objc_msgSend(v3, sel_setTransform_, &v12);
  uint64_t v10 = *(void **)(v1
                 + OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudImageView);
  uint64_t v12 = v4;
  uint64_t v13 = v5;
  uint64_t v14 = v6;
  uint64_t v15 = v7;
  uint64_t v16 = v8;
  uint64_t v17 = v9;
  objc_msgSend(v10, sel_setTransform_, &v12);
  objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftBudLabel), sel_setAlpha_, 1.0);
  objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightBudLabel), sel_setAlpha_, 1.0);
  if ((v2 & 1) == 0)
  {
    objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftStatusMarkImage), sel_setAlpha_, 1.0);
    objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightStatusMarkImage), sel_setAlpha_, 1.0);
    objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_leftResultLabel), sel_setAlpha_, 1.0);
    objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_rightResultLabel), sel_setAlpha_, 1.0);
  }
  return objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtCC13HearingModeUI22HMFitNoiseCheckTopViewP33_6442BD22BF01B0421AF5366A801593E921FitNoiseCheckBudsView_micaView), sel_setAlpha_, 0.0);
}

id sub_2512C3410()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269B31308 = (uint64_t)result;
  return result;
}

uint64_t sub_2512C3464(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B314C0);
}

uint64_t sub_2512C3484()
{
  return sub_2512C3D14(&qword_269B31310, (uint64_t)qword_269B314C0);
}

uint64_t sub_2512C34A8@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31310, (uint64_t)qword_269B314C0, a1);
}

uint64_t sub_2512C34CC(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B314D8);
}

uint64_t sub_2512C34F8()
{
  return sub_2512C3D14(&qword_269B31318, (uint64_t)qword_269B314D8);
}

uint64_t sub_2512C351C@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31318, (uint64_t)qword_269B314D8, a1);
}

uint64_t sub_2512C3540(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B314F0);
}

uint64_t sub_2512C356C()
{
  return sub_2512C3D14(&qword_269B31320, (uint64_t)qword_269B314F0);
}

uint64_t sub_2512C3590@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31320, (uint64_t)qword_269B314F0, a1);
}

uint64_t sub_2512C35B4(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B31508);
}

uint64_t sub_2512C35D8()
{
  return sub_2512C3D14(&qword_269B31328, (uint64_t)qword_269B31508);
}

uint64_t sub_2512C35FC@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31328, (uint64_t)qword_269B31508, a1);
}

uint64_t sub_2512C3620(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B31520);
}

uint64_t sub_2512C3644()
{
  return sub_2512C3D14(&qword_269B31330, (uint64_t)qword_269B31520);
}

uint64_t sub_2512C3668@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31330, (uint64_t)qword_269B31520, a1);
}

uint64_t sub_2512C368C(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B31538);
}

uint64_t sub_2512C36B8()
{
  return sub_2512C3D14(&qword_269B31338, (uint64_t)qword_269B31538);
}

uint64_t sub_2512C36DC@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31338, (uint64_t)qword_269B31538, a1);
}

uint64_t sub_2512C3700(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B31550);
}

uint64_t sub_2512C372C()
{
  return sub_2512C3D14(&qword_269B31340, (uint64_t)qword_269B31550);
}

uint64_t sub_2512C3750@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31340, (uint64_t)qword_269B31550, a1);
}

uint64_t sub_2512C3774(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B31568);
}

uint64_t sub_2512C3798()
{
  return sub_2512C3D14(&qword_269B31348, (uint64_t)qword_269B31568);
}

uint64_t sub_2512C37BC@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31348, (uint64_t)qword_269B31568, a1);
}

uint64_t sub_2512C37E0(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B31580);
}

uint64_t sub_2512C3804()
{
  return sub_2512C3D14(&qword_269B31350, (uint64_t)qword_269B31580);
}

uint64_t sub_2512C3828@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31350, (uint64_t)qword_269B31580, a1);
}

uint64_t sub_2512C384C(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B31598);
}

uint64_t sub_2512C3870()
{
  return sub_2512C3D14(&qword_269B31358, (uint64_t)qword_269B31598);
}

uint64_t sub_2512C3894@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31358, (uint64_t)qword_269B31598, a1);
}

uint64_t sub_2512C38B8(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B315B0);
}

uint64_t sub_2512C38DC()
{
  return sub_2512C3D14(&qword_269B31360, (uint64_t)qword_269B315B0);
}

uint64_t sub_2512C3900@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31360, (uint64_t)qword_269B315B0, a1);
}

uint64_t sub_2512C3924(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B315C8);
}

uint64_t sub_2512C3948()
{
  return sub_2512C3D14(&qword_269B31368, (uint64_t)qword_269B315C8);
}

uint64_t sub_2512C396C@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31368, (uint64_t)qword_269B315C8, a1);
}

uint64_t sub_2512C3990(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B315E0);
}

uint64_t sub_2512C39B4()
{
  return sub_2512C3D14(&qword_269B31370, (uint64_t)qword_269B315E0);
}

uint64_t sub_2512C39D8@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31370, (uint64_t)qword_269B315E0, a1);
}

uint64_t sub_2512C39FC(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B315F8);
}

uint64_t sub_2512C3A20()
{
  return sub_2512C3D14(&qword_269B31378, (uint64_t)qword_269B315F8);
}

uint64_t sub_2512C3A44@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31378, (uint64_t)qword_269B315F8, a1);
}

uint64_t sub_2512C3A68(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B31610);
}

uint64_t sub_2512C3A8C()
{
  return sub_2512C3D14(&qword_269B31380, (uint64_t)qword_269B31610);
}

uint64_t sub_2512C3AB0@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31380, (uint64_t)qword_269B31610, a1);
}

uint64_t sub_2512C3AD4(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B31628);
}

uint64_t sub_2512C3B00()
{
  return sub_2512C3D14(&qword_269B31388, (uint64_t)qword_269B31628);
}

uint64_t sub_2512C3B24@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31388, (uint64_t)qword_269B31628, a1);
}

uint64_t sub_2512C3B48(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B31640);
}

uint64_t sub_2512C3B6C()
{
  return sub_2512C3D14(&qword_269B31390, (uint64_t)qword_269B31640);
}

uint64_t sub_2512C3B90@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31390, (uint64_t)qword_269B31640, a1);
}

uint64_t sub_2512C3BB4(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B31658);
}

uint64_t sub_2512C3BDC()
{
  return sub_2512C3D14(&qword_269B31398, (uint64_t)qword_269B31658);
}

uint64_t sub_2512C3C00@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B31398, (uint64_t)qword_269B31658, a1);
}

uint64_t sub_2512C3C24(uint64_t a1)
{
  return sub_2512C3C4C(a1, qword_269B31670);
}

uint64_t sub_2512C3C4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2512C4278();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_269B31300 != -1) {
    swift_once();
  }
  id v4 = (id)qword_269B31308;
  return sub_2512C4268();
}

uint64_t sub_2512C3CF0()
{
  return sub_2512C3D14(&qword_269B313A0, (uint64_t)qword_269B31670);
}

uint64_t sub_2512C3D14(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2512C4278();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_2512C3D68@<X0>(uint64_t a1@<X8>)
{
  return sub_2512C3D8C(&qword_269B313A0, (uint64_t)qword_269B31670, a1);
}

uint64_t sub_2512C3D8C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2512C4278();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_2512C3E48()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_2512C3E58()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2512C3E68()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2512C3E78()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2512C3E88()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2512C3E98()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2512C3EA8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2512C3EB8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2512C3EC8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2512C3ED8()
{
  return MEMORY[0x270EF0D20]();
}

uint64_t sub_2512C3EE8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2512C3EF8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2512C3F08()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_2512C3F18()
{
  return MEMORY[0x270F81740]();
}

uint64_t sub_2512C3F28()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_2512C3F38()
{
  return MEMORY[0x270FA1140]();
}

uint64_t sub_2512C3F48()
{
  return MEMORY[0x270F391A0]();
}

uint64_t sub_2512C3F58()
{
  return MEMORY[0x270F392F8]();
}

uint64_t sub_2512C3F68()
{
  return MEMORY[0x270F39300]();
}

uint64_t _s11HearingTest14HTEnvNoiseDataV0A6ModeUIE7samplesSaySfGvg_0()
{
  return MEMORY[0x270F39308]();
}

uint64_t sub_2512C3F88()
{
  return MEMORY[0x270F39310]();
}

uint64_t sub_2512C3F98()
{
  return MEMORY[0x270F39378]();
}

uint64_t sub_2512C3FA8()
{
  return MEMORY[0x270F39380]();
}

uint64_t sub_2512C3FB8()
{
  return MEMORY[0x270F39390]();
}

uint64_t sub_2512C3FC8()
{
  return MEMORY[0x270F39398]();
}

uint64_t sub_2512C3FD8()
{
  return MEMORY[0x270F393A8]();
}

uint64_t sub_2512C3FE8()
{
  return MEMORY[0x270F393B8]();
}

uint64_t sub_2512C3FF8()
{
  return MEMORY[0x270F393C0]();
}

uint64_t sub_2512C4008()
{
  return MEMORY[0x270F393C8]();
}

uint64_t sub_2512C4018()
{
  return MEMORY[0x270F393D0]();
}

uint64_t sub_2512C4028()
{
  return MEMORY[0x270F393D8]();
}

uint64_t sub_2512C4038()
{
  return MEMORY[0x270F393E8]();
}

uint64_t sub_2512C4048()
{
  return MEMORY[0x270F393F0]();
}

uint64_t sub_2512C4058()
{
  return MEMORY[0x270F393F8]();
}

uint64_t sub_2512C4068()
{
  return MEMORY[0x270F39400]();
}

uint64_t sub_2512C4078()
{
  return MEMORY[0x270F39408]();
}

uint64_t sub_2512C4088()
{
  return MEMORY[0x270F39410]();
}

uint64_t sub_2512C4098()
{
  return MEMORY[0x270F39418]();
}

uint64_t sub_2512C40A8()
{
  return MEMORY[0x270F39420]();
}

uint64_t sub_2512C40B8()
{
  return MEMORY[0x270F39428]();
}

uint64_t sub_2512C40C8()
{
  return MEMORY[0x270F39430]();
}

uint64_t sub_2512C40D8()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_2512C40E8()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_2512C40F8()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_2512C4108()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_2512C4118()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_2512C4128()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_2512C4138()
{
  return MEMORY[0x270F30AC8]();
}

uint64_t sub_2512C4148()
{
  return MEMORY[0x270F30AD0]();
}

uint64_t sub_2512C4158()
{
  return MEMORY[0x270F30AE8]();
}

uint64_t sub_2512C4168()
{
  return MEMORY[0x270F30B00]();
}

uint64_t sub_2512C4178()
{
  return MEMORY[0x270F30B08]();
}

uint64_t sub_2512C4188()
{
  return MEMORY[0x270F30B18]();
}

uint64_t sub_2512C4198()
{
  return MEMORY[0x270F30B90]();
}

uint64_t sub_2512C41A8()
{
  return MEMORY[0x270F30BA0]();
}

uint64_t sub_2512C41B8()
{
  return MEMORY[0x270F30BB0]();
}

uint64_t sub_2512C41C8()
{
  return MEMORY[0x270F30BC0]();
}

uint64_t sub_2512C41D8()
{
  return MEMORY[0x270F30BC8]();
}

uint64_t sub_2512C41E8()
{
  return MEMORY[0x270F30BF8]();
}

uint64_t sub_2512C41F8()
{
  return MEMORY[0x270F30C08]();
}

uint64_t sub_2512C4208()
{
  return MEMORY[0x270F30C20]();
}

uint64_t sub_2512C4218()
{
  return MEMORY[0x270F30C40]();
}

uint64_t sub_2512C4228()
{
  return MEMORY[0x270F30C70]();
}

uint64_t sub_2512C4238()
{
  return MEMORY[0x270F30C80]();
}

uint64_t sub_2512C4248()
{
  return MEMORY[0x270F30C98]();
}

uint64_t sub_2512C4258()
{
  return MEMORY[0x270F30CB0]();
}

uint64_t sub_2512C4268()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_2512C4278()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_2512C4288()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_2512C4298()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2512C42A8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2512C42B8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2512C42C8()
{
  return MEMORY[0x270F81D20]();
}

uint64_t sub_2512C42D8()
{
  return MEMORY[0x270F81D48]();
}

uint64_t sub_2512C42E8()
{
  return MEMORY[0x270F81DC0]();
}

uint64_t sub_2512C42F8()
{
  return MEMORY[0x270F81DD8]();
}

uint64_t sub_2512C4308()
{
  return MEMORY[0x270F81DF8]();
}

uint64_t sub_2512C4318()
{
  return MEMORY[0x270F81EE0]();
}

uint64_t sub_2512C4328()
{
  return MEMORY[0x270F823A0]();
}

uint64_t sub_2512C4338()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_2512C4348()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_2512C4358()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_2512C4368()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2512C4378()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_2512C4388()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_2512C4398()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2512C43A8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2512C43B8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2512C43C8()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_2512C43D8()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_2512C43E8()
{
  return MEMORY[0x270EE4010]();
}

uint64_t sub_2512C43F8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_2512C4408()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_2512C4418()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_2512C4428()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_2512C4438()
{
  return MEMORY[0x270F00138]();
}

uint64_t sub_2512C4448()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_2512C4458()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_2512C4468()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_2512C4478()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_2512C4488()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_2512C4498()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_2512C44A8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_2512C44B8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_2512C44C8()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_2512C44D8()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_2512C44E8()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2512C44F8()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_2512C4508()
{
  return MEMORY[0x270F013F0]();
}

uint64_t sub_2512C4518()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_2512C4528()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_2512C4538()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_2512C4548()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2512C4558()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2512C4568()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_2512C4578()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_2512C4588()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_2512C4598()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2512C45A8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2512C45B8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2512C45C8()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_2512C45D8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2512C45E8()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_2512C45F8()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_2512C4608()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_2512C4618()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_2512C4628()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_2512C4638()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_2512C4648()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2512C4658()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2512C4668()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_2512C4678()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2512C4688()
{
  return MEMORY[0x270F05120]();
}

uint64_t sub_2512C4698()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_2512C46A8()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_2512C46B8()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_2512C46C8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2512C46D8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2512C46E8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2512C46F8()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2512C4708()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2512C4718()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_2512C4728()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2512C4738()
{
  return MEMORY[0x270F9D568]();
}

uint64_t sub_2512C4748()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2512C4758()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_2512C4768()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_2512C4778()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_2512C4788()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_2512C4798()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_2512C47A8()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_2512C47B8()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_2512C47C8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2512C47D8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2512C47E8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2512C47F8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2512C4808()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_2512C4818()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2512C4828()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2512C4838()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2512C4848()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2512C4858()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2512C4868()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2512C4878()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2512C4888()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2512C4898()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2512C48A8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2512C48B8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2512C48C8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2512C48D8()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_2512C48E8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2512C48F8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2512C4908()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2512C4918()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2512C4928()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2512C4948()
{
  return MEMORY[0x270EF1C48]();
}

uint64_t sub_2512C4958()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2512C4968()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_2512C4978()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2512C4988()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2512C4998()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2512C49A8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2512C49B8()
{
  return MEMORY[0x270F82478]();
}

uint64_t sub_2512C49C8()
{
  return MEMORY[0x270EE58B8]();
}

uint64_t sub_2512C49D8()
{
  return MEMORY[0x270EE58D8]();
}

uint64_t sub_2512C49E8()
{
  return MEMORY[0x270F82578]();
}

uint64_t sub_2512C49F8()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_2512C4A08()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2512C4A18()
{
  return MEMORY[0x270FA0870]();
}

uint64_t sub_2512C4A28()
{
  return MEMORY[0x270F828E0]();
}

uint64_t sub_2512C4A38()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_2512C4A48()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_2512C4A58()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_2512C4A68()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2512C4A78()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2512C4A88()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_2512C4A98()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_2512C4AA8()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_2512C4AB8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2512C4AC8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2512C4AD8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2512C4AE8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2512C4AF8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2512C4B08()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2512C4B18()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2512C4B28()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2512C4B38()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2512C4B48()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2512C4B58()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2512C4B68()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2512C4B78()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2512C4B88()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2512C4B98()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2512C4BB8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2512C4BC8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2512C4BD8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_2512C4BE8()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_2512C4BF8()
{
  return MEMORY[0x270EF2650]();
}

uint64_t sub_2512C4C08()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2512C4C18()
{
  return MEMORY[0x270EF2720]();
}

uint64_t sub_2512C4C28()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2512C4C38()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2512C4C48()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2512C4C58()
{
  return MEMORY[0x270EF2760]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
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

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

uint64_t HKHearingLevelClassificationForSensitivity()
{
  return MEMORY[0x270EF3708]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}