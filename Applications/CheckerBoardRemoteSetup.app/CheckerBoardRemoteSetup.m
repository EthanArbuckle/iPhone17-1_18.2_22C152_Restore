id sub_1000055E4(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  Swift::String v16;
  Swift::String v17;
  NSString v18;
  id v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;
  Swift::String v24;
  Swift::String v25;
  NSString v26;
  objc_super v28;
  Swift::String v29;
  Swift::String v30;

  v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController_activityIndicator;
  v4 = objc_allocWithZone((Class)UIActivityIndicatorView);
  v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  v6 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController_remoteSetupManager;
  if (qword_100027440 != -1) {
    swift_once();
  }
  v7 = (void *)qword_100028770;
  *(void *)&v5[v6] = qword_100028770;
  v8 = v7;

  v28.receiver = v5;
  v28.super_class = (Class)type metadata accessor for SetupInProgressCardViewController();
  v9 = [super initWithContentView:a1];
  [v9 setDismissalType:0];
  v10 = v9;
  v11 = sub_1000058E4();
  v13 = v12;
  v14 = self;
  v15 = [v14 mainBundle];
  v29._object = (void *)0xEA0000000000656CLL;
  v16._countAndFlagsBits = v11;
  v16._object = v13;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  v29._countAndFlagsBits = 0x7469742064726143;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v29);
  swift_bridgeObjectRelease();

  v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v10 setTitle:v18];

  v19 = v10;
  v20 = sub_100005A28();
  v22 = v21;
  v23 = [v14 mainBundle];
  v30._object = (void *)0x8000000100019080;
  v24._countAndFlagsBits = v20;
  v24._object = v22;
  v25._countAndFlagsBits = 0;
  v25._object = (void *)0xE000000000000000;
  v30._countAndFlagsBits = 0xD000000000000010;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v24, (Swift::String_optional)0, (NSBundle)v23, v25, v30);
  swift_bridgeObjectRelease();

  v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v19 setSubtitle:v26];

  return v19;
}

unint64_t sub_1000058E4()
{
  unint64_t v1 = 0xD000000000000016;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController_remoteSetupManager);
  if (!v2) {
    goto LABEL_9;
  }
  int v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v3 == 1) {
    return 0xD00000000000001DLL;
  }
  if (v3 == 11) {
    return 0xD00000000000001DLL;
  }
  if (v3 != 3)
  {
LABEL_9:
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    v4 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    return v1;
  }
  return 0xD00000000000001BLL;
}

unint64_t sub_100005A28()
{
  unint64_t v1 = 0xD000000000000019;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController_remoteSetupManager);
  if (!v2) {
    goto LABEL_9;
  }
  int v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v3 == 1) {
    return 0xD000000000000020;
  }
  if (v3 == 11) {
    return 0xD000000000000020;
  }
  if (v3 != 3)
  {
LABEL_9:
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    v4 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    return v1;
  }
  return 0xD00000000000001ELL;
}

id sub_100005B6C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetupInProgressCardViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for SetupInProgressCardViewController()
{
  return self;
}

void type metadata accessor for MGDeviceClass(uint64_t a1)
{
}

BOOL sub_100005C24(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100005C38(uint64_t a1, uint64_t a2)
{
  return sub_100005ECC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005C50(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100005CC8(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100005D48@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

_DWORD *sub_100005D8C@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_100005D9C(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100005DA8@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100005DF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100005E1C(uint64_t a1)
{
  uint64_t v2 = sub_1000064D0(&qword_1000274F0);
  uint64_t v3 = sub_1000064D0(&qword_1000274F8);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005EB4(uint64_t a1, uint64_t a2)
{
  return sub_100005ECC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005ECC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100005F10()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100005F64()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100005FD8()
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

void sub_100006064()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController_activityIndicator];
  [v2 setActivityIndicatorViewStyle:101];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [v1 contentView];
  [v3 addSubview:v2];

  id v4 = [v1 contentView];
  id v5 = [v4 mainContentGuide];

  v6 = self;
  sub_100006364(&qword_1000274B8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1000184C0;
  id v8 = [v2 topAnchor];
  id v9 = [v5 topAnchor];
  id v10 = [v8 constraintGreaterThanOrEqualToAnchor:v9];

  *(void *)(v7 + 32) = v10;
  id v11 = [v2 bottomAnchor];
  id v12 = [v5 bottomAnchor];
  id v13 = [v11 constraintLessThanOrEqualToAnchor:v12];

  *(void *)(v7 + 40) = v13;
  id v14 = [v2 centerYAnchor];
  id v15 = [v5 centerYAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];

  *(void *)(v7 + 48) = v16;
  id v17 = [v2 centerXAnchor];
  id v18 = [v5 centerXAnchor];
  id v19 = [v17 constraintEqualToAnchor:v18];

  *(void *)(v7 + 56) = v19;
  specialized Array._endMutation()();
  sub_1000063A8(0, &qword_100027A70);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v6 activateConstraints:isa];
}

uint64_t sub_100006364(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000063A8(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for ObjectType(uint64_t a1)
{
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void type metadata accessor for CUPasswordType(uint64_t a1)
{
}

void sub_100006420(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100006468()
{
  return sub_1000064D0(&qword_1000274D8);
}

uint64_t sub_10000649C()
{
  return sub_1000064D0(&qword_1000274E0);
}

uint64_t sub_1000064D0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ObjectType(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006514()
{
  return sub_1000064D0(&qword_1000274E8);
}

char *sub_100006554(void *a1)
{
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for CaptivePortalDetectedCardViewController();
  id v3 = [super initWithContentView:a1];
  uint64_t v4 = &v3[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle];
  *(void *)uint64_t v4 = 0xD00000000000001ALL;
  *((void *)v4 + 1) = 0x80000001000190F0;
  id v5 = v3;
  swift_bridgeObjectRelease();
  v6 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase];
  *(void *)v6 = 0xD00000000000001DLL;
  *((void *)v6 + 1) = 0x8000000100019110;
  swift_bridgeObjectRelease();
  uint64_t v7 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText];
  *(void *)uint64_t v7 = 0xD000000000000020;
  *((void *)v7 + 1) = 0x8000000100019130;
  swift_bridgeObjectRelease();
  id v8 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName];
  *(void *)id v8 = 0xD000000000000014;
  *((void *)v8 + 1) = 0x8000000100019160;
  swift_bridgeObjectRelease();
  id v9 = [self systemGrayColor];
  id v10 = *(void **)&v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor];
  *(void *)&v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor] = v9;

  return v5;
}

id sub_1000066E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CaptivePortalDetectedCardViewController();
  [super dealloc];
}

uint64_t type metadata accessor for CaptivePortalDetectedCardViewController()
{
  return self;
}

uint64_t sub_100006740()
{
  if ([v0 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_100008FFC((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_100006364(&qword_100027660);
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_100008CCC((uint64_t)v4);
    return 0;
  }
}

void sub_1000067FC(void *a1, void (*a2)(void))
{
  if (!a1
    || (uint64_t v4 = v2, (v5 = [a1 userInfo]) == 0)
    || (v6 = v5, uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(), v6, !v7))
  {
    long long v32 = 0u;
    long long v33 = 0u;
LABEL_8:
    sub_100008CCC((uint64_t)&v32);
    goto LABEL_9;
  }
  AnyHashable.init<A>(_:)();
  if (*(void *)(v7 + 16) && (unint64_t v8 = sub_100016488((uint64_t)v31), (v9 & 1) != 0))
  {
    sub_100008E68(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v32);
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_100008E14((uint64_t)v31);
  if (!*((void *)&v33 + 1)) {
    goto LABEL_8;
  }
  sub_100006364(&qword_100027668);
  if (swift_dynamicCast())
  {
    id v11 = objc_allocWithZone((Class)CBDevice);
    id v12 = sub_100008D2C();
    sub_100006364((uint64_t *)&unk_1000275F0);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1000187D0;
    *(void *)(v13 + 56) = sub_1000063A8(0, &qword_100027670);
    *(void *)(v13 + 64) = sub_100009174();
    *(void *)(v13 + 32) = v12;
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    id v14 = v12;
    id v15 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    id v16 = *(void **)(v4 + OBJC_IVAR___RemoteViewController_cbDevice);
    *(void *)(v4 + OBJC_IVAR___RemoteViewController_cbDevice) = v14;

    id v17 = *(void **)(v4 + OBJC_IVAR___RemoteViewController_remoteSetupManager);
    if (v17)
    {
      id v18 = *(void **)(v4 + OBJC_IVAR___RemoteViewController_cbDevice);
      id v19 = v18;
      id v20 = v17;
      sub_100013CA8(v18);
    }
    v21 = self;
    id v22 = [v21 defaultCenter];
    if (qword_100027468 != -1) {
      swift_once();
    }
    [v22 addObserver:v4 selector:"_setupComplete" name:qword_100028798 object:0];

    id v23 = [v21 defaultCenter];
    if (qword_100027460 != -1) {
      swift_once();
    }
    [v23 addObserver:v4 selector:"_setupCancelled:" name:qword_100028790 object:0];

    id v24 = [v21 defaultCenter];
    if (qword_100027470 != -1) {
      swift_once();
    }
    [v24 addObserver:v4 selector:"_setupFailed" name:qword_1000287A0 object:0];

    id v25 = [v21 defaultCenter];
    if (qword_100027448 != -1) {
      swift_once();
    }
    [v25 addObserver:v4 selector:"_passwordRequested:" name:qword_100028778 object:0];

    id v26 = [v21 defaultCenter];
    if (qword_100027450 != -1) {
      swift_once();
    }
    [v26 addObserver:v4 selector:"_passwordPresented:" name:qword_100028780 object:0];

    id v27 = [v21 defaultCenter];
    if (qword_100027458 != -1) {
      swift_once();
    }
    [v27 addObserver:v4 selector:"_passwordAccepted" name:qword_100028788 object:0];

    id v28 = [objc_allocWithZone((Class)SFClient) init];
    v29 = *(void **)(v4 + OBJC_IVAR___RemoteViewController_sharingClient);
    *(void *)(v4 + OBJC_IVAR___RemoteViewController_sharingClient) = v28;

    if (a2) {
      a2();
    }
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    v30 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    return;
  }
LABEL_9:
  sub_1000063A8(0, (unint64_t *)&qword_100027A40);
  id v10 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  if (a2) {
    a2();
  }
}

void sub_10000707C(char a1)
{
  uint64_t v2 = v1;
  v12.receiver = v2;
  v12.super_class = (Class)type metadata accessor for RemoteViewController();
  [super viewDidAppear:a1 & 1];
  if (qword_100027408 != -1) {
    swift_once();
  }
  if (byte_100028740 != 1 || !*(void *)&v2[OBJC_IVAR___RemoteViewController_cbDevice]) {
    goto LABEL_9;
  }
  if (qword_100027420 != -1) {
    swift_once();
  }
  id v4 = [(id)qword_100027A90 networkName];
  if (v4 && (v4, ([(id)qword_100027A90 reachabilityFlags] & 2) != 0))
  {
    v6 = *(void **)&v2[OBJC_IVAR___RemoteViewController_sharingClient];
    if (v6)
    {
      uint64_t v7 = swift_allocObject();
      *(void *)(v7 + 16) = v2;
      v11[4] = sub_100009064;
      v11[5] = v7;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 1107296256;
      v11[2] = sub_1000074E4;
      v11[3] = &unk_100020C90;
      unint64_t v8 = _Block_copy(v11);
      id v9 = v6;
      id v10 = v2;
      swift_release();
      [v9 startProxCardTransactionWithOptions:0 completion:v8];

      _Block_release(v8);
    }
  }
  else
  {
LABEL_9:
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    id v5 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    sub_10000761C();
  }
}

void sub_100007348(char a1, char *a2)
{
  sub_1000063A8(0, (unint64_t *)&qword_100027A40);
  id v4 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  if (a1)
  {
    os_log(_:dso:log:type:_:)();

    id v5 = sub_10000906C();
    id v6 = [v5 navigationController];
    uint64_t v7 = *(void **)&a2[OBJC_IVAR___RemoteViewController_cardNavigationController];
    *(void *)&a2[OBJC_IVAR___RemoteViewController_cardNavigationController] = v6;

    id v8 = (id)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
  }
  else
  {
    os_log(_:dso:log:type:_:)();

    a2[OBJC_IVAR___RemoteViewController_resetSetupFlowOnExit] = 1;
    sub_10000761C();
  }
}

uint64_t sub_1000074E4(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_10000761C()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)sub_100006740();
  if (v2)
  {
    [v2 dismiss];
    swift_unknownObjectRelease();
  }
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR___RemoteViewController_remoteSetupManager);
  if (v3)
  {
    *(unsigned char *)(v3 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
    id v4 = *(void **)(v3 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
    if (v4) {
      [v4 invalidate];
    }
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR___RemoteViewController_resetSetupFlowOnExit) == 1)
  {
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    id v5 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    id v6 = [objc_allocWithZone((Class)CBController) init];
    NSString v7 = String._bridgeToObjectiveC()();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v6;
    v12[4] = sub_100008FA0;
    v12[5] = v8;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 1107296256;
    v12[2] = sub_100007948;
    v12[3] = &unk_100020C40;
    id v9 = _Block_copy(v12);
    id v10 = v6;
    swift_release();
    [v10 resetCBExtensionID:v7 completionHandler:v9];
    _Block_release(v9);
  }
  return [*(id *)(v1 + OBJC_IVAR___RemoteViewController_sharingClient) invalidate];
}

id sub_100007828(uint64_t a1, id a2)
{
  id result = [a2 invalidate];
  if (a1)
  {
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    swift_errorRetain();
    id v4 = (void *)static OS_os_log.default.getter();
    sub_100006364((uint64_t *)&unk_1000275F0);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1000187D0;
    swift_getErrorValue();
    uint64_t v6 = Error.localizedDescription.getter();
    uint64_t v8 = v7;
    *(void *)(v5 + 56) = &type metadata for String;
    *(void *)(v5 + 64) = sub_100008FA8();
    *(void *)(v5 + 32) = v6;
    *(void *)(v5 + 40) = v8;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    swift_bridgeObjectRelease();
    return (id)swift_errorRelease();
  }
  return result;
}

void sub_100007948(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_1000079FC()
{
  type metadata accessor for SetupCompleteCardViewController();
  id v1 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___RemoteViewController_cardNavigationController);
  if (v2)
  {
    id v3 = v2;
    [v3 pushViewController:v1 animated:1];
  }
  *(unsigned char *)(v0 + OBJC_IVAR___RemoteViewController_resetSetupFlowOnExit) = 1;
}

void sub_100007ACC(void *a1)
{
  uint64_t v2 = v1;
  v1[OBJC_IVAR___RemoteViewController_resetSetupFlowOnExit] = 1;
  id v3 = [a1 userInfo];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    if (qword_100027438 != -1) {
      swift_once();
    }
    long long v23 = xmmword_100028760;
    swift_bridgeObjectRetain();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v5 + 16) && (unint64_t v6 = sub_100016488((uint64_t)aBlock), (v7 & 1) != 0))
    {
      sub_100008E68(*(void *)(v5 + 56) + 32 * v6, (uint64_t)&v23);
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_100008E14((uint64_t)aBlock);
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
  }
  sub_100008EC4((uint64_t)&v23, (uint64_t)aBlock);
  if (!v19)
  {
    sub_100008CCC((uint64_t)aBlock);
LABEL_16:
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    uint64_t v13 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    type metadata accessor for SetupFailedCardViewController();
    id v14 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    id v15 = *(void **)&v2[OBJC_IVAR___RemoteViewController_cardNavigationController];
    if (v15)
    {
      id v16 = v15;
      [v16 pushViewController:v14 animated:1];
    }
    goto LABEL_18;
  }
  if (!swift_dynamicCast()) {
    goto LABEL_16;
  }
  if (v22)
  {
    uint64_t v8 = *(void **)&v2[OBJC_IVAR___RemoteViewController_cardNavigationController];
    if (v8)
    {
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = v2;
      id v20 = sub_100008F64;
      uint64_t v21 = v9;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10000CA6C;
      id v19 = &unk_100020BF0;
      id v10 = _Block_copy(aBlock);
      id v11 = v8;
      objc_super v12 = v2;
      swift_release();
      [v11 dismissViewControllerAnimated:1 completion:v10];
      _Block_release(v10);
    }
    goto LABEL_19;
  }
  type metadata accessor for SetupCancelledCardViewController();
  id v14 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  id v17 = *(void **)&v2[OBJC_IVAR___RemoteViewController_cardNavigationController];
  if (v17)
  {
    [v17 pushViewController:v14 animated:1];
LABEL_18:

LABEL_19:
    sub_100008CCC((uint64_t)&v23);
    return;
  }
  sub_100008CCC((uint64_t)&v23);
}

void sub_100007E80()
{
}

void sub_100007EE0(void *a1)
{
  uint64_t v2 = v1;
  id v3 = [a1 userInfo];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    *(void *)&long long v19 = 0xD000000000000011;
    *((void *)&v19 + 1) = 0x8000000100019260;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v5 + 16) && (unint64_t v6 = sub_100016488((uint64_t)v17), (v7 & 1) != 0))
    {
      sub_100008E68(*(void *)(v5 + 56) + 32 * v6, (uint64_t)&v19);
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_100008E14((uint64_t)v17);
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
  }
  sub_100008EC4((uint64_t)&v19, (uint64_t)v17);
  if (!v17[3])
  {
    sub_100008CCC((uint64_t)v17);
    goto LABEL_13;
  }
  type metadata accessor for CUPasswordType(0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_13;
  }
  unsigned int v8 = v18;
  if (v18 == 8)
  {
    type metadata accessor for QRCodeScannerCardViewController();
    id v9 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    goto LABEL_26;
  }
  if ((sub_100013B60(v18, (uint64_t)&off_100020AD0) & 1) == 0)
  {
LABEL_13:
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    id v10 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    uint64_t v11 = *(void *)(v2 + OBJC_IVAR___RemoteViewController_remoteSetupManager);
    if (v11)
    {
      *(unsigned char *)(v11 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
      objc_super v12 = *(void **)(v11 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
      if (v12) {
        [v12 invalidate];
      }
    }
    type metadata accessor for SetupFailedCardViewController();
    id v9 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v13 = *(void **)(v2 + OBJC_IVAR___RemoteViewController_cardNavigationController);
    if (v13)
    {
      id v14 = v13;
      [v14 pushViewController:v9 animated:1];
    }
    goto LABEL_28;
  }
  type metadata accessor for PinEntryCardViewController();
  id v15 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  id v9 = v15;
  switch(v8)
  {
    case 3u:
      [v15 setNumberOfDigits:8];
      break;
    case 2u:
      [v15 setNumberOfDigits:6];
      break;
    case 1u:
      [v15 setNumberOfDigits:4];
      break;
  }
LABEL_26:
  id v16 = *(void **)(v2 + OBJC_IVAR___RemoteViewController_cardNavigationController);
  if (v16)
  {
    [v16 pushViewController:v9 animated:1];
LABEL_28:

    sub_100008CCC((uint64_t)&v19);
    return;
  }
  sub_100008CCC((uint64_t)&v19);
}

void sub_1000082B0(void *a1)
{
  uint64_t v2 = v1;
  id v4 = [a1 userInfo];
  if (!v4)
  {
    long long v30 = 0u;
    long long v31 = 0u;
LABEL_27:
    sub_100008CCC((uint64_t)&v30);
    goto LABEL_28;
  }
  uint64_t v5 = v4;
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (qword_100027430 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_100016488((uint64_t)v29), (v8 & 1) != 0))
  {
    sub_100008E68(*(void *)(v6 + 56) + 32 * v7, (uint64_t)&v30);
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_100008E14((uint64_t)v29);
  if (!*((void *)&v31 + 1)) {
    goto LABEL_27;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_28:
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    long long v23 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    goto LABEL_29;
  }
  uint64_t v10 = v29[0];
  unint64_t v9 = v29[1];
  id v11 = [a1 userInfo];
  if (!v11)
  {
    long long v30 = 0u;
    long long v31 = 0u;
LABEL_26:
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  objc_super v12 = v11;
  uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  AnyHashable.init<A>(_:)();
  if (*(void *)(v13 + 16) && (unint64_t v14 = sub_100016488((uint64_t)v29), (v15 & 1) != 0))
  {
    sub_100008E68(*(void *)(v13 + 56) + 32 * v14, (uint64_t)&v30);
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_100008E14((uint64_t)v29);
  if (!*((void *)&v31 + 1)) {
    goto LABEL_26;
  }
  type metadata accessor for CUPasswordType(0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  int v16 = v29[0];
  if (sub_100013B60(LODWORD(v29[0]), (uint64_t)&off_100020B00))
  {
    type metadata accessor for QRCodeDisplayCardViewController();
    id v17 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    unsigned int v18 = (uint64_t *)&v17[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password];
    *unsigned int v18 = v10;
    v18[1] = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v16 == 2) {
      v17[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_codeDisplayType] = 1;
    }
    long long v19 = *(void **)(v2 + OBJC_IVAR___RemoteViewController_cardNavigationController);
    if (v19) {
      [v19 pushViewController:v17 animated:1];
    }
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    swift_bridgeObjectRetain();
    long long v20 = static OS_os_log.default.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      char v22 = (uint8_t *)swift_slowAlloc();
      v29[0] = swift_slowAlloc();
      *(_DWORD *)char v22 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&long long v30 = sub_100011E7C(v10, v9, v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Presented authentication for code %s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    return;
  }
  swift_bridgeObjectRelease();
  sub_1000063A8(0, (unint64_t *)&qword_100027A40);
  long long v23 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
LABEL_29:
  os_log(_:dso:log:type:_:)();

  uint64_t v24 = *(void *)(v2 + OBJC_IVAR___RemoteViewController_remoteSetupManager);
  if (v24)
  {
    *(unsigned char *)(v24 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
    id v25 = *(void **)(v24 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
    if (v25) {
      [v25 invalidate];
    }
  }
  type metadata accessor for SetupFailedCardViewController();
  id v26 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  id v27 = *(void **)(v2 + OBJC_IVAR___RemoteViewController_cardNavigationController);
  if (v27)
  {
    id v28 = v27;
    [v28 pushViewController:v26 animated:1];
  }
}

void sub_100008894()
{
}

void sub_1000088AC(void (*a1)(void))
{
  a1(0);
  id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR___RemoteViewController_cardNavigationController);
  if (v2)
  {
    id v3 = v2;
    [v3 pushViewController:v4 animated:1];
  }
}

id sub_100008984(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR___RemoteViewController_cbDevice] = 0;
  v3[OBJC_IVAR___RemoteViewController_resetSetupFlowOnExit] = 0;
  *(void *)&v3[OBJC_IVAR___RemoteViewController_cardNavigationController] = 0;
  *(void *)&v3[OBJC_IVAR___RemoteViewController_sharingClient] = 0;
  uint64_t v6 = OBJC_IVAR___RemoteViewController_remoteSetupManager;
  uint64_t v7 = qword_100027440;
  char v8 = v3;
  if (v7 != -1) {
    swift_once();
  }
  unint64_t v9 = (void *)qword_100028770;
  *(void *)&v3[v6] = qword_100028770;
  id v10 = v9;

  if (a2)
  {
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  v14.receiver = v8;
  v14.super_class = (Class)type metadata accessor for RemoteViewController();
  [super initWithNibName:v11 bundle:a3];

  return v12;
}

id sub_100008B04(void *a1)
{
  *(void *)&v1[OBJC_IVAR___RemoteViewController_cbDevice] = 0;
  v1[OBJC_IVAR___RemoteViewController_resetSetupFlowOnExit] = 0;
  *(void *)&v1[OBJC_IVAR___RemoteViewController_cardNavigationController] = 0;
  *(void *)&v1[OBJC_IVAR___RemoteViewController_sharingClient] = 0;
  uint64_t v3 = OBJC_IVAR___RemoteViewController_remoteSetupManager;
  uint64_t v4 = qword_100027440;
  uint64_t v5 = v1;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_100028770;
  *(void *)&v5[v3] = qword_100028770;
  id v7 = v6;

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for RemoteViewController();
  id v8 = [super initWithCoder:a1];

  return v8;
}

id sub_100008C08()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for RemoteViewController()
{
  return self;
}

uint64_t sub_100008CCC(uint64_t a1)
{
  uint64_t v2 = sub_100006364((uint64_t *)&unk_1000275E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_100008D2C()
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v6 = 0;
  id v2 = [v0 initWithDictionary:isa error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_100008E14(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008E68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006364((uint64_t *)&unk_1000275E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008F2C()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100008F64()
{
  return sub_10000761C();
}

uint64_t sub_100008F88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008F98()
{
  return swift_release();
}

id sub_100008FA0(uint64_t a1)
{
  return sub_100007828(a1, *(id *)(v1 + 16));
}

unint64_t sub_100008FA8()
{
  unint64_t result = qword_100027A60;
  if (!qword_100027A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027A60);
  }
  return result;
}

uint64_t sub_100008FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006364((uint64_t *)&unk_1000275E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100009064(char a1)
{
  sub_100007348(a1, *(char **)(v1 + 16));
}

id sub_10000906C()
{
  if (sub_10000FCA0())
  {
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    uint64_t v0 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    type metadata accessor for CaptivePortalDetectedCardViewController();
  }
  else
  {
    type metadata accessor for WelcomeCardViewController();
  }
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return [v1 init];
}

uint64_t sub_10000911C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000912C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100009164()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

unint64_t sub_100009174()
{
  unint64_t result = qword_100027678;
  if (!qword_100027678)
  {
    sub_1000063A8(255, &qword_100027670);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027678);
  }
  return result;
}

id sub_10000923C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v5 = (objc_class *)type metadata accessor for AppDelegate();
  id v6 = NSStringFromClass(v5);
  UIApplicationMain(argc, (char **)argv, 0, v6);

  return 0;
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

id sub_1000092F0(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup26PinEntryCardViewController_remoteSetupManager;
  uint64_t v4 = qword_100027440;
  uint64_t v5 = v1;
  if (v4 != -1) {
    swift_once();
  }
  id v6 = (void *)qword_100028770;
  *(void *)&v5[v3] = qword_100028770;
  id v7 = v6;

  v28.receiver = v5;
  v28.super_class = (Class)type metadata accessor for PinEntryCardViewController();
  [super initWithContentView:a1];
  [v8 setDismissalType:1];
  unint64_t v9 = self;
  id v10 = v8;
  id v11 = [v9 mainBundle];
  v29._object = (void *)0xEA0000000000656CLL;
  v12._countAndFlagsBits = 0x445241435F4E4950;
  v12._object = (void *)0xEE00454C5449545FLL;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  v29._countAndFlagsBits = 0x7469742064726143;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v29);

  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v10 setTitle:v14];

  id v15 = v10;
  unint64_t v16 = sub_10000975C();
  unsigned int v18 = v17;
  id v19 = [v9 mainBundle];
  v30._object = (void *)0xE90000000000004ELL;
  v20._countAndFlagsBits = v16;
  v20._object = v18;
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  v30._countAndFlagsBits = 0x4950207265746E45;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v20, (Swift::String_optional)0, (NSBundle)v19, v21, v30);
  swift_bridgeObjectRelease();

  NSString v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v15 setSubtitle:v22];

  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_100009948;
  aBlock[5] = v23;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000096C0;
  void aBlock[3] = &unk_100020D08;
  uint64_t v24 = _Block_copy(aBlock);
  id v25 = v15;
  swift_release();
  [v25 setTextEntryCompletionHandler:v24];

  _Block_release(v24);
  return v25;
}

void sub_1000095F8(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = Strong;
    id v6 = [Strong navigationController];
    if (v6)
    {
      id v7 = v6;
    }
    id v8 = *(void **)&v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26PinEntryCardViewController_remoteSetupManager];
    if (v8)
    {
      id v9 = v8;
      sub_100014600(a1, a2);
    }
  }
}

uint64_t sub_1000096C0(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();

  return swift_bridgeObjectRelease();
}

unint64_t sub_10000975C()
{
  unint64_t v1 = 0xD000000000000011;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26PinEntryCardViewController_remoteSetupManager);
  if (!v2) {
    goto LABEL_7;
  }
  int v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v3 == 1) {
    return 0xD000000000000018;
  }
  if (v3 != 3)
  {
LABEL_7:
    sub_1000098D0();
    uint64_t v4 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    return v1;
  }
  return 0xD000000000000016;
}

id sub_100009868()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PinEntryCardViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for PinEntryCardViewController()
{
  return self;
}

unint64_t sub_1000098D0()
{
  unint64_t result = qword_100027A40;
  if (!qword_100027A40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100027A40);
  }
  return result;
}

uint64_t sub_100009910()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100009948(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_100009950(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009960()
{
  return swift_release();
}

void sub_100009A14()
{
  unint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsSubview);
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v2 = 1;
  [v1 setContentMode:1];
  [v1 setScrollEnabled:1];
  [v1 setShowsHorizontalScrollIndicator:0];
  [v1 setShowsVerticalScrollIndicator:1];
  uint64_t v3 = sub_10000A05C((uint64_t)&_swiftEmptyArrayStorage, 0xD000000000000024, (void *)0x8000000100019A00);
  uint64_t v5 = v4;
  id v6 = self;
  id v7 = [v6 mainBundle];
  v35._object = (void *)0x8000000100019A30;
  v8._countAndFlagsBits = v3;
  v8._object = v5;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v35._countAndFlagsBits = 0xD000000000000014;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v9, v35);
  swift_bridgeObjectRelease();

  id v10 = objc_allocWithZone((Class)NSMutableAttributedString);
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v12 = [v10 initWithString:v11];

  id v13 = [objc_allocWithZone((Class)NSMutableParagraphStyle) init];
  [v13 setHyphenationFactor:0.0];
  [v13 setAlignment:4];
  [v13 setParagraphSpacingBefore:15.0];
  id v33 = [self preferredFontForTextStyle:UIFontTextStyleBody];
  id v14 = [v12 length];
  [v12 addAttribute:NSParagraphStyleAttributeName value:v13 range:0];
  [v12 addAttribute:NSFontAttributeName value:v33 range:0];
  id v15 = *(void **)(v0
                 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsTextView);
  [v15 setAttributedText:v12];
  [v15 setDataDetectorTypes:2];
  id v16 = [self labelColor];
  [v15 setTextColor:v16];

  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v15 setEditable:0];
  [v15 setScrollEnabled:0];
  id v17 = *(void **)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_disagreeButton);
  id v18 = [v6 mainBundle];
  v19._countAndFlagsBits = 0xD000000000000025;
  v36._object = (void *)0xE800000000000000;
  v19._object = (void *)0x8000000100019A50;
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  v36._countAndFlagsBits = 0x6565726761736944;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v19, (Swift::String_optional)0, (NSBundle)v18, v20, v36);

  NSString v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v17 setTitle:v21 forState:0];

  NSString v22 = self;
  if (objc_msgSend(v22, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v17, "semanticContentAttribute")))
  {
    id v23 = [self sharedApplication];
    id v24 = [v23 preferredContentSizeCategory];

    LOBYTE(v23) = UIContentSizeCategory.isAccessibilityCategory.getter();
    if (v23) {
      uint64_t v2 = 1;
    }
    else {
      uint64_t v2 = 2;
    }
  }
  [v17 setContentHorizontalAlignment:v2];
  [v17 addTarget:v0 action:"disagreeButtonAction" forControlEvents:64];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v25 = *(void **)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_agreeButton);
  id v26 = [v6 mainBundle];
  v27._countAndFlagsBits = 0xD000000000000022;
  v37._object = (void *)0xE500000000000000;
  v27._object = (void *)0x8000000100019A80;
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  v37._countAndFlagsBits = 0x6565726741;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v27, (Swift::String_optional)0, (NSBundle)v26, v28, v37);

  NSString v29 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v25 setTitle:v29 forState:0];

  if (objc_msgSend(v22, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v25, "semanticContentAttribute"))|| (id v30 = objc_msgSend(self, "sharedApplication"), v31 = objc_msgSend(v30, "preferredContentSizeCategory"), v30, LOBYTE(v30) = UIContentSizeCategory.isAccessibilityCategory.getter(), v31, (v30 & 1) != 0))
  {
    uint64_t v32 = 1;
  }
  else
  {
    uint64_t v32 = 2;
  }
  [v25 setContentHorizontalAlignment:v32];
  [v25 addTarget:v0 action:"agreeButtonAction" forControlEvents:64];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
}

uint64_t sub_10000A05C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = self;
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v5 localizedStringForKey:v6];

  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = v9;

  NSString v11 = self;
  id v12 = [v11 mainBundle];
  v22._object = (void *)0xE000000000000000;
  v13._uint64_t countAndFlagsBits = v8;
  v13._object = v10;
  v14._uint64_t countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  v22._uint64_t countAndFlagsBits = 0;
  Swift::String v15 = NSLocalizedString(_:tableName:bundle:value:comment:)(v13, (Swift::String_optional)0, (NSBundle)v12, v14, v22);
  swift_bridgeObjectRelease();

  BOOL v16 = v15._countAndFlagsBits == a2 && v15._object == a3;
  if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    id v17 = [v11 mainBundle];
    v23._object = (void *)0xE000000000000000;
    v18._uint64_t countAndFlagsBits = a2;
    v18._object = a3;
    v19._uint64_t countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    v23._uint64_t countAndFlagsBits = 0;
    uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v18, (Swift::String_optional)0, (NSBundle)v17, v19, v23)._countAndFlagsBits;
  }
  else
  {
    uint64_t countAndFlagsBits = String.init(format:arguments:)();
    swift_bridgeObjectRelease();
  }
  return countAndFlagsBits;
}

void sub_10000A218()
{
  id v1 = [v0 contentView];
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsSubview];
  [v1 addSubview:v2];

  [v2 addSubview:*(void *)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsTextView]];
  id v3 = [v0 contentView];
  [v3 addSubview:*(void *)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_disagreeButton]];

  id v4 = [v0 contentView];
  [v4 addSubview:*(void *)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_agreeButton]];
}

void sub_10000A310()
{
  id v1 = v0;
  id v2 = [v0 contentView];
  id v3 = [v2 mainContentGuide];

  v60 = self;
  sub_100006364(&qword_1000274B8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100018860;
  uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsSubview];
  id v6 = [v5 topAnchor];
  id v7 = [v3 topAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7];

  *(void *)(v4 + 32) = v8;
  id v9 = [v5 bottomAnchor];
  id v10 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_agreeButton];
  id v11 = [v10 topAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11];

  *(void *)(v4 + 40) = v12;
  id v13 = [v5 leadingAnchor];
  id v14 = [v3 leadingAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14];

  *(void *)(v4 + 48) = v15;
  id v16 = [v5 trailingAnchor];
  id v17 = [v3 trailingAnchor];
  id v18 = [v16 constraintEqualToAnchor:v17];

  *(void *)(v4 + 56) = v18;
  id v19 = [v5 heightAnchor];
  id v20 = [v19 constraintEqualToConstant:300.0];

  *(void *)(v4 + 64) = v20;
  NSString v21 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsTextView];
  id v22 = [v21 topAnchor];
  id v23 = [v5 topAnchor];
  id v24 = [v22 constraintEqualToAnchor:v23];

  *(void *)(v4 + 72) = v24;
  id v25 = [v21 bottomAnchor];
  id v26 = [v5 bottomAnchor];
  id v27 = [v25 constraintEqualToAnchor:v26 constant:-15.0];

  *(void *)(v4 + 80) = v27;
  id v28 = [v21 leadingAnchor];
  id v29 = [v5 leadingAnchor];
  id v30 = [v28 constraintEqualToAnchor:v29 constant:15.0];

  *(void *)(v4 + 88) = v30;
  id v31 = [v21 trailingAnchor];
  id v32 = [v5 trailingAnchor];
  id v33 = [v31 constraintEqualToAnchor:v32 constant:-15.0];

  *(void *)(v4 + 96) = v33;
  id v34 = [v21 widthAnchor];
  id v35 = [v5 widthAnchor];
  id v36 = [v34 constraintEqualToAnchor:v35 constant:-30.0];

  *(void *)(v4 + 104) = v36;
  Swift::String v37 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_disagreeButton];
  id v38 = [v37 bottomAnchor];
  id v39 = [v10 bottomAnchor];
  id v40 = [v38 constraintEqualToAnchor:v39];

  *(void *)(v4 + 112) = v40;
  id v41 = [v37 topAnchor];
  id v42 = [v10 topAnchor];
  id v43 = [v41 constraintEqualToAnchor:v42];

  *(void *)(v4 + 120) = v43;
  id v44 = [v37 leadingAnchor];
  id v45 = [v5 leadingAnchor];
  id v46 = [v44 constraintEqualToAnchor:v45];

  *(void *)(v4 + 128) = v46;
  id v47 = [v37 widthAnchor];
  id v48 = [v47 constraintGreaterThanOrEqualToConstant:44.0];

  *(void *)(v4 + 136) = v48;
  id v49 = [v10 bottomAnchor];
  id v50 = [v3 bottomAnchor];
  id v51 = [v49 constraintEqualToAnchor:v50];

  *(void *)(v4 + 144) = v51;
  id v52 = [v10 topAnchor];
  id v53 = [v5 bottomAnchor];
  id v54 = [v52 constraintLessThanOrEqualToAnchor:v53 constant:15.0];

  *(void *)(v4 + 152) = v54;
  id v55 = [v10 trailingAnchor];
  id v56 = [v5 trailingAnchor];
  id v57 = [v55 constraintEqualToAnchor:v56];

  *(void *)(v4 + 160) = v57;
  id v58 = [v10 widthAnchor];
  id v59 = [v58 constraintGreaterThanOrEqualToConstant:44.0];

  *(void *)(v4 + 168) = v59;
  specialized Array._endMutation()();
  sub_1000063A8(0, &qword_100027A70);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v60 activateConstraints:isa];
}

void sub_10000AAD4()
{
  id v1 = *(void **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_agreeButton];
  NSString v2 = String._bridgeToObjectiveC()();
  [v1 setTitle:v2 forState:0];

  id v3 = *(void **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_disagreeButton];
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 setTitle:v4 forState:0];

  [v1 setEnabled:0];
  [v3 setEnabled:0];
  id v5 = [self mainBundle];
  v14._object = (void *)0xED00002E2E2E676ELL;
  v6._object = (void *)0x8000000100019980;
  v6._uint64_t countAndFlagsBits = 0xD000000000000017;
  v7._uint64_t countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v14._uint64_t countAndFlagsBits = 0x697463656E6E6F43;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v14);

  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 showActivityIndicatorWithStatus:v8];

  id v9 = *(unsigned char **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_remoteSetupManager];
  if (v9)
  {
    id v10 = *(void **)&v9[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient];
    if (v10 && v9[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState])
    {
      v9[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState] = 2;
      [v10 activate];
    }
    else
    {
      sub_1000063A8(0, (unint64_t *)&qword_100027A40);
      id v11 = v9;
      id v12 = (id)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();
    }
  }
}

id sub_10000ADA0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TermsAndConditionsCardViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for TermsAndConditionsCardViewController()
{
  return self;
}

uint64_t sub_10000AE74@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for AttributeContainer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a3, a1, v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000B4AC();
  id v7 = a2;
  return AttributeContainer.subscript.setter();
}

uint64_t sub_10000AF30()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

id sub_10000AF8C(uint64_t a1)
{
  sub_100006364(&qword_100027818);
  ((void (*)(void))__chkstk_darwin)();
  NSString v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UIButton.Configuration();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v11 = (char *)&v35 - v10;
  uint64_t v12 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_remoteSetupManager;
  uint64_t v13 = qword_100027440;
  Swift::String v14 = v1;
  if (v13 != -1) {
    swift_once();
  }
  id v15 = (void *)qword_100028770;
  *(void *)&v14[v12] = qword_100028770;
  *(void *)&v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_fontSizeTitle] = 0x403C000000000000;
  *(void *)&v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_fontSizeBody] = 0x4034000000000000;
  *(void *)&v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_buttonMinimumWidth] = 0x4046000000000000;
  *(void *)&v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_legalTextPadding] = 0x402E000000000000;
  v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_textSized] = 0;
  uint64_t v16 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsSubview;
  id v17 = objc_allocWithZone((Class)UIScrollView);
  id v18 = v15;
  *(void *)&v14[v16] = [v17 init];
  uint64_t v19 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsTextView;
  *(void *)&v14[v19] = [objc_allocWithZone((Class)UITextView) init];
  id v20 = [self defaultMetrics];
  id v21 = [self systemFontOfSize:20.0];
  id v22 = [v20 scaledFontForFont:v21];

  static UIButton.Configuration.plain()();
  *(void *)(swift_allocObject() + 16) = v22;
  id v23 = v22;
  UIConfigurationTextAttributesTransformer.init(_:)();
  uint64_t v24 = type metadata accessor for UIConfigurationTextAttributesTransformer();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v4, 0, 1, v24);
  UIButton.Configuration.titleTextAttributesTransformer.setter();
  sub_1000063A8(0, &qword_100027820);
  id v25 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v25(v9, v11, v5);
  *(void *)&v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_disagreeButton] = UIButton.init(configuration:primaryAction:)();
  v25(v9, v11, v5);
  *(void *)&v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_agreeButton] = UIButton.init(configuration:primaryAction:)();

  id v26 = (objc_class *)type metadata accessor for TermsAndConditionsCardViewController();
  v35.receiver = v14;
  v35.super_class = v26;
  id v27 = [super initWithContentView:a1];
  [v27 setDismissalType:0];
  id v28 = self;
  id v29 = v27;
  id v30 = [v28 mainBundle];
  v36._object = (void *)0xEA0000000000656CLL;
  v31._object = (void *)0x8000000100019AB0;
  v31._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
  v32._uint64_t countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  v36._uint64_t countAndFlagsBits = 0x7469742064726143;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v31, (Swift::String_optional)0, (NSBundle)v30, v32, v36);

  NSString v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v29 setTitle:v33];

  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v29;
}

uint64_t sub_10000B44C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000B484@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000AE74(a1, *(void **)(v2 + 16), a2);
}

void sub_10000B48C()
{
}

unint64_t sub_10000B4AC()
{
  unint64_t result = qword_100027828;
  if (!qword_100027828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027828);
  }
  return result;
}

void sub_10000B500()
{
}

uint64_t sub_10000B528()
{
  return 8;
}

uint64_t sub_10000B534()
{
  return swift_release();
}

uint64_t sub_10000B53C(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_10000B54C()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

void *sub_10000B594(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void sub_10000B5A0()
{
  id v0 = [self standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  [v0 addSuiteNamed:v1];

  qword_100027838 = (uint64_t)v0;
}

void sub_10000B620()
{
  if (qword_100027400 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_100027838;
  NSString v1 = String._bridgeToObjectiveC()();
  LOBYTE(v0) = [v0 BOOLForKey:v1];

  byte_100028740 = (char)v0;
}

uint64_t sub_10000B6B8()
{
  uint64_t result = sub_10000B6D8();
  byte_100028741 = result;
  return result;
}

uint64_t sub_10000B6D8()
{
  if (qword_100027400 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_100027838;
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (!v2) {
    return 2;
  }
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10000BB00(v8, v9);
  sub_100008E68((uint64_t)v9, (uint64_t)v8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_10000BB10((uint64_t)v9);
    return 2;
  }
  uint64_t v3 = v7;
  sub_100006364((uint64_t *)&unk_1000275F0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000187D0;
  *(void *)(v4 + 56) = &type metadata for Bool;
  *(void *)(v4 + 64) = &protocol witness table for Bool;
  *(unsigned char *)(v4 + 32) = v7;
  sub_1000098D0();
  uint64_t v5 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  sub_10000BB10((uint64_t)v9);
  return v3;
}

unint64_t sub_10000B880()
{
  unint64_t result = sub_10000B8AC();
  dword_100028744 = result;
  byte_100028748 = BYTE4(result) & 1;
  return result;
}

unint64_t sub_10000B8AC()
{
  if (qword_100027400 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_100027838;
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_100008FFC((uint64_t)v9, (uint64_t)v10);
  if (!v11)
  {
    sub_100008CCC((uint64_t)v10);
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_10:
    uint64_t v3 = 0;
    unsigned __int8 v6 = 1;
    return v3 | ((unint64_t)v6 << 32);
  }
  uint64_t v3 = v8;
  sub_100006364((uint64_t *)&unk_1000275F0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000187D0;
  *(void *)(v4 + 56) = &type metadata for Int32;
  *(void *)(v4 + 64) = &protocol witness table for Int32;
  *(_DWORD *)(v4 + 32) = v8;
  sub_1000098D0();
  uint64_t v5 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  unsigned __int8 v6 = 0;
  return v3 | ((unint64_t)v6 << 32);
}

id sub_10000BAA4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteSetupUserDefaults();
  [super dealloc];
}

uint64_t type metadata accessor for RemoteSetupUserDefaults()
{
  return self;
}

_OWORD *sub_10000BB00(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000BB10(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

char *sub_10000BB60(void *a1)
{
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for SetupFailedCardViewController();
  uint64_t v3 = (char *)[v12 initWithContentView:a1];
  uint64_t v4 = &v3[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle];
  *(void *)uint64_t v4 = 0xD000000000000011;
  *((void *)v4 + 1) = 0x8000000100019C60;
  uint64_t v5 = v3;
  swift_bridgeObjectRelease();
  unsigned __int8 v6 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase];
  *(void *)unsigned __int8 v6 = 0xD000000000000014;
  *((void *)v6 + 1) = 0x8000000100019C80;
  swift_bridgeObjectRelease();
  unsigned __int8 v7 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText];
  *(void *)unsigned __int8 v7 = 0xD000000000000017;
  *((void *)v7 + 1) = 0x8000000100019CA0;
  swift_bridgeObjectRelease();
  unsigned int v8 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName];
  *(void *)unsigned int v8 = 0xD000000000000016;
  *((void *)v8 + 1) = 0x8000000100019CC0;
  swift_bridgeObjectRelease();
  id v9 = [self systemRedColor];
  uint64_t v10 = *(void **)&v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor];
  *(void *)&v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor] = v9;

  return v5;
}

id sub_10000BCF0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetupFailedCardViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for SetupFailedCardViewController()
{
  return self;
}

char *sub_10000BD48(void *a1)
{
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for SetupCancelledCardViewController();
  uint64_t v3 = (char *)[super initWithContentView:a1];
  uint64_t v4 = &v3[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle];
  *(void *)uint64_t v4 = 0xD000000000000014;
  *((void *)v4 + 1) = 0x8000000100019D30;
  uint64_t v5 = v3;
  swift_bridgeObjectRelease();
  unsigned __int8 v6 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase];
  *(void *)unsigned __int8 v6 = 0xD000000000000017;
  *((void *)v6 + 1) = 0x8000000100019D50;
  swift_bridgeObjectRelease();
  unsigned __int8 v7 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText];
  *(void *)unsigned __int8 v7 = 0xD00000000000001ALL;
  *((void *)v7 + 1) = 0x8000000100019D70;
  swift_bridgeObjectRelease();
  unsigned int v8 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName];
  *(void *)unsigned int v8 = 0xD000000000000020;
  *((void *)v8 + 1) = 0x8000000100019D90;
  swift_bridgeObjectRelease();
  id v9 = [self systemOrangeColor];
  uint64_t v10 = *(void **)&v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor];
  *(void *)&v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor] = v9;

  return v5;
}

id sub_10000BED8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetupCancelledCardViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for SetupCancelledCardViewController()
{
  return self;
}

uint64_t sub_10000BF30()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_remoteSetupManager);
  if (!v2) {
    goto LABEL_11;
  }
  int v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v3 == 11)
  {
    uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase);
    swift_bridgeObjectRetain();
    uint64_t v4 = 0x4E4F495349565FLL;
    goto LABEL_8;
  }
  if (v3 == 3)
  {
    uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase);
    swift_bridgeObjectRetain();
    uint64_t v4 = 0x444150495FLL;
    unint64_t v5 = 0xE500000000000000;
    goto LABEL_10;
  }
  if (v3 != 1)
  {
LABEL_11:
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    unsigned __int8 v7 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase);
    swift_bridgeObjectRetain();
    return v6;
  }
  uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase);
  swift_bridgeObjectRetain();
  uint64_t v4 = 0x454E4F4850495FLL;
LABEL_8:
  unint64_t v5 = 0xE700000000000000;
LABEL_10:
  String.append(_:)(*(Swift::String *)&v4);
  return v9;
}

id sub_10000C0F0(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_remoteSetupManager;
  uint64_t v4 = qword_100027440;
  unint64_t v5 = v1;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_100028770;
  *(void *)&v5[v3] = qword_100028770;
  unsigned __int8 v7 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle];
  *(void *)unsigned __int8 v7 = 0xD000000000000016;
  *((void *)v7 + 1) = 0x8000000100019E80;
  unsigned int v8 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase];
  *(void *)unsigned int v8 = 0xD000000000000019;
  *((void *)v8 + 1) = 0x8000000100019EA0;
  uint64_t v9 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText];
  *(void *)uint64_t v9 = 0xD00000000000001CLL;
  *((void *)v9 + 1) = 0x8000000100019EC0;
  uint64_t v10 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName];
  strcpy(&v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName], "ladybug.circle");
  v10[15] = -18;
  uint64_t v11 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor;
  objc_super v12 = self;
  id v13 = v6;
  *(void *)&v5[v11] = [v12 systemPurpleColor];
  *(void *)&v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolSize] = 0x4052000000000000;

  v16.receiver = v5;
  v16.super_class = (Class)type metadata accessor for SFSymbolCardViewController();
  id v14 = [super initWithContentView:a1];
  [v14 setDismissalType:1];

  return v14;
}

void sub_10000C2D8(char a1)
{
  uint64_t v2 = v1;
  v38.receiver = v2;
  v38.super_class = (Class)type metadata accessor for SFSymbolCardViewController();
  [super viewWillAppear:a1 & 1];
  uint64_t v5 = *(void *)&v2[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle];
  uint64_t v4 = *(void **)&v2[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle + 8];
  uint64_t v6 = self;
  swift_bridgeObjectRetain();
  id v7 = [v6 mainBundle];
  v39._object = (void *)0xEA0000000000656CLL;
  v8._uint64_t countAndFlagsBits = v5;
  v8._object = v4;
  v9._uint64_t countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v39._uint64_t countAndFlagsBits = 0x7469742064726143;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v9, v39);
  swift_bridgeObjectRelease();

  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v2 setTitle:v10];

  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v13 = *(void *)&v2[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText];
  objc_super v12 = *(void **)&v2[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText + 8];
  swift_bridgeObjectRetain();
  id v14 = [v6 mainBundle];
  v40._object = (void *)0xEB000000006E6F74;
  v15._uint64_t countAndFlagsBits = v13;
  v15._object = v12;
  v16._uint64_t countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v40._uint64_t countAndFlagsBits = 0x74756220656E6F44;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v15, (Swift::String_optional)0, (NSBundle)v14, v16, v40);
  swift_bridgeObjectRelease();

  swift_retain();
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_10000CA4C;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010158;
  void aBlock[3] = &unk_100020DA0;
  id v18 = _Block_copy(aBlock);
  id v19 = [self actionWithTitle:v17 style:0 handler:v18];

  _Block_release(v18);
  swift_release();

  swift_bridgeObjectRetain();
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v21 = [self systemImageNamed:v20];

  id v22 = [objc_allocWithZone((Class)UIImageView) initWithImage:v21];
  [v22 setTintColor:*(void *)&v2[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor]];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v23 = [self configurationWithPointSize:*(double *)&v2[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolSize]];
  [v22 setPreferredSymbolConfiguration:v23];

  [v22 setContentMode:1];
  id v24 = [v2 contentView];
  sub_100006364(&qword_1000274B8);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_100018980;
  *(void *)(v25 + 32) = v22;
  aBlock[0] = v25;
  specialized Array._endMutation()();
  sub_1000063A8(0, &qword_100027918);
  id v26 = v22;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v24 setImageViews:isa];

  id v28 = [objc_allocWithZone((Class)PRXLabel) initWithStyle:1];
  uint64_t v29 = sub_10000BF30();
  Swift::String v31 = v30;
  id v32 = [v6 mainBundle];
  v41._object = (void *)0xED0000656C746974;
  v33._uint64_t countAndFlagsBits = v29;
  v33._object = v31;
  v34._uint64_t countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  v41._uint64_t countAndFlagsBits = 0x6275732064726143;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v33, (Swift::String_optional)0, (NSBundle)v32, v34, v41);
  swift_bridgeObjectRelease();

  NSString v35 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setText:v35];

  id v36 = [v2 contentView];
  [v36 setBodyLabel:v28];
  swift_release();
}

void sub_10000C868()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    [Strong dismissViewControllerAnimated:1 completion:0];
  }
}

id sub_10000C920()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFSymbolCardViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for SFSymbolCardViewController()
{
  return self;
}

uint64_t sub_10000CA14()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000CA4C()
{
}

uint64_t sub_10000CA54(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000CA64()
{
  return swift_release();
}

uint64_t sub_10000CA6C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_10000CAB0(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup25WelcomeCardViewController_remoteSetupManager;
  uint64_t v4 = qword_100027440;
  uint64_t v5 = v1;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_100028770;
  *(void *)&v5[v3] = qword_100028770;
  id v7 = v6;

  v43.receiver = v5;
  v43.super_class = (Class)type metadata accessor for WelcomeCardViewController();
  [super initWithContentView:a1];
  [v8 setDismissalType:1];
  Swift::String v41 = a1;
  Swift::String v9 = self;
  id v10 = v8;
  id v11 = [v9 mainBundle];
  v44._object = (void *)0xEA0000000000656CLL;
  v12._object = (void *)0x800000010001A2C0;
  v12._uint64_t countAndFlagsBits = 0xD000000000000012;
  v13._uint64_t countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  v44._uint64_t countAndFlagsBits = 0x7469742064726143;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v44);

  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v10 setTitle:v14];

  id v15 = v10;
  id v16 = [v9 mainBundle];
  v45._uint64_t countAndFlagsBits = 0xD000000000000018;
  v17._uint64_t countAndFlagsBits = 0xD000000000000019;
  v45._object = (void *)0x800000010001A300;
  v17._object = (void *)0x800000010001A2E0;
  v18._uint64_t countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v17, (Swift::String_optional)0, (NSBundle)v16, v18, v45);

  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_10000DF14;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010158;
  void aBlock[3] = &unk_100020DF0;
  id v21 = _Block_copy(aBlock);
  id v22 = [self actionWithTitle:v20 style:0 handler:v21];

  _Block_release(v21);
  swift_release();
  swift_release();

  sub_1000063A8(0, &qword_100027950);
  v23._uint64_t countAndFlagsBits = 0x74736F6E67616944;
  v23._object = (void *)0xEB00000000736369;
  Class isa = UIImage.init(imageLiteralResourceName:)(v23).super.isa;
  id v25 = [objc_allocWithZone((Class)UIImageView) initWithImage:isa];
  id v26 = [v15 contentView];
  sub_100006364(&qword_1000274B8);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_100018980;
  *(void *)(v27 + 32) = v25;
  aBlock[0] = v27;
  specialized Array._endMutation()();
  sub_1000063A8(0, &qword_100027918);
  id v28 = v25;
  Class v29 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v26 setImageViews:v29];

  id v30 = [objc_allocWithZone((Class)PRXLabel) initWithStyle:1];
  uint64_t v31 = sub_10000D744();
  Swift::String v33 = v32;
  id v34 = [v9 mainBundle];
  v46._uint64_t countAndFlagsBits = 0xD000000000000015;
  v46._object = (void *)0x800000010001A320;
  v35._uint64_t countAndFlagsBits = v31;
  v35._object = v33;
  v36._uint64_t countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v35, (Swift::String_optional)0, (NSBundle)v34, v36, v46);
  swift_bridgeObjectRelease();

  NSString v37 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v30 setText:v37];

  id v38 = [v15 contentView];
  id v39 = v30;
  [v38 setBodyLabel:v39];

  return v15;
}

void sub_10000D00C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = [self mainBundle];
    v11._object = (void *)0xED00002E2E2E676ELL;
    v3._object = (void *)0x8000000100019980;
    v3._uint64_t countAndFlagsBits = 0xD000000000000017;
    v4._uint64_t countAndFlagsBits = 0;
    v4._object = (void *)0xE000000000000000;
    v11._uint64_t countAndFlagsBits = 0x697463656E6E6F43;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v3, (Swift::String_optional)0, (NSBundle)v2, v4, v11);

    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v1 showActivityIndicatorWithStatus:v5];

    uint64_t v6 = self;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v1;
    aBlock[4] = sub_10000DF34;
    aBlock[5] = v7;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000D558;
    void aBlock[3] = &unk_100020E40;
    id v8 = _Block_copy(aBlock);
    id v9 = v1;
    swift_release();
    [v6 prepareLocalizedStringsWithCompletionHandler:v8];
    _Block_release(v8);
  }
}

uint64_t sub_10000D1D4(char a1, uint64_t a2, void *a3)
{
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  Swift::String v12 = (char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    static os_log_type_t.error.getter();
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    Swift::String v13 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
  }
  sub_1000063A8(0, &qword_100027958);
  NSString v14 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  aBlock[4] = sub_10000DF74;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000CA6C;
  void aBlock[3] = &unk_100020E90;
  id v16 = _Block_copy(aBlock);
  id v17 = a3;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000DF7C();
  sub_100006364(&qword_100027968);
  sub_10000DFD4();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

void sub_10000D4C4(void *a1)
{
  type metadata accessor for TermsAndConditionsCardViewController();
  id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  id v2 = [a1 navigationController];
  if (v2)
  {
    Swift::String v3 = v2;
    [v2 pushViewController:v4 animated:1];
  }
}

void sub_10000D558(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

unint64_t sub_10000D600()
{
  unint64_t v1 = 0xD000000000000015;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup25WelcomeCardViewController_remoteSetupManager);
  if (!v2) {
    goto LABEL_9;
  }
  int v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v3 == 1) {
    return 0xD00000000000001CLL;
  }
  if (v3 == 11) {
    return 0xD00000000000001CLL;
  }
  if (v3 != 3)
  {
LABEL_9:
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    id v4 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    return v1;
  }
  return 0xD00000000000001ALL;
}

uint64_t sub_10000D744()
{
  unint64_t v0 = sub_10000D600();
  uint64_t v2 = v1;
  id v3 = [self mainBundle];
  v20._object = (void *)0x8000000100019FC0;
  v4._uint64_t countAndFlagsBits = v0;
  v4._object = v2;
  v5._uint64_t countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  v20._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v4, (Swift::String_optional)0, (NSBundle)v3, v5, v20);
  swift_bridgeObjectRelease();

  uint64_t v6 = sub_10000D974();
  if (v7)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v7;
    sub_100006364((uint64_t *)&unk_1000275F0);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_1000187D0;
    *(void *)(v10 + 56) = &type metadata for String;
    *(void *)(v10 + 64) = sub_100008FA8();
    *(void *)(v10 + 32) = v8;
    *(void *)(v10 + 40) = v9;
    v11._uint64_t countAndFlagsBits = String.init(format:_:)();
    String.append(_:)(v11);
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = sub_10000DBB8();
  if (v13)
  {
    uint64_t v14 = v12;
    uint64_t v15 = v13;
    sub_100006364((uint64_t *)&unk_1000275F0);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1000187D0;
    *(void *)(v16 + 56) = &type metadata for String;
    *(void *)(v16 + 64) = sub_100008FA8();
    *(void *)(v16 + 32) = v14;
    *(void *)(v16 + 40) = v15;
    v17._uint64_t countAndFlagsBits = String.init(format:_:)();
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
  }
  uint64_t v18 = String.init(format:_:)();
  swift_bridgeObjectRelease();
  return v18;
}

id sub_10000D90C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WelcomeCardViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for WelcomeCardViewController()
{
  return self;
}

uint64_t sub_10000D974()
{
  if (qword_100027428 != -1) {
    swift_once();
  }
  if (byte_100028749) {
    unint64_t v0 = (void *)0x800000010001A170;
  }
  else {
    unint64_t v0 = (void *)0x800000010001A0E0;
  }
  id v1 = [self mainBundle];
  v12._object = (void *)0xE700000000000000;
  v2._uint64_t countAndFlagsBits = 0xD000000000000026;
  v2._object = v0;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v12._uint64_t countAndFlagsBits = 0x6B726F7774654ELL;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v2, (Swift::String_optional)0, (NSBundle)v1, v3, v12);

  swift_bridgeObjectRelease();
  if (qword_100027420 != -1) {
    swift_once();
  }
  id v4 = [(id)qword_100027A90 networkName];
  if (v4)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;

    sub_100006364((uint64_t *)&unk_1000275F0);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1000187D0;
    *(void *)(v8 + 56) = &type metadata for String;
    *(void *)(v8 + 64) = sub_100008FA8();
    *(void *)(v8 + 32) = v5;
    *(void *)(v8 + 40) = v7;
    uint64_t v9 = String.init(format:_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    static os_log_type_t.error.getter();
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    uint64_t v10 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();

    return 0;
  }
  return v9;
}

uint64_t sub_10000DBB8()
{
  uint64_t v0 = type metadata accessor for Locale();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  Swift::String v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = self;
  id v5 = [v4 mainBundle];
  v21._object = (void *)0xE800000000000000;
  v6._object = (void *)0x8000000100019FE0;
  v6._uint64_t countAndFlagsBits = 0xD00000000000002ALL;
  v7._uint64_t countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v21._uint64_t countAndFlagsBits = 0x65676175676E614CLL;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v21);

  id v8 = [v4 mainBundle];
  id v9 = [v8 preferredLocalizations];

  uint64_t v10 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v10[2])
  {
    uint64_t v11 = v10[4];
    Swift::String v12 = (void *)v10[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    static Locale.current.getter();
    v13._uint64_t countAndFlagsBits = v11;
    v13._object = v12;
    Swift::String_optional v14 = Locale.localizedString(forLanguageCode:)(v13);
    uint64_t countAndFlagsBits = v14.value._countAndFlagsBits;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    if (v14.value._object)
    {
      sub_100006364((uint64_t *)&unk_1000275F0);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_1000187D0;
      *(void *)(v16 + 56) = &type metadata for String;
      *(void *)(v16 + 64) = sub_100008FA8();
      *(Swift::String_optional *)(v16 + 32) = v14;
      uint64_t countAndFlagsBits = String.init(format:_:)();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      static os_log_type_t.error.getter();
      sub_1000063A8(0, (unint64_t *)&qword_100027A40);
      uint64_t v18 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    static os_log_type_t.error.getter();
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    Swift::String v17 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();

    return 0;
  }
  return countAndFlagsBits;
}

uint64_t sub_10000DEDC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000DF14()
{
}

uint64_t sub_10000DF1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000DF2C()
{
  return swift_release();
}

uint64_t sub_10000DF34(char a1, uint64_t a2)
{
  return sub_10000D1D4(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_10000DF3C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000DF74()
{
  sub_10000D4C4(*(void **)(v0 + 16));
}

unint64_t sub_10000DF7C()
{
  unint64_t result = qword_100027960;
  if (!qword_100027960)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027960);
  }
  return result;
}

unint64_t sub_10000DFD4()
{
  unint64_t result = qword_100027970;
  if (!qword_100027970)
  {
    sub_10000E030(&qword_100027968);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027970);
  }
  return result;
}

uint64_t sub_10000E030(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id sub_10000E08C(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_cameraPreviewOffsetFromLabel] = 0x4039000000000000;
  *(void *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_cameraPreviewAspectRatioHeightMultiplier] = 0x3FE5555555555555;
  *(void *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_previewView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_capturePreviewLayer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession] = 0;
  v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_codeCaptured] = 0;
  uint64_t v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_remoteSetupManager;
  uint64_t v4 = qword_100027440;
  id v5 = v1;
  if (v4 != -1) {
    swift_once();
  }
  Swift::String v6 = (void *)qword_100028770;
  *(void *)&v5[v3] = qword_100028770;
  id v7 = v6;

  v24.receiver = v5;
  v24.super_class = (Class)type metadata accessor for QRCodeScannerCardViewController();
  [super initWithContentView:a1];
  [v8 setDismissalType:1];
  id v9 = self;
  id v10 = v8;
  id v11 = [v9 mainBundle];
  v25._object = (void *)0xEA0000000000656CLL;
  v12._object = (void *)0x800000010001A770;
  v12._uint64_t countAndFlagsBits = 0xD000000000000015;
  v13._uint64_t countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  v25._uint64_t countAndFlagsBits = 0x7469742064726143;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v25);

  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v10 setTitle:v14];

  id v15 = v10;
  unint64_t v16 = sub_10000F460();
  uint64_t v18 = v17;
  id v19 = [v9 mainBundle];
  v26._object = (void *)0xEF736E6F69746365;
  v20._uint64_t countAndFlagsBits = v16;
  v20._object = v18;
  v21._uint64_t countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  v26._uint64_t countAndFlagsBits = 0x726964206E616353;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v20, (Swift::String_optional)0, (NSBundle)v19, v21, v26);
  swift_bridgeObjectRelease();

  NSString v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v15 setSubtitle:v22];

  return v15;
}

void sub_10000E4C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_capturePreviewLayer;
  uint64_t v4 = *(void **)(a2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_capturePreviewLayer);
  if (v4)
  {
    id v5 = [v4 connection];
    if (v5)
    {
      Swift::String v6 = v5;
      sub_10000F168();
      [v6 setVideoOrientation:v7];
    }
  }
  id v8 = *(void **)(a2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_previewView);
  if (v8)
  {
    id v9 = *(void **)(a2 + v3);
    if (v9)
    {
      id v11 = v8;
      id v10 = v9;
      [v11 bounds];
      [v10 setFrame:];
    }
  }
}

uint64_t sub_10000E5B4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_10000E74C()
{
  [v0 dismissViewControllerAnimated:1 completion:0];
  uint64_t v1 = *(unsigned char **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_remoteSetupManager];
  if (v1)
  {
    v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState] = 1;
    uint64_t v2 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient];
    uint64_t v3 = v1;
    if (v2) {
      [v2 invalidate];
    }
    id v4 = [self defaultCenter];
    id v5 = v4;
    if (qword_100027470 != -1)
    {
      swift_once();
      id v4 = v5;
    }
    [v4 postNotificationName:qword_1000287A0 object:0 userInfo:0];
  }
}

void sub_10000E874()
{
  uint64_t v1 = v0;
  id v66 = [objc_allocWithZone((Class)AVCaptureSession) init];
  id v2 = [self defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInWideAngleCamera mediaType:AVMediaTypeVideo position:1];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = objc_allocWithZone((Class)AVCaptureDeviceInput);
    id v68 = 0;
    id v5 = v3;
    id v6 = [v4 initWithDevice:v5 error:&v68];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = v68;

      if ([v66 canAddInput:v7]) {
        [v66 addInput:v7];
      }

      [v66 commitConfiguration];
      id v9 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession];
      *(void *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession] = v66;
      id v10 = v66;

      id v11 = [v1 contentView];
      [v11 frame];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;

      id v20 = [objc_allocWithZone((Class)UIView) initWithFrame:v13, v15, v17, v19];
      [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v21 = [self blackColor];
      [v20 setBackgroundColor:v21];

      id v22 = [v1 contentView];
      [v22 addSubview:v20];

      Swift::String v23 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_previewView];
      *(void *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_previewView] = v20;
      id v24 = v20;

      id v25 = [v1 contentView];
      id v26 = [v25 mainContentGuide];

      [v26 layoutFrame];
      double Width = CGRectGetWidth(v70);
      id v28 = [v1 contentView];
      id v29 = [v28 subtitleLabel];

      if (v29)
      {
        id v67 = self;
        sub_100006364(&qword_1000274B8);
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = xmmword_1000189D0;
        id v31 = [v24 topAnchor];
        v65 = v29;
        id v32 = [v29 bottomAnchor];
        id v33 = [v31 constraintGreaterThanOrEqualToAnchor:v32 constant:*(double *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_cameraPreviewOffsetFromLabel]];

        *(void *)(v30 + 32) = v33;
        id v34 = [v24 bottomAnchor];
        id v35 = [v1 contentView];
        id v36 = [v35 bottomAnchor];

        id v37 = [v34 constraintEqualToAnchor:v36];
        *(void *)(v30 + 40) = v37;
        id v38 = [v24 centerXAnchor];
        id v39 = [v26 centerXAnchor];
        id v40 = [v38 constraintEqualToAnchor:v39];

        *(void *)(v30 + 48) = v40;
        id v41 = [v24 centerYAnchor];
        id v42 = [v26 centerYAnchor];
        id v43 = [v41 constraintEqualToAnchor:v42];

        *(void *)(v30 + 56) = v43;
        id v44 = [v24 widthAnchor];
        id v45 = [v44 constraintEqualToConstant:Width];

        *(void *)(v30 + 64) = v45;
        id v46 = [v24 heightAnchor];
        id v47 = [v46 constraintEqualToConstant:Width * 0.666666667];

        *(void *)(v30 + 72) = v47;
        id v68 = (id)v30;
        specialized Array._endMutation()();
        sub_1000063A8(0, &qword_100027A70);
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v67 activateConstraints:isa];

        id v49 = [v1 view];
        if (v49)
        {
          id v50 = v49;
          [v49 layoutIfNeeded];

          id v51 = [objc_allocWithZone((Class)AVCaptureVideoPreviewLayer) initWithSession:v10];
          [v51 setVideoGravity:AVLayerVideoGravityResizeAspectFill];
          id v52 = [v51 connection];
          if (v52)
          {
            id v53 = v52;
            sub_10000F168();
            [v53 setVideoOrientation:v54];
          }
          id v55 = v51;
          [v24 bounds];
          [v55 setFrame:];

          id v56 = [v24 layer];
          [v56 addSublayer:v55];

          id v57 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_capturePreviewLayer];
          *(void *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_capturePreviewLayer] = v55;
        }
        else
        {
          __break(1u);
        }
      }
      else
      {
        static os_log_type_t.error.getter();
        sub_1000063A8(0, (unint64_t *)&qword_100027A40);
        v64 = (void *)static OS_os_log.default.getter();
        os_log(_:dso:log:type:_:)();

        sub_10000E74C();
      }
    }
    else
    {
      id v58 = v68;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      static os_log_type_t.error.getter();
      sub_100006364((uint64_t *)&unk_1000275F0);
      uint64_t v59 = swift_allocObject();
      *(_OWORD *)(v59 + 16) = xmmword_1000187D0;
      swift_getErrorValue();
      Error.localizedDescription.getter();
      uint64_t v60 = String.debugDescription.getter();
      uint64_t v62 = v61;
      swift_bridgeObjectRelease();
      *(void *)(v59 + 56) = &type metadata for String;
      *(void *)(v59 + 64) = sub_100008FA8();
      *(void *)(v59 + 32) = v60;
      *(void *)(v59 + 40) = v62;
      sub_1000063A8(0, (unint64_t *)&qword_100027A40);
      v63 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();
      swift_bridgeObjectRelease();

      sub_10000E74C();
      swift_errorRelease();
    }
  }
  else
  {
    sub_10000E74C();
  }
}

void sub_10000F168()
{
  id v1 = [v0 parentViewController];
  if (v1)
  {
    id v2 = v1;
    id v3 = [v1 view];

    if (v3)
    {
      id v4 = [v3 window];

      if (v4)
      {
        id v5 = [v4 windowScene];

        if (v5)
        {
          [v5 interfaceOrientation];
        }
      }
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_10000F23C()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession);
  if (v2)
  {
    id v3 = objc_allocWithZone((Class)AVCaptureMetadataOutput);
    id v4 = v2;
    id v5 = [v3 init];
    [v4 addOutput:v5];
    sub_1000063A8(0, &qword_100027958);
    id v6 = (void *)static OS_dispatch_queue.main.getter();
    [v5 setMetadataObjectsDelegate:v1 queue:v6];

    sub_100006364((uint64_t *)&unk_100027A50);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1000187D0;
    *(void *)(v7 + 32) = AVMetadataObjectTypeQRCode;
    type metadata accessor for ObjectType(0);
    id v8 = AVMetadataObjectTypeQRCode;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v5 setMetadataObjectTypes:isa];
  }
  else
  {
    sub_10000E74C();
  }
}

unint64_t sub_10000F460()
{
  unint64_t v1 = 0xD000000000000018;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_remoteSetupManager);
  if (!v2) {
    goto LABEL_9;
  }
  int v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v3 == 1) {
    return 0xD00000000000001FLL;
  }
  if (v3 == 11) {
    return 0xD00000000000001FLL;
  }
  if (v3 != 3)
  {
LABEL_9:
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    id v4 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    return v1;
  }
  return 0xD00000000000001DLL;
}

id sub_10000F5A4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QRCodeScannerCardViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for QRCodeScannerCardViewController()
{
  return self;
}

char *sub_10000F668(char *result, int64_t a2, char a3, char *a4)
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
      sub_100006364((uint64_t *)&unk_100027A80);
      id v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      double v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      double v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_10000F778(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F778(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000F86C(unint64_t a1)
{
  unint64_t v2 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v3 = result;
    uint64_t v30 = v1;
    if (result) {
      goto LABEL_3;
    }
LABEL_19:
    id v32 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v30 = v1;
  if (!v3) {
    goto LABEL_19;
  }
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v5 = 0;
  unint64_t v6 = v2 & 0xC000000000000001;
  unint64_t v31 = v2 & 0xC000000000000001;
  id v32 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v7 = &_s10Foundation15AttributeScopesO5UIKitE0D10AttributesV4fontAF04FontB0Ovg_ptr;
  do
  {
    if (v6) {
      id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v9 = *(id *)(v2 + 8 * v5 + 32);
    }
    id v10 = v9;
    self;
    uint64_t v11 = swift_dynamicCastObjCClass();
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      id v13 = v10;
      id v14 = [v12 stringValue];
      if (v14)
      {
        double v15 = v14;
        unint64_t v16 = v2;
        uint64_t v17 = v3;
        double v18 = v7;
        uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v21 = v20;

        if (swift_isUniquelyReferenced_nonNull_native()) {
          id v22 = v32;
        }
        else {
          id v22 = sub_10000F668(0, *((void *)v32 + 2) + 1, 1, v32);
        }
        unint64_t v24 = *((void *)v22 + 2);
        unint64_t v23 = *((void *)v22 + 3);
        if (v24 >= v23 >> 1) {
          id v22 = sub_10000F668((char *)(v23 > 1), v24 + 1, 1, v22);
        }
        *((void *)v22 + 2) = v24 + 1;
        id v32 = v22;
        uint64_t v8 = &v22[16 * v24];
        *((void *)v8 + 4) = v19;
        *((void *)v8 + 5) = v21;
        unint64_t v6 = v31;
        uint64_t v7 = v18;
        uint64_t v3 = v17;
        unint64_t v2 = v16;
      }
    }
    ++v5;
  }
  while (v3 != v5);
LABEL_20:
  swift_bridgeObjectRelease();
  if (*((void *)v32 + 2)
    && (v30[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_codeCaptured] & 1) == 0)
  {
    uint64_t v26 = *((void *)v32 + 4);
    uint64_t v25 = *((void *)v32 + 5);
    v30[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_codeCaptured] = 1;
    swift_bridgeObjectRetain();
    id v27 = [v30 navigationController];

    id v28 = *(void **)&v30[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_remoteSetupManager];
    if (v28)
    {
      id v29 = v28;
      sub_100014600(v26, v25);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000FB18()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000FB50(uint64_t a1)
{
  sub_10000E4C8(a1, *(void *)(v1 + 16));
}

uint64_t sub_10000FB58(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000FB68()
{
  return swift_release();
}

id sub_10000FB70()
{
  id v0 = [objc_allocWithZone((Class)CWFInterface) init];
  id result = [v0 activate];
  qword_100027A90 = (uint64_t)v0;
  return result;
}

void sub_10000FBBC()
{
  id v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    uint64_t v1 = v0;
    char wapiCapability = MobileGestalt_get_wapiCapability();

    byte_100028749 = wapiCapability;
  }
  else
  {
    __break(1u);
  }
}

id sub_10000FC44()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WifiUtilities();
  return [super dealloc];
}

uint64_t type metadata accessor for WifiUtilities()
{
  return self;
}

uint64_t sub_10000FCA0()
{
  if (qword_100027420 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_100027A90;
  id v1 = [(id)qword_100027A90 currentKnownNetworkProfile];
  if (!v1) {
    return 0;
  }
  objc_super v2 = v1;
  id v3 = [v0 networkName];
  if (!v3
    || (v3,
        (id v4 = [(id)qword_100027A90 networkName]) == 0))
  {
    sub_1000098D0();
    id v14 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  unsigned int v9 = [v2 isCaptive];
  uint64_t v10 = v9 | [v2 wasCaptive];
  sub_1000098D0();
  swift_bridgeObjectRetain();
  uint64_t v11 = static OS_os_log.default.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315650;
    swift_bridgeObjectRetain();
    sub_100011E7C(v6, v8, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v13 + 18) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Captive portal network check - current network: %s, Is currently captive: %{BOOL}d, was previously captive: %{BOOL}d", (uint8_t *)v13, 0x18u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  return v10;
}

char *sub_10000FF6C(void *a1)
{
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for SetupCompleteCardViewController();
  id v3 = [super initWithContentView:a1];
  id v4 = &v3[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle];
  *(void *)id v4 = 0xD000000000000013;
  *((void *)v4 + 1) = 0x800000010001A850;
  uint64_t v5 = v3;
  swift_bridgeObjectRelease();
  uint64_t v6 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase];
  *(void *)uint64_t v6 = 0xD000000000000016;
  *((void *)v6 + 1) = 0x800000010001A870;
  swift_bridgeObjectRelease();
  unint64_t v7 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText];
  *(void *)unint64_t v7 = 0xD000000000000019;
  *((void *)v7 + 1) = 0x800000010001A890;
  swift_bridgeObjectRelease();
  unint64_t v8 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName];
  *(void *)unint64_t v8 = 0xD000000000000010;
  *((void *)v8 + 1) = 0x800000010001A8B0;
  swift_bridgeObjectRelease();
  id v9 = [self systemBlueColor];
  uint64_t v10 = *(void **)&v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor];
  *(void *)&v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor] = v9;

  return v5;
}

id sub_100010100()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetupCompleteCardViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for SetupCompleteCardViewController()
{
  return self;
}

void sub_100010158(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

BOOL sub_1000101C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000101D8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100010220()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10001024C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

id sub_100010290(void *a1)
{
  id v3 = &v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password];
  *id v3 = 0;
  v3[1] = 0xE000000000000000;
  v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_codeDisplayType] = 0;
  *(void *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_appClipCodeSize] = 0x4069000000000000;
  *(void *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_qrCodeTransformScale] = 0x4016000000000000;
  *(void *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_maxAppClipCodePasswordLength] = 6;
  uint64_t v4 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager;
  uint64_t v5 = qword_100027440;
  uint64_t v6 = v1;
  if (v5 != -1) {
    swift_once();
  }
  unint64_t v7 = (void *)qword_100028770;
  *(void *)&v1[v4] = qword_100028770;
  id v8 = v7;

  v34.receiver = v6;
  v34.super_class = (Class)type metadata accessor for QRCodeDisplayCardViewController();
  [super initWithContentView:a1];
  [v9 setDismissalType:1];
  uint64_t v10 = self;
  id v11 = v9;
  id v12 = [v10 mainBundle];
  v13._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
  v35._object = (void *)0xEA0000000000656CLL;
  v13._object = (void *)0x800000010001B070;
  v14._uint64_t countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  v35._uint64_t countAndFlagsBits = 0x7469742064726143;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v13, (Swift::String_optional)0, (NSBundle)v12, v14, v35);

  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v11 setTitle:v15];

  id v16 = v11;
  unint64_t v17 = sub_1000118B0();
  uint64_t v19 = v18;
  id v20 = [v10 mainBundle];
  v36._object = (void *)0xEF736E6F69746365;
  v21._uint64_t countAndFlagsBits = v17;
  v21._object = v19;
  v22._uint64_t countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v36._uint64_t countAndFlagsBits = 0x726964206E616353;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v20, v22, v36);
  swift_bridgeObjectRelease();

  NSString v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v16 setSubtitle:v23];

  if (sub_100011A0C())
  {
    id v24 = v16;
    id v25 = [v10 mainBundle];
    v37._object = (void *)0x800000010001B0C0;
    v26._object = (void *)0x800000010001B090;
    v26._uint64_t countAndFlagsBits = 0xD000000000000027;
    v27._uint64_t countAndFlagsBits = 0;
    v27._object = (void *)0xE000000000000000;
    v37._uint64_t countAndFlagsBits = 0xD000000000000027;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v26, (Swift::String_optional)0, (NSBundle)v25, v27, v37);

    uint64_t v28 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    NSString v29 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    aBlock[4] = sub_10001394C;
    aBlock[5] = v28;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100010158;
    void aBlock[3] = &unk_100020FC0;
    uint64_t v30 = _Block_copy(aBlock);
    id v31 = [self actionWithTitle:v29 style:0 handler:v30];

    _Block_release(v30);
    swift_release();
    swift_release();
  }
  return v16;
}

void sub_1000106D0()
{
  swift_beginAccess();
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    Swift::UInt v1 = Strong;
    [Strong dismissViewControllerAnimated:1 completion:0];
    objc_super v2 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager];
    if (v2)
    {
      id v3 = v2;
      sub_100015E08();
    }
  }
}

id sub_1000107CC()
{
  uint64_t v1 = type metadata accessor for String.Encoding();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  static String.Encoding.ascii.getter();
  uint64_t v5 = String.data(using:allowLossyConversion:)();
  unint64_t v7 = v6;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [self filterWithName:v8];

  if (v9)
  {
    id v10 = v9;
    if (v7 >> 60 == 15)
    {
      Class isa = 0;
    }
    else
    {
      sub_1000132F8(v5, v7);
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      sub_1000132E4(v5, v7);
    }
    NSString v12 = String._bridgeToObjectiveC()();
    [v10 setValue:isa forKey:v12];

    swift_unknownObjectRelease();
  }
  CGAffineTransformMakeScale(&v25, 5.5, 5.5);
  if (!v9) {
    goto LABEL_10;
  }
  long long v23 = *(_OWORD *)&v25.c;
  long long v24 = *(_OWORD *)&v25.a;
  long long v22 = *(_OWORD *)&v25.tx;
  id v13 = [v9 outputImage];
  if (!v13) {
    goto LABEL_10;
  }
  Swift::String v14 = v13;
  *(_OWORD *)&v25.a = v24;
  *(_OWORD *)&v25.c = v23;
  *(_OWORD *)&v25.tx = v22;
  id v15 = [v13 imageByApplyingTransform:&v25];

  if (v15)
  {
    id v16 = [objc_allocWithZone((Class)UIImage) initWithCIImage:v15];

    sub_1000132E4(v5, v7);
  }
  else
  {
LABEL_10:
    unint64_t v17 = *(unsigned char **)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager);
    if (v17)
    {
      v17[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState] = 1;
      double v18 = *(void **)&v17[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient];
      uint64_t v19 = v17;
      if (v18) {
        [v18 invalidate];
      }
      id v20 = [self defaultCenter];
      if (qword_100027470 != -1) {
        swift_once();
      }
      [v20 postNotificationName:qword_1000287A0 object:0 userInfo:0];

      sub_1000132E4(v5, v7);
    }
    else
    {

      sub_1000132E4(v5, v7);
    }
    return 0;
  }
  return v16;
}

BOOL sub_100010B68(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

id sub_100010B8C()
{
  id v2 = v1;
  uint64_t v3 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = (void *)type metadata accessor for URL();
  uint64_t v6 = *(v5 - 1);
  uint64_t v7 = __chkstk_darwin(v5);
  id v55 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v10 = (char *)&v48 - v9;
  uint64_t v56 = sub_1000063A8(0, (unint64_t *)&qword_100027A40);
  id v11 = static OS_os_log.default.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  uint64_t v13 = v12;
  BOOL v14 = os_log_type_enabled(v11, v12);
  uint64_t v53 = ObjectType;
  if (v14)
  {
    id v51 = v5;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v54 = v3;
    id v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    id v52 = v10;
    uint64_t v58 = v17;
    *(_DWORD *)id v16 = 136446210;
    id v50 = v1;
    uint64_t v18 = _typeName(_:qualified:)();
    uint64_t v57 = sub_100011E7C(v18, v19, &v58);
    id v2 = v50;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v5 = v51;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, (os_log_type_t)v13, "%{public}s generating App Clip Code.", v16, 0xCu);
    swift_arrayDestroy();
    id v10 = v52;
    swift_slowDealloc();
    uint64_t v3 = v54;
    swift_slowDealloc();
  }

  sub_100011238();
  if (v2) {
    return (id)v13;
  }
  sub_10001165C(v20, v21, (uint64_t)v10);
  swift_bridgeObjectRelease();
  long long v22 = (char *)sub_100012DA0();
  unint64_t v24 = v23;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  Swift::String v26 = (void *)CGSVGDocumentCreateFromData();

  if (!v26)
  {
    uint64_t v13 = static os_log_type_t.error.getter();
    id v40 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();

    sub_100011E28();
    swift_allocError();
    *id v41 = 3;
    swift_willThrow();
    (*(void (**)(char *, void *))(v6 + 8))(v10, v5);
    uint64_t v42 = (uint64_t)v22;
LABEL_10:
    sub_100013244(v42, v24);
    return (id)v13;
  }
  id v52 = v22;
  Swift::String v27 = v26;
  id v51 = [self _imageWithCGSVGDocument:v26 scale:0 orientation:1.0];
  if (!v51)
  {
    uint64_t v13 = static os_log_type_t.error.getter();
    id v43 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();

    sub_100011E28();
    swift_allocError();
    *id v44 = 4;
    swift_willThrow();
    (*(void (**)(char *, void *))(v6 + 8))(v10, v5);

    uint64_t v42 = (uint64_t)v52;
    goto LABEL_10;
  }
  id v50 = v26;
  uint64_t v28 = v55;
  (*(void (**)(char *, char *, void *))(v6 + 16))(v55, v10, v5);
  NSString v29 = static OS_os_log.default.getter();
  os_log_type_t v30 = static os_log_type_t.default.getter();
  int v31 = v30;
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v56 = v24;
    uint64_t v33 = v32;
    uint64_t v49 = swift_slowAlloc();
    uint64_t v58 = v49;
    *(_DWORD *)uint64_t v33 = 136446466;
    uint64_t v34 = _typeName(_:qualified:)();
    LODWORD(v53) = v31;
    uint64_t v57 = sub_100011E7C(v34, v35, &v58);
    uint64_t v54 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2082;
    uint64_t v48 = v33 + 14;
    sub_10001329C(&qword_100027B60, (void (*)(uint64_t))&type metadata accessor for URL);
    Swift::String v36 = v55;
    uint64_t v37 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v57 = sub_100011E7C(v37, v38, &v58);
    uint64_t v3 = v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    id v39 = *(void (**)(char *, void *))(v6 + 8);
    v39(v36, v5);
    _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v53, "%{public}s successfully generated VisualPairingAppClipCode with URL: %{public}s.", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    unint64_t v24 = v56;
    swift_slowDealloc();
  }
  else
  {

    id v39 = *(void (**)(char *, void *))(v6 + 8);
    v39(v28, v5);
  }
  uint64_t v46 = (uint64_t)v52;
  nullsub_1(*(double *)(v3 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_appClipCodeSize), *(double *)(v3 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_appClipCodeSize));
  id v47 = v51;
  id result = [v51 sbf_resizeImageToSize:];
  if (result)
  {
    uint64_t v13 = (uint64_t)result;
    v39(v10, v5);

    sub_100013244(v46, v24);
    return (id)v13;
  }
  __break(1u);
  return result;
}

void sub_100011238()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password);
  unint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password + 8);
  uint64_t v4 = HIBYTE(v3) & 0xF;
  uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v6 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v6 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
LABEL_47:
    static os_log_type_t.error.getter();
    sub_100006364((uint64_t *)&unk_1000275F0);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_1000187D0;
    uint64_t v23 = *v1;
    uint64_t v22 = v1[1];
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 64) = sub_100008FA8();
    *(void *)(v21 + 32) = v23;
    *(void *)(v21 + 40) = v22;
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    swift_bridgeObjectRetain();
    unint64_t v24 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    sub_100011E28();
    swift_allocError();
    *CGAffineTransform v25 = 0;
    swift_willThrow();
    return;
  }
  if ((v3 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = (uint64_t)sub_100012550(v2, v3, 10);
    char v10 = v29;
    swift_bridgeObjectRelease();
    goto LABEL_44;
  }
  if ((v3 & 0x2000000000000000) == 0)
  {
    if ((v2 & 0x1000000000000000) != 0) {
      uint64_t v7 = (unsigned __int8 *)((v3 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    }
    uint64_t v8 = (uint64_t)sub_100012638(v7, v5, 10);
    char v10 = v9 & 1;
LABEL_44:
    if ((v10 & 1) == 0 && v8 <= 999999)
    {
      sub_100006364((uint64_t *)&unk_1000275F0);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_1000187D0;
      *(void *)(v20 + 56) = &type metadata for Int;
      *(void *)(v20 + 64) = &protocol witness table for Int;
      *(void *)(v20 + 32) = v8;
      String.init(format:_:)();
      return;
    }
    goto LABEL_47;
  }
  v30[0] = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password);
  v30[1] = v3 & 0xFFFFFFFFFFFFFFLL;
  if (v2 == 43)
  {
    if (!v4) {
      goto LABEL_57;
    }
    if (v4 == 1 || (BYTE1(v2) - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v8 = (BYTE1(v2) - 48);
    if (v4 != 2)
    {
      if ((BYTE2(v2) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v8 = 10 * (BYTE1(v2) - 48) + (BYTE2(v2) - 48);
      uint64_t v11 = v4 - 3;
      if (v11)
      {
        os_log_type_t v12 = (unsigned __int8 *)v30 + 3;
        while (1)
        {
          unsigned int v13 = *v12 - 48;
          if (v13 > 9) {
            goto LABEL_31;
          }
          uint64_t v14 = 10 * v8;
          if ((unsigned __int128)(v8 * (__int128)10) >> 64 != (10 * v8) >> 63) {
            goto LABEL_31;
          }
          uint64_t v8 = v14 + v13;
          if (__OFADD__(v14, v13)) {
            goto LABEL_31;
          }
          char v10 = 0;
          ++v12;
          if (!--v11) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_43:
    char v10 = 0;
    goto LABEL_44;
  }
  if (v2 != 45)
  {
    if (!v4 || (v2 - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v8 = (v2 - 48);
    if (v4 != 1)
    {
      if ((BYTE1(v2) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v8 = 10 * (v2 - 48) + (BYTE1(v2) - 48);
      uint64_t v15 = v4 - 2;
      if (v15)
      {
        id v16 = (unsigned __int8 *)v30 + 2;
        while (1)
        {
          unsigned int v17 = *v16 - 48;
          if (v17 > 9) {
            goto LABEL_31;
          }
          uint64_t v18 = 10 * v8;
          if ((unsigned __int128)(v8 * (__int128)10) >> 64 != (10 * v8) >> 63) {
            goto LABEL_31;
          }
          uint64_t v8 = v18 + v17;
          if (__OFADD__(v18, v17)) {
            goto LABEL_31;
          }
          char v10 = 0;
          ++v16;
          if (!--v15) {
            goto LABEL_44;
          }
        }
      }
    }
    goto LABEL_43;
  }
  if (v4)
  {
    if (v4 != 1 && (BYTE1(v2) - 48) <= 9u)
    {
      if (v4 == 2)
      {
        char v10 = 0;
        uint64_t v8 = -(uint64_t)(BYTE1(v2) - 48);
        goto LABEL_44;
      }
      if ((BYTE2(v2) - 48) <= 9u)
      {
        uint64_t v8 = -10 * (BYTE1(v2) - 48) - (BYTE2(v2) - 48);
        uint64_t v19 = v4 - 3;
        if (!v19) {
          goto LABEL_43;
        }
        Swift::String v26 = (unsigned __int8 *)v30 + 3;
        while (1)
        {
          unsigned int v27 = *v26 - 48;
          if (v27 > 9) {
            break;
          }
          uint64_t v28 = 10 * v8;
          if ((unsigned __int128)(v8 * (__int128)10) >> 64 != (10 * v8) >> 63) {
            break;
          }
          uint64_t v8 = v28 - v27;
          if (__OFSUB__(v28, v27)) {
            break;
          }
          char v10 = 0;
          ++v26;
          if (!--v19) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_31:
    uint64_t v8 = 0;
    char v10 = 1;
    goto LABEL_44;
  }
  __break(1u);
LABEL_57:
  __break(1u);
}

uint64_t sub_10001165C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100006364(&qword_100027B48);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = 0;
  unint64_t v17 = 0xE000000000000000;
  _StringGuts.grow(_:)(33);
  swift_bridgeObjectRelease();
  unint64_t v16 = 0xD000000000000021;
  unint64_t v17 = 0x800000010001AB40;
  v9._uint64_t countAndFlagsBits = a1;
  v9._object = a2;
  String.append(_:)(v9);
  URL.init(string:)();
  swift_bridgeObjectRelease();
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a3, v8, v10);
  }
  sub_100011DC8((uint64_t)v8);
  static os_log_type_t.error.getter();
  sub_100006364((uint64_t *)&unk_1000275F0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1000187D0;
  *(void *)(v12 + 56) = &type metadata for String;
  *(void *)(v12 + 64) = sub_100008FA8();
  *(void *)(v12 + 32) = a1;
  *(void *)(v12 + 40) = a2;
  sub_1000063A8(0, (unint64_t *)&qword_100027A40);
  swift_bridgeObjectRetain();
  unsigned int v13 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  sub_100011E28();
  swift_allocError();
  *uint64_t v14 = 1;
  return swift_willThrow();
}

unint64_t sub_1000118B0()
{
  unint64_t v1 = 0xD000000000000018;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager);
  if (!v2) {
    goto LABEL_9;
  }
  int v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v3 == 1) {
    return 0xD00000000000001FLL;
  }
  if (v3 == 11) {
    return 0xD000000000000020;
  }
  if (v3 != 3)
  {
LABEL_9:
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    uint64_t v4 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    return v1;
  }
  return 0xD00000000000001DLL;
}

uint64_t sub_100011A0C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager);
  if (!v1) {
    goto LABEL_10;
  }
  int v2 = *(_DWORD *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v2 == 1 || v2 == 3) {
    return 1;
  }
  if (v2 != 11)
  {
LABEL_10:
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    uint64_t v5 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
  }
  return 0;
}

id sub_100011B0C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QRCodeDisplayCardViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for QRCodeDisplayCardViewController()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for RemoteSetupState(unsigned char *result, unsigned char *a2)
{
  *id result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CodeDisplayType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CodeDisplayType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 1;
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
        JUMPOUT(0x100011D20);
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
          *id result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100011D48(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100011D54(unsigned char *result, char a2)
{
  *id result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CodeDisplayType()
{
  return &type metadata for CodeDisplayType;
}

unint64_t sub_100011D74()
{
  unint64_t result = qword_100027B40;
  if (!qword_100027B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027B40);
  }
  return result;
}

uint64_t sub_100011DC8(uint64_t a1)
{
  uint64_t v2 = sub_100006364(&qword_100027B48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100011E28()
{
  unint64_t result = qword_100027B50;
  if (!qword_100027B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027B50);
  }
  return result;
}

uint64_t sub_100011E7C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100011F50(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008E68((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100008E68((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000BB10((uint64_t)v12);
  return v7;
}

uint64_t sub_100011F50(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10001210C(a5, a6);
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

uint64_t sub_10001210C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000121A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100012400(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100012400(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000121A4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001231C(v2, 0);
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

void *sub_10001231C(uint64_t a1, uint64_t a2)
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
  sub_100006364(&qword_100027B58);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100012384(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_100012400(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006364(&qword_100027B58);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
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

unsigned __int8 *sub_100012550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    int64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_1000128B4();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    int64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  size_t v11 = sub_100012638(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_100012638(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_1000128B4()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = sub_100012934(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100012934(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_100012A8C(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_10001231C(v9, 0),
          unint64_t v12 = sub_100012B8C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = static String._uncheckedFromUTF8(_:)();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return static String._uncheckedFromUTF8(_:)();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  _StringObject.sharedUTF8.getter();
LABEL_4:

  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_100012A8C(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_100012384(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_100012384(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_100012B8C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    _OWORD v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_100012384(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_100012384(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void *sub_100012DA0()
{
  id v0 = [self currentTraitCollection];
  id v1 = [v0 userInterfaceStyle];

  sub_1000063A8(0, (unint64_t *)&qword_100027A40);
  if (v1 == (id)2)
  {
    unint64_t v2 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    uint64_t v3 = 0;
  }
  else
  {
    unint64_t v2 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    uint64_t v3 = 1;
  }

  sub_100006364((uint64_t *)&unk_1000275F0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100018A50;
  uint64_t v5 = URL.absoluteString.getter();
  uint64_t v7 = v6;
  *(void *)(v4 + 56) = &type metadata for String;
  unint64_t v8 = sub_100008FA8();
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v7;
  *(void *)(v4 + 96) = &type metadata for Int;
  *(void *)(v4 + 104) = &protocol witness table for Int;
  *(void *)(v4 + 64) = v8;
  *(void *)(v4 + 72) = v3;
  sub_1000063A8(0, (unint64_t *)&qword_100027A40);
  uint64_t v9 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  URL._bridgeToObjectiveC()((NSURL *)ACCBakerDataVersion2);
  uint64_t v11 = v10;
  unint64_t v12 = (void *)ACCBakerCreate();

  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_1000187D0;
    uint64_t v16 = URL.absoluteString.getter();
    *(void *)(v15 + 56) = &type metadata for String;
    *(void *)(v15 + 64) = v8;
    *(void *)(v15 + 32) = v16;
    *(void *)(v15 + 40) = v17;
    uint64_t v14 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    sub_100011E28();
    swift_allocError();
    *unint64_t v18 = 2;
    swift_willThrow();
  }
  return v14;
}

uint64_t sub_100013244(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_10001329C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000132E4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100013244(a1, a2);
  }
  return a1;
}

uint64_t sub_1000132F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10001330C(a1, a2);
  }
  return a1;
}

uint64_t sub_10001330C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

void sub_100013364()
{
  id v1 = v0;
  if (v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_codeDisplayType])
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = String.count.getter();
    swift_bridgeObjectRelease();
    if (v2 > 6)
    {
      sub_1000063A8(0, (unint64_t *)&qword_100027A40);
      uint64_t v3 = (void *)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();

      uint64_t v4 = *(unsigned char **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager];
      if (!v4) {
        return;
      }
      v4[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState] = 1;
      uint64_t v5 = *(void **)&v4[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient];
      if (v5)
      {
LABEL_5:
        uint64_t v6 = v4;
        [v5 invalidate];
LABEL_15:
        id v26 = [self defaultCenter];
        id v27 = v26;
        if (qword_100027470 != -1)
        {
          swift_once();
          id v26 = v27;
        }
        [v26 postNotificationName:qword_1000287A0 object:0 userInfo:0];
        goto LABEL_18;
      }
LABEL_14:
      uint64_t v25 = v4;
      goto LABEL_15;
    }
    id v7 = sub_100010B8C();
  }
  else
  {
    id v7 = sub_1000107CC();
    if (!v7)
    {
      sub_1000063A8(0, (unint64_t *)&qword_100027A40);
      unint64_t v8 = (void *)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();

      uint64_t v4 = *(unsigned char **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager];
      if (!v4) {
        return;
      }
      v4[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState] = 1;
      uint64_t v5 = *(void **)&v4[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient];
      if (v5) {
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }
  uint64_t v4 = v7;
  id v9 = [objc_allocWithZone((Class)UIImageView) initWithImage:v4];
  [v9 setUserInteractionEnabled:0];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setContentMode:1];
  id v10 = [v0 contentView];
  [v10 addSubview:v9];

  id v11 = [v1 contentView];
  id v12 = [v11 mainContentGuide];

  id v13 = self;
  sub_100006364(&qword_1000274B8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100018A60;
  id v15 = [v9 topAnchor];
  id v16 = [v12 topAnchor];
  id v17 = [v15 constraintGreaterThanOrEqualToAnchor:v16];

  *(void *)(v14 + 32) = v17;
  id v18 = [v9 bottomAnchor];
  id v19 = [v12 bottomAnchor];
  id v20 = [v18 constraintLessThanOrEqualToAnchor:v19];

  *(void *)(v14 + 40) = v20;
  id v21 = [v9 centerXAnchor];
  id v22 = [v12 centerXAnchor];
  id v23 = [v21 constraintEqualToAnchor:v22];

  *(void *)(v14 + 48) = v23;
  specialized Array._endMutation()();
  sub_1000063A8(0, &qword_100027A70);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v13 activateConstraints:isa];

  id v27 = v4;
LABEL_18:
}

uint64_t sub_100013914()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001394C()
{
}

uint64_t sub_100013954(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100013964()
{
  return swift_release();
}

uint64_t getEnumTagSinglePayload for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x100013AC8);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

unsigned char *sub_100013AF0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError()
{
  return &type metadata for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError;
}

unint64_t sub_100013B0C()
{
  unint64_t result = qword_100027B70;
  if (!qword_100027B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027B70);
  }
  return result;
}

uint64_t sub_100013B60(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(_DWORD *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 9; ; ++i)
  {
    uint64_t v4 = i - 7;
    if (__OFADD__(i - 8, 1)) {
      break;
    }
    BOOL v6 = *(_DWORD *)(a2 + 4 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

void sub_100013BC4()
{
  *(_WORD *)&algn_100028758[6] = -4864;
}

void sub_100013BF4()
{
  algn_100028768[5] = 0;
  *(_WORD *)&algn_100028768[6] = -5120;
}

unint64_t sub_100013C20@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10001737C(*a1);
  *a2 = result;
  return result;
}

void sub_100013C4C(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_100013C58@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

id sub_100013C78()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for RemoteSetupClientManager()) init];
  qword_100028770 = (uint64_t)result;
  return result;
}

void sub_100013CA8(void *a1)
{
  uint64_t v2 = v1;
  if (a1)
  {
    sub_100006364((uint64_t *)&unk_1000275F0);
    uint64_t v4 = swift_allocObject();
    long long v62 = xmmword_1000187D0;
    *(_OWORD *)(v4 + 16) = xmmword_1000187D0;
    id v5 = a1;
    id v6 = [v5 identifier];
    if (v6)
    {
      BOOL v7 = v6;
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v10 = v9;
    }
    else
    {
      uint64_t v8 = 0;
      unint64_t v10 = 0;
    }
    *(void *)(v4 + 56) = &type metadata for String;
    *(void *)(v4 + 64) = sub_100008FA8();
    uint64_t v14 = 0x29656E6F6E28;
    if (v10) {
      uint64_t v14 = v8;
    }
    unint64_t v15 = 0xE600000000000000;
    if (v10) {
      unint64_t v15 = v10;
    }
    *(void *)(v4 + 32) = v14;
    *(void *)(v4 + 40) = v15;
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    id v16 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    id v17 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice);
    *(void *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice) = a1;
    id v18 = v5;

    unsigned int v19 = [v18 nearbyActionDeviceClass];
    uint64_t v20 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass;
    *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass) = v19;
    if (qword_100027410 != -1) {
      swift_once();
    }
    LOBYTE(v21) = byte_100028741;
    if (byte_100028741 == 2)
    {
      unsigned int v22 = *(_DWORD *)(v2 + v20);
      if (v22 > 0xB)
      {
        char v23 = 0;
        goto LABEL_18;
      }
      unsigned int v21 = 0x80Au >> v22;
    }
    char v23 = v21 & 1;
LABEL_18:
    uint64_t v24 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_clientSideAuth;
    *(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_clientSideAuth) = v23;
    uint64_t v25 = swift_allocObject();
    int v26 = *(_DWORD *)(v2 + v20);
    *(_OWORD *)(v25 + 16) = xmmword_1000187D0;
    *(void *)(v25 + 56) = &type metadata for Int32;
    *(void *)(v25 + 64) = &protocol witness table for Int32;
    *(_DWORD *)(v25 + 32) = v26;
    id v27 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    uint64_t v28 = (uint64_t *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_reverseFlowForDevices);
    swift_beginAccess();
    uint64_t v29 = *v28;
    swift_bridgeObjectRetain();
    id v30 = [v18 identifier];
    if (v30)
    {
      int v31 = v30;
      uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v34 = v33;
    }
    else
    {
      uint64_t v32 = 0;
      uint64_t v34 = 0xE000000000000000;
    }
    char v35 = sub_10001446C(v32, v34, v29);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v35)
    {
      Swift::String v36 = (void *)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();

      *(unsigned char *)(v2 + v24) = (*(unsigned char *)(v2 + v24) & 1) == 0;
    }
    uint64_t v37 = &off_100025000;
    id v38 = [objc_allocWithZone((Class)SKSetupFieldDiagnosticsClient) init];
    uint64_t v39 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient;
    id v40 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
    *(void *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient) = v38;

    id v41 = *(void **)(v2 + v39);
    if (v41)
    {
      if (*(unsigned char *)(v2 + v24) == 1)
      {
        uint64_t v42 = qword_100027418;
        id v43 = v41;
        if (v42 != -1) {
          swift_once();
        }
        if ((byte_100028748 & 1) != 0
          || (uint64_t v44 = dword_100028744,
              (sub_100013B60(dword_100028744, (uint64_t)&off_100020AA8) & 1) == 0))
        {
          if (*(_DWORD *)(v2 + v20) == 11) {
            uint64_t v49 = 2;
          }
          else {
            uint64_t v49 = 8;
          }
          [v43 setPasswordType:v49, 1, 2];
          uint64_t v50 = swift_allocObject();
          *(_OWORD *)(v50 + 16) = v62;
          unsigned int v51 = [v43 passwordType];
          *(void *)(v50 + 56) = &type metadata for Int32;
          *(void *)(v50 + 64) = &protocol witness table for Int32;
          *(_DWORD *)(v50 + 32) = v51;
          id v52 = (void *)static OS_os_log.default.getter();
          static os_log_type_t.default.getter();
          os_log(_:dso:log:type:_:)();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v45 = swift_allocObject();
          *(_OWORD *)(v45 + 16) = xmmword_1000187D0;
          *(void *)(v45 + 56) = &type metadata for Int32;
          *(void *)(v45 + 64) = &protocol witness table for Int32;
          *(_DWORD *)(v45 + 32) = v44;
          uint64_t v46 = (void *)static OS_os_log.default.getter();
          static os_log_type_t.default.getter();
          os_log(_:dso:log:type:_:)();
          uint64_t v37 = &off_100025000;
          swift_bridgeObjectRelease();

          [v43 setPasswordType:v44];
        }
      }
      else
      {
        id v48 = v41;
      }
      [v41 setReversePairing:*(unsigned __int8 *)(v2 + v24) v62];
      id v53 = [objc_allocWithZone((Class)SKDevice) v37[332]];
      id v54 = [v18 identifier];
      [v53 setIdentifier:v54];

      [v41 setPeerDevice:v53];
      *(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
      uint64_t v55 = swift_allocObject();
      *(_OWORD *)(v55 + 16) = v63;
      unsigned __int8 v56 = [v41 reversePairing];
      *(void *)(v55 + 56) = &type metadata for Bool;
      *(void *)(v55 + 64) = &protocol witness table for Bool;
      *(unsigned char *)(v55 + 32) = v56;
      uint64_t v57 = (void *)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();
      swift_bridgeObjectRelease();

      uint64_t v58 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_1000174F0;
      aBlock[5] = v58;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100010158;
      void aBlock[3] = &unk_100021130;
      uint64_t v59 = _Block_copy(aBlock);
      id v60 = v41;
      swift_release();
      [v60 setEventHandler:v59];
      _Block_release(v59);
    }
    else
    {
      id v47 = (void *)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();
    }
    return;
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 0;
  uint64_t v11 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient;
  id v12 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
  if (v12)
  {
    [v12 invalidate];
    id v13 = *(void **)(v2 + v11);
  }
  else
  {
    id v13 = 0;
  }
  *(void *)(v2 + v11) = 0;

  uint64_t v61 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice);
  *(void *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice) = 0;
}

uint64_t sub_10001446C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          id v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

void sub_1000145A4(void *a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    char v3 = (void *)Strong;
    sub_1000147E4(a1);
  }
}

void sub_100014600(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
  if (v3)
  {
    uint64_t v4 = v2;
    sub_100006364((uint64_t *)&unk_1000275F0);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1000187D0;
    *(void *)(v7 + 56) = &type metadata for String;
    *(void *)(v7 + 64) = sub_100008FA8();
    *(void *)(v7 + 32) = a1;
    *(void *)(v7 + 40) = a2;
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    id v8 = v3;
    swift_bridgeObjectRetain();
    uint64_t v9 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    *(unsigned char *)(v4 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 2;
    id v10 = objc_allocWithZone((Class)SKAuthenticationResponseEvent);
    swift_bridgeObjectRetain();
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v12 = [v10 initWithPassword:v11];

    [v8 postEvent:v12];
  }
  else
  {
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    id v12 = (id)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
  }
}

void sub_1000147E4(void *a1)
{
  uint64_t v2 = v1;
  sub_100006364((uint64_t *)&unk_1000275F0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000187D0;
  *(void *)(v4 + 56) = sub_1000063A8(0, &qword_100027BF8);
  *(void *)(v4 + 64) = sub_100017450();
  *(void *)(v4 + 32) = a1;
  sub_1000063A8(0, (unint64_t *)&qword_100027A40);
  id v5 = a1;
  Swift::Int v6 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  int v7 = [v5 eventType];
  if (v7 <= 99)
  {
    switch(v7)
    {
      case 10:
        uint64_t v9 = (void *)static OS_os_log.default.getter();
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)();

        *(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 2;
        return;
      case 20:
LABEL_11:
        sub_100015964();
        return;
      case 30:
        id v16 = (void *)static OS_os_log.default.getter();
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)();

        if ((*(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) & 0xFE) != 2) {
          return;
        }
        *(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
        BOOL v17 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
        if (v17) {
          [v17 invalidate];
        }
        goto LABEL_41;
      case 40:
        goto LABEL_29;
      case 41:
        id v18 = (void *)static OS_os_log.default.getter();
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)();

        int v19 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState);
        if (v19 == 1) {
          return;
        }
        if (v19 == 3)
        {
          sub_100015C50(0);
          return;
        }
        *(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
        uint64_t v24 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
        if (v24) {
          [v24 invalidate];
        }
LABEL_41:
        id v14 = [self defaultCenter];
        id v25 = v14;
        if (qword_100027470 != -1)
        {
          swift_once();
          id v14 = v25;
        }
        uint64_t v15 = qword_1000287A0;
LABEL_44:
        [v14 postNotificationName:v15 object:0 userInfo:0];
        break;
      default:
LABEL_36:
        uint64_t v20 = swift_allocObject();
        *(_OWORD *)(v20 + 16) = xmmword_1000187D0;
        unsigned int v21 = [v5 eventType];
        *(void *)(v20 + 56) = &type metadata for Int32;
        *(void *)(v20 + 64) = &protocol witness table for Int32;
        *(_DWORD *)(v20 + 32) = v21;
        unsigned int v22 = (void *)static OS_os_log.default.getter();
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)();
        swift_bridgeObjectRelease();

        *(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
        char v23 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
        if (v23) {
          [v23 invalidate];
        }
        goto LABEL_41;
    }
  }
  else
  {
    switch(v7)
    {
      case 100:
        id v8 = (void *)static OS_os_log.default.getter();
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)();

        if (*(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) == 3) {
          goto LABEL_11;
        }
        return;
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
        goto LABEL_36;
      case 110:
        id v12 = (void *)static OS_os_log.default.getter();
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)();

        sub_10001556C(v5);
        return;
      case 120:
        sub_100015054(v5);
        return;
      case 130:
        break;
      case 140:
        id v13 = (void *)static OS_os_log.default.getter();
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)();

        id v14 = [self defaultCenter];
        id v25 = v14;
        if (qword_100027458 != -1)
        {
          swift_once();
          id v14 = v25;
        }
        uint64_t v15 = qword_100028788;
        goto LABEL_44;
      default:
        if ((v7 - 200) < 3)
        {
          id v10 = (void *)static OS_os_log.default.getter();
          static os_log_type_t.default.getter();
          os_log(_:dso:log:type:_:)();

          *(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
          NSString v11 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
          if (v11) {
            [v11 invalidate];
          }
          goto LABEL_41;
        }
        if (v7 != 300) {
          goto LABEL_36;
        }
        break;
    }
LABEL_29:
    int v26 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
  }
}

void sub_100015054(void *a1)
{
  uint64_t v2 = v1;
  if ((*(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_clientSideAuth) & 1) != 0
    || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) == 0))
  {
    sub_100006364((uint64_t *)&unk_1000275F0);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1000187D0;
    *(void *)(v16 + 56) = sub_1000063A8(0, &qword_100027BF8);
    *(void *)(v16 + 64) = sub_100017450();
    *(void *)(v16 + 32) = a1;
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    id v17 = a1;
    id v18 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    *(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
    int v19 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
    if (v19) {
      [v19 invalidate];
    }
    id v20 = [self defaultCenter];
    id v21 = v20;
    if (qword_100027470 != -1)
    {
      swift_once();
      id v20 = v21;
    }
    [v20 postNotificationName:qword_1000287A0 object:0 userInfo:v21];
  }
  else
  {
    id v5 = (void *)v4;
    sub_100006364((uint64_t *)&unk_1000275F0);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1000187D0;
    id v7 = a1;
    unsigned int v8 = [v5 passwordType];
    *(void *)(v6 + 56) = &type metadata for Int32;
    *(void *)(v6 + 64) = &protocol witness table for Int32;
    *(_DWORD *)(v6 + 32) = v8;
    sub_1000063A8(0, (unint64_t *)&qword_100027A40);
    uint64_t v9 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    *(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 3;
    id v10 = [self defaultCenter];
    if (qword_100027448 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_100028778;
    sub_100006364(&qword_100027BE0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000187D0;
    AnyHashable.init<A>(_:)();
    unsigned int v13 = [v5 passwordType];
    type metadata accessor for CUPasswordType(0);
    *(void *)(inited + 96) = v14;
    *(_DWORD *)(inited + 72) = v13;
    sub_10001543C(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v10 postNotificationName:v11 object:0 userInfo:isa];
  }
}

unint64_t sub_10001543C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    char v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006364(&qword_100027BE8);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  char v3 = (void *)v2;
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
    sub_10001738C(v6, (uint64_t)v15);
    unint64_t result = sub_100016488((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_10000BB00(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    _OWORD v3[2] = v14;
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

void sub_10001556C(void *a1)
{
  uint64_t v2 = v1;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_clientSideAuth) == 1)
  {
    self;
    uint64_t v4 = swift_dynamicCastObjCClass();
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v6 = a1;
      id v7 = [v5 password];
      if (v7)
      {
        char v8 = v7;
        uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v11 = v10;

        *(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 3;
        id v12 = [self defaultCenter];
        if (qword_100027450 != -1) {
          swift_once();
        }
        uint64_t v13 = qword_100028780;
        sub_100006364(&qword_100027BE0);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_100018A50;
        if (qword_100027430 != -1) {
          swift_once();
        }
        swift_bridgeObjectRetain();
        AnyHashable.init<A>(_:)();
        *(void *)(inited + 96) = &type metadata for String;
        *(void *)(inited + 72) = v9;
        *(void *)(inited + 80) = v11;
        AnyHashable.init<A>(_:)();
        unsigned int v15 = [v5 passwordType];
        type metadata accessor for CUPasswordType(0);
        *(void *)(inited + 168) = v16;
        *(_DWORD *)(inited + 144) = v15;
        sub_10001543C(inited);
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v12 postNotificationName:v13 object:0 userInfo:isa];

        return;
      }
    }
  }
  sub_100006364((uint64_t *)&unk_1000275F0);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1000187D0;
  *(void *)(v18 + 56) = sub_1000063A8(0, &qword_100027BF8);
  *(void *)(v18 + 64) = sub_100017450();
  *(void *)(v18 + 32) = a1;
  sub_1000063A8(0, (unint64_t *)&qword_100027A40);
  id v19 = a1;
  id v20 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  *(unsigned char *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
  id v21 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
  if (v21) {
    [v21 invalidate];
  }
  id v22 = [self defaultCenter];
  id v23 = v22;
  if (qword_100027470 != -1)
  {
    swift_once();
    id v22 = v23;
  }
  [v22 postNotificationName:@"qword_1000287A0" object:0 userInfo:0 v23];
}

void sub_100015964()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice);
  if (v2)
  {
    char v3 = (uint64_t *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_reverseFlowForDevices);
    swift_beginAccess();
    uint64_t v4 = *v3;
    swift_bridgeObjectRetain();
    id v5 = v2;
    id v6 = [v5 identifier];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0xE000000000000000;
    }
    char v11 = sub_10001446C(v8, v10, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v11)
    {
      sub_100006364((uint64_t *)&unk_1000275F0);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_1000187D0;
      id v13 = [v5 identifier];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v17 = v16;
      }
      else
      {
        uint64_t v15 = 0;
        unint64_t v17 = 0;
      }
      *(void *)(v12 + 56) = &type metadata for String;
      *(void *)(v12 + 64) = sub_100008FA8();
      if (v17) {
        uint64_t v18 = v15;
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v19 = 0xE000000000000000;
      if (v17) {
        unint64_t v20 = v17;
      }
      else {
        unint64_t v20 = 0xE000000000000000;
      }
      *(void *)(v12 + 32) = v18;
      *(void *)(v12 + 40) = v20;
      sub_1000063A8(0, (unint64_t *)&qword_100027A40);
      id v21 = (void *)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();
      swift_bridgeObjectRelease();

      id v22 = [v5 identifier];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v19 = v25;
      }
      else
      {
        uint64_t v24 = 0;
      }
      swift_beginAccess();
      sub_100016594(v24, v19);
      swift_endAccess();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
    }
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
  int v26 = *(void **)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
  if (v26) {
    [v26 invalidate];
  }
  id v27 = [self defaultCenter];
  if (qword_100027468 != -1) {
    swift_once();
  }
  [v27 postNotificationName:qword_100028798 object:0 userInfo:0];
}

void sub_100015C50(char a1)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
  char v3 = *(void **)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
  if (v3) {
    [v3 invalidate];
  }
  id v4 = [self defaultCenter];
  if (qword_100027460 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_100028790;
  sub_100006364(&qword_100027BE0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000187D0;
  if (qword_100027438 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 96) = &type metadata for RemoteSetupCancelReason;
  *(unsigned char *)(inited + 72) = a1 & 1;
  sub_10001543C(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v4 postNotificationName:v5 object:0 userInfo:isa];
}

void sub_100015E08()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice);
  if (v2)
  {
    id v3 = v2;
    id v4 = [v3 identifier];
    if (v4)
    {
      uint64_t v5 = v4;
      Swift::Int v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      Swift::Int v8 = v7;

      swift_beginAccess();
      sub_100017030(&v14, v6, v8);
      swift_endAccess();
      swift_bridgeObjectRelease();
      sub_100015C50(1);

      return;
    }
  }
  sub_1000063A8(0, (unint64_t *)&qword_100027A40);
  uint64_t v9 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  *(unsigned char *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
  if (v10) {
    [v10 invalidate];
  }
  id v11 = [self defaultCenter];
  id v12 = v11;
  if (qword_100027470 != -1)
  {
    swift_once();
    id v11 = v12;
  }
  [v11 postNotificationName:qword_1000287A0 object:0 userInfo:0 v12];
}

id sub_100016098()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteSetupClientManager();
  return [super dealloc];
}

uint64_t type metadata accessor for RemoteSetupClientManager()
{
  return self;
}

uint64_t getEnumTagSinglePayload for RemoteSetupState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RemoteSetupState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x1000162A8);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteSetupState()
{
  return &type metadata for RemoteSetupState;
}

unint64_t sub_1000162E4()
{
  unint64_t result = qword_100027BD0;
  if (!qword_100027BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027BD0);
  }
  return result;
}

NSString sub_100016338()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100028778 = (uint64_t)result;
  return result;
}

NSString sub_100016370()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100028780 = (uint64_t)result;
  return result;
}

NSString sub_1000163A8()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100028788 = (uint64_t)result;
  return result;
}

NSString sub_1000163E0()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100028790 = (uint64_t)result;
  return result;
}

NSString sub_100016418()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100028798 = (uint64_t)result;
  return result;
}

NSString sub_100016450()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_1000287A0 = (uint64_t)result;
  return result;
}

unint64_t sub_100016488(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000164CC(a1, v4);
}

unint64_t sub_1000164CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000173F4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100008E14((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100016594(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v6 = Hasher._finalize()();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  uint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      unint64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100016724();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_100016E68(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

void *sub_100016724()
{
  uint64_t v1 = v0;
  sub_100006364(&qword_100027BD8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    NSString result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  NSString result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    NSString result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    BOOL v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    NSString result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_1000168D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006364(&qword_100027BD8);
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
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
    *int64_t v13 = v20;
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

uint64_t sub_100016B88()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006364(&qword_100027BD8);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
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
                  void *v30 = -1 << v29;
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
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
      int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *int64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_100016E68(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v10 = Hasher._finalize()();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v2);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *int64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_100017030(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
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
      unint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      int64_t v18 = (void *)(v11 + 16 * v10);
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
  sub_1000171E0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

Swift::Int sub_1000171E0(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_100016B88();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100016724();
      goto LABEL_22;
    }
    sub_1000168D8();
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
    Swift::Int v15 = (void *)(v14 + 16 * a3);
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
  Swift::Int *v21 = v8;
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

unint64_t sub_10001737C(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

uint64_t sub_10001738C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006364(&qword_100027BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000173F4(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_100017450()
{
  unint64_t result = qword_100027C00;
  if (!qword_100027C00)
  {
    sub_1000063A8(255, &qword_100027BF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027C00);
  }
  return result;
}

uint64_t sub_1000174B8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000174F0(void *a1)
{
}

uint64_t sub_1000174F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100017508()
{
  return swift_release();
}

unsigned char *storeEnumTagSinglePayload for RemoteSetupCancelReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x1000175DCLL);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteSetupCancelReason()
{
  return &type metadata for RemoteSetupCancelReason;
}

unint64_t sub_100017618()
{
  unint64_t result = qword_100027C08;
  if (!qword_100027C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027C08);
  }
  return result;
}

uint64_t sub_10001766C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t AttributeScopes.UIKitAttributes.font.getter()
{
  return AttributeScopes.UIKitAttributes.font.getter();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t AttributeContainer.subscript.setter()
{
  return AttributeContainer.subscript.setter();
}

uint64_t type metadata accessor for AttributeContainer()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String_optional __swiftcall Locale.localizedString(forLanguageCode:)(Swift::String forLanguageCode)
{
  uint64_t v1 = Locale.localizedString(forLanguageCode:)(forLanguageCode._countAndFlagsBits, forLanguageCode._object);
  result.value._object = v2;
  result.value._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t type metadata accessor for UIConfigurationTextAttributesTransformer()
{
  return type metadata accessor for UIConfigurationTextAttributesTransformer();
}

uint64_t UIConfigurationTextAttributesTransformer.init(_:)()
{
  return UIConfigurationTextAttributesTransformer.init(_:)();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return dispatch thunk of Hashable.hashValue.getter();
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

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init(format:arguments:)()
{
  return String.init(format:arguments:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t static String.Encoding.ascii.getter()
{
  return static String.Encoding.ascii.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.debugDescription.getter()
{
  return String.debugDescription.getter();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
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

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t UIContentSizeCategory.isAccessibilityCategory.getter()
{
  return UIContentSizeCategory.isAccessibilityCategory.getter();
}

UIImage __swiftcall UIImage.init(imageLiteralResourceName:)(Swift::String imageLiteralResourceName)
{
  return (UIImage)UIImage.init(imageLiteralResourceName:)(imageLiteralResourceName._countAndFlagsBits, imageLiteralResourceName._object);
}

uint64_t UIButton.Configuration.titleTextAttributesTransformer.setter()
{
  return UIButton.Configuration.titleTextAttributesTransformer.setter();
}

uint64_t static UIButton.Configuration.plain()()
{
  return static UIButton.Configuration.plain()();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t UIButton.init(configuration:primaryAction:)()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
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

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
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

uint64_t _assertionFailure(_:_:file:line:flags:)()
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

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
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

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t ACCBakerCreate()
{
  return _ACCBakerCreate();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CGSVGDocumentCreateFromData()
{
  return _CGSVGDocumentCreateFromData();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return _MobileGestalt_get_wapiCapability();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}