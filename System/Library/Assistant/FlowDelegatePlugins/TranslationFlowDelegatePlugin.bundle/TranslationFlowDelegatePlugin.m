uint64_t sub_2F90()
{
  uint64_t result;

  sub_3A10();
  result = sub_3B60();
  qword_8198 = result;
  return result;
}

uint64_t *sub_2FF8()
{
  if (qword_82B0 != -1) {
    swift_once();
  }
  return &qword_8198;
}

id sub_3044()
{
  if (qword_82B0 != -1) {
    swift_once();
  }
  v0 = (void *)qword_8198;

  return v0;
}

uint64_t sub_30A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_3B00();
  sub_3B30();
  sub_3A50();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v5(a1, v2, v3);
}

uint64_t sub_3108()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = v0 + OBJC_IVAR____TtC29TranslationFlowDelegatePlugin29TranslationFlowDelegatePlugin_logger;
  uint64_t v2 = sub_3B00();
  sub_3B30();
  sub_3A50();
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v1, v2);
  return v0;
}

uint64_t sub_318C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC29TranslationFlowDelegatePlugin29TranslationFlowDelegatePlugin_logger;
  uint64_t v2 = sub_3B00();
  sub_3B30();
  sub_3A50();
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v1, v2);
  return v0;
}

uint64_t sub_31FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v3 = sub_3AE0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_82B0 != -1) {
    swift_once();
  }
  sub_3B50();
  sub_3558(&qword_80C0);
  uint64_t v7 = swift_allocObject();
  long long v19 = xmmword_3C80;
  *(_OWORD *)(v7 + 16) = xmmword_3C80;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t v8 = sub_3B40();
  uint64_t v10 = v9;
  *(void *)(v7 + 56) = &type metadata for String;
  unint64_t v11 = sub_359C();
  *(void *)(v7 + 64) = v11;
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v10;
  sub_3B10();
  swift_bridgeObjectRelease();
  v12 = sub_3B20();
  os_log_type_t v13 = sub_3B50();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_0, v12, v13, "About to call getRCHFlow()", v14, 2u);
    swift_slowDealloc();
  }

  sub_3AF0();
  if (v22)
  {
    sub_3648(&v21, (uint64_t)v23);
    sub_3B50();
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = v19;
    sub_3660((uint64_t)v23, (uint64_t)&v21);
    sub_3558(&qword_80D8);
    uint64_t v16 = sub_3B40();
    *(void *)(v15 + 56) = &type metadata for String;
    *(void *)(v15 + 64) = v11;
    *(void *)(v15 + 32) = v16;
    *(void *)(v15 + 40) = v17;
    sub_3B10();
    swift_bridgeObjectRelease();
    sub_36C4(v23, v23[3]);
    sub_3A60();
    sub_3A80();
    swift_release();
    return sub_3708((uint64_t)v23);
  }
  else
  {
    sub_35E8((uint64_t)&v21);
    sub_3B50();
    sub_3B10();
    return sub_3A70();
  }
}

uint64_t sub_3558(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_359C()
{
  unint64_t result = qword_80C8;
  if (!qword_80C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_80C8);
  }
  return result;
}

uint64_t sub_35E8(uint64_t a1)
{
  uint64_t v2 = sub_3558(&qword_80D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_3648(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_3660(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_36C4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_3708(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_3758()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC29TranslationFlowDelegatePlugin29TranslationFlowDelegatePlugin_logger;
  sub_3B30();
  sub_3A50();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t sub_37B4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC29TranslationFlowDelegatePlugin29TranslationFlowDelegatePlugin_logger;
  sub_3B30();
  sub_3A50();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_384C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 96))();
}

uint64_t sub_3890@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 88))();
  *a1 = result;
  return result;
}

unint64_t sub_38E0()
{
  unint64_t result = qword_80E0;
  if (!qword_80E0)
  {
    type metadata accessor for TranslationFlowDelegatePlugin();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_80E0);
  }
  return result;
}

uint64_t type metadata accessor for TranslationFlowDelegatePlugin()
{
  uint64_t result = qword_82A0;
  if (!qword_82A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3978()
{
  return type metadata accessor for TranslationFlowDelegatePlugin();
}

uint64_t sub_3980()
{
  uint64_t result = sub_3B30();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_3A10()
{
  unint64_t result = qword_8190;
  if (!qword_8190)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_8190);
  }
  return result;
}

uint64_t sub_3A60()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_3A70()
{
  return static FlowSearchResult.noFlow.getter();
}

uint64_t sub_3A80()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_3A90()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_3AA0()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_3AB0()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_3AC0(Swift::String refId)
{
}

void sub_3AD0()
{
}

uint64_t sub_3AE0()
{
  return type metadata accessor for Parse();
}

uint64_t sub_3AF0()
{
  return static TranslationFlowProvider.getRCHFlow(parse:)();
}

uint64_t sub_3B00()
{
  return TranslationLog.domainPlugin.unsafeMutableAddressor();
}

uint64_t sub_3B10()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_3B20()
{
  return Logger.logObject.getter();
}

uint64_t sub_3B30()
{
  return type metadata accessor for Logger();
}

uint64_t sub_3B40()
{
  return String.init<A>(describing:)();
}

uint64_t sub_3B50()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_3B60()
{
  return OS_os_log.init(subsystem:category:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t self
{
  return _self;
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}