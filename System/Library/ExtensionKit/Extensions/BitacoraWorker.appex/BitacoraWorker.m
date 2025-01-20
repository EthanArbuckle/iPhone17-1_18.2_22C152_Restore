uint64_t sub_100002388()
{
  uint64_t v0;

  v0 = sub_100003730();
  sub_100003624(v0, qword_100008160);
  sub_1000034F8(v0, (uint64_t)qword_100008160);
  return sub_100003720();
}

uint64_t sub_10000240C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100003688;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_1000024BC(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_100008038 + dword_100008038);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100002564;
  return v5(a1);
}

uint64_t sub_100002564(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100002660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = sub_100002744;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100002744()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100002838(uint64_t a1)
{
  unint64_t v2 = sub_100002B04();

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100002884@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000034D4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002908()
{
  unint64_t result = qword_100008010[0];
  if (!qword_100008010[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100008010);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for BitacoraWorker(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for BitacoraWorker()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for BitacoraWorker(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for BitacoraWorker(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for BitacoraWorker(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BitacoraWorker(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BitacoraWorker(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BitacoraWorker()
{
  return &type metadata for BitacoraWorker;
}

uint64_t sub_100002AB0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100002B04()
{
  unint64_t result = qword_100008030;
  if (!qword_100008030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008030);
  }
  return result;
}

uint64_t sub_100002B58(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100002C2C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100003580((uint64_t)v12, *a3);
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
      sub_100003580((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100003530(v12);
  return v7;
}

uint64_t sub_100002C2C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100003770();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100002DE8(a5, a6);
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
  uint64_t v8 = sub_100003790();
  if (!v8)
  {
    sub_1000037A0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000037B0();
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

uint64_t sub_100002DE8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100002E80(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100003060(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100003060(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100002E80(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100002FF8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100003780();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000037A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100003740();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000037B0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000037A0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100002FF8(uint64_t a1, uint64_t a2)
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
  sub_1000035DC((uint64_t *)&unk_100008040);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100003060(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000035DC((uint64_t *)&unk_100008040);
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
  v13 = a4 + 32;
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
  uint64_t result = sub_1000037B0();
  __break(1u);
  return result;
}

uint64_t sub_1000031B0(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_1000031D0, 0, 0);
}

uint64_t sub_1000031D0()
{
  uint64_t v23 = v0;
  if (qword_100008050 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = sub_100003730();
  sub_1000034F8(v2, (uint64_t)qword_100008160);
  id v3 = v1;
  unint64_t v4 = sub_100003710();
  os_log_type_t v5 = sub_100003750();
  BOOL v6 = os_log_type_enabled(v4, v5);
  int64_t v7 = *(void **)(v0 + 24);
  uint64_t v21 = v0;
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v9 = sub_1000036F0();
    *(void *)(v0 + 16) = sub_100002B58(v9, v10, &v22);
    sub_100003760();
    swift_bridgeObjectRelease();

    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v11 = sub_100003700();
    *(void *)(v0 + 16) = sub_100002B58(v11, v12, &v22);
    sub_100003760();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "TaskId: %s, TaskName: %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  v13 = sub_100003710();
  os_log_type_t v14 = sub_100003750();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Running aggregation.", v15, 2u);
    swift_slowDealloc();
  }

  id v16 = [objc_allocWithZone((Class)LBFAggregator) initForMLHost];
  [v16 upload:1 uploadRawEvents:1 skipNullIdentifiers:1];
  id v17 = objc_allocWithZone((Class)sub_1000036B0());
  uint64_t v18 = sub_1000036A0();

  v19 = *(uint64_t (**)(uint64_t))(v21 + 8);
  return v19(v18);
}

uint64_t sub_1000034D4()
{
  return 0x61726F6361746942;
}

uint64_t sub_1000034F8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003530(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003580(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000035DC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100003624(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100003690()
{
  return static AppExtension.main()();
}

uint64_t sub_1000036A0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_1000036B0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_1000036F0()
{
  return MLHostExtensionContext.taskId.getter();
}

uint64_t sub_100003700()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_100003710()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003720()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100003730()
{
  return type metadata accessor for Logger();
}

Swift::Int sub_100003740()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100003750()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100003760()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100003770()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100003780()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100003790()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000037A0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000037B0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}