uint64_t getEnumTagSinglePayload for FeatureFlags(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    v2 = 4;
  }
  else {
    v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    v3 = 1;
  }
  else {
    v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for FeatureFlags(unsigned char *result, int a2, int a3)
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
        *result = a2;
        return result;
      case 2:
        *(_WORD *)result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *result = 0;
      break;
    case 2:
      *(_WORD *)result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x310CLL);
    case 4:
      *(_DWORD *)result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_3134()
{
  return 0;
}

ValueMetadata *type metadata accessor for FeatureFlags()
{
  return &type metadata for FeatureFlags;
}

unint64_t sub_3154()
{
  unint64_t result = qword_80A0;
  if (!qword_80A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_80A0);
  }
  return result;
}

const char *sub_31A0()
{
  return "SiriUI";
}

const char *sub_31B4()
{
  return "siri_read_this";
}

uint64_t sub_31C8()
{
  return 1;
}

void sub_31D0()
{
}

Swift::Int sub_31F8()
{
  return sub_3B20();
}

Swift::Int sub_3244()
{
  return sub_3B20();
}

uint64_t sub_3284()
{
  uint64_t v0 = swift_allocObject();
  sub_32BC();
  return v0;
}

uint64_t sub_32BC()
{
  uint64_t v1 = sub_3AC0();
  sub_3818();
  uint64_t v3 = v2;
  __chkstk_darwin();
  sub_3834();
  if (qword_8098 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_3744(v1, (uint64_t)qword_83E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v4, v1);
  uint64_t v5 = sub_3AB0();
  os_log_type_t v6 = sub_3AE0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "Initializing ReaderFlowPlugin", v7, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return v0;
}

uint64_t sub_3420(uint64_t a1)
{
  uint64_t v3 = sub_3AC0();
  sub_3818();
  uint64_t v5 = v4;
  __chkstk_darwin();
  sub_3834();
  if (qword_8098 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_3744(v3, (uint64_t)qword_83E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v1, v6, v3);
  v7 = sub_3AB0();
  os_log_type_t v8 = sub_3AE0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "Find flow for X called", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  v16 = &type metadata for FeatureFlags;
  v17 = (void *)sub_377C();
  char v10 = sub_3A60();
  sub_37C8((uint64_t)v15);
  if ((v10 & 1) == 0) {
    return sub_39E0();
  }
  uint64_t v11 = sub_3AA0();
  uint64_t v12 = sub_3A90();
  v16 = (ValueMetadata *)v11;
  v17 = &protocol witness table for ReferenceResolutionClient;
  v15[0] = v12;
  swift_retain();
  sub_3A40();
  sub_3A50();
  sub_3A80();
  swift_allocObject();
  uint64_t v13 = sub_3A70();
  (*(void (**)(uint64_t))(*(void *)v13 + 120))(a1);
  swift_release();
  return swift_release();
}

uint64_t sub_366C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ReaderFlowPlugin()
{
  return self;
}

uint64_t sub_36A0(uint64_t a1)
{
  return sub_3420(a1);
}

uint64_t sub_36B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3284();
  *a1 = result;
  return result;
}

unint64_t sub_36F8()
{
  unint64_t result = qword_8148;
  if (!qword_8148)
  {
    type metadata accessor for ReaderFlowPlugin();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8148);
  }
  return result;
}

uint64_t sub_3744(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_377C()
{
  unint64_t result = qword_8150;
  if (!qword_8150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8150);
  }
  return result;
}

uint64_t sub_37C8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_384C()
{
  sub_39A0();
  uint64_t result = sub_3AF0();
  qword_83E0 = result;
  return result;
}

uint64_t sub_38B0()
{
  uint64_t v0 = sub_3AC0();
  sub_393C(v0, qword_83E8);
  sub_3744(v0, (uint64_t)qword_83E8);
  if (qword_8090 != -1) {
    swift_once();
  }
  id v1 = (id)qword_83E0;
  return sub_3AD0();
}

uint64_t *sub_393C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_39A0()
{
  unint64_t result = qword_8158;
  if (!qword_8158)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_8158);
  }
  return result;
}

uint64_t sub_39E0()
{
  return static FlowSearchResult.noFlow.getter();
}

uint64_t sub_39F0()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_3A00()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_3A10()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_3A20(Swift::String refId)
{
}

void sub_3A30()
{
}

uint64_t sub_3A40()
{
  return static AceService.currentAsync.getter();
}

uint64_t sub_3A50()
{
  return static Device.current.getter();
}

uint64_t sub_3A60()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_3A70()
{
  return SiriReaderFlowProvider.init(referenceResolver:aceServiceInvoker:deviceState:outputPublisher:)();
}

uint64_t sub_3A80()
{
  return type metadata accessor for SiriReaderFlowProvider();
}

uint64_t sub_3A90()
{
  return ReferenceResolutionClient.__allocating_init()();
}

uint64_t sub_3AA0()
{
  return type metadata accessor for ReferenceResolutionClient();
}

uint64_t sub_3AB0()
{
  return Logger.logObject.getter();
}

uint64_t sub_3AC0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_3AD0()
{
  return Logger.init(_:)();
}

uint64_t sub_3AE0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_3AF0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_3B00()
{
  return Hasher.init(_seed:)();
}

void sub_3B10(Swift::UInt a1)
{
}

Swift::Int sub_3B20()
{
  return Hasher._finalize()();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t self
{
  return _self;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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