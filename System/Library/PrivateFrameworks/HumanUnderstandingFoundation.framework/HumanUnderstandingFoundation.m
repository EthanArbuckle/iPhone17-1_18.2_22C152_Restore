id sub_2232F2F48(void *a1, void *a2, void *a3)
{
  id v6;

  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithAmbientLightColorComponent0_ambientLightColorComponent1_ambientLightColorComponent2_, a1, a2, a3);

  return v6;
}

void sub_2232F2FB0()
{
  uint64_t v2 = v0;
  v3 = (uint64_t *)(v0 + 56);
  swift_beginAccess();
  if (*(void *)(*(void *)(v2 + 56) + 16) > 4uLL)
  {
    unint64_t v1 = *(void *)(v2 + 64);
    sub_2232F34C8(&qword_26AD65CB0);
    v4 = (__n128 *)swift_allocObject();
    sub_2232F3584(v4, (__n128)xmmword_22330CC10);
    uint64_t v5 = *(void *)(v2 + 56);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v2 + 56) = v5;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      goto LABEL_10;
    }
    if ((v1 & 0x8000000000000000) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
  }
  else
  {
    sub_2232F34C8(&qword_26AD65CB0);
    v4 = (__n128 *)swift_allocObject();
    sub_2232F3584(v4, (__n128)xmmword_22330CC10);
    sub_2232FF304();
    uint64_t v5 = *(void *)(*v3 + 16);
    sub_2232FF378(v5);
    uint64_t v6 = *v3;
    *(void *)(v6 + 16) = v5 + 1;
    *(void *)(v6 + 8 * v5 + 32) = v4;
    swift_endAccess();
    while (1)
    {
      uint64_t v9 = *(void *)(v2 + 64);
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (!v10) {
        break;
      }
      __break(1u);
LABEL_10:
      sub_2232F4904(v5);
      uint64_t v5 = v12;
      uint64_t *v3 = v12;
      if ((v1 & 0x8000000000000000) != 0) {
        goto LABEL_11;
      }
LABEL_5:
      if (v1 >= *(void *)(v5 + 16)) {
        goto LABEL_12;
      }
      uint64_t v8 = v5 + 8 * v1;
      v3 = *(uint64_t **)(v8 + 32);
      *(void *)(v8 + 32) = v4;
      swift_endAccess();
      swift_bridgeObjectRelease();
    }
    *(void *)(v2 + 64) = v11 % 5;
  }
}

void AmbientLightMonitor.sendEvent(_:)(uint64_t a1)
{
  objc_msgSend(*(id *)(v1 + 40), sel_sendEvent_, a1);
  if (qword_26AD65C98 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22330BF98();
  sub_2232F3490(v2, (uint64_t)qword_26AD65ED0);
  oslog = sub_22330BF78();
  os_log_type_t v3 = sub_22330C1E8();
  if (os_log_type_enabled(oslog, v3))
  {
    v4 = (_WORD *)swift_slowAlloc();
    _WORD *v4 = 0;
    sub_2232F350C(&dword_2232F1000, v5, v6, "Finished writing ambient light values to the biome stream", v7, v8, v9, v10, v11, oslog);
    MEMORY[0x223CB4130](v4, -1, -1);
  }
}

void sub_2232F3220(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  handleAmbientLightEvent(_:_:_:_:)(a1);
}

void handleAmbientLightEvent(_:_:_:_:)(uint64_t a1)
{
  if (a1)
  {
    swift_retain();
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - *(double *)(a1 + 48) < 10.0)
    {
      swift_release();
      return;
    }
    *(double *)(a1 + 48) = Current;
    IOHIDEventGetDoubleValue();
    IOHIDEventGetDoubleValue();
    IOHIDEventGetDoubleValue();
    sub_2232F2FB0();
    sub_2232F3648(0, &qword_26AD65E10);
    uint64_t v12 = (void *)sub_22330C178();
    v13 = (void *)sub_22330C178();
    v14 = (void *)sub_22330C178();
    oslog = sub_2232F2F48(v12, v13, v14);
    AmbientLightMonitor.sendEvent(_:)((uint64_t)oslog);
    swift_release();
  }
  else
  {
    if (qword_26AD65C98 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_22330BF98();
    sub_2232F3490(v3, (uint64_t)qword_26AD65ED0);
    oslog = sub_22330BF78();
    os_log_type_t v4 = sub_22330C1E8();
    if (os_log_type_enabled(oslog, v4))
    {
      id v5 = (_WORD *)swift_slowAlloc();
      *id v5 = 0;
      sub_2232F350C(&dword_2232F1000, v6, v7, "AmbientLightMonitor handleAmbientLightEvent() target is nil", v8, v9, v10, v11, v15, oslog);
      MEMORY[0x223CB4130](v5, -1, -1);
    }
  }
}

uint64_t sub_2232F3490(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2232F34C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_2232F350C(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t log)
{
  _os_log_impl(a1, log, v10, a4, v11, 2u);
}

uint64_t sub_2232F352C()
{
  return swift_bridgeObjectRetain();
}

__n128 sub_2232F3550(__n128 *a1)
{
  __n128 result = *(__n128 *)(v2 - 176);
  a1[1] = result;
  a1[3].n128_u64[1] = v1;
  return result;
}

uint64_t sub_2232F3584(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[2].n128_u64[0] = v5;
  a1[2].n128_u64[1] = v4;
  a1[3].n128_u64[0] = v3;
  return swift_beginAccess();
}

void sub_2232F35B0(uint64_t a1@<X8>)
{
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t sub_2232F35D0()
{
  return swift_allocObject();
}

uint64_t sub_2232F35E8()
{
  return sub_22330C3D8();
}

uint64_t sub_2232F361C()
{
  return v0;
}

uint64_t sub_2232F3648(uint64_t a1, unint64_t *a2)
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

HumanUnderstandingFoundation::AmbientLightType_optional __swiftcall AmbientLightType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 8;
  if ((unint64_t)rawValue < 8) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (HumanUnderstandingFoundation::AmbientLightType_optional)rawValue;
}

uint64_t AmbientLightType.rawValue.getter()
{
  return *v0;
}

BOOL sub_2232F36A0(char *a1, char *a2)
{
  return sub_2232FD334(*a1, *a2);
}

uint64_t sub_2232F36AC()
{
  return sub_2232FD36C();
}

uint64_t sub_2232F36B4()
{
  return sub_2232FD344();
}

uint64_t sub_2232F36BC()
{
  return sub_22330890C();
}

HumanUnderstandingFoundation::AmbientLightType_optional sub_2232F36C4(Swift::Int *a1)
{
  return AmbientLightType.init(rawValue:)(*a1);
}

uint64_t sub_2232F36CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AmbientLightType.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2232F36F4()
{
  type metadata accessor for AmbientLightMonitor();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_2232F3790(1);
  qword_26AD65CA8 = v0;
  return result;
}

uint64_t static AmbientLightMonitor.shared.getter()
{
  if (qword_26AD65CF0 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_2232F3790(char a1)
{
  uint64_t v3 = (void *)v1;
  uint64_t v16 = sub_22330C208();
  sub_2232F49B0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388]();
  sub_2232F49CC();
  sub_22330C1F8();
  MEMORY[0x270FA5388]();
  sub_22330C008();
  MEMORY[0x270FA5388]();
  sub_2232F49E4();
  *(_OWORD *)(v1 + 16) = xmmword_22330CC00;
  *(void *)(v1 + 80) = 0;
  *(void *)(v1 + 64) = 0;
  uint64_t v6 = MEMORY[0x263F8EE78];
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 56) = v6;
  sub_2232F3648(0, &qword_26AD65E08);
  sub_22330BFF8();
  sub_2232F4918(&qword_26AD65E00, MEMORY[0x263F8F0F8]);
  sub_2232F34C8(&qword_26AD65DE8);
  sub_2232F4960((unint64_t *)&unk_26AD65DF0, &qword_26AD65DE8);
  sub_22330C278();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v2, *MEMORY[0x263F8F130], v16);
  *(void *)(v1 + 72) = sub_22330C228();
  id v7 = objc_msgSend((id)BiomeLibrary(), sel_ContextualUnderstanding);
  swift_unknownObjectRelease();
  id v8 = objc_msgSend(v7, sel_AmbientLight);
  swift_unknownObjectRelease();
  v3[4] = v8;
  v3[5] = objc_msgSend(v8, sel_source);
  if ((a1 & 1) == 0) {
    return (uint64_t)v3;
  }
  uint64_t v9 = IOHIDEventSystemClientCreateWithType();
  os_log_type_t v10 = (void *)v3[10];
  v3[10] = v9;

  uint64_t result = v3[10];
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t result = IOHIDEventSystemClientScheduleWithDispatchQueue();
  if (!v3[10])
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  swift_retain();
  uint64_t result = IOHIDEventSystemClientRegisterEventCallback();
  uint64_t v12 = (void *)v3[10];
  if (v12)
  {
    v13 = v12;
    v14 = (__CFString *)sub_22330C078();
    uint64_t v15 = (void *)sub_22330C138();
    IOHIDEventSystemClientSetProperty(v13, v14, v15);

    return (uint64_t)v3;
  }
LABEL_9:
  __break(1u);
  return result;
}

HumanUnderstandingFoundation::AmbientLightType __swiftcall AmbientLightMonitor.getCurrentAmbientLightType()()
{
  v56 = v0;
  uint64_t v65 = sub_22330BFC8();
  sub_2232F49B0();
  uint64_t v62 = v4;
  ((void (*)(void))MEMORY[0x270FA5388])();
  sub_2232F49E4();
  sub_22330C038();
  sub_2232F49B0();
  uint64_t v63 = v6;
  uint64_t v64 = v5;
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v60 = (char *)v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v61 = (char *)v55 - v9;
  uint64_t v10 = sub_22330BFE8();
  sub_2232F49B0();
  uint64_t v59 = v11;
  MEMORY[0x270FA5388](v12);
  v14 = (char *)v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22330C008();
  sub_2232F49B0();
  uint64_t v57 = v16;
  uint64_t v58 = v15;
  MEMORY[0x270FA5388](v15);
  sub_2232F49CC();
  uint64_t v17 = swift_allocObject();
  sub_2232F457C();
  *(void *)(v17 + 16) = sub_22330C068();
  v55[0] = v17 + 16;
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  v19 = *(void **)(v1 + 72);
  v20 = (void *)swift_allocObject();
  v20[2] = v1;
  v20[3] = v17;
  v20[4] = v18;
  aBlock[4] = sub_2232F4610;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2232F448C;
  aBlock[3] = &unk_26D667C28;
  v21 = _Block_copy(aBlock);
  id v22 = v19;
  swift_retain();
  v55[1] = v17;
  swift_retain();
  dispatch_semaphore_t v23 = v18;
  sub_22330BFF8();
  uint64_t v66 = MEMORY[0x263F8EE78];
  sub_2232F4918(&qword_267FA1540, MEMORY[0x263F8F030]);
  sub_2232F34C8(&qword_267FA1548);
  sub_2232F4960(&qword_267FA1550, &qword_267FA1548);
  sub_22330C278();
  MEMORY[0x223CB38E0](0, v2, v14, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v59 + 8))(v14, v10);
  (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v2, v58);
  swift_release();
  v24 = v60;
  sub_22330C018();
  void *v3 = 1;
  uint64_t v25 = v62;
  uint64_t v26 = v65;
  (*(void (**)(void *, void, uint64_t))(v62 + 104))(v3, *MEMORY[0x263F8F018], v65);
  v27 = v61;
  sub_22330C028();
  (*(void (**)(void *, uint64_t))(v25 + 8))(v3, v26);
  v28 = *(void (**)(char *, uint64_t))(v63 + 8);
  v29 = v24;
  uint64_t v30 = v64;
  v28(v29, v64);
  sub_22330C238();
  v28(v27, v30);
  if (sub_22330BFD8())
  {
    if (qword_26AD65C98 != -1) {
      goto LABEL_33;
    }
    goto LABEL_3;
  }
  v36 = (uint64_t *)v55[0];
  swift_beginAccess();
  uint64_t v37 = 0;
  int64_t v38 = 0;
  uint64_t v39 = *v36;
  uint64_t v40 = *v36;
  uint64_t v41 = 1 << *(unsigned char *)(*v36 + 32);
  uint64_t v42 = -1;
  if (v41 < 64) {
    uint64_t v42 = ~(-1 << v41);
  }
  uint64_t v44 = *(void *)(v40 + 64);
  uint64_t v43 = v40 + 64;
  unint64_t v45 = v42 & v44;
  int64_t v46 = (unint64_t)(v41 + 63) >> 6;
  unsigned int v47 = 7;
  while (1)
  {
    unsigned int v35 = v47;
    uint64_t v48 = v37;
    if (v45)
    {
      unint64_t v49 = __clz(__rbit64(v45));
      v45 &= v45 - 1;
      unint64_t v50 = v49 | (v38 << 6);
      goto LABEL_24;
    }
    int64_t v51 = v38 + 1;
    if (__OFADD__(v38, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v51 >= v46) {
      goto LABEL_28;
    }
    unint64_t v52 = *(void *)(v43 + 8 * v51);
    ++v38;
    if (!v52)
    {
      int64_t v38 = v51 + 1;
      if (v51 + 1 >= v46) {
        goto LABEL_28;
      }
      unint64_t v52 = *(void *)(v43 + 8 * v38);
      if (!v52)
      {
        int64_t v38 = v51 + 2;
        if (v51 + 2 >= v46) {
          goto LABEL_28;
        }
        unint64_t v52 = *(void *)(v43 + 8 * v38);
        if (!v52) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v45 = (v52 - 1) & v52;
    unint64_t v50 = __clz(__rbit64(v52)) + (v38 << 6);
LABEL_24:
    unsigned int v47 = *(unsigned __int8 *)(*(void *)(v39 + 48) + v50);
    uint64_t v37 = *(void *)(*(void *)(v39 + 56) + 8 * v50);
    if (v48 >= v37 && (v37 != v48 || v47 >= v35))
    {
      uint64_t v37 = v48;
      unsigned int v47 = v35;
    }
  }
  int64_t v53 = v51 + 3;
  if (v53 >= v46)
  {
LABEL_28:
    swift_release();
    goto LABEL_30;
  }
  unint64_t v52 = *(void *)(v43 + 8 * v53);
  if (v52)
  {
    int64_t v38 = v53;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v38 = v53 + 1;
    if (__OFADD__(v53, 1)) {
      break;
    }
    if (v38 >= v46) {
      goto LABEL_28;
    }
    unint64_t v52 = *(void *)(v43 + 8 * v38);
    ++v53;
    if (v52) {
      goto LABEL_23;
    }
  }
LABEL_32:
  __break(1u);
LABEL_33:
  swift_once();
LABEL_3:
  uint64_t v31 = sub_22330BF98();
  sub_2232F3490(v31, (uint64_t)qword_26AD65ED0);
  v32 = sub_22330BF78();
  os_log_type_t v33 = sub_22330C1E8();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_2232F1000, v32, v33, "AmbientLightMonitor getCurrentAmbientLightType() timed out waiting for semaphore", v34, 2u);
    MEMORY[0x223CB4130](v34, -1, -1);
    swift_release();

    LOBYTE(v35) = 7;
    dispatch_semaphore_t v23 = v32;
  }
  else
  {
    swift_release();

    LOBYTE(v35) = 7;
  }
LABEL_30:

  unsigned char *v56 = v35;
  return result;
}

uint64_t sub_2232F4188(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v26 = *(void *)(v4 + 16);
  if (!v26) {
    return sub_22330C248();
  }
  uint64_t v5 = (uint64_t *)(a2 + 16);
  swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = *(void *)(v4 + 8 * v6 + 32);
    unint64_t v8 = *(void *)(v7 + 16);
    if (!v8) {
      break;
    }
    if (v8 == 1) {
      goto LABEL_23;
    }
    if (v8 < 3) {
      goto LABEL_24;
    }
    sub_2232F43D8(v28, *(double *)(v7 + 32), *(double *)(v7 + 40), *(double *)(v7 + 48));
    unsigned __int8 v9 = v28[0];
    swift_beginAccess();
    uint64_t v10 = *v5;
    if (*(void *)(*v5 + 16) && (unint64_t v11 = sub_2232FA56C(v9), (v12 & 1) != 0)) {
      uint64_t v13 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
    }
    else {
      uint64_t v13 = 0;
    }
    swift_endAccess();
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_25;
    }
    swift_beginAccess();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v5;
    v27 = (void *)*v5;
    *uint64_t v5 = 0x8000000000000000;
    unint64_t v17 = sub_2232FA56C(v9);
    if (__OFADD__(*(void *)(v16 + 16), (v18 & 1) == 0)) {
      goto LABEL_26;
    }
    unint64_t v19 = v17;
    char v20 = v18;
    sub_2232F34C8(&qword_267FA1628);
    if (sub_22330C348())
    {
      unint64_t v21 = sub_2232FA56C(v9);
      if ((v20 & 1) != (v22 & 1)) {
        goto LABEL_28;
      }
      unint64_t v19 = v21;
    }
    if (v20)
    {
      *(void *)(v27[7] + 8 * v19) = v15;
    }
    else
    {
      v27[(v19 >> 6) + 8] |= 1 << v19;
      *(unsigned char *)(v27[6] + v19) = v9;
      *(void *)(v27[7] + 8 * v19) = v15;
      uint64_t v23 = v27[2];
      BOOL v14 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v14) {
        goto LABEL_27;
      }
      v27[2] = v24;
    }
    ++v6;
    *uint64_t v5 = (uint64_t)v27;
    swift_bridgeObjectRelease();
    swift_endAccess();
    if (v26 == v6)
    {
      swift_bridgeObjectRelease();
      return sub_22330C248();
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  uint64_t result = sub_22330C438();
  __break(1u);
  return result;
}

void sub_2232F43D8(char *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>)
{
  if (a3 >= 4.0)
  {
    if (a3 < 100.0 && a4 < a2 && a4 < a3)
    {
      char v4 = 1;
    }
    else
    {
      double v7 = a2 * 0.8;
      if (a3 >= 200.0 || v7 > a4)
      {
        if (a3 >= 1000.0 || v7 <= a4)
        {
          if (a3 >= 30000.0 || v7 <= a4)
          {
            if (a3 >= 10000.0) {
              char v4 = 6;
            }
            else {
              char v4 = 5;
            }
          }
          else
          {
            char v4 = 4;
          }
        }
        else
        {
          char v4 = 3;
        }
      }
      else
      {
        char v4 = 2;
      }
    }
  }
  else
  {
    char v4 = 0;
  }
  *a1 = v4;
}

uint64_t sub_2232F448C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id *AmbientLightMonitor.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AmbientLightMonitor.__deallocating_deinit()
{
  AmbientLightMonitor.deinit();

  return MEMORY[0x270FA0228](v0, 88, 7);
}

uint64_t sub_2232F4544()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_2232F457C()
{
  unint64_t result = qword_267FA1538;
  if (!qword_267FA1538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267FA1538);
  }
  return result;
}

uint64_t sub_2232F45C8()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2232F4610()
{
  return sub_2232F4188(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2232F461C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2232F462C()
{
  return swift_release();
}

uint64_t sub_2232F4634(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_2232F4680()
{
  unint64_t result = qword_267FA1558;
  if (!qword_267FA1558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267FA1558);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for AmbientLightType(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AmbientLightType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AmbientLightType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x2232F4830);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t sub_2232F4858(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2232F4864(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AmbientLightType()
{
  return &type metadata for AmbientLightType;
}

uint64_t type metadata accessor for AmbientLightMonitor()
{
  return self;
}

uint64_t method lookup function for AmbientLightMonitor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AmbientLightMonitor);
}

void type metadata accessor for IOHIDEventSystemClient()
{
  if (!qword_267FA1620)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267FA1620);
    }
  }
}

void sub_2232F4904(uint64_t a1)
{
}

uint64_t sub_2232F4918(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2232F4960(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2232F4634(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2232F49FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_2232FA5D8(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_2232F4A54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_2232F9CE8(a1, (uint64_t)v10);
  sub_2232F34C8(&qword_267FA1690);
  sub_2232F34C8(&qword_267FA16B0);
  if (!swift_dynamicCast()) {
    return sub_2232F9CE8(a2, a3);
  }
  sub_2232F9CE8(a2, (uint64_t)v10);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return sub_2232F9CE8(a2, a3);
  }
  swift_bridgeObjectRetain();
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10[0] = v9;
  sub_2232FA884(v9, sub_2232FA84C, 0, isUniquelyReferenced_nonNull_native, v10);
  if (v3)
  {
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }
  else
  {
    uint64_t v7 = v10[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v10[0] = v7;
    return swift_dynamicCast();
  }
  return result;
}

uint64_t BMContextualUnderstandingSoundAnalysis.asHierarchicalDictionary()()
{
  sub_2232F34C8(&qword_267FA1690);
  uint64_t v0 = sub_22330C068();
  uint64_t v1 = BMContextualUnderstandingSoundAnalysis.asFlatDictionary()();
  sub_2232F3648(0, &qword_267FA1698);
  uint64_t v2 = static BMContextualUnderstandingSoundAnalysis.soundHierarchyDictionary()();
  uint64_t v3 = v2;
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)(v1 + 64);
  uint64_t v89 = v1 + 64;
  uint64_t v92 = v1;
  uint64_t v6 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v90 = (unint64_t)(v6 + 63) >> 6;
  v91 = v111;
  v93 = &v114;
  v97 = &v105;
  uint64_t v88 = v90 - 1;
  *((void *)&v9 + 1) = 2;
  *(void *)&long long v9 = 136315138;
  long long v95 = v9;
  uint64_t v94 = MEMORY[0x263F8EE58] + 8;
  uint64_t v102 = v2;
  if ((v7 & v5) == 0) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  uint64_t v11 = (v8 - 1) & v8;
  unint64_t v12 = v10 | (v4 << 6);
LABEL_5:
  uint64_t v13 = *(void *)(v92 + 56);
  BOOL v14 = (void *)(*(void *)(v92 + 48) + 16 * v12);
  uint64_t v15 = v14[1];
  *(void *)&long long v110 = *v14;
  *((void *)&v110 + 1) = v15;
  sub_2232F9CE8(v13 + 32 * v12, (uint64_t)v91);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_2232F9D50((uint64_t)&v110, (uint64_t)&v112, &qword_267FA16A0);
    uint64_t v18 = v113;
    if (!v113)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return v0;
    }
    uint64_t v98 = v11;
    uint64_t v99 = v4;
    uint64_t v100 = 0;
    uint64_t v101 = v0;
    uint64_t v19 = v112;
    sub_2232F9D50((uint64_t)v93, (uint64_t)&v110, &qword_267FA1690);
    uint64_t v108 = v19;
    uint64_t v109 = v18;
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_2232F49FC(v19, v18, v3);
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    if (v22) {
      uint64_t v23 = v20;
    }
    else {
      uint64_t v23 = 1953460082;
    }
    if (!v22) {
      uint64_t v22 = 0xE400000000000000;
    }
    uint64_t v24 = (void *)sub_22330C068();
    BOOL v25 = v23 == 1953460082 && v22 == 0xE400000000000000;
    if (!v25 && (sub_2232FCFB8() & 1) == 0) {
      break;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    uint64_t v27 = v100;
    uint64_t v26 = v101;
    uint64_t v3 = v102;
    if (v24[2])
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2232F34C8(&qword_267FA16A8);
      inited = (__n128 *)swift_initStackObject();
      sub_2232FD088(inited, v29, v30, v31, v32, v33, v34, v35, v87, v88, v89, v90, (uint64_t)v91, v92, (uint64_t)v93, v94, v95, *((uint64_t *)&v95 + 1), v96,
        (uint64_t)v97,
        v98,
        v99,
        v100,
        v101,
        v36);
      *(void *)(v37 + 32) = v19;
      *(void *)(v37 + 40) = v18;
      sub_2232F9CE8((uint64_t)&v110, v38);
      uint64_t v39 = sub_22330C068();
      swift_bridgeObjectRelease();
      uint64_t v24 = (void *)v39;
    }
    swift_bridgeObjectRetain_n();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v106[0] = v26;
    sub_2232FA884((uint64_t)v24, (uint64_t)sub_2232FA84C, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v106);
    if (v27) {
      goto LABEL_87;
    }
    uint64_t v0 = v106[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2232FA7D4((uint64_t)&v110, &qword_267FA1690);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v8 = v98;
    uint64_t v4 = v99;
    if (v98) {
      goto LABEL_4;
    }
LABEL_6:
    int64_t v16 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_82;
    }
    if (v16 < v90)
    {
      unint64_t v17 = *(void *)(v89 + 8 * v16);
      if (v17) {
        goto LABEL_9;
      }
      v4 += 2;
      if (v16 + 1 >= v90)
      {
        uint64_t v4 = v16;
      }
      else
      {
        unint64_t v17 = *(void *)(v89 + 8 * v4);
        if (v17)
        {
          ++v16;
LABEL_9:
          uint64_t v11 = (v17 - 1) & v17;
          unint64_t v12 = __clz(__rbit64(v17)) + (v16 << 6);
          uint64_t v4 = v16;
          goto LABEL_5;
        }
        if (v16 + 2 < v90)
        {
          unint64_t v17 = *(void *)(v89 + 8 * (v16 + 2));
          if (v17)
          {
            v16 += 2;
            goto LABEL_9;
          }
          int64_t v85 = v16 + 3;
          if (v16 + 3 < v90)
          {
            unint64_t v17 = *(void *)(v89 + 8 * v85);
            if (!v17)
            {
              while (1)
              {
                int64_t v16 = v85 + 1;
                if (__OFADD__(v85, 1)) {
                  goto LABEL_83;
                }
                if (v16 >= v90)
                {
                  uint64_t v4 = v88;
                  goto LABEL_14;
                }
                unint64_t v17 = *(void *)(v89 + 8 * v16);
                ++v85;
                if (v17) {
                  goto LABEL_9;
                }
              }
            }
            v16 += 3;
            goto LABEL_9;
          }
          uint64_t v4 = v16 + 2;
        }
      }
    }
LABEL_14:
    uint64_t v11 = 0;
    memset(v111, 0, sizeof(v111));
    long long v110 = 0u;
  }
  swift_beginAccess();
  while (1)
  {
    uint64_t v41 = v18;
    uint64_t v18 = v22;
    sub_2232F34C8(&qword_267FA16A8);
    uint64_t v42 = (__n128 *)swift_initStackObject();
    sub_2232FD088(v42, v43, v44, v45, v46, v47, v48, v49, v87, v88, v89, v90, (uint64_t)v91, v92, (uint64_t)v93, v94, v95, *((uint64_t *)&v95 + 1), v96,
      (uint64_t)v97,
      v98,
      v99,
      v100,
      v101,
      v50);
    *(void *)(v51 + 32) = v19;
    *(void *)(v51 + 40) = v41;
    sub_2232F9CE8((uint64_t)&v110, v52);
    swift_bridgeObjectRetain();
    uint64_t v53 = sub_22330C068();
    uint64_t v107 = sub_2232F34C8(&qword_267FA16B0);
    v106[0] = v53;
    sub_2232F9D50((uint64_t)v106, (uint64_t)&v104, &qword_267FA1690);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v103 = v23;
    unint64_t v54 = sub_2232FA5D8(v23, v22);
    if (__OFADD__(v24[2], (v55 & 1) == 0)) {
      break;
    }
    unint64_t v56 = v54;
    char v57 = v55;
    sub_2232F34C8(&qword_267FA16B8);
    if (sub_22330C348())
    {
      unint64_t v58 = sub_2232FA5D8(v23, v22);
      if ((v57 & 1) != (v59 & 1)) {
        goto LABEL_86;
      }
      unint64_t v56 = v58;
    }
    if (v57)
    {
      sub_2232FAC18((uint64_t)&v104, v24[7] + 32 * v56);
    }
    else
    {
      sub_2232FCFF0((uint64_t)&v24[v56 >> 6]);
      v60 = (uint64_t *)(v24[6] + 16 * v56);
      uint64_t *v60 = v23;
      v60[1] = v22;
      sub_2232F9D50((uint64_t)&v104, v24[7] + 32 * v56, &qword_267FA1690);
      uint64_t v61 = v24[2];
      BOOL v62 = __OFADD__(v61, 1);
      uint64_t v63 = v61 + 1;
      if (v62) {
        goto LABEL_81;
      }
      v24[2] = v63;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v64 = v108;
    uint64_t v65 = v109;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v66 = sub_2232FA5D8(v64, v65);
    LOBYTE(v64) = v67;
    swift_bridgeObjectRelease();
    if (v64)
    {
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v104 = (uint64_t)v24;
      sub_22330C348();
      uint64_t v24 = (void *)v104;
      swift_bridgeObjectRelease();
      sub_2232F9D50(v24[7] + 32 * v66, (uint64_t)v106, &qword_267FA1690);
      sub_22330C368();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2232FCFE0();
    }
    swift_bridgeObjectRelease();
    sub_2232FA7D4((uint64_t)v106, &qword_267FA16C0);
    uint64_t v108 = v23;
    uint64_t v109 = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (!v24[2]) {
      goto LABEL_84;
    }
    swift_bridgeObjectRetain();
    unint64_t v68 = sub_2232FA5D8(v23, v22);
    if (v69) {
      sub_2232F9CE8(v24[7] + 32 * v68, (uint64_t)v106);
    }
    else {
      sub_2232FCFE0();
    }
    swift_bridgeObjectRelease();
    if (v107 == 1) {
      goto LABEL_85;
    }
    sub_2232FA7D4((uint64_t)&v110, &qword_267FA1690);
    sub_2232F9D50((uint64_t)v106, (uint64_t)&v110, &qword_267FA1690);
    if (!*(void *)(v102 + 16)) {
      goto LABEL_54;
    }
    uint64_t v70 = v108;
    uint64_t v71 = v109;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2232FA5D8(v70, v71);
    char v73 = v72;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v73 & 1) == 0)
    {
LABEL_54:
      if (qword_267FA1520 != -1) {
        swift_once();
      }
      uint64_t v77 = sub_22330BF98();
      sub_2232F3490(v77, (uint64_t)qword_267FA1E30);
      v78 = sub_22330BF78();
      os_log_type_t v79 = sub_22330C1C8();
      if (os_log_type_enabled(v78, v79))
      {
        v80 = (uint8_t *)swift_slowAlloc();
        uint64_t v81 = swift_slowAlloc();
        v106[0] = v81;
        *(_DWORD *)v80 = v95;
        uint64_t v83 = v108;
        unint64_t v82 = v109;
        swift_bridgeObjectRetain();
        uint64_t v104 = sub_2232F9DB4(v83, v82, v106);
        sub_22330C258();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2232F1000, v78, v79, "Soundname: %s is not contained in hierarchy dictionary", v80, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223CB4130](v81, -1, -1);
        MEMORY[0x223CB4130](v80, -1, -1);
      }

      goto LABEL_59;
    }
    if (!*(void *)(v102 + 16)) {
      goto LABEL_59;
    }
    swift_bridgeObjectRetain();
    unint64_t v74 = sub_2232FA5D8(v70, v71);
    if ((v75 & 1) == 0)
    {
      swift_bridgeObjectRelease();
LABEL_59:
      uint64_t v22 = 0xE400000000000000;
      uint64_t v23 = 1953460082;
      goto LABEL_60;
    }
    v76 = (uint64_t *)(*(void *)(v102 + 56) + 16 * v74);
    uint64_t v23 = *v76;
    uint64_t v22 = v76[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
LABEL_60:
    BOOL v84 = v23 == 1953460082 && v22 == 0xE400000000000000;
    uint64_t v19 = v103;
    if (v84 || (sub_2232FCFB8() & 1) != 0) {
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  sub_2232FCFE0();
LABEL_85:
  __break(1u);
LABEL_86:
  sub_22330C438();
  __break(1u);
LABEL_87:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t BMContextualUnderstandingSoundAnalysis.asFlatDictionary()()
{
  uint64_t v1 = (void *)sub_2232FD068();
  uint64_t v2 = sub_2232FD068();
  id v3 = objc_msgSend(v0, sel_classifiedSounds);
  sub_2232F3648(0, &qword_267FA16C8);
  unint64_t v4 = sub_22330C148();

  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_3;
    }
LABEL_38:
    swift_bridgeObjectRelease();
    uint64_t v51 = swift_bridgeObjectRetain();
    unint64_t v52 = sub_2232F8E84(v51);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    return v52;
  }
LABEL_45:
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_22330C398();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_38;
  }
LABEL_3:
  unint64_t v54 = v4;
  unint64_t v55 = v4 & 0xC000000000000001;
  uint64_t v6 = 4;
  while (1)
  {
    if (v55) {
      id v7 = (id)MEMORY[0x223CB3990](v6 - 4, v4);
    }
    else {
      id v7 = *(id *)(v4 + 8 * v6);
    }
    id v8 = v7;
    uint64_t v9 = v6 - 3;
    if (__OFADD__(v6 - 4, 1))
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    uint64_t v10 = sub_2232FC328(v7);
    if (!v11) {
      break;
    }
    uint64_t v12 = v10;
    uint64_t v13 = v11;
    double v14 = 0.0;
    if (v1[2])
    {
      unint64_t v15 = sub_2232FA5D8(v10, v11);
      if (v16) {
        double v14 = *(double *)(v1[7] + 8 * v15);
      }
    }
    id v56 = v8;
    if (!*(void *)(v2 + 16)) {
      goto LABEL_18;
    }
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_2232FCF60();
    double v18 = 1.0;
    if (v19) {
      double v18 = *(double *)(*(void *)(v2 + 56) + 8 * v17);
    }
    swift_bridgeObjectRelease();
    double v14 = v14 * v18;
    if (*(void *)(v2 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_2232FCF60();
      double v21 = 0.0;
      if (v22) {
        double v21 = *(double *)(*(void *)(v2 + 56) + 8 * v20);
      }
    }
    else
    {
LABEL_18:
      swift_bridgeObjectRetain();
      double v21 = 0.0;
    }
    swift_isUniquelyReferenced_nonNull_native();
    char v57 = (void *)v2;
    unint64_t v23 = sub_2232FCF60();
    uint64_t v25 = *(void *)(v2 + 16);
    BOOL v26 = (v24 & 1) == 0;
    uint64_t v2 = v25 + v26;
    if (__OFADD__(v25, v26)) {
      goto LABEL_40;
    }
    unint64_t v27 = v23;
    char v28 = v24;
    unint64_t v4 = sub_2232F34C8(&qword_267FA16D0);
    if (sub_22330C348())
    {
      unint64_t v29 = sub_2232FA5D8(v12, v13);
      if ((v28 & 1) != (v30 & 1)) {
        goto LABEL_49;
      }
      unint64_t v27 = v29;
    }
    uint64_t v2 = (uint64_t)v57;
    if (v28)
    {
      *(double *)(v57[7] + 8 * v27) = v21 + 1.0;
    }
    else
    {
      sub_2232FCFF0((uint64_t)&v57[v27 >> 6]);
      uint64_t v31 = (uint64_t *)(v57[6] + 16 * v27);
      *uint64_t v31 = v12;
      v31[1] = v13;
      *(void *)(v57[7] + 8 * v27) = v32;
      uint64_t v33 = v57[2];
      BOOL v34 = __OFADD__(v33, 1);
      uint64_t v35 = v33 + 1;
      if (v34) {
        goto LABEL_43;
      }
      v57[2] = v35;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    objc_msgSend(v56, sel_confidence);
    if (!v57[2]) {
      goto LABEL_41;
    }
    double v37 = v36;
    swift_bridgeObjectRetain();
    unint64_t v38 = sub_2232FCF60();
    if ((v39 & 1) == 0) {
      goto LABEL_48;
    }
    double v40 = *(double *)(v57[7] + 8 * v38);
    swift_bridgeObjectRelease();
    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v41 = sub_2232FA5D8(v12, v13);
    char v43 = v42;
    if (__OFADD__(v1[2], (v42 & 1) == 0)) {
      goto LABEL_42;
    }
    unint64_t v44 = v41;
    unint64_t v4 = v54;
    if (sub_22330C348())
    {
      unint64_t v45 = sub_2232FA5D8(v12, v13);
      if ((v43 & 1) != (v46 & 1)) {
        goto LABEL_49;
      }
      unint64_t v44 = v45;
    }
    if (v43)
    {
      *(double *)(v1[7] + 8 * v44) = (v14 + v37) / v40;
    }
    else
    {
      sub_2232FCFF0((uint64_t)&v1[v44 >> 6]);
      uint64_t v47 = (uint64_t *)(v1[6] + 16 * v44);
      *uint64_t v47 = v12;
      v47[1] = v13;
      *(void *)(v1[7] + 8 * v44) = v48;
      uint64_t v49 = v1[2];
      BOOL v34 = __OFADD__(v49, 1);
      uint64_t v50 = v49 + 1;
      if (v34) {
        goto LABEL_44;
      }
      v1[2] = v50;
      swift_bridgeObjectRetain();
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ++v6;
    if (v9 == v5) {
      goto LABEL_38;
    }
  }
  __break(1u);
LABEL_48:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_49:
  uint64_t result = sub_22330C438();
  __break(1u);
  return result;
}

uint64_t static BMContextualUnderstandingSoundAnalysis.soundHierarchyDictionary()()
{
  sub_2232F34C8(&qword_267FA16D8);
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 32) = 0x6F6964726F636361;
  *(void *)(v0 + 40) = 0xE90000000000006ELL;
  *(void *)(v0 + 64) = 0x63697473756F6361;
  *(void *)(v0 + 72) = 0xEF7261746975675FLL;
  *(void *)(v0 + 96) = 0x646E6F635F726961;
  *(void *)(v0 + 104) = 0xEF72656E6F697469;
  *(void *)(v0 + 128) = 0x6E726F685F726961;
  *(void *)(v0 + 160) = 0x7466617263726961;
  *(void *)(v0 + 192) = 0x656E616C70726961;
  *(void *)(v0 + 208) = 0x7466617263726961;
  *(void *)(v0 + 256) = 0x6C635F6D72616C61;
  *(void *)(v0 + 288) = 0x636E616C75626D61;
  *(void *)(v0 + 296) = 0xEF6E657269735F65;
  *(void *)(v0 + 352) = 0x657375616C707061;
  *(void *)(v0 + 368) = 0xD00000000000001CLL;
  *(void *)(v0 + 376) = 0x800000022330D5A0;
  strcpy((char *)(v0 + 384), "artillery_fire");
  *(unsigned char *)(v0 + 399) = -18;
  *(void *)(v0 + 408) = 0x800000022330D5C0;
  *(void *)(v0 + 416) = 0x656C62626162;
  *(void *)(v0 + 432) = 0xD00000000000001CLL;
  *(void *)(v0 + 440) = 0x800000022330D5A0;
  *(void *)(v0 + 448) = 0x7972635F79626162;
  *(void *)(v0 + 456) = 0xEB00000000676E69;
  strcpy((char *)(v0 + 464), "crying_sobbing");
  *(unsigned char *)(v0 + 479) = -18;
  strcpy((char *)(v0 + 480), "baby_laughter");
  *(_WORD *)(v0 + 494) = -4864;
  *(void *)(v0 + 512) = 0x7365706970676162;
  *(void *)(v0 + 544) = 0x6F6A6E6162;
  *(void *)(v0 + 584) = 0x800000022330D600;
  *(void *)(v0 + 608) = 0x7572645F73736162;
  *(void *)(v0 + 616) = 0xE90000000000006DLL;
  *(void *)(v0 + 640) = 0x6975675F73736162;
  *(void *)(v0 + 672) = 0x6E6F6F73736162;
  *(void *)(v0 + 712) = 0x800000022330D640;
  *(void *)(v0 + 736) = 0x635F656C74746162;
  *(void *)(v0 + 744) = 0xEA00000000007972;
  *(void *)(v0 + 768) = 0x786F625F74616562;
  *(void *)(v0 + 776) = 0xEB00000000676E69;
  *(void *)(v0 + 800) = 0x7A7A75625F656562;
  *(void *)(v0 + 832) = 1885693282;
  *(void *)(v0 + 896) = 0x616C5F796C6C6562;
  *(void *)(v0 + 904) = 0xEB00000000686775;
  *(void *)(v0 + 928) = 0x656C6379636962;
  strcpy((char *)(v0 + 960), "bicycle_bell");
  *(unsigned char *)(v0 + 973) = 0;
  *(_WORD *)(v0 + 974) = -5120;
  *(void *)(v0 + 1032) = 0x800000022330D700;
  *(void *)(v0 + 1048) = 0x800000022330D720;
  strcpy((char *)(v0 + 1056), "bird_flapping");
  *(void *)(v0 + 1088) = 0x7571735F64726962;
  *(void *)(v0 + 1096) = 0xEB000000006B7761;
  *(void *)(v0 + 1112) = 0x800000022330D720;
  *(void *)(v0 + 1128) = 0x800000022330D720;
  *(void *)(v0 + 1152) = 0x676E69746962;
  *(void *)(v0 + 1184) = 0x7265646E656C62;
  *(void *)(v0 + 1248) = 0x676E696C696F62;
  *(void *)(v0 + 1280) = 0x676E696F6F62;
  *(void *)(v0 + 1312) = 1836019554;
  strcpy((char *)(v0 + 1376), "bowling_impact");
  *(unsigned char *)(v0 + 1391) = -18;
  *(void *)(v0 + 1472) = 1886549346;
  *(void *)(v0 + 1504) = 7566690;
  *(void *)(v0 + 1536) = 0x6172656D6163;
  *(void *)(v0 + 1568) = 0x6E75675F706163;
  *(void *)(v0 + 1632) = 0x6E726F685F726163;
  strcpy((char *)(v0 + 1664), "car_passing_by");
  *(unsigned char *)(v0 + 1679) = -18;
  *(void *)(v0 + 1696) = 7627107;
  *(void *)(v0 + 1728) = 0x776F656D5F746163;
  *(void *)(v0 + 1744) = 7627107;
  *(void *)(v0 + 1760) = 0x727275705F746163;
  *(void *)(v0 + 1776) = 7627107;
  *(void *)(v0 + 1792) = 0x6F6C6C6563;
  *(void *)(v0 + 1824) = 0x7761736E69616863;
  *(void *)(v0 + 1856) = 0x72657474616863;
  *(void *)(v0 + 1888) = 0x676E697265656863;
  *(void *)(v0 + 1920) = 0x676E6977656863;
  strcpy((char *)(v0 + 1984), "chicken_cluck");
  *(_WORD *)(v0 + 1998) = -4864;
  strcpy((char *)(v0 + 2016), "child_singing");
  *(_WORD *)(v0 + 2030) = -4864;
  strcpy((char *)(v0 + 2048), "child_speech");
  *(unsigned char *)(v0 + 2061) = 0;
  *(_WORD *)(v0 + 2062) = -5120;
  *(void *)(v0 + 2088) = 0x800000022330D840;
  strcpy((char *)(v0 + 2144), "choir_singing");
  *(_WORD *)(v0 + 2158) = -4864;
  strcpy((char *)(v0 + 2176), "chopping_food");
  *(_WORD *)(v0 + 2190) = -4864;
  strcpy((char *)(v0 + 2208), "chopping_wood");
  *(_WORD *)(v0 + 2222) = -4864;
  *(void *)(v0 + 2240) = 0x5F656C6B63756863;
  *(void *)(v0 + 2248) = 0xEF656C74726F6863;
  *(void *)(v0 + 2272) = 0x625F686372756863;
  *(void *)(v0 + 2280) = 0xEB000000006C6C65;
  *(void *)(v0 + 2312) = 0x800000022330D860;
  *(void *)(v0 + 2336) = 0x676E697070616C63;
  *(void *)(v0 + 2368) = 0x74656E6972616C63;
  *(void *)(v0 + 2400) = 0x6B63696C63;
  *(void *)(v0 + 2432) = 0x6B636F6C63;
  strcpy((char *)(v0 + 2464), "coin_dropping");
  strcpy((char *)(v0 + 2496), "conversation");
  *(unsigned char *)(v0 + 2509) = 0;
  *(_WORD *)(v0 + 2510) = -5120;
  *(void *)(v0 + 2528) = 0x6867756F63;
  *(void *)(v0 + 2560) = 0x6F6F6D5F776F63;
  *(void *)(v0 + 2592) = 0x6C6C6562776F63;
  *(void *)(v0 + 2624) = 0x685F65746F796F63;
  *(void *)(v0 + 2632) = 0xEB000000006C776FLL;
  strcpy((char *)(v0 + 2656), "cricket_chirp");
  *(_WORD *)(v0 + 2670) = -4864;
  *(void *)(v0 + 2688) = 0x7761635F776F7263;
  *(void *)(v0 + 2720) = 0x64776F7263;
  *(void *)(v0 + 2760) = 0x800000022330D8A0;
  *(void *)(v0 + 2784) = 0x676E696873757263;
  strcpy((char *)(v0 + 2816), "crying_sobbing");
  *(unsigned char *)(v0 + 2831) = -18;
  *(void *)(v0 + 2856) = 0x800000022330D8E0;
  *(void *)(v0 + 2888) = 0x800000022330D900;
  *(void *)(v0 + 2944) = 0x6469726567646964;
  *(void *)(v0 + 2952) = 0xEA00000000006F6FLL;
  *(void *)(v0 + 3008) = 0x7263735F63736964;
  *(void *)(v0 + 3016) = 0xEF676E6968637461;
  *(void *)(v0 + 3048) = 0x800000022330D940;
  *(void *)(v0 + 3104) = 0x6B7261625F676F64;
  *(void *)(v0 + 3136) = 0x5F776F625F676F64;
  *(void *)(v0 + 3144) = 0xEB00000000776F77;
  *(void *)(v0 + 3168) = 0x776F72675F676F64;
  *(void *)(v0 + 3200) = 0x6C776F685F676F64;
  *(void *)(v0 + 3232) = 0x6D6968775F676F64;
  *(void *)(v0 + 3240) = 0xEB00000000726570;
  *(void *)(v0 + 3072) = 6778724;
  *(void *)(v0 + 3120) = 6778724;
  *(void *)(v0 + 3152) = 6778724;
  *(void *)(v0 + 3184) = 6778724;
  *(void *)(v0 + 3216) = 6778724;
  *(void *)(v0 + 3248) = 6778724;
  *(void *)(v0 + 1720) = 0x800000022330D800;
  *(void *)(v0 + 3096) = 0x800000022330D800;
  *(void *)(v0 + 3272) = 0x800000022330D800;
  *(void *)(v0 + 3360) = 0x6C65625F726F6F64;
  *(void *)(v0 + 3392) = 0x616C735F726F6F64;
  *(void *)(v0 + 3400) = 0xE90000000000006DLL;
  strcpy((char *)(v0 + 3424), "door_sliding");
  *(void *)(v0 + 3456) = 0x625F656C62756F64;
  *(void *)(v0 + 3464) = 0xEB00000000737361;
  *(void *)(v0 + 3496) = 0x800000022330D960;
  *(void *)(v0 + 3520) = 0x6C6C697264;
  *(void *)(v0 + 3584) = 0x74696B5F6D757264;
  *(void *)(v0 + 3616) = 0x6175715F6B637564;
  *(void *)(v0 + 3648) = 0x676E69746165;
  *(void *)(v0 + 1296) = 0xD00000000000001CLL;
  *(void *)(v0 + 1304) = 0x800000022330D5A0;
  *(void *)(v0 + 1336) = 0x800000022330D5C0;
  *(void *)(v0 + 3688) = 0xEF7261746975675FLL;
  *(unsigned char *)(v0 + 3727) = -18;
  *(void *)(v0 + 3680) = 0x6369727463656C65;
  strcpy((char *)(v0 + 3712), "electric_piano");
  *(void *)(v0 + 3744) = 0x6369727463656C65;
  *(void *)(v0 + 3752) = 0xEF7265766168735FLL;
  *(void *)(v0 + 3784) = 0x800000022330D9A0;
  *(void *)(v0 + 3808) = 0x6C6775625F6B6C65;
  *(void *)(v0 + 1592) = 0x800000022330D5C0;
  *(void *)(v0 + 3912) = 0x800000022330D9C0;
  strcpy((char *)(v0 + 3936), "engine_idling");
  *(_WORD *)(v0 + 3950) = -4864;
  *(void *)(v0 + 3968) = 0x6B5F656E69676E65;
  *(void *)(v0 + 3976) = 0xEF676E696B636F6ELL;
  *(void *)(v0 + 4000) = 0x735F656E69676E65;
  *(void *)(v0 + 4008) = 0xEF676E6974726174;
  *(void *)(v0 + 4032) = 0x6E6F697470757265;
  *(void *)(v0 + 4096) = 1953653094;
  *(unsigned char *)(v0 + 4143) = -18;
  strcpy((char *)(v0 + 4128), "female_singing");
  strcpy((char *)(v0 + 4160), "female_speech");
  *(_WORD *)(v0 + 4174) = -4864;
  *(void *)(v0 + 4192) = 0x735F7265676E6966;
  strcpy((char *)(v0 + 4256), "fire_crackle");
  *(void *)(v0 + 4224) = 1701996902;
  *(void *)(v0 + 4272) = 1701996902;
  *(void *)(v0 + 4296) = 0x800000022330DA00;
  *(void *)(v0 + 4320) = 0x6361726365726966;
  *(void *)(v0 + 4328) = 0xEB0000000072656BLL;
  *(void *)(v0 + 4352) = 0x6B726F7765726966;
  *(void *)(v0 + 4384) = 0x6574756C66;
  *(void *)(v0 + 4416) = 0x7A7A75625F796C66;
  *(void *)(v0 + 4448) = 0x6E726F68676F66;
  *(void *)(v0 + 4512) = 0x685F68636E657266;
  *(void *)(v0 + 4520) = 0xEB000000006E726FLL;
  *(void *)(v0 + 4576) = 0x6F72635F676F7266;
  *(void *)(v0 + 4584) = 0xEA00000000006B61;
  *(void *)(v0 + 4544) = 1735357030;
  *(void *)(v0 + 4592) = 1735357030;
  *(void *)(v0 + 4608) = 0x665F676E69797266;
  *(void *)(v0 + 4640) = 0x676E696C67726167;
  *(void *)(v0 + 4672) = 1886609767;
  *(void *)(v0 + 4704) = 0x676E696C67676967;
  strcpy((char *)(v0 + 4768), "glass_breaking");
  *(void *)(v0 + 4800) = 0x6C635F7373616C67;
  *(void *)(v0 + 4808) = 0xEB000000006B6E69;
  strcpy((char *)(v0 + 4736), "glass_abstract");
  strcpy((char *)(v0 + 4784), "glass_abstract");
  strcpy((char *)(v0 + 4816), "glass_abstract");
  strcpy((char *)(v0 + 4832), "glockenspiel");
  *(unsigned char *)(v0 + 4845) = 0;
  *(_WORD *)(v0 + 4846) = -5120;
  *(void *)(v0 + 4864) = 1735290727;
  *(void *)(v0 + 4896) = 0x6F685F65736F6F67;
  *(void *)(v0 + 4904) = 0xEA00000000006B6ELL;
  strcpy((char *)(v0 + 4960), "guitar_strum");
  *(unsigned char *)(v0 + 4973) = 0;
  *(_WORD *)(v0 + 4974) = -5120;
  strcpy((char *)(v0 + 4992), "guitar_tapping");
  *(unsigned char *)(v0 + 5007) = -18;
  *(void *)(v0 + 5024) = 0x5F746F68736E7567;
  *(void *)(v0 + 5032) = 0xEF657269666E7567;
  *(void *)(v0 + 1840) = 0x656E69676E65;
  *(void *)(v0 + 1872) = 0xD00000000000001CLL;
  *(void *)(v0 + 1880) = 0x800000022330D5A0;
  *(void *)(v0 + 1904) = 0xD00000000000001CLL;
  *(void *)(v0 + 1912) = 0x800000022330D5A0;
  *(void *)(v0 + 4056) = 0x800000022330D5C0;
  *(void *)(v0 + 4072) = 0x800000022330D5C0;
  *(void *)(v0 + 4344) = 0x800000022330D5C0;
  *(void *)(v0 + 4376) = 0x800000022330D5C0;
  *(void *)(v0 + 5048) = 0x800000022330D5C0;
  *(void *)(v0 + 5056) = 0x676E696C67727567;
  *(void *)(v0 + 5088) = 0x7972645F72696168;
  *(void *)(v0 + 5120) = 0x72656D6D6168;
  strcpy((char *)(v0 + 5152), "hammond_organ");
  *(_WORD *)(v0 + 5166) = -4864;
  *(void *)(v0 + 2352) = 0x73646E6168;
  *(void *)(v0 + 2448) = 0xD000000000000013;
  *(void *)(v0 + 2456) = 0x800000022330D520;
  *(_WORD *)(v0 + 2478) = -4864;
  *(void *)(v0 + 2480) = 0xD000000000000018;
  *(void *)(v0 + 4208) = 0x73646E6168;
  *(void *)(v0 + 5184) = 0x73646E6168;
  *(void *)(v0 + 5216) = 0x63696E6F6D726168;
  *(void *)(v0 + 5248) = 1886544232;
  *(void *)(v0 + 5280) = 0x6863697370726168;
  *(void *)(v0 + 4616) = 0xEB00000000646F6FLL;
  *(void *)(v0 + 5288) = 0xEB0000000064726FLL;
  *(void *)(v0 + 5312) = 0x6165627472616568;
  *(void *)(v0 + 5320) = 0xE900000000000074;
  strcpy((char *)(v0 + 5344), "hedge_trimmer");
  *(_WORD *)(v0 + 5358) = -4864;
  *(void *)(v0 + 5376) = 0x74706F63696C6568;
  *(void *)(v0 + 2192) = 0xD000000000000018;
  *(void *)(v0 + 2200) = 0x800000022330D660;
  *(void *)(v0 + 2424) = 0x800000022330D680;
  *(void *)(v0 + 2440) = 0xE500000000000000;
  strcpy((char *)(v0 + 2320), "alarm_abstract");
  *(unsigned char *)(v0 + 2335) = -18;
  *(void *)(v0 + 2344) = 0xE800000000000000;
  *(void *)(v0 + 2360) = 0xE500000000000000;
  *(void *)(v0 + 2408) = 0xE500000000000000;
  *(void *)(v0 + 2416) = 0xD000000000000020;
  *(void *)(v0 + 2376) = 0xE800000000000000;
  *(void *)(v0 + 2384) = 0x736E695F646E6977;
  *(void *)(v0 + 2392) = 0xEF746E656D757274;
  *(void *)(v0 + 5392) = 0x7466617263726961;
  *(void *)(v0 + 5408) = 0x7461685F6968;
  *(void *)(v0 + 2912) = 0x6C61626D7963;
  *(void *)(v0 + 5424) = 0x6C61626D7963;
  *(void *)(v0 + 5440) = 0x707563636968;
  *(void *)(v0 + 5472) = 0x6C635F6573726F68;
  *(void *)(v0 + 5480) = 0xEF706F6C635F7069;
  *(void *)(v0 + 5504) = 0x656E5F6573726F68;
  *(void *)(v0 + 5512) = 0xEB00000000686769;
  strcpy((char *)(v0 + 2224), "wood_abstract");
  *(void *)(v0 + 2296) = 0xE400000000000000;
  *(void *)(v0 + 2304) = 0xD000000000000013;
  *(void *)(v0 + 2736) = 0xD00000000000001CLL;
  *(void *)(v0 + 5536) = 0xD00000000000001CLL;
  *(_WORD *)(v0 + 2238) = -4864;
  *(void *)(v0 + 2256) = 0x726574686775616CLL;
  *(void *)(v0 + 2264) = 0xE800000000000000;
  *(void *)(v0 + 2288) = 1819043170;
  *(void *)(v0 + 2744) = 0x800000022330D5A0;
  *(void *)(v0 + 5544) = 0x800000022330D5A0;
  *(void *)(v0 + 5664) = 0x676E696D6D7568;
  strcpy((char *)(v0 + 5760), "keys_jangling");
  *(_WORD *)(v0 + 5774) = -4864;
  *(void *)(v0 + 5792) = 0x6B636F6E6BLL;
  *(void *)(v0 + 3328) = 1919905636;
  *(void *)(v0 + 3376) = 1919905636;
  *(void *)(v0 + 3408) = 1919905636;
  *(void *)(v0 + 3440) = 1919905636;
  *(void *)(v0 + 5808) = 1919905636;
  *(void *)(v0 + 5856) = 0x776F6D5F6E77616CLL;
  *(void *)(v0 + 2064) = 0x686365657073;
  *(void *)(v0 + 2072) = 0xE600000000000000;
  *(void *)(v0 + 2080) = 0xD000000000000011;
  *(void *)(v0 + 2160) = 0x676E69676E6973;
  *(void *)(v0 + 2168) = 0xE700000000000000;
  *(void *)(v0 + 2104) = 0xE500000000000000;
  *(void *)(v0 + 2112) = 0x656D696863;
  *(void *)(v0 + 2120) = 0xE500000000000000;
  *(void *)(v0 + 2128) = 1819043170;
  *(void *)(v0 + 2136) = 0xE400000000000000;
  *(void *)(v0 + 2096) = 0x74756F6873;
  *(void *)(v0 + 3872) = 0x656E69676E65;
  *(void *)(v0 + 3920) = 0x656E69676E65;
  *(void *)(v0 + 3952) = 0x656E69676E65;
  *(void *)(v0 + 3984) = 0x656E69676E65;
  *(void *)(v0 + 4016) = 0x656E69676E65;
  *(void *)(v0 + 5872) = 0x656E69676E65;
  *(void *)(v0 + 5888) = 0x616F725F6E6F696CLL;
  *(void *)(v0 + 2040) = 0xE700000000000000;
  *(void *)(v0 + 5896) = 0xE900000000000072;
  *(void *)(v0 + 5952) = 0x645F64697571696CLL;
  *(void *)(v0 + 2032) = 0x676E69676E6973;
  *(void *)(v0 + 2000) = 0xD000000000000013;
  *(void *)(v0 + 2008) = 0x800000022330D820;
  *(void *)(v0 + 4200) = 0xEF676E697070616ELL;
  *(void *)(v0 + 5960) = 0xEF676E6970706972;
  *(void *)(v0 + 1976) = 0xE400000000000000;
  *(void *)(v0 + 1936) = 0xD000000000000012;
  *(void *)(v0 + 1960) = 0x800000022330D820;
  *(void *)(v0 + 1968) = 1819766630;
  *(void *)(v0 + 1944) = 0x800000022330D740;
  *(void *)(v0 + 1952) = 0xD000000000000013;
  *(void *)(v0 + 5992) = 0x800000022330DA60;
  strcpy((char *)(v0 + 6016), "liquid_pouring");
  *(unsigned char *)(v0 + 6031) = -18;
  *(void *)(v0 + 1928) = 0xE700000000000000;
  *(void *)(v0 + 6056) = 0xEF676E6968736F6CLL;
  *(void *)(v0 + 1896) = 0xE800000000000000;
  *(void *)(v0 + 6088) = 0x800000022330DA80;
  *(void *)(v0 + 6048) = 0x735F64697571696CLL;
  *(void *)(v0 + 6112) = 0x735F64697571696CLL;
  *(void *)(v0 + 6120) = 0xEF676E6979617270;
  *(void *)(v0 + 1864) = 0xE700000000000000;
  *(void *)(v0 + 6152) = 0x800000022330DAA0;
  *(void *)(v0 + 1848) = 0xE600000000000000;
  *(void *)(v0 + 1816) = 0x800000022330D780;
  *(void *)(v0 + 1832) = 0xE800000000000000;
  *(void *)(v0 + 6184) = 0x800000022330DAC0;
  *(void *)(v0 + 1784) = 0xE300000000000000;
  *(void *)(v0 + 1800) = 0xE500000000000000;
  *(void *)(v0 + 1808) = 0xD000000000000017;
  strcpy((char *)(v0 + 6240), "male_singing");
  *(void *)(v0 + 1752) = 0xE300000000000000;
  *(void *)(v0 + 1768) = 0xE800000000000000;
  *(unsigned char *)(v0 + 6253) = 0;
  *(_WORD *)(v0 + 6254) = -5120;
  *(void *)(v0 + 6272) = 0x6570735F656C616DLL;
  *(void *)(v0 + 6280) = 0xEB00000000686365;
  *(void *)(v0 + 1736) = 0xE800000000000000;
  *(void *)(v0 + 6336) = 0x6E696C6F646E616DLL;
  *(void *)(v0 + 1712) = 0xD000000000000019;
  *(void *)(v0 + 6376) = 0x800000022330DAE0;
  *(unsigned char *)(v0 + 1693) = 0;
  *(_WORD *)(v0 + 1694) = -5120;
  *(void *)(v0 + 1704) = 0xE300000000000000;
  strcpy((char *)(v0 + 6400), "mechanical_fan");
  strcpy((char *)(v0 + 1680), "car_abstract");
  *(unsigned char *)(v0 + 6415) = -18;
  *(void *)(v0 + 1640) = 0xE800000000000000;
  strcpy((char *)(v0 + 1648), "car_abstract");
  *(unsigned char *)(v0 + 1661) = 0;
  *(_WORD *)(v0 + 1662) = -5120;
  strcpy((char *)(v0 + 1600), "car_abstract");
  *(unsigned char *)(v0 + 1613) = 0;
  *(_WORD *)(v0 + 1614) = -5120;
  *(void *)(v0 + 1616) = 0xD000000000000016;
  *(void *)(v0 + 1624) = 0x800000022330D7E0;
  strcpy((char *)(v0 + 6464), "microwave_oven");
  *(unsigned char *)(v0 + 6479) = -18;
  *(void *)(v0 + 1576) = 0xE700000000000000;
  *(void *)(v0 + 1584) = 0xD000000000000012;
  strcpy((char *)(v0 + 6496), "mosquito_buzz");
  *(_WORD *)(v0 + 6510) = -4864;
  *(void *)(v0 + 1544) = 0xE600000000000000;
  *(void *)(v0 + 1552) = 0xD000000000000013;
  *(void *)(v0 + 1560) = 0x800000022330D520;
  *(void *)(v0 + 1512) = 0xE300000000000000;
  *(void *)(v0 + 1520) = 0xD000000000000016;
  *(void *)(v0 + 1528) = 0x800000022330D7E0;
  *(void *)(v0 + 1488) = 0xD000000000000012;
  *(void *)(v0 + 1496) = 0x800000022330D740;
  *(void *)(v0 + 1400) = 0x800000022330D620;
  *(void *)(v0 + 1408) = 0xD000000000000010;
  *(void *)(v0 + 1480) = 0xE400000000000000;
  *(void *)(v0 + 1456) = 0xD00000000000001BLL;
  *(void *)(v0 + 1464) = 0x800000022330D7C0;
  *(void *)(v0 + 1440) = 0x6E69687461657262;
  *(void *)(v0 + 1448) = 0xE900000000000067;
  *(void *)(v0 + 1416) = 0x800000022330D7A0;
  *(void *)(v0 + 1424) = 0xD000000000000012;
  *(void *)(v0 + 1432) = 0x800000022330D500;
  *(void *)(v0 + 816) = 0x746365736E69;
  *(void *)(v0 + 1360) = 0xD000000000000012;
  *(void *)(v0 + 1368) = 0x800000022330D500;
  *(void *)(v0 + 1392) = 0xD000000000000018;
  *(void *)(v0 + 2672) = 0x746365736E69;
  *(void *)(v0 + 4432) = 0x746365736E69;
  *(void *)(v0 + 5696) = 0x746365736E69;
  *(void *)(v0 + 6512) = 0x746365736E69;
  *(void *)(v0 + 1344) = 0xD000000000000017;
  *(void *)(v0 + 1352) = 0x800000022330D780;
  *(void *)(v0 + 6568) = 0x800000022330DB00;
  *(void *)(v0 + 1320) = 0xE400000000000000;
  *(void *)(v0 + 1328) = 0xD000000000000012;
  *(void *)(v0 + 6592) = 0x637963726F746F6DLL;
  *(void *)(v0 + 6600) = 0xEA0000000000656CLL;
  strcpy((char *)(v0 + 6624), "mouse_patter");
  *(void *)(v0 + 1288) = 0xE600000000000000;
  *(void *)(v0 + 1264) = 0x615F64697571696CLL;
  *(void *)(v0 + 1272) = 0xEF74636172747362;
  *(void *)(v0 + 1216) = 0xD000000000000016;
  *(void *)(v0 + 1256) = 0xE700000000000000;
  *(void *)(v0 + 1224) = 0x800000022330D760;
  *(void *)(v0 + 1232) = 0xD000000000000010;
  *(void *)(v0 + 1240) = 0x800000022330D540;
  *(unsigned char *)(v0 + 6637) = 0;
  *(_WORD *)(v0 + 6638) = -5120;
  strcpy((char *)(v0 + 6784), "nose_blowing");
  *(void *)(v0 + 1192) = 0xE700000000000000;
  *(void *)(v0 + 1200) = 0xD000000000000018;
  *(void *)(v0 + 1208) = 0x800000022330D660;
  *(unsigned char *)(v0 + 6797) = 0;
  *(_WORD *)(v0 + 6798) = -5120;
  *(void *)(v0 + 1160) = 0xE600000000000000;
  *(void *)(v0 + 1168) = 0xD000000000000012;
  *(void *)(v0 + 1176) = 0x800000022330D740;
  *(void *)(v0 + 6816) = 1701798511;
  *(void *)(v0 + 1120) = 0xD000000000000011;
  *(void *)(v0 + 1136) = 1685219682;
  *(void *)(v0 + 1144) = 0xE400000000000000;
  *(void *)(v0 + 6848) = 0x6E6165636FLL;
  *(void *)(v0 + 6880) = 0x727473656863726FLL;
  *(void *)(v0 + 1080) = 0xE400000000000000;
  *(void *)(v0 + 1104) = 0xD000000000000011;
  *(void *)(v0 + 5224) = 0xE900000000000061;
  *(void *)(v0 + 6888) = 0xE900000000000061;
  *(void *)(v0 + 992) = 1685219682;
  *(_WORD *)(v0 + 1070) = -4864;
  *(void *)(v0 + 1072) = 1685219682;
  *(void *)(v0 + 1000) = 0xE400000000000000;
  *(void *)(v0 + 1008) = 0xD000000000000015;
  *(void *)(v0 + 1040) = 0xD000000000000011;
  *(void *)(v0 + 1016) = 0x800000022330D6E0;
  *(void *)(v0 + 1024) = 0xD000000000000010;
  *(void *)(v0 + 6656) = 0x636973756DLL;
  *(void *)(v0 + 6704) = 0x636973756DLL;
  *(void *)(v0 + 6896) = 0x636973756DLL;
  *(void *)(v0 + 944) = 0xD000000000000023;
  *(void *)(v0 + 976) = 1819043170;
  *(void *)(v0 + 984) = 0xE400000000000000;
  *(void *)(v0 + 952) = 0x800000022330D6B0;
  *(void *)(v0 + 6912) = 0x6E6167726FLL;
  *(void *)(v0 + 6944) = 0x746F6F685F6C776FLL;
  *(void *)(v0 + 920) = 0xE800000000000000;
  *(void *)(v0 + 936) = 0xE700000000000000;
  strcpy((char *)(v0 + 7008), "person_running");
  *(unsigned char *)(v0 + 7023) = -18;
  *(void *)(v0 + 912) = 0x726574686775616CLL;
  *(void *)(v0 + 864) = 1819043170;
  *(void *)(v0 + 872) = 0xE400000000000000;
  *(void *)(v0 + 880) = 0xD000000000000018;
  *(void *)(v0 + 888) = 0x800000022330D560;
  *(void *)(v0 + 840) = 0xE400000000000000;
  *(void *)(v0 + 848) = 0xD000000000000020;
  *(void *)(v0 + 856) = 0x800000022330D680;
  *(void *)(v0 + 7048) = 0x800000022330DB20;
  *(void *)(v0 + 400) = 0xD000000000000012;
  *(void *)(v0 + 792) = 0x800000022330D500;
  *(void *)(v0 + 808) = 0xE800000000000000;
  *(void *)(v0 + 824) = 0xE600000000000000;
  *(_OWORD *)(v0 + 16) = xmmword_22330CE20;
  *(void *)(v0 + 48) = 0xD000000000000012;
  *(void *)(v0 + 56) = 0x800000022330D500;
  *(void *)(v0 + 752) = 0x74756F6873;
  *(void *)(v0 + 760) = 0xE500000000000000;
  *(void *)(v0 + 784) = 0xD000000000000012;
  *(void *)(v0 + 80) = 0x726174697567;
  *(void *)(v0 + 88) = 0xE600000000000000;
  *(void *)(v0 + 704) = 0xD000000000000017;
  *(void *)(v0 + 720) = 0xD000000000000018;
  *(void *)(v0 + 728) = 0x800000022330D660;
  *(void *)(v0 + 112) = 0xD000000000000013;
  *(void *)(v0 + 120) = 0x800000022330D520;
  *(void *)(v0 + 664) = 0xE600000000000000;
  *(void *)(v0 + 680) = 0xE700000000000000;
  *(void *)(v0 + 688) = 0x736E695F646E6977;
  *(void *)(v0 + 696) = 0xEF746E656D757274;
  *(void *)(v0 + 632) = 0xE400000000000000;
  *(void *)(v0 + 648) = 0xEB00000000726174;
  *(void *)(v0 + 656) = 0x726174697567;
  *(void *)(v0 + 136) = 0xE800000000000000;
  *(void *)(v0 + 144) = 0x6B63757274;
  *(void *)(v0 + 152) = 0xE500000000000000;
  *(void *)(v0 + 560) = 0xD000000000000019;
  *(void *)(v0 + 624) = 1836413540;
  *(void *)(v0 + 568) = 0x800000022330D5E0;
  *(void *)(v0 + 576) = 0xD000000000000011;
  *(void *)(v0 + 592) = 0xD000000000000018;
  *(void *)(v0 + 600) = 0x800000022330D620;
  *(void *)(v0 + 168) = 0xE800000000000000;
  *(void *)(v0 + 176) = 0xD000000000000010;
  *(void *)(v0 + 520) = 0xE800000000000000;
  *(void *)(v0 + 528) = 0xD000000000000012;
  *(void *)(v0 + 536) = 0x800000022330D500;
  *(void *)(v0 + 552) = 0xE500000000000000;
  *(void *)(v0 + 184) = 0x800000022330D540;
  *(void *)(v0 + 200) = 0xE800000000000000;
  *(void *)(v0 + 216) = 0xE800000000000000;
  *(void *)(v0 + 496) = 0x726574686775616CLL;
  *(void *)(v0 + 504) = 0xE800000000000000;
  strcpy((char *)(v0 + 224), "alarm_abstract");
  *(unsigned char *)(v0 + 239) = -18;
  *(void *)(v0 + 240) = 0xD000000000000018;
  *(void *)(v0 + 248) = 0x800000022330D560;
  *(void *)(v0 + 264) = 0xEB000000006B636FLL;
  strcpy((char *)(v0 + 272), "alarm_abstract");
  *(unsigned char *)(v0 + 287) = -18;
  *(void *)(v0 + 424) = 0xE600000000000000;
  *(void *)(v0 + 304) = 0xD000000000000011;
  *(void *)(v0 + 312) = 0x800000022330D580;
  *(void *)(v0 + 320) = 0x615F6C616D696E61;
  *(void *)(v0 + 328) = 0xEF74636172747362;
  *(void *)(v0 + 336) = 1953460082;
  *(void *)(v0 + 344) = 0xE400000000000000;
  *(void *)(v0 + 360) = 0xE800000000000000;
  *(void *)(v0 + 2488) = 0x800000022330D660;
  *(void *)(v0 + 2512) = 0x686365657073;
  *(void *)(v0 + 2520) = 0xE600000000000000;
  *(void *)(v0 + 2536) = 0xE500000000000000;
  *(void *)(v0 + 2544) = 0xD00000000000001BLL;
  *(void *)(v0 + 2552) = 0x800000022330D7C0;
  *(void *)(v0 + 2568) = 0xE700000000000000;
  *(void *)(v0 + 2576) = 0xD00000000000001ALL;
  *(void *)(v0 + 2584) = 0x800000022330D880;
  *(void *)(v0 + 2600) = 0xE700000000000000;
  *(void *)(v0 + 2608) = 1819043170;
  *(void *)(v0 + 2616) = 0xE400000000000000;
  *(void *)(v0 + 2640) = 0xD000000000000015;
  *(void *)(v0 + 2648) = 0x800000022330D6E0;
  *(void *)(v0 + 2680) = 0xE600000000000000;
  *(void *)(v0 + 2696) = 0xE800000000000000;
  *(void *)(v0 + 2704) = 1685219682;
  *(void *)(v0 + 2712) = 0xE400000000000000;
  *(void *)(v0 + 2728) = 0xE500000000000000;
  *(void *)(v0 + 2752) = 0xD000000000000013;
  *(void *)(v0 + 2768) = 0xD000000000000020;
  *(void *)(v0 + 2776) = 0x800000022330D680;
  *(void *)(v0 + 2792) = 0xE800000000000000;
  *(void *)(v0 + 2800) = 0xD000000000000020;
  *(void *)(v0 + 2808) = 0x800000022330D680;
  *(void *)(v0 + 2832) = 0xD000000000000014;
  *(void *)(v0 + 2840) = 0x800000022330D8C0;
  *(void *)(v0 + 2848) = 0xD000000000000013;
  *(void *)(v0 + 2864) = 0xD000000000000018;
  *(void *)(v0 + 2872) = 0x800000022330D660;
  *(void *)(v0 + 2880) = 0xD000000000000012;
  *(void *)(v0 + 2896) = 0xD000000000000018;
  *(void *)(v0 + 2904) = 0x800000022330D660;
  *(void *)(v0 + 2920) = 0xE600000000000000;
  *(void *)(v0 + 2928) = 0x6973737563726570;
  *(void *)(v0 + 2936) = 0xEA00000000006E6FLL;
  *(void *)(v0 + 2960) = 0xD000000000000012;
  *(void *)(v0 + 2968) = 0x800000022330D500;
  *(void *)(v0 + 2976) = 0xD000000000000012;
  *(void *)(v0 + 2984) = 0x800000022330D740;
  *(void *)(v0 + 2992) = 0xD000000000000015;
  *(void *)(v0 + 3000) = 0x800000022330D920;
  *(void *)(v0 + 3024) = 0xD000000000000012;
  *(void *)(v0 + 3032) = 0x800000022330D500;
  *(void *)(v0 + 3040) = 0xD000000000000010;
  *(void *)(v0 + 3056) = 0xD000000000000018;
  *(void *)(v0 + 3064) = 0x800000022330D660;
  strcpy((char *)(v0 + 7072), "person_walking");
  *(unsigned char *)(v0 + 4783) = -18;
  *(unsigned char *)(v0 + 7087) = -18;
  *(void *)(v0 + 5576) = 0x800000022330DA40;
  *(void *)(v0 + 7032) = 0x800000022330DA40;
  *(void *)(v0 + 7064) = 0x800000022330DA40;
  *(void *)(v0 + 7096) = 0x800000022330DA40;
  *(void *)(v0 + 7104) = 0x6F6E616970;
  *(void *)(v0 + 7136) = 0x6B6E696F5F676970;
  *(void *)(v0 + 7168) = 0x645F6E6F65676970;
  *(void *)(v0 + 7176) = 0xEF6F6F635F65766FLL;
  *(void *)(v0 + 6960) = 1685219682;
  *(void *)(v0 + 7184) = 1685219682;
  *(void *)(v0 + 7208) = 0x800000022330DB40;
  *(unsigned char *)(v0 + 7247) = -18;
  *(unsigned char *)(v0 + 7279) = -18;
  *(void *)(v0 + 7304) = 0x800000022330DB60;
  strcpy((char *)(v0 + 7232), "playing_hockey");
  strcpy((char *)(v0 + 7264), "playing_squash");
  strcpy((char *)(v0 + 7328), "playing_tennis");
  *(unsigned char *)(v0 + 7343) = -18;
  *(void *)(v0 + 7368) = 0x800000022330DB80;
  strcpy((char *)(v0 + 7424), "police_siren");
  *(unsigned char *)(v0 + 7437) = 0;
  *(_WORD *)(v0 + 7438) = -5120;
  *(void *)(v0 + 3848) = 0x800000022330D580;
  *(void *)(v0 + 4312) = 0x800000022330D580;
  *(void *)(v0 + 7448) = 0x800000022330D580;
  *(void *)(v0 + 7456) = 0x6F745F7265776F70;
  *(void *)(v0 + 7464) = 0xEA00000000006C6FLL;
  strcpy((char *)(v0 + 7488), "power_windows");
  *(_WORD *)(v0 + 7502) = -4864;
  *(void *)(v0 + 7520) = 0x7265746E697270;
  strcpy((char *)(v0 + 7616), "railroad_car");
  *(void *)(v0 + 7784) = 0x800000022330DBC0;
  *(unsigned char *)(v0 + 3437) = 0;
  *(_WORD *)(v0 + 3438) = -5120;
  strcpy((char *)(v0 + 8160), "scuba_diving");
  *(unsigned char *)(v0 + 8173) = 0;
  *(_WORD *)(v0 + 8174) = -5120;
  *(void *)(v0 + 4360) = 0xE900000000000073;
  *(void *)(v0 + 8200) = 0xE900000000000073;
  strcpy((char *)(v0 + 8224), "sewing_machine");
  *(unsigned char *)(v0 + 8239) = -18;
  *(void *)(v0 + 8256) = 0x6C625F7065656873;
  *(void *)(v0 + 8264) = 0xEB00000000746165;
  *(void *)(v0 + 4504) = 0x800000022330D880;
  *(void *)(v0 + 5496) = 0x800000022330D880;
  *(void *)(v0 + 5528) = 0x800000022330D880;
  *(void *)(v0 + 6216) = 0x800000022330D880;
  *(void *)(v0 + 7160) = 0x800000022330D880;
  *(void *)(v0 + 8280) = 0x800000022330D880;
  *(void *)(v0 + 8288) = 0x7261666F6873;
  *(void *)(v0 + 8352) = 1751607667;
  *(void *)(v0 + 8384) = 0x65636E656C6973;
  strcpy((char *)(v0 + 8448), "singing_bowl");
  *(unsigned char *)(v0 + 8461) = 0;
  *(_WORD *)(v0 + 8462) = -5120;
  *(void *)(v0 + 8488) = 0x800000022330DC00;
  *(void *)(v0 + 8576) = 0x616F626574616B73;
  *(void *)(v0 + 6760) = 0x800000022330D6B0;
  *(void *)(v0 + 8600) = 0x800000022330D6B0;
  *(void *)(v0 + 8640) = 0x616D735F70616C73;
  *(unsigned char *)(v0 + 8719) = -18;
  *(void *)(v0 + 8736) = 0x69685F656B616E73;
  *(void *)(v0 + 8744) = 0xEA00000000007373;
  strcpy((char *)(v0 + 8768), "snake_rattle");
  *(void *)(v0 + 8800) = 0x72645F6572616E73;
  *(void *)(v0 + 8808) = 0xEA00000000006D75;
  *(void *)(v0 + 4720) = 0x726574686775616CLL;
  *(void *)(v0 + 5824) = 0x726574686775616CLL;
  *(void *)(v0 + 8880) = 0x726574686775616CLL;
  *(void *)(v0 + 9000) = 0x800000022330D680;
  *(void *)(v0 + 9008) = 1953460082;
  *(void *)(v0 + 8952) = 0x800000022330D560;
  *(void *)(v0 + 8960) = 0xD000000000000018;
  *(void *)(v0 + 8968) = 0x800000022330D560;
  *(void *)(v0 + 8976) = 1953460082;
  *(void *)(v0 + 8984) = 0xE400000000000000;
  *(void *)(v0 + 8992) = 0xD000000000000020;
  *(void *)(v0 + 4688) = 0x6E69687461657262;
  *(void *)(v0 + 8912) = 0x6E69687461657262;
  *(void *)(v0 + 8920) = 0xE900000000000067;
  *(void *)(v0 + 8928) = 0xD000000000000018;
  *(void *)(v0 + 8936) = 0x800000022330D620;
  *(void *)(v0 + 8944) = 0xD000000000000018;
  *(void *)(v0 + 8896) = 0x676E69726F6E73;
  *(void *)(v0 + 6808) = 0x800000022330D7C0;
  *(void *)(v0 + 8872) = 0xE700000000000000;
  *(void *)(v0 + 8888) = 0xE800000000000000;
  *(void *)(v0 + 8904) = 0xE700000000000000;
  *(void *)(v0 + 7816) = 0x800000022330D7C0;
  *(void *)(v0 + 8856) = 0x800000022330D7C0;
  *(void *)(v0 + 8864) = 0x72656B63696E73;
  *(void *)(v0 + 8840) = 0xE600000000000000;
  *(void *)(v0 + 8848) = 0xD00000000000001BLL;
  *(void *)(v0 + 8832) = 0x657A65656E73;
  *(unsigned char *)(v0 + 4269) = 0;
  *(_WORD *)(v0 + 4270) = -5120;
  *(void *)(v0 + 8816) = 1836413540;
  *(void *)(v0 + 8824) = 0xE400000000000000;
  *(unsigned char *)(v0 + 8781) = 0;
  *(_WORD *)(v0 + 8782) = -5120;
  *(void *)(v0 + 8752) = 0xD000000000000015;
  *(void *)(v0 + 8760) = 0x800000022330D6E0;
  *(void *)(v0 + 8784) = 0xD000000000000015;
  *(void *)(v0 + 8792) = 0x800000022330D6E0;
  *(void *)(v0 + 3672) = 0x800000022330D740;
  *(void *)(v0 + 4120) = 0x800000022330D740;
  *(void *)(v0 + 4664) = 0x800000022330D740;
  *(void *)(v0 + 5464) = 0x800000022330D740;
  strcpy((char *)(v0 + 8720), "alarm_abstract");
  *(unsigned char *)(v0 + 8735) = -18;
  *(void *)(v0 + 8696) = 0x800000022330D740;
  strcpy((char *)(v0 + 8704), "smoke_detector");
  *(void *)(v0 + 8680) = 0xE500000000000000;
  *(void *)(v0 + 8688) = 0xD000000000000012;
  *(void *)(v0 + 3624) = 0xEA00000000006B63;
  *(void *)(v0 + 8648) = 0xEA00000000006B63;
  *(void *)(v0 + 8672) = 0x7072756C73;
  *(void *)(v0 + 8656) = 0xD000000000000020;
  *(void *)(v0 + 8664) = 0x800000022330D680;
  *(void *)(v0 + 8608) = 0x676E69696B73;
  *(void *)(v0 + 8616) = 0xE600000000000000;
  *(void *)(v0 + 8624) = 0xD000000000000018;
  *(void *)(v0 + 8632) = 0x800000022330D620;
  *(void *)(v0 + 8584) = 0xEA00000000006472;
  *(void *)(v0 + 6752) = 0xD000000000000023;
  *(void *)(v0 + 8592) = 0xD000000000000023;
  *(void *)(v0 + 8560) = 0xD000000000000019;
  *(void *)(v0 + 8568) = 0x800000022330D5E0;
  *(void *)(v0 + 8544) = 0x7261746973;
  *(void *)(v0 + 8520) = 0xE500000000000000;
  strcpy((char *)(v0 + 8528), "alarm_abstract");
  *(unsigned char *)(v0 + 8543) = -18;
  *(void *)(v0 + 8552) = 0xE500000000000000;
  *(void *)(v0 + 8512) = 0x6E65726973;
  *(void *)(v0 + 5616) = 1953460082;
  *(void *)(v0 + 8472) = 0x800000022330D500;
  *(void *)(v0 + 8480) = 0xD000000000000014;
  *(void *)(v0 + 8496) = 0xD000000000000018;
  *(void *)(v0 + 8504) = 0x800000022330D660;
  *(void *)(v0 + 6672) = 1953460082;
  *(void *)(v0 + 6736) = 1953460082;
  *(void *)(v0 + 8424) = 0xE700000000000000;
  *(void *)(v0 + 8432) = 0xD000000000000014;
  *(void *)(v0 + 8440) = 0x800000022330D8C0;
  *(void *)(v0 + 8464) = 0xD000000000000012;
  *(void *)(v0 + 8400) = 1953460082;
  *(void *)(v0 + 4496) = 0xD00000000000001ALL;
  *(void *)(v0 + 8376) = 0x800000022330D8C0;
  *(void *)(v0 + 8392) = 0xE700000000000000;
  *(void *)(v0 + 8408) = 0xE400000000000000;
  *(void *)(v0 + 8416) = 0x676E69676E6973;
  *(void *)(v0 + 5488) = 0xD00000000000001ALL;
  *(void *)(v0 + 8328) = 0xE500000000000000;
  *(void *)(v0 + 8336) = 0xD000000000000014;
  *(void *)(v0 + 8344) = 0x800000022330D8C0;
  *(void *)(v0 + 8360) = 0xE400000000000000;
  *(void *)(v0 + 8368) = 0xD000000000000014;
  *(void *)(v0 + 5520) = 0xD00000000000001ALL;
  *(void *)(v0 + 6208) = 0xD00000000000001ALL;
  *(void *)(v0 + 8296) = 0xE600000000000000;
  *(void *)(v0 + 8304) = 0xD000000000000012;
  *(void *)(v0 + 8312) = 0x800000022330D500;
  *(void *)(v0 + 8320) = 0x74756F6873;
  *(void *)(v0 + 7152) = 0xD00000000000001ALL;
  *(void *)(v0 + 8272) = 0xD00000000000001ALL;
  *(void *)(v0 + 7224) = 0x800000022330D620;
  *(void *)(v0 + 7256) = 0x800000022330D620;
  *(void *)(v0 + 8240) = 0xD000000000000013;
  *(void *)(v0 + 8248) = 0x800000022330D520;
  *(void *)(v0 + 7288) = 0x800000022330D620;
  *(void *)(v0 + 7320) = 0x800000022330D620;
  *(void *)(v0 + 7352) = 0x800000022330D620;
  *(void *)(v0 + 8208) = 0x7265746177;
  *(void *)(v0 + 8216) = 0xE500000000000000;
  *(void *)(v0 + 7384) = 0x800000022330D620;
  *(void *)(v0 + 7960) = 0x800000022330D620;
  *(void *)(v0 + 8184) = 0x800000022330D620;
  *(void *)(v0 + 0x2000) = 0x657661775F616573;
  *(void *)(v0 + 8176) = 0xD000000000000018;
  *(void *)(v0 + 8128) = 0x6E696D6165726373;
  *(void *)(v0 + 8120) = 0x800000022330D660;
  *(void *)(v0 + 8136) = 0xE900000000000067;
  *(void *)(v0 + 8144) = 0xD000000000000014;
  *(void *)(v0 + 8152) = 0x800000022330D8C0;
  *(void *)(v0 + 8096) = 0x73726F7373696373;
  *(void *)(v0 + 8088) = 0xEF746E656D757274;
  *(void *)(v0 + 8104) = 0xE800000000000000;
  *(void *)(v0 + 8112) = 0xD000000000000018;
  *(void *)(v0 + 8064) = 0x6E6F68706F786173;
  strcpy((char *)(v0 + 8048), "tools_abstract");
  *(unsigned char *)(v0 + 8063) = -18;
  *(void *)(v0 + 8072) = 0xE900000000000065;
  *(void *)(v0 + 8080) = 0x736E695F646E6977;
  *(void *)(v0 + 8032) = 7823731;
  *(void *)(v0 + 8008) = 0xE700000000000000;
  *(void *)(v0 + 8016) = 0xD000000000000016;
  *(void *)(v0 + 8024) = 0x800000022330D760;
  *(void *)(v0 + 8040) = 0xE300000000000000;
  *(void *)(v0 + 6584) = 0x800000022330D760;
  *(void *)(v0 + 7992) = 0x800000022330D760;
  *(void *)(v0 + 8000) = 0x676E696C696173;
  *(void *)(v0 + 7984) = 0xD000000000000016;
  *(void *)(v0 + 7976) = 0x800000022330DBE0;
  *(void *)(v0 + 7952) = 0xD000000000000018;
  *(void *)(v0 + 7968) = 0xD000000000000013;
  strcpy((char *)(v0 + 7904), "rooster_crow");
  *(void *)(v0 + 7928) = 0x800000022330D820;
  strcpy((char *)(v0 + 7936), "rope_skipping");
  *(void *)(v0 + 7920) = 0xD000000000000013;
  *(_WORD *)(v0 + 7950) = -4864;
  *(unsigned char *)(v0 + 7917) = 0;
  *(_WORD *)(v0 + 7918) = -5120;
  *(void *)(v0 + 7888) = 0x6E6F6870656C6574;
  *(void *)(v0 + 7896) = 0xE900000000000065;
  *(_WORD *)(v0 + 7854) = -4864;
  *(void *)(v0 + 7872) = 0x656E6F74676E6972;
  *(void *)(v0 + 7856) = 0x6B63757274;
  *(void *)(v0 + 7864) = 0xE500000000000000;
  *(void *)(v0 + 7880) = 0xE800000000000000;
  strcpy((char *)(v0 + 7840), "reverse_beeps");
  *(void *)(v0 + 3904) = 0xD00000000000001BLL;
  *(void *)(v0 + 6800) = 0xD00000000000001BLL;
  *(void *)(v0 + 7824) = 0xD000000000000015;
  *(void *)(v0 + 7832) = 0x800000022330D920;
  *(void *)(v0 + 7808) = 0xD00000000000001BLL;
  *(void *)(v0 + 7792) = 0x6973737563726570;
  *(void *)(v0 + 7800) = 0xEA00000000006E6FLL;
  *(void *)(v0 + 7752) = 0x800000022330DBA0;
  *(void *)(v0 + 7744) = 0xD000000000000010;
  *(void *)(v0 + 7760) = 0xD000000000000013;
  *(void *)(v0 + 7768) = 0x800000022330D520;
  *(void *)(v0 + 7776) = 0xD000000000000011;
  *(void *)(v0 + 7712) = 0x676E6970706172;
  *(void *)(v0 + 7704) = 0xE500000000000000;
  *(void *)(v0 + 7720) = 0xE700000000000000;
  *(void *)(v0 + 7728) = 0x676E69676E6973;
  *(void *)(v0 + 7736) = 0xE700000000000000;
  *(void *)(v0 + 7680) = 0x706F72646E696172;
  *(void *)(v0 + 7672) = 0xE500000000000000;
  *(void *)(v0 + 7688) = 0xE800000000000000;
  *(void *)(v0 + 7696) = 0x7265746177;
  *(void *)(v0 + 7648) = 1852399986;
  *(void *)(v0 + 7632) = 0x6E69617274;
  *(void *)(v0 + 7640) = 0xE500000000000000;
  *(void *)(v0 + 7656) = 0xE400000000000000;
  *(void *)(v0 + 7664) = 0x7265746177;
  *(unsigned char *)(v0 + 7629) = 0;
  *(_WORD *)(v0 + 7630) = -5120;
  *(void *)(v0 + 7560) = 0xE800000000000000;
  strcpy((char *)(v0 + 7568), "car_abstract");
  *(void *)(v0 + 7600) = 0xD000000000000010;
  *(void *)(v0 + 7608) = 0x800000022330D540;
  *(unsigned char *)(v0 + 7581) = 0;
  *(_WORD *)(v0 + 7582) = -5120;
  strcpy((char *)(v0 + 7584), "rail_transport");
  *(unsigned char *)(v0 + 7599) = -18;
  *(void *)(v0 + 7552) = 0x7261635F65636172;
  *(void *)(v0 + 4176) = 0x686365657073;
  *(void *)(v0 + 6288) = 0x686365657073;
  *(void *)(v0 + 7528) = 0xE700000000000000;
  *(void *)(v0 + 7536) = 0xD000000000000013;
  *(void *)(v0 + 7544) = 0x800000022330D520;
  *(void *)(v0 + 9024) = 0x686365657073;
  strcpy((char *)(v0 + 7504), "car_abstract");
  *(unsigned char *)(v0 + 7517) = 0;
  *(_WORD *)(v0 + 7518) = -5120;
  *(void *)(v0 + 9056) = 0x6B6165757173;
  *(void *)(v0 + 9096) = 0x800000022330DC20;
  strcpy((char *)(v0 + 7472), "tools_abstract");
  *(unsigned char *)(v0 + 7487) = -18;
  *(void *)(v0 + 3696) = 0x726174697567;
  *(void *)(v0 + 4928) = 0x726174697567;
  *(void *)(v0 + 4976) = 0x726174697567;
  *(void *)(v0 + 5008) = 0x726174697567;
  *(void *)(v0 + 7416) = 0x800000022330D500;
  *(void *)(v0 + 7440) = 0xD000000000000011;
  *(void *)(v0 + 9104) = 0x726174697567;
  *(void *)(v0 + 9120) = 0x6E61706C65657473;
  *(void *)(v0 + 7392) = 0xD000000000000019;
  *(void *)(v0 + 7400) = 0x800000022330D5E0;
  *(void *)(v0 + 7408) = 0xD000000000000012;
  *(void *)(v0 + 9152) = 0x625F6D6165727473;
  *(void *)(v0 + 9160) = 0xEF676E696C627275;
  *(void *)(v0 + 7360) = 0xD000000000000012;
  *(void *)(v0 + 7376) = 0xD000000000000018;
  strcpy((char *)(v0 + 9184), "subway_metro");
  *(unsigned char *)(v0 + 9197) = 0;
  *(_WORD *)(v0 + 9198) = -5120;
  *(void *)(v0 + 7344) = 0xD000000000000018;
  *(void *)(v0 + 9216) = 0x69736568746E7973;
  *(void *)(v0 + 9224) = 0xEB0000000072657ALL;
  *(void *)(v0 + 7312) = 0xD000000000000018;
  *(void *)(v0 + 3736) = 0x800000022330D980;
  *(void *)(v0 + 3800) = 0x800000022330D980;
  *(void *)(v0 + 7280) = 0xD000000000000018;
  *(void *)(v0 + 7296) = 0xD000000000000014;
  *(void *)(v0 + 5176) = 0x800000022330D980;
  *(void *)(v0 + 5304) = 0x800000022330D980;
  *(void *)(v0 + 5736) = 0x800000022330D980;
  *(void *)(v0 + 6936) = 0x800000022330D980;
  *(void *)(v0 + 7216) = 0xD000000000000018;
  *(void *)(v0 + 7248) = 0xD000000000000018;
  *(void *)(v0 + 7128) = 0x800000022330D980;
  *(void *)(v0 + 9240) = 0x800000022330D980;
  *(void *)(v0 + 9248) = 0x616C626174;
  *(void *)(v0 + 7192) = 0xE400000000000000;
  *(void *)(v0 + 7200) = 0xD000000000000011;
  *(void *)(v0 + 9280) = 0x6972756F626D6174;
  *(void *)(v0 + 3568) = 0x6973737563726570;
  *(void *)(v0 + 3600) = 0x6973737563726570;
  *(void *)(v0 + 4880) = 0x6973737563726570;
  *(void *)(v0 + 7144) = 0xE800000000000000;
  *(void *)(v0 + 6320) = 0x6973737563726570;
  *(void *)(v0 + 6976) = 0x6973737563726570;
  *(void *)(v0 + 9296) = 0x6973737563726570;
  *(void *)(v0 + 7088) = 0xD000000000000019;
  *(void *)(v0 + 7112) = 0xE500000000000000;
  *(void *)(v0 + 7120) = 0xD000000000000010;
  *(void *)(v0 + 9312) = 7364980;
  *(void *)(v0 + 3080) = 0xE300000000000000;
  *(void *)(v0 + 3128) = 0xE300000000000000;
  *(void *)(v0 + 7040) = 0xD000000000000010;
  *(void *)(v0 + 7056) = 0xD000000000000019;
  *(void *)(v0 + 3160) = 0xE300000000000000;
  *(void *)(v0 + 3192) = 0xE300000000000000;
  *(void *)(v0 + 6984) = 0xEA00000000006E6FLL;
  *(void *)(v0 + 6992) = 0xD000000000000012;
  *(void *)(v0 + 7000) = 0x800000022330D500;
  *(void *)(v0 + 7024) = 0xD000000000000019;
  *(void *)(v0 + 3224) = 0xE300000000000000;
  *(void *)(v0 + 3256) = 0xE300000000000000;
  *(void *)(v0 + 9320) = 0xE300000000000000;
  *(void *)(v0 + 6952) = 0xE800000000000000;
  *(void *)(v0 + 6968) = 0xE400000000000000;
  *(void *)(v0 + 9344) = 0x676E6972616574;
  strcpy((char *)(v0 + 4464), "alarm_abstract");
  strcpy((char *)(v0 + 9392), "alarm_abstract");
  *(void *)(v0 + 6928) = 0xD000000000000010;
  *(void *)(v0 + 9416) = 0x800000022330DC40;
  *(void *)(v0 + 6904) = 0xE500000000000000;
  *(void *)(v0 + 6920) = 0xE500000000000000;
  *(void *)(v0 + 9376) = 0x6E6F6870656C6574;
  *(void *)(v0 + 9424) = 0x6E6F6870656C6574;
  *(void *)(v0 + 9440) = 0x6E696D6572656874;
  *(void *)(v0 + 6856) = 0xE500000000000000;
  *(void *)(v0 + 6864) = 0x7265746177;
  *(void *)(v0 + 6872) = 0xE500000000000000;
  *(void *)(v0 + 9472) = 0x68745F706D756874;
  *(void *)(v0 + 6824) = 0xE400000000000000;
  *(void *)(v0 + 6832) = 0x736E695F646E6977;
  *(void *)(v0 + 6840) = 0xEF746E656D757274;
  *(void *)(v0 + 9480) = 0xEA00000000006475;
  *(void *)(v0 + 9504) = 0x7265646E756874;
  strcpy((char *)(v0 + 9520), "thunderstorm");
  strcpy((char *)(v0 + 9536), "thunderstorm");
  *(unsigned char *)(v0 + 9533) = 0;
  *(_WORD *)(v0 + 9534) = -5120;
  *(unsigned char *)(v0 + 9549) = 0;
  *(_WORD *)(v0 + 9550) = -5120;
  *(void *)(v0 + 6768) = 0xD000000000000010;
  *(void *)(v0 + 6776) = 0x800000022330D540;
  *(void *)(v0 + 9568) = 1801677172;
  *(void *)(v0 + 9600) = 0x636F745F6B636974;
  *(void *)(v0 + 6744) = 0xE400000000000000;
  *(void *)(v0 + 6696) = 0x800000022330D500;
  *(void *)(v0 + 6712) = 0xE500000000000000;
  *(void *)(v0 + 6720) = 0xD000000000000016;
  *(void *)(v0 + 6728) = 0x800000022330D9E0;
  *(void *)(v0 + 9608) = 0xE90000000000006BLL;
  *(void *)(v0 + 6648) = 0x800000022330D6E0;
  *(void *)(v0 + 6664) = 0xE500000000000000;
  *(void *)(v0 + 6680) = 0xE400000000000000;
  *(void *)(v0 + 6688) = 0xD000000000000012;
  *(void *)(v0 + 6424) = 0x800000022330D520;
  *(void *)(v0 + 6440) = 0x800000022330D520;
  *(void *)(v0 + 6608) = 0xD000000000000016;
  *(void *)(v0 + 6616) = 0x800000022330D7E0;
  *(void *)(v0 + 6640) = 0xD000000000000015;
  *(void *)(v0 + 9592) = 0x800000022330D520;
  *(void *)(v0 + 9624) = 0x800000022330D520;
  *(void *)(v0 + 9632) = 0x696E61706D6974;
  *(void *)(v0 + 3552) = 1836413540;
  *(void *)(v0 + 6560) = 0xD000000000000013;
  *(void *)(v0 + 6576) = 0xD000000000000016;
  *(void *)(v0 + 6520) = 0xE600000000000000;
  *(void *)(v0 + 6528) = 0xD000000000000016;
  *(void *)(v0 + 6536) = 0x800000022330D7E0;
  *(void *)(v0 + 6544) = 0xD000000000000010;
  *(void *)(v0 + 6552) = 0x800000022330D540;
  *(void *)(v0 + 9264) = 1836413540;
  *(void *)(v0 + 9648) = 1836413540;
  strcpy((char *)(v0 + 9664), "toilet_flush");
  *(void *)(v0 + 6480) = 0xD000000000000018;
  *(void *)(v0 + 6488) = 0x800000022330D660;
  *(unsigned char *)(v0 + 9677) = 0;
  *(_WORD *)(v0 + 9678) = -5120;
  strcpy((char *)(v0 + 3536), "tools_abstract");
  strcpy((char *)(v0 + 5136), "tools_abstract");
  strcpy((char *)(v0 + 5360), "tools_abstract");
  *(void *)(v0 + 6448) = 0xD000000000000018;
  *(void *)(v0 + 6456) = 0x800000022330D560;
  strcpy((char *)(v0 + 9696), "tools_abstract");
  *(unsigned char *)(v0 + 3551) = -18;
  *(void *)(v0 + 6416) = 0xD000000000000013;
  *(void *)(v0 + 6432) = 0xD000000000000013;
  *(unsigned char *)(v0 + 4479) = -18;
  *(void *)(v0 + 6368) = 0xD000000000000011;
  *(void *)(v0 + 6384) = 0xD000000000000011;
  *(void *)(v0 + 6392) = 0x800000022330DA20;
  *(unsigned char *)(v0 + 4751) = -18;
  *(unsigned char *)(v0 + 4799) = -18;
  *(void *)(v0 + 6328) = 0xEA00000000006E6FLL;
  *(void *)(v0 + 6344) = 0xE800000000000000;
  *(void *)(v0 + 6352) = 0xD000000000000019;
  *(void *)(v0 + 6360) = 0x800000022330D5E0;
  *(unsigned char *)(v0 + 4831) = -18;
  *(unsigned char *)(v0 + 5151) = -18;
  *(unsigned char *)(v0 + 5375) = -18;
  *(void *)(v0 + 6296) = 0xE600000000000000;
  *(void *)(v0 + 6304) = 0xD000000000000011;
  *(void *)(v0 + 6312) = 0x800000022330DA20;
  *(unsigned char *)(v0 + 9407) = -18;
  *(unsigned char *)(v0 + 9711) = -18;
  *(void *)(v0 + 9728) = 0x75726268746F6F74;
  *(void *)(v0 + 6256) = 0x676E69676E6973;
  *(void *)(v0 + 6264) = 0xE700000000000000;
  *(void *)(v0 + 9736) = 0xEA00000000006873;
  strcpy((char *)(v0 + 9760), "traffic_noise");
  *(void *)(v0 + 6224) = 0x615F6C616D696E61;
  *(void *)(v0 + 6232) = 0xEF74636172747362;
  *(_WORD *)(v0 + 9774) = -4864;
  *(void *)(v0 + 6176) = 0xD000000000000016;
  *(void *)(v0 + 6192) = 0x615F64697571696CLL;
  *(void *)(v0 + 6200) = 0xEF74636172747362;
  *(void *)(v0 + 9824) = 0x6F685F6E69617274;
  *(void *)(v0 + 9832) = 0xEA00000000006E72;
  *(void *)(v0 + 6128) = 0x615F64697571696CLL;
  *(void *)(v0 + 6160) = 0x615F64697571696CLL;
  *(void *)(v0 + 6168) = 0xEF74636172747362;
  *(void *)(v0 + 6136) = 0xEF74636172747362;
  *(void *)(v0 + 6144) = 0xD000000000000010;
  *(void *)(v0 + 9864) = 0x800000022330DC60;
  *(void *)(v0 + 6064) = 0x615F64697571696CLL;
  *(void *)(v0 + 6072) = 0xEF74636172747362;
  *(void *)(v0 + 6080) = 0xD000000000000010;
  *(void *)(v0 + 6096) = 0x615F64697571696CLL;
  *(void *)(v0 + 6104) = 0xEF74636172747362;
  strcpy((char *)(v0 + 9200), "rail_transport");
  strcpy((char *)(v0 + 9808), "rail_transport");
  strcpy((char *)(v0 + 9872), "rail_transport");
  *(void *)(v0 + 6032) = 0x615F64697571696CLL;
  *(void *)(v0 + 6040) = 0xEF74636172747362;
  *(unsigned char *)(v0 + 9215) = -18;
  *(unsigned char *)(v0 + 9823) = -18;
  *(unsigned char *)(v0 + 9887) = -18;
  *(void *)(v0 + 5976) = 0xEF74636172747362;
  *(void *)(v0 + 5984) = 0xD000000000000018;
  *(void *)(v0 + 6000) = 0x615F64697571696CLL;
  *(void *)(v0 + 6008) = 0xEF74636172747362;
  strcpy((char *)(v0 + 9888), "train_whistle");
  *(void *)(v0 + 5936) = 0xD000000000000018;
  *(void *)(v0 + 5944) = 0x800000022330D560;
  *(void *)(v0 + 5968) = 0x615F64697571696CLL;
  *(_WORD *)(v0 + 9902) = -4864;
  *(void *)(v0 + 5904) = 0xD000000000000015;
  *(void *)(v0 + 5912) = 0x800000022330D6E0;
  *(void *)(v0 + 5920) = 0x615F64697571696CLL;
  *(void *)(v0 + 5928) = 0xEF74636172747362;
  *(void *)(v0 + 9792) = 0x6E69617274;
  *(void *)(v0 + 9840) = 0x6E69617274;
  *(void *)(v0 + 9904) = 0x6E69617274;
  *(void *)(v0 + 5864) = 0xEA00000000007265;
  *(void *)(v0 + 5880) = 0xE600000000000000;
  *(void *)(v0 + 9920) = 0x656E6F626D6F7274;
  *(void *)(v0 + 9952) = 0x6B63757274;
  *(void *)(v0 + 5816) = 0xE400000000000000;
  *(void *)(v0 + 5832) = 0xE800000000000000;
  *(void *)(v0 + 5840) = 0xD000000000000014;
  *(void *)(v0 + 5848) = 0x800000022330D8C0;
  *(void *)(v0 + 3864) = 0x800000022330D7E0;
  *(void *)(v0 + 9784) = 0x800000022330D7E0;
  *(void *)(v0 + 9976) = 0x800000022330D7E0;
  *(void *)(v0 + 5776) = 0xD000000000000018;
  *(void *)(v0 + 5784) = 0x800000022330D660;
  *(void *)(v0 + 5800) = 0xE500000000000000;
  *(void *)(v0 + 9984) = 0x7465706D757274;
  *(void *)(v0 + 5720) = 0x800000022330D6E0;
  *(void *)(v0 + 5728) = 0xD000000000000010;
  *(void *)(v0 + 5744) = 0xD000000000000012;
  *(void *)(v0 + 5752) = 0x800000022330D500;
  *(void *)(v0 + 4536) = 0x800000022330D7A0;
  *(void *)(v0 + 5672) = 0xE700000000000000;
  *(void *)(v0 + 5680) = 0xD000000000000014;
  *(void *)(v0 + 5688) = 0x800000022330D8C0;
  *(void *)(v0 + 5704) = 0xE600000000000000;
  *(void *)(v0 + 5712) = 0xD000000000000015;
  *(void *)(v0 + 9944) = 0x800000022330D7A0;
  *(void *)(v0 + 10008) = 0x800000022330D7A0;
  *(void *)(v0 + 5632) = 0xD000000000000014;
  *(void *)(v0 + 5640) = 0x800000022330D8C0;
  *(void *)(v0 + 5648) = 0xD000000000000015;
  *(void *)(v0 + 5656) = 0x800000022330D920;
  *(void *)(v0 + 10016) = 0x665F676E696E7574;
  *(void *)(v0 + 5592) = 0x800000022330D920;
  *(void *)(v0 + 5600) = 0xD000000000000015;
  *(void *)(v0 + 5608) = 0x800000022330D920;
  *(void *)(v0 + 5624) = 0xE400000000000000;
  *(void *)(v0 + 10024) = 0xEB000000006B726FLL;
  *(void *)(v0 + 5560) = 0x800000022330D920;
  *(void *)(v0 + 5568) = 0xD000000000000019;
  *(void *)(v0 + 5584) = 0xD000000000000015;
  strcpy((char *)(v0 + 10048), "turkey_gobble");
  *(_WORD *)(v0 + 10062) = -4864;
  *(void *)(v0 + 3632) = 1819766630;
  *(void *)(v0 + 4480) = 1819766630;
  *(void *)(v0 + 5552) = 0xD000000000000015;
  *(void *)(v0 + 4912) = 1819766630;
  *(void *)(v0 + 10064) = 1819766630;
  *(void *)(v0 + 10080) = 0x7469727765707974;
  *(void *)(v0 + 5096) = 0xEA00000000007265;
  *(void *)(v0 + 5384) = 0xEA00000000007265;
  *(void *)(v0 + 10088) = 0xEA00000000007265;
  *(void *)(v0 + 10152) = 0x800000022330DC80;
  *(void *)(v0 + 5432) = 0xE600000000000000;
  *(void *)(v0 + 5448) = 0xE600000000000000;
  *(void *)(v0 + 5456) = 0xD000000000000012;
  *(void *)(v0 + 10096) = 0x676E69707974;
  *(void *)(v0 + 10112) = 0x676E69707974;
  *(void *)(v0 + 10160) = 0x676E69707974;
  *(void *)(v0 + 10176) = 0x656C656C756B75;
  *(void *)(v0 + 5416) = 0xE600000000000000;
  *(void *)(v0 + 10216) = 0x800000022330DCA0;
  strcpy((char *)(v0 + 10240), "vacuum_cleaner");
  *(void *)(v0 + 5400) = 0xE800000000000000;
  *(unsigned char *)(v0 + 10255) = -18;
  *(void *)(v0 + 10280) = 0x800000022330D540;
  *(void *)(v0 + 10312) = 0x800000022330DCC0;
  strcpy((char *)(v0 + 10320), "car_abstract");
  *(unsigned char *)(v0 + 10333) = 0;
  *(_WORD *)(v0 + 10334) = -5120;
  *(void *)(v0 + 5328) = 0xD000000000000015;
  *(void *)(v0 + 5336) = 0x800000022330D920;
  *(void *)(v0 + 10336) = 0x6F68706172626976;
  *(void *)(v0 + 9288) = 0xEA0000000000656ELL;
  *(void *)(v0 + 10344) = 0xEA0000000000656ELL;
  *(void *)(v0 + 5296) = 0xD000000000000010;
  *(void *)(v0 + 3488) = 0xD000000000000011;
  *(void *)(v0 + 5232) = 0xD000000000000012;
  *(void *)(v0 + 5240) = 0x800000022330D500;
  *(void *)(v0 + 5256) = 0xE400000000000000;
  *(void *)(v0 + 5264) = 0xD000000000000012;
  *(void *)(v0 + 5272) = 0x800000022330D500;
  *(void *)(v0 + 3840) = 0xD000000000000011;
  *(void *)(v0 + 4288) = 0xD000000000000011;
  *(void *)(v0 + 4304) = 0xD000000000000011;
  *(void *)(v0 + 5192) = 0xE500000000000000;
  *(void *)(v0 + 5200) = 0xD000000000000015;
  *(void *)(v0 + 5208) = 0x800000022330D920;
  *(void *)(v0 + 4848) = 0xD000000000000011;
  *(void *)(v0 + 9136) = 0xD000000000000011;
  *(void *)(v0 + 10352) = 0xD000000000000011;
  *(void *)(v0 + 4856) = 0x800000022330DA20;
  *(void *)(v0 + 5168) = 0xD000000000000010;
  *(void *)(v0 + 9144) = 0x800000022330DA20;
  *(void *)(v0 + 10360) = 0x800000022330DA20;
  strcpy((char *)(v0 + 10368), "violin_fiddle");
  *(void *)(v0 + 5104) = 0xD000000000000018;
  *(void *)(v0 + 5112) = 0x800000022330D660;
  *(void *)(v0 + 5128) = 0xE600000000000000;
  *(_WORD *)(v0 + 10382) = -4864;
  *(void *)(v0 + 3472) = 0xD000000000000017;
  *(void *)(v0 + 5064) = 0xE800000000000000;
  *(void *)(v0 + 5072) = 0x7265746177;
  *(void *)(v0 + 5080) = 0xE500000000000000;
  *(void *)(v0 + 10384) = 0xD000000000000017;
  *(void *)(v0 + 3480) = 0x800000022330D780;
  *(void *)(v0 + 10392) = 0x800000022330D780;
  *(void *)(v0 + 10432) = 0x75705F7265746177;
  *(void *)(v0 + 5040) = 0xD000000000000012;
  *(void *)(v0 + 10440) = 0xEA0000000000706DLL;
  *(void *)(v0 + 10224) = 0x615F64697571696CLL;
  *(void *)(v0 + 10448) = 0x615F64697571696CLL;
  *(void *)(v0 + 4984) = 0xE600000000000000;
  *(void *)(v0 + 5016) = 0xE600000000000000;
  *(void *)(v0 + 3728) = 0xD000000000000010;
  *(void *)(v0 + 3776) = 0xD000000000000010;
  *(void *)(v0 + 3792) = 0xD000000000000010;
  *(void *)(v0 + 4936) = 0xE600000000000000;
  *(void *)(v0 + 4944) = 0xD000000000000019;
  *(void *)(v0 + 4952) = 0x800000022330D5E0;
  *(void *)(v0 + 4528) = 0xD000000000000010;
  *(void *)(v0 + 4888) = 0xEA00000000006E6FLL;
  *(void *)(v0 + 4920) = 0xE400000000000000;
  *(void *)(v0 + 9232) = 0xD000000000000010;
  *(void *)(v0 + 9936) = 0xD000000000000010;
  *(void *)(v0 + 10000) = 0xD000000000000010;
  *(void *)(v0 + 10272) = 0xD000000000000010;
  *(void *)(v0 + 10304) = 0xD000000000000010;
  *(void *)(v0 + 10464) = 0xD000000000000010;
  *(void *)(v0 + 4872) = 0xE400000000000000;
  *(void *)(v0 + 10472) = 0x800000022330DCE0;
  *(void *)(v0 + 10496) = 0x6C61667265746177;
  *(void *)(v0 + 3816) = 0xE900000000000065;
  *(void *)(v0 + 9384) = 0xE900000000000065;
  *(void *)(v0 + 9432) = 0xE900000000000065;
  *(void *)(v0 + 3176) = 0xE90000000000006CLL;
  *(void *)(v0 + 3368) = 0xE90000000000006CLL;
  *(void *)(v0 + 10504) = 0xE90000000000006CLL;
  *(void *)(v0 + 9168) = 0x7265746177;
  *(void *)(v0 + 10400) = 0x7265746177;
  *(void *)(v0 + 10512) = 0x7265746177;
  *(void *)(v0 + 10536) = 0x800000022330DD00;
  *(void *)(v0 + 10560) = 0x6972657073696877;
  *(void *)(v0 + 4752) = 0xD000000000000018;
  *(void *)(v0 + 4760) = 0x800000022330D560;
  *(void *)(v0 + 10568) = 0xEA0000000000676ELL;
  *(void *)(v0 + 4696) = 0xE900000000000067;
  *(void *)(v0 + 4712) = 0xE800000000000000;
  *(void *)(v0 + 4728) = 0xE800000000000000;
  *(void *)(v0 + 9048) = 0x800000022330D8C0;
  *(void *)(v0 + 10584) = 0x800000022330D8C0;
  *(void *)(v0 + 10592) = 0x6E696C7473696877;
  *(void *)(v0 + 4648) = 0xE800000000000000;
  *(void *)(v0 + 4656) = 0xD000000000000012;
  *(void *)(v0 + 4680) = 0xE400000000000000;
  *(void *)(v0 + 10600) = 0xE900000000000067;
  *(void *)(v0 + 10616) = 0x800000022330D920;
  *(void *)(v0 + 4624) = 0xD000000000000018;
  *(void *)(v0 + 4632) = 0x800000022330D660;
  *(void *)(v0 + 9584) = 0xD000000000000013;
  *(void *)(v0 + 9616) = 0xD000000000000013;
  *(void *)(v0 + 10208) = 0xD000000000000013;
  *(void *)(v0 + 10624) = 0xD000000000000013;
  *(void *)(v0 + 4600) = 0xE400000000000000;
  *(void *)(v0 + 10632) = 0x800000022330DD20;
  *(void *)(v0 + 4552) = 0xE400000000000000;
  *(void *)(v0 + 4560) = 0xD000000000000015;
  *(void *)(v0 + 4568) = 0x800000022330D6E0;
  *(void *)(v0 + 9360) = 0xD000000000000020;
  *(void *)(v0 + 9488) = 0xD000000000000020;
  *(void *)(v0 + 10640) = 0xD000000000000020;
  *(void *)(v0 + 9368) = 0x800000022330D680;
  *(void *)(v0 + 9496) = 0x800000022330D680;
  *(void *)(v0 + 10648) = 0x800000022330D680;
  *(void *)(v0 + 4488) = 0xE400000000000000;
  *(void *)(v0 + 3832) = 0x800000022330D6E0;
  *(void *)(v0 + 10552) = 0x800000022330D6E0;
  *(void *)(v0 + 10664) = 0x800000022330D6E0;
  *(void *)(v0 + 3280) = 0x615F6C616D696E61;
  *(void *)(v0 + 4440) = 0xE600000000000000;
  *(void *)(v0 + 4456) = 0xE700000000000000;
  *(void *)(v0 + 10672) = 0x615F6C616D696E61;
  *(void *)(v0 + 3288) = 0xEF74636172747362;
  *(void *)(v0 + 4392) = 0xE500000000000000;
  *(void *)(v0 + 4400) = 0x736E695F646E6977;
  *(void *)(v0 + 4408) = 0xEF746E656D757274;
  *(void *)(v0 + 4424) = 0xE800000000000000;
  *(void *)(v0 + 10232) = 0xEF74636172747362;
  *(void *)(v0 + 10456) = 0xEF74636172747362;
  *(void *)(v0 + 10680) = 0xEF74636172747362;
  *(void *)(v0 + 3856) = 0xD000000000000016;
  *(void *)(v0 + 4240) = 0xD000000000000016;
  *(void *)(v0 + 4368) = 0xD000000000000012;
  *(void *)(v0 + 4336) = 0xD000000000000012;
  *(void *)(v0 + 9408) = 0xD000000000000016;
  *(void *)(v0 + 9552) = 0xD000000000000016;
  *(void *)(v0 + 9776) = 0xD000000000000016;
  *(void *)(v0 + 9856) = 0xD000000000000016;
  *(void *)(v0 + 9968) = 0xD000000000000016;
  *(void *)(v0 + 10416) = 0xD000000000000016;
  *(void *)(v0 + 10704) = 0xD000000000000016;
  *(void *)(v0 + 4248) = 0x800000022330D9E0;
  *(void *)(v0 + 4280) = 0xE400000000000000;
  *(void *)(v0 + 9560) = 0x800000022330D9E0;
  *(void *)(v0 + 10424) = 0x800000022330D9E0;
  *(void *)(v0 + 10712) = 0x800000022330D9E0;
  *(void *)(v0 + 10720) = 0x6968635F646E6977;
  *(void *)(v0 + 3576) = 0xEA00000000006E6FLL;
  *(void *)(v0 + 4216) = 0xE500000000000000;
  *(void *)(v0 + 4232) = 0xE400000000000000;
  *(void *)(v0 + 3608) = 0xEA00000000006E6FLL;
  *(void *)(v0 + 9304) = 0xEA00000000006E6FLL;
  *(void *)(v0 + 10728) = 0xEA0000000000656DLL;
  *(void *)(v0 + 10736) = 0x656D696863;
  *(void *)(v0 + 4184) = 0xE600000000000000;
  *(void *)(v0 + 10752) = 0x736E695F646E6977;
  *(void *)(v0 + 10760) = 0xEF746E656D757274;
  *(void *)(v0 + 3664) = 0xD000000000000012;
  *(void *)(v0 + 4048) = 0xD000000000000012;
  *(void *)(v0 + 4144) = 0x676E69676E6973;
  *(void *)(v0 + 4152) = 0xE700000000000000;
  *(void *)(v0 + 4064) = 0xD000000000000012;
  *(void *)(v0 + 4080) = 0xD000000000000018;
  *(void *)(v0 + 4088) = 0x800000022330D560;
  *(void *)(v0 + 4104) = 0xE400000000000000;
  *(void *)(v0 + 4112) = 0xD000000000000012;
  *(void *)(v0 + 9456) = 0xD000000000000012;
  *(void *)(v0 + 10528) = 0xD000000000000012;
  *(void *)(v0 + 10768) = 0xD000000000000012;
  *(void *)(v0 + 3824) = 0xD000000000000015;
  *(void *)(v0 + 4024) = 0xE600000000000000;
  *(void *)(v0 + 4040) = 0xE800000000000000;
  *(void *)(v0 + 9464) = 0x800000022330D500;
  *(void *)(v0 + 10544) = 0xD000000000000015;
  *(void *)(v0 + 10608) = 0xD000000000000015;
  *(void *)(v0 + 10656) = 0xD000000000000015;
  *(void *)(v0 + 10776) = 0x800000022330D500;
  *(void *)(v0 + 10784) = 0xD000000000000015;
  *(void *)(v0 + 10792) = 0x800000022330DD40;
  *(void *)(v0 + 3928) = 0xE600000000000000;
  *(void *)(v0 + 3992) = 0xE600000000000000;
  *(void *)(v0 + 3960) = 0xE600000000000000;
  *(void *)(v0 + 9040) = 0xD000000000000014;
  *(void *)(v0 + 10576) = 0xD000000000000014;
  *(void *)(v0 + 10816) = 0xD000000000000014;
  *(void *)(v0 + 10824) = 0x800000022330DD60;
  *(void *)(v0 + 10688) = 1684957559;
  *(void *)(v0 + 10800) = 1684957559;
  *(void *)(v0 + 10832) = 1684957559;
  *(void *)(v0 + 3320) = 0x800000022330D560;
  *(void *)(v0 + 3880) = 0xE600000000000000;
  *(void *)(v0 + 3888) = 0xD000000000000018;
  *(void *)(v0 + 3896) = 0x800000022330D560;
  *(void *)(v0 + 9720) = 0x800000022330D560;
  *(void *)(v0 + 10296) = 0x800000022330D560;
  *(void *)(v0 + 10872) = 0x800000022330D560;
  strcpy((char *)(v0 + 10880), "wood_cracking");
  *(_WORD *)(v0 + 10894) = -4864;
  strcpy((char *)(v0 + 10848), "wood_abstract");
  strcpy((char *)(v0 + 10896), "wood_abstract");
  *(_WORD *)(v0 + 10862) = -4864;
  *(_WORD *)(v0 + 10910) = -4864;
  *(void *)(v0 + 10912) = 0x676E6974697277;
  *(void *)(v0 + 10032) = 1819043170;
  *(void *)(v0 + 10944) = 1819043193;
  *(void *)(v0 + 3336) = 0xE400000000000000;
  *(void *)(v0 + 3760) = 0xD000000000000018;
  *(void *)(v0 + 3768) = 0x800000022330D660;
  *(void *)(v0 + 3384) = 0xE400000000000000;
  *(void *)(v0 + 3416) = 0xE400000000000000;
  *(void *)(v0 + 3448) = 0xE400000000000000;
  *(void *)(v0 + 3560) = 0xE400000000000000;
  *(void *)(v0 + 3640) = 0xE400000000000000;
  *(void *)(v0 + 3704) = 0xE600000000000000;
  *(void *)(v0 + 3656) = 0xE600000000000000;
  *(void *)(v0 + 9016) = 0xE400000000000000;
  *(void *)(v0 + 9272) = 0xE400000000000000;
  *(void *)(v0 + 9576) = 0xE400000000000000;
  *(void *)(v0 + 9656) = 0xE400000000000000;
  *(void *)(v0 + 10040) = 0xE400000000000000;
  *(void *)(v0 + 10072) = 0xE400000000000000;
  *(void *)(v0 + 10696) = 0xE400000000000000;
  *(void *)(v0 + 10808) = 0xE400000000000000;
  *(void *)(v0 + 10840) = 0xE400000000000000;
  *(void *)(v0 + 10952) = 0xE400000000000000;
  *(void *)(v0 + 10960) = 0x74756F6873;
  *(void *)(v0 + 3512) = 0x800000022330D660;
  *(void *)(v0 + 3528) = 0xE500000000000000;
  *(void *)(v0 + 3592) = 0xE800000000000000;
  *(void *)(v0 + 9176) = 0xE500000000000000;
  *(void *)(v0 + 9256) = 0xE500000000000000;
  *(void *)(v0 + 9800) = 0xE500000000000000;
  *(void *)(v0 + 9848) = 0xE500000000000000;
  *(void *)(v0 + 9912) = 0xE500000000000000;
  *(void *)(v0 + 9960) = 0xE500000000000000;
  *(void *)(v0 + 10408) = 0xE500000000000000;
  *(void *)(v0 + 10520) = 0xE500000000000000;
  *(void *)(v0 + 10744) = 0xE500000000000000;
  *(void *)(v0 + 10968) = 0xE500000000000000;
  *(void *)(v0 + 10976) = 0x676E696C65646F79;
  *(void *)(v0 + 3112) = 0xE800000000000000;
  *(void *)(v0 + 3208) = 0xE800000000000000;
  *(void *)(v0 + 3504) = 0xD000000000000018;
  *(void *)(v0 + 9128) = 0xE800000000000000;
  *(void *)(v0 + 9448) = 0xE800000000000000;
  *(void *)(v0 + 9928) = 0xE800000000000000;
  *(void *)(v0 + 10984) = 0xE800000000000000;
  *(void *)(v0 + 3088) = 0xD000000000000019;
  *(void *)(v0 + 3264) = 0xD000000000000019;
  *(void *)(v0 + 3296) = 0xD000000000000018;
  *(void *)(v0 + 3304) = 0x800000022330D660;
  *(void *)(v0 + 3312) = 0xD000000000000018;
  *(void *)(v0 + 3344) = 0xD000000000000018;
  *(void *)(v0 + 3352) = 0x800000022330D660;
  *(void *)(v0 + 9032) = 0xE600000000000000;
  *(void *)(v0 + 9064) = 0xE600000000000000;
  *(void *)(v0 + 9072) = 0xD000000000000018;
  *(void *)(v0 + 9080) = 0x800000022330D660;
  *(void *)(v0 + 9112) = 0xE600000000000000;
  *(void *)(v0 + 9328) = 0xD000000000000018;
  *(void *)(v0 + 9336) = 0x800000022330D660;
  *(void *)(v0 + 9352) = 0xE700000000000000;
  *(void *)(v0 + 9512) = 0xE700000000000000;
  *(void *)(v0 + 9640) = 0xE700000000000000;
  *(void *)(v0 + 9680) = 0xD000000000000018;
  *(void *)(v0 + 9688) = 0x800000022330D660;
  *(void *)(v0 + 9712) = 0xD000000000000018;
  *(void *)(v0 + 9744) = 0xD000000000000018;
  *(void *)(v0 + 9752) = 0x800000022330D660;
  *(void *)(v0 + 9992) = 0xE700000000000000;
  *(void *)(v0 + 10104) = 0xE600000000000000;
  *(void *)(v0 + 10120) = 0xE600000000000000;
  *(void *)(v0 + 10128) = 0xD000000000000018;
  *(void *)(v0 + 10136) = 0x800000022330D660;
  *(void *)(v0 + 10144) = 0xD000000000000018;
  *(void *)(v0 + 10168) = 0xE600000000000000;
  *(void *)(v0 + 10184) = 0xE700000000000000;
  *(void *)(v0 + 10256) = 0xD000000000000018;
  *(void *)(v0 + 10264) = 0x800000022330D660;
  *(void *)(v0 + 10288) = 0xD000000000000018;
  *(void *)(v0 + 10480) = 0xD000000000000018;
  *(void *)(v0 + 10488) = 0x800000022330D660;
  *(void *)(v0 + 10864) = 0xD000000000000018;
  *(void *)(v0 + 10920) = 0xE700000000000000;
  *(void *)(v0 + 10928) = 0xD000000000000018;
  *(void *)(v0 + 10936) = 0x800000022330D660;
  *(void *)(v0 + 10992) = 0x676E69676E6973;
  *(void *)(v0 + 11000) = 0xE700000000000000;
  *(void *)(v0 + 11008) = 0x72657070697ALL;
  *(void *)(v0 + 11016) = 0xE600000000000000;
  *(void *)(v0 + 11024) = 0xD000000000000018;
  *(void *)(v0 + 11032) = 0x800000022330D660;
  *(void *)(v0 + 11040) = 0x72656874697ALL;
  *(void *)(v0 + 11048) = 0xE600000000000000;
  *(void *)(v0 + 9088) = 0xD000000000000019;
  *(void *)(v0 + 10192) = 0xD000000000000019;
  *(void *)(v0 + 11056) = 0xD000000000000019;
  *(void *)(v0 + 10200) = 0x800000022330D5E0;
  *(void *)(v0 + 11064) = 0x800000022330D5E0;

  return sub_22330C068();
}

unint64_t sub_2232F8E84(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_2232F34C8(&qword_267FA1720);
    uint64_t v2 = (void *)sub_22330C3C8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v30 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v29 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v34;
  id v7 = &v36;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  uint64_t v10 = MEMORY[0x263F8D538];
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        uint64_t v31 = (v5 - 1) & v5;
        unint64_t v11 = __clz(__rbit64(v5)) | (v9 << 6);
      }
      else
      {
        int64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1)) {
          goto LABEL_34;
        }
        if (v12 >= v29)
        {
LABEL_31:
          sub_2232FC38C();
          return (unint64_t)v2;
        }
        unint64_t v13 = *(void *)(v30 + 8 * v12);
        int64_t v14 = v9 + 1;
        if (!v13)
        {
          int64_t v14 = v9 + 2;
          if (v9 + 2 >= v29) {
            goto LABEL_31;
          }
          unint64_t v13 = *(void *)(v30 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 3;
            if (v9 + 3 >= v29) {
              goto LABEL_31;
            }
            unint64_t v13 = *(void *)(v30 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v9 + 4;
              if (v9 + 4 >= v29) {
                goto LABEL_31;
              }
              unint64_t v13 = *(void *)(v30 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v9 + 5;
                if (v9 + 5 >= v29) {
                  goto LABEL_31;
                }
                unint64_t v13 = *(void *)(v30 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      goto LABEL_35;
                    }
                    if (v14 >= v29) {
                      goto LABEL_31;
                    }
                    unint64_t v13 = *(void *)(v30 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v14 = v9 + 5;
              }
            }
          }
        }
LABEL_25:
        uint64_t v31 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v9 = v14;
      }
      char v16 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v11);
      uint64_t v32 = *v16;
      uint64_t v33 = v16[1];
      swift_bridgeObjectRetain();
      sub_2232F34C8(&qword_267FA1690);
      swift_dynamicCast();
      sub_2232F9D50((uint64_t)v6, (uint64_t)v7, &qword_267FA1690);
      sub_2232F9D50((uint64_t)v7, (uint64_t)v37, &qword_267FA1690);
      sub_2232F9D50((uint64_t)v37, (uint64_t)v35, &qword_267FA1690);
      unint64_t result = sub_2232FA5D8(v32, v33);
      unint64_t v17 = result;
      if ((v18 & 1) == 0) {
        break;
      }
      int64_t v19 = v9;
      unint64_t v20 = v7;
      double v21 = v6;
      uint64_t v22 = v1;
      uint64_t v23 = v10;
      char v24 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v24 = v32;
      v24[1] = v33;
      uint64_t v10 = v23;
      uint64_t v1 = v22;
      uint64_t v6 = v21;
      id v7 = v20;
      int64_t v9 = v19;
      unint64_t result = sub_2232FAC18((uint64_t)v35, v2[7] + 32 * v17);
      unint64_t v5 = v31;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v25 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v25 = v32;
    v25[1] = v33;
    unint64_t result = sub_2232F9D50((uint64_t)v35, v2[7] + 32 * result, &qword_267FA1690);
    uint64_t v26 = v2[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27) {
      goto LABEL_33;
    }
    v2[2] = v28;
    unint64_t v5 = v31;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

void sub_2232F91E0(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_2232F34C8(&qword_267FA1718);
    uint64_t v2 = (void *)sub_22330C3C8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v41 = v1 + 64;
  sub_2232FCF7C();
  unint64_t v5 = v4 & v3;
  int64_t v40 = (unint64_t)(63 - v6) >> 6;
  id v7 = &v46;
  id v8 = &v48;
  swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  uint64_t v10 = (uint64_t *)&unk_267FA16F8;
  uint64_t v11 = MEMORY[0x263F8EE58] + 8;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        uint64_t v43 = (v5 - 1) & v5;
        unint64_t v12 = __clz(__rbit64(v5)) | (v9 << 6);
      }
      else
      {
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1)) {
          goto LABEL_34;
        }
        if (v13 >= v40)
        {
LABEL_31:
          sub_2232FC38C();
          return;
        }
        if (!*(void *)(v41 + 8 * v13))
        {
          sub_2232FD050();
          if (v14 == v15) {
            goto LABEL_31;
          }
          sub_2232FD038();
          if (!v16)
          {
            sub_2232FD050();
            if (v14 == v15) {
              goto LABEL_31;
            }
            sub_2232FD038();
            if (!v17)
            {
              sub_2232FD050();
              if (v14 == v15) {
                goto LABEL_31;
              }
              sub_2232FD038();
              if (!v19)
              {
                int64_t v20 = v18 + 4;
                if (v20 >= v40) {
                  goto LABEL_31;
                }
                if (!*(void *)(v41 + 8 * v20))
                {
                  while (!__OFADD__(v20, 1))
                  {
                    sub_2232FD050();
                    if (v14 == v15) {
                      goto LABEL_31;
                    }
                    sub_2232FD038();
                    int64_t v20 = v21 + 1;
                    if (v22) {
                      goto LABEL_25;
                    }
                  }
                  goto LABEL_35;
                }
              }
            }
          }
        }
LABEL_25:
        sub_2232FCF9C();
        uint64_t v9 = v23;
      }
      char v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v12);
      uint64_t v44 = *v24;
      uint64_t v45 = v24[1];
      id v25 = *(id *)(*(void *)(v1 + 56) + 8 * v12);
      swift_bridgeObjectRetain();
      sub_2232F34C8(v10);
      swift_dynamicCast();
      sub_2232FCE1C(v7, v8);
      sub_2232FCE1C(v8, v49);
      sub_2232FCE1C(v49, &v47);
      unint64_t v26 = sub_2232FA5D8(v44, v45);
      unint64_t v27 = v26;
      if ((v28 & 1) == 0) {
        break;
      }
      uint64_t v42 = v9;
      int64_t v29 = v8;
      uint64_t v30 = v7;
      uint64_t v31 = v1;
      uint64_t v32 = v11;
      uint64_t v33 = v10;
      uint64_t v34 = (uint64_t *)(v2[6] + 16 * v26);
      swift_bridgeObjectRelease();
      uint64_t *v34 = v44;
      v34[1] = v45;
      uint64_t v10 = v33;
      uint64_t v11 = v32;
      uint64_t v1 = v31;
      id v7 = v30;
      id v8 = v29;
      uint64_t v9 = v42;
      uint64_t v35 = (_OWORD *)(v2[7] + 32 * v27);
      sub_2232FCE2C((uint64_t)v35);
      sub_2232FCE1C(&v47, v35);
      unint64_t v5 = v43;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    sub_2232FD024((v26 >> 3) & 0x1FFFFFFFFFFFFFF8);
    double v37 = (uint64_t *)(v36 + 16 * v27);
    *double v37 = v44;
    v37[1] = v45;
    sub_2232FCE1C(&v47, (_OWORD *)(v2[7] + 32 * v27));
    uint64_t v38 = v2[2];
    BOOL v15 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v15) {
      goto LABEL_33;
    }
    v2[2] = v39;
    unint64_t v5 = v43;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
}

void sub_2232F94EC(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_2232F34C8(&qword_267FA16E8);
    uint64_t v2 = (void *)sub_22330C3C8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v41 = v1 + 64;
  sub_2232FCF7C();
  unint64_t v5 = v4 & v3;
  int64_t v40 = (unint64_t)(63 - v6) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  id v8 = (unint64_t *)&qword_267FA16F0;
  unint64_t v9 = 0x263F00D50uLL;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        uint64_t v42 = (v5 - 1) & v5;
        unint64_t v10 = __clz(__rbit64(v5)) | (v7 << 6);
      }
      else
      {
        int64_t v11 = v7 + 1;
        if (__OFADD__(v7, 1)) {
          goto LABEL_34;
        }
        if (v11 >= v40)
        {
LABEL_31:
          sub_2232FC38C();
          return;
        }
        if (!*(void *)(v41 + 8 * v11))
        {
          sub_2232FD044();
          if (v12 == v13) {
            goto LABEL_31;
          }
          sub_2232FD05C();
          if (!v14)
          {
            sub_2232FD044();
            if (v12 == v13) {
              goto LABEL_31;
            }
            sub_2232FD05C();
            if (!v15)
            {
              sub_2232FD044();
              if (v12 == v13) {
                goto LABEL_31;
              }
              sub_2232FD05C();
              if (!v17)
              {
                int64_t v18 = v16 + 4;
                if (v18 >= v40) {
                  goto LABEL_31;
                }
                if (!*(void *)(v41 + 8 * v18))
                {
                  while (!__OFADD__(v18, 1))
                  {
                    sub_2232FD044();
                    if (v12 == v13) {
                      goto LABEL_31;
                    }
                    sub_2232FD05C();
                    int64_t v18 = v19 + 1;
                    if (v20) {
                      goto LABEL_25;
                    }
                  }
                  goto LABEL_35;
                }
              }
            }
          }
        }
LABEL_25:
        sub_2232FCF9C();
        uint64_t v7 = v21;
      }
      uint64_t v22 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v10);
      uint64_t v24 = *v22;
      uint64_t v23 = v22[1];
      id v25 = *(void **)(*(void *)(v1 + 56) + 8 * v10);
      sub_2232F3648(0, v8);
      swift_bridgeObjectRetain();
      id v26 = v25;
      sub_2232F34C8(&qword_267FA16F8);
      swift_dynamicCast();
      unint64_t v27 = sub_2232FA5D8(v24, v23);
      unint64_t v28 = v27;
      if ((v29 & 1) == 0) {
        break;
      }
      uint64_t v30 = v1;
      uint64_t v31 = v7;
      unint64_t v32 = v9;
      uint64_t v33 = v8;
      uint64_t v34 = (uint64_t *)(v2[6] + 16 * v27);
      swift_bridgeObjectRelease();
      uint64_t *v34 = v24;
      v34[1] = v23;
      uint64_t v35 = v2[7];

      *(void *)(v35 + 8 * v28) = v43;
      id v8 = v33;
      unint64_t v9 = v32;
      uint64_t v7 = v31;
      uint64_t v1 = v30;
      unint64_t v5 = v42;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    sub_2232FD024((v27 >> 3) & 0x1FFFFFFFFFFFFFF8);
    double v37 = (uint64_t *)(v36 + 16 * v28);
    *double v37 = v24;
    v37[1] = v23;
    *(void *)(v2[7] + 8 * v28) = v43;
    uint64_t v38 = v2[2];
    BOOL v13 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v13) {
      goto LABEL_33;
    }
    v2[2] = v39;
    unint64_t v5 = v42;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
}

uint64_t static BMContextualUnderstandingSoundAnalysis.soundHierarchyLabels()()
{
  sub_2232F3648(0, &qword_267FA1698);
  uint64_t v0 = static BMContextualUnderstandingSoundAnalysis.soundHierarchyDictionary()();
  uint64_t v1 = sub_2232F99E4(v0);
  uint64_t v2 = static BMContextualUnderstandingSoundAnalysis.soundHierarchyDictionary()();
  uint64_t v3 = sub_2232F9860(v2);
  sub_2232F9B64(v3, v1);
  swift_bridgeObjectRetain();
  sub_2232FAE9C();
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  uint64_t v7 = v5;
  sub_2232FAE30(&v7);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_2232F9860(uint64_t a1)
{
  uint64_t v18 = sub_22330C1B8();
  uint64_t result = sub_2232FC2F0(a1, v19);
  uint64_t v3 = v19[0];
  uint64_t v4 = v19[1];
  int64_t v5 = v19[3];
  unint64_t v6 = v20;
  int64_t v7 = (unint64_t)(v19[2] + 64) >> 6;
  if (!v20) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v9 = v8 | (v5 << 6);
  while (1)
  {
    uint64_t v14 = (uint64_t *)(*(void *)(v3 + 56) + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    swift_bridgeObjectRetain();
    sub_2232FAC80(&v17, v15, v16);
    uint64_t result = swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v10 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v10 >= v7) {
      goto LABEL_21;
    }
    unint64_t v11 = *(void *)(v4 + 8 * v10);
    int64_t v12 = v5 + 1;
    if (!v11)
    {
      int64_t v12 = v5 + 2;
      if (v5 + 2 >= v7) {
        goto LABEL_21;
      }
      unint64_t v11 = *(void *)(v4 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v5 + 3;
        if (v5 + 3 >= v7) {
          goto LABEL_21;
        }
        unint64_t v11 = *(void *)(v4 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v5 + 4;
          if (v5 + 4 >= v7) {
            goto LABEL_21;
          }
          unint64_t v11 = *(void *)(v4 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v5 + 5;
            if (v5 + 5 >= v7) {
              goto LABEL_21;
            }
            unint64_t v11 = *(void *)(v4 + 8 * v12);
            if (!v11)
            {
              int64_t v13 = v5 + 6;
              while (v13 < v7)
              {
                unint64_t v11 = *(void *)(v4 + 8 * v13++);
                if (v11)
                {
                  int64_t v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
LABEL_21:
              swift_release();
              return v18;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v5 = v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_2232F99E4(uint64_t a1)
{
  uint64_t v18 = sub_22330C1B8();
  uint64_t result = sub_2232FC2F0(a1, v19);
  uint64_t v3 = v19[0];
  uint64_t v4 = v19[1];
  int64_t v5 = v19[3];
  unint64_t v6 = v20;
  int64_t v7 = (unint64_t)(v19[2] + 64) >> 6;
  if (!v20) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v9 = v8 | (v5 << 6);
  while (1)
  {
    uint64_t v14 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    swift_bridgeObjectRetain();
    sub_2232FAC80(&v17, v15, v16);
    uint64_t result = swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v10 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v10 >= v7) {
      goto LABEL_21;
    }
    unint64_t v11 = *(void *)(v4 + 8 * v10);
    int64_t v12 = v5 + 1;
    if (!v11)
    {
      int64_t v12 = v5 + 2;
      if (v5 + 2 >= v7) {
        goto LABEL_21;
      }
      unint64_t v11 = *(void *)(v4 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v5 + 3;
        if (v5 + 3 >= v7) {
          goto LABEL_21;
        }
        unint64_t v11 = *(void *)(v4 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v5 + 4;
          if (v5 + 4 >= v7) {
            goto LABEL_21;
          }
          unint64_t v11 = *(void *)(v4 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v5 + 5;
            if (v5 + 5 >= v7) {
              goto LABEL_21;
            }
            unint64_t v11 = *(void *)(v4 + 8 * v12);
            if (!v11)
            {
              int64_t v13 = v5 + 6;
              while (v13 < v7)
              {
                unint64_t v11 = *(void *)(v4 + 8 * v13++);
                if (v11)
                {
                  int64_t v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
LABEL_21:
              swift_release();
              return v18;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v5 = v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_2232F9B64(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v18 = a2;
  uint64_t v4 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v9 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v3 << 6))
  {
    uint64_t v14 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    swift_bridgeObjectRetain();
    sub_2232FAC80(&v17, v15, v16);
    uint64_t result = swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v7 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_20;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2232F9CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2232F34C8(&qword_267FA1690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2232F9D50(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_2232F34C8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2232F9DB4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2232F9E88(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2232FCE7C((uint64_t)v12, *a3);
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
      sub_2232FCE7C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_2232FCE2C((uint64_t)v12);
  return v7;
}

uint64_t sub_2232F9E88(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2232F9FE0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_22330C268();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_2232FA0B8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_22330C2D8();
    if (!v8)
    {
      uint64_t result = sub_22330C378();
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

void *sub_2232F9FE0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_22330C3D8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_2232FA0B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2232FA150(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_2232FA32C(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_2232FA32C((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2232FA150(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_22330C128();
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
  unint64_t v3 = sub_2232FA2C4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_22330C2B8();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_22330C3D8();
  __break(1u);
LABEL_14:
  uint64_t result = sub_22330C378();
  __break(1u);
  return result;
}

void *sub_2232FA2C4(uint64_t a1, uint64_t a2)
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
  sub_2232F34C8(&qword_267FA1728);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2232FA32C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_2232F34C8(&qword_267FA1728);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  int64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_2232FA4DC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2232FA404(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2232FA404(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_22330C3D8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_2232FA4DC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_22330C3D8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_2232FA56C(unsigned __int8 a1)
{
  sub_22330C468();
  sub_22330C478();
  uint64_t v2 = sub_22330C488();

  return sub_2232FA650(a1, v2);
}

unint64_t sub_2232FA5D8(uint64_t a1, uint64_t a2)
{
  sub_22330C468();
  sub_22330C0F8();
  uint64_t v4 = sub_22330C488();

  return sub_2232FA6F0(a1, a2, v4);
}

unint64_t sub_2232FA650(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_2232FA6F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22330C418() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_22330C418() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2232FA7D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2232F34C8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2232FA830(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_2232FA84C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_2233057E8((uint64_t)(a2 + 2), *a1, a1[1], (uint64_t)(a1 + 2));
  *a2 = result;
  a2[1] = v4;
  return result;
}

void sub_2232FA884(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  sub_223306100(&v32);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_223306140(&v30);
  uint64_t v8 = *((void *)&v30 + 1);
  if (!*((void *)&v30 + 1))
  {
LABEL_16:
    swift_release();
    swift_bridgeObjectRelease();
    sub_2232FC38C();
    swift_release();
    return;
  }
  uint64_t v33 = &v31;
  while (1)
  {
    uint64_t v9 = v30;
    uint64_t v28 = v30;
    uint64_t v29 = v8;
    sub_2232F9D50((uint64_t)v33, (uint64_t)v27, &qword_267FA1690);
    uint64_t v10 = *(void **)a5;
    unint64_t v12 = sub_2232FA5D8(v9, v8);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14))
    {
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      sub_22330C438();
      __break(1u);
      goto LABEL_22;
    }
    char v16 = v11;
    if (v10[3] < v15) {
      break;
    }
    if (a4)
    {
      if (v11) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_2232F34C8(&qword_267FA16B8);
      sub_22330C358();
      if (v16) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v19 = *(void **)a5;
    *(void *)(*(void *)a5 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    unint64_t v20 = (uint64_t *)(v19[6] + 16 * v12);
    uint64_t *v20 = v9;
    v20[1] = v8;
    sub_2232F9D50((uint64_t)v27, v19[7] + 32 * v12, &qword_267FA1690);
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_20;
    }
    v19[2] = v23;
LABEL_15:
    sub_223306140(&v30);
    uint64_t v8 = *((void *)&v30 + 1);
    a4 = 1;
    if (!*((void *)&v30 + 1)) {
      goto LABEL_16;
    }
  }
  sub_223304D28(v15, a4 & 1);
  unint64_t v17 = sub_2232FA5D8(v9, v8);
  if ((v16 & 1) != (v18 & 1)) {
    goto LABEL_21;
  }
  unint64_t v12 = v17;
  if ((v16 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  sub_2232F9CE8(*(void *)(*(void *)a5 + 56) + 32 * v12, (uint64_t)v25);
  sub_2232F4A54((uint64_t)v25, (uint64_t)v27, (uint64_t)v26);
  if (!v5)
  {
    sub_2232FA7D4((uint64_t)v25, &qword_267FA1690);
    sub_2232FA7D4((uint64_t)v27, &qword_267FA1690);
    swift_bridgeObjectRelease();
    sub_2232FAC18((uint64_t)v26, *(void *)(*(void *)a5 + 56) + 32 * v12);
    goto LABEL_15;
  }
  sub_2232FA7D4((uint64_t)v25, &qword_267FA1690);
  v25[0] = v5;
  id v24 = v5;
  sub_2232F34C8(&qword_267FA1730);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_2232FA7D4((uint64_t)v27, &qword_267FA1690);
    swift_bridgeObjectRelease();
    sub_2232FC38C();
    swift_release();

    return;
  }
LABEL_22:
  v26[0] = 0;
  v26[1] = 0xE000000000000000;
  sub_22330C2A8();
  sub_22330C108();
  sub_22330C338();
  sub_22330C108();
  sub_22330C388();
  __break(1u);
}

uint64_t sub_2232FAC18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2232F34C8(&qword_267FA1690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2232FAC80(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_22330C468();
  swift_bridgeObjectRetain();
  sub_22330C0F8();
  uint64_t v8 = sub_22330C488();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_22330C418() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      char v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_22330C418() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2232FBCF0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2232FAE30(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_223301FC8();
    uint64_t v2 = v3;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  uint64_t result = sub_2232FB13C(v6);
  *a1 = v2;
  return result;
}

void sub_2232FAE9C()
{
  sub_2232FCF20();
  if (*(void *)(v0 + 16))
  {
    sub_2232F34C8(&qword_26AD65E48);
    uint64_t v1 = (const void *)swift_allocObject();
    size_t v2 = j__malloc_size(v1);
    sub_2232F35B0(v2 - 32);
    sub_2232FC394(v3, v4, v5, v6);
    sub_2232F352C();
    sub_2232FCED8();
    if (!v7) {
      __break(1u);
    }
  }
  sub_2232FCF04();
}

void sub_2232FAF24()
{
  sub_2232FCF20();
  if (*(void *)(v0 + 16))
  {
    sub_2232F34C8(&qword_267FA1700);
    uint64_t v1 = (const void *)swift_allocObject();
    size_t v2 = j__malloc_size(v1);
    sub_2232FCF3C(v2);
    sub_2232FC594(v3, v4, v5, v6);
    sub_2232FD000();
    sub_2232FCED8();
    if (!v7) {
      __break(1u);
    }
  }
  sub_2232FCF04();
}

void sub_2232FAFA8()
{
  sub_2232FCF20();
  if (*(void *)(v0 + 16))
  {
    sub_2232F34C8(&qword_267FA1708);
    uint64_t v1 = (const void *)swift_allocObject();
    size_t v2 = j__malloc_size(v1);
    sub_2232FCF3C(v2);
    sub_2232FC7D8(v3, v4, v5, v6);
    sub_2232FD000();
    sub_2232FCED8();
    if (!v7) {
      __break(1u);
    }
  }
  sub_2232FCF04();
}

void sub_2232FB02C()
{
  sub_2232FCF20();
  if (*(void *)(v0 + 16))
  {
    sub_2232F34C8(&qword_267FA1710);
    uint64_t v1 = (const void *)swift_allocObject();
    size_t v2 = j__malloc_size(v1);
    sub_2232F35B0(v2 - 32);
    sub_2232FC9F4(v3, v4, v5, v6);
    sub_2232F352C();
    sub_2232FCED8();
    if (!v7) {
      __break(1u);
    }
  }
  sub_2232FCF04();
}

void sub_2232FB0B4()
{
  sub_2232FCF20();
  if (*(void *)(v0 + 16))
  {
    sub_2232F34C8(&qword_26AD65E48);
    uint64_t v1 = (const void *)swift_allocObject();
    size_t v2 = j__malloc_size(v1);
    sub_2232F35B0(v2 - 32);
    sub_2232FCC18(v3, v4, v5, v6);
    sub_2232F352C();
    sub_2232FCED8();
    if (!v7) {
      __break(1u);
    }
  }
  sub_2232FCF04();
}

uint64_t sub_2232FB13C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_22330C3F8();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_2232FB7A4(0, v3, 1, a1);
      }
      return result;
    }
    goto LABEL_144;
  }
  uint64_t v5 = result;
  uint64_t result = sub_2232FF210(v3 / 2);
  uint64_t v95 = result;
  uint64_t v96 = v3;
  v97 = v6;
  v93 = a1;
  if (v3 <= 0)
  {
    uint64_t v98 = MEMORY[0x263F8EE78];
    unint64_t v31 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_110:
    if (v31 < 2)
    {
LABEL_121:
      uint64_t result = swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        *(void *)(v95 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_149;
    }
    uint64_t v85 = *v93;
    while (1)
    {
      unint64_t v86 = v31 - 2;
      if (v31 < 2) {
        break;
      }
      if (!v85) {
        goto LABEL_153;
      }
      uint64_t v87 = v98;
      uint64_t v88 = *(void *)(v98 + 32 + 16 * v86);
      uint64_t v89 = *(void *)(v98 + 32 + 16 * (v31 - 1) + 8);
      uint64_t result = sub_2232FB86C((char *)(v85 + 16 * v88), (char *)(v85 + 16 * *(void *)(v98 + 32 + 16 * (v31 - 1))), v85 + 16 * v89, v97);
      if (v1) {
        goto LABEL_106;
      }
      if (v89 < v88) {
        goto LABEL_139;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_223301FB4(v98);
        uint64_t v87 = result;
      }
      if (v86 >= *(void *)(v87 + 16)) {
        goto LABEL_140;
      }
      int64_t v90 = (void *)(v87 + 32 + 16 * v86);
      *int64_t v90 = v88;
      v90[1] = v89;
      unint64_t v91 = *(void *)(v87 + 16);
      if (v31 > v91) {
        goto LABEL_141;
      }
      uint64_t result = (uint64_t)memmove((void *)(v87 + 32 + 16 * (v31 - 1)), (const void *)(v87 + 32 + 16 * v31), 16 * (v91 - v31));
      uint64_t v98 = v87;
      *(void *)(v87 + 16) = v91 - 1;
      unint64_t v31 = v91 - 1;
      uint64_t v3 = v96;
      if (v91 <= 2) {
        goto LABEL_121;
      }
    }
LABEL_138:
    __break(1u);
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
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
LABEL_152:
    __break(1u);
LABEL_153:
    __break(1u);
    return result;
  }
  uint64_t v94 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v92 = *a1 + 8;
  uint64_t v98 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v9 = v7++;
    if (v7 >= v3) {
      goto LABEL_32;
    }
    unint64_t v10 = (uint64_t *)(v8 + 16 * v7);
    uint64_t result = *v10;
    uint64_t v11 = v10[1];
    unint64_t v12 = (void *)(v8 + 16 * v9);
    if (result == *v12 && v11 == v12[1])
    {
      uint64_t v15 = v9 + 2;
      if (v9 + 2 >= v3) {
        goto LABEL_31;
      }
      int v14 = 0;
LABEL_13:
      char v16 = (void *)(v92 + 16 * v15);
      do
      {
        uint64_t result = *(v16 - 1);
        uint64_t v17 = (void *)(v8 + 16 * v7);
        if (result == *v17 && *v16 == v17[1])
        {
          if (v14) {
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t result = sub_22330C418();
          if ((v14 ^ result)) {
            goto LABEL_23;
          }
        }
        v16 += 2;
        uint64_t v19 = v15 + 1;
        uint64_t v7 = v15;
        uint64_t v15 = v19;
      }
      while (v19 < v3);
      uint64_t v15 = v19;
      goto LABEL_23;
    }
    uint64_t result = sub_22330C418();
    int v14 = result;
    uint64_t v15 = v9 + 2;
    if (v9 + 2 < v3) {
      goto LABEL_13;
    }
LABEL_23:
    uint64_t v7 = v15;
    if ((v14 & 1) == 0) {
      goto LABEL_32;
    }
LABEL_24:
    if (v15 < v9) {
      goto LABEL_148;
    }
    if (v9 < v15)
    {
      uint64_t v20 = 16 * v15;
      uint64_t v21 = 16 * v9;
      uint64_t v22 = v15;
      uint64_t v23 = v9;
      do
      {
        if (v23 != --v22)
        {
          if (!v8) {
            goto LABEL_152;
          }
          uint64_t v24 = v8 + v20;
          uint64_t v25 = *(void *)(v8 + v21);
          uint64_t v26 = *(void *)(v8 + v21 + 8);
          *(_OWORD *)(v8 + v21) = *(_OWORD *)(v8 + v20 - 16);
          *(void *)(v24 - 16) = v25;
          *(void *)(v24 - 8) = v26;
        }
        ++v23;
        v20 -= 16;
        v21 += 16;
      }
      while (v23 < v22);
    }
LABEL_31:
    uint64_t v7 = v15;
LABEL_32:
    if (v7 >= v3) {
      goto LABEL_41;
    }
    if (__OFSUB__(v7, v9)) {
      goto LABEL_143;
    }
    if (v7 - v9 >= v94) {
      goto LABEL_41;
    }
    if (__OFADD__(v9, v94)) {
      goto LABEL_146;
    }
    if (v9 + v94 >= v3) {
      uint64_t v27 = v3;
    }
    else {
      uint64_t v27 = v9 + v94;
    }
    if (v27 < v9) {
      goto LABEL_147;
    }
    if (v7 == v27)
    {
LABEL_41:
      uint64_t v28 = v98;
    }
    else
    {
      os_log_type_t v79 = (uint64_t *)(v8 + 16 * v7);
      uint64_t v28 = v98;
      do
      {
        v80 = (uint64_t *)(v8 + 16 * v7);
        uint64_t result = *v80;
        uint64_t v81 = v80[1];
        uint64_t v82 = v9;
        uint64_t v83 = v79;
        do
        {
          if (result == *(v83 - 2) && v81 == *(v83 - 1)) {
            break;
          }
          uint64_t result = sub_22330C418();
          if ((result & 1) == 0) {
            break;
          }
          if (!v8) {
            goto LABEL_150;
          }
          uint64_t result = *v83;
          uint64_t v81 = v83[1];
          *(_OWORD *)uint64_t v83 = *((_OWORD *)v83 - 1);
          *(v83 - 1) = v81;
          *(v83 - 2) = result;
          v83 -= 2;
          ++v82;
        }
        while (v7 != v82);
        ++v7;
        v79 += 2;
      }
      while (v7 != v27);
      uint64_t v7 = v27;
    }
    if (v7 < v9) {
      goto LABEL_142;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_223301EBC(0, *(void *)(v28 + 16) + 1, 1, (char *)v28);
      uint64_t v28 = result;
    }
    unint64_t v30 = *(void *)(v28 + 16);
    unint64_t v29 = *(void *)(v28 + 24);
    unint64_t v31 = v30 + 1;
    if (v30 >= v29 >> 1)
    {
      uint64_t result = (uint64_t)sub_223301EBC((char *)(v29 > 1), v30 + 1, 1, (char *)v28);
      uint64_t v28 = result;
    }
    *(void *)(v28 + 16) = v31;
    uint64_t v32 = v28 + 32;
    uint64_t v33 = (uint64_t *)(v28 + 32 + 16 * v30);
    *uint64_t v33 = v9;
    v33[1] = v7;
    uint64_t v98 = v28;
    if (v30) {
      break;
    }
    unint64_t v31 = 1;
LABEL_90:
    uint64_t v3 = v96;
    if (v7 >= v96) {
      goto LABEL_110;
    }
  }
  while (1)
  {
    unint64_t v34 = v31 - 1;
    if (v31 >= 4)
    {
      unint64_t v39 = v32 + 16 * v31;
      uint64_t v40 = *(void *)(v39 - 64);
      uint64_t v41 = *(void *)(v39 - 56);
      BOOL v45 = __OFSUB__(v41, v40);
      uint64_t v42 = v41 - v40;
      if (v45) {
        goto LABEL_127;
      }
      uint64_t v44 = *(void *)(v39 - 48);
      uint64_t v43 = *(void *)(v39 - 40);
      BOOL v45 = __OFSUB__(v43, v44);
      uint64_t v37 = v43 - v44;
      char v38 = v45;
      if (v45) {
        goto LABEL_128;
      }
      unint64_t v46 = v31 - 2;
      long long v47 = (uint64_t *)(v32 + 16 * (v31 - 2));
      uint64_t v49 = *v47;
      uint64_t v48 = v47[1];
      BOOL v45 = __OFSUB__(v48, v49);
      uint64_t v50 = v48 - v49;
      if (v45) {
        goto LABEL_129;
      }
      BOOL v45 = __OFADD__(v37, v50);
      uint64_t v51 = v37 + v50;
      if (v45) {
        goto LABEL_131;
      }
      if (v51 >= v42)
      {
        char v69 = (uint64_t *)(v32 + 16 * v34);
        uint64_t v71 = *v69;
        uint64_t v70 = v69[1];
        BOOL v45 = __OFSUB__(v70, v71);
        uint64_t v72 = v70 - v71;
        if (v45) {
          goto LABEL_137;
        }
        BOOL v62 = v37 < v72;
        goto LABEL_79;
      }
    }
    else
    {
      if (v31 != 3)
      {
        uint64_t v63 = *(void *)(v28 + 32);
        uint64_t v64 = *(void *)(v28 + 40);
        BOOL v45 = __OFSUB__(v64, v63);
        uint64_t v56 = v64 - v63;
        char v57 = v45;
        goto LABEL_73;
      }
      uint64_t v36 = *(void *)(v28 + 32);
      uint64_t v35 = *(void *)(v28 + 40);
      BOOL v45 = __OFSUB__(v35, v36);
      uint64_t v37 = v35 - v36;
      char v38 = v45;
    }
    if (v38) {
      goto LABEL_130;
    }
    unint64_t v46 = v31 - 2;
    unint64_t v52 = (uint64_t *)(v32 + 16 * (v31 - 2));
    uint64_t v54 = *v52;
    uint64_t v53 = v52[1];
    BOOL v55 = __OFSUB__(v53, v54);
    uint64_t v56 = v53 - v54;
    char v57 = v55;
    if (v55) {
      goto LABEL_132;
    }
    unint64_t v58 = (uint64_t *)(v32 + 16 * v34);
    uint64_t v60 = *v58;
    uint64_t v59 = v58[1];
    BOOL v45 = __OFSUB__(v59, v60);
    uint64_t v61 = v59 - v60;
    if (v45) {
      goto LABEL_134;
    }
    if (__OFADD__(v56, v61)) {
      goto LABEL_136;
    }
    if (v56 + v61 >= v37)
    {
      BOOL v62 = v37 < v61;
LABEL_79:
      if (v62) {
        unint64_t v34 = v46;
      }
      goto LABEL_81;
    }
LABEL_73:
    if (v57) {
      goto LABEL_133;
    }
    uint64_t v65 = (uint64_t *)(v32 + 16 * v34);
    uint64_t v67 = *v65;
    uint64_t v66 = v65[1];
    BOOL v45 = __OFSUB__(v66, v67);
    uint64_t v68 = v66 - v67;
    if (v45) {
      goto LABEL_135;
    }
    if (v68 < v56) {
      goto LABEL_90;
    }
LABEL_81:
    unint64_t v73 = v34 - 1;
    if (v34 - 1 >= v31)
    {
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
      goto LABEL_138;
    }
    if (!v8) {
      goto LABEL_151;
    }
    unint64_t v74 = (uint64_t *)(v32 + 16 * v73);
    uint64_t v75 = *v74;
    v76 = (void *)(v32 + 16 * v34);
    uint64_t v77 = v76[1];
    uint64_t result = sub_2232FB86C((char *)(v8 + 16 * *v74), (char *)(v8 + 16 * *v76), v8 + 16 * v77, v97);
    if (v1) {
      break;
    }
    if (v77 < v75) {
      goto LABEL_124;
    }
    if (v34 > *(void *)(v98 + 16)) {
      goto LABEL_125;
    }
    *unint64_t v74 = v75;
    *(void *)(v32 + 16 * v73 + 8) = v77;
    unint64_t v78 = *(void *)(v98 + 16);
    if (v34 >= v78) {
      goto LABEL_126;
    }
    uint64_t v28 = v98;
    unint64_t v31 = v78 - 1;
    uint64_t result = (uint64_t)memmove((void *)(v32 + 16 * v34), v76 + 2, 16 * (v78 - 1 - v34));
    *(void *)(v98 + 16) = v78 - 1;
    if (v78 <= 2) {
      goto LABEL_90;
    }
  }
LABEL_106:
  uint64_t result = swift_bridgeObjectRelease();
  if (v96 < -1) {
    goto LABEL_145;
  }
  *(void *)(v95 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2232FB7A4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
    while (2)
    {
      uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      unint64_t v12 = (uint64_t *)v8;
      do
      {
        if (result == *(v12 - 2) && v10 == *(v12 - 1)) {
          break;
        }
        uint64_t result = sub_22330C418();
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }
        uint64_t result = *v12;
        uint64_t v10 = v12[1];
        *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 16;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_2232FB86C(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 16;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    sub_223304A90(a2, (uint64_t)(a3 - (void)a2) / 16, a4);
    unint64_t v12 = (unint64_t)&v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_47;
    }
    char v18 = (char *)(a3 - 16);
    while (1)
    {
      uint64_t v19 = v18 + 16;
      uint64_t v20 = (char *)(v12 - 16);
      BOOL v21 = *(void *)(v12 - 16) == *((void *)v6 - 2) && *(void *)(v12 - 8) == *((void *)v6 - 1);
      if (v21 || (sub_22330C418() & 1) == 0)
      {
        BOOL v23 = v19 != (char *)v12 || (unint64_t)v18 >= v12;
        v12 -= 16;
        if (!v23) {
          goto LABEL_43;
        }
      }
      else
      {
        BOOL v22 = v19 != v6 || v18 >= v6;
        uint64_t v20 = v6 - 16;
        v6 -= 16;
        if (!v22) {
          goto LABEL_43;
        }
      }
      *(_OWORD *)char v18 = *(_OWORD *)v20;
LABEL_43:
      v18 -= 16;
      if (v6 <= v7 || v12 <= (unint64_t)v4) {
        goto LABEL_47;
      }
    }
  }
  sub_223304A90(a1, (a2 - a1) / 16, a4);
  unint64_t v12 = (unint64_t)&v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      BOOL v14 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (!v14 && (sub_22330C418() & 1) != 0) {
        break;
      }
      uint64_t v15 = v4;
      BOOL v14 = v7 == v4;
      v4 += 16;
      if (!v14) {
        goto LABEL_15;
      }
LABEL_16:
      v7 += 16;
      if ((unint64_t)v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_21;
      }
    }
    uint64_t v15 = v6;
    BOOL v14 = v7 == v6;
    v6 += 16;
    if (v14) {
      goto LABEL_16;
    }
LABEL_15:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v15;
    goto LABEL_16;
  }
LABEL_21:
  uint64_t v6 = v7;
LABEL_47:
  sub_223304A90(v4, (uint64_t)(v12 - (void)v4) / 16, v6);
  return 1;
}

uint64_t sub_2232FBA14()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2232F34C8(&qword_267FA16E0);
  uint64_t v3 = sub_22330C298();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
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
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_22330C468();
      sub_22330C0F8();
      uint64_t result = sub_22330C488();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *uint64_t v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_2232FA830(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *unint64_t v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_2232FBCF0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2232FBA14();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_2232FBE8C();
      goto LABEL_22;
    }
    sub_2232FC040();
  }
  uint64_t v11 = *v4;
  sub_22330C468();
  sub_22330C0F8();
  uint64_t result = sub_22330C488();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_22330C418(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_22330C428();
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
          uint64_t result = sub_22330C418();
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
  uint64_t *v21 = v8;
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

void *sub_2232FBE8C()
{
  uint64_t v1 = v0;
  sub_2232F34C8(&qword_267FA16E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22330C288();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2232FC040()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2232F34C8(&qword_267FA16E0);
  uint64_t v3 = sub_22330C298();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
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
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_22330C468();
    swift_bridgeObjectRetain();
    sub_22330C0F8();
    uint64_t result = sub_22330C488();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2232FC2F0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_2232FC328(void *a1)
{
  id v1 = objc_msgSend(a1, sel_soundName);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_22330C088();

  return v3;
}

uint64_t sub_2232FC38C()
{
  return swift_release();
}

uint64_t sub_2232FC394(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2232FC594(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_39:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v27 = -1 << *(unsigned char *)(a4 + 32);
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (uint64_t *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = *(void *)(a4 + 56) + 32 * v16;
    uint64_t v24 = *(void *)v23;
    uint64_t v25 = *(void *)(v23 + 8);
    long long v26 = *(_OWORD *)(v23 + 16);
    *(void *)uint64_t v11 = v22;
    *(void *)(v11 + 8) = v21;
    *(void *)(v11 + 16) = v24;
    *(void *)(v11 + 24) = v25;
    *(_OWORD *)(v11 + 32) = v26;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      goto LABEL_38;
    }
    v11 += 48;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = swift_unknownObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0;
        int64_t v12 = v17;
      }
      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }
        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
          unint64_t v18 = *(void *)(v6 + 8 * v12);
          if (v18)
          {
LABEL_14:
            int64_t v17 = v12;
            goto LABEL_18;
          }
          int64_t v19 = v17 + 4;
          if (v17 + 4 >= v14)
          {
LABEL_33:
            unint64_t v9 = 0;
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
              }
              if (v17 >= v14)
              {
                unint64_t v9 = 0;
                int64_t v12 = v14 - 1;
                goto LABEL_37;
              }
              unint64_t v18 = *(void *)(v6 + 8 * v17);
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v17 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v27;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_2232FC7D8(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_39:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v23 = -1 << *(unsigned char *)(a4 + 32);
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    uint64_t v22 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = *v20;
    v11[1] = v21;
    v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_38;
    }
    v11 += 3;
    swift_bridgeObjectRetain();
    uint64_t result = swift_retain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0;
        int64_t v12 = v17;
      }
      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }
        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
          unint64_t v18 = *(void *)(v6 + 8 * v12);
          if (v18)
          {
LABEL_14:
            int64_t v17 = v12;
            goto LABEL_18;
          }
          int64_t v19 = v17 + 4;
          if (v17 + 4 >= v14)
          {
LABEL_33:
            unint64_t v9 = 0;
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
              }
              if (v17 >= v14)
              {
                unint64_t v9 = 0;
                int64_t v12 = v14 - 1;
                goto LABEL_37;
              }
              unint64_t v18 = *(void *)(v6 + 8 * v17);
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v17 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v23;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_2232FC9F4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    long long v22 = *(_OWORD *)(*(void *)(a4 + 56) + 16 * v16);
    *(void *)uint64_t v11 = *v20;
    *(void *)(v11 + 8) = v21;
    *(_OWORD *)(v11 + 16) = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      goto LABEL_38;
    }
    v11 += 32;
    swift_bridgeObjectRetain();
    uint64_t result = swift_unknownObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2232FCC18(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

_OWORD *sub_2232FCE1C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2232FCE2C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2232FCE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2232FCED8()
{
  return sub_2232FC38C();
}

void sub_2232FCF3C(uint64_t a1)
{
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = 2 * ((a1 - 32) / v3);
}

unint64_t sub_2232FCF60()
{
  return sub_2232FA5D8(v1, v0);
}

uint64_t sub_2232FCFB8()
{
  return sub_22330C418();
}

void sub_2232FCFF0(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= v1;
}

uint64_t sub_2232FD000()
{
  return swift_bridgeObjectRetain();
}

void sub_2232FD024(uint64_t a1@<X8>)
{
  *(void *)(v2 + a1) |= v1;
}

uint64_t sub_2232FD068()
{
  return sub_22330C068();
}

__n128 sub_2232FD088(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,__n128 a25)
{
  __n128 result = a25;
  a1[1] = a25;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Feature(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Feature()
{
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for Feature(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

void *assignWithCopy for Feature(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[3] = v4;
  return a1;
}

__n128 initializeWithTake for Feature(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for Feature(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectRelease();
  *(void *)(a1 + 24) = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for Feature(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Feature(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Feature()
{
  return &type metadata for Feature;
}

const char *sub_2232FD2BC(char a1)
{
  __n128 result = "ContextualUnderstanding";
  switch(a1)
  {
    case 1:
      __n128 result = "HumanUnderstandingEvidence";
      break;
    case 2:
      __n128 result = "ContextualUnderstandingNotifications";
      break;
    case 3:
      __n128 result = "HumanUnderstandingDataCollection";
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_2232FD334(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2232FD344()
{
  return sub_22330C478();
}

uint64_t sub_2232FD36C()
{
  return sub_22330C488();
}

uint64_t sub_2232FD3B4()
{
  return sub_22330C488();
}

const char *sub_2232FD3F8()
{
  return "HumanUnderstanding";
}

const char *sub_2232FD40C()
{
  return sub_2232FD2BC(*v0);
}

uint64_t static HUFeatureFlags.isContextualUnderstandingEnabled()()
{
  return sub_2232FD4EC(0);
}

unint64_t sub_2232FD434()
{
  unint64_t result = qword_26AD65CE0;
  if (!qword_26AD65CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD65CE0);
  }
  return result;
}

uint64_t static HUFeatureFlags.isHumanUnderstandingEvidenceEnabled()()
{
  return sub_2232FD4EC(1);
}

uint64_t static HUFeatureFlags.isHumanUnderstandingDataCollectionEnabled()()
{
  return sub_2232FD4EC(3);
}

uint64_t static HUFeatureFlags.isContextualUnderstandingNotificationsEnabled()()
{
  return sub_2232FD4EC(2);
}

uint64_t sub_2232FD4EC(char a1)
{
  uint64_t v5 = &type metadata for HUFeatureFlags.FeaturesKey;
  unint64_t v6 = sub_2232FD434();
  v4[0] = a1;
  char v2 = sub_22330BF68();
  sub_2232FCE2C((uint64_t)v4);
  return v2 & 1;
}

id HUFeatureFlags.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id HUFeatureFlags.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id HUFeatureFlags.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HUFeatureFlags()
{
  return self;
}

uint64_t getEnumTagSinglePayload for HUFeatureFlags.FeaturesKey(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for HUFeatureFlags.FeaturesKey(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2232FD7A0);
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

ValueMetadata *type metadata accessor for HUFeatureFlags.FeaturesKey()
{
  return &type metadata for HUFeatureFlags.FeaturesKey;
}

unint64_t sub_2232FD7DC()
{
  unint64_t result = qword_267FA1738;
  if (!qword_267FA1738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267FA1738);
  }
  return result;
}

uint64_t sub_2232FD828()
{
  type metadata accessor for FeatureManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = FeatureManager.init()();
  qword_267FA1740 = v0;
  return result;
}

uint64_t FeatureManager.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  FeatureManager.init()();
  return v0;
}

uint64_t static FeatureManager.defaultManager.getter()
{
  if (qword_267FA1510 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t FeatureManager.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22330BF08();
  MEMORY[0x270FA5388](v2 - 8);
  unsigned int v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  static Paths.featureManagerBaseDirectory()();
  type metadata accessor for FeatureRegistry();
  swift_allocObject();
  *(void *)(v1 + 112) = FeatureRegistry.init(with:)((uint64_t)v4);
  return v1;
}

id sub_2232FD99C(uint64_t a1)
{
  sub_2232F34C8(&qword_267FA16F8);
  uint64_t v2 = (void *)sub_22330C068();
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    unsigned int v4 = (uint64_t *)(a1 + 40);
    while (1)
    {
      uint64_t v6 = *(v4 - 1);
      uint64_t v5 = *v4;
      swift_bridgeObjectRetain();
      swift_retain();
      FeatureRegistry.feature(for:)(v6, v5, (uint64_t)&v25);
      swift_release();
      uint64_t v7 = v26;
      if (v26)
      {
        uint64_t v8 = v27;
        uint64_t v9 = (uint64_t)v25;
        uint64_t v10 = (void *)sub_22330C078();
        id v24 = objc_msgSend(v8, sel_featureValueForName_, v10);

        sub_2232FDDA0(v9, v7);
      }
      else
      {
        id v24 = 0;
      }
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v25 = v2;
      unint64_t v11 = sub_2232FA5D8(v6, v5);
      if (__OFADD__(v2[2], (v12 & 1) == 0)) {
        break;
      }
      unint64_t v13 = v11;
      char v14 = v12;
      sub_2232F34C8(&qword_267FA1748);
      if (sub_22330C348())
      {
        unint64_t v15 = sub_2232FA5D8(v6, v5);
        if ((v14 & 1) != (v16 & 1)) {
          goto LABEL_19;
        }
        unint64_t v13 = v15;
      }
      uint64_t v2 = v25;
      if (v14)
      {
        uint64_t v17 = v25[7];

        *(void *)(v17 + 8 * v13) = v24;
      }
      else
      {
        v25[(v13 >> 6) + 8] |= 1 << v13;
        unint64_t v18 = (uint64_t *)(v2[6] + 16 * v13);
        *unint64_t v18 = v6;
        v18[1] = v5;
        *(void *)(v2[7] + 8 * v13) = v24;
        uint64_t v19 = v2[2];
        BOOL v20 = __OFADD__(v19, 1);
        uint64_t v21 = v19 + 1;
        if (v20) {
          goto LABEL_18;
        }
        v2[2] = v21;
        swift_bridgeObjectRetain();
      }
      v4 += 2;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    id result = (id)sub_22330C438();
    __break(1u);
  }
  else
  {
LABEL_16:
    sub_2232F91E0((uint64_t)v2);
    swift_bridgeObjectRelease();
    id v22 = objc_allocWithZone(MEMORY[0x263F00D38]);
    return sub_2232FDCB8();
  }
  return result;
}

uint64_t FeatureManager.deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t FeatureManager.__deallocating_deinit()
{
  swift_release();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t FeatureManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_2232FDC9C()
{
  return FeatureManager.unownedExecutor.getter();
}

id sub_2232FDCB8()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = (void *)sub_22330C048();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithDictionary_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_22330BE88();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_2232FDDA0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for FeatureManager()
{
  return self;
}

uint64_t method lookup function for FeatureManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FeatureManager);
}

uint64_t dispatch thunk of FeatureManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of FeatureManager.featureValues(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

Swift::Void __swiftcall FeatureRegistry.printRegistry()()
{
  uint64_t v1 = sub_22330BF08();
  sub_2232F49B0();
  unint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2232F34C8(&qword_267FA1750);
  uint64_t v8 = sub_2232F35D0();
  long long v68 = xmmword_22330CE10;
  *(_OWORD *)(v8 + 16) = xmmword_22330CE10;
  uint64_t v9 = MEMORY[0x263F8D310];
  *(void *)(v8 + 56) = MEMORY[0x263F8D310];
  *(void *)(v8 + 32) = 0;
  *(void *)(v8 + 40) = 0xE000000000000000;
  sub_22330202C(v8);
  swift_bridgeObjectRelease();
  uint64_t v10 = (__n128 *)sub_2232F35D0();
  sub_22330204C(v10);
  *(void *)(v11 + 32) = 0xD000000000000028;
  *(void *)(v11 + 40) = 0x800000022330E1F0;
  sub_22330202C(v11);
  swift_bridgeObjectRelease();
  uint64_t v62 = v0;
  swift_bridgeObjectRetain_n();
  sub_2232FB02C();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  v69[0] = v13;
  sub_2232FF420(v69, (uint64_t (*)(uint64_t))sub_223302004, sub_2233002E0);
  uint64_t v65 = 0;
  unint64_t v66 = v1;
  uint64_t v59 = v6;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(v69[0] + 16);
  if (v14)
  {
    uint64_t v63 = v69[0];
    unint64_t v64 = v3;
    unint64_t v15 = (unint64_t *)(v69[0] + 56);
    unint64_t v67 = 0xD000000000000012;
    do
    {
      unint64_t v16 = *v15;
      uint64_t v17 = sub_2232F35D0();
      *(_OWORD *)(v17 + 16) = v68;
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      sub_2232FF3D8(30);
      swift_bridgeObjectRelease();
      strcpy((char *)v69, "Signal: ");
      BYTE1(v69[1]) = 0;
      WORD1(v69[1]) = 0;
      HIDWORD(v69[1]) = -402653184;
      uint64_t ObjectType = swift_getObjectType();
      unint64_t v71 = v16;
      sub_2232F34C8(&qword_267FA1758);
      sub_22330C0C8();
      sub_22330C108();
      swift_bridgeObjectRelease();
      sub_22330C108();
      sub_22330C108();
      swift_bridgeObjectRelease();
      uint64_t v18 = v69[0];
      uint64_t v19 = v69[1];
      *(void *)(v17 + 56) = MEMORY[0x263F8D310];
      *(void *)(v17 + 32) = v18;
      *(void *)(v17 + 40) = v19;
      sub_22330202C(v17);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      v15 += 4;
      --v14;
    }
    while (v14);
    swift_release();
    uint64_t v9 = MEMORY[0x263F8D310];
    unint64_t v3 = v64;
  }
  else
  {
    swift_release();
  }
  BOOL v20 = (__n128 *)sub_2232F35D0();
  sub_22330204C(v20);
  uint64_t v61 = (uint64_t)" provides output: ";
  *(void *)(v21 + 32) = 0xD000000000000028;
  *(void *)(v21 + 40) = 0x800000022330E240;
  sub_22330202C(v21);
  swift_bridgeObjectRelease();
  uint64_t v22 = sub_2232F35D0();
  *(_OWORD *)(v22 + 16) = v68;
  *(void *)(v22 + 56) = v9;
  *(void *)(v22 + 32) = 0;
  *(void *)(v22 + 40) = 0xE000000000000000;
  sub_22330202C(v22);
  swift_bridgeObjectRelease();
  uint64_t v23 = (__n128 *)sub_2232F35D0();
  sub_22330204C(v23);
  *(void *)(v24 + 32) = 0xD000000000000028;
  *(void *)(v24 + 40) = 0x800000022330E270;
  sub_22330202C(v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  sub_2232FAFA8();
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  v69[0] = v26;
  uint64_t v27 = v65;
  sub_2232FF420(v69, (uint64_t (*)(uint64_t))sub_223301FF0, sub_2232FFC18);
  unint64_t v58 = v27;
  if (v27) {
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  uint64_t v60 = v69[0];
  uint64_t v28 = *(void *)(v69[0] + 16);
  unint64_t v67 = v7;
  int64_t v29 = v59;
  if (v28)
  {
    unint64_t v30 = (void (**)(char *, unint64_t))(v3 + 8);
    unint64_t v31 = (uint64_t *)(v60 + 48);
    unint64_t v64 = 0xD000000000000012;
    uint64_t v65 = v30;
    uint64_t v63 = 0x800000022330E220;
    do
    {
      uint64_t v32 = *v31;
      v31 += 3;
      uint64_t v33 = sub_2232F35D0();
      *(_OWORD *)(v33 + 16) = v68;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_2232FF3D8(35);
      swift_bridgeObjectRelease();
      strcpy((char *)v69, "Transformer: ");
      HIWORD(v69[1]) = -4864;
      id v34 = objc_msgSend(*(id *)(v32 + 16), sel_modelDescription);
      id v35 = objc_msgSend(v34, sel_modelURL);

      sub_22330BEE8();
      sub_22330BEA8();
      (*v65)(v29, v66);
      sub_22330C108();
      swift_bridgeObjectRelease();
      sub_22330C108();
      sub_22330C108();
      uint64_t v9 = MEMORY[0x263F8D310];
      swift_bridgeObjectRelease();
      uint64_t v36 = v69[0];
      uint64_t v37 = v69[1];
      *(void *)(v33 + 56) = v9;
      *(void *)(v33 + 32) = v36;
      *(void *)(v33 + 40) = v37;
      sub_22330202C(v33);
      swift_release();
      swift_bridgeObjectRelease();
      --v28;
    }
    while (v28);
  }
  swift_release();
  char v38 = (__n128 *)sub_2232F35D0();
  sub_22330204C(v38);
  unint64_t v39 = v61 | 0x8000000000000000;
  *(void *)(v40 + 32) = 0xD000000000000028;
  *(void *)(v40 + 40) = v39;
  sub_22330202C(v40);
  swift_bridgeObjectRelease();
  uint64_t v41 = sub_2232F35D0();
  *(_OWORD *)(v41 + 16) = v68;
  *(void *)(v41 + 56) = v9;
  *(void *)(v41 + 32) = 0;
  *(void *)(v41 + 40) = 0xE000000000000000;
  sub_22330202C(v41);
  swift_bridgeObjectRelease();
  uint64_t v42 = (__n128 *)sub_2232F35D0();
  sub_22330204C(v42);
  *(void *)(v43 + 32) = 0xD000000000000028;
  *(void *)(v43 + 40) = 0x800000022330E2A0;
  sub_22330202C(v43);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain_n();
  sub_2232FAF24();
  uint64_t v45 = v44;
  swift_bridgeObjectRelease();
  uint64_t ObjectType = v45;
  unint64_t v46 = v58;
  sub_2232FF420(&ObjectType, (uint64_t (*)(uint64_t))sub_223301FDC, sub_2232FF528);
  if (v46)
  {
LABEL_15:
    swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v65 = (void (**)(char *, unint64_t))ObjectType;
    uint64_t v47 = *(void *)(ObjectType + 16);
    uint64_t v48 = MEMORY[0x263F8D310];
    if (v47)
    {
      uint64_t v49 = (void (**)(void, void))(v65 + 8);
      unint64_t v66 = 0xD000000000000013;
      do
      {
        v49 += 6;
        uint64_t v50 = sub_2232F35D0();
        *(_OWORD *)(v50 + 16) = v68;
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
        sub_2232FF3D8(21);
        swift_bridgeObjectRelease();
        uint64_t ObjectType = v66;
        unint64_t v71 = 0x800000022330E2D0;
        swift_bridgeObjectRetain();
        sub_22330C108();
        swift_bridgeObjectRelease();
        uint64_t v51 = ObjectType;
        unint64_t v52 = v71;
        *(void *)(v50 + 56) = v48;
        *(void *)(v50 + 32) = v51;
        *(void *)(v50 + 40) = v52;
        sub_22330202C(v50);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        --v47;
      }
      while (v47);
    }
    swift_release();
    uint64_t v53 = (__n128 *)sub_2232F35D0();
    sub_223302114(v53);
    uint64_t v55 = sub_223302128(v54, v61);
    sub_22330202C(v55);
    swift_bridgeObjectRelease();
    uint64_t v56 = (__n128 *)sub_2232F35D0();
    sub_223302114(v56);
    *(void *)(v57 + 32) = 0;
    *(void *)(v57 + 40) = 0xE000000000000000;
    sub_22330202C(v57);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2232FE604(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = a2(v4);
  swift_bridgeObjectRelease();
  uint64_t v8 = v5;
  sub_2232FAE30(&v8);
  uint64_t v6 = v8;
  if (v2) {
    swift_release();
  }
  return v6;
}

Swift::Void __swiftcall FeatureRegistry.printFeature(for:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v4 = sub_22330BF08();
  sub_2232F49B0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v126 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v10 = *(void *)(v1 + 32);
  if (!*(void *)(v10 + 16)) {
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_2232FA5D8(countAndFlagsBits, (uint64_t)object);
  if ((v12 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_29:
    swift_endAccess();
    sub_2232F34C8(&qword_267FA1750);
    uint64_t v94 = sub_2232F35D0();
    *(_OWORD *)(v94 + 16) = xmmword_22330CE10;
    *(void *)(v94 + 56) = MEMORY[0x263F8D310];
    *(void *)(v94 + 32) = 0xD00000000000004DLL;
    *(void *)(v94 + 40) = 0x800000022330E2F0;
    sub_22330202C(v94);
LABEL_40:
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v132 = v6;
  uint64_t v13 = *(void *)(v10 + 56) + 32 * v11;
  uint64_t v14 = *(void *)(v13 + 8);
  uint64_t v15 = *(void *)(v13 + 16);
  swift_endAccess();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_2232F34C8(&qword_267FA1750);
  uint64_t v17 = sub_2232F35D0();
  long long v133 = xmmword_22330CE10;
  *(_OWORD *)(v17 + 16) = xmmword_22330CE10;
  uint64_t v18 = MEMORY[0x263F8D310];
  *(void *)(v17 + 56) = MEMORY[0x263F8D310];
  *(void *)(v17 + 32) = 0;
  *(void *)(v17 + 40) = 0xE000000000000000;
  sub_22330202C(v17);
  swift_bridgeObjectRelease();
  uint64_t v19 = (__n128 *)sub_2232F35D0();
  sub_2232F3550(v19);
  uint64_t v21 = sub_223302078(v20, (uint64_t)"Feature --------------------------------");
  sub_22330202C(v21);
  swift_bridgeObjectRelease();
  uint64_t v22 = (void *)sub_2232F35D0();
  sub_22330205C((uint64_t)v22);
  unint64_t v138 = 0x203A656D614ELL;
  unint64_t v139 = 0xE600000000000000;
  swift_bridgeObjectRetain();
  sub_22330C108();
  uint64_t v129 = v14;
  swift_bridgeObjectRelease();
  uint64_t v23 = sub_22330C0E8();
  v22[7] = v18;
  v22[4] = v23;
  v22[5] = v24;
  uint64_t v25 = nullsub_1(v22);
  sub_22330202C(v25);
  swift_bridgeObjectRelease();
  uint64_t v26 = (__n128 *)sub_2232F35D0();
  sub_2232F3550(v26);
  *(void *)(v27 + 32) = 0xD000000000000028;
  *(void *)(v27 + 40) = 0x800000022330E240;
  uint64_t v28 = nullsub_1(v27);
  sub_22330202C(v28);
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_2232F35D0();
  uint64_t v30 = sub_2233020B8(v29);
  sub_22330202C(v30);
  swift_bridgeObjectRelease();
  uint64_t v137 = MEMORY[0x263F8EE78];
  type metadata accessor for Transformer();
  uint64_t v31 = swift_dynamicCastClass();
  uint64_t v130 = v15;
  uint64_t v131 = v16;
  v128 = " provides output: ";
  if (!v31)
  {
    swift_getObjectType();
    uint64_t v95 = sub_2232FF4A4(v15);
    if (v95)
    {
      uint64_t v97 = v95;
      uint64_t v98 = v96;
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      sub_2232F34C8(&qword_267FA1760);
      uint64_t v99 = swift_allocObject();
      *(_OWORD *)(v99 + 16) = v133;
      *(void *)(v99 + 32) = v97;
      *(void *)(v99 + 40) = v98;
      uint64_t v47 = 0;
      uint64_t v137 = nullsub_1(v99);
    }
    else
    {
      uint64_t v47 = 0;
    }
    goto LABEL_35;
  }
  uint64_t v32 = v31;
  uint64_t v33 = (__n128 *)sub_2232F35D0();
  sub_2232F3550(v33);
  uint64_t v35 = sub_223302078(v34, (uint64_t)"Depends on Transformer -----------------");
  swift_unknownObjectRetain();
  sub_22330202C(v35);
  swift_bridgeObjectRelease();
  uint64_t v36 = sub_2232F35D0();
  *(_OWORD *)(v36 + 16) = v133;
  sub_2232FF3D8(20);
  swift_bridgeObjectRelease();
  unint64_t v138 = 0xD000000000000012;
  unint64_t v139 = 0x800000022330E3D0;
  id v37 = objc_msgSend(*(id *)(v32 + 16), sel_modelDescription);
  id v38 = objc_msgSend(v37, sel_modelURL);

  sub_22330BEE8();
  sub_22330BEA8();
  (*(void (**)(char *, uint64_t))(v132 + 8))(v9, v4);
  sub_22330C108();
  swift_bridgeObjectRelease();
  uint64_t v39 = sub_22330C0E8();
  *(void *)(v36 + 56) = v18;
  *(void *)(v36 + 32) = v39;
  *(void *)(v36 + 40) = v40;
  uint64_t v41 = nullsub_1(v36);
  sub_22330202C(v41);
  swift_bridgeObjectRelease();
  uint64_t v42 = sub_2232F35D0();
  uint64_t v132 = 0x800000022330E240;
  uint64_t v43 = (void *)v42;
  sub_22330205C(v42);
  unint64_t v138 = 0x203A737475706E49;
  unint64_t v139 = 0xE800000000000000;
  id v44 = objc_msgSend(*(id *)(v32 + 16), sel_modelDescription);
  id v45 = objc_msgSend(v44, sel_inputDescriptionsByName);

  sub_2232FF4E8();
  uint64_t v46 = sub_22330C058();

  uint64_t v47 = 0;
  uint64_t v48 = sub_2232FE604(v46, (uint64_t (*)(uint64_t))sub_2232FB0B4);
  swift_bridgeObjectRelease();
  MEMORY[0x223CB3820](v48, v18);
  sub_22330C108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v49 = sub_22330C0E8();
  v43[7] = v18;
  v43[4] = v49;
  v43[5] = v50;
  uint64_t v51 = nullsub_1(v43);
  sub_22330202C(v51);
  swift_bridgeObjectRelease();
  unint64_t v52 = (void *)sub_2232F35D0();
  sub_22330205C((uint64_t)v52);
  sub_2233020F4();
  unint64_t v138 = v53;
  unint64_t v139 = 0xE900000000000020;
  id v54 = objc_msgSend(*(id *)(v32 + 16), sel_modelDescription);
  id v55 = objc_msgSend(v54, sel_outputDescriptionsByName);

  uint64_t v56 = sub_22330C058();
  uint64_t v57 = sub_2232FE604(v56, (uint64_t (*)(uint64_t))sub_2232FB0B4);
  swift_bridgeObjectRelease();
  MEMORY[0x223CB3820](v57, v18);
  sub_22330C108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v58 = sub_22330C0E8();
  v52[7] = v18;
  v52[4] = v58;
  v52[5] = v59;
  uint64_t v60 = nullsub_1(v52);
  sub_22330202C(v60);
  swift_bridgeObjectRelease();
  uint64_t v61 = (__n128 *)sub_2232F35D0();
  sub_2232F3550(v61);
  uint64_t v62 = v132;
  *(void *)(v63 + 32) = 0xD000000000000028;
  *(void *)(v63 + 40) = v62;
  uint64_t v64 = nullsub_1(v63);
  sub_22330202C(v64);
  swift_bridgeObjectRelease();
  uint64_t v65 = sub_2232F35D0();
  uint64_t v66 = sub_2233020B8(v65);
  sub_22330202C(v66);
  swift_bridgeObjectRelease();
  uint64_t v67 = *(void *)(v32 + 24);
  type metadata accessor for MultiFeatureProvider();
  uint64_t v68 = swift_dynamicCastClass();
  if (!v68)
  {
    swift_unknownObjectRelease();
LABEL_35:
    uint64_t v100 = (__n128 *)sub_2232F35D0();
    sub_2232F3550(v100);
    uint64_t v102 = sub_223302078(v101, (uint64_t)"Depends on Signals ---------------------");
    sub_22330202C(v102);
    swift_bridgeObjectRelease();
    uint64_t v103 = v137;
    v136[0] = v137;
    swift_bridgeObjectRetain_n();
    sub_2232FF420(v136, (uint64_t (*)(uint64_t))sub_223302018, sub_22330097C);
    if (v47) {
      goto LABEL_43;
    }
    uint64_t v127 = v103;
    swift_bridgeObjectRelease();
    uint64_t v132 = v136[0];
    uint64_t v104 = *(void *)(v136[0] + 16);
    uint64_t v105 = MEMORY[0x263F8D310];
    if (v104)
    {
      v106 = (uint64_t *)(v132 + 40);
      do
      {
        uint64_t v108 = (void *)*(v106 - 1);
        uint64_t v107 = *v106;
        uint64_t v109 = sub_2232F35D0();
        *(_OWORD *)(v109 + 16) = v133;
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        strcpy((char *)v136, "Signal Name: ");
        HIWORD(v136[1]) = -4864;
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v135 = v107;
        sub_2232F34C8(&qword_267FA1758);
        sub_22330C0C8();
        sub_22330C108();
        swift_bridgeObjectRelease();
        uint64_t v110 = sub_22330C0E8();
        *(void *)(v109 + 56) = v105;
        *(void *)(v109 + 32) = v110;
        *(void *)(v109 + 40) = v111;
        uint64_t v112 = nullsub_1(v109);
        sub_22330202C(v112);
        swift_bridgeObjectRelease();
        uint64_t v113 = (void *)sub_2232F35D0();
        sub_22330205C((uint64_t)v113);
        sub_2233020F4();
        v136[0] = v114;
        v136[1] = 0xE900000000000020;
        id v115 = objc_msgSend(v108, sel_featureNames);
        uint64_t v116 = sub_22330C1A8();

        uint64_t v117 = sub_2232FE604(v116, (uint64_t (*)(uint64_t))sub_2232FAE9C);
        swift_bridgeObjectRelease();
        MEMORY[0x223CB3820](v117, v105);
        sub_22330C108();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v118 = sub_22330C0E8();
        v113[7] = v105;
        v113[4] = v118;
        v113[5] = v119;
        uint64_t v120 = nullsub_1(v113);
        sub_22330202C(v120);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        v106 += 2;
        --v104;
      }
      while (v104);
    }
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v121 = sub_2232F35D0();
    *(_OWORD *)(v121 + 16) = v133;
    *(void *)(v121 + 56) = v105;
    uint64_t v122 = sub_223302128(v121, (uint64_t)v128);
    uint64_t v123 = nullsub_1(v122);
    sub_22330202C(v123);
    swift_bridgeObjectRelease();
    uint64_t v124 = sub_2232F35D0();
    *(_OWORD *)(v124 + 16) = v133;
    *(void *)(v124 + 56) = v105;
    *(void *)(v124 + 32) = 0;
    *(void *)(v124 + 40) = 0xE000000000000000;
    uint64_t v125 = nullsub_1(v124);
    sub_22330202C(v125);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_40;
  }
  uint64_t v69 = v68;
  uint64_t v127 = 0;
  swift_beginAccess();
  uint64_t v70 = *(void *)(v69 + 16);
  uint64_t v71 = *(void *)(v70 + 64);
  uint64_t v132 = v70 + 64;
  uint64_t v72 = 1 << *(unsigned char *)(v70 + 32);
  uint64_t v73 = -1;
  if (v72 < 64) {
    uint64_t v73 = ~(-1 << v72);
  }
  unint64_t v74 = v73 & v71;
  int64_t v75 = (unint64_t)(v72 + 63) >> 6;
  v126[1] = v67;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  int64_t v76 = 0;
  while (v74)
  {
    unint64_t v77 = __clz(__rbit64(v74));
    v74 &= v74 - 1;
    unint64_t v78 = v77 | (v76 << 6);
LABEL_26:
    uint64_t v86 = *(void *)(*(void *)(v70 + 56) + 8 * v78);
    swift_getObjectType();
    uint64_t v87 = sub_2232FF4A4(v86);
    if (v87)
    {
      uint64_t v89 = v87;
      uint64_t v90 = v88;
      swift_unknownObjectRetain_n();
      sub_2232FF31C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2233042AC);
      uint64_t v91 = *(void *)(v137 + 16);
      sub_2232FF390(v91, (uint64_t (*)(BOOL))sub_2233042AC);
      uint64_t v92 = v137;
      *(void *)(v137 + 16) = v91 + 1;
      uint64_t v93 = v92 + 16 * v91;
      *(void *)(v93 + 32) = v89;
      *(void *)(v93 + 40) = v90;
      swift_unknownObjectRelease();
    }
  }
  int64_t v79 = v76 + 1;
  if (__OFADD__(v76, 1))
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v79 >= v75) {
    goto LABEL_30;
  }
  unint64_t v80 = *(void *)(v132 + 8 * v79);
  ++v76;
  if (v80) {
    goto LABEL_25;
  }
  int64_t v76 = v79 + 1;
  if (v79 + 1 >= v75) {
    goto LABEL_30;
  }
  sub_223302108();
  if (v80) {
    goto LABEL_25;
  }
  int64_t v76 = v81 + 2;
  if (v81 + 2 >= v75) {
    goto LABEL_30;
  }
  sub_223302108();
  if (v80) {
    goto LABEL_25;
  }
  int64_t v76 = v82 + 3;
  if (v82 + 3 >= v75) {
    goto LABEL_30;
  }
  sub_223302108();
  if (v80)
  {
LABEL_25:
    unint64_t v74 = (v80 - 1) & v80;
    unint64_t v78 = __clz(__rbit64(v80)) + (v76 << 6);
    goto LABEL_26;
  }
  int64_t v84 = v83 + 4;
  if (v84 >= v75)
  {
LABEL_30:
    swift_unknownObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
    uint64_t v47 = v127;
    goto LABEL_35;
  }
  unint64_t v80 = *(void *)(v132 + 8 * v84);
  if (v80)
  {
    int64_t v76 = v84;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v76 = v84 + 1;
    if (__OFADD__(v84, 1)) {
      break;
    }
    if (v76 >= v75) {
      goto LABEL_30;
    }
    sub_223302108();
    int64_t v84 = v85 + 1;
    if (v80) {
      goto LABEL_25;
    }
  }
LABEL_42:
  __break(1u);
LABEL_43:
  swift_release();
  __break(1u);
}

uint64_t sub_2232FF210(uint64_t a1)
{
  if (a1 < 0)
  {
    sub_2233020DC();
    uint64_t result = sub_223302094();
    __break(1u);
  }
  else if (a1)
  {
    uint64_t result = sub_22330C168();
    *(void *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_2232FF288(uint64_t a1, uint64_t *a2)
{
  if (a1 < 0)
  {
    sub_2233020DC();
    uint64_t result = sub_223302094();
    __break(1u);
  }
  else if (a1)
  {
    sub_2232F34C8(a2);
    uint64_t result = sub_22330C168();
    *(void *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_2232FF304()
{
  return sub_2232FF31C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_223304014);
}

uint64_t sub_2232FF31C(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v3;
  if (!result)
  {
    uint64_t result = a1(result, *(void *)(v3 + 16) + 1, 1, v3);
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t sub_2232FF378(uint64_t a1)
{
  return sub_2232FF390(a1, (uint64_t (*)(BOOL))sub_223304014);
}

uint64_t sub_2232FF390(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }
  return result;
}

uint64_t sub_2232FF3D8(uint64_t a1)
{
  if (a1 < 16) {
    return 0;
  }
  sub_22330C2A8();
  return 0;
}

uint64_t sub_2232FF420(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void *))
{
  uint64_t v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = a2(v6);
  }
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  uint64_t result = a3(v9);
  *a1 = v6;
  return result;
}

uint64_t sub_2232FF4A4(uint64_t a1)
{
  if (swift_conformsToProtocol2()) {
    return a1;
  }
  else {
    return 0;
  }
}

unint64_t sub_2232FF4E8()
{
  unint64_t result = qword_267FA1768;
  if (!qword_267FA1768)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267FA1768);
  }
  return result;
}

uint64_t sub_2232FF528(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_22330C3F8();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_2233011EC(0, v3, 1, a1);
      }
      return result;
    }
    goto LABEL_144;
  }
  uint64_t v5 = result;
  uint64_t result = sub_2232FF288(v3 / 2, &qword_267FA1780);
  uint64_t v108 = result;
  uint64_t v109 = v3;
  uint64_t v111 = v6;
  v106 = a1;
  if (v3 <= 0)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    unint64_t v47 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_110:
    uint64_t result = v9;
    if (v47 < 2)
    {
LABEL_121:
      uint64_t result = swift_bridgeObjectRelease();
      if (v109 >= -1)
      {
        *(void *)(v108 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_149;
    }
    uint64_t v97 = *v106;
    while (1)
    {
      unint64_t v98 = v47 - 2;
      if (v47 < 2) {
        break;
      }
      if (!v97) {
        goto LABEL_153;
      }
      uint64_t v99 = result;
      uint64_t v100 = *(void *)(result + 32 + 16 * v98);
      uint64_t v101 = *(void *)(result + 32 + 16 * (v47 - 1) + 8);
      uint64_t result = sub_223301634((char *)(v97 + 48 * v100), (char *)(v97 + 48 * *(void *)(result + 32 + 16 * (v47 - 1))), v97 + 48 * v101, v111);
      if (v1) {
        goto LABEL_106;
      }
      if (v101 < v100) {
        goto LABEL_139;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_223301FB4(v99);
        uint64_t v99 = result;
      }
      if (v98 >= *(void *)(v99 + 16)) {
        goto LABEL_140;
      }
      uint64_t v102 = (void *)(v99 + 32 + 16 * v98);
      *uint64_t v102 = v100;
      v102[1] = v101;
      unint64_t v103 = *(void *)(v99 + 16);
      if (v47 > v103) {
        goto LABEL_141;
      }
      memmove((void *)(v99 + 32 + 16 * (v47 - 1)), (const void *)(v99 + 32 + 16 * v47), 16 * (v103 - v47));
      uint64_t result = v99;
      *(void *)(v99 + 16) = v103 - 1;
      unint64_t v47 = v103 - 1;
      if (v103 <= 2) {
        goto LABEL_121;
      }
    }
LABEL_138:
    __break(1u);
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
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
LABEL_152:
    __break(1u);
LABEL_153:
    __break(1u);
    return result;
  }
  uint64_t v107 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v104 = *a1 + 40;
  uint64_t v105 = *a1 + 8;
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v110 = *a1;
  while (1)
  {
    uint64_t v10 = v7++;
    if (v7 >= v3) {
      goto LABEL_32;
    }
    unint64_t v11 = (uint64_t *)(v8 + 48 * v7);
    uint64_t result = *v11;
    uint64_t v12 = v11[1];
    uint64_t v13 = (void *)(v8 + 48 * v10);
    if (result == *v13 && v12 == v13[1])
    {
      uint64_t v16 = v10 + 2;
      if (v10 + 2 >= v109) {
        goto LABEL_31;
      }
      int v15 = 0;
    }
    else
    {
      uint64_t result = sub_22330C418();
      int v15 = result;
      uint64_t v16 = v10 + 2;
      if (v10 + 2 >= v109) {
        goto LABEL_23;
      }
    }
    uint64_t v17 = (void *)(v105 + 48 * v16);
    do
    {
      uint64_t result = *(v17 - 1);
      uint64_t v18 = (void *)(v8 + 48 * v7);
      if (result == *v18 && *v17 == v18[1])
      {
        if (v15) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t result = sub_22330C418();
        if ((v15 ^ result)) {
          goto LABEL_23;
        }
      }
      v17 += 6;
      uint64_t v20 = v16 + 1;
      uint64_t v7 = v16;
      uint64_t v16 = v20;
    }
    while (v20 < v109);
    uint64_t v16 = v20;
LABEL_23:
    uint64_t v7 = v16;
    if (v15)
    {
LABEL_24:
      if (v16 < v10) {
        goto LABEL_148;
      }
      if (v10 < v16)
      {
        uint64_t v21 = 48 * v16;
        uint64_t v22 = 48 * v10;
        uint64_t v23 = v16;
        uint64_t v24 = v10;
        do
        {
          if (v24 != --v23)
          {
            if (!v8) {
              goto LABEL_152;
            }
            uint64_t v25 = (_OWORD *)(v8 + v22);
            long long v26 = *(_OWORD *)(v8 + v22);
            uint64_t v27 = v8 + v21;
            uint64_t v28 = *(void *)(v8 + v22 + 16);
            uint64_t v29 = *(void *)(v8 + v22 + 40);
            long long v30 = *(_OWORD *)(v8 + v22 + 24);
            long long v32 = *(_OWORD *)(v8 + v21 - 32);
            long long v31 = *(_OWORD *)(v8 + v21 - 16);
            *uint64_t v25 = *(_OWORD *)(v8 + v21 - 48);
            v25[1] = v32;
            v25[2] = v31;
            *(_OWORD *)(v27 - 48) = v26;
            *(void *)(v27 - 32) = v28;
            *(_OWORD *)(v27 - 24) = v30;
            *(void *)(v27 - 8) = v29;
          }
          ++v24;
          v21 -= 48;
          v22 += 48;
        }
        while (v24 < v23);
      }
LABEL_31:
      uint64_t v7 = v16;
    }
LABEL_32:
    if (v7 < v109)
    {
      if (__OFSUB__(v7, v10)) {
        goto LABEL_143;
      }
      if (v7 - v10 < v107)
      {
        if (__OFADD__(v10, v107)) {
          goto LABEL_146;
        }
        if (v10 + v107 >= v109) {
          uint64_t v33 = v109;
        }
        else {
          uint64_t v33 = v10 + v107;
        }
        if (v33 < v10) {
          goto LABEL_147;
        }
        if (v7 != v33)
        {
          uint64_t v34 = v104 + 48 * v7;
          do
          {
            uint64_t v35 = (uint64_t *)(v8 + 48 * v7);
            uint64_t result = *v35;
            uint64_t v36 = v35[1];
            uint64_t v37 = v10;
            uint64_t v38 = v34;
            do
            {
              uint64_t v39 = (_OWORD *)(v38 - 88);
              if (result == *(void *)(v38 - 88) && v36 == *(void *)(v38 - 80)) {
                break;
              }
              uint64_t result = sub_22330C418();
              if ((result & 1) == 0) {
                break;
              }
              if (!v8) {
                goto LABEL_150;
              }
              long long v42 = *(_OWORD *)(v38 - 72);
              long long v41 = *(_OWORD *)(v38 - 56);
              *(void *)(v38 - 48) = *(void *)v38;
              v38 -= 48;
              uint64_t result = *(void *)(v38 + 8);
              uint64_t v36 = *(void *)(v38 + 16);
              uint64_t v43 = *(void *)(v38 + 24);
              long long v44 = *(_OWORD *)(v38 + 32);
              v39[3] = *v39;
              v39[4] = v42;
              v39[5] = v41;
              *(void *)(v38 - 40) = result;
              *(void *)(v38 - 32) = v36;
              *(void *)(v38 - 24) = v43;
              *(_OWORD *)(v38 - 16) = v44;
              ++v37;
            }
            while (v7 != v37);
            ++v7;
            v34 += 48;
          }
          while (v7 != v33);
          uint64_t v7 = v33;
        }
      }
    }
    if (v7 < v10) {
      goto LABEL_142;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_223301EBC(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    unint64_t v46 = *(void *)(v9 + 16);
    unint64_t v45 = *(void *)(v9 + 24);
    unint64_t v47 = v46 + 1;
    if (v46 >= v45 >> 1)
    {
      uint64_t result = (uint64_t)sub_223301EBC((char *)(v45 > 1), v46 + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    *(void *)(v9 + 16) = v47;
    uint64_t v48 = v9 + 32;
    uint64_t v49 = (uint64_t *)(v9 + 32 + 16 * v46);
    *uint64_t v49 = v10;
    v49[1] = v7;
    if (v46) {
      break;
    }
    unint64_t v47 = 1;
    uint64_t v8 = v110;
LABEL_101:
    uint64_t v3 = v109;
    if (v7 >= v109) {
      goto LABEL_110;
    }
  }
  uint64_t v8 = v110;
  while (1)
  {
    unint64_t v50 = v47 - 1;
    if (v47 >= 4)
    {
      unint64_t v55 = v48 + 16 * v47;
      uint64_t v56 = *(void *)(v55 - 64);
      uint64_t v57 = *(void *)(v55 - 56);
      BOOL v61 = __OFSUB__(v57, v56);
      uint64_t v58 = v57 - v56;
      if (v61) {
        goto LABEL_127;
      }
      uint64_t v60 = *(void *)(v55 - 48);
      uint64_t v59 = *(void *)(v55 - 40);
      BOOL v61 = __OFSUB__(v59, v60);
      uint64_t v53 = v59 - v60;
      char v54 = v61;
      if (v61) {
        goto LABEL_128;
      }
      unint64_t v62 = v47 - 2;
      uint64_t v63 = (uint64_t *)(v48 + 16 * (v47 - 2));
      uint64_t v65 = *v63;
      uint64_t v64 = v63[1];
      BOOL v61 = __OFSUB__(v64, v65);
      uint64_t v66 = v64 - v65;
      if (v61) {
        goto LABEL_129;
      }
      BOOL v61 = __OFADD__(v53, v66);
      uint64_t v67 = v53 + v66;
      if (v61) {
        goto LABEL_131;
      }
      if (v67 >= v58)
      {
        uint64_t v85 = (uint64_t *)(v48 + 16 * v50);
        uint64_t v87 = *v85;
        uint64_t v86 = v85[1];
        BOOL v61 = __OFSUB__(v86, v87);
        uint64_t v88 = v86 - v87;
        if (v61) {
          goto LABEL_137;
        }
        BOOL v78 = v53 < v88;
        goto LABEL_90;
      }
    }
    else
    {
      if (v47 != 3)
      {
        uint64_t v79 = *(void *)(v9 + 32);
        uint64_t v80 = *(void *)(v9 + 40);
        BOOL v61 = __OFSUB__(v80, v79);
        uint64_t v72 = v80 - v79;
        char v73 = v61;
        goto LABEL_84;
      }
      uint64_t v52 = *(void *)(v9 + 32);
      uint64_t v51 = *(void *)(v9 + 40);
      BOOL v61 = __OFSUB__(v51, v52);
      uint64_t v53 = v51 - v52;
      char v54 = v61;
    }
    if (v54) {
      goto LABEL_130;
    }
    unint64_t v62 = v47 - 2;
    uint64_t v68 = (uint64_t *)(v48 + 16 * (v47 - 2));
    uint64_t v70 = *v68;
    uint64_t v69 = v68[1];
    BOOL v71 = __OFSUB__(v69, v70);
    uint64_t v72 = v69 - v70;
    char v73 = v71;
    if (v71) {
      goto LABEL_132;
    }
    unint64_t v74 = (uint64_t *)(v48 + 16 * v50);
    uint64_t v76 = *v74;
    uint64_t v75 = v74[1];
    BOOL v61 = __OFSUB__(v75, v76);
    uint64_t v77 = v75 - v76;
    if (v61) {
      goto LABEL_134;
    }
    if (__OFADD__(v72, v77)) {
      goto LABEL_136;
    }
    if (v72 + v77 >= v53)
    {
      BOOL v78 = v53 < v77;
LABEL_90:
      if (v78) {
        unint64_t v50 = v62;
      }
      goto LABEL_92;
    }
LABEL_84:
    if (v73) {
      goto LABEL_133;
    }
    uint64_t v81 = (uint64_t *)(v48 + 16 * v50);
    uint64_t v83 = *v81;
    uint64_t v82 = v81[1];
    BOOL v61 = __OFSUB__(v82, v83);
    uint64_t v84 = v82 - v83;
    if (v61) {
      goto LABEL_135;
    }
    if (v84 < v72) {
      goto LABEL_101;
    }
LABEL_92:
    unint64_t v89 = v50 - 1;
    if (v50 - 1 >= v47)
    {
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
      goto LABEL_138;
    }
    if (!v8) {
      goto LABEL_151;
    }
    uint64_t v90 = v9;
    uint64_t v91 = v8;
    uint64_t v92 = (uint64_t *)(v48 + 16 * v89);
    uint64_t v93 = *v92;
    uint64_t v94 = (void *)(v48 + 16 * v50);
    uint64_t v95 = v94[1];
    uint64_t result = sub_223301634((char *)(v91 + 48 * *v92), (char *)(v91 + 48 * *v94), v91 + 48 * v95, v111);
    if (v1) {
      break;
    }
    if (v95 < v93) {
      goto LABEL_124;
    }
    if (v50 > *(void *)(v90 + 16)) {
      goto LABEL_125;
    }
    *uint64_t v92 = v93;
    *(void *)(v48 + 16 * v89 + 8) = v95;
    unint64_t v96 = *(void *)(v90 + 16);
    if (v50 >= v96) {
      goto LABEL_126;
    }
    uint64_t v9 = v90;
    unint64_t v47 = v96 - 1;
    uint64_t result = (uint64_t)memmove((void *)(v48 + 16 * v50), v94 + 2, 16 * (v96 - 1 - v50));
    *(void *)(v90 + 16) = v96 - 1;
    BOOL v78 = v96 > 2;
    uint64_t v8 = v110;
    if (!v78) {
      goto LABEL_101;
    }
  }
LABEL_106:
  uint64_t result = swift_bridgeObjectRelease();
  if (v109 < -1) {
    goto LABEL_145;
  }
  *(void *)(v108 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2232FFC18(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_22330C3F8();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_2233012DC(0, v3, 1, a1);
      }
      return result;
    }
    goto LABEL_144;
  }
  uint64_t v5 = result;
  uint64_t result = sub_2232FF288(v3 / 2, &qword_267FA1788);
  uint64_t v101 = result;
  uint64_t v102 = v3;
  uint64_t v104 = v6;
  uint64_t v99 = a1;
  if (v3 <= 0)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    unint64_t v41 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_110:
    uint64_t result = v9;
    if (v41 < 2)
    {
LABEL_121:
      uint64_t result = swift_bridgeObjectRelease();
      if (v102 >= -1)
      {
        *(void *)(v101 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_149;
    }
    uint64_t v90 = *v99;
    while (1)
    {
      unint64_t v91 = v41 - 2;
      if (v41 < 2) {
        break;
      }
      if (!v90) {
        goto LABEL_153;
      }
      uint64_t v92 = result;
      uint64_t v93 = *(void *)(result + 32 + 16 * v91);
      uint64_t v94 = *(void *)(result + 32 + 16 * (v41 - 1) + 8);
      uint64_t result = sub_2233017FC((char *)(v90 + 24 * v93), (char *)(v90 + 24 * *(void *)(result + 32 + 16 * (v41 - 1))), v90 + 24 * v94, v104);
      if (v1) {
        goto LABEL_106;
      }
      if (v94 < v93) {
        goto LABEL_139;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_223301FB4(v92);
        uint64_t v92 = result;
      }
      if (v91 >= *(void *)(v92 + 16)) {
        goto LABEL_140;
      }
      uint64_t v95 = (void *)(v92 + 32 + 16 * v91);
      *uint64_t v95 = v93;
      v95[1] = v94;
      unint64_t v96 = *(void *)(v92 + 16);
      if (v41 > v96) {
        goto LABEL_141;
      }
      memmove((void *)(v92 + 32 + 16 * (v41 - 1)), (const void *)(v92 + 32 + 16 * v41), 16 * (v96 - v41));
      uint64_t result = v92;
      *(void *)(v92 + 16) = v96 - 1;
      unint64_t v41 = v96 - 1;
      if (v96 <= 2) {
        goto LABEL_121;
      }
    }
LABEL_138:
    __break(1u);
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
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
LABEL_152:
    __break(1u);
LABEL_153:
    __break(1u);
    return result;
  }
  uint64_t v100 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v97 = *a1 - 24;
  uint64_t v98 = *a1 + 8;
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v103 = v8;
  while (1)
  {
    uint64_t v10 = v7++;
    if (v7 >= v3) {
      goto LABEL_32;
    }
    unint64_t v11 = (uint64_t *)(v8 + 24 * v7);
    uint64_t result = *v11;
    uint64_t v12 = v11[1];
    uint64_t v13 = (void *)(v8 + 24 * v10);
    if (result == *v13 && v12 == v13[1])
    {
      uint64_t v16 = v10 + 2;
      if (v10 + 2 >= v102) {
        goto LABEL_31;
      }
      int v15 = 0;
    }
    else
    {
      uint64_t result = sub_22330C418();
      int v15 = result;
      uint64_t v16 = v10 + 2;
      if (v10 + 2 >= v102) {
        goto LABEL_23;
      }
    }
    uint64_t v17 = (void *)(v98 + 24 * v16);
    do
    {
      uint64_t result = *(v17 - 1);
      uint64_t v18 = (void *)(v8 + 24 * v7);
      if (result == *v18 && *v17 == v18[1])
      {
        if (v15) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t result = sub_22330C418();
        if ((v15 ^ result)) {
          goto LABEL_23;
        }
      }
      v17 += 3;
      uint64_t v20 = v16 + 1;
      uint64_t v7 = v16;
      uint64_t v16 = v20;
    }
    while (v20 < v102);
    uint64_t v16 = v20;
LABEL_23:
    uint64_t v7 = v16;
    if (v15)
    {
LABEL_24:
      if (v16 < v10) {
        goto LABEL_148;
      }
      if (v10 < v16)
      {
        uint64_t v21 = 24 * v16;
        uint64_t v22 = 24 * v10;
        uint64_t v23 = v16;
        uint64_t v24 = v10;
        do
        {
          if (v24 != --v23)
          {
            if (!v8) {
              goto LABEL_152;
            }
            uint64_t v25 = v8 + v22;
            uint64_t v26 = v8 + v21;
            uint64_t v27 = *(void *)(v8 + v22);
            long long v28 = *(_OWORD *)(v8 + v22 + 8);
            long long v29 = *(_OWORD *)(v8 + v21 - 24);
            *(void *)(v25 + 16) = *(void *)(v8 + v21 - 8);
            *(_OWORD *)uint64_t v25 = v29;
            *(void *)(v26 - 24) = v27;
            *(_OWORD *)(v26 - 16) = v28;
          }
          ++v24;
          v21 -= 24;
          v22 += 24;
        }
        while (v24 < v23);
      }
LABEL_31:
      uint64_t v7 = v16;
    }
LABEL_32:
    if (v7 < v102)
    {
      if (__OFSUB__(v7, v10)) {
        goto LABEL_143;
      }
      if (v7 - v10 < v100)
      {
        if (__OFADD__(v10, v100)) {
          goto LABEL_146;
        }
        if (v10 + v100 >= v102) {
          uint64_t v30 = v102;
        }
        else {
          uint64_t v30 = v10 + v100;
        }
        if (v30 < v10) {
          goto LABEL_147;
        }
        if (v7 != v30)
        {
          uint64_t v31 = v97 + 24 * v7;
          do
          {
            long long v32 = (uint64_t *)(v8 + 24 * v7);
            uint64_t result = *v32;
            uint64_t v33 = v32[1];
            uint64_t v34 = v10;
            uint64_t v35 = v31;
            do
            {
              if (result == *(void *)v35 && v33 == *(void *)(v35 + 8)) {
                break;
              }
              uint64_t result = sub_22330C418();
              if ((result & 1) == 0) {
                break;
              }
              if (!v8) {
                goto LABEL_150;
              }
              long long v37 = *(_OWORD *)(v35 + 32);
              uint64_t v38 = *(void *)(v35 + 16);
              uint64_t result = *(void *)(v35 + 24);
              *(_OWORD *)(v35 + 24) = *(_OWORD *)v35;
              *(void *)(v35 + 40) = v38;
              *(void *)uint64_t v35 = result;
              *(_OWORD *)(v35 + 8) = v37;
              uint64_t v33 = v37;
              v35 -= 24;
              ++v34;
            }
            while (v7 != v34);
            ++v7;
            v31 += 24;
          }
          while (v7 != v30);
          uint64_t v7 = v30;
        }
      }
    }
    if (v7 < v10) {
      goto LABEL_142;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_223301EBC(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    unint64_t v40 = *(void *)(v9 + 16);
    unint64_t v39 = *(void *)(v9 + 24);
    unint64_t v41 = v40 + 1;
    if (v40 >= v39 >> 1)
    {
      uint64_t result = (uint64_t)sub_223301EBC((char *)(v39 > 1), v40 + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    *(void *)(v9 + 16) = v41;
    uint64_t v42 = v9 + 32;
    uint64_t v43 = (uint64_t *)(v9 + 32 + 16 * v40);
    *uint64_t v43 = v10;
    v43[1] = v7;
    if (v40) {
      break;
    }
    unint64_t v41 = 1;
    uint64_t v8 = v103;
LABEL_101:
    uint64_t v3 = v102;
    if (v7 >= v102) {
      goto LABEL_110;
    }
  }
  uint64_t v8 = v103;
  while (1)
  {
    unint64_t v44 = v41 - 1;
    if (v41 >= 4)
    {
      unint64_t v49 = v42 + 16 * v41;
      uint64_t v50 = *(void *)(v49 - 64);
      uint64_t v51 = *(void *)(v49 - 56);
      BOOL v55 = __OFSUB__(v51, v50);
      uint64_t v52 = v51 - v50;
      if (v55) {
        goto LABEL_127;
      }
      uint64_t v54 = *(void *)(v49 - 48);
      uint64_t v53 = *(void *)(v49 - 40);
      BOOL v55 = __OFSUB__(v53, v54);
      uint64_t v47 = v53 - v54;
      char v48 = v55;
      if (v55) {
        goto LABEL_128;
      }
      unint64_t v56 = v41 - 2;
      uint64_t v57 = (uint64_t *)(v42 + 16 * (v41 - 2));
      uint64_t v59 = *v57;
      uint64_t v58 = v57[1];
      BOOL v55 = __OFSUB__(v58, v59);
      uint64_t v60 = v58 - v59;
      if (v55) {
        goto LABEL_129;
      }
      BOOL v55 = __OFADD__(v47, v60);
      uint64_t v61 = v47 + v60;
      if (v55) {
        goto LABEL_131;
      }
      if (v61 >= v52)
      {
        uint64_t v79 = (uint64_t *)(v42 + 16 * v44);
        uint64_t v81 = *v79;
        uint64_t v80 = v79[1];
        BOOL v55 = __OFSUB__(v80, v81);
        uint64_t v82 = v80 - v81;
        if (v55) {
          goto LABEL_137;
        }
        BOOL v72 = v47 < v82;
        goto LABEL_90;
      }
    }
    else
    {
      if (v41 != 3)
      {
        uint64_t v73 = *(void *)(v9 + 32);
        uint64_t v74 = *(void *)(v9 + 40);
        BOOL v55 = __OFSUB__(v74, v73);
        uint64_t v66 = v74 - v73;
        char v67 = v55;
        goto LABEL_84;
      }
      uint64_t v46 = *(void *)(v9 + 32);
      uint64_t v45 = *(void *)(v9 + 40);
      BOOL v55 = __OFSUB__(v45, v46);
      uint64_t v47 = v45 - v46;
      char v48 = v55;
    }
    if (v48) {
      goto LABEL_130;
    }
    unint64_t v56 = v41 - 2;
    unint64_t v62 = (uint64_t *)(v42 + 16 * (v41 - 2));
    uint64_t v64 = *v62;
    uint64_t v63 = v62[1];
    BOOL v65 = __OFSUB__(v63, v64);
    uint64_t v66 = v63 - v64;
    char v67 = v65;
    if (v65) {
      goto LABEL_132;
    }
    uint64_t v68 = (uint64_t *)(v42 + 16 * v44);
    uint64_t v70 = *v68;
    uint64_t v69 = v68[1];
    BOOL v55 = __OFSUB__(v69, v70);
    uint64_t v71 = v69 - v70;
    if (v55) {
      goto LABEL_134;
    }
    if (__OFADD__(v66, v71)) {
      goto LABEL_136;
    }
    if (v66 + v71 >= v47)
    {
      BOOL v72 = v47 < v71;
LABEL_90:
      if (v72) {
        unint64_t v44 = v56;
      }
      goto LABEL_92;
    }
LABEL_84:
    if (v67) {
      goto LABEL_133;
    }
    uint64_t v75 = (uint64_t *)(v42 + 16 * v44);
    uint64_t v77 = *v75;
    uint64_t v76 = v75[1];
    BOOL v55 = __OFSUB__(v76, v77);
    uint64_t v78 = v76 - v77;
    if (v55) {
      goto LABEL_135;
    }
    if (v78 < v66) {
      goto LABEL_101;
    }
LABEL_92:
    unint64_t v83 = v44 - 1;
    if (v44 - 1 >= v41)
    {
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
      goto LABEL_138;
    }
    if (!v8) {
      goto LABEL_151;
    }
    uint64_t v84 = v8;
    uint64_t v85 = (uint64_t *)(v42 + 16 * v83);
    uint64_t v86 = *v85;
    uint64_t v87 = (void *)(v42 + 16 * v44);
    uint64_t v88 = v87[1];
    uint64_t result = sub_2233017FC((char *)(v84 + 24 * *v85), (char *)(v84 + 24 * *v87), v84 + 24 * v88, v104);
    if (v1) {
      break;
    }
    if (v88 < v86) {
      goto LABEL_124;
    }
    if (v44 > *(void *)(v9 + 16)) {
      goto LABEL_125;
    }
    *uint64_t v85 = v86;
    *(void *)(v42 + 16 * v83 + 8) = v88;
    unint64_t v89 = *(void *)(v9 + 16);
    if (v44 >= v89) {
      goto LABEL_126;
    }
    unint64_t v41 = v89 - 1;
    uint64_t result = (uint64_t)memmove((void *)(v42 + 16 * v44), v87 + 2, 16 * (v89 - 1 - v44));
    *(void *)(v9 + 16) = v89 - 1;
    BOOL v72 = v89 > 2;
    uint64_t v8 = v103;
    if (!v72) {
      goto LABEL_101;
    }
  }
LABEL_106:
  uint64_t result = swift_bridgeObjectRelease();
  if (v102 < -1) {
    goto LABEL_145;
  }
  *(void *)(v101 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2233002E0(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_22330C3F8();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_2233013BC(0, v3, 1, a1);
      }
      return result;
    }
    goto LABEL_144;
  }
  uint64_t v5 = result;
  uint64_t result = sub_2232FF288(v3 / 2, &qword_267FA1790);
  uint64_t v102 = result;
  uint64_t v103 = v3;
  uint64_t v104 = v6;
  uint64_t v100 = a1;
  if (v3 <= 0)
  {
    uint64_t v105 = MEMORY[0x263F8EE78];
    unint64_t v34 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_110:
    if (v34 < 2)
    {
LABEL_121:
      uint64_t result = swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        *(void *)(v102 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_149;
    }
    uint64_t v91 = *v100;
    while (1)
    {
      unint64_t v92 = v34 - 2;
      if (v34 < 2) {
        break;
      }
      if (!v91) {
        goto LABEL_153;
      }
      uint64_t v93 = v105;
      uint64_t v94 = *(void *)(v105 + 32 + 16 * v92);
      uint64_t v95 = *(void *)(v105 + 32 + 16 * (v34 - 1) + 8);
      uint64_t result = sub_2233019BC((char *)(v91 + 32 * v94), (char *)(v91 + 32 * *(void *)(v105 + 32 + 16 * (v34 - 1))), v91 + 32 * v95, v104);
      if (v1) {
        goto LABEL_106;
      }
      if (v95 < v94) {
        goto LABEL_139;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_223301FB4(v105);
        uint64_t v93 = result;
      }
      if (v92 >= *(void *)(v93 + 16)) {
        goto LABEL_140;
      }
      unint64_t v96 = (void *)(v93 + 32 + 16 * v92);
      *unint64_t v96 = v94;
      v96[1] = v95;
      unint64_t v97 = *(void *)(v93 + 16);
      if (v34 > v97) {
        goto LABEL_141;
      }
      uint64_t result = (uint64_t)memmove((void *)(v93 + 32 + 16 * (v34 - 1)), (const void *)(v93 + 32 + 16 * v34), 16 * (v97 - v34));
      uint64_t v105 = v93;
      *(void *)(v93 + 16) = v97 - 1;
      unint64_t v34 = v97 - 1;
      uint64_t v3 = v103;
      if (v97 <= 2) {
        goto LABEL_121;
      }
    }
LABEL_138:
    __break(1u);
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
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
LABEL_152:
    __break(1u);
LABEL_153:
    __break(1u);
    return result;
  }
  uint64_t v101 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v98 = *a1 - 32;
  uint64_t v99 = *a1 + 8;
  uint64_t v105 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v9 = v7++;
    if (v7 >= v3) {
      goto LABEL_32;
    }
    uint64_t v10 = (uint64_t *)(v8 + 32 * v7);
    uint64_t result = *v10;
    uint64_t v11 = v10[1];
    uint64_t v12 = (void *)(v8 + 32 * v9);
    if (result == *v12 && v11 == v12[1])
    {
      uint64_t v15 = v9 + 2;
      if (v9 + 2 >= v3) {
        goto LABEL_31;
      }
      int v14 = 0;
LABEL_13:
      uint64_t v16 = (void *)(v99 + 32 * v15);
      do
      {
        uint64_t result = *(v16 - 1);
        uint64_t v17 = (void *)(v8 + 32 * v7);
        if (result == *v17 && *v16 == v17[1])
        {
          if (v14) {
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t result = sub_22330C418();
          if ((v14 ^ result)) {
            goto LABEL_23;
          }
        }
        v16 += 4;
        uint64_t v19 = v15 + 1;
        uint64_t v7 = v15;
        uint64_t v15 = v19;
      }
      while (v19 < v3);
      uint64_t v15 = v19;
      goto LABEL_23;
    }
    uint64_t result = sub_22330C418();
    int v14 = result;
    uint64_t v15 = v9 + 2;
    if (v9 + 2 < v3) {
      goto LABEL_13;
    }
LABEL_23:
    uint64_t v7 = v15;
    if ((v14 & 1) == 0) {
      goto LABEL_32;
    }
LABEL_24:
    if (v15 < v9) {
      goto LABEL_148;
    }
    if (v9 < v15)
    {
      uint64_t v20 = 32 * v15;
      uint64_t v21 = 32 * v9;
      uint64_t v22 = v15;
      uint64_t v23 = v9;
      do
      {
        if (v23 != --v22)
        {
          if (!v8) {
            goto LABEL_152;
          }
          uint64_t v24 = (_OWORD *)(v8 + v21);
          uint64_t v25 = v8 + v20;
          uint64_t v26 = *(void *)(v8 + v21);
          uint64_t v27 = *(void *)(v8 + v21 + 24);
          long long v28 = *(_OWORD *)(v8 + v21 + 8);
          long long v29 = *(_OWORD *)(v8 + v20 - 16);
          _OWORD *v24 = *(_OWORD *)(v8 + v20 - 32);
          v24[1] = v29;
          *(void *)(v25 - 32) = v26;
          *(_OWORD *)(v25 - 24) = v28;
          *(void *)(v25 - 8) = v27;
        }
        ++v23;
        v20 -= 32;
        v21 += 32;
      }
      while (v23 < v22);
    }
LABEL_31:
    uint64_t v7 = v15;
LABEL_32:
    if (v7 >= v3) {
      goto LABEL_41;
    }
    if (__OFSUB__(v7, v9)) {
      goto LABEL_143;
    }
    if (v7 - v9 >= v101) {
      goto LABEL_41;
    }
    if (__OFADD__(v9, v101)) {
      goto LABEL_146;
    }
    if (v9 + v101 >= v3) {
      uint64_t v30 = v3;
    }
    else {
      uint64_t v30 = v9 + v101;
    }
    if (v30 < v9) {
      goto LABEL_147;
    }
    if (v7 == v30)
    {
LABEL_41:
      uint64_t v31 = v105;
    }
    else
    {
      uint64_t v82 = v98 + 32 * v7;
      uint64_t v31 = v105;
      do
      {
        unint64_t v83 = (uint64_t *)(v8 + 32 * v7);
        uint64_t result = *v83;
        uint64_t v84 = v83[1];
        uint64_t v85 = v9;
        uint64_t v86 = v82;
        do
        {
          if (result == *(void *)v86 && v84 == *(void *)(v86 + 8)) {
            break;
          }
          uint64_t result = sub_22330C418();
          if ((result & 1) == 0) {
            break;
          }
          if (!v8) {
            goto LABEL_150;
          }
          uint64_t result = *(void *)(v86 + 32);
          uint64_t v88 = *(void *)(v86 + 56);
          long long v89 = *(_OWORD *)(v86 + 40);
          long long v90 = *(_OWORD *)(v86 + 16);
          *(_OWORD *)(v86 + 32) = *(_OWORD *)v86;
          *(_OWORD *)(v86 + 48) = v90;
          *(void *)uint64_t v86 = result;
          *(_OWORD *)(v86 + 8) = v89;
          *(void *)(v86 + 24) = v88;
          uint64_t v84 = v89;
          v86 -= 32;
          ++v85;
        }
        while (v7 != v85);
        ++v7;
        v82 += 32;
      }
      while (v7 != v30);
      uint64_t v7 = v30;
    }
    if (v7 < v9) {
      goto LABEL_142;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_223301EBC(0, *(void *)(v31 + 16) + 1, 1, (char *)v31);
      uint64_t v31 = result;
    }
    unint64_t v33 = *(void *)(v31 + 16);
    unint64_t v32 = *(void *)(v31 + 24);
    unint64_t v34 = v33 + 1;
    if (v33 >= v32 >> 1)
    {
      uint64_t result = (uint64_t)sub_223301EBC((char *)(v32 > 1), v33 + 1, 1, (char *)v31);
      uint64_t v31 = result;
    }
    *(void *)(v31 + 16) = v34;
    uint64_t v35 = v31 + 32;
    uint64_t v36 = (uint64_t *)(v31 + 32 + 16 * v33);
    uint64_t *v36 = v9;
    v36[1] = v7;
    uint64_t v105 = v31;
    if (v33) {
      break;
    }
    unint64_t v34 = 1;
LABEL_90:
    uint64_t v3 = v103;
    if (v7 >= v103) {
      goto LABEL_110;
    }
  }
  while (1)
  {
    unint64_t v37 = v34 - 1;
    if (v34 >= 4)
    {
      unint64_t v42 = v35 + 16 * v34;
      uint64_t v43 = *(void *)(v42 - 64);
      uint64_t v44 = *(void *)(v42 - 56);
      BOOL v48 = __OFSUB__(v44, v43);
      uint64_t v45 = v44 - v43;
      if (v48) {
        goto LABEL_127;
      }
      uint64_t v47 = *(void *)(v42 - 48);
      uint64_t v46 = *(void *)(v42 - 40);
      BOOL v48 = __OFSUB__(v46, v47);
      uint64_t v40 = v46 - v47;
      char v41 = v48;
      if (v48) {
        goto LABEL_128;
      }
      unint64_t v49 = v34 - 2;
      uint64_t v50 = (uint64_t *)(v35 + 16 * (v34 - 2));
      uint64_t v52 = *v50;
      uint64_t v51 = v50[1];
      BOOL v48 = __OFSUB__(v51, v52);
      uint64_t v53 = v51 - v52;
      if (v48) {
        goto LABEL_129;
      }
      BOOL v48 = __OFADD__(v40, v53);
      uint64_t v54 = v40 + v53;
      if (v48) {
        goto LABEL_131;
      }
      if (v54 >= v45)
      {
        BOOL v72 = (uint64_t *)(v35 + 16 * v37);
        uint64_t v74 = *v72;
        uint64_t v73 = v72[1];
        BOOL v48 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v48) {
          goto LABEL_137;
        }
        BOOL v65 = v40 < v75;
        goto LABEL_79;
      }
    }
    else
    {
      if (v34 != 3)
      {
        uint64_t v66 = *(void *)(v31 + 32);
        uint64_t v67 = *(void *)(v31 + 40);
        BOOL v48 = __OFSUB__(v67, v66);
        uint64_t v59 = v67 - v66;
        char v60 = v48;
        goto LABEL_73;
      }
      uint64_t v39 = *(void *)(v31 + 32);
      uint64_t v38 = *(void *)(v31 + 40);
      BOOL v48 = __OFSUB__(v38, v39);
      uint64_t v40 = v38 - v39;
      char v41 = v48;
    }
    if (v41) {
      goto LABEL_130;
    }
    unint64_t v49 = v34 - 2;
    BOOL v55 = (uint64_t *)(v35 + 16 * (v34 - 2));
    uint64_t v57 = *v55;
    uint64_t v56 = v55[1];
    BOOL v58 = __OFSUB__(v56, v57);
    uint64_t v59 = v56 - v57;
    char v60 = v58;
    if (v58) {
      goto LABEL_132;
    }
    uint64_t v61 = (uint64_t *)(v35 + 16 * v37);
    uint64_t v63 = *v61;
    uint64_t v62 = v61[1];
    BOOL v48 = __OFSUB__(v62, v63);
    uint64_t v64 = v62 - v63;
    if (v48) {
      goto LABEL_134;
    }
    if (__OFADD__(v59, v64)) {
      goto LABEL_136;
    }
    if (v59 + v64 >= v40)
    {
      BOOL v65 = v40 < v64;
LABEL_79:
      if (v65) {
        unint64_t v37 = v49;
      }
      goto LABEL_81;
    }
LABEL_73:
    if (v60) {
      goto LABEL_133;
    }
    uint64_t v68 = (uint64_t *)(v35 + 16 * v37);
    uint64_t v70 = *v68;
    uint64_t v69 = v68[1];
    BOOL v48 = __OFSUB__(v69, v70);
    uint64_t v71 = v69 - v70;
    if (v48) {
      goto LABEL_135;
    }
    if (v71 < v59) {
      goto LABEL_90;
    }
LABEL_81:
    unint64_t v76 = v37 - 1;
    if (v37 - 1 >= v34)
    {
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
      goto LABEL_138;
    }
    if (!v8) {
      goto LABEL_151;
    }
    uint64_t v77 = (uint64_t *)(v35 + 16 * v76);
    uint64_t v78 = *v77;
    uint64_t v79 = (void *)(v35 + 16 * v37);
    uint64_t v80 = v79[1];
    uint64_t result = sub_2233019BC((char *)(v8 + 32 * *v77), (char *)(v8 + 32 * *v79), v8 + 32 * v80, v104);
    if (v1) {
      break;
    }
    if (v80 < v78) {
      goto LABEL_124;
    }
    if (v37 > *(void *)(v105 + 16)) {
      goto LABEL_125;
    }
    *uint64_t v77 = v78;
    *(void *)(v35 + 16 * v76 + 8) = v80;
    unint64_t v81 = *(void *)(v105 + 16);
    if (v37 >= v81) {
      goto LABEL_126;
    }
    uint64_t v31 = v105;
    unint64_t v34 = v81 - 1;
    uint64_t result = (uint64_t)memmove((void *)(v35 + 16 * v37), v79 + 2, 16 * (v81 - 1 - v37));
    *(void *)(v105 + 16) = v81 - 1;
    if (v81 <= 2) {
      goto LABEL_90;
    }
  }
LABEL_106:
  uint64_t result = swift_bridgeObjectRelease();
  if (v103 < -1) {
    goto LABEL_145;
  }
  *(void *)(v102 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22330097C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_22330C3F8();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_223301494(0, v3, 1, a1);
      }
      return result;
    }
    goto LABEL_146;
  }
  uint64_t v5 = result;
  uint64_t v105 = v1;
  uint64_t result = sub_2232FF288(v3 / 2, &qword_267FA1778);
  uint64_t v99 = result;
  uint64_t v104 = v6;
  uint64_t v102 = v3;
  unint64_t v97 = a1;
  if (v3 <= 0)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    unint64_t v40 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_110:
    if (v40 < 2)
    {
LABEL_121:
      uint64_t result = swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        *(void *)(v99 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_151;
    }
    uint64_t v89 = *v97;
    while (1)
    {
      unint64_t v90 = v40 - 2;
      if (v40 < 2) {
        break;
      }
      if (!v89) {
        goto LABEL_155;
      }
      uint64_t v91 = *(void *)(v9 + 32 + 16 * v90);
      uint64_t v92 = *(void *)(v9 + 32 + 16 * (v40 - 1) + 8);
      uint64_t result = sub_223301B6C((char *)(v89 + 16 * v91), (char *)(v89 + 16 * *(void *)(v9 + 32 + 16 * (v40 - 1))), v89 + 16 * v92, v104);
      if (v105) {
        goto LABEL_107;
      }
      if (v92 < v91) {
        goto LABEL_141;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_223301FB4(v9);
        uint64_t v9 = result;
      }
      if (v90 >= *(void *)(v9 + 16)) {
        goto LABEL_142;
      }
      uint64_t v93 = (void *)(v9 + 32 + 16 * v90);
      void *v93 = v91;
      v93[1] = v92;
      unint64_t v94 = *(void *)(v9 + 16);
      if (v40 > v94) {
        goto LABEL_143;
      }
      uint64_t result = (uint64_t)memmove((void *)(v9 + 32 + 16 * (v40 - 1)), (const void *)(v9 + 32 + 16 * v40), 16 * (v94 - v40));
      *(void *)(v9 + 16) = v94 - 1;
      unint64_t v40 = v94 - 1;
      uint64_t v3 = v102;
      if (v94 <= 2) {
        goto LABEL_121;
      }
    }
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
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
LABEL_152:
    __break(1u);
LABEL_153:
    __break(1u);
LABEL_154:
    __break(1u);
LABEL_155:
    __break(1u);
    return result;
  }
  uint64_t v98 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v95 = *a1 - 16;
  uint64_t v96 = *a1 + 40;
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v108 = *a1;
  while (1)
  {
    uint64_t v10 = v7 + 1;
    uint64_t v101 = v7;
    if (v7 + 1 < v3)
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      sub_2232F34C8(&qword_267FA1758);
      uint64_t v11 = sub_22330C0C8();
      uint64_t v13 = v12;
      swift_getObjectType();
      if (v11 == sub_22330C0C8() && v13 == v14) {
        int v106 = 0;
      }
      else {
        int v106 = sub_22330C418();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      uint64_t result = swift_unknownObjectRelease();
      uint64_t v3 = v102;
      uint64_t v10 = v7 + 2;
      uint64_t v8 = v108;
      if (v7 + 2 < v102)
      {
        uint64_t v16 = v96 + 16 * v7;
        while (1)
        {
          uint64_t v17 = v10;
          swift_getObjectType();
          swift_unknownObjectRetain();
          swift_unknownObjectRetain();
          uint64_t v18 = sub_22330C0C8();
          uint64_t v20 = v19;
          swift_getObjectType();
          BOOL v22 = v18 == sub_22330C0C8() && v20 == v21;
          int v23 = v22 ? 0 : sub_22330C418();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          uint64_t result = swift_unknownObjectRelease();
          if ((v106 ^ v23)) {
            break;
          }
          ++v10;
          v16 += 16;
          uint64_t v3 = v102;
          if (v17 + 1 >= v102)
          {
            uint64_t v10 = v102;
            goto LABEL_23;
          }
        }
        uint64_t v3 = v102;
LABEL_23:
        uint64_t v7 = v101;
      }
      if (v106)
      {
        if (v10 < v7) {
          goto LABEL_148;
        }
        if (v7 < v10)
        {
          uint64_t v24 = (long long *)(v95 + 16 * v10);
          uint64_t v25 = v10;
          uint64_t v26 = v7;
          uint64_t v27 = (long long *)(v108 + 16 * v7);
          do
          {
            if (v26 != --v25)
            {
              if (!v108) {
                goto LABEL_154;
              }
              long long v28 = *v27;
              long long *v27 = *v24;
              long long *v24 = v28;
            }
            ++v26;
            --v24;
            ++v27;
          }
          while (v26 < v25);
        }
      }
    }
    if (v10 < v3)
    {
      if (__OFSUB__(v10, v7)) {
        goto LABEL_145;
      }
      if (v10 - v7 < v98)
      {
        if (__OFADD__(v7, v98)) {
          goto LABEL_149;
        }
        if (v7 + v98 >= v3) {
          uint64_t v29 = v3;
        }
        else {
          uint64_t v29 = v7 + v98;
        }
        if (v29 < v7) {
          goto LABEL_150;
        }
        if (v10 != v29)
        {
          uint64_t v100 = v29;
          uint64_t v30 = (_OWORD *)(v95 + 16 * v10);
          do
          {
            uint64_t v103 = v30;
            while (1)
            {
              swift_getObjectType();
              swift_unknownObjectRetain();
              swift_unknownObjectRetain();
              sub_2232F34C8(&qword_267FA1758);
              uint64_t v31 = sub_22330C0C8();
              uint64_t v33 = v32;
              swift_getObjectType();
              if (v31 == sub_22330C0C8() && v33 == v34) {
                break;
              }
              char v36 = sub_22330C418();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
              uint64_t v8 = v108;
              if ((v36 & 1) == 0) {
                goto LABEL_52;
              }
              if (!v108) {
                goto LABEL_152;
              }
              long long v37 = v30[1];
              v30[1] = *v30;
              *v30-- = v37;
              if (v10 == ++v7) {
                goto LABEL_52;
              }
            }
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            uint64_t result = swift_bridgeObjectRelease_n();
            uint64_t v8 = v108;
LABEL_52:
            ++v10;
            uint64_t v30 = v103 + 1;
            uint64_t v7 = v101;
          }
          while (v10 != v100);
          uint64_t v10 = v100;
        }
      }
    }
    if (v10 < v7) {
      goto LABEL_144;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_223301EBC(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    unint64_t v39 = *(void *)(v9 + 16);
    unint64_t v38 = *(void *)(v9 + 24);
    unint64_t v40 = v39 + 1;
    if (v39 >= v38 >> 1)
    {
      uint64_t result = (uint64_t)sub_223301EBC((char *)(v38 > 1), v39 + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    *(void *)(v9 + 16) = v40;
    uint64_t v41 = v9 + 32;
    unint64_t v42 = (uint64_t *)(v9 + 32 + 16 * v39);
    *unint64_t v42 = v7;
    v42[1] = v10;
    uint64_t v107 = v10;
    if (v39) {
      break;
    }
    unint64_t v40 = 1;
LABEL_102:
    uint64_t v3 = v102;
    uint64_t v7 = v107;
    if (v107 >= v102) {
      goto LABEL_110;
    }
  }
  while (1)
  {
    unint64_t v43 = v40 - 1;
    if (v40 >= 4)
    {
      unint64_t v48 = v41 + 16 * v40;
      uint64_t v49 = *(void *)(v48 - 64);
      uint64_t v50 = *(void *)(v48 - 56);
      BOOL v54 = __OFSUB__(v50, v49);
      uint64_t v51 = v50 - v49;
      if (v54) {
        goto LABEL_129;
      }
      uint64_t v53 = *(void *)(v48 - 48);
      uint64_t v52 = *(void *)(v48 - 40);
      BOOL v54 = __OFSUB__(v52, v53);
      uint64_t v46 = v52 - v53;
      char v47 = v54;
      if (v54) {
        goto LABEL_130;
      }
      unint64_t v55 = v40 - 2;
      uint64_t v56 = (uint64_t *)(v41 + 16 * (v40 - 2));
      uint64_t v58 = *v56;
      uint64_t v57 = v56[1];
      BOOL v54 = __OFSUB__(v57, v58);
      uint64_t v59 = v57 - v58;
      if (v54) {
        goto LABEL_131;
      }
      BOOL v54 = __OFADD__(v46, v59);
      uint64_t v60 = v46 + v59;
      if (v54) {
        goto LABEL_133;
      }
      if (v60 >= v51)
      {
        uint64_t v78 = (uint64_t *)(v41 + 16 * v43);
        uint64_t v80 = *v78;
        uint64_t v79 = v78[1];
        BOOL v54 = __OFSUB__(v79, v80);
        uint64_t v81 = v79 - v80;
        if (v54) {
          goto LABEL_139;
        }
        BOOL v71 = v46 < v81;
        goto LABEL_91;
      }
    }
    else
    {
      if (v40 != 3)
      {
        uint64_t v72 = *(void *)(v9 + 32);
        uint64_t v73 = *(void *)(v9 + 40);
        BOOL v54 = __OFSUB__(v73, v72);
        uint64_t v65 = v73 - v72;
        char v66 = v54;
        goto LABEL_85;
      }
      uint64_t v45 = *(void *)(v9 + 32);
      uint64_t v44 = *(void *)(v9 + 40);
      BOOL v54 = __OFSUB__(v44, v45);
      uint64_t v46 = v44 - v45;
      char v47 = v54;
    }
    if (v47) {
      goto LABEL_132;
    }
    unint64_t v55 = v40 - 2;
    uint64_t v61 = (uint64_t *)(v41 + 16 * (v40 - 2));
    uint64_t v63 = *v61;
    uint64_t v62 = v61[1];
    BOOL v64 = __OFSUB__(v62, v63);
    uint64_t v65 = v62 - v63;
    char v66 = v64;
    if (v64) {
      goto LABEL_134;
    }
    uint64_t v67 = (uint64_t *)(v41 + 16 * v43);
    uint64_t v69 = *v67;
    uint64_t v68 = v67[1];
    BOOL v54 = __OFSUB__(v68, v69);
    uint64_t v70 = v68 - v69;
    if (v54) {
      goto LABEL_136;
    }
    if (__OFADD__(v65, v70)) {
      goto LABEL_138;
    }
    if (v65 + v70 >= v46)
    {
      BOOL v71 = v46 < v70;
LABEL_91:
      if (v71) {
        unint64_t v43 = v55;
      }
      goto LABEL_93;
    }
LABEL_85:
    if (v66) {
      goto LABEL_135;
    }
    uint64_t v74 = (uint64_t *)(v41 + 16 * v43);
    uint64_t v76 = *v74;
    uint64_t v75 = v74[1];
    BOOL v54 = __OFSUB__(v75, v76);
    uint64_t v77 = v75 - v76;
    if (v54) {
      goto LABEL_137;
    }
    if (v77 < v65) {
      goto LABEL_102;
    }
LABEL_93:
    unint64_t v82 = v43 - 1;
    if (v43 - 1 >= v40)
    {
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
LABEL_139:
      __break(1u);
      goto LABEL_140;
    }
    if (!v8) {
      goto LABEL_153;
    }
    uint64_t v83 = v9;
    uint64_t v84 = (uint64_t *)(v41 + 16 * v82);
    uint64_t v85 = *v84;
    uint64_t v86 = (void *)(v41 + 16 * v43);
    uint64_t v87 = v86[1];
    uint64_t result = sub_223301B6C((char *)(v8 + 16 * *v84), (char *)(v8 + 16 * *v86), v8 + 16 * v87, v104);
    if (v105) {
      break;
    }
    if (v87 < v85) {
      goto LABEL_126;
    }
    if (v43 > *(void *)(v83 + 16)) {
      goto LABEL_127;
    }
    *uint64_t v84 = v85;
    *(void *)(v41 + 16 * v82 + 8) = v87;
    unint64_t v88 = *(void *)(v83 + 16);
    if (v43 >= v88) {
      goto LABEL_128;
    }
    uint64_t v9 = v83;
    uint64_t v105 = 0;
    unint64_t v40 = v88 - 1;
    uint64_t result = (uint64_t)memmove((void *)(v41 + 16 * v43), v86 + 2, 16 * (v88 - 1 - v43));
    *(void *)(v9 + 16) = v88 - 1;
    uint64_t v8 = v108;
    if (v88 <= 2) {
      goto LABEL_102;
    }
  }
LABEL_107:
  uint64_t result = swift_bridgeObjectRelease();
  if (v102 < -1) {
    goto LABEL_147;
  }
  *(void *)(v99 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2233011EC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 48 * a3 + 40;
    while (2)
    {
      uint64_t v9 = (uint64_t *)(v7 + 48 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = v8;
      do
      {
        uint64_t v13 = (_OWORD *)(v12 - 88);
        if (result == *(void *)(v12 - 88) && v10 == *(void *)(v12 - 80)) {
          break;
        }
        uint64_t result = sub_22330C418();
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }
        long long v16 = *(_OWORD *)(v12 - 72);
        long long v15 = *(_OWORD *)(v12 - 56);
        *(void *)(v12 - 48) = *(void *)v12;
        v12 -= 48;
        uint64_t result = *(void *)(v12 + 8);
        uint64_t v10 = *(void *)(v12 + 16);
        uint64_t v17 = *(void *)(v12 + 24);
        long long v18 = *(_OWORD *)(v12 + 32);
        v13[3] = *v13;
        v13[4] = v16;
        v13[5] = v15;
        *(void *)(v12 - 40) = result;
        *(void *)(v12 - 32) = v10;
        *(void *)(v12 - 24) = v17;
        *(_OWORD *)(v12 - 16) = v18;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 48;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_2233012DC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 24 * a3 - 24;
    while (2)
    {
      uint64_t v9 = (uint64_t *)(v7 + 24 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = v8;
      do
      {
        if (result == *(void *)v12 && v10 == *(void *)(v12 + 8)) {
          break;
        }
        uint64_t result = sub_22330C418();
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }
        long long v14 = *(_OWORD *)(v12 + 32);
        uint64_t v15 = *(void *)(v12 + 16);
        uint64_t result = *(void *)(v12 + 24);
        *(_OWORD *)(v12 + 24) = *(_OWORD *)v12;
        *(void *)(v12 + 40) = v15;
        *(void *)uint64_t v12 = result;
        *(_OWORD *)(v12 + 8) = v14;
        uint64_t v10 = v14;
        v12 -= 24;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 24;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_2233013BC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 32 * a3 - 32;
    while (2)
    {
      uint64_t v9 = (uint64_t *)(v7 + 32 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = v8;
      do
      {
        if (result == *(void *)v12 && v10 == *(void *)(v12 + 8)) {
          break;
        }
        uint64_t result = sub_22330C418();
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }
        uint64_t result = *(void *)(v12 + 32);
        uint64_t v14 = *(void *)(v12 + 56);
        long long v15 = *(_OWORD *)(v12 + 40);
        long long v16 = *(_OWORD *)(v12 + 16);
        *(_OWORD *)(v12 + 32) = *(_OWORD *)v12;
        *(_OWORD *)(v12 + 48) = v16;
        *(void *)uint64_t v12 = result;
        *(_OWORD *)(v12 + 8) = v15;
        *(void *)(v12 + 24) = v14;
        uint64_t v10 = v15;
        v12 -= 32;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 32;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_223301494(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v15 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v17 = *a4;
    uint64_t v5 = (_OWORD *)(*a4 + 16 * a3 - 16);
    while (2)
    {
      uint64_t v6 = v15;
      long long v16 = v5;
      while (1)
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        sub_2232F34C8(&qword_267FA1758);
        uint64_t v7 = sub_22330C0C8();
        uint64_t v9 = v8;
        swift_getObjectType();
        if (v7 == sub_22330C0C8() && v9 == v10) {
          break;
        }
        char v12 = sub_22330C418();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v12)
        {
          if (!v17)
          {
            __break(1u);
            return result;
          }
          long long v13 = v5[1];
          v5[1] = *v5;
          *v5-- = v13;
          if (v4 != ++v6) {
            continue;
          }
        }
        goto LABEL_13;
      }
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      uint64_t result = swift_bridgeObjectRelease_n();
LABEL_13:
      ++v4;
      uint64_t v5 = v16 + 1;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_223301634(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 48;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 48;
  if (v9 >= v11)
  {
    sub_223304B4C(a2, (uint64_t)(a3 - (void)a2) / 48, a4);
    char v12 = &v4[48 * v11];
    if (v7 >= v6 || v10 < 48) {
      goto LABEL_43;
    }
    long long v18 = (char *)(a3 - 48);
    while (1)
    {
      uint64_t v19 = v18 + 48;
      uint64_t v20 = v12 - 48;
      BOOL v21 = *((void *)v12 - 6) == *((void *)v6 - 6) && *((void *)v12 - 5) == *((void *)v6 - 5);
      if (v21 || (sub_22330C418() & 1) == 0)
      {
        BOOL v23 = v19 != v12 || v18 >= v12;
        v12 -= 48;
        if (!v23) {
          goto LABEL_39;
        }
      }
      else
      {
        BOOL v22 = v19 != v6 || v18 >= v6;
        uint64_t v20 = v6 - 48;
        v6 -= 48;
        if (!v22) {
          goto LABEL_39;
        }
      }
      long long v24 = *(_OWORD *)v20;
      long long v25 = *((_OWORD *)v20 + 2);
      *((_OWORD *)v18 + 1) = *((_OWORD *)v20 + 1);
      *((_OWORD *)v18 + 2) = v25;
      *(_OWORD *)long long v18 = v24;
LABEL_39:
      v18 -= 48;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_43;
      }
    }
  }
  sub_223304B4C(a1, (a2 - a1) / 48, a4);
  char v12 = &v4[48 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 48)
  {
    while (1)
    {
      BOOL v13 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (!v13 && (sub_22330C418() & 1) != 0) {
        break;
      }
      uint64_t v14 = v4;
      BOOL v13 = v7 == v4;
      v4 += 48;
      if (!v13) {
        goto LABEL_13;
      }
LABEL_14:
      v7 += 48;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_19;
      }
    }
    uint64_t v14 = v6;
    BOOL v13 = v7 == v6;
    v6 += 48;
    if (v13) {
      goto LABEL_14;
    }
LABEL_13:
    long long v15 = *(_OWORD *)v14;
    long long v16 = *((_OWORD *)v14 + 2);
    *((_OWORD *)v7 + 1) = *((_OWORD *)v14 + 1);
    *((_OWORD *)v7 + 2) = v16;
    *(_OWORD *)uint64_t v7 = v15;
    goto LABEL_14;
  }
LABEL_19:
  uint64_t v6 = v7;
LABEL_43:
  sub_223304B4C(v4, (v12 - v4) / 48, v6);
  return 1;
}

uint64_t sub_2233017FC(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 24;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 24;
  if (v9 >= v11)
  {
    sub_223304AEC(a2, (uint64_t)(a3 - (void)a2) / 24, a4);
    char v12 = &v4[24 * v11];
    if (v7 >= v6 || v10 < 24) {
      goto LABEL_47;
    }
    unint64_t v19 = a3 - 24;
    while (1)
    {
      uint64_t v20 = (char *)(v19 + 24);
      BOOL v21 = v12 - 24;
      BOOL v22 = *((void *)v12 - 3) == *((void *)v6 - 3) && *((void *)v12 - 2) == *((void *)v6 - 2);
      if (v22 || (sub_22330C418() & 1) == 0)
      {
        BOOL v24 = v20 != v12 || v19 >= (unint64_t)v12;
        v12 -= 24;
        if (!v24) {
          goto LABEL_43;
        }
      }
      else
      {
        BOOL v23 = v20 != v6 || v19 >= (unint64_t)v6;
        BOOL v21 = v6 - 24;
        v6 -= 24;
        if (!v23) {
          goto LABEL_43;
        }
      }
      long long v25 = *(_OWORD *)v21;
      *(void *)(v19 + 16) = *((void *)v21 + 2);
      *(_OWORD *)unint64_t v19 = v25;
LABEL_43:
      v19 -= 24;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_47;
      }
    }
  }
  sub_223304AEC(a1, (a2 - a1) / 24, a4);
  char v12 = &v4[24 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    while (1)
    {
      BOOL v14 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (!v14 && (sub_22330C418() & 1) != 0) {
        break;
      }
      long long v15 = v4;
      BOOL v14 = v7 == v4;
      v4 += 24;
      if (!v14) {
        goto LABEL_15;
      }
LABEL_16:
      v7 += 24;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_21;
      }
    }
    long long v15 = v6;
    BOOL v14 = v7 == v6;
    v6 += 24;
    if (v14) {
      goto LABEL_16;
    }
LABEL_15:
    long long v16 = *(_OWORD *)v15;
    *((void *)v7 + 2) = *((void *)v15 + 2);
    *(_OWORD *)uint64_t v7 = v16;
    goto LABEL_16;
  }
LABEL_21:
  uint64_t v6 = v7;
LABEL_47:
  sub_223304AEC(v4, (v12 - v4) / 24, v6);
  return 1;
}

uint64_t sub_2233019BC(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 32;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 32;
  if (v9 >= v11)
  {
    sub_223304AE8(a2, (uint64_t)(a3 - (void)a2) / 32, a4);
    unint64_t v12 = (unint64_t)&v4[32 * v11];
    if (v7 >= v6 || v10 < 32) {
      goto LABEL_43;
    }
    uint64_t v17 = (char *)(a3 - 32);
    while (1)
    {
      long long v18 = v17 + 32;
      unint64_t v19 = (char *)(v12 - 32);
      BOOL v20 = *(void *)(v12 - 32) == *((void *)v6 - 4) && *(void *)(v12 - 24) == *((void *)v6 - 3);
      if (v20 || (sub_22330C418() & 1) == 0)
      {
        BOOL v22 = v18 != (char *)v12 || (unint64_t)v17 >= v12;
        v12 -= 32;
        if (!v22) {
          goto LABEL_39;
        }
      }
      else
      {
        BOOL v21 = v18 != v6 || v17 >= v6;
        unint64_t v19 = v6 - 32;
        v6 -= 32;
        if (!v21) {
          goto LABEL_39;
        }
      }
      long long v23 = *((_OWORD *)v19 + 1);
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v19;
      *((_OWORD *)v17 + 1) = v23;
LABEL_39:
      v17 -= 32;
      if (v6 <= v7 || v12 <= (unint64_t)v4) {
        goto LABEL_43;
      }
    }
  }
  sub_223304AE8(a1, (a2 - a1) / 32, a4);
  unint64_t v12 = (unint64_t)&v4[32 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 32)
  {
    while (1)
    {
      BOOL v13 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (!v13 && (sub_22330C418() & 1) != 0) {
        break;
      }
      BOOL v14 = v4;
      BOOL v13 = v7 == v4;
      v4 += 32;
      if (!v13) {
        goto LABEL_13;
      }
LABEL_14:
      v7 += 32;
      if ((unint64_t)v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_19;
      }
    }
    BOOL v14 = v6;
    BOOL v13 = v7 == v6;
    v6 += 32;
    if (v13) {
      goto LABEL_14;
    }
LABEL_13:
    long long v15 = *((_OWORD *)v14 + 1);
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v14;
    *((_OWORD *)v7 + 1) = v15;
    goto LABEL_14;
  }
LABEL_19:
  uint64_t v6 = v7;
LABEL_43:
  sub_223304AE8(v4, (uint64_t)(v12 - (void)v4) / 32, v6);
  return 1;
}

uint64_t sub_223301B6C(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 16;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    sub_223304A90(a2, (uint64_t)(a3 - (void)a2) / 16, a4);
    unint64_t v12 = &v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_52;
    }
    unint64_t v40 = v7;
    uint64_t v41 = v4;
    long long v25 = (char *)(a3 - 16);
    while (1)
    {
      unint64_t v43 = (unint64_t)v12;
      uint64_t v26 = v12 - 16;
      uint64_t v27 = v6 - 16;
      swift_getObjectType();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      sub_2232F34C8(&qword_267FA1758);
      uint64_t v28 = sub_22330C0C8();
      uint64_t v30 = v29;
      swift_getObjectType();
      if (v28 == sub_22330C0C8() && v30 == v31) {
        char v33 = 0;
      }
      else {
        char v33 = sub_22330C418();
      }
      uint64_t v34 = v25 + 16;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if (v33)
      {
        BOOL v35 = v34 != v6 || v25 >= v6;
        v6 -= 16;
        unint64_t v36 = (unint64_t)v40;
        unint64_t v12 = (char *)v43;
        if (!v35) {
          goto LABEL_47;
        }
      }
      else
      {
        BOOL v37 = v34 != (char *)v43 || (unint64_t)v25 >= v43;
        uint64_t v27 = v26;
        unint64_t v12 = v26;
        unint64_t v36 = (unint64_t)v40;
        if (!v37) {
          goto LABEL_47;
        }
      }
      *(_OWORD *)long long v25 = *(_OWORD *)v27;
LABEL_47:
      v25 -= 16;
      if ((unint64_t)v6 <= v36 || v12 <= v41)
      {
        uint64_t v4 = v41;
        goto LABEL_52;
      }
    }
  }
  sub_223304A90(a1, (a2 - a1) / 16, a4);
  unint64_t v12 = &v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    unint64_t v42 = &v4[16 * v9];
    while (1)
    {
      BOOL v14 = v6;
      swift_getObjectType();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      sub_2232F34C8(&qword_267FA1758);
      uint64_t v15 = sub_22330C0C8();
      uint64_t v17 = v16;
      swift_getObjectType();
      if (v15 == sub_22330C0C8() && v17 == v18) {
        break;
      }
      char v20 = sub_22330C418();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0) {
        goto LABEL_14;
      }
      BOOL v21 = v14;
      uint64_t v6 = v14 + 16;
      BOOL v22 = v7 == v14;
LABEL_15:
      unint64_t v12 = v42;
      if (!v22) {
        *(_OWORD *)uint64_t v7 = *(_OWORD *)v21;
      }
      v7 += 16;
      if (v4 >= v42 || (unint64_t)v6 >= a3) {
        goto LABEL_22;
      }
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
LABEL_14:
    BOOL v21 = v4;
    BOOL v22 = v7 == v4;
    v4 += 16;
    uint64_t v6 = v14;
    goto LABEL_15;
  }
LABEL_22:
  uint64_t v6 = v7;
LABEL_52:
  sub_223304A90(v4, (v12 - v4) / 16, v6);
  return 1;
}

char *sub_223301EBC(char *result, int64_t a2, char a3, char *a4)
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
    sub_2232F34C8(&qword_267FA1770);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_223301FB4(uint64_t a1)
{
  return sub_223301EBC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_223301FC8()
{
}

void sub_223301FDC(uint64_t a1)
{
}

void sub_223301FF0()
{
}

void sub_223302004()
{
}

void sub_223302018()
{
}

uint64_t sub_22330202C(uint64_t a1)
{
  return MEMORY[0x270F9FC28](a1, 32, 0xE100000000000000, 10, 0xE100000000000000);
}

__n128 sub_22330204C(__n128 *a1)
{
  __n128 result = *(__n128 *)(v2 - 144);
  a1[1] = result;
  a1[3].n128_u64[1] = v1;
  return result;
}

uint64_t sub_22330205C(uint64_t a1)
{
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 - 176);
  return swift_bridgeObjectRelease();
}

uint64_t sub_223302078@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + 32) = v2;
  *(void *)(a1 + 40) = (a2 - 32) | 0x8000000000000000;
  return nullsub_1();
}

uint64_t sub_223302094()
{
  return sub_22330C378();
}

uint64_t sub_2233020B8(uint64_t a1)
{
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v2 - 176);
  *(void *)(a1 + 56) = v1;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0xE000000000000000;
  return nullsub_1();
}

__n128 sub_223302114(__n128 *a1)
{
  __n128 result = *(__n128 *)(v2 - 144);
  a1[1] = result;
  a1[3].n128_u64[1] = v1;
  return result;
}

uint64_t sub_223302128@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 32) = 0xD000000000000028;
  *(void *)(result + 40) = a2 | 0x8000000000000000;
  return result;
}

uint64_t FeatureRegistry.__allocating_init()()
{
  uint64_t v0 = sub_22330BF08();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Paths.featureManagerBaseDirectory()();
  uint64_t v3 = swift_allocObject();
  FeatureRegistry.init(with:)((uint64_t)v2);
  return v3;
}

uint64_t FeatureRegistry.feature(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  swift_beginAccess();
  uint64_t v7 = *(void *)(v3 + 32);
  if (!*(void *)(v7 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_2232FA5D8(a1, a2);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return swift_endAccess();
  }
  uint64_t v10 = *(void *)(v7 + 56) + 32 * v8;
  uint64_t v11 = *(void *)(v10 + 8);
  *(void *)a3 = *(void *)v10;
  *(void *)(a3 + 8) = v11;
  *(_OWORD *)(a3 + 16) = *(_OWORD *)(v10 + 16);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t FeatureRegistry.__allocating_init(with:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  FeatureRegistry.init(with:)(a1);
  return v2;
}

void *FeatureRegistry.init(with:)(uint64_t a1)
{
  sub_2232F34C8(&qword_267FA1778);
  v1[2] = sub_22330674C();
  type metadata accessor for Transformer();
  v1[3] = sub_22330674C();
  v1[4] = sub_22330674C();
  uint64_t v3 = (char *)v1 + OBJC_IVAR____TtC28HumanUnderstandingFoundation15FeatureRegistry_baseDir;
  uint64_t v4 = sub_22330BF08();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(v3, a1, v4);
  v1[2] = sub_2233024BC();
  swift_bridgeObjectRelease();
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_22330288C(v5);
  swift_bridgeObjectRelease();
  v1[3] = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_223303A54();
  uint64_t v8 = sub_22330384C(v7, &qword_267FA17B0, (void (*)(uint64_t, uint64_t, uint64_t *))sub_223305DC8);
  uint64_t v9 = sub_223303C80();
  uint64_t v10 = sub_22330384C(v9, &qword_267FA17B0, (void (*)(uint64_t, uint64_t, uint64_t *))sub_223305DC8);
  uint64_t v11 = sub_223303EB4(v10, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_223306780();
  v12();
  swift_beginAccess();
  v1[4] = v11;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2233024BC()
{
  if (qword_267FA1528 != -1) {
    goto LABEL_44;
  }
  while (1)
  {
    uint64_t v0 = (char *)MEMORY[0x263F8EE78];
    uint64_t v35 = *(void *)(qword_267FA1E48 + 16);
    if (!v35) {
      break;
    }
    uint64_t v34 = qword_267FA1E48 + 32;
    swift_bridgeObjectRetain_n();
    uint64_t v1 = 0;
    uint64_t v2 = v0;
    while (1)
    {
      long long v39 = *(_OWORD *)(v34 + 16 * v1);
      id v3 = objc_msgSend((id)swift_unknownObjectRetain(), sel_featureNames);
      uint64_t v4 = sub_22330C1A8();

      uint64_t v5 = *(void *)(v4 + 16);
      if (v5) {
        break;
      }
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v6 = v0;
LABEL_15:
      uint64_t v21 = *((void *)v6 + 2);
      int64_t v22 = *((void *)v2 + 2);
      int64_t v23 = v22 + v21;
      if (__OFADD__(v22, v21)) {
        goto LABEL_40;
      }
      char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v23 > *((void *)v2 + 3) >> 1)
      {
        if (v22 <= v23) {
          int64_t v25 = v22 + v21;
        }
        else {
          int64_t v25 = v22;
        }
        uint64_t v2 = sub_2233040E4(isUniquelyReferenced_nonNull_native, v25, 1, (uint64_t)v2);
      }
      if (*((void *)v6 + 2))
      {
        uint64_t v26 = *((void *)v2 + 2);
        if ((*((void *)v2 + 3) >> 1) - v26 < v21) {
          goto LABEL_42;
        }
        unint64_t v27 = (unint64_t)&v2[32 * v26 + 32];
        unint64_t v28 = (unint64_t)(v6 + 32);
        if (v28 < v27 + 32 * v21 && v27 < v28 + 32 * v21)
        {
          uint64_t result = sub_22330C3D8();
          __break(1u);
          return result;
        }
        sub_2232F34C8(&qword_267FA17F8);
        swift_arrayInitWithCopy();
        if (v21)
        {
          uint64_t v30 = *((void *)v2 + 2);
          BOOL v31 = __OFADD__(v30, v21);
          uint64_t v32 = v30 + v21;
          if (v31) {
            goto LABEL_43;
          }
          *((void *)v2 + 2) = v32;
        }
      }
      else if (v21)
      {
        goto LABEL_41;
      }
      ++v1;
      swift_bridgeObjectRelease();
      if (v1 == v35)
      {
        swift_bridgeObjectRelease_n();
        return sub_22330384C((uint64_t)v2, &qword_267FA1800, (void (*)(uint64_t, uint64_t, uint64_t *))sub_223305884);
      }
    }
    uint64_t v36 = v1;
    BOOL v37 = v2;
    sub_223308194();
    uint64_t v6 = v0;
    int64_t v7 = sub_223308708(v4);
    int v9 = v8;
    char v11 = v10 & 1;
    uint64_t v38 = v4 + 56;
    while ((v7 & 0x8000000000000000) == 0 && v7 < 1 << *(unsigned char *)(v4 + 32))
    {
      if (((*(void *)(v38 + (((unint64_t)v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_38;
      }
      if (*(_DWORD *)(v4 + 36) != v9) {
        goto LABEL_39;
      }
      unint64_t v12 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v7);
      uint64_t v40 = *v12;
      uint64_t v13 = v4;
      uint64_t v14 = v12[1];
      unint64_t v16 = *((void *)v6 + 2);
      unint64_t v15 = *((void *)v6 + 3);
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      if (v16 >= v15 >> 1) {
        sub_223308194();
      }
      *((void *)v6 + 2) = v16 + 1;
      uint64_t v17 = &v6[32 * v16];
      *((void *)v17 + 4) = v40;
      *((void *)v17 + 5) = v14;
      *((_OWORD *)v17 + 3) = v39;
      int64_t v18 = sub_223308624(v7, v9, v11 & 1, v13);
      int64_t v7 = v18;
      int v9 = v19;
      char v11 = v20 & 1;
      --v5;
      uint64_t v4 = v13;
      if (!v5)
      {
        sub_2233065F4(v18, v19, v20 & 1);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v0 = (char *)MEMORY[0x263F8EE78];
        uint64_t v1 = v36;
        uint64_t v2 = v37;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    swift_once();
  }
  uint64_t v2 = (char *)MEMORY[0x263F8EE78];
  return sub_22330384C((uint64_t)v2, &qword_267FA1800, (void (*)(uint64_t, uint64_t, uint64_t *))sub_223305884);
}

uint64_t sub_22330288C(uint64_t a1)
{
  uint64_t v151 = a1;
  v155[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_2232F34C8(&qword_26AD65E20);
  MEMORY[0x270FA5388](v2 - 8);
  v145 = (char *)v126 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22330BF08();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  char isUniquelyReferenced_nonNull_native = (void (*)(uint64_t, unint64_t, uint64_t))((char *)v126
                                                                                                - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  long long v133 = (char *)v126 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  unint64_t v139 = (char *)v126 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)v126 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  int64_t v18 = (char *)v126 - v17;
  MEMORY[0x270FA5388](v16);
  char v20 = (char *)v126 - v19;
  uint64_t v129 = type metadata accessor for Transformer();
  uint64_t v21 = (void *)sub_22330C068();
  uint64_t v22 = v5 + 16;
  v148 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v148(v18, v1 + OBJC_IVAR____TtC28HumanUnderstandingFoundation15FeatureRegistry_baseDir, v4);
  sub_22330BED8();
  uint64_t v140 = v5;
  v146 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v147 = v5 + 8;
  v146(v18, v4);
  id v23 = objc_msgSend(self, sel_defaultManager);
  uint64_t v131 = v20;
  BOOL v24 = (void *)sub_22330BEB8();
  v155[0] = 0;
  id v25 = objc_msgSend(v23, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v24, 0, 1, v155);

  id v26 = v155[0];
  unint64_t v27 = &loc_22330C000;
  uint64_t v28 = MEMORY[0x263F8EE58];
  if (!v25)
  {
    id v109 = v155[0];
    unint64_t v33 = sub_22330BE88();

    swift_willThrow();
    if (qword_267FA1520 != -1) {
      goto LABEL_104;
    }
    goto LABEL_92;
  }
  uint64_t v29 = sub_22330C148();
  id v30 = v26;

  uint64_t v138 = *(void *)(v29 + 16);
  if (!v138)
  {
    unint64_t v33 = (unint64_t)v146;
    uint64_t v34 = (uint64_t)v145;
    goto LABEL_95;
  }
  v142 = v15;
  uint64_t v141 = v22;
  unint64_t v32 = 0;
  v144 = 0;
  unint64_t v137 = v29 + ((*(unsigned __int8 *)(v140 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80));
  v136 = (void (**)(char *, uint64_t, uint64_t))(v140 + 32);
  v128 = &v154;
  *(void *)&long long v31 = 136315394;
  long long v127 = v31;
  v126[1] = v28 + 8;
  unint64_t v33 = (unint64_t)v146;
  uint64_t v34 = (uint64_t)v145;
  char isUniquelyReferenced_nonNull_native = (void (*)(uint64_t, unint64_t, uint64_t))v148;
  uint64_t v132 = v4;
  uint64_t v135 = v29;
LABEL_4:
  if (v32 >= *(void *)(v29 + 16)) {
    goto LABEL_103;
  }
  uint64_t v35 = *(void *)(v140 + 72);
  unint64_t v143 = v32;
  isUniquelyReferenced_nonNull_native(v34, v137 + v35 * v32, v4);
  sub_2233065A4(v34, 0, 1, v4);
  if (sub_2233065CC(v34, 1, v4) == 1) {
    goto LABEL_96;
  }
  uint64_t v36 = v142;
  (*v136)(v142, v34, v4);
  sub_2232F3648(0, &qword_267FA17D0);
  unint64_t v27 = v139;
  isUniquelyReferenced_nonNull_native((uint64_t)v139, (unint64_t)v36, v4);
  BOOL v37 = v144;
  id v38 = sub_2233038FC((uint64_t)v27);
  if (v37)
  {
    sub_223306780();
    ((void (*)(void))v33)();

    v144 = 0;
    goto LABEL_89;
  }
  v144 = 0;
  id v149 = v38;
  id v39 = objc_msgSend(v38, sel_modelDescription);
  id v40 = objc_msgSend(v39, sel_inputDescriptionsByName);

  os_log_t v134 = (os_log_t)sub_2232F3648(0, (unint64_t *)&qword_267FA1768);
  uint64_t v41 = sub_22330C058();

  uint64_t v42 = 0;
  uint64_t v43 = v41 + 64;
  sub_223306704();
  uint64_t v4 = v45 & v44;
  v150 = (void *)((unint64_t)(v46 + 63) >> 6);
  unint64_t v27 = (void *)MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v47 = v151;
    if (v4)
    {
      unint64_t v48 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v49 = v48 | (v42 << 6);
      goto LABEL_36;
    }
    if (__OFADD__(v42, 1))
    {
LABEL_101:
      __break(1u);
LABEL_102:
      __break(1u);
LABEL_103:
      __break(1u);
LABEL_104:
      swift_once();
LABEL_92:
      uint64_t v110 = sub_22330BF98();
      sub_2232F3490(v110, (uint64_t)qword_267FA1E30);
      uint64_t v111 = v131;
      v148((char *)isUniquelyReferenced_nonNull_native, (uint64_t)v131, v4);
      id v112 = (id)v33;
      id v113 = (id)v33;
      uint64_t v114 = sub_22330BF78();
      os_log_type_t v115 = sub_22330C1D8();
      int v116 = v115;
      if (os_log_type_enabled(v114, v115))
      {
        uint64_t v117 = swift_slowAlloc();
        v155[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v117 = v27[503];
        LODWORD(v152) = v116;
        sub_223306554();
        uint64_t v118 = sub_22330C408();
        uint64_t v153 = sub_2232F9DB4(v118, v119, (uint64_t *)v155);
        sub_22330C258();
        swift_bridgeObjectRelease();
        uint64_t v120 = (char *)isUniquelyReferenced_nonNull_native;
        uint64_t v121 = v146;
        v146(v120, v4);
        *(_WORD *)(v117 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v122 = sub_22330C448();
        uint64_t v153 = sub_2232F9DB4(v122, v123, (uint64_t *)v155);
        sub_22330C258();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_2232F1000, v114, (os_log_type_t)v152, "Could not enumerate files in directory: %s with error: %s", (uint8_t *)v117, 0x16u);
        swift_arrayDestroy();
        sub_223306810();
        sub_223306810();

        v121(v131, v4);
      }
      else
      {

        uint64_t v124 = (void (*)(void))v146;
        sub_223306780();
        v124();

        ((void (*)(char *, uint64_t))v124)(v111, v4);
      }
      return (uint64_t)v21;
    }
    sub_223306804();
    if (v51 == v52) {
      goto LABEL_50;
    }
    unint64_t v53 = *(void *)(v43 + 8 * v50);
    uint64_t v42 = v50;
    if (!v53)
    {
      uint64_t v42 = v50 + 1;
      sub_223306774();
      if (v51 == v52) {
        goto LABEL_50;
      }
      unint64_t v53 = *(void *)(v43 + 8 * v42);
      if (!v53)
      {
        uint64_t v42 = v54 + 2;
        sub_223306774();
        if (v51 == v52) {
          goto LABEL_50;
        }
        unint64_t v53 = *(void *)(v43 + 8 * v42);
        if (!v53)
        {
          uint64_t v42 = v55 + 3;
          sub_223306774();
          if (v51 == v52) {
            goto LABEL_50;
          }
          unint64_t v53 = *(void *)(v43 + 8 * v42);
          if (!v53)
          {
            uint64_t v42 = v56 + 4;
            sub_223306774();
            if (v51 == v52) {
              goto LABEL_50;
            }
            unint64_t v53 = *(void *)(v43 + 8 * v42);
            if (!v53) {
              break;
            }
          }
        }
      }
    }
LABEL_35:
    uint64_t v4 = (v53 - 1) & v53;
    unint64_t v49 = __clz(__rbit64(v53)) + (v42 << 6);
LABEL_36:
    uint64_t v59 = *(void *)(v41 + 48) + 16 * v49;
    char isUniquelyReferenced_nonNull_native = *(void (**)(uint64_t, unint64_t, uint64_t))v59;
    unint64_t v60 = *(void *)(v59 + 8);
    uint64_t v61 = *(void *)(v47 + 16);
    swift_bridgeObjectRetain();
    if (!v61) {
      goto LABEL_44;
    }
    swift_bridgeObjectRetain();
    unint64_t v62 = sub_2232FA5D8((uint64_t)isUniquelyReferenced_nonNull_native, v60);
    if ((v63 & 1) == 0)
    {
      swift_bridgeObjectRelease();
LABEL_44:
      if (qword_267FA1520 != -1) {
        swift_once();
      }
      uint64_t v67 = sub_22330BF98();
      sub_2232F3490(v67, (uint64_t)qword_267FA1E30);
      uint64_t v68 = v133;
      uint64_t v4 = v132;
      v148(v133, (uint64_t)v142, v132);
      swift_bridgeObjectRetain();
      uint64_t v69 = sub_22330BF78();
      os_log_type_t v70 = sub_22330C1D8();
      int v71 = v70;
      if (os_log_type_enabled(v69, v70))
      {
        uint64_t v72 = swift_slowAlloc();
        LODWORD(v152) = v71;
        uint64_t v73 = v68;
        uint64_t v74 = v72;
        v150 = (void *)swift_slowAlloc();
        v155[0] = v150;
        *(_DWORD *)uint64_t v74 = v127;
        id v130 = (id)(v74 + 4);
        sub_223306554();
        os_log_t v134 = v69;
        uint64_t v75 = sub_22330C408();
        uint64_t v153 = sub_2232F9DB4(v75, v76, (uint64_t *)v155);
        sub_22330C258();
        swift_bridgeObjectRelease();
        v146(v73, v4);
        *(_WORD *)(v74 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v153 = sub_2232F9DB4((uint64_t)isUniquelyReferenced_nonNull_native, v60, (uint64_t *)v155);
        sub_22330C258();
        swift_bridgeObjectRelease_n();
        os_log_t v77 = v134;
        _os_log_impl(&dword_2232F1000, v134, (os_log_type_t)v152, "Could not find corresponding Signal for Transformer: %s with input: %s", (uint8_t *)v74, 0x16u);
        swift_arrayDestroy();
        sub_223306810();
        sub_223306810();
        unint64_t v33 = (unint64_t)v146;
        swift_bridgeObjectRelease();
        swift_release();
      }
      else
      {
        swift_bridgeObjectRelease_n();

        unint64_t v33 = (unint64_t)v146;
        sub_223306780();
        ((void (*)(void))v33)();
        swift_bridgeObjectRelease();
        swift_release();
      }
      uint64_t v34 = (uint64_t)v145;
      char isUniquelyReferenced_nonNull_native = (void (*)(uint64_t, unint64_t, uint64_t))v148;
LABEL_88:
      ((void (*)(char *, uint64_t))v33)(v142, v4);
LABEL_89:
      uint64_t v29 = v135;
      unint64_t v32 = v143 + 1;
      if (v143 + 1 == v138)
      {
LABEL_95:
        sub_2233065A4(v34, 1, 1, v4);
LABEL_96:
        swift_bridgeObjectRelease();
        sub_223306780();
        ((void (*)(void))v33)();
        return (uint64_t)v21;
      }
      goto LABEL_4;
    }
    long long v152 = *(_OWORD *)(*(void *)(v47 + 56) + 16 * v62);
    swift_unknownObjectRetain_n();
    swift_bridgeObjectRelease_n();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2233042AC(0, v27[2] + 1, 1, (uint64_t)v27);
      unint64_t v27 = v65;
    }
    unint64_t v33 = v27[2];
    unint64_t v64 = v27[3];
    if (v33 >= v64 >> 1)
    {
      sub_2233042AC(v64 > 1, v33 + 1, 1, (uint64_t)v27);
      unint64_t v27 = v66;
    }
    v27[2] = v33 + 1;
    *(_OWORD *)&v27[2 * v33 + 4] = v152;
    swift_unknownObjectRelease();
  }
  sub_223306804();
  if (v51 != v52)
  {
    unint64_t v53 = *(void *)(v43 + 8 * v57);
    if (!v53)
    {
      while (1)
      {
        uint64_t v42 = v57 + 1;
        if (__OFADD__(v57, 1)) {
          break;
        }
        sub_223306774();
        if (v51 == v52) {
          goto LABEL_50;
        }
        unint64_t v53 = *(void *)(v43 + 8 * v42);
        uint64_t v57 = v58 + 1;
        if (v53) {
          goto LABEL_35;
        }
      }
      __break(1u);
LABEL_106:
      __break(1u);
    }
    uint64_t v42 = v57;
    goto LABEL_35;
  }
LABEL_50:
  swift_release();
  swift_allocObject();
  id v78 = v149;
  uint64_t v79 = sub_22330AAB0(v78, (uint64_t)v27);
  id v130 = v78;
  id v80 = objc_msgSend(v78, sel_modelDescription);
  id v81 = objc_msgSend(v80, sel_outputDescriptionsByName);

  uint64_t v82 = sub_22330C058();
  uint64_t v4 = 0;
  id v149 = (id)(v82 + 64);
  *(void *)&long long v152 = v82;
  sub_223306704();
  unint64_t v27 = (void *)(v84 & v83);
  v150 = (void *)((unint64_t)(v85 + 63) >> 6);
  if ((v84 & v83) != 0)
  {
LABEL_51:
    sub_2232F3560();
    unint64_t v87 = v86 | (v4 << 6);
    goto LABEL_77;
  }
  while (2)
  {
    if (__OFADD__(v4, 1)) {
      goto LABEL_102;
    }
    sub_223306804();
    unint64_t v33 = (unint64_t)v146;
    uint64_t v34 = (uint64_t)v145;
    char isUniquelyReferenced_nonNull_native = (void (*)(uint64_t, unint64_t, uint64_t))v148;
    if (v51 == v52) {
      goto LABEL_87;
    }
    unint64_t v89 = *((void *)v149 + v88);
    uint64_t v4 = v88;
    if (!v89)
    {
      uint64_t v4 = v88 + 1;
      sub_223306768();
      if (v51 == v52) {
        goto LABEL_87;
      }
      sub_223306740();
      if (!v89)
      {
        uint64_t v4 = v90 + 2;
        sub_223306768();
        if (v51 == v52) {
          goto LABEL_87;
        }
        sub_223306740();
        if (!v89)
        {
          uint64_t v4 = v91 + 3;
          sub_223306768();
          if (v51 == v52) {
            goto LABEL_87;
          }
          sub_223306740();
          if (!v89)
          {
            uint64_t v4 = v92 + 4;
            sub_223306768();
            if (v51 == v52) {
              goto LABEL_87;
            }
            sub_223306740();
            if (!v89)
            {
              sub_223306804();
              if (v51 == v52)
              {
LABEL_87:

                swift_release();
                swift_release();
                uint64_t v4 = v132;
                goto LABEL_88;
              }
              unint64_t v89 = *((void *)v149 + v93);
              if (!v89)
              {
                while (1)
                {
                  uint64_t v4 = v93 + 1;
                  if (__OFADD__(v93, 1)) {
                    goto LABEL_106;
                  }
                  sub_223306768();
                  if (v51 == v52) {
                    goto LABEL_87;
                  }
                  sub_223306740();
                  uint64_t v93 = v94 + 1;
                  if (v89) {
                    goto LABEL_76;
                  }
                }
              }
              uint64_t v4 = v93;
            }
          }
        }
      }
    }
LABEL_76:
    unint64_t v27 = (void *)((v89 - 1) & v89);
    unint64_t v87 = __clz(__rbit64(v89)) + (v4 << 6);
LABEL_77:
    uint64_t v95 = (uint64_t *)(*(void *)(v152 + 48) + 16 * v87);
    uint64_t v96 = *v95;
    unint64_t v33 = v95[1];
    swift_bridgeObjectRetain();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = (void (*)(uint64_t, unint64_t, uint64_t))swift_isUniquelyReferenced_nonNull_native();
    v155[0] = v21;
    unint64_t v97 = sub_2232FA5D8(v96, v33);
    uint64_t v99 = v21[2];
    BOOL v100 = (v98 & 1) == 0;
    uint64_t v21 = (void *)(v99 + v100);
    if (__OFADD__(v99, v100))
    {
      __break(1u);
LABEL_100:
      __break(1u);
      goto LABEL_101;
    }
    unint64_t v101 = v97;
    char v102 = v98;
    sub_2232F34C8(&qword_267FA17D8);
    if ((sub_22330C348() & 1) == 0)
    {
LABEL_81:
      uint64_t v21 = v155[0];
      if (v102)
      {
        uint64_t v105 = *((void *)v155[0] + 7);
        swift_release();
        *(void *)(v105 + 8 * v101) = v79;
      }
      else
      {
        *((void *)v155[0] + (v101 >> 6) + 8) |= 1 << v101;
        int v106 = (uint64_t *)(v21[6] + 16 * v101);
        uint64_t *v106 = v96;
        v106[1] = v33;
        *(void *)(v21[7] + 8 * v101) = v79;
        uint64_t v107 = v21[2];
        BOOL v52 = __OFADD__(v107, 1);
        uint64_t v108 = v107 + 1;
        if (v52) {
          goto LABEL_100;
        }
        v21[2] = v108;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v27) {
        goto LABEL_51;
      }
      continue;
    }
    break;
  }
  unint64_t v103 = sub_2232FA5D8(v96, v33);
  if ((v102 & 1) == (v104 & 1))
  {
    unint64_t v101 = v103;
    goto LABEL_81;
  }
  uint64_t result = sub_22330C438();
  __break(1u);
  return result;
}

uint64_t FeatureRegistry.featureNames.getter()
{
  swift_beginAccess();
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_2232F99E0(v0);
}

uint64_t sub_22330384C(uint64_t a1, uint64_t *a2, void (*a3)(uint64_t, uint64_t, uint64_t *))
{
  if (*(void *)(a1 + 16))
  {
    sub_2232F34C8(a2);
    uint64_t v4 = sub_22330C3C8();
  }
  else
  {
    uint64_t v4 = MEMORY[0x263F8EE80];
  }
  uint64_t v7 = v4;
  uint64_t v5 = swift_bridgeObjectRetain();
  a3(v5, 1, &v7);
  swift_bridgeObjectRelease();
  return v7;
}

id sub_2233038FC(uint64_t a1)
{
  v11[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = (void *)sub_22330BEB8();
  v11[0] = 0;
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_error_, v2, v11);

  id v4 = v11[0];
  if (v3)
  {
    uint64_t v5 = sub_22330BF08();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    id v7 = v4;
    v6(a1, v5);
  }
  else
  {
    id v8 = v11[0];
    sub_22330BE88();

    swift_willThrow();
    uint64_t v9 = sub_22330BF08();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

uint64_t sub_223303A54()
{
  sub_2232FC2EC(v19);
  uint64_t v0 = v19[0];
  uint64_t v18 = v19[1];
  int64_t v1 = v19[3];
  unint64_t v2 = v19[4];
  int64_t v20 = (unint64_t)(v19[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (!v2) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v5 = __clz(__rbit64(v2));
  v2 &= v2 - 1;
  unint64_t v6 = v5 | (v1 << 6);
  while (1)
  {
    uint64_t v11 = (uint64_t *)(*(void *)(v0 + 48) + 16 * v6);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    uint64_t v14 = *(void *)(*(void *)(v0 + 56) + 8 * v6);
    swift_bridgeObjectRetain_n();
    swift_retain();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_22330437C(0, *(void *)(v4 + 16) + 1, 1, v4);
      uint64_t v4 = result;
    }
    unint64_t v16 = *(void *)(v4 + 16);
    unint64_t v15 = *(void *)(v4 + 24);
    if (v16 >= v15 >> 1)
    {
      uint64_t result = (uint64_t)sub_22330437C((char *)(v15 > 1), v16 + 1, 1, v4);
      uint64_t v4 = result;
    }
    *(void *)(v4 + 16) = v16 + 1;
    uint64_t v17 = (void *)(v4 + 48 * v16);
    v17[4] = v13;
    v17[5] = v12;
    v17[6] = v13;
    v17[7] = v12;
    v17[8] = v14;
    v17[9] = &protocol witness table for Transformer;
    if (v2) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v7 = v1 + 1;
    if (__OFADD__(v1, 1)) {
      break;
    }
    if (v7 >= v20) {
      goto LABEL_25;
    }
    unint64_t v8 = *(void *)(v18 + 8 * v7);
    int64_t v9 = v1 + 1;
    if (!v8)
    {
      int64_t v9 = v1 + 2;
      if (v1 + 2 >= v20) {
        goto LABEL_25;
      }
      unint64_t v8 = *(void *)(v18 + 8 * v9);
      if (!v8)
      {
        int64_t v9 = v1 + 3;
        if (v1 + 3 >= v20) {
          goto LABEL_25;
        }
        unint64_t v8 = *(void *)(v18 + 8 * v9);
        if (!v8)
        {
          int64_t v9 = v1 + 4;
          if (v1 + 4 >= v20) {
            goto LABEL_25;
          }
          unint64_t v8 = *(void *)(v18 + 8 * v9);
          if (!v8)
          {
            int64_t v9 = v1 + 5;
            if (v1 + 5 >= v20) {
              goto LABEL_25;
            }
            unint64_t v8 = *(void *)(v18 + 8 * v9);
            if (!v8)
            {
              int64_t v10 = v1 + 6;
              while (v10 < v20)
              {
                unint64_t v8 = *(void *)(v18 + 8 * v10++);
                if (v8)
                {
                  int64_t v9 = v10 - 1;
                  goto LABEL_18;
                }
              }
LABEL_25:
              swift_release();
              return v4;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v2 = (v8 - 1) & v8;
    unint64_t v6 = __clz(__rbit64(v8)) + (v9 << 6);
    int64_t v1 = v9;
  }
  __break(1u);
  return result;
}

uint64_t sub_223303C80()
{
  sub_2232FC2EC(v21);
  uint64_t v0 = v21[0];
  int64_t v22 = v21[3];
  unint64_t v1 = v21[4];
  uint64_t v19 = v21[1];
  int64_t v20 = (unint64_t)(v21[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v1) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v4 = __clz(__rbit64(v1));
  v1 &= v1 - 1;
  unint64_t v5 = v4 | (v22 << 6);
  while (1)
  {
    int64_t v10 = (uint64_t *)(*(void *)(v0 + 48) + 16 * v5);
    uint64_t v12 = *v10;
    uint64_t v11 = v10[1];
    uint64_t v13 = (uint64_t *)(*(void *)(v0 + 56) + 16 * v5);
    uint64_t v14 = *v13;
    uint64_t v15 = *(void *)(v13[1] + 8);
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRetain();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_22330437C(0, *(void *)(v3 + 16) + 1, 1, v3);
      uint64_t v3 = result;
    }
    unint64_t v17 = *(void *)(v3 + 16);
    unint64_t v16 = *(void *)(v3 + 24);
    if (v17 >= v16 >> 1)
    {
      uint64_t result = (uint64_t)sub_22330437C((char *)(v16 > 1), v17 + 1, 1, v3);
      uint64_t v3 = result;
    }
    *(void *)(v3 + 16) = v17 + 1;
    uint64_t v18 = (void *)(v3 + 48 * v17);
    v18[4] = v12;
    v18[5] = v11;
    v18[6] = v12;
    v18[7] = v11;
    v18[8] = v14;
    v18[9] = v15;
    if (v1) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v6 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v6 >= v20) {
      goto LABEL_25;
    }
    unint64_t v7 = *(void *)(v19 + 8 * v6);
    int64_t v8 = v22 + 1;
    if (!v7)
    {
      int64_t v8 = v22 + 2;
      if (v22 + 2 >= v20) {
        goto LABEL_25;
      }
      unint64_t v7 = *(void *)(v19 + 8 * v8);
      if (!v7)
      {
        int64_t v8 = v22 + 3;
        if (v22 + 3 >= v20) {
          goto LABEL_25;
        }
        unint64_t v7 = *(void *)(v19 + 8 * v8);
        if (!v7)
        {
          int64_t v8 = v22 + 4;
          if (v22 + 4 >= v20) {
            goto LABEL_25;
          }
          unint64_t v7 = *(void *)(v19 + 8 * v8);
          if (!v7)
          {
            int64_t v8 = v22 + 5;
            if (v22 + 5 >= v20) {
              goto LABEL_25;
            }
            unint64_t v7 = *(void *)(v19 + 8 * v8);
            if (!v7)
            {
              int64_t v9 = v22 + 6;
              while (v9 < v20)
              {
                unint64_t v7 = *(void *)(v19 + 8 * v9++);
                if (v7)
                {
                  int64_t v8 = v9 - 1;
                  goto LABEL_18;
                }
              }
LABEL_25:
              swift_release();
              return v3;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v1 = (v7 - 1) & v7;
    unint64_t v5 = __clz(__rbit64(v7)) + (v8 << 6);
    int64_t v22 = v8;
  }
  __break(1u);
  return result;
}

uint64_t sub_223303EB4(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_223305B6C(a1, (uint64_t)sub_223306518, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t FeatureRegistry.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC28HumanUnderstandingFoundation15FeatureRegistry_baseDir;
  uint64_t v2 = sub_22330BF08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t FeatureRegistry.__deallocating_deinit()
{
  FeatureRegistry.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

void sub_223304014(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_2232F3574();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_223306730();
    }
  }
  sub_223306720();
  if (v5)
  {
    sub_2232F34C8(&qword_26AD65E18);
    uint64_t v11 = swift_allocObject();
    size_t v12 = j__malloc_size((const void *)v11);
    *(void *)(v11 + 16) = v4;
    *(void *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 8);
  }
  else
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_2233049FC((char *)(a4 + 32), v4, (char *)(v11 + 32));
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = sub_22330678C();
    sub_223304474(v13, v14, v15, v16);
  }
}

char *sub_2233040E4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    sub_2232F34C8(&qword_267FA1810);
    char v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  size_t v12 = v10 + 32;
  if (v5)
  {
    sub_223304BB0((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22330458C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

void sub_2233041D4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_2232F3574();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_223306730();
    }
  }
  sub_223306720();
  if (v5)
  {
    sub_2232F34C8(&qword_267FA17E8);
    uint64_t v11 = swift_allocObject();
    size_t v12 = j__malloc_size((const void *)v11);
    *(void *)(v11 + 16) = v4;
    *(void *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 24);
  }
  else
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_223304AEC((char *)(a4 + 32), v4, (char *)(v11 + 32));
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = sub_22330678C();
    sub_2233046A4(v13, v14, v15, v16);
  }
}

void sub_2233042AC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_2232F3574();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_223306730();
    }
  }
  sub_223306720();
  if (v5)
  {
    sub_2232F34C8(&qword_267FA1760);
    uint64_t v11 = swift_allocObject();
    size_t v12 = j__malloc_size((const void *)v11);
    *(void *)(v11 + 16) = v4;
    *(void *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 16);
  }
  else
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_223304A90((char *)(a4 + 32), v4, (char *)(v11 + 32));
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = sub_22330678C();
    sub_2233047C4(v13, v14, v15, v16);
  }
}

char *sub_22330437C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    sub_2232F34C8(&qword_267FA17B8);
    char v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  size_t v12 = v10 + 32;
  if (v5)
  {
    sub_223304B50((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2233048DC(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_223304474(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_2232F34C8(&qword_26AD65DE0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_22330C3D8();
  __break(1u);
  return result;
}

uint64_t sub_22330458C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      sub_2232F34C8(&qword_267FA17F8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_22330C3D8();
  __break(1u);
  return result;
}

uint64_t sub_2233046A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_2232F34C8(&qword_267FA17F0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_22330C3D8();
  __break(1u);
  return result;
}

uint64_t sub_2233047C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      sub_2232F34C8(&qword_267FA1778);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_22330C3D8();
  __break(1u);
  return result;
}

uint64_t sub_2233048DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      sub_2232F34C8(&qword_267FA17C0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_22330C3D8();
  __break(1u);
  return result;
}

char *sub_2233049FC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_22330C3D8();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_223304A90(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_22330667C();
    uint64_t result = (char *)sub_2232F35E8();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)sub_223306660(a3, result);
  }
  return result;
}

char *sub_223304AEC(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_22330667C();
    uint64_t result = (char *)sub_2232F35E8();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)sub_223306660(a3, result);
  }
  return result;
}

char *sub_223304B50(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_22330667C();
    uint64_t result = (char *)sub_2232F35E8();
    __break(1u);
  }
  else if (a3 != result || &result[48 * a2] <= a3)
  {
    return (char *)sub_223306660(a3, result);
  }
  return result;
}

char *sub_223304BB0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_22330667C();
    uint64_t result = (char *)sub_2232F35E8();
    __break(1u);
  }
  else if (a3 != result || &result[32 * a2] <= a3)
  {
    return (char *)sub_223306660(a3, result);
  }
  return result;
}

uint64_t sub_223304C08()
{
  return type metadata accessor for FeatureRegistry();
}

uint64_t type metadata accessor for FeatureRegistry()
{
  uint64_t result = qword_267FA1798;
  if (!qword_267FA1798) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_223304C58()
{
  uint64_t result = sub_22330BF08();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for FeatureRegistry(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FeatureRegistry);
}

uint64_t dispatch thunk of FeatureRegistry.__allocating_init(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_223304D28(uint64_t a1, char a2)
{
  unint64_t v5 = v2;
  sub_2233067B4();
  sub_2232F34C8(&qword_267FA1720);
  uint64_t v7 = sub_22330C3B8();
  if (*(void *)(v3 + 16))
  {
    sub_22330679C();
    id v30 = v8;
    sub_2233066C4();
    uint64_t v29 = v9;
    swift_retain();
    uint64_t v10 = 0;
    if (!v4) {
      goto LABEL_4;
    }
LABEL_3:
    sub_2232F3560();
    for (uint64_t i = v11 | (v10 << 6); ; uint64_t i = v16 + (v10 << 6))
    {
      uint64_t v17 = *(void *)(v3 + 56) + 32 * i;
      if (a2)
      {
        sub_2232F9D50(v17, (uint64_t)v31, &qword_267FA1690);
      }
      else
      {
        sub_2232F9CE8(v17, (uint64_t)v31);
        swift_bridgeObjectRetain();
      }
      sub_22330C468();
      sub_22330C0F8();
      sub_22330C488();
      sub_2233066E4();
      if (v18)
      {
        sub_2233067C8();
        while (++v21 != v22 || (v20 & 1) == 0)
        {
          BOOL v23 = v21 == v22;
          if (v21 == v22) {
            uint64_t v21 = 0;
          }
          v20 |= v23;
          if (*(void *)(v7 + 64 + 8 * v21) != -1)
          {
            sub_22330685C();
            goto LABEL_28;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return;
      }
      sub_2233067DC();
LABEL_28:
      sub_223306694(v19);
      sub_2232F9D50((uint64_t)v31, v25 + 32 * v24, &qword_267FA1690);
      ++*(void *)(v7 + 16);
      if (v4) {
        goto LABEL_3;
      }
LABEL_4:
      uint64_t v13 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_39;
      }
      if (v13 >= v29) {
        break;
      }
      uint64_t v14 = v30;
      ++v10;
      if (!v30[v13])
      {
        uint64_t v10 = v13 + 1;
        if (v13 + 1 >= v29) {
          goto LABEL_30;
        }
        if (!v30[v10])
        {
          uint64_t v15 = v13 + 2;
          if (v15 >= v29)
          {
LABEL_30:
            swift_release();
            if ((a2 & 1) == 0) {
              goto LABEL_37;
            }
            goto LABEL_33;
          }
          if (!v30[v15])
          {
            while (1)
            {
              uint64_t v10 = v15 + 1;
              if (__OFADD__(v15, 1)) {
                goto LABEL_40;
              }
              if (v10 >= v29) {
                goto LABEL_30;
              }
              ++v15;
              if (v30[v10]) {
                goto LABEL_15;
              }
            }
          }
          uint64_t v10 = v15;
        }
      }
LABEL_15:
      sub_2233067F0();
    }
    swift_release();
    uint64_t v14 = v30;
    if ((a2 & 1) == 0) {
      goto LABEL_37;
    }
LABEL_33:
    sub_223306848();
    if (v27 != v28) {
      void *v14 = -1 << v26;
    }
    else {
      sub_223306828(v26);
    }
    *(void *)(v3 + 16) = 0;
  }
LABEL_37:
  swift_release();
  *unint64_t v5 = v7;
}

uint64_t sub_223304F7C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_2232F34C8(&qword_267FA1800);
  char v36 = a2;
  uint64_t v6 = sub_22330C3B8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v2;
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  if (!v10) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v15 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v14 << 6))
  {
    uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * i);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_22330C468();
    sub_22330C0F8();
    uint64_t result = sub_22330C488();
    uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6))) == 0)
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v24) >> 6;
      while (++v26 != v29 || (v28 & 1) == 0)
      {
        BOOL v30 = v26 == v29;
        if (v26 == v29) {
          unint64_t v26 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v12 + 8 * v26);
        if (v31 != -1)
        {
          unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v12 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    unint64_t v32 = (void *)(*(void *)(v7 + 48) + 16 * v27);
    void *v32 = v23;
    v32[1] = v22;
    *(_OWORD *)(*(void *)(v7 + 56) + 16 * v27) = v37;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v17 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      goto LABEL_41;
    }
    if (v17 >= v11)
    {
      swift_release();
      uint64_t v3 = v34;
      char v18 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    char v18 = (void *)(v5 + 64);
    unint64_t v19 = *(void *)(v35 + 8 * v17);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v17 + 1;
      if (v17 + 1 >= v11) {
        goto LABEL_32;
      }
      unint64_t v19 = *(void *)(v35 + 8 * v14);
      if (!v19) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v19 - 1) & v19;
  }
  int64_t v20 = v17 + 2;
  if (v20 < v11)
  {
    unint64_t v19 = *(void *)(v35 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        int64_t v14 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          goto LABEL_42;
        }
        if (v14 >= v11) {
          goto LABEL_32;
        }
        unint64_t v19 = *(void *)(v35 + 8 * v14);
        ++v20;
        if (v19) {
          goto LABEL_18;
        }
      }
    }
    int64_t v14 = v20;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  uint64_t v3 = v34;
LABEL_34:
  if (v36)
  {
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    if (v33 >= 64) {
      sub_2232FA830(0, (unint64_t)(v33 + 63) >> 6, v18);
    }
    else {
      *char v18 = -1 << v33;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

void sub_223305280(uint64_t a1, char a2)
{
  uint64_t v5 = v2;
  sub_2233067B4();
  sub_2232F34C8(&qword_267FA17E0);
  char v31 = a2;
  uint64_t v7 = sub_22330C3B8();
  if (!*(void *)(v3 + 16)) {
    goto LABEL_36;
  }
  sub_22330679C();
  BOOL v30 = v8;
  sub_2233066C4();
  uint64_t v29 = v9;
  swift_retain();
  uint64_t v10 = 0;
  if (!v4) {
    goto LABEL_4;
  }
LABEL_3:
  sub_2232F3560();
  for (uint64_t i = v11 | (v10 << 6); ; uint64_t i = v16 + (v10 << 6))
  {
    uint64_t v17 = *(void *)(*(void *)(v3 + 56) + 8 * i);
    if ((v31 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_22330C468();
    sub_22330C0F8();
    sub_22330C488();
    sub_2233066E4();
    if (v18)
    {
      sub_2233067C8();
      while (++v21 != v22 || (v20 & 1) == 0)
      {
        BOOL v23 = v21 == v22;
        if (v21 == v22) {
          uint64_t v21 = 0;
        }
        v20 |= v23;
        if (*(void *)(v7 + 64 + 8 * v21) != -1)
        {
          sub_22330685C();
          goto LABEL_27;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      return;
    }
    sub_2233067DC();
LABEL_27:
    sub_223306694(v19);
    *(void *)(v25 + 8 * v24) = v17;
    ++*(void *)(v7 + 16);
    if (v4) {
      goto LABEL_3;
    }
LABEL_4:
    uint64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_38;
    }
    if (v13 >= v29)
    {
      swift_release();
      int64_t v14 = v30;
      goto LABEL_31;
    }
    int64_t v14 = v30;
    ++v10;
    if (!v30[v13])
    {
      uint64_t v10 = v13 + 1;
      if (v13 + 1 >= v29) {
        goto LABEL_29;
      }
      if (!v30[v10]) {
        break;
      }
    }
LABEL_15:
    sub_2233067F0();
  }
  uint64_t v15 = v13 + 2;
  if (v15 < v29)
  {
    if (!v30[v15])
    {
      while (1)
      {
        uint64_t v10 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_39;
        }
        if (v10 >= v29) {
          goto LABEL_29;
        }
        ++v15;
        if (v30[v10]) {
          goto LABEL_15;
        }
      }
    }
    uint64_t v10 = v15;
    goto LABEL_15;
  }
LABEL_29:
  swift_release();
LABEL_31:
  if (v31)
  {
    sub_223306848();
    if (v27 != v28) {
      void *v14 = -1 << v26;
    }
    else {
      sub_223306828(v26);
    }
    *(void *)(v3 + 16) = 0;
  }
LABEL_36:
  swift_release();
  *uint64_t v5 = v7;
}

uint64_t sub_2233054BC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_2232F34C8(&qword_267FA17B0);
  char v38 = a2;
  uint64_t v6 = sub_22330C3B8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    long long v37 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v36 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      unint64_t v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      uint64_t v22 = *(void *)(v5 + 56) + 32 * i;
      uint64_t v23 = *(void *)v22;
      long long v39 = *(_OWORD *)(v22 + 8);
      uint64_t v24 = *(void *)(v22 + 24);
      if ((v38 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
      }
      sub_22330C468();
      sub_22330C0F8();
      uint64_t result = sub_22330C488();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) == 0)
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v25) >> 6;
        while (++v27 != v30 || (v29 & 1) == 0)
        {
          BOOL v31 = v27 == v30;
          if (v27 == v30) {
            unint64_t v27 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v11 + 8 * v27);
          if (v32 != -1)
          {
            unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
      uint64_t v33 = (void *)(*(void *)(v7 + 48) + 16 * v28);
      *uint64_t v33 = v21;
      v33[1] = v20;
      uint64_t v34 = *(void *)(v7 + 56) + 32 * v28;
      *(void *)uint64_t v34 = v23;
      *(_OWORD *)(v34 + 8) = v39;
      *(void *)(v34 + 24) = v24;
      ++*(void *)(v7 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_39;
      }
      if (v16 >= v36) {
        goto LABEL_32;
      }
      unint64_t v17 = v37[v16];
      ++v13;
      if (!v17)
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v36) {
          goto LABEL_32;
        }
        unint64_t v17 = v37[v13];
        if (!v17)
        {
          int64_t v18 = v16 + 2;
          if (v18 >= v36)
          {
LABEL_32:
            swift_release();
            uint64_t v3 = v2;
            if (v38)
            {
              uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
              if (v35 >= 64) {
                sub_2232FA830(0, (unint64_t)(v35 + 63) >> 6, v37);
              }
              else {
                *long long v37 = -1 << v35;
              }
              *(void *)(v5 + 16) = 0;
            }
            break;
          }
          unint64_t v17 = v37[v18];
          if (!v17)
          {
            while (1)
            {
              int64_t v13 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_40;
              }
              if (v13 >= v36) {
                goto LABEL_32;
              }
              unint64_t v17 = v37[v13];
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          int64_t v13 = v18;
        }
      }
LABEL_18:
      unint64_t v10 = (v17 - 1) & v17;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_2233057E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a2;
}

uint64_t sub_223305828(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *a1 = a4;
  a1[1] = a5;
  a1[2] = a6;
  a1[3] = a7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a2;
}

void sub_223305884(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  for (unint64_t i = (_OWORD *)(swift_bridgeObjectRetain() + 48); ; i += 2)
  {
    uint64_t v7 = *((void *)i - 2);
    uint64_t v6 = *((void *)i - 1);
    long long v25 = *i;
    uint64_t v8 = (void *)*a3;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t v10 = sub_2232FA5D8(v7, v6);
    uint64_t v11 = v8[2];
    BOOL v12 = (v9 & 1) == 0;
    uint64_t v13 = v11 + v12;
    if (__OFADD__(v11, v12))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_22330C438();
      __break(1u);
      goto LABEL_20;
    }
    char v14 = v9;
    if (v8[3] < v13) {
      break;
    }
    if (a2)
    {
      if (v9) {
        goto LABEL_14;
      }
    }
    else
    {
      sub_2232F34C8(&qword_267FA1808);
      sub_22330C358();
      if (v14) {
        goto LABEL_14;
      }
    }
LABEL_10:
    unint64_t v17 = (void *)*a3;
    *(void *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    int64_t v18 = (uint64_t *)(v17[6] + 16 * v10);
    *int64_t v18 = v7;
    v18[1] = v6;
    *(_OWORD *)(v17[7] + 16 * v10) = v25;
    uint64_t v19 = v17[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_18;
    }
    v17[2] = v21;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_223304F7C(v13, a2 & 1);
  unint64_t v15 = sub_2232FA5D8(v7, v6);
  if ((v14 & 1) != (v16 & 1)) {
    goto LABEL_19;
  }
  unint64_t v10 = v15;
  if ((v14 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v22 = (void *)swift_allocError();
  swift_willThrow();
  id v23 = v22;
  sub_2232F34C8(&qword_267FA1730);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();

    return;
  }
LABEL_20:
  sub_22330C2A8();
  sub_22330C108();
  sub_22330C338();
  sub_22330C108();
  sub_22330C388();
  __break(1u);
}

uint64_t sub_223305B6C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  sub_223306104(a1, a2, a3, v41);
  long long v37 = v41[0];
  long long v38 = v41[1];
  long long v39 = v41[2];
  uint64_t v40 = v42;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_223306324(&v33);
  uint64_t v7 = *((void *)&v33 + 1);
  if (*((void *)&v33 + 1))
  {
    while (1)
    {
      uint64_t v8 = v33;
      uint64_t v9 = v34;
      uint64_t v10 = v35;
      long long v32 = v36;
      uint64_t v11 = (void *)*a5;
      unint64_t v13 = sub_2232FA5D8(v33, v7);
      uint64_t v14 = v11[2];
      BOOL v15 = (v12 & 1) == 0;
      uint64_t v16 = v14 + v15;
      if (__OFADD__(v14, v15)) {
        break;
      }
      char v17 = v12;
      if (v11[3] >= v16)
      {
        if ((a4 & 1) == 0)
        {
          sub_2232F34C8(&qword_267FA17A8);
          sub_22330C358();
        }
      }
      else
      {
        sub_2233054BC(v16, a4 & 1);
        unint64_t v18 = sub_2232FA5D8(v8, v7);
        if ((v17 & 1) != (v19 & 1)) {
          goto LABEL_16;
        }
        unint64_t v13 = v18;
      }
      BOOL v20 = (void *)*a5;
      if (v17)
      {
        uint64_t v21 = v20[7] + 32 * v13;
        uint64_t v23 = *(void *)v21;
        uint64_t v22 = *(void *)(v21 + 8);
        swift_bridgeObjectRetain();
        long long v31 = *(_OWORD *)(v21 + 16);
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v24 = v20[7] + 32 * v13;
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        *(void *)uint64_t v24 = v23;
        *(void *)(v24 + 8) = v22;
        *(_OWORD *)(v24 + 16) = v31;
      }
      else
      {
        v20[(v13 >> 6) + 8] |= 1 << v13;
        long long v25 = (uint64_t *)(v20[6] + 16 * v13);
        *long long v25 = v8;
        v25[1] = v7;
        uint64_t v26 = v20[7] + 32 * v13;
        *(void *)uint64_t v26 = v9;
        *(void *)(v26 + 8) = v10;
        *(_OWORD *)(v26 + 16) = v32;
        uint64_t v27 = v20[2];
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28) {
          goto LABEL_15;
        }
        v20[2] = v29;
      }
      sub_223306324(&v33);
      uint64_t v7 = *((void *)&v33 + 1);
      a4 = 1;
      if (!*((void *)&v33 + 1)) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    uint64_t result = sub_22330C438();
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    swift_release();
    sub_2232FC38C();
    return swift_release();
  }
  return result;
}

void sub_223305DC8(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (!v4)
  {
LABEL_18:
    swift_bridgeObjectRelease_n();
    return;
  }
  unint64_t v5 = 0;
  uint64_t v6 = a1 + 40;
  while (1)
  {
    if (v5 >= *(void *)(a1 + 16))
    {
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      sub_22330C438();
      __break(1u);
      goto LABEL_24;
    }
    uint64_t v7 = *(void *)(v6 + 32);
    long long v31 = *(_OWORD *)(v6 + 16);
    uint64_t v9 = *(void *)v6;
    uint64_t v8 = *(void *)(v6 + 8);
    uint64_t v10 = *(void *)(v6 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    if (!v9) {
      goto LABEL_18;
    }
    uint64_t v29 = v8;
    uint64_t v11 = (void *)*a3;
    unint64_t v13 = sub_2232FA5D8(v10, v9);
    uint64_t v14 = v11[2];
    BOOL v15 = (v12 & 1) == 0;
    uint64_t v16 = v14 + v15;
    if (__OFADD__(v14, v15)) {
      goto LABEL_21;
    }
    char v17 = v12;
    if (v11[3] < v16) {
      break;
    }
    if (a2)
    {
      if (v12) {
        goto LABEL_16;
      }
    }
    else
    {
      sub_2232F34C8(&qword_267FA17A8);
      sub_22330C358();
      if (v17) {
        goto LABEL_16;
      }
    }
LABEL_12:
    BOOL v20 = (void *)*a3;
    *(void *)(*a3 + 8 * (v13 >> 6) + 64) |= 1 << v13;
    uint64_t v21 = (uint64_t *)(v20[6] + 16 * v13);
    uint64_t *v21 = v10;
    v21[1] = v9;
    uint64_t v22 = v20[7] + 32 * v13;
    *(void *)uint64_t v22 = v29;
    *(_OWORD *)(v22 + 8) = v31;
    *(void *)(v22 + 24) = v7;
    uint64_t v23 = v20[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_22;
    }
    ++v5;
    v20[2] = v25;
    v6 += 48;
    a2 = 1;
    if (v4 == v5) {
      goto LABEL_18;
    }
  }
  sub_2233054BC(v16, a2 & 1);
  unint64_t v18 = sub_2232FA5D8(v10, v9);
  if ((v17 & 1) != (v19 & 1)) {
    goto LABEL_23;
  }
  unint64_t v13 = v18;
  if ((v17 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_16:
  uint64_t v26 = (void *)swift_allocError();
  swift_willThrow();
  id v27 = v26;
  sub_2232F34C8(&qword_267FA1730);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();

    return;
  }
LABEL_24:
  sub_22330C2A8();
  sub_22330C108();
  sub_22330C338();
  sub_22330C108();
  sub_22330C388();
  __break(1u);
}

uint64_t sub_223306104@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_223306140@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    uint64_t v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_2232F9CE8(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v18 < v15)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  *unint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  char v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_2232F9D50((uint64_t)&v23, (uint64_t)v22, &qword_267FA16A0);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_223306600((uint64_t)v21);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_223306324@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  int64_t v5 = v1[3];
  unint64_t v4 = v1[4];
  int64_t v6 = v5;
  if (!v4)
  {
    int64_t v18 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      return result;
    }
    int64_t v19 = (unint64_t)(v1[2] + 64) >> 6;
    if (v18 < v19)
    {
      uint64_t v20 = v1[1];
      unint64_t v21 = *(void *)(v20 + 8 * v18);
      if (v21)
      {
LABEL_9:
        uint64_t v7 = (v21 - 1) & v21;
        unint64_t v8 = __clz(__rbit64(v21)) + (v18 << 6);
        int64_t v6 = v18;
        goto LABEL_3;
      }
      int64_t v22 = v5 + 2;
      int64_t v6 = v5 + 1;
      if (v5 + 2 < v19)
      {
        unint64_t v21 = *(void *)(v20 + 8 * v22);
        if (v21)
        {
LABEL_12:
          int64_t v18 = v22;
          goto LABEL_9;
        }
        int64_t v6 = v5 + 2;
        if (v5 + 3 < v19)
        {
          unint64_t v21 = *(void *)(v20 + 8 * (v5 + 3));
          if (v21)
          {
            int64_t v18 = v5 + 3;
            goto LABEL_9;
          }
          int64_t v22 = v5 + 4;
          int64_t v6 = v5 + 3;
          if (v5 + 4 < v19)
          {
            unint64_t v21 = *(void *)(v20 + 8 * v22);
            if (v21) {
              goto LABEL_12;
            }
            int64_t v18 = v5 + 5;
            int64_t v6 = v5 + 4;
            if (v5 + 5 < v19)
            {
              unint64_t v21 = *(void *)(v20 + 8 * v18);
              if (v21) {
                goto LABEL_9;
              }
              int64_t v6 = v19 - 1;
              int64_t v23 = v5 + 6;
              while (v23 < v19)
              {
                unint64_t v21 = *(void *)(v20 + 8 * v23++);
                if (v21)
                {
                  int64_t v18 = v23 - 1;
                  goto LABEL_9;
                }
              }
            }
          }
        }
      }
    }
    v1[3] = v6;
    v1[4] = 0;
    *a1 = 0u;
    a1[1] = 0u;
    a1[2] = 0u;
    return result;
  }
  uint64_t v7 = (v4 - 1) & v4;
  unint64_t v8 = __clz(__rbit64(v4)) | (v5 << 6);
LABEL_3:
  uint64_t v9 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v8);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = *(void *)(v3 + 56) + 32 * v8;
  uint64_t v13 = *(void *)v12;
  uint64_t v14 = *(void *)(v12 + 8);
  int64_t v15 = (void (*)(void *))v1[5];
  v24[0] = v10;
  v24[1] = v11;
  _OWORD v24[2] = v13;
  v24[3] = v14;
  long long v16 = *(_OWORD *)(v12 + 16);
  v1[3] = v6;
  v1[4] = v7;
  long long v25 = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  v15(v24);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_223306518@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_223305828(a2 + 2, *a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
  *a2 = result;
  a2[1] = v4;
  return result;
}

unint64_t sub_223306554()
{
  unint64_t result = qword_267FA17C8;
  if (!qword_267FA17C8)
  {
    sub_22330BF08();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267FA17C8);
  }
  return result;
}

uint64_t sub_2233065A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_2233065CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_2233065F4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_223306600(uint64_t a1)
{
  uint64_t v2 = sub_2232F34C8(&qword_267FA1818);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_223306660@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

void sub_223306694(unint64_t a1@<X8>)
{
  *(void *)(v2 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << a1;
  int64_t v5 = (void *)(*(void *)(v1 + 48) + 16 * a1);
  *int64_t v5 = v4;
  v5[1] = v3;
}

uint64_t sub_22330674C()
{
  return sub_22330C068();
}

uint64_t sub_22330678C()
{
  return 0;
}

void sub_223306810()
{
  JUMPOUT(0x223CB4130);
}

uint64_t sub_223306828@<X0>(uint64_t a1@<X8>)
{
  return sub_2232FA830(0, (unint64_t)(a1 + 63) >> 6, v1);
}

uint64_t sub_223306870(uint64_t a1)
{
  return sub_223306938(a1, qword_267FA1E18);
}

uint64_t *sub_223306888(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2233068EC(uint64_t a1)
{
  return sub_223306938(a1, qword_267FA1E30);
}

uint64_t sub_223306918(uint64_t a1)
{
  return sub_223306938(a1, qword_26AD65ED0);
}

uint64_t sub_223306938(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_22330BF98();
  sub_223306888(v3, a2);
  sub_2232F3490(v3, (uint64_t)a2);
  return sub_22330BF88();
}

uint64_t MLFeatureProvider.toDict()(uint64_t a1)
{
  id v3 = objc_msgSend(v1, sel_featureNames);
  uint64_t v4 = sub_22330C1A8();

  uint64_t v5 = sub_22330C068();
  v8[2] = a1;
  uint64_t v9 = v1;
  uint64_t v6 = sub_223306B8C(v5, (void (*)(uint64_t *, void *))sub_223306B58, (uint64_t)v8, v4);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_223306A78(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v5 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)sub_22330C078();
  id v7 = objc_msgSend(a3, sel_featureValueForName_, v6);

  if (v7 && (Swift::String_optional v8 = MLFeatureValue.toString()(), v7, v8.value._object))
  {
    sub_223309F90(v8.value._countAndFlagsBits, (uint64_t)v8.value._object, v5, v4);
  }
  else
  {
    sub_223309D74(v5, v4);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_223306B58(uint64_t a1, uint64_t *a2)
{
  return sub_223306A78(a1, a2, *(void **)(v2 + 24));
}

uint64_t sub_223306B74(uint64_t a1, void (*a2)(uint64_t *, void *), uint64_t a3, uint64_t a4)
{
  return sub_223306B8C(a1, a2, a3, a4);
}

uint64_t sub_223306B8C(uint64_t a1, void (*a2)(uint64_t *, void *), uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a1;
  uint64_t v7 = a4 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a4 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a4 + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v13 = 0;
  if (!v10) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
  {
    int64_t v19 = (void *)(*(void *)(a4 + 48) + 16 * i);
    uint64_t v20 = v19[1];
    v21[0] = *v19;
    v21[1] = v20;
    swift_bridgeObjectRetain();
    a2(&v22, v21);
    if (v4)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v13++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v13 >= v11) {
      goto LABEL_26;
    }
    unint64_t v17 = *(void *)(v7 + 8 * v13);
    if (!v17) {
      break;
    }
LABEL_17:
    unint64_t v10 = (v17 - 1) & v17;
  }
  int64_t v18 = v13 + 1;
  if (v13 + 1 >= v11) {
    goto LABEL_26;
  }
  unint64_t v17 = *(void *)(v7 + 8 * v18);
  if (v17) {
    goto LABEL_16;
  }
  int64_t v18 = v13 + 2;
  if (v13 + 2 >= v11) {
    goto LABEL_26;
  }
  unint64_t v17 = *(void *)(v7 + 8 * v18);
  if (v17) {
    goto LABEL_16;
  }
  int64_t v18 = v13 + 3;
  if (v13 + 3 >= v11) {
    goto LABEL_26;
  }
  unint64_t v17 = *(void *)(v7 + 8 * v18);
  if (v17) {
    goto LABEL_16;
  }
  int64_t v18 = v13 + 4;
  if (v13 + 4 >= v11)
  {
LABEL_26:
    swift_release();
    return v22;
  }
  unint64_t v17 = *(void *)(v7 + 8 * v18);
  if (v17)
  {
LABEL_16:
    int64_t v13 = v18;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v13 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v13 >= v11) {
      goto LABEL_26;
    }
    unint64_t v17 = *(void *)(v7 + 8 * v13);
    ++v18;
    if (v17) {
      goto LABEL_17;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

Swift::String __swiftcall MLFeatureProvider.toJSONString()()
{
  uint64_t v1 = v0;
  v19[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_22330C0B8();
  MEMORY[0x270FA5388](v2 - 8);
  id v3 = self;
  MLFeatureProvider.toDict()(v1);
  uint64_t v4 = (void *)sub_22330C048();
  swift_bridgeObjectRelease();
  v19[0] = 0;
  id v5 = objc_msgSend(v3, sel_dataWithJSONObject_options_error_, v4, 1, v19);

  id v6 = v19[0];
  if (!v5)
  {
    unint64_t v14 = v6;
    int64_t v15 = (void *)sub_22330BE88();

    swift_willThrow();
LABEL_6:
    uint64_t v12 = 0;
    unint64_t v13 = 0xE000000000000000;
    goto LABEL_7;
  }
  uint64_t v7 = sub_22330BF18();
  unint64_t v9 = v8;

  sub_22330C0A8();
  uint64_t v10 = sub_22330C098();
  if (!v11)
  {
    sub_223306EF8(v7, v9);
    goto LABEL_6;
  }
  uint64_t v12 = v10;
  unint64_t v13 = v11;
  sub_223306EF8(v7, v9);
LABEL_7:
  uint64_t v16 = v12;
  unint64_t v17 = (void *)v13;
  result._object = v17;
  result._uint64_t countAndFlagsBits = v16;
  return result;
}

uint64_t sub_223306EF8(uint64_t a1, unint64_t a2)
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

Swift::String_optional __swiftcall MLFeatureValue.toString()()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_type);
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  switch((unint64_t)v2)
  {
    case 1uLL:
      objc_msgSend(v1, sel_int64Value);
      uint64_t v5 = sub_22330C408();
      goto LABEL_4;
    case 2uLL:
      objc_msgSend(v1, sel_doubleValue);
      uint64_t v5 = sub_22330C188();
LABEL_4:
      uint64_t v3 = v5;
      uint64_t v4 = v6;
      goto LABEL_10;
    case 3uLL:
      id v7 = objc_msgSend(v1, sel_stringValue);
      uint64_t v8 = sub_22330C088();
      goto LABEL_8;
    case 5uLL:
      id v10 = objc_msgSend(v1, sel_multiArrayValue);
      if (v10)
      {
        id v7 = v10;
        uint64_t v8 = sub_223307094();
LABEL_8:
        uint64_t v3 = v8;
        uint64_t v4 = v9;
      }
      else
      {
        uint64_t v3 = 0;
        uint64_t v4 = 0;
      }
LABEL_10:
      uint64_t v11 = v3;
      uint64_t v12 = v4;
      result.value._object = v12;
      result.value._uint64_t countAndFlagsBits = v11;
      return result;
    default:
      goto LABEL_10;
  }
}

uint64_t sub_223307094()
{
  uint64_t v1 = sub_2232F34C8(&qword_267FA1820);
  sub_2232F49B0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  sub_2232F360C();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_2232F34C8(&qword_267FA1828);
  sub_2232F49B0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  sub_2232F360C();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_2232F34C8(&qword_267FA1830);
  sub_2232F49B0();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  sub_2232F360C();
  uint64_t v21 = v20 - v19;
  id v22 = objc_msgSend(v0, sel_dataType);
  if (v22 == (id)65568)
  {
    id v26 = v0;
    uint64_t v24 = MEMORY[0x263F8D5C8];
    sub_22330BFA8();
    sub_223307354(&qword_267FA1840, &qword_267FA1828);
    uint64_t v25 = sub_22330BFB8();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
  }
  else
  {
    if (v22 == (id)65600)
    {
      id v29 = v0;
      uint64_t v30 = MEMORY[0x263F8D538];
      sub_22330BFA8();
      sub_223307354(&qword_267FA1838, &qword_267FA1820);
      uint64_t v31 = sub_22330BFB8();
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v1);
      uint64_t v27 = v31;
      uint64_t v28 = v30;
      goto LABEL_8;
    }
    if (v22 != (id)131104) {
      return 0;
    }
    id v23 = v0;
    uint64_t v24 = MEMORY[0x263F8E548];
    sub_22330BFA8();
    sub_223307354(&qword_267FA1848, &qword_267FA1830);
    uint64_t v25 = sub_22330BFB8();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v21, v15);
  }
  uint64_t v27 = v25;
  uint64_t v28 = v24;
LABEL_8:
  uint64_t v32 = MEMORY[0x223CB3820](v27, v28);
  swift_bridgeObjectRelease();
  return v32;
}

uint64_t sub_223307354(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2232F4634(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2233073A4(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_50;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (!v2) {
      break;
    }
    uint64_t v4 = 0;
    unint64_t v41 = v1;
    unint64_t v42 = v1 & 0xC000000000000001;
    long long v39 = (char *)(v1 + 32);
    uint64_t v40 = v2;
    uint64_t v5 = MEMORY[0x263F8EE78];
    while (1)
    {
      if (v42)
      {
        uint64_t v6 = (void *)MEMORY[0x223CB3990](v4, v1);
      }
      else
      {
        uint64_t v6 = *(void **)&v39[8 * v4];
        swift_unknownObjectRetain();
      }
      BOOL v7 = __OFADD__(v4++, 1);
      if (v7) {
        break;
      }
      uint64_t v44 = v5;
      id v8 = objc_msgSend(v6, sel_featureNames);
      uint64_t v9 = sub_22330C1A8();

      uint64_t v10 = *(void *)(v9 + 16);
      if (v10)
      {
        uint64_t v43 = v4;
        sub_2233081D8();
        uint64_t v11 = v3;
        int64_t v12 = sub_223308708(v9);
        int v14 = v13;
        char v16 = v15 & 1;
        while ((v12 & 0x8000000000000000) == 0 && v12 < 1 << *(unsigned char *)(v9 + 32))
        {
          if (((*(void *)(v9 + 56 + (((unint64_t)v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
            goto LABEL_43;
          }
          if (*(_DWORD *)(v9 + 36) != v14) {
            goto LABEL_44;
          }
          char v46 = v16;
          uint64_t v17 = (uint64_t *)(*(void *)(v9 + 48) + 16 * v12);
          uint64_t v18 = v17[1];
          uint64_t v45 = *v17;
          unint64_t v1 = (unint64_t)v6;
          unint64_t v20 = *(void *)(v11 + 16);
          unint64_t v19 = *(void *)(v11 + 24);
          swift_bridgeObjectRetain();
          swift_unknownObjectRetain();
          if (v20 >= v19 >> 1) {
            sub_2233081D8();
          }
          *(void *)(v11 + 16) = v20 + 1;
          uint64_t v21 = (void *)(v11 + 24 * v20);
          v21[4] = v45;
          void v21[5] = v18;
          v21[6] = v1;
          int64_t v22 = sub_223308624(v12, v14, v46 & 1, v9);
          int64_t v12 = v22;
          int v14 = v23;
          char v16 = v24 & 1;
          --v10;
          uint64_t v6 = (void *)v1;
          if (!v10)
          {
            sub_2233065F4(v22, v23, v16);
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v2 = v40;
            unint64_t v1 = v41;
            uint64_t v3 = MEMORY[0x263F8EE78];
            uint64_t v4 = v43;
            goto LABEL_20;
          }
        }
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
        break;
      }
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v11 = v3;
LABEL_20:
      uint64_t v25 = v11;
      uint64_t v26 = *(void *)(v11 + 16);
      uint64_t v5 = v44;
      uint64_t v27 = *(void *)(v44 + 16);
      uint64_t v28 = v27 + v26;
      if (__OFADD__(v27, v26)) {
        goto LABEL_46;
      }
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v28 > *(void *)(v44 + 24) >> 1)
      {
        if (v27 <= v28) {
          uint64_t v30 = v27 + v26;
        }
        else {
          uint64_t v30 = v27;
        }
        sub_2233041D4(isUniquelyReferenced_nonNull_native, v30, 1, v44);
        uint64_t v5 = v31;
      }
      if (*(void *)(v25 + 16))
      {
        uint64_t v32 = *(void *)(v5 + 16);
        if ((*(void *)(v5 + 24) >> 1) - v32 < v26) {
          goto LABEL_48;
        }
        unint64_t v33 = v5 + 24 * v32 + 32;
        if (v25 + 32 < v33 + 24 * v26 && v33 < v25 + 32 + 24 * v26)
        {
          sub_223308788();
          sub_2233087B0();
          uint64_t result = sub_22330880C();
          __break(1u);
          return result;
        }
        sub_2232F34C8(&qword_267FA17F0);
        swift_arrayInitWithCopy();
        if (v26)
        {
          uint64_t v35 = *(void *)(v5 + 16);
          BOOL v7 = __OFADD__(v35, v26);
          uint64_t v36 = v35 + v26;
          if (v7) {
            goto LABEL_49;
          }
          *(void *)(v5 + 16) = v36;
        }
      }
      else if (v26)
      {
        goto LABEL_47;
      }
      swift_bridgeObjectRelease();
      if (v4 == v2) {
        goto LABEL_41;
      }
    }
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_22330C398();
  }
  uint64_t v5 = MEMORY[0x263F8EE78];
LABEL_41:
  swift_bridgeObjectRelease_n();
  *(void *)(v38 + 16) = sub_22330777C(v5);
  return v38;
}

uint64_t sub_22330777C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_2232F34C8(&qword_267FA17E0);
    uint64_t v3 = sub_22330C3C8();
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE80];
  }
  uint64_t v6 = v3;
  sub_223307FBC(a1, 1, &v6);
  uint64_t v4 = v6;
  if (v1) {
    swift_release();
  }
  return v4;
}

uint64_t MultiFeatureProvider.featureNames.getter()
{
  swift_beginAccess();
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_2232F99E0(v0);
}

MLFeatureValue_optional __swiftcall MultiFeatureProvider.featureValue(for:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 16);
  if (!*(void *)(v4 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_2232FA5D8(countAndFlagsBits, (uint64_t)object);
  if ((v6 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    swift_endAccess();
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  BOOL v7 = *(void **)(*(void *)(v4 + 56) + 8 * v5);
  swift_unknownObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRelease();
  id v8 = (void *)sub_22330C078();
  uint64_t v9 = (objc_class *)objc_msgSend(v7, sel_featureValueForName_, v8);
  swift_unknownObjectRelease();

LABEL_6:
  uint64_t v11 = v9;
  result.value.super.isa = v11;
  result.is_nil = v10;
  return result;
}

uint64_t MultiFeatureProvider.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MultiFeatureProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_223307A64(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_22330C3D8();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_223307B44(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    sub_223308788();
    sub_2233087E0();
LABEL_11:
    uint64_t result = sub_22330880C();
    __break(1u);
    return result;
  }
  sub_2233087D0();
  if (v4 + 24 * v3 > v2 && v2 + 24 * v3 > v4)
  {
    sub_223308788();
    sub_2233087B0();
    goto LABEL_11;
  }
  sub_2232F34C8(&qword_267FA17F0);
  sub_2232F361C();

  return swift_arrayInitWithCopy();
}

uint64_t sub_223307C04(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    sub_223308788();
    sub_2233087E0();
LABEL_11:
    uint64_t result = sub_22330880C();
    __break(1u);
    return result;
  }
  sub_2233087D0();
  if (v4 + 16 * v3 > v2 && v2 + 16 * v3 > v4)
  {
    sub_223308788();
    sub_2233087B0();
    goto LABEL_11;
  }
  sub_2232F34C8(&qword_267FA1778);
  sub_2232F361C();

  return swift_arrayInitWithCopy();
}

uint64_t sub_223307CC0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 48 * a2 > a1 ? (BOOL v3 = a1 + 48 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_22330C3D8();
    __break(1u);
  }
  else
  {
    sub_2232F34C8(&qword_267FA1780);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_223307DC4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (BOOL v3 = a1 + 24 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_22330C3D8();
    __break(1u);
  }
  else
  {
    sub_2232F34C8(&qword_267FA1788);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_223307EC8(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    sub_223308788();
    sub_2233087E0();
LABEL_11:
    uint64_t result = sub_22330880C();
    __break(1u);
    return result;
  }
  sub_2233087D0();
  if (v4 + 32 * v3 > v2 && v2 + 32 * v3 > v4)
  {
    sub_223308788();
    sub_2233087B0();
    goto LABEL_11;
  }
  sub_2232F34C8(v5);
  sub_2232F361C();

  return swift_arrayInitWithCopy();
}

uint64_t type metadata accessor for MultiFeatureProvider()
{
  return self;
}

uint64_t method lookup function for MultiFeatureProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MultiFeatureProvider);
}

uint64_t sub_223307FBC(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  for (unint64_t i = (uint64_t *)(a1 + 48); ; i += 3)
  {
    uint64_t v8 = *(i - 2);
    uint64_t v7 = *(i - 1);
    uint64_t v9 = *i;
    Swift::Bool v10 = (void *)*a3;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t v12 = sub_2232FA5D8(v8, v7);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14)) {
      break;
    }
    char v16 = v11;
    if (v10[3] >= v15)
    {
      if ((a2 & 1) == 0)
      {
        sub_2232F34C8(&qword_267FA1850);
        sub_22330C358();
      }
    }
    else
    {
      sub_223305280(v15, a2 & 1);
      unint64_t v17 = sub_2232FA5D8(v8, v7);
      if ((v16 & 1) != (v18 & 1)) {
        goto LABEL_18;
      }
      unint64_t v12 = v17;
    }
    unint64_t v19 = (void *)*a3;
    if (v16)
    {
      uint64_t v20 = *(void *)(v19[7] + 8 * v12);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      uint64_t v21 = v19[7];
      swift_unknownObjectRelease();
      *(void *)(v21 + 8 * v12) = v20;
    }
    else
    {
      v19[(v12 >> 6) + 8] |= 1 << v12;
      int64_t v22 = (uint64_t *)(v19[6] + 16 * v12);
      *int64_t v22 = v8;
      v22[1] = v7;
      *(void *)(v19[7] + 8 * v12) = v9;
      uint64_t v23 = v19[2];
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        goto LABEL_17;
      }
      id v19[2] = v25;
    }
    a2 = 1;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  uint64_t result = sub_22330C438();
  __break(1u);
  return result;
}

void sub_223308194()
{
  sub_223308460();
  *uint64_t v0 = v1;
}

void sub_2233081D8()
{
  sub_223308368();
  *uint64_t v0 = v1;
}

void sub_223308228()
{
}

void sub_22330825C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_2232F3574();
    if (v7 != v8)
    {
      sub_223308800();
      if (v7)
      {
        __break(1u);
        return;
      }
      sub_223306730();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    sub_2232F34C8(&qword_267FA1700);
    char v11 = (void *)swift_allocObject();
    size_t v12 = j__malloc_size(v11);
    id v11[2] = v9;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 48);
  }
  else
  {
    char v11 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v11 + 4);
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    sub_223304B4C(v14, v9, v13);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_223307CC0(v14, v9, v13);
  }
  swift_release();
}

void sub_223308334()
{
}

void sub_223308368()
{
  sub_22330879C();
  if (v6)
  {
    sub_2232F3574();
    if (v7 != v8)
    {
      sub_223308800();
      if (v7)
      {
        __break(1u);
        return;
      }
      sub_223306730();
    }
  }
  sub_2233087C0();
  if (v5)
  {
    sub_2232F34C8(v9);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v4;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  uint64_t v12 = sub_2233087F0();
  if (v3)
  {
    v2(v12);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    v1(v12);
  }
  swift_release();
}

void sub_223308438()
{
}

void sub_223308460()
{
  sub_22330879C();
  if (v5)
  {
    sub_2232F3574();
    if (v6 != v7)
    {
      sub_223308800();
      if (v6)
      {
        __break(1u);
        return;
      }
      sub_223306730();
    }
  }
  sub_2233087C0();
  if (v4)
  {
    sub_2232F34C8(v8);
    uint64_t v9 = (void *)swift_allocObject();
    size_t v10 = j__malloc_size(v9);
    void v9[2] = v3;
    v9[3] = 2 * ((uint64_t)(v10 - 32) / 32);
  }
  uint64_t v11 = sub_2233087F0();
  if (v2)
  {
    v1(v11);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_223307EC8(v11, v12);
  }
  swift_release();
}

void sub_223308528()
{
}

void sub_22330855C()
{
  sub_22330879C();
  if (v6)
  {
    sub_2232F3574();
    if (v7 != v8)
    {
      sub_223308800();
      if (v7)
      {
        __break(1u);
        return;
      }
      sub_223306730();
    }
  }
  sub_2233087C0();
  if (v5)
  {
    sub_2232F34C8(v9);
    size_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v4;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  uint64_t v12 = sub_2233087F0();
  if (v3)
  {
    v2(v12);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    v1(v12);
  }
  swift_release();
}

int64_t sub_223308624(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    unint64_t v10 = *(void *)(v6 + 8 * v9);
    if (v10) {
      return __clz(__rbit64(v10)) + (v9 << 6);
    }
    unint64_t v11 = (unint64_t)(result + 63) >> 6;
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      unint64_t v10 = *(void *)(v6 + 8 * v9);
      if (v10) {
        return __clz(__rbit64(v10)) + (v9 << 6);
      }
      while (v5 + 3 < v11)
      {
        unint64_t v10 = *(void *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_223308708(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_2233087F0()
{
  return v0 + 32;
}

uint64_t sub_22330880C()
{
  return sub_22330C3D8();
}

uint64_t sub_223308824(char a1, char a2)
{
  if (*(void *)&aSimulatounitte[8 * a1] == *(void *)&aSimulatounitte[8 * a2]
    && *(void *)&aR[8 * a1] == *(void *)&aR[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_22330C418();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2233088AC()
{
  return sub_223308950();
}

uint64_t sub_2233088B8()
{
  sub_22330C0F8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22330890C()
{
  return sub_22330C488();
}

uint64_t sub_223308950()
{
  return sub_22330C488();
}

uint64_t static Paths.featureManagerBaseDirectory()()
{
  uint64_t v0 = sub_22330BF08();
  sub_2232F49B0();
  MEMORY[0x270FA5388](v1);
  sub_2232F3630();
  if (qword_26AD65E40 != -1) {
    swift_once();
  }
  sub_2232F3490(v0, (uint64_t)qword_26AD65E28);
  sub_223309AD0();
  sub_223309358();
  sub_22330BED8();
  sub_223309358();
  uint64_t v2 = sub_223309AB8();
  return v3(v2);
}

HumanUnderstandingFoundation::Paths::Environment_optional __swiftcall Paths.Environment.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_22330C3E8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static Paths.Environment.allCases.getter()
{
  return &unk_26D667BB0;
}

uint64_t Paths.Environment.rawValue.getter()
{
  return *(void *)&aSimulatounitte[8 * *v0];
}

uint64_t sub_223308B50(char *a1, char *a2)
{
  return sub_223308824(*a1, *a2);
}

uint64_t sub_223308B5C()
{
  return sub_2233088AC();
}

uint64_t sub_223308B64()
{
  return sub_2233088B8();
}

uint64_t sub_223308B6C()
{
  return sub_223308950();
}

HumanUnderstandingFoundation::Paths::Environment_optional sub_223308B74(Swift::String *a1)
{
  return Paths.Environment.init(rawValue:)(*a1);
}

uint64_t sub_223308B80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Paths.Environment.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_223308BA8(void *a1@<X8>)
{
  *a1 = &unk_26D667BB0;
}

uint64_t static Paths.baseDirectory(with:)@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  sub_22330BF58();
  sub_2232F49B0();
  uint64_t v36 = v5;
  uint64_t v37 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22330BF08();
  sub_2232F49B0();
  uint64_t v39 = v9;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  char v16 = (char *)&v36 - v15;
  MEMORY[0x270FA5388](v14);
  char v18 = (char *)&v36 - v17;
  uint64_t v19 = sub_2232F34C8(&qword_26AD65E20);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  int64_t v22 = (char *)&v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v36 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v36 - v26;
  int v28 = *a1;
  uint64_t v38 = a2;
  sub_2233065A4(a2, 1, 1, v8);
  if (v28)
  {
    if (v28 != 1)
    {
      id v32 = objc_msgSend(self, sel_defaultManager);
      id v33 = objc_msgSend(v32, sel_URLsForDirectory_inDomains_, 5, 1);

      uint64_t v34 = sub_22330C148();
      sub_223308FE8(v34, (uint64_t)v22);
      swift_bridgeObjectRelease();
      if (sub_2233065CC((uint64_t)v22, 1, v8) == 1)
      {
        sub_223309490((uint64_t)v22);
        uint64_t result = sub_22330C388();
        __break(1u);
        return result;
      }
      uint64_t v31 = v39;
      (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v13, v22, v8);
      sub_22330BEC8();
      char v18 = v13;
      goto LABEL_9;
    }
    id v29 = NSTemporaryDirectory();
    sub_22330C088();

    sub_22330BE98();
    swift_bridgeObjectRelease();
    sub_22330BF48();
    sub_22330BF38();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v37);
    sub_22330BED8();
    swift_bridgeObjectRelease();
    char v18 = v16;
  }
  else
  {
    uint64_t result = (uint64_t)getenv("SIMULATOR_SHARED_RESOURCES_DIRECTORY");
    if (!result) {
      return result;
    }
    sub_22330C118();
    sub_22330BE98();
    swift_bridgeObjectRelease();
    sub_22330BED8();
    uint64_t v25 = v27;
  }
  uint64_t v31 = v39;
LABEL_9:
  (*(void (**)(char *, uint64_t))(v31 + 8))(v18, v8);
  uint64_t v35 = v38;
  sub_223309490(v38);
  sub_2233065A4((uint64_t)v25, 0, 1, v8);
  return sub_2233094F0((uint64_t)v25, v35);
}

uint64_t sub_223308FE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_22330BF08();
  uint64_t v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return sub_2233065A4(a2, v7, 1, v6);
}

uint64_t sub_223309090()
{
  uint64_t v0 = sub_22330BF08();
  sub_223306888(v0, qword_26AD65E28);
  uint64_t v1 = sub_2232F3490(v0, (uint64_t)qword_26AD65E28);
  return sub_2233090DC(v1);
}

uint64_t sub_2233090DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2232F34C8(&qword_26AD65E20);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = &v10[-v6];
  unsigned __int8 v11 = 2;
  static Paths.baseDirectory(with:)(&v11, (uint64_t)&v10[-v6]);
  sub_223309A50((uint64_t)v7, (uint64_t)v5);
  uint64_t v8 = sub_22330BF08();
  uint64_t result = sub_2233065CC((uint64_t)v5, 1, v8);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_223309490((uint64_t)v7);
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, v5, v8);
  }
  return result;
}

uint64_t static Paths.baseDirectory.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26AD65E40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22330BF08();
  uint64_t v3 = sub_2232F3490(v2, (uint64_t)qword_26AD65E28);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void static Paths.baseDirectory(with:createIfNeeded:)(uint64_t a1, uint64_t a2, char a3)
{
  if (qword_26AD65E40 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22330BF08();
  sub_2232F3490(v4, (uint64_t)qword_26AD65E28);
  sub_22330BED8();
  if (a3)
  {
    sub_223309358();
  }
}

void sub_223309358()
{
  v7[1] = *(id *)MEMORY[0x263EF8340];
  id v0 = objc_msgSend(self, sel_defaultManager);
  sub_22330BEF8();
  uint64_t v1 = (void *)sub_22330C078();
  swift_bridgeObjectRelease();
  v7[0] = 0;
  unsigned int v2 = objc_msgSend(v0, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v1, 1, 0, v7);

  id v3 = v7[0];
  if (v2)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = v7[0];
    uint64_t v6 = (void *)sub_22330BE88();

    swift_willThrow();
  }
}

uint64_t sub_223309490(uint64_t a1)
{
  uint64_t v2 = sub_2232F34C8(&qword_26AD65E20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2233094F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2232F34C8(&qword_26AD65E20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void static Paths.topDirectory()()
{
  if (qword_26AD65E40 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22330BF08();
  sub_2232F3490(v0, (uint64_t)qword_26AD65E28);
  sub_22330BED8();

  sub_223309358();
}

uint64_t static Paths.biomeStreamsDirectory()()
{
  uint64_t v0 = sub_22330BF08();
  sub_2232F49B0();
  MEMORY[0x270FA5388](v1);
  sub_2232F3630();
  if (qword_26AD65E40 != -1) {
    swift_once();
  }
  sub_2232F3490(v0, (uint64_t)qword_26AD65E28);
  sub_223309AD0();
  sub_223309358();
  sub_22330BED8();
  sub_223309358();
  uint64_t v2 = sub_223309AB8();
  return v3(v2);
}

uint64_t static Paths.humanUnderstandingEvidenceBaseDirectory()()
{
  uint64_t v0 = sub_22330BF08();
  sub_2232F49B0();
  MEMORY[0x270FA5388](v1);
  sub_2232F3630();
  if (qword_26AD65E40 != -1) {
    swift_once();
  }
  sub_2232F3490(v0, (uint64_t)qword_26AD65E28);
  sub_223309AD0();
  sub_223309358();
  sub_22330BED8();
  sub_223309358();
  uint64_t v2 = sub_223309AB8();
  return v3(v2);
}

unint64_t sub_223309810()
{
  unint64_t result = qword_267FA1858;
  if (!qword_267FA1858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267FA1858);
  }
  return result;
}

unint64_t sub_223309860()
{
  unint64_t result = qword_267FA1860;
  if (!qword_267FA1860)
  {
    sub_2232F4634(&qword_267FA1868);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267FA1860);
  }
  return result;
}

ValueMetadata *type metadata accessor for Paths()
{
  return &type metadata for Paths;
}

uint64_t getEnumTagSinglePayload for Paths.Environment(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Paths.Environment(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x223309A18);
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

ValueMetadata *type metadata accessor for Paths.Environment()
{
  return &type metadata for Paths.Environment;
}

uint64_t sub_223309A50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2232F34C8(&qword_26AD65E20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_223309AB8()
{
  return v0;
}

uint64_t sub_223309AD0()
{
  return sub_22330BED8();
}

void sub_223309AEC()
{
  qword_267FA1E48 = MEMORY[0x263F8EE78];
}

uint64_t BackfillableSignal.allFeatures(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_msgSend(v3, sel_featureNames);
  uint64_t v8 = sub_22330C1A8();

  sub_223309BF8();
  uint64_t v9 = sub_22330C068();
  v14[2] = a2;
  v14[3] = a3;
  uint64_t v15 = v3;
  uint64_t v16 = a1;
  uint64_t v10 = sub_223306B74(v9, (void (*)(uint64_t *, void *))sub_223309D08, (uint64_t)v14, v8);
  swift_bridgeObjectRelease();
  sub_2232F94EC(v10);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  int v3 = BackfillableSignal.allFeatures(for:)(a1, a2, a3);
  sub_22330A3B4(v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_223309BF8()
{
  unint64_t result = qword_267FA16F0;
  if (!qword_267FA16F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267FA16F0);
  }
  return result;
}

void sub_223309C38(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = *a2;
  uint64_t v9 = a2[1];
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 16);
  swift_bridgeObjectRetain();
  uint64_t v12 = v11(v10, v9, a4, a5, a6);
  if (v12)
  {
    sub_22330A028(v12, v10, v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v13 = (void *)sub_223309E84(v10, v9);
    swift_bridgeObjectRelease();
  }
}

void sub_223309D08(uint64_t a1, uint64_t *a2)
{
  sub_223309C38(a1, a2, v2[4], v2[5], v2[2], v2[3]);
}

uint64_t sub_223309D74(uint64_t a1, uint64_t a2)
{
  int v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2232FA5D8(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  sub_2232F34C8(qword_267FA1880);
  sub_22330C348();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 16 * v6);
  sub_22330C368();
  uint64_t *v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_223309E84(uint64_t a1, uint64_t a2)
{
  int v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2232FA5D8(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  sub_2232F34C8(&qword_267FA1878);
  sub_22330C348();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 8 * v6);
  sub_223309BF8();
  sub_22330C368();
  uint64_t *v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_223309F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v4;
  uint64_t *v4 = 0x8000000000000000;
  sub_22330A0B8(a1, a2, a3, a4);
  uint64_t *v4 = v10;

  return swift_bridgeObjectRelease();
}

uint64_t sub_22330A028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  sub_22330A1F8(a1, a2, a3);
  uint64_t *v3 = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_22330A0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_2232FA5D8(a3, a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  sub_2232F34C8(qword_267FA1880);
  if ((sub_22330C348() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_2232FA5D8(a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    uint64_t result = sub_22330C438();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v5;
  if (v14)
  {
    char v18 = (uint64_t *)(v17[7] + 16 * v13);
    uint64_t result = swift_bridgeObjectRelease();
    *char v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_22330A320(v13, a3, a4, a1, a2, v17);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_22330A1F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_2232FA5D8(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  sub_2232F34C8(&qword_267FA1878);
  if ((sub_22330C348() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_2232FA5D8(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    sub_22330C438();
    __break(1u);
    return;
  }
  unint64_t v11 = v13;
LABEL_5:
  unint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];

    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_22330A36C(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_22330A320(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  unint64_t v6 = (void *)(a6[6] + 16 * result);
  *unint64_t v6 = a2;
  v6[1] = a3;
  char v7 = (void *)(a6[7] + 16 * result);
  *char v7 = a4;
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

unint64_t sub_22330A36C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
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

void sub_22330A3B4(uint64_t a1)
{
  sub_2232F34C8(&qword_267FA1870);
  uint64_t v2 = sub_22330C3A8();
  int v3 = (void *)v2;
  int64_t v4 = 0;
  uint64_t v32 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v6 = a1 + 64;
  uint64_t v5 = v7;
  uint64_t v8 = 1 << *(unsigned char *)(v6 - 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v5;
  uint64_t v29 = v6;
  int64_t v30 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v31 = v2 + 64;
  if ((v9 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v11 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v4 << 6))
  {
    uint64_t v16 = (uint64_t *)(*(void *)(v32 + 48) + 16 * i);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    uint64_t v19 = *(void **)(*(void *)(v32 + 56) + 8 * i);
    if (v19)
    {
      swift_bridgeObjectRetain();
      id v20 = v19;
      Swift::String_optional v21 = MLFeatureValue.toString()();
      if (v21.value._object)
      {
        uint64_t countAndFlagsBits = v21.value._countAndFlagsBits;
        object = v21.value._object;

        goto LABEL_24;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      id v20 = 0;
    }

    swift_bridgeObjectRelease();
    uint64_t countAndFlagsBits = 0;
    object = (void *)0xE000000000000000;
LABEL_24:
    *(void *)(v31 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v24 = (void *)(v3[6] + 16 * i);
    void *v24 = v18;
    v24[1] = v17;
    uint64_t v25 = (uint64_t *)(v3[7] + 16 * i);
    *uint64_t v25 = countAndFlagsBits;
    v25[1] = (uint64_t)object;
    uint64_t v26 = v3[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v3[2] = v28;
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_29;
    }
    if (v13 >= v30) {
      return;
    }
    unint64_t v14 = *(void *)(v29 + 8 * v13);
    ++v4;
    if (!v14)
    {
      int64_t v4 = v13 + 1;
      if (v13 + 1 >= v30) {
        return;
      }
      unint64_t v14 = *(void *)(v29 + 8 * v4);
      if (!v14)
      {
        int64_t v4 = v13 + 2;
        if (v13 + 2 >= v30) {
          return;
        }
        unint64_t v14 = *(void *)(v29 + 8 * v4);
        if (!v14) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v10 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v30) {
    return;
  }
  unint64_t v14 = *(void *)(v29 + 8 * v15);
  if (v14)
  {
    int64_t v4 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v4 >= v30) {
      return;
    }
    unint64_t v14 = *(void *)(v29 + 8 * v4);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_30:
  __break(1u);
}

uint64_t dispatch thunk of Signal.signalName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BackfillableSignal.featureValue(for:date:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t TimestampedItem.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_267FA1E50;
  sub_22330BF28();
  sub_22330AAA0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v6(a1, v3, v4);
}

uint64_t TimestampedItem.value.getter@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 80) - 8) + 16))(a1, v1 + *(void *)(*(void *)v1 + 96));
}

uint64_t TimestampedItem.__allocating_init(timestamp:value:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  TimestampedItem.init(timestamp:value:)(a1, a2);
  return v4;
}

uint64_t *TimestampedItem.init(timestamp:value:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = (uint64_t)v2 + qword_267FA1E50;
  sub_22330BF28();
  sub_22330AAA0();
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v6, a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v5 + 80) - 8) + 32))((uint64_t)v2 + *(void *)(*v2 + 96), a2);
  return v2;
}

uint64_t *TimestampedItem.deinit()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (uint64_t)v0 + qword_267FA1E50;
  sub_22330BF28();
  sub_22330AAA0();
  (*(void (**)(uint64_t))(v3 + 8))(v2);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 96));
  return v0;
}

uint64_t TimestampedItem.__deallocating_deinit()
{
  TimestampedItem.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_22330A920@<X0>(uint64_t a1@<X8>)
{
  return TimestampedItem.timestamp.getter(a1);
}

uint64_t dispatch thunk of Timestamped.timestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_22330A95C()
{
  uint64_t result = sub_22330BF28();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for TimestampedItem()
{
  return sub_22330AA70();
}

uint64_t method lookup function for TimestampedItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TimestampedItem);
}

uint64_t dispatch thunk of TimestampedItem.__allocating_init(timestamp:value:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_22330AA70()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22330AAB0(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  *(void *)(v3 + 16) = a1;
  id v5 = a1;
  unint64_t v6 = sub_22330AB2C(a2);
  swift_bridgeObjectRelease();
  type metadata accessor for MultiFeatureProvider();
  swift_allocObject();
  uint64_t v7 = sub_2233073A4(v6);

  *(void *)(v3 + 24) = v7;
  return v3;
}

uint64_t sub_22330AB2C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    sub_22330C308();
    uint64_t v4 = a1 + 32;
    do
    {
      v4 += 16;
      swift_unknownObjectRetain_n();
      sub_2232F34C8(&qword_267FA1778);
      sub_2232F34C8(&qword_267FA1908);
      swift_dynamicCast();
      swift_unknownObjectRelease();
      sub_22330C2E8();
      sub_22330C318();
      sub_22330C328();
      sub_22330C2F8();
      --v2;
    }
    while (v2);
    return v5;
  }
  return result;
}

uint64_t Transformer.featureNames.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_modelDescription);
  id v2 = objc_msgSend(v1, sel_outputDescriptionsByName);

  sub_2232FF4E8();
  uint64_t v3 = sub_22330C058();

  return sub_2232F99E0(v3);
}

MLFeatureValue_optional __swiftcall Transformer.featureValue(for:)(Swift::String a1)
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  id v2 = *(void **)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  v13[0] = 0;
  id v4 = objc_msgSend(v2, sel_predictionFromFeatures_error_, v3, v13);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = v13[0];
    uint64_t v7 = (void *)sub_22330C078();
    uint64_t v8 = (objc_class *)objc_msgSend(v5, sel_featureValueForName_, v7);
    swift_unknownObjectRelease();
  }
  else
  {
    id v10 = v13[0];
    unint64_t v11 = (void *)sub_22330BE88();

    swift_willThrow();
    uint64_t v8 = 0;
  }
  char v12 = v8;
  result.value.super.isa = v12;
  result.is_nil = v9;
  return result;
}

uint64_t Transformer.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t Transformer.__deallocating_deinit()
{
  Transformer.deinit();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for Transformer()
{
  return self;
}

uint64_t method lookup function for Transformer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Transformer);
}

void sub_22330AF44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v10 = 0xD00000000000001DLL;
  unint64_t v11 = 0x800000022330E710;
  sub_22330C108();
  id v6 = (void *)*MEMORY[0x263EF8188];
  uint64_t v7 = (void *)swift_allocObject();
  id v7[2] = 0xD00000000000001DLL;
  v7[3] = 0x800000022330E710;
  v7[4] = a3;
  v7[5] = a4;
  unint64_t v14 = sub_22330BC74;
  int64_t v15 = v7;
  unint64_t v10 = MEMORY[0x263EF8330];
  unint64_t v11 = 1107296256;
  char v12 = sub_22330B430;
  int64_t v13 = &unk_26D668030;
  uint64_t v8 = _Block_copy(&v10);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  uint64_t v9 = sub_22330C0D8();
  swift_bridgeObjectRelease();
  xpc_activity_register((const char *)(v9 + 32), v6, v8);
  swift_release();
  _Block_release(v8);
}

void sub_22330B088(_xpc_activity_s *a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (xpc_activity_get_state(a1) == 2 && xpc_activity_should_defer(a1))
  {
    if (!xpc_activity_set_state(a1, 3))
    {
      if (qword_267FA1518 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_22330BF98();
      sub_2232F3490(v8, (uint64_t)qword_267FA1E18);
      os_log_type_t v9 = sub_22330C1C8();
      swift_bridgeObjectRetain_n();
      unint64_t v10 = sub_22330BF78();
      os_log_type_t v11 = v9;
      if (os_log_type_enabled(v10, v9))
      {
        char v12 = (uint8_t *)swift_slowAlloc();
        uint64_t v13 = swift_slowAlloc();
        uint64_t v24 = v13;
        *(_DWORD *)char v12 = 136315138;
        swift_bridgeObjectRetain();
        sub_2232F9DB4(a2, a3, &v24);
        sub_22330C258();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2232F1000, v10, v11, "%s should defer before task start, but failed to set state to XPC_ACTIVITY_STATE_DEFER", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223CB4130](v13, -1, -1);
        MEMORY[0x223CB4130](v12, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
  else
  {
    if (qword_267FA1518 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_22330BF98();
    sub_2232F3490(v14, (uint64_t)qword_267FA1E18);
    os_log_type_t v15 = sub_22330C1E8();
    swift_bridgeObjectRetain_n();
    uint64_t v16 = sub_22330BF78();
    os_log_type_t v17 = v15;
    if (os_log_type_enabled(v16, v15))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = a4;
      uint64_t v20 = a2;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v24 = v21;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      sub_2232F9DB4(v20, a3, &v24);
      sub_22330C258();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2232F1000, v16, v17, "%s started running XPC Activity task block", v18, 0xCu);
      swift_arrayDestroy();
      uint64_t v22 = v21;
      a2 = v20;
      a4 = v19;
      MEMORY[0x223CB4130](v22, -1, -1);
      MEMORY[0x223CB4130](v18, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    type metadata accessor for XPCActivity();
    uint64_t v23 = (void *)swift_allocObject();
    v23[2] = a1;
    v23[3] = a2;
    v23[4] = a3;
    v23[5] = 0;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    a4(v23);
    swift_release();
  }
}

uint64_t sub_22330B430(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void (*registerXPCActivityHandler.getter())(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22330AF44;
}

Swift::Bool __swiftcall XPCActivity.deferIfNecessary()()
{
  uint64_t v1 = v0;
  Swift::Bool v19 = 0;
  uint64_t v2 = *(_xpc_activity_s **)(v0 + 16);
  if (xpc_activity_should_defer(v2))
  {
    if (xpc_activity_set_state(v2, 3))
    {
      if (qword_267FA1518 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_22330BF98();
      sub_2232F3490(v3, (uint64_t)qword_267FA1E18);
      os_log_type_t v4 = sub_22330C1C8();
      swift_retain();
      uint64_t v5 = sub_22330BF78();
      os_log_type_t v6 = v4;
      if (os_log_type_enabled(v5, v4))
      {
        uint64_t v7 = (uint8_t *)swift_slowAlloc();
        v18[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v7 = 136315138;
        uint64_t v8 = *(void *)(v1 + 24);
        unint64_t v9 = *(void *)(v1 + 32);
        swift_bridgeObjectRetain();
        sub_2232F9DB4(v8, v9, v18);
        sub_22330C258();
        swift_release();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2232F1000, v5, v6, "%s XPC Activity should defer, but failed to set state to XPC_ACTIVITY_STATE_DEFER", v7, 0xCu);
        swift_arrayDestroy();
        sub_223306810();
        sub_223306810();
      }
      else
      {

        swift_release();
      }
    }
    Swift::Bool v19 = 1;
  }
  if (qword_267FA1518 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_22330BF98();
  sub_2232F3490(v10, (uint64_t)qword_267FA1E18);
  os_log_type_t v11 = sub_22330C1E8();
  swift_retain();
  char v12 = sub_22330BF78();
  os_log_type_t v13 = v11;
  if (os_log_type_enabled(v12, v11))
  {
    uint64_t v14 = swift_slowAlloc();
    v18[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v15 = *(void *)(v1 + 24);
    unint64_t v16 = *(void *)(v1 + 32);
    swift_bridgeObjectRetain();
    sub_2232F9DB4(v15, v16, v18);
    sub_22330C258();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 1024;
    sub_22330C258();
    _os_log_impl(&dword_2232F1000, v12, v13, "%s XPC Activity deferIfNecessary returned %{BOOL}d", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    sub_223306810();
    sub_223306810();
  }
  else
  {

    swift_release();
  }
  swift_beginAccess();
  return v19;
}

void XPCActivity.register(deferralBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v2;
  v5[3] = a1;
  v5[4] = a2;
  v8[4] = sub_22330BBAC;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_22330B430;
  void v8[3] = &unk_26D667FC8;
  os_log_type_t v6 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  uint64_t v7 = xpc_activity_add_eligibility_changed_handler();
  _Block_release(v6);
  *(void *)(v2 + 40) = v7;
}

uint64_t sub_22330B8F4(_xpc_activity_s *a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = xpc_activity_should_defer(a1);
  if (result)
  {
    if (qword_267FA1518 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_22330BF98();
    sub_2232F3490(v6, (uint64_t)qword_267FA1E18);
    os_log_type_t v7 = sub_22330C1E8();
    swift_retain();
    uint64_t v8 = sub_22330BF78();
    os_log_type_t v9 = v7;
    if (os_log_type_enabled(v8, v7))
    {
      unint64_t v16 = a3;
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v17 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      uint64_t v13 = *(void *)(a2 + 24);
      unint64_t v12 = *(void *)(a2 + 32);
      swift_bridgeObjectRetain();
      sub_2232F9DB4(v13, v12, &v17);
      sub_22330C258();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2232F1000, v8, v9, "%s XPC Activity registered deferral block will be invoked", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223CB4130](v11, -1, -1);
      MEMORY[0x223CB4130](v10, -1, -1);

      return v16(v14);
    }
    else
    {

      uint64_t v15 = swift_release();
      return a3(v15);
    }
  }
  return result;
}

uint64_t XPCActivity.deinit()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t XPCActivity.__deallocating_deinit()
{
  XPCActivity.deinit();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

BOOL sub_22330BB20()
{
  return XPCActivity.deferIfNecessary()();
}

void sub_22330BB48(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_22330BB6C()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22330BBAC(_xpc_activity_s *a1)
{
  return sub_22330B8F4(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t sub_22330BBB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_22330BBC8()
{
  return swift_release();
}

uint64_t dispatch thunk of DeferrableActivity.deferIfNecessary()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DeferrableActivity.register(deferralBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for XPCActivity()
{
  return self;
}

uint64_t method lookup function for XPCActivity(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCActivity);
}

uint64_t sub_22330BC34()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_22330BC74(_xpc_activity_s *a1)
{
  sub_22330B088(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void))(v1 + 32));
}

void sub_22330BDF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22330BE10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22330BE20(uint64_t a1)
{
}

void sub_22330BE28(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_22330BE88()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22330BE98()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_22330BEA8()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_22330BEB8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22330BEC8()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_22330BED8()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_22330BEE8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_22330BEF8()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_22330BF08()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22330BF18()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22330BF28()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22330BF38()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_22330BF48()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_22330BF58()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_22330BF68()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_22330BF78()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22330BF88()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22330BF98()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22330BFA8()
{
  return MEMORY[0x270EE75A0]();
}

uint64_t sub_22330BFB8()
{
  return MEMORY[0x270EE7650]();
}

uint64_t sub_22330BFC8()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_22330BFD8()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_22330BFE8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22330BFF8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22330C008()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22330C018()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_22330C028()
{
  return MEMORY[0x270FA0AD0]();
}

uint64_t sub_22330C038()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_22330C048()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22330C058()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22330C068()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_22330C078()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22330C088()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22330C098()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_22330C0A8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_22330C0B8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_22330C0C8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22330C0D8()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_22330C0E8()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t sub_22330C0F8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22330C108()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22330C118()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_22330C128()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22330C138()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22330C148()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22330C158()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_22330C168()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22330C178()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_22330C188()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_22330C198()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_22330C1A8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_22330C1B8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_22330C1C8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22330C1D8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_22330C1E8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22330C1F8()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_22330C208()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_22330C218()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22330C228()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_22330C238()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_22330C248()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_22330C258()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22330C268()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22330C278()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22330C288()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_22330C298()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_22330C2A8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22330C2B8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22330C2C8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22330C2D8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22330C2E8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_22330C2F8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_22330C308()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_22330C318()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_22330C328()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_22330C338()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22330C348()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_22330C358()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_22330C368()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_22330C378()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22330C388()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22330C398()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22330C3A8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22330C3B8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22330C3C8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22330C3D8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22330C3E8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22330C3F8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_22330C408()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22330C418()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22330C428()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_22330C438()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22330C448()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22330C468()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22330C478()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22330C488()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

uint64_t IOHIDEventGetDoubleValue()
{
  return MEMORY[0x270EF4320]();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x270EF4428]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x270EF4450]();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return MEMORY[0x270EF4470]();
}

Boolean IOHIDEventSystemClientSetProperty(IOHIDEventSystemClientRef client, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x270EF44A0](client, key, property);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t xpc_activity_add_eligibility_changed_handler()
{
  return MEMORY[0x270EDBCA0]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}