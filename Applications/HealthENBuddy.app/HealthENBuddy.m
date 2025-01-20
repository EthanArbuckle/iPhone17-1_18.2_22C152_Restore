id sub_100004414()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for ViewController()
{
  return self;
}

id sub_1000045AC()
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
  v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

id sub_100004734()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

void sub_100004868(char a1)
{
  objc_super v2 = v1;
  uint64_t v58 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v65 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  v63 = (char *)v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = type metadata accessor for DispatchQoS();
  uint64_t v62 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  v61 = (char *)v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchTime();
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v60 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  v56 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v57 = (char *)v54 - v9;
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  v55 = (char *)v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v66 = (char *)v54 - v15;
  __chkstk_darwin(v14);
  v17 = (char *)v54 - v16;
  uint64_t v18 = Logger.buddy.unsafeMutableAddressor();
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v19(v17, v18, v10);
  v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v54[1] = v11 + 16;
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "HealthENBuddyContainer viewDidAppear", v22, 2u);
    swift_slowDealloc();
  }

  v23 = *(void (**)(char *, uint64_t))(v11 + 8);
  v23(v17, v10);
  v24 = (objc_class *)type metadata accessor for HealthENBuddyContainer();
  v68.receiver = v2;
  v68.super_class = v24;
  [super viewDidAppear:a1 & 1];
  v2[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_didPresent] = 0;
  id v25 = [v2 view];
  if (!v25)
  {
    __break(1u);
    goto LABEL_16;
  }
  v26 = v25;
  id v27 = [v25 window];

  if (!v27) {
    goto LABEL_7;
  }
  id v28 = [v27 _rootSheetPresentationController];

  if (!v28)
  {
LABEL_16:
    __break(1u);
    return;
  }
  [v28 _setShouldScaleDownBehindDescendantSheets:0];

LABEL_7:
  v29 = *(void **)&v2[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_region];
  if (v29)
  {
    v19(v66, v18, v10);
    id v30 = v29;
    v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Fetch all entities", v33, 2u);
      swift_slowDealloc();
    }

    v23(v66, v10);
    v34 = (void **)ENManagerAdapter.defaultAdapter.unsafeMutableAddressor();
    swift_beginAccess();
    v35 = *v34;
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v2;
    *(void *)(v36 + 24) = v30;
    v37 = *(void (**)(uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t))((swift_isaMask & *v35) + 0x180);
    v66 = (char *)v30;
    v38 = v35;
    v39 = v2;
    v37(sub_10000876C, v36);

    swift_release();
    sub_100008774(0, &qword_1000120E8);
    v40 = (void *)static OS_dispatch_queue.main.getter();
    v41 = v56;
    static DispatchTime.now()();
    v42 = v57;
    + infix(_:_:)();
    uint64_t v43 = v60;
    uint64_t v59 = *(void *)(v59 + 8);
    ((void (*)(char *, uint64_t))v59)(v41, v60);
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = v39;
    aBlock[4] = sub_1000087E8;
    aBlock[5] = v44;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006620;
    aBlock[3] = &unk_10000C620;
    v45 = _Block_copy(aBlock);
    v46 = v39;
    swift_release();
    v47 = v61;
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100008808();
    sub_100008460(&qword_1000120F8);
    sub_100008860();
    v48 = v63;
    uint64_t v49 = v58;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
    _Block_release(v45);

    (*(void (**)(char *, uint64_t))(v65 + 8))(v48, v49);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v47, v64);
    ((void (*)(char *, uint64_t))v59)(v42, v43);
  }
  else
  {
    v50 = v55;
    v19(v55, v18, v10);
    v51 = Logger.logObject.getter();
    uint64_t v52 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v51, (os_log_type_t)v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, (os_log_type_t)v52, "Cannot create onboarding stack without region.", v53, 2u);
      swift_slowDealloc();
    }

    v23(v50, v10);
  }
}

uint64_t sub_100005090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v59 = a7;
  uint64_t v62 = a6;
  uint64_t v8 = (void *)type metadata accessor for Logger();
  uint64_t v9 = *(v8 - 1);
  uint64_t v10 = __chkstk_darwin(v8);
  v61 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v60 = (char *)&v58 - v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v58 - v14;
  uint64_t v16 = Logger.buddy.unsafeMutableAddressor();
  v17 = *(void (**)(char *, uint64_t, void *))(v9 + 16);
  v17(v15, v16, v8);
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Got entities", v20, 2u);
    swift_slowDealloc();
  }

  v23 = *(char **)(v9 + 8);
  v22 = (char *)(v9 + 8);
  os_log_type_t v21 = v23;
  ((void (*)(char *, void *))v23)(v15, v8);
  if (a5)
  {
    v24 = v61;
    v17(v61, v16, v8);
    swift_errorRetain();
    swift_errorRetain();
    swift_errorRetain();
    id v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v60 = v22;
      id v28 = (uint8_t *)v27;
      aBlock[0] = swift_slowAlloc();
      id v59 = v8;
      *(_DWORD *)id v28 = 136315138;
      uint64_t v64 = a5;
      swift_errorRetain();
      sub_100008460(&qword_100012108);
      uint64_t v29 = String.init<A>(describing:)();
      uint64_t v64 = sub_1000076EC(v29, v30, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Could not fetch entities: %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, id))v21)(v61, v59);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      ((void (*)(char *, void *))v21)(v24, v8);
    }
    uint64_t v42 = swift_allocObject();
    uint64_t v43 = v62;
    *(void *)(v42 + 16) = v62;
    aBlock[4] = (uint64_t)sub_100008984;
    aBlock[5] = v42;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100006620;
    aBlock[3] = (uint64_t)&unk_10000C6E8;
    uint64_t v44 = _Block_copy(aBlock);
    id v45 = v43;
    swift_release();
    [v45 dismissViewControllerAnimated:1 completion:v44];
    _Block_release(v44);
    return swift_errorRelease();
  }
  else
  {
    v31 = v60;
    v17(v60, v16, v8);
    id v32 = v59;
    v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.info.getter();
    v35 = &OBJC_INSTANCE_METHODS_UISceneDelegate;
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v36 = swift_slowAlloc();
      v61 = v21;
      v37 = (uint8_t *)v36;
      aBlock[0] = swift_slowAlloc();
      id v59 = v8;
      *(_DWORD *)v37 = 136315138;
      id v38 = [v32 regionCode:v37 + 4];
      uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v41 = v40;

      uint64_t v64 = sub_1000076EC(v39, v41, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      v35 = &OBJC_INSTANCE_METHODS_UISceneDelegate;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Fetch agency model for region %s", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, id))v61)(v60, v59);
    }
    else
    {

      ((void (*)(char *, void *))v21)(v31, v8);
    }
    v47 = (id *)ENManagerAdapter.defaultAdapter.unsafeMutableAddressor();
    swift_beginAccess();
    v48 = *v47;
    id v49 = [v32 *(SEL *)&v35[338]];
    uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v52 = v51;

    uint64_t v53 = swift_allocObject();
    v54 = v62;
    *(void *)(v53 + 16) = v32;
    *(void *)(v53 + 24) = v54;
    v55 = *(void (**)(uint64_t, uint64_t, void, void (*)(NSObject *, uint64_t), uint64_t))((swift_isaMask & *v48) + 0x178);
    id v56 = v32;
    id v57 = v54;
    v55(v50, v52, 0, sub_10000890C, v53);

    swift_bridgeObjectRelease();
    return swift_release();
  }
}

void sub_100005750(NSObject *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v54 - v13;
  if (a1)
  {
    os_log_t v57 = a1;
    uint64_t v58 = (uint64_t)a3;
    uint64_t v15 = a1;
    uint64_t v16 = Logger.buddy.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v16, v8);
    v17 = v15;
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v56 = v8;
      v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      id v59 = a4;
      aBlock[0] = v21;
      *(_DWORD *)v20 = 136315138;
      v54[1] = v20 + 4;
      id v22 = [*(id *)((char *)&v17->isa + direct field offset for ENUIPublicHealthAgencyModel.region) regionCode];
      uint64_t v55 = v9;
      id v23 = v22;
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v26 = v25;

      uint64_t v60 = sub_1000076EC(v24, v26, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Got agency model for region %s", v20, 0xCu);
      swift_arrayDestroy();
      a4 = v59;
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v55 + 8))(v12, v56);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    uint64_t v39 = *(void **)ViewControllerFactory.shared.unsafeMutableAddressor();
    unint64_t v40 = v17;
    unint64_t v41 = v39;
    uint64_t v42 = (id *)ENManagerAdapter.defaultAdapter.unsafeMutableAddressor();
    swift_beginAccess();
    uint64_t v43 = *v42;
    uint64_t v44 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v45 = *(uint64_t (**)(os_log_t, void *, uint64_t, void, void, void (*)(uint64_t), uint64_t))((swift_isaMask & *v41) + 0xB0);
    v46 = v43;
    swift_retain();
    v47 = (void *)v45(v57, v46, 1, 0, 0, sub_10000894C, v44);

    swift_release_n();
    [v47 setModalPresentationStyle:2];
    [a4 presentViewController:v47 animated:1 completion:0];
    *((unsigned char *)a4 + OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_didPresent) = 1;
    swift_beginAccess();
    v48 = *(void (**)(uint64_t, uint64_t))((swift_isaMask & *(void *)*v42) + 0x140);
    id v49 = *v42;
    v48(v58, 2);
  }
  else
  {
    id v59 = a4;
    uint64_t v27 = Logger.buddy.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v27, v8);
    id v28 = a3;
    swift_errorRetain();
    id v29 = v28;
    swift_errorRetain();
    unint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      os_log_t v57 = v30;
      os_log_type_t v34 = (void *)v33;
      uint64_t v58 = swift_slowAlloc();
      aBlock[0] = v58;
      *(_DWORD *)uint64_t v32 = 138412546;
      uint64_t v55 = v9;
      uint64_t v56 = v8;
      uint64_t v60 = (uint64_t)v29;
      id v35 = v29;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *os_log_type_t v34 = v29;

      *(_WORD *)(v32 + 12) = 2080;
      uint64_t v60 = a2;
      swift_errorRetain();
      sub_100008460(&qword_100012110);
      uint64_t v36 = String.init<A>(describing:)();
      uint64_t v60 = sub_1000076EC(v36, v37, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      os_log_t v38 = v57;
      _os_log_impl((void *)&_mh_execute_header, v57, v31, "Did not get agency model for %@: %s", (uint8_t *)v32, 0x16u);
      sub_100008460(&qword_1000120E0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v55 + 8))(v14, v56);
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
    uint64_t v50 = swift_allocObject();
    uint64_t v51 = v59;
    *(void *)(v50 + 16) = v59;
    aBlock[4] = (uint64_t)sub_100008984;
    aBlock[5] = v50;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100006620;
    aBlock[3] = (uint64_t)&unk_10000C738;
    uint64_t v52 = _Block_copy(aBlock);
    id v53 = v51;
    swift_release();
    [v53 dismissViewControllerAnimated:1 completion:v52];
    _Block_release(v52);
  }
}

void sub_100005E94(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&aBlock[-1] - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&aBlock[-1] - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&aBlock[-1] - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&aBlock[-1] - v16;
  switch(a1)
  {
    case 0:
      uint64_t v18 = Logger.buddy.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v17, v18, v2);
      os_log_type_t v19 = Logger.logObject.getter();
      os_log_type_t v20 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v19, v20)) {
        goto LABEL_13;
      }
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "User cancelled", v21, 2u);
      goto LABEL_12;
    case 1:
      uint64_t v31 = Logger.buddy.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v15, v31, v2);
      os_log_type_t v19 = Logger.logObject.getter();
      os_log_type_t v32 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v19, v32))
      {
        uint64_t v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v33 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, v32, "User completed", v33, 2u);
        v17 = v15;
        goto LABEL_12;
      }
      uint64_t v6 = v15;
      break;
    case 2:
      uint64_t v25 = Logger.buddy.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v12, v25, v2);
      os_log_type_t v19 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v19, v26))
      {
        uint64_t v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, v26, "User opted out", v27, 2u);
        v17 = v12;
        goto LABEL_12;
      }
      uint64_t v6 = v12;
      break;
    case 3:
      uint64_t v28 = Logger.buddy.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v28, v2);
      os_log_type_t v19 = Logger.logObject.getter();
      os_log_type_t v29 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v19, v29))
      {
        unint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, v29, "Region unavailable", v30, 2u);
        v17 = v9;
LABEL_12:
        swift_slowDealloc();
LABEL_13:
        uint64_t v6 = v17;
      }
      else
      {
        uint64_t v6 = v9;
      }
      break;
    case 4:
      uint64_t v22 = Logger.buddy.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v22, v2);
      os_log_type_t v19 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v19, v23)) {
        break;
      }
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v23, "System Error", v24, 2u);
      v17 = v6;
      goto LABEL_12;
    default:
      aBlock[0] = a1;
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      JUMPOUT(0x1000063ECLL);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v35 = (void *)Strong;
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v35;
    aBlock[4] = sub_100008984;
    aBlock[5] = v36;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006620;
    aBlock[3] = &unk_10000C7B0;
    unint64_t v37 = _Block_copy(aBlock);
    id v38 = v35;
    swift_release();
    [v38 dismissViewControllerAnimated:1 completion:v37];
    _Block_release(v37);
  }
}

void sub_100006400(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*((unsigned char *)a1 + OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_didPresent) & 1) == 0)
  {
    uint64_t v6 = Logger.buddy.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Did not hear back from EN within 5 seconds, so dismissing.", v9, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a1;
    aBlock[4] = sub_100008904;
    aBlock[5] = v10;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006620;
    aBlock[3] = &unk_10000C670;
    uint64_t v11 = _Block_copy(aBlock);
    id v12 = a1;
    swift_release();
    [v12 dismissViewControllerAnimated:0 completion:v11];
    _Block_release(v11);
  }
}

uint64_t sub_100006620(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000066B8(void *a1)
{
  if ([a1 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_10000857C((uint64_t)v3, (uint64_t)v4);
  if (!v5) {
    return sub_1000085E4((uint64_t)v4);
  }
  sub_100008460(&qword_1000120D0);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    [v2 dismiss];
    [v2 invalidate];
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_100006790(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  v90 = &v74[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = &v74[-v14];
  __chkstk_darwin(v13);
  os_log_type_t v19 = &v74[-v18];
  if (a1)
  {
    v83 = v17;
    v84 = v16;
    v89 = v3;
    id v20 = a1;
    uint64_t v21 = Logger.buddy.unsafeMutableAddressor();
    uint64_t v22 = *(void (**)(void))(v8 + 16);
    uint64_t v86 = v8 + 16;
    uint64_t v87 = v21;
    v88 = (void (*)(unsigned char *, uint64_t, uint64_t))v22;
    v22(v19);
    id v23 = v20;
    uint64_t v24 = Logger.logObject.getter();
    int v25 = static os_log_type_t.info.getter();
    BOOL v26 = os_log_type_enabled(v24, (os_log_type_t)v25);
    v82 = v15;
    if (v26)
    {
      int v75 = v25;
      uint64_t v85 = v8;
      uint64_t v78 = v7;
      uint64_t v79 = a3;
      v80 = a2;
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      uint64_t v77 = swift_slowAlloc();
      v93[0] = v77;
      *(_DWORD *)uint64_t v27 = 138412546;
      *(void *)&long long v94 = v23;
      id v81 = v23;
      id v29 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v76 = v28;
      *uint64_t v28 = a1;

      *(_WORD *)(v27 + 12) = 2080;
      id v30 = [v29 userInfo];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
      }
      else
      {
        uint64_t v32 = 0;
      }
      os_log_type_t v34 = v75;
      *(void *)&long long v94 = v32;
      sub_100008460(&qword_1000120D8);
      uint64_t v35 = String.init<A>(describing:)();
      *(void *)&long long v94 = sub_1000076EC(v35, v36, v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v24, v34, "Configure with context %@ userinfo %s", (uint8_t *)v27, 0x16u);
      sub_100008460(&qword_1000120E0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v8 = v85;
      uint64_t v33 = *(void (**)(unsigned char *, uint64_t))(v85 + 8);
      uint64_t v7 = v78;
      v33(v19, v78);
      a2 = v80;
      a3 = v79;
      id v23 = v81;
    }
    else
    {

      uint64_t v33 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
      v33(v19, v7);
    }
    unint64_t v37 = v90;
    if ([v89 _remoteViewControllerProxy])
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v94 = 0u;
      long long v95 = 0u;
    }
    sub_10000857C((uint64_t)&v94, (uint64_t)v93);
    if (v93[3])
    {
      sub_100008460(&qword_1000120D0);
      if (swift_dynamicCast())
      {
        uint64_t v85 = v8;
        id v38 = v91;
        [v91 setDesiredHardwareButtonEvents:16];
        [v38 setAllowsMenuButtonDismissal:0];
        [v38 setAllowsAlertItems:0];
        id v39 = [v23 userInfo];
        if (v39)
        {
          unint64_t v40 = v39;
          uint64_t v41 = v7;
          uint64_t v42 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

          id v91 = (id)0xD000000000000011;
          unint64_t v92 = 0x8000000100009700;
          AnyHashable.init<A>(_:)();
          if (*(void *)(v42 + 16) && (unint64_t v43 = sub_100007D44((uint64_t)v93), (v44 & 1) != 0))
          {
            sub_10000851C(*(void *)(v42 + 56) + 32 * v43, (uint64_t)&v94);
          }
          else
          {
            long long v94 = 0u;
            long long v95 = 0u;
          }
          sub_100008644((uint64_t)v93);
          if (*((void *)&v95 + 1))
          {
            if (swift_dynamicCast())
            {
              v90 = v38;
              *(void *)&long long v94 = 0xD000000000000015;
              *((void *)&v94 + 1) = 0x8000000100009720;
              AnyHashable.init<A>(_:)();
              if (*(void *)(v42 + 16) && (unint64_t v49 = sub_100007D44((uint64_t)v93), (v50 & 1) != 0))
              {
                sub_10000851C(*(void *)(v42 + 56) + 32 * v49, (uint64_t)&v94);
              }
              else
              {
                long long v94 = 0u;
                long long v95 = 0u;
              }
              swift_bridgeObjectRelease();
              sub_100008644((uint64_t)v93);
              if (*((void *)&v95 + 1))
              {
                if (swift_dynamicCast())
                {
                  unint64_t v60 = v92;
LABEL_47:
                  NSString v61 = String._bridgeToObjectiveC()();
                  swift_bridgeObjectRelease();
                  if (v60)
                  {
                    NSString v62 = String._bridgeToObjectiveC()();
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    NSString v62 = 0;
                  }
                  id v63 = [objc_allocWithZone((Class)ENRegion) initWithCountryCode:v61 subdivisionCode:v62];

                  uint64_t v64 = *(void **)&v89[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_region];
                  *(void *)&v89[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_region] = v63;

                  uint64_t v65 = v82;
                  v88(v82, v87, v41);
                  sub_100008450((uint64_t)a2);
                  sub_100008450((uint64_t)a2);
                  v66 = Logger.logObject.getter();
                  os_log_type_t v67 = static os_log_type_t.error.getter();
                  if (os_log_type_enabled(v66, v67))
                  {
                    objc_super v68 = (uint8_t *)swift_slowAlloc();
                    *(void *)&long long v94 = swift_slowAlloc();
                    *(_DWORD *)objc_super v68 = 136315138;
                    id v81 = v23;
                    if (a2)
                    {
                      uint64_t v69 = swift_allocObject();
                      *(void *)(v69 + 16) = a2;
                      *(void *)(v69 + 24) = a3;
                      v70 = sub_100008998;
                    }
                    else
                    {
                      v70 = 0;
                      uint64_t v69 = 0;
                    }
                    v93[0] = (uint64_t)v70;
                    v93[1] = v69;
                    sub_100008450((uint64_t)a2);
                    sub_100008460(&qword_1000120B8);
                    uint64_t v72 = String.init<A>(describing:)();
                    v93[0] = sub_1000076EC(v72, v73, (uint64_t *)&v94);
                    UnsafeMutableRawBufferPointer.copyMemory(from:)();
                    swift_bridgeObjectRelease();
                    sub_1000083F8((uint64_t)a2);
                    sub_1000083F8((uint64_t)a2);
                    _os_log_impl((void *)&_mh_execute_header, v66, v67, "Calling completion: %s", v68, 0xCu);
                    swift_arrayDestroy();
                    swift_slowDealloc();
                    swift_slowDealloc();

                    uint64_t v71 = ((uint64_t (*)(unsigned char *, uint64_t))v33)(v82, v41);
                    id v23 = v81;
                  }
                  else
                  {
                    sub_1000083F8((uint64_t)a2);
                    sub_1000083F8((uint64_t)a2);

                    uint64_t v71 = ((uint64_t (*)(unsigned char *, uint64_t))v33)(v65, v41);
                  }
                  if (a2) {
                    a2(v71);
                  }
                  goto LABEL_38;
                }
              }
              else
              {
                sub_1000085E4((uint64_t)&v94);
              }
              unint64_t v60 = 0;
              goto LABEL_47;
            }
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
            sub_1000085E4((uint64_t)&v94);
          }
          uint64_t v56 = v84;
          v88(v84, v87, v7);
          os_log_t v57 = Logger.logObject.getter();
          os_log_type_t v58 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v57, v58))
          {
            id v59 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v59 = 0;
            _os_log_impl((void *)&_mh_execute_header, v57, v58, "Did not get region country code, but we need it for the region.", v59, 2u);
            swift_slowDealloc();
          }

          uint64_t v55 = ((uint64_t (*)(unsigned char *, uint64_t))v33)(v56, v7);
          if (!a2) {
            goto LABEL_38;
          }
        }
        else
        {
          uint64_t v51 = v83;
          v88(v83, v87, v7);
          uint64_t v52 = Logger.logObject.getter();
          os_log_type_t v53 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v52, v53))
          {
            v54 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v54 = 0;
            _os_log_impl((void *)&_mh_execute_header, v52, v53, "Did not get user info, but we need it for the region.", v54, 2u);
            swift_slowDealloc();
          }

          uint64_t v55 = ((uint64_t (*)(unsigned char *, uint64_t))v33)(v51, v7);
          if (!a2) {
            goto LABEL_38;
          }
        }
        a2(v55);
LABEL_38:
        swift_unknownObjectRelease();
LABEL_39:

        return;
      }
    }
    else
    {
      sub_1000085E4((uint64_t)v93);
    }
    v88(v37, v87, v7);
    id v45 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "Could not get a SBUIRemoteAlertHostInterface", v47, 2u);
      swift_slowDealloc();
    }

    uint64_t v48 = ((uint64_t (*)(unsigned char *, uint64_t))v33)(v37, v7);
    if (a2) {
      a2(v48);
    }
    goto LABEL_39;
  }
}

id sub_100007684()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthENBuddyContainer();
  return [super dealloc];
}

uint64_t type metadata accessor for HealthENBuddyContainer()
{
  return self;
}

uint64_t sub_1000076EC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000077C0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000851C((uint64_t)v12, *a3);
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
      sub_10000851C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000084CC((uint64_t)v12);
  return v7;
}

uint64_t sub_1000077C0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000797C(a5, a6);
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

uint64_t sub_10000797C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007A14(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100007BF4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100007BF4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007A14(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100007B8C(v2, 0);
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

void *sub_100007B8C(uint64_t a1, uint64_t a2)
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
  sub_100008460(&qword_1000120C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100007BF4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100008460(&qword_1000120C0);
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

unint64_t sub_100007D44(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100007D88(a1, v4);
}

unint64_t sub_100007D88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000086D0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100008644((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100007E50(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = Logger.buddy.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  sub_100008450((uint64_t)a1);
  sub_100008450((uint64_t)a1);
  int64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    size_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v20 = v17;
    *(_DWORD *)size_t v11 = 136315138;
    if (a1)
    {
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = a1;
      *(void *)(v12 + 24) = a2;
      uint64_t v13 = sub_1000084A4;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v12 = 0;
    }
    uint64_t v18 = (uint64_t)v13;
    uint64_t v19 = v12;
    sub_100008450((uint64_t)a1);
    sub_100008460(&qword_1000120B8);
    uint64_t v14 = String.init<A>(describing:)();
    uint64_t v18 = sub_1000076EC(v14, v15, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_1000083F8((uint64_t)a1);
    sub_1000083F8((uint64_t)a1);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "prepareForActivation with completion: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_1000083F8((uint64_t)a1);
    sub_1000083F8((uint64_t)a1);
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (a1) {
    return a1(result);
  }
  return result;
}

void sub_1000080F4(uint64_t a1)
{
  if (!a1) {
    goto LABEL_33;
  }
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_100008774(0, &qword_1000120A8);
    sub_100008388();
    Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v18;
    uint64_t v16 = v19;
    uint64_t v2 = v20;
    uint64_t v3 = v21;
    unint64_t v4 = v22;
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
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_11;
  }
  while (1)
  {
    if (v4)
    {
      uint64_t v9 = (v4 - 1) & v4;
      unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
      uint64_t v11 = v3;
      goto LABEL_28;
    }
    int64_t v13 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v13 >= v8) {
      goto LABEL_31;
    }
    unint64_t v14 = *(void *)(v16 + 8 * v13);
    uint64_t v11 = v3 + 1;
    if (!v14)
    {
      uint64_t v11 = v3 + 2;
      if (v3 + 2 >= v8) {
        goto LABEL_31;
      }
      unint64_t v14 = *(void *)(v16 + 8 * v11);
      if (!v14)
      {
        uint64_t v11 = v3 + 3;
        if (v3 + 3 >= v8) {
          goto LABEL_31;
        }
        unint64_t v14 = *(void *)(v16 + 8 * v11);
        if (!v14)
        {
          uint64_t v11 = v3 + 4;
          if (v3 + 4 >= v8) {
            goto LABEL_31;
          }
          unint64_t v14 = *(void *)(v16 + 8 * v11);
          if (!v14)
          {
            uint64_t v15 = v3 + 5;
            while (v8 != v15)
            {
              unint64_t v14 = *(void *)(v16 + 8 * v15++);
              if (v14)
              {
                uint64_t v11 = v15 - 1;
                goto LABEL_27;
              }
            }
LABEL_31:
            sub_1000083F0();
            return;
          }
        }
      }
    }
LABEL_27:
    uint64_t v9 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
LABEL_28:
    id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v12) {
      goto LABEL_31;
    }
    while (1)
    {
      [v12 events];

      uint64_t v3 = v11;
      unint64_t v4 = v9;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_11:
      if (__CocoaSet.Iterator.next()())
      {
        sub_100008774(0, &qword_1000120A8);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v12 = v17;
        swift_unknownObjectRelease();
        uint64_t v11 = v3;
        uint64_t v9 = v4;
        if (v17) {
          continue;
        }
      }
      goto LABEL_31;
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
}

unint64_t sub_100008388()
{
  unint64_t result = qword_1000120B0;
  if (!qword_1000120B0)
  {
    sub_100008774(255, &qword_1000120A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000120B0);
  }
  return result;
}

uint64_t sub_1000083F0()
{
  return swift_release();
}

uint64_t sub_1000083F8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100008408()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008440()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100008450(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100008460(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000084A4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000084CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000851C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000857C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008460(&qword_1000120C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000085E4(uint64_t a1)
{
  uint64_t v2 = sub_100008460(&qword_1000120C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008644(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008698()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000086D0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000872C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000876C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100005090(a1, a2, a3, a4, a5, *(void **)(v5 + 16), *(void **)(v5 + 24));
}

uint64_t sub_100008774(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000087B0()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000087E8()
{
  sub_100006400(*(void **)(v0 + 16));
}

uint64_t sub_1000087F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008800()
{
  return swift_release();
}

unint64_t sub_100008808()
{
  unint64_t result = qword_1000120F0;
  if (!qword_1000120F0)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000120F0);
  }
  return result;
}

unint64_t sub_100008860()
{
  unint64_t result = qword_100012100;
  if (!qword_100012100)
  {
    sub_1000088BC(&qword_1000120F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100012100);
  }
  return result;
}

uint64_t sub_1000088BC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008904()
{
  return sub_1000066B8(*(void **)(v0 + 16));
}

void sub_10000890C(NSObject *a1, uint64_t a2)
{
  sub_100005750(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_100008914()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000894C(uint64_t a1)
{
}

uint64_t sub_10000899C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t ENManagerAdapter.defaultAdapter.unsafeMutableAddressor()
{
  return ENManagerAdapter.defaultAdapter.unsafeMutableAddressor();
}

uint64_t ViewControllerFactory.shared.unsafeMutableAddressor()
{
  return ViewControllerFactory.shared.unsafeMutableAddressor();
}

uint64_t Logger.buddy.unsafeMutableAddressor()
{
  return Logger.buddy.unsafeMutableAddressor();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
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

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
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

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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