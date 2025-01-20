uint64_t sub_2398@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t result;
  uint64_t v11;

  v4 = sub_3730();
  v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for Parse.NLv3IntentOnly(_:))
  {
    sub_255C(a1, a2);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else if (v8 == enum case for Parse.NLv4IntentOnly(_:) || v8 == enum case for Parse.uso(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return sub_255C(a1, a2);
  }
  else
  {
    result = sub_3840();
    __break(1u);
  }
  return result;
}

uint64_t sub_255C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_3730();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)v27 - v9;
  uint64_t v11 = sub_37A0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3760();
  uint64_t v15 = sub_3750();
  sub_34F8((uint64_t)v34);
  if (v15)
  {
    sub_36E0();
    return swift_release();
  }
  else
  {
    uint64_t v32 = a2;
    if (qword_80D8 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_3338(v11, (uint64_t)qword_82C0);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v17, v11);
    uint64_t v31 = v12;
    v18 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v18(v10, a1, v4);
    v19 = sub_3780();
    os_log_type_t v20 = sub_37D0();
    int v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      int v29 = v21;
      v23 = (uint8_t *)v22;
      uint64_t v30 = swift_slowAlloc();
      v34[0] = v30;
      os_log_t v28 = v19;
      *(_DWORD *)v23 = 136315138;
      v27[1] = v23 + 4;
      v18(v8, (uint64_t)v10, v4);
      uint64_t v24 = sub_37B0();
      uint64_t v33 = sub_2AA8(v24, v25, v34);
      sub_37F0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      os_log_t v26 = v28;
      _os_log_impl(&dword_0, v28, (os_log_type_t)v29, "Unable to produce a flow for input: %s", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v11);
    return sub_36D0();
  }
}

uint64_t sub_2934()
{
  sub_354C(v0 + 16);
  sub_354C(v0 + 56);

  return _swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for IdentityFlowPlugin()
{
  return self;
}

uint64_t sub_2998@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2398(a1, a2);
}

uint64_t sub_29BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3100();
  *a1 = result;
  return result;
}

void sub_29F0()
{
}

unint64_t sub_2A54()
{
  unint64_t result = qword_81A8;
  if (!qword_81A8)
  {
    type metadata accessor for IdentityFlowPlugin();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_81A8);
  }
  return result;
}

uint64_t sub_2AA8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2B7C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_359C((uint64_t)v12, *a3);
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
      sub_359C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_354C((uint64_t)v12);
  return v7;
}

uint64_t sub_2B7C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_3800();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2D38(a5, a6);
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
  uint64_t v8 = sub_3820();
  if (!v8)
  {
    sub_3830();
    __break(1u);
LABEL_17:
    uint64_t result = sub_3850();
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

uint64_t sub_2D38(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_2DD0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2FB0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2FB0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_2DD0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2F48(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_3810();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_3830();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_37C0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_3850();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_3830();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_2F48(uint64_t a1, uint64_t a2)
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
  sub_343C(&qword_81B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2FB0(char a1, int64_t a2, char a3, char *a4)
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
    sub_343C(&qword_81B8);
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
  uint64_t result = sub_3850();
  __break(1u);
  return result;
}

uint64_t sub_3100()
{
  uint64_t v0 = sub_37A0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_80D8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_3338(v0, (uint64_t)qword_82C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  size_t v5 = sub_3780();
  os_log_type_t v6 = sub_37E0();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "Initializing IdentityFlowPlugin", v7, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_3770();
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  uint64_t v15 = &type metadata for IdentityFeatureFlagsProvider;
  v16 = &protocol witness table for IdentityFeatureFlagsProvider;
  type metadata accessor for IdentityFlowPlugin();
  uint64_t v8 = swift_allocObject();
  sub_3370((uint64_t)v14, v8 + 16);
  sub_33D4((uint64_t)v17, (uint64_t)&v11);
  if (v12)
  {
    sub_3480((uint64_t)v17);
    sub_354C((uint64_t)v14);
    sub_34E0(&v11, (uint64_t)v13);
  }
  else
  {
    sub_3740();
    sub_3480((uint64_t)v17);
    sub_354C((uint64_t)v14);
    sub_3480((uint64_t)&v11);
  }
  sub_34E0(v13, v8 + 56);
  return v8;
}

uint64_t sub_3338(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_3370(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_33D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_343C(&qword_81B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_343C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_3480(uint64_t a1)
{
  uint64_t v2 = sub_343C(&qword_81B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_34E0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_34F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_354C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_359C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_35FC()
{
  uint64_t v0 = sub_37A0();
  sub_366C(v0, qword_82C0);
  sub_3338(v0, (uint64_t)qword_82C0);
  return sub_3790();
}

uint64_t *sub_366C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_36D0()
{
  return static FlowSearchResult.noFlow.getter();
}

uint64_t sub_36E0()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_36F0()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_3700()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_3710(Swift::String refId)
{
}

void sub_3720()
{
}

uint64_t sub_3730()
{
  return type metadata accessor for Parse();
}

uint64_t sub_3740()
{
  return static Device.current.getter();
}

uint64_t sub_3750()
{
  return IdentityFlowProvider.makeFlow(for:)();
}

uint64_t sub_3760()
{
  return IdentityFlowProvider.init()();
}

uint64_t sub_3770()
{
  return IdentityFeatureFlagsProvider.shared.unsafeMutableAddressor();
}

uint64_t sub_3780()
{
  return Logger.logObject.getter();
}

uint64_t sub_3790()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_37A0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_37B0()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_37C0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_37D0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_37E0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_37F0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_3800()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_3810()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_3820()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_3830()
{
  return _assertionFailure(_:_:file:line:flags:)();
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