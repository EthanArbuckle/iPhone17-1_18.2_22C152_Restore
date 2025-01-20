void sub_1000046E0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void *v10;
  id v11;
  Swift::String v12;
  Swift::String v13;
  id v14;
  Swift::String v15;
  Swift::String v16;
  NSString v17;
  NSString v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  Swift::String v24;
  Swift::String v25;
  uint64_t v26;
  NSString v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  Swift::String v34;
  Swift::String v35;
  uint64_t v36;
  NSString v37;
  void *v38;
  id v39;
  uint64_t v40;
  void **aBlock;
  uint64_t v42;
  void (*v43)(uint64_t, void *);
  void *v44;
  void (*v45)();
  uint64_t v46;
  Swift::String v47;
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;

  v1 = v0;
  v2 = type metadata accessor for Logger();
  v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_viewAlert;
  if (!*(void *)&v1[OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_viewAlert])
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, &v1[OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_logger], v2);
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Pushing uncertified alert to stack...", v9, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v10 = self;
    v11 = [v10 mainBundle];
    v47._countAndFlagsBits = 0xD000000000000029;
    v12._countAndFlagsBits = 0xD00000000000002ELL;
    v47._object = (void *)0x8000000100013A80;
    v12._object = (void *)0x8000000100013A30;
    v13._object = (void *)0x8000000100013A60;
    v13._countAndFlagsBits = 0xD000000000000015;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v47);

    v14 = [v10 mainBundle];
    v15._countAndFlagsBits = 0xD00000000000002CLL;
    v48._countAndFlagsBits = 0xD00000000000005CLL;
    v16._countAndFlagsBits = 0xD00000000000005DLL;
    v48._object = (void *)0x8000000100013B40;
    v15._object = (void *)0x8000000100013AB0;
    v16._object = (void *)0x8000000100013AE0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v15, (Swift::String_optional)0, (NSBundle)v14, v16, v48);

    v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    v19 = [self alertControllerWithTitle:v17 message:v18 preferredStyle:1];

    v20 = *(void **)&v1[v6];
    *(void *)&v1[v6] = v19;

    v21 = *(void **)&v1[v6];
    if (v21)
    {
      v22 = v21;
      v23 = [v10 mainBundle];
      v24._countAndFlagsBits = 0xD000000000000020;
      v49._countAndFlagsBits = 0xD00000000000003ALL;
      v49._object = (void *)0x8000000100013BD0;
      v24._object = (void *)0x8000000100013BA0;
      v25._countAndFlagsBits = 0x77796E4120646441;
      v25._object = (void *)0xEA00000000007961;
      NSLocalizedString(_:tableName:bundle:value:comment:)(v24, (Swift::String_optional)0, (NSBundle)v23, v25, v49);

      v26 = swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_retain();
      v27 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      v45 = sub_10000563C;
      v46 = v26;
      aBlock = _NSConcreteStackBlock;
      v42 = 1107296256;
      v43 = sub_100008098;
      v44 = &unk_100018800;
      v28 = _Block_copy(&aBlock);
      swift_release();
      v29 = self;
      v30 = [v29 actionWithTitle:v27 style:1 handler:v28];
      _Block_release(v28);
      swift_release();

      [v22 addAction:v30];
      v31 = *(void **)&v1[v6];
      if (v31)
      {
        v32 = v31;
        v33 = [v10 mainBundle];
        v34._countAndFlagsBits = 0xD00000000000001DLL;
        v50._countAndFlagsBits = 0xD000000000000038;
        v50._object = (void *)0x8000000100013C50;
        v34._object = (void *)0x8000000100013C30;
        v35._countAndFlagsBits = 0x6C65636E6143;
        v35._object = (void *)0xE600000000000000;
        NSLocalizedString(_:tableName:bundle:value:comment:)(v34, (Swift::String_optional)0, (NSBundle)v33, v35, v50);

        v36 = swift_allocObject();
        swift_unknownObjectWeakInit();
        swift_retain();
        v37 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        v45 = sub_10000565C;
        v46 = v36;
        aBlock = _NSConcreteStackBlock;
        v42 = 1107296256;
        v43 = sub_100008098;
        v44 = &unk_100018828;
        v38 = _Block_copy(&aBlock);
        swift_release();
        v39 = [v29 actionWithTitle:v37 style:0 handler:v38];
        _Block_release(v38);
        swift_release();

        [v32 addAction:v39];
        v40 = *(void *)&v1[v6];
        if (v40)
        {
          [v1 presentViewController:v40 animated:1 completion:0];
          return;
        }
LABEL_11:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_11;
  }
}

void sub_100004D3C()
{
  sub_100005664(&qword_10001E150);
  __chkstk_darwin();
  v1 = (char *)v24 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v7 = (void *)Strong;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, Strong + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_logger, v2);

    v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Add Anyway pressed", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  swift_beginAccess();
  uint64_t v11 = swift_unknownObjectWeakLoadStrong();
  if (v11)
  {
    v12 = (void *)v11;
    sub_1000056A8(v11 + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_delegate, (uint64_t)v24);

    if (v25)
    {
      v13 = (void **)sub_100005770(v24, v25);
      v14 = *v13;
      v15 = *(void **)((char *)*v13 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_context);
      if (!v15)
      {
        __break(1u);
        return;
      }
      uint64_t v16 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v1, 1, 1, v16);
      type metadata accessor for MainActor();
      id v17 = v15;
      id v18 = v14;
      uint64_t v19 = static MainActor.shared.getter();
      v20 = (void *)swift_allocObject();
      v20[2] = v19;
      v20[3] = &protocol witness table for MainActor;
      v20[4] = v18;
      v20[5] = v17;
      sub_1000069C8((uint64_t)v1, (uint64_t)&unk_10001E160, (uint64_t)v20);

      swift_release();
      sub_10000580C((uint64_t)v24);
    }
    else
    {
      sub_100005710((uint64_t)v24);
    }
  }
  swift_beginAccess();
  v21 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v21)
  {
    v22 = v21;
    [v21 dismissViewControllerAnimated:1 completion:0];
  }
}

void sub_100005088()
{
  sub_100005664(&qword_10001E150);
  __chkstk_darwin();
  v1 = (char *)v28 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v7 = (void *)Strong;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, Strong + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_logger, v2);

    v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Cancel pressed", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  swift_beginAccess();
  uint64_t v11 = swift_unknownObjectWeakLoadStrong();
  if (v11)
  {
    v12 = (void *)v11;
    sub_1000056A8(v11 + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_delegate, (uint64_t)v28);

    if (v29)
    {
      v13 = (void **)sub_100005770(v28, v29);
      v14 = *v13;
      v15 = *(void **)((char *)*v13 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_context);
      if (!v15)
      {
        __break(1u);
        return;
      }
      id v16 = objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService());
      id v17 = v15;
      id v18 = [v16 init];
      uint64_t v19 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v1, 1, 1, v19);
      type metadata accessor for MainActor();
      id v20 = v17;
      id v21 = v14;
      id v22 = v18;
      uint64_t v23 = static MainActor.shared.getter();
      v24 = (void *)swift_allocObject();
      v24[2] = v23;
      void v24[3] = &protocol witness table for MainActor;
      v24[4] = v21;
      v24[5] = v22;
      v24[6] = v20;
      v24[7] = 0;
      sub_1000069C8((uint64_t)v1, (uint64_t)&unk_10001E1D0, (uint64_t)v24);

      swift_release();
      sub_10000580C((uint64_t)v28);
    }
    else
    {
      sub_100005710((uint64_t)v28);
    }
  }
  swift_beginAccess();
  uint64_t v25 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v25)
  {
    v26 = v25;
    [v25 dismissViewControllerAnimated:1 completion:0];
  }
}

id sub_100005444()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DKUncertifiedAlertView();
  return [super dealloc];
}

uint64_t sub_10000550C()
{
  return type metadata accessor for DKUncertifiedAlertView();
}

uint64_t type metadata accessor for DKUncertifiedAlertView()
{
  uint64_t result = qword_10001E000;
  if (!qword_10001E000) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100005560()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100005604()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000563C()
{
}

uint64_t sub_100005644(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100005654()
{
  return swift_release();
}

void sub_10000565C()
{
}

uint64_t sub_100005664(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000056A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005664((uint64_t *)&unk_10001E070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005710(uint64_t a1)
{
  uint64_t v2 = sub_100005664((uint64_t *)&unk_10001E070);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_100005770(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000057B4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10000580C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000585C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000058AC()
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
  sub_10000C0FC((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_100005664(&qword_10001E198);
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_10000B930((uint64_t)v4, &qword_10001E168);
    return 0;
  }
}

void sub_100005B0C(char a1, char *a2, void (*a3)(void))
{
  sub_100005664(&qword_10001E150);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  v15 = (char *)&v48 - v14;
  __chkstk_darwin(v13);
  id v17 = (char *)&v48 - v16;
  if (a1)
  {
    id v18 = *(void **)&a2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context];
    if (v18)
    {
      id v19 = v18;
      sub_100007170(v19);

      swift_retain();
      LOBYTE(v19) = sub_10000DE38();
      swift_release();
      if (v19)
      {
        id v20 = objc_allocWithZone((Class)type metadata accessor for DKPairingAlertView());
        uint64_t v21 = swift_retain();
        id v22 = sub_10000F104(v21);
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v17, &a2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger], v8);
        uint64_t v23 = Logger.logObject.getter();
        os_log_type_t v24 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v23, v24))
        {
          uint64_t v25 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "Showing alert...", v25, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v8);
        v26 = *(void **)&a2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard];
        if (v26)
        {
          id v27 = [v26 navigationController];
          if (v27)
          {
            v28 = v27;
            [v27 presentViewController:v22 animated:1 completion:0];
          }
        }
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v15, &a2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger], v8);
        v45 = Logger.logObject.getter();
        os_log_type_t v46 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v45, v46))
        {
          v47 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v47 = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, v46, "Bluetooth and Wi-Fi already enabled, continuing with pairing setup.", v47, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
      }
      return;
    }
    __break(1u);
LABEL_23:
    __break(1u);
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, &a2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger], v8);
  uint64_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Unable to proceed with prox card!", v31, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v32 = *(void **)&a2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context];
  if (!v32) {
    goto LABEL_23;
  }
  id v33 = objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService());
  id v34 = v32;
  id v35 = [v33 init];
  uint64_t v36 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v7, 1, 1, v36);
  type metadata accessor for MainActor();
  id v37 = v34;
  v38 = a2;
  id v39 = v35;
  uint64_t v40 = static MainActor.shared.getter();
  v41 = (void *)swift_allocObject();
  v41[2] = v40;
  v41[3] = &protocol witness table for MainActor;
  v41[4] = v38;
  v41[5] = v39;
  v41[6] = v37;
  v41[7] = 0;
  sub_1000069C8((uint64_t)v7, (uint64_t)&unk_10001E1D0, (uint64_t)v41);

  swift_release();
  if (a3) {
    a3();
  }
  v42 = (void *)sub_1000058AC();
  if (v42)
  {
    [v42 dismiss];
    swift_unknownObjectRelease();
  }
  uint64_t v43 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient;
  [*(id *)&v38[OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient] invalidate];
  v44 = *(void **)&v38[v43];
  *(void *)&v38[v43] = 0;
}

uint64_t sub_10000609C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_1000061BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[22] = a6;
  v7[23] = a7;
  v7[20] = a4;
  v7[21] = a5;
  uint64_t v8 = type metadata accessor for Logger();
  v7[24] = v8;
  v7[25] = *(void *)(v8 - 8);
  v7[26] = swift_task_alloc();
  v7[27] = swift_task_alloc();
  type metadata accessor for MainActor();
  v7[28] = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  v7[29] = v10;
  v7[30] = v9;
  return _swift_task_switch(sub_1000062C4, v10, v9);
}

id sub_1000062C4()
{
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 160);
  uint64_t v5 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger;
  *(void *)(v0 + 248) = OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(void *)(v0 + 256) = v6;
  *(void *)(v0 + 264) = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v4 + v5, v2);
  v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Canceling current pairing session...", v9, 2u);
    swift_slowDealloc();
  }
  uint64_t v10 = *(void *)(v0 + 216);
  uint64_t v11 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 200);
  uint64_t v13 = *(void **)(v0 + 176);

  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  *(void *)(v0 + 272) = v14;
  *(void *)(v0 + 280) = (v12 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v14(v10, v11);
  id result = [v13 userInfo];
  if (!result)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v16 = result;
  uint64_t v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)(v0 + 120) = 0x6E656B6F74;
  *(void *)(v0 + 128) = 0xE500000000000000;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v17 + 16) && (unint64_t v18 = sub_10000A9E4(v0 + 16), (v19 & 1) != 0))
  {
    sub_10000B814(*(void *)(v17 + 56) + 32 * v18, v0 + 88);
  }
  else
  {
    *(_OWORD *)(v0 + 88) = 0u;
    *(_OWORD *)(v0 + 104) = 0u;
  }
  id result = (id)swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 112)) {
    goto LABEL_13;
  }
  sub_10000B770(v0 + 16);
  sub_10000BB70((_OWORD *)(v0 + 88), (_OWORD *)(v0 + 56));
  swift_dynamicCast();
  uint64_t v21 = *(void *)(v0 + 136);
  uint64_t v20 = *(void *)(v0 + 144);
  *(void *)(v0 + 288) = v20;
  os_log_type_t v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of DockKitCorePairingService.cancelPairAccessory(info:delegate:)
                                                          + async function pointer to dispatch thunk of DockKitCorePairingService.cancelPairAccessory(info:delegate:));
  id v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v22;
  void *v22 = v0;
  v22[1] = sub_100006568;
  uint64_t v23 = *(void *)(v0 + 160);
  return (id)v24(v21, v20, v23);
}

uint64_t sub_100006568()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 304) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 232);
    uint64_t v4 = *(void *)(v2 + 240);
    uint64_t v5 = sub_100006740;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 232);
    uint64_t v4 = *(void *)(v2 + 240);
    uint64_t v5 = sub_100006684;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100006684()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 160);
  dispatch thunk of DockKitCorePairingService.disconnect()();
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService);
  if (v2)
  {
    id v3 = v2;
    dispatch thunk of DockKitCorePairingService.disconnect()();
  }
  uint64_t v4 = *(void **)(*(void *)(v0 + 160) + OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService);
  if (v4)
  {
    id v5 = v4;
    dispatch thunk of DockKitCorePairingService.disconnect()();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100006740()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[32];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[26];
  uint64_t v5 = v0[24];
  swift_release();
  swift_bridgeObjectRelease();
  v2(v4, v1 + v3, v5);
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
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[19] = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v9 = v10;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed pairing attempt: %@", v8, 0xCu);
    sub_100005664(&qword_10001E180);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[34];
  uint64_t v12 = v0[26];
  uint64_t v14 = v0[23];
  uint64_t v13 = v0[24];

  v11(v12, v13);
  if (v14)
  {
    v15 = (void *)v0[23];
    swift_errorRetain();
    sub_10000BB80(v15);
    swift_errorRelease();
  }
  swift_errorRelease();
  uint64_t v16 = v0[20];
  dispatch thunk of DockKitCorePairingService.disconnect()();
  uint64_t v17 = *(void **)(v16 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService);
  if (v17)
  {
    id v18 = v17;
    dispatch thunk of DockKitCorePairingService.disconnect()();
  }
  char v19 = *(void **)(v0[20] + OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService);
  if (v19)
  {
    id v20 = v19;
    dispatch thunk of DockKitCorePairingService.disconnect()();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_1000069C8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000B930(a1, &qword_10001E150);
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

uint64_t sub_100006B74()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_context);
  if (!v1) {
    return 0;
  }
  id v2 = [v1 userInfo];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v5 = self;
  id v6 = [v5 mainBundle];
  v7._uint64_t countAndFlagsBits = 0xD000000000000023;
  v36._uint64_t countAndFlagsBits = 0xD000000000000056;
  v36._object = (void *)0x8000000100014250;
  v7._object = (void *)0x8000000100014200;
  v8._object = (void *)0x8000000100014230;
  v8._uint64_t countAndFlagsBits = 0xD000000000000011;
  Swift::String v9 = NSLocalizedString(_:tableName:bundle:value:comment:)(v7, (Swift::String_optional)0, (NSBundle)v6, v8, v36);
  uint64_t countAndFlagsBits = v9._countAndFlagsBits;
  object = v9._object;

  id v12 = [v5 mainBundle];
  v13._uint64_t countAndFlagsBits = 0xD000000000000015;
  v14._uint64_t countAndFlagsBits = 0xD000000000000027;
  v37._uint64_t countAndFlagsBits = 0xD000000000000071;
  v37._object = (void *)0x80000001000142E0;
  v14._object = (void *)0x80000001000142B0;
  v13._object = (void *)0x8000000100013A60;
  uint64_t v32 = NSLocalizedString(_:tableName:bundle:value:comment:)(v14, (Swift::String_optional)0, (NSBundle)v12, v13, v37)._countAndFlagsBits;

  id v15 = [v5 mainBundle];
  v16._uint64_t countAndFlagsBits = 0xD000000000000029;
  v38._uint64_t countAndFlagsBits = 0xD000000000000039;
  v38._object = (void *)0x8000000100014390;
  v16._object = (void *)0x8000000100014360;
  v17._uint64_t countAndFlagsBits = 0x676E696B63617254;
  v17._object = (void *)0xED00006B636F4420;
  uint64_t v18 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v38)._countAndFlagsBits;

  id v19 = [v5 mainBundle];
  v20._uint64_t countAndFlagsBits = 0xD000000000000019;
  v21._uint64_t countAndFlagsBits = 0xD00000000000002BLL;
  v39._uint64_t countAndFlagsBits = 0xD000000000000054;
  v39._object = (void *)0x8000000100014420;
  v21._object = (void *)0x80000001000143D0;
  v20._object = (void *)0x8000000100014400;
  uint64_t v22 = NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v19, v20, v39)._countAndFlagsBits;

  AnyHashable.init<A>(_:)();
  if (*(void *)(v4 + 16) && (unint64_t v23 = sub_10000A9E4((uint64_t)v33), (v24 & 1) != 0))
  {
    sub_10000B814(*(void *)(v4 + 56) + 32 * v23, (uint64_t)&v34);
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  sub_10000B770((uint64_t)v33);
  if (*((void *)&v35 + 1))
  {
    if (swift_dynamicCast())
    {
      char v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      char v31 = v30 ^ 1;
      goto LABEL_14;
    }
  }
  else
  {
    sub_10000B930((uint64_t)&v34, &qword_10001E168);
  }
  char v31 = 1;
LABEL_14:
  *(void *)&long long v34 = 1701869940;
  *((void *)&v34 + 1) = 0xE400000000000000;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v4 + 16) && (unint64_t v26 = sub_10000A9E4((uint64_t)v33), (v27 & 1) != 0))
  {
    sub_10000B814(*(void *)(v4 + 56) + 32 * v26, (uint64_t)&v34);
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  sub_10000B770((uint64_t)v33);
  if (*((void *)&v35 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t countAndFlagsBits = 0x6569666974726563;
      swift_bridgeObjectRelease();
      object = (void *)0xE900000000000064;
    }
  }
  else
  {
    sub_10000B930((uint64_t)&v34, &qword_10001E168);
  }
  if (countAndFlagsBits == 0x676E696B63617254 && object == (void *)0xED0000646E617453
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v31) {
      uint64_t countAndFlagsBits = v18;
    }
    else {
      uint64_t countAndFlagsBits = v22;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) == 0) {
      uint64_t countAndFlagsBits = v32;
    }
  }
  swift_bridgeObjectRelease();
  AnyHashable.init<A>(_:)();
  if (*(void *)(v4 + 16) && (unint64_t v28 = sub_10000A9E4((uint64_t)v33), (v29 & 1) != 0))
  {
    sub_10000B814(*(void *)(v4 + 56) + 32 * v28, (uint64_t)&v34);
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10000B770((uint64_t)v33);
  if (*((void *)&v35 + 1))
  {
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      return 1701667182;
    }
  }
  else
  {
    sub_10000B930((uint64_t)&v34, &qword_10001E168);
  }
  return countAndFlagsBits;
}

void sub_100007170(void *a1)
{
  sub_100005664(&qword_10001E150);
  __chkstk_darwin();
  uint64_t v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [objc_allocWithZone((Class)PRXIconContentViewController) init];
  [v5 setDismissalType:3];
  id v6 = v5;
  sub_100006B74();
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v6 setTitle:v7];

  id v8 = [objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService()) init];
  Swift::String v9 = *(void **)&v1[OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService];
  *(void *)&v1[OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService] = v8;

  uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard];
  *(void *)&v1[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard] = v6;
  id v11 = v6;

  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
  type metadata accessor for MainActor();
  id v13 = v11;
  Swift::String v14 = v1;
  id v15 = a1;
  uint64_t v16 = static MainActor.shared.getter();
  Swift::String v17 = (void *)swift_allocObject();
  v17[2] = v16;
  v17[3] = &protocol witness table for MainActor;
  v17[4] = v14;
  v17[5] = v15;
  v17[6] = v13;
  sub_1000069C8((uint64_t)v4, (uint64_t)&unk_10001E190, (uint64_t)v17);
  swift_release();
  sub_10000B42C();
  if (v18)
  {
    id v19 = v18;
    sub_100005664(&qword_10001E138);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_100012D20;
    *(void *)(v20 + 32) = v19;
    v24[1] = v20;
    specialized Array._endMutation()();
    sub_10000C164(0, &qword_10001E140);
    id v21 = v19;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v13 setImages:isa];
  }
  id v23 = [v14 presentProxCardFlowWithDelegate:v14 initialViewController:v13];
}

uint64_t sub_100007428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[21] = a5;
  v6[22] = a6;
  v6[20] = a4;
  uint64_t v7 = type metadata accessor for Logger();
  v6[23] = v7;
  v6[24] = *(void *)(v7 - 8);
  v6[25] = swift_task_alloc();
  type metadata accessor for MainActor();
  v6[26] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  v6[27] = v9;
  v6[28] = v8;
  return _swift_task_switch(sub_100007520, v9, v8);
}

id sub_100007520()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 160) + OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService);
  *(void *)(v0 + 232) = v1;
  if (v1)
  {
    id v2 = *(void **)(v0 + 168);
    v1;
    id result = [v2 userInfo];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      *(void *)(v0 + 120) = 0x6E656B6F74;
      *(void *)(v0 + 128) = 0xE500000000000000;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v5 + 16) && (unint64_t v6 = sub_10000A9E4(v0 + 16), (v7 & 1) != 0))
      {
        sub_10000B814(*(void *)(v5 + 56) + 32 * v6, v0 + 88);
      }
      else
      {
        *(_OWORD *)(v0 + 88) = 0u;
        *(_OWORD *)(v0 + 104) = 0u;
      }
      id result = (id)swift_bridgeObjectRelease();
      if (*(void *)(v0 + 112))
      {
        sub_10000B770(v0 + 16);
        sub_10000BB70((_OWORD *)(v0 + 88), (_OWORD *)(v0 + 56));
        swift_dynamicCast();
        uint64_t v8 = *(void *)(v0 + 136);
        uint64_t v9 = *(void *)(v0 + 144);
        *(void *)(v0 + 240) = v9;
        uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of DockKitCorePairingService.registerCard(info:delegate:)
                                                                + async function pointer to dispatch thunk of DockKitCorePairingService.registerCard(info:delegate:));
        uint64_t v10 = (void *)swift_task_alloc();
        *(void *)(v0 + 248) = v10;
        void *v10 = v0;
        v10[1] = sub_100007828;
        uint64_t v11 = *(void *)(v0 + 160);
        return (id)v18(v8, v9, v11);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return result;
  }
  swift_release();
  uint64_t v12 = *(void **)(v0 + 176);
  id v13 = [self mainBundle];
  v20._uint64_t countAndFlagsBits = 0xD000000000000066;
  v20._object = (void *)0x8000000100014190;
  v14._object = (void *)0x8000000100014150;
  v15._object = (void *)0x8000000100014170;
  v14._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
  v15._uint64_t countAndFlagsBits = 0x100000000000001ALL;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v14, (Swift::String_optional)0, (NSBundle)v13, v15, v20);

  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v12 setBodyText:v16];

  swift_task_dealloc();
  Swift::String v17 = *(uint64_t (**)(void))(v0 + 8);
  return (id)v17();
}

uint64_t sub_100007828()
{
  id v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = (void *)v2[29];
    swift_bridgeObjectRelease();

    uint64_t v4 = v2[27];
    uint64_t v5 = v2[28];
    unint64_t v6 = sub_100007A90;
  }
  else
  {
    char v7 = (void *)v2[29];
    swift_bridgeObjectRelease();

    uint64_t v4 = v2[27];
    uint64_t v5 = v2[28];
    unint64_t v6 = sub_100007954;
  }
  return _swift_task_switch(v6, v4, v5);
}

uint64_t sub_100007954()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 176);
  id v2 = [self mainBundle];
  v9._uint64_t countAndFlagsBits = 0xD000000000000066;
  v9._object = (void *)0x8000000100014190;
  v3._object = (void *)0x8000000100014150;
  v4._object = (void *)0x8000000100014170;
  v3._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
  v4._uint64_t countAndFlagsBits = 0x100000000000001ALL;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v3, (Swift::String_optional)0, (NSBundle)v2, v4, v9);

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setBodyText:v5];

  swift_task_dealloc();
  unint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100007A90()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[23];
  uint64_t v4 = v0[24];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v3);
  swift_errorRetain();
  swift_errorRetain();
  NSString v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    char v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)char v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[19] = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed pairing attempt: %@", v7, 0xCu);
    sub_100005664(&qword_10001E180);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v11 = v0[24];
  uint64_t v10 = v0[25];
  id v13 = (void *)v0[22];
  uint64_t v12 = v0[23];

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  swift_errorRetain();
  sub_10000BB80(v13);
  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  Swift::String v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

void sub_100007CC8(void *a1)
{
  uint64_t v2 = v1;
  id v4 = [objc_allocWithZone((Class)PRXIconContentViewController) init];
  [v4 setDismissalType:3];
  id v5 = v4;
  sub_100006B74();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v5 setTitle:v6];

  sub_10000B42C();
  if (v7)
  {
    uint64_t v8 = v7;
    sub_100005664(&qword_10001E138);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100012D20;
    *(void *)(v9 + 32) = v8;
    aBlock[0] = v9;
    specialized Array._endMutation()();
    sub_10000C164(0, &qword_10001E140);
    id v10 = v8;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v5 setImages:isa];
  }
  id v12 = [self mainBundle];
  v24._uint64_t countAndFlagsBits = 0xD00000000000005ELL;
  v24._object = (void *)0x80000001000140F0;
  v13._object = (void *)0x80000001000140D0;
  v13._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
  v14._uint64_t countAndFlagsBits = 0x7463656E6E6F43;
  v14._object = (void *)0xE700000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v13, (Swift::String_optional)0, (NSBundle)v12, v14, v24);

  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v2;
  *(void *)(v16 + 24) = v15;
  id v17 = v2;
  swift_retain();
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_10000BFDC;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100008098;
  aBlock[3] = &unk_1000189A8;
  uint64_t v19 = _Block_copy(aBlock);
  id v20 = [self actionWithTitle:v18 style:0 handler:v19];

  _Block_release(v19);
  swift_release();
  swift_release();

  if (a1)
  {
    id v21 = [a1 navigationController];
    if (v21)
    {
      uint64_t v22 = v21;
      [v21 pushViewController:v5 animated:1];
    }
  }
}

void sub_100008018(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_context);
  if (v2)
  {
    swift_beginAccess();
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    id v4 = v2;
    sub_100008840(v4, Strong);
  }
  else
  {
    __break(1u);
  }
}

void sub_100008098(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_100008100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[20] = a4;
  v5[21] = a5;
  uint64_t v6 = type metadata accessor for Logger();
  v5[22] = v6;
  v5[23] = *(void *)(v6 - 8);
  v5[24] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[25] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  v5[26] = v8;
  v5[27] = v7;
  return _swift_task_switch(sub_1000081F4, v8, v7);
}

id sub_1000081F4()
{
  uint64_t v1 = *(void *)(v0 + 160);
  id v2 = [objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService()) init];
  uint64_t v3 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService;
  id v4 = *(void **)(v1 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService);
  *(void *)(v1 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService) = v2;

  id v5 = *(void **)(v1 + v3);
  *(void *)(v0 + 224) = v5;
  if (v5)
  {
    uint64_t v6 = *(void **)(v0 + 168);
    v5;
    id result = [v6 userInfo];
    if (result)
    {
      uint64_t v8 = result;
      uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      *(void *)(v0 + 120) = 0x6E656B6F74;
      *(void *)(v0 + 128) = 0xE500000000000000;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v9 + 16) && (unint64_t v10 = sub_10000A9E4(v0 + 16), (v11 & 1) != 0))
      {
        sub_10000B814(*(void *)(v9 + 56) + 32 * v10, v0 + 88);
      }
      else
      {
        *(_OWORD *)(v0 + 88) = 0u;
        *(_OWORD *)(v0 + 104) = 0u;
      }
      id result = (id)swift_bridgeObjectRelease();
      if (*(void *)(v0 + 112))
      {
        sub_10000B770(v0 + 16);
        sub_10000BB70((_OWORD *)(v0 + 88), (_OWORD *)(v0 + 56));
        swift_dynamicCast();
        uint64_t v12 = *(void *)(v0 + 136);
        uint64_t v13 = *(void *)(v0 + 144);
        *(void *)(v0 + 232) = v13;
        id v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of DockKitCorePairingService.pairAccessory(info:delegate:)
                                                                + async function pointer to dispatch thunk of DockKitCorePairingService.pairAccessory(info:delegate:));
        Swift::String v14 = (void *)swift_task_alloc();
        *(void *)(v0 + 240) = v14;
        void *v14 = v0;
        v14[1] = sub_10000845C;
        uint64_t v15 = *(void *)(v0 + 160);
        return (id)v17(v12, v13, v15);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return result;
  }
  swift_release();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return (id)v16();
}

uint64_t sub_10000845C()
{
  id v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = (void *)v2[28];
    swift_bridgeObjectRelease();

    uint64_t v4 = v2[26];
    uint64_t v5 = v2[27];
    uint64_t v6 = sub_1000085F0;
  }
  else
  {
    uint64_t v7 = (void *)v2[28];
    swift_bridgeObjectRelease();

    uint64_t v4 = v2[26];
    uint64_t v5 = v2[27];
    uint64_t v6 = sub_100008588;
  }
  return _swift_task_switch(v6, v4, v5);
}

uint64_t sub_100008588()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000085F0()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[22];
  uint64_t v4 = v0[23];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[19] = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed pairing attempt: %@", v7, 0xCu);
    sub_100005664(&qword_10001E180);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v11 = v0[23];
  uint64_t v10 = v0[24];
  uint64_t v12 = v0[22];
  uint64_t v13 = v0[20];

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  Swift::String v14 = *(void **)(v13 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard);
  swift_errorRetain();
  id v15 = v14;
  sub_10000BB80(v14);
  swift_errorRelease();

  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

void sub_100008840(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005664(&qword_10001E150);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v57 = v9;
  uint64_t v58 = v10;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [objc_allocWithZone((Class)PRXIconContentViewController) init];
  [v13 setDismissalType:3];
  id v14 = v13;
  sub_100006B74();
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v14 setTitle:v15];

  id v16 = [self mainBundle];
  v66._uint64_t countAndFlagsBits = 0xD000000000000048;
  v66._object = (void *)0x8000000100013FC0;
  v17._object = (void *)0x8000000100013FA0;
  v17._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
  v18._uint64_t countAndFlagsBits = 0x697463656E6E6F43;
  v18._object = (void *)0xAD0000A680E2676ELL;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v17, (Swift::String_optional)0, (NSBundle)v16, v18, v66);

  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v14 setBodyText:v19];

  uint64_t v20 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard;
  id v21 = *(void **)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard];
  *(void *)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard] = v14;
  id v22 = v14;

  sub_10000B42C();
  if (v23)
  {
    Swift::String v24 = v23;
    sub_100005664(&qword_10001E138);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_100012D20;
    *(void *)(v25 + 32) = v24;
    v61[0] = v25;
    specialized Array._endMutation()();
    sub_10000C164(0, &qword_10001E140);
    id v26 = v24;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v22 setImages:isa];
  }
  if (a2)
  {
    id v28 = [a2 navigationController];
    if (v28)
    {
      char v29 = v28;
      [v28 pushViewController:v22 animated:1];
    }
  }
  id v30 = [a1 userInfo];
  if (!v30) {
    goto LABEL_17;
  }
  char v31 = v30;
  uint64_t v32 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v59 = 0x6569666974726563;
  unint64_t v60 = 0xE900000000000064;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v32 + 16) && (unint64_t v33 = sub_10000A9E4((uint64_t)v61), (v34 & 1) != 0))
  {
    sub_10000B814(*(void *)(v32 + 56) + 32 * v33, (uint64_t)&v64);
  }
  else
  {
    long long v64 = 0u;
    long long v65 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10000B770((uint64_t)v61);
  if (!*((void *)&v65 + 1))
  {
    sub_10000B930((uint64_t)&v64, &qword_10001E168);
    goto LABEL_17;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_17:
    uint64_t v35 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v8, 1, 1, v35);
    type metadata accessor for MainActor();
    Swift::String v36 = v3;
    id v37 = a1;
    uint64_t v38 = static MainActor.shared.getter();
    Swift::String v39 = (void *)swift_allocObject();
    v39[2] = v38;
    v39[3] = &protocol witness table for MainActor;
    v39[4] = v36;
    v39[5] = v37;
    sub_1000069C8((uint64_t)v8, (uint64_t)&unk_10001E160, (uint64_t)v39);

    swift_release();
    return;
  }
  if (v59 != 28494 || v60 != 0xE200000000000000)
  {
    char v40 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v40) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_20:
  uint64_t v62 = type metadata accessor for ViewController();
  v63 = &off_1000188A0;
  v61[0] = v3;
  id v41 = objc_allocWithZone((Class)type metadata accessor for DKUncertifiedAlertView());
  uint64_t v42 = sub_10000B7C4((uint64_t)v61, v62);
  __chkstk_darwin(v42);
  v44 = (uint64_t *)((char *)&v56 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v45 + 16))(v44);
  uint64_t v46 = *v44;
  v47 = v3;
  id v48 = sub_10000B1BC(v46, v41);
  sub_10000580C((uint64_t)v61);
  uint64_t v49 = v57;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v12, &v47[OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger], v57);
  v50 = Logger.logObject.getter();
  os_log_type_t v51 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v52 = 0;
    _os_log_impl((void *)&_mh_execute_header, v50, v51, "Showing alert...", v52, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v58 + 8))(v12, v49);
  v53 = *(void **)&v3[v20];
  if (v53)
  {
    id v54 = [v53 navigationController];
    if (v54)
    {
      v55 = v54;
      [v54 presentViewController:v48 animated:1 completion:0];
    }
  }
}

void sub_100008F60(void *a1)
{
  id v2 = [objc_allocWithZone((Class)PRXIconContentViewController) init];
  [v2 setDismissalType:2];
  id v15 = v2;
  sub_100006B74();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v15 setTitle:v3];

  id v4 = [self mainBundle];
  v5._uint64_t countAndFlagsBits = 0xD000000000000046;
  v17._uint64_t countAndFlagsBits = 0xD000000000000061;
  v17._object = (void *)0x8000000100013F30;
  v6._object = (void *)0x8000000100013EC0;
  v5._object = (void *)0x8000000100013EE0;
  v6._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v4, v5, v17);

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v15 setBodyText:v7];

  sub_10000B42C();
  if (v8)
  {
    uint64_t v9 = v8;
    sub_100005664(&qword_10001E138);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_100012D20;
    *(void *)(v10 + 32) = v9;
    specialized Array._endMutation()();
    sub_10000C164(0, &qword_10001E140);
    id v11 = v9;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v15 setImages:isa];
  }
  if (a1)
  {
    id v13 = [a1 navigationController];
    if (v13)
    {
      id v14 = v13;
      [v13 pushViewController:v15 animated:1];
    }
  }
}

void sub_1000091A4(void *a1)
{
  uint64_t v2 = v1;
  id v4 = [objc_allocWithZone((Class)PRXIconContentViewController) init];
  [v4 setDismissalType:3];
  id v5 = v4;
  sub_100006B74();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v5 setTitle:v6];

  sub_10000B42C();
  if (v7)
  {
    uint64_t v8 = v7;
    sub_100005664(&qword_10001E138);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100012D20;
    *(void *)(v9 + 32) = v8;
    aBlock[0] = v9;
    specialized Array._endMutation()();
    sub_10000C164(0, &qword_10001E140);
    id v10 = v8;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v5 setImages:isa];
  }
  id v12 = [self mainBundle];
  v26._uint64_t countAndFlagsBits = 0xD00000000000004ELL;
  v26._object = (void *)0x8000000100013E20;
  v13._object = (void *)0x8000000100013E00;
  v13._uint64_t countAndFlagsBits = 0xD000000000000016;
  v14._uint64_t countAndFlagsBits = 1701736260;
  v14._object = (void *)0xE400000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v13, (Swift::String_optional)0, (NSBundle)v12, v14, v26);

  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_10000B634;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100008098;
  aBlock[3] = &unk_1000188E0;
  Swift::String v17 = _Block_copy(aBlock);
  id v18 = [self actionWithTitle:v16 style:0 handler:v17];

  _Block_release(v17);
  swift_release();
  swift_release();
  NSString v19 = *(void **)(v2 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService);
  if (v19)
  {
    id v20 = v19;
    dispatch thunk of DockKitCorePairingService.disconnect()();
  }
  id v21 = *(void **)(v2 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService);
  if (v21)
  {
    id v22 = v21;
    dispatch thunk of DockKitCorePairingService.disconnect()();
  }
  if (a1)
  {
    id v23 = [a1 navigationController];
    if (v23)
    {
      Swift::String v24 = v23;
      [v23 pushViewController:v5 animated:1];
    }
  }
}

void sub_10000950C()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    [Strong dismissViewControllerAnimated:1 completion:0];
  }
}

void sub_100009570(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v103 = a3;
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v95 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  v102 = (char *)&v95 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  NSString v16 = (char *)&v95 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  NSString v19 = (char *)&v95 - v18;
  __chkstk_darwin(v17);
  v101 = (char *)&v95 - v20;
  uint64_t v106 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_context;
  uint64_t v107 = a1;
  id v21 = *(void **)(a1 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_context);
  if (v21)
  {
    id v22 = [v21 userInfo];
    if (v22)
    {
      v95 = v19;
      v96 = v11;
      v97 = a4;
      v98 = v16;
      uint64_t v100 = v7;
      uint64_t v99 = v8;

      uint64_t v23 = *(void *)(a2 + 64);
      uint64_t v104 = a2 + 64;
      uint64_t v24 = 1 << *(unsigned char *)(a2 + 32);
      uint64_t v25 = -1;
      if (v24 < 64) {
        uint64_t v25 = ~(-1 << v24);
      }
      unint64_t v26 = v25 & v23;
      int64_t v105 = (unint64_t)(v24 + 63) >> 6;
      swift_bridgeObjectRetain();
      int64_t v27 = 0;
      while (1)
      {
        if (v26)
        {
          unint64_t v30 = __clz(__rbit64(v26));
          v26 &= v26 - 1;
          unint64_t v31 = v30 | (v27 << 6);
        }
        else
        {
          int64_t v32 = v27 + 1;
          if (__OFADD__(v27, 1)) {
            goto LABEL_72;
          }
          if (v32 >= v105)
          {
LABEL_47:
            swift_release();
            uint64_t v8 = v99;
            uint64_t v7 = v100;
            NSString v16 = v98;
            a4 = v97;
            id v11 = v96;
            NSString v19 = v95;
            goto LABEL_48;
          }
          unint64_t v33 = *(void *)(v104 + 8 * v32);
          ++v27;
          if (!v33)
          {
            int64_t v27 = v32 + 1;
            if (v32 + 1 >= v105) {
              goto LABEL_47;
            }
            unint64_t v33 = *(void *)(v104 + 8 * v27);
            if (!v33)
            {
              int64_t v27 = v32 + 2;
              if (v32 + 2 >= v105) {
                goto LABEL_47;
              }
              unint64_t v33 = *(void *)(v104 + 8 * v27);
              if (!v33)
              {
                int64_t v34 = v32 + 3;
                if (v34 >= v105) {
                  goto LABEL_47;
                }
                unint64_t v33 = *(void *)(v104 + 8 * v34);
                if (!v33)
                {
                  while (1)
                  {
                    int64_t v27 = v34 + 1;
                    if (__OFADD__(v34, 1)) {
                      break;
                    }
                    if (v27 >= v105) {
                      goto LABEL_47;
                    }
                    unint64_t v33 = *(void *)(v104 + 8 * v27);
                    ++v34;
                    if (v33) {
                      goto LABEL_25;
                    }
                  }
LABEL_74:
                  __break(1u);
LABEL_75:
                  __break(1u);
LABEL_76:
                  __break(1u);
LABEL_77:
                  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
                  __break(1u);
                  JUMPOUT(0x10000A164);
                }
                int64_t v27 = v34;
              }
            }
          }
LABEL_25:
          unint64_t v26 = (v33 - 1) & v33;
          unint64_t v31 = __clz(__rbit64(v33)) + (v27 << 6);
        }
        uint64_t v35 = *(void **)(v107 + v106);
        if (!v35) {
          goto LABEL_75;
        }
        Swift::String v36 = (void *)(*(void *)(a2 + 48) + 16 * v31);
        id v37 = (uint64_t *)(*(void *)(a2 + 56) + 16 * v31);
        uint64_t v39 = *v37;
        uint64_t v38 = v37[1];
        uint64_t v40 = v36[1];
        *(void *)&long long v110 = *v36;
        *((void *)&v110 + 1) = v40;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        id v41 = v35;
        AnyHashable.init<A>(_:)();
        v111 = &type metadata for String;
        *(void *)&long long v110 = v39;
        *((void *)&v110 + 1) = v38;
        id v42 = [v41 userInfo];
        if (!v42) {
          goto LABEL_76;
        }
        uint64_t v43 = v42;
        v44 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
        swift_bridgeObjectRelease();

        if (v111) {
          break;
        }
        sub_10000B930((uint64_t)&v110, &qword_10001E168);
        swift_bridgeObjectRetain();
        unint64_t v55 = sub_10000A9E4((uint64_t)v112);
        char v57 = v56;
        swift_bridgeObjectRelease();
        if (v57)
        {
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v108 = v44;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_10000AFD4();
            v44 = v108;
          }
          sub_10000B770(v44[6] + 40 * v55);
          sub_10000BB70((_OWORD *)(v44[7] + 32 * v55), v109);
          sub_10000AE08(v55, (uint64_t)v44);
          swift_bridgeObjectRelease();
        }
        else
        {
          memset(v109, 0, sizeof(v109));
        }
        sub_10000B770((uint64_t)v112);
        sub_10000B930((uint64_t)v109, &qword_10001E168);
        if (v44) {
          goto LABEL_8;
        }
        v29.super.Class isa = 0;
LABEL_9:
        [v41 setUserInfo:v29.super.isa];
      }
      sub_10000BB70(&v110, v109);
      char v45 = swift_isUniquelyReferenced_nonNull_native();
      v108 = v44;
      unint64_t v47 = sub_10000A9E4((uint64_t)v112);
      uint64_t v48 = v44[2];
      BOOL v49 = (v46 & 1) == 0;
      uint64_t v50 = v48 + v49;
      if (__OFADD__(v48, v49))
      {
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
        goto LABEL_74;
      }
      char v51 = v46;
      if (v44[3] < v50)
      {
        sub_10000AAF0(v50, v45);
        unint64_t v52 = sub_10000A9E4((uint64_t)v112);
        if ((v51 & 1) != (v53 & 1)) {
          goto LABEL_77;
        }
        unint64_t v47 = v52;
        id v54 = v108;
        if ((v51 & 1) == 0) {
          goto LABEL_40;
        }
LABEL_6:
        id v28 = (_OWORD *)(v54[7] + 32 * v47);
        sub_10000580C((uint64_t)v28);
        sub_10000BB70(v109, v28);
LABEL_7:
        swift_bridgeObjectRelease();
        sub_10000B770((uint64_t)v112);
LABEL_8:
        v29.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
      if (v45)
      {
        id v54 = v108;
        if (v46) {
          goto LABEL_6;
        }
      }
      else
      {
        sub_10000AFD4();
        id v54 = v108;
        if (v51) {
          goto LABEL_6;
        }
      }
LABEL_40:
      v54[(v47 >> 6) + 8] |= 1 << v47;
      sub_10000B8D4((uint64_t)v112, v54[6] + 40 * v47);
      sub_10000BB70(v109, (_OWORD *)(v54[7] + 32 * v47));
      uint64_t v59 = v54[2];
      BOOL v60 = __OFADD__(v59, 1);
      uint64_t v61 = v59 + 1;
      if (v60) {
        goto LABEL_73;
      }
      v54[2] = v61;
      goto LABEL_7;
    }
  }
LABEL_48:
  switch(v103)
  {
    case 0:
      id v11 = v101;
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v101, v107 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v7);
      uint64_t v62 = Logger.logObject.getter();
      os_log_type_t v63 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v62, v63)) {
        goto LABEL_56;
      }
      long long v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v64 = 0;
      long long v65 = "Ignoring started state";
      break;
    case 1:
      uint64_t v78 = v107;
      v79 = *(void **)(v107 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard);
      id v80 = v79;
      sub_100007CC8(v79);

      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v19, v78 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v7);
      v81 = Logger.logObject.getter();
      os_log_type_t v82 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v81, v82))
      {
        v83 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v83 = 0;
        _os_log_impl((void *)&_mh_execute_header, v81, v82, "Validating accessory", v83, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v8 + 8))(v19, v7);
      return;
    case 2:
      id v11 = v102;
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v102, v107 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v7);
      uint64_t v62 = Logger.logObject.getter();
      os_log_type_t v63 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v62, v63)) {
        goto LABEL_56;
      }
      long long v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v64 = 0;
      long long v65 = "Ignoring in progress state";
      break;
    case 3:
      uint64_t v66 = v107;
      v67 = *(void **)(v107 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard);
      id v68 = v67;
      sub_100008F60(v67);

      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v66 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v7);
      uint64_t v62 = Logger.logObject.getter();
      os_log_type_t v63 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v62, v63)) {
        goto LABEL_56;
      }
      long long v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v64 = 0;
      long long v65 = "Moved from Pairing -> One-time setup";
      break;
    case 4:
      v69 = *(void **)(v107 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard);
      id v70 = v69;
      sub_1000091A4(v69);

      return;
    case 5:
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v16, v107 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v7);
      id v84 = a4;
      v85 = Logger.logObject.getter();
      os_log_type_t v86 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v85, v86))
      {
        v87 = v16;
        uint64_t v100 = v7;
        v88 = (uint8_t *)swift_slowAlloc();
        v112[0] = swift_slowAlloc();
        *(_DWORD *)v88 = 136315138;
        if (a4)
        {
          id v89 = [v84 localizedDescription];
          uint64_t v90 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v92 = v91;
        }
        else
        {
          uint64_t v90 = 0x206E776F6E6B6E55;
          unint64_t v92 = 0xED0000726F727245;
        }
        *(void *)&long long v110 = sub_10000E858(v90, v92, v112);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v85, v86, "Pairing Failed: %s", v88, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v8 + 8))(v87, v100);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v8 + 8))(v16, v7);
      }
      v93 = *(void **)(v107 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard);
      id v94 = v93;
      sub_10000BB80(v93);

      return;
    default:
      v71 = *(void **)(v107 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard);
      if (v71)
      {
        v72 = self;
        id v73 = v71;
        id v74 = [v72 mainBundle];
        v113._uint64_t countAndFlagsBits = 0xD000000000000046;
        v113._object = (void *)0x80000001000144A0;
        v75._object = (void *)0x8000000100014480;
        v75._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
        v76._uint64_t countAndFlagsBits = 0x206E776F6E6B6E55;
        v76._object = (void *)0xED0000726F727245;
        NSLocalizedString(_:tableName:bundle:value:comment:)(v75, (Swift::String_optional)0, (NSBundle)v74, v76, v113);

        NSString v77 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        [v73 setBodyText:v77];
      }
      return;
  }
  _os_log_impl((void *)&_mh_execute_header, v62, v63, v65, v64, 2u);
  swift_slowDealloc();
LABEL_56:

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

id sub_10000A214(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v6 = v3;
  Logger.init(subsystem:category:)();
  *(void *)&v6[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context] = 0;
  *(void *)&v6[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard] = 0;
  uint64_t v7 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_controller;
  sub_10000C164(0, &qword_10001E1A0);
  uint64_t v8 = (void *)static OS_dispatch_queue.main.getter();
  type metadata accessor for DKPairingRadioController();
  swift_allocObject();
  *(void *)&v6[v7] = sub_10000C9C0(v8);
  *(void *)&v6[OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient] = 0;
  *(void *)&v6[OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService] = 0;
  *(void *)&v6[OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService] = 0;

  if (a2)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v6;
  v12.super_class = (Class)type metadata accessor for ViewController();
  [super initWithNibName:v9 bundle:a3];

  return v10;
}

id sub_10000A3EC(void *a1)
{
  NSString v3 = v1;
  Logger.init(subsystem:category:)();
  *(void *)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard] = 0;
  uint64_t v4 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_controller;
  sub_10000C164(0, &qword_10001E1A0);
  id v5 = (void *)static OS_dispatch_queue.main.getter();
  type metadata accessor for DKPairingRadioController();
  swift_allocObject();
  *(void *)&v3[v4] = sub_10000C9C0(v5);
  *(void *)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService] = 0;

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ViewController();
  [super initWithCoder:a1];

  return v6;
}

id sub_10000A550()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewController();
  return [super dealloc];
}

uint64_t sub_10000A658()
{
  return type metadata accessor for ViewController();
}

uint64_t type metadata accessor for ViewController()
{
  uint64_t result = qword_10001E0C8;
  if (!qword_10001E0C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000A6AC()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_10000A75C()
{
  unint64_t v1 = (void *)sub_1000058AC();
  if (v1)
  {
    [v1 deactivate];
    swift_unknownObjectRelease();
  }
  uint64_t v2 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient;
  [*(id *)(v0 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient) invalidate];
  NSString v3 = *(void **)(v0 + v2);
  *(void *)(v0 + v2) = 0;
}

uint64_t sub_10000A810(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000A8EC;
  return v6(a1);
}

uint64_t sub_10000A8EC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_10000A9E4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10000AA28(a1, v4);
}

unint64_t sub_10000AA28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000B8D4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10000B770((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10000AAF0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005664(&qword_10001E1C0);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    id v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_10000BB70((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_10000B8D4(v25, (uint64_t)&v38);
      sub_10000B814(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_10000BB70(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  id v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_10000AE08(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10000B8D4(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        Swift::Int v10 = AnyHashable._rawHashValue(seed:)(*(void *)(a2 + 40));
        uint64_t result = sub_10000B770((uint64_t)v28);
        Swift::Int v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            uint64_t v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            unint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            int64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              _OWORD *v20 = *v21;
              v20[1] = v9;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    id v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    id v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  uint64_t *v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_10000AFD4()
{
  uint64_t v1 = v0;
  sub_100005664(&qword_10001E1C0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_10000B8D4(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_10000B814(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_10000BB70(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_10000B1BC(uint64_t a1, void *a2)
{
  v8[3] = type metadata accessor for ViewController();
  v8[4] = &off_1000188A0;
  v8[0] = a1;
  uint64_t v4 = a2;
  Logger.init(subsystem:category:)();
  *(void *)&v4[OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_viewAlert] = 0;
  sub_10000B870((uint64_t)v8, (uint64_t)&v4[OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_delegate]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for DKUncertifiedAlertView();
  [super initWithNibName:0 bundle:0];
  sub_10000580C((uint64_t)v8);
  return v5;
}

void sub_10000B2B4(void (*a1)(void), uint64_t a2)
{
  if (*(void *)&v2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context])
  {
    uint64_t v5 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient;
    uint64_t v6 = *(void **)&v2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient];
    if (v6)
    {
      [v6 invalidate];
      objc_super v7 = *(void **)&v2[v5];
      *(void *)&v2[v5] = 0;
    }
    id v8 = [objc_allocWithZone((Class)SFClient) init];
    int64_t v9 = *(void **)&v2[v5];
    *(void *)&v2[v5] = v8;

    uint64_t v10 = *(void **)&v2[v5];
    if (v10)
    {
      uint64_t v11 = (void *)swift_allocObject();
      v11[2] = v2;
      v11[3] = a1;
      v11[4] = a2;
      v15[4] = sub_10000C63C;
      v15[5] = v11;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 1107296256;
      v15[2] = sub_10000609C;
      v15[3] = &unk_100018A98;
      unint64_t v12 = _Block_copy(v15);
      id v13 = v10;
      unint64_t v14 = v2;
      sub_10000C648((uint64_t)a1);
      swift_release();
      [v13 startProxCardTransactionWithOptions:14 completion:v12];
      _Block_release(v12);
    }
  }
  if (a1) {
    a1();
  }
}

void sub_10000B42C()
{
  uint64_t v0 = self;
  id v1 = [v0 configurationWithPointSize:4 weight:150.0];
  sub_100005664(&qword_10001E138);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100012D30;
  uint64_t v3 = self;
  *(void *)(v2 + 32) = [v3 labelColor];
  *(void *)(v2 + 40) = [v3 systemGreenColor];
  specialized Array._endMutation()();
  sub_10000C164(0, &qword_10001E148);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v5 = [v0 configurationWithPaletteColors:isa];

  id v6 = v1;
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [self _systemImageNamed:v7 withConfiguration:v6];

  if (v8)
  {
    [v8 imageByApplyingSymbolConfiguration:v5];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000B5FC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000B634()
{
}

uint64_t sub_10000B650(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B660()
{
  return swift_release();
}

uint64_t sub_10000B668()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000B6B0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_10000C7AC;
  return sub_100008100(a1, v4, v5, v7, v6);
}

uint64_t sub_10000B770(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000B7C4(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_10000B814(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B870(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B8D4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000B930(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005664(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000B98C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B9C4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000BA7C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10001E170 + dword_10001E170);
  return v6(a1, v4);
}

uint64_t sub_10000BA7C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

_OWORD *sub_10000BB70(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_10000BB80(void *a1)
{
  uint64_t v2 = v1;
  id v4 = [objc_allocWithZone((Class)PRXIconContentViewController) init];
  [v4 setDismissalType:3];
  id v5 = v4;
  sub_100006B74();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v5 setTitle:v6];

  uint64_t v7 = self;
  id v8 = [v7 mainBundle];
  v9._uint64_t countAndFlagsBits = 0xD000000000000020;
  v31._uint64_t countAndFlagsBits = 0xD00000000000003CLL;
  v10._uint64_t countAndFlagsBits = 0xD000000000000046;
  v31._object = (void *)0x8000000100014090;
  v9._object = (void *)0x8000000100014010;
  v10._object = (void *)0x8000000100014040;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v9, (Swift::String_optional)0, (NSBundle)v8, v10, v31);

  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v5 setBodyText:v11];

  sub_10000B42C();
  if (v12)
  {
    id v13 = v12;
    sub_100005664(&qword_10001E138);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_100012D20;
    *(void *)(v14 + 32) = v13;
    aBlock[0] = v14;
    specialized Array._endMutation()();
    sub_10000C164(0, &qword_10001E140);
    id v15 = v13;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v5 setImages:isa];
  }
  id v17 = [v7 mainBundle];
  v32._uint64_t countAndFlagsBits = 0xD00000000000004ELL;
  v32._object = (void *)0x8000000100013E20;
  v18._object = (void *)0x8000000100013E00;
  v18._uint64_t countAndFlagsBits = 0xD000000000000016;
  v19._uint64_t countAndFlagsBits = 1701736260;
  v19._object = (void *)0xE400000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v18, (Swift::String_optional)0, (NSBundle)v17, v19, v32);

  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  NSString v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_10000B634;
  aBlock[5] = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100008098;
  aBlock[3] = &unk_100018958;
  unint64_t v22 = _Block_copy(aBlock);
  id v23 = [self actionWithTitle:v21 style:0 handler:v22];

  _Block_release(v22);
  swift_release();
  swift_release();

  uint64_t v24 = *(void **)(v2 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService);
  if (v24)
  {
    id v25 = v24;
    dispatch thunk of DockKitCorePairingService.disconnect()();
  }
  uint64_t v26 = *(void **)(v2 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService);
  if (v26)
  {
    id v27 = v26;
    dispatch thunk of DockKitCorePairingService.disconnect()();
  }
  if (a1)
  {
    id v28 = [a1 navigationController];
    if (v28)
    {
      unint64_t v29 = v28;
      [v28 pushViewController:v5 animated:1];
    }
  }
}

uint64_t sub_10000BF9C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000BFDC(uint64_t a1)
{
  sub_100008018(a1, *(void *)(v1 + 16));
}

uint64_t sub_10000BFE4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000C034(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  Swift::String v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *Swift::String v9 = v2;
  v9[1] = sub_10000BA7C;
  return sub_100007428(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_10000C0FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005664(&qword_10001E168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C164(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000C1A0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v20 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  Swift::String v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  unint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C164(0, &qword_10001E1A0);
  id v13 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v3;
  v14[3] = a2;
  v14[4] = a1;
  v14[5] = a3;
  aBlock[4] = sub_10000C494;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000C7B0;
  aBlock[3] = &unk_100018A20;
  id v15 = _Block_copy(aBlock);
  id v16 = a3;
  id v17 = v3;
  swift_bridgeObjectRetain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000C4A0();
  sub_100005664(&qword_10001E1B0);
  sub_10000C4F8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v19);
}

uint64_t sub_10000C44C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_10000C494()
{
  sub_100009570(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40));
}

unint64_t sub_10000C4A0()
{
  unint64_t result = qword_10001E1A8;
  if (!qword_10001E1A8)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E1A8);
  }
  return result;
}

unint64_t sub_10000C4F8()
{
  unint64_t result = qword_10001E1B8;
  if (!qword_10001E1B8)
  {
    sub_10000C554(&qword_10001E1B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E1B8);
  }
  return result;
}

uint64_t sub_10000C554(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000C59C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000C5AC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C5E4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10000C5F4()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000C63C(char a1)
{
  sub_100005B0C(a1, *(char **)(v1 + 16), *(void (**)(void))(v1 + 24));
}

uint64_t sub_10000C648(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000C658()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10000C6B0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_10000C7AC;
  return sub_1000061BC(a1, v4, v5, v6, v7, v9, v8);
}

BOOL sub_10000C7B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000C7C8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000C810()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000C83C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10000C880()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000EEB4(v0, qword_10001E240);
  sub_10000E820(v0, (uint64_t)qword_10001E240);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000C904()
{
  uint64_t result = *(void *)(v0 + 24);
  if (result)
  {
    if (!*(void *)(v0 + 32)) {
      return 0;
    }
    if (![(id)result powerOn]) {
      goto LABEL_6;
    }
    uint64_t result = *(void *)(v0 + 24);
    if (!result)
    {
LABEL_12:
      __break(1u);
      return result;
    }
    if ([(id)result userAutoJoinDisabled])
    {
LABEL_6:
      uint64_t result = *(void *)(v0 + 32);
      if (result)
      {
        _CTServerConnectionGetCellularDataIsEnabled();
        return 0;
      }
      __break(1u);
      goto LABEL_12;
    }
    return 1;
  }
  return result;
}

uint64_t sub_10000C9C0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  unint64_t v55 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  id v54 = (char *)&v52 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v52 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v52 - v13;
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  *(_WORD *)(v2 + 40) = 0;
  *(void *)(v2 + 32) = 0;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(void *)(v2 + 88) = 0;
  if (qword_10001DFD0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10000E820(v4, (uint64_t)qword_10001E240);
  char v57 = *(void (**)(char *))(v5 + 16);
  uint64_t v58 = v15;
  v57(v14);
  id v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    Swift::String v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Trying to initialize CoreBluetooth", v18, 2u);
    swift_slowDealloc();
  }

  char v56 = *(void (**)(char *, uint64_t))(v5 + 8);
  v56(v14, v4);
  *(void *)(v2 + 48) = a1;
  id v19 = objc_allocWithZone((Class)CBController);
  id v53 = a1;
  id v20 = [v19 init];
  NSString v21 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = v20;

  unint64_t v22 = *(void **)(v2 + 16);
  if (!v22)
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v61 = sub_10000EFD0;
  uint64_t v62 = v2;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v60 = sub_10000C7B0;
  *((void *)&v60 + 1) = &unk_100018BF0;
  id v23 = _Block_copy(&aBlock);
  swift_retain();
  id v24 = v22;
  swift_release();
  [v24 setBluetoothStateChangedHandler:v23];
  _Block_release(v23);

  id v25 = *(void **)(v2 + 16);
  if (!v25)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v61 = sub_10000EFD8;
  uint64_t v62 = v2;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v60 = sub_10000D7E8;
  *((void *)&v60 + 1) = &unk_100018C18;
  uint64_t v26 = _Block_copy(&aBlock);
  swift_retain();
  id v27 = v25;
  swift_release();
  [v27 activateWithCompletion:v26];
  _Block_release(v26);

  ((void (*)(char *, uint64_t, uint64_t))v57)(v12, v58, v4);
  id v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v28, v29))
  {
    unint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Trying to initialize CoreWiFi", v30, 2u);
    swift_slowDealloc();
  }

  Swift::String v31 = v56;
  v56(v12, v4);
  id v32 = [objc_allocWithZone((Class)CWFInterface) init];
  BOOL v33 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = v32;

  uint64_t v34 = *(void **)(v2 + 24);
  if (!v34) {
    goto LABEL_22;
  }
  uint64_t v61 = sub_10000EFE0;
  uint64_t v62 = v2;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v60 = sub_100008098;
  *((void *)&v60 + 1) = &unk_100018C40;
  uint64_t v35 = _Block_copy(&aBlock);
  swift_retain();
  id v36 = v34;
  swift_release();
  [v36 setEventHandler:v35];
  _Block_release(v35);

  id v37 = *(void **)(v2 + 24);
  long long v39 = v54;
  long long v38 = v55;
  if (!v37)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  [v37 activate];
  uint64_t v40 = *(void **)(v2 + 24);
  if (!v40) {
    goto LABEL_24;
  }
  *(void *)&long long aBlock = 0;
  if ([v40 startMonitoringEventType:1 error:&aBlock])
  {
    id v41 = (id)aBlock;
  }
  else
  {
    id v42 = (id)aBlock;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
  }
  ((void (*)(char *, uint64_t, uint64_t))v57)(v39, v58, v4);
  uint64_t v43 = Logger.logObject.getter();
  os_log_type_t v44 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v43, v44))
  {
    char v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v45 = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Trying to initialize CoreTelephony", v45, 2u);
    swift_slowDealloc();
  }

  v31(v39, v4);
  uint64_t v61 = 0;
  long long aBlock = 0u;
  long long v60 = 0u;
  NSString v46 = String._bridgeToObjectiveC()();
  uint64_t v47 = _CTServerConnectionCreateAndLaunchWithIdentifier();

  *(void *)(v2 + 32) = v47;
  ((void (*)(char *, uint64_t, uint64_t))v57)(v38, v58, v4);
  uint64_t v48 = Logger.logObject.getter();
  os_log_type_t v49 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "Radio controller initialized!", v50, 2u);
    swift_slowDealloc();
  }

  v31(v38, v4);
  return v2;
}

void *sub_10000D130(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v16[0] - 8);
  __chkstk_darwin(v16[0]);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = *(void **)(a1 + 16);
  if (result)
  {
    if ([result bluetoothState] == (id)5) {
      char v10 = 1;
    }
    else {
      char v10 = 2;
    }
    *(unsigned char *)(a1 + 40) = v10;
    uint64_t v11 = *(void **)(a1 + 48);
    uint64_t v12 = swift_allocObject();
    swift_weakInit();
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    *(unsigned char *)(v13 + 24) = v10;
    aBlock[4] = sub_10000F0B0;
    aBlock[5] = v13;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000C7B0;
    aBlock[3] = &unk_100018CE0;
    uint64_t v14 = _Block_copy(aBlock);
    id v15 = v11;
    swift_retain();
    static DispatchQoS.unspecified.getter();
    v16[1] = &_swiftEmptyArrayStorage;
    sub_10000C4A0();
    sub_100005664(&qword_10001E1B0);
    sub_10000C4F8();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, void))(v6 + 8))(v8, v16[0]);
    swift_release();
    return (void *)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000D400(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_10000D444(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  char v10 = (char *)v23 - v9;
  if (a1)
  {
    if (qword_10001DFD0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_10000E820(v4, (uint64_t)qword_10001E240);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v11, v4);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      v23[1] = v14 + 4;
      swift_getErrorValue();
      uint64_t v15 = Error.localizedDescription.getter();
      v23[2] = sub_10000E858(v15, v16, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Unable to activate Bluetooth controller: %s", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  else
  {
    if (qword_10001DFD0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_10000E820(v4, (uint64_t)qword_10001E240);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v17, v4);
    Swift::String v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Bluetooth controller activated.", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    id result = *(id *)(a2 + 16);
    if (result)
    {
      id result = [result bluetoothState];
      if (result == (id)5) {
        char v22 = 1;
      }
      else {
        char v22 = 2;
      }
      *(unsigned char *)(a2 + 40) = v22;
    }
  }
  return result;
}

void sub_10000D7E8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_10000D854(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_10000C904()) {
    char v10 = 1;
  }
  else {
    char v10 = 2;
  }
  *(unsigned char *)(a2 + 41) = v10;
  uint64_t v11 = *(void **)(a2 + 48);
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(unsigned char *)(v13 + 24) = v10;
  aBlock[4] = sub_10000F020;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000C7B0;
  aBlock[3] = &unk_100018C90;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = v11;
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v17[1] = &_swiftEmptyArrayStorage;
  sub_10000C4A0();
  sub_100005664(&qword_10001E1B0);
  sub_10000C4F8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, void))(v7 + 8))(v9, v17[0]);
  swift_release();
  return swift_release();
}

uint64_t sub_10000DB10(uint64_t a1, char a2, void *a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v6 = result + 56;
    swift_beginAccess();
    sub_10000F048(v6, (uint64_t)v8);
    swift_release();
    if (v9)
    {
      sub_10000B870((uint64_t)v8, (uint64_t)v7);
      sub_10000EF70((uint64_t)v8);
      *(unsigned char *)(*sub_100005770(v7, v7[3]) + *a3) = a2;
      return sub_10000580C((uint64_t)v7);
    }
    else
    {
      return sub_10000EF70((uint64_t)v8);
    }
  }
  return result;
}

uint64_t sub_10000DBE4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)(v1 + 16);
  if (v6) {
    [v6 invalidate];
  }
  uint64_t v7 = *(void **)(v1 + 24);
  if (v7)
  {
    [v7 stopMonitoringEventType:1];
    uint64_t v8 = *(void **)(v1 + 24);
    if (v8) {
      [v8 invalidate];
    }
  }
  *(void *)(v1 + 32) = 0;
  if (qword_10001DFD0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10000E820(v2, (uint64_t)qword_10001E240);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  char v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Radio controller uninitialized!", v12, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_10000EF70(v1 + 56);
  return v1;
}

uint64_t sub_10000DDE0()
{
  sub_10000DBE4();

  return _swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for DKPairingRadioController()
{
  return self;
}

BOOL sub_10000DE38()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    if ([v1 bluetoothState] == (id)5) {
      char v2 = 1;
    }
    else {
      char v2 = 2;
    }
    *(unsigned char *)(v0 + 40) = v2;
  }
  else
  {
    char v2 = *(unsigned char *)(v0 + 40);
  }
  if (v2 == 2) {
    return 1;
  }
  if (!*(void *)(v0 + 24)) {
    return *(unsigned char *)(v0 + 41) == 2;
  }
  BOOL v4 = sub_10000C904() == 0;
  BOOL result = v4;
  if (v4) {
    char v5 = 2;
  }
  else {
    char v5 = 1;
  }
  *(unsigned char *)(v0 + 41) = v5;
  return result;
}

void sub_10000DEC4(int a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001DFD0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_10000E820(v4, (uint64_t)qword_10001E240);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  BOOL v11 = os_log_type_enabled(v9, v10);
  int v24 = a1;
  if (v11)
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v23 = v2;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    aBlock[0] = v14;
    if (a1) {
      uint64_t v15 = 0x64656C62616E45;
    }
    else {
      uint64_t v15 = 0x64656C6261736944;
    }
    if (a1) {
      unint64_t v16 = 0xE700000000000000;
    }
    else {
      unint64_t v16 = 0xE800000000000000;
    }
    uint64_t v25 = sub_10000E858(v15, v16, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Setting Bluetooth status to: %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v23;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v17 = *(void **)(v2 + 16);
  if (v17)
  {
    if (v24) {
      uint64_t v18 = 5;
    }
    else {
      uint64_t v18 = 4;
    }
    uint64_t v19 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = (uint64_t)sub_10000EF50;
    aBlock[5] = v19;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000D7E8;
    aBlock[3] = (uint64_t)&unk_100018BC8;
    id v20 = _Block_copy(aBlock);
    id v21 = v17;
    swift_release();
    [v21 setPowerState:v18 completion:v20];
    _Block_release(v20);
  }
}

uint64_t sub_10000E204(uint64_t result)
{
  if (!result)
  {
    swift_beginAccess();
    BOOL result = swift_weakLoadStrong();
    if (result)
    {
      *(unsigned char *)(result + 40) = 1;
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_10000E264(int a1)
{
  id v2 = v1;
  LODWORD(v3) = a1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((void *)v2 + 3))
  {
    if (qword_10001DFD0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_10000E820(v4, (uint64_t)qword_10001E240);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v9, v4);
    os_log_type_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      id v21 = v2;
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      id v23 = v13;
      if (v3) {
        uint64_t v14 = 0x64656C62616E45;
      }
      else {
        uint64_t v14 = 0x64656C6261736944;
      }
      HIDWORD(v20) = v3;
      if (v3) {
        unint64_t v3 = 0xE700000000000000;
      }
      else {
        unint64_t v3 = 0xE800000000000000;
      }
      uint64_t v22 = sub_10000E858(v14, v3, (uint64_t *)&v23);
      id v2 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      LOBYTE(v3) = BYTE4(v20);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Setting Wi-Fi status to: %s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t v15 = (void *)*((void *)v2 + 3);
    if (v15)
    {
      if [v15 userAutoJoinDisabled] && (v3)
      {
        unint64_t v16 = (void *)*((void *)v2 + 3);
        if (!v16)
        {
LABEL_29:
          __break(1u);
          return _objc_retain_x1();
        }
        id v23 = 0;
        if (![v16 setUserAutoJoinDisabled:0 error:&v23])
        {
          id v19 = v23;
LABEL_25:
          _convertNSErrorToError(_:)();

          swift_willThrow();
          return swift_errorRelease();
        }
        id v17 = v23;
      }
      uint64_t v18 = (void *)*((void *)v2 + 3);
      if (v18)
      {
        id v23 = 0;
        if ([v18 setPower:v3 & 1 error:&v23])
        {
          *((unsigned char *)v2 + 41) = 1;
          return _objc_retain_x1();
        }
        id v21 = v23;
        id v19 = v23;
        goto LABEL_25;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_29;
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for NetworkStatus(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NetworkStatus(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NetworkStatus(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x10000E77CLL);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10000E7A4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000E7B0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NetworkStatus()
{
  return &type metadata for NetworkStatus;
}

unint64_t sub_10000E7CC()
{
  unint64_t result = qword_10001E408;
  if (!qword_10001E408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E408);
  }
  return result;
}

uint64_t sub_10000E820(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000E858(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000E92C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000B814((uint64_t)v12, *a3);
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
      sub_10000B814((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000580C((uint64_t)v12);
  return v7;
}

uint64_t sub_10000E92C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000EAE8(a5, a6);
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

uint64_t sub_10000EAE8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000EB80(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000ED60(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000ED60(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000EB80(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000ECF8(v2, 0);
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

void *sub_10000ECF8(uint64_t a1, uint64_t a2)
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
  sub_100005664(&qword_10001E410);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000ED60(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005664(&qword_10001E410);
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

uint64_t *sub_10000EEB4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000EF18()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000EF50(uint64_t result)
{
  return sub_10000E204(result);
}

uint64_t sub_10000EF58(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EF68()
{
  return swift_release();
}

uint64_t sub_10000EF70(uint64_t a1)
{
  uint64_t v2 = sub_100005664(&qword_10001E418);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_10000EFD0()
{
  return sub_10000D130(v0);
}

id sub_10000EFD8(uint64_t a1)
{
  return sub_10000D444(a1, v1);
}

uint64_t sub_10000EFE0(uint64_t a1)
{
  return sub_10000D854(a1, v1);
}

uint64_t sub_10000EFE8()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

uint64_t sub_10000F020()
{
  return sub_10000DB10(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), &OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__wifiStatus);
}

uint64_t sub_10000F048(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005664(&qword_10001E418);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F0B0()
{
  return sub_10000DB10(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), &OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__bluetoothStatus);
}

char *sub_10000F104(uint64_t a1)
{
  uint64_t v3 = v1;
  Logger.init(subsystem:category:)();
  *(void *)&v3[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert] = 0;
  v3[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__bluetoothStatus] = 0;
  v3[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__wifiStatus] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller] = a1;
  swift_retain();

  uint64_t v4 = (objc_class *)type metadata accessor for DKPairingAlertView();
  v17.receiver = v3;
  v17.super_class = v4;
  size_t v5 = (char *)[super initWithNibName:0 bundle:0];
  uint64_t v6 = OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller;
  uint64_t v7 = *(void *)&v5[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller];
  v16[3] = v4;
  v16[4] = &off_100018D08;
  v16[0] = v5;
  sub_100010524((uint64_t)v16, (uint64_t)v15);
  swift_beginAccess();
  int64_t v8 = v5;
  swift_retain();
  sub_10001058C((uint64_t)v15, v7 + 56);
  swift_endAccess();
  swift_release();
  uint64_t v9 = *(void *)&v5[v6];
  uint64_t v10 = *(void **)(v9 + 16);
  if (v10)
  {
    swift_retain();
    if ([v10 bluetoothState] == (id)5) {
      LOBYTE(v11) = 1;
    }
    else {
      LOBYTE(v11) = 2;
    }
    *(unsigned char *)(v9 + 40) = v11;
  }
  else
  {
    uint64_t v11 = *(unsigned __int8 *)(v9 + 40);
    swift_retain();
  }
  swift_release();
  v8[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__bluetoothStatus] = v11;
  uint64_t v12 = *(void *)&v5[v6];
  if (*(void *)(v12 + 24))
  {
    swift_retain();
    if (sub_10000C904()) {
      char v13 = 1;
    }
    else {
      char v13 = 2;
    }
    *(unsigned char *)(v12 + 41) = v13;
  }
  else
  {
    char v13 = *(unsigned char *)(v12 + 41);
    swift_retain();
  }
  swift_release();

  swift_release();
  v8[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__wifiStatus] = v13;
  return v8;
}

uint64_t sub_10000F308(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_logger];
  uint64_t v4 = v1;
  Logger.init(subsystem:category:)();

  uint64_t v5 = OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert;
  *(void *)&v4[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert] = 0;
  v4[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__bluetoothStatus] = 0;
  v4[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__wifiStatus] = 0;
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v3, v6);
  uint64_t v7 = *(void **)&v4[v5];

  type metadata accessor for DKPairingAlertView();
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_10000F558()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  int64_t v8 = (char *)&v66 - v7;
  uint64_t v9 = OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__bluetoothStatus;
  if (v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__bluetoothStatus] == 2
    || v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__wifiStatus] == 2)
  {
    uint64_t v10 = OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert;
    if (*(void *)&v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert]) {
      return;
    }
    (*(void (**)(char *, unsigned char *, uint64_t))(v3 + 16))(v6, &v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_logger], v2);
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      char v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Pushing alert to stack...", v13, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    uint64_t v14 = OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller;
    uint64_t v15 = *(void *)&v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller];
    unint64_t v16 = *(void **)(v15 + 16);
    if (v16)
    {
      swift_retain();
      if ([v16 bluetoothState] == (id)5) {
        LOBYTE(v17) = 1;
      }
      else {
        LOBYTE(v17) = 2;
      }
      *(unsigned char *)(v15 + 40) = v17;
    }
    else
    {
      uint64_t v17 = *(unsigned __int8 *)(v15 + 40);
      swift_retain();
    }
    swift_release();
    v1[v9] = v17;
    uint64_t v22 = *(void *)&v1[v14];
    if (*(void *)(v22 + 24))
    {
      swift_retain();
      if (sub_10000C904()) {
        char v23 = 1;
      }
      else {
        char v23 = 2;
      }
      *(unsigned char *)(v22 + 41) = v23;
    }
    else
    {
      char v23 = *(unsigned char *)(v22 + 41);
      swift_retain();
    }
    swift_release();
    v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__wifiStatus] = v23;
    int v24 = self;
    id v25 = [v24 mainBundle];
    v26._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
    v27._uint64_t countAndFlagsBits = 0xD000000000000027;
    v74._uint64_t countAndFlagsBits = 0xD00000000000003ELL;
    v74._object = (void *)0x8000000100014950;
    v27._object = (void *)0x8000000100014900;
    v26._object = (void *)0x8000000100014930;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v27, (Swift::String_optional)0, (NSBundle)v25, v26, v74);

    id v28 = v24;
    id v29 = [v24 mainBundle];
    v30._uint64_t countAndFlagsBits = 0x1000000000000041;
    v75._uint64_t countAndFlagsBits = 0xD000000000000040;
    v75._object = (void *)0x8000000100014A10;
    v31._object = (void *)0x8000000100014990;
    v30._object = (void *)0x80000001000149C0;
    v31._uint64_t countAndFlagsBits = 0xD000000000000025;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v31, (Swift::String_optional)0, (NSBundle)v29, v30, v75);

    id v32 = (id)MobileGestalt_get_current_device();
    if (v32)
    {
      BOOL v33 = v32;
      int wapiCapability = MobileGestalt_get_wapiCapability();

      if (wapiCapability)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v35 = [v28 mainBundle];
        v36._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
        v37._uint64_t countAndFlagsBits = 0xD000000000000027;
        v76._uint64_t countAndFlagsBits = 0xD00000000000003DLL;
        v76._object = (void *)0x8000000100014B50;
        v37._object = (void *)0x8000000100014B00;
        v36._object = (void *)0x8000000100014B30;
        NSLocalizedString(_:tableName:bundle:value:comment:)(v37, (Swift::String_optional)0, (NSBundle)v35, v36, v76);

        id v38 = [v28 mainBundle];
        v77._uint64_t countAndFlagsBits = 0xD00000000000003FLL;
        v77._object = (void *)0x8000000100014C10;
        v39._object = (void *)0x8000000100014B90;
        v40._object = (void *)0x8000000100014BC0;
        v39._uint64_t countAndFlagsBits = 0xD000000000000025;
        v40._uint64_t countAndFlagsBits = 0x1000000000000040;
        NSLocalizedString(_:tableName:bundle:value:comment:)(v39, (Swift::String_optional)0, (NSBundle)v38, v40, v77);
      }
      NSString v41 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      NSString v42 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v43 = [self alertControllerWithTitle:v41 message:v42 preferredStyle:1];

      os_log_type_t v44 = *(void **)&v1[v10];
      *(void *)&v1[v10] = v43;

      char v45 = *(void **)&v1[v10];
      uint64_t v67 = v10;
      if (v45)
      {
        id v46 = v45;
        id v47 = [v28 mainBundle];
        v48._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
        v78._uint64_t countAndFlagsBits = 0xD000000000000022;
        v78._object = (void *)0x8000000100014A80;
        v48._object = (void *)0x8000000100014A60;
        v49._uint64_t countAndFlagsBits = 0x7373696D736944;
        v49._object = (void *)0xE700000000000000;
        NSLocalizedString(_:tableName:bundle:value:comment:)(v48, (Swift::String_optional)0, (NSBundle)v47, v49, v78);

        uint64_t v50 = swift_allocObject();
        swift_unknownObjectWeakInit();
        swift_retain();
        NSString v51 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        v72 = sub_1000104FC;
        uint64_t v73 = v50;
        long long aBlock = _NSConcreteStackBlock;
        uint64_t v69 = 1107296256;
        id v70 = sub_100008098;
        v71 = &unk_100018D48;
        uint64_t v52 = _Block_copy(&aBlock);
        swift_release();
        id v53 = self;
        id v54 = [v53 actionWithTitle:v51 style:1 handler:v52];
        _Block_release(v52);
        swift_release();

        [v46 addAction:v54];
        uint64_t v55 = v67;
        char v56 = *(void **)&v1[v67];
        if (v56)
        {
          id v57 = v56;
          id v58 = [v28 mainBundle];
          v59._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
          v79._uint64_t countAndFlagsBits = 0xD00000000000002FLL;
          v79._object = (void *)0x8000000100014AD0;
          v59._object = (void *)0x8000000100014AB0;
          v60._uint64_t countAndFlagsBits = 0x6E4F206E727554;
          v60._object = (void *)0xE700000000000000;
          NSLocalizedString(_:tableName:bundle:value:comment:)(v59, (Swift::String_optional)0, (NSBundle)v58, v60, v79);

          uint64_t v61 = swift_allocObject();
          swift_unknownObjectWeakInit();
          swift_retain();
          NSString v62 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          v72 = sub_10001051C;
          uint64_t v73 = v61;
          long long aBlock = _NSConcreteStackBlock;
          uint64_t v69 = 1107296256;
          id v70 = sub_100008098;
          v71 = &unk_100018D70;
          os_log_type_t v63 = _Block_copy(&aBlock);
          swift_release();
          id v64 = [v53 actionWithTitle:v62 style:0 handler:v63];
          _Block_release(v63);
          swift_release();

          [v57 addAction:v64];
          uint64_t v65 = *(void *)&v1[v55];
          if (v65)
          {
            [v1 presentViewController:v65 animated:1 completion:0];
            return;
          }
LABEL_32:
          __break(1u);
          return;
        }
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_31;
  }
  (*(void (**)(char *, unsigned char *, uint64_t))(v3 + 16))((char *)&v66 - v7, &v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_logger], v2);
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Bluetooth and Wi-Fi enabled, dismissing alert...", v20, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  id v21 = *(void **)&v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert];
  *(void *)&v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert] = 0;

  [v1 dismissViewControllerAnimated:1 completion:0];
}

void sub_10000FED0()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v11[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v1 + 16))(v3, Strong + OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_logger, v0);

    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      int64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Dismiss pressed", v8, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v3, v0);
  }
  swift_beginAccess();
  uint64_t v9 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v9)
  {
    uint64_t v10 = v9;
    [v9 dismissViewControllerAnimated:1 completion:0];
  }
}

void sub_10001009C()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, Strong + OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_logger, v0);

    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      int64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Turn On pressed", v8, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  swift_beginAccess();
  uint64_t v9 = swift_unknownObjectWeakLoadStrong();
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    swift_retain();

    sub_10000DEC4(1);
    sub_10000E264(1);
    swift_release();
  }
  swift_beginAccess();
  uint64_t v11 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v11)
  {
    os_log_type_t v12 = v11;
    [v11 dismissViewControllerAnimated:1 completion:0];
  }
}

id sub_1000102F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DKPairingAlertView();
  return [super dealloc];
}

uint64_t sub_1000103BC()
{
  return type metadata accessor for DKPairingAlertView();
}

uint64_t type metadata accessor for DKPairingAlertView()
{
  uint64_t result = qword_10001E448;
  if (!qword_10001E448) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100010410()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000104C4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000104FC()
{
}

uint64_t sub_100010504(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100010514()
{
  return swift_release();
}

void sub_10001051C()
{
}

uint64_t sub_100010524(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005664(&qword_10001E418);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001058C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005664(&qword_10001E418);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000106FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = type metadata accessor for MainActor();
  v5[3] = static MainActor.shared.getter();
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of DockKitCorePairingService.setSetupPayload(uri:)
                                       + async function pointer to dispatch thunk of DockKitCorePairingService.setSetupPayload(uri:));
  os_log_type_t v7 = (void *)swift_task_alloc();
  v5[4] = v7;
  void *v7 = v5;
  v7[1] = sub_1000107CC;
  return v9(a5);
}

uint64_t sub_1000107CC()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  if (v0) {
    uint64_t v4 = sub_10001098C;
  }
  else {
    uint64_t v4 = sub_100010928;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_100010928()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001098C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_100010CCC()
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

uint64_t sub_100010DB0()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100010E84(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10000BA7C;
  return sub_1000106FC(a1, v5, v6, v7, v8);
}

uint64_t sub_100010F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_100011E5C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_100011158(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = __CocoaSet.startIndex.getter();
    uint64_t v5 = v4;
    __CocoaSet.endIndex.getter();
    char v6 = static __CocoaSet.Index.== infix(_:_:)();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100011EBC(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_10001143C(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_100011EBC(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_100011694(a1);
  if ((v10 & 1) == 0)
  {
    uint64_t v5 = v9;
    if (*(_DWORD *)(a1 + 36) == v9)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1000113D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

void sub_10001143C(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      sub_100011CC4();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  __CocoaSet.Index.element.getter();
  sub_100011CC4();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = static NSObject.== infix(_:_:)();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = static NSObject.== infix(_:_:)();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  uint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_100011694(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_10001171C()
{
  uint64_t v0 = sub_100005664(&qword_10001E150);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = __chkstk_darwin(v3);
  unint64_t v7 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v9 = (char *)&v20 - v8;
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v11 = (void *)sub_100011158(v10);
  uint64_t result = swift_bridgeObjectRelease();
  if (v11)
  {
    id v13 = [v11 URL];
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    id v14 = [objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService()) init];
    uint64_t v15 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v2, 1, 1, v15);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    type metadata accessor for MainActor();
    id v16 = v14;
    uint64_t v17 = static MainActor.shared.getter();
    unint64_t v18 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    os_log_type_t v19 = (char *)swift_allocObject();
    *((void *)v19 + 2) = v17;
    *((void *)v19 + 3) = &protocol witness table for MainActor;
    *((void *)v19 + 4) = v16;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v19[v18], v7, v3);
    sub_100010F80((uint64_t)v2, (uint64_t)&unk_10001E5B8, (uint64_t)v19);

    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  return result;
}

uint64_t sub_1000119C0(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_100005664(&qword_10001E150);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v12 = (char *)&v24 - v11;
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    id v14 = [a2 URLContexts];
    sub_100011CC4();
    sub_100011D04();
    uint64_t v15 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    id v16 = (void *)sub_100011158(v15);
    uint64_t result = swift_bridgeObjectRelease();
    if (v16)
    {
      id v17 = [v16 URL];
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      id v18 = [objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService()) init];
      uint64_t v19 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v5, 1, 1, v19);
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
      type metadata accessor for MainActor();
      id v20 = v18;
      uint64_t v21 = static MainActor.shared.getter();
      unint64_t v22 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      char v23 = (char *)swift_allocObject();
      *((void *)v23 + 2) = v21;
      *((void *)v23 + 3) = &protocol witness table for MainActor;
      *((void *)v23 + 4) = v20;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v23[v22], v10, v6);
      sub_100010F80((uint64_t)v5, (uint64_t)&unk_10001E5B0, (uint64_t)v23);

      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
  }
  return result;
}

unint64_t sub_100011CC4()
{
  unint64_t result = qword_10001E598;
  if (!qword_10001E598)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001E598);
  }
  return result;
}

unint64_t sub_100011D04()
{
  unint64_t result = qword_10001E5A0;
  if (!qword_10001E5A0)
  {
    sub_100011CC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10001E5A0);
  }
  return result;
}

uint64_t sub_100011D60(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10000C7AC;
  return sub_1000106FC(a1, v5, v6, v7, v8);
}

uint64_t sub_100011E5C(uint64_t a1)
{
  uint64_t v2 = sub_100005664(&qword_10001E150);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100011EBC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100011ECC()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100011FA0(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10000BA7C;
  return sub_1000106FC(a1, v5, v6, v7, v8);
}

uint64_t sub_10001209C()
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
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t dispatch thunk of DockKitCorePairingService.disconnect()()
{
  return dispatch thunk of DockKitCorePairingService.disconnect()();
}

uint64_t type metadata accessor for DockKitCorePairingService()
{
  return type metadata accessor for DockKitCorePairingService();
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

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
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

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
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

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCreateAndLaunchWithIdentifier()
{
  return __CTServerConnectionCreateAndLaunchWithIdentifier();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return __CTServerConnectionGetCellularDataIsEnabled();
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}