uint64_t sub_1EEC()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_1F24();
  return v0;
}

uint64_t sub_1F24()
{
  sub_35A0();
  sub_35D0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v2 = [self bundleForClass:ObjCClassFromMetadata];
  sub_3590();

  return v0;
}

uint64_t sub_1F9C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v33 = a2;
  uint64_t v34 = a1;
  uint64_t v2 = sub_3500();
  sub_2CC0();
  uint64_t v4 = v3;
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v31 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v8 = (char *)&v29 - v7;
  uint64_t v9 = sub_3610();
  sub_2CC0();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3560();
  sub_3580();
  sub_3570();
  sub_35B0();
  sub_35D0();
  swift_allocObject();
  v15 = *(void (**)(uint64_t))(*(void *)sub_35C0() + 104);
  swift_retain();
  v16 = v33;
  v15(v34);
  swift_release();
  uint64_t v17 = sub_2E50();
  swift_beginAccess();
  uint64_t v34 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v17, v9);
  uint64_t v32 = v4;
  v18 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v18(v8, v16, v2);
  v33 = v14;
  v19 = sub_3600();
  os_log_type_t v20 = sub_3650();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v36[0] = swift_slowAlloc();
    uint64_t v30 = v9;
    *(_DWORD *)v21 = 136315138;
    v29 = v21 + 4;
    v18(v31, v8, v2);
    uint64_t v22 = sub_3630();
    uint64_t v35 = sub_23A0(v22, v23, v36);
    sub_3690();
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_2CDC();
    v25(v24);
    _os_log_impl(&dword_0, v19, v20, "NotificationsFlowDelegatePlugin findFlowForX | flowSearchResult: %s", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v33, v30);
  }
  else
  {
    uint64_t v27 = sub_2CDC();
    v28(v27);

    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v33, v9);
  }
}

uint64_t sub_22F8()
{
  return v0;
}

uint64_t sub_2300()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_2310()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88))();
}

uint64_t sub_2354@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 80))();
  *a1 = result;
  return result;
}

uint64_t sub_23A0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2474(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2C1C((uint64_t)v12, *a3);
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
      sub_2C1C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_2BCC((uint64_t)v12);
  return v7;
}

uint64_t sub_2474(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25CC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_36A0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_26A4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_36C0();
    if (!v8)
    {
      uint64_t result = sub_36D0();
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

void *sub_25CC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_36E0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_26A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_273C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2918(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2918((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_273C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_3640();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_28B0(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_36B0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_36E0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_36D0();
  __break(1u);
  return result;
}

void *sub_28B0(uint64_t a1, uint64_t a2)
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
  sub_2C78(&qword_8140);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2918(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_2C78(&qword_8140);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_2AC8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_29F0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_29F0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_36E0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_2AC8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_36E0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_2B5C()
{
  unint64_t result = qword_8098;
  if (!qword_8098)
  {
    type metadata accessor for NotificationsFlowDelegatePlugin();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8098);
  }
  return result;
}

uint64_t type metadata accessor for NotificationsFlowDelegatePlugin()
{
  return self;
}

uint64_t sub_2BCC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2C78(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2CDC()
{
  return v0;
}

void *sub_2CF8()
{
  return &unk_43A0;
}

void *sub_2D04()
{
  return &unk_43B0;
}

uint64_t sub_2D10()
{
  sub_3448();
  uint64_t result = sub_3680();
  qword_8268 = result;
  return result;
}

uint64_t *sub_2D78()
{
  if (qword_8250 != -1) {
    swift_once();
  }
  return &qword_8268;
}

uint64_t sub_2DC4()
{
  uint64_t v0 = sub_3610();
  sub_3488(v0, qword_8270);
  sub_2EB4(v0, (uint64_t)qword_8270);
  if (qword_8250 != -1) {
    swift_once();
  }
  id v1 = (id)qword_8268;
  return sub_3620();
}

uint64_t sub_2E50()
{
  if (qword_8258 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_3610();

  return sub_2EB4(v0, (uint64_t)qword_8270);
}

uint64_t sub_2EB4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2EEC@<X0>(uint64_t a1@<X8>)
{
  if (qword_8258 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_3610();
  uint64_t v3 = sub_2EB4(v2, (uint64_t)qword_8270);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2FAC(uint64_t a1)
{
  if (qword_8258 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_3610();
  uint64_t v3 = sub_2EB4(v2, (uint64_t)qword_8270);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*sub_30A4())()
{
  if (qword_8258 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_3610();
  sub_2EB4(v0, (uint64_t)qword_8270);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_313C()
{
  sub_3448();
  uint64_t result = sub_3680();
  qword_8288 = result;
  return result;
}

uint64_t *sub_31A4()
{
  if (qword_8260 != -1) {
    swift_once();
  }
  return &qword_8288;
}

id sub_31F0()
{
  if (qword_8260 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_8288;

  return v0;
}

uint64_t sub_324C()
{
  if (qword_8260 != -1) {
    swift_once();
  }
  id v0 = (id)qword_8288;

  return sub_35F0();
}

uint64_t sub_32BC()
{
  return 0;
}

uint64_t sub_32C4()
{
  if (qword_8260 != -1) {
    swift_once();
  }
  id v0 = (id)qword_8288;
  sub_35F0();
  sub_3670();
  sub_34EC();

  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_336C()
{
  sub_3660();
  if (qword_8260 != -1) {
    swift_once();
  }
  sub_34EC();

  return os_signpost(_:dso:log:name:signpostID:)();
}

char **sub_3408()
{
  return &off_43C0;
}

const char *sub_3414()
{
  return "AnnounceNotification.GetDuration";
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

ValueMetadata *type metadata accessor for SignPost()
{
  return &type metadata for SignPost;
}

unint64_t sub_3448()
{
  unint64_t result = qword_8148;
  if (!qword_8148)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_8148);
  }
  return result;
}

uint64_t *sub_3488(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_3500()
{
  return type metadata accessor for FlowSearchResult();
}

uint64_t sub_3510()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_3520()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_3530()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_3540(Swift::String refId)
{
}

void sub_3550()
{
}

uint64_t sub_3560()
{
  return static AceService.currentAsync.getter();
}

uint64_t sub_3570()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_3580()
{
  return static Device.current.getter();
}

uint64_t sub_3590()
{
  return static CATExecutor.registerBundle(bundle:)();
}

uint64_t sub_35A0()
{
  return type metadata accessor for CATExecutor();
}

uint64_t sub_35B0()
{
  return NotificationsFeatureFlags.shared.unsafeMutableAddressor();
}

uint64_t sub_35C0()
{
  return NotificationsFlowProvider.init(aceServiceInvoker:deviceState:outputPublisher:featureFlags:)();
}

uint64_t sub_35D0()
{
  return type metadata accessor for NotificationsFlowProvider();
}

uint64_t sub_35F0()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_3600()
{
  return Logger.logObject.getter();
}

uint64_t sub_3610()
{
  return type metadata accessor for Logger();
}

uint64_t sub_3620()
{
  return Logger.init(_:)();
}

uint64_t sub_3630()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_3640()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_3650()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_3660()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_3670()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_3680()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_3690()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_36A0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_36B0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_36C0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_36D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_36E0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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