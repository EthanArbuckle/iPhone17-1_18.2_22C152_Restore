uint64_t sub_2934()
{
  uint64_t v0;

  v0 = sub_38D0();
  sub_37FC(v0, qword_81D0);
  sub_2A08(v0, (uint64_t)qword_81D0);
  return sub_38C0();
}

uint64_t sub_29A4()
{
  if (qword_8140 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_38D0();

  return sub_2A08(v0, (uint64_t)qword_81D0);
}

uint64_t sub_2A08(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2A40()
{
  uint64_t v0 = swift_allocObject();
  sub_2A78();
  return v0;
}

uint64_t sub_2A78()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_38D0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_8140 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2A08(v2, (uint64_t)qword_81D0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_retain_n();
  v7 = sub_38B0();
  os_log_type_t v8 = sub_3920();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = v1;
    uint64_t v16 = v14;
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_retain();
    uint64_t v10 = sub_3900();
    uint64_t v15 = sub_3034(v10, v11, &v16);
    sub_3930();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v15 = sub_3034(0x292874696E69, 0xE600000000000000, &v16);
    sub_3930();
    _os_log_impl(&dword_0, v7, v8, "%s - %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v1;
}

uint64_t sub_2D44()
{
  if (qword_8140 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_38D0();
  sub_2A08(v0, (uint64_t)qword_81D0);
  swift_retain_n();
  uint64_t v1 = sub_38B0();
  os_log_type_t v2 = sub_3920();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    swift_retain();
    uint64_t v4 = sub_3900();
    sub_3034(v4, v5, &v8);
    sub_3930();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    sub_3034(0xD000000000000013, 0x8000000000003BA0, &v8);
    sub_3930();
    _os_log_impl(&dword_0, v1, v2, "%s - %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  sub_38F0();
  swift_allocObject();
  uint64_t v8 = sub_38E0();
  sub_368C();
  uint64_t v6 = sub_3860();
  swift_release();
  return v6;
}

uint64_t sub_2FAC()
{
  return v0;
}

uint64_t sub_2FB4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_2FC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  uint64_t result = sub_2A78();
  *a1 = v2;
  return result;
}

uint64_t sub_300C()
{
  return sub_2D44();
}

uint64_t sub_3034(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_3108(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_3758((uint64_t)v12, *a3);
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
      sub_3758((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_3708((uint64_t)v12);
  return v7;
}

uint64_t sub_3108(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_3940();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_32C4(a5, a6);
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
  uint64_t v8 = sub_3960();
  if (!v8)
  {
    sub_3970();
    __break(1u);
LABEL_17:
    uint64_t result = sub_3980();
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

uint64_t sub_32C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_335C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_353C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_353C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_335C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_34D4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_3950();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_3970();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_3910();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_3980();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_3970();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_34D4(uint64_t a1, uint64_t a2)
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
  sub_37B4((uint64_t *)&unk_8130);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_353C(char a1, int64_t a2, char a3, char *a4)
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
    sub_37B4((uint64_t *)&unk_8130);
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
  uint64_t result = sub_3980();
  __break(1u);
  return result;
}

unint64_t sub_368C()
{
  unint64_t result = qword_8090;
  if (!qword_8090)
  {
    sub_38F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8090);
  }
  return result;
}

uint64_t type metadata accessor for GenerativeAssistantEnablementFlowPlugin()
{
  return self;
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

uint64_t sub_3758(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_37B4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_37FC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_3860()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_3870()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_3880()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_3890(Swift::String refId)
{
}

void sub_38A0()
{
}

uint64_t sub_38B0()
{
  return Logger.logObject.getter();
}

uint64_t sub_38C0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_38D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_38E0()
{
  return GenerativeAssistantEnablementFlow.init()();
}

uint64_t sub_38F0()
{
  return type metadata accessor for GenerativeAssistantEnablementFlow();
}

uint64_t sub_3900()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_3910()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_3920()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_3930()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_3940()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_3950()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_3960()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_3970()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_3980()
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

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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