void *sub_22AC()
{
  return &unk_4260;
}

uint64_t sub_22B8()
{
  sub_3594();
  uint64_t result = sub_3740();
  qword_8260 = result;
  return result;
}

uint64_t *sub_2320()
{
  if (qword_8150 != -1) {
    swift_once();
  }
  return &qword_8260;
}

uint64_t sub_236C()
{
  uint64_t v0 = sub_36F0();
  sub_3530(v0, qword_8268);
  sub_245C(v0, (uint64_t)qword_8268);
  if (qword_8150 != -1) {
    swift_once();
  }
  id v1 = (id)qword_8260;
  return sub_3700();
}

uint64_t sub_23F8()
{
  if (qword_8158 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_36F0();

  return sub_245C(v0, (uint64_t)qword_8268);
}

uint64_t sub_245C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2494@<X0>(uint64_t a1@<X8>)
{
  if (qword_8158 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_36F0();
  uint64_t v3 = sub_245C(v2, (uint64_t)qword_8268);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2554(uint64_t a1)
{
  if (qword_8158 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_36F0();
  uint64_t v3 = sub_245C(v2, (uint64_t)qword_8268);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*sub_264C())()
{
  if (qword_8158 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_36F0();
  sub_245C(v0, (uint64_t)qword_8268);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_26E4()
{
  return swift_allocObject();
}

uint64_t sub_26F4()
{
  return v0;
}

uint64_t sub_26FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_35F0();
  sub_35D4();
  uint64_t v35 = v5;
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)v30 - v9;
  uint64_t v11 = sub_36F0();
  sub_35D4();
  uint64_t v34 = v12;
  __chkstk_darwin(v13);
  v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3690();
  type metadata accessor for SystemCommandsFlowDelegatePlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v17 = [self bundleForClass:ObjCClassFromMetadata];
  sub_3680();

  sub_36A0();
  swift_retain();
  sub_3650();
  sub_3670();
  sub_3660();
  sub_36D0();
  sub_36C0();
  swift_allocObject();
  uint64_t v18 = sub_36B0();
  (*(void (**)(uint64_t))(*(void *)v18 + 104))(a1);
  swift_release();
  if (qword_8158 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_245C(v11, (uint64_t)qword_8268);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v15, v19, v11);
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
  v20(v10, a2, v4);
  v21 = sub_36E0();
  os_log_type_t v22 = sub_3730();
  v23 = v10;
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v33 = v11;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = v35;
    v26 = (uint8_t *)v24;
    uint64_t v31 = swift_slowAlloc();
    v37[0] = v31;
    v32 = v15;
    *(_DWORD *)v26 = 136315138;
    v30[1] = v26 + 4;
    v20(v8, (uint64_t)v23, v4);
    uint64_t v27 = sub_3710();
    uint64_t v36 = sub_2C34(v27, v28, v37);
    sub_3750();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v4);
    _os_log_impl(&dword_0, v21, v22, "SystemCommandsFlowDelegatePlugin findFlowForX | flowSearchResult: %s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v32, v33);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v4);

    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v15, v11);
  }
}

uint64_t sub_2B70()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_2B80()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88))();
}

uint64_t sub_2BC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 80))();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for SystemCommandsFlowDelegatePlugin()
{
  return self;
}

uint64_t sub_2C34(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2D08(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_348C((uint64_t)v12, *a3);
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
      sub_348C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_343C((uint64_t)v12);
  return v7;
}

uint64_t sub_2D08(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2E60((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_3760();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_2F38(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_3780();
    if (!v8)
    {
      uint64_t result = sub_3790();
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

void *sub_2E60(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_37A0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_2F38(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2FD0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_31AC(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_31AC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_2FD0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_3720();
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
  unint64_t v3 = sub_3144(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_3770();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_37A0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_3790();
  __break(1u);
  return result;
}

void *sub_3144(uint64_t a1, uint64_t a2)
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
  sub_34E8(&qword_8140);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_31AC(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_34E8(&qword_8140);
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
    sub_335C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_3284(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_3284(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_37A0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_335C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_37A0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_33F0()
{
  unint64_t result = qword_8098;
  if (!qword_8098)
  {
    type metadata accessor for SystemCommandsFlowDelegatePlugin();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8098);
  }
  return result;
}

uint64_t sub_343C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_348C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_34E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_3530(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_3594()
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

uint64_t sub_35F0()
{
  return type metadata accessor for FlowSearchResult();
}

uint64_t sub_3600()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_3610()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_3620()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_3630(Swift::String refId)
{
}

void sub_3640()
{
}

uint64_t sub_3650()
{
  return static AceService.currentAsync.getter();
}

uint64_t sub_3660()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_3670()
{
  return static Device.current.getter();
}

uint64_t sub_3680()
{
  return static CATExecutor.registerBundle(bundle:templateDir:)();
}

uint64_t sub_3690()
{
  return type metadata accessor for CATExecutor();
}

uint64_t sub_36A0()
{
  return SystemCommandsFeatureFlags.shared.unsafeMutableAddressor();
}

uint64_t sub_36B0()
{
  return SystemCommandsFlowProvider.init(featureFlags:sharedObjects:)();
}

uint64_t sub_36C0()
{
  return type metadata accessor for SystemCommandsFlowProvider();
}

uint64_t sub_36D0()
{
  return SharedObjects.init(aceServiceInvoker:deviceState:outputPublisher:)();
}

uint64_t sub_36E0()
{
  return Logger.logObject.getter();
}

uint64_t sub_36F0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_3700()
{
  return Logger.init(_:)();
}

uint64_t sub_3710()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_3720()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_3730()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_3740()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_3750()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_3760()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_3770()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_3780()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_3790()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_37A0()
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