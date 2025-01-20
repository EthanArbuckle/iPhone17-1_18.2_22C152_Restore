uint64_t sub_100005268@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t);
  void (*v22)(char *, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = a1;
  v30 = sub_100005A74(&qword_10001C7E8);
  ((void (*)(void))__chkstk_darwin)();
  v28 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_100005A74(&qword_10001C7F0);
  v25 = *(void *)(v29 - 8);
  v2 = v25;
  v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v27 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v6 = (char *)&v24 - v5;
  v7 = sub_100005A74(&qword_10001C7F8);
  v26 = *(void *)(v7 - 8);
  v8 = v26;
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v24 - v12;
  sub_100005A74(&qword_10001C800);
  sub_100005AB8();
  WindowGroup.init(id:title:lazyContent:)();
  v24 = v6;
  ClarityUIScene.init(content:)();
  v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v15 = v7;
  v14(v11, v13, v7);
  v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v17 = v27;
  v18 = v6;
  v19 = v29;
  v16(v27, v18, v29);
  v20 = v28;
  v14(v28, v11, v15);
  v16(&v20[*(int *)(v30 + 48)], v17, v19);
  _TupleScene.init(_:)();
  v21 = *(void (**)(char *, uint64_t))(v25 + 8);
  v21(v24, v19);
  v22 = *(void (**)(char *, uint64_t))(v26 + 8);
  v22(v13, v15);
  v21(v17, v19);
  return ((uint64_t (*)(char *, uint64_t))v22)(v11, v15);
}

uint64_t sub_1000055C4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000056CC(a1);
}

uint64_t sub_1000055E0()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100005604(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorScheme();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_1000056CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ColorScheme();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005A74(&qword_10001C828);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005A74(&qword_10001C818) - 8;
  __chkstk_darwin();
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005C64();
  NavigationStack.init<>(root:)();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for ColorScheme.dark(_:), v2);
  v14 = (uint64_t *)&v12[*(int *)(v10 + 44)];
  uint64_t v15 = sub_100005A74(&qword_10001C838);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v14 + *(int *)(v15 + 28), v5, v2);
  uint64_t *v14 = KeyPath;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v9, v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v16 = static Color.black.getter();
  uint64_t v17 = swift_getKeyPath();
  sub_100005D10((uint64_t)v12, a1);
  v18 = (uint64_t *)(a1 + *(int *)(sub_100005A74(&qword_10001C800) + 36));
  uint64_t *v18 = v17;
  v18[1] = v16;
  return sub_100005D78((uint64_t)v12);
}

id (*sub_10000597C@<X0>(uint64_t a1@<X8>))()
{
  result = PhotoLibraryView.init()();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(unsigned char *)(a1 + 17) = v5 & 1;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000059F4()
{
  unint64_t result = qword_10001C7E0;
  if (!qword_10001C7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClarityPhotosApp()
{
  return &type metadata for ClarityPhotosApp;
}

uint64_t sub_100005A58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005A74(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005AB8()
{
  unint64_t result = qword_10001C808;
  if (!qword_10001C808)
  {
    sub_100005B58(&qword_10001C800);
    sub_100005BA0();
    sub_100005E14(&qword_10001C840, &qword_10001C848);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C808);
  }
  return result;
}

uint64_t sub_100005B58(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005BA0()
{
  unint64_t result = qword_10001C810;
  if (!qword_10001C810)
  {
    sub_100005B58(&qword_10001C818);
    sub_100005E14(&qword_10001C820, &qword_10001C828);
    sub_100005E14(&qword_10001C830, &qword_10001C838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C810);
  }
  return result;
}

unint64_t sub_100005C64()
{
  unint64_t result = qword_10001C850;
  if (!qword_10001C850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C850);
  }
  return result;
}

uint64_t sub_100005CB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100005CE4()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_100005D10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005A74(&qword_10001C818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005D78(uint64_t a1)
{
  uint64_t v2 = sub_100005A74(&qword_10001C818);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005DD8()
{
  return sub_100005E14(&qword_10001C858, &qword_10001C860);
}

uint64_t sub_100005E14(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005B58(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005E58()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static UIInterfaceOrientation.window.getter()
{
  id v0 = [self sharedApplication];
  id v1 = [v0 connectedScenes];

  sub_100006DD4(0, &qword_10001C920);
  sub_100006204();
  uint64_t v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v2 & 0xC000000000000001) != 0) {
    uint64_t v3 = __CocoaSet.count.getter();
  }
  else {
    uint64_t v3 = *(void *)(v2 + 16);
  }
  if (v3 >= 2)
  {
    if (qword_10001C900 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100006580(v4, (uint64_t)qword_10001DA20);
    swift_bridgeObjectRetain_n();
    char v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v8 = Set.description.getter();
      unint64_t v10 = v9;
      swift_bridgeObjectRelease();
      sub_100006614(v8, v10, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Unexpectedly had multiple scenes: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  sub_10000626C(v2);
  v12 = v11;
  swift_bridgeObjectRelease();
  if (v12)
  {
    self;
    v13 = (void *)swift_dynamicCastObjCClass();
    if (v13)
    {
      uint64_t v14 = (uint64_t)[v13 interfaceOrientation];
      goto LABEL_19;
    }
  }
  if (qword_10001C900 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_100006580(v15, (uint64_t)qword_10001DA20);
  v12 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v16, "Unexpectedly had no window scene.", v17, 2u);
    swift_slowDealloc();
  }
  uint64_t v14 = 1;
LABEL_19:

  return v14;
}

unint64_t sub_100006204()
{
  unint64_t result = qword_10001C928;
  if (!qword_10001C928)
  {
    sub_100006DD4(255, &qword_10001C920);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C928);
  }
  return result;
}

void sub_10000626C(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_100006DD4(0, &qword_10001C920);
    sub_100006204();
    Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v17;
    uint64_t v16 = v18;
    uint64_t v2 = v19;
    uint64_t v3 = v20;
    unint64_t v4 = v21;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v16 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  int64_t v15 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v4)
  {
    uint64_t v8 = (v4 - 1) & v4;
    unint64_t v9 = __clz(__rbit64(v4)) | (v3 << 6);
    uint64_t v10 = v3;
    goto LABEL_29;
  }
  int64_t v12 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v12 < v15)
    {
      unint64_t v13 = *(void *)(v16 + 8 * v12);
      uint64_t v10 = v3 + 1;
      if (v13) {
        goto LABEL_28;
      }
      uint64_t v10 = v3 + 2;
      if (v3 + 2 >= v15) {
        goto LABEL_33;
      }
      unint64_t v13 = *(void *)(v16 + 8 * v10);
      if (v13) {
        goto LABEL_28;
      }
      uint64_t v10 = v3 + 3;
      if (v3 + 3 >= v15) {
        goto LABEL_33;
      }
      unint64_t v13 = *(void *)(v16 + 8 * v10);
      if (v13) {
        goto LABEL_28;
      }
      uint64_t v10 = v3 + 4;
      if (v3 + 4 >= v15) {
        goto LABEL_33;
      }
      unint64_t v13 = *(void *)(v16 + 8 * v10);
      if (v13)
      {
LABEL_28:
        uint64_t v8 = (v13 - 1) & v13;
        unint64_t v9 = __clz(__rbit64(v13)) + (v10 << 6);
LABEL_29:
        id v11 = *(id *)(*(void *)(v1 + 48) + 8 * v9);
        if (v11)
        {
          do
          {
            sub_100006DD4(0, &qword_10001C940);
            if ([v11 isKindOfClass:swift_getObjCClassFromMetadata()]) {
              break;
            }

            uint64_t v3 = v10;
            unint64_t v4 = v8;
            if ((v1 & 0x8000000000000000) == 0) {
              goto LABEL_8;
            }
LABEL_10:
            if (!__CocoaSet.Iterator.next()()) {
              break;
            }
            sub_100006DD4(0, &qword_10001C920);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            id v11 = v22;
            swift_unknownObjectRelease();
            uint64_t v10 = v3;
            uint64_t v8 = v4;
          }
          while (v22);
        }
        goto LABEL_33;
      }
      uint64_t v10 = v3 + 5;
      if (v3 + 5 < v15)
      {
        unint64_t v13 = *(void *)(v16 + 8 * v10);
        if (!v13)
        {
          uint64_t v14 = v3 + 6;
          while (v15 != v14)
          {
            unint64_t v13 = *(void *)(v16 + 8 * v14++);
            if (v13)
            {
              uint64_t v10 = v14 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_33;
        }
        goto LABEL_28;
      }
    }
LABEL_33:
    sub_100006DCC();
    return;
  }
  __break(1u);
}

uint64_t static UIInterfaceOrientation.fromDeviceOrientation(_:)(uint64_t result)
{
  if ((unint64_t)(result - 5) < 0xFFFFFFFFFFFFFFFCLL) {
    return 0;
  }
  return result;
}

uint64_t sub_100006580(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

BOOL variable initialization expression of PhotoLibraryView.isPad()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  return v1 == (id)1;
}

uint64_t sub_100006614(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000066E8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006D6C((uint64_t)v12, *a3);
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
      sub_100006D6C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006D1C((uint64_t)v12);
  return v7;
}

uint64_t sub_1000066E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000068A4(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_1000068A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000693C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006B1C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006B1C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000693C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006AB4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006AB4(uint64_t a1, uint64_t a2)
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
  sub_100005A74(&qword_10001C938);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006B1C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005A74(&qword_10001C938);
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
  unint64_t v13 = a4 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

__n128 sub_100006C6C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100006C7C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100006C9C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize()
{
  if (!qword_10001C930)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10001C930);
    }
  }
}

uint64_t sub_100006D1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006D6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006DCC()
{
  return swift_release();
}

uint64_t sub_100006DD4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100006E14()
{
  return swift_retain();
}

uint64_t destroy for VideoDetailView()
{
  return sub_100006E2C();
}

uint64_t sub_100006E2C()
{
  return swift_release();
}

uint64_t _s15ClarityPhotosUI15VideoDetailViewVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_100006E14();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for VideoDetailView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_100006E14();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_100006E2C();
  return a1;
}

__n128 initializeWithTake for VideoDetailView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for VideoDetailView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_100006E2C();
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoDetailView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for VideoDetailView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoDetailView()
{
  return &type metadata for VideoDetailView;
}

uint64_t sub_100006FD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006FEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v44 = a4;
  uint64_t v42 = sub_100005A74(&qword_10001C950);
  uint64_t v7 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  int64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005A74(&qword_10001C958);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  v36 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100005A74(&qword_10001C960) - 8;
  __chkstk_darwin(v41);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100005A74(&qword_10001C968);
  __chkstk_darwin(v43);
  uint64_t v37 = (uint64_t)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100005A74(&qword_10001C970);
  __chkstk_darwin(v16 - 8);
  v40 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for PlayerViewModel();
  unint64_t v38 = sub_100007574();
  a3 &= 1u;
  id v18 = *(id *)(StateObject.wrappedValue.getter() + 16);
  swift_release();
  VideoPlayer<>.init(player:)();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a1;
  *(void *)(v19 + 24) = a2;
  uint64_t v20 = a2;
  *(unsigned char *)(v19 + 32) = a3;
  uint64_t v21 = (uint64_t)v36;
  uint64_t v22 = v42;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v36, v9, v42);
  v23 = (uint64_t (**)())(v21 + *(int *)(v11 + 44));
  *v23 = sub_1000075D0;
  v23[1] = (uint64_t (*)())v19;
  v23[2] = 0;
  v23[3] = 0;
  sub_100006E14();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v22);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a1;
  *(void *)(v24 + 24) = v20;
  *(unsigned char *)(v24 + 32) = a3;
  sub_10000784C(v21, (uint64_t)v14, &qword_10001C958);
  v25 = &v14[*(int *)(v41 + 44)];
  *(void *)v25 = 0;
  *((void *)v25 + 1) = 0;
  *((void *)v25 + 2) = sub_100007638;
  *((void *)v25 + 3) = v24;
  sub_100006E14();
  sub_1000078B0(v21, &qword_10001C958);
  uint64_t v26 = v37;
  sub_10000784C((uint64_t)v14, v37, &qword_10001C960);
  *(unsigned char *)(v26 + *(int *)(v43 + 36)) = 1;
  sub_1000078B0((uint64_t)v14, &qword_10001C960);
  sub_100007660();
  v27 = v40;
  View.accessibilityIdentifier(_:)();
  sub_1000078B0(v26, &qword_10001C968);
  double v28 = *(double *)(StateObject.wrappedValue.getter() + 24);
  swift_release();
  double v29 = *(double *)(StateObject.wrappedValue.getter() + 32);
  swift_release();
  uint64_t v30 = (uint64_t)v27;
  uint64_t v31 = (uint64_t)v27;
  uint64_t v32 = v44;
  sub_10000784C(v30, v44, &qword_10001C970);
  uint64_t v33 = v32 + *(int *)(sub_100005A74(&qword_10001C9A8) + 36);
  *(double *)uint64_t v33 = v28 / v29;
  *(_WORD *)(v33 + 8) = 0;
  return sub_1000078B0(v31, &qword_10001C970);
}

uint64_t sub_100007464(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  type metadata accessor for PlayerViewModel();
  sub_100007574();
  [*(id *)(StateObject.wrappedValue.getter() + 16) *a4];

  return swift_release();
}

uint64_t sub_1000074F4()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100007510@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 16);
  *(void *)a1 = static HorizontalAlignment.center.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v6 = sub_100005A74(&qword_10001C948);
  return sub_100006FEC(v3, v4, v5, a1 + *(int *)(v6 + 44));
}

unint64_t sub_100007574()
{
  unint64_t result = qword_10001C978;
  if (!qword_10001C978)
  {
    type metadata accessor for PlayerViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C978);
  }
  return result;
}

uint64_t sub_1000075D0()
{
  return sub_100007464(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32), (SEL *)&selRef_play);
}

uint64_t sub_1000075FC()
{
  sub_100006E2C();

  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_100007638()
{
  return sub_100007464(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32), (SEL *)&selRef_pause);
}

unint64_t sub_100007660()
{
  unint64_t result = qword_10001C980;
  if (!qword_10001C980)
  {
    sub_100005B58(&qword_10001C968);
    sub_1000076DC();
    sub_1000077F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C980);
  }
  return result;
}

unint64_t sub_1000076DC()
{
  unint64_t result = qword_10001C988;
  if (!qword_10001C988)
  {
    sub_100005B58(&qword_10001C960);
    sub_100007758();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C988);
  }
  return result;
}

unint64_t sub_100007758()
{
  unint64_t result = qword_10001C990;
  if (!qword_10001C990)
  {
    sub_100005B58(&qword_10001C958);
    sub_100005E14(&qword_10001C998, &qword_10001C950);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C990);
  }
  return result;
}

unint64_t sub_1000077F8()
{
  unint64_t result = qword_10001C9A0;
  if (!qword_10001C9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C9A0);
  }
  return result;
}

uint64_t sub_10000784C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005A74(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000078B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005A74(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000790C()
{
  return sub_100005E14(&qword_10001C9B0, &qword_10001C9B8);
}

char *sub_100007948(char *a1, char **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    a1[8] = *((unsigned char *)a2 + 8);
    int64_t v9 = a2[2];
    uint64_t v8 = a2[3];
    *((void *)a1 + 2) = v9;
    *((void *)a1 + 3) = v8;
    *((_DWORD *)a1 + 8) = *((_DWORD *)a2 + 8);
    a1[36] = *((unsigned char *)a2 + 36);
    uint64_t v10 = (uint64_t)a2[6];
    *((void *)a1 + 5) = a2[5];
    char v11 = *((unsigned char *)a2 + 56);
    uint64_t v12 = v5;
    uint64_t v13 = v9;
    swift_retain();
    swift_retain();
    sub_100007A98(v10, v11);
    *((void *)a1 + 6) = v10;
    a1[56] = v11;
    uint64_t v14 = *(int *)(a3 + 36);
    uint64_t v15 = &a1[v14];
    uint64_t v16 = (uint64_t)a2 + v14;
    *(_OWORD *)&a1[v14] = *(_OWORD *)((char *)a2 + v14);
    uint64_t v17 = *(int *)(type metadata accessor for RoundedRectangle() + 20);
    id v18 = &v15[v17];
    uint64_t v19 = v16 + v17;
    uint64_t v20 = type metadata accessor for RoundedCornerStyle();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t sub_100007A98(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100007AA4(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  sub_100007B50(*(void *)(a1 + 48), *(unsigned char *)(a1 + 56));
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = v4 + *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v6 = type metadata accessor for RoundedCornerStyle();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_100007B50(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100007B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v8 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v7;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  char v10 = *(unsigned char *)(a2 + 56);
  id v11 = v6;
  id v12 = v8;
  swift_retain();
  swift_retain();
  sub_100007A98(v9, v10);
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = v10;
  uint64_t v13 = *(int *)(a3 + 36);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = (_OWORD *)(a2 + v13);
  *(_OWORD *)(a1 + v13) = *v15;
  uint64_t v16 = *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v17 = v14 + v16;
  id v18 = (char *)v15 + v16;
  uint64_t v19 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t sub_100007C64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v9 = *(void **)(a1 + 16);
  char v10 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v10;
  id v11 = v10;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  int v12 = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  uint64_t v13 = *(void *)(a2 + 48);
  char v14 = *(unsigned char *)(a2 + 56);
  sub_100007A98(v13, v14);
  uint64_t v15 = *(void *)(a1 + 48);
  char v16 = *(unsigned char *)(a1 + 56);
  *(void *)(a1 + 48) = v13;
  *(unsigned char *)(a1 + 56) = v14;
  sub_100007B50(v15, v16);
  uint64_t v17 = *(int *)(a3 + 36);
  id v18 = (void *)(a1 + v17);
  uint64_t v19 = a2 + v17;
  void *v18 = *(void *)(a2 + v17);
  v18[1] = *(void *)(a2 + v17 + 8);
  uint64_t v20 = *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v21 = (char *)v18 + v20;
  uint64_t v22 = v19 + v20;
  uint64_t v23 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  return a1;
}

uint64_t sub_100007DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v5 = *(int *)(a3 + 36);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  *(_OWORD *)(a1 + v5) = *(_OWORD *)(a2 + v5);
  uint64_t v8 = *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v9 = v6 + v8;
  uint64_t v10 = v7 + v8;
  uint64_t v11 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_100007E5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v7 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  char v8 = *(unsigned char *)(a2 + 56);
  uint64_t v9 = *(void *)(a1 + 48);
  char v10 = *(unsigned char *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = v8;
  sub_100007B50(v9, v10);
  uint64_t v11 = *(int *)(a3 + 36);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (_OWORD *)(a2 + v11);
  *(_OWORD *)(a1 + v11) = *v13;
  uint64_t v14 = *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v15 = v12 + v14;
  char v16 = (char *)v13 + v14;
  uint64_t v17 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t sub_100007F68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007F7C);
}

uint64_t sub_100007F7C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for RoundedRectangle();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10000802C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100008040);
}

void *sub_100008040(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for RoundedRectangle();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 36);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PhotoViewInternal()
{
  uint64_t result = qword_10001CA18;
  if (!qword_10001CA18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100008134()
{
  uint64_t result = type metadata accessor for RoundedRectangle();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000081F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000820C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v53 = sub_100005A74(&qword_10001CA60);
  __chkstk_darwin(v53);
  v54 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))((char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v47 = type metadata accessor for PhotoViewInternal();
  uint64_t v49 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v50 = v4;
  uint64_t v51 = (uint64_t)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_100005A74(&qword_10001CA68);
  __chkstk_darwin(v46);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Image.ResizingMode();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_100005A74(&qword_10001CA70);
  __chkstk_darwin(v44);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_100005A74(&qword_10001CA78);
  __chkstk_darwin(v45);
  uint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100005A74(&qword_10001CA80);
  uint64_t v15 = __chkstk_darwin(v52);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v48 = (uint64_t)&v39 - v18;
  uint64_t v19 = v1;
  long long v55 = *(_OWORD *)(v1 + 16);
  sub_100005A74(&qword_10001CA88);
  State.wrappedValue.getter();
  uint64_t v20 = v56;
  if (v56)
  {
    uint64_t v39 = static Color.clear.getter();
    uint64_t v21 = static Alignment.center.getter();
    uint64_t v40 = v22;
    uint64_t v41 = v21;
    id v43 = v20;
    Image.init(uiImage:)();
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for Image.ResizingMode.stretch(_:), v7);
    uint64_t v23 = Image.resizable(capInsets:resizingMode:)();
    uint64_t v42 = a1;
    uint64_t v24 = v23;
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v25 = v19 + *(int *)(v47 + 36);
    sub_1000093F0(v25, (uint64_t)v6, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    *(_WORD *)&v6[*(int *)(v46 + 36)] = 256;
    sub_10000784C((uint64_t)v6, (uint64_t)&v12[*(int *)(v44 + 36)], &qword_10001CA68);
    *(void *)uint64_t v12 = v39;
    *((void *)v12 + 1) = 0x3FF0000000000000;
    *((_WORD *)v12 + 8) = 0;
    *((void *)v12 + 3) = v24;
    *((void *)v12 + 4) = 0;
    *((_WORD *)v12 + 20) = 257;
    uint64_t v26 = v40;
    *((void *)v12 + 6) = v41;
    *((void *)v12 + 7) = v26;
    sub_1000078B0((uint64_t)v6, &qword_10001CA68);
    uint64_t v27 = (uint64_t)&v14[*(int *)(v45 + 36)];
    sub_1000093F0(v25, v27, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    *(unsigned char *)(v27 + *(int *)(sub_100005A74(&qword_10001CAF0) + 36)) = 0;
    sub_1000094BC((uint64_t)v12, (uint64_t)v14, &qword_10001CA70);
    uint64_t v28 = v51;
    sub_1000093F0(v19, v51, (uint64_t (*)(void))type metadata accessor for PhotoViewInternal);
    unint64_t v29 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    uint64_t v30 = swift_allocObject();
    sub_100008F9C(v28, v30 + v29);
    sub_10000784C((uint64_t)v14, (uint64_t)v17, &qword_10001CA78);
    uint64_t v31 = &v17[*(int *)(v52 + 36)];
    *(void *)uint64_t v31 = 0;
    *((void *)v31 + 1) = 0;
    *((void *)v31 + 2) = sub_10000945C;
    *((void *)v31 + 3) = v30;
    sub_1000078B0((uint64_t)v14, &qword_10001CA78);
    uint64_t v32 = (uint64_t)v17;
    uint64_t v33 = v48;
    sub_1000094BC(v32, v48, &qword_10001CA80);
    sub_10000784C(v33, (uint64_t)v54, &qword_10001CA80);
    swift_storeEnumTagMultiPayload();
    sub_100005A74(&qword_10001CA90);
    sub_100009080();
    sub_100009350();
    _ConditionalContent<>.init(storage:)();

    return sub_1000078B0(v33, &qword_10001CA80);
  }
  else
  {
    uint64_t v35 = v51;
    sub_1000093F0(v19, v51, (uint64_t (*)(void))type metadata accessor for PhotoViewInternal);
    unint64_t v36 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    uint64_t v37 = swift_allocObject();
    sub_100008F9C(v35, v37 + v36);
    unint64_t v38 = v54;
    *v54 = sub_100009000;
    v38[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v37;
    v38[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))0x3FF0000000000000;
    *((_WORD *)v38 + 12) = 0;
    swift_storeEnumTagMultiPayload();
    sub_100005A74(&qword_10001CA90);
    sub_100009080();
    sub_100009350();
    return _ConditionalContent<>.init(storage:)();
  }
}

uint64_t sub_100008888()
{
  sub_100005A74(&qword_10001CA88);
  State.wrappedValue.setter();
  sub_100005A74(&qword_10001CB10);
  State.wrappedValue.getter();
  id v0 = [self defaultManager];
  [v0 cancelImageRequest:0];

  return State.wrappedValue.setter();
}

uint64_t sub_100008988@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v4 = type metadata accessor for GeometryProxy();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = type metadata accessor for PhotoViewInternal();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100005A74(&qword_10001CB18);
  uint64_t v11 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProgressView<>.init<>()();
  sub_1000093F0(v25, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for PhotoViewInternal);
  uint64_t v14 = a1;
  uint64_t v15 = v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v14, v4);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v17 = (v9 + *(unsigned __int8 *)(v5 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v18 = swift_allocObject();
  sub_100008F9C((uint64_t)v10, v18 + v16);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v18 + v17, (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
  uint64_t v19 = v26;
  uint64_t v20 = v24;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v26, v13, v24);
  uint64_t v21 = (uint64_t (**)())(v19 + *(int *)(sub_100005A74(&qword_10001CB20) + 36));
  *uint64_t v21 = sub_1000096CC;
  v21[1] = (uint64_t (*)())v18;
  v21[2] = 0;
  v21[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v20);
}

uint64_t sub_100008C50(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PhotoViewInternal();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [self defaultManager];
  uint64_t v7 = *(void *)a1;
  GeometryProxy.size.getter();
  double v9 = v8;
  uint64_t v10 = *(void *)(a1 + 48);
  char v11 = *(unsigned char *)(a1 + 56);
  sub_100007A98(v10, v11);
  double v12 = sub_10000BAA0(v10, v11);
  sub_100007B50(v10, v11);
  double v13 = v9 * v12;
  GeometryProxy.size.getter();
  double v15 = v14;
  sub_100007A98(v10, v11);
  double v16 = sub_10000BAA0(v10, v11);
  sub_100007B50(v10, v11);
  id v17 = [objc_allocWithZone((Class)PHImageRequestOptions) init];
  [v17 setDeliveryMode:0];
  [v17 setNetworkAccessAllowed:1];
  [v17 setAllowSecondaryDegradedImage:1];
  sub_1000093F0(a1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for PhotoViewInternal);
  unint64_t v18 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v19 = swift_allocObject();
  sub_100008F9C((uint64_t)v5, v19 + v18);
  uint64_t v30 = sub_1000098C4;
  uint64_t v31 = v19;
  aBlock = _NSConcreteStackBlock;
  uint64_t v27 = 1107296256;
  uint64_t v28 = sub_100009D28;
  unint64_t v29 = &unk_100019568;
  uint64_t v20 = _Block_copy(&aBlock);
  swift_release();
  LODWORD(v7) = [v6 requestImageForAsset:v7 targetSize:1 contentMode:v17 options:v20 resultHandler:v13 v15 * v16];
  _Block_release(v20);

  char v21 = *(unsigned char *)(a1 + 36);
  uint64_t v22 = *(void *)(a1 + 40);
  LODWORD(aBlock) = *(_DWORD *)(a1 + 32);
  BYTE4(aBlock) = v21;
  uint64_t v27 = v22;
  v24[2] = v7;
  char v25 = 0;
  sub_100005A74(&qword_10001CB10);
  return State.wrappedValue.setter();
}

void *sub_100008F3C(void *result)
{
  if (result)
  {
    id v1 = result;
    sub_100005A74(&qword_10001CA88);
    return (void *)State.wrappedValue.setter();
  }
  return result;
}

uint64_t sub_100008F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PhotoViewInternal();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009000@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for PhotoViewInternal() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100008988(a1, v6, a2);
}

unint64_t sub_100009080()
{
  unint64_t result = qword_10001CA98;
  if (!qword_10001CA98)
  {
    sub_100005B58(&qword_10001CA80);
    sub_1000090FC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CA98);
  }
  return result;
}

unint64_t sub_1000090FC()
{
  unint64_t result = qword_10001CAA0;
  if (!qword_10001CAA0)
  {
    sub_100005B58(&qword_10001CA78);
    sub_10000919C();
    sub_100005E14(&qword_10001CAE8, &qword_10001CAF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CAA0);
  }
  return result;
}

unint64_t sub_10000919C()
{
  unint64_t result = qword_10001CAA8;
  if (!qword_10001CAA8)
  {
    sub_100005B58(&qword_10001CA70);
    sub_10000923C();
    sub_100005E14(&qword_10001CAE0, &qword_10001CA68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CAA8);
  }
  return result;
}

unint64_t sub_10000923C()
{
  unint64_t result = qword_10001CAB0;
  if (!qword_10001CAB0)
  {
    sub_100005B58(&qword_10001CAB8);
    sub_1000092DC();
    sub_100005E14(&qword_10001CAD0, &qword_10001CAD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CAB0);
  }
  return result;
}

unint64_t sub_1000092DC()
{
  unint64_t result = qword_10001CAC0;
  if (!qword_10001CAC0)
  {
    sub_100005B58(&qword_10001CAC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CAC0);
  }
  return result;
}

unint64_t sub_100009350()
{
  unint64_t result = qword_10001CAF8;
  if (!qword_10001CAF8)
  {
    sub_100005B58(&qword_10001CA90);
    sub_100005E14(&qword_10001CB00, &qword_10001CB08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CAF8);
  }
  return result;
}

uint64_t sub_1000093F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000945C()
{
  type metadata accessor for PhotoViewInternal();

  return sub_100008888();
}

uint64_t sub_1000094BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005A74(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009520()
{
  id v1 = (int *)(type metadata accessor for PhotoViewInternal() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = type metadata accessor for GeometryProxy();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v3 + v4 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v2 | v7 | 7;
  uint64_t v11 = v0 + v3;

  swift_release();
  swift_release();
  sub_100007B50(*(void *)(v11 + 48), *(unsigned char *)(v11 + 56));
  uint64_t v12 = v1[11];
  uint64_t v13 = v11 + v12 + *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v14 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);

  return _swift_deallocObject(v0, v9, v10);
}

uint64_t sub_1000096CC()
{
  uint64_t v1 = *(void *)(type metadata accessor for PhotoViewInternal() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  type metadata accessor for GeometryProxy();

  return sub_100008C50(v0 + v2);
}

uint64_t sub_10000979C()
{
  uint64_t v1 = (int *)(type metadata accessor for PhotoViewInternal() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  swift_release();
  swift_release();
  sub_100007B50(*(void *)(v6 + 48), *(unsigned char *)(v6 + 56));
  uint64_t v7 = v1[11];
  uint64_t v8 = v6 + v7 + *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v9 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  return _swift_deallocObject(v0, v4, v5);
}

void *sub_1000098C4(void *a1)
{
  type metadata accessor for PhotoViewInternal();

  return sub_100008F3C(a1);
}

uint64_t sub_100009944(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009954()
{
  return swift_release();
}

unint64_t sub_100009960()
{
  unint64_t result = qword_10001CB28;
  if (!qword_10001CB28)
  {
    sub_100005B58(&qword_10001CB30);
    sub_100009080();
    sub_100009350();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CB28);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for PhotoDetailView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PhotoDetailView(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = *(unsigned char *)(a1 + 48);

  return sub_100007B50(v2, v3);
}

uint64_t initializeWithCopy for PhotoDetailView(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  char v7 = *(unsigned char *)(a2 + 48);
  id v8 = v3;
  id v9 = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100007A98(v6, v7);
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = v7;
  return a1;
}

uint64_t assignWithCopy for PhotoDetailView(uint64_t a1, void **a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *a2;
  id v6 = v4;

  char v7 = *(void **)(a1 + 8);
  id v8 = v2[1];
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(void *)(a1 + 16) = v2[2];
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = v2[3];
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = v2[4];
  swift_retain();
  swift_release();
  uint64_t v10 = (uint64_t)v2[5];
  LOBYTE(v2) = *((unsigned char *)v2 + 48);
  sub_100007A98(v10, (char)v2);
  uint64_t v11 = *(void *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 48);
  *(void *)(a1 + 40) = v10;
  *(unsigned char *)(a1 + 48) = (_BYTE)v2;
  sub_100007B50(v11, v12);
  return a1;
}

__n128 initializeWithTake for PhotoDetailView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PhotoDetailView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  char v5 = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = v5;
  sub_100007B50(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoDetailView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotoDetailView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoDetailView()
{
  return &type metadata for PhotoDetailView;
}

uint64_t sub_100009D0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100009D2C()
{
  return sub_10000C688(*v0);
}

uint64_t sub_100009D3C(uint64_t a1)
{
  return sub_10000C724(a1);
}

uint64_t sub_100009D54()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_100009D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, WitnessTable);
}

uint64_t sub_100009E14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, WitnessTable);
}

void sub_100009E90()
{
}

uint64_t sub_100009ED0()
{
  id v12 = *(id *)v0;
  long long v9 = *(_OWORD *)(v0 + 8);
  sub_1000094BC((uint64_t)&v9, (uint64_t)&v11, &qword_10001CB38);
  sub_1000094BC((uint64_t)&v9 + 8, (uint64_t)v10, &qword_10001CB40);
  long long v6 = *(_OWORD *)(v0 + 24);
  sub_1000094BC((uint64_t)&v6, (uint64_t)v8, &qword_10001CB48);
  sub_1000094BC((uint64_t)&v6 + 8, (uint64_t)v7, &qword_10001CB50);
  uint64_t v4 = *(void *)(v0 + 40);
  char v5 = *(unsigned char *)(v0 + 48);
  uint64_t v1 = swift_allocObject();
  long long v2 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v1 + 32) = v2;
  *(_OWORD *)(v1 + 48) = *(_OWORD *)(v0 + 32);
  *(unsigned char *)(v1 + 64) = *(unsigned char *)(v0 + 48);
  sub_10000BA18(&v12);
  sub_10000BA18(&v11);
  sub_10000BA44((uint64_t)v10);
  sub_10000BA44((uint64_t)v8);
  sub_10000BA44((uint64_t)v7);
  sub_10000BA70((uint64_t)&v4);
  LocalizedStringKey.init(stringLiteral:)();
  Image.init(systemName:)();
  sub_100005A74(&qword_10001CB58);
  sub_100005E14(&qword_10001CB60, &qword_10001CB58);
  View.navigationTitle<A>(_:icon:)();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

double sub_10000A0D0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v21 = *(id *)a1;
  if ([v21 mediaType] == (id)2)
  {
    sub_10000A2D8((uint64_t)v10);
  }
  else
  {
    long long v18 = *(_OWORD *)(a1 + 8);
    sub_1000094BC((uint64_t)&v18, (uint64_t)&v20, &qword_10001CB38);
    sub_1000094BC((uint64_t)&v18 + 8, (uint64_t)v19, &qword_10001CB40);
    long long v15 = *(_OWORD *)(a1 + 24);
    sub_1000094BC((uint64_t)&v15, (uint64_t)v17, &qword_10001CB48);
    sub_1000094BC((uint64_t)&v15 + 8, (uint64_t)v16, &qword_10001CB50);
    uint64_t v13 = *(void *)(a1 + 40);
    char v14 = *(unsigned char *)(a1 + 48);
    uint64_t v4 = swift_allocObject();
    long long v5 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v4 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v4 + 32) = v5;
    *(_OWORD *)(v4 + 48) = *(_OWORD *)(a1 + 32);
    *(unsigned char *)(v4 + 64) = *(unsigned char *)(a1 + 48);
    sub_10000BA18(&v21);
    sub_10000BA18(&v20);
    sub_10000BA44((uint64_t)v19);
    sub_10000BA44((uint64_t)v17);
    sub_10000BA44((uint64_t)v16);
    sub_10000BA70((uint64_t)&v13);
  }
  sub_100005A74(&qword_10001CB68);
  sub_100005A74(&qword_10001CB70);
  sub_10000BCB8();
  sub_100005E14(&qword_10001CBA8, &qword_10001CB70);
  _ConditionalContent<>.init(storage:)();
  double result = *(double *)v10;
  long long v7 = v10[1];
  __int16 v8 = v11;
  char v9 = v12;
  *(_OWORD *)a2 = v10[0];
  *(_OWORD *)(a2 + 16) = v7;
  *(_WORD *)(a2 + 32) = v8;
  *(unsigned char *)(a2 + 34) = v9;
  return result;
}

double sub_10000A2D8@<D0>(uint64_t a1@<X8>)
{
  long long v17 = *(_OWORD *)(v1 + 24);
  long long v7 = *(_OWORD *)(v1 + 24);
  sub_100005A74(&qword_10001CBB0);
  State.wrappedValue.getter();
  if (v6)
  {
    static Alignment.bottom.getter();
  }
  else
  {
    sub_1000094BC((uint64_t)&v17 + 8, (uint64_t)v19, &qword_10001CB50);
    sub_1000094BC((uint64_t)&v17, (uint64_t)v18, &qword_10001CB48);
    id v16 = *(id *)v1;
    long long v13 = *(_OWORD *)(v1 + 8);
    sub_1000094BC((uint64_t)&v13, (uint64_t)&v15, &qword_10001CB38);
    sub_1000094BC((uint64_t)&v13 + 8, (uint64_t)v14, &qword_10001CB40);
    uint64_t v11 = *(void *)(v1 + 40);
    char v12 = *(unsigned char *)(v1 + 48);
    uint64_t v3 = swift_allocObject();
    long long v4 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)v1;
    *(_OWORD *)(v3 + 32) = v4;
    *(_OWORD *)(v3 + 48) = *(_OWORD *)(v1 + 32);
    *(unsigned char *)(v3 + 64) = *(unsigned char *)(v1 + 48);
    sub_10000BA18(&v16);
    sub_10000BA18(&v15);
    sub_10000BA44((uint64_t)v14);
    sub_10000BA44((uint64_t)v18);
    sub_10000BA44((uint64_t)v19);
    sub_10000BA70((uint64_t)&v11);
  }
  sub_100005A74(&qword_10001CB88);
  sub_100005A74(&qword_10001CB98);
  sub_100005E14(&qword_10001CB80, &qword_10001CB88);
  sub_10000BFF4(&qword_10001CB90, &qword_10001CB98, (void (*)(void))sub_10000BD84);
  _ConditionalContent<>.init(storage:)();
  double result = *(double *)&v7;
  *(_OWORD *)a1 = v7;
  *(_OWORD *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 32) = v9;
  *(unsigned char *)(a1 + 33) = v10;
  return result;
}

void sub_10000A50C(uint64_t a1)
{
  if (qword_10001C900 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006580(v2, (uint64_t)qword_10001DA20);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    long long v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Requesting asset for video", v5, 2u);
    swift_slowDealloc();
  }

  id v6 = [objc_allocWithZone((Class)PHVideoRequestOptions) init];
  [v6 setNetworkAccessAllowed:1];
  id v7 = [self defaultManager];
  id v22 = *(id *)a1;
  id v8 = v22;
  long long v19 = *(_OWORD *)(a1 + 8);
  sub_1000094BC((uint64_t)&v19, (uint64_t)&v21, &qword_10001CB38);
  sub_1000094BC((uint64_t)&v19 + 8, (uint64_t)v20, &qword_10001CB40);
  long long v16 = *(_OWORD *)(a1 + 24);
  sub_1000094BC((uint64_t)&v16, (uint64_t)v18, &qword_10001CB48);
  sub_1000094BC((uint64_t)&v16 + 8, (uint64_t)v17, &qword_10001CB50);
  uint64_t v14 = *(void *)(a1 + 40);
  char v15 = *(unsigned char *)(a1 + 48);
  uint64_t v9 = swift_allocObject();
  long long v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v9 + 32) = v10;
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(a1 + 32);
  *(unsigned char *)(v9 + 64) = *(unsigned char *)(a1 + 48);
  v13[4] = sub_10000BDF0;
  v13[5] = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100009D28;
  v13[3] = &unk_1000196B8;
  uint64_t v11 = _Block_copy(v13);
  id v12 = v6;
  sub_10000BA18(&v22);
  sub_10000BA18(&v21);
  sub_10000BA44((uint64_t)v20);
  sub_10000BA44((uint64_t)v18);
  sub_10000BA44((uint64_t)v17);
  sub_10000BA70((uint64_t)&v14);
  swift_release();
  [v7 requestPlayerItemForVideo:v8 options:v12 resultHandler:v11];
  _Block_release(v11);
}

void sub_10000A7CC(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v4 = qword_10001C900;
    id v5 = a1;
    if (v4 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_100006580(v6, (uint64_t)qword_10001DA20);
    id v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Got player item", v9, 2u);
      swift_slowDealloc();
    }

    id v10 = *(id *)a3;
    id v11 = v5;
    double v12 = (double)(uint64_t)[v10 pixelWidth];
    double v13 = (double)(uint64_t)[v10 pixelHeight];
    type metadata accessor for PlayerViewModel();
    uint64_t v14 = swift_allocObject();
    id v15 = [objc_allocWithZone((Class)AVPlayer) initWithPlayerItem:v11];

    *(void *)(v14 + 16) = v15;
    *(double *)(v14 + 24) = v12;
    *(double *)(v14 + 32) = v13;
    long long v31 = *(_OWORD *)(a3 + 24);
    *(void *)&long long v28 = v14;
    sub_100005A74(&qword_10001CBB0);
    State.wrappedValue.setter();
  }
  else
  {
    if (qword_10001C900 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_100006580(v16, (uint64_t)qword_10001DA20);
    id v34 = *(id *)a3;
    long long v31 = *(_OWORD *)(a3 + 8);
    sub_1000094BC((uint64_t)&v31, (uint64_t)&v33, &qword_10001CB38);
    sub_1000094BC((uint64_t)&v31 + 8, (uint64_t)v32, &qword_10001CB40);
    long long v28 = *(_OWORD *)(a3 + 24);
    sub_1000094BC((uint64_t)&v28, (uint64_t)v30, &qword_10001CB48);
    sub_1000094BC((uint64_t)&v28 + 8, (uint64_t)v29, &qword_10001CB50);
    uint64_t v26 = *(void *)(a3 + 40);
    char v27 = *(unsigned char *)(a3 + 48);
    sub_10000BA18(&v34);
    sub_10000BA18(&v33);
    sub_10000BA44((uint64_t)v32);
    sub_10000BA44((uint64_t)v30);
    sub_10000BA44((uint64_t)v29);
    sub_10000BA70((uint64_t)&v26);
    swift_bridgeObjectRetain();
    sub_10000BA18(&v34);
    sub_10000BA18(&v33);
    sub_10000BA44((uint64_t)v32);
    sub_10000BA44((uint64_t)v30);
    sub_10000BA44((uint64_t)v29);
    sub_10000BA70((uint64_t)&v26);
    swift_bridgeObjectRetain();
    long long v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = v34;
      uint64_t v20 = swift_slowAlloc();
      id v21 = (void *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 138412546;
      id v22 = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v21 = v19;
      sub_10000BE10(&v34);
      sub_10000BE10(&v33);
      sub_10000BE3C((uint64_t)v32);
      sub_10000BE3C((uint64_t)v30);
      sub_10000BE3C((uint64_t)v29);
      sub_10000BE68((uint64_t)&v26);
      sub_10000BE10(&v34);
      sub_10000BE10(&v33);
      sub_10000BE3C((uint64_t)v32);
      sub_10000BE3C((uint64_t)v30);
      sub_10000BE3C((uint64_t)v29);
      sub_10000BE68((uint64_t)&v26);
      *(_WORD *)(v20 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_100005A74(&qword_10001CBB8);
      uint64_t v23 = String.init<A>(describing:)();
      sub_100006614(v23, v24, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Could not get playerItem for %@. Info: %s", (uint8_t *)v20, 0x16u);
      sub_100005A74(&qword_10001CBC0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10000BE10(&v34);
      sub_10000BE10(&v33);
      sub_10000BE3C((uint64_t)v32);
      sub_10000BE3C((uint64_t)v30);
      sub_10000BE3C((uint64_t)v29);
      sub_10000BE68((uint64_t)&v26);
      sub_10000BE10(&v34);
      sub_10000BE10(&v33);
      sub_10000BE3C((uint64_t)v32);
      sub_10000BE3C((uint64_t)v30);
      sub_10000BE3C((uint64_t)v29);
      sub_10000BE68((uint64_t)&v26);

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_10000AD20(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(void *, uint64_t))(a1 + 32);
  if (a3) {
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a2;
  v4(a2, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000ADCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v23[1] = a3;
  v23[0] = type metadata accessor for GeometryProxy();
  uint64_t v5 = *(void *)(v23[0] - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v23[0]);
  uint64_t v7 = sub_100005A74(&qword_10001CBC8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005A74(&qword_10001CBD0);
  __chkstk_darwin(v10);
  double v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B1A4(a2, (uint64_t)v9);
  GeometryProxy.size.getter();
  GeometryProxy.size.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_10000784C((uint64_t)v9, (uint64_t)v12, &qword_10001CBC8);
  double v13 = &v12[*(int *)(v10 + 36)];
  long long v14 = v25;
  *(_OWORD *)double v13 = v24;
  *((_OWORD *)v13 + 1) = v14;
  *((_OWORD *)v13 + 2) = v26;
  sub_1000078B0((uint64_t)v9, &qword_10001CBC8);
  GeometryProxy.size.getter();
  v23[2] = v15;
  v23[3] = v16;
  id v35 = *(id *)a2;
  long long v32 = *(_OWORD *)(a2 + 8);
  sub_1000094BC((uint64_t)&v32, (uint64_t)&v34, &qword_10001CB38);
  sub_1000094BC((uint64_t)&v32 + 8, (uint64_t)v33, &qword_10001CB40);
  long long v29 = *(_OWORD *)(a2 + 24);
  sub_1000094BC((uint64_t)&v29, (uint64_t)v31, &qword_10001CB48);
  sub_1000094BC((uint64_t)&v29 + 8, (uint64_t)v30, &qword_10001CB50);
  uint64_t v27 = *(void *)(a2 + 40);
  char v28 = *(unsigned char *)(a2 + 48);
  uint64_t v17 = a1;
  uint64_t v18 = v23[0];
  (*(void (**)(char *, uint64_t, void))(v5 + 16))((char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v23[0]);
  unint64_t v19 = (*(unsigned __int8 *)(v5 + 80) + 65) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v20 = swift_allocObject();
  long long v21 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v20 + 32) = v21;
  *(_OWORD *)(v20 + 48) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(v20 + 64) = *(unsigned char *)(a2 + 48);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v20 + v19, (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
  sub_10000BA18(&v35);
  sub_10000BA18(&v34);
  sub_10000BA44((uint64_t)v33);
  sub_10000BA44((uint64_t)v31);
  sub_10000BA44((uint64_t)v30);
  sub_10000BA70((uint64_t)&v27);
  type metadata accessor for CGSize();
  sub_10000BFF4(&qword_10001CBD8, &qword_10001CBD0, (void (*)(void))sub_10000C070);
  sub_10000C280(&qword_10001CC20, (void (*)(uint64_t))type metadata accessor for CGSize);
  View.onChange<A>(of:initial:_:)();
  swift_release();
  return sub_1000078B0((uint64_t)v12, &qword_10001CBD0);
}

uint64_t sub_10000B1A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Image.ResizingMode();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005A74(&qword_10001CC00);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005A74(qword_10001CC28);
  __chkstk_darwin(v11);
  double v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v19 = *(_OWORD *)(a1 + 8);
  sub_100005A74(&qword_10001CA88);
  State.wrappedValue.getter();
  if (v21)
  {
    id v14 = v21;
    v18[1] = a2;
    id v15 = v14;
    Image.init(uiImage:)();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
    uint64_t v16 = Image.resizable(capInsets:resizingMode:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    long long v19 = (unint64_t)v16;
    __int16 v20 = 1;
    sub_100005A74(&qword_10001CC10);
    sub_10000C20C();
    View.accessibilityIdentifier(_:)();
    swift_release();
    sub_10000784C((uint64_t)v10, (uint64_t)v13, &qword_10001CC00);
    swift_storeEnumTagMultiPayload();
    sub_10000C160();
    sub_10000BD84();
    _ConditionalContent<>.init(storage:)();

    return sub_1000078B0((uint64_t)v10, &qword_10001CC00);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_10000C160();
    sub_10000BD84();
    return _ConditionalContent<>.init(storage:)();
  }
}

void sub_10000B49C(uint64_t a1)
{
  id v2 = [self defaultManager];
  id v24 = *(id *)a1;
  id v3 = v24;
  GeometryProxy.size.getter();
  double v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 48);
  sub_100007A98(v6, v7);
  double v8 = sub_10000BAA0(v6, v7);
  sub_100007B50(v6, v7);
  double v9 = v5 * v8;
  GeometryProxy.size.getter();
  double v11 = v10;
  sub_100007A98(v6, v7);
  double v12 = sub_10000BAA0(v6, v7);
  sub_100007B50(v6, v7);
  id v13 = [objc_allocWithZone((Class)PHImageRequestOptions) init];
  [v13 setDeliveryMode:0];
  [v13 setNetworkAccessAllowed:1];
  [v13 setAllowSecondaryDegradedImage:1];
  long long v21 = *(_OWORD *)(a1 + 8);
  sub_1000094BC((uint64_t)&v21, (uint64_t)&v23, &qword_10001CB38);
  sub_1000094BC((uint64_t)&v21 + 8, (uint64_t)v22, &qword_10001CB40);
  long long v18 = *(_OWORD *)(a1 + 24);
  sub_1000094BC((uint64_t)&v18, (uint64_t)v20, &qword_10001CB48);
  sub_1000094BC((uint64_t)&v18 + 8, (uint64_t)v19, &qword_10001CB50);
  uint64_t v14 = swift_allocObject();
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v14 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v14 + 32) = v15;
  *(_OWORD *)(v14 + 48) = *(_OWORD *)(a1 + 32);
  *(unsigned char *)(v14 + 64) = *(unsigned char *)(a1 + 48);
  v17[4] = sub_10000C330;
  v17[5] = v14;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_100009D28;
  v17[3] = &unk_100019730;
  uint64_t v16 = _Block_copy(v17);
  sub_100007A98(v6, v7);
  sub_10000BA18(&v24);
  sub_10000BA18(&v23);
  sub_10000BA44((uint64_t)v22);
  sub_10000BA44((uint64_t)v20);
  sub_10000BA44((uint64_t)v19);
  swift_release();
  [v2 requestImageForAsset:v3 targetSize:0 contentMode:v13 options:v16 resultHandler:v9, v11 * v12];
  _Block_release(v16);
}

uint64_t sub_10000B750(void *a1)
{
  id v1 = a1;
  sub_100005A74(&qword_10001CA88);
  return State.wrappedValue.setter();
}

uint64_t sub_10000B7A0@<X0>(uint64_t a1@<X8>)
{
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_10000B814@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005A74(&qword_10001CB18);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProgressView<>.init<>()();
  uint64_t v6 = static Color.white.getter();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  double v8 = (uint64_t *)(a1 + *(int *)(sub_100005A74(&qword_10001CCB0) + 36));
  *double v8 = KeyPath;
  v8[1] = v6;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10000B934()
{
  uint64_t v0 = sub_100005A74(&qword_10001CCB0);
  unint64_t v1 = sub_10000C56C();

  return Label.init(title:icon:)(sub_10000B7A0, 0, sub_10000B814, 0, &type metadata for Text, v0, &protocol witness table for Text, v1);
}

double sub_10000B9CC@<D0>(uint64_t a1@<X8>)
{
  sub_10000A0D0(v1 + 16, (uint64_t)v7);
  __int16 v3 = v8;
  char v4 = v9;
  double result = *(double *)v7;
  long long v6 = v7[1];
  *(_OWORD *)a1 = v7[0];
  *(_OWORD *)(a1 + 16) = v6;
  *(_WORD *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 34) = v4;
  return result;
}

id *sub_10000BA18(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_10000BA44(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000BA70(uint64_t a1)
{
  return a1;
}

double sub_10000BAA0(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = static os_log_type_t.fault.getter();
  char v9 = static Log.runtimeIssuesLog.getter();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    double v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)double v11 = 136315138;
    uint64_t v13 = sub_100006614(0x74616F6C464743, 0xE700000000000000, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  sub_100007B50(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *(double *)&v14;
}

uint64_t sub_10000BCB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000ADCC(a1, v2 + 16, a2);
}

unint64_t sub_10000BCB8()
{
  unint64_t result = qword_10001CB78;
  if (!qword_10001CB78)
  {
    sub_100005B58(&qword_10001CB68);
    sub_100005E14(&qword_10001CB80, &qword_10001CB88);
    sub_10000BFF4(&qword_10001CB90, &qword_10001CB98, (void (*)(void))sub_10000BD84);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CB78);
  }
  return result;
}

unint64_t sub_10000BD84()
{
  unint64_t result = qword_10001CBA0;
  if (!qword_10001CBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CBA0);
  }
  return result;
}

void sub_10000BDDC()
{
  sub_10000A50C(v0 + 16);
}

uint64_t sub_10000BDE4()
{
  return swift_retain();
}

void sub_10000BDF0(void *a1, uint64_t a2)
{
  sub_10000A7CC(a1, a2, v2 + 16);
}

uint64_t sub_10000BDF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000BE08()
{
  return swift_release();
}

id *sub_10000BE10(id *a1)
{
  return a1;
}

uint64_t sub_10000BE3C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000BE68(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000BE98()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 65) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  swift_release();
  swift_release();
  swift_release();
  sub_100007B50(*(void *)(v0 + 56), *(unsigned char *)(v0 + 64));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_10000BF90()
{
  type metadata accessor for GeometryProxy();

  sub_10000B49C(v0 + 16);
}

uint64_t sub_10000BFF4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005B58(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000C070()
{
  unint64_t result = qword_10001CBE0;
  if (!qword_10001CBE0)
  {
    sub_100005B58(&qword_10001CBC8);
    sub_10000C0E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CBE0);
  }
  return result;
}

unint64_t sub_10000C0E4()
{
  unint64_t result = qword_10001CBE8;
  if (!qword_10001CBE8)
  {
    sub_100005B58(&qword_10001CBF0);
    sub_10000C160();
    sub_10000BD84();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CBE8);
  }
  return result;
}

unint64_t sub_10000C160()
{
  unint64_t result = qword_10001CBF8;
  if (!qword_10001CBF8)
  {
    sub_100005B58(&qword_10001CC00);
    sub_10000C20C();
    sub_10000C280((unint64_t *)&qword_10001CC18, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CBF8);
  }
  return result;
}

unint64_t sub_10000C20C()
{
  unint64_t result = qword_10001CC08;
  if (!qword_10001CC08)
  {
    sub_100005B58(&qword_10001CC10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CC08);
  }
  return result;
}

uint64_t sub_10000C280(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000C2CC()
{
  swift_release();
  swift_release();
  swift_release();
  sub_100007B50(*(void *)(v0 + 56), *(unsigned char *)(v0 + 64));

  return _swift_deallocObject(v0, 65, 7);
}

uint64_t sub_10000C330(void *a1)
{
  return sub_10000B750(a1);
}

ValueMetadata *type metadata accessor for PhotoDetailView.LoadingView()
{
  return &type metadata for PhotoDetailView.LoadingView;
}

uint64_t sub_10000C348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

void *sub_10000C350(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_10000C380()
{
  return swift_release();
}

void *sub_10000C388(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_10000C3C4(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_10000C3F8(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10000C440(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for PhotoViewHost()
{
  return sub_10000C7E8();
}

uint64_t sub_10000C494()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000C528()
{
  return swift_getWitnessTable();
}

uint64_t sub_10000C544()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_10000C560()
{
  return &protocol witness table for Never;
}

unint64_t sub_10000C56C()
{
  unint64_t result = qword_10001CCB8;
  if (!qword_10001CCB8)
  {
    sub_100005B58(&qword_10001CCB0);
    sub_100005E14(&qword_10001CCC0, &qword_10001CB18);
    sub_100005E14(&qword_10001C840, &qword_10001C848);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CCB8);
  }
  return result;
}

uint64_t sub_10000C630@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000C65C()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_10000C688(void (*a1)(void))
{
  return _UIHostingView.__allocating_init(rootView:)();
}

uint64_t sub_10000C724(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  v2(v1);
  return dispatch thunk of _UIHostingView.rootView.setter();
}

uint64_t sub_10000C7E8()
{
  return swift_getGenericMetadata();
}

uint64_t sub_10000C818()
{
  return sub_100005E14(&qword_10001CCC8, &qword_10001CCD0);
}

uint64_t sub_10000C864()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000CA24(v0, qword_10001DA20);
  sub_100006580(v0, (uint64_t)qword_10001DA20);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000C8E8()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OSSignposter();
  sub_10000CA24(v4, qword_10001DA38);
  sub_100006580(v4, (uint64_t)qword_10001DA38);
  if (qword_10001C900 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100006580(v0, (uint64_t)qword_10001DA20);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSSignposter.init(logger:)();
}

uint64_t *sub_10000CA24(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

ValueMetadata *type metadata accessor for PhotoCollection()
{
  return &type metadata for PhotoCollection;
}

uint64_t sub_10000CA98()
{
  return sub_100005E14(&qword_10001CCD8, &qword_10001CCE0);
}

id sub_10000CADC(int64_t a1, uint64_t a2, int64_t a3, id a4)
{
  id result = [a4 count];
  if (a1 < 0 || (uint64_t)result < a1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id result = [a4 count];
  if (a3 < 0 || (uint64_t)result < a3) {
    goto LABEL_17;
  }
  uint64_t v9 = a3 - a1;
  if (a2 >= 1)
  {
    if (v9 < 0 || v9 >= a2) {
      goto LABEL_12;
    }
    return 0;
  }
  if (v9 <= 0 && v9 > a2) {
    return 0;
  }
LABEL_12:
  BOOL v11 = __OFADD__(a1, a2);
  int64_t v10 = a1 + a2;
  if (v11)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id result = [a4 count];
  if ((v10 & 0x8000000000000000) == 0 && (uint64_t)result >= v10) {
    return (id)v10;
  }
LABEL_19:
  __break(1u);
  return result;
}

void *sub_10000CBC0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result - 1;
  }
  return result;
}

void *sub_10000CBD8(void *result)
{
  if (__OFSUB__(*result, 1)) {
    __break(1u);
  }
  else {
    --*result;
  }
  return result;
}

void sub_10000CBF0(void *a1@<X8>)
{
  *a1 = 0;
}

id sub_10000CBF8@<X0>(void *a1@<X8>)
{
  id result = [*v1 count];
  *a1 = result;
  return result;
}

void (*sub_10000CC2C(void *a1, void *a2))(uint64_t a1)
{
  id v4 = [*v2 objectAtIndexedSubscript:*a2];
  *a1 = v4;
  a1[1] = v4;
  return sub_10000CC88;
}

void sub_10000CC88(uint64_t a1)
{
}

uint64_t sub_10000CC90@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  id v7 = *v2;
  uint64_t result = (uint64_t)[*v2 count];
  if (result < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v5 < 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (result < v4)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  *a2 = v5;
  a2[1] = v4;
  a2[2] = v7;

  return (uint64_t)v7;
}

unint64_t sub_10000CD10@<X0>(void *a1@<X8>)
{
  unint64_t result = (unint64_t)[*v1 count];
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    *a1 = 0;
    a1[1] = result;
  }
  return result;
}

BOOL sub_10000CD4C()
{
  return [*v0 count] == 0;
}

void sub_10000CD7C(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

void *sub_10000CD8C@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    unint64_t result = [*v3 count];
    if ((v5 & 0x8000000000000000) == 0 && (uint64_t)result >= v5)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

id sub_10000CDE8@<X0>(int64_t *a1@<X0>, uint64_t a2@<X1>, int64_t *a3@<X2>, uint64_t a4@<X8>)
{
  id result = sub_10000CADC(*a1, a2, *a3, *v4);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v7 & 1;
  return result;
}

id sub_10000CE24(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  id v5 = *v2;
  id result = [*v2 count];
  if (v3 < 0 || (uint64_t)result < v3)
  {
    __break(1u);
  }
  else
  {
    id result = [v5 count];
    if ((v4 & 0x8000000000000000) == 0 && (uint64_t)result >= v4) {
      return (id)(v4 - v3);
    }
  }
  __break(1u);
  return result;
}

uint64_t *sub_10000CE94(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = a2[1];
  if (*result >= *a2)
  {
    BOOL v5 = __OFSUB__(v2, v3);
    BOOL v4 = v2 - v3 < 0;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v4 = 0;
  }
  if (v4 == v5) {
    __break(1u);
  }
  return result;
}

void *sub_10000CEB0(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

void *sub_10000CECC(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

void *sub_10000CEE8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *sub_10000CF00(void *result)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

void sub_10000CF18(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

int64_t sub_10000CF24()
{
  uint64_t v1 = *v0;
  int64_t v2 = (int64_t)[v1 count];
  int64_t result = (int64_t)[v1 count];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    int64_t result = (int64_t)[v1 count];
    if ((v2 & 0x8000000000000000) == 0 && result >= v2) {
      return v2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10000CF94()
{
  return 2;
}

uint64_t sub_10000CF9C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_10000D4EC(*v0);

  return v2;
}

void *sub_10000CFD0(void *a1, void *a2, uint64_t a3)
{
  return sub_10000CFD8(a1, a2, a3, *v3);
}

void *sub_10000CFD8(void *result, void *a2, uint64_t a3, id a4)
{
  BOOL v5 = result;
  if (!a2)
  {
LABEL_10:
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = a3;
  if (!a3)
  {
LABEL_11:
    void *v5 = a4;
    v5[1] = v6;
    return (void *)v6;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if ([a4 count])
    {
      *a2 = [a4 objectAtIndexedSubscript:0];
      if (v6 != 1)
      {
        uint64_t v8 = 1;
        while ((id)v8 != [a4 count])
        {
          a2[v8] = [a4 objectAtIndexedSubscript:v8];
          if (v6 == ++v8) {
            goto LABEL_11;
          }
        }
        uint64_t v6 = v8;
      }
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000D0C4()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

unint64_t sub_10000D0EC()
{
  unint64_t result = qword_10001CCE8;
  if (!qword_10001CCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CCE8);
  }
  return result;
}

void *sub_10000D140()
{
  return &protocol witness table for Int;
}

uint64_t sub_10000D14C()
{
  return sub_10000D370(&qword_10001CCF0);
}

unint64_t sub_10000D180()
{
  unint64_t result = qword_10001CD00;
  if (!qword_10001CD00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD00);
  }
  return result;
}

uint64_t sub_10000D1D4()
{
  return sub_100005E14(&qword_10001CD08, &qword_10001CD10);
}

unint64_t sub_10000D214()
{
  unint64_t result = qword_10001CD18;
  if (!qword_10001CD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD18);
  }
  return result;
}

uint64_t sub_10000D268()
{
  return sub_10000D370(&qword_10001CD20);
}

uint64_t sub_10000D29C()
{
  return sub_10000D428(&qword_10001CD28, (void (*)(void))sub_10000D2E4);
}

unint64_t sub_10000D2E4()
{
  unint64_t result = qword_10001CD30;
  if (!qword_10001CD30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD30);
  }
  return result;
}

uint64_t sub_10000D33C()
{
  return sub_10000D370(&qword_10001CD38);
}

uint64_t sub_10000D370(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005B58(&qword_10001CCF8);
    sub_10000D180();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000D3E0()
{
  return sub_10000D428(&qword_10001CD40, (void (*)(void))sub_10000D498);
}

uint64_t sub_10000D428(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005B58(&qword_10001CD10);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000D498()
{
  unint64_t result = qword_10001CD48;
  if (!qword_10001CD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD48);
  }
  return result;
}

uint64_t sub_10000D4EC(void *a1)
{
  uint64_t v2 = (uint64_t)[a1 count];
  uint64_t result = (uint64_t)[a1 count];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t result = (uint64_t)[a1 count];
    if ((v2 & 0x8000000000000000) == 0 && result >= v2)
    {
      if (v2)
      {
        sub_100005A74(&qword_10001CD50);
        BOOL v4 = (void *)swift_allocObject();
        int64_t v5 = j__malloc_size(v4);
        uint64_t v6 = v5 - 32;
        if (v5 < 32) {
          uint64_t v6 = v5 - 25;
        }
        v4[2] = v2;
        v4[3] = 2 * (v6 >> 3);
        char v7 = sub_10000CFD8(v8, v4 + 4, v2, a1);

        if (v7 == (void *)v2) {
          return (uint64_t)v4;
        }
        __break(1u);
      }
      return (uint64_t)&_swiftEmptyArrayStorage;
    }
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for PhotoView()
{
  return &type metadata for PhotoView;
}

uint64_t sub_10000D5F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D60C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  __chkstk_darwin(v3);
  int64_t v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PhotoViewInternal();
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005A74(&qword_10001CD58);
  __chkstk_darwin(v10);
  double v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_100005A74(&qword_10001CD60);
  uint64_t v13 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  long long v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = 0;
  id v16 = a1;
  sub_100005A74(&qword_10001CB38);
  State.init(wrappedValue:)();
  *((_OWORD *)v9 + 1) = v43;
  LODWORD(v41) = 0;
  BYTE4(v41) = 1;
  sub_100005A74(&qword_10001CD68);
  State.init(wrappedValue:)();
  char v17 = BYTE4(v43);
  uint64_t v18 = *((void *)&v43 + 1);
  *((_DWORD *)v9 + 8) = v43;
  v9[36] = v17;
  *((void *)v9 + 5) = v18;
  *((void *)v9 + 6) = swift_getKeyPath();
  v9[56] = 0;
  long long v19 = &v9[*(int *)(v7 + 44)];
  __int16 v20 = &v19[*(int *)(type metadata accessor for RoundedRectangle() + 20)];
  uint64_t v21 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v22 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104))(v20, v21, v22);
  __asm { FMOV            V0.2D, #10.0 }
  *(_OWORD *)long long v19 = _Q0;
  *(void *)uint64_t v9 = v16;
  v9[8] = 0;
  id v28 = [v16 localIdentifier];
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v31 = v30;

  sub_10000DA98((uint64_t)v9, (uint64_t)v12);
  long long v32 = (uint64_t *)&v12[*(int *)(v10 + 52)];
  *long long v32 = v29;
  v32[1] = v31;
  sub_10000DAFC((uint64_t)v9);
  static AccessibilityChildBehavior.ignore.getter();
  unint64_t v33 = sub_10000DB58();
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v39);
  sub_10000DBB4((uint64_t)v12);
  *(void *)&long long v43 = sub_10000DD74(v16);
  *((void *)&v43 + 1) = v34;
  uint64_t v41 = v10;
  unint64_t v42 = v33;
  swift_getOpaqueTypeConformance2();
  sub_10000DC14();
  uint64_t v35 = v37;
  View.accessibilityLabel<A>(_:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v35);
}

uint64_t sub_10000D9E8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D60C(*v1, a1);
}

uint64_t sub_10000D9F0@<X0>(void *a1@<X8>)
{
  uint64_t result = EnvironmentValues.displayScale.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_10000DA1C@<X0>(void *a1@<X8>)
{
  uint64_t result = EnvironmentValues.displayScale.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_10000DA48()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_10000DA70()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_10000DA98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PhotoViewInternal();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000DAFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PhotoViewInternal();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000DB58()
{
  unint64_t result = qword_10001CD70;
  if (!qword_10001CD70)
  {
    sub_100005B58(&qword_10001CD58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD70);
  }
  return result;
}

uint64_t sub_10000DBB4(uint64_t a1)
{
  uint64_t v2 = sub_100005A74(&qword_10001CD58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000DC14()
{
  unint64_t result = qword_10001CD78;
  if (!qword_10001CD78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD78);
  }
  return result;
}

unint64_t sub_10000DC6C()
{
  unint64_t result = qword_10001CD80;
  if (!qword_10001CD80)
  {
    sub_100005B58(&qword_10001CD88);
    sub_100005B58(&qword_10001CD58);
    sub_10000DB58();
    swift_getOpaqueTypeConformance2();
    sub_10000DD1C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD80);
  }
  return result;
}

unint64_t sub_10000DD1C()
{
  unint64_t result = qword_10001CC18;
  if (!qword_10001CC18)
  {
    type metadata accessor for AccessibilityAttachmentModifier();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CC18);
  }
  return result;
}

uint64_t sub_10000DD74(void *a1)
{
  uint64_t v5 = sub_10000DDD4(a1);
  v2._countAndFlagsBits = 8236;
  v2._object = (void *)0xE200000000000000;
  String.append(_:)(v2);
  v3._countAndFlagsBits = sub_10000DEE8(a1);
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10000DDD4(void *a1)
{
  id v1 = [a1 mediaType];
  if (v1 == (id)2)
  {
    id v2 = [self mainBundle];
    unint64_t v9 = 0x8000000100016E30;
    uint64_t v3 = 1162103126;
  }
  else
  {
    if (v1 != (id)1) {
      return 0;
    }
    id v2 = [self mainBundle];
    unint64_t v9 = 0x8000000100016E30;
    uint64_t v3 = 1414482000;
  }
  v4._uint64_t countAndFlagsBits = v3 & 0xFFFF0000FFFFFFFFLL | 0x4F00000000;
  v4._object = (void *)0xE500000000000000;
  v5._uint64_t countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  unint64_t v6 = 0xD00000000000001ELL;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v4, (Swift::String_optional)0, (NSBundle)v2, v5, *(Swift::String *)(&v9 - 1))._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_10000DEE8(void *a1)
{
  uint64_t v2 = sub_100005A74(&qword_10001CD90);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  Swift::String v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v19 - v6;
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [a1 creationDate];
  if (v12)
  {
    uint64_t v13 = v12;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, 1, 1, v8);
  }
  sub_10000E160((uint64_t)v5, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_10000E1C8((uint64_t)v7);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    if (qword_10001C910 != -1) {
      swift_once();
    }
    long long v15 = (void *)qword_10001DA50;
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    id v17 = [v15 stringFromDate:isa];

    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v14;
}

uint64_t sub_10000E160(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005A74(&qword_10001CD90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E1C8(uint64_t a1)
{
  uint64_t v2 = sub_100005A74(&qword_10001CD90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10000E228(uint64_t *a1@<X8>)
{
  id v3 = [*v1 localIdentifier];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

Swift::Int sub_10000E280()
{
  id v1 = *v0;
  Hasher.init(_seed:)();
  id v2 = v1;
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

void sub_10000E2D0()
{
  id v1 = *v0;
  NSObject.hash(into:)();
}

Swift::Int sub_10000E328()
{
  id v1 = *v0;
  Hasher.init(_seed:)();
  id v2 = v1;
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

uint64_t sub_10000E374()
{
  return static NSObject.== infix(_:_:)() & 1;
}

void sub_10000E3B8()
{
  id v0 = [objc_allocWithZone((Class)NSDateFormatter) init];
  NSString v1 = String._bridgeToObjectiveC()();
  [v0 setDateFormat:v1];

  qword_10001DA50 = (uint64_t)v0;
}

ValueMetadata *type metadata accessor for Photo()
{
  return &type metadata for Photo;
}

unint64_t sub_10000E440()
{
  unint64_t result = qword_10001CD98;
  if (!qword_10001CD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD98);
  }
  return result;
}

void *sub_10000E494()
{
  return &protocol witness table for String;
}

unint64_t sub_10000E4A0()
{
  unint64_t result = qword_10001CDA0;
  if (!qword_10001CDA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001CDA0);
  }
  return result;
}

uint64_t sub_10000E4E0()
{
  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for PlayerViewModel()
{
  return self;
}

void *sub_10000E53C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000E548@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

id (*variable initialization expression of PhotoLibraryView._photoLibrary())()
{
  return sub_10000E5BC;
}

id sub_10000E5BC()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for PhotoLibrary());

  return [v0 init];
}

uint64_t PhotoLibraryView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, void *a4@<X8>)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  *(unsigned char *)(v8 + 32) = a3 & 1;
  *(unsigned char *)(v8 + 33) = HIBYTE(a3) & 1;
  *a4 = sub_10000ED3C;
  a4[1] = v8;

  return sub_10000ED40(a1, a2, a3 & 1);
}

uint64_t sub_10000E67C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __int16 a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v53 = a5;
  uint64_t v45 = type metadata accessor for ScrollAnchorRole();
  uint64_t v44 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005A74(&qword_10001CE68);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100005A74(&qword_10001CE70);
  uint64_t v14 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  id v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100005A74(&qword_10001CE78);
  uint64_t v46 = *(void *)(v17 - 8);
  uint64_t v47 = v17;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_100005A74(&qword_10001CE80);
  __chkstk_darwin(v49);
  uint64_t v52 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100005A74(&qword_10001CE88);
  uint64_t v50 = *(void *)(v21 - 8);
  uint64_t v51 = v21;
  __chkstk_darwin(v21);
  uint64_t v48 = (char *)&v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = a2;
  uint64_t v55 = a3;
  __int16 v56 = a4 & 0x101;
  uint64_t v57 = v42;
  static Axis.Set.vertical.getter();
  sub_100005A74(&qword_10001CE90);
  sub_100005E14(&qword_10001CE98, &qword_10001CE90);
  ScrollView.init(_:showsIndicators:content:)();
  static UnitPoint.bottom.getter();
  uint64_t v23 = sub_100005E14(&qword_10001CEA0, &qword_10001CE68);
  View.defaultScrollAnchor(_:)();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  static UnitPoint.top.getter();
  static ScrollAnchorRole.alignment.getter();
  uint64_t v58 = v10;
  uint64_t v59 = v23;
  id v24 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v43;
  View.defaultScrollAnchor(_:for:)();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v9, v45);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v25);
  LOBYTE(v10) = static Edge.Set.leading.getter();
  unsigned __int8 v26 = static Edge.Set.trailing.getter();
  char v27 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v10) {
    char v27 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v26) {
    char v27 = Edge.Set.init(rawValue:)();
  }
  if (qword_10001C918 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v46;
  uint64_t v36 = v47;
  uint64_t v38 = (uint64_t)v52;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v52, v24, v47);
  uint64_t v39 = v38 + *(int *)(v49 + 36);
  *(unsigned char *)uint64_t v39 = v27;
  *(void *)(v39 + 8) = v29;
  *(void *)(v39 + 16) = v31;
  *(void *)(v39 + 24) = v33;
  *(void *)(v39 + 32) = v35;
  *(unsigned char *)(v39 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v24, v36);
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v58 = Image.init(systemName:)();
  sub_10000FAE8();
  uint64_t v40 = v48;
  View.navigationTitle<A>(_:icon:)();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000FBF8(v38);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v50 + 32))(v53, v40, v51);
}

uint64_t sub_10000ED2C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return _objc_release_x1();
  }
  else {
    return swift_release();
  }
}

uint64_t sub_10000ED40(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return _objc_retain_x1();
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_10000ED50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  uint64_t v27 = a4;
  uint64_t v5 = type metadata accessor for PinnedScrollableViews();
  __chkstk_darwin(v5);
  unsigned __int8 v26 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for GridItem.Size();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (_OWORD *)((char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = type metadata accessor for GridItem();
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100005A74(&qword_10001CE90);
  uint64_t v14 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  id v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  GeometryProxy.size.getter();
  uint64_t v17 = 3;
  if (v19 < v18) {
    uint64_t v17 = 4;
  }
  if ((a3 & 0x100) != 0) {
    uint64_t v20 = v17;
  }
  else {
    uint64_t v20 = 2;
  }
  *uint64_t v10 = xmmword_100014FD0;
  (*(void (**)(_OWORD *, void, uint64_t))(v8 + 104))(v10, enum case for GridItem.Size.flexible(_:), v7);
  GridItem.init(_:spacing:alignment:)();
  sub_10000F5C8((uint64_t)v13, v20);
  uint64_t v28 = v24;
  uint64_t v29 = v25;
  __int16 v30 = a3 & 0x101;
  static HorizontalAlignment.center.getter();
  int v31 = 0;
  sub_10000FD9C(&qword_10001CEB0, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  dispatch thunk of OptionSet.init(rawValue:)();
  sub_100005A74(&qword_10001CEB8);
  sub_10000FC80();
  LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v27, v16, v23);
}

uint64_t sub_10000F09C()
{
  type metadata accessor for PhotoLibrary();
  sub_10000FD9C(&qword_10001CEE0, (void (*)(uint64_t))type metadata accessor for PhotoLibrary);
  id v0 = (void *)StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();

  swift_release();
  swift_release();
  sub_100005A74(&qword_10001CEE8);
  sub_10000D498();
  sub_100005B58(&qword_10001CEC8);
  type metadata accessor for PlainButtonStyle();
  sub_100005E14(&qword_10001CED0, &qword_10001CEC8);
  sub_10000FD9C(&qword_10001CED8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  swift_getOpaqueTypeConformance2();
  sub_10000FDEC();
  return ForEach<>.init(_:content:)();
}

uint64_t sub_10000F294@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  v19[1] = a2;
  v19[0] = type metadata accessor for PlainButtonStyle();
  uint64_t v3 = *(void *)(v19[0] - 8);
  __chkstk_darwin(v19[0]);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005A74(&qword_10001CEC8);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  uint64_t v27 = 0;
  id v11 = v10;
  sub_100005A74(&qword_10001CB38);
  State.init(wrappedValue:)();
  id v13 = v20;
  id v12 = v21;
  uint64_t v27 = 0;
  sub_100005A74(&qword_10001CB48);
  State.init(wrappedValue:)();
  id v15 = v20;
  id v14 = v21;
  uint64_t KeyPath = swift_getKeyPath();
  id v20 = v11;
  id v21 = v13;
  id v22 = v12;
  id v23 = v15;
  id v24 = v14;
  uint64_t v25 = KeyPath;
  char v26 = 0;
  v19[4] = v11;
  sub_10000FE54();
  sub_10000FEA8();
  NavigationLink.init(destination:label:)();
  PlainButtonStyle.init()();
  sub_100005E14(&qword_10001CED0, &qword_10001CEC8);
  sub_10000FD9C(&qword_10001CED8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  uint64_t v17 = v19[0];
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id (*PhotoLibraryView.init()())()
{
  id v0 = [self currentDevice];
  [v0 userInterfaceIdiom];

  return sub_10000E5BC;
}

uint64_t sub_10000F5C8(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      uint64_t v4 = type metadata accessor for GridItem();
      uint64_t v5 = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)();
      *((void *)v5 + 2) = a2;
      uint64_t v6 = *(void *)(v4 - 8);
      unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      v8(&v5[v7], a1, v4);
      uint64_t v9 = a2 - 1;
      if (a2 != 1)
      {
        uint64_t v10 = *(void *)(v6 + 72);
        id v11 = &v5[v10 + v7];
        do
        {
          v8(v11, a1, v4);
          v11 += v10;
          --v9;
        }
        while (v9);
      }
    }
    else
    {
      uint64_t v5 = (char *)&_swiftEmptyArrayStorage;
    }
    uint64_t v12 = type metadata accessor for GridItem();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
    return (uint64_t)v5;
  }
  return result;
}

uint64_t sub_10000F770()
{
  uint64_t result = static ClarityUIMetrics.titleHorizontalPadding.getter();
  qword_10001CE50 = v1;
  return result;
}

uint64_t sub_10000F790@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 16);
  char v6 = *(unsigned char *)(v1 + 17);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v3;
  *(void *)(v7 + 24) = v4;
  *(unsigned char *)(v7 + 32) = v5;
  *(unsigned char *)(v7 + 33) = v6;
  *a1 = sub_10000ED3C;
  a1[1] = v7;

  return sub_10000ED40(v3, v4, v5);
}

uint64_t sub_10000F81C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for PhotoLibraryView(uint64_t a1)
{
  return sub_10000ED2C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s15ClarityPhotosUI16PhotoLibraryViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_10000ED40(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t assignWithCopy for PhotoLibraryView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_10000ED40(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_10000ED2C(v7, v8, v9);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

__n128 initializeWithTake for PhotoLibraryView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PhotoLibraryView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_10000ED2C(v5, v6, v7);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoLibraryView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 18)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotoLibraryView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoLibraryView()
{
  return &type metadata for PhotoLibraryView;
}

uint64_t sub_10000FA18()
{
  return sub_100005E14(&qword_10001CE58, &qword_10001CE60);
}

uint64_t sub_10000FA58()
{
  sub_10000ED2C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));

  return _swift_deallocObject(v0, 34, 7);
}

uint64_t sub_10000FA94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(unsigned char *)(v2 + 33)) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  return sub_10000E67C(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), v3 | *(unsigned __int8 *)(v2 + 32), a2);
}

uint64_t sub_10000FABC@<X0>(uint64_t a1@<X8>)
{
  if (*(unsigned char *)(v1 + 33)) {
    __int16 v2 = 256;
  }
  else {
    __int16 v2 = 0;
  }
  return sub_10000ED50(*(void *)(v1 + 16), *(void *)(v1 + 24), v2 | *(unsigned __int8 *)(v1 + 32), a1);
}

unint64_t sub_10000FAE8()
{
  unint64_t result = qword_10001CEA8;
  if (!qword_10001CEA8)
  {
    sub_100005B58(&qword_10001CE80);
    sub_100005B58(&qword_10001CE70);
    sub_100005B58(&qword_10001CE68);
    sub_100005E14(&qword_10001CEA0, &qword_10001CE68);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CEA8);
  }
  return result;
}

uint64_t sub_10000FBF8(uint64_t a1)
{
  uint64_t v2 = sub_100005A74(&qword_10001CE80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000FC58()
{
  return sub_10000F09C();
}

unint64_t sub_10000FC80()
{
  unint64_t result = qword_10001CEC0;
  if (!qword_10001CEC0)
  {
    sub_100005B58(&qword_10001CEB8);
    sub_100005B58(&qword_10001CEC8);
    type metadata accessor for PlainButtonStyle();
    sub_100005E14(&qword_10001CED0, &qword_10001CEC8);
    sub_10000FD9C(&qword_10001CED8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CEC0);
  }
  return result;
}

uint64_t sub_10000FD9C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10000FDEC()
{
  unint64_t result = qword_10001CEF0;
  if (!qword_10001CEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CEF0);
  }
  return result;
}

id sub_10000FE48@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

unint64_t sub_10000FE54()
{
  unint64_t result = qword_10001CEF8;
  if (!qword_10001CEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CEF8);
  }
  return result;
}

unint64_t sub_10000FEA8()
{
  unint64_t result = qword_10001CF00;
  if (!qword_10001CF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CF00);
  }
  return result;
}

uint64_t sub_10000FEFC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

char *sub_10000FF70()
{
  uint64_t v1 = OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary;
  uint64_t v2 = self;
  __int16 v3 = v0;
  id v4 = [v2 sharedPhotoLibrary];
  *(void *)&v0[v1] = v4;
  id v5 = v4;
  id v6 = sub_1000123A8((unint64_t)v5);

  swift_beginAccess();
  id v12 = v6;
  Published.init(initialValue:)();
  swift_endAccess();

  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for PhotoLibrary();
  char v7 = (char *)[super init];
  uint64_t v8 = *(void **)&v7[OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary];
  char v9 = v7;
  [v8 registerChangeObserver:v9];
  sub_1000132D4();

  return v9;
}

id sub_1000100A8()
{
  [*(id *)&v0[OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary] unregisterChangeObserver:v0];
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotoLibrary();
  return [super dealloc];
}

uint64_t sub_1000101E8()
{
  return type metadata accessor for PhotoLibrary();
}

uint64_t type metadata accessor for PhotoLibrary()
{
  uint64_t result = qword_10001CFA0;
  if (!qword_10001CFA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001023C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = (char **)(a4 + 16);
  id v6 = [a1 localIdentifier];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  swift_beginAccess();
  uint64_t v10 = *(char **)(a4 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a4 + 16) = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v10 = sub_100011808(0, *((void *)v10 + 2) + 1, 1, v10);
    char *v5 = v10;
  }
  unint64_t v13 = *((void *)v10 + 2);
  unint64_t v12 = *((void *)v10 + 3);
  if (v13 >= v12 >> 1)
  {
    uint64_t v10 = sub_100011808((char *)(v12 > 1), v13 + 1, 1, v10);
    char *v5 = v10;
  }
  *((void *)v10 + 2) = v13 + 1;
  id v14 = &v10[16 * v13];
  *((void *)v14 + 4) = v7;
  *((void *)v14 + 5) = v9;
  return swift_endAccess();
}

void sub_100010334(uint64_t a1, void *a2)
{
  __int16 v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_1000103B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005A74(&qword_10001CFB8);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  id v5 = (void *)v12[1];
  sub_100006DD4(0, &qword_10001CFC0);
  id v6 = (void *)PHChange.changeDetails<A>(for:)();

  if (v6)
  {
    uint64_t v7 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
    type metadata accessor for MainActor();
    id v8 = v6;
    id v9 = v1;
    uint64_t v10 = static MainActor.shared.getter();
    objc_super v11 = (void *)swift_allocObject();
    v11[2] = v10;
    v11[3] = &protocol witness table for MainActor;
    v11[4] = v8;
    v11[5] = v9;
    sub_100010ECC((uint64_t)v4, (uint64_t)&unk_10001CFD0, (uint64_t)v11);

    swift_release();
  }
}

uint64_t sub_100010570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[7] = a4;
  v5[8] = a5;
  uint64_t v6 = type metadata accessor for IndexSet.Index();
  v5[9] = v6;
  v5[10] = *(void *)(v6 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  v5[13] = sub_100005A74(&qword_10001CFE8);
  v5[14] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for IndexSet();
  v5[15] = v7;
  v5[16] = *(void *)(v7 - 8);
  v5[17] = swift_task_alloc();
  v5[18] = swift_task_alloc();
  sub_100005A74(&qword_10001CFF0);
  v5[19] = swift_task_alloc();
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[22] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100010760, v9, v8);
}

uint64_t sub_100010760()
{
  uint64_t v1 = *(void **)(v0 + 56);
  swift_release();
  if (![v1 hasIncrementalChanges]) {
    goto LABEL_10;
  }
  id v2 = [*(id *)(v0 + 56) insertedIndexes];
  uint64_t v3 = *(void *)(v0 + 168);
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)(v0 + 144);
    uint64_t v6 = *(void *)(v0 + 120);
    uint64_t v7 = *(void *)(v0 + 128);
    static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v3, v5, v6);
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v8(v3, 0, 1, v6);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v3, 1, v6) != 1)
    {
      uint64_t v9 = *(void *)(v0 + 168);
LABEL_9:
      sub_1000078B0(v9, &qword_10001CFF0);
LABEL_10:
      if (qword_10001C900 != -1) {
        swift_once();
      }
      uint64_t v17 = type metadata accessor for Logger();
      sub_100006580(v17, (uint64_t)qword_10001DA20);
      double v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v18, v19))
      {
        id v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Updating photo collection for photo library change.", v20, 2u);
        swift_slowDealloc();
      }
      id v21 = *(void **)(v0 + 56);
      id v22 = *(void **)(v0 + 64);

      id v23 = [v21 fetchResultAfterChanges];
      swift_getKeyPath();
      swift_getKeyPath();
      *(void *)(v0 + 48) = v23;
      id v24 = v22;
      static Published.subscript.setter();
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 128) + 56);
    v8(*(void *)(v0 + 168), 1, 1, *(void *)(v0 + 120));
  }
  uint64_t v10 = *(void **)(v0 + 56);
  sub_1000078B0(*(void *)(v0 + 168), &qword_10001CFF0);
  id v11 = [v10 removedIndexes];
  uint64_t v12 = *(void *)(v0 + 160);
  if (v11)
  {
    unint64_t v13 = v11;
    uint64_t v14 = *(void *)(v0 + 144);
    uint64_t v15 = *(void *)(v0 + 120);
    uint64_t v16 = *(void *)(v0 + 128);
    static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v12, v14, v15);
    v8(v12, 0, 1, v15);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v12, 1, v15) != 1)
    {
      uint64_t v9 = *(void *)(v0 + 160);
      goto LABEL_9;
    }
  }
  else
  {
    v8(*(void *)(v0 + 160), 1, 1, *(void *)(v0 + 120));
  }
  uint64_t v27 = *(void **)(v0 + 56);
  sub_1000078B0(*(void *)(v0 + 160), &qword_10001CFF0);
  id v28 = [v27 changedIndexes];
  uint64_t v29 = *(void *)(v0 + 152);
  if (!v28)
  {
    v8(*(void *)(v0 + 152), 1, 1, *(void *)(v0 + 120));
    goto LABEL_26;
  }
  __int16 v30 = v28;
  uint64_t v31 = *(void *)(v0 + 144);
  uint64_t v32 = *(void *)(v0 + 120);
  uint64_t v33 = *(void *)(v0 + 128);
  static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 32);
  v34(v29, v31, v32);
  v8(v29, 0, 1, v32);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v29, 1, v32) == 1)
  {
LABEL_26:
    sub_1000078B0(*(void *)(v0 + 152), &qword_10001CFF0);
    goto LABEL_15;
  }
  uint64_t v35 = *(void *)(v0 + 128);
  uint64_t v36 = *(void *)(v0 + 112);
  uint64_t v37 = *(void *)(v0 + 104);
  uint64_t v38 = *(void *)(v0 + 80);
  v34(*(void *)(v0 + 136), *(void *)(v0 + 152), *(void *)(v0 + 120));
  IndexSet.makeIterator()();
  uint64_t v39 = v36 + *(int *)(v37 + 36);
  v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16);
  uint64_t v40 = (void (**)(uint64_t, uint64_t))(v38 + 8);
  v61 = (void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16);
  v63 = (void (**)(uint64_t, uint64_t))(v35 + 8);
  while (1)
  {
    uint64_t v42 = *(void *)(v0 + 88);
    uint64_t v41 = *(void *)(v0 + 96);
    uint64_t v43 = *(void *)(v0 + 72);
    v62(v41, v39, v43);
    sub_1000117C0(&qword_10001CFF8, (void (*)(uint64_t))&type metadata accessor for IndexSet);
    dispatch thunk of Collection.endIndex.getter();
    sub_1000117C0((unint64_t *)&unk_10001D000, (void (*)(uint64_t))&type metadata accessor for IndexSet.Index);
    char v44 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v45 = *v40;
    (*v40)(v42, v43);
    v45(v41, v43);
    uint64_t v46 = *(void *)(v0 + 112);
    uint64_t v47 = *(void *)(v0 + 120);
    if (v44) {
      break;
    }
    uint64_t v48 = *(void *)(v0 + 144);
    uint64_t v49 = *(void **)(v0 + 56);
    uint64_t v50 = (void (*)(uint64_t, void))dispatch thunk of Collection.subscript.read();
    uint64_t v52 = *v51;
    v50(v0 + 16, 0);
    (*v61)(v48, v46, v47);
    dispatch thunk of Collection.formIndex(after:)();
    uint64_t v53 = *v63;
    (*v63)(v48, v47);
    id v54 = [v49 fetchResultBeforeChanges];
    id v55 = [v54 objectAtIndexedSubscript:v52];

    id v56 = [v49 fetchResultAfterChanges];
    id v57 = [v56 objectAtIndexedSubscript:v52];

    sub_100006DD4(0, &qword_10001CFC0);
    LOBYTE(v56) = static NSObject.== infix(_:_:)();

    if ((v56 & 1) == 0)
    {
      uint64_t v58 = *(void *)(v0 + 136);
      uint64_t v59 = *(void *)(v0 + 120);
      sub_1000078B0(*(void *)(v0 + 112), &qword_10001CFE8);
      v53(v58, v59);
      goto LABEL_10;
    }
  }
  uint64_t v60 = *(void *)(v0 + 136);
  sub_1000078B0(*(void *)(v0 + 112), &qword_10001CFE8);
  (*v63)(v60, v47);
LABEL_15:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

uint64_t sub_100010ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000078B0(a1, &qword_10001CFB8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_1000110D0()
{
  sub_10001116C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10001116C()
{
  if (!qword_10001CFB0)
  {
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10001CFB0);
    }
  }
}

uint64_t sub_1000111C4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PhotoLibrary();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100011204@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100011288(void **a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return static Published.subscript.setter();
}

uint64_t sub_100011300()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100011348(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100011408;
  return sub_100010570(a1, v4, v5, v7, v6);
}

uint64_t sub_100011408()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000114FC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000115D8;
  return v6(a1);
}

uint64_t sub_1000115D8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000116D0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100011708(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100011408;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10001CFD8 + dword_10001CFD8);
  return v6(a1, v4);
}

uint64_t sub_1000117C0(unint64_t *a1, void (*a2)(uint64_t))
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

char *sub_100011808(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100005A74(&qword_10001D050);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100013654(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100011918(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
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
      double v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100011DA8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100011AC8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005A74(&qword_10001D048);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    __int16 v30 = (void *)(v2 + 56);
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
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *__int16 v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_100011DA8(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100011AC8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100011F44();
      goto LABEL_22;
    }
    sub_1000120F8();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_100011F44()
{
  uint64_t v1 = v0;
  sub_100005A74(&qword_10001D048);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
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
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000120F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005A74(&qword_10001D048);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

id sub_1000123A8(unint64_t a1)
{
  uint64_t v106 = type metadata accessor for OSSignpostError();
  uint64_t v105 = *(void *)(v106 - 8);
  __chkstk_darwin(v106);
  unint64_t v3 = (unint64_t)&v96 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = type metadata accessor for OSSignpostID();
  uint64_t v4 = *(void *)(v111 - 8);
  uint64_t v5 = __chkstk_darwin(v111);
  v109 = (char *)&v96 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  v110 = (char *)&v96 - v8;
  __chkstk_darwin(v7);
  int64_t v10 = (int64_t)&v96 - v9;
  if (qword_10001C908 != -1) {
LABEL_77:
  }
    swift_once();
  uint64_t v11 = type metadata accessor for OSSignposter();
  uint64_t v12 = sub_100006580(v11, (uint64_t)qword_10001DA38);
  static OSSignpostID.exclusive.getter();
  int64_t v13 = OSSignposter.logHandle.getter();
  os_signpost_type_t v14 = static os_signpost_type_t.begin.getter();
  char v15 = OS_os_log.signpostsEnabled.getter();
  unint64_t v115 = v3;
  uint64_t v108 = v12;
  unint64_t v119 = a1;
  if (v15)
  {
    int64_t v16 = *(void (**)(char *, int64_t, uint64_t))(v4 + 16);
    unint64_t v17 = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    BOOL v19 = v110;
    uint64_t v18 = v111;
    v16(v110, v10, v111);
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    os_signpost_id_t v21 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, v14, v21, "makePhotoCollection", "", v20, 2u);
    unint64_t v3 = v115;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v19, v18);
  }
  else
  {

    int64_t v16 = *(void (**)(char *, int64_t, uint64_t))(v4 + 16);
    unint64_t v17 = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    BOOL v19 = v110;
    uint64_t v18 = v111;
  }
  v104 = (void (*)(char *, char *, uint64_t))v16;
  unint64_t v103 = v17;
  v16(v19, v10, v18);
  type metadata accessor for OSSignpostIntervalState();
  swift_allocObject();
  uint64_t v22 = OSSignpostIntervalState.init(id:isOpen:)();
  unint64_t v24 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v23 = v4 + 8;
  v107 = v24;
  v24((char *)v10, v18);
  id v25 = [objc_allocWithZone((Class)PHFetchOptions) init];
  [v25 setIncludeAssetSourceTypes:5];
  sub_100006DD4(0, &qword_10001D010);
  id v26 = [(id)swift_getObjCClassFromMetadata() sharedInstance];
  if (![v26 includeSharedAlbums]) {
    goto LABEL_67;
  }
  id v102 = v26;
  id v27 = [v26 selectedSharedAlbumCloudIdentifiers];
  uint64_t v28 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v112 = *(void *)(v28 + 16);
  if (!v112)
  {
    swift_bridgeObjectRelease();
    goto LABEL_66;
  }
  uint64_t v100 = v22;
  uint64_t v101 = v23;
  uint64_t v4 = v28;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = &_swiftEmptyArrayStorage;
  __int16 v30 = self;
  a1 = 1;
  id v99 = v25;
  id v31 = [v30 fetchAssetCollectionsWithType:1 subtype:101 options:v25];
  aBlock[4] = sub_1000135C0;
  aBlock[5] = v29;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010334;
  aBlock[3] = &unk_100019990;
  uint64_t v32 = _Block_copy(aBlock);
  uint64_t v98 = v29;
  swift_retain();
  swift_release();
  [v31 enumerateObjectsUsingBlock:v32];
  _Block_release(v32);

  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v33 = PHPhotoLibrary.cloudIdentifierMappings(forLocalIdentifiers:)();
  swift_bridgeObjectRelease();
  int64_t v10 = 0;
  v120[2] = (uint64_t)&_swiftEmptySetSingleton;
  uint64_t v35 = *(void *)(v33 + 64);
  v116 = (void *)v4;
  uint64_t v117 = v33 + 64;
  uint64_t v36 = 1 << *(unsigned char *)(v33 + 32);
  uint64_t v37 = -1;
  if (v36 < 64) {
    uint64_t v37 = ~(-1 << v36);
  }
  unint64_t v3 = v37 & v35;
  int64_t v118 = (unint64_t)(v36 + 63) >> 6;
  unint64_t v119 = v33;
  v97 = (void *)(v4 + 72);
  *(void *)&long long v34 = 136315394;
  long long v114 = v34;
  v113 = (char *)&type metadata for Any + 8;
  while (v3)
  {
    unint64_t v38 = __clz(__rbit64(v3));
    v3 &= v3 - 1;
    unint64_t v39 = v38 | (v10 << 6);
LABEL_27:
    uint64_t v43 = 16 * v39;
    char v44 = (uint64_t *)(*(void *)(v119 + 48) + v43);
    uint64_t v45 = *v44;
    a1 = v44[1];
    uint64_t v46 = *(void *)(v119 + 56) + v43;
    uint64_t v47 = *(void **)v46;
    if (*(unsigned char *)(v46 + 8))
    {
      sub_1000135E0(v47, 1);
      sub_1000135E0(v47, 1);
      uint64_t v48 = qword_10001C900;
      swift_bridgeObjectRetain();
      if (v48 != -1) {
        swift_once();
      }
      uint64_t v49 = type metadata accessor for Logger();
      sub_100006580(v49, (uint64_t)qword_10001DA20);
      sub_1000135E0(v47, 1);
      sub_1000135E0(v47, 1);
      swift_bridgeObjectRetain();
      uint64_t v50 = Logger.logObject.getter();
      os_log_type_t v51 = static os_log_type_t.error.getter();
      uint64_t v4 = v51;
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = swift_slowAlloc();
        uint64_t v53 = (void *)swift_slowAlloc();
        v120[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v52 = v114;
        swift_bridgeObjectRetain();
        *(void *)(v52 + 4) = sub_100006614(v45, a1, v120);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v52 + 12) = 2112;
        swift_errorRetain();
        uint64_t v54 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v52 + 14) = v54;
        *uint64_t v53 = v54;
        sub_1000135EC(v47, 1);
        sub_1000135EC(v47, 1);
        _os_log_impl((void *)&_mh_execute_header, v50, (os_log_type_t)v4, "Error fetching album cloud identifier for local identifier: %s. Error: %@.", (uint8_t *)v52, 0x16u);
        sub_100005A74(&qword_10001CBC0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        sub_1000135EC(v47, 1);
      }
      else
      {
        sub_1000135EC(v47, 1);
        swift_bridgeObjectRelease_n();
        sub_1000135EC(v47, 1);
        sub_1000135EC(v47, 1);
      }
      sub_1000135EC(v47, 1);
    }
    else
    {
      sub_1000135E0(v47, 0);
      sub_1000135E0(v47, 0);
      swift_bridgeObjectRetain();
      id v55 = [v47 stringValue];
      uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v58 = v57;

      BOOL v59 = v116[4] == v56 && v116[5] == v58;
      if (v59 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_10;
      }
      if (v112 == 1) {
        goto LABEL_38;
      }
      BOOL v60 = v116[6] == v56 && v116[7] == v58;
      if (v60 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
LABEL_10:
        swift_bridgeObjectRelease();
        sub_100011918(v120, v45, a1);
        sub_1000135EC(v47, 0);
        sub_1000135EC(v47, 0);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (v112 != 2)
        {
          v61 = v97;
          uint64_t v62 = 2;
          do
          {
            uint64_t v4 = v62 + 1;
            if (__OFADD__(v62, 1)) {
              goto LABEL_76;
            }
            BOOL v63 = *(v61 - 1) == v56 && *v61 == v58;
            if (v63 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              goto LABEL_10;
            }
            v61 += 2;
            ++v62;
          }
          while (v4 != v112);
        }
LABEL_38:
        swift_bridgeObjectRelease();
        sub_1000135EC(v47, 0);
        swift_bridgeObjectRelease();
        sub_1000135EC(v47, 0);
      }
    }
  }
  int64_t v40 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  if (v40 >= v118)
  {
    swift_bridgeObjectRelease();
    swift_release();
    unint64_t v3 = v115;
    goto LABEL_59;
  }
  unint64_t v41 = *(void *)(v117 + 8 * v40);
  ++v10;
  unint64_t v3 = v115;
  if (v41) {
    goto LABEL_26;
  }
  int64_t v10 = v40 + 1;
  if (v40 + 1 >= v118) {
    goto LABEL_58;
  }
  unint64_t v41 = *(void *)(v117 + 8 * v10);
  if (v41) {
    goto LABEL_26;
  }
  int64_t v10 = v40 + 2;
  if (v40 + 2 >= v118) {
    goto LABEL_58;
  }
  unint64_t v41 = *(void *)(v117 + 8 * v10);
  if (v41)
  {
LABEL_26:
    unint64_t v3 = (v41 - 1) & v41;
    unint64_t v39 = __clz(__rbit64(v41)) + (v10 << 6);
    goto LABEL_27;
  }
  int64_t v42 = v40 + 3;
  if (v42 < v118)
  {
    unint64_t v41 = *(void *)(v117 + 8 * v42);
    if (!v41)
    {
      while (1)
      {
        int64_t v10 = v42 + 1;
        if (__OFADD__(v42, 1)) {
          goto LABEL_75;
        }
        if (v10 >= v118) {
          goto LABEL_58;
        }
        unint64_t v41 = *(void *)(v117 + 8 * v10);
        ++v42;
        if (v41) {
          goto LABEL_26;
        }
      }
    }
    int64_t v10 = v42;
    goto LABEL_26;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  swift_release();
LABEL_59:
  uint64_t v64 = self;
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v66 = [v64 uuidsFromLocalIdentifiers:isa];

  id v25 = v99;
  if (v66)
  {
    uint64_t v67 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    sub_100006DD4(0, &qword_10001D028);
    sub_100005A74(&qword_10001D030);
    uint64_t v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_1000150E0;
    *(void *)(v68 + 56) = sub_100005A74(&qword_10001D038);
    *(void *)(v68 + 64) = sub_1000135F8();
    *(void *)(v68 + 32) = v67;
    v69 = NSPredicate.init(format:_:)();
    [v25 setInternalInclusionPredicate:v69];
  }
  else
  {
    if (qword_10001C900 != -1) {
      swift_once();
    }
    uint64_t v70 = type metadata accessor for Logger();
    sub_100006580(v70, (uint64_t)qword_10001DA20);
    v69 = Logger.logObject.getter();
    os_log_type_t v71 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v69, v71))
    {
      v72 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v72 = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, v71, "Unable to get UUIDs from shared album local identifiers.", v72, 2u);
      swift_slowDealloc();
    }
  }
  swift_release();

LABEL_66:
  id v26 = v102;
LABEL_67:
  sub_100005A74(&qword_10001D018);
  v73 = v26;
  uint64_t v74 = swift_allocObject();
  *(_OWORD *)(v74 + 16) = xmmword_1000150F0;
  id v75 = objc_allocWithZone((Class)NSSortDescriptor);
  NSString v76 = String._bridgeToObjectiveC()();
  id v77 = [v75 initWithKey:v76 ascending:1];

  *(void *)(v74 + 32) = v77;
  v120[0] = v74;
  specialized Array._endMutation()();
  sub_100006DD4(0, &qword_10001D020);
  Class v78 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v25 setSortDescriptors:v78];

  v79 = self;
  id v80 = v25;
  id v81 = [v79 fetchAssetsWithOptions:v80];

  v82 = OSSignposter.logHandle.getter();
  v83 = v109;
  OSSignpostIntervalState.signpostID.getter();
  os_signpost_type_t v84 = static os_signpost_type_t.end.getter();
  if (OS_os_log.signpostsEnabled.getter())
  {
    swift_retain();
    checkForErrorAndConsumeState(state:)();
    swift_release();
    uint64_t v85 = v105;
    uint64_t v86 = v106;
    if ((*(unsigned int (**)(unint64_t, uint64_t))(v105 + 88))(v3, v106) == enum case for OSSignpostError.doubleEnd(_:))
    {
      v87 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(unint64_t, uint64_t))(v85 + 8))(v3, v86);
      v87 = "";
    }
    v88 = v110;
    uint64_t v89 = v111;
    v90 = v109;
    v104(v110, v109, v111);
    v91 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v91 = 0;
    os_signpost_id_t v92 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v82, v84, v92, "makePhotoCollection", v87, v91, 2u);
    swift_slowDealloc();

    v93 = v88;
    v94 = v107;
    v107(v90, v89);
    v94(v93, v89);
  }
  else
  {

    v107(v83, v111);
  }
  swift_release();
  return v81;
}

void sub_1000132D4()
{
  id v0 = [self sharedInstance];
  id v11 = 0;
  unsigned int v1 = [v0 setCategory:AVAudioSessionCategoryPlayback mode:AVAudioSessionModeDefault options:0 error:&v11];

  id v2 = v11;
  if (v1)
  {
    id v3 = v2;
  }
  else
  {
    id v4 = v11;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_10001C900 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_100006580(v5, (uint64_t)qword_10001DA20);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 138412290;
      swift_errorRetain();
      int64_t v10 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v11 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v9 = v10;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error setting AVAudioSession playback category. Error: %@.", v8, 0xCu);
      sub_100005A74(&qword_10001CBC0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
}

uint64_t sub_100013588()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000135C0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001023C(a1, a2, a3, v3);
}

uint64_t sub_1000135C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000135D8()
{
  return swift_release();
}

id sub_1000135E0(void *a1, char a2)
{
  if (a2) {
    return (id)swift_errorRetain();
  }
  else {
    return a1;
  }
}

void sub_1000135EC(void *a1, char a2)
{
  if (a2) {
    swift_errorRelease();
  }
  else {
}
  }

unint64_t sub_1000135F8()
{
  unint64_t result = qword_10001D040;
  if (!qword_10001D040)
  {
    sub_100005B58(&qword_10001D038);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D040);
  }
  return result;
}

uint64_t sub_100013654(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  v8._uint64_t countAndFlagsBits = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return NSLocalizedString(_:tableName:bundle:value:comment:)(v8, v9, v10, v11, v12)._countAndFlagsBits;
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t type metadata accessor for IndexSet.Index()
{
  return type metadata accessor for IndexSet.Index();
}

uint64_t IndexSet.makeIterator()()
{
  return IndexSet.makeIterator()();
}

uint64_t static IndexSet._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for IndexSet()
{
  return type metadata accessor for IndexSet();
}

uint64_t VideoPlayer<>.init(player:)()
{
  return VideoPlayer<>.init(player:)();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OSSignposter.init(logger:)()
{
  return OSSignposter.init(logger:)();
}

uint64_t OSSignposter.logHandle.getter()
{
  return OSSignposter.logHandle.getter();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t _TupleScene.init(_:)()
{
  return _TupleScene.init(_:)();
}

uint64_t ProgressView<>.init<>()()
{
  return ProgressView<>.init<>()();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t type metadata accessor for GeometryProxy()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t ClarityUIScene.init(content:)()
{
  return ClarityUIScene.init(content:)();
}

uint64_t NavigationLink.init(destination:label:)()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t _UIHostingView.__allocating_init(rootView:)()
{
  return _UIHostingView.__allocating_init(rootView:)();
}

uint64_t dispatch thunk of _UIHostingView.rootView.setter()
{
  return dispatch thunk of _UIHostingView.rootView.setter();
}

uint64_t type metadata accessor for _UIHostingView()
{
  return type metadata accessor for _UIHostingView();
}

uint64_t NavigationStack.init<>(root:)()
{
  return NavigationStack.init<>(root:)();
}

uint64_t static ClarityUIMetrics.titleHorizontalPadding.getter()
{
  return static ClarityUIMetrics.titleHorizontalPadding.getter();
}

uint64_t PlainButtonStyle.init()()
{
  return PlainButtonStyle.init()();
}

uint64_t type metadata accessor for PlainButtonStyle()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t static ScrollAnchorRole.alignment.getter()
{
  return static ScrollAnchorRole.alignment.getter();
}

uint64_t type metadata accessor for ScrollAnchorRole()
{
  return type metadata accessor for ScrollAnchorRole();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t EnvironmentValues.displayScale.getter()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t EnvironmentValues.displayScale.setter()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t EnvironmentValues.tintColor.getter()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t EnvironmentValues.tintColor.setter()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for PinnedScrollableViews()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t static AccessibilityChildBehavior.ignore.getter()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t type metadata accessor for AccessibilityAttachmentModifier()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Axis.Set.vertical.getter()
{
  return static Axis.Set.vertical.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t Edge.Set.init(rawValue:)()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.navigationTitle<A>(_:icon:)()
{
  return View.navigationTitle<A>(_:icon:)();
}

uint64_t View.accessibilityLabel<A>(_:)()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t View.defaultScrollAnchor(_:for:)()
{
  return View.defaultScrollAnchor(_:for:)();
}

uint64_t View.defaultScrollAnchor(_:)()
{
  return View.defaultScrollAnchor(_:)();
}

uint64_t View.accessibilityElement(children:)()
{
  return View.accessibilityElement(children:)();
}

uint64_t View.accessibilityIdentifier(_:)()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t type metadata accessor for GridItem.Size()
{
  return type metadata accessor for GridItem.Size();
}

uint64_t type metadata accessor for GridItem()
{
  return type metadata accessor for GridItem();
}

uint64_t GridItem.init(_:spacing:alignment:)()
{
  return GridItem.init(_:spacing:alignment:)();
}

uint64_t static Alignment.bottom.getter()
{
  return static Alignment.bottom.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)()
{
  return LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)();
}

uint64_t static UnitPoint.top.getter()
{
  return static UnitPoint.top.getter();
}

uint64_t static UnitPoint.bottom.getter()
{
  return static UnitPoint.bottom.getter();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t NSPredicate.init(format:_:)()
{
  return NSPredicate.init(format:_:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t PHPhotoLibrary.cloudIdentifierMappings(forLocalIdentifiers:)()
{
  return PHPhotoLibrary.cloudIdentifierMappings(forLocalIdentifiers:)();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hash(into:)()
{
  return NSObject.hash(into:)();
}

uint64_t PHChange.changeDetails<A>(for:)()
{
  return PHChange.changeDetails<A>(for:)();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}