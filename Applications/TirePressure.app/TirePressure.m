void sub_100004C20()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  Class isa;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  objc_super v59;

  v1 = v0;
  v59.receiver = v0;
  v59.super_class = (Class)type metadata accessor for TirePressureViewController();
  [super viewDidLoad];
  v2 = *(void **)&v0[OBJC_IVAR____TtC12TirePressure26TirePressureViewController_scenePresentationTypeObserver];
  sub_100005808(0, &qword_10001D9A0);
  sub_100005714();
  v3 = v2;
  CAFObserved<>.observable.getter();
  type metadata accessor for ScenePresentationTypeObserver();
  sub_10000577C(&qword_10001D9B0, (void (*)(uint64_t))type metadata accessor for ScenePresentationTypeObserver);
  swift_retain();
  v4 = ObservedObject.init(wrappedValue:)();
  v6 = v5;
  type metadata accessor for CAFCarManagerObservable();
  sub_10000577C(&qword_10001D9B8, (void (*)(uint64_t))&type metadata accessor for CAFCarManagerObservable);
  v7 = ObservedObject.init(wrappedValue:)();
  v9 = v8;
  type metadata accessor for CAUAssetLibraryManager();
  sub_10000577C(&qword_10001D9C0, (void (*)(uint64_t))&type metadata accessor for CAUAssetLibraryManager);
  v56 = v7;
  v57 = ObservedObject.init(wrappedValue:)();
  v58 = v10;
  v11 = objc_allocWithZone((Class)sub_1000057C4(&qword_10001D9C8));
  v12 = (void *)UIHostingController.init(rootView:)();
  v13 = [v12 view:v4, v6, v56, v9, v57, v58];
  if (!v13)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = v13;
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [v12 view];
  if (!v15)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v16 = v15;
  v17 = [self clearColor];
  [v16 setBackgroundColor:v17];

  v18 = [v1 view];
  if (!v18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v19 = v18;
  v20 = [v12 view];
  if (!v20)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v21 = v20;
  [v19 addSubview:v20];

  sub_1000057C4(&qword_10001D9D0);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_100013150;
  v23 = [v12 view];
  if (!v23)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v24 = v23;
  v25 = [v23 topAnchor];

  v26 = [v1 view];
  if (!v26)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v27 = v26;
  v28 = [v26 topAnchor];

  v29 = [v25 constraintEqualToAnchor:v28];
  *(void *)(v22 + 32) = v29;
  v30 = [v12 view];
  if (!v30)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v31 = v30;
  v32 = [v30 bottomAnchor];

  v33 = [v1 view];
  if (!v33)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v34 = v33;
  v35 = [v33 safeAreaLayoutGuide];

  v36 = [v35 bottomAnchor];
  v37 = [v32 constraintEqualToAnchor:v36];

  *(void *)(v22 + 40) = v37;
  v38 = [v12 view];
  if (!v38)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v39 = v38;
  v40 = [v38 leadingAnchor];

  v41 = [v1 view];
  if (!v41)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v42 = v41;
  v43 = [v41 safeAreaLayoutGuide];

  v44 = [v43 leadingAnchor];
  v45 = [v40 constraintEqualToAnchor:v44];

  *(void *)(v22 + 48) = v45;
  v46 = [v12 view];
  if (!v46)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v47 = v46;
  v48 = [v46 trailingAnchor];

  v49 = [v1 view];
  if (v49)
  {
    v50 = v49;
    v51 = self;
    v52 = [v50 safeAreaLayoutGuide];

    v53 = [v52 trailingAnchor];
    v54 = [v48 constraintEqualToAnchor:v53];

    *(void *)(v22 + 56) = v54;
    specialized Array._endMutation()();
    sub_100005808(0, &qword_10001D9D8);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v51 activateConstraints:isa, v22];

    CAFSignpostEmit_Rendered();
    return;
  }
LABEL_25:
  __break(1u);
}

id sub_1000052EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TirePressureViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for TirePressureViewController()
{
  return self;
}

void type metadata accessor for CRSUIHostedAltScreenPresentationType(uint64_t a1)
{
}

BOOL sub_1000053B4(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1000053C8(uint64_t a1, uint64_t a2)
{
  return sub_1000054C0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000053E0()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100005434()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000054A8(uint64_t a1, uint64_t a2)
{
  return sub_1000054C0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000054C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100005504(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_10000557C(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000055FC@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void *sub_100005640@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100005650(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000565C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100005688()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

unint64_t sub_100005714()
{
  unint64_t result = qword_10001D9A8;
  if (!qword_10001D9A8)
  {
    sub_100005808(255, &qword_10001D9A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D9A8);
  }
  return result;
}

uint64_t sub_10000577C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000057C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005808(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

uint64_t sub_100005858@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000058A0(uint64_t a1)
{
  uint64_t v2 = sub_10000577C((unint64_t *)&qword_10001DA00, type metadata accessor for LaunchOptionsKey);
  uint64_t v3 = sub_10000577C(&qword_10001DA08, type metadata accessor for LaunchOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000595C()
{
  return sub_10000577C(&qword_10001D9E8, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_1000059A4()
{
  return sub_10000577C(&qword_10001D9F0, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_1000059EC()
{
  return sub_10000577C(&qword_10001D9F8, type metadata accessor for LaunchOptionsKey);
}

uint64_t initializeBufferWithCopyOfBuffer for TirePressureWidgetView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100005A6C(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100005A78(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100005A98(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 sub_100005AD8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100005AE4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100005B04(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_100005B54(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_100005BD8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TirePressureWindowManager();
  return [super dealloc];
}

uint64_t type metadata accessor for TirePressureWindowManager()
{
  return self;
}

uint64_t sub_100005C40()
{
  id v0 = [self mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (v1)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_1000065C0();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_10001ED10 = result;
  return result;
}

uint64_t sub_100005D08(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005DDC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006560((uint64_t)v12, *a3);
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
      sub_100006560((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006510((uint64_t)v12);
  return v7;
}

uint64_t sub_100005DDC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100005F98(a5, a6);
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

uint64_t sub_100005F98(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006030(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006210(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006210(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006030(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000061A8(v2, 0);
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

void *sub_1000061A8(uint64_t a1, uint64_t a2)
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
  sub_1000057C4(&qword_10001DB80);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006210(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000057C4(&qword_10001DB80);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100006360(uint64_t a1, unint64_t a2)
{
  return sub_100006390(a1, a2, (uint64_t (*)(void))&static os_log_type_t.error.getter);
}

uint64_t sub_100006378(uint64_t a1, unint64_t a2)
{
  return sub_100006390(a1, a2, (uint64_t (*)(void))&static os_log_type_t.info.getter);
}

uint64_t sub_100006390(uint64_t a1, unint64_t a2, uint64_t (*a3)(void))
{
  os_log_type_t v5 = a3();
  if (qword_10001D8B0 != -1) {
    swift_once();
  }
  unint64_t v6 = qword_10001ED10;
  uint64_t result = os_log_type_enabled((os_log_t)qword_10001ED10, v5);
  if (result)
  {
    swift_bridgeObjectRetain_n();
    int64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)int64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_100005D08(a1, a2, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v6, v5, "%s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    return swift_slowDealloc();
  }
  return result;
}

uint64_t sub_100006510(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006560(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1000065C0()
{
  unint64_t result = qword_10001DB88;
  if (!qword_10001DB88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001DB88);
  }
  return result;
}

uint64_t sub_100006600(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (qword_10001D8B0 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_10001ED10;
  uint64_t result = os_log_type_enabled((os_log_t)qword_10001ED10, v8);
  if (result)
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315650;
    swift_bridgeObjectRetain();
    sub_100005D08(a3, a4, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2048;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v11 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_100005D08(a1, a2, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "%s:%ld  %s", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    return swift_slowDealloc();
  }
  return result;
}

uint64_t sub_100006800@<X0>(uint64_t a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v2 = sub_1000057C4(&qword_10001DC60);
  uint64_t v44 = *(void *)(v2 - 8);
  uint64_t v45 = v2;
  __chkstk_darwin();
  v42 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000057C4(&qword_10001DC68);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000057C4(&qword_10001DC70) - 8;
  __chkstk_darwin();
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = static Alignment.center.getter();
  uint64_t v40 = v11;
  sub_100006BC8(v1, (uint64_t)v46);
  long long v39 = v46[0];
  long long v38 = v46[1];
  long long v37 = v46[2];
  long long v36 = v46[3];
  uint64_t v12 = v47;
  char v13 = v48;
  double v14 = sub_10000701C();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  char v21 = static Edge.Set.all.getter();
  char v51 = v13;
  char v50 = 0;
  v46[0] = *(_OWORD *)(v1 + 16);
  id v22 = *((id *)&v46[0] + 1);
  dispatch thunk of CAFCarManagerObservable.$currentCar.getter();
  sub_10000C21C((uint64_t)v46);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(&v10[*(int *)(v8 + 60)], v7, v4);
  uint64_t v23 = v40;
  *(void *)uint64_t v10 = v41;
  *((void *)v10 + 1) = v23;
  long long v24 = v38;
  *((_OWORD *)v10 + 1) = v39;
  *((_OWORD *)v10 + 2) = v24;
  long long v25 = v36;
  *((_OWORD *)v10 + 3) = v37;
  *((_OWORD *)v10 + 4) = v25;
  *((void *)v10 + 10) = v12;
  v10[88] = v51;
  v10[96] = v21;
  *((double *)v10 + 13) = v14;
  *((void *)v10 + 14) = v16;
  *((void *)v10 + 15) = v18;
  *((void *)v10 + 16) = v20;
  v10[136] = v50;
  v26 = (uint64_t (**)(void **))&v10[*(int *)(v8 + 64)];
  *v26 = sub_1000074BC;
  v26[1] = 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  long long v49 = *(_OWORD *)(v1 + 32);
  swift_retain();
  v27 = v42;
  dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter();
  sub_10000C248((uint64_t)&v49);
  uint64_t v28 = v43;
  sub_10000FE00((uint64_t)v10, v43, &qword_10001DC70);
  uint64_t v29 = sub_1000057C4(&qword_10001DC78);
  uint64_t v30 = v28 + *(int *)(v29 + 52);
  uint64_t v31 = v28;
  uint64_t v33 = v44;
  uint64_t v32 = v45;
  (*(void (**)(uint64_t, char *, uint64_t))(v44 + 16))(v30, v27, v45);
  v34 = (uint64_t (**)(uint64_t *))(v31 + *(int *)(v29 + 56));
  *v34 = sub_100007568;
  v34[1] = 0;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v27, v32);
  return sub_10000FE64((uint64_t)v10, &qword_10001DC70);
}

double sub_100006BC8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v24 = *(_OWORD *)(a1 + 16);
  id v4 = *((id *)&v24 + 1);
  uint64_t v5 = (void *)dispatch thunk of CAFCarManagerObservable.currentCar.getter();
  sub_10000C21C((uint64_t)&v24);
  if (v5)
  {
    sub_100005808(0, &qword_10001DCF0);
    sub_10000C530(&qword_10001DCF8, &qword_10001DCF0);
    CAFObserved<>.observable.getter();
    long long v23 = *(_OWORD *)(a1 + 32);
    swift_retain();
    uint64_t v6 = (void *)dispatch thunk of CAUAssetLibraryManager.assetLibrary.getter();
    sub_10000C248((uint64_t)&v23);
    type metadata accessor for CAFCarObservable();
    sub_10000C574(&qword_10001DD00, (void (*)(uint64_t))&type metadata accessor for CAFCarObservable);
    ObservedObject.init(wrappedValue:)();
    uint64_t v8 = v7;
    uint64_t v9 = (void *)CAFCar.dimesionObservable.getter();
    type metadata accessor for CAFDimensionObservable();
    sub_10000C574(&qword_10001DD08, (void (*)(uint64_t))&type metadata accessor for CAFDimensionObservable);
    static ObservableObject.environmentStore.getter();
    id v10 = v6;
    swift_retain();
    id v11 = v9;
    id v12 = v8;
    sub_10000C5BC((uint64_t)sub_100006FE4);
    sub_10000C5BC(0);
    id v16 = v12;
    id v13 = v10;
    swift_retain();
    id v14 = v11;
    sub_10000C5BC((uint64_t)sub_100006FE4);
    sub_10000C5BC(0);
    sub_1000057C4(&qword_10001DCA0);
    sub_1000057C4(&qword_10001DCA8);
    sub_10000C45C(&qword_10001DCB0, &qword_10001DCA0, (void (*)(void))sub_10000C368);
    sub_10000C45C(&qword_10001DCE0, &qword_10001DCA8, (void (*)(void))sub_10000C4DC);
    _ConditionalContent<>.init(storage:)();

    swift_release();
    sub_10000C5CC((uint64_t)sub_100006FE4);
    sub_10000C5CC(0);

    swift_release();
    sub_10000C5CC((uint64_t)sub_100006FE4);
    sub_10000C5CC(0);
  }
  else
  {
    sub_1000057C4(&qword_10001DCA0);
    sub_1000057C4(&qword_10001DCA8);
    sub_10000C45C(&qword_10001DCB0, &qword_10001DCA0, (void (*)(void))sub_10000C368);
    sub_10000C45C(&qword_10001DCE0, &qword_10001DCA8, (void (*)(void))sub_10000C4DC);
    _ConditionalContent<>.init(storage:)();
  }
  double result = *(double *)&v17;
  *(_OWORD *)a2 = v17;
  *(_OWORD *)(a2 + 16) = v18;
  *(_OWORD *)(a2 + 32) = v19;
  *(_OWORD *)(a2 + 48) = v20;
  *(void *)(a2 + 64) = v21;
  *(unsigned char *)(a2 + 72) = v22;
  return result;
}

uint64_t sub_100006FE4()
{
  return sub_100006378(0xD000000000000019, 0x8000000100013E90);
}

uint64_t sub_100007000()
{
  return sub_100006378(0xD000000000000018, 0x8000000100013EB0);
}

double sub_10000701C()
{
  uint64_t v1 = type metadata accessor for CAUWidgetContentMargins();
  uint64_t v25 = *(void *)(v1 - 8);
  uint64_t v26 = v1;
  __chkstk_darwin();
  long long v24 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for CAUResource();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000057C4(&qword_10001DC88);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CAUVehicleLayout();
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  __chkstk_darwin();
  id v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v30 = *v0;
  id v12 = (void *)*((void *)&v30 + 1);
  swift_getKeyPath();
  swift_getKeyPath();
  id v13 = v12;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_10000C21C((uint64_t)&v30);
  double v14 = 0.0;
  if ((void)v29 != 3)
  {
    long long v29 = v0[2];
    swift_retain();
    uint64_t v15 = (void *)dispatch thunk of CAUAssetLibraryManager.assetLibrary.getter();
    sub_10000C248((uint64_t)&v29);
    if (v15)
    {
      (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for CAUResource.vehicleLayout(_:), v3);
      sub_10000C27C();
      dispatch thunk of CAUAssetLibrary.asset<A>(for:)();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

      uint64_t v18 = v27;
      uint64_t v17 = v28;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v8, 1, v28) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v11, v8, v17);
        long long v19 = v24;
        CAUVehicleLayout.widgetContentMargins.getter();
        CAUWidgetContentMargins.top.getter();
        float v21 = v20;
        uint64_t v22 = v26;
        long long v23 = *(void (**)(char *, uint64_t))(v25 + 8);
        v23(v19, v26);
        double v14 = v21;
        CAUVehicleLayout.widgetContentMargins.getter();
        CAUWidgetContentMargins.leading.getter();
        v23(v19, v22);
        CAUVehicleLayout.widgetContentMargins.getter();
        CAUWidgetContentMargins.bottom.getter();
        v23(v19, v22);
        CAUVehicleLayout.widgetContentMargins.getter();
        CAUWidgetContentMargins.trailing.getter();
        v23(v19, v22);
        (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v17);
        return v14;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v8, 1, 1, v28);
    }
    sub_10000FE64((uint64_t)v8, &qword_10001DC88);
  }
  return v14;
}

uint64_t sub_1000074BC(void **a1)
{
  uint64_t v1 = *a1;
  _StringGuts.grow(_:)(51);
  v2._object = (void *)0x8000000100013E50;
  v2._countAndFlagsBits = 0xD000000000000031;
  String.append(_:)(v2);
  id v3 = v1;
  sub_1000057C4(&qword_10001DC80);
  v4._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  sub_100006378(0, 0xE000000000000000);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100007568(uint64_t *a1)
{
  return sub_1000080BC(a1, 28, 0xD000000000000010, 0x8000000100013E30);
}

uint64_t sub_100007590@<X0>(uint64_t a1@<X8>)
{
  return sub_100006800(a1);
}

uint64_t sub_1000075CC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v30 = sub_1000057C4(&qword_10001DD18);
  uint64_t v8 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000057C4(&qword_10001DD20);
  __chkstk_darwin(v11 - 8);
  id v13 = (uint64_t *)((char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_1000057C4(&qword_10001DD28);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t *v13 = static Alignment.center.getter();
  v13[1] = v18;
  uint64_t v19 = sub_1000057C4(&qword_10001DD30);
  sub_100007870(a2, a3, (uint64_t)v13 + *(int *)(v19 + 44));
  float v20 = (uint64_t (*)())swift_allocObject();
  *((void *)v20 + 2) = a1;
  *((void *)v20 + 3) = a2;
  *((void *)v20 + 4) = a3;
  sub_10000FE00((uint64_t)v13, (uint64_t)v17, &qword_10001DD20);
  float v21 = (uint64_t (**)())&v17[*(int *)(v15 + 44)];
  *float v21 = sub_10000C86C;
  v21[1] = v20;
  v21[2] = 0;
  v21[3] = 0;
  id v22 = a3;
  id v23 = a2;
  sub_10000FE64((uint64_t)v13, &qword_10001DD20);
  id v24 = v23;
  dispatch thunk of CAFCarObservable.$tire.getter();

  sub_10000FE00((uint64_t)v17, a4, &qword_10001DD28);
  uint64_t v25 = sub_1000057C4(&qword_10001DD38);
  uint64_t v26 = v30;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a4 + *(int *)(v25 + 52), v10, v30);
  uint64_t v27 = (uint64_t (**)(uint64_t *))(a4 + *(int *)(v25 + 56));
  char *v27 = sub_10000809C;
  v27[1] = 0;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v26);
  return sub_10000FE64((uint64_t)v17, &qword_10001DD28);
}

uint64_t sub_100007870@<X0>(void *a1@<X1>, void *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v54 = a3;
  uint64_t v5 = sub_1000057C4(&qword_10001DD40);
  ((void (*)(void))__chkstk_darwin)();
  v52 = (uint64_t (**)())((char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v45 = type metadata accessor for CarView(0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v47 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000057C4(&qword_10001DD48);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v46 = (uint64_t)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v48 = (uint64_t)&v43 - v11;
  uint64_t v12 = type metadata accessor for CAUResource();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v43 - v17;
  uint64_t v19 = sub_1000057C4(&qword_10001DC88);
  __chkstk_darwin(v19);
  float v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = a1;
  id v53 = (id)CAFCarObservable.observed.getter();

  if (a2)
  {
    uint64_t v50 = v5;
    uint64_t v51 = v8;
    id v23 = *(void (**)(char *, void, uint64_t))(v13 + 104);
    v23(v18, enum case for CAUResource.vehicleLayout(_:), v12);
    sub_10000C27C();
    id v44 = a2;
    dispatch thunk of CAUAssetLibrary.asset<A>(for:)();
    long long v49 = v21;
    uint64_t v26 = *(void (**)(char *, uint64_t))(v13 + 8);
    v26(v18, v12);
    v23(v16, enum case for CAUResource.topDownExterior(_:), v12);
    id v27 = v44;
    uint64_t v29 = (void *)CAUAssetLibrary.asset(for:)();
    v26(v16, v12);
    uint64_t v30 = v45;
    uint64_t v31 = v47;
    float v21 = v49;
    sub_10000FE00((uint64_t)v49, (uint64_t)&v47[*(int *)(v45 + 28)], &qword_10001DC88);
    uint64_t v32 = (char *)v31 + *(int *)(v30 + 32);
    char v55 = 0;
    id v33 = v53;
    id v34 = v29;
    id v53 = v34;
    State.init(wrappedValue:)();
    uint64_t v35 = v57;
    *uint64_t v32 = v56;
    *((void *)v32 + 1) = v35;
    *uint64_t v31 = v33;
    type metadata accessor for CarPressureResetMonitor();
    uint64_t v36 = swift_allocObject();
    id v37 = v33;
    sub_100008194(v37);
    v31[1] = v36;
    v31[2] = v34;
    uint64_t v38 = v46;
    sub_10000D8F8((uint64_t)v31, v46, type metadata accessor for CarView);
    long long v39 = (uint64_t (**)())(v38 + *(int *)(v51 + 36));
    *long long v39 = sub_100007EE0;
    v39[1] = 0;
    v39[2] = 0;
    v39[3] = 0;
    sub_10000D960((uint64_t)v31, type metadata accessor for CarView);
    uint64_t v40 = v38;
    uint64_t v41 = v48;
    sub_10000FD9C(v40, v48, &qword_10001DD48);
    sub_10000FE00(v41, (uint64_t)v52, &qword_10001DD48);
    swift_storeEnumTagMultiPayload();
    sub_1000057C4(&qword_10001DCA8);
    sub_10000C898();
    sub_10000C45C(&qword_10001DCE0, &qword_10001DCA8, (void (*)(void))sub_10000C4DC);
    _ConditionalContent<>.init(storage:)();

    sub_10000FE64(v41, &qword_10001DD48);
  }
  else
  {
    uint64_t v24 = type metadata accessor for CAUVehicleLayout();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v21, 1, 1, v24);
    id v25 = v53;
    uint64_t v28 = v52;
    *v52 = sub_100007EFC;
    v28[1] = 0;
    v28[2] = 0;
    v28[3] = 0;
    swift_storeEnumTagMultiPayload();
    sub_1000057C4(&qword_10001DCA8);
    sub_10000C898();
    sub_10000C45C(&qword_10001DCE0, &qword_10001DCA8, (void (*)(void))sub_10000C4DC);
    _ConditionalContent<>.init(storage:)();
  }
  return sub_10000FE64((uint64_t)v21, &qword_10001DC88);
}

uint64_t sub_100007EE0()
{
  return sub_100006378(0xD000000000000029, 0x8000000100013F10);
}

uint64_t sub_100007EFC()
{
  return sub_100006378(0xD000000000000035, 0x8000000100013F60);
}

uint64_t sub_100007F18(uint64_t a1, void *a2, uint64_t a3)
{
  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease();
  id v5 = a2;
  uint64_t v6 = (void *)dispatch thunk of CAFCarObservable.tire.getter();

  if (v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 544501614;
  }
  if (v6) {
    unint64_t v8 = 0xE000000000000000;
  }
  else {
    unint64_t v8 = 0xE400000000000000;
  }
  unint64_t v9 = v8;
  String.append(_:)(*(Swift::String *)&v7);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 0x6C62616C69617661;
  v10._object = (void *)0xEA00000000002E65;
  String.append(_:)(v10);
  sub_100006378(0xD000000000000012, 0x8000000100013ED0);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(28);
  swift_bridgeObjectRelease();
  if (a3) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = 544501614;
  }
  if (a3) {
    unint64_t v12 = 0xE000000000000000;
  }
  else {
    unint64_t v12 = 0xE400000000000000;
  }
  unint64_t v13 = v12;
  String.append(_:)(*(Swift::String *)&v11);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 0x6C62616C69617661;
  v14._object = (void *)0xEA00000000002E65;
  String.append(_:)(v14);
  sub_100006378(0xD000000000000010, 0x8000000100013EF0);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000809C(uint64_t *a1)
{
  return sub_1000080BC(a1, 30, 0xD000000000000012, 0x8000000100013ED0);
}

uint64_t sub_1000080BC(uint64_t *a1, Swift::Int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6 = *a1;
  _StringGuts.grow(_:)(a2);
  swift_bridgeObjectRelease();
  unint64_t v12 = a4;
  if (v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 544501614;
  }
  if (v6) {
    unint64_t v8 = 0xE000000000000000;
  }
  else {
    unint64_t v8 = 0xE400000000000000;
  }
  unint64_t v9 = v8;
  String.append(_:)(*(Swift::String *)&v7);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 0x6C62616C69617661;
  v10._object = (void *)0xEA00000000002E65;
  String.append(_:)(v10);
  sub_100006378(a3, v12);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100008188@<X0>(uint64_t a1@<X8>)
{
  return sub_1000075CC(*(void *)v1, *(void **)(v1 + 8), *(void **)(v1 + 16), a1);
}

uint64_t sub_100008194(void *a1)
{
  *(void *)(v1 + 16) = a1;
  id v3 = self;
  id v4 = a1;
  id v5 = [v3 defaultCenter];
  if (qword_10001D8E8 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_10001ED58;
  id v7 = [self mainQueue];
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  v12[4] = sub_10000C97C;
  v12[5] = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_1000084A8;
  uint64_t v12[3] = &unk_1000191A0;
  unint64_t v9 = _Block_copy(v12);
  swift_release();
  id v10 = [v5 addObserverForName:v6 object:0 queue:v7 usingBlock:v9];

  _Block_release(v9);
  swift_unknownObjectRelease();

  return v1;
}

uint64_t sub_10000833C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = Notification.userInfo.getter();
    if (v1)
    {
      uint64_t v2 = v1;
      strcpy((char *)&v5, "ClusterEvent");
      BYTE13(v5) = 0;
      HIWORD(v5) = -5120;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v2 + 16) && (unint64_t v3 = sub_1000112A0((uint64_t)v7), (v4 & 1) != 0))
      {
        sub_100006560(*(void *)(v2 + 56) + 32 * v3, (uint64_t)&v5);
      }
      else
      {
        long long v5 = 0u;
        long long v6 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_10000C984((uint64_t)v7);
      if (*((void *)&v6 + 1))
      {
        sub_10000C9D8(&v5, v8);
        sub_100006560((uint64_t)v8, (uint64_t)v7);
        if ((swift_dynamicCast() & 1) != 0 && v5 == 1) {
          sub_100008698();
        }
        swift_release();
        return sub_100006510((uint64_t)v8);
      }
      else
      {
        swift_release();
        return sub_10000FE64((uint64_t)&v5, &qword_10001DD60);
      }
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_1000084A8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  long long v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = *(void (**)(char *))(a1 + 32);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10000859C()
{
  id v1 = [self defaultCenter];
  if (qword_10001D8E8 != -1) {
    swift_once();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 removeObserver:v2];

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for CarPressureResetMonitor()
{
  return self;
}

void sub_100008698()
{
  id v1 = [*(id *)(v0 + 16) tire];
  if (v1)
  {
    NSString v2 = v1;
    id v3 = [v1 tirePressureMonitoringSystem];

    if (v3)
    {
      if ([v3 hasReset])
      {
        sub_100006378(0xD000000000000016, 0x8000000100013D90);
        v5[4] = sub_1000087FC;
        v5[5] = 0;
        v5[0] = _NSConcreteStackBlock;
        v5[1] = 1107296256;
        v5[2] = sub_1000088FC;
        v5[3] = &unk_100019000;
        uint64_t v4 = _Block_copy(v5);
        [v3 resetWithCompletion:v4];
        _Block_release(v4);

        return;
      }
    }
  }

  sub_100006360(0xD000000000000027, 0x8000000100013D60);
}

uint64_t sub_1000087FC(uint64_t a1)
{
  if (a1)
  {
    swift_errorRetain();
    _StringGuts.grow(_:)(44);
    v1._countAndFlagsBits = 0xD00000000000002ALL;
    v1._object = (void *)0x8000000100013E00;
    String.append(_:)(v1);
    sub_1000057C4(&qword_10001DC58);
    _print_unlocked<A, B>(_:_:)();
    sub_100006360(0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    return swift_errorRelease();
  }
  else
  {
    return sub_100006378(0xD000000000000020, 0x8000000100013DD0);
  }
}

void sub_1000088FC(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100008968@<X0>(id *a1@<X1>, uint64_t *a2@<X8>)
{
  GeometryProxy.size.getter();
  UIImage.fit(to:)();
  long long v8 = v13;
  long long v9 = v12;
  uint64_t v4 = v14;
  *a2 = static Alignment.center.getter();
  a2[1] = v5;
  uint64_t v6 = (uint64_t)a2 + *(int *)(sub_1000057C4(&qword_10001DE68) + 44);
  v10[0] = v9;
  v10[1] = v8;
  uint64_t v11 = v4;
  return sub_100008A04(a1, (uint64_t)v10, v6);
}

uint64_t sub_100008A04@<X0>(id *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  CGFloat v6 = *(double *)a2;
  CGFloat v5 = *(double *)(a2 + 8);
  CGFloat v8 = *(double *)(a2 + 16);
  CGFloat v7 = *(double *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  uint64_t v64 = type metadata accessor for RedactedTiresView(0);
  __chkstk_darwin(v64);
  v62 = (CGFloat *)((char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v77 = sub_1000057C4(&qword_10001DE70);
  uint64_t v11 = __chkstk_darwin(v77);
  uint64_t v65 = (uint64_t)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v66 = (uint64_t)&v56 - v13;
  uint64_t v73 = sub_1000057C4(&qword_10001DE78);
  __chkstk_darwin(v73);
  uint64_t v76 = (uint64_t)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = type metadata accessor for CarView(0);
  uint64_t v57 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  uint64_t v58 = v15;
  uint64_t v59 = (uint64_t)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_1000057C4(&qword_10001DE80);
  uint64_t v61 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  v60 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000057C4(&qword_10001DE88);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v72 = (uint64_t)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v75 = (char *)&v56 - v20;
  uint64_t v21 = type metadata accessor for Image.Interpolation();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v56 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for Image.ResizingMode();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v56 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v29 = a1[2];
  Image.init(uiImage:)();
  (*(void (**)(char *, void, uint64_t))(v26 + 104))(v28, enum case for Image.ResizingMode.stretch(_:), v25);
  Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
  (*(void (**)(char *, void, uint64_t))(v22 + 104))(v24, enum case for Image.Interpolation.high(_:), v21);
  uint64_t v30 = Image.interpolation(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  uint64_t v31 = (uint64_t)a1;
  v85.origin.x = v6;
  v85.origin.y = v5;
  v85.size.width = v8;
  v85.size.height = v7;
  CGRectGetWidth(v85);
  v86.origin.x = v6;
  v86.origin.y = v5;
  v86.size.width = v8;
  v86.size.height = v7;
  CGRectGetHeight(v86);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v32 = v79;
  int v71 = v80;
  uint64_t v70 = v81;
  int v69 = v82;
  uint64_t v68 = v83;
  uint64_t v67 = v84;
  id v33 = [*a1 tire];
  if (!v33) {
    goto LABEL_7;
  }
  id v34 = v33;
  uint64_t v56 = v32;
  id v35 = [v33 tirePressures];
  sub_100005808(0, &qword_10001DEC8);
  unint64_t v36 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v36 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v37 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v37 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v37)
  {

    uint64_t v32 = v56;
LABEL_7:
    uint64_t v47 = (uint64_t)a1 + *(int *)(v63 + 28);
    uint64_t v48 = v62;
    sub_10000FE00(v47, (uint64_t)v62 + *(int *)(v64 + 20), &qword_10001DC88);
    *uint64_t v48 = v6;
    v48[1] = v5;
    v48[2] = v8;
    v48[3] = v7;
    uint64_t v49 = v65;
    sub_10000D8F8((uint64_t)v48, v65, type metadata accessor for RedactedTiresView);
    uint64_t v50 = (uint64_t (**)())(v49 + *(int *)(v77 + 36));
    *uint64_t v50 = sub_100009B98;
    v50[1] = 0;
    v50[2] = 0;
    v50[3] = 0;
    sub_10000D960((uint64_t)v48, type metadata accessor for RedactedTiresView);
    uint64_t v51 = v66;
    sub_10000FD9C(v49, v66, &qword_10001DE70);
    sub_10000FE00(v51, v76, &qword_10001DE70);
    swift_storeEnumTagMultiPayload();
    sub_10000FF10(&qword_10001DE90, &qword_10001DE80, (void (*)(void))sub_10000D9C0);
    sub_10000DAC4();
    uint64_t v46 = (uint64_t)v75;
    _ConditionalContent<>.init(storage:)();
    sub_10000FE64(v51, &qword_10001DE70);
    goto LABEL_8;
  }
  id v38 = [v34 tirePressures];
  uint64_t v39 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v78 = v39;
  uint64_t v40 = v59;
  sub_10000D8F8(v31, v59, type metadata accessor for CarView);
  unint64_t v41 = (*(unsigned __int8 *)(v57 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
  v42 = (CGFloat *)swift_allocObject();
  v42[2] = v6;
  v42[3] = v5;
  v42[4] = v8;
  v42[5] = v7;
  *((void *)v42 + 6) = v9;
  sub_10000D7F4(v40, (uint64_t)v42 + v41);
  sub_1000057C4(&qword_10001DED0);
  type metadata accessor for UUID();
  sub_1000057C4(&qword_10001DEA0);
  sub_1000100AC(&qword_10001DED8, &qword_10001DED0);
  sub_10000D9C0();
  sub_10000C530(&qword_10001DEE0, &qword_10001DEC8);
  uint64_t v43 = v60;
  ForEach<>.init(_:content:)();
  uint64_t v44 = v61;
  uint64_t v45 = v74;
  (*(void (**)(uint64_t, char *, uint64_t))(v61 + 16))(v76, v43, v74);
  swift_storeEnumTagMultiPayload();
  sub_10000FF10(&qword_10001DE90, &qword_10001DE80, (void (*)(void))sub_10000D9C0);
  sub_10000DAC4();
  uint64_t v46 = (uint64_t)v75;
  _ConditionalContent<>.init(storage:)();

  (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v45);
  uint64_t v32 = v56;
LABEL_8:
  uint64_t v52 = v72;
  sub_10000FE00(v46, v72, &qword_10001DE88);
  *(void *)a3 = v30;
  *(void *)(a3 + 8) = 0;
  *(_WORD *)(a3 + 16) = 1;
  *(void *)(a3 + 24) = v32;
  *(unsigned char *)(a3 + 32) = v71;
  *(void *)(a3 + 40) = v70;
  *(unsigned char *)(a3 + 48) = v69;
  uint64_t v53 = v67;
  *(void *)(a3 + 56) = v68;
  *(void *)(a3 + 64) = v53;
  uint64_t v54 = sub_1000057C4(&qword_10001DEC0);
  sub_10000FE00(v52, a3 + *(int *)(v54 + 48), &qword_10001DE88);
  swift_retain();
  sub_10000FE64(v46, &qword_10001DE88);
  sub_10000FE64(v52, &qword_10001DE88);
  return swift_release();
}

uint64_t sub_10000946C@<X0>(void **a1@<X0>, double *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v28 = a4;
  double v6 = *a2;
  double v7 = a2[1];
  double v8 = a2[2];
  double v9 = a2[3];
  uint64_t v10 = type metadata accessor for CarView(0);
  uint64_t v11 = v10 - 8;
  uint64_t v27 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v27 + 64);
  __chkstk_darwin(v10);
  uint64_t v13 = sub_1000057C4(&qword_10001DC88);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for TireView(0);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *a1;
  sub_100005808(0, &qword_10001DEC8);
  sub_10000C530(&qword_10001DEE8, &qword_10001DEC8);
  uint64_t v20 = (void *)CAFObserved<>.observable.getter();
  sub_10000FE00(a3 + *(int *)(v11 + 36), (uint64_t)v15, &qword_10001DC88);
  sub_100009728(v20, (uint64_t)v15, (uint64_t)v18, v6, v7, v8, v9);
  sub_10000D8F8(a3, (uint64_t)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for CarView);
  unint64_t v21 = (*(unsigned __int8 *)(v27 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v19;
  sub_10000D7F4((uint64_t)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21);
  uint64_t v23 = v28;
  sub_10000D8F8((uint64_t)v18, v28, type metadata accessor for TireView);
  uint64_t v24 = (void (**)())(v23 + *(int *)(sub_1000057C4(&qword_10001DEA0) + 36));
  *uint64_t v24 = sub_10000DED0;
  v24[1] = (void (*)())v22;
  v24[2] = 0;
  v24[3] = 0;
  id v25 = v19;
  return sub_10000D960((uint64_t)v18, type metadata accessor for TireView);
}

uint64_t sub_100009728@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  type metadata accessor for CAFDimensionObservable();
  sub_10000C574(&qword_10001DD08, (void (*)(uint64_t))&type metadata accessor for CAFDimensionObservable);
  *(void *)(a3 + 16) = EnvironmentObject.init()();
  *(void *)(a3 + 24) = v14;
  type metadata accessor for CAFTirePressureObservable();
  sub_10000C574(&qword_10001DEF8, (void (*)(uint64_t))&type metadata accessor for CAFTirePressureObservable);
  id v15 = a1;
  *(void *)a3 = ObservedObject.init(wrappedValue:)();
  *(void *)(a3 + 8) = v16;
  *(double *)(a3 + 32) = a4;
  *(double *)(a3 + 40) = a5;
  *(double *)(a3 + 48) = a6;
  *(double *)(a3 + 56) = a7;
  uint64_t v17 = type metadata accessor for TireView(0);
  sub_10000FE00(a2, a3 + *(int *)(v17 + 28), &qword_10001DC88);
  unint64_t v18 = 0xE000000000000000;
  _StringGuts.grow(_:)(52);
  v19._object = (void *)0x8000000100013FF0;
  v19._countAndFlagsBits = 0xD000000000000028;
  String.append(_:)(v19);
  uint64_t v20 = type metadata accessor for CAUVehicleLayout();
  int v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(a2, 1, v20);
  BOOL v22 = v21 == 1;
  if (v21 == 1) {
    uint64_t v23 = 544501614;
  }
  else {
    uint64_t v23 = 0;
  }
  if (v22) {
    unint64_t v18 = 0xE400000000000000;
  }
  unint64_t v24 = v18;
  String.append(_:)(*(Swift::String *)&v23);
  swift_bridgeObjectRelease();
  v25._countAndFlagsBits = 0x6C62616C69617661;
  v25._object = (void *)0xEA00000000002E65;
  String.append(_:)(v25);
  sub_100006378(0, 0xE000000000000000);
  swift_bridgeObjectRelease();

  return sub_10000FE64(a2, &qword_10001DC88);
}

void sub_100009948()
{
  uint64_t v0 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = 0;
  unint64_t v6 = 0xE000000000000000;
  _StringGuts.grow(_:)(24);
  v4._object = (void *)0x8000000100013FD0;
  v4._countAndFlagsBits = 0xD000000000000016;
  String.append(_:)(v4);
  sub_100005808(0, &qword_10001DEC8);
  CAFPositionedRequired.layoutKey.getter();
  _print_unlocked<A, B>(_:_:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006600(v5, v6, 2036625250, 0xE400000000000000);
  swift_bridgeObjectRelease();
  sub_100009ABC();
}

void sub_100009ABC()
{
  type metadata accessor for CarView(0);
  sub_1000057C4(&qword_10001DEF0);
  State.wrappedValue.getter();
  if ((v3 & 1) == 0)
  {
    id v1 = [*v0 tire];
    if (v1)
    {
      uint64_t v2 = v1;
      if ([v1 receivedAllValues])
      {
        CAFSignpostEmit_Finalized();
        State.wrappedValue.setter();
      }
    }
  }
}

uint64_t sub_100009B98()
{
  return sub_100006378(0xD000000000000030, 0x8000000100014020);
}

uint64_t sub_100009BB4@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_10000D8F8(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for CarView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_10000D7F4((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_10000D858;
  a2[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v7;
  return result;
}

uint64_t sub_100009CB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = *(id *)(v1 + 8);
  uint64_t v9 = (void *)CAFTirePressureObservable.observed.getter();

  unsigned int v10 = [v9 receivedAllValues];
  if (v10)
  {
    uint64_t v29 = static HorizontalAlignment.center.getter();
    sub_100009FC4();
    uint64_t v30 = a1;
    uint64_t v27 = v5;
    sub_10000A4BC();
    uint64_t v26 = v4;
    uint64_t v28 = static HorizontalAlignment.center.getter();
    sub_10000A6E0((uint64_t)v57);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v11 = v57[1];
    char v12 = v58;
    long long v24 = v59;
    uint64_t v22 = v57[0];
    uint64_t v23 = v60;
    char v13 = v61;
    uint64_t v25 = v62;
    id v14 = v8;
    id v15 = (void *)CAFTirePressureObservable.observed.getter();

    sub_100005808(0, &qword_10001DEC8);
    CAFPositionedRequired.layoutKey.getter();

    a1 = v30;
    uint64_t v16 = type metadata accessor for TireView(0);
    sub_10000F33C((uint64_t)v7, v2 + *(int *)(v16 + 28));
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v26);
    char v38 = 1;
    char v36 = 1;
    char v34 = v12;
    char v32 = v13;
    long long v39 = (unint64_t)v29;
    char v40 = 1;
    *(_DWORD *)unint64_t v41 = *(_DWORD *)v37;
    *(_DWORD *)&v41[3] = *(_DWORD *)&v37[3];
    uint64_t v42 = v28;
    uint64_t v43 = 0;
    char v44 = 1;
    *(_DWORD *)uint64_t v45 = *(_DWORD *)v35;
    *(_DWORD *)&v45[3] = *(_DWORD *)&v35[3];
    uint64_t v46 = v22;
    uint64_t v47 = v11;
    char v48 = v12;
    *(_DWORD *)uint64_t v49 = *(_DWORD *)v33;
    *(_DWORD *)&v49[3] = *(_DWORD *)&v33[3];
    long long v50 = v24;
    uint64_t v51 = v23;
    char v52 = v13;
    *(_DWORD *)uint64_t v53 = *(_DWORD *)v31;
    *(_DWORD *)&v53[3] = *(_DWORD *)&v31[3];
    uint64_t v54 = v25;
    uint64_t v55 = v18;
    uint64_t v56 = v20;
    nullsub_1(&v39);
  }
  else
  {
    sub_10000F324(&v39);
  }
  sub_10000FD9C((uint64_t)&v39, (uint64_t)v57, &qword_10001E038);
  return sub_10000FD9C((uint64_t)v57, a1, &qword_10001E038);
}

uint64_t sub_100009FC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000057C4(&qword_10001E058);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)&v34 - v7;
  id v9 = *(id *)(v0 + 8);
  unsigned int v10 = (void *)CAFTirePressureObservable.observed.getter();

  unsigned int v11 = [v10 receivedAllValues];
  if (!v11
    || ((id v12 = v9,
         unsigned __int8 v13 = dispatch thunk of CAFTirePressureObservable.sensorState.getter(),
         v12,
         v13 - 2 >= 3)
      ? (BOOL v14 = v13 == 0)
      : (BOOL v14 = 1),
        v14))
  {
LABEL_7:
    if (qword_10001D8C0 != -1) {
      swift_once();
    }
    id v15 = *(void **)(v1 + 16);
    if (v15)
    {
      uint64_t v16 = qword_10001ED28;
      swift_bridgeObjectRetain();
      id v17 = v15;
      uint64_t v18 = (void *)dispatch thunk of CAFDimensionObservable.tirePressureUnit.getter();

      id v19 = [v18 symbol];
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      return v16;
    }
    type metadata accessor for CAFDimensionObservable();
    sub_10000C574(&qword_10001DD08, (void (*)(uint64_t))&type metadata accessor for CAFDimensionObservable);
    swift_bridgeObjectRetain();
    EnvironmentObject.error()();
    __break(1u);
    goto LABEL_21;
  }
  if (v13 != 1)
  {
LABEL_21:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_22;
  }
  id v21 = v12;
  dispatch thunk of CAFTirePressureObservable.pressure.getter();

  uint64_t v22 = *(void **)(v1 + 16);
  if (v22)
  {
    id v23 = v22;
    Measurement<>.toTirePressureUnit(using:)();

    long long v24 = *(void (**)(char *, uint64_t))(v3 + 8);
    v24(v6, v2);
    id v25 = [objc_allocWithZone((Class)NSNumberFormatter) init];
    sub_100005808(0, &qword_10001E060);
    uint64_t v26 = (void *)Measurement.unit.getter();
    id v27 = [self poundsForcePerSquareInch];
    char v28 = static NSObject.== infix(_:_:)();

    if (v28)
    {
      [v25 setMaximumFractionDigits:0];
      [v25 setRoundingMode:6];
    }
    else
    {
      [v25 setMaximumFractionDigits:2];
    }
    Measurement.value.getter();
    id v30 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v29];
    id v31 = [v25 stringFromNumber:v30];

    if (v31)
    {
      uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();

      char v32 = (void *)Measurement.unit.getter();
      id v33 = [v32 symbol];

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      v24(v8, v2);
      return v16;
    }

    v24(v8, v2);
    goto LABEL_7;
  }
LABEL_22:
  type metadata accessor for CAFDimensionObservable();
  sub_10000C574(&qword_10001DD08, (void (*)(uint64_t))&type metadata accessor for CAFDimensionObservable);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_10000A4BC()
{
  id v1 = *(id *)(v0 + 8);
  uint64_t v2 = (void *)CAFTirePressureObservable.observed.getter();

  unsigned int v3 = [v2 receivedAllValues];
  if (!v3
    || ((id v4 = v1,
         unsigned __int8 v5 = dispatch thunk of CAFTirePressureObservable.sensorState.getter(),
         v4,
         v5 - 2 >= 3)
      ? (BOOL v6 = v5 == 0)
      : (BOOL v6 = 1),
        v6))
  {
    if (qword_10001D8C8 != -1) {
      swift_once();
    }
    uint64_t v7 = qword_10001ED38;
    uint64_t v8 = qword_10001D8D0;
    swift_retain();
    if (v8 != -1) {
      swift_once();
    }
    swift_retain();
    return v7;
  }
  if (v5 == 1)
  {
    id v10 = v4;
    unsigned __int8 v11 = dispatch thunk of CAFTirePressureObservable.pressureState.getter();

    if (v11 <= 5u)
    {
      if (((1 << v11) & 5) != 0)
      {
        uint64_t v7 = static Color.primary.getter();
        static Color.secondary.getter();
      }
      else if (((1 << v11) & 0xA) != 0)
      {
        uint64_t v7 = static Color.orange.getter();
        static Color.orange.getter();
      }
      else
      {
        uint64_t v7 = static Color.red.getter();
        static Color.red.getter();
      }
      return v7;
    }
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000A6E0@<X0>(uint64_t a1@<X8>)
{
  sub_10000FD28();
  swift_bridgeObjectRetain();
  uint64_t v1 = Text.init<A>(_:)();
  uint64_t v3 = v2;
  char v5 = v4;
  if (qword_10001D8E0 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v6 = Text.font(_:)();
  uint64_t v8 = v7;
  char v10 = v9;
  swift_release();
  sub_10000FD7C(v1, v3, v5 & 1);
  swift_bridgeObjectRelease();
  uint64_t v11 = Text.foregroundColor(_:)();
  uint64_t v37 = v12;
  uint64_t v38 = v11;
  char v14 = v13;
  uint64_t v39 = v15;
  sub_10000FD7C(v6, v8, v10 & 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v16 = Text.init<A>(_:)();
  uint64_t v18 = v17;
  char v20 = v19;
  if (qword_10001D8D8 != -1) {
    swift_once();
  }
  char v21 = v20 & 1;
  char v22 = v14 & 1;
  swift_retain();
  uint64_t v23 = Text.font(_:)();
  uint64_t v25 = v24;
  char v27 = v26;
  swift_release();
  sub_10000FD7C(v16, v18, v21);
  swift_bridgeObjectRelease();
  uint64_t v28 = Text.foregroundColor(_:)();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  char v34 = v33 & 1;
  sub_10000FD7C(v23, v25, v27 & 1);
  swift_bridgeObjectRelease();
  *(void *)a1 = v38;
  *(void *)(a1 + 8) = v37;
  *(unsigned char *)(a1 + 16) = v22;
  *(void *)(a1 + 24) = v39;
  *(void *)(a1 + 32) = v28;
  *(void *)(a1 + 40) = v30;
  *(unsigned char *)(a1 + 48) = v34;
  *(void *)(a1 + 56) = v32;
  sub_10000FD8C(v38, v37, v22);
  swift_bridgeObjectRetain();
  sub_10000FD8C(v28, v30, v34);
  swift_bridgeObjectRetain();
  sub_10000FD7C(v28, v30, v34);
  swift_bridgeObjectRelease();
  sub_10000FD7C(v38, v37, v22);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000A9C4()
{
  return static View._viewListCount(inputs:)();
}

void sub_10000A9E4()
{
  qword_10001ED18 = 0x2020202020;
  unk_10001ED20 = 0xE500000000000000;
}

void sub_10000AA00()
{
  qword_10001ED28 = 11565;
  qword_10001ED30 = 0xE200000000000000;
}

uint64_t sub_10000AA18()
{
  id v0 = [self quaternaryLabelColor];
  uint64_t result = Color.init(_:)();
  qword_10001ED38 = result;
  return result;
}

uint64_t sub_10000AA58()
{
  uint64_t result = static Color.secondary.getter();
  qword_10001ED40 = result;
  return result;
}

uint64_t sub_10000AA78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v39 = sub_1000057C4(&qword_10001DD80);
  uint64_t v38 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v37 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000057C4(&qword_10001DD88);
  __chkstk_darwin(v2 - 8);
  char v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = type metadata accessor for Image.Interpolation();
  uint64_t v5 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Image.ResizingMode();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_1000057C4(&qword_10001DD90);
  __chkstk_darwin(v36);
  char v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000057C4(&qword_10001DD98);
  uint64_t v40 = *(void *)(v14 - 8);
  uint64_t v41 = v14;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v17 = String._bridgeToObjectiveC()();
  id v18 = [self imageNamed:v17];

  if (v18)
  {
    id v34 = v18;
    Image.init(uiImage:)();
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for Image.ResizingMode.stretch(_:), v8);
    Image.resizable(capInsets:resizingMode:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v19 = v35;
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Image.Interpolation.high(_:), v35);
    uint64_t v20 = Image.interpolation(_:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v19);
    long long v46 = xmmword_100013410;
    long long v47 = xmmword_100013420;
    long long v48 = xmmword_100013430;
    long long v49 = xmmword_100013440;
    long long v50 = xmmword_100013450;
    char v21 = v37;
    View._colorMatrix(_:)();
    uint64_t v22 = v38;
    uint64_t v23 = v39;
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v4, v21, v39);
    uint64_t v24 = &v4[*(int *)(sub_1000057C4(&qword_10001DDA0) + 36)];
    *(void *)uint64_t v24 = 0x403E000000000000;
    v24[8] = 0;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v21, v23);
    sub_10000FE00((uint64_t)v4, (uint64_t)&v13[*(int *)(v36 + 36)], &qword_10001DD88);
    *(void *)char v13 = v20;
    *((void *)v13 + 1) = 0;
    *((_WORD *)v13 + 8) = 1;
    sub_10000FE64((uint64_t)v4, &qword_10001DD88);
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    sub_10000FE00((uint64_t)v13, (uint64_t)v16, &qword_10001DD90);

    uint64_t v25 = v41;
    char v26 = &v16[*(int *)(v41 + 36)];
    long long v27 = v44;
    *(_OWORD *)char v26 = v43;
    *((_OWORD *)v26 + 1) = v27;
    *((_OWORD *)v26 + 2) = v45;
    sub_10000FE64((uint64_t)v13, &qword_10001DD90);
    uint64_t v28 = v42;
    sub_10000FD9C((uint64_t)v16, v42, &qword_10001DD98);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v28, 0, 1, v25);
  }
  else
  {
    uint64_t v30 = v41;
    uint64_t v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 56);
    uint64_t v32 = v42;
    return v31(v32, 1, 1, v30);
  }
}

__n128 sub_10000B074@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  sub_10000FE00(v13, a9, &qword_10001DD68);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_1000057C4(&qword_10001DD78) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_10000B234@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000057C4(&qword_10001DD68);
  __chkstk_darwin(v2 - 8);
  char v4 = (uint64_t *)((char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  *char v4 = static Alignment.center.getter();
  v4[1] = v5;
  uint64_t v6 = sub_1000057C4(&qword_10001DD70);
  sub_10000AA78((uint64_t)v4 + *(int *)(v6 + 44));
  static Alignment.center.getter();
  sub_10000B074(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, INFINITY, 0);
  return sub_10000FE64((uint64_t)v4, &qword_10001DD68);
}

uint64_t sub_10000B32C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v77 = a2;
  uint64_t v3 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000057C4(&qword_10001E070);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000057C4(&qword_10001E078) - 8;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v76 = (uint64_t)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v75 = (uint64_t)&v68 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v74 = (uint64_t)&v68 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v84 = (uint64_t)&v68 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v73 = (uint64_t)&v68 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v82 = (uint64_t)&v68 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v68 - v24;
  __chkstk_darwin(v23);
  uint64_t v83 = (uint64_t)&v68 - v26;
  *(void *)uint64_t v9 = static HorizontalAlignment.center.getter();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v79 = sub_1000057C4(&qword_10001E080);
  sub_10000B9E0((uint64_t *)&v9[*(int *)(v79 + 44)]);
  long long v27 = *(void (**)(char *, void, uint64_t))(v4 + 104);
  v27(v6, enum case for CAUVehicleLayoutKey.tire_front_left(_:), v3);
  uint64_t v70 = v4 + 104;
  unsigned __int8 v80 = v27;
  uint64_t v78 = a1 + *(int *)(type metadata accessor for RedactedTiresView(0) + 20);
  sub_10000F33C((uint64_t)v6, v78);
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  long long v32 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v71 = v4 + 8;
  uint64_t v72 = v32;
  v32(v6, v3);
  sub_10000FE00((uint64_t)v9, (uint64_t)v25, &qword_10001E070);
  uint64_t v33 = v10;
  uint64_t v69 = v10;
  id v34 = &v25[*(int *)(v10 + 44)];
  uint64_t v81 = v25;
  *(void *)id v34 = v29;
  *((void *)v34 + 1) = v31;
  sub_10000FE64((uint64_t)v9, &qword_10001E070);
  sub_10000FD9C((uint64_t)v25, v83, &qword_10001E078);
  *(void *)uint64_t v9 = static HorizontalAlignment.center.getter();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v35 = v79;
  sub_10000B9E0((uint64_t *)&v9[*(int *)(v79 + 44)]);
  uint64_t v68 = v3;
  v27(v6, enum case for CAUVehicleLayoutKey.tire_front_right(_:), v3);
  uint64_t v36 = v78;
  sub_10000F33C((uint64_t)v6, v78);
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v41 = v3;
  uint64_t v42 = v72;
  v72(v6, v41);
  uint64_t v43 = v82;
  sub_10000FE00((uint64_t)v9, v82, &qword_10001E070);
  long long v44 = (void *)(v43 + *(int *)(v33 + 44));
  *long long v44 = v38;
  v44[1] = v40;
  sub_10000FE64((uint64_t)v9, &qword_10001E070);
  sub_10000FD9C(v43, (uint64_t)v81, &qword_10001E078);
  *(void *)uint64_t v9 = static HorizontalAlignment.center.getter();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  sub_10000B9E0((uint64_t *)&v9[*(int *)(v35 + 44)]);
  uint64_t v45 = v68;
  v80(v6, enum case for CAUVehicleLayoutKey.tire_rear_left(_:), v68);
  sub_10000F33C((uint64_t)v6, v36);
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  v42(v6, v45);
  uint64_t v50 = v73;
  sub_10000FE00((uint64_t)v9, v73, &qword_10001E070);
  uint64_t v51 = v69;
  char v52 = (void *)(v50 + *(int *)(v69 + 44));
  *char v52 = v47;
  v52[1] = v49;
  sub_10000FE64((uint64_t)v9, &qword_10001E070);
  uint64_t v53 = v82;
  sub_10000FD9C(v50, v82, &qword_10001E078);
  *(void *)uint64_t v9 = static HorizontalAlignment.center.getter();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  sub_10000B9E0((uint64_t *)&v9[*(int *)(v79 + 44)]);
  v80(v6, enum case for CAUVehicleLayoutKey.tire_rear_right(_:), v45);
  sub_10000F33C((uint64_t)v6, v78);
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  v42(v6, v45);
  uint64_t v58 = v84;
  sub_10000FE00((uint64_t)v9, v84, &qword_10001E070);
  long long v59 = (void *)(v58 + *(int *)(v51 + 44));
  *long long v59 = v55;
  v59[1] = v57;
  sub_10000FE64((uint64_t)v9, &qword_10001E070);
  sub_10000FD9C(v58, v50, &qword_10001E078);
  uint64_t v60 = v83;
  sub_10000FE00(v83, v58, &qword_10001E078);
  uint64_t v61 = (uint64_t)v81;
  uint64_t v62 = v74;
  sub_10000FE00((uint64_t)v81, v74, &qword_10001E078);
  uint64_t v63 = v75;
  sub_10000FE00(v53, v75, &qword_10001E078);
  uint64_t v64 = v76;
  sub_10000FE00(v50, v76, &qword_10001E078);
  uint64_t v65 = v77;
  sub_10000FE00(v58, v77, &qword_10001E078);
  uint64_t v66 = (int *)sub_1000057C4(&qword_10001E088);
  sub_10000FE00(v62, v65 + v66[12], &qword_10001E078);
  sub_10000FE00(v63, v65 + v66[16], &qword_10001E078);
  sub_10000FE00(v64, v65 + v66[20], &qword_10001E078);
  sub_10000FE64(v50, &qword_10001E078);
  sub_10000FE64(v53, &qword_10001E078);
  sub_10000FE64(v61, &qword_10001E078);
  sub_10000FE64(v60, &qword_10001E078);
  sub_10000FE64(v64, &qword_10001E078);
  sub_10000FE64(v63, &qword_10001E078);
  sub_10000FE64(v62, &qword_10001E078);
  return sub_10000FE64(v84, &qword_10001E078);
}

uint64_t sub_10000B9E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v65 = a1;
  uint64_t v1 = type metadata accessor for RedactionReasons();
  uint64_t v60 = *(void *)(v1 - 8);
  uint64_t v61 = v1;
  __chkstk_darwin(v1);
  long long v59 = &v54[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_1000057C4(&qword_10001E090);
  uint64_t v63 = *(void *)(v3 - 8);
  uint64_t v64 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v62 = &v54[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v66 = &v54[-v6];
  if (qword_10001D8C0 != -1) {
    swift_once();
  }
  uint64_t v67 = qword_10001ED28;
  uint64_t v68 = qword_10001ED30;
  sub_10000FD28();
  swift_bridgeObjectRetain();
  uint64_t v7 = Text.init<A>(_:)();
  uint64_t v9 = v8;
  char v11 = v10;
  if (qword_10001D8E0 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v12 = Text.font(_:)();
  uint64_t v14 = v13;
  char v16 = v15;
  swift_release();
  sub_10000FD7C(v7, v9, v11 & 1);
  swift_bridgeObjectRelease();
  if (qword_10001D8C8 != -1) {
    swift_once();
  }
  char v17 = v16 & 1;
  uint64_t v18 = Text.foregroundColor(_:)();
  uint64_t v56 = v19;
  uint64_t v57 = v18;
  char v21 = v20;
  uint64_t v58 = v22;
  sub_10000FD7C(v12, v14, v17);
  swift_bridgeObjectRelease();
  if (qword_10001D8B8 != -1) {
    swift_once();
  }
  uint64_t v67 = qword_10001ED18;
  uint64_t v68 = unk_10001ED20;
  swift_bridgeObjectRetain();
  uint64_t v23 = Text.init<A>(_:)();
  uint64_t v25 = v24;
  char v27 = v26;
  if (qword_10001D8D8 != -1) {
    swift_once();
  }
  swift_retain();
  char v28 = v27 & 1;
  uint64_t v29 = Text.font(_:)();
  uint64_t v31 = v30;
  char v33 = v32;
  swift_release();
  sub_10000FD7C(v23, v25, v28);
  swift_bridgeObjectRelease();
  if (qword_10001D8D0 != -1) {
    swift_once();
  }
  char v34 = v33 & 1;
  int v55 = v21 & 1;
  uint64_t v35 = Text.foregroundColor(_:)();
  uint64_t v37 = v36;
  char v39 = v38;
  uint64_t v41 = v40;
  sub_10000FD7C(v29, v31, v34);
  swift_bridgeObjectRelease();
  uint64_t v67 = v35;
  uint64_t v68 = v37;
  char v69 = v39 & 1;
  uint64_t v70 = v41;
  uint64_t v42 = v59;
  static RedactionReasons.placeholder.getter();
  uint64_t v43 = v62;
  View.redacted(reason:)();
  (*(void (**)(unsigned char *, uint64_t))(v60 + 8))(v42, v61);
  sub_10000FD7C(v67, v68, v69);
  swift_bridgeObjectRelease();
  uint64_t v45 = v63;
  uint64_t v44 = v64;
  uint64_t v46 = v66;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v63 + 32))(v66, v43, v64);
  uint64_t v47 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v45 + 16);
  v47(v43, v46, v44);
  uint64_t v48 = v65;
  uint64_t v49 = v56;
  uint64_t v50 = v57;
  *uint64_t v65 = v57;
  v48[1] = v49;
  LOBYTE(v46) = v55;
  *((unsigned char *)v48 + 16) = v55;
  v48[3] = v58;
  uint64_t v51 = sub_1000057C4(&qword_10001E098);
  v47((unsigned char *)v48 + *(int *)(v51 + 48), v43, v44);
  sub_10000FD8C(v50, v49, (char)v46);
  char v52 = *(void (**)(unsigned char *, uint64_t))(v45 + 8);
  swift_bridgeObjectRetain();
  v52(v66, v44);
  v52(v43, v44);
  sub_10000FD7C(v50, v49, (char)v46);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000BF74@<X0>(uint64_t *a1@<X8>)
{
  *a1 = static Alignment.center.getter();
  a1[1] = v3;
  uint64_t v4 = sub_1000057C4(&qword_10001E068);
  return sub_10000B32C(v1, (uint64_t)a1 + *(int *)(v4 + 44));
}

uint64_t sub_10000BFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000BFC8()
{
  return swift_release();
}

uint64_t destroy for TirePressureWidgetView(uint64_t a1)
{
  return swift_release();
}

void *initializeWithCopy for TirePressureWidgetView(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  id v6 = v3;
  id v7 = v4;
  swift_retain();
  return a1;
}

void *assignWithCopy for TirePressureWidgetView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = (void *)a2[1];
  uint64_t v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  a1[2] = a2[2];
  id v7 = (void *)a2[3];
  uint64_t v8 = (void *)a1[3];
  a1[3] = v7;
  id v9 = v7;

  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for TirePressureWidgetView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for TirePressureWidgetView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  uint64_t v5 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v4;

  uint64_t v6 = a2[3];
  id v7 = (void *)a1[3];
  a1[2] = a2[2];
  a1[3] = v6;

  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TirePressureWidgetView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TirePressureWidgetView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TirePressureWidgetView()
{
  return &type metadata for TirePressureWidgetView;
}

uint64_t sub_10000C200(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_10001587C, 1);
}

uint64_t sub_10000C21C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000C248(uint64_t a1)
{
  return a1;
}

unint64_t sub_10000C27C()
{
  unint64_t result = qword_10001DC90;
  if (!qword_10001DC90)
  {
    sub_10000C320(&qword_10001DC88);
    sub_10000C574(&qword_10001DC98, (void (*)(uint64_t))&type metadata accessor for CAUVehicleLayout);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DC90);
  }
  return result;
}

uint64_t sub_10000C320(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000C368()
{
  unint64_t result = qword_10001DCB8;
  if (!qword_10001DCB8)
  {
    sub_10000C320(&qword_10001DCC0);
    sub_10000C408();
    sub_1000100AC(&qword_10001DCD0, &qword_10001DCD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DCB8);
  }
  return result;
}

unint64_t sub_10000C408()
{
  unint64_t result = qword_10001DCC8;
  if (!qword_10001DCC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DCC8);
  }
  return result;
}

uint64_t sub_10000C45C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000C320(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000C4DC()
{
  unint64_t result = qword_10001DCE8;
  if (!qword_10001DCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DCE8);
  }
  return result;
}

uint64_t sub_10000C530(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005808(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000C574(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000C5BC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000C5CC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

ValueMetadata *type metadata accessor for RedactedCarView()
{
  return &type metadata for RedactedCarView;
}

void *initializeBufferWithCopyOfBuffer for CarObservingView(void *a1, void *a2)
{
  long long v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  a1[2] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for CarObservingView(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
}

void *assignWithCopy for CarObservingView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = (void *)a2[1];
  id v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  id v7 = (void *)a1[2];
  uint64_t v8 = (void *)a2[2];
  a1[2] = v8;
  id v9 = v8;

  return a1;
}

__n128 initializeWithTake for CarObservingView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CarObservingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;

  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for CarObservingView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarObservingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarObservingView()
{
  return &type metadata for CarObservingView;
}

uint64_t sub_10000C7B8()
{
  return sub_1000100AC(&qword_10001DD10, &qword_10001DC78);
}

uint64_t sub_10000C7F4(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_1000158F4, 1);
}

uint64_t sub_10000C810(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_1000158CC, 1);
}

uint64_t sub_10000C82C()
{
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000C86C()
{
  return sub_100007F18(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t type metadata accessor for CarView(uint64_t a1)
{
  return sub_10000DA8C(a1, (uint64_t *)&unk_10001DE00);
}

unint64_t sub_10000C898()
{
  unint64_t result = qword_10001DD50;
  if (!qword_10001DD50)
  {
    sub_10000C320(&qword_10001DD48);
    sub_10000C574(&qword_10001DD58, (void (*)(uint64_t))type metadata accessor for CarView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DD50);
  }
  return result;
}

uint64_t sub_10000C944()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C97C()
{
  return sub_10000833C();
}

uint64_t sub_10000C984(uint64_t a1)
{
  return a1;
}

_OWORD *sub_10000C9D8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

char *sub_10000C9E8(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    id v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
  }
  else
  {
    id v7 = a1;
    uint64_t v8 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v8;
    uint64_t v9 = *(int *)(a3 + 28);
    __dst = &a1[v9];
    char v10 = (char *)a2 + v9;
    uint64_t v11 = type metadata accessor for CAUVehicleLayout();
    uint64_t v12 = *(void *)(v11 - 8);
    char v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    uint64_t v13 = v4;
    swift_retain();
    uint64_t v14 = v8;
    if (v20(v10, 1, v11))
    {
      uint64_t v15 = sub_1000057C4(&qword_10001DC88);
      memcpy(__dst, v10, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v16 = *(int *)(a3 + 32);
    char v17 = &v7[v16];
    uint64_t v18 = (uint64_t)a2 + v16;
    *char v17 = *(unsigned char *)v18;
    *((void *)v17 + 1) = *(void *)(v18 + 8);
  }
  swift_retain();
  return v7;
}

uint64_t sub_10000CBB0(id *a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for CAUVehicleLayout();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }

  return swift_release();
}

void *sub_10000CC94(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v5;
  id v7 = *(void **)(a2 + 16);
  a1[2] = v7;
  uint64_t v8 = *(int *)(a3 + 28);
  __dst = (char *)a1 + v8;
  uint64_t v9 = (const void *)(a2 + v8);
  uint64_t v10 = type metadata accessor for CAUVehicleLayout();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  id v13 = v6;
  swift_retain();
  id v14 = v7;
  if (v12(v9, 1, v10))
  {
    uint64_t v15 = sub_1000057C4(&qword_10001DC88);
    memcpy(__dst, v9, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v16 = *(int *)(a3 + 32);
  char v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)(a2 + v16);
  *char v17 = *v18;
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_retain();
  return a1;
}

uint64_t sub_10000CE08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  id v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v9 = *(void **)(a2 + 16);
  uint64_t v10 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v9;
  id v11 = v9;

  uint64_t v12 = *(int *)(a3 + 28);
  id v13 = (void *)(a1 + v12);
  id v14 = (void *)(a2 + v12);
  uint64_t v15 = type metadata accessor for CAUVehicleLayout();
  uint64_t v16 = *(void *)(v15 - 8);
  char v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 24))(v13, v14, v15);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v20 = sub_1000057C4(&qword_10001DC88);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_7:
  uint64_t v21 = *(int *)(a3 + 32);
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  *(unsigned char *)uint64_t v22 = *(unsigned char *)v23;
  *(void *)(v22 + 8) = *(void *)(v23 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10000CFF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 28);
  id v7 = (void *)(a1 + v6);
  id v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for CAUVehicleLayout();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_1000057C4(&qword_10001DC88);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_10000D12C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  swift_release();
  id v7 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = a2[2];

  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for CAUVehicleLayout();
  uint64_t v12 = *(void *)(v11 - 8);
  id v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = sub_1000057C4(&qword_10001DC88);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = *(int *)(a3 + 32);
  uint64_t v18 = a1 + v17;
  int v19 = (char *)a2 + v17;
  *(unsigned char *)uint64_t v18 = *v19;
  *(void *)(v18 + 8) = *((void *)v19 + 1);
  swift_release();
  return a1;
}

uint64_t sub_10000D300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000D314);
}

uint64_t sub_10000D314(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1000057C4(&qword_10001DC88);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10000D3C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000D3DC);
}

void *sub_10000D3DC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1000057C4(&qword_10001DC88);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 28);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10000D488()
{
  sub_10000D53C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10000D53C()
{
  if (!qword_10001DE10)
  {
    type metadata accessor for CAUVehicleLayout();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10001DE10);
    }
  }
}

uint64_t sub_10000D594()
{
  return sub_1000100AC(&qword_10001DE50, &qword_10001DD38);
}

unint64_t sub_10000D5D4()
{
  unint64_t result = qword_10001DE58;
  if (!qword_10001DE58)
  {
    sub_10000C320(&qword_10001DD78);
    sub_1000100AC(&qword_10001DE60, &qword_10001DD68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DE58);
  }
  return result;
}

uint64_t sub_10000D674(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_10001596C, 1);
}

uint64_t sub_10000D690()
{
  uint64_t v1 = type metadata accessor for CarView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v6 = type metadata accessor for CAUVehicleLayout();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10000D7F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D858@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for CarView(0) - 8);
  uint64_t v4 = (id *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));

  return sub_100008968(v4, a1);
}

uint64_t type metadata accessor for RedactedTiresView(uint64_t a1)
{
  return sub_10000DA8C(a1, qword_10001DF58);
}

uint64_t sub_10000D8F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000D960(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000D9C0()
{
  unint64_t result = qword_10001DE98;
  if (!qword_10001DE98)
  {
    sub_10000C320(&qword_10001DEA0);
    sub_10000C574(&qword_10001DEA8, (void (*)(uint64_t))type metadata accessor for TireView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DE98);
  }
  return result;
}

uint64_t type metadata accessor for TireView(uint64_t a1)
{
  return sub_10000DA8C(a1, qword_10001DFE8);
}

uint64_t sub_10000DA8C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10000DAC4()
{
  unint64_t result = qword_10001DEB0;
  if (!qword_10001DEB0)
  {
    sub_10000C320(&qword_10001DE70);
    sub_10000C574(&qword_10001DEB8, (void (*)(uint64_t))type metadata accessor for RedactedTiresView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DEB0);
  }
  return result;
}

uint64_t sub_10000DB70()
{
  uint64_t v1 = type metadata accessor for CarView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v6 = type metadata accessor for CAUVehicleLayout();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10000DCD4@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for CarView(0) - 8) + 80);
  uint64_t v6 = *(void *)(v2 + 48);
  long long v7 = *(_OWORD *)(v2 + 32);
  v9[0] = *(_OWORD *)(v2 + 16);
  v9[1] = v7;
  uint64_t v10 = v6;
  return sub_10000946C(a1, (double *)v9, v2 + ((v5 + 56) & ~v5), a2);
}

uint64_t sub_10000DD64()
{
  uint64_t v1 = type metadata accessor for CarView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v6 = type metadata accessor for CAUVehicleLayout();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

void sub_10000DED0()
{
  type metadata accessor for CarView(0);

  sub_100009948();
}

void *sub_10000DF34(_OWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    long long v5 = *((_OWORD *)a2 + 1);
    *a1 = *(_OWORD *)a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = type metadata accessor for CAUVehicleLayout();
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    {
      uint64_t v11 = sub_1000057C4(&qword_10001DC88);
      memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t sub_10000E098(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = type metadata accessor for CAUVehicleLayout();
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v3);
  if (!result)
  {
    long long v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(v2, v3);
  }
  return result;
}

_OWORD *sub_10000E16C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for CAUVehicleLayout();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = sub_1000057C4(&qword_10001DC88);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void *sub_10000E280(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for CAUVehicleLayout();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 1, v7);
  int v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v12 = sub_1000057C4(&qword_10001DC88);
    memcpy(v5, v6, *(void *)(*(void *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

_OWORD *sub_10000E410(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for CAUVehicleLayout();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = sub_1000057C4(&qword_10001DC88);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

_OWORD *sub_10000E524(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for CAUVehicleLayout();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
  int v11 = v10(v6, 1, v8);
  int v12 = v10(v7, 1, v8);
  if (!v11)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 40))(v6, v7, v8);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v13 = sub_1000057C4(&qword_10001DC88);
    memcpy(v6, v7, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  return a1;
}

uint64_t sub_10000E69C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000E6B0);
}

uint64_t sub_10000E6B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = sub_1000057C4(&qword_10001DC88);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);

  return v6(v4, a2, v5);
}

uint64_t sub_10000E724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000E738);
}

uint64_t sub_10000E738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = sub_1000057C4(&qword_10001DC88);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(v5, a2, a2, v6);
}

void sub_10000E7B0()
{
  sub_10000D53C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *sub_10000E848(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v18 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = (void *)a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v7 = (void *)a2[2];
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v6;
    long long v8 = *((_OWORD *)a2 + 3);
    uint64_t v9 = *(int *)(a3 + 28);
    uint64_t v10 = (void *)(a1 + v9);
    int v11 = (char *)a2 + v9;
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 48) = v8;
    uint64_t v12 = type metadata accessor for CAUVehicleLayout();
    uint64_t v13 = *(void *)(v12 - 8);
    int v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48);
    id v15 = v5;
    id v16 = v7;
    if (v14(v11, 1, v12))
    {
      uint64_t v17 = sub_1000057C4(&qword_10001DC88);
      memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
  }
  return v3;
}

uint64_t sub_10000E9D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for CAUVehicleLayout();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_10000EAAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v6 = *(void **)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v5;
  long long v7 = *(_OWORD *)(a2 + 48);
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  uint64_t v11 = type metadata accessor for CAUVehicleLayout();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  id v14 = v4;
  id v15 = v6;
  if (v13(v10, 1, v11))
  {
    uint64_t v16 = sub_1000057C4(&qword_10001DC88);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

void *sub_10000EBE8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (void *)a2[1];
  long long v7 = (void *)a1[1];
  a1[1] = v6;
  id v8 = v6;

  uint64_t v9 = (void *)a1[2];
  uint64_t v10 = (void *)a2[2];
  a1[2] = v10;
  id v11 = v10;

  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  id v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for CAUVehicleLayout();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v20 = sub_1000057C4(&qword_10001DC88);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

_OWORD *sub_10000EDB8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 28);
  long long v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for CAUVehicleLayout();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_1000057C4(&qword_10001DC88);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

uint64_t sub_10000EED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  long long v7 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;

  id v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  long long v9 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v9;
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = type metadata accessor for CAUVehicleLayout();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = sub_1000057C4(&qword_10001DC88);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t sub_10000F07C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000F090);
}

uint64_t sub_10000F090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1000057C4(&qword_10001DC88);
    long long v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10000F144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000F158);
}

uint64_t sub_10000F158(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1000057C4(&qword_10001DC88);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10000F204()
{
  sub_10000D53C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_10000F2B0()
{
  return sub_1000100AC(&qword_10001E028, &qword_10001E030);
}

uint64_t sub_10000F2EC(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_1000159BC, 1);
}

uint64_t sub_10000F308(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100015994, 1);
}

double sub_10000F324(_OWORD *a1)
{
  double result = 0.0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_10000F33C(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = (char *)a2;
  uint64_t v73 = a1;
  uint64_t v71 = type metadata accessor for CAUVehicleLayoutKey.End();
  uint64_t v2 = *(void *)(v71 - 8);
  uint64_t v3 = __chkstk_darwin(v71);
  uint64_t v70 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  char v69 = (char *)&v59 - v5;
  uint64_t v6 = type metadata accessor for CAUVehicleLayoutKey.Side();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v59 - v11;
  uint64_t v13 = sub_1000057C4(&qword_10001E040);
  __chkstk_darwin(v13 - 8);
  uint64_t v65 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = type metadata accessor for CAUBaselineAnchor();
  uint64_t v62 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v61 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000057C4(&qword_10001E048);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = type metadata accessor for CAUVehicleLayoutInfo();
  uint64_t v68 = *(void *)(v66 - 8);
  uint64_t v19 = __chkstk_darwin(v66);
  uint64_t v63 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v67 = (char *)&v59 - v21;
  uint64_t v22 = sub_1000057C4(&qword_10001DC88);
  __chkstk_darwin(v22 - 8);
  uint64_t v24 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for CAUVehicleLayout();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  char v28 = (char *)&v59 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = v29;
  sub_10000FE00((uint64_t)v72, (uint64_t)v24, &qword_10001DC88);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v30) == 1)
  {
    uint64_t v31 = &qword_10001DC88;
    uint64_t v32 = (uint64_t)v24;
LABEL_10:
    sub_10000FE64(v32, v31);
    CAUVehicleLayoutKey.side.getter();
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for CAUVehicleLayoutKey.Side.left(_:), v6);
    static CAUVehicleLayoutKey.Side.== infix(_:_:)();
    uint64_t v41 = *(void (**)(char *, uint64_t))(v7 + 8);
    v41(v10, v6);
    v41(v12, v6);
    uint64_t v42 = v69;
    CAUVehicleLayoutKey.end.getter();
    uint64_t v44 = v70;
    uint64_t v43 = v71;
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v70, enum case for CAUVehicleLayoutKey.End.front(_:), v71);
    static CAUVehicleLayoutKey.End.== infix(_:_:)();
    uint64_t v45 = *(void (**)(char *, uint64_t))(v2 + 8);
    v45(v44, v43);
    return ((uint64_t (*)(char *, uint64_t))v45)(v42, v43);
  }
  uint64_t v59 = v26;
  char v33 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
  uint64_t v60 = v30;
  v33(v28, v24, v30);
  uint64_t v72 = v28;
  uint64_t v34 = CAUVehicleLayout.infos.getter();
  if (*(void *)(v34 + 16))
  {
    unint64_t v35 = sub_1000112E4(v73);
    uint64_t v37 = (uint64_t)v65;
    uint64_t v36 = v66;
    uint64_t v38 = v68;
    if (v39)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v68 + 16))(v18, *(void *)(v34 + 56) + *(void *)(v68 + 72) * v35, v66);
      uint64_t v40 = 0;
    }
    else
    {
      uint64_t v40 = 1;
    }
  }
  else
  {
    uint64_t v40 = 1;
    uint64_t v37 = (uint64_t)v65;
    uint64_t v36 = v66;
    uint64_t v38 = v68;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56))(v18, v40, 1, v36);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v18, 1, v36) == 1)
  {
    (*(void (**)(char *, uint64_t))(v59 + 8))(v72, v60);
    uint64_t v31 = &qword_10001E048;
    uint64_t v32 = (uint64_t)v18;
    goto LABEL_10;
  }
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v67, v18, v36);
  CAUVehicleLayoutInfo.baselineAnchor.getter();
  uint64_t v47 = v62;
  uint64_t v48 = v64;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v37, 1, v64) != 1)
  {
    int v55 = v61;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(v61, v37, v48);
    CAUBaselineAnchor.x.getter();
    uint64_t v56 = v63;
    uint64_t v53 = (uint64_t)v72;
    CAUVehicleLayout.topDownExteriorImage.getter();
    CAUVehicleLayoutInfo.width.getter();
    uint64_t v54 = *(void (**)(char *, uint64_t))(v38 + 8);
    v54(v56, v36);
    CAUBaselineAnchor.y.getter();
    CAUVehicleLayout.topDownExteriorImage.getter();
    CAUVehicleLayoutInfo.height.getter();
    v54(v56, v36);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v55, v64);
    uint64_t v57 = v59;
    uint64_t v51 = v67;
LABEL_18:
    v54(v51, v36);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 8))(v53, v60);
  }
  sub_10000FE64(v37, &qword_10001E040);
  CAUVehicleLayoutKey.side.getter();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for CAUVehicleLayoutKey.Side.left(_:), v6);
  char v49 = static CAUVehicleLayoutKey.Side.== infix(_:_:)();
  uint64_t v50 = *(void (**)(char *, uint64_t))(v7 + 8);
  v50(v10, v6);
  v50(v12, v6);
  if (v49)
  {
    uint64_t v51 = v67;
    CAUVehicleLayoutInfo.x.getter();
    char v52 = v63;
    uint64_t v53 = (uint64_t)v72;
    CAUVehicleLayout.topDownExteriorImage.getter();
    CAUVehicleLayoutInfo.width.getter();
    uint64_t v54 = *(void (**)(char *, uint64_t))(v68 + 8);
    v54(v52, v36);
LABEL_17:
    uint64_t v57 = v59;
    CAUVehicleLayoutInfo.y.getter();
    CAUVehicleLayoutInfo.height.getter();
    CAUVehicleLayout.topDownExteriorImage.getter();
    CAUVehicleLayoutInfo.height.getter();
    v54(v52, v36);
    goto LABEL_18;
  }
  char v52 = v63;
  uint64_t v53 = (uint64_t)v72;
  CAUVehicleLayout.topDownExteriorImage.getter();
  CAUVehicleLayoutInfo.width.getter();
  uint64_t v54 = *(void (**)(char *, uint64_t))(v68 + 8);
  v54(v52, v36);
  uint64_t v51 = v67;
  int v58 = CAUVehicleLayoutInfo.x.getter();
  uint64_t result = CAUVehicleLayoutInfo.width.getter();
  if (!__OFADD__(v58, result))
  {
    CAUVehicleLayout.topDownExteriorImage.getter();
    CAUVehicleLayoutInfo.width.getter();
    v54(v52, v36);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

unint64_t sub_10000FD28()
{
  unint64_t result = qword_10001E050;
  if (!qword_10001E050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E050);
  }
  return result;
}

uint64_t sub_10000FD7C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000FD8C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000FD9C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000057C4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000FE00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000057C4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000FE64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000057C4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000FEC0()
{
  return sub_10000FF10(&qword_10001E0A0, &qword_10001E038, (void (*)(void))sub_10000FF7C);
}

uint64_t sub_10000FF10(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000C320(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000FF7C()
{
  unint64_t result = qword_10001E0A8;
  if (!qword_10001E0A8)
  {
    sub_10000C320(&qword_10001E0B0);
    sub_1000100AC(&qword_10001E0B8, &qword_10001E0C0);
    sub_10001001C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E0A8);
  }
  return result;
}

unint64_t sub_10001001C()
{
  unint64_t result = qword_10001E0C8;
  if (!qword_10001E0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E0C8);
  }
  return result;
}

uint64_t sub_100010070()
{
  return sub_1000100AC(&qword_10001E0D0, &qword_10001E0D8);
}

uint64_t sub_1000100AC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000C320(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100010100(uint64_t a1)
{
  return sub_100010140(a1, (void (*)(uint64_t))&static Font.Weight.regular.getter, &qword_10001ED48);
}

uint64_t sub_100010120(uint64_t a1)
{
  return sub_100010140(a1, (void (*)(uint64_t))&static Font.Weight.bold.getter, &qword_10001ED50);
}

uint64_t sub_100010140(uint64_t a1, void (*a2)(uint64_t), uint64_t *a3)
{
  uint64_t v5 = sub_1000057C4(&qword_10001E0E8);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2(v6);
  uint64_t v9 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = static Font.system(size:weight:design:)();
  uint64_t result = sub_100010544((uint64_t)v8);
  *a3 = v10;
  return result;
}

NSString sub_10001022C()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_10001ED58 = (uint64_t)result;
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for ClusterEventType(unsigned char *result, unsigned char *a2)
{
  *NSString result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ClusterEventType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ClusterEventType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *NSString result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1000103D0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *NSString result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1000103F8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100010400(unsigned char *result, char a2)
{
  *NSString result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ClusterEventType()
{
  return &type metadata for ClusterEventType;
}

unint64_t sub_100010420()
{
  unint64_t result = qword_10001E0E0;
  if (!qword_10001E0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E0E0);
  }
  return result;
}

BOOL sub_100010474(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10001048C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000104D4()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100010500()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_100010544(uint64_t a1)
{
  uint64_t v2 = sub_1000057C4(&qword_10001E0E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_1000105A4()
{
  uint64_t v1 = OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___carManager;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___carManager);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___carManager);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)CAFCarManager) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_100010618()
{
  uint64_t v1 = OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___assetManager;
  if (*(void *)(v0 + OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___assetManager))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___assetManager);
  }
  else
  {
    uint64_t v3 = v0;
    type metadata accessor for CAUAssetLibraryManager();
    swift_allocObject();
    uint64_t v2 = CAUAssetLibraryManager.init()();
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

id sub_100010778()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TirePressureAppDelegate();
  [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for TirePressureAppDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  id v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for TirePressureAppDelegate()
{
  return self;
}

unint64_t sub_1000108A8()
{
  unint64_t result = qword_10001DA00;
  if (!qword_10001DA00)
  {
    type metadata accessor for LaunchOptionsKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DA00);
  }
  return result;
}

uint64_t sub_100010900()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

id sub_100010B10()
{
  return sub_100011000(0, type metadata accessor for ScenePresentationTypeObserver);
}

uint64_t sub_100010B9C()
{
  return type metadata accessor for ScenePresentationTypeObserver();
}

uint64_t type metadata accessor for ScenePresentationTypeObserver()
{
  uint64_t result = qword_10001E220;
  if (!qword_10001E220) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100010BF0()
{
  sub_100010C80();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100010C80()
{
  if (!qword_10001E230)
  {
    type metadata accessor for CRSUIHostedAltScreenPresentationType(255);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10001E230);
    }
  }
}

uint64_t sub_100010CD8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ScenePresentationTypeObserver();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100010D18()
{
  sub_1000120D0();
  uint64_t result = NSString.init(stringLiteral:)();
  qword_10001ED60 = result;
  return result;
}

void sub_100010DF0(void *a1)
{
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    id v4 = (void *)v3;
    id v9 = a1;
    id v5 = [v4 _FBSScene];
    id v6 = [v5 settings];

    self;
    if (swift_dynamicCastObjCClass())
    {

      BOOL v7 = *(void **)(v1 + OBJC_IVAR____TtC12TirePressure25TirePressureSceneDelegate_clusterWindowManager);
      *(void *)(v1 + OBJC_IVAR____TtC12TirePressure25TirePressureSceneDelegate_clusterWindowManager) = 0;

      if (qword_10001D8F0 != -1) {
        swift_once();
      }
      [v4 _unregisterSceneActionsHandlerArray:qword_10001ED60];
      int v8 = v9;
    }
    else
    {

      int v8 = v6;
    }
  }
}

id sub_100010FE8(uint64_t a1)
{
  return sub_100011000(a1, type metadata accessor for TirePressureSceneDelegate);
}

id sub_100011000(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return [super dealloc];
}

uint64_t type metadata accessor for TirePressureSceneDelegate()
{
  return self;
}

unint64_t sub_10001106C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000057C4(&qword_10001E330);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10001200C(v6, (uint64_t)v15);
    unint64_t result = sub_1000112A0((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_10000C9D8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
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

void *sub_1000111A4()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_1000111B0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100011230(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

unint64_t sub_1000112A0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100011368(a1, v4);
}

unint64_t sub_1000112E4(uint64_t a1)
{
  type metadata accessor for CAUVehicleLayoutKey();
  sub_100012118(&qword_10001E360);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_100011430(a1, v2);
}

unint64_t sub_100011368(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100012074(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10000C984((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100011430(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    BOOL v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    long long v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_100012118(&qword_10001E368);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

void sub_1000115DC(void *a1)
{
  id v5 = [a1 settings];
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    if (v6 != [v3 hostedAltScreenPresentationType])
    {
      [v3 hostedAltScreenPresentationType];
      swift_getKeyPath();
      swift_getKeyPath();
      id v4 = v1;
      static Published.subscript.setter();
    }
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
}

void sub_10001171C(void *a1, id a2)
{
  id v5 = [a2 role];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  CAFSignpostEmit_Scene();

  self;
  uint64_t v7 = swift_dynamicCastObjCClass();
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = (void *)v7;
  id v9 = a1;
  id v10 = [a2 role];
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (v11 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v13 == v14)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
    {

LABEL_8:
      sub_100006378(0xD000000000000024, 0x80000001000142A0);
LABEL_19:
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return;
    }
  }
  id v17 = [v8 _FBSScene];
  id v18 = [v17 settings];

  self;
  uint64_t v19 = swift_dynamicCastObjCClass();
  if (!v19)
  {

    sub_100006360(0xD000000000000021, 0x8000000100014300);
    goto LABEL_19;
  }
  uint64_t v20 = (void *)v19;
  id v21 = [self sharedApplication];
  id v22 = [v21 delegate];

  if (!v22)
  {
LABEL_18:
    sub_100006360(0xD000000000000026, 0x8000000100014330);
    goto LABEL_19;
  }
  uint64_t v50 = v18;
  uint64_t v51 = v2;
  type metadata accessor for TirePressureAppDelegate();
  if (!swift_dynamicCastClass())
  {
    swift_unknownObjectRelease();
    goto LABEL_18;
  }
  id v23 = [objc_allocWithZone((Class)type metadata accessor for ScenePresentationTypeObserver()) init];
  id v24 = [v8 _FBSScene];
  [v24 addObserver:v23];

  id v25 = [v20 hostedAltScreenPresentationType];
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v54 = (uint64_t)v25;
  id v26 = v23;
  static Published.subscript.setter();
  id v27 = v9;
  id v28 = v26;
  id v29 = sub_1000105A4();
  uint64_t v30 = sub_100010618();
  uint64_t v31 = (objc_class *)type metadata accessor for TirePressureWindowManager();
  id v32 = objc_allocWithZone(v31);
  id v33 = objc_allocWithZone((Class)UIWindow);
  uint64_t v34 = (char *)v32;
  id v35 = [v33 initWithWindowScene:v8];
  uint64_t v36 = OBJC_IVAR____TtC12TirePressure25TirePressureWindowManager_window;
  *(void *)&v34[OBJC_IVAR____TtC12TirePressure25TirePressureWindowManager_window] = v35;
  [v35 setAutoresizesSubviews:1];
  [*(id *)&v34[v36] setAutoresizingMask:18];
  [*(id *)&v34[v36] makeKeyAndVisible];
  id v37 = *(id *)&v34[v36];
  [v37 setHidden:0];

  v53.receiver = v34;
  v53.super_class = v31;
  uint64_t v38 = (char *)[v53 init];
  char v39 = *(void **)&v38[OBJC_IVAR____TtC12TirePressure25TirePressureWindowManager_window];
  uint64_t v40 = (objc_class *)type metadata accessor for TirePressureViewController();
  uint64_t v41 = (char *)objc_allocWithZone(v40);
  *(void *)&v41[OBJC_IVAR____TtC12TirePressure26TirePressureViewController_carManager] = v29;
  *(void *)&v41[OBJC_IVAR____TtC12TirePressure26TirePressureViewController_assetManager] = v30;
  *(void *)&v41[OBJC_IVAR____TtC12TirePressure26TirePressureViewController_scenePresentationTypeObserver] = v28;
  v52.receiver = v41;
  v52.super_class = v40;
  id v42 = v28;
  uint64_t v43 = v38;
  id v44 = v39;
  id v45 = v29;
  swift_retain();
  id v46 = [super initWithNibName:0 bundle:0];
  [v44 setRootViewController:v46];

  swift_release();
  uint64_t v47 = *(void **)(v51 + OBJC_IVAR____TtC12TirePressure25TirePressureSceneDelegate_clusterWindowManager);
  *(void *)(v51 + OBJC_IVAR____TtC12TirePressure25TirePressureSceneDelegate_clusterWindowManager) = v43;

  sub_1000057C4(&qword_10001D9D0);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_100013820;
  *(void *)(v48 + 32) = [objc_allocWithZone((Class)CRSUIClusterPressBSActionsHandler) initWithDelegate:v51];
  uint64_t v54 = v48;
  specialized Array._endMutation()();
  sub_1000057C4(&qword_10001E350);
  v49.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (qword_10001D8F0 != -1) {
    swift_once();
  }
  [v8 _registerSceneActionsHandlerArray:v49.super.isa forKey:qword_10001ED60];

  swift_unknownObjectRelease();
}

void sub_100011D54(uint64_t a1)
{
  if (a1 == 2)
  {
    sub_100006378(0xD00000000000001CLL, 0x8000000100014250);
    id v1 = [self defaultCenter];
    if (qword_10001D8E8 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_10001ED58;
    sub_1000057C4(&qword_10001E328);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100013830;
    AnyHashable.init<A>(_:)();
    *(void *)(inited + 96) = &type metadata for ClusterEventType;
    *(unsigned char *)(inited + 72) = 1;
    goto LABEL_9;
  }
  if (a1 == 1)
  {
    sub_100006378(0xD00000000000001ELL, 0x8000000100014270);
    id v1 = [self defaultCenter];
    if (qword_10001D8E8 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_10001ED58;
    sub_1000057C4(&qword_10001E328);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100013830;
    AnyHashable.init<A>(_:)();
    *(void *)(inited + 96) = &type metadata for ClusterEventType;
    *(unsigned char *)(inited + 72) = 0;
LABEL_9:
    sub_10001106C(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v1 postNotificationName:v2 object:0 userInfo:isa];

    return;
  }

  sub_100006378(0xD00000000000001FLL, 0x8000000100014230);
}

uint64_t sub_10001200C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000057C4(&qword_10001E338);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012074(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1000120D0()
{
  unint64_t result = qword_10001E340;
  if (!qword_10001E340)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001E340);
  }
  return result;
}

uint64_t sub_100012118(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CAUVehicleLayoutKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001215C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t CAFObserved<>.observable.getter()
{
  return CAFObserved<>.observable.getter();
}

uint64_t dispatch thunk of CAFCarObservable.tire.getter()
{
  return dispatch thunk of CAFCarObservable.tire.getter();
}

uint64_t dispatch thunk of CAFCarObservable.$tire.getter()
{
  return dispatch thunk of CAFCarObservable.$tire.getter();
}

uint64_t CAFCarObservable.observed.getter()
{
  return CAFCarObservable.observed.getter();
}

uint64_t type metadata accessor for CAFCarObservable()
{
  return type metadata accessor for CAFCarObservable();
}

uint64_t dispatch thunk of CAFDimensionObservable.tirePressureUnit.getter()
{
  return dispatch thunk of CAFDimensionObservable.tirePressureUnit.getter();
}

uint64_t type metadata accessor for CAFDimensionObservable()
{
  return type metadata accessor for CAFDimensionObservable();
}

uint64_t dispatch thunk of CAFCarManagerObservable.currentCar.getter()
{
  return dispatch thunk of CAFCarManagerObservable.currentCar.getter();
}

uint64_t dispatch thunk of CAFCarManagerObservable.$currentCar.getter()
{
  return dispatch thunk of CAFCarManagerObservable.$currentCar.getter();
}

uint64_t type metadata accessor for CAFCarManagerObservable()
{
  return type metadata accessor for CAFCarManagerObservable();
}

uint64_t dispatch thunk of CAFTirePressureObservable.sensorState.getter()
{
  return dispatch thunk of CAFTirePressureObservable.sensorState.getter();
}

uint64_t dispatch thunk of CAFTirePressureObservable.pressureState.getter()
{
  return dispatch thunk of CAFTirePressureObservable.pressureState.getter();
}

uint64_t CAFTirePressureObservable.observed.getter()
{
  return CAFTirePressureObservable.observed.getter();
}

uint64_t dispatch thunk of CAFTirePressureObservable.pressure.getter()
{
  return dispatch thunk of CAFTirePressureObservable.pressure.getter();
}

uint64_t type metadata accessor for CAFTirePressureObservable()
{
  return type metadata accessor for CAFTirePressureObservable();
}

uint64_t Measurement<>.toTirePressureUnit(using:)()
{
  return Measurement<>.toTirePressureUnit(using:)();
}

uint64_t Measurement.unit.getter()
{
  return Measurement.unit.getter();
}

uint64_t Measurement.value.getter()
{
  return Measurement.value.getter();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t type metadata accessor for CAUResource()
{
  return type metadata accessor for CAUResource();
}

uint64_t CAUAssetLibrary.asset(for:)()
{
  return CAUAssetLibrary.asset(for:)();
}

uint64_t dispatch thunk of CAUAssetLibrary.asset<A>(for:)()
{
  return dispatch thunk of CAUAssetLibrary.asset<A>(for:)();
}

uint64_t CAUVehicleLayout.topDownExteriorImage.getter()
{
  return CAUVehicleLayout.topDownExteriorImage.getter();
}

uint64_t CAUVehicleLayout.widgetContentMargins.getter()
{
  return CAUVehicleLayout.widgetContentMargins.getter();
}

uint64_t CAUVehicleLayout.infos.getter()
{
  return CAUVehicleLayout.infos.getter();
}

uint64_t type metadata accessor for CAUVehicleLayout()
{
  return type metadata accessor for CAUVehicleLayout();
}

uint64_t CAUBaselineAnchor.x.getter()
{
  return CAUBaselineAnchor.x.getter();
}

uint64_t CAUBaselineAnchor.y.getter()
{
  return CAUBaselineAnchor.y.getter();
}

uint64_t type metadata accessor for CAUBaselineAnchor()
{
  return type metadata accessor for CAUBaselineAnchor();
}

uint64_t static CAUVehicleLayoutKey.End.== infix(_:_:)()
{
  return static CAUVehicleLayoutKey.End.== infix(_:_:)();
}

uint64_t type metadata accessor for CAUVehicleLayoutKey.End()
{
  return type metadata accessor for CAUVehicleLayoutKey.End();
}

uint64_t CAUVehicleLayoutKey.end.getter()
{
  return CAUVehicleLayoutKey.end.getter();
}

uint64_t static CAUVehicleLayoutKey.Side.== infix(_:_:)()
{
  return static CAUVehicleLayoutKey.Side.== infix(_:_:)();
}

uint64_t type metadata accessor for CAUVehicleLayoutKey.Side()
{
  return type metadata accessor for CAUVehicleLayoutKey.Side();
}

uint64_t CAUVehicleLayoutKey.side.getter()
{
  return CAUVehicleLayoutKey.side.getter();
}

uint64_t type metadata accessor for CAUVehicleLayoutKey()
{
  return type metadata accessor for CAUVehicleLayoutKey();
}

uint64_t CAUVehicleLayoutInfo.baselineAnchor.getter()
{
  return CAUVehicleLayoutInfo.baselineAnchor.getter();
}

uint64_t CAUVehicleLayoutInfo.x.getter()
{
  return CAUVehicleLayoutInfo.x.getter();
}

uint64_t CAUVehicleLayoutInfo.y.getter()
{
  return CAUVehicleLayoutInfo.y.getter();
}

uint64_t CAUVehicleLayoutInfo.width.getter()
{
  return CAUVehicleLayoutInfo.width.getter();
}

uint64_t CAUVehicleLayoutInfo.height.getter()
{
  return CAUVehicleLayoutInfo.height.getter();
}

uint64_t type metadata accessor for CAUVehicleLayoutInfo()
{
  return type metadata accessor for CAUVehicleLayoutInfo();
}

uint64_t dispatch thunk of CAUAssetLibraryManager.assetLibrary.getter()
{
  return dispatch thunk of CAUAssetLibraryManager.assetLibrary.getter();
}

uint64_t dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter()
{
  return dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter();
}

uint64_t CAUAssetLibraryManager.init()()
{
  return CAUAssetLibraryManager.init()();
}

uint64_t type metadata accessor for CAUAssetLibraryManager()
{
  return type metadata accessor for CAUAssetLibraryManager();
}

uint64_t CAUWidgetContentMargins.top.getter()
{
  return CAUWidgetContentMargins.top.getter();
}

uint64_t CAUWidgetContentMargins.bottom.getter()
{
  return CAUWidgetContentMargins.bottom.getter();
}

uint64_t CAUWidgetContentMargins.leading.getter()
{
  return CAUWidgetContentMargins.leading.getter();
}

uint64_t CAUWidgetContentMargins.trailing.getter()
{
  return CAUWidgetContentMargins.trailing.getter();
}

uint64_t type metadata accessor for CAUWidgetContentMargins()
{
  return type metadata accessor for CAUWidgetContentMargins();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t static ObservableObject.environmentStore.getter()
{
  return static ObservableObject.environmentStore.getter();
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

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t static RedactionReasons.placeholder.getter()
{
  return static RedactionReasons.placeholder.getter();
}

uint64_t type metadata accessor for RedactionReasons()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t EnvironmentObject.error()()
{
  return EnvironmentObject.error()();
}

uint64_t EnvironmentObject.init()()
{
  return EnvironmentObject.init()();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View._colorMatrix(_:)()
{
  return View._colorMatrix(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.redacted(reason:)()
{
  return View.redacted(reason:)();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.orange.getter()
{
  return static Color.orange.getter();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t static Color.secondary.getter()
{
  return static Color.secondary.getter();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t type metadata accessor for Image.Interpolation()
{
  return type metadata accessor for Image.Interpolation();
}

uint64_t Image.interpolation(_:)()
{
  return Image.interpolation(_:)();
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

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
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

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t CAFPositionedRequired.layoutKey.getter()
{
  return CAFPositionedRequired.layoutKey.getter();
}

uint64_t CAFCar.dimesionObservable.getter()
{
  return CAFCar.dimesionObservable.getter();
}

uint64_t UIImage.fit(to:)()
{
  return UIImage.fit(to:)();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t CAFSignpostEmit_Finalized()
{
  return _CAFSignpostEmit_Finalized();
}

uint64_t CAFSignpostEmit_Launched()
{
  return _CAFSignpostEmit_Launched();
}

uint64_t CAFSignpostEmit_Rendered()
{
  return _CAFSignpostEmit_Rendered();
}

uint64_t CAFSignpostEmit_Scene()
{
  return _CAFSignpostEmit_Scene();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void exit(int a1)
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}