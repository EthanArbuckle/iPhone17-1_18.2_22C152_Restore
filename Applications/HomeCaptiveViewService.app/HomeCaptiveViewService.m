id sub_100002B44()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSString v4;
  void *v5;
  id v6;

  v1 = *(void **)(v0 + 48);
  if (v1)
  {
    v2 = *(id *)(v0 + 48);
  }
  else
  {
    v3 = [objc_allocWithZone((Class)SKDevice) init];
    if (*(void *)(v0 + 40)) {
      v4 = String._bridgeToObjectiveC()();
    }
    else {
      v4 = 0;
    }
    [v3 setIdentifier:v4];

    v5 = *(void **)(v0 + 48);
    *(void *)(v0 + 48) = v3;
    v2 = v3;

    v1 = 0;
  }
  v6 = v1;
  return v2;
}

void *sub_100002BE8(void *a1)
{
  v1[6] = 0;
  id v3 = [a1 name];
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  v1[2] = v5;
  v1[3] = v7;
  id v8 = [a1 identifier];
  if (v8)
  {
    v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;
  }
  else
  {

    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  v1[4] = v10;
  v1[5] = v12;
  return v1;
}

uint64_t sub_100002CA4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for PeerDevice()
{
  return self;
}

void sub_100002D10()
{
  v1 = v0;
  v38.receiver = v0;
  v38.super_class = (Class)type metadata accessor for IntroViewController();
  [super viewDidLoad];
  v2 = self;
  id v3 = [v2 mainBundle];
  v39._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0x49545F4F52544E49;
  v4._object = (void *)0xEB00000000454C54;
  v5.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v5.value._object = (void *)0xEB00000000656C62;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  v39._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v4, v5, (NSBundle)v3, v6, v39);

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setTitle:v7];

  unint64_t v8 = *(void *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_deviceName + 8];
  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_deviceName];
  uint64_t v10 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (v10)
  {
    sub_100003598(&qword_100015D48);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_10000C210;
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = sub_10000361C();
    *(void *)(v11 + 32) = v9;
    *(void *)(v11 + 40) = v8;
    swift_bridgeObjectRetain();
    id v12 = [v2 mainBundle];
    v40._object = (void *)0xE000000000000000;
    v13._countAndFlagsBits = 0x55535F4F52544E49;
    v13._object = (void *)0xEE00454C54495442;
    v14.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v14.value._object = (void *)0xEB00000000656C62;
    v15._countAndFlagsBits = 0;
    v15._object = (void *)0xE000000000000000;
    v40._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v13, v14, (NSBundle)v12, v15, v40);

    String.init(format:arguments:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_6:
    id v16 = [v2 mainBundle];
    v41._object = (void *)0xE000000000000000;
    v17._object = (void *)0x800000010000C510;
    v17._countAndFlagsBits = 0xD000000000000016;
    v18.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v18.value._object = (void *)0xEB00000000656C62;
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    v41._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v17, v18, (NSBundle)v16, v19, v41);
  }
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setSubtitle:v20];

  [v1 setDismissalType:3];
  NSString v21 = String._bridgeToObjectiveC()();
  id v22 = [self imageNamed:v21];

  if (v22)
  {
    id v23 = [self systemBlueColor];
    id v24 = [v22 imageWithTintColor:v23];

    if (v24)
    {
      sub_100003598(&qword_100015D38);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_10000C220;
      *(void *)(v25 + 32) = v24;
      aBlock[0] = v25;
      specialized Array._endMutation()();
      sub_1000035DC();
      id v26 = v24;
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v1 setImages:isa];
    }
  }
  id v28 = [v2 mainBundle];
  v42._object = (void *)0xE000000000000000;
  v29._countAndFlagsBits = 0x45554E49544E4F43;
  v29._object = (void *)0xE800000000000000;
  v30.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v30.value._object = (void *)0xEB00000000656C62;
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  v42._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v29, v30, (NSBundle)v28, v31, v42);

  uint64_t v32 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  NSString v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_100003578;
  aBlock[5] = v32;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003374;
  aBlock[3] = &unk_100010670;
  v34 = _Block_copy(aBlock);
  id v35 = [self actionWithTitle:v33 style:0 handler:v34];

  _Block_release(v34);
  swift_release();
  swift_release();
  id v36 = [v1 addAction:v35];
}

void sub_1000032A8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v1 = (void *)Strong;
    v2 = (void *)swift_unknownObjectWeakLoadStrong();

    if (v2)
    {
      sub_100005EC8();
    }
  }
  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectWeakLoadStrong();
  if (v3)
  {
    Swift::String v4 = (void *)v3;
    NSString v5 = String._bridgeToObjectiveC()();
    [v4 showActivityIndicatorWithStatus:v5];
  }
}

void sub_100003374(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_100003498()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntroViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for IntroViewController()
{
  return self;
}

uint64_t sub_100003540()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100003578()
{
}

uint64_t sub_100003580(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003590()
{
  return swift_release();
}

uint64_t sub_100003598(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000035DC()
{
  unint64_t result = qword_100015D40;
  if (!qword_100015D40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100015D40);
  }
  return result;
}

unint64_t sub_10000361C()
{
  unint64_t result = qword_100015D50;
  if (!qword_100015D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100015D50);
  }
  return result;
}

uint64_t sub_100003670()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000057D0(v0, qword_100015D58);
  uint64_t v1 = sub_10000520C(v0, (uint64_t)qword_100015D58);
  if (qword_100015C28 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000520C(v0, (uint64_t)qword_100016380);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100003738()
{
  uint64_t v1 = OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___remoteViewController;
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___remoteViewController];
  uint64_t v3 = v2;
  if (v2 == 1)
  {
    if ([v0 _remoteViewControllerProxy])
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v7, 0, sizeof(v7));
    }
    sub_100005870((uint64_t)v7, (uint64_t)v8);
    if (v9)
    {
      sub_100003598(&qword_100015DF0);
      if (swift_dynamicCast())
      {
        uint64_t v3 = v6;
LABEL_10:
        uint64_t v4 = *(void *)&v0[v1];
        *(void *)&v0[v1] = v3;
        swift_unknownObjectRetain();
        sub_1000058D8(v4);
        goto LABEL_11;
      }
    }
    else
    {
      sub_10000570C((uint64_t)v8, &qword_100015DD0);
    }
    uint64_t v3 = 0;
    goto LABEL_10;
  }
LABEL_11:
  sub_1000058E8(v2);
  return v3;
}

id sub_100003844()
{
  uint64_t v1 = OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___notificationCenter;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___notificationCenter);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___notificationCenter);
  }
  else
  {
    sub_100005834(0, &qword_100015DE8);
    id v4 = [(id)swift_getObjCClassFromMetadata() defaultCenter];
    NSString v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_1000038D0(void *a1, void (*a2)(void))
{
  if (!a1)
  {
    __break(1u);
LABEL_21:
    __break(1u);
    return;
  }
  id v3 = v2;
  id v5 = [a1 userInfo];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    AnyHashable.init<A>(_:)();
    if (*(void *)(v7 + 16) && (unint64_t v8 = sub_100005390((uint64_t)v25), (v9 & 1) != 0))
    {
      sub_100005654(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v26);
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_100005950((uint64_t)v25);
    if (*((void *)&v27 + 1))
    {
      sub_100003598(&qword_100015DF8);
      if (swift_dynamicCast())
      {
        id v10 = objc_allocWithZone((Class)CBDevice);
        id v15 = sub_1000052A8();
        type metadata accessor for PeerDevice();
        swift_allocObject();
        id v16 = v15;
        Swift::String v17 = sub_100002BE8(v16);
        swift_retain();
        uint64_t v18 = sub_100003738();
        id v19 = objc_allocWithZone((Class)type metadata accessor for SetupCoordinator(0));
        NSString v20 = v3;
        id v21 = sub_100009A44((uint64_t)v17, (uint64_t)v20, v18);
        swift_release();

        swift_unknownObjectRelease();
        id v22 = *(void **)&v20[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator];
        *(void *)&v20[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator] = v21;

        swift_release();
        id v23 = *(void **)&v3[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator];
        if (v23)
        {
          id v24 = v23;
          sub_100006148();
        }
        if (a2)
        {
          a2();
          return;
        }
        goto LABEL_21;
      }
    }
    else
    {
      sub_10000570C((uint64_t)&v26, &qword_100015DD0);
    }
  }
  if (qword_100015C10 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_10000520C(v11, (uint64_t)qword_100015D58);
  id v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    Swift::String_optional v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String_optional v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "No user device available to setup", v14, 2u);
    swift_slowDealloc();
  }
}

void sub_100003F3C(char a1)
{
  uint64_t v2 = v1;
  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for RemoteAlertServiceViewController();
  [super viewDidAppear:a1 & 1];
  if (qword_100015C10 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000520C(v4, (uint64_t)qword_100015D58);
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "viewDidAppear(_:)", v7, 2u);
    swift_slowDealloc();
  }

  id v8 = sub_100003844();
  NSString v9 = String._bridgeToObjectiveC()();
  [v8 addObserver:v2 selector:"extensionDeviceLostWithNotification:" name:v9 object:0];
}

void sub_1000040F0(char a1)
{
  uint64_t v2 = v1;
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for RemoteAlertServiceViewController();
  [super viewDidDisappear:a1 & 1];
  if (qword_100015C10 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000520C(v4, (uint64_t)qword_100015D58);
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "viewDidDisappear(_:)", v7, 2u);
    swift_slowDealloc();
  }

  id v8 = sub_100003844();
  NSString v9 = String._bridgeToObjectiveC()();
  [v8 removeObserver:v2 name:v9 object:0];

  objc_super v10 = *(void **)&v2[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator];
  if (v10)
  {
    id v11 = v10;
    sub_10000632C(a1 & 1);
  }
}

uint64_t sub_1000043C0(void *a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  os_log_type_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  NSString v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005834(0, &qword_100015DB0);
  objc_super v10 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = v1;
  aBlock[4] = sub_1000050F0;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000066F4;
  aBlock[3] = &unk_1000106C0;
  objc_super v12 = _Block_copy(aBlock);
  id v13 = a1;
  id v14 = v1;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100005110();
  sub_100003598(&qword_100015DC0);
  sub_100005168();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v17);
}

void sub_100004654(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SetupFlowState(0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  NSString v9 = (char *)&v27 - v8;
  id v10 = [a1 userInfo];
  if (!v10) {
    goto LABEL_10;
  }
  uint64_t v11 = v10;
  uint64_t v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v13 = sub_100004A48(v12);
  swift_bridgeObjectRelease();
  if (!v13) {
    goto LABEL_10;
  }
  if (!*(void *)(v13 + 16) || (unint64_t v14 = sub_1000053D4(0xD000000000000010, 0x800000010000C630), (v15 & 1) == 0))
  {
    long long v31 = 0u;
    long long v32 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_100005654(*(void *)(v13 + 56) + 32 * v14, (uint64_t)&v31);
  swift_bridgeObjectRelease();
  if (!*((void *)&v32 + 1))
  {
LABEL_9:
    sub_10000570C((uint64_t)&v31, &qword_100015DD0);
    goto LABEL_10;
  }
  if (swift_dynamicCast())
  {
    uint64_t v17 = v29;
    unint64_t v16 = v30;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v17 = 0;
  unint64_t v16 = 0xE000000000000000;
LABEL_11:
  if (qword_100015C10 != -1) {
    swift_once();
  }
  uint64_t v18 = type metadata accessor for Logger();
  sub_10000520C(v18, (uint64_t)qword_100015D58);
  swift_bridgeObjectRetain();
  id v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v19, v20))
  {
    long long v27 = v7;
    id v28 = v9;
    id v21 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v31 = swift_slowAlloc();
    *(_DWORD *)id v21 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_10000B030(v17, v16, (uint64_t *)&v31);
    uint64_t v7 = v27;
    NSString v9 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "BLE Extension device lost: %s", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v22 = *(void **)(a2 + OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator);
  if (v22)
  {
    uint64_t v23 = (uint64_t)v22 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state;
    swift_beginAccess();
    sub_100005244(v23, (uint64_t)v9);
    swift_storeEnumTagMultiPayload();
    id v24 = v22;
    char v25 = sub_100009B8C((uint64_t)v9, (uint64_t)v7);
    sub_1000055F8((uint64_t)v7);
    sub_1000055F8((uint64_t)v9);
    if ((v25 & 1) != 0
      || (sub_100005244(v23, (uint64_t)v9),
          swift_storeEnumTagMultiPayload(),
          char v26 = sub_100009B8C((uint64_t)v9, (uint64_t)v7),
          sub_1000055F8((uint64_t)v7),
          sub_1000055F8((uint64_t)v9),
          (v26 & 1) != 0))
    {
      sub_10000632C(1);
    }
  }
}

unint64_t sub_100004A48(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100003598(&qword_100015DD8);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_37;
      }
      if (v13 >= v22)
      {
LABEL_33:
        sub_100005768();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v22) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v22) {
            goto LABEL_33;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v22) {
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v22) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_38;
                  }
                  if (v12 >= v22) {
                    goto LABEL_33;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_1000056B0(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_100005654(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_1000056B0((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_10000570C((uint64_t)v30, &qword_100015DE0);
      swift_bridgeObjectRelease();
      sub_100005768();
      swift_release();
      return 0;
    }
    sub_100005654((uint64_t)v31 + 8, (uint64_t)v25);
    sub_10000570C((uint64_t)v30, &qword_100015DE0);
    sub_100005770(v25, v26);
    long long v27 = v24;
    sub_100005770(v26, v28);
    long long v16 = v27;
    sub_100005770(v28, v29);
    sub_100005770(v29, &v27);
    unint64_t result = sub_1000053D4(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      uint64_t v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v8 = v16;
      NSString v9 = (_OWORD *)(v2[7] + 32 * v17);
      sub_100005780((uint64_t)v9);
      unint64_t result = (unint64_t)sub_100005770(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_100005770(&v27, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

id sub_100004E84(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___remoteViewController] = 1;
  *(void *)&v3[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___notificationCenter] = 0;
  if (a2)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for RemoteAlertServiceViewController();
  id v6 = [super initWithNibName:v5 bundle:a3];

  return v6;
}

id sub_100004FFC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertServiceViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for RemoteAlertServiceViewController()
{
  return self;
}

uint64_t sub_1000050B0()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000050F0()
{
  sub_100004654(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000050F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100005108()
{
  return swift_release();
}

unint64_t sub_100005110()
{
  unint64_t result = qword_100015DB8;
  if (!qword_100015DB8)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100015DB8);
  }
  return result;
}

unint64_t sub_100005168()
{
  unint64_t result = qword_100015DC8;
  if (!qword_100015DC8)
  {
    sub_1000051C4(&qword_100015DC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100015DC8);
  }
  return result;
}

uint64_t sub_1000051C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000520C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005244(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SetupFlowState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_1000052A8()
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

unint64_t sub_100005390(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10000544C(a1, v4);
}

unint64_t sub_1000053D4(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100005514(a1, a2, v4);
}

unint64_t sub_10000544C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000056B0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100005950((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100005514(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1000055F8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SetupFlowState(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005654(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000056B0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000570C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003598(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100005768()
{
  return swift_release();
}

_OWORD *sub_100005770(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100005780(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *sub_1000057D0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005834(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100005870(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003598(&qword_100015DD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000058D8(uint64_t result)
{
  if (result != 1) {
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1000058E8(uint64_t result)
{
  if (result != 1) {
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t sub_1000058F8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100005908()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005940()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100005950(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000059A4()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000057D0(v0, qword_100015E00);
  uint64_t v1 = sub_10000520C(v0, (uint64_t)qword_100015E00);
  if (qword_100015C28 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000520C(v0, (uint64_t)qword_100016380);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_100005A6C(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(v2 + 32))
  {
    if (qword_100015C18 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_10000520C(v3, (uint64_t)qword_100015E00);
    oslog = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v4, "SKSetupCaptiveNetworkJoinClient was already activated. Ignoring the call", v5, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    uint64_t v6 = v2;
    if (qword_100015C18 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_10000520C(v9, (uint64_t)qword_100015E00);
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Activating SetupKit Client", v12, 2u);
      swift_slowDealloc();
    }

    id v13 = [objc_allocWithZone((Class)SKSetupCaptiveNetworkJoinClient) init];
    BOOL v14 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v13;

    int64_t v15 = *(void **)(v6 + 16);
    if (v15)
    {
      [v15 setPeerDevice:*(void *)(v6 + 24)];
      long long v16 = *(void **)(v6 + 16);
      if (v16)
      {
        aBlock[4] = a1;
        aBlock[5] = a2;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100003374;
        aBlock[3] = &unk_100010710;
        unint64_t v17 = _Block_copy(aBlock);
        id v18 = v16;
        swift_retain();
        swift_release();
        [v18 setEventHandler:v17];
        _Block_release(v17);

        uint64_t v19 = *(void **)(v6 + 16);
        if (v19) {
          [v19 activate];
        }
      }
    }
    *(unsigned char *)(v6 + 32) = 1;
  }
}

void sub_100005D2C()
{
  uint64_t v1 = v0;
  if (qword_100015C18 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000520C(v2, (uint64_t)qword_100015E00);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Stopping SetupKit Client", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(void **)(v1 + 16);
  if (v6 && ([v6 invalidate], (int64_t v7 = *(void **)(v1 + 16)) != 0))
  {
    [v7 setEventHandler:0];
    objc_super v8 = *(void **)(v1 + 16);
  }
  else
  {
    objc_super v8 = 0;
  }
  *(void *)(v1 + 16) = 0;

  *(unsigned char *)(v1 + 32) = 0;
}

uint64_t sub_100005E4C()
{
  return _swift_deallocClassInstance(v0, 33, 7);
}

uint64_t type metadata accessor for Setup()
{
  return self;
}

uint64_t sub_100005EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100005EC0()
{
  return swift_release();
}

uint64_t sub_100005EC8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SetupFlowState(0);
  __chkstk_darwin(v2);
  os_log_type_t v4 = (char *)&v13[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100015C20 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_10000520C(v5, (uint64_t)qword_100015ED0);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    objc_super v8 = (uint8_t *)swift_slowAlloc();
    v13[0] = swift_slowAlloc();
    *(_DWORD *)objc_super v8 = 136315138;
    uint64_t v12 = sub_10000B030(0xD000000000000013, 0x800000010000C940, v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v9 = v1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state;
  swift_beginAccess();
  sub_100005244(v9, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() != 3) {
    return sub_1000055F8((uint64_t)v4);
  }
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_100005A6C((uint64_t)sub_10000A7B4, v10);
  return swift_release_n();
}

uint64_t sub_100006148()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SetupFlowState(0);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  os_log_type_t v7 = (char *)&v14 - v6;
  if (qword_100015C20 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_10000520C(v8, (uint64_t)qword_100015ED0);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Starting SetupCoordinator", v11, 2u);
    swift_slowDealloc();
  }

  uint64_t v12 = v1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state;
  swift_beginAccess();
  sub_100005244(v12, (uint64_t)v7);
  swift_storeEnumTagMultiPayload();
  LOBYTE(v12) = sub_100009B8C((uint64_t)v7, (uint64_t)v5);
  sub_1000055F8((uint64_t)v5);
  uint64_t result = sub_1000055F8((uint64_t)v7);
  if (v12)
  {
    swift_storeEnumTagMultiPayload();
    sub_100006AF4((uint64_t)v7);
    return sub_1000055F8((uint64_t)v7);
  }
  return result;
}

id sub_10000632C(char a1)
{
  uint64_t v3 = type metadata accessor for SetupFlowState(0);
  __chkstk_darwin();
  uint64_t v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100015C20 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = sub_10000520C(v6, (uint64_t)qword_100015ED0);
  uint64_t v8 = v1;
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    v28[1] = v3;
    *(_DWORD *)os_log_type_t v11 = 136315138;
    uint64_t v29 = v12;
    v28[0] = v11 + 4;
    uint64_t v13 = (uint64_t)&v8[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state];
    swift_beginAccess();
    sub_100005244(v13, (uint64_t)v5);
    unint64_t v14 = sub_100006800();
    _OWORD v28[2] = v7;
    char v15 = a1;
    unint64_t v17 = v16;
    sub_1000055F8((uint64_t)v5);
    v28[3] = sub_10000B030(v14, v17, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    a1 = v15;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Dismissing UI - Current State: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v18, v19))
  {
    BOOL v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Stopping SetupCoordinator", v20, 2u);
    swift_slowDealloc();
  }

  sub_100005D2C();
  swift_storeEnumTagMultiPayload();
  sub_100006AF4(v5);
  sub_1000055F8((uint64_t)v5);
  id v21 = sub_100006A80();
  [v21 invalidate];

  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v23 = Strong;
    [Strong dismissViewControllerAnimated:a1 & 1 completion:0];
  }
  long long v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v24, v25))
  {
    char v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Dismissing RemoteViewController", v26, 2u);
    swift_slowDealloc();
  }

  id result = *(id *)&v8[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewController];
  if (result) {
    return [result dismiss];
  }
  return result;
}

uint64_t sub_1000066F4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100006738()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000057D0(v0, qword_100015ED0);
  uint64_t v1 = sub_10000520C(v0, (uint64_t)qword_100015ED0);
  if (qword_100015C28 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000520C(v0, (uint64_t)qword_100016380);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

unint64_t sub_100006800()
{
  uint64_t v1 = v0;
  unint64_t v2 = 0xD000000000000012;
  type metadata accessor for SetupFlowState(0);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005244(v1, (uint64_t)v4);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_100003598(&qword_100016070);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v5 = type metadata accessor for URL();
      (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
      unint64_t v2 = 0x7465656853626557;
      break;
    case 2u:
      unint64_t v2 = 0x6E776F6E6B6E55;
      break;
    case 3u:
      unint64_t v2 = 0x49556F72746E49;
      break;
    case 4u:
      unint64_t v2 = 0x64657472617453;
      break;
    case 5u:
      return v2;
    case 6u:
      unint64_t v2 = 0xD00000000000001FLL;
      break;
    case 7u:
      unint64_t v2 = 0xD000000000000020;
      break;
    case 8u:
      unint64_t v2 = 0x6574656C706D6F43;
      break;
    case 9u:
      unint64_t v2 = 0x6164696C61766E49;
      break;
    case 0xAu:
      unint64_t v2 = 0x7369442072657355;
      break;
    case 0xBu:
      unint64_t v2 = 0x726F727245;
      break;
    default:
      unint64_t v2 = 0x72696150206E6950;
      break;
  }
  return v2;
}

id sub_100006A80()
{
  uint64_t v1 = OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator____lazy_storage___sfClient;
  unint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator____lazy_storage___sfClient);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator____lazy_storage___sfClient);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)SFClient) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    unint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_100006AF4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SetupFlowState(0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  id v6 = &v22[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v22[-v7];
  uint64_t v9 = (uint64_t)v1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state;
  swift_beginAccess();
  sub_100005244(v9, (uint64_t)v8);
  char v10 = sub_100009B8C((uint64_t)v8, a1);
  sub_1000055F8((uint64_t)v8);
  if ((v10 & 1) == 0)
  {
    if (qword_100015C20 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_10000520C(v11, (uint64_t)qword_100015ED0);
    sub_100005244(a1, (uint64_t)v6);
    id v12 = v1;
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.info.getter();
    int v15 = v14;
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v26[0] = v24;
      *(_DWORD *)uint64_t v16 = 136315394;
      sub_100005244(v9, (uint64_t)v8);
      int v23 = v15;
      unint64_t v17 = sub_100006800();
      unint64_t v19 = v18;
      sub_1000055F8((uint64_t)v8);
      uint64_t v25 = sub_10000B030(v17, v19, v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2080;
      unint64_t v20 = sub_100006800();
      uint64_t v25 = sub_10000B030(v20, v21, v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_1000055F8((uint64_t)v6);
      _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v23, "Transitioning from %s to %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      sub_1000055F8((uint64_t)v6);
    }

    swift_beginAccess();
    sub_10000A6C8(a1, v9);
    swift_endAccess();
    sub_100007BDC();
  }
}

void sub_100006DF8(void *a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    sub_100006E54(a1);
  }
}

void sub_100006E54(void *a1)
{
  uint64_t v2 = sub_100003598(&qword_100016188);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v94 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  v99 = (char *)v94 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v97 = (char *)v94 - v9;
  id v10 = (id)type metadata accessor for SetupFlowState(0);
  uint64_t v11 = __chkstk_darwin(v10);
  v98 = (char *)v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  os_log_type_t v14 = (void *)((char *)v94 - v13);
  if (qword_100015C20 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  uint64_t v16 = sub_10000520C(v15, (uint64_t)qword_100015ED0);
  id v17 = a1;
  uint64_t v102 = v16;
  unint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.info.getter();
  BOOL v20 = os_log_type_enabled(v18, v19);
  v100 = v4;
  if (v20)
  {
    uint64_t v21 = swift_slowAlloc();
    id v101 = v10;
    int64_t v22 = (uint8_t *)v21;
    uint64_t v95 = swift_slowAlloc();
    aBlock[0] = v95;
    *(_DWORD *)int64_t v22 = 136315138;
    v94[1] = v22 + 4;
    int v23 = sub_10000A7D0((int)[v17 eventType]);
    uint64_t v24 = v5;
    uint64_t v25 = v14;
    uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v96 = v6;
    unint64_t v28 = v27;

    uint64_t v29 = v26;
    os_log_type_t v14 = v25;
    uint64_t v5 = v24;
    uint64_t v105 = sub_10000B030(v29, v28, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    uint64_t v6 = v96;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Recieved SKEvent: %s", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    id v10 = v101;
    swift_slowDealloc();
  }
  else
  {
  }
  id v30 = [v17 error];
  if (v30)
  {
    long long v31 = v30;
    id v32 = v103;
    id v33 = v31;
    id v34 = v32;
    id v35 = v33;
    id v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = swift_slowAlloc();
      id v101 = v10;
      uint64_t v39 = v38;
      id v103 = (id)swift_slowAlloc();
      uint64_t v105 = (uint64_t)v103;
      *(_DWORD *)uint64_t v39 = 136315394;
      uint64_t v40 = (uint64_t)v34 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state;
      swift_beginAccess();
      sub_100005244(v40, (uint64_t)v14);
      unint64_t v41 = sub_100006800();
      unint64_t v43 = v42;
      sub_1000055F8((uint64_t)v14);
      uint64_t v104 = sub_10000B030(v41, v43, &v105);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v44 = Error.localizedDescription.getter();
      uint64_t v104 = sub_10000B030(v44, v45, &v105);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "CurrentState - %s - SetupKit Error: %s", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    swift_storeEnumTagMultiPayload();
    sub_100006AF4((uint64_t)v14);

LABEL_43:
    sub_1000055F8((uint64_t)v14);
    return;
  }
  int v46 = [v17 eventType];
  if (v46 > 99)
  {
    if (v46 <= 199)
    {
      switch(v46)
      {
        case 100:
        case 110:
        case 130:
          return;
        case 120:
          self;
          if (!swift_dynamicCastObjCClass()) {
            goto LABEL_42;
          }
          *os_log_type_t v14 = 4;
          swift_storeEnumTagMultiPayload();
          id v47 = v17;
          sub_100006AF4((uint64_t)v14);

          goto LABEL_43;
        case 140:
          goto LABEL_42;
        default:
          goto LABEL_32;
      }
    }
    if (v46 != 200)
    {
      if (v46 == 201) {
        return;
      }
      if (v46 == 202)
      {
        uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
        if (Strong)
        {
          v49 = Strong;
          id v50 = [Strong presentedViewController];

          if (v50)
          {
            self;
            uint64_t v51 = swift_dynamicCastObjCClass();
            if (v51)
            {
              v52 = (void *)v51;
              v53 = Logger.logObject.getter();
              os_log_type_t v54 = static os_log_type_t.info.getter();
              if (os_log_type_enabled(v53, v54))
              {
                v55 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v55 = 0;
                _os_log_impl((void *)&_mh_execute_header, v53, v54, "Informing websheet with a sucess probe result", v55, 2u);
                swift_slowDealloc();
              }

              uint64_t v56 = swift_allocObject();
              *(void *)(v56 + 16) = v52;
              aBlock[4] = (uint64_t)sub_10000A7BC;
              aBlock[5] = v56;
              aBlock[0] = (uint64_t)_NSConcreteStackBlock;
              aBlock[1] = 1107296256;
              aBlock[2] = (uint64_t)sub_1000066F4;
              aBlock[3] = (uint64_t)&unk_1000108F0;
              v57 = _Block_copy(aBlock);
              id v58 = v50;
              swift_release();
              [v52 handleProbeResult:0 completionHandler:v57];
              _Block_release(v57);
            }
            else
            {
            }
          }
        }
        return;
      }
LABEL_32:
      v82 = Logger.logObject.getter();
      os_log_type_t v83 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v82, v83))
      {
        v84 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v84 = 0;
        _os_log_impl((void *)&_mh_execute_header, v82, v83, "bad state. Invalidating", v84, 2u);
        swift_slowDealloc();
      }
LABEL_41:

LABEL_42:
      swift_storeEnumTagMultiPayload();
      sub_100006AF4((uint64_t)v14);
      goto LABEL_43;
    }
    self;
    uint64_t v59 = swift_dynamicCastObjCClass();
    if (!v59)
    {
LABEL_38:
      v85 = v17;
      v82 = Logger.logObject.getter();
      os_log_type_t v86 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v82, v86))
      {
        id v101 = v10;
        v87 = (uint8_t *)swift_slowAlloc();
        v88 = (void *)swift_slowAlloc();
        *(_DWORD *)v87 = 138412290;
        aBlock[0] = (uint64_t)v85;
        v89 = v85;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v88 = v85;

        _os_log_impl((void *)&_mh_execute_header, v82, v86, "failed to obtain data from the event: %@", v87, 0xCu);
        sub_100003598((uint64_t *)&unk_100016190);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        v82 = v85;
      }
      goto LABEL_41;
    }
    v60 = (void *)v59;
    id v61 = v17;
    id v62 = v17;
    id v63 = [v60 captiveURL];
    if (v63)
    {
      v64 = v63;
      id v101 = v62;
      v65 = v99;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v66 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      uint64_t v67 = (uint64_t)v100;
      v68 = v65;
      id v62 = v101;
      v66(v100, v68, v5);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v67, 0, 1, v5);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v67, 1, v5) != 1)
      {
        v69 = v97;
        v66(v97, (char *)v67, v5);
        id v70 = [v60 captiveSSID];
        if (v70)
        {
          v71 = v70;
          uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v74 = v73;

          uint64_t v75 = sub_100003598(&qword_100016070);
          v76 = (uint64_t *)&v98[*(int *)(v75 + 48)];
          (*(void (**)(void))(v6 + 16))();
          uint64_t *v76 = v72;
          v76[1] = v74;
          id v77 = [v60 captiveInterfaceIdentifier];
          if (v77)
          {
            v78 = v77;
            uint64_t v79 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v81 = v80;
          }
          else
          {
            uint64_t v79 = 0;
            uint64_t v81 = 0;
          }
          id v90 = v101;
          uint64_t v91 = *(int *)(v75 + 64);
          uint64_t v92 = (uint64_t)v98;
          v93 = (uint64_t *)&v98[v91];
          uint64_t *v93 = v79;
          v93[1] = v81;
          swift_storeEnumTagMultiPayload();
          sub_100006AF4(v92);

          sub_1000055F8(v92);
          (*(void (**)(char *, uint64_t))(v6 + 8))(v69, v5);
          return;
        }

        (*(void (**)(char *, uint64_t))(v6 + 8))(v69, v5);
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v67 = (uint64_t)v100;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v100, 1, 1, v5);
    }

    sub_10000570C(v67, &qword_100016188);
LABEL_37:
    id v17 = v61;
    goto LABEL_38;
  }
  switch(v46)
  {
    case 0:
    case 10:
      return;
    case 20:
    case 30:
    case 40:
    case 41:
      goto LABEL_42;
    default:
      goto LABEL_32;
  }
}

void sub_100007BDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v75 - v7;
  uint64_t v9 = type metadata accessor for SetupFlowState(0);
  __chkstk_darwin(v9);
  uint64_t v11 = (uint64_t *)((char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = (uint64_t)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state];
  swift_beginAccess();
  sub_100005244(v12, (uint64_t)v11);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      sub_1000085D4(*v11);
      return;
    case 1u:
      uint64_t v13 = sub_100003598(&qword_100016070);
      os_log_type_t v14 = (uint64_t *)((char *)v11 + *(int *)(v13 + 48));
      uint64_t v15 = v14[1];
      uint64_t v84 = *v14;
      uint64_t v16 = (uint64_t *)((char *)v11 + *(int *)(v13 + 64));
      uint64_t v17 = *v16;
      unint64_t v18 = v16[1];
      (*(void (**)(char *, uint64_t *, uint64_t))(v3 + 32))(v8, v11, v2);
      id v85 = [objc_allocWithZone((Class)WSWebSheetViewController) init];
      if (v18) {
        uint64_t v19 = v17;
      }
      else {
        uint64_t v19 = 0;
      }
      if (v18) {
        unint64_t v20 = v18;
      }
      else {
        unint64_t v20 = 0xE000000000000000;
      }
      if (qword_100015C20 != -1) {
        swift_once();
      }
      uint64_t v83 = v19;
      uint64_t v21 = type metadata accessor for Logger();
      sub_10000520C(v21, (uint64_t)qword_100015ED0);
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      int64_t v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.info.getter();
      int v24 = v23;
      BOOL v25 = os_log_type_enabled(v22, v23);
      uint64_t v82 = v3;
      if (v25)
      {
        uint64_t v26 = swift_slowAlloc();
        v78 = (void **)swift_slowAlloc();
        aBlock = v78;
        *(_DWORD *)uint64_t v26 = 136315650;
        int v77 = v24;
        os_log_t v76 = v22;
        uint64_t v27 = URL.absoluteString.getter();
        unint64_t v79 = v20;
        unint64_t v80 = v15;
        uint64_t v86 = sub_10000B030(v27, v28, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        unint64_t v29 = v80;
        uint64_t v81 = *(void (**)(char *, uint64_t))(v3 + 8);
        v81(v6, v2);
        *(_WORD *)(v26 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v86 = sub_10000B030(v84, v29, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v26 + 22) = 2080;
        unint64_t v30 = v79;
        swift_bridgeObjectRetain();
        uint64_t v86 = sub_10000B030(v83, v30, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        os_log_t v31 = v76;
        _os_log_impl((void *)&_mh_execute_header, v76, (os_log_type_t)v77, "Presenting WebSheet with url: %s ssid: %s interface: %s", (uint8_t *)v26, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        uint64_t v81 = *(void (**)(char *, uint64_t))(v3 + 8);
        v81(v6, v2);

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      URL._bridgeToObjectiveC()(v32);
      id v50 = v49;
      NSString v51 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      NSString v52 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v85 startWithURL:v50 ssid:v51 interface:v52 proxyConfiguration:0 showCancelMenu:0 delegate:v1];

      self;
      uint64_t v53 = swift_dynamicCastObjCClass();
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
        if (Strong)
        {
          id v56 = Strong;
          id v57 = v85;
          [Strong pushViewController:v85 animated:1];
        }
        else
        {
          id v71 = v85;
          id v56 = sub_100006A80();
          uint64_t v72 = swift_allocObject();
          *(void *)(v72 + 16) = v1;
          *(void *)(v72 + 24) = v54;
          uint64_t v91 = sub_10000A72C;
          uint64_t v92 = v72;
          aBlock = _NSConcreteStackBlock;
          uint64_t v88 = 1107296256;
          v89 = sub_100008A30;
          id v90 = &unk_1000107B0;
          uint64_t v73 = _Block_copy(&aBlock);
          uint64_t v74 = v1;
          id v57 = v71;
          swift_release();
          [v56 startProxCardTransactionWithOptions:0 completion:v73];
          _Block_release(v73);
        }
      }
      else
      {
        id v61 = v85;
        [v85 setModalPresentationCapturesStatusBarAppearance:1];
        [v61 setModalPresentationStyle:5];
        id v62 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v62
          && (id v63 = v62,
              id v64 = [v62 topViewController],
              v63,
              v64))
        {
          id v65 = v85;
          [v64 presentViewController:v85 animated:1 completion:0];
        }
        else
        {
        }
      }
      v81(v8, v2);
      return;
    case 3u:
      type metadata accessor for IntroViewController();
      id v33 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
      swift_unknownObjectWeakAssign();
      uint64_t v34 = *(void *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_device];
      uint64_t v36 = *(void *)(v34 + 16);
      uint64_t v35 = *(void *)(v34 + 24);
      os_log_type_t v37 = &v33[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_deviceName];
      *(void *)os_log_type_t v37 = v36;
      *((void *)v37 + 1) = v35;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      self;
      uint64_t v38 = swift_dynamicCastObjCClass();
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v40)
        {
          unint64_t v41 = v40;
          [v40 pushViewController:v33 animated:1];

          return;
        }
        v66 = v33;
        id v33 = (char *)sub_100006A80();
        uint64_t v67 = swift_allocObject();
        *(void *)(v67 + 16) = v1;
        *(void *)(v67 + 24) = v39;
        uint64_t v91 = (void (*)(char))sub_10000A9B4;
        uint64_t v92 = v67;
        aBlock = _NSConcreteStackBlock;
        uint64_t v88 = 1107296256;
        v89 = sub_100008A30;
        id v90 = &unk_100010800;
        v68 = _Block_copy(&aBlock);
        v69 = v66;
        id v70 = v1;
        swift_release();
        [v33 startProxCardTransactionWithOptions:0 completion:v68];
        _Block_release(v68);
      }
      else
      {
        [v33 setModalPresentationCapturesStatusBarAppearance:1];
        [v33 setModalPresentationStyle:5];
        id v58 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v58)
        {
          uint64_t v59 = v58;
          id v60 = [v58 topViewController];

          if (v60)
          {
            [v60 presentViewController:v33 animated:1 completion:0];

            return;
          }
        }
      }

      return;
    case 5u:
      unint64_t v42 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v42)
      {
        unint64_t v43 = v42;
        id v44 = [v42 topViewController];

        if (v44)
        {
          type metadata accessor for PinEntryViewController();
          uint64_t v45 = swift_dynamicCastClass();

          if (v45)
          {
            int v46 = (void *)swift_unknownObjectWeakLoadStrong();
            if (v46)
            {
              id v47 = v46;
              id v48 = [v46 popViewControllerAnimated:1];
            }
          }
        }
      }
      return;
    case 9u:
    case 0xBu:
      sub_10000632C(1);
      return;
    default:
      sub_1000055F8((uint64_t)v11);
      return;
  }
}

void sub_1000085D4(uint64_t a1)
{
  type metadata accessor for PinEntryViewController();
  id v3 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  [v3 setNumberOfDigits:a1];
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v21 = sub_10000A7AC;
  uint64_t v22 = v4;
  uint64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 1107296256;
  uint64_t v19 = sub_100008B84;
  unint64_t v20 = &unk_100010850;
  uint64_t v5 = _Block_copy(&v17);
  id v6 = v3;
  swift_release();
  [v6 setTextEntryCompletionHandler:v5];
  _Block_release(v5);

  self;
  uint64_t v7 = swift_dynamicCastObjCClass();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v10 = Strong;
      [Strong pushViewController:v6 animated:1];
    }
    else
    {
      id v13 = v6;
      id v10 = sub_100006A80();
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = v1;
      *(void *)(v14 + 24) = v8;
      uint64_t v21 = (void (*)())sub_10000A9B4;
      uint64_t v22 = v14;
      uint64_t v17 = _NSConcreteStackBlock;
      uint64_t v18 = 1107296256;
      uint64_t v19 = sub_100008A30;
      unint64_t v20 = &unk_1000108A0;
      uint64_t v15 = _Block_copy(&v17);
      id v6 = v13;
      id v16 = v1;
      swift_release();
      [v10 startProxCardTransactionWithOptions:0 completion:v15];
      _Block_release(v15);
    }
    goto LABEL_8;
  }
  [v6 setModalPresentationCapturesStatusBarAppearance:1];
  [v6 setModalPresentationStyle:5];
  uint64_t v11 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v11)
  {
    uint64_t v12 = v11;
    id v10 = [v11 topViewController];

    if (v10)
    {
      [v10 presentViewController:v6 animated:1 completion:0];
LABEL_8:

      id v6 = v10;
    }
  }
}

void sub_10000889C(char a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v6 = Strong;
      id v12 = [Strong presentProxCardFlowWithDelegate:a2 initialViewController:a3];
    }
    else
    {
      id v12 = 0;
    }
    swift_unknownObjectWeakAssign();
  }
  else
  {
    if (qword_100015C20 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_10000520C(v7, (uint64_t)qword_100015ED0);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "SFClient prevented HomeCaptiveViewService from displaying prox card", v10, 2u);
      swift_slowDealloc();
    }

    id v11 = sub_100006A80();
    [v11 invalidate];

    sub_10000632C(1);
  }
}

uint64_t sub_100008A30(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_100008A84()
{
  id v0 = objc_allocWithZone((Class)SKAuthenticationResponseEvent);
  swift_bridgeObjectRetain();
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithPassword:v1];

  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    uint64_t v5 = *(void *)(Strong + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setup);
    swift_retain();

    id v6 = *(void **)(v5 + 16);
    if (v6)
    {
      id v7 = v6;
      swift_release();
      [v7 postEvent:v2];
    }
    else
    {
      swift_release();
    }
  }
}

uint64_t sub_100008B84(uint64_t a1)
{
  NSString v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_100008C20()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  [super dealloc];
}

uint64_t sub_100008CF4()
{
  return type metadata accessor for SetupCoordinator(0);
}

uint64_t type metadata accessor for SetupCoordinator(uint64_t a1)
{
  return sub_100008DF4(a1, (uint64_t *)&unk_100015F40);
}

uint64_t sub_100008D1C()
{
  uint64_t result = type metadata accessor for SetupFlowState(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for SetupFlowState(uint64_t a1)
{
  return sub_100008DF4(a1, qword_1000160E8);
}

uint64_t sub_100008DF4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_100008E30()
{
  if (qword_100015C20 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000520C(v0, (uint64_t)qword_100015ED0);
  unint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    sub_10000B030(0xD000000000000018, 0x800000010000C8D0, &v5);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return sub_10000632C(1);
}

void sub_100009070()
{
  unint64_t v1 = v0;
  if (qword_100015C20 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000520C(v2, (uint64_t)qword_100015ED0);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_10000B030(0xD000000000000011, 0x800000010000C860, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s called", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v7 = Strong;
    id v8 = [Strong topViewController];

    if (v8)
    {
      id v9 = [v8 presentedViewController];

      if (v9)
      {
        uint64_t v10 = swift_allocObject();
        *(void *)(v10 + 16) = v1;
        aBlock[4] = (uint64_t)sub_10000A688;
        aBlock[5] = v10;
        aBlock[0] = (uint64_t)_NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1000066F4;
        aBlock[3] = (uint64_t)&unk_100010760;
        id v11 = _Block_copy(aBlock);
        id v12 = v9;
        id v13 = v1;
        swift_release();
        [v12 dismissViewControllerAnimated:1 completion:v11];

        _Block_release(v11);
      }
    }
  }
}

uint64_t *sub_10000935C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for URL();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = sub_100003598(&qword_100016070);
      uint64_t v9 = *(int *)(v8 + 48);
      uint64_t v10 = (uint64_t *)((char *)a1 + v9);
      id v11 = (uint64_t *)((char *)a2 + v9);
      uint64_t v13 = *v11;
      uint64_t v12 = v11[1];
      *uint64_t v10 = v13;
      v10[1] = v12;
      uint64_t v14 = *(int *)(v8 + 64);
      uint64_t v15 = (uint64_t *)((char *)a1 + v14);
      id v16 = (uint64_t *)((char *)a2 + v14);
      uint64_t v17 = v16[1];
      *uint64_t v15 = *v16;
      v15[1] = v17;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t sub_10000949C(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
    sub_100003598(&qword_100016070);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

char *sub_100009548(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for URL();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    uint64_t v7 = sub_100003598(&qword_100016070);
    uint64_t v8 = *(int *)(v7 + 48);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v12 = *(void *)v10;
    uint64_t v11 = *((void *)v10 + 1);
    *(void *)uint64_t v9 = v12;
    *((void *)v9 + 1) = v11;
    uint64_t v13 = *(int *)(v7 + 64);
    uint64_t v14 = &a1[v13];
    uint64_t v15 = &a2[v13];
    uint64_t v16 = *((void *)v15 + 1);
    *(void *)uint64_t v14 = *(void *)v15;
    *((void *)v14 + 1) = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *sub_100009644(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000055F8((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for URL();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = sub_100003598(&qword_100016070);
      uint64_t v8 = *(int *)(v7 + 48);
      uint64_t v9 = &a1[v8];
      uint64_t v10 = &a2[v8];
      *(void *)uint64_t v9 = *(void *)v10;
      *((void *)v9 + 1) = *((void *)v10 + 1);
      uint64_t v11 = *(int *)(v7 + 64);
      uint64_t v12 = &a1[v11];
      uint64_t v13 = &a2[v11];
      *(void *)uint64_t v12 = *(void *)v13;
      *((void *)v12 + 1) = *((void *)v13 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

char *sub_100009760(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for URL();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    uint64_t v7 = sub_100003598(&qword_100016070);
    *(_OWORD *)&a1[*(int *)(v7 + 48)] = *(_OWORD *)&a2[*(int *)(v7 + 48)];
    *(_OWORD *)&a1[*(int *)(v7 + 64)] = *(_OWORD *)&a2[*(int *)(v7 + 64)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *sub_10000983C(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000055F8((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for URL();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = sub_100003598(&qword_100016070);
      *(_OWORD *)&a1[*(int *)(v7 + 48)] = *(_OWORD *)&a2[*(int *)(v7 + 48)];
      *(_OWORD *)&a1[*(int *)(v7 + 64)] = *(_OWORD *)&a2[*(int *)(v7 + 64)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100009928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100009950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100009980()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100009990()
{
  v2[4] = (char *)&value witness table for Builtin.Int64 + 64;
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

id sub_100009A44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  uint64_t v8 = OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewController;
  *(void *)&v4[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewController] = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for SetupFlowState(0);
  swift_storeEnumTagMultiPayload();
  *(void *)&v4[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator____lazy_storage___sfClient] = 0;
  *(void *)&v4[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_device] = a1;
  uint64_t v9 = v4;
  swift_retain();
  id v10 = sub_100002B44();
  type metadata accessor for Setup();
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 32) = 0;
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = v10;
  *(void *)&v9[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setup] = v11;
  swift_unknownObjectWeakAssign();
  *(void *)&v4[v8] = a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
  v13.receiver = v9;
  v13.super_class = ObjectType;
  return [super init];
}

uint64_t sub_100009B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SetupFlowState(0);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  objc_super v13 = (uint64_t *)((char *)&v35 - v12);
  uint64_t v14 = sub_100003598(&qword_100016120);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = &v17[*(int *)(v15 + 56)];
  sub_100005244(a1, (uint64_t)v17);
  sub_100005244(a2, (uint64_t)v18);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_100005244((uint64_t)v17, (uint64_t)v11);
      uint64_t v20 = sub_100003598(&qword_100016070);
      uint64_t v21 = *(int *)(v20 + 48);
      uint64_t v22 = *(void *)&v11[v21 + 8];
      uint64_t v41 = *(void *)&v11[v21];
      uint64_t v42 = v22;
      uint64_t v23 = *(int *)(v20 + 64);
      uint64_t v24 = *(void *)&v11[v23 + 8];
      uint64_t v40 = *(void *)&v11[v23];
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
        goto LABEL_33;
      }
      uint64_t v25 = *(void *)&v18[v21 + 8];
      uint64_t v38 = *(void *)&v18[v21];
      uint64_t v39 = v24;
      uint64_t v27 = *(void *)&v18[v23];
      uint64_t v26 = *(void *)&v18[v23 + 8];
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
      char v28 = static URL.== infix(_:_:)();
      unint64_t v29 = *(void (**)(char *, uint64_t))(v5 + 8);
      v29(v11, v4);
      if ((v28 & 1) == 0)
      {
        v29(v7, v4);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_37;
      }
      uint64_t v36 = v27;
      uint64_t v37 = v26;
      if (v41 == v38 && v42 == v25)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v31 & 1) == 0)
        {
          v29(v7, v4);
          swift_bridgeObjectRelease();
LABEL_37:
          swift_bridgeObjectRelease();
LABEL_38:
          sub_1000055F8((uint64_t)v17);
          return 0;
        }
      }
      if (v39)
      {
        if (!v37)
        {
          v29(v7, v4);
          goto LABEL_37;
        }
        if (v40 == v36 && v39 == v37)
        {
          swift_bridgeObjectRelease();
          v29(v7, v4);
          swift_bridgeObjectRelease();
        }
        else
        {
          char v34 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          v29(v7, v4);
          swift_bridgeObjectRelease();
          if ((v34 & 1) == 0) {
            goto LABEL_38;
          }
        }
      }
      else
      {
        v29(v7, v4);
        if (v37) {
          goto LABEL_37;
        }
      }
LABEL_31:
      sub_1000055F8((uint64_t)v17);
      return 1;
    case 2u:
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 3u:
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 4u:
      if (swift_getEnumCaseMultiPayload() != 4) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 5u:
      if (swift_getEnumCaseMultiPayload() != 5) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 6u:
      if (swift_getEnumCaseMultiPayload() != 6) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 7u:
      if (swift_getEnumCaseMultiPayload() != 7) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 8u:
      if (swift_getEnumCaseMultiPayload() != 8) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 9u:
      if (swift_getEnumCaseMultiPayload() != 9) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 0xAu:
      if (swift_getEnumCaseMultiPayload() != 10) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 0xBu:
      if (swift_getEnumCaseMultiPayload() == 11) {
        goto LABEL_31;
      }
      goto LABEL_33;
    default:
      sub_100005244((uint64_t)v17, (uint64_t)v13);
      if (swift_getEnumCaseMultiPayload())
      {
LABEL_33:
        sub_10000570C((uint64_t)v17, &qword_100016120);
        return 0;
      }
      else
      {
        BOOL v19 = *v13 == *(void *)v18;
        sub_1000055F8((uint64_t)v17);
      }
      return v19;
  }
}

void sub_10000A2C4(uint64_t a1, uint64_t a2)
{
  if (qword_100015C20 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000520C(v4, (uint64_t)qword_100015ED0);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    sub_10000B030(0xD000000000000027, 0x800000010000C8A0, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s called", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Posting CaptiveNetworkNavigation event with unkown probe result", v10, 2u);
    swift_slowDealloc();
  }

  id v11 = [objc_allocWithZone((Class)SKEvent) initWithEventType:201];
  uint64_t v12 = *(void **)(*(void *)(a1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setup) + 16);
  if (v12) {
    [v12 postEvent:v11];
  }
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, 4);
}

void sub_10000A518()
{
  if (qword_100015C20 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000520C(v0, (uint64_t)qword_100015ED0);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 134217984;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "WebSheetResult: %ld", v2, 0xCu);
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_10000A650()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10000A688()
{
  return sub_10000632C(1);
}

uint64_t sub_10000A6B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000A6C0()
{
  return swift_release();
}

uint64_t sub_10000A6C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SetupFlowState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void sub_10000A72C(char a1)
{
  sub_10000889C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000A734()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A774()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000A7AC()
{
}

void sub_10000A7B4(void *a1)
{
}

id sub_10000A7BC()
{
  return [*(id *)(v0 + 16) dismissViewController:0];
}

__CFString *sub_10000A7D0(int a1)
{
  if (a1 > 109)
  {
    if (a1 <= 199)
    {
      if (a1 > 129)
      {
        if (a1 == 130)
        {
          uint64_t v1 = @"AuthenticationResponse";
          goto LABEL_39;
        }
        if (a1 == 140)
        {
          uint64_t v1 = @"AuthenticationCompleted";
          goto LABEL_39;
        }
      }
      else
      {
        if (a1 == 110)
        {
          uint64_t v1 = @"AuthenticationPresent";
          goto LABEL_39;
        }
        if (a1 == 120)
        {
          uint64_t v1 = @"AuthenticationRequest";
          goto LABEL_39;
        }
      }
      goto LABEL_38;
    }
    if (a1 > 201)
    {
      if (a1 == 202)
      {
        uint64_t v1 = @"CaptiveNetworkAuthenticated";
        goto LABEL_39;
      }
      if (a1 == 300)
      {
        uint64_t v1 = @"BasicConfigUpdated";
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    if (a1 == 200) {
      uint64_t v1 = @"CaptiveNetworkPresent";
    }
    else {
      uint64_t v1 = @"CaptiveNetworkNavigation";
    }
  }
  else
  {
    if (a1 <= 39)
    {
      if (a1 > 19)
      {
        if (a1 == 20)
        {
          uint64_t v1 = @"Completed";
          goto LABEL_39;
        }
        if (a1 == 30)
        {
          uint64_t v1 = @"Invalidated";
          goto LABEL_39;
        }
      }
      else
      {
        if (!a1)
        {
          uint64_t v1 = @"Unknown";
          goto LABEL_39;
        }
        if (a1 == 10)
        {
          uint64_t v1 = @"Started";
          goto LABEL_39;
        }
      }
LABEL_38:
      uint64_t v1 = @"?";
      goto LABEL_39;
    }
    if (a1 > 41)
    {
      if (a1 == 42)
      {
        uint64_t v1 = @"Error";
        goto LABEL_39;
      }
      if (a1 == 100)
      {
        uint64_t v1 = @"AuthenticationTypeChanged";
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    if (a1 == 40) {
      uint64_t v1 = @"ConnectionStarted";
    }
    else {
      uint64_t v1 = @"ConnectionEnded";
    }
  }
LABEL_39:
  uint64_t v2 = v1;

  return v1;
}

void sub_10000A9B8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000057D0(v0, qword_100016380);
  sub_10000520C(v0, (uint64_t)qword_100016380);
  id v1 = [self mainBundle];
  id v2 = [v1 bundleIdentifier];

  if (v2)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    Logger.init(subsystem:category:)();
  }
  else
  {
    __break(1u);
  }
}

id sub_10000AAD0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for AppDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

uint64_t sub_10000ABB4()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000057D0(v0, qword_100016290);
  uint64_t v1 = sub_10000520C(v0, (uint64_t)qword_100016290);
  if (qword_100015C28 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000520C(v0, (uint64_t)qword_100016380);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

id sub_10000AC7C()
{
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for PinEntryViewController();
  [super viewDidLoad];
  uint64_t v1 = self;
  id v2 = [v1 mainBundle];
  v14._object = (void *)0xE000000000000000;
  v3._countAndFlagsBits = 0x49544E4548545541;
  v3._object = (void *)0xEE004E4F49544143;
  v4.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v4.value._object = (void *)0xEB00000000656C62;
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  v14._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v3, v4, (NSBundle)v2, v5, v14);

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setTitle:v6];

  id v7 = [v1 mainBundle];
  v15._object = (void *)0xE000000000000000;
  v8._object = (void *)0x800000010000CD80;
  v8._countAndFlagsBits = 0xD00000000000001CLL;
  v9.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v9.value._object = (void *)0xEB00000000656C62;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  v15._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v8, v9, (NSBundle)v7, v10, v15);

  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setSubtitle:v11];

  [v0 setDismissalType:3];
  return [v0 setUseMonospacedFont:1];
}

id sub_10000AFC8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PinEntryViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for PinEntryViewController()
{
  return self;
}

uint64_t sub_10000B030(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000B104(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005654((uint64_t)v12, *a3);
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
      sub_100005654((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100005780((uint64_t)v12);
  return v7;
}

uint64_t sub_10000B104(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000B2C0(a5, a6);
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

uint64_t sub_10000B2C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000B358(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000B538(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000B538(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000B358(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000B4D0(v2, 0);
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

void *sub_10000B4D0(uint64_t a1, uint64_t a2)
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
  sub_100003598(&qword_1000162D8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000B538(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003598(&qword_1000162D8);
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
  objc_super v13 = a4 + 32;
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

void sub_10000B688()
{
  uint64_t v1 = v0;
  if (qword_100015C30 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000520C(v2, (uint64_t)qword_100016290);
  unint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    size_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)size_t v5 = 136315138;
    sub_10000B030(0xD000000000000018, 0x800000010000CB10, &v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  NSString v6 = String._bridgeToObjectiveC()();
  [v1 showActivityIndicatorWithStatus:v6];
}

uint64_t sub_10000B834()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
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

uint64_t static URL.== infix(_:_:)()
{
  return static URL.== infix(_:_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
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

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
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

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(format:arguments:)()
{
  return String.init(format:arguments:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
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

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_getTupleTypeLayout3()
{
  return _swift_getTupleTypeLayout3();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}