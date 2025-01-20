void sub_100003E10(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t vars8;

  self;
  v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = a1;
    v6 = [v4 _FBSScene];
    v7 = [v6 settings];

    self;
    if (swift_dynamicCastObjCClass())
    {

      v7 = *(id *)(v1 + OBJC_IVAR____TtC8Closures21ClosuresSceneDelegate_windowManager);
      *(void *)(v1 + OBJC_IVAR____TtC8Closures21ClosuresSceneDelegate_windowManager) = 0;
    }
  }
}

id sub_100003FB8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClosuresSceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for ClosuresSceneDelegate()
{
  return self;
}

uint64_t sub_100004020(uint64_t a1, uint64_t a2)
{
  return sub_100004118(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004038()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000408C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100004100(uint64_t a1, uint64_t a2)
{
  return sub_100004118(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004118(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10000415C(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_1000041D4(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100004254@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

BOOL sub_100004298(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unsigned __int8 *sub_1000042AC@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1000042BC(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000042C8()
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

uint64_t sub_100004354@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000439C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000043C8(uint64_t a1)
{
  uint64_t v2 = sub_10000497C((unint64_t *)&qword_100021588);
  uint64_t v3 = sub_10000497C(&qword_100021590);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void sub_100004460(void *a1, id a2)
{
  uint64_t v3 = v2;
  id v6 = [a2 role];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  CAFSignpostEmit_Scene();

  self;
  uint64_t v8 = swift_dynamicCastObjCClass();
  if (!v8) {
    goto LABEL_8;
  }
  v9 = (void *)v8;
  id v10 = a1;
  id v11 = [a2 role];
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {

LABEL_8:
      sub_10000C5B8(0xD000000000000024, 0x8000000100016CD0);
      goto LABEL_17;
    }
  }
  id v18 = [v9 _FBSScene];
  id v19 = [v18 settings];

  self;
  uint64_t v20 = swift_dynamicCastObjCClass();

  if (v20)
  {
    id v21 = [self sharedApplication];
    id v22 = [v21 delegate];

    if (v22)
    {
      type metadata accessor for ClosuresAppDelegate();
      if (swift_dynamicCastClass())
      {
        id v23 = v10;
        id v24 = sub_100004B78();
        uint64_t v25 = sub_100004BEC();
        v26 = (objc_class *)type metadata accessor for ClosuresWindowManager();
        id v27 = objc_allocWithZone(v26);
        id v28 = objc_allocWithZone((Class)UIWindow);
        v29 = (char *)v27;
        id v30 = [v28 initWithWindowScene:v9];
        uint64_t v31 = OBJC_IVAR____TtC8Closures21ClosuresWindowManager_window;
        *(void *)&v29[OBJC_IVAR____TtC8Closures21ClosuresWindowManager_window] = v30;
        [v30 setAutoresizesSubviews:1];
        [*(id *)&v29[v31] setAutoresizingMask:18];
        [*(id *)&v29[v31] makeKeyAndVisible];
        id v32 = *(id *)&v29[v31];
        [v32 setHidden:0];

        v43.receiver = v29;
        v43.super_class = v26;
        v33 = [super init];
        v34 = *(void **)&v33[OBJC_IVAR____TtC8Closures21ClosuresWindowManager_window];
        v35 = (objc_class *)type metadata accessor for ClosuresViewController();
        v36 = (char *)objc_allocWithZone(v35);
        *(void *)&v36[OBJC_IVAR____TtC8Closures22ClosuresViewController_carManager] = v24;
        *(void *)&v36[OBJC_IVAR____TtC8Closures22ClosuresViewController_assetManager] = v25;
        v42.receiver = v36;
        v42.super_class = v35;
        v37 = v33;
        id v38 = v34;
        id v39 = v24;
        swift_retain();
        id v40 = [super initWithNibName:0 bundle:0];
        [v38 setRootViewController:v40];

        swift_release();
        v41 = *(void **)(v3 + OBJC_IVAR____TtC8Closures21ClosuresSceneDelegate_windowManager);
        *(void *)(v3 + OBJC_IVAR____TtC8Closures21ClosuresSceneDelegate_windowManager) = v37;

        swift_unknownObjectRelease();
        return;
      }
      swift_unknownObjectRelease();
    }
    sub_10000C5B8(0xD000000000000026, 0x8000000100016D60);
  }
  else
  {
    sub_10000C5B8(0xD000000000000021, 0x8000000100016D30);
  }
LABEL_17:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

uint64_t sub_100004914()
{
  return sub_10000497C(&qword_100021570);
}

uint64_t sub_100004948()
{
  return sub_10000497C(&qword_100021578);
}

uint64_t sub_10000497C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for LaunchOptionsKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000049C0()
{
  return sub_10000497C(&qword_100021580);
}

void type metadata accessor for CAFSeatBeltIndicator(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for SeatBeltsView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithTake for ClosuresWidgetView(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004A4C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100004A6C(uint64_t result, int a2, int a3)
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

__n128 sub_100004AAC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100004AB8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100004AD8(uint64_t result, int a2, int a3)
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

void sub_100004B28(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_100004B78()
{
  uint64_t v1 = OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___carManager;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___carManager);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___carManager);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)CAFCarManager) init];
    char v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_100004BEC()
{
  uint64_t v1 = OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___assetManager;
  if (*(void *)(v0 + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___assetManager))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___assetManager);
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

id sub_100004D4C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClosuresAppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for ClosuresAppDelegate();
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

uint64_t type metadata accessor for ClosuresAppDelegate()
{
  return self;
}

unint64_t sub_100004E7C()
{
  unint64_t result = qword_100021588;
  if (!qword_100021588)
  {
    type metadata accessor for LaunchOptionsKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021588);
  }
  return result;
}

void sub_100004F30()
{
  uint64_t v1 = v0;
  v54.receiver = v0;
  v54.super_class = (Class)type metadata accessor for ClosuresViewController();
  [super viewDidLoad];
  sub_100005720(0, &qword_100021750);
  sub_10000562C();
  CAFObserved<>.observable.getter();
  type metadata accessor for CAFCarManagerObservable();
  sub_100005694(&qword_100021760, (void (*)(uint64_t))&type metadata accessor for CAFCarManagerObservable);
  swift_retain();
  uint64_t v2 = ObservedObject.init(wrappedValue:)();
  uint64_t v4 = v3;
  type metadata accessor for CAUAssetLibraryManager();
  sub_100005694(&qword_100021768, (void (*)(uint64_t))&type metadata accessor for CAUAssetLibraryManager);
  uint64_t v51 = v2;
  uint64_t v52 = ObservedObject.init(wrappedValue:)();
  uint64_t v53 = v5;
  id v6 = objc_allocWithZone((Class)sub_1000056DC(&qword_100021770));
  NSString v7 = (void *)UIHostingController.init(rootView:)();
  id v8 = [v7 view:v51, v4, v52, v53];
  if (!v8)
  {
    __break(1u);
    goto LABEL_15;
  }
  v9 = v8;
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v10 = [v7 view];
  if (!v10)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  id v11 = v10;
  id v12 = [self clearColor];
  [v11 setBackgroundColor:v12];

  id v13 = [v1 view];
  if (!v13)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v14 = v13;
  id v15 = [v7 view];
  if (!v15)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v16 = v15;
  [v14 addSubview:v15];

  sub_1000056DC(&qword_100021778);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1000189B0;
  id v18 = [v7 view];
  if (!v18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v19 = v18;
  id v20 = [v18 topAnchor];

  id v21 = [v1 view];
  if (!v21)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v22 = v21;
  id v23 = [v21 topAnchor];

  id v24 = [v20 constraintEqualToAnchor:v23];
  *(void *)(v17 + 32) = v24;
  id v25 = [v7 view];
  if (!v25)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v26 = v25;
  id v27 = [v25 bottomAnchor];

  id v28 = [v1 view];
  if (!v28)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v29 = v28;
  id v30 = [v28 safeAreaLayoutGuide];

  id v31 = [v30 bottomAnchor];
  id v32 = [v27 constraintEqualToAnchor:v31];

  *(void *)(v17 + 40) = v32;
  id v33 = [v7 view];
  if (!v33)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v34 = v33;
  id v35 = [v33 leadingAnchor];

  id v36 = [v1 view];
  if (!v36)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v37 = v36;
  id v38 = [v36 safeAreaLayoutGuide];

  id v39 = [v38 leadingAnchor];
  id v40 = [v35 constraintEqualToAnchor:v39];

  *(void *)(v17 + 48) = v40;
  id v41 = [v7 view];
  if (!v41)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  objc_super v42 = v41;
  id v43 = [v41 trailingAnchor];

  id v44 = [v1 view];
  if (v44)
  {
    v45 = v44;
    v46 = self;
    id v47 = [v45 safeAreaLayoutGuide];

    id v48 = [v47 trailingAnchor];
    id v49 = [v43 constraintEqualToAnchor:v48];

    *(void *)(v17 + 56) = v49;
    specialized Array._endMutation()();
    sub_100005720(0, &qword_100021780);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v46 activateConstraints:isa, v17];

    CAFSignpostEmit_Rendered();
    return;
  }
LABEL_25:
  __break(1u);
}

id sub_100005588()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClosuresViewController();
  [super dealloc];
}

uint64_t type metadata accessor for ClosuresViewController()
{
  return self;
}

unint64_t sub_10000562C()
{
  unint64_t result = qword_100021758;
  if (!qword_100021758)
  {
    sub_100005720(255, &qword_100021750);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021758);
  }
  return result;
}

uint64_t sub_100005694(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000056DC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005720(uint64_t a1, unint64_t *a2)
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

id sub_10000578C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClosuresWindowManager();
  return [super dealloc];
}

uint64_t type metadata accessor for ClosuresWindowManager()
{
  return self;
}

uint64_t sub_1000057F4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SeatBeltViewUpdater()
{
  return self;
}

void *sub_100005828()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100005834@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SeatBeltViewUpdater();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100005874@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v45 = sub_1000056DC(&qword_1000218F8);
  uint64_t v37 = *(void *)(v45 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v43 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  objc_super v42 = (char *)&v36 - v6;
  __chkstk_darwin(v5);
  id v41 = (char *)&v36 - v7;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v39 = a1 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & v8;
  int64_t v40 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v44 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v13 = 0;
  uint64_t v14 = (uint64_t)v42;
  id v15 = v43;
  if (!v11) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v46 = (v11 - 1) & v11;
  int64_t v47 = v13;
  for (unint64_t i = __clz(__rbit64(v11)) | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v19 << 6))
  {
    uint64_t v21 = v44;
    uint64_t v22 = *(void *)(v44 + 48);
    uint64_t v23 = type metadata accessor for CAUVehicleLayoutKey();
    uint64_t v24 = *(void *)(v23 - 8);
    uint64_t v25 = v24;
    uint64_t v26 = v22 + *(void *)(v24 + 72) * i;
    id v27 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 16);
    uint64_t v28 = (uint64_t)v41;
    v27(v41, v26, v23);
    v29 = *(void **)(*(void *)(v21 + 56) + 8 * i);
    uint64_t v30 = v45;
    *(void *)(v28 + *(int *)(v45 + 48)) = v29;
    sub_10000B728(v28, v14, &qword_1000218F8);
    uint64_t v31 = *(int *)(v30 + 48);
    v27(v15, v14, v23);
    id v32 = *(void **)(v14 + v31);
    *(void *)&v15[v31] = v32;
    id v33 = v29;
    id v34 = v32;
    LODWORD(v32) = dispatch thunk of CAFSeatBeltObservable.seatBeltIndicator.getter();

    (*(void (**)(char *, uint64_t))(v25 + 8))(v15, v23);
    if (v32)
    {
      swift_release();
      uint64_t v35 = v38;
      sub_10000B728(v14, v38, &qword_1000218F8);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v37 + 56))(v35, 0, 1, v45);
    }
    uint64_t result = sub_10000B78C(v14, &qword_1000218F8);
    int64_t v13 = v47;
    unint64_t v11 = v46;
    if (v46) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v17 >= v40) {
      goto LABEL_25;
    }
    unint64_t v18 = *(void *)(v39 + 8 * v17);
    int64_t v19 = v13 + 1;
    if (!v18)
    {
      int64_t v19 = v13 + 2;
      if (v13 + 2 >= v40) {
        goto LABEL_25;
      }
      unint64_t v18 = *(void *)(v39 + 8 * v19);
      if (!v18)
      {
        int64_t v19 = v13 + 3;
        if (v13 + 3 >= v40) {
          goto LABEL_25;
        }
        unint64_t v18 = *(void *)(v39 + 8 * v19);
        if (!v18)
        {
          int64_t v19 = v13 + 4;
          if (v13 + 4 >= v40) {
            goto LABEL_25;
          }
          unint64_t v18 = *(void *)(v39 + 8 * v19);
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_20:
    uint64_t v46 = (v18 - 1) & v18;
    int64_t v47 = v19;
  }
  uint64_t v20 = v13 + 5;
  if (v13 + 5 >= v40)
  {
LABEL_25:
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 56))(v38, 1, 1, v45);
  }
  unint64_t v18 = *(void *)(v39 + 8 * v20);
  if (v18)
  {
    int64_t v19 = v13 + 5;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v19 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v19 >= v40) {
      goto LABEL_25;
    }
    unint64_t v18 = *(void *)(v39 + 8 * v19);
    ++v20;
    if (v18) {
      goto LABEL_20;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_100005C68(uint64_t a1, uint64_t a2, void *a3)
{
  _StringGuts.grow(_:)(16);
  type metadata accessor for CAUVehicleLayoutKey();
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 0x74616369646E6920;
  v4._object = (void *)0xEC000000203A726FLL;
  String.append(_:)(v4);
  [a3 seatBeltIndicator];
  v5._countAndFlagsBits = CAFSeatBeltIndicator.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  sub_10000C854(0, 0xE000000000000000, 0xD000000000000024, 0x8000000100016FF0);
  swift_bridgeObjectRelease();
  type metadata accessor for SeatBeltViewUpdater();
  sub_10000A7C4(&qword_100021878, (void (*)(uint64_t))type metadata accessor for SeatBeltViewUpdater);
  ObservableObject<>.objectWillChange.getter();
  ObservableObjectPublisher.send()();
  return swift_release();
}

uint64_t sub_100005DC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1000056DC(&qword_1000218E0);
  __chkstk_darwin(v3 - 8);
  v84 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  v87 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  v86 = (char *)&v70 - v10;
  __chkstk_darwin(v9);
  id v12 = (char *)&v70 - v11;
  uint64_t v90 = sub_1000056DC(&qword_1000218E8);
  uint64_t v88 = *(void *)(v90 - 8);
  uint64_t v13 = __chkstk_darwin(v90);
  v83 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  v82 = (char *)&v70 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v81 = (char *)&v70 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v89 = (char *)&v70 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  v91 = (char *)&v70 - v22;
  __chkstk_darwin(v21);
  v92 = (char *)&v70 - v23;
  uint64_t v24 = sub_1000056DC(&qword_1000218F0);
  __chkstk_darwin(v24 - 8);
  uint64_t v26 = (char *)&v70 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = swift_bridgeObjectRetain();
  sub_100005874(v27, (uint64_t)v26);
  swift_bridgeObjectRelease();
  uint64_t v28 = sub_1000056DC(&qword_1000218F8);
  int v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 48))(v26, 1, v28);
  sub_10000B78C((uint64_t)v26, &qword_1000218F0);
  if (v29 == 1)
  {
    uint64_t v30 = sub_1000056DC(&qword_100021900);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(a1, 1, 1, v30);
  }
  else
  {
    uint64_t v71 = a1;
    id v32 = *(void (**)(char *, void, uint64_t))(v6 + 104);
    v70 = v32;
    v74 = v12;
    v32(v12, enum case for CAUVehicleLayoutKey.seat_front_left(_:), v5);
    id v33 = v86;
    v32(v86, enum case for CAUVehicleLayoutKey.seat_front_middle(_:), v5);
    uint64_t v34 = (uint64_t)v87;
    v32(v87, enum case for CAUVehicleLayoutKey.seat_front_right(_:), v5);
    unint64_t v93 = sub_10000683C((uint64_t)v12, v33, v34);
    uint64_t v35 = (_OWORD *)swift_allocObject();
    long long v36 = v1[5];
    v35[5] = v1[4];
    v35[6] = v36;
    v35[7] = v1[6];
    long long v37 = v1[1];
    v35[1] = *v1;
    v35[2] = v37;
    long long v38 = v1[3];
    v35[3] = v1[2];
    v35[4] = v38;
    sub_10000AB38((uint64_t)v1);
    uint64_t v75 = sub_1000056DC(&qword_100021908);
    uint64_t v85 = type metadata accessor for UUID();
    uint64_t v80 = sub_1000056DC(&qword_100021910);
    uint64_t v79 = sub_10000BE10(&qword_100021918, &qword_100021908);
    uint64_t v78 = sub_10000B0BC(&qword_100021920, &qword_100021910, (void (*)(void))sub_10000AB90);
    uint64_t v77 = sub_10000A7C4(&qword_100021990, (void (*)(uint64_t))type metadata accessor for SeatBeltsView.CombinedFrames);
    uint64_t v39 = v91;
    ForEach<>.init(_:content:)();
    int64_t v40 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v72 = v6 + 8;
    uint64_t v41 = (uint64_t)v87;
    v40(v87, v5);
    objc_super v42 = v86;
    v40(v86, v5);
    uint64_t v43 = (uint64_t)v74;
    v40(v74, v5);
    v73 = *(void (**)(char *, char *, uint64_t))(v88 + 32);
    uint64_t v76 = v88 + 32;
    v73(v92, v39, v90);
    uint64_t v44 = v70;
    v70((char *)v43, enum case for CAUVehicleLayoutKey.seat_2ndRow_left(_:), v5);
    v44(v42, enum case for CAUVehicleLayoutKey.seat_2ndRow_middle(_:), v5);
    v44((char *)v41, enum case for CAUVehicleLayoutKey.seat_2ndRow_right(_:), v5);
    uint64_t v45 = v43;
    uint64_t v46 = v41;
    unint64_t v93 = sub_10000683C(v45, v42, v41);
    int64_t v47 = (_OWORD *)swift_allocObject();
    long long v48 = v1[5];
    v47[5] = v1[4];
    v47[6] = v48;
    v47[7] = v1[6];
    long long v49 = v1[1];
    v47[1] = *v1;
    v47[2] = v49;
    long long v50 = v1[3];
    v47[3] = v1[2];
    v47[4] = v50;
    sub_10000AB38((uint64_t)v1);
    uint64_t v51 = v89;
    ForEach<>.init(_:content:)();
    v40((char *)v46, v5);
    uint64_t v52 = v42;
    v40(v42, v5);
    uint64_t v53 = (uint64_t)v74;
    v40(v74, v5);
    objc_super v54 = v51;
    v73(v91, v51, v90);
    v44((char *)v53, enum case for CAUVehicleLayoutKey.seat_3rdRow_left(_:), v5);
    v44(v52, enum case for CAUVehicleLayoutKey.seat_3rdRow_middle(_:), v5);
    v44((char *)v46, enum case for CAUVehicleLayoutKey.seat_3rdRow_right(_:), v5);
    unint64_t v93 = sub_10000683C(v53, v52, v46);
    v55 = (_OWORD *)swift_allocObject();
    long long v56 = v1[5];
    v55[5] = v1[4];
    v55[6] = v56;
    v55[7] = v1[6];
    long long v57 = v1[1];
    v55[1] = *v1;
    v55[2] = v57;
    long long v58 = v1[3];
    v55[3] = v1[2];
    v55[4] = v58;
    sub_10000AB38((uint64_t)v1);
    v59 = v81;
    ForEach<>.init(_:content:)();
    v40((char *)v46, v5);
    v40(v52, v5);
    v40((char *)v53, v5);
    uint64_t v60 = v90;
    v73(v51, v59, v90);
    uint64_t v61 = v88;
    v62 = *(void (**)(char *, char *, uint64_t))(v88 + 16);
    v62(v59, v92, v60);
    v63 = v82;
    v64 = v91;
    v62(v82, v91, v60);
    v65 = v83;
    v62(v83, v54, v60);
    uint64_t v66 = (uint64_t)v84;
    v62(v84, v59, v60);
    uint64_t v67 = sub_1000056DC(&qword_100021998);
    v62((char *)(v66 + *(int *)(v67 + 48)), v63, v60);
    v62((char *)(v66 + *(int *)(v67 + 64)), v65, v60);
    v68 = *(void (**)(char *, uint64_t))(v61 + 8);
    v68(v89, v60);
    v68(v64, v60);
    v68(v92, v60);
    v68(v65, v60);
    v68(v63, v60);
    v68(v59, v60);
    uint64_t v69 = sub_1000056DC(&qword_100021900);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v66, 0, 1, v69);
    return sub_10000B728(v66, v71, &qword_1000218E0);
  }
}

unint64_t sub_10000683C(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v78 = type metadata accessor for SeatBeltsView.CombinedFrames();
  uint64_t v77 = *(void *)(v78 - 8);
  __chkstk_darwin(v78);
  uint64_t v79 = (char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t *)v3[8];
  unint64_t v11 = (unint64_t)&_swiftEmptyArrayStorage;
  if (!v10[2])
  {
    uint64_t v22 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_30;
  }
  uint64_t v3 = (void *)v3[8];
  unint64_t v12 = sub_100012290(a1);
  if ((v13 & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v3 = (void *)v4[7];
  if (!v3[2]) {
    goto LABEL_9;
  }
  uint64_t v14 = (long long *)(v10[7] + 32 * v12);
  long long v15 = *v14;
  long long v84 = v14[1];
  long long v85 = v15;
  unint64_t v16 = sub_100012290(a1);
  if ((v17 & 1) == 0
    || (id v18 = *(id *)(v3[7] + 8 * v16),
        LOBYTE(v3) = dispatch thunk of CAFSeatBeltObservable.seatBeltIndicator.getter(),
        v18,
        !(_BYTE)v3))
  {
LABEL_9:
    uint64_t v22 = (char *)&_swiftEmptyArrayStorage;
    if (v10[2]) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
  uint64_t v19 = sub_100007F78(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  unint64_t v21 = *((void *)v19 + 2);
  unint64_t v20 = *((void *)v19 + 3);
  uint64_t v8 = v19;
  uint64_t v22 = (char *)(v21 + 1);
  if (v21 >= v20 >> 1) {
    goto LABEL_71;
  }
  while (1)
  {
    *((void *)v8 + 2) = v22;
    uint64_t v22 = v8;
    uint64_t v23 = &v8[40 * v21];
    v23[32] = (char)v3;
    *(_OWORD *)(v23 + 40) = v85;
    *(_OWORD *)(v23 + 56) = v84;
    if (v10[2])
    {
LABEL_10:
      LOBYTE(v3) = (_BYTE)v10;
      unint64_t v24 = sub_100012290((uint64_t)a2);
      if (v25)
      {
        uint64_t v3 = (void *)v4[7];
        if (v3[2])
        {
          uint64_t v26 = (long long *)(v10[7] + 32 * v24);
          long long v27 = *v26;
          long long v84 = v26[1];
          long long v85 = v27;
          unint64_t v28 = sub_100012290((uint64_t)a2);
          if (v29)
          {
            id v30 = *(id *)(v3[7] + 8 * v28);
            LOBYTE(v3) = dispatch thunk of CAFSeatBeltObservable.seatBeltIndicator.getter();

            if ((_BYTE)v3)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v22 = sub_100007F78(0, *((void *)v22 + 2) + 1, 1, v22);
              }
              unint64_t v32 = *((void *)v22 + 2);
              unint64_t v31 = *((void *)v22 + 3);
              if (v32 >= v31 >> 1) {
                uint64_t v22 = sub_100007F78((char *)(v31 > 1), v32 + 1, 1, v22);
              }
              *((void *)v22 + 2) = v32 + 1;
              id v33 = &v22[40 * v32];
              v33[32] = (char)v3;
              *(_OWORD *)(v33 + 40) = v85;
              *(_OWORD *)(v33 + 56) = v84;
            }
          }
        }
      }
      if (v10[2])
      {
        LOBYTE(v3) = (_BYTE)v10;
        unint64_t v34 = sub_100012290(a3);
        if (v35)
        {
          uint64_t v3 = (void *)v4[7];
          if (v3[2])
          {
            long long v36 = (long long *)(v10[7] + 32 * v34);
            long long v37 = *v36;
            long long v84 = v36[1];
            long long v85 = v37;
            unint64_t v38 = sub_100012290(a3);
            if (v39)
            {
              id v40 = *(id *)(v3[7] + 8 * v38);
              LOBYTE(v3) = dispatch thunk of CAFSeatBeltObservable.seatBeltIndicator.getter();

              a3 = (uint64_t)v79;
              if (!(_BYTE)v3) {
                goto LABEL_31;
              }
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v22 = sub_100007F78(0, *((void *)v22 + 2) + 1, 1, v22);
              }
              unint64_t v42 = *((void *)v22 + 2);
              unint64_t v41 = *((void *)v22 + 3);
              if (v42 >= v41 >> 1) {
                uint64_t v22 = sub_100007F78((char *)(v41 > 1), v42 + 1, 1, v22);
              }
              *((void *)v22 + 2) = v42 + 1;
              uint64_t v43 = &v22[40 * v42];
              v43[32] = (char)v3;
              *(_OWORD *)(v43 + 40) = v85;
              *(_OWORD *)(v43 + 56) = v84;
            }
          }
        }
      }
    }
LABEL_30:
    a3 = (uint64_t)v79;
LABEL_31:
    *(void *)&long long v84 = *((void *)v22 + 2);
    if (!(void)v84) {
      break;
    }
    unint64_t v21 = 0;
    v82 = v22 + 32;
    uint64_t v4 = &qword_100021A30;
    a2 = (char *)v11;
    uint64_t v10 = &qword_100021A38;
    uint64_t v80 = v22;
    while (1)
    {
      unint64_t v20 = *((void *)v22 + 2);
      if (!*((void *)a2 + 2))
      {
        if (v21 >= v20) {
          goto LABEL_69;
        }
        unint64_t v44 = v11;
        uint64_t v45 = &v82[40 * v21];
        char v46 = *v45;
        uint64_t v47 = *((void *)v45 + 1);
        long long v85 = *((_OWORD *)v45 + 1);
        uint64_t v48 = *((void *)v45 + 4);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          a2 = sub_100007F78(0, 1, 1, a2);
        }
        unint64_t v50 = *((void *)a2 + 2);
        unint64_t v49 = *((void *)a2 + 3);
        uint64_t v3 = (void *)(v50 + 1);
        if (v50 >= v49 >> 1) {
          a2 = sub_100007F78((char *)(v49 > 1), v50 + 1, 1, a2);
        }
        *((void *)a2 + 2) = v3;
        uint64_t v51 = &a2[40 * v50];
        v51[32] = v46;
        *((void *)v51 + 5) = v47;
        *((_OWORD *)v51 + 3) = v85;
        *((void *)v51 + 8) = v48;
        unint64_t v20 = *((void *)v22 + 2);
        unint64_t v11 = v44;
        a3 = (uint64_t)v79;
      }
      if (v21 >= v20) {
        break;
      }
      unint64_t v83 = v11;
      unint64_t v11 = v21 + 1;
      CGRect v94 = CGRectOffset(*(CGRect *)&v82[40 * v21 + 8], 1.0, 0.0);
      if (v21 + 1 >= (unint64_t)v84) {
        goto LABEL_52;
      }
      unint64_t v20 = *((void *)v22 + 2);
      if (v11 >= v20) {
        goto LABEL_68;
      }
      unint64_t v21 = (unint64_t)&v82[40 * v11];
      uint64_t v3 = (void *)(v21 + 8);
      uint64_t v52 = (uint64_t *)(v21 + 32);
      if (CGRectIntersectsRect(v94, *(CGRect *)(v21 + 8)))
      {
        unint64_t v20 = *((void *)v22 + 2);
        if (v11 >= v20) {
          goto LABEL_70;
        }
        unint64_t v53 = v11;
        char v54 = *(unsigned char *)v21;
        uint64_t v55 = *v3;
        long long v85 = *(_OWORD *)(v3 + 1);
        uint64_t v56 = *v52;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          a2 = sub_100007F78(0, *((void *)a2 + 2) + 1, 1, a2);
        }
        unint64_t v58 = *((void *)a2 + 2);
        unint64_t v57 = *((void *)a2 + 3);
        uint64_t v3 = (void *)(v58 + 1);
        if (v58 >= v57 >> 1) {
          a2 = sub_100007F78((char *)(v57 > 1), v58 + 1, 1, a2);
        }
        *((void *)a2 + 2) = v3;
        v59 = &a2[40 * v58];
        v59[32] = v54;
        *((void *)v59 + 5) = v55;
        *((_OWORD *)v59 + 3) = v85;
        *((void *)v59 + 8) = v56;
        unint64_t v11 = v83;
        unint64_t v60 = v53;
        uint64_t v22 = v80;
      }
      else
      {
LABEL_52:
        unint64_t v81 = v11;
        int64_t v61 = *((void *)a2 + 2);
        if (v61)
        {
          unint64_t v93 = &_swiftEmptyArrayStorage;
          sub_100009378(0, v61, 0);
          v62 = v93;
          v63 = a2 + 56;
          do
          {
            long long v64 = *(v63 - 1);
            long long v65 = *v63;
            char v86 = *((unsigned char *)v63 - 24);
            long long v87 = v64;
            long long v88 = v65;
            sub_1000056DC(&qword_100021A30);
            sub_1000056DC(&qword_100021A38);
            swift_dynamicCast();
            char v66 = v89;
            uint64_t v67 = v90;
            long long v85 = v91;
            uint64_t v68 = v92;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_100009378(0, v62[2] + 1, 1);
              v62 = v93;
            }
            unint64_t v70 = v62[2];
            unint64_t v69 = v62[3];
            if (v70 >= v69 >> 1)
            {
              sub_100009378(v69 > 1, v70 + 1, 1);
              v62 = v93;
            }
            v62[2] = v70 + 1;
            uint64_t v71 = (char *)&v62[5 * v70];
            v71[32] = v66;
            *((void *)v71 + 5) = v67;
            *((_OWORD *)v71 + 3) = v85;
            *((void *)v71 + 8) = v68;
            v63 = (_OWORD *)((char *)v63 + 40);
            --v61;
          }
          while (v61);
          swift_bridgeObjectRelease();
          a3 = (uint64_t)v79;
          a2 = (char *)&_swiftEmptyArrayStorage;
        }
        else
        {
          swift_bridgeObjectRelease();
          a2 = (char *)&_swiftEmptyArrayStorage;
          v62 = &_swiftEmptyArrayStorage;
        }
        UUID.init()();
        *(void *)(a3 + *(int *)(v78 + 20)) = v62;
        unint64_t v11 = v83;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v22 = v80;
        unint64_t v60 = v81;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          unint64_t v11 = sub_100007D10(0, *(void *)(v11 + 16) + 1, 1, v11);
        }
        unint64_t v74 = *(void *)(v11 + 16);
        unint64_t v73 = *(void *)(v11 + 24);
        uint64_t v3 = (void *)(v74 + 1);
        if (v74 >= v73 >> 1) {
          unint64_t v11 = sub_100007D10(v73 > 1, v74 + 1, 1, v11);
        }
        *(void *)(v11 + 16) = v3;
        sub_10000AFA0(a3, v11+ ((*(unsigned __int8 *)(v77 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80))+ *(void *)(v77 + 72) * v74);
      }
      unint64_t v21 = v60;
      if (v60 == (void)v84)
      {
        swift_bridgeObjectRelease();
        goto LABEL_66;
      }
    }
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    uint64_t v8 = sub_100007F78((char *)(v20 > 1), (int64_t)v22, 1, v8);
  }
LABEL_66:
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100007024@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v78 = a2;
  uint64_t v5 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v5);
  uint64_t v7 = (_OWORD *)((char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for SeatBeltsView.CombinedFrames();
  uint64_t v9 = v8 - 8;
  uint64_t v72 = *(char **)(v8 - 8);
  uint64_t v10 = *((void *)v72 + 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000056DC(&qword_100021960);
  __chkstk_darwin(v12 - 8);
  uint64_t v79 = (uint64_t *)((char *)&v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v73 = sub_1000056DC(&qword_100021950);
  __chkstk_darwin(v73);
  uint64_t v76 = (uint64_t)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_1000056DC(&qword_100021940);
  __chkstk_darwin(v74);
  unint64_t v16 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_1000056DC(&qword_100021930);
  __chkstk_darwin(v75);
  id v18 = (char *)&v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(a1 + *(int *)(v9 + 28));
  if (*(void *)(v19 + 16) && (double v20 = *(double *)(v19 + 40), sub_100007AE4(), *(void *)(v19 + 16)))
  {
    double v22 = v21;
    uint64_t v77 = v16;
    double v23 = *(double *)(v78 + 72);
    double v24 = *(double *)(v78 + 80);
    double v25 = *(double *)(v19 + 48);
    sub_100007AE4();
    double v27 = v26;
    uint64_t v28 = static Alignment.center.getter();
    char v29 = v79;
    *uint64_t v79 = v28;
    v29[1] = v30;
    unint64_t v31 = (char *)v29 + *(int *)(sub_1000056DC(&qword_1000219A0) + 44);
    unint64_t v32 = sub_100007714();
    uint64_t v71 = v32[2];
    if (NSNotFound.getter())
    {
      sub_10000B354(a1, (uint64_t)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for SeatBeltsView.CombinedFrames);
      uint64_t v33 = a3;
      unint64_t v34 = (v72[80] + 16) & ~(unint64_t)v72[80];
      unint64_t v70 = v31;
      uint64_t v35 = v5;
      long long v36 = v7;
      unint64_t v37 = (v10 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v72 = v18;
      unint64_t v38 = (v37 + 119) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v39 = swift_allocObject();
      uint64_t v40 = v39 + v34;
      a3 = v33;
      unint64_t v41 = (_OWORD *)v78;
      sub_10000AFA0((uint64_t)v11, v40);
      unint64_t v42 = (_OWORD *)(v39 + v37);
      uint64_t v7 = v36;
      uint64_t v5 = v35;
      long long v43 = v41[5];
      v42[4] = v41[4];
      v42[5] = v43;
      v42[6] = v41[6];
      long long v44 = v41[1];
      *unint64_t v42 = *v41;
      v42[1] = v44;
      long long v45 = v41[3];
      v42[2] = v41[2];
      v42[3] = v45;
      *(void *)(v39 + v38) = v32;
      sub_10000AB38((uint64_t)v41);
      sub_1000056DC(&qword_1000219A8);
      sub_10000B0BC(&qword_1000219B0, &qword_1000219A8, (void (*)(void))sub_10000B13C);
      char v46 = v70;
      id v18 = v72;
      ForEach<>.init(_:content:)();
      uint64_t v47 = sub_1000056DC(&qword_100021A18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v46, 0, 1, v47);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v48 = sub_1000056DC(&qword_100021A18);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v31, 1, 1, v48);
    }
    sub_100007AE4();
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    unint64_t v49 = v79;
    uint64_t v50 = v76;
    sub_10000B418((uint64_t)v79, v76, &qword_100021960);
    uint64_t v51 = (_OWORD *)(v50 + *(int *)(v73 + 36));
    long long v52 = v81;
    *uint64_t v51 = v80;
    v51[1] = v52;
    v51[2] = v82;
    sub_10000B78C((uint64_t)v49, &qword_100021960);
    id v53 = [self systemGray6Color];
    uint64_t v54 = Color.init(uiColor:)();
    char v55 = static Edge.Set.all.getter();
    uint64_t v56 = (uint64_t)v77;
    sub_10000B418(v50, (uint64_t)v77, &qword_100021950);
    uint64_t v57 = v56 + *(int *)(v74 + 36);
    *(void *)uint64_t v57 = v54;
    *(unsigned char *)(v57 + 8) = v55;
    sub_10000B78C(v50, &qword_100021950);
    unint64_t v58 = (char *)v7 + *(int *)(v5 + 20);
    uint64_t v59 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v60 = type metadata accessor for RoundedCornerStyle();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v60 - 8) + 104))(v58, v59, v60);
    __asm { FMOV            V0.2D, #10.0 }
    *uint64_t v7 = _Q0;
    uint64_t v66 = (uint64_t)&v18[*(int *)(v75 + 36)];
    sub_10000B354((uint64_t)v7, v66, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    *(_WORD *)(v66 + *(int *)(sub_1000056DC(&qword_100021980) + 36)) = 256;
    sub_10000B418(v56, (uint64_t)v18, &qword_100021940);
    sub_10000B3BC((uint64_t)v7);
    sub_10000B78C(v56, &qword_100021940);
    sub_10000B418((uint64_t)v18, a3, &qword_100021930);
    uint64_t v67 = (double *)(a3 + *(int *)(sub_1000056DC(&qword_100021910) + 36));
    *uint64_t v67 = v20 + v22 * 0.5 + v23;
    v67[1] = v24 + v25 + v27 * 0.5;
    return sub_10000B78C((uint64_t)v18, &qword_100021930);
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void *sub_100007714()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SeatBeltsView.CombinedFrames() + 20));
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_100009398(0, v2, 0);
    unint64_t v3 = *((void *)&_swiftEmptyArrayStorage + 2);
    uint64_t v4 = 32;
    do
    {
      char v5 = *(unsigned char *)(v1 + v4);
      unint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v3 >= v6 >> 1) {
        sub_100009398(v6 > 1, v3 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v3 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v3 + 32) = v5;
      v4 += 40;
      ++v3;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100007800@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_1000056DC(&qword_100021A20);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for SeatBeltsView.CombinedFrames();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v14 = *(void *)(a2 + *(int *)(v13 + 20));
  if (*(void *)(v14 + 16) <= a1)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v15 = (double *)(v14 + 40 * a1);
  double v16 = v15[5];
  v53.origin.y = v15[6];
  v53.size.width = v15[7];
  v53.size.height = v15[8];
  v53.origin.x = v16;
  double Width = CGRectGetWidth(v53);
  if (!*(void *)(v14 + 16))
  {
LABEL_12:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  double v18 = Width;
  double v19 = *(double *)(v14 + 40);
  double v20 = *(double *)(a3 + 48);
  uint64_t v21 = Image.init(systemName:)();
  uint64_t v22 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v12, 1, 1, v22);
  uint64_t v23 = static Font.system(size:weight:design:)();
  sub_10000B78C((uint64_t)v12, &qword_100021A20);
  uint64_t KeyPath = swift_getKeyPath();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  if (*(void *)(a4 + 16) <= a1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v43 = KeyPath;
  uint64_t v44 = v23;
  uint64_t v25 = v21;
  uint64_t v26 = v47;
  char v27 = v48;
  uint64_t v28 = v49;
  char v29 = v50;
  uint64_t v30 = v52;
  uint64_t v42 = v51;
  if (*(unsigned char *)(a4 + a1 + 32) == 2) {
    uint64_t v31 = static Color.red.getter();
  }
  else {
    uint64_t v31 = static Color.green.getter();
  }
  uint64_t v32 = v31;
  double v33 = v16 + v18 * 0.5 - v19;
  uint64_t v34 = swift_getKeyPath();
  uint64_t v35 = *(void *)(a3 + 32);
  uint64_t v36 = *(void *)(a3 + 40);
  uint64_t result = static UnitPoint.center.getter();
  char v46 = v27;
  char v45 = v29;
  uint64_t v38 = v43;
  *(void *)a5 = v25;
  *(void *)(a5 + 8) = v38;
  *(void *)(a5 + 16) = v44;
  *(void *)(a5 + 24) = v26;
  *(unsigned char *)(a5 + 32) = v27;
  *(void *)(a5 + 40) = v28;
  *(unsigned char *)(a5 + 48) = v29;
  *(void *)(a5 + 56) = v42;
  *(void *)(a5 + 64) = v30;
  *(void *)(a5 + 72) = v34;
  *(void *)(a5 + 80) = v32;
  *(void *)(a5 + 88) = v35;
  *(void *)(a5 + 96) = v36;
  *(void *)(a5 + 104) = v39;
  *(void *)(a5 + 112) = v40;
  *(double *)(a5 + 120) = v33;
  *(double *)(a5 + 128) = v20 * 0.5;
  return result;
}

void sub_100007AE4()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SeatBeltsView.CombinedFrames() + 20));
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    CGRectGetWidth(*(CGRect *)(v1 + 40 * v2));
    uint64_t v3 = *(void *)(v1 + 16);
    if (v3)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = (CGFloat *)(v1 + 64);
      double Height = 0.0;
      do
      {
        CGFloat v6 = *(v4 - 3);
        CGFloat v7 = *(v4 - 2);
        CGFloat v8 = *(v4 - 1);
        CGFloat v9 = *v4;
        v10.origin.x = v6;
        v10.origin.y = v7;
        v10.size.width = v8;
        v10.size.height = *v4;
        if (Height < CGRectGetHeight(v10))
        {
          v11.origin.x = v6;
          v11.origin.y = v7;
          v11.size.width = v8;
          v11.size.height = v9;
          double Height = CGRectGetHeight(v11);
        }
        v4 += 5;
        --v3;
      }
      while (v3);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

uint64_t sub_100007C38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_100007CA8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100007CC4@<X0>(uint64_t a1@<X8>)
{
  return sub_100005DC0(a1);
}

uint64_t sub_100007D10(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000056DC(&qword_100021A48);
  uint64_t v10 = *(void *)(type metadata accessor for SeatBeltsView.CombinedFrames() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for SeatBeltsView.CombinedFrames() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000B5D0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

char *sub_100007F78(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000056DC(&qword_100021A40);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
      unint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[40 * v8 + 32]) {
          memmove(v12, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10000B4E0(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000809C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  size_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_100012290(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    double v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = *(void *)(v21 + 8 * v14);
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_100008E20();
    goto LABEL_7;
  }
  sub_100008430(v17, a3 & 1);
  unint64_t v23 = sub_100012290(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  double v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_100008C94(v14, (uint64_t)v11, a1, v20);
  return 0;
}

uint64_t sub_100008244@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v8 = (void **)v7;
  uint64_t v33 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v16 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  char v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = (void *)*v7;
  unint64_t v21 = sub_100012290(a1);
  uint64_t v22 = v19[2];
  char v23 = v20 ^ 1;
  uint64_t result = v22 + ((v20 ^ 1) & 1);
  if (__OFADD__(v22, (v20 ^ 1) & 1))
  {
    __break(1u);
  }
  else
  {
    unsigned __int8 v25 = v20;
    uint64_t v26 = v19[3];
    if (v26 >= result && (a2 & 1) != 0)
    {
LABEL_7:
      char v27 = *v8;
      if (v25)
      {
LABEL_8:
        uint64_t v28 = v27[7] + 32 * v21;
        long long v29 = *(_OWORD *)v28;
        long long v30 = *(_OWORD *)(v28 + 16);
        *(double *)uint64_t v28 = a4;
        *(double *)(v28 + 8) = a5;
        *(double *)(v28 + 16) = a6;
        *(double *)(v28 + 24) = a7;
LABEL_12:
        *(_OWORD *)a3 = v29;
        *(_OWORD *)(a3 + 16) = v30;
        *(unsigned char *)(a3 + 32) = v23 & 1;
        return result;
      }
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, v33);
      uint64_t result = sub_100008D4C(v21, (uint64_t)v18, v27, a4, a5, a6, a7);
      long long v29 = 0uLL;
      long long v30 = 0uLL;
      goto LABEL_12;
    }
    if (v26 >= result && (a2 & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_1000090B8();
      goto LABEL_7;
    }
    sub_100008854(result, a2 & 1);
    uint64_t result = sub_100012290(a1);
    if ((v25 & 1) == (v31 & 1))
    {
      unint64_t v21 = result;
      char v27 = *v8;
      if (v25) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_100008430(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_1000056DC(&qword_1000218C8);
  int v46 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  uint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    unsigned __int8 v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_10000A7C4(&qword_1000218D0, (void (*)(uint64_t))&type metadata accessor for CAUVehicleLayoutKey);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  unsigned __int8 v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unsigned __int8 v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_100008854(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_1000056DC(&qword_1000218D8);
  int v49 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    uint64_t v45 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    uint64_t v47 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v46 = (unint64_t)(v12 + 63) >> 6;
    char v48 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    char v50 = (void (**)(char *, uint64_t, uint64_t))(v6 + 32);
    uint64_t v51 = v5;
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    while (1)
    {
      if (v15)
      {
        unint64_t v21 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v22 = v21 | (v18 << 6);
      }
      else
      {
        int64_t v23 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v23 >= v46) {
          goto LABEL_34;
        }
        unint64_t v24 = v47[v23];
        ++v18;
        if (!v24)
        {
          int64_t v18 = v23 + 1;
          if (v23 + 1 >= v46) {
            goto LABEL_34;
          }
          unint64_t v24 = v47[v18];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v46)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v45;
              if (v49)
              {
                uint64_t v43 = 1 << *(unsigned char *)(v9 + 32);
                if (v43 >= 64) {
                  bzero(v47, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v47 = -1 << v43;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v47[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v18 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v46) {
                  goto LABEL_34;
                }
                unint64_t v24 = v47[v18];
                ++v25;
                if (v24) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v25;
          }
        }
LABEL_21:
        unint64_t v15 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v18 << 6);
      }
      uint64_t v26 = v9;
      uint64_t v27 = *(void *)(v9 + 48);
      uint64_t v28 = v6;
      uint64_t v29 = *(void *)(v6 + 72);
      uint64_t v30 = v27 + v29 * v22;
      if (v49) {
        (*v50)(v8, v30, v51);
      }
      else {
        (*v48)(v8, v30, v51);
      }
      uint64_t v31 = (uint64_t *)(*(void *)(v26 + 56) + 32 * v22);
      uint64_t v33 = v31[2];
      uint64_t v32 = v31[3];
      uint64_t v35 = *v31;
      uint64_t v34 = v31[1];
      sub_10000A7C4(&qword_1000218D0, (void (*)(uint64_t))&type metadata accessor for CAUVehicleLayoutKey);
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v36 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v37 = result & ~v36;
      unint64_t v38 = v37 >> 6;
      if (((-1 << v37) & ~*(void *)(v16 + 8 * (v37 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v37) & ~*(void *)(v16 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v39 = 0;
        unint64_t v40 = (unint64_t)(63 - v36) >> 6;
        do
        {
          if (++v38 == v40 && (v39 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v41 = v38 == v40;
          if (v38 == v40) {
            unint64_t v38 = 0;
          }
          v39 |= v41;
          uint64_t v42 = *(void *)(v16 + 8 * v38);
        }
        while (v42 == -1);
        unint64_t v19 = __clz(__rbit64(~v42)) + (v38 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v50)(*(void *)(v11 + 48) + v29 * v19, v8, v51);
      int64_t v20 = (void *)(*(void *)(v11 + 56) + 32 * v19);
      *int64_t v20 = v35;
      v20[1] = v34;
      v20[2] = v33;
      v20[3] = v32;
      ++*(void *)(v11 + 16);
      uint64_t v6 = v28;
      uint64_t v9 = v26;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_100008C94(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_100008D4C(unint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6, double a7)
{
  a3[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v14 = a3[6];
  uint64_t v15 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14 + *(void *)(*(void *)(v15 - 8) + 72) * a1, a2, v15);
  uint64_t v17 = (double *)(a3[7] + 32 * a1);
  *uint64_t v17 = a4;
  v17[1] = a5;
  v17[2] = a6;
  v17[3] = a7;
  uint64_t v18 = a3[2];
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    a3[2] = v20;
  }
  return result;
}

id sub_100008E20()
{
  uint64_t v1 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000056DC(&qword_1000218C8);
  int64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    *int64_t v23 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void **)(*(void *)(v5 + 56) + v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_1000090B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000056DC(&qword_1000218D8);
  uint64_t v6 = *v0;
  uint64_t v7 = static _DictionaryStorage.copy(original:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    id result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v28 = v1;
  id result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    id result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v29 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v30 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v31 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v25 >= v30) {
      goto LABEL_23;
    }
    unint64_t v26 = *(void *)(v29 + 8 * v25);
    ++v11;
    if (!v26)
    {
      int64_t v11 = v25 + 1;
      if (v25 + 1 >= v30) {
        goto LABEL_23;
      }
      unint64_t v26 = *(void *)(v29 + 8 * v11);
      if (!v26) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v26 - 1) & v26;
    unint64_t v16 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 32 * v16;
    uint64_t v19 = *(void *)(v6 + 56) + v18;
    uint64_t v20 = *(void *)v19;
    uint64_t v21 = *(void *)(v19 + 24);
    unint64_t v22 = *(void *)(v8 + 48) + v17;
    int64_t v23 = *(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
    long long v32 = *(_OWORD *)(v19 + 8);
    id result = (void *)v23(v22, v5, v2);
    uint64_t v24 = *(void *)(v8 + 56) + v18;
    *(void *)uint64_t v24 = v20;
    *(_OWORD *)(v24 + 8) = v32;
    *(void *)(v24 + 24) = v21;
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v30)
  {
LABEL_23:
    id result = (void *)swift_release();
    uint64_t v1 = v28;
    goto LABEL_25;
  }
  unint64_t v26 = *(void *)(v29 + 8 * v27);
  if (v26)
  {
    int64_t v11 = v27;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v11 >= v30) {
      goto LABEL_23;
    }
    unint64_t v26 = *(void *)(v29 + 8 * v11);
    ++v27;
    if (v26) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_100009378(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000093B8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100009398(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100009530(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000093B8(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000056DC(&qword_100021A50);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8]) {
      memmove(v12, v13, 40 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[40 * v8] || v12 >= &v13[40 * v8])
  {
    memcpy(v12, v13, 40 * v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100009530(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000056DC(&qword_100021A28);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_100009680(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_1000056DC(&qword_1000218B0);
      uint64_t result = static _SetStorage.allocate(capacity:)();
      uint64_t v3 = (unsigned char *)result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v5) {
        return (unint64_t)v3;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return (unint64_t)v3;
  }
LABEL_9:
  unint64_t v7 = 0;
  int64_t v8 = v3 + 56;
  unint64_t v21 = v1 & 0xC000000000000001;
  unint64_t v19 = v1 + 32;
  uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
  while (v21)
  {
    uint64_t result = specialized _ArrayBuffer._getElementSlowPath(_:)();
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_25;
    }
LABEL_18:
    type metadata accessor for AnyCancellable();
    sub_10000A7C4(&qword_1000218B8, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v11 = -1 << v3[32];
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_10000A7C4(&qword_1000218C0, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
      while (1)
      {
        uint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
        if (result) {
          break;
        }
        unint64_t v12 = (v12 + 1) & v16;
        unint64_t v13 = v12 >> 6;
        uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
        uint64_t v15 = 1 << v12;
        if ((v14 & (1 << v12)) == 0) {
          goto LABEL_22;
        }
      }
      uint64_t result = swift_release();
    }
    else
    {
LABEL_22:
      *(void *)&v8[8 * v13] = v15 | v14;
      *(void *)(*((void *)v3 + 6) + 8 * v12) = v9;
      uint64_t v17 = *((void *)v3 + 2);
      BOOL v10 = __OFADD__(v17, 1);
      uint64_t v18 = v17 + 1;
      if (v10) {
        goto LABEL_26;
      }
      *((void *)v3 + 2) = v18;
    }
    if (v7 == v5) {
      return (unint64_t)v3;
    }
  }
  if (v7 >= *(void *)(v20 + 16)) {
    goto LABEL_27;
  }
  unint64_t v9 = *(void *)(v19 + 8 * v7);
  uint64_t result = swift_retain();
  BOOL v10 = __OFADD__(v7++, 1);
  if (!v10) {
    goto LABEL_18;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_100009934@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>)
{
  uint64_t v109 = a2;
  uint64_t v11 = sub_1000056DC(&qword_100021858);
  __chkstk_darwin(v11 - 8);
  v97 = (char *)v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_1000056DC(&qword_100021860);
  uint64_t v13 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  v95 = (char *)v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000056DC(&qword_100021868);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)v78 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for CAUVehicleLayoutInfo();
  uint64_t v82 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  v110 = (char *)v78 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v99 = *(void *)(v20 - 8);
  uint64_t v21 = *(void *)(v99 + 64);
  uint64_t v22 = __chkstk_darwin(v20);
  CGRect v94 = (char *)v78 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)v78 - v23;
  static Font.Weight.medium.getter();
  uint64_t v26 = v25;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    int64_t v27 = (void *)sub_100009680((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    int64_t v27 = &_swiftEmptySetSingleton;
  }
  v114 = v27;
  v78[1] = type metadata accessor for SeatBeltViewUpdater();
  uint64_t result = swift_allocObject();
  uint64_t v100 = result;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v29 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  double v80 = a5;
  double v79 = a4;
  if (!v29)
  {
    swift_bridgeObjectRelease();
    unint64_t v70 = &_swiftEmptyDictionarySingleton;
    double Width = 1.79769313e308;
    uint64_t v71 = &_swiftEmptyDictionarySingleton;
    double v32 = 1.79769313e308;
LABEL_25:
    sub_10000A7C4(&qword_100021878, (void (*)(uint64_t))type metadata accessor for SeatBeltViewUpdater);
    uint64_t v72 = ObservedObject.init(wrappedValue:)();
    uint64_t v74 = v73;
    uint64_t v75 = type metadata accessor for CAUVehicleLayout();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v75 - 8) + 8))(v109, v75);
    uint64_t v76 = v114;
    *(void *)a3 = v26;
    *(_OWORD *)(a3 + 8) = xmmword_100018A00;
    *(void *)(a3 + 24) = 0x404E000000000000;
    *(double *)(a3 + 32) = Width / 48.0;
    *(double *)(a3 + 40) = v32 / 60.0;
    *(double *)(a3 + 48) = v32;
    *(void *)(a3 + 56) = v71;
    *(void *)(a3 + 64) = v70;
    double v77 = v80;
    *(double *)(a3 + 72) = v79;
    *(double *)(a3 + 80) = v77;
    *(void *)(a3 + 88) = v76;
    *(void *)(a3 + 96) = v72;
    *(void *)(a3 + 104) = v74;
    return result;
  }
  uint64_t v98 = v29;
  if (v29 >= 1)
  {
    v78[0] = a3;
    uint64_t v30 = 0;
    unint64_t v106 = a1 & 0xC000000000000001;
    v105 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v82 + 56);
    uint64_t v81 = v82 + 16;
    v104 = (unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48);
    char v89 = (void (**)(char *, char *, uint64_t))(v82 + 32);
    uint64_t v88 = v99 + 16;
    uint64_t v87 = v21 + 7;
    uint64_t v86 = v99 + 32;
    long long v85 = (void (**)(char *, uint64_t))(v13 + 8);
    long long v84 = (void (**)(char *, uint64_t))(v82 + 8);
    v103 = (void (**)(char *, uint64_t))(v99 + 8);
    double Width = 1.79769313e308;
    unint64_t v83 = (void *)0x8000000100016FD0;
    v107 = &_swiftEmptyDictionarySingleton;
    v108 = &_swiftEmptyDictionarySingleton;
    double v32 = 1.79769313e308;
    uint64_t v33 = v98;
    unint64_t v93 = a1;
    uint64_t v92 = v17;
    uint64_t v91 = v18;
    uint64_t v90 = v20;
    do
    {
      if (v106) {
        id v36 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v36 = *(id *)(a1 + 8 * v30 + 32);
      }
      id v37 = v36;
      sub_100005720(0, &qword_100021870);
      unint64_t v38 = v37;
      CAFPositionedRequired.layoutKey.getter();
      uint64_t v39 = CAUVehicleLayout.infos.getter();
      if (*(void *)(v39 + 16) && (unint64_t v40 = sub_100012290((uint64_t)v24), (v41 & 1) != 0))
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v82 + 16))(v17, *(void *)(v39 + 56) + *(void *)(v82 + 72) * v40, v18);
        uint64_t v42 = 0;
      }
      else
      {
        uint64_t v42 = 1;
      }
      (*v105)(v17, v42, 1, v18);
      swift_bridgeObjectRelease();
      if ((*v104)(v17, 1, v18) == 1)
      {
        sub_10000B78C((uint64_t)v17, &qword_100021868);
        v112 = 0;
        unint64_t v113 = 0xE000000000000000;
        _StringGuts.grow(_:)(36);
        v34._countAndFlagsBits = 0x746C654274616553;
        v34._object = (void *)0xEE00203A79656B20;
        String.append(_:)(v34);
        _print_unlocked<A, B>(_:_:)();
        v35._countAndFlagsBits = 0xD000000000000014;
        v35._object = v83;
        String.append(_:)(v35);
        sub_10000C6BC((uint64_t)v112, v113);

        swift_bridgeObjectRelease();
      }
      else
      {
        (*v89)(v110, v17, v18);
        v112 = 0;
        unint64_t v113 = 0xE000000000000000;
        _StringGuts.grow(_:)(16);
        v43._countAndFlagsBits = 0x746C654274616553;
        v43._object = (void *)0xEE00203A79656B20;
        String.append(_:)(v43);
        _print_unlocked<A, B>(_:_:)();
        sub_10000C6BC((uint64_t)v112, v113);
        swift_bridgeObjectRelease();
        sub_10000A5D4(&qword_100021880, &qword_100021870);
        v101 = v38;
        id v102 = (id)CAFObserved<>.observable.getter();
        v112 = (void *)dispatch thunk of CAFSeatBeltObservable.$seatBeltIndicator.getter();
        id v111 = [self mainRunLoop];
        uint64_t v44 = type metadata accessor for NSRunLoop.SchedulerOptions();
        uint64_t v45 = (uint64_t)v97;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v97, 1, 1, v44);
        sub_1000056DC(&qword_100021888);
        sub_100005720(0, &qword_100021890);
        uint64_t v46 = v20;
        sub_10000BE10(&qword_100021898, &qword_100021888);
        sub_10000A5D4(&qword_1000218A0, &qword_100021890);
        uint64_t v47 = v95;
        Publisher.receive<A>(on:options:)();
        sub_10000B78C(v45, &qword_100021858);

        swift_release();
        uint64_t v48 = v99;
        int v49 = v24;
        char v50 = v94;
        (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v94, v49, v20);
        unint64_t v51 = (*(unsigned __int8 *)(v48 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
        unint64_t v52 = (v87 + v51) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v53 = swift_allocObject();
        uint64_t v54 = v50;
        uint64_t v24 = v49;
        (*(void (**)(unint64_t, char *, uint64_t))(v48 + 32))(v53 + v51, v54, v46);
        char v55 = v101;
        *(void *)(v53 + v52) = v101;
        *(void *)(v53 + ((v52 + 15) & 0xFFFFFFFFFFFFFFF8)) = v100;
        sub_10000BE10(&qword_1000218A8, &qword_100021860);
        id v56 = v55;
        swift_retain();
        uint64_t v57 = v96;
        Publisher<>.sink(receiveValue:)();
        swift_release();
        (*v85)(v47, v57);
        AnyCancellable.store(in:)();
        swift_release();
        double v58 = (double)(int)CAUVehicleLayoutInfo.x.getter() * a6;
        double v59 = (double)(int)CAUVehicleLayoutInfo.y.getter() * a6;
        double v60 = (double)(int)CAUVehicleLayoutInfo.width.getter() * a6;
        double v61 = (double)(int)CAUVehicleLayoutInfo.height.getter() * a6;
        uint64_t v62 = (uint64_t)v108;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v112 = (void *)v62;
        sub_100008244((uint64_t)v24, isUniquelyReferenced_nonNull_native, (uint64_t)v115, v58, v59, v60, v61);
        v108 = v112;
        swift_bridgeObjectRelease();
        id v64 = v102;
        uint64_t v65 = (uint64_t)v107;
        char v66 = swift_isUniquelyReferenced_nonNull_native();
        v112 = (void *)v65;
        uint64_t v67 = (void *)sub_10000809C((uint64_t)v64, (uint64_t)v24, v66);
        uint64_t v68 = (uint64_t)v112;
        swift_bridgeObjectRelease();

        v116.origin.x = v58;
        v116.origin.y = v59;
        v116.size.width = v60;
        v116.size.height = v61;
        if (CGRectGetWidth(v116) < Width)
        {
          v117.origin.x = v58;
          v117.origin.y = v59;
          v117.size.width = v60;
          v117.size.height = v61;
          double Width = CGRectGetWidth(v117);
        }
        v107 = (void *)v68;
        v118.origin.x = v58;
        v118.origin.y = v59;
        v118.size.width = v60;
        v118.size.height = v61;
        CGFloat Height = CGRectGetHeight(v118);
        a1 = v93;
        if (Height < v32)
        {
          v119.origin.x = v58;
          v119.origin.y = v59;
          v119.size.width = v60;
          v119.size.height = v61;
          double v32 = CGRectGetHeight(v119);
        }

        uint64_t v18 = v91;
        (*v84)(v110, v91);
        uint64_t v17 = v92;
        uint64_t v20 = v90;
        uint64_t v33 = v98;
      }
      ++v30;
      (*v103)(v24, v20);
    }
    while (v33 != v30);
    swift_bridgeObjectRelease();
    a3 = v78[0];
    uint64_t v71 = v107;
    unint64_t v70 = v108;
    goto LABEL_25;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A5D4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005720(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000A618(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000A660()
{
  uint64_t v1 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release();

  return _swift_deallocObject(v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

uint64_t sub_10000A71C(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for CAUVehicleLayoutKey() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void **)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_100005C68(a1, v1 + v4, v5);
}

uint64_t sub_10000A7C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t destroy for SeatBeltsView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for SeatBeltsView(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v5 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v5;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SeatBeltsView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for SeatBeltsView(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for SeatBeltsView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SeatBeltsView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 112)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SeatBeltsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SeatBeltsView()
{
  return &type metadata for SeatBeltsView;
}

uint64_t sub_10000AB10(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100019188, 1);
}

uint64_t sub_10000AB30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100007024(a1, v2 + 16, a2);
}

uint64_t sub_10000AB38(uint64_t a1)
{
  return a1;
}

unint64_t sub_10000AB90()
{
  unint64_t result = qword_100021928;
  if (!qword_100021928)
  {
    sub_10000A618(&qword_100021930);
    sub_10000AC30();
    sub_10000BE10(&qword_100021978, &qword_100021980);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021928);
  }
  return result;
}

unint64_t sub_10000AC30()
{
  unint64_t result = qword_100021938;
  if (!qword_100021938)
  {
    sub_10000A618(&qword_100021940);
    sub_10000ACD0();
    sub_10000BE10(&qword_100021968, &qword_100021970);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021938);
  }
  return result;
}

unint64_t sub_10000ACD0()
{
  unint64_t result = qword_100021948;
  if (!qword_100021948)
  {
    sub_10000A618(&qword_100021950);
    sub_10000BE10(&qword_100021958, &qword_100021960);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021948);
  }
  return result;
}

unint64_t sub_10000AD70()
{
  unint64_t result = qword_100021988;
  if (!qword_100021988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021988);
  }
  return result;
}

uint64_t type metadata accessor for SeatBeltsView.CombinedFrames()
{
  uint64_t result = qword_100021AB0;
  if (!qword_100021AB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000AE18()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_10000AE68()
{
  uint64_t v1 = *(void *)(type metadata accessor for SeatBeltsView.CombinedFrames() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 119) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v5 + 8, v4);
}

uint64_t sub_10000AFA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SeatBeltsView.CombinedFrames();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B004@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for SeatBeltsView.CombinedFrames() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v2 + ((v7 + 119) & 0xFFFFFFFFFFFFFFF8));

  return sub_100007800(a1, v2 + v6, v2 + v7, v8, a2);
}

uint64_t sub_10000B0BC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000A618(a2);
    a3();
    sub_10000AD70();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000B13C()
{
  return sub_10000B16C(&qword_1000219B8, &qword_1000219C0, (void (*)(void))sub_10000B1E8);
}

uint64_t sub_10000B16C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000A618(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000B1E8()
{
  unint64_t result = qword_1000219C8;
  if (!qword_1000219C8)
  {
    sub_10000A618(&qword_1000219D0);
    sub_10000B16C(&qword_1000219D8, &qword_1000219E0, (void (*)(void))sub_10000B2B4);
    sub_10000BE10(&qword_100021A08, &qword_100021A10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000219C8);
  }
  return result;
}

unint64_t sub_10000B2B4()
{
  unint64_t result = qword_1000219E8;
  if (!qword_1000219E8)
  {
    sub_10000A618(&qword_1000219F0);
    sub_10000BE10(&qword_1000219F8, &qword_100021A00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000219E8);
  }
  return result;
}

uint64_t sub_10000B354(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B3BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B418(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000056DC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B484@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000B4B0()
{
  return EnvironmentValues.foregroundColor.setter();
}

char *sub_10000B4E0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 40 * a1 + 32);
    size_t v6 = 40 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000B5D0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for SeatBeltsView.CombinedFrames() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000B728(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000056DC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B78C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000056DC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_10000B7E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10000B8B8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000B92C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10000B9AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000BA38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10000BAB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000BB38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000BB4C);
}

uint64_t sub_10000BB4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10000BC0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000BC20);
}

uint64_t sub_10000BC20(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_10000BCDC()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_10000BD78()
{
  unint64_t result = qword_100021AE8;
  if (!qword_100021AE8)
  {
    sub_10000A618(&qword_1000218E0);
    sub_10000BE10(&qword_100021AF0, &qword_100021900);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021AE8);
  }
  return result;
}

uint64_t sub_10000BE10(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000A618(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000BE54()
{
  return sub_10000A7C4(&qword_100021AF8, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_10000BEA0()
{
  id v0 = [self mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (v1)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_10000C67C();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_100022780 = result;
  return result;
}

uint64_t sub_10000BF60(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000C034(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000C620((uint64_t)v12, *a3);
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
      sub_10000C620((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000C5D0((uint64_t)v12);
  return v7;
}

uint64_t sub_10000C034(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000C1F0(a5, a6);
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

uint64_t sub_10000C1F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000C288(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000C468(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000C468(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000C288(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000C400(v2, 0);
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

void *sub_10000C400(uint64_t a1, uint64_t a2)
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
  sub_1000056DC(&qword_100021B00);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000C468(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000056DC(&qword_100021B00);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000C5B8(uint64_t a1, unint64_t a2)
{
  return sub_10000C6D4(a1, a2, (uint64_t (*)(void))&static os_log_type_t.error.getter);
}

uint64_t sub_10000C5D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000C620(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000C67C()
{
  unint64_t result = qword_100021B08;
  if (!qword_100021B08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100021B08);
  }
  return result;
}

uint64_t sub_10000C6BC(uint64_t a1, unint64_t a2)
{
  return sub_10000C6D4(a1, a2, (uint64_t (*)(void))&static os_log_type_t.info.getter);
}

uint64_t sub_10000C6D4(uint64_t a1, unint64_t a2, uint64_t (*a3)(void))
{
  os_log_type_t v5 = a3();
  if (qword_1000214D0 != -1) {
    swift_once();
  }
  unint64_t v6 = qword_100022780;
  uint64_t result = os_log_type_enabled((os_log_t)qword_100022780, v5);
  if (result)
  {
    swift_bridgeObjectRetain_n();
    int64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)int64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_10000BF60(a1, a2, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v6, v5, "%s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    return swift_slowDealloc();
  }
  return result;
}

uint64_t sub_10000C854(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (qword_1000214D0 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_100022780;
  uint64_t result = os_log_type_enabled((os_log_t)qword_100022780, v8);
  if (result)
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315650;
    swift_bridgeObjectRetain();
    sub_10000BF60(a3, a4, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2048;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v11 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_10000BF60(a1, a2, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "%s:%ld  %s", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    return swift_slowDealloc();
  }
  return result;
}

uint64_t destroy for ClosuresWidgetView(uint64_t a1)
{
  return swift_release();
}

void *initializeWithCopy for ClosuresWidgetView(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  id v5 = v3;
  swift_retain();
  return a1;
}

void *assignWithCopy for ClosuresWidgetView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = (void *)a2[1];
  id v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for ClosuresWidgetView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  id v5 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v4;

  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ClosuresWidgetView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ClosuresWidgetView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ClosuresWidgetView()
{
  return &type metadata for ClosuresWidgetView;
}

uint64_t sub_10000CC1C(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100019204, 1);
}

uint64_t sub_10000CC38@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v34 = a3;
  *(void *)&long long v35 = a1;
  uint64_t v37 = a4;
  uint64_t v5 = sub_1000056DC(&qword_100021B10);
  uint64_t v38 = *(void *)(v5 - 8);
  uint64_t v39 = v5;
  __chkstk_darwin(v5);
  id v36 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000056DC(&qword_100021B18);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000056DC(&qword_100021B20);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = static Alignment.center.getter();
  uint64_t v17 = v16;
  sub_10000CF60(a2, (uint64_t)v40);
  long long v35 = v40[0];
  long long v32 = v40[2];
  long long v33 = v40[1];
  uint64_t v18 = v41;
  char v19 = v42;
  id v20 = a2;
  dispatch thunk of CAFCarManagerObservable.$currentCar.getter();

  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(&v14[*(int *)(v12 + 60)], v10, v7);
  *(void *)uint64_t v14 = v15;
  *((void *)v14 + 1) = v17;
  long long v21 = v33;
  *((_OWORD *)v14 + 1) = v35;
  *((_OWORD *)v14 + 2) = v21;
  *((_OWORD *)v14 + 3) = v32;
  *((void *)v14 + 8) = v18;
  v14[72] = v19;
  uint64_t v22 = (uint64_t (**)(id *))&v14[*(int *)(v12 + 64)];
  *uint64_t v22 = sub_10000D28C;
  v22[1] = 0;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_retain();
  uint64_t v23 = v36;
  dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter();
  swift_release();
  uint64_t v24 = v37;
  sub_10000B418((uint64_t)v14, v37, &qword_100021B20);
  uint64_t v25 = sub_1000056DC(&qword_100021B28);
  uint64_t v26 = v24 + *(int *)(v25 + 52);
  uint64_t v27 = v24;
  uint64_t v29 = v38;
  uint64_t v28 = v39;
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 16))(v26, v23, v39);
  uint64_t v30 = (uint64_t (**)(uint64_t *))(v27 + *(int *)(v25 + 56));
  *uint64_t v30 = sub_10000D3A8;
  v30[1] = 0;
  (*(void (**)(char *, uint64_t))(v29 + 8))(v23, v28);
  return sub_10000B78C((uint64_t)v14, &qword_100021B20);
}

double sub_10000CF60@<D0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  id v3 = a1;
  uint64_t v4 = (void *)dispatch thunk of CAFCarManagerObservable.currentCar.getter();

  if (v4)
  {
    sub_100005720(0, &qword_100021B60);
    sub_10000A5D4(&qword_100021B68, &qword_100021B60);
    CAFObserved<>.observable.getter();
    swift_retain();
    uint64_t v5 = (void *)dispatch thunk of CAUAssetLibraryManager.assetLibrary.getter();
    swift_release();
    type metadata accessor for CAFCarObservable();
    sub_100012738(&qword_100021B70, (void (*)(uint64_t))&type metadata accessor for CAFCarObservable);
    ObservedObject.init(wrappedValue:)();
    uint64_t v7 = v6;
    id v8 = v5;
    id v9 = v7;
    id v10 = v8;
    id v11 = v9;
    sub_1000056DC(&qword_100021B30);
    sub_1000056DC(&qword_100021B38);
    sub_100012664(&qword_100021B40, &qword_100021B30, (void (*)(void))sub_100012610);
    sub_100012664(&qword_100021B50, &qword_100021B38, (void (*)(void))sub_1000126E4);
    _ConditionalContent<>.init(storage:)();
  }
  else
  {
    sub_1000056DC(&qword_100021B30);
    sub_1000056DC(&qword_100021B38);
    sub_100012664(&qword_100021B40, &qword_100021B30, (void (*)(void))sub_100012610);
    sub_100012664(&qword_100021B50, &qword_100021B38, (void (*)(void))sub_1000126E4);
    _ConditionalContent<>.init(storage:)();
  }
  double result = *(double *)&v13;
  *(_OWORD *)a2 = v13;
  *(_OWORD *)(a2 + 16) = v14;
  *(_OWORD *)(a2 + 32) = v15;
  *(void *)(a2 + 48) = v16;
  *(unsigned char *)(a2 + 56) = v17;
  return result;
}

uint64_t sub_10000D254()
{
  return sub_10000C6BC(0xD00000000000001BLL, 0x8000000100017430);
}

uint64_t sub_10000D270()
{
  return sub_10000C6BC(0xD00000000000001ALL, 0x8000000100017450);
}

uint64_t sub_10000D28C(id *a1)
{
  if (*a1)
  {
    id v1 = *a1;
    _StringGuts.grow(_:)(47);
    swift_bridgeObjectRelease();
    id v2 = [v1 description];
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v5 = v4;

    v6._countAndFlagsBits = v3;
    v6._object = v5;
    String.append(_:)(v6);
    swift_bridgeObjectRelease();
    sub_10000C6BC(0xD00000000000002DLL, 0x8000000100017400);

    return swift_bridgeObjectRelease();
  }
  else
  {
    return sub_10000C6BC(0xD00000000000001CLL, 0x80000001000173E0);
  }
}

uint64_t sub_10000D3A8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  _StringGuts.grow(_:)(28);
  swift_bridgeObjectRelease();
  if (v1) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = 544501614;
  }
  if (v1) {
    unint64_t v3 = 0xE000000000000000;
  }
  else {
    unint64_t v3 = 0xE400000000000000;
  }
  unint64_t v4 = v3;
  String.append(_:)(*(Swift::String *)&v2);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x6C62616C69617661;
  v5._object = (void *)0xEA00000000002E65;
  String.append(_:)(v5);
  sub_10000C6BC(0xD000000000000010, 0x80000001000173C0);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000D47C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CC38(*(void *)v1, *(void **)(v1 + 8), *(void *)(v1 + 24), a1);
}

uint64_t sub_10000D488@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  v30[0] = a1;
  v30[1] = a4;
  uint64_t v6 = sub_1000056DC(&qword_100021B80);
  __chkstk_darwin(v6);
  id v8 = (uint64_t (**)())((char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = type metadata accessor for CarView(0);
  __chkstk_darwin(v9 - 8);
  id v11 = (void *)((char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = sub_1000056DC(&qword_100021B88);
  uint64_t v13 = __chkstk_darwin(v12);
  long long v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  char v17 = (char *)v30 - v16;
  id v18 = a2;
  char v19 = (void *)CAFCarObservable.observed.getter();

  unsigned int v20 = [v19 isConfigured];
  if (v20 && a3)
  {
    id v21 = v18;
    id v22 = a3;
    uint64_t v23 = (void *)CAFCarObservable.observed.getter();

    id v24 = v22;
    sub_10000D7CC(v23, v24, v11);
    sub_100012AE8((uint64_t)v11, (uint64_t)v15);
    uint64_t v25 = (uint64_t (**)())&v15[*(int *)(v12 + 36)];
    *uint64_t v25 = sub_10000DC88;
    v25[1] = 0;
    v25[2] = 0;
    v25[3] = 0;
    sub_100012B4C((uint64_t)v11);
    sub_10000B728((uint64_t)v15, (uint64_t)v17, &qword_100021B88);
    sub_10000B418((uint64_t)v17, (uint64_t)v8, &qword_100021B88);
    swift_storeEnumTagMultiPayload();
    sub_1000056DC(&qword_100021B38);
    sub_100012A3C();
    sub_100012664(&qword_100021B50, &qword_100021B38, (void (*)(void))sub_1000126E4);
    _ConditionalContent<>.init(storage:)();

    return sub_10000B78C((uint64_t)v17, &qword_100021B88);
  }
  else
  {
    uint64_t v27 = (uint64_t (*)())swift_allocObject();
    *((void *)v27 + 2) = v30[0];
    *((void *)v27 + 3) = v18;
    *((void *)v27 + 4) = a3;
    *id v8 = sub_100012A30;
    v8[1] = v27;
    v8[2] = 0;
    v8[3] = 0;
    swift_storeEnumTagMultiPayload();
    id v28 = a3;
    id v29 = v18;
    sub_1000056DC(&qword_100021B38);
    sub_100012A3C();
    sub_100012664(&qword_100021B50, &qword_100021B38, (void (*)(void))sub_1000126E4);
    return _ConditionalContent<>.init(storage:)();
  }
}

void sub_10000D7CC(void *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v39 = sub_1000056DC(&qword_100021BA0);
  uint64_t v6 = __chkstk_darwin(v39);
  uint64_t v41 = (uint64_t)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  unint64_t v40 = (char *)&v33 - v8;
  uint64_t v9 = type metadata accessor for CAUResource();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v37 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  long long v15 = (char *)&v33 - v14;
  __chkstk_darwin(v13);
  char v17 = (char *)&v33 - v16;
  uint64_t v18 = type metadata accessor for CarView(0);
  char v19 = (char *)a3 + *(int *)(v18 + 36);
  char v43 = 0;
  State.init(wrappedValue:)();
  uint64_t v20 = v45;
  *char v19 = v44;
  *((void *)v19 + 1) = v20;
  uint64_t v38 = v18;
  *(void *)((char *)a3 + *(int *)(v18 + 32)) = a1;
  char v42 = a3;
  a3[2] = a2;
  id v21 = *(void (**)(char *, void, uint64_t))(v10 + 104);
  v21(v17, enum case for CAUResource.topDownExteriorClosuresOverlay(_:), v9);
  id v34 = a1;
  id v22 = a2;
  uint64_t v23 = (void *)CAUAssetLibrary.asset(for:)();
  id v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  v24(v17, v9);
  *char v42 = v23;
  v21(v15, enum case for CAUResource.topDownInterior(_:), v9);
  id v36 = v23;
  id v35 = v23;
  uint64_t v25 = (void *)CAUAssetLibrary.asset(for:)();
  v24(v15, v9);
  v42[1] = v25;
  uint64_t v26 = v37;
  v21(v37, enum case for CAUResource.vehicleLayout(_:), v9);
  uint64_t v27 = v26;
  sub_100012BA8();
  id v28 = v25;
  uint64_t v29 = (uint64_t)v40;
  dispatch thunk of CAUAssetLibrary.asset<A>(for:)();
  v24(v27, v9);
  uint64_t v30 = (uint64_t)v42 + *(int *)(v38 + 28);
  sub_10000B728(v29, v30, &qword_100021BA0);

  if (v36)
  {

    if (v25) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_10000C5B8(0xD000000000000028, 0x8000000100017510);

    if (v25) {
      goto LABEL_3;
    }
  }
  sub_10000C5B8(0xD000000000000028, 0x80000001000174E0);
LABEL_3:
  uint64_t v31 = v41;
  sub_10000B418(v30, v41, &qword_100021BA0);
  uint64_t v32 = type metadata accessor for CAUVehicleLayout();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 48))(v31, 1, v32) == 1)
  {
    sub_10000B78C(v31, &qword_100021BA0);
    sub_10000C5B8(0xD00000000000003ELL, 0x80000001000174A0);
  }
  else
  {

    sub_10000B78C(v31, &qword_100021BA0);
  }
}

uint64_t sub_10000DC88()
{
  return sub_10000C6BC(0xD00000000000002BLL, 0x8000000100017470);
}

uint64_t sub_10000DCA4(uint64_t a1, void *a2, uint64_t a3)
{
  sub_10000C6BC(0xD000000000000028, 0x8000000100017540);
  _StringGuts.grow(_:)(20);
  swift_bridgeObjectRelease();
  id v5 = a2;
  uint64_t v6 = (void *)CAFCarObservable.observed.getter();

  unsigned int v7 = [v6 isConfigured];
  if (v7) {
    uint64_t v8 = 544501614;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v7) {
    unint64_t v9 = 0xE400000000000000;
  }
  else {
    unint64_t v9 = 0xE000000000000000;
  }
  unint64_t v10 = v9;
  String.append(_:)(*(Swift::String *)&v8);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0x72756769666E6F63;
  v11._object = (void *)0xEB000000002E6465;
  String.append(_:)(v11);
  sub_10000C6BC(0x20736920726143, 0xE700000000000000);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(28);
  swift_bridgeObjectRelease();
  if (a3) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 544501614;
  }
  if (a3) {
    unint64_t v13 = 0xE000000000000000;
  }
  else {
    unint64_t v13 = 0xE400000000000000;
  }
  unint64_t v14 = v13;
  String.append(_:)(*(Swift::String *)&v12);
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 0x6C62616C69617661;
  v15._object = (void *)0xEA00000000002E65;
  String.append(_:)(v15);
  sub_10000C6BC(0xD000000000000010, 0x8000000100017570);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000DE58@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D488(*(void *)v1, *(void **)(v1 + 8), *(void **)(v1 + 16), a1);
}

double sub_10000DE64@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for CarView(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v6 = *v1;
  if (*v1)
  {
    sub_100012AE8((uint64_t)v1, (uint64_t)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v6;
    sub_100013BD8((uint64_t)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + ((v7 + 24) & ~v7));
    sub_100012AE8((uint64_t)v1, (uint64_t)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v9 = swift_allocObject();
    sub_100013BD8((uint64_t)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + ((v7 + 16) & ~v7));
    uint64_t v16 = sub_100013C3C;
    *(void *)&long long v17 = v8;
    *((void *)&v17 + 1) = sub_100013E30;
    long long v18 = (unint64_t)v9;
    uint64_t v19 = 0;
    char v20 = 0;
    id v10 = v6;
  }
  else
  {
    uint64_t v16 = sub_10000FAA8;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v19 = 0;
    char v20 = 1;
  }
  sub_1000056DC(&qword_100021CC0);
  sub_1000056DC(&qword_100021B38);
  sub_1000139C0();
  sub_100012664(&qword_100021B50, &qword_100021B38, (void (*)(void))sub_1000126E4);
  _ConditionalContent<>.init(storage:)();
  double result = *(double *)&v21;
  long long v12 = v22;
  long long v13 = v23;
  char v14 = v24;
  *(_OWORD *)a1 = v21;
  *(_OWORD *)(a1 + 16) = v12;
  *(_OWORD *)(a1 + 32) = v13;
  *(unsigned char *)(a1 + 48) = v14;
  return result;
}

uint64_t sub_10000E084@<X0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  GeometryProxy.size.getter();
  UIImage.fit(to:)();
  long long v10 = v15;
  long long v11 = v14;
  uint64_t v6 = v16;
  *a3 = static Alignment.center.getter();
  a3[1] = v7;
  uint64_t v8 = (uint64_t)a3 + *(int *)(sub_1000056DC(&qword_100021CE8) + 44);
  v12[0] = v11;
  v12[1] = v10;
  uint64_t v13 = v6;
  return sub_10000E124(a1, a2, (double *)v12, v8);
}

uint64_t sub_10000E124@<X0>(void *a1@<X0>, uint64_t a2@<X1>, double *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v112 = a2;
  uint64_t v103 = a4;
  double v5 = *a3;
  double v6 = a3[1];
  uint64_t v7 = *((void *)a3 + 2);
  uint64_t v8 = *((void *)a3 + 3);
  double v9 = a3[4];
  uint64_t v10 = sub_1000056DC(&qword_100021BA0);
  __chkstk_darwin(v10 - 8);
  uint64_t v109 = (uint64_t)&v93 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = type metadata accessor for CAUVehicleLayout();
  uint64_t v110 = *(void *)(v97 - 8);
  uint64_t v12 = __chkstk_darwin(v97);
  CGRect v94 = (char *)&v93 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v95 = (char *)&v93 - v14;
  uint64_t v111 = type metadata accessor for CarView(0);
  uint64_t v105 = *(void *)(v111 - 8);
  __chkstk_darwin(v111);
  uint64_t v106 = v15;
  uint64_t v107 = (uint64_t)&v93 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000056DC(&qword_100021CF0);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v108 = (uint64_t)&v93 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v114 = (uint64_t)&v93 - v19;
  uint64_t v20 = type metadata accessor for Image.Interpolation();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  long long v23 = (char *)&v93 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for Image.ResizingMode();
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v93 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v28 = a1;
  Image.init(uiImage:)();
  uint64_t v29 = *(void (**)(void))(v25 + 104);
  LODWORD(v101) = enum case for Image.ResizingMode.stretch(_:);
  uint64_t v100 = (void (*)(char *, void, uint64_t))v29;
  v29(v27);
  Image.resizable(capInsets:resizingMode:)();
  swift_release();
  uint64_t v30 = *(void (**)(char *, uint64_t))(v25 + 8);
  uint64_t v113 = v24;
  uint64_t v99 = v30;
  v30(v27, v24);
  uint64_t v31 = *(void (**)(void))(v21 + 104);
  LODWORD(v98) = enum case for Image.Interpolation.high(_:);
  uint64_t v96 = (void (*)(char *, void, uint64_t))v31;
  v31(v23);
  uint64_t v32 = Image.interpolation(_:)();
  swift_release();
  uint64_t v33 = *(void (**)(char *, uint64_t))(v21 + 8);
  uint64_t v104 = v20;
  uint64_t v102 = v21 + 8;
  v33(v23, v20);
  uint64_t v34 = static Alignment.center.getter();
  sub_10000ECD0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v120, 0.0, 1, INFINITY, 0, v34, v35, v32, 0, 1);
  swift_release();
  id v36 = *(void **)(v112 + 8);
  if (v36)
  {
    id v37 = v36;
    Image.init(uiImage:)();
    unint64_t v93 = v33;
    uint64_t v38 = v113;
    v100(v27, v101, v113);
    Image.resizable(capInsets:resizingMode:)();
    swift_release();
    v99(v27, v38);
    uint64_t v39 = v104;
    v96(v23, v98, v104);
    uint64_t v113 = Image.interpolation(_:)();
    swift_release();

    v93(v23, v39);
    LODWORD(v102) = 1;
  }
  else
  {
    uint64_t v113 = 0;
    LODWORD(v102) = 0;
  }
  uint64_t v40 = v112;
  uint64_t v41 = *(int *)(v111 + 32);
  id v42 = [*(id *)(v112 + v41) closure];
  if (v42)
  {
    char v43 = v42;
    id v44 = [v42 closureStates];
    sub_100005720(0, &qword_100021D08);
    uint64_t v45 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    *(void *)&v117[0] = v45;
    uint64_t v46 = v107;
    sub_100012AE8(v40, v107);
    unint64_t v47 = (*(unsigned __int8 *)(v105 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v105 + 80);
    uint64_t v48 = (double *)swift_allocObject();
    v48[2] = v5;
    v48[3] = v6;
    *((void *)v48 + 4) = v7;
    *((void *)v48 + 5) = v8;
    v48[6] = v9;
    sub_100013BD8(v46, (uint64_t)v48 + v47);
    sub_1000056DC(&qword_100021D10);
    type metadata accessor for UUID();
    type metadata accessor for DoorView(0);
    sub_10000BE10(&qword_100021D18, &qword_100021D10);
    sub_100012738(&qword_100021D20, (void (*)(uint64_t))type metadata accessor for DoorView);
    sub_10000A5D4(&qword_100021D28, &qword_100021D08);
    uint64_t v49 = v114;
    uint64_t v40 = v112;
    ForEach<>.init(_:content:)();

    uint64_t v50 = sub_1000056DC(&qword_100021CF8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v49, 0, 1, v50);
  }
  else
  {
    sub_10000C6BC(0xD00000000000001DLL, 0x80000001000175C0);
    uint64_t v51 = sub_1000056DC(&qword_100021CF8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v114, 1, 1, v51);
  }
  uint64_t v52 = v109;
  uint64_t v53 = v110;
  id v54 = [*(id *)(v40 + v41) seat];
  if (v54)
  {
    char v55 = v54;
    sub_10000B418(v40 + *(int *)(v111 + 28), v52, &qword_100021BA0);
    uint64_t v56 = v97;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v52, 1, v97) != 1)
    {
      double v59 = v95;
      (*(void (**)(char *, uint64_t, uint64_t))(v53 + 32))(v95, v52, v56);
      id v60 = [v55 seatBelts];
      sub_100005720(0, &qword_100021870);
      unint64_t v61 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v62 = (uint64_t)v94;
      (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v94, v59, v56);
      sub_100009934(v61, v62, (uint64_t)v119, v5, v6, v9);
      uint64_t v106 = v119[1];
      uint64_t v107 = v119[0];
      uint64_t v57 = (void (*)(char *, void, uint64_t))v119[3];
      uint64_t v109 = v119[2];
      uint64_t v110 = v119[4];
      uint64_t v104 = v119[6];
      uint64_t v105 = v119[5];
      uint64_t v58 = v119[7];
      uint64_t v111 = v119[9];
      uint64_t v112 = v119[8];
      uint64_t v100 = (void (*)(char *, void, uint64_t))v119[11];
      uint64_t v101 = v119[10];
      uint64_t v98 = v119[13];
      uint64_t v99 = (void (*)(char *, uint64_t))v119[12];

      (*(void (**)(char *, uint64_t))(v53 + 8))(v59, v56);
      goto LABEL_13;
    }

    sub_10000B78C(v52, &qword_100021BA0);
  }
  else
  {
    sub_10000C6BC(0xD00000000000001ALL, 0x80000001000175E0);
  }
  uint64_t v106 = 0;
  uint64_t v107 = 0;
  uint64_t v109 = 0;
  uint64_t v110 = 0;
  uint64_t v57 = 0;
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v58 = 0;
  uint64_t v111 = 0;
  uint64_t v112 = 0;
  uint64_t v100 = 0;
  uint64_t v101 = 0;
  uint64_t v98 = 0;
  uint64_t v99 = 0;
LABEL_13:
  uint64_t v63 = v108;
  sub_10000B418(v114, v108, &qword_100021CF0);
  long long v64 = v125;
  v115[6] = v126;
  v115[7] = v127;
  long long v65 = v121;
  v115[2] = v122;
  long long v66 = v122;
  v115[3] = v123;
  long long v67 = v123;
  v115[4] = v124;
  long long v68 = v124;
  v115[5] = v125;
  v115[0] = v120;
  long long v69 = v120;
  v115[1] = v121;
  long long v70 = v127;
  uint64_t v71 = v103;
  *(_OWORD *)(v103 + 96) = v126;
  *(_OWORD *)(v71 + 112) = v70;
  *(_OWORD *)(v71 + 32) = v66;
  *(_OWORD *)(v71 + 48) = v67;
  *(_OWORD *)(v71 + 64) = v68;
  *(_OWORD *)(v71 + 80) = v64;
  uint64_t v72 = v128;
  uint64_t v116 = v128;
  *(_OWORD *)uint64_t v71 = v69;
  *(_OWORD *)(v71 + 16) = v65;
  uint64_t v73 = v113;
  *(void *)(v71 + 128) = v72;
  *(void *)(v71 + 136) = v73;
  *(void *)(v71 + 144) = 0;
  *(_WORD *)(v71 + 152) = v102;
  uint64_t v74 = sub_1000056DC(&qword_100021D00);
  sub_10000B418(v63, v71 + *(int *)(v74 + 64), &qword_100021CF0);
  uint64_t v75 = (void *)(v71 + *(int *)(v74 + 80));
  uint64_t v76 = v106;
  *uint64_t v75 = v107;
  v75[1] = v76;
  uint64_t v78 = v109;
  uint64_t v77 = v110;
  v75[2] = v109;
  v75[3] = v57;
  uint64_t v109 = v78;
  uint64_t v110 = v77;
  uint64_t v96 = v57;
  uint64_t v97 = v58;
  uint64_t v79 = v105;
  v75[4] = v77;
  v75[5] = v79;
  v75[6] = v104;
  v75[7] = v58;
  uint64_t v81 = v111;
  uint64_t v80 = v112;
  v75[8] = v112;
  v75[9] = v81;
  uint64_t v111 = v81;
  uint64_t v112 = v80;
  uint64_t v82 = (void (*)(void, void, void))v100;
  v75[10] = v101;
  v75[11] = v82;
  uint64_t v83 = v98;
  v75[12] = v99;
  v75[13] = v83;
  sub_100013E90((uint64_t)v115);
  swift_retain();
  uint64_t v85 = v106;
  uint64_t v84 = v107;
  uint64_t v86 = v78;
  uint64_t v87 = (uint64_t)v57;
  uint64_t v88 = v77;
  uint64_t v89 = v104;
  uint64_t v90 = v105;
  uint64_t v91 = v97;
  sub_100013EBC(v107, v106, v86, v87, v88, v105, v104, v97);
  sub_10000B78C(v114, &qword_100021CF0);
  sub_100013F20(v84, v85, v109, (uint64_t)v96, v110, v90, v89, v91);
  sub_10000B78C(v108, &qword_100021CF0);
  swift_release();
  v117[6] = v126;
  v117[7] = v127;
  uint64_t v118 = v128;
  v117[2] = v122;
  v117[3] = v123;
  v117[4] = v124;
  v117[5] = v125;
  v117[0] = v120;
  v117[1] = v121;
  return sub_100013F84((uint64_t)v117);
}

uint64_t sub_10000ECD0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, __int16 a18)
{
  __int16 v19 = a18;
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
    id v28 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    __int16 v19 = a18;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  *(_OWORD *)(a9 + 72) = v33;
  *(_OWORD *)(a9 + 88) = v34;
  *(_OWORD *)(a9 + 104) = v35;
  *(_OWORD *)(a9 + 120) = v36;
  *(_OWORD *)(a9 + 24) = v30;
  *(_OWORD *)(a9 + 40) = v31;
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = a17;
  *(unsigned char *)(a9 + 16) = v19 & 1;
  *(unsigned char *)(a9 + 17) = HIBYTE(v19) & 1;
  *(_OWORD *)(a9 + 56) = v32;

  return swift_retain();
}

__n128 sub_10000EEB8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    long long v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  sub_10000B418(v13, a9, &qword_100021BB8);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_1000056DC(&qword_100021BC8) + 36));
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

uint64_t sub_10000F078@<X0>(id *a1@<X0>, double *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  double v5 = *a2;
  double v6 = a2[1];
  double v7 = a2[2];
  double v8 = a2[3];
  double v9 = a2[4];
  uint64_t v10 = *(void **)(a3 + 16);
  id v11 = *a1;
  id v12 = v10;

  return sub_10000F108(v11, v12, a4, v5, v6, v7, v8, v9);
}

uint64_t sub_10000F108@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>, double a8@<D4>)
{
  id v89 = a2;
  uint64_t v72 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v71 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v78 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = type metadata accessor for CAUVehicleLayout();
  uint64_t v75 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  long long v70 = (char *)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000056DC(&qword_100021868);
  __chkstk_darwin(v17 - 8);
  uint64_t v77 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_1000056DC(&qword_100021BA0);
  __chkstk_darwin(v82);
  uint64_t v83 = (char *)&v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for CAUResource();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v81 = (char *)&v70 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  long long v26 = (char *)&v70 - v25;
  __chkstk_darwin(v24);
  long long v28 = (char *)&v70 - v27;
  *a3 = swift_getKeyPath();
  sub_1000056DC(&qword_100021D30);
  uint64_t v84 = a3;
  swift_storeEnumTagMultiPayload();
  uint64_t v80 = sub_1000056DC(&qword_100021D38);
  __n128 v29 = &v28[*(int *)(v80 + 48)];
  uint64_t v87 = sub_100005720(0, &qword_100021D08);
  id v88 = a1;
  CAFPositionedRequired.layoutKey.getter();
  uint64_t v30 = enum case for CAUAsset.ClosureMask.State.open(_:);
  uint64_t v31 = type metadata accessor for CAUAsset.ClosureMask.State();
  uint64_t v79 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104);
  v79(v29, v30, v31);
  uint64_t v32 = enum case for CAUResource.closureMask(_:);
  uint64_t v85 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 104);
  uint64_t v86 = v20;
  v85(v28, enum case for CAUResource.closureMask(_:), v20);
  uint64_t v33 = CAUAssetLibrary.asset(for:)();
  long long v34 = *(void (**)(char *, uint64_t))(v21 + 8);
  long long v35 = v28;
  uint64_t v36 = v86;
  uint64_t v73 = v21 + 8;
  v34(v35, v86);
  id v37 = v34;
  uint64_t v74 = type metadata accessor for DoorView(0);
  *(uint64_t *)((char *)v84 + *(int *)(v74 + 24)) = v33;
  uint64_t v38 = &v26[*(int *)(v80 + 48)];
  CAFPositionedRequired.layoutKey.getter();
  v79(v38, enum case for CAUAsset.ClosureMask.State.closed(_:), v31);
  v85(v26, v32, v36);
  uint64_t v39 = CAUAssetLibrary.asset(for:)();
  uint64_t v40 = v84;
  uint64_t v41 = (int *)v74;
  id v42 = v26;
  uint64_t v43 = v86;
  v37(v42, v86);
  *(uint64_t *)((char *)v40 + v41[7]) = v39;
  id v44 = (double *)((char *)v40 + v41[8]);
  *id v44 = a4;
  v44[1] = a5;
  v44[2] = a6;
  v44[3] = a7;
  v44[4] = a8;
  sub_10000A5D4(&qword_100021D40, &qword_100021D08);
  CAFObserved<>.observable.getter();
  uint64_t v45 = v37;
  uint64_t v46 = (uint64_t *)((char *)v40 + v41[5]);
  type metadata accessor for CAFClosureStateObservable();
  sub_100012738(&qword_100021D48, (void (*)(uint64_t))&type metadata accessor for CAFClosureStateObservable);
  uint64_t *v46 = ObservedObject.init(wrappedValue:)();
  v46[1] = v47;
  uint64_t v48 = v81;
  v85(v81, enum case for CAUResource.vehicleLayout(_:), v43);
  sub_100012BA8();
  uint64_t v49 = (uint64_t)v83;
  dispatch thunk of CAUAssetLibrary.asset<A>(for:)();
  v45(v48, v43);
  uint64_t v50 = (uint64_t)v78;
  uint64_t v51 = v76;
  uint64_t v52 = v75;
  uint64_t v53 = (uint64_t)v40 + v41[9];
  sub_10000B728(v49, v53, &qword_100021BA0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v53, 1, v51))
  {

    uint64_t v54 = type metadata accessor for CAUVehicleLayoutInfo();
    uint64_t v55 = (uint64_t)v77;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v77, 1, 1, v54);
  }
  else
  {
    uint64_t v56 = v70;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v70, v53, v51);
    uint64_t v57 = CAUVehicleLayout.infos.getter();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v56, v51);
    id v58 = v88;
    CAFPositionedRequired.layoutKey.getter();
    if (*(void *)(v57 + 16) && (unint64_t v59 = sub_100012290(v50), (v60 & 1) != 0))
    {
      unint64_t v61 = v59;
      uint64_t v62 = *(void *)(v57 + 56);
      uint64_t v63 = type metadata accessor for CAUVehicleLayoutInfo();
      uint64_t v64 = *(void *)(v63 - 8);
      uint64_t v65 = v64;
      uint64_t v66 = v62 + *(void *)(v64 + 72) * v61;
      uint64_t v55 = (uint64_t)v77;
      (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v77, v66, v63);
      uint64_t v67 = v63;
      id v58 = v88;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v65 + 56))(v55, 0, 1, v67);
    }
    else
    {
      uint64_t v68 = type metadata accessor for CAUVehicleLayoutInfo();
      uint64_t v55 = (uint64_t)v77;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v77, 1, 1, v68);
    }

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v50, v72);
  }
  return sub_10000B728(v55, (uint64_t)v40 + v41[10], &qword_100021868);
}

void sub_10000F9C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CarView(0);
  sub_1000056DC(&qword_100021CE0);
  State.wrappedValue.getter();
  if ((v5 & 1) == 0)
  {
    id v3 = [*(id *)(a1 + *(int *)(v2 + 32)) closure];
    if (v3)
    {
      uint64_t v4 = v3;
      if ([v3 receivedAllValues])
      {
        CAFSignpostEmit_Finalized();
        State.wrappedValue.setter();
      }
    }
  }
}

uint64_t sub_10000FAA8()
{
  return sub_10000C6BC(0xD00000000000001FLL, 0x8000000100017600);
}

uint64_t sub_10000FAC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v35 = a1;
  uint64_t v34 = sub_1000056DC(&qword_100021E28);
  __chkstk_darwin(v34);
  uint64_t v4 = (uint64_t *)((char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_1000056DC(&qword_100021E30);
  __chkstk_darwin(v5);
  double v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Image.Interpolation();
  uint64_t v32 = *(void *)(v8 - 8);
  uint64_t v33 = v8;
  __chkstk_darwin(v8);
  uint64_t v31 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Image.ResizingMode();
  uint64_t v30 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DoorView(0);
  id v14 = *(id *)(v1 + *(int *)(v13 + 20) + 8);
  uint64_t v15 = (void *)CAFClosureStateObservable.observed.getter();

  unsigned __int8 v16 = [v15 latchStateInvalid];
  if (v16)
  {
    *uint64_t v4 = static Alignment.center.getter();
    v4[1] = v17;
    uint64_t v18 = sub_1000056DC(&qword_100021E60);
    sub_10000FF3C(v2, (uint64_t)v4 + *(int *)(v18 + 44));
    sub_10000B418((uint64_t)v4, (uint64_t)v7, &qword_100021E28);
    swift_storeEnumTagMultiPayload();
    sub_1000056DC(&qword_100021E38);
    sub_100015B0C();
    sub_10000BE10(&qword_100021E58, &qword_100021E28);
    _ConditionalContent<>.init(storage:)();
    return sub_10000B78C((uint64_t)v4, &qword_100021E28);
  }
  else
  {
    id v20 = v14;
    char v21 = dispatch thunk of CAFClosureStateObservable.latchState.getter();

    uint64_t v22 = 28;
    if (v21) {
      uint64_t v22 = 24;
    }
    uint64_t v23 = *(void **)(v2 + *(int *)(v13 + v22));
    if (v23)
    {
      id v24 = v23;
      Image.init(uiImage:)();
      uint64_t v25 = v30;
      (*(void (**)(char *, void, uint64_t))(v30 + 104))(v12, enum case for Image.ResizingMode.stretch(_:), v10);
      Image.resizable(capInsets:resizingMode:)();
      swift_release();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v10);
      uint64_t v27 = v31;
      uint64_t v26 = v32;
      uint64_t v28 = v33;
      (*(void (**)(char *, void, uint64_t))(v32 + 104))(v31, enum case for Image.Interpolation.high(_:), v33);
      uint64_t v29 = Image.interpolation(_:)();
      swift_release();

      (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
      LOWORD(v23) = 1;
    }
    else
    {
      uint64_t v29 = 0;
    }
    *(void *)double v7 = v29;
    *((void *)v7 + 1) = 0;
    *((_WORD *)v7 + 8) = (_WORD)v23;
    swift_storeEnumTagMultiPayload();
    sub_1000056DC(&qword_100021E38);
    sub_100015B0C();
    sub_10000BE10(&qword_100021E58, &qword_100021E28);
    return _ConditionalContent<>.init(storage:)();
  }
}

uint64_t sub_10000FF3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v99 = a2;
  uint64_t v88 = sub_1000056DC(&qword_100021E68);
  __chkstk_darwin(v88);
  uint64_t v4 = (uint64_t *)&v77[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for Image.Scale();
  uint64_t v90 = *(void *)(v5 - 8);
  uint64_t v91 = v5;
  __chkstk_darwin(v5);
  id v89 = &v77[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_1000056DC(&qword_100021A20);
  __chkstk_darwin(v7 - 8);
  uint64_t v84 = &v77[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_1000056DC(&qword_100021E70);
  __chkstk_darwin(v9 - 8);
  uint64_t v83 = &v77[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v85 = sub_1000056DC(&qword_100021E78);
  __chkstk_darwin(v85);
  uint64_t v87 = (uint64_t *)&v77[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_1000056DC(&qword_100021E80);
  uint64_t v97 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v86 = &v77[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = type metadata accessor for ColorScheme();
  uint64_t v95 = *(void *)(v14 - 8);
  uint64_t v96 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  CGRect v94 = &v77[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v15);
  unint64_t v93 = &v77[-v17];
  uint64_t v18 = sub_1000056DC(&qword_100021E88);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  uint64_t v100 = &v77[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v19);
  uint64_t v101 = &v77[-v21];
  uint64_t v22 = type metadata accessor for Image.Interpolation();
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v25 = &v77[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v26 = type metadata accessor for Image.ResizingMode();
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t KeyPath = &v77[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v30 = *(void **)(a1 + *(int *)(type metadata accessor for DoorView(0) + 28));
  uint64_t v92 = v4;
  uint64_t v98 = v12;
  if (v30)
  {
    id v31 = v30;
    Image.init(uiImage:)();
    (*(void (**)(unsigned char *, void, uint64_t))(v27 + 104))(KeyPath, enum case for Image.ResizingMode.stretch(_:), v26);
    Image.resizable(capInsets:resizingMode:)();
    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(v27 + 8))(KeyPath, v26);
    (*(void (**)(unsigned char *, void, uint64_t))(v23 + 104))(v25, enum case for Image.Interpolation.high(_:), v22);
    uint64_t v32 = Image.interpolation(_:)();
    swift_release();

    (*(void (**)(unsigned char *, uint64_t))(v23 + 8))(v25, v22);
    LODWORD(KeyPath) = 1;
  }
  else
  {
    uint64_t v32 = 0;
    LODWORD(KeyPath) = 0;
  }
  uint64_t v33 = v101;
  uint64_t v34 = v95;
  uint64_t v35 = sub_100010960();
  if (v37)
  {
    uint64_t v45 = 1;
    uint64_t v46 = v98;
    uint64_t v47 = v99;
    uint64_t v48 = v97;
  }
  else
  {
    uint64_t v80 = v36;
    uint64_t v81 = v35;
    int v82 = (int)KeyPath;
    uint64_t v38 = v93;
    sub_100011FD4((uint64_t)v93);
    uint64_t v39 = *(void (**)(unsigned char *))(v34 + 104);
    uint64_t v40 = v94;
    unsigned int v78 = enum case for ColorScheme.dark(_:);
    uint64_t v41 = v96;
    v39(v94);
    char v42 = static ColorScheme.== infix(_:_:)();
    uint64_t v43 = *(void (**)(unsigned char *, uint64_t))(v34 + 8);
    v43(v40, v41);
    v43(v38, v41);
    if (v42) {
      uint64_t v44 = static Color.black.getter();
    }
    else {
      uint64_t v44 = static Color.white.getter();
    }
    uint64_t v95 = v44;
    uint64_t v49 = static Color.blue.getter();
    uint64_t v50 = v93;
    sub_100011FD4((uint64_t)v93);
    uint64_t v51 = v94;
    uint64_t v52 = v96;
    ((void (*)(unsigned char *, void, uint64_t))v39)(v94, v78, v96);
    char v53 = static ColorScheme.== infix(_:_:)();
    v43(v51, v52);
    v43(v50, v52);
    uint64_t v47 = v99;
    if (v53) {
      uint64_t v54 = static Color.white.getter();
    }
    else {
      uint64_t v54 = static Color.black.getter();
    }
    uint64_t v55 = v54;
    Image.init(systemName:)();
    CGRect v94 = (unsigned char *)v32;
    uint64_t v56 = (uint64_t)v83;
    static SymbolRenderingMode.palette.getter();
    uint64_t v57 = type metadata accessor for SymbolRenderingMode();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v56, 0, 1, v57);
    uint64_t v96 = Image.symbolRenderingMode(_:)();
    swift_release();
    sub_10000B78C(v56, &qword_100021E70);
    uint64_t v58 = v95;
    swift_retain();
    uint64_t v79 = v49;
    swift_retain();
    swift_retain();
    static Font.Weight.medium.getter();
    uint64_t v59 = type metadata accessor for Font.Design();
    uint64_t v60 = (uint64_t)v84;
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v84, 1, 1, v59);
    uint64_t v61 = static Font.system(size:weight:design:)();
    sub_10000B78C(v60, &qword_100021A20);
    uint64_t KeyPath = (unsigned char *)swift_getKeyPath();
    uint64_t v63 = v89;
    uint64_t v62 = v90;
    uint64_t v64 = v91;
    (*(void (**)(unsigned char *, void, uint64_t))(v90 + 104))(v89, enum case for Image.Scale.large(_:), v91);
    uint64_t v65 = swift_getKeyPath();
    uint64_t v66 = *(int *)(v88 + 28);
    uint64_t v95 = v58;
    uint64_t v67 = v92;
    (*(void (**)(char *, unsigned char *, uint64_t))(v62 + 16))((char *)v92 + v66, v63, v64);
    *uint64_t v67 = v65;
    uint64_t v68 = v55;
    long long v69 = v87;
    sub_10000B418((uint64_t)v67, (uint64_t)v87 + *(int *)(v85 + 36), &qword_100021E68);
    *long long v69 = v96;
    v69[1] = v58;
    v69[2] = v79;
    v69[3] = v68;
    v69[4] = (uint64_t)KeyPath;
    v69[5] = v61;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_10000B78C((uint64_t)v67, &qword_100021E68);
    (*(void (**)(unsigned char *, uint64_t))(v62 + 8))(v63, v64);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    long long v70 = v86;
    sub_10000B418((uint64_t)v69, (uint64_t)v86, &qword_100021E78);
    uint64_t v46 = v98;
    uint64_t v71 = (uint64_t *)&v70[*(int *)(v98 + 36)];
    uint64_t v72 = v80;
    *uint64_t v71 = v81;
    v71[1] = v72;
    sub_10000B78C((uint64_t)v69, &qword_100021E78);
    uint64_t v73 = (uint64_t)v70;
    uint64_t v32 = (uint64_t)v94;
    uint64_t v33 = v101;
    sub_10000B728(v73, (uint64_t)v101, &qword_100021E80);
    uint64_t v45 = 0;
    uint64_t v48 = v97;
    LOWORD(KeyPath) = v82;
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v48 + 56))(v33, v45, 1, v46);
  uint64_t v74 = v100;
  sub_10000B418((uint64_t)v33, (uint64_t)v100, &qword_100021E88);
  *(void *)uint64_t v47 = v32;
  *(void *)(v47 + 8) = 0;
  *(_WORD *)(v47 + 16) = (_WORD)KeyPath;
  uint64_t v75 = sub_1000056DC(&qword_100021E90);
  sub_10000B418((uint64_t)v74, v47 + *(int *)(v75 + 48), &qword_100021E88);
  swift_retain();
  sub_10000B78C((uint64_t)v33, &qword_100021E88);
  sub_10000B78C((uint64_t)v74, &qword_100021E88);
  return swift_release();
}

uint64_t sub_100010960()
{
  uint64_t v1 = v0;
  uint64_t v88 = type metadata accessor for CAUVehicleLayoutKey.Side();
  uint64_t v92 = *(void **)(v88 - 8);
  uint64_t v2 = __chkstk_darwin(v88);
  uint64_t v87 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v91 = (char *)&v77 - v4;
  uint64_t v5 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v95 = *(void *)(v5 - 8);
  uint64_t v96 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v86 = (char *)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v93 = (char *)&v77 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v77 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v77 - v13;
  uint64_t v15 = sub_1000056DC(&qword_100021868);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000056DC(&qword_100021E98);
  __chkstk_darwin(v18 - 8);
  CGRect v94 = (char *)&v77 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for CAUBaselineAnchor();
  uint64_t v89 = *(void *)(v20 - 8);
  uint64_t v90 = v20;
  __chkstk_darwin(v20);
  uint64_t v84 = (char *)&v77 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1000056DC(&qword_100021BA0);
  __chkstk_darwin(v22 - 8);
  uint64_t v24 = (char *)&v77 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for CAUVehicleLayout();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v77 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for DoorView(0);
  sub_10000B418(v1 + *(int *)(v29 + 36), (uint64_t)v24, &qword_100021BA0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) == 1)
  {
    sub_10000B78C((uint64_t)v24, &qword_100021BA0);
    double v30 = 0.0;
    return *(void *)&v30;
  }
  id v31 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
  uint64_t v82 = v25;
  v31(v28, v24, v25);
  uint64_t v78 = v29;
  id v32 = *(id *)(v1 + *(int *)(v29 + 20) + 8);
  uint64_t v33 = (void *)CAFClosureStateObservable.observed.getter();

  uint64_t v34 = CAUVehicleLayout.infos.getter();
  uint64_t v80 = sub_100005720(0, &qword_100021D08);
  id v85 = v33;
  CAFPositionedRequired.layoutKey.getter();
  uint64_t v35 = *(void *)(v34 + 16);
  uint64_t v36 = v14;
  uint64_t v83 = v1;
  uint64_t v81 = v12;
  if (v35)
  {
    unint64_t v37 = sub_100012290((uint64_t)v14);
    uint64_t v38 = v95;
    if (v39)
    {
      unint64_t v40 = v37;
      uint64_t v79 = *(void (**)(char *, uint64_t))(v34 + 56);
      uint64_t v41 = type metadata accessor for CAUVehicleLayoutInfo();
      uint64_t v42 = *(void *)(v41 - 8);
      (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v17, (char *)v79 + *(void *)(v42 + 72) * v40, v41);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v17, 0, 1, v41);
    }
    else
    {
      uint64_t v41 = type metadata accessor for CAUVehicleLayoutInfo();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v17, 1, 1, v41);
    }
  }
  else
  {
    uint64_t v41 = type metadata accessor for CAUVehicleLayoutInfo();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v17, 1, 1, v41);
    uint64_t v38 = v95;
  }
  swift_bridgeObjectRelease();
  uint64_t v79 = *(void (**)(char *, uint64_t))(v38 + 8);
  v79(v36, v96);
  type metadata accessor for CAUVehicleLayoutInfo();
  uint64_t v43 = *(void *)(v41 - 8);
  int v44 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v43 + 48))(v17, 1, v41);
  uint64_t v45 = (uint64_t)v94;
  if (v44 == 1)
  {
    sub_10000B78C((uint64_t)v17, &qword_100021868);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v89 + 56))(v45, 1, 1, v90);
    uint64_t v47 = v91;
    uint64_t v46 = v92;
    uint64_t v48 = v93;
  }
  else
  {
    CAUVehicleLayoutInfo.baselineAnchor.getter();
    uint64_t v45 = (uint64_t)v94;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v17, v41);
    uint64_t v50 = v89;
    uint64_t v49 = v90;
    int v51 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v89 + 48))(v45, 1, v90);
    uint64_t v47 = v91;
    uint64_t v46 = v92;
    uint64_t v48 = v93;
    if (v51 != 1)
    {
      uint64_t v67 = v84;
      (*(void (**)(char *, uint64_t, uint64_t))(v50 + 32))(v84, v45, v49);
      double v68 = *(double *)(v83 + *(int *)(v78 + 32) + 32) * (double)(int)CAUBaselineAnchor.x.getter()
          + *(double *)(v83 + *(int *)(v78 + 32));
      CAUBaselineAnchor.y.getter();

      (*(void (**)(char *, uint64_t))(v50 + 8))(v67, v49);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v82);
      double v30 = v68;
      return *(void *)&v30;
    }
  }
  sub_10000B78C(v45, &qword_100021E98);
  char v97 = 1;
  uint64_t v52 = v81;
  id v53 = v85;
  CAFPositionedRequired.layoutKey.getter();
  uint64_t v54 = v96;
  int v55 = (*(uint64_t (**)(char *, uint64_t))(v38 + 88))(v52, v96);
  if (v55 == enum case for CAUVehicleLayoutKey.frunk(_:)
    || v55 == enum case for CAUVehicleLayoutKey.hood(_:)
    || v55 == enum case for CAUVehicleLayoutKey.trunk(_:))
  {
    double v30 = COERCE_DOUBLE(sub_1000116D8());
    char v66 = v65;

    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v82);
    char v97 = v66 & 1;
    return *(void *)&v30;
  }
  uint64_t v56 = *(void **)(v38 + 16);
  CGRect v94 = v28;
  uint64_t v95 = v38 + 16;
  uint64_t v92 = v56;
  ((void (*)(char *, char *, uint64_t))v56)(v48, v52, v54);
  CAUVehicleLayoutKey.side.getter();
  uint64_t v58 = v87;
  uint64_t v57 = v88;
  uint64_t v91 = (char *)v46[13];
  ((void (*)(char *, void, uint64_t))v91)(v87, enum case for CAUVehicleLayoutKey.Side.left(_:), v88);
  char v59 = static CAUVehicleLayoutKey.Side.== infix(_:_:)();
  uint64_t v60 = (void (*)(char *, uint64_t))v46[1];
  v60(v58, v57);
  v60(v47, v57);
  if (v59)
  {
    double v30 = COERCE_DOUBLE(sub_1000114D8());
    char v62 = v61;

    uint64_t v63 = v96;
    uint64_t v64 = v79;
    v79(v93, v96);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v94, v82);
    char v97 = v62 & 1;
    if ((v62 & 1) == 0) {
      double v30 = v30 + -36.0;
    }
    v64(v52, v63);
    return *(void *)&v30;
  }
  uint64_t v69 = v96;
  v79(v93, v96);
  ((void (*)(char *, char *, uint64_t))v92)(v86, v52, v69);
  uint64_t v70 = v57;
  CAUVehicleLayoutKey.side.getter();
  ((void (*)(char *, void, uint64_t))v91)(v58, enum case for CAUVehicleLayoutKey.Side.right(_:), v57);
  char v71 = static CAUVehicleLayoutKey.Side.== infix(_:_:)();
  v60(v58, v70);
  v60(v47, v70);
  if (v71)
  {
    double v30 = COERCE_DOUBLE(sub_1000114D8());
    char v73 = v72;

    uint64_t v74 = v96;
    uint64_t v75 = v79;
    v79(v86, v96);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v94, v82);
    char v97 = v73 & 1;
    if ((v73 & 1) == 0) {
      double v30 = v30 + 36.0;
    }
    v75(v81, v74);
    return *(void *)&v30;
  }
  v79(v86, v96);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000114D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000056DC(&qword_100021868);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CAUVehicleLayoutInfo();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DoorView(0);
  sub_10000B418(v1 + *(int *)(v9 + 40), (uint64_t)v4, &qword_100021868);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_10000B78C((uint64_t)v4, &qword_100021868);
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    CAUVehicleLayoutInfo.y.getter();
    CAUVehicleLayoutInfo.height.getter();
    uint64_t v11 = (double *)(v1 + *(int *)(v9 + 32));
    double v12 = (double)(int)CAUVehicleLayoutInfo.x.getter();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(double *)&uint64_t result = v11[4] * v12 + *v11;
  }
  return result;
}

uint64_t sub_1000116D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000056DC(&qword_100021868);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CAUVehicleLayoutInfo();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DoorView(0);
  sub_10000B418(v1 + *(int *)(v9 + 40), (uint64_t)v4, &qword_100021868);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_10000B78C((uint64_t)v4, &qword_100021868);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    double v11 = (double)(int)CAUVehicleLayoutInfo.x.getter();
    double v12 = *(double *)(v1 + *(int *)(v9 + 32))
        + *(double *)(v1 + *(int *)(v9 + 32) + 32) * ((double)(int)CAUVehicleLayoutInfo.width.getter() * 0.5 + v11);
    CAUVehicleLayoutInfo.y.getter();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return *(void *)&v12;
  }
}

uint64_t sub_1000118E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v39 = sub_1000056DC(&qword_100021BD0);
  uint64_t v38 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  unint64_t v37 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000056DC(&qword_100021BD8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = type metadata accessor for Image.Interpolation();
  uint64_t v5 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Image.ResizingMode();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  double v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_1000056DC(&qword_100021BE0);
  __chkstk_darwin(v36);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000056DC(&qword_100021BE8);
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
    long long v46 = xmmword_100018B80;
    long long v47 = xmmword_100018B90;
    long long v48 = xmmword_100018BA0;
    long long v49 = xmmword_100018BB0;
    long long v50 = xmmword_100018BC0;
    uint64_t v21 = v37;
    View._colorMatrix(_:)();
    uint64_t v22 = v38;
    uint64_t v23 = v39;
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v4, v21, v39);
    uint64_t v24 = &v4[*(int *)(sub_1000056DC(&qword_100021BF0) + 36)];
    *(void *)uint64_t v24 = 0x403E000000000000;
    v24[8] = 0;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v21, v23);
    sub_10000B418((uint64_t)v4, (uint64_t)&v13[*(int *)(v36 + 36)], &qword_100021BD8);
    *(void *)uint64_t v13 = v20;
    *((void *)v13 + 1) = 0;
    *((_WORD *)v13 + 8) = 1;
    sub_10000B78C((uint64_t)v4, &qword_100021BD8);
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    sub_10000B418((uint64_t)v13, (uint64_t)v16, &qword_100021BE0);

    uint64_t v25 = v41;
    uint64_t v26 = &v16[*(int *)(v41 + 36)];
    long long v27 = v44;
    *(_OWORD *)uint64_t v26 = v43;
    *((_OWORD *)v26 + 1) = v27;
    *((_OWORD *)v26 + 2) = v45;
    sub_10000B78C((uint64_t)v13, &qword_100021BE0);
    uint64_t v28 = v42;
    sub_10000B728((uint64_t)v16, v42, &qword_100021BE8);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v28, 0, 1, v25);
  }
  else
  {
    uint64_t v30 = v41;
    id v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 56);
    uint64_t v32 = v42;
    return v31(v32, 1, 1, v30);
  }
}

uint64_t sub_100011EDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000056DC(&qword_100021BB8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (uint64_t *)((char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v4 = static Alignment.center.getter();
  v4[1] = v5;
  uint64_t v6 = sub_1000056DC(&qword_100021BC0);
  sub_1000118E0((uint64_t)v4 + *(int *)(v6 + 44));
  static Alignment.center.getter();
  sub_10000EEB8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, INFINITY, 0);
  return sub_10000B78C((uint64_t)v4, &qword_100021BB8);
}

uint64_t sub_100011FD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000056DC(&qword_100021D30);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B418(v2, (uint64_t)v10, &qword_100021D30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for ColorScheme();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = static os_log_type_t.fault.getter();
    uint64_t v14 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v18[2] = sub_10000BF60(0x686353726F6C6F43, 0xEB00000000656D65, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

unint64_t sub_100012290(uint64_t a1)
{
  type metadata accessor for CAUVehicleLayoutKey();
  sub_100012738(&qword_1000218D0, (void (*)(uint64_t))&type metadata accessor for CAUVehicleLayoutKey);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_100012328(a1, v2);
}

unint64_t sub_100012328(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    os_log_type_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_100012738(&qword_100021D50, (void (*)(uint64_t))&type metadata accessor for CAUVehicleLayoutKey);
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

uint64_t sub_1000124E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100012514()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100012540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  unint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

unint64_t sub_100012610()
{
  unint64_t result = qword_100021B48;
  if (!qword_100021B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021B48);
  }
  return result;
}

uint64_t sub_100012664(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000A618(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000126E4()
{
  unint64_t result = qword_100021B58;
  if (!qword_100021B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021B58);
  }
  return result;
}

uint64_t sub_100012738(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for RedactedCarView()
{
  return &type metadata for RedactedCarView;
}

void *initializeBufferWithCopyOfBuffer for CarObservingView(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
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
  uint64_t v2 = *(void **)(a1 + 16);
}

void *assignWithCopy for CarObservingView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = (void *)a2[1];
  id v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  uint64_t v7 = (void *)a1[2];
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

uint64_t sub_10001295C()
{
  return sub_10000BE10(&qword_100021B78, &qword_100021B28);
}

uint64_t sub_100012998(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_10001927C, 1);
}

uint64_t sub_1000129B4(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100019254, 1);
}

uint64_t type metadata accessor for CarView(uint64_t a1)
{
  return sub_1000141D0(a1, (uint64_t *)&unk_100021C50);
}

uint64_t sub_1000129F0()
{
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100012A30()
{
  return sub_10000DCA4(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32));
}

unint64_t sub_100012A3C()
{
  unint64_t result = qword_100021B90;
  if (!qword_100021B90)
  {
    sub_10000A618(&qword_100021B88);
    sub_100012738(&qword_100021B98, (void (*)(uint64_t))type metadata accessor for CarView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021B90);
  }
  return result;
}

uint64_t sub_100012AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012B4C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CarView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100012BA8()
{
  unint64_t result = qword_100021BA8;
  if (!qword_100021BA8)
  {
    sub_10000A618(&qword_100021BA0);
    sub_100012738(&qword_100021BB0, (void (*)(uint64_t))&type metadata accessor for CAUVehicleLayout);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021BA8);
  }
  return result;
}

char *sub_100012C4C(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2[1];
    id v9 = a2[2];
    *((void *)a1 + 1) = v8;
    *((void *)a1 + 2) = v9;
    uint64_t v10 = a3[7];
    __dst = &a1[v10];
    uint64_t v11 = (char *)a2 + v10;
    uint64_t v12 = type metadata accessor for CAUVehicleLayout();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    uint64_t v14 = v4;
    char v15 = v8;
    uint64_t v16 = v9;
    if (v25(v11, 1, v12))
    {
      uint64_t v17 = sub_1000056DC(&qword_100021BA0);
      memcpy(__dst, v11, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    uint64_t v18 = a3[8];
    uint64_t v19 = a3[9];
    uint64_t v20 = *(char **)((char *)a2 + v18);
    *(void *)&v7[v18] = v20;
    uint64_t v21 = &v7[v19];
    uint64_t v22 = (uint64_t)a2 + v19;
    *uint64_t v21 = *(unsigned char *)v22;
    *((void *)v21 + 1) = *(void *)(v22 + 8);
    id v23 = v20;
  }
  swift_retain();
  return v7;
}

uint64_t sub_100012E1C(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for CAUVehicleLayout();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }

  return swift_release();
}

void *sub_100012F0C(void *a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v6 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v7 = *(void **)(a2 + 16);
  a1[2] = v7;
  uint64_t v8 = a3[7];
  __dst = (char *)a1 + v8;
  id v9 = (const void *)(a2 + v8);
  uint64_t v10 = type metadata accessor for CAUVehicleLayout();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  id v13 = v5;
  id v14 = v6;
  id v15 = v7;
  if (v12(v9, 1, v10))
  {
    uint64_t v16 = sub_1000056DC(&qword_100021BA0);
    memcpy(__dst, v9, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = *(void **)(a2 + v17);
  *(void *)((char *)a1 + v17) = v19;
  uint64_t v20 = (char *)a1 + v18;
  uint64_t v21 = (char *)(a2 + v18);
  *uint64_t v20 = *v21;
  *((void *)v20 + 1) = *((void *)v21 + 1);
  id v22 = v19;
  swift_retain();
  return a1;
}

uint64_t sub_10001308C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  id v9 = *(void **)(a1 + 8);
  uint64_t v10 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v10;
  id v11 = v10;

  uint64_t v12 = *(void **)(a2 + 16);
  id v13 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  id v14 = v12;

  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = type metadata accessor for CAUVehicleLayout();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (!v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 24))(v16, v17, v18);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v19 + 8))(v16, v18);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    uint64_t v23 = sub_1000056DC(&qword_100021BA0);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v19 + 16))(v16, v17, v18);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
LABEL_7:
  uint64_t v24 = a3[8];
  uint64_t v25 = *(void **)(a2 + v24);
  uint64_t v26 = *(void **)(a1 + v24);
  *(void *)(a1 + v24) = v25;
  id v27 = v25;

  uint64_t v28 = a3[9];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = a2 + v28;
  *(unsigned char *)uint64_t v29 = *(unsigned char *)v30;
  *(void *)(v29 + 8) = *(void *)(v30 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10001328C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  id v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for CAUVehicleLayout();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_1000056DC(&qword_100021BA0);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  return a1;
}

uint64_t sub_1000133CC(uint64_t a1, void *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];

  id v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = a2[2];

  uint64_t v9 = a3[7];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for CAUVehicleLayout();
  uint64_t v13 = *(void *)(v12 - 8);
  id v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = sub_1000056DC(&qword_100021BA0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  uint64_t v18 = a3[8];
  uint64_t v19 = *(void **)(a1 + v18);
  *(void *)(a1 + v18) = *(void *)((char *)a2 + v18);

  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  int v22 = (char *)a2 + v20;
  *(unsigned char *)uint64_t v21 = *v22;
  *(void *)(v21 + 8) = *((void *)v22 + 1);
  swift_release();
  return a1;
}

uint64_t sub_1000135B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000135C8);
}

uint64_t sub_1000135C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1000056DC(&qword_100021BA0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10001367C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100013690);
}

uint64_t sub_100013690(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1000056DC(&qword_100021BA0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10001373C()
{
  sub_100015A50(319, (unint64_t *)&unk_100021C60, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleLayout, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_100013820()
{
  return sub_10001385C(&qword_100021CA0, &qword_100021CA8, (void (*)(void))sub_100012A3C);
}

uint64_t sub_10001385C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000A618(a2);
    a3();
    sub_100012664(&qword_100021B50, &qword_100021B38, (void (*)(void))sub_1000126E4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100013904()
{
  unint64_t result = qword_100021CB0;
  if (!qword_100021CB0)
  {
    sub_10000A618(&qword_100021BC8);
    sub_10000BE10(&qword_100021CB8, &qword_100021BB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021CB0);
  }
  return result;
}

uint64_t sub_1000139A4(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_1000192CC, 1);
}

unint64_t sub_1000139C0()
{
  unint64_t result = qword_100021CC8;
  if (!qword_100021CC8)
  {
    sub_10000A618(&qword_100021CC0);
    sub_10000BE10(&qword_100021CD0, &qword_100021CD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021CC8);
  }
  return result;
}

uint64_t sub_100013A60()
{
  uint64_t v1 = type metadata accessor for CarView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  uint64_t v5 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v6 = type metadata accessor for CAUVehicleLayout();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }

  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100013BD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013C3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for CarView(0) - 8);
  uint64_t v4 = *(void **)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10000E084(v4, v5, a1);
}

uint64_t sub_100013CC0()
{
  uint64_t v1 = type metadata accessor for CarView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  uint64_t v5 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v6 = type metadata accessor for CAUVehicleLayout();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }

  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

void sub_100013E30()
{
  uint64_t v1 = *(void *)(type metadata accessor for CarView(0) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_10000F9C4(v2);
}

uint64_t sub_100013E90(uint64_t a1)
{
  return a1;
}

uint64_t sub_100013EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a8)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_100013F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_100013F84(uint64_t a1)
{
  return a1;
}

uint64_t sub_100013FB0()
{
  uint64_t v1 = type metadata accessor for CarView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  uint64_t v5 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v6 = type metadata accessor for CAUVehicleLayout();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }

  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100014120@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for CarView(0) - 8) + 80);
  uint64_t v6 = *(void *)(v2 + 48);
  long long v7 = *(_OWORD *)(v2 + 32);
  v9[0] = *(_OWORD *)(v2 + 16);
  v9[1] = v7;
  uint64_t v10 = v6;
  return sub_10000F078(a1, (double *)v9, v2 + ((v5 + 56) & ~v5), a2);
}

uint64_t type metadata accessor for DoorView(uint64_t a1)
{
  return sub_1000141D0(a1, (uint64_t *)&unk_100021DB8);
}

uint64_t sub_1000141D0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100014208()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_10001422C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100012540(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t *sub_10001426C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1000056DC(&qword_100021D30);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = (void *)v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    id v14 = *(void **)((char *)a2 + v10);
    *(uint64_t *)((char *)a1 + v10) = (uint64_t)v14;
    uint64_t v15 = a3[7];
    uint64_t v16 = a3[8];
    uint64_t v17 = *(void **)((char *)a2 + v15);
    *(uint64_t *)((char *)a1 + v15) = (uint64_t)v17;
    uint64_t v18 = (char *)a1 + v16;
    uint64_t v19 = (char *)a2 + v16;
    long long v20 = *((_OWORD *)v19 + 1);
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
    *((_OWORD *)v18 + 1) = v20;
    *((void *)v18 + 4) = *((void *)v19 + 4);
    uint64_t v21 = a3[9];
    __dst = (char *)a1 + v21;
    int v22 = (char *)a2 + v21;
    uint64_t v23 = type metadata accessor for CAUVehicleLayout();
    uint64_t v24 = *(void *)(v23 - 8);
    uint64_t v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
    id v25 = v13;
    id v26 = v14;
    id v27 = v17;
    if (v36(v22, 1, v23))
    {
      uint64_t v28 = sub_1000056DC(&qword_100021BA0);
      memcpy(__dst, v22, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(__dst, v22, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(__dst, 0, 1, v23);
    }
    uint64_t v29 = a3[10];
    uint64_t v30 = (char *)a1 + v29;
    id v31 = (char *)a2 + v29;
    uint64_t v32 = type metadata accessor for CAUVehicleLayoutInfo();
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
    {
      uint64_t v34 = sub_1000056DC(&qword_100021868);
      memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
    }
  }
  return a1;
}

uint64_t sub_1000145C0(uint64_t a1, int *a2)
{
  sub_1000056DC(&qword_100021D30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

  uint64_t v5 = a1 + a2[9];
  uint64_t v6 = type metadata accessor for CAUVehicleLayout();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v8 = a1 + a2[10];
  uint64_t v9 = type metadata accessor for CAUVehicleLayoutInfo();
  uint64_t v12 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v8, 1, v9);
  if (!result)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
    return v11(v8, v9);
  }
  return result;
}

void *sub_1000147BC(void *a1, void *a2, int *a3)
{
  sub_1000056DC(&qword_100021D30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = (void *)v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = *(void **)((char *)a2 + v8);
  *(void *)((char *)a1 + v8) = v12;
  uint64_t v13 = a3[7];
  uint64_t v14 = a3[8];
  uint64_t v15 = *(void **)((char *)a2 + v13);
  *(void *)((char *)a1 + v13) = v15;
  uint64_t v16 = (char *)a1 + v14;
  uint64_t v17 = (char *)a2 + v14;
  long long v18 = *((_OWORD *)v17 + 1);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *((_OWORD *)v16 + 1) = v18;
  *((void *)v16 + 4) = *((void *)v17 + 4);
  uint64_t v19 = a3[9];
  uint64_t v35 = a3;
  __dst = (char *)a1 + v19;
  long long v20 = (char *)a2 + v19;
  uint64_t v21 = type metadata accessor for CAUVehicleLayout();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
  id v24 = v11;
  id v25 = v12;
  id v26 = v15;
  if (v23(v20, 1, v21))
  {
    uint64_t v27 = sub_1000056DC(&qword_100021BA0);
    memcpy(__dst, v20, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(__dst, v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 1, v21);
  }
  uint64_t v28 = v35[10];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = type metadata accessor for CAUVehicleLayoutInfo();
  uint64_t v32 = *(void *)(v31 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
  {
    uint64_t v33 = sub_1000056DC(&qword_100021868);
    memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  }
  return a1;
}

void *sub_100014AB8(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_10000B78C((uint64_t)a1, &qword_100021D30);
    sub_1000056DC(&qword_100021D30);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  uint64_t v10 = (void *)v9[1];
  uint64_t v11 = (void *)v8[1];
  v8[1] = v10;
  id v12 = v10;

  uint64_t v13 = a3[6];
  uint64_t v14 = *(void **)((char *)a1 + v13);
  uint64_t v15 = *(void **)((char *)a2 + v13);
  *(void *)((char *)a1 + v13) = v15;
  id v16 = v15;

  uint64_t v17 = a3[7];
  long long v18 = *(void **)((char *)a1 + v17);
  uint64_t v19 = *(void **)((char *)a2 + v17);
  *(void *)((char *)a1 + v17) = v19;
  id v20 = v19;

  uint64_t v21 = a3[8];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  *uint64_t v22 = *v23;
  v22[1] = v23[1];
  v22[2] = v23[2];
  v22[3] = v23[3];
  v22[4] = v23[4];
  uint64_t v24 = a3[9];
  id v25 = (char *)a1 + v24;
  id v26 = (char *)a2 + v24;
  uint64_t v27 = type metadata accessor for CAUVehicleLayout();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  int v30 = v29(v25, 1, v27);
  int v31 = v29(v26, 1, v27);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v25, v26, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v31)
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v25, v27);
LABEL_11:
    uint64_t v32 = sub_1000056DC(&qword_100021BA0);
    memcpy(v25, v26, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(char *, char *, uint64_t))(v28 + 24))(v25, v26, v27);
LABEL_12:
  uint64_t v33 = a3[10];
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = type metadata accessor for CAUVehicleLayoutInfo();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v37 + 48);
  int v39 = v38(v34, 1, v36);
  int v40 = v38(v35, 1, v36);
  if (!v39)
  {
    if (!v40)
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 24))(v34, v35, v36);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v37 + 8))(v34, v36);
    goto LABEL_17;
  }
  if (v40)
  {
LABEL_17:
    uint64_t v41 = sub_1000056DC(&qword_100021868);
    memcpy(v34, v35, *(void *)(*(void *)(v41 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  return a1;
}

char *sub_100014EB0(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1000056DC(&qword_100021D30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  uint64_t v9 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  long long v12 = *((_OWORD *)v11 + 1);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  *((_OWORD *)v10 + 1) = v12;
  *((void *)v10 + 4) = *((void *)v11 + 4);
  uint64_t v13 = a3[9];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = type metadata accessor for CAUVehicleLayout();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = sub_1000056DC(&qword_100021BA0);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v19 = a3[10];
  id v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = type metadata accessor for CAUVehicleLayoutInfo();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    uint64_t v24 = sub_1000056DC(&qword_100021868);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  return a1;
}

char *sub_100015184(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_10000B78C((uint64_t)a1, &qword_100021D30);
    uint64_t v6 = sub_1000056DC(&qword_100021D30);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  uint64_t v13 = (void *)*((void *)v9 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;

  uint64_t v14 = a3[6];
  uint64_t v15 = *(void **)&a1[v14];
  *(void *)&a1[v14] = *(void *)&a2[v14];

  uint64_t v16 = a3[7];
  uint64_t v17 = *(void **)&a1[v16];
  *(void *)&a1[v16] = *(void *)&a2[v16];

  uint64_t v18 = a3[8];
  uint64_t v19 = a3[9];
  id v20 = &a1[v18];
  uint64_t v21 = &a2[v18];
  long long v22 = *((_OWORD *)v21 + 1);
  *(_OWORD *)id v20 = *(_OWORD *)v21;
  *((_OWORD *)v20 + 1) = v22;
  *((void *)v20 + 4) = *((void *)v21 + 4);
  uint64_t v23 = &a1[v19];
  uint64_t v24 = &a2[v19];
  uint64_t v25 = type metadata accessor for CAUVehicleLayout();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v23, v24, v25);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v29)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v25);
LABEL_10:
    uint64_t v30 = sub_1000056DC(&qword_100021BA0);
    memcpy(v23, v24, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_11;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v23, v24, v25);
LABEL_11:
  uint64_t v31 = a3[10];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  uint64_t v34 = type metadata accessor for CAUVehicleLayoutInfo();
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48);
  int v37 = v36(v32, 1, v34);
  int v38 = v36(v33, 1, v34);
  if (!v37)
  {
    if (!v38)
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 40))(v32, v33, v34);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v35 + 8))(v32, v34);
    goto LABEL_16;
  }
  if (v38)
  {
LABEL_16:
    uint64_t v39 = sub_1000056DC(&qword_100021868);
    memcpy(v32, v33, *(void *)(*(void *)(v39 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v32, v33, v34);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
  return a1;
}

uint64_t sub_100015554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100015568);
}

uint64_t sub_100015568(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000056DC(&qword_100021D58);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_9:
    return v9(v10, a2, v8);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v11 = *(void *)(a1 + a3[5] + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v13 = sub_1000056DC(&qword_100021BA0);
    uint64_t v14 = *(void *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v10 = a1 + a3[9];
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
      goto LABEL_9;
    }
    uint64_t v15 = sub_1000056DC(&qword_100021868);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[10];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_1000156F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001570C);
}

uint64_t sub_10001570C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_1000056DC(&qword_100021D58);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_7:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[5] + 8) = (a2 - 1);
    return result;
  }
  uint64_t v13 = sub_1000056DC(&qword_100021BA0);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[9];
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  uint64_t v15 = sub_1000056DC(&qword_100021868);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[10];

  return v16(v18, a2, a2, v17);
}

void sub_10001589C()
{
  sub_100015A50(319, &qword_100021DC8, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    sub_100015A50(319, (unint64_t *)&unk_100021C60, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleLayout, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v1 <= 0x3F)
    {
      sub_100015A50(319, (unint64_t *)&unk_100021DD0, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleLayoutInfo, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_100015A50(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_100015AB4()
{
  return sub_10001385C(&qword_100021E18, &qword_100021E20, (void (*)(void))sub_1000139C0);
}

uint64_t sub_100015AF0(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_1000192F4, 1);
}

unint64_t sub_100015B0C()
{
  unint64_t result = qword_100021E40;
  if (!qword_100021E40)
  {
    sub_10000A618(&qword_100021E38);
    sub_100015B80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021E40);
  }
  return result;
}

unint64_t sub_100015B80()
{
  unint64_t result = qword_100021E48;
  if (!qword_100021E48)
  {
    sub_10000A618(&qword_100021E50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021E48);
  }
  return result;
}

uint64_t sub_100015BF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100015C20()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100015C4C()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_100015C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100012540(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for Image.Scale, (uint64_t (*)(char *))&EnvironmentValues.imageScale.setter);
}

unint64_t sub_100015CB4()
{
  unint64_t result = qword_100021EA0;
  if (!qword_100021EA0)
  {
    sub_10000A618(&qword_100021EA8);
    sub_100015B0C();
    sub_10000BE10(&qword_100021E58, &qword_100021E28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021EA0);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t CAFObserved<>.observable.getter()
{
  return CAFObserved<>.observable.getter();
}

uint64_t CAFCarObservable.observed.getter()
{
  return CAFCarObservable.observed.getter();
}

uint64_t type metadata accessor for CAFCarObservable()
{
  return type metadata accessor for CAFCarObservable();
}

uint64_t dispatch thunk of CAFSeatBeltObservable.seatBeltIndicator.getter()
{
  return dispatch thunk of CAFSeatBeltObservable.seatBeltIndicator.getter();
}

uint64_t dispatch thunk of CAFSeatBeltObservable.$seatBeltIndicator.getter()
{
  return dispatch thunk of CAFSeatBeltObservable.$seatBeltIndicator.getter();
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

uint64_t dispatch thunk of CAFClosureStateObservable.latchState.getter()
{
  return dispatch thunk of CAFClosureStateObservable.latchState.getter();
}

uint64_t CAFClosureStateObservable.observed.getter()
{
  return CAFClosureStateObservable.observed.getter();
}

uint64_t type metadata accessor for CAFClosureStateObservable()
{
  return type metadata accessor for CAFClosureStateObservable();
}

uint64_t NSNotFound.getter()
{
  return NSNotFound.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
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

uint64_t type metadata accessor for CAUAsset.ClosureMask.State()
{
  return type metadata accessor for CAUAsset.ClosureMask.State();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

Swift::Void __swiftcall ObservableObjectPublisher.send()()
{
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t static ColorScheme.== infix(_:_:)()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
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

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t EnvironmentValues.imageScale.getter()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static SymbolRenderingMode.palette.getter()
{
  return static SymbolRenderingMode.palette.getter();
}

uint64_t type metadata accessor for SymbolRenderingMode()
{
  return type metadata accessor for SymbolRenderingMode();
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

uint64_t static Font.Weight.medium.getter()
{
  return static Font.Weight.medium.getter();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
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

uint64_t Color.init(uiColor:)()
{
  return Color.init(uiColor:)();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.blue.getter()
{
  return static Color.blue.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.green.getter()
{
  return static Color.green.getter();
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

uint64_t type metadata accessor for Image.Interpolation()
{
  return type metadata accessor for Image.Interpolation();
}

uint64_t Image.interpolation(_:)()
{
  return Image.interpolation(_:)();
}

uint64_t Image.symbolRenderingMode(_:)()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t type metadata accessor for Image.Scale()
{
  return type metadata accessor for Image.Scale();
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

{
  return ForEach<>.init(_:content:)();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
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

uint64_t CAFSeatBeltIndicator.description.getter()
{
  return CAFSeatBeltIndicator.description.getter();
}

uint64_t CAFPositionedRequired.layoutKey.getter()
{
  return CAFPositionedRequired.layoutKey.getter();
}

uint64_t UIImage.fit(to:)()
{
  return UIImage.fit(to:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
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

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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