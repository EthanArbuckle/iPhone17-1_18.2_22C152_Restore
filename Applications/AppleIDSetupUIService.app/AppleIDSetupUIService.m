uint64_t sub_1000029C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  v0 = type metadata accessor for Logger();
  sub_100004AF4(v0, qword_100016A48);
  v1 = sub_100004ABC(v0, (uint64_t)qword_100016A48);
  if (qword_100016A80 != -1) {
    swift_once();
  }
  v2 = sub_100004ABC(v0, (uint64_t)static AISLogger.uiService);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_100002BB8(void *a1, void (*a2)(void), void *a3)
{
  uint64_t v7 = sub_100004974((uint64_t *)&unk_100017070);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PresentationRequest();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  id v14 = [a1 userInfo];
  if (v14)
  {
    v15 = v14;
    id v48 = a3;
    uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    sub_100006154(v16, (uint64_t)v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      sub_100004E90((uint64_t)v9, (uint64_t *)&unk_100017070);
      if (qword_100016A80 != -1) {
        swift_once();
      }
      uint64_t v17 = type metadata accessor for Logger();
      sub_100004ABC(v17, (uint64_t)static AISLogger.uiService);
      swift_bridgeObjectRetain();
      v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v49 = swift_slowAlloc();
        *(_DWORD *)v20 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v21 = Dictionary.description.getter();
        unint64_t v23 = v22;
        swift_bridgeObjectRelease();
        v50[2] = sub_100009B70(v21, v23, &v49);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Unable to build presentation request with user info: %s", v20, 0xCu);
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
    sub_100004EEC((uint64_t)v9, (uint64_t)v13);
    if (qword_100016A80 != -1) {
      swift_once();
    }
    uint64_t v30 = type metadata accessor for Logger();
    sub_100004ABC(v30, (uint64_t)static AISLogger.uiService);
    id v31 = v3;
    id v32 = a1;
    v33 = v31;
    id v34 = v32;
    v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.default.getter();
    int v37 = v36;
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v38 = swift_slowAlloc();
      v39 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 138412546;
      v47 = a2;
      int v46 = v37;
      uint64_t v49 = (uint64_t)v33;
      v45[1] = v38 + 12;
      v45[2] = v50;
      v40 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v39 = v33;

      *(_WORD *)(v38 + 12) = 2112;
      uint64_t v49 = (uint64_t)v34;
      id v41 = v34;
      a2 = v47;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v39[1] = a1;

      _os_log_impl((void *)&_mh_execute_header, v35, (os_log_type_t)v46, "Configuring remote alert (%@) with context: %@", (uint8_t *)v38, 0x16u);
      sub_100004974(&qword_100016B78);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v35 = v33;
    }

    uint64_t v43 = (uint64_t)v33 + OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_presentationRequest;
    swift_beginAccess();
    sub_100004F50((uint64_t)v13, v43);
    uint64_t v44 = swift_endAccess();
    if (a2)
    {
      a2(v44);
      sub_1000049C8((uint64_t)v13);
      return;
    }
LABEL_24:
    __break(1u);
    return;
  }
  if (qword_100016A80 != -1) {
    swift_once();
  }
  uint64_t v24 = type metadata accessor for Logger();
  sub_100004ABC(v24, (uint64_t)static AISLogger.uiService);
  id v48 = a1;
  v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = (void *)swift_slowAlloc();
    *(_DWORD *)v27 = 138412290;
    uint64_t v49 = (uint64_t)v48;
    id v29 = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v28 = a1;

    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Could not find configuration context on remote alert: %@", v27, 0xCu);
    sub_100004974(&qword_100016B78);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    id v42 = v48;
  }
}

void sub_1000033A8(char a1)
{
  v14.receiver = v1;
  v14.super_class = (Class)swift_getObjectType();
  [super viewWillAppear:a1 & 1];
  uint64_t v3 = OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController;
  if (!*(void *)&v1[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController])
  {
    uint64_t v4 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v5 = (objc_class *)type metadata accessor for RemoteAlertRootViewController();
    v6 = (char *)objc_allocWithZone(v5);
    swift_unknownObjectWeakInit();
    uint64_t v7 = (uint64_t *)&v6[OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_dismissHandler];
    *uint64_t v7 = 0;
    v7[1] = 0;
    swift_unknownObjectWeakAssign();
    uint64_t v8 = *v7;
    *uint64_t v7 = (uint64_t)sub_100004E88;
    v7[1] = v4;
    swift_retain_n();
    sub_100004D44(v8);
    v13.receiver = v6;
    v13.super_class = v5;
    [super initWithNibName:0 bundle:0];
    swift_release_n();
    uint64_t v10 = *(void **)&v1[v3];
    *(void *)&v1[v3] = v9;
    id v11 = v9;

    uint64_t v12 = *(void **)&v1[v3];
    if (v12) {
      [v12 setModalPresentationStyle:0];
    }
    [v1 presentViewController:v11 animated:0 completion:0];
  }
}

void sub_10000352C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v1 = (void *)Strong;
    sub_100004B60(0);
  }
}

void sub_1000035D8(char a1)
{
  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = type metadata accessor for PresentationRequest();
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  id v11 = (char *)&v23 - v10;
  __chkstk_darwin(v9);
  objc_super v13 = (char *)&v23 - v12;
  v24.receiver = v2;
  v24.super_class = ObjectType;
  [super viewDidAppear:a1 & 1];
  if (qword_100016A80 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_100004ABC(v14, (uint64_t)static AISLogger.uiService);
  v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "SetupAlertViewController: viewDidAppear", v17, 2u);
    swift_slowDealloc();
  }

  v18 = *(void **)&v2[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController];
  if (v18)
  {
    id v19 = v18;
    id v20 = [v19 presentedViewController];

    if (v20
      || (uint64_t v21 = (uint64_t)&v2[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_presentationRequest],
          swift_beginAccess(),
          sub_100004DEC(v21, (uint64_t)v13),
          sub_100004DEC((uint64_t)v13, (uint64_t)v11),
          int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(),
          sub_1000049C8((uint64_t)v11),
          sub_1000049C8((uint64_t)v13),
          EnumCaseMultiPayload == 2))
    {
    }
    else
    {
      sub_100004DEC(v21, (uint64_t)v8);
      sub_100005230((uint64_t)v8);

      sub_1000049C8((uint64_t)v8);
    }
  }
}

id sub_100003894(char a1)
{
  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  if (qword_100016A40 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100004ABC(v5, (uint64_t)qword_100016A48);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SetupAlertViewController viewDidDisappear", v8, 2u);
    swift_slowDealloc();
  }

  uint64_t v9 = *(void **)&v2[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController];
  if (v9) {
    [v9 dismissViewControllerAnimated:0 completion:0];
  }
  v11.receiver = v2;
  v11.super_class = ObjectType;
  return [super viewDidDisappear:a1 & 1];
}

void *sub_100003A20()
{
  result = (void *)sub_1000044C8();
  if (result)
  {
    [result invalidate];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_100003B2C(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = swift_bridgeObjectRetain();
    sub_100003F2C(v3);
    uint64_t v5 = v4;
    swift_bridgeObjectRelease();

    if (v5)
    {
      if (qword_100016A80 != -1) {
        swift_once();
      }
      uint64_t v6 = type metadata accessor for Logger();
      sub_100004ABC(v6, (uint64_t)static AISLogger.uiService);
      os_log_type_t v7 = Logger.logObject.getter();
      os_log_type_t v8 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Received home button press", v9, 2u);
        swift_slowDealloc();
      }

      uint64_t v10 = OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController_homeButtonPressedWhileLocked;
      if ((*(unsigned char *)(v2
                     + OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController_homeButtonPressedWhileLocked) & 1) != 0
        || (id v11 = sub_100004440()) == 0
        || (uint64_t v12 = v11, v13 = [v11 isUnlocked], v12, (v13 & 1) != 0))
      {
        if (qword_100016A40 != -1) {
          swift_once();
        }
        sub_100004ABC(v6, (uint64_t)qword_100016A48);
        uint64_t v14 = Logger.logObject.getter();
        os_log_type_t v15 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v14, v15))
        {
          os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "Ignoring first home button press to unlock", v16, 2u);
          swift_slowDealloc();
        }

        *(unsigned char *)(v2 + v10) = 1;
      }
      else
      {
        objc_super v24 = *(void **)(v2 + OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController);
        if (v24)
        {
          [v24 dismissViewControllerAnimated:1 completion:0];
        }
      }
    }
    else
    {
      if (qword_100016A80 != -1) {
        swift_once();
      }
      uint64_t v17 = type metadata accessor for Logger();
      sub_100004ABC(v17, (uint64_t)static AISLogger.uiService);
      swift_bridgeObjectRetain_n();
      v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v18, v19))
      {
        id v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v25 = swift_slowAlloc();
        *(_DWORD *)id v20 = 136315138;
        sub_100004A24();
        sub_100004A64();
        swift_bridgeObjectRetain();
        uint64_t v21 = Set.description.getter();
        unint64_t v23 = v22;
        swift_bridgeObjectRelease();
        sub_100009B70(v21, v23, &v25);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Ignoring received button actions: %s", v20, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_100003F2C(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_100004A24();
    sub_100004A64();
    Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v18;
    uint64_t v17 = v19;
    uint64_t v2 = v20;
    uint64_t v3 = v21;
    unint64_t v4 = v22;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v17 = a1 + 56;
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
  uint64_t v16 = v2;
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    uint64_t v11 = v3;
    goto LABEL_29;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 < v8)
    {
      unint64_t v14 = *(void *)(v17 + 8 * v13);
      uint64_t v11 = v3 + 1;
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 2;
      if (v3 + 2 >= v8) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v11);
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 3;
      if (v3 + 3 >= v8) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v11);
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 4;
      if (v3 + 4 >= v8) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v11);
      if (v14)
      {
LABEL_28:
        uint64_t v9 = (v14 - 1) & v14;
        unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
LABEL_29:
        id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
        if (v12)
        {
          do
          {
            if (objc_msgSend(v12, "events", v16) == (id)16) {
              break;
            }

            uint64_t v3 = v11;
            unint64_t v4 = v9;
            if ((v1 & 0x8000000000000000) == 0) {
              goto LABEL_8;
            }
LABEL_10:
            if (!__CocoaSet.Iterator.next()()) {
              break;
            }
            sub_100004A24();
            swift_unknownObjectRetain();
            swift_dynamicCast();
            id v12 = v23;
            swift_unknownObjectRelease();
            uint64_t v11 = v3;
            uint64_t v9 = v4;
          }
          while (v23);
        }
        goto LABEL_33;
      }
      uint64_t v11 = v3 + 5;
      if (v3 + 5 < v8)
      {
        unint64_t v14 = *(void *)(v17 + 8 * v11);
        if (!v14)
        {
          uint64_t v15 = v3 + 6;
          while (v8 != v15)
          {
            unint64_t v14 = *(void *)(v17 + 8 * v15++);
            if (v14)
            {
              uint64_t v11 = v15 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_33;
        }
        goto LABEL_28;
      }
    }
LABEL_33:
    sub_100004B58();
    return;
  }
  __break(1u);
}

void sub_100004290()
{
  sub_1000049C8(v0 + OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_presentationRequest);
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController);
}

id sub_1000042D0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t sub_100004354()
{
  return type metadata accessor for SetupAlertViewController();
}

uint64_t type metadata accessor for SetupAlertViewController()
{
  uint64_t result = qword_100016AD8;
  if (!qword_100016AD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000043A8()
{
  uint64_t result = type metadata accessor for PresentationRequest();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_100004440()
{
  uint64_t v1 = OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController____lazy_storage___device;
  objc_super v2 = *(void **)(v0 + OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController____lazy_storage___device);
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v3 = [self currentDevice];
    unint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    sub_1000048FC(v4);
  }
  sub_1000049B8(v2);
  return v3;
}

uint64_t sub_1000044C8()
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
  sub_10000490C((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_100004974(&qword_100016B60);
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_100004E90((uint64_t)v4, &qword_100016AF8);
    return 0;
  }
}

void *sub_10000458C(char a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for BaseProxFlowViewController();
  [super viewDidAppear:a1 & 1];
  id v3 = (void *)sub_1000044C8();
  if (v3)
  {
    [v3 setStatusBarHidden:1 withDuration:0.3];
    swift_unknownObjectRelease();
  }
  unint64_t v4 = (void *)sub_1000044C8();
  if (v4)
  {
    [v4 setAllowsBanners:1];
    swift_unknownObjectRelease();
  }
  uint64_t result = (void *)sub_1000044C8();
  if (result)
  {
    [result setDesiredHardwareButtonEvents:16 * (SFDeviceHomeButtonType() != 3)];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

id sub_100004880()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseProxFlowViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for BaseProxFlowViewController()
{
  return self;
}

void sub_1000048E8(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *sub_1000048F0@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1000048FC(id a1)
{
  if (a1 != (id)1) {
}
  }

uint64_t sub_10000490C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004974(&qword_100016AF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004974(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id sub_1000049B8(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_1000049C8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PresentationRequest();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100004A24()
{
  unint64_t result = qword_100016B68;
  if (!qword_100016B68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100016B68);
  }
  return result;
}

unint64_t sub_100004A64()
{
  unint64_t result = qword_100016B70;
  if (!qword_100016B70)
  {
    sub_100004A24();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100016B70);
  }
  return result;
}

uint64_t sub_100004ABC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100004AF4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100004B58()
{
  return swift_release();
}

void sub_100004B60(char a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  if (qword_100016A40 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100004ABC(v5, (uint64_t)qword_100016A48);
  objc_super v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    int64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v8 = 67109120;
    LODWORD(aBlock[0]) = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SetupAlertViewController dismiss animated: %{BOOL}d", v8, 8u);
    swift_slowDealloc();
  }

  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v2;
  aBlock[4] = sub_100004DCC;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004FC8;
  aBlock[3] = &unk_1000107C8;
  unint64_t v10 = _Block_copy(aBlock);
  id v11 = v2;
  swift_release();
  v12.receiver = v11;
  v12.super_class = ObjectType;
  [super dismissViewControllerAnimated:a1 & 1 completion:v10];
  _Block_release(v10);
}

uint64_t sub_100004D44(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100004D54()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100004D8C()
{
  return sub_100004FBC(*(void *)(v0 + 16));
}

uint64_t sub_100004D94()
{
  return _swift_deallocObject(v0, 24, 7);
}

void *sub_100004DCC()
{
  return sub_100003A20();
}

uint64_t sub_100004DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100004DE4()
{
  return swift_release();
}

uint64_t sub_100004DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PresentationRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004E50()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100004E88()
{
}

uint64_t sub_100004E90(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004974(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100004EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PresentationRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004F50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PresentationRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004FBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_100004FC8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_1000050A0()
{
  id v1 = [objc_allocWithZone((Class)UIView) init];
  [v0 setView:v1];

  id v2 = [v0 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v3 = v2;
  id v4 = [self clearColor];
  [v3 setBackgroundColor:v4];

  id v5 = [v0 view];
  if (!v5)
  {
LABEL_7:
    __break(1u);
    return;
  }
  id v6 = v5;
  [v5 setClipsToBounds:0];
}

void sub_100005230(uint64_t a1)
{
  id v2 = v1;
  uint64_t v32 = type metadata accessor for PresentationRequest();
  uint64_t v4 = __chkstk_darwin(v32);
  id v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v30 - v8;
  __chkstk_darwin(v7);
  id v11 = (char *)&v30 - v10;
  if (qword_100016A80 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100004ABC(v12, (uint64_t)static AISLogger.uiService);
  sub_100004DEC(a1, (uint64_t)v11);
  int64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v31 = a1;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v30 = v6;
    uint64_t v16 = (uint8_t *)v15;
    v34[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315138;
    sub_100004DEC((uint64_t)v11, (uint64_t)v9);
    uint64_t v17 = String.init<A>(describing:)();
    uint64_t v33 = sub_100009B70(v17, v18, v34);
    a1 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_1000049C8((uint64_t)v11);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Presenting view controller in remote alert for request: %s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    id v6 = v30;
    swift_slowDealloc();
  }
  else
  {
    sub_1000049C8((uint64_t)v11);
  }

  id v19 = sub_100006318();
  v34[1] = (uint64_t)&OBJC_PROTOCOL___PRXCardContentProviding;
  uint64_t v20 = swift_dynamicCastObjCProtocolConditional();
  if (v20)
  {
    uint64_t v21 = v20;
    id v22 = v19;
    unint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Using prox card flow for remote alert presentation", v25, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    os_log_type_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Using modal UI flow for remote alert presentation", v28, 2u);
      swift_slowDealloc();
    }

    id v22 = sub_100006318();
    sub_100004DEC(a1, (uint64_t)v6);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 2) {
      sub_1000049C8((uint64_t)v6);
    }
    [v2 presentViewController:v22 animated:EnumCaseMultiPayload != 2 completion:0];
  }
}

void sub_100005634(void (*a1)(void), uint64_t a2, uint64_t a3)
{
  if (a1) {
    a1();
  }
  uint64_t v4 = *(void (**)(uint64_t))(a3
                                      + OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_dismissHandler);
  if (v4)
  {
    uint64_t v5 = swift_retain();
    v4(v5);
    sub_100004D44((uint64_t)v4);
  }
  id Strong = (id)swift_unknownObjectWeakLoadStrong();
  [Strong invalidate];
}

id sub_100005878()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for RemoteAlertRootViewController()
{
  return self;
}

uint64_t sub_100005938()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100005980()
{
  sub_100005634(*(void (**)(void))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_10000598C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000599C()
{
  return swift_release();
}

uint64_t sub_1000059A4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000059B4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000059EC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t *sub_1000059FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v7 = type metadata accessor for BLEDevice();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_100005B4C(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result <= 1)
  {
    uint64_t v3 = type metadata accessor for BLEDevice();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *sub_100005BC8(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = type metadata accessor for BLEDevice();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_100005CD4(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000049C8((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = type metadata accessor for BLEDevice();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t type metadata accessor for PresentationRequest()
{
  uint64_t result = qword_100016D80;
  if (!qword_100016D80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_100005E3C(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = type metadata accessor for BLEDevice();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_100005F48(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000049C8((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = type metadata accessor for BLEDevice();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_100006064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10000608C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1000060BC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1000060CC()
{
  uint64_t result = type metadata accessor for BLEDevice();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_100006154@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v4 = sub_100008000((uint64_t)v11), (v5 & 1) != 0))
  {
    sub_1000080F8(*(void *)(a1 + 56) + 32 * v4, (uint64_t)&v12);
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  sub_100008044((uint64_t)v11);
  if (*((void *)&v13 + 1))
  {
    sub_100004974(&qword_100016DB8);
    if (swift_dynamicCast())
    {
      sub_1000066F0(a2);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_100008098((uint64_t)&v12);
  }
  if (qword_100016A80 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100004ABC(v7, (uint64_t)static AISLogger.uiService);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Attmepting to create a new presentation request launched for sharing", v10, 2u);
    swift_slowDealloc();
  }

  return sub_100006A88(a1, a2);
}

id sub_100006318()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for BLEDevice();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v9 = type metadata accessor for PresentationRequest();
  __chkstk_darwin(v9);
  id v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004DEC(v1, (uint64_t)v11);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload != 1) {
      return [objc_allocWithZone((Class)UIViewController) init];
    }
    long long v13 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v13(v8, v11, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
    unint64_t v14 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v15 = swift_allocObject();
    v13((char *)(v15 + v14), v6, v2);
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = sub_10000827C;
    *(void *)(v16 + 24) = v15;
    id v17 = objc_allocWithZone((Class)type metadata accessor for RepairCardViewController());
    uint64_t v18 = RepairCardViewController.init(contextBuilder:reportHandler:)();
  }
  else
  {
    id v19 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v19(v8, v11, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
    unint64_t v20 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v21 = swift_allocObject();
    v19((char *)(v21 + v20), v6, v2);
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = sub_100008378;
    *(void *)(v22 + 24) = v21;
    id v23 = objc_allocWithZone((Class)type metadata accessor for SetupCardViewController());
    uint64_t v18 = SetupCardViewController.init(contextBuilder:reportHandler:)();
  }
  uint64_t v24 = v18;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  return (id)v24;
}

void sub_100006680()
{
  qword_100016CE0 = 0x6F6973726556736FLL;
  *(void *)algn_100016CE8 = 0xE90000000000006ELL;
}

void sub_1000066A8()
{
  qword_100016CF0 = 1769173874;
  *(void *)algn_100016CF8 = 0xE400000000000000;
}

void sub_1000066C4()
{
  qword_100016D00 = 0x556E6F6973736573;
  *(void *)algn_100016D08 = 0xEB00000000444955;
}

uint64_t sub_1000066F0@<X0>(uint64_t a1@<X8>)
{
  id v2 = objc_allocWithZone((Class)CBDevice);
  swift_bridgeObjectRetain();
  id v3 = sub_100007E74();
  CBDevice.into()();

  uint64_t v4 = type metadata accessor for PresentationRequest();
  swift_storeEnumTagMultiPayload();
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, 0, 1, v4);
}

uint64_t sub_100006A88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v61 = a2;
  type metadata accessor for BLEDevice.NearbyActionPayload();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = type metadata accessor for AISDeviceClass();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v7 = &v49[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v9 = &v49[-v8];
  unint64_t v62 = 0xD000000000000010;
  unint64_t v63 = 0x800000010000C2E0;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v10 = sub_100008000((uint64_t)v64), (v11 & 1) != 0))
  {
    sub_1000080F8(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v65);
  }
  else
  {
    long long v65 = 0u;
    long long v66 = 0u;
  }
  sub_100008044((uint64_t)v64);
  if (!*((void *)&v66 + 1))
  {
    sub_100008098((uint64_t)&v65);
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    if (qword_100016A80 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_100004ABC(v15, (uint64_t)static AISLogger.uiService);
    swift_bridgeObjectRetain_n();
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      v64[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v19 = Dictionary.description.getter();
      unint64_t v21 = v20;
      swift_bridgeObjectRelease();
      *(void *)&long long v65 = sub_100009B70(v19, v21, v64);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "No device identifier provided in user info: %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    goto LABEL_71;
  }
  unint64_t v12 = v63;
  unint64_t v60 = v62;
  *(void *)&long long v65 = 0xD000000000000010;
  *((void *)&v65 + 1) = 0x800000010000C300;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16))
  {
    unint64_t v13 = sub_100008000((uint64_t)v64);
    if (v14)
    {
      sub_1000080F8(*(void *)(a1 + 56) + 32 * v13, (uint64_t)&v65);
    }
    else
    {
      long long v65 = 0u;
      long long v66 = 0u;
    }
  }
  else
  {
    long long v65 = 0u;
    long long v66 = 0u;
  }
  sub_100008044((uint64_t)v64);
  if (*((void *)&v66 + 1))
  {
    if (swift_dynamicCast())
    {
      int v58 = v62;
      goto LABEL_23;
    }
  }
  else
  {
    sub_100008098((uint64_t)&v65);
  }
  int v58 = 0;
LABEL_23:
  if (qword_100016A60 != -1) {
    swift_once();
  }
  long long v65 = xmmword_100016CE0;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v22 = sub_100008000((uint64_t)v64), (v23 & 1) != 0))
  {
    sub_1000080F8(*(void *)(a1 + 56) + 32 * v22, (uint64_t)&v65);
  }
  else
  {
    long long v65 = 0u;
    long long v66 = 0u;
  }
  sub_100008044((uint64_t)v64);
  if (*((void *)&v66 + 1))
  {
    if (swift_dynamicCast())
    {
      int v57 = v62;
      goto LABEL_34;
    }
  }
  else
  {
    sub_100008098((uint64_t)&v65);
  }
  int v57 = 0;
LABEL_34:
  if (qword_100016A70 != -1) {
    swift_once();
  }
  unint64_t v62 = qword_100016D00;
  unint64_t v63 = *(void *)algn_100016D08;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v24 = sub_100008000((uint64_t)v64), (v25 & 1) != 0))
  {
    sub_1000080F8(*(void *)(a1 + 56) + 32 * v24, (uint64_t)&v65);
  }
  else
  {
    long long v65 = 0u;
    long long v66 = 0u;
  }
  sub_100008044((uint64_t)v64);
  if (*((void *)&v66 + 1))
  {
    if (swift_dynamicCast())
    {
      unint64_t v26 = v63;
      unint64_t v56 = v62;
      goto LABEL_45;
    }
  }
  else
  {
    sub_100008098((uint64_t)&v65);
  }
  unint64_t v56 = 0;
  unint64_t v26 = 0xE000000000000000;
LABEL_45:
  if (qword_100016A68 != -1) {
    swift_once();
  }
  long long v65 = xmmword_100016CF0;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v27 = sub_100008000((uint64_t)v64), (v28 & 1) != 0))
  {
    sub_1000080F8(*(void *)(a1 + 56) + 32 * v27, (uint64_t)&v65);
  }
  else
  {
    long long v65 = 0u;
    long long v66 = 0u;
  }
  sub_100008044((uint64_t)v64);
  if (*((void *)&v66 + 1))
  {
    if (swift_dynamicCast())
    {
      unint64_t v55 = v62;
      goto LABEL_56;
    }
  }
  else
  {
    sub_100008098((uint64_t)&v65);
  }
  unint64_t v55 = 0;
LABEL_56:
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v9, enum case for AISDeviceClass.appletv(_:), v3);
  if (qword_100016A80 != -1) {
    swift_once();
  }
  uint64_t v29 = type metadata accessor for Logger();
  uint64_t v30 = sub_100004ABC(v29, (uint64_t)static AISLogger.uiService);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v59 = v30;
  uint64_t v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.debug.getter();
  int v33 = v32;
  if (!os_log_type_enabled(v31, v32))
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    int v36 = v58;
    if (v58 != 43) {
      goto LABEL_60;
    }
LABEL_65:
    int v37 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v37, v40))
    {
      id v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v40, "Repairing device requesting authenticate accounts with V2", v41, 2u);
      swift_slowDealloc();
    }
    goto LABEL_67;
  }
  uint64_t v34 = swift_slowAlloc();
  v53 = v9;
  uint64_t v35 = v34;
  uint64_t v51 = swift_slowAlloc();
  v64[0] = v51;
  *(_DWORD *)uint64_t v35 = 136316162;
  uint64_t v54 = v4;
  swift_bridgeObjectRetain();
  *(void *)&long long v65 = sub_100009B70(v60, v12, v64);
  v52 = v7;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  int v50 = v33;
  *(_WORD *)(v35 + 12) = 256;
  int v36 = v58;
  LOBYTE(v65) = v58;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v35 + 15) = 256;
  LOBYTE(v65) = v57;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v35 + 18) = 2080;
  swift_bridgeObjectRetain();
  *(void *)&long long v65 = sub_100009B70(v56, v26, v64);
  uint64_t v4 = v54;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  *(_WORD *)(v35 + 28) = 2048;
  *(void *)&long long v65 = v55;
  uint64_t v7 = v52;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  _os_log_impl((void *)&_mh_execute_header, v31, (os_log_type_t)v50, "Discovered BLE peer device with info deviceId: %s nearbyActionType: %hhu osVersion: %hhu sessionId: %s rssi: %ld", (uint8_t *)v35, 0x26u);
  swift_arrayDestroy();
  swift_slowDealloc();
  uint64_t v9 = v53;
  swift_slowDealloc();

  if (v36 == 43) {
    goto LABEL_65;
  }
LABEL_60:
  if (v36 == 32)
  {
    int v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Setting up device requesting authenticate accounts with V1", v39, 2u);
      swift_slowDealloc();
    }
LABEL_67:

    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v7, v9, v3);
    BLEDevice.NearbyActionPayload.init(type:flags:deviceClass:problemFlags:)();
    uint64_t v42 = v61;
    BLEDevice.init(identifier:proximityServicePSM:nearbyActionPayload:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v9, v3);
    uint64_t v43 = type metadata accessor for PresentationRequest();
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v42, 0, 1, v43);
  }
  swift_bridgeObjectRelease();
  v45 = Logger.logObject.getter();
  os_log_type_t v46 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v47 = 0;
    _os_log_impl((void *)&_mh_execute_header, v45, v46, "Cannot service unknown nearby action type", v47, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v9, v3);
LABEL_71:
  uint64_t v48 = type metadata accessor for PresentationRequest();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v61, 1, 1, v48);
}

uint64_t sub_100007704(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SetupContext.Builder();
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v7 = __chkstk_darwin(v6);
  __chkstk_darwin(v7);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v5, a1);
  SetupContext.Builder.requireService(_:)();
  SetupContext.Builder.desireService(_:)();
  SetupContext.Builder.desireService(_:)();
  return SetupContext.Builder._proximitySetupClient(for:)();
}

void sub_100007890(uint64_t a1)
{
}

uint64_t sub_1000078C0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RepairContext.Builder();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return RepairContext.Builder._proximityRepairClient(for:)();
}

void sub_100007994(uint64_t a1)
{
}

void sub_1000079C4(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, const char *a4, const char *a5)
{
  int v37 = a5;
  uint64_t v8 = a2(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  unint64_t v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)v35 - v14;
  __chkstk_darwin(v13);
  os_log_type_t v17 = (char *)v35 - v16;
  uint64_t v18 = sub_100004974(a3);
  __chkstk_darwin(v18);
  unint64_t v20 = (char *)v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000084BC(a1, (uint64_t)v20, a3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    if (qword_100016A80 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_100004ABC(v21, (uint64_t)static AISLogger.uiService);
    swift_errorRetain();
    unint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      char v25 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v24 = 138412290;
      swift_errorRetain();
      uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v39 = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v25 = v26;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, v37, v24, 0xCu);
      sub_100004974(&qword_100016B78);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    exit(1);
  }
  int v37 = a4;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v17, v20, v8);
  uint64_t v27 = v9;
  if (qword_100016A80 != -1) {
    swift_once();
  }
  uint64_t v28 = type metadata accessor for Logger();
  sub_100004ABC(v28, (uint64_t)static AISLogger.uiService);
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v29(v15, v17, v8);
  uint64_t v30 = Logger.logObject.getter();
  os_log_type_t v31 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v30, v31))
  {
    os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v39 = v36;
    *(_DWORD *)os_log_type_t v32 = 136315138;
    v35[1] = v32 + 4;
    v29(v12, v15, v8);
    uint64_t v33 = String.init<A>(describing:)();
    uint64_t v38 = sub_100009B70(v33, v34, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v15, v8);
    _os_log_impl((void *)&_mh_execute_header, v30, v31, v37, v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
  }

  exit(1);
}

id sub_100007E74()
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

void *sub_100007F5C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

unint64_t sub_100008000(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100008154(a1, v4);
}

uint64_t sub_100008044(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008098(uint64_t a1)
{
  uint64_t v2 = sub_100004974(&qword_100016AF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000080F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100008154(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000821C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100008044((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10000821C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000827C(uint64_t a1)
{
  return sub_100008390(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1000078C0);
}

uint64_t sub_100008294()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000082CC(uint64_t a1)
{
  return sub_10000843C(a1, (uint64_t (*)(void))&type metadata accessor for RepairContext.Builder);
}

uint64_t sub_1000082E8()
{
  uint64_t v1 = type metadata accessor for BLEDevice();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100008378(uint64_t a1)
{
  return sub_100008390(a1, (uint64_t (*)(uint64_t, uint64_t))sub_100007704);
}

uint64_t sub_100008390(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for BLEDevice() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

uint64_t sub_100008424(uint64_t a1)
{
  return sub_10000843C(a1, (uint64_t (*)(void))&type metadata accessor for SetupContext.Builder);
}

uint64_t sub_10000843C(uint64_t a1, uint64_t (*a2)(void))
{
  (*(void (**)(void))(v2 + 16))();
  uint64_t v5 = a2(0);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(a1, v5);
}

uint64_t sub_1000084BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004974(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100008524()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100004AF4(v0, qword_100016DD0);
  uint64_t v1 = sub_100004ABC(v0, (uint64_t)qword_100016DD0);
  if (qword_100016A80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004ABC(v0, (uint64_t)static AISLogger.uiService);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_100008710(void *a1, uint64_t a2, void *a3, const char *a4)
{
  uint64_t v6 = qword_100016A78;
  id v12 = a3;
  id v7 = a1;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100004ABC(v8, (uint64_t)qword_100016DD0);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, a4, v11, 2u);
    swift_slowDealloc();
  }
}

id sub_100008870()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DefaultSceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for DefaultSceneDelegate()
{
  return self;
}

void sub_1000088D8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100004974(&qword_100016E18);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  os_log_type_t v10 = (char *)&v34 - v9;
  if (qword_100016A78 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_100004ABC(v11, (uint64_t)qword_100016DD0);
  id v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "DefaultSceneDelegate: sceneWillConnectTo", v14, 2u);
    swift_slowDealloc();
  }

  self;
  uint64_t v15 = swift_dynamicCastObjCClass();
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    uint64_t v39 = v8;
    id v17 = a1;
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v38 = v4;
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v41 = v36;
      id v37 = v17;
      *(_DWORD *)unint64_t v20 = 136315138;
      uint64_t v35 = v20;
      id v21 = [v16 description:v20 + 4];
      unint64_t v22 = v10;
      uint64_t v23 = v5;
      uint64_t v24 = v2;
      id v25 = v21;
      uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v28 = v27;

      uint64_t v2 = v24;
      uint64_t v5 = v23;
      os_log_type_t v10 = v22;
      uint64_t v29 = v26;
      uint64_t v4 = v38;
      uint64_t v40 = sub_100009B70(v29, v28, &v41);
      id v17 = v37;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "DefaultSceneDelegate: Received windowScene: %s. Hosting debugging UI for AirDropUI Launch Angel.", v35, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v30 = [objc_allocWithZone((Class)type metadata accessor for SecureWindow()) initWithWindowScene:v16];
    ProgressView<>.init<>()();
    id v31 = objc_allocWithZone((Class)sub_100004974((uint64_t *)&unk_100016E20));
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v39, v10, v4);
    os_log_type_t v32 = (void *)UIHostingController.init(rootView:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    [v30 setRootViewController:v32];
    [v30 makeKeyAndVisible];
    uint64_t v33 = *(void **)(v2 + OBJC_IVAR____TtC21AppleIDSetupUIService20DefaultSceneDelegate_window);
    *(void *)(v2 + OBJC_IVAR____TtC21AppleIDSetupUIService20DefaultSceneDelegate_window) = v30;
  }
}

id sub_100008D1C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  [super dealloc];
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

uint64_t sub_100008E04()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100008E48(uint64_t a1)
{
  objc_super v2 = v1;
  id v4 = objc_allocWithZone(v1);
  uint64_t v5 = sub_100009380(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)((char *)v2 + qword_100017198) - 8) + 8))(a1);
  return v5;
}

uint64_t sub_100008EC8()
{
  return 1;
}

uint64_t sub_100008ED0()
{
  return 1;
}

uint64_t sub_100008ED8()
{
  return 1;
}

void *sub_100008EE0(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_100008F24(a1, a2);
}

void *sub_100008F24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)((swift_isaMask & *v2) + qword_100017198);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(a1);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  uint64_t v7 = (void *)UIHostingController.init(coder:rootView:)();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  id v9 = v7;
  v8(a2, v4);
  if (v7) {

  }
  return v7;
}

id sub_10000905C(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecureHostingController();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id sub_1000090F4(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_10000905C(a3);
}

id sub_10000911C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureHostingController();
  return [super dealloc];
}

uint64_t type metadata accessor for SecureHostingController()
{
  return sub_100009468();
}

id sub_100009328()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureWindow();
  return [super dealloc];
}

uint64_t type metadata accessor for SecureWindow()
{
  return self;
}

uint64_t sub_100009380(uint64_t a1)
{
  __chkstk_darwin(a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - v1);
  return UIHostingController.init(rootView:)();
}

uint64_t sub_100009468()
{
  return swift_getGenericMetadata();
}

uint64_t AISLogger.uiService.unsafeMutableAddressor()
{
  if (qword_100016A80 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return sub_100004ABC(v0, (uint64_t)static AISLogger.uiService);
}

uint64_t sub_1000094FC()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100004AF4(v0, static AISLogger.uiService);
  sub_100004ABC(v0, (uint64_t)static AISLogger.uiService);
  static AISLogger.subsystem.getter();
  return Logger.init(subsystem:category:)();
}

uint64_t static AISLogger.uiService.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100016A80 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = sub_100004ABC(v2, (uint64_t)static AISLogger.uiService);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void sub_100009788(void *a1, uint64_t a2, void *a3, const char *a4)
{
  uint64_t v6 = qword_100016A80;
  id v12 = a3;
  id v7 = a1;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100004ABC(v8, (uint64_t)static AISLogger.uiService);
  id v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, a4, v11, 2u);
    swift_slowDealloc();
  }
}

id sub_100009910()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return [super dealloc];
}

uint64_t sub_100009994()
{
  return type metadata accessor for RemoteAlertSceneDelegate();
}

uint64_t type metadata accessor for RemoteAlertSceneDelegate()
{
  uint64_t result = qword_100017060;
  if (!qword_100017060) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000099E8()
{
  uint64_t result = type metadata accessor for PresentationRequest();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100009A84(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100009A94(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100009AD0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100009AF8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100009B70(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100009B70(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100009C44(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000080F8((uint64_t)v12, *a3);
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
      sub_1000080F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000AFE8((uint64_t)v12);
  return v7;
}

uint64_t sub_100009C44(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100009E00(a5, a6);
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

uint64_t sub_100009E00(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100009E98(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000A078(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000A078(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100009E98(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000A010(v2, 0);
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

void *sub_10000A010(uint64_t a1, uint64_t a2)
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
  sub_100004974((uint64_t *)&unk_100017080);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000A078(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004974((uint64_t *)&unk_100017080);
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
  os_log_type_t v13 = a4 + 32;
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

unsigned char **sub_10000A1C8(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  void *result = v4 + 1;
  return result;
}

void sub_10000A1D8(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_10000A290(uint64_t (*a1)(void))
{
  return a1();
}

void sub_10000A2B8(void *a1)
{
  uint64_t v3 = sub_100004974((uint64_t *)&unk_100017070);
  __chkstk_darwin(v3 - 8);
  size_t v5 = (char *)v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PresentationRequest();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v65 - v11;
  self;
  uint64_t v13 = swift_dynamicCastObjCClass();
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = a1;
    id v16 = [v14 configurationContext];
    if (v16)
    {
      id v17 = v16;
      id v18 = [v16 userInfo];
      if (v18)
      {
        os_log_type_t v19 = v18;
        v69 = v1;
        v70 = v15;
        uint64_t v20 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        sub_100006154(v20, (uint64_t)v5);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
        {
          sub_10000AF24((uint64_t)v5);
          if (qword_100016A80 != -1) {
            swift_once();
          }
          uint64_t v21 = type metadata accessor for Logger();
          sub_100004ABC(v21, (uint64_t)static AISLogger.uiService);
          swift_bridgeObjectRetain();
          unint64_t v22 = Logger.logObject.getter();
          os_log_type_t v23 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v22, v23))
          {
            uint64_t v24 = (uint8_t *)swift_slowAlloc();
            uint64_t v71 = swift_slowAlloc();
            *(_DWORD *)uint64_t v24 = 136315138;
            v69 = v24 + 4;
            swift_bridgeObjectRetain();
            uint64_t v25 = Dictionary.description.getter();
            unint64_t v27 = v26;
            swift_bridgeObjectRelease();
            uint64_t v74 = sub_100009B70(v25, v27, &v71);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v22, v23, "Unable to build presentation request with user info: %s", v24, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          sub_100004EEC((uint64_t)v5, (uint64_t)v12);
          if (qword_100016A80 != -1) {
            swift_once();
          }
          uint64_t v41 = type metadata accessor for Logger();
          sub_100004ABC(v41, (uint64_t)static AISLogger.uiService);
          uint64_t v42 = v70;
          id v43 = v17;
          uint64_t v44 = v42;
          id v45 = v43;
          os_log_type_t v46 = Logger.logObject.getter();
          os_log_type_t v47 = static os_log_type_t.default.getter();
          int v48 = v47;
          BOOL v49 = os_log_type_enabled(v46, v47);
          v70 = v44;
          if (v49)
          {
            uint64_t v50 = swift_slowAlloc();
            uint64_t v51 = (void *)swift_slowAlloc();
            long long v66 = v51;
            *(_DWORD *)uint64_t v50 = 138412546;
            int v68 = v48;
            v65[1] = v50 + 12;
            v65[2] = v50 + 4;
            uint64_t v71 = (uint64_t)v14;
            v67 = &v72;
            v52 = v44;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *uint64_t v51 = v14;

            *(_WORD *)(v50 + 12) = 2112;
            uint64_t v71 = (uint64_t)v45;
            id v53 = v45;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            v66[1] = v17;

            _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v68, "Configuring remote alert scene: %@ with context: %@", (uint8_t *)v50, 0x16u);
            sub_100004974(&qword_100016B78);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            os_log_type_t v46 = v44;
          }

          id v54 = [objc_allocWithZone((Class)type metadata accessor for SecureWindow()) initWithWindowScene:v14];
          unint64_t v55 = (objc_class *)type metadata accessor for RemoteAlertRootViewController();
          unint64_t v56 = (char *)objc_allocWithZone(v55);
          swift_unknownObjectWeakInit();
          int v57 = (uint64_t *)&v56[OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_dismissHandler];
          *int v57 = 0;
          v57[1] = 0;
          swift_unknownObjectWeakAssign();
          uint64_t v58 = *v57;
          *int v57 = 0;
          v57[1] = 0;
          uint64_t v59 = v70;
          sub_100004D44(v58);
          v73.receiver = v56;
          v73.super_class = v55;
          id v60 = [super initWithNibName:0 bundle:0];

          [v54 setRootViewController:v60];
          [v54 makeKeyAndVisible];
          uint64_t v61 = v69;
          unint64_t v62 = *(void **)&v69[OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window];
          *(void *)&v69[OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window] = v54;
          id v63 = v54;

          sub_100004DEC((uint64_t)v12, (uint64_t)v10);
          uint64_t v64 = (uint64_t)&v61[OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_presentationRequest];
          swift_beginAccess();
          sub_10000AF84((uint64_t)v10, v64);
          swift_endAccess();

          sub_1000049C8((uint64_t)v12);
        }
        return;
      }
    }
    if (qword_100016A80 != -1) {
      swift_once();
    }
    uint64_t v34 = type metadata accessor for Logger();
    sub_100004ABC(v34, (uint64_t)static AISLogger.uiService);
    v70 = v15;
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      id v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = (void *)swift_slowAlloc();
      *(_DWORD *)id v37 = 138412290;
      uint64_t v71 = (uint64_t)v14;
      uint64_t v39 = v70;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v38 = v14;

      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Could not find configuration context on remote alert scene: %@", v37, 0xCu);
      sub_100004974(&qword_100016B78);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
  else
  {
    if (qword_100016A80 != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    sub_100004ABC(v28, (uint64_t)static AISLogger.uiService);
    v70 = a1;
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      id v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v71 = swift_slowAlloc();
      *(_DWORD *)id v31 = 136315138;
      swift_getObjectType();
      uint64_t v32 = _typeName(_:qualified:)();
      uint64_t v74 = sub_100009B70(v32, v33, &v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Cannot configure scene, expected a remote alert scene but got a scene of type: %s", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
  uint64_t v40 = v70;
}

void sub_10000AC7C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PresentationRequest();
  uint64_t v3 = __chkstk_darwin(v2);
  size_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v22 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  if (qword_100016A80 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_100004ABC(v11, (uint64_t)static AISLogger.uiService);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "RemoteAlertSceneDelegate: sceneDidBecomeActive", v14, 2u);
    swift_slowDealloc();
  }

  uint64_t v15 = *(void **)(v1 + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window);
  if (v15)
  {
    id v16 = [v15 rootViewController];
    if (v16)
    {
      id v22 = v16;
      type metadata accessor for RemoteAlertRootViewController();
      id v17 = (void *)swift_dynamicCastClass();
      if (v17
        && (id v18 = [v17 presentedViewController],
            v18,
            !v18))
      {
        uint64_t v20 = v1 + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_presentationRequest;
        swift_beginAccess();
        sub_100004DEC(v20, (uint64_t)v10);
        sub_100004DEC((uint64_t)v10, (uint64_t)v8);
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        sub_1000049C8((uint64_t)v8);
        sub_1000049C8((uint64_t)v10);
        if (EnumCaseMultiPayload == 2)
        {
        }
        else
        {
          sub_100004DEC(v20, (uint64_t)v5);
          sub_100005230((uint64_t)v5);

          sub_1000049C8((uint64_t)v5);
        }
      }
      else
      {
        id v19 = v22;
      }
    }
  }
}

uint64_t sub_10000AF24(uint64_t a1)
{
  uint64_t v2 = sub_100004974((uint64_t *)&unk_100017070);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000AF84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PresentationRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000AFE8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000B03C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t SetupContext.Builder._proximitySetupClient(for:)()
{
  return SetupContext.Builder._proximitySetupClient(for:)();
}

uint64_t SetupContext.Builder.desireService(_:)()
{
  return SetupContext.Builder.desireService(_:)();
}

uint64_t SetupContext.Builder.requireService(_:)()
{
  return SetupContext.Builder.requireService(_:)();
}

uint64_t type metadata accessor for SetupContext.Builder()
{
  return type metadata accessor for SetupContext.Builder();
}

uint64_t RepairContext.Builder._proximityRepairClient(for:)()
{
  return RepairContext.Builder._proximityRepairClient(for:)();
}

uint64_t type metadata accessor for RepairContext.Builder()
{
  return type metadata accessor for RepairContext.Builder();
}

uint64_t type metadata accessor for AISDeviceClass()
{
  return type metadata accessor for AISDeviceClass();
}

uint64_t static AISLogger.subsystem.getter()
{
  return static AISLogger.subsystem.getter();
}

uint64_t BLEDevice.init(identifier:proximityServicePSM:nearbyActionPayload:)()
{
  return BLEDevice.init(identifier:proximityServicePSM:nearbyActionPayload:)();
}

uint64_t BLEDevice.NearbyActionPayload.init(type:flags:deviceClass:problemFlags:)()
{
  return BLEDevice.NearbyActionPayload.init(type:flags:deviceClass:problemFlags:)();
}

uint64_t type metadata accessor for BLEDevice.NearbyActionPayload()
{
  return type metadata accessor for BLEDevice.NearbyActionPayload();
}

uint64_t type metadata accessor for BLEDevice()
{
  return type metadata accessor for BLEDevice();
}

uint64_t SetupCardViewController.init(contextBuilder:reportHandler:)()
{
  return SetupCardViewController.init(contextBuilder:reportHandler:)();
}

uint64_t type metadata accessor for SetupCardViewController()
{
  return type metadata accessor for SetupCardViewController();
}

uint64_t RepairCardViewController.init(contextBuilder:reportHandler:)()
{
  return RepairCardViewController.init(contextBuilder:reportHandler:)();
}

uint64_t type metadata accessor for RepairCardViewController()
{
  return type metadata accessor for RepairCardViewController();
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

uint64_t ProgressView<>.init<>()()
{
  return ProgressView<>.init<>()();
}

uint64_t UIHostingController.init(coder:rootView:)()
{
  return UIHostingController.init(coder:rootView:)();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
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

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
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

uint64_t CBDevice.into()()
{
  return CBDevice.into()();
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

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
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

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SFDeviceHomeButtonType()
{
  return _SFDeviceHomeButtonType();
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

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
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