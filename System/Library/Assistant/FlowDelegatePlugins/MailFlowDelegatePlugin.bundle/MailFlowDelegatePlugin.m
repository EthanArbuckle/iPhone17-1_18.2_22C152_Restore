uint64_t sub_2A44()
{
  return swift_allocObject();
}

uint64_t sub_2A54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_3760();
  sub_36E0();
  uint64_t v6 = v5;
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v33 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)&v29 - v9;
  sub_37C0();
  sub_36E0();
  uint64_t v35 = v12;
  uint64_t v36 = v11;
  __chkstk_darwin(v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3780();
  type metadata accessor for MailFlowDelegatePlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v16 = [self bundleForClass:ObjCClassFromMetadata];
  sub_3770();

  sub_37A0();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v17(v10, a1, v4);
  v34 = v14;
  v18 = sub_37B0();
  os_log_type_t v19 = sub_37F0();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v32 = a1;
    v21 = (uint8_t *)v20;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v38 = v30;
    uint64_t v31 = a2;
    *(_DWORD *)v21 = 136315138;
    v29 = v21 + 4;
    v17(v33, (uint64_t)v10, v4);
    uint64_t v22 = sub_37D0();
    uint64_t v37 = sub_2E34(v22, v23, &v38);
    sub_3800();
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_36FC();
    v25(v24);
    _os_log_impl(&dword_0, v18, v19, "#MailFlowDelegatePlugin findFlowForX(parse:) %s", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v26 = sub_36FC();
    v27(v26);
  }

  (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v36);
  return sub_3790();
}

uint64_t sub_2D5C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for MailFlowDelegatePlugin()
{
  return self;
}

uint64_t sub_2D90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2A54(a1, a2);
}

uint64_t sub_2DA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2A44();
  *a1 = result;
  return result;
}

unint64_t sub_2DE8()
{
  unint64_t result = qword_8140;
  if (!qword_8140)
  {
    type metadata accessor for MailFlowDelegatePlugin();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8140);
  }
  return result;
}

uint64_t sub_2E34(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2F08(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_363C((uint64_t)v12, *a3);
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
      sub_363C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_35EC(v12);
  return v7;
}

uint64_t sub_2F08(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_3060((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_3810();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_3138(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_3830();
    if (!v8)
    {
      uint64_t result = sub_3840();
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

void *sub_3060(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_3850();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_3138(uint64_t a1, unint64_t a2)
{
  v2 = sub_31D0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v2 = sub_33AC(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    v2 = sub_33AC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_31D0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_37E0();
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
  unint64_t v3 = sub_3344(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_3820();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_3850();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_3840();
  __break(1u);
  return result;
}

void *sub_3344(uint64_t a1, uint64_t a2)
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
  sub_3698(&qword_8148);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_33AC(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_3698(&qword_8148);
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
    sub_355C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_3484(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_3484(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_3850();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_355C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_3850();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_35EC(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_363C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_3698(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_36FC()
{
  return v0;
}

uint64_t sub_3710()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_3720()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_3730()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_3740(Swift::String refId)
{
}

void sub_3750()
{
}

uint64_t sub_3760()
{
  return type metadata accessor for Parse();
}

uint64_t sub_3770()
{
  return static CATExecutor.registerBundle(bundle:templateDir:)();
}

uint64_t sub_3780()
{
  return type metadata accessor for CATExecutor();
}

uint64_t sub_3790()
{
  return static MailFlowFactory.buildFlowResult(parse:)();
}

uint64_t sub_37A0()
{
  return static Logger.siriMail.getter();
}

uint64_t sub_37B0()
{
  return Logger.logObject.getter();
}

uint64_t sub_37C0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_37D0()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_37E0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_37F0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_3800()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_3810()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_3820()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_3830()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_3840()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_3850()
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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