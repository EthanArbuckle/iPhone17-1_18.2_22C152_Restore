int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  char **v12;
  objc_class *ObjCClassFromMetadata;
  NSString *v14;
  uint64_t v16;

  v3 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin();
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DC0 != -1) {
    swift_once();
  }
  v6 = qword_10001AB80;
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  v7 = sub_1000025F8(v3, (uint64_t)qword_10001ABA0);
  sub_100002630(v7, (uint64_t)v5);
  v8 = type metadata accessor for Logger();
  v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) == 1)
  {
    sub_100002698((uint64_t)v5);
  }
  else
  {
    sub_100007A88(v6, 0x6574617669746361, 0xEA00000000002928, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  v10 = *(void **)(v6 + OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_listener);
  if (v10)
  {
    [v10 activate];
    v11 = static CommandLine.argc.getter();
    v12 = (char **)static CommandLine.unsafeArgv.getter();
    type metadata accessor for ProximityReaderSceneUIAppDelegate();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    v14 = NSStringFromClass(ObjCClassFromMetadata);
    if (!v14)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      v14 = (NSString *)String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    UIApplicationMain(v11, v12, 0, v14);

    LODWORD(v10) = 0;
  }
  else
  {
    __break(1u);
  }
  return (int)v10;
}

uint64_t sub_1000025B4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000025F8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100002630(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000025B4(&qword_100019DE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100002698(uint64_t a1)
{
  uint64_t v2 = sub_1000025B4(&qword_100019DE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000026F8(uint64_t a1, uint64_t a2)
{
  return sub_100002A6C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100002720@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100002754(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_1000027CC(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10000284C@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100002894(uint64_t a1)
{
  uint64_t v2 = sub_100002D04(&qword_100019E88, type metadata accessor for Role);
  uint64_t v3 = sub_100002D04((unint64_t *)&unk_100019E90, type metadata accessor for Role);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100002950@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100002998(uint64_t a1)
{
  uint64_t v2 = sub_100002D04((unint64_t *)&qword_10001A3E0, type metadata accessor for STBackgroundActivityIdentifier);
  uint64_t v3 = sub_100002D04((unint64_t *)&unk_100019EA0, type metadata accessor for STBackgroundActivityIdentifier);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100002A54(uint64_t a1, uint64_t a2)
{
  return sub_100002A6C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100002A6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100002AB0()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100002B04()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100002B78()
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

void type metadata accessor for Role(uint64_t a1)
{
}

void type metadata accessor for STBackgroundActivityIdentifier(uint64_t a1)
{
}

void sub_100002C2C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100002C74()
{
  return sub_100002D04(&qword_100019E58, type metadata accessor for STBackgroundActivityIdentifier);
}

uint64_t sub_100002CBC()
{
  return sub_100002D04(&qword_100019E60, type metadata accessor for STBackgroundActivityIdentifier);
}

uint64_t sub_100002D04(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100002D4C()
{
  return sub_100002D04(&qword_100019E68, type metadata accessor for Role);
}

uint64_t sub_100002D94()
{
  return sub_100002D04(&qword_100019E70, type metadata accessor for Role);
}

uint64_t sub_100002DDC()
{
  return sub_100002D04(&qword_100019E78, type metadata accessor for Role);
}

uint64_t sub_100002E24()
{
  return sub_100002D04(&qword_100019E80, type metadata accessor for STBackgroundActivityIdentifier);
}

id sub_100002F9C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for ViewController()
{
  return self;
}

id sub_100002FF4()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for ProximityReaderSceneUI()) init];
  qword_10001AB80 = (uint64_t)result;
  return result;
}

uint64_t sub_100003024()
{
  uint64_t v1 = sub_1000025B4(&qword_100019DE0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_listener] = 0;
  *(void *)&v0[OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_handle] = 0;
  uint64_t v4 = (objc_class *)type metadata accessor for ProximityReaderSceneUI();
  v22.receiver = v0;
  v22.super_class = v4;
  id v5 = [super init];
  uint64_t v6 = qword_100019DD0;
  v7 = (char *)v5;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1000025F8(v1, (uint64_t)qword_10001ABA0);
  sub_100002630(v8, (uint64_t)v3);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v3, 1, v9) == 1)
  {
    uint64_t v11 = sub_100002698((uint64_t)v3);
  }
  else
  {
    v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "ProximityReaderSceneUI server init", v14, 2u);
      swift_slowDealloc();
    }

    uint64_t v11 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v3, v9);
  }
  __chkstk_darwin(v11);
  aBlock[-2] = v7;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_100003BC4;
  *(void *)(v15 + 24) = &aBlock[-4];
  aBlock[4] = sub_100003BDC;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003434;
  aBlock[3] = &unk_100014980;
  v16 = _Block_copy(aBlock);
  v17 = self;
  swift_retain();
  id v18 = [v17 listenerWithConfigurator:v16];
  _Block_release(v16);
  swift_release();
  LOBYTE(v16) = swift_isEscapingClosureAtFileLocation();

  uint64_t result = swift_release();
  if (v16)
  {
    __break(1u);
  }
  else
  {
    v20 = *(void **)&v7[OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_listener];
    *(void *)&v7[OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_listener] = v18;

    return (uint64_t)v7;
  }
  return result;
}

id sub_100003374(void *a1, uint64_t a2)
{
  NSString v4 = String._bridgeToObjectiveC()();
  [a1 setDomain:v4];

  NSString v5 = String._bridgeToObjectiveC()();
  [a1 setService:v5];

  return [a1 setDelegate:a2];
}

uint64_t sub_100003434(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

id sub_100003540()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProximityReaderSceneUI();
  return [super dealloc];
}

uint64_t type metadata accessor for ProximityReaderSceneUI()
{
  return self;
}

void sub_1000035E4(void *a1)
{
  uint64_t v2 = v1;
  id v47 = a1;
  uint64_t v3 = sub_1000025B4(&qword_100019DE0);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v39 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v39 - v10;
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v46 = sub_1000025F8(v3, (uint64_t)qword_10001ABA0);
  sub_100002630(v46, (uint64_t)v11);
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  v45 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v45(v11, 1, v12) == 1)
  {
    sub_100002698((uint64_t)v11);
  }
  else
  {
    v44 = v9;
    id v14 = v47;
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v43 = v2;
      id v18 = (uint8_t *)v17;
      v39 = (void *)swift_slowAlloc();
      uint64_t v42 = v13;
      *(_DWORD *)id v18 = 138412290;
      v40 = v15;
      id v48 = v14;
      id v19 = v14;
      v41 = v6;
      id v20 = v19;
      uint64_t v15 = v40;
      uint64_t v13 = v42;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v39 = v14;

      uint64_t v6 = v41;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "ProximityReaderSceneServerHandle listener: %@", v18, 0xCu);
      sub_1000025B4(&qword_100019FE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v2 = v43;
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
    uint64_t v9 = v44;
  }
  id v21 = [v47 remoteToken];
  NSString v22 = String._bridgeToObjectiveC()();
  unsigned int v23 = [v21 hasEntitlement:v22];

  if (v23)
  {
    sub_100002630(v46, (uint64_t)v9);
    if (v45(v9, 1, v12) == 1)
    {
      sub_100002698((uint64_t)v9);
    }
    else
    {
      id v24 = v47;
      v25 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v43 = v2;
        uint64_t v27 = swift_slowAlloc();
        uint64_t v46 = v12;
        v28 = (uint8_t *)v27;
        v29 = (void *)swift_slowAlloc();
        *(_DWORD *)v28 = 138412290;
        id v48 = v24;
        id v30 = v24;
        v44 = v9;
        uint64_t v31 = v13;
        id v32 = v30;
        uint64_t v2 = v43;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v29 = v24;

        uint64_t v13 = v31;
        uint64_t v9 = v44;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "ProximityReaderSceneServerHandle accepting: %@", v28, 0xCu);
        sub_1000025B4(&qword_100019FE0);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v12 = v46;
        swift_slowDealloc();
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v12);
    }
    id v36 = objc_allocWithZone((Class)type metadata accessor for SceneUIServerHandle());
    uint64_t v37 = sub_100003D88(v47);
    v38 = *(void **)(v2 + OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_handle);
    *(void *)(v2 + OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_handle) = v37;
  }
  else
  {
    sub_100002630(v46, (uint64_t)v6);
    if (v45(v6, 1, v12) == 1)
    {
      sub_100002698((uint64_t)v6);
    }
    else
    {
      v33 = Logger.logObject.getter();
      os_log_type_t v34 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "ProximityReaderSceneUIServer connection to service denied", v35, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v12);
    }
    [v47 invalidate];
  }
}

id sub_100003BC4(void *a1)
{
  return sub_100003374(a1, *(void *)(v1 + 16));
}

uint64_t sub_100003BCC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100003BDC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100003C04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003C14()
{
  return swift_release();
}

id sub_100003C1C()
{
  uint64_t v1 = OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle____lazy_storage___interface;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle____lazy_storage___interface);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle____lazy_storage___interface);
  }
  else
  {
    id v4 = sub_100003C7C();
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_100003C7C()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [self interfaceWithIdentifier:v0];

  uint64_t v2 = self;
  id v3 = [v2 protocolForProtocol:&OBJC_PROTOCOL___ProximityReaderSceneUIServerInterface];
  [v1 setServer:v3];

  id v4 = [v2 protocolForProtocol:&OBJC_PROTOCOL___ProximityReaderSceneUIClientInterface];
  [v1 setClient:v4];

  [v1 setClientMessagingExpectation:0];
  return v1;
}

uint64_t sub_100003D88(void *a1)
{
  uint64_t v3 = sub_1000025B4(&qword_100019DE0);
  uint64_t v4 = __chkstk_darwin(v3);
  id v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v30 - v7;
  *(void *)&v1[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_readerServiceEndpoint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_userInfo] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle____lazy_storage___interface] = 0;
  uint64_t v9 = (objc_class *)type metadata accessor for SceneUIServerHandle();
  v33.receiver = v1;
  v33.super_class = v9;
  [super init];
  uint64_t v11 = qword_100019DD0;
  uint64_t v12 = (char *)v10;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_1000025F8(v3, (uint64_t)qword_10001ABA0);
  sub_100002630(v30, (uint64_t)v8);
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v31 = *(void *)(v13 - 8);
  id v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
  if (v14(v8, 1, v13) == 1)
  {
    sub_10000749C((uint64_t)v8, &qword_100019DE0);
  }
  else
  {
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "SceneUIServerHandle init", v17, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v13);
  }
  id v18 = *(void **)&v12[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection];
  *(void *)&v12[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection] = a1;
  id v19 = a1;

  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v12;
  *(void *)(v20 + 24) = v19;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_1000076A0;
  *(void *)(v21 + 24) = v20;
  aBlock[4] = sub_100003BDC;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003434;
  aBlock[3] = &unk_100014B88;
  NSString v22 = _Block_copy(aBlock);
  id v23 = v19;
  id v24 = v12;
  id v25 = v23;
  swift_retain();
  swift_release();
  [v25 configureConnection:v22];

  _Block_release(v22);
  LOBYTE(v22) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v22)
  {
    __break(1u);
  }
  else
  {
    sub_100002630(v30, (uint64_t)v6);
    if (v14(v6, 1, v13) == 1)
    {
      sub_10000749C((uint64_t)v6, &qword_100019DE0);
    }
    else
    {
      uint64_t v27 = Logger.logObject.getter();
      os_log_type_t v28 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "SceneUIServerHandle connection activate", v29, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v13);
    }
    [v25 activate];
    swift_release();

    return (uint64_t)v24;
  }
  return result;
}

void sub_100004220(void *a1, uint64_t a2, void *a3)
{
  id v6 = sub_100003C1C();
  [a1 setInterface:v6];

  sub_100007378(0, &qword_10001A100);
  uint64_t v7 = (void *)static OS_dispatch_queue.main.getter();
  [a1 setTargetQueue:v7];

  id v8 = [self userInitiated];
  [a1 setServiceQuality:v8];

  [a1 setInterfaceTarget:a2];
  id v19 = sub_1000044C4;
  uint64_t v20 = 0;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_1000044D0;
  id v18 = &unk_100014BB0;
  uint64_t v9 = _Block_copy(&v15);
  [a1 setActivationHandler:v9];
  _Block_release(v9);
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  id v19 = sub_100007730;
  uint64_t v20 = v11;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_1000044D0;
  id v18 = &unk_100014C28;
  uint64_t v12 = _Block_copy(&v15);
  id v13 = a3;
  swift_release();
  [a1 setInvalidationHandler:v12];
  _Block_release(v12);
  id v19 = sub_100004970;
  uint64_t v20 = 0;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_1000044D0;
  id v18 = &unk_100014C50;
  id v14 = _Block_copy(&v15);
  [a1 setInterruptionHandler:v14];
  _Block_release(v14);
}

uint64_t sub_1000044C4(uint64_t a1)
{
  return sub_1000047A8(a1, "activation handler");
}

void sub_1000044D0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_100004538(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v3);
  uint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1000025F8(v3, (uint64_t)qword_10001ABA0);
  sub_100002630(v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) == 1)
  {
    sub_10000749C((uint64_t)v5, &qword_100019DE0);
  }
  else
  {
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "invalidation handler - remote client disconnected", v11, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v5, v7);
  }
  [a2 invalidate];
  swift_beginAccess();
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v13 = *(void **)&Strong[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection];
    *(void *)&Strong[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection] = 0;
  }
  swift_beginAccess();
  uint64_t v14 = swift_unknownObjectWeakLoadStrong();
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    sub_100005C30((uint64_t)sub_10000479C, 0);
  }
}

uint64_t sub_10000479C(uint64_t a1)
{
  return sub_1000047A8(a1, "could not invalidate remote ui");
}

uint64_t sub_1000047A8(uint64_t a1, const char *a2)
{
  uint64_t v3 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1000025F8(v3, (uint64_t)qword_10001ABA0);
  sub_100002630(v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) == 1) {
    return sub_10000749C((uint64_t)v5, &qword_100019DE0);
  }
  os_log_type_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, a2, v12, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v5, v7);
}

id sub_100004970(void *a1)
{
  uint64_t v2 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000025F8(v2, (uint64_t)qword_10001ABA0);
  sub_100002630(v5, (uint64_t)v4);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) == 1)
  {
    sub_10000749C((uint64_t)v4, &qword_100019DE0);
  }
  else
  {
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "interruption handler", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }
  return [a1 activate];
}

id sub_100004B4C()
{
  id v1 = v0;
  uint64_t v2 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000025F8(v2, (uint64_t)qword_10001ABA0);
  sub_100002630(v5, (uint64_t)v4);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) == 1)
  {
    sub_10000749C((uint64_t)v4, &qword_100019DE0);
  }
  else
  {
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "SceneUIServerHandle destroyed", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }
  os_log_type_t v11 = (objc_class *)type metadata accessor for SceneUIServerHandle();
  v13.receiver = v1;
  v13.super_class = v11;
  return [super dealloc];
}

uint64_t sub_100004DD8(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v73 = a4;
  uint64_t v72 = a3;
  uint64_t v70 = a1;
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v78 = *(void *)(v5 - 8);
  uint64_t v79 = v5;
  __chkstk_darwin(v5);
  v76 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = type metadata accessor for DispatchQoS();
  uint64_t v75 = *(void *)(v77 - 8);
  __chkstk_darwin(v77);
  v74 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = type metadata accessor for XPCUserInfoKey();
  uint64_t v8 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  os_log_type_t v10 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000025B4(&qword_100019DE0);
  uint64_t v12 = __chkstk_darwin(v11);
  v71 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v63 - v14;
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v65 = sub_1000025F8(v11, (uint64_t)qword_10001ABA0);
  sub_100002630(v65, (uint64_t)v15);
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v17 = *(void *)(v16 - 8);
  id v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48);
  uint64_t v68 = v17 + 48;
  v67 = v18;
  if (v18((uint64_t)v15, 1, v16) == 1)
  {
    sub_10000749C((uint64_t)v15, &qword_100019DE0);
  }
  else
  {
    id v19 = [a2 debugDescription];
    uint64_t v20 = v17;
    uint64_t v21 = v16;
    NSString v22 = a2;
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v25 = v24;

    uint64_t v26 = v23;
    a2 = v22;
    uint64_t v16 = v21;
    uint64_t v17 = v20;
    sub_100007A88(v80, 0xD00000000000002BLL, 0x8000000100012B40, v26, v25);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v15, v16);
  }
  id v27 = [objc_allocWithZone((Class)SBSUIProximityReaderSceneSpecification) init];
  id v69 = [v27 uiSceneSessionRole];

  uint64_t v28 = v80;
  v29 = *(void **)(v80 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_readerServiceEndpoint);
  *(void *)(v80 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_readerServiceEndpoint) = a2;
  uint64_t v30 = a2;
  v64 = a2;

  uint64_t v31 = v70;
  *(void *)(v28 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_userInfo) = v70;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v32 = v66;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for XPCUserInfoKey.uiMode(_:), v66);
  uint64_t v33 = XPCUserInfoKey.rawValue.getter();
  uint64_t v35 = v34;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v32);
  uint64_t v82 = v33;
  uint64_t v83 = v35;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v31 + 16))
  {
    unint64_t v36 = sub_10000726C((uint64_t)aBlock);
    uint64_t v37 = (uint64_t)v71;
    if (v38)
    {
      sub_100007544(*(void *)(v31 + 56) + 32 * v36, (uint64_t)&v84);
    }
    else
    {
      long long v84 = 0u;
      long long v85 = 0u;
    }
  }
  else
  {
    long long v84 = 0u;
    long long v85 = 0u;
    uint64_t v37 = (uint64_t)v71;
  }
  sub_100007448((uint64_t)aBlock);
  if (*((void *)&v85 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t v39 = v17;
      uint64_t v40 = v82;
      BOOL v41 = v40 == UIMode.rawValue.getter();
      uint64_t v17 = v39;
      if (v41) {
        uint64_t v42 = 0x726575737369;
      }
      else {
        uint64_t v42 = 7364980;
      }
      if (v41) {
        unint64_t v43 = 0xE600000000000000;
      }
      else {
        unint64_t v43 = 0xE300000000000000;
      }
      goto LABEL_22;
    }
    uint64_t v42 = 0x6E776F6E6B6E75;
  }
  else
  {
    uint64_t v42 = 0x6E776F6E6B6E75;
    sub_10000749C((uint64_t)&v84, &qword_10001A130);
  }
  unint64_t v43 = 0xE700000000000000;
LABEL_22:
  sub_100002630(v65, v37);
  if (v67(v37, 1, v16) == 1)
  {
    swift_bridgeObjectRelease();
    sub_10000749C(v37, &qword_100019DE0);
  }
  else
  {
    v71 = v30;
    v44 = v64;
    swift_bridgeObjectRetain();
    v45 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.default.getter();
    int v47 = v46;
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v48 = swift_slowAlloc();
      LODWORD(v67) = v47;
      uint64_t v49 = v48;
      v50 = (void *)swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      aBlock[0] = v68;
      *(_DWORD *)uint64_t v49 = 138412546;
      uint64_t v66 = v42;
      *(void *)&long long v84 = v44;
      uint64_t v70 = v17;
      v51 = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v50 = v71;

      *(_WORD *)(v49 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&long long v84 = sub_10000E014(v66, v43, aBlock);
      uint64_t v17 = v70;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v45, (os_log_type_t)v67, "activateRemoteUI ep: %@ mode: %s", (uint8_t *)v49, 0x16u);
      sub_1000025B4(&qword_100019FE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v37, v16);
  }
  v52 = *(void **)(v80 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene);
  *(void *)(v80 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene) = 0;

  sub_100007378(0, &qword_10001A100);
  v53 = (void *)static OS_dispatch_queue.main.getter();
  v54 = (void *)swift_allocObject();
  v55 = v69;
  uint64_t v56 = v72;
  v54[2] = v69;
  v54[3] = v56;
  v54[4] = v73;
  aBlock[4] = (uint64_t)sub_100007538;
  aBlock[5] = (uint64_t)v54;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100005AA8;
  aBlock[3] = (uint64_t)&unk_100014A98;
  v57 = _Block_copy(aBlock);
  id v58 = v55;
  swift_retain();
  swift_release();
  v59 = v74;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_100007170();
  sub_1000025B4(&qword_10001A110);
  sub_1000071C8();
  v60 = v76;
  uint64_t v61 = v79;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v57);

  (*(void (**)(char *, uint64_t))(v78 + 8))(v60, v61);
  return (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v59, v77);
}

uint64_t sub_100005798(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UISceneSessionActivationRequest();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1000025F8(v10, (uint64_t)qword_10001ABA0);
  sub_100002630(v13, (uint64_t)v12);
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14) == 1)
  {
    sub_10000749C((uint64_t)v12, &qword_100019DE0);
  }
  else
  {
    unint64_t v24 = a1;
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = v6;
      *(_WORD *)id v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "activateRemoteUI() activateSceneSession", v18, 2u);
      uint64_t v6 = v23;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
    a1 = v24;
  }
  id v19 = a1;
  UISceneSessionActivationRequest.init(role:userActivity:options:)();
  id v20 = [self sharedApplication];
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a2;
  *(void *)(v21 + 24) = a3;
  swift_retain();
  UIApplication.activateSceneSession(for:errorHandler:)();

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_100005AA8(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100005BCC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_100005C30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v29 = a1;
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v34 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v32 = *(void *)(v8 - 8);
  uint64_t v33 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000025B4(&qword_100019DE0);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v35 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v28 - v14;
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_1000025F8(v11, (uint64_t)qword_10001ABA0);
  sub_100002630(v31, (uint64_t)v15);
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  int v18 = v30(v15, 1, v16);
  uint64_t v28 = v17;
  if (v18 == 1)
  {
    sub_10000749C((uint64_t)v15, &qword_100019DE0);
  }
  else
  {
    sub_100007A88(v3, 0xD000000000000016, 0x8000000100012B20, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v15, v16);
  }
  uint64_t v19 = v3;
  sub_100007378(0, &qword_10001A100);
  id v20 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v29;
  *(void *)(v21 + 24) = a2;
  aBlock[4] = sub_100007168;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005AA8;
  aBlock[3] = &unk_1000149F8;
  NSString v22 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100007170();
  sub_1000025B4(&qword_10001A110);
  sub_1000071C8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v34 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v33);
  uint64_t v23 = *(void **)(v19 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene);
  *(void *)(v19 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene) = 0;

  unint64_t v24 = *(void **)(v19 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection);
  if (v24) {
    [v24 invalidate];
  }
  uint64_t v25 = (uint64_t)v35;
  if (qword_100019DC0 != -1) {
    swift_once();
  }
  uint64_t v26 = qword_10001AB80;
  sub_100002630(v31, v25);
  if (v30((char *)v25, 1, v16) == 1)
  {
    sub_10000749C(v25, &qword_100019DE0);
  }
  else
  {
    sub_100007A88(v26, 0x6164696C61766E69, 0xEC00000029286574, 0, 0xE000000000000000);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v25, v16);
  }
  id v27 = *(void **)(v26 + OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_handle);
  *(void *)(v26 + OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_handle) = 0;
}

void sub_100006160(uint64_t a1, uint64_t a2)
{
  uint64_t v50 = a1;
  uint64_t v51 = a2;
  uint64_t v49 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v49);
  v53 = (char *)v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = [objc_allocWithZone((Class)SBSUIProximityReaderSceneSpecification) init];
  id v52 = [v3 uiSceneSessionRole];

  id v48 = self;
  id v4 = [v48 sharedApplication];
  id v5 = [v4 connectedScenes];

  uint64_t v6 = sub_100007378(0, &qword_10001A120);
  sub_1000073B4();
  uint64_t v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  v44[2] = v6;
  if ((v7 & 0xC000000000000001) != 0)
  {
    __CocoaSet.makeIterator()();
    Set.Iterator.init(_cocoa:)();
    uint64_t v7 = v56[4];
    uint64_t v46 = v56[5];
    uint64_t v8 = v56[6];
    uint64_t v9 = v56[7];
    unint64_t v10 = v56[8];
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = -1 << *(unsigned char *)(v7 + 32);
    uint64_t v12 = *(void *)(v7 + 56);
    uint64_t v46 = v7 + 56;
    uint64_t v8 = ~v11;
    uint64_t v13 = -v11;
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v10 = v14 & v12;
  }
  v44[3] = v7 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v45 = (unint64_t)(v8 + 64) >> 6;
  int v47 = v56;
  v44[1] = (char *)&type metadata for Swift.AnyObject + 8;
  while (v7 < 0)
  {
    uint64_t v24 = __CocoaSet.Iterator.next()();
    if (!v24) {
      goto LABEL_45;
    }
    uint64_t v54 = v24;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v20 = (id)aBlock[0];
    swift_unknownObjectRelease();
    uint64_t v23 = v9;
    uint64_t v21 = v10;
    if (!v20) {
      goto LABEL_45;
    }
LABEL_32:
    id v28 = [v20 session];
    id v29 = [v28 role];

    uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v32 = v31;
    if (v30 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v32 == v33)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v35 = _stringCompareWithSmolCheck(_:_:expecting:)();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v35 & 1) == 0) {
        goto LABEL_10;
      }
    }
    uint64_t v36 = v8;
    uint64_t v37 = (uint64_t)v53;
    if (qword_100019DD0 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_1000025F8(v49, (uint64_t)qword_10001ABA0);
    sub_100002630(v38, v37);
    uint64_t v39 = type metadata accessor for Logger();
    uint64_t v40 = *(void *)(v39 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v37, 1, v39) == 1)
    {
      sub_10000749C(v37, &qword_100019DE0);
    }
    else
    {
      BOOL v41 = Logger.logObject.getter();
      os_log_type_t v42 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v41, v42))
      {
        unint64_t v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v43 = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "invalidateRemoteUI destroying scene", v43, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v40 + 8))(v53, v39);
    }
    id v15 = [v48 sharedApplication];
    id v16 = [v20 session];
    uint64_t v17 = swift_allocObject();
    uint64_t v18 = v51;
    *(void *)(v17 + 16) = v50;
    *(void *)(v17 + 24) = v18;
    v56[2] = sub_100007424;
    v56[3] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    v56[0] = sub_10000BA48;
    v56[1] = &unk_100014A48;
    uint64_t v19 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v15 requestSceneSessionDestruction:v16 options:0 errorHandler:v19];
    _Block_release(v19);

    id v20 = v16;
    uint64_t v8 = v36;
LABEL_10:

    uint64_t v9 = v23;
    unint64_t v10 = v21;
  }
  if (v10)
  {
    uint64_t v21 = (v10 - 1) & v10;
    unint64_t v22 = __clz(__rbit64(v10)) | (v9 << 6);
    uint64_t v23 = v9;
LABEL_31:
    id v20 = *(id *)(*(void *)(v7 + 48) + 8 * v22);
    if (!v20) {
      goto LABEL_45;
    }
    goto LABEL_32;
  }
  int64_t v25 = v9 + 1;
  if (!__OFADD__(v9, 1))
  {
    if (v25 >= v45) {
      goto LABEL_45;
    }
    unint64_t v26 = *(void *)(v46 + 8 * v25);
    uint64_t v23 = v9 + 1;
    if (!v26)
    {
      uint64_t v23 = v9 + 2;
      if (v9 + 2 >= v45) {
        goto LABEL_45;
      }
      unint64_t v26 = *(void *)(v46 + 8 * v23);
      if (!v26)
      {
        uint64_t v23 = v9 + 3;
        if (v9 + 3 >= v45) {
          goto LABEL_45;
        }
        unint64_t v26 = *(void *)(v46 + 8 * v23);
        if (!v26)
        {
          uint64_t v23 = v9 + 4;
          if (v9 + 4 >= v45) {
            goto LABEL_45;
          }
          unint64_t v26 = *(void *)(v46 + 8 * v23);
          if (!v26)
          {
            uint64_t v27 = v9 + 5;
            while (v45 != v27)
            {
              unint64_t v26 = *(void *)(v46 + 8 * v27++);
              if (v26)
              {
                uint64_t v23 = v27 - 1;
                goto LABEL_30;
              }
            }
LABEL_45:
            sub_10000741C();

            return;
          }
        }
      }
    }
LABEL_30:
    uint64_t v21 = (v26 - 1) & v26;
    unint64_t v22 = __clz(__rbit64(v26)) + (v23 << 6);
    goto LABEL_31;
  }
  __break(1u);
}

uint64_t sub_100006810(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, const char *a4)
{
  id v20 = a2;
  uint64_t v6 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1000025F8(v6, (uint64_t)qword_10001ABA0);
  sub_100002630(v9, (uint64_t)v8);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_10000749C((uint64_t)v8, &qword_100019DE0);
  }
  else
  {
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v19 = a4;
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 138412290;
      v17[1] = v14 + 4;
      swift_errorRetain();
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v21 = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v18 = v15;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v19, v14, 0xCu);
      sub_1000025B4(&qword_100019FE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  return v20(a1);
}

BOOL sub_100006D04(void *a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene);
  if (v3)
  {
    id v4 = [self sharedApplication];
    id v5 = [a1 session];
    v9[4] = sub_100006E28;
    v9[5] = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 1107296256;
    v9[2] = sub_10000BA48;
    v9[3] = &unk_1000149A8;
    uint64_t v6 = _Block_copy(v9);
    [v4 requestSceneSessionDestruction:v5 options:0 errorHandler:v6];
    _Block_release(v6);
  }
  else
  {
    *(void *)(v1 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene) = a1;
    id v7 = a1;
  }
  return v3 == 0;
}

uint64_t sub_100006E28()
{
  uint64_t v0 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1000025F8(v0, (uint64_t)qword_10001ABA0);
  sub_100002630(v3, (uint64_t)v2);
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v4) == 1) {
    return sub_10000749C((uint64_t)v2, &qword_100019DE0);
  }
  swift_errorRetain();
  swift_errorRetain();
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v11[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    swift_errorRetain();
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v11[1] = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(void *)v11[0] = v10;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "~~~~ Could not close scene %@", v9, 0xCu);
    sub_1000025B4(&qword_100019FE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v2, v4);
}

uint64_t type metadata accessor for SceneUIServerHandle()
{
  return self;
}

uint64_t sub_100007118(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100007128()
{
  return swift_release();
}

uint64_t sub_100007130()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100007168()
{
  sub_100006160(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_100007170()
{
  unint64_t result = qword_10001A108;
  if (!qword_10001A108)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A108);
  }
  return result;
}

unint64_t sub_1000071C8()
{
  unint64_t result = qword_10001A118;
  if (!qword_10001A118)
  {
    sub_100007224(&qword_10001A110);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A118);
  }
  return result;
}

uint64_t sub_100007224(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000726C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000072B0(a1, v4);
}

unint64_t sub_1000072B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000075C4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100007448((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100007378(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1000073B4()
{
  unint64_t result = qword_10001A128;
  if (!qword_10001A128)
  {
    sub_100007378(255, &qword_10001A120);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A128);
  }
  return result;
}

uint64_t sub_10000741C()
{
  return swift_release();
}

uint64_t sub_100007424(uint64_t a1)
{
  return sub_100006810(a1, *(uint64_t (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), "~~~~ Could not close scene %@");
}

uint64_t sub_100007448(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000749C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000025B4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000074F8()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100007538()
{
  return sub_100005798(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_100007544(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000075A0(uint64_t a1)
{
  return sub_100006810(a1, *(uint64_t (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), "Could not open scene %@");
}

uint64_t sub_1000075C4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100007620()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100007658(uint64_t a1)
{
  sub_100005BCC(a1, *(void *)(v1 + 16));
}

uint64_t sub_100007660()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000076A0(void *a1)
{
  sub_100004220(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1000076A8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000076B8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000076F0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100007730(uint64_t a1)
{
  sub_100004538(a1, *(void **)(v1 + 16));
}

uint64_t sub_100007780()
{
  uint64_t v0 = sub_1000025B4(&qword_100019DE0);
  sub_100007968(v0, qword_10001AB88);
  uint64_t v1 = sub_1000025F8(v0, (uint64_t)qword_10001AB88);
  Logger.init(subsystem:category:)();
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100007848()
{
  uint64_t v0 = sub_1000025B4(&qword_100019DE0);
  sub_100007968(v0, qword_10001ABA0);
  uint64_t v1 = sub_1000025F8(v0, (uint64_t)qword_10001ABA0);
  Logger.init(subsystem:category:)();
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100007914()
{
  uint64_t result = MCGestaltIsInternalBuild();
  byte_10001ABB8 = result;
  return result;
}

uint64_t sub_100007934()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for PRLoggers()
{
  return self;
}

uint64_t *sub_100007968(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000079CC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return String.subscript.getter();
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v4 = String.index(_:offsetBy:limitedBy:)();
  if (v5) {
    unint64_t v4 = 15;
  }
  if (4 * v3 < v4 >> 14) {
    goto LABEL_12;
  }

  return String.subscript.getter();
}

void sub_100007A88(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  if (qword_100019DD8 != -1) {
    swift_once();
  }
  if (byte_10001ABB8 == 1)
  {
    uint64_t v9 = HIBYTE(a5) & 0xF;
    if ((a5 & 0x2000000000000000) == 0) {
      uint64_t v9 = a4 & 0xFFFFFFFFFFFFLL;
    }
    if (v9)
    {
      uint64_t v24 = a2;
      unint64_t v25 = a3;
      swift_bridgeObjectRetain();
      v10._countAndFlagsBits = 8250;
      v10._object = (void *)0xE200000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = a4;
      v11._object = (void *)a5;
      String.append(_:)(v11);
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    uint64_t v24 = ObjectIdentifier.debugDescription.getter();
    unint64_t v25 = v12;
    sub_100007E34();
    uint64_t v13 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    sub_1000079CC(8, v13, v15);
    swift_bridgeObjectRelease();
    swift_unknownObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136381187;
      swift_getObjectType();
      sub_1000025B4(&qword_10001A298);
      uint64_t v19 = String.init<A>(describing:)();
      sub_10000E014(v19, v20, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v21 = static String._fromSubstring(_:)();
      unint64_t v23 = v22;
      swift_bridgeObjectRelease();
      sub_10000E014(v21, v23, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 22) = 2081;
      swift_bridgeObjectRetain();
      sub_10000E014(a2, a3, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "(o)%{private}s-%{private}s.%{private}s", (uint8_t *)v18, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease_n();
    }
  }
}

unint64_t sub_100007E34()
{
  unint64_t result = qword_10001A290;
  if (!qword_10001A290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A290);
  }
  return result;
}

uint64_t sub_100007E88()
{
  uint64_t v1 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1000025F8(v1, (uint64_t)qword_10001ABA0);
  sub_100002630(v4, (uint64_t)v3);
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v3, 1, v5) == 1) {
    return sub_10000749C((uint64_t)v3, &qword_100019DE0);
  }
  os_log_type_t v8 = v0;
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    Swift::String v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)Swift::String v11 = 136315138;
    v16[1] = v11 + 4;
    id v17 = *(id *)&v8[OBJC_IVAR____TtC22ProximityReaderSceneUI23TapUISceneActionHandler_action];
    uint64_t v18 = v12;
    id v13 = v17;
    sub_1000025B4(&qword_10001A370);
    uint64_t v14 = String.init<A>(describing:)();
    id v17 = (id)sub_10000E014(v14, v15, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "TapUISceneActionHandler - Received action: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v3, v5);
}

uint64_t sub_100008218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  v4[4] = sub_1000025B4(&qword_100019DE0);
  v4[5] = swift_task_alloc();
  v4[6] = swift_task_alloc();
  v4[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000082CC, 0, 0);
}

uint64_t sub_1000082CC()
{
  type metadata accessor for AppManager();
  static AppManager.shared.getter();
  uint64_t v1 = (int *)dispatch thunk of AppManager.callHandler.getter();
  uint64_t v3 = v2;
  swift_release();
  *(void *)(v0 + 64) = v1;
  *(void *)(v0 + 72) = v3;
  if (v1)
  {
    unint64_t v15 = (uint64_t (*)(void))((char *)v1 + *v1);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_100008590;
    return v15();
  }
  else
  {
    if (qword_100019DD0 != -1) {
      swift_once();
    }
    uint64_t v6 = *(void *)(v0 + 48);
    uint64_t v7 = sub_1000025F8(*(void *)(v0 + 32), (uint64_t)qword_10001ABA0);
    sub_100002630(v7, v6);
    uint64_t v8 = type metadata accessor for Logger();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) == 1)
    {
      sub_10000749C(*(void *)(v0 + 48), &qword_100019DE0);
    }
    else
    {
      os_log_type_t v10 = Logger.logObject.getter();
      os_log_type_t v11 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "BSAction activity can't continue, ignore", v12, 2u);
        swift_slowDealloc();
      }
      uint64_t v13 = *(void *)(v0 + 48);

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v8);
    }
    [*(id *)(v0 + 24) setProceed:0];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
    return v14();
  }
}

uint64_t sub_100008590(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_100008A30;
  }
  else
  {
    *(unsigned char *)(v4 + 96) = a1 & 1;
    uint64_t v5 = sub_1000086BC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1000086BC()
{
  if (*(unsigned char *)(v0 + 96) == 1)
  {
    if (qword_100019DD0 != -1) {
      swift_once();
    }
    uint64_t v1 = *(void *)(v0 + 56);
    uint64_t v2 = sub_1000025F8(*(void *)(v0 + 32), (uint64_t)qword_10001ABA0);
    sub_100002630(v2, v1);
    uint64_t v3 = type metadata accessor for Logger();
    uint64_t v4 = *(void *)(v3 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, 1, v3) == 1)
    {
      sub_10000749C(*(void *)(v0 + 56), &qword_100019DE0);
    }
    else
    {
      uint64_t v9 = Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v9, v10))
      {
        os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "BSAction activity handling success, proceed ", v11, 2u);
        swift_slowDealloc();
      }
      uint64_t v12 = *(void *)(v0 + 56);

      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v12, v3);
    }
    uint64_t v13 = *(void *)(v0 + 64);
    [*(id *)(v0 + 24) setProceed:1];
    sub_10000B944(v13);
  }
  else
  {
    sub_10000B944(*(void *)(v0 + 64));
    if (qword_100019DD0 != -1) {
      swift_once();
    }
    uint64_t v5 = *(void *)(v0 + 48);
    uint64_t v6 = sub_1000025F8(*(void *)(v0 + 32), (uint64_t)qword_10001ABA0);
    sub_100002630(v6, v5);
    uint64_t v7 = type metadata accessor for Logger();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) == 1)
    {
      sub_10000749C(*(void *)(v0 + 48), &qword_100019DE0);
    }
    else
    {
      uint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "BSAction activity can't continue, ignore", v16, 2u);
        swift_slowDealloc();
      }
      uint64_t v17 = *(void *)(v0 + 48);

      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v17, v7);
    }
    [*(id *)(v0 + 24) setProceed:0];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_100008A30()
{
  sub_10000B944(*(void *)(v0 + 64));
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = sub_1000025F8(*(void *)(v0 + 32), (uint64_t)qword_10001ABA0);
  sub_100002630(v2, v1);
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, 1, v3) == 1)
  {
    sub_10000749C(*(void *)(v0 + 40), &qword_100019DE0);
  }
  else
  {
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v11 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 138412290;
      swift_errorRetain();
      uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 16) = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *os_log_type_t v11 = v8;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "BSAction activity handling failed, do not proceed, thrown %@", v7, 0xCu);
      sub_1000025B4(&qword_100019FE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }
    (*(void (**)(void, uint64_t))(v4 + 8))(*(void *)(v0 + 40), v3);
  }
  [*(id *)(v0 + 24) setProceed:0];
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_100008D00(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000749C(a1, &qword_10001A348);
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

uint64_t sub_100008EAC()
{
  v0[3] = sub_1000025B4(&qword_100019DE0);
  v0[4] = swift_task_alloc();
  v0[5] = swift_task_alloc();
  v0[6] = swift_task_alloc();
  return _swift_task_switch(sub_100008F5C, 0, 0);
}

uint64_t sub_100008F5C()
{
  type metadata accessor for AppManager();
  static AppManager.shared.getter();
  uint64_t v1 = (int *)dispatch thunk of AppManager.homeButtonHandler.getter();
  uint64_t v3 = v2;
  swift_release();
  v0[7] = v1;
  v0[8] = v3;
  if (v1)
  {
    os_log_type_t v15 = (uint64_t (*)(void))((char *)v1 + *v1);
    uint64_t v4 = (void *)swift_task_alloc();
    v0[9] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_10000920C;
    return v15();
  }
  else
  {
    if (qword_100019DD0 != -1) {
      swift_once();
    }
    uint64_t v6 = v0[5];
    uint64_t v7 = sub_1000025F8(v0[3], (uint64_t)qword_10001ABA0);
    sub_100002630(v7, v6);
    uint64_t v8 = type metadata accessor for Logger();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) == 1)
    {
      sub_10000749C(v0[5], &qword_100019DE0);
    }
    else
    {
      os_log_type_t v10 = Logger.logObject.getter();
      os_log_type_t v11 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "BSAction button can't continue, ignore", v12, 2u);
        swift_slowDealloc();
      }
      uint64_t v13 = v0[5];

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v8);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
    return v14();
  }
}

uint64_t sub_10000920C(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_100009668;
  }
  else
  {
    *(unsigned char *)(v4 + 88) = a1 & 1;
    uint64_t v5 = sub_100009338;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100009338()
{
  if (*(unsigned char *)(v0 + 88) == 1)
  {
    if (qword_100019DD0 != -1) {
      swift_once();
    }
    uint64_t v1 = *(void *)(v0 + 48);
    uint64_t v2 = sub_1000025F8(*(void *)(v0 + 24), (uint64_t)qword_10001ABA0);
    sub_100002630(v2, v1);
    uint64_t v3 = type metadata accessor for Logger();
    uint64_t v4 = *(void *)(v3 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, 1, v3) == 1)
    {
      uint64_t v5 = *(void *)(v0 + 48);
      sub_10000B944(*(void *)(v0 + 56));
      sub_10000749C(v5, &qword_100019DE0);
      goto LABEL_17;
    }
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "BSAction button handling success, proceed ", v10, 2u);
      swift_slowDealloc();
    }
    uint64_t v11 = *(void *)(v0 + 48);
    sub_10000B944(*(void *)(v0 + 56));
  }
  else
  {
    sub_10000B944(*(void *)(v0 + 56));
    if (qword_100019DD0 != -1) {
      swift_once();
    }
    uint64_t v6 = *(void *)(v0 + 40);
    uint64_t v7 = sub_1000025F8(*(void *)(v0 + 24), (uint64_t)qword_10001ABA0);
    sub_100002630(v7, v6);
    uint64_t v3 = type metadata accessor for Logger();
    uint64_t v4 = *(void *)(v3 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v3) == 1)
    {
      sub_10000749C(*(void *)(v0 + 40), &qword_100019DE0);
      goto LABEL_17;
    }
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v12, "BSAction button can't continue, ignore", v13, 2u);
      swift_slowDealloc();
    }
    uint64_t v11 = *(void *)(v0 + 40);
  }

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v11, v3);
LABEL_17:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_100009668()
{
  sub_10000B944(v0[7]);
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[4];
  uint64_t v2 = sub_1000025F8(v0[3], (uint64_t)qword_10001ABA0);
  sub_100002630(v2, v1);
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, 1, v3);
  uint64_t v6 = v0[4];
  if (v5 == 1)
  {
    swift_errorRelease();
    sub_10000749C(v6, &qword_100019DE0);
  }
  else
  {
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      log = v7;
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v9 = 138412290;
      swift_errorRetain();
      uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
      v0[2] = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v13 = v10;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, log, v8, "BSAction button handling failed, do not proceed, thrown %@", v9, 0xCu);
      sub_1000025B4(&qword_100019FE0);
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
    (*(void (**)(void, uint64_t))(v4 + 8))(v0[4], v3);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

id sub_100009980()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for TapUISceneActionHandler()
{
  return self;
}

unint64_t sub_1000099EC()
{
  unint64_t result = qword_10001A330;
  if (!qword_10001A330)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001A330);
  }
  return result;
}

unint64_t sub_100009A2C()
{
  unint64_t result = qword_10001A338;
  if (!qword_10001A338)
  {
    sub_1000099EC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A338);
  }
  return result;
}

uint64_t sub_100009A84(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100009B60;
  return v6(a1);
}

uint64_t sub_100009B60()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100009C58(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1000099EC();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100009ED8(v7, result + 1);
    id v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_10000A0C0();
      unint64_t v23 = v28;
    }
    else
    {
      unint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_10000A360((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = NSObject._rawHashValue(seed:)(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_1000099EC();
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = static NSObject.== infix(_:_:)();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_10000A3E4((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_100009ED8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_1000025B4(&qword_10001A340);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      sub_1000099EC();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_10000A0C0();
          uint64_t v2 = v14;
        }
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (__CocoaSet.Iterator.next()());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_10000A0C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000025B4(&qword_10001A340);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    id v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_10000A360(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_10000A3E4(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_10000A0C0();
  }
  else
  {
    if (v7 > v6)
    {
      sub_10000A55C();
      goto LABEL_14;
    }
    sub_10000A708();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_1000099EC();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = static NSObject.== infix(_:_:)();

    if (v12)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = static NSObject.== infix(_:_:)();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_10000A55C()
{
  uint64_t v1 = v0;
  sub_1000025B4(&qword_10001A340);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000A708()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000025B4(&qword_10001A340);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  id v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = NSObject._rawHashValue(seed:)(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10000A984(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000025B4(&qword_10001A348);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000025B4(&qword_100019DE0);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  unint64_t v13 = (char *)v50 - v12;
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)v50 - v14;
  self;
  uint64_t v16 = swift_dynamicCastObjCClass();
  if (v16)
  {
    uint64_t v17 = v16;
    if (qword_100019DD0 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1000025F8(v7, (uint64_t)qword_10001ABA0);
    sub_100002630(v18, (uint64_t)v15);
    uint64_t v19 = type metadata accessor for Logger();
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v15, 1, v19) == 1)
    {
      sub_10000749C((uint64_t)v15, &qword_100019DE0);
    }
    else
    {
      id v28 = Logger.logObject.getter();
      os_log_type_t v29 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "BSAction: SBUIBackgroundActivityAction received", v30, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v20 + 8))(v15, v19);
    }
    uint64_t v31 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v6, 1, 1, v31);
    uint64_t v32 = (void *)swift_allocObject();
    v32[2] = 0;
    v32[3] = 0;
    v32[4] = v17;
    id v33 = a1;
    sub_100008D00((uint64_t)v6, (uint64_t)&unk_10001A368, (uint64_t)v32);
    swift_release();
LABEL_27:
    id v48 = *(void **)(v2 + OBJC_IVAR____TtC22ProximityReaderSceneUI23TapUISceneActionHandler_action);
    *(void *)(v2 + OBJC_IVAR____TtC22ProximityReaderSceneUI23TapUISceneActionHandler_action) = a1;
    id v49 = a1;

    sub_100007E88();
    return 1;
  }
  self;
  uint64_t v21 = swift_dynamicCastObjCClass();
  uint64_t v22 = qword_100019DD0;
  if (v21)
  {
    unint64_t v23 = (void *)v21;
    id v24 = a1;
    if (v22 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1000025F8(v7, (uint64_t)qword_10001ABA0);
    sub_100002630(v25, (uint64_t)v13);
    uint64_t v26 = type metadata accessor for Logger();
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v13, 1, v26) == 1)
    {
      sub_10000749C((uint64_t)v13, &qword_100019DE0);
    }
    else
    {
      id v38 = v24;
      uint64_t v39 = Logger.logObject.getter();
      os_log_type_t v40 = static os_log_type_t.default.getter();
      int v53 = v40;
      if (os_log_type_enabled(v39, v40))
      {
        BOOL v41 = (uint8_t *)swift_slowAlloc();
        id v51 = v38;
        os_log_type_t v42 = v41;
        id v52 = v24;
        *(_DWORD *)BOOL v41 = 134217984;
        v50[1] = v41 + 4;
        id v54 = [v23 buttonEvents];
        id v24 = v52;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        _os_log_impl((void *)&_mh_execute_header, v39, (os_log_type_t)v53, "BSAction: SBUIButtonAction received, %lu", v42, 0xCu);
        swift_slowDealloc();
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v26);
    }
    uint64_t v46 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v6, 1, 1, v46);
    uint64_t v47 = swift_allocObject();
    *(void *)(v47 + 16) = 0;
    *(void *)(v47 + 24) = 0;
    sub_100008D00((uint64_t)v6, (uint64_t)&unk_10001A358, v47);
    swift_release();

    goto LABEL_27;
  }
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_1000025F8(v7, (uint64_t)qword_10001ABA0);
  sub_100002630(v34, (uint64_t)v10);
  uint64_t v35 = type metadata accessor for Logger();
  uint64_t v36 = *(void *)(v35 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v10, 1, v35) == 1)
  {
    sub_10000749C((uint64_t)v10, &qword_100019DE0);
    return 0;
  }
  else
  {
    unint64_t v43 = Logger.logObject.getter();
    os_log_type_t v44 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v43, v44))
    {
      int64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Unknown action", v45, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v35);
    return 0;
  }
}

id sub_10000B060(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v6);
  uint64_t v8 = (uint64_t)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1) {
LABEL_42:
  }
    swift_once();
  uint64_t v9 = sub_1000025F8(v6, (uint64_t)qword_10001ABA0);
  sub_100002630(v9, v8);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_10000749C(v8, &qword_100019DE0);
  }
  else
  {
    swift_bridgeObjectRetain_n();
    id v12 = (id)a2;
    id v13 = a3;
    id v14 = v12;
    id v15 = v13;
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    a2 = v17;
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      LODWORD(v47) = a2;
      a2 = v18;
      int64_t v45 = (void *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      v53[0] = v48;
      *(_DWORD *)a2 = 136315650;
      id v44 = v15;
      sub_1000099EC();
      sub_100009A2C();
      uint64_t v46 = v11;
      swift_bridgeObjectRetain();
      uint64_t v19 = Set.description.getter();
      unint64_t v21 = v20;
      swift_bridgeObjectRelease();
      id v52 = (id)sub_10000E014(v19, v21, v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      os_log_t v43 = v16;
      *(_WORD *)(a2 + 12) = 2112;
      id v52 = v14;
      uint64_t v22 = v10;
      id v23 = v14;
      id v24 = v14;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v25 = v45;
      void *v45 = v23;
      uint64_t v10 = v22;

      *(_WORD *)(a2 + 22) = 2112;
      id v52 = v44;
      id v26 = v44;
      id v27 = v44;
      uint64_t v11 = v46;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v25[1] = v26;

      os_log_t v28 = v43;
      _os_log_impl((void *)&_mh_execute_header, v43, (os_log_type_t)v47, "TapUISceneActionHandler:  Responding to BSActions:%s, for fbsScene %@ uiScene %@", (uint8_t *)a2, 0x20u);
      sub_1000025B4(&qword_100019FE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v8, v10);
  }
  id v52 = &_swiftEmptySetSingleton;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_1000099EC();
    sub_100009A2C();
    Set.Iterator.init(_cocoa:)();
    a1 = v53[0];
    uint64_t v6 = v53[1];
    uint64_t v8 = v53[2];
    uint64_t v29 = v53[3];
    unint64_t v30 = v53[4];
  }
  else
  {
    uint64_t v31 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v6 = a1 + 56;
    uint64_t v8 = ~v31;
    uint64_t v32 = -v31;
    if (v32 < 64) {
      uint64_t v33 = ~(-1 << v32);
    }
    else {
      uint64_t v33 = -1;
    }
    unint64_t v30 = v33 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v29 = 0;
  }
  uint64_t v47 = v8;
  uint64_t v48 = a1 & 0x7FFFFFFFFFFFFFFFLL;
  a3 = (void *)((unint64_t)(v8 + 64) >> 6);
  while (a1 < 0)
  {
    uint64_t v36 = __CocoaSet.Iterator.next()();
    if (!v36) {
      goto LABEL_40;
    }
    uint64_t v50 = v36;
    sub_1000099EC();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v37 = v51;
    swift_unknownObjectRelease();
    a2 = v29;
    uint64_t v34 = v30;
    if (!v37) {
      goto LABEL_40;
    }
LABEL_38:
    uint64_t v8 = v49;
    if (sub_10000A984(v37))
    {
    }
    else
    {
      uint64_t v8 = (uint64_t)&v52;
      sub_100009C58(&v51, v37);
    }
    uint64_t v29 = a2;
    unint64_t v30 = v34;
  }
  if (v30)
  {
    uint64_t v34 = (v30 - 1) & v30;
    unint64_t v35 = __clz(__rbit64(v30)) | (v29 << 6);
    a2 = v29;
    goto LABEL_37;
  }
  uint64_t v38 = v29 + 1;
  if (__OFADD__(v29, 1))
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v38 >= (uint64_t)a3) {
    goto LABEL_40;
  }
  unint64_t v39 = *(void *)(v6 + 8 * v38);
  a2 = v29 + 1;
  if (v39) {
    goto LABEL_36;
  }
  a2 = v29 + 2;
  if (v29 + 2 >= (uint64_t)a3) {
    goto LABEL_40;
  }
  unint64_t v39 = *(void *)(v6 + 8 * a2);
  if (v39) {
    goto LABEL_36;
  }
  a2 = v29 + 3;
  if (v29 + 3 >= (uint64_t)a3) {
    goto LABEL_40;
  }
  unint64_t v39 = *(void *)(v6 + 8 * a2);
  if (v39) {
    goto LABEL_36;
  }
  a2 = v29 + 4;
  if (v29 + 4 >= (uint64_t)a3) {
    goto LABEL_40;
  }
  unint64_t v39 = *(void *)(v6 + 8 * a2);
  if (v39)
  {
LABEL_36:
    uint64_t v34 = (v39 - 1) & v39;
    unint64_t v35 = __clz(__rbit64(v39)) + (a2 << 6);
LABEL_37:
    id v37 = *(id *)(*(void *)(a1 + 48) + 8 * v35);
    if (!v37) {
      goto LABEL_40;
    }
    goto LABEL_38;
  }
  uint64_t v40 = v29 + 5;
  while (a3 != (void *)v40)
  {
    unint64_t v39 = *(void *)(v6 + 8 * v40++);
    if (v39)
    {
      a2 = v40 - 1;
      goto LABEL_36;
    }
  }
LABEL_40:
  sub_10000741C();
  return v52;
}

uint64_t sub_10000B678()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B6B0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000B75C;
  return sub_100008EAC();
}

uint64_t sub_10000B75C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000B850()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000B890(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10000BA44;
  return sub_100008218(a1, v4, v5, v6);
}

uint64_t sub_10000B944(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000B954()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B98C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000B75C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10001A378 + dword_10001A378);
  return v6(a1, v4);
}

void sub_10000BA48(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10000BB0C()
{
  uint64_t v0 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1000025F8(v0, (uint64_t)qword_10001ABA0);
  sub_100002630(v3, (uint64_t)v2);
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v4) == 1) {
    return sub_100002698((uint64_t)v2);
  }
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v11[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    swift_errorRetain();
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v11[1] = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(void *)v11[0] = v10;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Could not destroy scene %@", v9, 0xCu);
    sub_1000025B4(&qword_100019FE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v2, v4);
}

void sub_10000BDA0(void *a1)
{
  [a1 setDesiredHardwareButtonEvents:16];
  type metadata accessor for STBackgroundActivityIdentifier(0);
  sub_10000DA8C();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  [a1 setDesiredBackgroundActivities:isa];
}

void sub_10000BE30(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

void sub_10000BFDC(void *a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = qword_100019DD0;
  id v13 = a3;
  id v14 = a1;
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_1000025F8(v9, (uint64_t)qword_10001ABA0);
  sub_100002630(v15, (uint64_t)v11);
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v11, 1, v16) == 1)
  {
    sub_100002698((uint64_t)v11);
  }
  else
  {
    sub_100007A88((uint64_t)v14, a4, a5, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v11, v16);
  }
}

id sub_10000C204()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TapUISceneDelegate();
  [super dealloc];
}

uint64_t type metadata accessor for TapUISceneDelegate()
{
  return self;
}

void *sub_10000C2A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_1000025B4(&qword_10001A3E8);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      uint64_t v6 = *(void **)(v32 + 8 * v4);
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      Hasher.init(_seed:)();
      id v7 = v6;
      String.hash(into:)();
      Swift::Int v8 = Hasher._finalize()();
      uint64_t result = (void *)swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v17 = v16;
        if (v15 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        uint64_t result = (void *)swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v24 = v23;
          if (v22 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          uint64_t result = (void *)swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return (void *)v3;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

void sub_10000C4D8(void *a1)
{
  objc_super v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = sub_1000025B4(&qword_100019DE0);
  uint64_t v6 = __chkstk_darwin(v5);
  Swift::Int v8 = (char *)&v123 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  v133 = (char *)&v123 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  v132 = ((char *)&v123 - v12);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v123 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  v131 = (char *)&v123 - v17;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v123 - v18;
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  id v134 = (id)sub_1000025F8(v5, (uint64_t)qword_10001ABA0);
  sub_100002630((uint64_t)v134, (uint64_t)v19);
  uint64_t v20 = type metadata accessor for Logger();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(char **)(v21 + 48);
  uint64_t v136 = v20;
  int v23 = ((uint64_t (*)(char *, uint64_t))v22)(v19, 1);
  v135 = v22;
  if (v23 == 1)
  {
    sub_100002698((uint64_t)v19);
  }
  else
  {
    v130 = v15;
    v129 = a1;
    uint64_t v24 = a1;
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v127 = v8;
      char v27 = (uint8_t *)swift_slowAlloc();
      v124 = (void *)swift_slowAlloc();
      uint64_t v126 = v21;
      v125 = v27;
      *(_DWORD *)char v27 = 138412290;
      aBlock = v24;
      uint64_t v28 = v24;
      uint64_t v128 = ObjectType;
      BOOL v29 = v28;
      Swift::Int v8 = v127;
      uint64_t v21 = v126;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v124 = v24;

      uint64_t ObjectType = v128;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "TapUISceneDelegate:scene() with: %@", v125, 0xCu);
      sub_1000025B4(&qword_100019FE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v19, v136);
    uint64_t v15 = v130;
    a1 = v129;
  }
  self;
  uint64_t v30 = swift_dynamicCastObjCClass();
  if (!v30)
  {
    sub_100002630((uint64_t)v134, (uint64_t)v8);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v135)(v8, 1, v136) != 1)
    {
      long long v85 = a1;
      v86 = Logger.logObject.getter();
      os_log_type_t v87 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v86, v87))
      {
        v88 = (uint8_t *)swift_slowAlloc();
        v89 = (void *)swift_slowAlloc();
        *(_DWORD *)v88 = 138412290;
        aBlock = v85;
        v90 = v85;
        v127 = v8;
        uint64_t v91 = v21;
        v92 = v90;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v89 = v85;

        uint64_t v21 = v91;
        Swift::Int v8 = v127;
        _os_log_impl((void *)&_mh_execute_header, v86, v87, "TapUISceneDelegate:scene() Got a non UIWindowScene: %@", v88, 0xCu);
        sub_1000025B4(&qword_100019FE0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v136);
      return;
    }
    uint64_t v83 = (uint64_t)v8;
LABEL_21:
    sub_100002698(v83);
    return;
  }
  uint64_t v31 = (void *)v30;
  uint64_t v32 = qword_100019DC0;
  uint64_t v33 = a1;
  if (v32 != -1) {
    swift_once();
  }
  uint64_t v34 = *(char **)(qword_10001AB80 + OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_handle);
  if (!v34)
  {
    id v84 = v133;
    sub_100002630((uint64_t)v134, (uint64_t)v133);
    if (((unsigned int (*)(id, uint64_t, uint64_t))v135)(v84, 1, v136) == 1)
    {
      sub_100002698((uint64_t)v84);
    }
    else
    {
      v96 = Logger.logObject.getter();
      os_log_type_t v97 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v96, v97))
      {
        v98 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v98 = 0;
        _os_log_impl((void *)&_mh_execute_header, v96, v97, "TapUISceneDelegate:scene() Unusable scene handle = nil", v98, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(id, uint64_t))(v21 + 8))(v84, v136);
    }
    id v99 = [self sharedApplication];
    id v100 = [v31 session];
    v141 = sub_10000BB08;
    uint64_t v142 = 0;
    aBlock = _NSConcreteStackBlock;
    uint64_t v138 = 1107296256;
    v139 = sub_10000BA48;
    v140 = &unk_100014CF0;
    v101 = _Block_copy(&aBlock);
    [v99 requestSceneSessionDestruction:v100 options:0 errorHandler:v101];
    _Block_release(v101);

    goto LABEL_46;
  }
  uint64_t v128 = ObjectType;
  unint64_t v35 = *(void **)&v34[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_readerServiceEndpoint];
  if (!v35)
  {
    v93 = v132;
    sub_100002630((uint64_t)v134, (uint64_t)v132);
    unsigned int v94 = ((uint64_t (*)(NSObject *, uint64_t, uint64_t))v135)(v93, 1, v136);
    v95 = v34;
    if (v94 == 1)
    {
      sub_100002698((uint64_t)v93);
    }
    else
    {
      v106 = Logger.logObject.getter();
      os_log_type_t v107 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v106, v107))
      {
        v108 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v108 = 0;
        _os_log_impl((void *)&_mh_execute_header, v106, v107, "TapUISceneDelegate:scene() Unusable scene endpoint = nil", v108, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(NSObject *, uint64_t))(v21 + 8))(v93, v136);
    }
    id v99 = [self sharedApplication];
    id v100 = [v31 session];
    v141 = sub_10000BB08;
    uint64_t v142 = 0;
    aBlock = _NSConcreteStackBlock;
    uint64_t v138 = 1107296256;
    v139 = sub_10000BA48;
    v140 = &unk_100014D18;
    v109 = _Block_copy(&aBlock);
    [v99 requestSceneSessionDestruction:v100 options:0 errorHandler:v109];
    _Block_release(v109);

    goto LABEL_46;
  }
  uint64_t v36 = *(void **)&v34[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_userInfo];
  if (!v36)
  {
    sub_100002630((uint64_t)v134, (uint64_t)v15);
    unsigned int v102 = ((uint64_t (*)(char *, uint64_t, uint64_t))v135)(v15, 1, v136);
    v103 = v34;
    id v104 = v35;
    if (v102 == 1)
    {
      sub_100002698((uint64_t)v15);
    }
    else
    {
      v110 = Logger.logObject.getter();
      os_log_type_t v111 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v110, v111))
      {
        v112 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v112 = 0;
        _os_log_impl((void *)&_mh_execute_header, v110, v111, "TapUISceneDelegate:scene() Unusable scene userInfo = nil", v112, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v136);
    }
    id v99 = [self sharedApplication];
    id v100 = [v31 session];
    v141 = sub_10000BB08;
    uint64_t v142 = 0;
    aBlock = _NSConcreteStackBlock;
    uint64_t v138 = 1107296256;
    v139 = sub_10000BA48;
    v140 = &unk_100014D40;
    v113 = _Block_copy(&aBlock);
    [v99 requestSceneSessionDestruction:v100 options:0 errorHandler:v113];
    _Block_release(v113);

LABEL_46:
    return;
  }
  id v37 = v34;
  id v38 = v35;
  swift_bridgeObjectRetain();
  if (!sub_100006D04(v31))
  {
    swift_bridgeObjectRelease();
    uint64_t v105 = (uint64_t)v131;
    sub_100002630((uint64_t)v134, (uint64_t)v131);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v135)(v105, 1, v136) != 1)
    {
      v114 = v33;
      v115 = Logger.logObject.getter();
      os_log_type_t v116 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v115, v116))
      {
        v132 = v115;
        uint64_t v117 = swift_slowAlloc();
        v133 = v114;
        v118 = (uint8_t *)v117;
        uint64_t v119 = swift_slowAlloc();
        id v134 = v38;
        v120 = (void *)v119;
        v135 = v37;
        *(_DWORD *)v118 = 138412290;
        aBlock = (void **)v31;
        v121 = v133;
        v122 = v135;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v120 = v31;

        v115 = v132;
        _os_log_impl((void *)&_mh_execute_header, v132, v116, "TapUISceneDelegate:scene() Duplicate scene: %@", v118, 0xCu);
        sub_1000025B4(&qword_100019FE0);
        swift_arrayDestroy();
        id v38 = v134;
        swift_slowDealloc();
        v114 = v133;
        uint64_t v105 = (uint64_t)v131;
        swift_slowDealloc();
      }
      else
      {

        v122 = v114;
      }

      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v105, v136);
      return;
    }

    uint64_t v83 = v105;
    goto LABEL_21;
  }
  v129 = v36;
  v135 = v37;
  id v134 = v38;
  v130 = v2;
  v131 = v33;
  v127 = (char *)[objc_allocWithZone((Class)UIWindow) initWithWindowScene:v31];
  sub_1000025B4(&qword_10001A3C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000FD40;
  uint64_t v40 = (void *)STBackgroundActivityIdentifierInCall;
  *(void *)(inited + 32) = STBackgroundActivityIdentifierInCall;
  uint64_t v136 = inited + 32;
  BOOL v41 = (void *)STBackgroundActivityIdentifierInVideoConference;
  uint64_t v42 = (void *)STBackgroundActivityIdentifierCallRinging;
  *(void *)(inited + 40) = STBackgroundActivityIdentifierInVideoConference;
  *(void *)(inited + 48) = v42;
  os_log_t v43 = (void *)STBackgroundActivityIdentifierVideoConferenceRinging;
  id v44 = (void *)STBackgroundActivityIdentifierSharePlay;
  *(void *)(inited + 56) = STBackgroundActivityIdentifierVideoConferenceRinging;
  *(void *)(inited + 64) = v44;
  int64_t v45 = (void *)STBackgroundActivityIdentifierSharePlayInactive;
  uint64_t v46 = (void *)STBackgroundActivityIdentifierActivePushToTalkCall;
  *(void *)(inited + 72) = STBackgroundActivityIdentifierSharePlayInactive;
  *(void *)(inited + 80) = v46;
  uint64_t v47 = (void *)STBackgroundActivityIdentifierIdlePushToTalkCall;
  uint64_t v48 = (void *)STBackgroundActivityIdentifierCallHandoff;
  *(void *)(inited + 88) = STBackgroundActivityIdentifierIdlePushToTalkCall;
  *(void *)(inited + 96) = v48;
  v132 = STBackgroundActivityIdentifierCallScreening;
  uint64_t v49 = STBackgroundActivityIdentifierVideoConferenceHandoff;
  v133 = (char *)STBackgroundActivityIdentifierVideoConferenceHandoff;
  *(void *)(inited + 104) = STBackgroundActivityIdentifierCallScreening;
  *(void *)(inited + 112) = v49;
  id v50 = v40;
  id v51 = v41;
  id v52 = v42;
  id v53 = v43;
  id v54 = v44;
  id v55 = v45;
  id v56 = v46;
  id v57 = v47;
  id v58 = v48;
  v59 = v132;
  v60 = v133;
  uint64_t v61 = sub_10000C2A8(inited);
  swift_setDeallocating();
  type metadata accessor for STBackgroundActivityIdentifier(0);
  swift_arrayDestroy();
  id v62 = [v31 _FBSScene];
  uint64_t v63 = swift_allocObject();
  *(void *)(v63 + 16) = v61;
  uint64_t v64 = swift_allocObject();
  *(void *)(v64 + 16) = sub_10000DA74;
  *(void *)(v64 + 24) = v63;
  v141 = sub_100003BDC;
  uint64_t v142 = v64;
  aBlock = _NSConcreteStackBlock;
  uint64_t v138 = 1107296256;
  v139 = sub_10000BE30;
  v140 = &unk_100014DB8;
  uint64_t v65 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v62 updateClientSettingsWithBlock:v65];

  _Block_release(v65);
  LOBYTE(v62) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v62)
  {
    __break(1u);
  }
  else
  {
    sub_1000025B4(&qword_10001A3D0);
    uint64_t v66 = swift_allocObject();
    *(_OWORD *)(v66 + 16) = xmmword_10000FD50;
    v67 = v130;
    uint64_t v68 = *(void **)&v130[OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_actionHandler];
    *(void *)(v66 + 32) = v68;
    aBlock = (void **)v66;
    specialized Array._endMutation()();
    id v69 = v68;
    sub_1000025B4(&qword_10001A3D8);
    v70.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    uint64_t v72 = NSStringFromClass(ObjCClassFromMetadata);
    uint64_t v73 = v131;
    v74 = v135;
    if (v72)
    {
      uint64_t v75 = v72;
      [v31 _registerBSActionResponderArray:v70.super.isa forKey:v72];

      type metadata accessor for TapRemoteSceneController();
      id v76 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
      uint64_t v77 = v74;
      uint64_t v78 = v134;
      dispatch thunk of TapRemoteSceneController.setup(scene:userInfo:endpoint:handle:)();

      swift_bridgeObjectRelease();
      uint64_t v79 = v127;
      [v127 setRootViewController:v76];
      [v79 setContentsPosition:0];
      uint64_t v80 = OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window;
      v81 = *(void **)&v67[OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window];
      *(void *)&v67[OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window] = v79;
      uint64_t v82 = v79;

      [*(id *)&v67[v80] setRootViewController:v76];
      [v82 makeKeyAndVisible];
      swift_release();

      return;
    }
  }
  __break(1u);
}

void sub_10000D678()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000025B4(&qword_100019DE0);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  Swift::Int v8 = (char *)&v24 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v24 - v9;
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1000025F8(v2, (uint64_t)qword_10001ABA0);
  sub_100002630(v11, (uint64_t)v10);
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v14(v10, 1, v12) == 1)
  {
    sub_100002698((uint64_t)v10);
  }
  else
  {
    sub_100007A88(v1, 0xD000000000000016, 0x8000000100012E00, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
  }
  uint64_t v15 = *(void **)(v1 + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window);
  if (v15)
  {
    id v16 = [v15 rootViewController];
    if (v16)
    {
      uint64_t v17 = v16;
      type metadata accessor for TapRemoteSceneController();
      if (swift_dynamicCastClass())
      {
        sub_100002630(v11, (uint64_t)v8);
        if (v14(v8, 1, v12) == 1)
        {
          sub_100002698((uint64_t)v8);
        }
        else
        {
          uint64_t v21 = Logger.logObject.getter();
          os_log_type_t v22 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v21, v22))
          {
            int v23 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)int v23 = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, v22, "TapUISceneDelegate:scene() didDisconnect: CLEANUP!!!", v23, 2u);
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v12);
        }
        dispatch thunk of TapRemoteSceneController.disconnected()();

        return;
      }
    }
  }
  sub_100002630(v11, (uint64_t)v5);
  if (v14(v5, 1, v12) == 1)
  {
    sub_100002698((uint64_t)v5);
  }
  else
  {
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "TapUISceneDelegate:scene() didDisconnect: cannot get root controller", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v5, v12);
  }
}

uint64_t sub_10000DA24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000DA34()
{
  return swift_release();
}

uint64_t sub_10000DA3C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000DA74(void *a1)
{
}

uint64_t sub_10000DA7C()
{
  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10000DA8C()
{
  unint64_t result = qword_10001A3E0;
  if (!qword_10001A3E0)
  {
    type metadata accessor for STBackgroundActivityIdentifier(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A3E0);
  }
  return result;
}

id sub_10000DBD0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProximityReaderSceneUIAppDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for ProximityReaderSceneUIAppDelegate()
{
  return self;
}

id sub_10000DC28(void *a1)
{
  uint64_t v2 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000025F8(v2, (uint64_t)qword_10001ABA0);
  sub_100002630(v5, (uint64_t)v4);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) == 1)
  {
    sub_100002698((uint64_t)v4);
  }
  else
  {
    Swift::Int v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "ProximityReaderSceneUIApplicationDelegate: SBUIProximityReader Configuration", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }
  id v11 = [a1 role];
  id v12 = objc_allocWithZone((Class)UISceneConfiguration);
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = [v12 initWithName:v13 sessionRole:v11];

  return v14;
}

id sub_10000DFAC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DefaultSceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for DefaultSceneDelegate()
{
  return self;
}

uint64_t sub_10000E014(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000E0E8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007544((uint64_t)v12, *a3);
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
      sub_100007544((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000EC34((uint64_t)v12);
  return v7;
}

uint64_t sub_10000E0E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000E2A4(a5, a6);
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

uint64_t sub_10000E2A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000E33C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000E51C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000E51C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000E33C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000E4B4(v2, 0);
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

void *sub_10000E4B4(uint64_t a1, uint64_t a2)
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
  sub_1000025B4((uint64_t *)&unk_10001A570);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000E51C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000025B4((uint64_t *)&unk_10001A570);
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
  NSString v13 = a4 + 32;
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

void sub_10000E66C(void *a1, void *a2)
{
  uint64_t v4 = sub_1000025B4(&qword_100019DE0);
  uint64_t v5 = __chkstk_darwin(v4);
  int64_t v7 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  int64_t v9 = (char *)v44 - v8;
  if (qword_100019DC8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1000025F8(v4, (uint64_t)qword_10001AB88);
  sub_100002630(v10, (uint64_t)v9);
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  NSString v13 = *(unsigned int (**)(void, void, void))(v12 + 48);
  if (v13(v9, 1, v11) == 1)
  {
    sub_100002698((uint64_t)v9);
  }
  else
  {
    id v50 = v13;
    id v51 = a1;
    id v14 = a2;
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v49 = v7;
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v54 = v47;
      uint64_t v46 = v17;
      *(_DWORD *)uint64_t v17 = 136315138;
      v44[1] = v17 + 4;
      id v18 = [v14 role];
      os_log_t v45 = v15;
      uint64_t v19 = v12;
      id v20 = v18;
      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v48 = v11;
      unint64_t v23 = v22;

      uint64_t v12 = v19;
      uint64_t v24 = v21;
      int64_t v7 = v49;
      uint64_t v53 = sub_10000E014(v24, v23, &v54);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      uint64_t v11 = v48;
      swift_bridgeObjectRelease();
      os_log_t v25 = v45;
      _os_log_impl((void *)&_mh_execute_header, v45, v16, "DefaultSceneDelegate: Scene will connect called with role: %s", v46, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    NSString v13 = v50;
    a1 = v51;
  }
  self;
  uint64_t v26 = swift_dynamicCastObjCClass();
  if (v26)
  {
    uint64_t v27 = v26;
    id v28 = objc_allocWithZone((Class)UIWindow);
    id v29 = a1;
    id v30 = [v28 initWithWindowScene:v27];
    id v31 = [objc_allocWithZone((Class)UIViewController) init];
    id v32 = [v31 view];
    if (v32)
    {
      uint64_t v33 = v32;
      id v34 = [self redColor];
      [v33 setBackgroundColor:v34];

      [v30 setRootViewController:v31];
      [v30 makeKeyAndVisible];
      unint64_t v35 = *(void **)(v52 + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window);
      *(void *)(v52 + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window) = v30;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_100019DD0 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_1000025F8(v4, (uint64_t)qword_10001ABA0);
    sub_100002630(v36, (uint64_t)v7);
    if (v13(v7, 1, v11) == 1)
    {
      sub_100002698((uint64_t)v7);
    }
    else
    {
      uint64_t v52 = v12;
      id v37 = a1;
      id v38 = Logger.logObject.getter();
      os_log_type_t v39 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = swift_slowAlloc();
        uint64_t v49 = v7;
        BOOL v41 = (uint8_t *)v40;
        uint64_t v42 = (void *)swift_slowAlloc();
        *(_DWORD *)BOOL v41 = 138412290;
        uint64_t v54 = (uint64_t)v37;
        id v43 = v37;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v42 = v37;

        _os_log_impl((void *)&_mh_execute_header, v38, v39, "DefaultSceneDelegate: Got a non UIWindowScene: %@", v41, 0xCu);
        sub_1000025B4(&qword_100019FE0);
        swift_arrayDestroy();
        swift_slowDealloc();
        int64_t v7 = v49;
        swift_slowDealloc();
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v52 + 8))(v7, v11);
    }
  }
}

uint64_t sub_10000EC34(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t XPCUserInfoKey.rawValue.getter()
{
  return XPCUserInfoKey.rawValue.getter();
}

uint64_t type metadata accessor for XPCUserInfoKey()
{
  return type metadata accessor for XPCUserInfoKey();
}

uint64_t UIMode.rawValue.getter()
{
  return UIMode.rawValue.getter();
}

uint64_t dispatch thunk of AppManager.callHandler.getter()
{
  return dispatch thunk of AppManager.callHandler.getter();
}

uint64_t dispatch thunk of AppManager.homeButtonHandler.getter()
{
  return dispatch thunk of AppManager.homeButtonHandler.getter();
}

uint64_t static AppManager.shared.getter()
{
  return static AppManager.shared.getter();
}

uint64_t type metadata accessor for AppManager()
{
  return type metadata accessor for AppManager();
}

uint64_t dispatch thunk of TapRemoteSceneController.disconnected()()
{
  return dispatch thunk of TapRemoteSceneController.disconnected()();
}

uint64_t dispatch thunk of TapRemoteSceneController.setup(scene:userInfo:endpoint:handle:)()
{
  return dispatch thunk of TapRemoteSceneController.setup(scene:userInfo:endpoint:handle:)();
}

uint64_t type metadata accessor for TapRemoteSceneController()
{
  return type metadata accessor for TapRemoteSceneController();
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

uint64_t UISceneSessionActivationRequest.init(role:userActivity:options:)()
{
  return UISceneSessionActivationRequest.init(role:userActivity:options:)();
}

uint64_t type metadata accessor for UISceneSessionActivationRequest()
{
  return type metadata accessor for UISceneSessionActivationRequest();
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

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t ObjectIdentifier.debugDescription.getter()
{
  return ObjectIdentifier.debugDescription.getter();
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

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
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

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
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

uint64_t UIApplication.activateSceneSession(for:errorHandler:)()
{
  return UIApplication.activateSceneSession(for:errorHandler:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
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

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
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

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
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

uint64_t MCGestaltIsInternalBuild()
{
  return _MCGestaltIsInternalBuild();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
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