id PHDefaultLog()
{
  void *v0;
  uint64_t vars8;

  if (qword_CB78 != -1) {
    dispatch_once(&qword_CB78, &stru_8400);
  }
  v0 = (void *)qword_CB70;

  return v0;
}

void sub_3FE0(id a1)
{
  qword_CB70 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  _objc_release_x1();
}

id PHOversizedLog()
{
  if (qword_CB88 != -1) {
    dispatch_once(&qword_CB88, &stru_8420);
  }
  v0 = (void *)qword_CB80;

  return v0;
}

void sub_4078(id a1)
{
  qword_CB80 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Oversized");

  _objc_release_x1();
}

id PHOversizedLogQueue()
{
  if (qword_CB98 != -1) {
    dispatch_once(&qword_CB98, &stru_8440);
  }
  v0 = (void *)qword_CB90;

  return v0;
}

void sub_4110(id a1)
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.calls.mobilephone.logging", v3);
  v2 = (void *)qword_CB90;
  qword_CB90 = (uint64_t)v1;
}

uint64_t sub_4C30()
{
  uint64_t v0 = sub_60E0();
  sub_4CA4(v0, qword_CBA0);
  sub_4D08(v0, (uint64_t)qword_CBA0);
  return sub_60D0();
}

uint64_t *sub_4CA4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_4D08(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void TUCallScreeningAnalyticsReporter.logEvent(_:withCoreAnalyticsDictionary:)()
{
}

Class sub_4D54(uint64_t a1)
{
  dispatch_queue_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_607C(0, &qword_CB58);
    v4.super.isa = sub_60F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

Swift::Void __swiftcall TUCallScreeningAnalyticsReporter.logLiveVoiceMailToggle(toggledTo:)(Swift::Bool toggledTo)
{
  sub_4EC8(&qword_CB10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_7D30;
  *(void *)(inited + 32) = 0xD000000000000019;
  *(void *)(inited + 40) = 0x8000000000006FA0;
  sub_607C(0, &qword_CB18);
  *(NSNumber *)(inited + 48) = sub_6150(toggledTo);
  unint64_t v3 = sub_4F0C(inited);
  sub_5028(v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  sub_5C50(0xD00000000000002ALL, 0x8000000000006FC0, v5);
  swift_bridgeObjectRelease();
}

uint64_t sub_4EC8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_4F0C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4EC8(&qword_CB68);
  uint64_t v2 = (void *)sub_61B0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_5AF4(v5, v6);
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

void sub_5028(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_4EC8(&qword_CB60);
    uint64_t v2 = (void *)sub_61B0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
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
  swift_bridgeObjectRetain();
  int64_t i = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v11 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v11 >= v27) {
    goto LABEL_32;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v11);
  int64_t v13 = i + 1;
  if (!v12)
  {
    int64_t v13 = i + 2;
    if (i + 2 >= v27) {
      goto LABEL_32;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    if (!v12)
    {
      int64_t v13 = i + 3;
      if (i + 3 >= v27) {
        goto LABEL_32;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = i + 4;
        if (i + 4 >= v27) {
          goto LABEL_32;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v14 = i + 5;
          if (i + 5 < v27)
          {
            unint64_t v12 = *(void *)(v28 + 8 * v14);
            if (v12)
            {
              int64_t v13 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v13 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_36;
              }
              if (v13 >= v27) {
                break;
              }
              unint64_t v12 = *(void *)(v28 + 8 * v13);
              ++v14;
              if (v12) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_60B8();
          return;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v12 - 1) & v12;
  unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
  for (i = v13; ; unint64_t v10 = v9 | (i << 6))
  {
    v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    v18 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    id v19 = v18;
    unint64_t v20 = sub_5AF4(v17, v16);
    unint64_t v21 = v20;
    if (v22)
    {
      v7 = (uint64_t *)(v2[6] + 16 * v20);
      swift_bridgeObjectRelease();
      uint64_t *v7 = v17;
      v7[1] = v16;
      uint64_t v8 = v2[7];

      *(void *)(v8 + 8 * v21) = v19;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v20;
    v23 = (uint64_t *)(v2[6] + 16 * v20);
    uint64_t *v23 = v17;
    v23[1] = v16;
    *(void *)(v2[7] + 8 * v20) = v19;
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_34;
    }
    v2[2] = v26;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

id TUCallScreeningAnalyticsReporter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id TUCallScreeningAnalyticsReporter.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TUCallScreeningAnalyticsReporter();
  return objc_msgSendSuper2(&v2, "init");
}

id TUCallScreeningAnalyticsReporter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TUCallScreeningAnalyticsReporter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_549C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_5570(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_601C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_601C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_5FCC((uint64_t)v12);
  return v7;
}

uint64_t sub_5570(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_6170();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_572C(a5, a6);
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
  uint64_t v8 = sub_6190();
  if (!v8)
  {
    sub_61A0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_61C0();
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

uint64_t sub_572C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_57C4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_59A4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_59A4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_57C4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_593C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_6180();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_61A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_6130();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_61C0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_61A0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_593C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_4EC8(&qword_CB50);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_59A4(char a1, int64_t a2, char a3, char *a4)
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
    sub_4EC8(&qword_CB50);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  int64_t v13 = a4 + 32;
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
  uint64_t result = sub_61C0();
  __break(1u);
  return result;
}

unint64_t sub_5AF4(uint64_t a1, uint64_t a2)
{
  sub_61E0();
  sub_6120();
  Swift::Int v4 = sub_61F0();

  return sub_5B6C(a1, a2, v4);
}

unint64_t sub_5B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_61D0() & 1) == 0)
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
      while (!v14 && (sub_61D0() & 1) == 0);
    }
  }
  return v6;
}

void sub_5C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_CB08 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_60E0();
  sub_4D08(v6, (uint64_t)qword_CBA0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  int64_t v7 = sub_60C0();
  os_log_type_t v8 = sub_6140();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t aBlock = a1;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v19 = a2;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_6110();
    uint64_t aBlock = sub_549C(v10, v11, &v17);
    sub_6160();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t aBlock = a3;
    swift_bridgeObjectRetain();
    sub_4EC8(&qword_CB48);
    uint64_t v12 = sub_6110();
    uint64_t aBlock = sub_549C(v12, v13, &v17);
    sub_6160();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v7, v8, "TUCallScreeningAnalyticsReporter: logging core analytics for event of %s with dictionary %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  NSString v14 = sub_6100();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  char v22 = sub_5FAC;
  uint64_t v23 = v15;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v19 = 1107296256;
  unint64_t v20 = sub_4D54;
  unint64_t v21 = &unk_8500;
  uint64_t v16 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v16);
}

uint64_t type metadata accessor for TUCallScreeningAnalyticsReporter()
{
  return self;
}

uint64_t sub_5F74()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_5FAC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_5FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_5FC4()
{
  return swift_release();
}

uint64_t sub_5FCC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_601C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_607C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_60B8()
{
  return swift_release();
}

uint64_t sub_60C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_60D0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_60E0()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_60F0()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_6100()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_6110()
{
  return String.init<A>(reflecting:)();
}

uint64_t sub_6120()
{
  return String.hash(into:)();
}

Swift::Int sub_6130()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_6140()
{
  return static os_log_type_t.default.getter();
}

NSNumber sub_6150(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t sub_6160()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_6170()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_6180()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_6190()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_61A0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_61B0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_61C0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_61D0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_61E0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_61F0()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t TUCallScreeningActivatable()
{
  return _TUCallScreeningActivatable();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_activeSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 activeSpecifier];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_analyticsReporter(void *a1, const char *a2, ...)
{
  return _[a1 analyticsReporter];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_configurationProvider(void *a1, const char *a2, ...)
{
  return _[a1 configurationProvider];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_deviceExpertMigrationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 deviceExpertMigrationEnabled];
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return _[a1 emitNavigationEvent];
}

id objc_msgSend_getBooleanFromUserDefaults_default_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBooleanFromUserDefaults:default:");
}

id objc_msgSend_getCallScreeningEnabled(void *a1, const char *a2, ...)
{
  return _[a1 getCallScreeningEnabled];
}

id objc_msgSend_groupSpecifierWithID_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:name:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_isCallScreeningAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isCallScreeningAvailable];
}

id objc_msgSend_isCallScreeningEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isCallScreeningEnabled];
}

id objc_msgSend_loadSpecifiersFromPlistName_target_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifiersFromPlistName:target:");
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return _[a1 localizationTableName];
}

id objc_msgSend_localizedStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_logLiveVoiceMailToggleWithToggledTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logLiveVoiceMailToggleWithToggledTo:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return _[a1 parentListController];
}

id objc_msgSend_pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_setActiveSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveSpecifier:");
}

id objc_msgSend_setCallScreeningEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallScreeningEnabled:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValueInUserDefaults_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueInUserDefaults:forKey:");
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_tuFeatureFlags(void *a1, const char *a2, ...)
{
  return _[a1 tuFeatureFlags];
}