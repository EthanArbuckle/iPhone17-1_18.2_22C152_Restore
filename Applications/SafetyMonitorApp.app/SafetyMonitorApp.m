id sub_1000023E0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureWindow();
  return [super dealloc];
}

uint64_t type metadata accessor for SecureWindow()
{
  return self;
}

uint64_t sub_10000243C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100002480()
{
  return 1;
}

uint64_t sub_100002488(uint64_t a1)
{
  v2 = v1;
  id v4 = objc_allocWithZone(v1);
  uint64_t v5 = sub_100002800(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)((char *)v2 + qword_10001A350) - 8) + 8))(a1);
  return v5;
}

void *sub_100002508(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_10000254C(a1, a2);
}

void *sub_10000254C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)((swift_isaMask & *v2) + qword_10001A350);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(a1, a2);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  v7 = (void *)UIHostingController.init(coder:rootView:)();
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  id v9 = v7;
  v8(a2, v4);
  if (v7) {

  }
  return v7;
}

id sub_100002684(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecureUIHostingController();
  [super initWithCoder:a1];

  return v3;
}

id sub_10000271C(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_100002684(a3);
}

id sub_100002744()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureUIHostingController();
  return [super dealloc];
}

uint64_t type metadata accessor for SecureUIHostingController()
{
  return sub_1000028E8();
}

void type metadata accessor for SBUISystemApertureContentRole(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
}

uint64_t sub_100002800(uint64_t a1)
{
  __chkstk_darwin(a1, a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - v1);
  return UIHostingController.init(rootView:)();
}

uint64_t sub_1000028E8()
{
  return swift_getGenericMetadata();
}

void type metadata accessor for SMSessionStartEntryType(uint64_t a1)
{
}

void sub_10000292C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_100002A3C(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(a1 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return v3;
}

uint64_t sub_100002AB4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  v8 = (uint64_t *)(a1 + *a4);
  uint64_t *v8 = v6;
  v8[1] = v7;

  return swift_bridgeObjectRelease();
}

uint64_t sub_100002C38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)SessionViewModel.sessionState.getter();
  if (v2)
  {
    NSString v3 = v2;
    id v4 = [v2 configuration];
    if (v4)
    {
      objc_super v5 = v4;
      id v6 = [v4 conversation];

      id v7 = [v6 receiverPrimaryHandles];
      static Array._unconditionallyBridgeFromObjectiveC(_:)();
    }
    id v11 = [v3 configuration];
    v12 = v11;
    if (v11)
    {
      id v13 = [v11 conversation];

      id v14 = [v13 identifier];
      if (v14)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
      }
    }
    type metadata accessor for SMInitiatorAlertUtilities();
    [v3 isActiveState];
    dispatch thunk of static SMInitiatorAlertUtilities.deepLinkURL(for:with:and:)();

    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = type metadata accessor for URL();
    id v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    return v9(a1, 1, 1, v8);
  }
}

uint64_t sub_100002E58()
{
  uint64_t v1 = v0;
  uint64_t v38 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v45 = *(void *)(v38 - 8);
  __chkstk_darwin(v38, v2);
  v44 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v42 = *(void *)(v4 - 8);
  uint64_t v43 = v4;
  __chkstk_darwin(v4, v5);
  v41 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchTime();
  uint64_t v39 = *(void *)(v7 - 8);
  uint64_t v40 = v7;
  uint64_t v9 = __chkstk_darwin(v7, v8);
  id v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v12);
  v37 = (char *)&v35 - v13;
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.initiator.getter();
  v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = v1;
    v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v36 = v14;
    aBlock[0] = v23;
    *(_DWORD *)v22 = 136315138;
    uint64_t v46 = sub_10000DA8C(0xD000000000000014, 0x8000000100010D00, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "#Initiator,LiveActivity,%s", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v1 = v21;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v36);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  }
  sub_100009648(0, (unint64_t *)&unk_10001A1A0);
  v24 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  v25 = v37;
  + infix(_:_:)();
  uint64_t v39 = *(void *)(v39 + 8);
  v26 = v11;
  uint64_t v27 = v40;
  ((void (*)(char *, uint64_t))v39)(v26, v40);
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v1;
  aBlock[4] = (uint64_t)sub_1000096C4;
  aBlock[5] = v28;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000C964;
  aBlock[3] = (uint64_t)&unk_100014E30;
  v29 = _Block_copy(aBlock);
  id v30 = v1;
  swift_release();
  v31 = v41;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_1000083B0((unint64_t *)&unk_100019FA0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000082B8((uint64_t *)&unk_10001A1B0);
  sub_1000096DC(&qword_100019FB0, (uint64_t *)&unk_10001A1B0);
  v32 = v44;
  uint64_t v33 = v38;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v29);

  (*(void (**)(char *, uint64_t))(v45 + 8))(v32, v33);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v31, v43);
  return ((uint64_t (*)(char *, uint64_t))v39)(v25, v27);
}

uint64_t sub_1000033F0(void *a1)
{
  id v1 = [a1 systemApertureElementContext];
  v4[4] = sub_1000034B4;
  v4[5] = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_10000C964;
  v4[3] = &unk_100014E58;
  uint64_t v2 = _Block_copy(v4);
  [v1 setElementNeedsUpdateWithCoordinatedAnimations:v2];
  _Block_release(v2);
  return swift_unknownObjectRelease();
}

uint64_t sub_1000034B4()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.initiator.getter();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v9 = sub_10000DA8C(0xD000000000000014, 0x8000000100010D00, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "#Initiator,LiveActivity,%s, update animation called", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

void sub_100003688()
{
  uint64_t v16 = sub_1000082B8(&qword_100019FE8);
  uint64_t v1 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v2);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000082B8(&qword_100019FF0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (objc_class *)type metadata accessor for LiveActivityElementViewController();
  v17.receiver = v0;
  v17.super_class = v10;
  [super viewDidLoad];
  id v11 = [v0 view];
  if (v11)
  {
    uint64_t v12 = v11;
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    sub_100003B94();
    SessionViewModel.$sessionState.getter();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1000096DC(&qword_100019FF8, &qword_100019FF0);
    Publisher<>.sink(receiveValue:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    swift_beginAccess();
    AnyCancellable.store(in:)();
    swift_endAccess();
    swift_release();
    SessionViewModel.$localSessionState.getter();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1000096DC(&qword_10001A000, &qword_100019FE8);
    uint64_t v13 = v16;
    Publisher<>.sink(receiveValue:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v13);
    swift_beginAccess();
    AnyCancellable.store(in:)();
    swift_endAccess();
    swift_release();
    uint64_t v14 = (void *)SessionViewModel.sessionState.getter();
    uint64_t v15 = (void *)SessionViewModel.localSessionState.getter();
    sub_100004DD0(v14, (uint64_t)v15);
  }
  else
  {
    __break(1u);
  }
}

void sub_1000039FC(void **a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    uint64_t v4 = (void *)SessionViewModel.localSessionState.getter();
    sub_100004DD0(v1, (uint64_t)v4);

    uint64_t v5 = (void *)SessionViewModel.localSessionState.getter();
    sub_100006698(v1, v5);
  }
}

void sub_100003AA8(void **a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    uint64_t v4 = (void *)SessionViewModel.sessionState.getter();
    sub_100004DD0(v4, (uint64_t)v1);

    uint64_t v5 = (void *)SessionViewModel.sessionState.getter();
    sub_100006698(v5, v1);
  }
}

void sub_100003B94()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)&v0[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView];
  if (v6)
  {
    uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView];
    if (v7)
    {
      uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView];
      if (v8)
      {
        id v9 = v6;
        id v10 = v7;
        id v11 = v8;
        id v12 = [v0 view];
        if (v12)
        {
          uint64_t v13 = v12;
          [v12 addSubview:v9];

          id v14 = [v0 view];
          if (v14)
          {
            uint64_t v15 = v14;
            [v14 addSubview:v10];

            id v16 = [v0 view];
            if (v16)
            {
              objc_super v17 = v16;
              [v16 addSubview:v11];

              [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
              [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
              [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
              v18 = self;
              sub_1000082B8((uint64_t *)&unk_10001A1F0);
              uint64_t v19 = swift_allocObject();
              *(_OWORD *)(v19 + 16) = xmmword_1000120E0;
              id v20 = [v9 widthAnchor];
              static SafetyMonitorUIConstants.liveActivityDynamicIslandAvatarDiameter.getter();
              double v22 = v21;
              static SafetyMonitorUIConstants.liveActivityDynamicIslandOuterEdgePadding.getter();
              double v24 = v22 + v23;
              static SafetyMonitorUIConstants.liveActivityDynamicIslandInnerEdgePadding.getter();
              id v26 = [v20 constraintEqualToConstant:v24 + v25];

              *(void *)(v19 + 32) = v26;
              id v27 = [v9 heightAnchor];
              static SafetyMonitorUIConstants.liveActivityDynamicIslandAvatarDiameter.getter();
              id v28 = [v27 constraintEqualToConstant:];

              *(void *)(v19 + 40) = v28;
              id v29 = [v10 widthAnchor];
              static SafetyMonitorUIConstants.liveActivityDynamicIslandAvatarDiameter.getter();
              double v31 = v30;
              static SafetyMonitorUIConstants.liveActivityDynamicIslandOuterEdgePadding.getter();
              double v33 = v31 + v32;
              static SafetyMonitorUIConstants.liveActivityDynamicIslandInnerEdgePadding.getter();
              id v35 = [v29 constraintEqualToConstant:v33 + v34];

              *(void *)(v19 + 48) = v35;
              id v36 = [v10 heightAnchor];
              static SafetyMonitorUIConstants.liveActivityDynamicIslandBadgeDiameter.getter();
              id v37 = [v36 constraintEqualToConstant:];

              *(void *)(v19 + 56) = v37;
              id v38 = [v11 widthAnchor];
              static SafetyMonitorUIConstants.liveActivityDynamicIslandBadgeDiameter.getter();
              id v39 = [v38 constraintEqualToConstant:];

              *(void *)(v19 + 64) = v39;
              id v40 = [v11 heightAnchor];
              static SafetyMonitorUIConstants.liveActivityDynamicIslandBadgeDiameter.getter();
              id v41 = [v40 constraintEqualToConstant:];

              *(void *)(v19 + 72) = v41;
              uint64_t v49 = v19;
              specialized Array._endMutation()();
              sub_100009648(0, (unint64_t *)&unk_100019F90);
              Class isa = Array._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease();
              [v18 activateConstraints:isa];

              Class v42 = isa;

              return;
            }
LABEL_15:
            __break(1u);
            return;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        goto LABEL_15;
      }
    }
  }
  static Logger.initiator.getter();
  uint64_t v43 = Logger.logObject.getter();
  os_log_type_t v44 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    *(_DWORD *)uint64_t v45 = 136315138;
    uint64_t v48 = sub_10000DA8C(0xD00000000000001ALL, 0x8000000100010CE0, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "#Initiator, LiveActivity, %s, Dynamic island views nil - unable to setup", v45, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
}

void sub_1000040F8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.initiator.getter();
  id v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    v16[0] = a1;
    id v12 = (uint8_t *)v11;
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)id v12 = 136315138;
    v16[1] = sub_10000DA8C(0xD00000000000001DLL, 0x8000000100010CC0, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s: Layout subviews", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = (void *)v16[0];
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v2;
  aBlock[4] = (uint64_t)sub_1000096BC;
  aBlock[5] = v13;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100004D00;
  aBlock[3] = (uint64_t)&unk_100014DE0;
  id v14 = _Block_copy(aBlock);
  id v15 = v2;
  swift_release();
  [a1 animateAlongsideTransition:v14 completion:0];
  _Block_release(v14);
}

uint64_t sub_100004388(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v6 = __chkstk_darwin(v3, v5);
  uint64_t v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v6, v9);
  id v12 = (char *)&v54 - v11;
  uint64_t v14 = __chkstk_darwin(v10, v13);
  id v16 = (char *)&v54 - v15;
  uint64_t v18 = __chkstk_darwin(v14, v17);
  id v20 = (char *)&v54 - v19;
  uint64_t v22 = __chkstk_darwin(v18, v21);
  double v24 = (char *)&v54 - v23;
  uint64_t v26 = __chkstk_darwin(v22, v25);
  id v28 = (char *)&v54 - v27;
  __chkstk_darwin(v26, v29);
  double v31 = (char *)&v54 - v30;
  switch(*(void *)(a2 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_activeLayoutMode))
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      static Logger.initiator.getter();
      double v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v32, v33))
      {
        double v34 = (uint8_t *)swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        *(_DWORD *)double v34 = 136315138;
        uint64_t v54 = sub_10000DA8C(0xD00000000000001DLL, 0x8000000100010CC0, &v55);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "%s: Removed Active Layout", v34, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v12, v3);
      break;
    case 0:
      static Logger.initiator.getter();
      id v36 = Logger.logObject.getter();
      os_log_type_t v37 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v36, v37))
      {
        id v38 = (uint8_t *)swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        *(_DWORD *)id v38 = 136315138;
        uint64_t v54 = sub_10000DA8C(0xD00000000000001DLL, 0x8000000100010CC0, &v55);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "%s: Initial Active Layout", v38, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v31, v3);
      break;
    case 1:
      sub_100007930();
      static Logger.initiator.getter();
      id v39 = Logger.logObject.getter();
      os_log_type_t v40 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v39, v40))
      {
        id v41 = (uint8_t *)swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        *(_DWORD *)id v41 = 136315138;
        uint64_t v54 = sub_10000DA8C(0xD00000000000001DLL, 0x8000000100010CC0, &v55);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "%s: Inactive Active Layout", v41, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v28, v3);
      break;
    case 2:
      sub_100007930();
      sub_1000065FC(0);
      sub_100002E58();
      static Logger.initiator.getter();
      Class v42 = Logger.logObject.getter();
      os_log_type_t v43 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v42, v43))
      {
        os_log_type_t v44 = (uint8_t *)swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        *(_DWORD *)os_log_type_t v44 = 136315138;
        uint64_t v54 = sub_10000DA8C(0xD00000000000001DLL, 0x8000000100010CC0, &v55);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "%s: Minimal Active Layout", v44, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v24, v3);
      break;
    case 3:
      sub_100007930();
      sub_1000065FC(0);
      sub_100002E58();
      static Logger.initiator.getter();
      uint64_t v45 = Logger.logObject.getter();
      os_log_type_t v46 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = (uint8_t *)swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        *(_DWORD *)v47 = 136315138;
        uint64_t v54 = sub_10000DA8C(0xD00000000000001DLL, 0x8000000100010CC0, &v55);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "%s: Compact Active Layout", v47, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v20, v3);
      break;
    case 4:
      sub_100006D58();
      sub_100002E58();
      static Logger.initiator.getter();
      uint64_t v48 = Logger.logObject.getter();
      os_log_type_t v49 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v48, v49))
      {
        v50 = (uint8_t *)swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        *(_DWORD *)v50 = 136315138;
        uint64_t v54 = sub_10000DA8C(0xD00000000000001DLL, 0x8000000100010CC0, &v55);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v48, v49, "%s: Custom Active Layout", v50, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v16, v3);
      break;
    default:
      static Logger.initiator.getter();
      v51 = Logger.logObject.getter();
      os_log_type_t v52 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = (uint8_t *)swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        *(_DWORD *)v53 = 136315138;
        uint64_t v54 = sub_10000DA8C(0xD00000000000001DLL, 0x8000000100010CC0, &v55);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "%s: Other Active Layout", v53, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v8, v3);
      break;
  }
  return result;
}

uint64_t sub_100004D00(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_100004DD0(void *a1, uint64_t a2)
{
  uint64_t v193 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v193 - 8);
  uint64_t v7 = __chkstk_darwin(v193, v6);
  uint64_t v9 = (char *)&v177 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v7, v10);
  uint64_t v13 = __chkstk_darwin(v11, v12);
  __chkstk_darwin(v13, v14);
  uint64_t v18 = (char *)&v177 - v17;
  uint64_t v19 = *(void **)(v2 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView);
  if (v19)
  {
    id v20 = *(void **)(v2 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView);
    if (v20)
    {
      uint64_t v21 = *(void **)(v2 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView);
      if (v21)
      {
        uint64_t v184 = v16;
        uint64_t v180 = v15;
        uint64_t v191 = v2;
        id v22 = objc_allocWithZone((Class)SMContactsManager);
        id v23 = v19;
        id v186 = v20;
        id v24 = v21;
        id v25 = [v22 init];
        id v189 = v23;
        uint64_t v190 = a2;
        id v187 = v24;
        if (a1 && (id v26 = [a1 configuration]) != 0)
        {
          uint64_t v27 = v26;
          id v28 = [v26 conversation];
        }
        else
        {
          id v28 = 0;
        }
        id v188 = v25;
        double v32 = (objc_class *)[v25 activeSessionRecipientContactsFor:v28];

        Class v33 = v32;
        Class isa = v32;
        uint64_t v35 = v193;
        if (!v32)
        {
          sub_100009648(0, &qword_100019FC0);
          static Array._unconditionallyBridgeFromObjectiveC(_:)();
          Class isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          static Array._unconditionallyBridgeFromObjectiveC(_:)();
          Class v33 = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
        }
        v185 = v33;
        id v192 = a1;
        sub_100009648(0, &qword_100019FC0);
        unint64_t v36 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
        os_log_type_t v37 = v32;
        static Logger.initiator.getter();
        id v38 = Logger.logObject.getter();
        os_log_type_t v39 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v38, v39))
        {
          os_log_type_t v40 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v40 = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, v39, "#Initiator, LiveActivity, Resolved contact and using contact avatar", v40, 2u);
          swift_slowDealloc();
        }

        os_log_type_t v43 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
        uint64_t v42 = v5 + 8;
        id v41 = v43;
        v43((uint64_t)v18, v35);
        uint64_t v44 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_avatarView;
        uint64_t v45 = v191;
        os_log_type_t v46 = *(void **)(v191 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_avatarView);
        if (!v46)
        {
          swift_bridgeObjectRelease();
          v62 = (void *)v190;
LABEL_58:
          uint64_t v99 = v45;
          v100 = &off_100019000;
          if (*(void *)(v45 + v44))
          {
            Class v101 = v185;
          }
          else
          {
            id v102 = [objc_allocWithZone((Class)CNAvatarView) init];
            sub_1000082B8((uint64_t *)&unk_10001A1F0);
            uint64_t v103 = swift_allocObject();
            *(_OWORD *)(v103 + 16) = xmmword_1000120F0;
            *(void *)(v103 + 32) = [v102 descriptorForRequiredKeys];
            v195[0] = v103;
            specialized Array._endMutation()();
            sub_1000082B8(&qword_100019FC8);
            Class v104 = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease();
            v105 = (objc_class *)[v188 fetchAdditionalInfoFor:isa keysToFetch:v104];

            if (v105)
            {

              [v102 setContacts:v105];
            }
            else
            {
              v105 = v185;
              [v102 setContacts:v185];
            }
            id v106 = v189;

            if (v192)
            {
              id v107 = [v192 configuration];
              if (v107)
              {
                v108 = v107;
                id v109 = [v107 conversation];

                id v110 = [v109 identifier];
                if (v110)
                {
                  uint64_t v111 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                  unint64_t v113 = v112;

                  id v114 = sub_1000090AC(v111, v113, v102);
                  swift_bridgeObjectRelease();
                  if (v114)
                  {
                    id v115 = [v102 updateViewWithGroupIdentity:v114];

                    swift_unknownObjectRelease();
                  }
                }
              }
            }
            v116 = *(void **)(v45 + v44);
            *(void *)(v45 + v44) = v102;
            id v117 = v102;

            id v118 = v106;
            sub_1000064E4();

            [v118 addSubview:v117];
            [v117 setTranslatesAutoresizingMaskIntoConstraints:0];
            v119 = self;
            uint64_t v120 = swift_allocObject();
            *(_OWORD *)(v120 + 16) = xmmword_100012100;
            id v121 = [v117 trailingAnchor];
            Class isa = (Class)v117;
            id v122 = [v118 trailingAnchor];
            static SafetyMonitorUIConstants.liveActivityDynamicIslandInnerEdgePadding.getter();
            id v124 = [v121 constraintEqualToAnchor:v122 constant:-v123];

            *(void *)(v120 + 32) = v124;
            id v125 = [(objc_class *)isa centerYAnchor];
            id v126 = [v118 centerYAnchor];
            id v127 = [v125 constraintEqualToAnchor:v126];

            *(void *)(v120 + 40) = v127;
            id v128 = [(objc_class *)isa widthAnchor];
            static SafetyMonitorUIConstants.liveActivityDynamicIslandAvatarDiameter.getter();
            id v129 = [v128 constraintEqualToConstant:];

            *(void *)(v120 + 48) = v129;
            id v130 = [(objc_class *)isa heightAnchor];
            static SafetyMonitorUIConstants.liveActivityDynamicIslandAvatarDiameter.getter();
            id v131 = [v130 constraintEqualToConstant:];

            *(void *)(v120 + 56) = v131;
            v100 = &off_100019000;
            v195[0] = v120;
            specialized Array._endMutation()();
            sub_100009648(0, (unint64_t *)&unk_100019F90);
            Class v101 = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease();
            [v119 activateConstraints:v101];
            v62 = (void *)v190;
          }

          id v132 = v192;
          uint64_t v190 = sub_1000093F8(v192, v62);
          uint64_t v133 = sub_1000094B8(v132, v62);
          swift_bridgeObjectRetain();
          NSString v134 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          v185 = (objc_class *)self;
          id v135 = [(objc_class *)v185 _systemImageNamed:v134];

          id v136 = [objc_allocWithZone((Class)UIImageView) initWithImage:v135];
          uint64_t v137 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph;
          v138 = *(void **)(v45 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph);
          *(void *)(v45 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph) = v136;

          v139 = *(void **)(v45 + v137);
          uint64_t v184 = sub_100009648(0, &qword_100019FB8);
          id v140 = v139;
          uint64_t v193 = v133;
          swift_retain();
          v141 = (void *)UIColor.init(_:)();
          [v140 setTintColor:v141];

          id v142 = v186;
          sub_1000064E4();

          [v142 addSubview:*(void *)(v45 + v137)];
          [*(id *)(v45 + v137) v100[115]];
          v143 = self;
          id v182 = v143;
          id v186 = (id)sub_1000082B8((uint64_t *)&unk_10001A1F0);
          uint64_t v144 = swift_allocObject();
          long long v183 = xmmword_100012100;
          *(_OWORD *)(v144 + 16) = xmmword_100012100;
          id v145 = [*(id *)(v45 + v137) leadingAnchor];
          id v192 = v142;
          id v146 = [v142 leadingAnchor];
          static SafetyMonitorUIConstants.liveActivityDynamicIslandInnerEdgePadding.getter();
          id v147 = [v145 constraintEqualToAnchor:v146];

          *(void *)(v144 + 32) = v147;
          id v148 = [*(id *)(v99 + v137) centerYAnchor];
          id v149 = [v142 centerYAnchor];
          id v150 = [v148 constraintEqualToAnchor:v149];

          *(void *)(v144 + 40) = v150;
          id v151 = [*(id *)(v99 + v137) widthAnchor];
          static SafetyMonitorUIConstants.liveActivityDynamicIslandBadgeDiameter.getter();
          id v152 = [v151 constraintEqualToConstant:];

          *(void *)(v144 + 48) = v152;
          id v153 = [*(id *)(v99 + v137) heightAnchor];
          static SafetyMonitorUIConstants.liveActivityDynamicIslandBadgeDiameter.getter();
          id v154 = [v153 constraintEqualToConstant:];

          *(void *)(v144 + 56) = v154;
          v195[0] = v144;
          specialized Array._endMutation()();
          uint64_t v181 = sub_100009648(0, (unint64_t *)&unk_100019F90);
          Class v155 = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [v143 activateConstraints:v155];

          NSString v156 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          id v157 = [(objc_class *)v185 _systemImageNamed:v156];

          id v158 = [objc_allocWithZone((Class)UIImageView) initWithImage:v157];
          uint64_t v159 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph;
          v160 = *(void **)(v99 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph);
          *(void *)(v99 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph) = v158;

          v161 = *(void **)(v99 + v159);
          swift_retain();
          id v162 = v161;
          v163 = (void *)UIColor.init(_:)();
          [v162 setTintColor:v163];

          id v164 = v187;
          sub_1000064E4();

          [v164 addSubview:*(void *)(v99 + v159)];
          [*(id *)(v99 + v159) setTranslatesAutoresizingMaskIntoConstraints:0];
          uint64_t v165 = swift_allocObject();
          *(_OWORD *)(v165 + 16) = v183;
          id v166 = [*(id *)(v99 + v159) centerXAnchor];
          id v167 = [v164 centerXAnchor];
          id v168 = [v166 constraintEqualToAnchor:v167];

          *(void *)(v165 + 32) = v168;
          id v169 = [*(id *)(v99 + v159) centerYAnchor];
          id v170 = [v164 centerYAnchor];
          id v171 = [v169 constraintEqualToAnchor:v170];

          *(void *)(v165 + 40) = v171;
          id v172 = [*(id *)(v99 + v159) widthAnchor];
          static SafetyMonitorUIConstants.liveActivityDynamicIslandBadgeDiameter.getter();
          id v173 = [v172 constraintEqualToConstant:];

          *(void *)(v165 + 48) = v173;
          id v174 = [*(id *)(v99 + v159) heightAnchor];
          static SafetyMonitorUIConstants.liveActivityDynamicIslandBadgeDiameter.getter();
          id v175 = [v174 constraintEqualToConstant:];

          *(void *)(v165 + 56) = v175;
          v195[0] = v165;
          specialized Array._endMutation()();
          Class v176 = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [v182 activateConstraints:v176];

          swift_release();
          return;
        }
        v178 = v41;
        uint64_t v179 = v42;
        uint64_t v181 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_avatarView;
        v177 = v46;
        id v182 = v46;
        id v47 = [v182 contacts];
        unint64_t v48 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        *(void *)&long long v183 = isa;
        if (v48 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v49 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v49 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        id v50 = v192;
        if (v49)
        {
          v195[0] = (uint64_t)&_swiftEmptyArrayStorage;
          sub_100008E88(0, v49 & ~(v49 >> 63), 0);
          if (v49 < 0)
          {
            __break(1u);
            goto LABEL_73;
          }
          uint64_t v51 = 0;
          os_log_type_t v52 = (void *)v195[0];
          do
          {
            if ((v48 & 0xC000000000000001) != 0) {
              id v53 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v53 = *(id *)(v48 + 8 * v51 + 32);
            }
            uint64_t v54 = v53;
            id v55 = [v53 identifier];
            uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v58 = v57;

            v195[0] = (uint64_t)v52;
            unint64_t v60 = v52[2];
            unint64_t v59 = v52[3];
            if (v60 >= v59 >> 1)
            {
              sub_100008E88(v59 > 1, v60 + 1, 1);
              os_log_type_t v52 = (void *)v195[0];
            }
            ++v51;
            v52[2] = v60 + 1;
            v61 = (char *)&v52[2 * v60];
            *((void *)v61 + 4) = v56;
            *((void *)v61 + 5) = v58;
          }
          while (v49 != v51);
          swift_bridgeObjectRelease();
          uint64_t v45 = v191;
          id v50 = v192;
          uint64_t v35 = v193;
        }
        else
        {
          swift_bridgeObjectRelease();
          os_log_type_t v52 = &_swiftEmptyArrayStorage;
        }
        uint64_t v63 = sub_100009014((uint64_t)v52);
        swift_bridgeObjectRelease();
        if (v36 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v64 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (v64)
          {
LABEL_32:
            v195[0] = (uint64_t)&_swiftEmptyArrayStorage;
            sub_100008E88(0, v64 & ~(v64 >> 63), 0);
            if ((v64 & 0x8000000000000000) == 0)
            {
              uint64_t v65 = 0;
              v66 = (void *)v195[0];
              do
              {
                if ((v36 & 0xC000000000000001) != 0) {
                  id v67 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
                }
                else {
                  id v67 = *(id *)(v36 + 8 * v65 + 32);
                }
                v68 = v67;
                id v69 = [v67 identifier];
                uint64_t v70 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                uint64_t v72 = v71;

                v195[0] = (uint64_t)v66;
                unint64_t v74 = v66[2];
                unint64_t v73 = v66[3];
                if (v74 >= v73 >> 1)
                {
                  sub_100008E88(v73 > 1, v74 + 1, 1);
                  v66 = (void *)v195[0];
                }
                ++v65;
                v66[2] = v74 + 1;
                v75 = (char *)&v66[2 * v74];
                *((void *)v75 + 4) = v70;
                *((void *)v75 + 5) = v72;
              }
              while (v64 != v65);
              swift_bridgeObjectRelease();
              uint64_t v45 = v191;
              id v50 = v192;
              uint64_t v35 = v193;
LABEL_44:
              uint64_t v76 = sub_100009014((uint64_t)v66);
              swift_bridgeObjectRelease();
              char v77 = sub_100006240(v63, v76);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v77)
              {
                v62 = (void *)v190;
                if (v50 && (id v78 = [v50 configuration]) != 0)
                {
                  v79 = v78;
                  id v80 = [v78 conversation];

                  id v81 = [v80 identifier];
                  Class isa = (Class)v183;
                  if (v81)
                  {
                    uint64_t v82 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                    unint64_t v84 = v83;

                    v85 = v182;
                    id v86 = sub_1000090AC(v82, v84, v182);
                    swift_bridgeObjectRelease();
                    if (v86)
                    {
                      uint64_t v87 = v35;
                      uint64_t v88 = v180;
                      static Logger.initiator.getter();
                      v89 = Logger.logObject.getter();
                      os_log_type_t v90 = static os_log_type_t.default.getter();
                      if (os_log_type_enabled(v89, v90))
                      {
                        v91 = (uint8_t *)swift_slowAlloc();
                        v195[0] = swift_slowAlloc();
                        *(_DWORD *)v91 = 136315138;
                        uint64_t v194 = sub_10000DA8C(0xD000000000000029, 0x8000000100010BC0, v195);
                        v62 = (void *)v190;
                        UnsafeMutableRawBufferPointer.copyMemory(from:)();
                        _os_log_impl((void *)&_mh_execute_header, v89, v90, "#Initiator, LiveActivity, %s, refreshing group avatar", v91, 0xCu);
                        swift_arrayDestroy();
                        swift_slowDealloc();
                        swift_slowDealloc();
                      }

                      v178(v88, v87);
                      id v92 = [v182 updateViewWithGroupIdentity:v86];
                      swift_unknownObjectRelease();
                      uint64_t v44 = v181;
                      v93 = *(void **)(v45 + v181);
                      *(void *)(v45 + v181) = v177;

LABEL_55:
                      Class isa = (Class)v183;
                      goto LABEL_58;
                    }
                  }
                  else
                  {
                  }
                }
                else
                {

                  Class isa = (Class)v183;
                }
                uint64_t v44 = v181;
                goto LABEL_58;
              }
              static Logger.initiator.getter();
              v94 = Logger.logObject.getter();
              os_log_type_t v95 = static os_log_type_t.default.getter();
              BOOL v96 = os_log_type_enabled(v94, v95);
              v62 = (void *)v190;
              if (v96)
              {
                v97 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v97 = 0;
                _os_log_impl((void *)&_mh_execute_header, v94, v95, "#Initiator, LiveActivity, current contacts do not match active recipients, resetting avatar view.", v97, 2u);
                swift_slowDealloc();
              }

              v178(v184, v35);
              uint64_t v44 = v181;
              v98 = v182;
              v93 = *(void **)(v45 + v181);
              *(void *)(v45 + v181) = 0;

              goto LABEL_55;
            }
LABEL_73:
            __break(1u);
            return;
          }
        }
        else
        {
          uint64_t v64 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v64) {
            goto LABEL_32;
          }
        }
        swift_bridgeObjectRelease();
        v66 = &_swiftEmptyArrayStorage;
        goto LABEL_44;
      }
    }
  }
  static Logger.initiator.getter();
  uint64_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v29, v30))
  {
    double v31 = (uint8_t *)swift_slowAlloc();
    v195[0] = swift_slowAlloc();
    *(_DWORD *)double v31 = 136315138;
    uint64_t v194 = sub_10000DA8C(0xD000000000000029, 0x8000000100010BC0, v195);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "#Initiator, LiveActivity, %s, Dynamic island views nil - unable to setup", v31, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v193);
}

uint64_t sub_100006240(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v3 + 4;
          if (v3 + 4 >= v30) {
            return 1;
          }
          unint64_t v11 = *(void *)(v29 + 8 * v12);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_25:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    uint64_t v14 = result;
    uint64_t v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v18 = Hasher._finalize()();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    id v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        uint64_t v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 5;
  if (v3 + 5 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_25;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_1000064E4()
{
  id v1 = [v0 subviews];
  sub_100009648(0, &qword_100019FE0);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v3 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_3:
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v6 = *(id *)(v2 + 8 * i + 32);
      }
      uint64_t v7 = v6;
      [v6 removeFromSuperview];
    }
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

id sub_1000065FC(char a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView);
  if (v3) {
    [v3 setHidden:a1 & 1];
  }
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView);
  if (v4) {
    [v4 setHidden:a1 & 1];
  }
  id result = *(id *)(v1 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView);
  if (result)
  {
    return [result setHidden:a1 & 1];
  }
  return result;
}

uint64_t sub_100006698(void *a1, void *a2)
{
  uint64_t v35 = a2;
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  os_log_type_t v39 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  __chkstk_darwin(v7, v8);
  int64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.initiator.getter();
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v32 = v11;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v33 = v4;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v34 = v3;
    aBlock[0] = v20;
    *(_DWORD *)uint64_t v19 = 136315138;
    uint64_t v40 = sub_10000DA8C(0xD000000000000026, 0x8000000100010B90, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "#Initiator, LiveActivity,%s,Updating trailing view for session state", v19, 0xCu);
    swift_arrayDestroy();
    uint64_t v3 = v34;
    swift_slowDealloc();
    uint64_t v4 = v33;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v32);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
  sub_100009648(0, (unint64_t *)&unk_10001A1A0);
  uint64_t v21 = (void *)static OS_dispatch_queue.main.getter();
  id v22 = (void *)swift_allocObject();
  uint64_t v24 = v35;
  BOOL v23 = v36;
  v22[2] = v36;
  v22[3] = a1;
  v22[4] = v24;
  aBlock[4] = (uint64_t)sub_10000838C;
  aBlock[5] = (uint64_t)v22;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000C964;
  aBlock[3] = (uint64_t)&unk_100014D90;
  id v25 = _Block_copy(aBlock);
  id v26 = v24;
  id v27 = v23;
  id v28 = a1;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_1000083B0((unint64_t *)&unk_100019FA0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000082B8((uint64_t *)&unk_10001A1B0);
  sub_1000096DC(&qword_100019FB0, (uint64_t *)&unk_10001A1B0);
  uint64_t v29 = v39;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v29, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v10, v38);
}

void sub_100006B58(uint64_t a1, id a2, id a3)
{
  sub_1000093F8(a2, a3);
  sub_1000094B8(a2, a3);
  uint64_t v6 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph;
  id v7 = *(id *)(a1 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph);
  swift_bridgeObjectRetain();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v9 = self;
  id v10 = [v9 _systemImageNamed:v8];

  [v7 setImage:v10];
  uint64_t v11 = *(void **)(a1 + v6);
  sub_100009648(0, &qword_100019FB8);
  id v12 = v11;
  swift_retain();
  uint64_t v13 = (void *)UIColor.init(_:)();
  [v12 setTintColor:v13];

  uint64_t v14 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph;
  id v15 = *(id *)(a1 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph);
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v17 = [v9 _systemImageNamed:v16];

  [v15 setImage:v17];
  uint64_t v18 = *(void **)(a1 + v14);
  swift_retain();
  id v19 = v18;
  id v20 = (id)UIColor.init(_:)();
  [v19 setTintColor:v20];
  swift_release();
}

void sub_100006D58()
{
  uint64_t v1 = type metadata accessor for UIHostingControllerSizingOptions();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)&v102 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LiveActivityView();
  uint64_t v108 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6, v7);
  id v107 = (char *)&v102 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v10);
  id v12 = (char *)&v102 - v11;
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  id v17 = (char *)&v102 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void **)&v0[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView];
  if (v18) {
    [v18 setHidden:1];
  }
  id v19 = *(void **)&v0[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView];
  if (v19) {
    [v19 setHidden:1];
  }
  id v20 = *(void **)&v0[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView];
  if (v20) {
    [v20 setHidden:1];
  }
  if (!*(void *)&v0[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController])
  {
    uint64_t v106 = v6;
    uint64_t v103 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController;
    uint64_t v104 = v2;
    id v109 = v0;
    static Logger.initiator.getter();
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    BOOL v23 = os_log_type_enabled(v21, v22);
    v105 = v5;
    if (v23)
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v111 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315138;
      id v102 = v24 + 4;
      uint64_t v110 = sub_10000DA8C(0xD000000000000015, 0x8000000100010B70, &v111);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "#Initiator, LiveActivity,%s, Setting up expanded controller", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    id v25 = v109;
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    LiveActivityView.init(with:onLockscreen:resizeHandler:)();
    id v26 = objc_allocWithZone((Class)sub_1000082B8(&qword_100019F60));
    uint64_t v27 = v108;
    uint64_t v28 = v106;
    (*(void (**)(char *, char *, uint64_t))(v108 + 16))(v107, v12, v106);
    uint64_t v29 = (void *)UIHostingController.init(rootView:)();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v28);
    [v25 addChildViewController:v29];
    id v30 = [v29 view];
    if (v30)
    {
      uint64_t v31 = v30;
      id v32 = [self clearColor];
      [v31 setBackgroundColor:v32];

      id v33 = [v29 view];
      if (v33)
      {
        uint64_t v34 = v33;
        [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

        sub_1000082B8(&qword_100019F68);
        uint64_t v35 = swift_allocObject();
        *(_OWORD *)(v35 + 16) = xmmword_100012110;
        id v36 = v29;
        static UIHostingControllerSizingOptions.intrinsicContentSize.getter();
        uint64_t v111 = v35;
        sub_1000083B0(&qword_100019F70, (void (*)(uint64_t))&type metadata accessor for UIHostingControllerSizingOptions);
        sub_1000082B8(&qword_100019F78);
        sub_1000096DC((unint64_t *)&unk_100019F80, &qword_100019F78);
        dispatch thunk of SetAlgebra.init<A>(_:)();
        dispatch thunk of UIHostingController.sizingOptions.setter();

        id v37 = [v25 view];
        if (v37)
        {
          uint64_t v38 = v37;
          id v39 = [v36 view];
          if (v39)
          {
            uint64_t v40 = v39;
            [v38 addSubview:v39];

            id v41 = [v25 view];
            if (v41)
            {
              uint64_t v42 = v41;
              id v43 = [v41 window];

              id v44 = [v36 view];
              uint64_t v45 = v44;
              if (v43)
              {
                if (!v44)
                {
LABEL_45:
                  __break(1u);
                  goto LABEL_46;
                }
                id v46 = [v44 widthAnchor];

                id v47 = [v25 view];
                if (!v47)
                {
LABEL_46:
                  __break(1u);
                  goto LABEL_47;
                }
                unint64_t v48 = v47;
                id v49 = [v47 window];

                if (!v49)
                {
LABEL_47:
                  __break(1u);
                  goto LABEL_48;
                }
                id v50 = [v49 widthAnchor];

                static SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandSidePadding.getter();
                id v52 = [v46 constraintEqualToAnchor:v50 constant:v51 * -2.0];
              }
              else
              {
                if (!v44)
                {
LABEL_48:
                  __break(1u);
                  return;
                }
                id v50 = [v44 widthAnchor];

                id v53 = [self mainScreen];
                [v53 nativeBounds];
                CGFloat v55 = v54;
                CGFloat v57 = v56;
                CGFloat v59 = v58;
                CGFloat v61 = v60;

                v112.origin.x = v55;
                v112.origin.y = v57;
                v112.size.width = v59;
                v112.size.height = v61;
                double Width = CGRectGetWidth(v112);
                static SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandSidePadding.getter();
                id v52 = [v50 constraintEqualToConstant:Width - (v63 + v63)];
              }

              sub_1000082B8((uint64_t *)&unk_10001A1F0);
              uint64_t v64 = swift_allocObject();
              *(_OWORD *)(v64 + 16) = xmmword_100012120;
              *(void *)(v64 + 32) = v52;
              id v65 = v52;
              id v66 = [v36 view];
              if (v66)
              {
                id v67 = v66;
                id v68 = [v66 topAnchor];

                id v69 = [v25 view];
                if (v69)
                {
                  uint64_t v70 = v69;
                  id v71 = [v69 SBUISA_systemApertureObstructedAreaLayoutGuide];

                  id v72 = [v71 bottomAnchor];
                  static SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandTopShift.getter();
                  id v74 = [v68 constraintEqualToAnchor:v72 constant:-v73];

                  *(void *)(v64 + 40) = v74;
                  id v75 = [v36 view];
                  if (v75)
                  {
                    uint64_t v76 = v75;
                    id v77 = [v75 leadingAnchor];

                    id v78 = [v109 view];
                    if (v78)
                    {
                      v79 = v78;
                      id v80 = [v78 leadingAnchor];

                      static SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandSidePadding.getter();
                      id v81 = [v77 constraintEqualToAnchor:v80];

                      *(void *)(v64 + 48) = v81;
                      id v82 = [v36 view];
                      if (v82)
                      {
                        unint64_t v83 = v82;
                        id v84 = [v82 trailingAnchor];

                        id v85 = [v109 view];
                        if (v85)
                        {
                          id v86 = v85;
                          id v87 = [v85 trailingAnchor];

                          static SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandSidePadding.getter();
                          id v89 = [v84 constraintEqualToAnchor:v87 constant:-v88];

                          *(void *)(v64 + 56) = v89;
                          id v90 = [v36 view];
                          if (v90)
                          {
                            v91 = v90;
                            id v92 = [v90 bottomAnchor];

                            v93 = v109;
                            id v94 = [v109 view];
                            if (v94)
                            {
                              os_log_type_t v95 = v94;
                              BOOL v96 = self;
                              id v97 = [v95 bottomAnchor];

                              static SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandSidePadding.getter();
                              id v99 = [v92 constraintEqualToAnchor:v97 constant:-v98];

                              *(void *)(v64 + 64) = v99;
                              uint64_t v111 = v64;
                              specialized Array._endMutation()();
                              sub_100009648(0, (unint64_t *)&unk_100019F90);
                              Class isa = Array._bridgeToObjectiveC()().super.isa;
                              swift_bridgeObjectRelease();
                              [v96 activateConstraints:isa];

                              [v36 didMoveToParentViewController:v93];
                              Class v101 = *(void **)&v93[v103];
                              *(void *)&v93[v103] = v36;

                              return;
                            }
                            goto LABEL_44;
                          }
LABEL_43:
                          __break(1u);
LABEL_44:
                          __break(1u);
                          goto LABEL_45;
                        }
LABEL_42:
                        __break(1u);
                        goto LABEL_43;
                      }
LABEL_41:
                      __break(1u);
                      goto LABEL_42;
                    }
LABEL_40:
                    __break(1u);
                    goto LABEL_41;
                  }
LABEL_39:
                  __break(1u);
                  goto LABEL_40;
                }
LABEL_38:
                __break(1u);
                goto LABEL_39;
              }
LABEL_37:
              __break(1u);
              goto LABEL_38;
            }
LABEL_36:
            __break(1u);
            goto LABEL_37;
          }
LABEL_35:
          __break(1u);
          goto LABEL_36;
        }
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_34;
  }
}

void sub_1000078DC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_100002E58();
  }
}

void sub_100007930()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController;
  uint64_t v8 = *(void **)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController];
  if (v8)
  {
    id v9 = v8;
    static Logger.initiator.getter();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v18 = v2;
      uint64_t v13 = (uint8_t *)v12;
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      id v17 = v13 + 4;
      uint64_t v19 = sub_10000DA8C(0xD00000000000001ALL, 0x8000000100010B50, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "#Initiator, LiveActivity,%s, Removing expanded controller", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v18);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
    id v14 = [v9 view];
    if (v14)
    {
      uint64_t v15 = v14;
      [v14 removeFromSuperview];

      [v9 didMoveToParentViewController:0];
      [v1 removeChildViewController:v9];
      uint64_t v16 = *(void **)&v1[v7];
      *(void *)&v1[v7] = 0;
    }
    else
    {
      __break(1u);
    }
  }
}

id sub_100007BA8(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_activeLayoutMode] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_contentRole] = 2;
  *(void *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredLayoutMode] = 3;
  *(void *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_maximumLayoutMode] = 4;
  *(void *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredHeightForBottomSafeArea] = 0x4061800000000000;
  uint64_t v6 = &v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedScenePersistenceIdentifier];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = (uint64_t *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedAppBundleIdentifier];
  uint64_t *v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7[1] = v8;
  *(void *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_avatarView] = 0;
  uint64_t v9 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView;
  type metadata accessor for LiveActivityAccessoryView();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  id v11 = objc_allocWithZone(ObjCClassFromMetadata);
  uint64_t v12 = v3;
  *(void *)&v3[v9] = [v11 init];
  uint64_t v13 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView;
  *(void *)&v12[v13] = [objc_allocWithZone(ObjCClassFromMetadata) init];
  uint64_t v14 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView;
  *(void *)&v12[v14] = [objc_allocWithZone(ObjCClassFromMetadata) init];
  uint64_t v15 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_sessionViewModel;
  type metadata accessor for SessionViewModel();
  *(void *)&v12[v15] = static SessionViewModel.shared.getter();
  uint64_t v16 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph;
  *(void *)&v12[v16] = [objc_allocWithZone((Class)UIImageView) init];
  uint64_t v17 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph;
  *(void *)&v12[v17] = [objc_allocWithZone((Class)UIImageView) init];
  *(void *)&v12[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_cancellableSet] = &_swiftEmptySetSingleton;

  if (a2)
  {
    NSString v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v18 = 0;
  }
  v21.receiver = v12;
  v21.super_class = (Class)type metadata accessor for LiveActivityElementViewController();
  id v19 = [super initWithNibName:v18 bundle:a3];

  return v19;
}

id sub_100007E24(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_activeLayoutMode] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_contentRole] = 2;
  *(void *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredLayoutMode] = 3;
  *(void *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_maximumLayoutMode] = 4;
  *(void *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredHeightForBottomSafeArea] = 0x4061800000000000;
  uint64_t v3 = &v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedScenePersistenceIdentifier];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  uint64_t v4 = (uint64_t *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedAppBundleIdentifier];
  *uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4[1] = v5;
  *(void *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_avatarView] = 0;
  uint64_t v6 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView;
  type metadata accessor for LiveActivityAccessoryView();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  id v8 = objc_allocWithZone(ObjCClassFromMetadata);
  uint64_t v9 = v1;
  *(void *)&v1[v6] = [v8 init];
  uint64_t v10 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView;
  *(void *)&v9[v10] = [objc_allocWithZone(ObjCClassFromMetadata) init];
  uint64_t v11 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView;
  *(void *)&v9[v11] = [objc_allocWithZone(ObjCClassFromMetadata) init];
  uint64_t v12 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_sessionViewModel;
  type metadata accessor for SessionViewModel();
  *(void *)&v9[v12] = static SessionViewModel.shared.getter();
  uint64_t v13 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph;
  *(void *)&v9[v13] = [objc_allocWithZone((Class)UIImageView) init];
  uint64_t v14 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph;
  *(void *)&v9[v14] = [objc_allocWithZone((Class)UIImageView) init];
  *(void *)&v9[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_cancellableSet] = &_swiftEmptySetSingleton;

  v17.receiver = v9;
  v17.super_class = (Class)type metadata accessor for LiveActivityElementViewController();
  [super initWithCoder:a1];

  return v15;
}

id sub_10000802C()
{
  return sub_10000821C(type metadata accessor for LiveActivityElementViewController);
}

uint64_t type metadata accessor for LiveActivityElementViewController()
{
  return self;
}

id sub_100008204()
{
  return sub_10000821C(type metadata accessor for LiveActivityAccessoryView);
}

id sub_10000821C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for LiveActivityAccessoryView()
{
  return self;
}

uint64_t sub_100008278()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000082B0()
{
}

uint64_t sub_1000082B8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000082FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008344()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000838C()
{
  sub_100006B58(*(void *)(v0 + 16), *(id *)(v0 + 24), *(id *)(v0 + 32));
}

uint64_t sub_100008398(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000083A8()
{
  return swift_release();
}

uint64_t sub_1000083B0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000083F8(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
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
      NSString v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *objc_super v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100008888(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *objc_super v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1000085A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000082B8(&qword_100019FD0);
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
                  *id v30 = -1 << v29;
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
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_100008888(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_1000085A8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100008A24();
      goto LABEL_22;
    }
    sub_100008BD8();
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

void *sub_100008A24()
{
  uint64_t v1 = v0;
  sub_1000082B8(&qword_100019FD0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    void *v19 = *v17;
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

uint64_t sub_100008BD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000082B8(&qword_100019FD0);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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

uint64_t sub_100008E88(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008EA8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100008EA8(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_1000082B8(&qword_100019FD8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100009014(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1000083F8(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

id sub_1000090AC(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SafetyMonitorUIUtilities();
  uint64_t v11 = static SafetyMonitorUIUtilities.fetchChatGroupPhoto(with:)();
  if (v12 >> 60 == 15)
  {
    static Logger.initiator.getter();
    swift_bridgeObjectRetain_n();
    int64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v27 = v25;
      *(_DWORD *)uint64_t v15 = 136315394;
      uint64_t v26 = sub_10000DA8C(0xD000000000000025, 0x8000000100010C50, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v15 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_10000DA8C(a1, a2, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "#Initiator, LiveActivity, %s, No group photo found for groupID %s.", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    return 0;
  }
  else
  {
    uint64_t v16 = v11;
    unint64_t v17 = v12;
    sub_100009584(v11, v12);
    id v18 = [a3 contacts];
    sub_100009648(0, &qword_100019FC0);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();

    id v19 = objc_allocWithZone((Class)CNGroupIdentity);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1000095DC(v16, v17);
    Class v21 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v22 = [v19 initGroupWithName:0 photo:isa contacts:v21];

    sub_1000095DC(v16, v17);
  }
  return v22;
}

uint64_t sub_1000093F8(id a1, id a2)
{
  if (a1 && [a1 sessionState] == (id)4) {
    return static SafetyMonitorUIConstants.exclamationMarkCircleIconName.getter();
  }
  if (a2)
  {
    if ([a2 unsupportedDeviceSeparationState]) {
      return static SafetyMonitorUIConstants.exclamationMarkCircleIconName.getter();
    }
    if ([a2 userDisabledConnectivity]) {
      return static SafetyMonitorUIConstants.antennaRadiowavesLeftAndRightSlashFillIconName.getter();
    }
  }
  if (!a1 || ([a1 sessionState], uint64_t v4 = SMSessionState.badgeImageName.getter(), !v5))
  {
    uint64_t v6 = static SafetyMonitorUIConstants.checkMarkCircleIconName.getter();
    swift_bridgeObjectRelease();
    return v6;
  }
  return v4;
}

uint64_t sub_1000094B8(id a1, id a2)
{
  if (a1 && [a1 sessionState] == (id)4)
  {
LABEL_5:
    return static Color.red.getter();
  }
  if (a2)
  {
    if ([a2 unsupportedDeviceSeparationState]) {
      goto LABEL_5;
    }
    if ([a2 userDisabledConnectivity]) {
      goto LABEL_13;
    }
  }
  if (!a1)
  {
LABEL_13:
    return static Color.checkInYellow.getter();
  }
  else
  {
    id v4 = [a1 sessionState];
    return SMSessionState.badgeImageColor.getter(v4);
  }
}

uint64_t sub_100009584(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000095DC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000095F0(a1, a2);
  }
  return a1;
}

uint64_t sub_1000095F0(uint64_t a1, unint64_t a2)
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

uint64_t sub_100009648(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100009684()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000096BC(uint64_t a1)
{
  return sub_100004388(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000096C4()
{
  return sub_1000033F0(*(void **)(v0 + 16));
}

void sub_1000096CC(void **a1)
{
}

void sub_1000096D4(void **a1)
{
}

uint64_t sub_1000096DC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000082FC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100009740()
{
  unint64_t result = qword_10001A010;
  if (!qword_10001A010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A010);
  }
  return result;
}

unint64_t sub_100009798()
{
  unint64_t result = qword_10001A018;
  if (!qword_10001A018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A018);
  }
  return result;
}

uint64_t sub_1000097EC(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_10001275C, 1);
}

uint64_t sub_100009808(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100012734, 1);
}

uint64_t sub_100009824()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource();
  sub_10000C900(v0, qword_10001A360);
  sub_10000C784(v0, (uint64_t)qword_10001A360);
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100009888()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_1000098AC()
{
  uint64_t v0 = sub_1000082B8(&qword_10001A0E0);
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v2 = sub_1000082B8(&qword_10001A0E8);
  __chkstk_darwin(v2, v3);
  sub_10000B988();
  ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v4._object = (void *)0x8000000100010D90;
  v4._countAndFlagsBits = 0x1000000000000014;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v4);
  swift_getKeyPath();
  sub_1000082B8((uint64_t *)&unk_10001A0F0);
  ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v5);
  ParameterSummaryString.init(stringInterpolation:)();
  return IntentParameterSummary.init(_:table:)();
}

unint64_t sub_100009A3C(uint64_t a1)
{
  uint64_t v2 = sub_1000082B8(&qword_10001A0B0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000082B8(&qword_10001A0C8);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = *(int *)(v2 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10000C860(v13, (uint64_t)v6, &qword_10001A0B0);
    unint64_t result = sub_10000BAC4((uint64_t)v6);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v18 = v8[6];
    uint64_t v19 = type metadata accessor for IntentSystemContext.Source();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v6, v19);
    *(void *)(v8[7] + 8 * v17) = *(void *)&v6[v10];
    uint64_t v20 = v8[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v8[2] = v22;
    v13 += v14;
    if (!--v9)
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

unint64_t sub_100009C30(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000082B8(&qword_10001A0D0);
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
    sub_10000C860(v6, (uint64_t)&v15, &qword_10001A0D8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000BB5C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000C8C4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

uint64_t sub_100009D68(uint64_t a1, uint64_t a2)
{
  v2[22] = a1;
  v2[23] = a2;
  uint64_t v3 = type metadata accessor for URL();
  v2[24] = v3;
  v2[25] = *(void *)(v3 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  sub_1000082B8(&qword_10001A008);
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  sub_1000082B8(&qword_10001A088);
  v2[32] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for IntentSystemContext();
  v2[33] = v4;
  v2[34] = *(void *)(v4 - 8);
  v2[35] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for IntentSystemContext.Source();
  v2[36] = v5;
  v2[37] = *(void *)(v5 - 8);
  v2[38] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Logger();
  v2[39] = v6;
  v2[40] = *(void *)(v6 - 8);
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  sub_1000082B8(&qword_10001A090);
  v2[46] = swift_task_alloc();
  sub_1000082B8(&qword_10001A098);
  v2[47] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for IntentPerson.Handle.Value();
  v2[48] = v7;
  v2[49] = *(void *)(v7 - 8);
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  v2[52] = swift_task_alloc();
  v2[53] = swift_task_alloc();
  v2[54] = swift_task_alloc();
  v2[55] = swift_task_alloc();
  type metadata accessor for MainActor();
  v2[56] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000A138, v9, v8);
}

uint64_t sub_10000A138()
{
  uint64_t v180 = v0;
  uint64_t v1 = v0[47];
  swift_release();
  IntentParameter.wrappedValue.getter();
  uint64_t v2 = type metadata accessor for IntentPerson();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2)) {
    goto LABEL_4;
  }
  uint64_t v3 = v0[46];
  IntentPerson.handle.getter();
  uint64_t v4 = type metadata accessor for IntentPerson.Handle();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v3, 1, v4))
  {
    sub_10000C7BC(v0[46], &qword_10001A090);
LABEL_4:
    sub_10000C7BC(v0[47], &qword_10001A098);
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v90 = v0[54];
  uint64_t v89 = v0[55];
  uint64_t v91 = v0[48];
  uint64_t v92 = v0[49];
  uint64_t v93 = v0[46];
  uint64_t v94 = v0[47];
  IntentPerson.Handle.value.getter();
  sub_10000C7BC(v93, &qword_10001A090);
  sub_10000C7BC(v94, &qword_10001A098);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v92 + 32))(v89, v90, v91);
  if (qword_100019AC8 != -1) {
    swift_once();
  }
  uint64_t v95 = v0[55];
  uint64_t v96 = v0[53];
  uint64_t v97 = v0[48];
  uint64_t v98 = v0[49];
  uint64_t v99 = v0[45];
  uint64_t v100 = v0[40];
  uint64_t v165 = sub_10000C784(v0[39], (uint64_t)static Logger.intents);
  id v162 = *(void (**)(uint64_t))(v100 + 16);
  v162(v99);
  Class v176 = *(void (**)(uint64_t, uint64_t, uint64_t))(v98 + 16);
  v176(v96, v95, v97);
  swift_retain_n();
  Class v101 = Logger.logObject.getter();
  os_log_type_t v102 = static os_log_type_t.debug.getter();
  os_log_t loga = v101;
  BOOL v103 = os_log_type_enabled(v101, v102);
  uint64_t v174 = v0[53];
  if (v103)
  {
    uint64_t v147 = v0[52];
    uint64_t v148 = v0[48];
    *(void *)typea = v0[49];
    uint64_t v156 = v0[40];
    os_log_t v157 = (os_log_t)v0[39];
    uint64_t v159 = v0[45];
    uint64_t v104 = v0[23];
    os_log_type_t v150 = v102;
    uint64_t v105 = swift_slowAlloc();
    uint64_t v179 = swift_slowAlloc();
    *(_DWORD *)uint64_t v105 = 136315650;
    v0[18] = v104;
    swift_retain();
    uint64_t v106 = String.init<A>(describing:)();
    v0[19] = sub_10000DA8C(v106, v107, &v179);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v105 + 12) = 2080;
    v0[20] = sub_10000DA8C(0x286D726F66726570, 0xE900000000000029, &v179);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v105 + 22) = 2080;
    v176(v147, v174, v148);
    uint64_t v108 = String.init<A>(describing:)();
    v0[21] = sub_10000DA8C(v108, v109, &v179);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v110 = *(void (**)(uint64_t, uint64_t))(*(void *)typea + 8);
    v110(v174, v148);
    _os_log_impl((void *)&_mh_execute_header, v101, v150, "%s, %s: IntentPerson handle value, %s", (uint8_t *)v105, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v111 = v176;
    CGRect v112 = *(void (**)(uint64_t, os_log_t))(v156 + 8);
    v112(v159, v157);
  }
  else
  {
    uint64_t v113 = v0[48];
    uint64_t v114 = v0[49];
    uint64_t v115 = v0[45];
    uint64_t v116 = v0[39];
    uint64_t v117 = v0[40];
    swift_release_n();
    uint64_t v110 = *(void (**)(uint64_t, uint64_t))(v114 + 8);
    v110(v174, v113);

    uint64_t v111 = v176;
    id v118 = *(void (**)(uint64_t, uint64_t))(v117 + 8);
    v118(v115, v116);
    CGRect v112 = (void (*)(uint64_t, os_log_t))v118;
  }
  uint64_t v119 = v0[51];
  uint64_t v120 = v0[48];
  uint64_t v121 = v0[49];
  v111(v119, v0[55], v120);
  int v122 = (*(uint64_t (**)(uint64_t, uint64_t))(v121 + 88))(v119, v120);
  if (v122 == enum case for IntentPerson.Handle.Value.phoneNumber(_:))
  {
    uint64_t v123 = v0[51];
    uint64_t v124 = v0[48];
    uint64_t v125 = v0[49];
    v110(v0[55], v124);
    (*(void (**)(uint64_t, uint64_t))(v125 + 96))(v123, v124);
    uint64_t v5 = *(void *)(v123 + 8);
  }
  else
  {
    uint64_t v126 = v0[48];
    if (v122 == enum case for IntentPerson.Handle.Value.emailAddress(_:))
    {
      uint64_t v127 = v0[51];
      uint64_t v128 = v0[49];
      v110(v0[55], v0[48]);
      (*(void (**)(uint64_t, uint64_t))(v128 + 96))(v127, v126);
      uint64_t v5 = *(void *)(v127 + 8);
    }
    else
    {
      id v175 = v110;
      uint64_t v129 = v0[55];
      if (v122 != enum case for IntentPerson.Handle.Value.applicationDefined(_:))
      {
        uint64_t v134 = v0[50];
        ((void (*)(void, uint64_t, void))v162)(v0[44], v165, v0[39]);
        v111(v134, v129, v126);
        swift_retain_n();
        id v135 = Logger.logObject.getter();
        os_log_type_t v136 = static os_log_type_t.error.getter();
        BOOL v137 = os_log_type_enabled(v135, v136);
        os_log_t logb = (os_log_t)v0[55];
        if (v137)
        {
          id v158 = v135;
          *(void *)id v151 = v0[52];
          uint64_t v152 = v0[50];
          uint64_t v149 = v0[48];
          id v166 = v0[39];
          *(void *)id v169 = v0[44];
          uint64_t v138 = v0[23];
          uint64_t v139 = swift_slowAlloc();
          uint64_t v179 = swift_slowAlloc();
          *(_DWORD *)uint64_t v139 = 136315650;
          v0[14] = v138;
          swift_retain();
          uint64_t v140 = String.init<A>(describing:)();
          v0[15] = sub_10000DA8C(v140, v141, &v179);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v139 + 12) = 2080;
          v0[16] = sub_10000DA8C(0x286D726F66726570, 0xE900000000000029, &v179);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v139 + 22) = 2080;
          v176(*(void *)v151, v152, v149);
          uint64_t v142 = String.init<A>(describing:)();
          v0[17] = sub_10000DA8C(v142, v143, &v179);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          v110(v152, v149);
          _os_log_impl((void *)&_mh_execute_header, v158, v136, "%s, %s: Unknown IntentPerson handle value type, %s", (uint8_t *)v139, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v112(*(void *)v169, v166);
          v110((uint64_t)logb, v149);
        }
        else
        {
          uint64_t v144 = v0[50];
          uint64_t v145 = v0[48];
          uint64_t v146 = v0[44];
          v177 = v0[39];

          v110(v144, v145);
          swift_release_n();
          v112(v146, v177);
          v110((uint64_t)logb, v145);
        }
        v110(v0[51], v0[48]);
        goto LABEL_5;
      }
      uint64_t v130 = v0[51];
      (*(void (**)(uint64_t, uint64_t))(v0[49] + 96))(v130, v126);
      uint64_t v5 = *(void *)(v130 + 8);
      id v131 = self;
      NSString v132 = String._bridgeToObjectiveC()();
      id v133 = [v131 getSMHandleTypeWithHandle:v132];

      v175(v129, v126);
      if (!v133)
      {
        swift_bridgeObjectRelease();
        goto LABEL_5;
      }
    }
  }
LABEL_6:
  uint64_t v6 = v0[36];
  uint64_t v7 = v0[37];
  uint64_t v8 = v0[34];
  uint64_t v9 = v0[35];
  uint64_t v11 = v0[32];
  uint64_t v10 = v0[33];
  v0[2] = v0[23];
  sub_10000B988();
  AppIntent.systemContext.getter();
  IntentSystemContext.source.getter();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6) == 1)
  {
    sub_10000C7BC(v0[32], &qword_10001A088);
    uint64_t v12 = 0;
    if (v5)
    {
LABEL_8:
      NSString v13 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v15 = v0[37];
    uint64_t v14 = v0[38];
    uint64_t v16 = v0[36];
    (*(void (**)(uint64_t, void, uint64_t))(v15 + 32))(v14, v0[32], v16);
    uint64_t v12 = sub_10000BE78(v14);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    if (v5) {
      goto LABEL_8;
    }
  }
  NSString v13 = 0;
LABEL_11:
  id v17 = [self createURLForSuggestionsWithRecipientHandle:v13 appPayloadDataString:0 givenName:0 payloadType:4 sessionStartEntryType:v12];

  if (v17)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 1;
  }
  uint64_t v19 = v0[30];
  uint64_t v20 = v0[31];
  uint64_t v21 = v0[29];
  uint64_t v22 = v0[24];
  uint64_t v23 = v0[25];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(v19, v18, 1, v22);
  sub_10000C71C(v19, v20);
  sub_10000C860(v20, v21, &qword_10001A008);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1)
  {
    sub_10000C7BC(v0[29], &qword_10001A008);
    if (qword_100019AC8 != -1) {
      swift_once();
    }
    uint64_t v25 = v0[40];
    uint64_t v24 = v0[41];
    uint64_t v26 = v0[39];
    uint64_t v27 = sub_10000C784(v26, (uint64_t)static Logger.intents);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v27, v26);
    swift_retain_n();
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.error.getter();
    BOOL v30 = os_log_type_enabled(v28, v29);
    uint64_t v32 = v0[40];
    uint64_t v31 = v0[41];
    uint64_t v33 = v0[39];
    uint64_t v34 = v0[23];
    if (v30)
    {
      uint64_t v178 = v0[41];
      uint64_t v35 = swift_slowAlloc();
      uint64_t v179 = swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 136315394;
      v0[3] = v34;
      swift_retain();
      uint64_t v36 = String.init<A>(describing:)();
      v0[4] = sub_10000DA8C(v36, v37, &v179);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 12) = 2080;
      v0[5] = sub_10000DA8C(0x286D726F66726570, 0xE900000000000029, &v179);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "%s, %s: Failed to generate URL", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v178, v33);
    }
    else
    {

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    }
  }
  else
  {
    (*(void (**)(void, void, void))(v0[25] + 32))(v0[28], v0[29], v0[24]);
    if (qword_100019AC8 != -1) {
      swift_once();
    }
    uint64_t v38 = v0[43];
    uint64_t v39 = v0[40];
    uint64_t v41 = v0[27];
    uint64_t v40 = v0[28];
    uint64_t v42 = v0[24];
    uint64_t v43 = v0[25];
    os_log_t log = (os_log_t)sub_10000C784(v0[39], (uint64_t)static Logger.intents);
    id v170 = *(void (**)(uint64_t))(v39 + 16);
    v170(v38);
    id v167 = *(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16);
    v167(v41, v40, v42);
    swift_retain_n();
    id v44 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.debug.getter();
    BOOL v46 = os_log_type_enabled(v44, v45);
    uint64_t v47 = v0[43];
    uint64_t v48 = v0[39];
    uint64_t v49 = v0[40];
    uint64_t v50 = v0[25];
    uint64_t v160 = v0[24];
    uint64_t v163 = v0[27];
    uint64_t v51 = v0[23];
    if (v46)
    {
      os_log_type_t type = v45;
      uint64_t v155 = v0[43];
      uint64_t v52 = swift_slowAlloc();
      uint64_t v179 = swift_slowAlloc();
      *(_DWORD *)uint64_t v52 = 136315650;
      v0[10] = v51;
      swift_retain();
      uint64_t v53 = String.init<A>(describing:)();
      v0[11] = sub_10000DA8C(v53, v54, &v179);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v52 + 12) = 2080;
      v0[12] = sub_10000DA8C(0x286D726F66726570, 0xE900000000000029, &v179);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v52 + 22) = 2080;
      sub_10000C818(&qword_10001A0A0, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v55 = v163;
      uint64_t v56 = dispatch thunk of CustomStringConvertible.description.getter();
      v0[13] = sub_10000DA8C(v56, v57, &v179);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      id v164 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
      v164(v55, v160);
      _os_log_impl((void *)&_mh_execute_header, v44, type, "%s, %s: About to open URL %s", (uint8_t *)v52, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      double v58 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
      uint64_t v59 = v155;
      uint64_t v60 = v48;
    }
    else
    {
      swift_release_n();
      uint64_t v61 = v163;
      id v164 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
      v164(v61, v160);

      double v58 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
      uint64_t v59 = v47;
      uint64_t v60 = v48;
    }
    v161 = v58;
    v58(v59, v60);
    uint64_t v62 = v0[42];
    uint64_t v63 = v0[39];
    uint64_t v64 = v0[28];
    uint64_t v65 = v0[26];
    uint64_t v66 = v0[24];
    id v67 = [objc_allocWithZone((Class)LSApplicationWorkspace) init];
    URL._bridgeToObjectiveC()(v68);
    uint64_t v70 = v69;
    sub_100009C30((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v67 openSensitiveURL:v70 withOptions:isa];

    ((void (*)(uint64_t, os_log_t, uint64_t))v170)(v62, log, v63);
    v167(v65, v64, v66);
    swift_retain_n();
    id v72 = Logger.logObject.getter();
    os_log_type_t v73 = static os_log_type_t.info.getter();
    BOOL v74 = os_log_type_enabled(v72, v73);
    uint64_t v75 = v0[42];
    uint64_t v76 = v0[39];
    uint64_t v77 = v0[28];
    uint64_t v78 = v0[26];
    uint64_t v79 = v0[23];
    uint64_t v80 = v0[24];
    if (v74)
    {
      os_log_type_t v168 = v73;
      uint64_t v81 = swift_slowAlloc();
      uint64_t v179 = swift_slowAlloc();
      *(_DWORD *)uint64_t v81 = 136315650;
      v0[6] = v79;
      swift_retain();
      uint64_t v82 = String.init<A>(describing:)();
      v0[7] = sub_10000DA8C(v82, v83, &v179);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v81 + 12) = 2080;
      v0[8] = sub_10000DA8C(0x286D726F66726570, 0xE900000000000029, &v179);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v81 + 22) = 2080;
      sub_10000C818(&qword_10001A0A0, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v84 = dispatch thunk of CustomStringConvertible.description.getter();
      v0[9] = sub_10000DA8C(v84, v85, &v179);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v164(v78, v80);
      _os_log_impl((void *)&_mh_execute_header, v72, v168, "%s, %s: Did open URL %s", (uint8_t *)v81, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v164(v78, v80);
      swift_release_n();
    }
    v161(v75, v76);
    v164(v77, v80);
  }
  uint64_t v86 = v0[31];
  static IntentResult.result<>()();
  sub_10000C7BC(v86, &qword_10001A008);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v87 = (uint64_t (*)(void))v0[1];
  return v87();
}

uint64_t sub_10000B70C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100019AC0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource();
  uint64_t v3 = sub_10000C784(v2, (uint64_t)qword_10001A360);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000B7C8(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000B868;
  return sub_100009D68(a1, v4);
}

uint64_t sub_10000B868()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000B95C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000C0E8();
  *a1 = result;
  return result;
}

unint64_t sub_10000B988()
{
  unint64_t result = qword_10001A028;
  if (!qword_10001A028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A028);
  }
  return result;
}

uint64_t sub_10000B9E8(uint64_t a1)
{
  unint64_t v2 = sub_10000B988();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SafetyMonitorShortcutProvider()
{
  return &type metadata for SafetyMonitorShortcutProvider;
}

ValueMetadata *type metadata accessor for SafetyMonitorIntent()
{
  return &type metadata for SafetyMonitorIntent;
}

uint64_t sub_10000BA4C()
{
  return sub_1000096DC(&qword_10001A030, &qword_10001A038);
}

uint64_t sub_10000BA88()
{
  return sub_1000096DC(&qword_10001A040, &qword_10001A048);
}

unint64_t sub_10000BAC4(uint64_t a1)
{
  type metadata accessor for IntentSystemContext.Source();
  sub_10000C818(&qword_10001A0B8, (void (*)(uint64_t))&type metadata accessor for IntentSystemContext.Source);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_10000BBD4(a1, v2);
}

unint64_t sub_10000BB5C(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000BD94(a1, a2, v4);
}

unint64_t sub_10000BBD4(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v4 = type metadata accessor for IntentSystemContext.Source();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = v2;
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v10 = a2 & ~v9;
  uint64_t v19 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v13 = v5 + 16;
    uint64_t v12 = v14;
    uint64_t v15 = *(void *)(v13 + 56);
    do
    {
      v12(v8, *(void *)(v21 + 48) + v15 * v10, v4);
      sub_10000C818(&qword_10001A0C0, (void (*)(uint64_t))&type metadata accessor for IntentSystemContext.Source);
      char v16 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v13 - 8))(v8, v4);
      if (v16) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
    }
    while (((*(void *)(v19 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_10000BD94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
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
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000BE78(uint64_t a1)
{
  sub_1000082B8(&qword_10001A0A8);
  uint64_t v1 = (int *)(sub_1000082B8(&qword_10001A0B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100012190;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = v1[14];
  uint64_t v7 = enum case for IntentSystemContext.Source.shortcuts(_:);
  uint64_t v8 = type metadata accessor for IntentSystemContext.Source();
  uint64_t v9 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 104);
  v9(v5, v7, v8);
  *(void *)(v5 + v6) = 3;
  uint64_t v10 = v1[14];
  v9(v5 + v2, enum case for IntentSystemContext.Source.spotlight(_:), v8);
  *(void *)(v5 + v2 + v10) = 4;
  uint64_t v11 = v1[14];
  v9(v5 + 2 * v2, enum case for IntentSystemContext.Source.siri(_:), v8);
  *(void *)(v5 + 2 * v2 + v11) = 5;
  uint64_t v12 = v1[14];
  v9(v5 + 3 * v2, enum case for IntentSystemContext.Source.actionButton(_:), v8);
  *(void *)(v5 + 3 * v2 + v12) = 11;
  uint64_t v13 = v1[14];
  v9(v5 + 4 * v2, enum case for IntentSystemContext.Source.controlCenter(_:), v8);
  *(void *)(v5 + 4 * v2 + v13) = 12;
  unint64_t v14 = v5 + 5 * v2;
  uint64_t v15 = v1[14];
  v9(v14, enum case for IntentSystemContext.Source.widget(_:), v8);
  *(void *)(v14 + v15) = 13;
  unint64_t v16 = sub_100009A3C(v4);
  if (*(void *)(v16 + 16) && (unint64_t v17 = sub_10000BAC4(a1), (v18 & 1) != 0)) {
    uint64_t v19 = *(void *)(*(void *)(v16 + 56) + 8 * v17);
  }
  else {
    uint64_t v19 = 0;
  }
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_10000C0E8()
{
  uint64_t v22 = type metadata accessor for InputConnectionBehavior();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22, v1);
  unint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for IntentPerson.ParameterMode();
  uint64_t v4 = *(void *)(v21 - 8);
  __chkstk_darwin(v21, v5);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000082B8(&qword_10001A068);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000082B8(&qword_10001A070);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for LocalizedStringResource();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  sub_1000082B8(&qword_10001A078);
  LocalizedStringResource.init(stringLiteral:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  IntentDialog.init(stringLiteral:)();
  uint64_t v19 = type metadata accessor for IntentDialog();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v11, 0, 1, v19);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, enum case for IntentPerson.ParameterMode.contact(_:), v21);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v22);
  return IntentParameter<>.init(title:description:mode:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10000C438()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource();
  __chkstk_darwin(v0 - 8, v1);
  v10[0] = type metadata accessor for AppShortcut();
  uint64_t v2 = *(void *)(v10[0] - 8);
  __chkstk_darwin(v10[0], v3);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[1] = sub_10000C0E8();
  sub_1000082B8(&qword_10001A050);
  sub_1000082B8(&qword_10001A058);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000121A0;
  sub_10000B988();
  AppShortcutPhrase.init(stringLiteral:)();
  AppShortcutPhrase.init(stringLiteral:)();
  AppShortcutPhrase.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)();
  uint64_t v6 = static AppShortcutsBuilder.buildExpression(_:)();
  (*(void (**)(char *, void))(v2 + 8))(v5, v10[0]);
  sub_1000082B8(&qword_10001A060);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100012110;
  *(void *)(v7 + 32) = v6;
  uint64_t v8 = static AppShortcutsBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_10000C71C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000082B8(&qword_10001A008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C784(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000C7BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000082B8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000C818(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000C860(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000082B8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_10000C8C4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000C8D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = IntentParameter.projectedValue.getter();
  *a1 = result;
  return result;
}

uint64_t *sub_10000C900(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000C964(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_10000CA00()
{
  uint64_t v1 = OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate____lazy_storage___systemApertureElementProvider;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate____lazy_storage___systemApertureElementProvider);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate____lazy_storage___systemApertureElementProvider);
  }
  else
  {
    type metadata accessor for LiveActivityElementViewController();
    id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_10000CBE0()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v46 = *(void *)(v1 - 8);
  uint64_t v47 = v1;
  __chkstk_darwin(v1, v2);
  uint64_t v40 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v44 = *(void *)(v4 - 8);
  uint64_t v45 = v4;
  __chkstk_darwin(v4, v5);
  uint64_t v43 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchTime();
  uint64_t v41 = *(void *)(v7 - 8);
  uint64_t v42 = v7;
  uint64_t v9 = __chkstk_darwin(v7, v8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v12);
  uint64_t v39 = (char *)&v36 - v13;
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.initiator.getter();
  uint64_t v19 = v0;
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v36 = v15;
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v38 = v11;
    uint64_t v24 = (void *)v23;
    uint64_t v37 = v14;
    *(_DWORD *)uint64_t v22 = 138412290;
    aBlock[0] = v19;
    uint64_t v25 = v19;
    uint64_t v15 = v36;
    uint64_t v14 = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v24 = v19;

    _os_log_impl((void *)&_mh_execute_header, v20, v21, "%@,refreshSize", v22, 0xCu);
    sub_1000082B8(&qword_10001A1C0);
    swift_arrayDestroy();
    uint64_t v11 = v38;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v20 = v19;
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  sub_100009648(0, (unint64_t *)&unk_10001A1A0);
  uint64_t v26 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  uint64_t v27 = v39;
  + infix(_:_:)();
  uint64_t v28 = v42;
  uint64_t v41 = *(void *)(v41 + 8);
  ((void (*)(char *, uint64_t))v41)(v11, v42);
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v19;
  aBlock[4] = sub_10000DA6C;
  aBlock[5] = v29;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000C964;
  aBlock[3] = &unk_100014EF0;
  BOOL v30 = _Block_copy(aBlock);
  uint64_t v31 = v19;
  swift_release();
  uint64_t v32 = v43;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000F18C((unint64_t *)&unk_100019FA0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000082B8((uint64_t *)&unk_10001A1B0);
  sub_1000096DC(&qword_100019FB0, (uint64_t *)&unk_10001A1B0);
  uint64_t v33 = v40;
  uint64_t v34 = v47;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v30);

  (*(void (**)(char *, uint64_t))(v46 + 8))(v33, v34);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v45);
  return ((uint64_t (*)(char *, uint64_t))v41)(v27, v28);
}

void sub_10000D178(char *a1)
{
  uint64_t v2 = (void *)type metadata accessor for Logger();
  uint64_t v3 = *(v2 - 1);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window;
  uint64_t v8 = *(void **)&a1[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window];
  if (v8)
  {
    id v9 = [v8 windowScene];
    if (v9)
    {
      id v28 = v9;
      type metadata accessor for ActivityScene();
      if (swift_dynamicCastClass())
      {
        uint64_t v10 = *(void **)&a1[v7];
        if (v10)
        {
          id v11 = [v10 rootViewController];
          if (v11)
          {
            uint64_t v12 = v11;
            id v13 = [v11 view];
            if (v13)
            {
              uint64_t v14 = v13;
              [v13 sizeToFit];

              id v15 = [v12 view];
              if (v15)
              {
                uint64_t v16 = v15;
                [v15 bounds];

                id v17 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics());
                ActivitySceneMetrics.init(size:cornerRadius:)();
                dispatch thunk of ActivityScene.resolvedMetrics.setter();

                goto LABEL_9;
              }
            }
            else
            {
              __break(1u);
            }
            __break(1u);
            return;
          }
        }
LABEL_9:
        id v18 = v28;

        return;
      }
    }
  }
  static Logger.initiator.getter();
  uint64_t v19 = a1;
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    id v28 = v2;
    uint64_t v29 = v19;
    uint64_t v24 = (void *)v23;
    uint64_t v27 = v3;
    *(_DWORD *)uint64_t v22 = 138412290;
    uint64_t v25 = v19;
    uint64_t v3 = v27;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v24 = v19;

    _os_log_impl((void *)&_mh_execute_header, v20, v21, "%@: Unable to resize - window scene is not an ActivityScene scene", v22, 0xCu);
    sub_1000082B8(&qword_10001A1C0);
    swift_arrayDestroy();
    uint64_t v2 = v28;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v20 = v19;
  }

  (*(void (**)(char *, void *))(v3 + 8))(v6, v2);
}

void sub_10000D4B8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_10000CBE0();
  }
}

uint64_t sub_10000D50C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  id v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v21 - 8);
  __chkstk_darwin(v21, v11);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009648(0, (unint64_t *)&unk_10001A1A0);
  uint64_t v14 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  aBlock[4] = sub_10000F21C;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000C964;
  aBlock[3] = &unk_100014F90;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = a2;
  id v18 = a3;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000F18C((unint64_t *)&unk_100019FA0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000082B8((uint64_t *)&unk_10001A1B0);
  sub_1000096DC(&qword_100019FB0, (uint64_t *)&unk_10001A1B0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v21);
}

id sub_10000D7F4(void *a1)
{
  id result = [a1 view];
  if (result)
  {
    uint64_t v3 = result;
    [result sizeToFit];

    id result = [a1 view];
    if (result)
    {
      uint64_t v4 = result;
      [result bounds];

      id v5 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics());
      ActivitySceneMetrics.init(size:cornerRadius:)();
      return (id)dispatch thunk of ActivityScene.resolvedMetrics.setter();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_10000D8B8()
{
  *(void *)&v0[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate____lazy_storage___systemApertureElementProvider] = 0;
  uint64_t v1 = v0;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    uint64_t v2 = (void *)sub_10000EE98((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    uint64_t v2 = &_swiftEmptySetSingleton;
  }
  *(void *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_cancellableSet] = v2;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for LiveActivitySceneDelegate();
  return [super init];
}

id sub_10000D980()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LiveActivitySceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for LiveActivitySceneDelegate()
{
  return self;
}

uint64_t sub_10000DA34()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000DA6C()
{
  sub_10000D178(*(char **)(v0 + 16));
}

uint64_t sub_10000DA74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000DA84()
{
  return swift_release();
}

uint64_t sub_10000DA8C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000DB60(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000F274((uint64_t)v12, *a3);
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
      sub_10000F274((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000F224((uint64_t)v12);
  return v7;
}

uint64_t sub_10000DB60(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000DD1C(a5, a6);
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

uint64_t sub_10000DD1C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000DDB4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000DF94(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000DF94(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000DDB4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000DF2C(v2, 0);
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

void *sub_10000DF2C(uint64_t a1, uint64_t a2)
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
  sub_1000082B8((uint64_t *)&unk_10001A220);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000DF94(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000082B8((uint64_t *)&unk_10001A220);
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
  id v13 = a4 + 32;
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

void sub_10000E0E4(void *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  id v91 = *(id *)(v3 - 8);
  __chkstk_darwin(v3, v4);
  uint64_t v92 = (char *)v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000082B8((uint64_t *)&unk_10001A1E0);
  uint64_t v89 = *(void *)(v6 - 8);
  uint64_t v90 = v6;
  __chkstk_darwin(v6, v7);
  int64_t v9 = (char *)v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for UIHostingControllerSizingOptions();
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v12 = type metadata accessor for LiveActivityView();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v15 = __chkstk_darwin(v12, v14);
  id v17 = (char *)v86 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v18);
  uint64_t v20 = (char *)v86 - v19;
  type metadata accessor for ActivityScene();
  uint64_t v21 = swift_dynamicCastClass();
  if (v21)
  {
    uint64_t v22 = (void *)v21;
    uint64_t v92 = v1;
    id v23 = a1;
    if (objc_msgSend(v22, "SBUI_isHostedBySystemAperture"))
    {
      id v91 = v23;
      id v24 = sub_10000CA00();
      [v22 setSystemApertureElementViewControllerProvider:v24];

      id v25 = v91;

      return;
    }
    id v87 = v23;
    double v88 = v9;
    id v39 = [objc_allocWithZone((Class)type metadata accessor for SecureWindow()) initWithWindowScene:v22];
    uint64_t v40 = *(void **)&v92[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window];
    *(void *)&v92[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window] = v39;
    id v41 = v39;

    v86[1] = type metadata accessor for SessionViewModel();
    static SessionViewModel.shared.getter();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    LiveActivityView.init(with:onLockscreen:resizeHandler:)();
    id v42 = objc_allocWithZone((Class)sub_1000082B8(&qword_100019F60));
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v20, v12);
    uint64_t v43 = (void *)UIHostingController.init(rootView:)();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v20, v12);
    id v44 = v43;
    static UIHostingControllerSizingOptions.preferredContentSize.getter();
    dispatch thunk of UIHostingController.sizingOptions.setter();

    id v45 = [v44 view];
    if (v45)
    {
      uint64_t v46 = v45;
      id v47 = [self clearColor];
      [v46 setBackgroundColor:v47];

      [v41 setRootViewController:v44];
      [v41 makeKeyAndVisible];
      id v48 = [v44 view];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = v41;
        [v48 sizeToFit];

        id v51 = [v44 view];
        uint64_t v52 = v88;
        if (v51)
        {
          uint64_t v53 = v51;
          [v51 setTranslatesAutoresizingMaskIntoConstraints:0];

          sub_1000082B8((uint64_t *)&unk_10001A1F0);
          uint64_t v54 = swift_allocObject();
          *(_OWORD *)(v54 + 16) = xmmword_100012100;
          id v55 = [v44 view];
          if (v55)
          {
            uint64_t v56 = v55;
            id v57 = [v55 leftAnchor];

            id v58 = [v50 leftAnchor];
            id v59 = [v57 constraintEqualToAnchor:v58];

            *(void *)(v54 + 32) = v59;
            id v60 = [v44 view];
            if (v60)
            {
              uint64_t v61 = v60;
              id v62 = [v60 rightAnchor];

              id v63 = [v50 rightAnchor];
              id v64 = [v62 constraintEqualToAnchor:v63];

              *(void *)(v54 + 40) = v64;
              id v65 = [v44 view];
              if (v65)
              {
                uint64_t v66 = v65;
                id v67 = [v65 topAnchor];

                id v68 = [v50 topAnchor];
                id v69 = [v67 constraintEqualToAnchor:v68];

                *(void *)(v54 + 48) = v69;
                id v70 = [v44 view];
                id v91 = v50;
                if (v70)
                {
                  id v71 = v70;
                  id v72 = self;
                  id v73 = [v71 bottomAnchor];

                  id v74 = [v91 bottomAnchor];
                  id v75 = [v73 constraintEqualToAnchor:v74];

                  *(void *)(v54 + 56) = v75;
                  v93[0] = v54;
                  specialized Array._endMutation()();
                  sub_100009648(0, (unint64_t *)&unk_100019F90);
                  Class isa = Array._bridgeToObjectiveC()().super.isa;
                  swift_bridgeObjectRelease();
                  [v72 activateConstraints:isa];

                  id v77 = [v44 view];
                  if (v77)
                  {
                    uint64_t v78 = v77;
                    [v77 bounds];

                    id v79 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics());
                    ActivitySceneMetrics.init(size:cornerRadius:)();
                    dispatch thunk of ActivityScene.resolvedMetrics.setter();
                    static SessionViewModel.shared.getter();
                    sub_10000F18C(&qword_10001A200, (void (*)(uint64_t))&type metadata accessor for SessionViewModel);
                    uint64_t v80 = ObservableObject<>.objectWillChange.getter();
                    swift_release();
                    v93[0] = v80;
                    type metadata accessor for ObservableObjectPublisher();
                    Publisher<>.makeConnectable()();
                    swift_release();
                    sub_1000096DC(&qword_10001A208, (uint64_t *)&unk_10001A1E0);
                    uint64_t v81 = v90;
                    uint64_t v82 = ConnectablePublisher.autoconnect()();
                    (*(void (**)(char *, uint64_t))(v89 + 8))(v52, v81);
                    v93[0] = v82;
                    uint64_t v83 = swift_allocObject();
                    *(void *)(v83 + 16) = v44;
                    *(void *)(v83 + 24) = v22;
                    id v84 = v87;
                    id v85 = v44;
                    sub_1000082B8(&qword_10001A210);
                    sub_1000096DC(&qword_10001A218, &qword_10001A210);
                    Publisher<>.sink(receiveValue:)();
                    swift_release();
                    swift_release();
                    swift_beginAccess();
                    AnyCancellable.store(in:)();
                    swift_endAccess();

                    swift_release();
                    return;
                  }
                  goto LABEL_26;
                }
LABEL_25:
                __break(1u);
LABEL_26:
                __break(1u);
                return;
              }
LABEL_24:
              __break(1u);
              goto LABEL_25;
            }
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v90 = v3;
  static Logger.initiator.getter();
  id v26 = a1;
  uint64_t v27 = v1;
  id v28 = v26;
  uint64_t v29 = v27;
  BOOL v30 = Logger.logObject.getter();
  os_log_type_t v31 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v33 = (void *)swift_slowAlloc();
    uint64_t v89 = swift_slowAlloc();
    v93[0] = v89;
    *(_DWORD *)uint64_t v32 = 138412546;
    uint64_t v94 = (uint64_t)v29;
    uint64_t v34 = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v33 = v29;

    *(_WORD *)(v32 + 12) = 2080;
    id v35 = [v28 description];
    uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v38 = v37;

    uint64_t v94 = sub_10000DA8C(v36, v38, v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "%@: Not a session scene: %s", (uint8_t *)v32, 0x16u);
    sub_1000082B8(&qword_10001A1C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*((void (**)(char *, uint64_t))v91 + 1))(v92, v90);
}

uint64_t sub_10000EC90(const char *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.initiator.getter();
  uint64_t v8 = v1;
  int64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v17 = v3;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v16 = a1;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v15 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    uint64_t v18 = v8;
    uint64_t v13 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v15 = v8;

    uint64_t v3 = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v16, v12, 0xCu);
    sub_1000082B8(&qword_10001A1C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    int64_t v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return sub_10000CBE0();
}

unint64_t sub_10000EE98(unint64_t result)
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
      sub_1000082B8(&qword_10001A1C8);
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
  uint64_t v8 = v3 + 56;
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
    sub_10000F18C(&qword_10001A1D0, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v11 = -1 << v3[32];
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_10000F18C(&qword_10001A1D8, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
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

uint64_t sub_10000F14C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000F184()
{
}

uint64_t sub_10000F18C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000F1D4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000F214(uint64_t a1)
{
  return sub_10000D50C(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

id sub_10000F21C()
{
  return sub_10000D7F4(*(void **)(v0 + 16));
}

uint64_t sub_10000F224(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000F274(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t Logger.intents.unsafeMutableAddressor()
{
  if (qword_100019AC8 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return sub_10000C784(v0, (uint64_t)static Logger.intents);
}

uint64_t sub_10000F340()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000C900(v0, static Logger.intents);
  sub_10000C784(v0, (uint64_t)static Logger.intents);
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t static Logger.intents.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100019AC8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = sub_10000C784(v2, (uint64_t)static Logger.intents);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000F474()
{
  uint64_t v0 = sub_1000082B8(&qword_10001A2A8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  WindowGroup.init(id:title:lazyContent:)();
  sub_10000F654();
  static SceneBuilder.buildBlock<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000F5D4()
{
  unint64_t result = qword_10001A2A0;
  if (!qword_10001A2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A2A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SafetyMonitorApp()
{
  return &type metadata for SafetyMonitorApp;
}

uint64_t sub_10000F638(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100012844, 1);
}

unint64_t sub_10000F654()
{
  unint64_t result = qword_10001A2B0;
  if (!qword_10001A2B0)
  {
    sub_1000082FC(&qword_10001A2A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A2B0);
  }
  return result;
}

uint64_t sub_10000F6B4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static AppIntentInternal.sideEffect.getter()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t static AppIntentInternal.shortcutsMetadata.getter()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t static AppIntentInternal.attributionBundleIdentifier.getter()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t AppShortcutPhrase.init(stringLiteral:)()
{
  return AppShortcutPhrase.init(stringLiteral:)();
}

uint64_t static AppShortcutsBuilder.buildBlock(_:)()
{
  return static AppShortcutsBuilder.buildBlock(_:)();
}

uint64_t static AppShortcutsBuilder.buildExpression(_:)()
{
  return static AppShortcutsBuilder.buildExpression(_:)();
}

uint64_t static AppShortcutsProvider.shortcutTileColor.getter()
{
  return static AppShortcutsProvider.shortcutTileColor.getter();
}

uint64_t static AppIntent.openAppWhenRun.getter()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t static AppIntent.description.getter()
{
  return static AppIntent.description.getter();
}

uint64_t AppIntent.systemContext.getter()
{
  return AppIntent.systemContext.getter();
}

uint64_t static AppIntent.isDiscoverable.getter()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t static AppIntent.authenticationPolicy.getter()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)()
{
  return AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)();
}

uint64_t type metadata accessor for AppShortcut()
{
  return type metadata accessor for AppShortcut();
}

uint64_t IntentDialog.init(stringLiteral:)()
{
  return IntentDialog.init(stringLiteral:)();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t type metadata accessor for IntentPerson.ParameterMode()
{
  return type metadata accessor for IntentPerson.ParameterMode();
}

uint64_t type metadata accessor for IntentPerson.Handle.Value()
{
  return type metadata accessor for IntentPerson.Handle.Value();
}

uint64_t IntentPerson.Handle.value.getter()
{
  return IntentPerson.Handle.value.getter();
}

uint64_t type metadata accessor for IntentPerson.Handle()
{
  return type metadata accessor for IntentPerson.Handle();
}

uint64_t IntentPerson.handle.getter()
{
  return IntentPerson.handle.getter();
}

uint64_t type metadata accessor for IntentPerson()
{
  return type metadata accessor for IntentPerson();
}

uint64_t static IntentResult.result<>()()
{
  return static IntentResult.result<>()();
}

uint64_t IntentParameter.wrappedValue.getter()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t IntentParameter.projectedValue.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t IntentParameter<>.init(title:description:mode:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:mode:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t type metadata accessor for IntentSystemContext.Source()
{
  return type metadata accessor for IntentSystemContext.Source();
}

uint64_t IntentSystemContext.source.getter()
{
  return IntentSystemContext.source.getter();
}

uint64_t type metadata accessor for IntentSystemContext()
{
  return type metadata accessor for IntentSystemContext();
}

uint64_t IntentParameterSummary.init(_:table:)()
{
  return IntentParameterSummary.init(_:table:)();
}

uint64_t ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)()
{
  return ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)();
}

Swift::Void __swiftcall ParameterSummaryString.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t ParameterSummaryString.init(stringInterpolation:)()
{
  return ParameterSummaryString.init(stringInterpolation:)();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of static SMInitiatorAlertUtilities.deepLinkURL(for:with:and:)()
{
  return dispatch thunk of static SMInitiatorAlertUtilities.deepLinkURL(for:with:and:)();
}

uint64_t type metadata accessor for SMInitiatorAlertUtilities()
{
  return type metadata accessor for SMInitiatorAlertUtilities();
}

uint64_t static SafetyMonitorUIConstants.checkMarkCircleIconName.getter()
{
  return static SafetyMonitorUIConstants.checkMarkCircleIconName.getter();
}

uint64_t static SafetyMonitorUIConstants.exclamationMarkCircleIconName.getter()
{
  return static SafetyMonitorUIConstants.exclamationMarkCircleIconName.getter();
}

uint64_t static SafetyMonitorUIConstants.liveActivityDynamicIslandBadgeDiameter.getter()
{
  return static SafetyMonitorUIConstants.liveActivityDynamicIslandBadgeDiameter.getter();
}

uint64_t static SafetyMonitorUIConstants.liveActivityDynamicIslandAvatarDiameter.getter()
{
  return static SafetyMonitorUIConstants.liveActivityDynamicIslandAvatarDiameter.getter();
}

uint64_t static SafetyMonitorUIConstants.liveActivityDynamicIslandInnerEdgePadding.getter()
{
  return static SafetyMonitorUIConstants.liveActivityDynamicIslandInnerEdgePadding.getter();
}

uint64_t static SafetyMonitorUIConstants.liveActivityDynamicIslandOuterEdgePadding.getter()
{
  return static SafetyMonitorUIConstants.liveActivityDynamicIslandOuterEdgePadding.getter();
}

uint64_t static SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandTopShift.getter()
{
  return static SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandTopShift.getter();
}

uint64_t static SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandSidePadding.getter()
{
  return static SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandSidePadding.getter();
}

uint64_t static SafetyMonitorUIConstants.antennaRadiowavesLeftAndRightSlashFillIconName.getter()
{
  return static SafetyMonitorUIConstants.antennaRadiowavesLeftAndRightSlashFillIconName.getter();
}

uint64_t static SafetyMonitorUIUtilities.fetchChatGroupPhoto(with:)()
{
  return static SafetyMonitorUIUtilities.fetchChatGroupPhoto(with:)();
}

uint64_t type metadata accessor for SafetyMonitorUIUtilities()
{
  return type metadata accessor for SafetyMonitorUIUtilities();
}

uint64_t LiveActivityView.init(with:onLockscreen:resizeHandler:)()
{
  return LiveActivityView.init(with:onLockscreen:resizeHandler:)();
}

uint64_t type metadata accessor for LiveActivityView()
{
  return type metadata accessor for LiveActivityView();
}

uint64_t SessionViewModel.localSessionState.getter()
{
  return SessionViewModel.localSessionState.getter();
}

uint64_t SessionViewModel.$localSessionState.getter()
{
  return SessionViewModel.$localSessionState.getter();
}

uint64_t SessionViewModel.sessionState.getter()
{
  return SessionViewModel.sessionState.getter();
}

uint64_t SessionViewModel.$sessionState.getter()
{
  return SessionViewModel.$sessionState.getter();
}

uint64_t static SessionViewModel.shared.getter()
{
  return static SessionViewModel.shared.getter();
}

uint64_t type metadata accessor for SessionViewModel()
{
  return type metadata accessor for SessionViewModel();
}

uint64_t ActivitySceneMetrics.init(size:cornerRadius:)()
{
  return ActivitySceneMetrics.init(size:cornerRadius:)();
}

uint64_t type metadata accessor for ActivitySceneMetrics()
{
  return type metadata accessor for ActivitySceneMetrics();
}

uint64_t dispatch thunk of ActivityScene.resolvedMetrics.setter()
{
  return dispatch thunk of ActivityScene.resolvedMetrics.setter();
}

uint64_t type metadata accessor for ActivityScene()
{
  return type metadata accessor for ActivityScene();
}

uint64_t static Logger.initiator.getter()
{
  return static Logger.initiator.getter();
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

uint64_t ConnectablePublisher.autoconnect()()
{
  return ConnectablePublisher.autoconnect()();
}

uint64_t type metadata accessor for ObservableObjectPublisher()
{
  return type metadata accessor for ObservableObjectPublisher();
}

uint64_t Publisher<>.makeConnectable()()
{
  return Publisher<>.makeConnectable()();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t static SceneBuilder.buildBlock<A>(_:)()
{
  return static SceneBuilder.buildBlock<A>(_:)();
}

uint64_t dispatch thunk of UIHostingController.sizingOptions.setter()
{
  return dispatch thunk of UIHostingController.sizingOptions.setter();
}

uint64_t UIHostingController.init(coder:rootView:)()
{
  return UIHostingController.init(coder:rootView:)();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t static UIHostingControllerSizingOptions.intrinsicContentSize.getter()
{
  return static UIHostingControllerSizingOptions.intrinsicContentSize.getter();
}

uint64_t static UIHostingControllerSizingOptions.preferredContentSize.getter()
{
  return static UIHostingControllerSizingOptions.preferredContentSize.getter();
}

uint64_t type metadata accessor for UIHostingControllerSizingOptions()
{
  return type metadata accessor for UIHostingControllerSizingOptions();
}

uint64_t static App.main()()
{
  return static App.main()();
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

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
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

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
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

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t SMSessionState.badgeImageName.getter()
{
  return SMSessionState.badgeImageName.getter();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t UIColor.init(_:)()
{
  return UIColor.init(_:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
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

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
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