double variable initialization expression of PASVSSetupFlowController.targetDevice@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(void *)(a1 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t variable initialization expression of PASVSSetupFlowController.delegate()
{
  return 0;
}

uint64_t PASVSSetupFlowController.deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_100007E60(v0 + 40, &qword_1000222F0);
  sub_100007E60(v0 + 96, &qword_100021E50);
  sub_100004C50(v0 + 136);
  sub_100009958(v0 + 152);
  return v0;
}

uint64_t sub_100004C0C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004C50(uint64_t a1)
{
  return a1;
}

uint64_t PASVSSetupFlowController.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_100007E60(v0 + 40, &qword_1000222F0);
  sub_100007E60(v0 + 96, &qword_100021E50);
  sub_100004C50(v0 + 136);
  sub_100009958(v0 + 152);

  return _swift_deallocClassInstance(v0, 192, 7);
}

Swift::Void __swiftcall PASVSSetupFlowController.initiateClientConnectionIfEligible()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100004C0C(&qword_100022310);
  __chkstk_darwin(v2 - 8);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = PASLogger.viewService.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "PASVSSetupFlowController initiateClientConnectionIfEligible", v12, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v14 = static MainActor.shared.getter();
  v15 = (void *)swift_allocObject();
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v1;
  sub_10000573C((uint64_t)v4, (uint64_t)&unk_100021E60, (uint64_t)v15);
  swift_release();
}

uint64_t sub_100004F30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = type metadata accessor for Logger();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  type metadata accessor for MainActor();
  v4[6] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[7] = v7;
  v4[8] = v6;
  return _swift_task_switch(sub_100005024, v7, v6);
}

uint64_t sub_100005024()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[9] = Strong;
  if (Strong)
  {
    uint64_t v7 = (uint64_t (*)(void))((char *)&dword_1000225C0 + dword_1000225C0);
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    v0[10] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_100005178;
    return v7();
  }
  else
  {
    swift_retain();
    swift_release();
    uint64_t v4 = v0[2];
    uint64_t v5 = swift_retain_n();
    sub_100008D10(v5, v4, (uint64_t)sub_100007FAC, v4);
    swift_release_n();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_100005178(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(*v1 + 88) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v4 = *(void *)(v2 + 56);
  return _swift_task_switch(sub_1000052A0, v4, v3);
}

uint64_t sub_1000052A0()
{
  char v1 = *(unsigned char *)(v0 + 88);
  swift_release();
  if (v1)
  {
    swift_unknownObjectRelease();
    uint64_t v2 = *(void *)(v0 + 16);
    uint64_t v3 = swift_retain_n();
    sub_100008D10(v3, v2, (uint64_t)sub_100007FAC, v2);
    swift_release_n();
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 32);
    uint64_t v4 = *(void *)(v0 + 40);
    uint64_t v6 = *(void *)(v0 + 24);
    uint64_t v7 = PASLogger.viewService.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "PASVSSetupFlowController initiateClientConnectionIfEligible skipping local authentication per delegate", v10, 2u);
      swift_slowDealloc();
    }
    uint64_t v12 = *(void *)(v0 + 32);
    uint64_t v11 = *(void *)(v0 + 40);
    uint64_t v14 = *(void *)(v0 + 16);
    uint64_t v13 = *(void *)(v0 + 24);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    id v15 = [*(id *)(v14 + 32) delegate];
    if (v15)
    {
      [v15 activateClientConnection];
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_100005468()
{
  return sub_100009678((void (*)(void))&_swift_unknownObjectRelease);
}

uint64_t sub_100005480(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100009CA0;
  return sub_100004F30(a1, v4, v5, v6);
}

BOOL sub_100005534(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  id v2 = v1;
  if (v1)
  {
    [v1 activateClientConnection];
    swift_unknownObjectRelease();
  }
  return v2 == 0;
}

uint64_t sub_100005590(char a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = sub_100004C0C(&qword_100022310);
  uint64_t result = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      v10 = *(void **)(Strong + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension);
      if (v10)
      {
        uint64_t v11 = *(void **)(Strong + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension + 8);
        uint64_t v12 = type metadata accessor for TaskPriority();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
        type metadata accessor for MainActor();
        sub_100009A04(v10, v11);
        swift_retain();
        id v13 = v11;
        uint64_t v14 = static MainActor.shared.getter();
        id v15 = (void *)swift_allocObject();
        v15[2] = v14;
        v15[3] = &protocol witness table for MainActor;
        v15[4] = v10;
        v15[5] = v13;
        sub_10000573C((uint64_t)v8, (uint64_t)&unk_100021FC8, (uint64_t)v15);
        swift_unknownObjectRelease();
        swift_release();

        uint64_t Strong = swift_release();
      }
      else
      {
        uint64_t Strong = swift_unknownObjectRelease();
      }
    }
    return a3(Strong);
  }
  return result;
}

uint64_t sub_10000573C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100007E60(a1, &qword_100022310);
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

uint64_t sub_100005900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t (*a6)(BOOL), uint64_t a7)
{
  uint64_t v51 = a7;
  v52 = a6;
  v50 = a5;
  uint64_t v10 = type metadata accessor for Locale();
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v13 - 8);
  id v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v44 - v21;
  uint64_t v23 = PASLogger.common.unsafeMutableAddressor();
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  if (a2)
  {
    uint64_t v48 = a3;
    v24(v20, v23, v16);
    swift_errorRetain();
    swift_errorRetain();
    v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v49 = a2;
    if (v27)
    {
      v47 = v12;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v45 = a4;
      v29 = (uint8_t *)v28;
      v30 = (void *)swift_slowAlloc();
      v46 = v15;
      *(_DWORD *)v29 = 138543362;
      uint64_t v44 = v16;
      swift_errorRetain();
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      unint64_t v53 = v31;
      uint64_t v16 = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v30 = v31;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Local authentication failed with error %{public}@", v29, 0xCu);
      sub_100004C0C(&qword_100021E68);
      swift_arrayDestroy();
      swift_slowDealloc();
      a4 = v45;
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    v35 = *(void **)(v48 + 32);
    unint64_t v53 = 0;
    unint64_t v54 = 0xE000000000000000;
    _StringGuts.grow(_:)(32);
    swift_bridgeObjectRelease();
    unint64_t v53 = 0xD00000000000001ELL;
    unint64_t v54 = 0x8000000100019F80;
    v36._countAndFlagsBits = a4;
    v36._object = v50;
    String.append(_:)(v36);
    swift_bridgeObjectRetain();
    String.LocalizationValue.init(_:)();
    type metadata accessor for PASVSPrimaryViewController();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v38 = self;
    id v39 = [v38 bundleForClass:ObjCClassFromMetadata];
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    swift_bridgeObjectRelease();
    NSString v40 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    String.LocalizationValue.init(_:)();
    id v41 = [v38 bundleForClass:ObjCClassFromMetadata];
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    NSString v42 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v35 showErrorWithTitle:v40 message:v42];

    a2 = v49;
  }
  else
  {
    v24(v22, v23, v16);
    v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Local authentication succeeded continue with setup", v34, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v16);
  }
  return v52(a2 == 0);
}

uint64_t sub_100005E50(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall PASVSSetupFlowController.activateClientConnection()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = PASLogger.viewService.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "PASVSSetupFlowController activateClientConnection", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v12 = *(void (**)(void (*)(void *), uint64_t, uint64_t, uint64_t))(v10 + 88);
  swift_retain();
  v12(sub_1000078F0, v1, ObjectType, v10);
  (*(void (**)(uint64_t, uint64_t))(v10 + 136))(ObjectType, v10);
}

void sub_1000060C0(void *a1)
{
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v88 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004C0C(&qword_100022310);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  v96 = (char *)v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  v93 = (char *)v88 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v92 = (char *)v88 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v90 = (char *)v88 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  v95 = (char *)v88 - v22;
  __chkstk_darwin(v21);
  v24 = (char *)v88 - v23;
  uint64_t v25 = PASLogger.viewService.unsafeMutableAddressor();
  os_log_type_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v98 = v25;
  v99 = v26;
  ((void (*)(char *))v26)(v24);
  BOOL v27 = a1;
  uint64_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.info.getter();
  BOOL v30 = os_log_type_enabled(v28, v29);
  v94 = v7;
  v89 = v10;
  v100 = (void (*)(char *, uint64_t))(v12 + 16);
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v91 = v12;
    v32 = (uint8_t *)v31;
    v88[0] = swift_slowAlloc();
    v88[1] = v4;
    *(_DWORD *)v32 = 138543362;
    v101 = v27;
    os_log_type_t v33 = v27;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(void *)v88[0] = v27;

    _os_log_impl((void *)&_mh_execute_header, v28, v29, "PASVSSetupFlowController SKEventHandler invoked for event: %{public}@", v32, 0xCu);
    sub_100004C0C(&qword_100021E68);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v12 = v91;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v28 = v27;
  }

  Swift::String v36 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v35 = v12 + 8;
  v34 = v36;
  v36(v24, v11);
  int v37 = [v27 eventType];
  if (v37 <= 119)
  {
    if (v37 == 30)
    {
      unint64_t v54 = v92;
      v99(v92, v98, v11);
      v55 = Logger.logObject.getter();
      os_log_type_t v56 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v55, v56))
      {
        v57 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v57 = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "PASVSSetupFlowController: Exiting PASViewService", v57, 2u);
        swift_slowDealloc();
      }

      v58 = v54;
      goto LABEL_31;
    }
    if (v37 == 41)
    {
      v38 = v93;
      v99(v93, v98, v11);
      id v39 = Logger.logObject.getter();
      os_log_type_t v40 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v39, v40))
      {
        id v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v41 = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "Triggering error flow", v41, 2u);
        swift_slowDealloc();
      }

      v34(v38, v11);
      NSString v42 = *(void **)(v97 + 32);
      String.LocalizationValue.init(_:)();
      type metadata accessor for PASVSPrimaryViewController();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      uint64_t v44 = self;
      id v45 = [v44 bundleForClass:ObjCClassFromMetadata];
      static Locale.current.getter();
      String.init(localized:table:bundle:locale:comment:)();
      NSString v46 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      String.LocalizationValue.init(_:)();
      id v47 = [v44 bundleForClass:ObjCClassFromMetadata];
      static Locale.current.getter();
      String.init(localized:table:bundle:locale:comment:)();
      NSString v48 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v42 showErrorWithTitle:v46 message:v48];

      return;
    }
    goto LABEL_20;
  }
  if (v37 != 140)
  {
    if (v37 == 120)
    {
      uint64_t v49 = v97;
      uint64_t v50 = *(void *)(v97 + 24);
      uint64_t ObjectType = swift_getObjectType();
      int v52 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 32))(ObjectType, v50);
      unint64_t v53 = *(void **)(v49 + 32);
      if (v52 == 3) {
        [v53 showPinEntryError];
      }
      else {
        [v53 authRequested];
      }
      return;
    }
LABEL_20:
    v99(v96, v98, v11);
    v68 = v27;
    v69 = Logger.logObject.getter();
    os_log_type_t v70 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      v72 = (void *)swift_slowAlloc();
      v100 = v34;
      *(_DWORD *)v71 = 138543362;
      v101 = v68;
      v73 = v68;
      uint64_t v91 = v35;
      uint64_t v74 = v11;
      v75 = v73;
      v34 = v100;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v72 = v68;

      uint64_t v11 = v74;
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "PASVSSetupFlowController: Got unhandled event %{public}@", v71, 0xCu);
      sub_100004C0C(&qword_100021E68);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v69 = v68;
    }

    v58 = v96;
LABEL_31:
    v34(v58, v11);
    return;
  }
  id v59 = [v27 error];
  if (v59)
  {
    v60 = v59;
    v99(v95, v98, v11);
    v61 = v60;
    v62 = Logger.logObject.getter();
    os_log_type_t v63 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = (uint8_t *)swift_slowAlloc();
      uint64_t v65 = swift_slowAlloc();
      v100 = v34;
      v66 = (void *)v65;
      *(_DWORD *)v64 = 138543362;
      v61 = v61;
      uint64_t v67 = _swift_stdlib_bridgeErrorToNSError();
      v101 = v67;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v66 = v67;

      _os_log_impl((void *)&_mh_execute_header, v62, v63, "PASVSSetupFlowController: Pairing completed with error: %{public}@", v64, 0xCu);
      sub_100004C0C(&qword_100021E68);
      swift_arrayDestroy();
      v34 = v100;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v62 = v61;
    }

    v58 = v95;
    goto LABEL_31;
  }
  v76 = v90;
  v99(v90, v98, v11);
  v77 = Logger.logObject.getter();
  os_log_type_t v78 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v77, v78))
  {
    v79 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v79 = 0;
    _os_log_impl((void *)&_mh_execute_header, v77, v78, "PASVSSetupFlowController: Activating Message Session", v79, 2u);
    swift_slowDealloc();
  }

  v34(v76, v11);
  uint64_t v80 = *(void *)(v97 + 24);
  uint64_t v81 = swift_getObjectType();
  uint64_t v82 = (*(uint64_t (**)(uint64_t, uint64_t))(v80 + 128))(v81, v80);
  if (v82)
  {
    v83 = (void *)v82;
    uint64_t v84 = type metadata accessor for TaskPriority();
    uint64_t v85 = (uint64_t)v89;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v84 - 8) + 56))(v89, 1, 1, v84);
    v86 = (void *)swift_allocObject();
    v86[2] = 0;
    v86[3] = 0;
    v86[4] = v97;
    v86[5] = v83;
    swift_retain();
    id v87 = v83;
    sub_10000573C(v85, (uint64_t)&unk_100021FA0, (uint64_t)v86);

    swift_release();
  }
}

Swift::Void __swiftcall PASVSSetupFlowController.handleScannedCode(_:)(Swift::String a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_allocWithZone((Class)SKAuthenticationResponseEvent);
  swift_bridgeObjectRetain();
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v8 = [v6 initWithPassword:v7];

  uint64_t v9 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(id, uint64_t, uint64_t))(v9 + 144))(v8, ObjectType, v9);
  uint64_t v11 = PASLogger.viewService.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
  uint64_t v12 = v8;
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v21 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 141558274;
    uint64_t v23 = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v15 + 12) = 2112;
    uint64_t v23 = (uint64_t)v12;
    uint64_t v16 = v12;
    uint64_t v22 = v5;
    uint64_t v17 = v3;
    uint64_t v18 = v2;
    uint64_t v19 = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v21 = v12;

    uint64_t v2 = v18;
    uint64_t v3 = v17;
    uint64_t v5 = v22;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "PASVSSetupFlowController post pairing code: %{mask.hash}@", (uint8_t *)v15, 0x16u);
    sub_100004C0C(&qword_100021E68);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v13 = v12;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Void __swiftcall PASVSSetupFlowController.enableManualPairing()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = PASLogger.viewService.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  NSString v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "PASVSSetupFlowController manual pairing mode enabled...", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40))(3, ObjectType, v10);
  [*(id *)(v1 + 32) showManualPinEntry];
}

Swift::Void __swiftcall PASVSSetupFlowController.invalidateClientConnection()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = PASLogger.viewService.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  NSString v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "PASVSSetupFlowController Connection ended, invalidate server", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v10 + 152))(ObjectType, v10);
}

uint64_t sub_100007268(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = swift_retain();
  a3(v4);

  return swift_release();
}

uint64_t sub_1000072AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 120) = a4;
  *(void *)(v5 + 128) = a5;
  return _swift_task_switch(sub_1000072CC, 0, 0);
}

uint64_t sub_1000072CC()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = *(void **)(v0[15] + 32);
  v0[2] = v0;
  v0[3] = sub_1000073C8;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1000074BC;
  v0[13] = &unk_10001CC20;
  v0[14] = v3;
  [v2 authCompleted:v1 completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1000073C8()
{
  return _swift_task_switch(sub_1000074A8, 0, 0);
}

uint64_t sub_1000074A8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000074BC(uint64_t a1)
{
  return _swift_continuation_resume(*(void *)(a1 + 32));
}

void sub_1000074C4(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000074D0(uint64_t a1, uint64_t a2)
{
  return sub_10000763C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000074E8(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100007560(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000075E0@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100007624(uint64_t a1, uint64_t a2)
{
  return sub_10000763C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000763C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100007680()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000076D4()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100007748()
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

uint64_t sub_1000077D4@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000781C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100007848(uint64_t a1)
{
  uint64_t v2 = sub_100009C28((unint64_t *)&qword_100021FF8);
  uint64_t v3 = sub_100009C28(&qword_100022000);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000078E0(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000078F4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100007930(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100007A0C;
  return v6(a1);
}

uint64_t sub_100007A0C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unsigned char **sub_100007B04(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_100007B14(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  os_log_type_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

void *sub_100007BCC(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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

uint64_t sub_100007C70(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t type metadata accessor for PASVSSetupFlowController()
{
  return self;
}

uint64_t sub_100007CC0()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_100007D6C;
  *(_OWORD *)(v2 + 120) = v3;
  return _swift_task_switch(sub_1000072CC, 0, 0);
}

uint64_t sub_100007D6C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100007E60(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004C0C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100007EBC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007EF4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100007D6C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100021FA8 + dword_100021FA8);
  return v6(a1, v4);
}

BOOL sub_100007FAC()
{
  return sub_100005534(v0);
}

uint64_t sub_100007FB4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004C0C(&qword_100021FC0);
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
    uint64_t v22 = (void *)(v5 + 64);
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
      sub_100009898((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1000098FC(v25, (uint64_t)&v38);
      sub_1000099A8(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
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
    uint64_t result = (uint64_t)sub_100009898(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
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

_OWORD *sub_1000082CC(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_100014F94(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100008494();
      goto LABEL_7;
    }
    sub_100007FB4(v13, a3 & 1);
    unint64_t v19 = sub_100014F94(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_1000098FC(a2, (uint64_t)v21);
      return sub_100008418(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_100009958((uint64_t)v17);

  return sub_100009898(a1, v17);
}

_OWORD *sub_100008418(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_100009898(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

void *sub_100008494()
{
  uint64_t v1 = v0;
  sub_100004C0C(&qword_100021FC0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    sub_1000098FC(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_1000099A8(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_100009898(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
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

unint64_t sub_10000867C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v45 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v45 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  int64_t v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v41 - v10;
  uint64_t v12 = type metadata accessor for Locale();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v13 - 8);
  sub_100004C0C(&qword_100021FB8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100016B30;
  LODWORD(v50) = 1037;
  AnyHashable.init<A>(_:)();
  unint64_t v50 = 0;
  unint64_t v51 = 0xE000000000000000;
  _StringGuts.grow(_:)(31);
  swift_bridgeObjectRelease();
  unint64_t v50 = 0xD00000000000001DLL;
  unint64_t v51 = 0x8000000100019FC0;
  v44._countAndFlagsBits = a1;
  v15._countAndFlagsBits = a1;
  v44._object = a2;
  v15._object = a2;
  String.append(_:)(v15);
  swift_bridgeObjectRetain();
  String.LocalizationValue.init(_:)();
  type metadata accessor for PASVSPrimaryViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v42 = self;
  uint64_t v43 = ObjCClassFromMetadata;
  id v17 = [v42 bundleForClass:ObjCClassFromMetadata];
  static Locale.current.getter();
  uint64_t v18 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = v18;
  *(void *)(inited + 80) = v20;
  unint64_t v21 = sub_100010990(inited);
  id v22 = [self sharedInstance];
  unsigned int v23 = [v22 isFeatureEnabled];

  if (v23)
  {
    LODWORD(v48) = 1061;
    AnyHashable.init<A>(_:)();
    uint64_t v49 = &type metadata for Bool;
    LOBYTE(v48) = 1;
    sub_100009898(&v48, v47);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v46 = v21;
    sub_1000082CC(v47, (uint64_t)&v50, isUniquelyReferenced_nonNull_native);
    unint64_t v21 = v46;
    swift_bridgeObjectRelease();
    sub_1000098A8((uint64_t)&v50);
  }
  if (a3 == 2)
  {
    uint64_t v35 = PASLogger.viewService.unsafeMutableAddressor();
    uint64_t v36 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v35, v45);
    int v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v37, v38))
    {
      long long v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "PASVSSetupFlowController Biometric type is face id", v39, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v36);
  }
  else if (a3 == 1)
  {
    uint64_t v25 = PASLogger.viewService.unsafeMutableAddressor();
    uint64_t v26 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v11, v25, v45);
    long long v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      unint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "PASVSSetupFlowController Biometric type is touch id", v29, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v26);
    LODWORD(v48) = 1030;
    AnyHashable.init<A>(_:)();
    *(void *)&long long v48 = 0;
    *((void *)&v48 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(29);
    swift_bridgeObjectRelease();
    *(void *)&long long v48 = 0xD00000000000001BLL;
    *((void *)&v48 + 1) = 0x8000000100019FE0;
    String.append(_:)(v44);
    swift_bridgeObjectRetain();
    String.LocalizationValue.init(_:)();
    id v30 = [v42 bundleForClass:v43];
    static Locale.current.getter();
    uint64_t v31 = String.init(localized:table:bundle:locale:comment:)();
    uint64_t v33 = v32;
    swift_bridgeObjectRelease();
    uint64_t v49 = &type metadata for String;
    *(void *)&long long v48 = v31;
    *((void *)&v48 + 1) = v33;
    sub_100009898(&v48, v47);
    char v34 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v46 = v21;
    sub_1000082CC(v47, (uint64_t)&v50, v34);
    unint64_t v21 = v46;
    swift_bridgeObjectRelease();
    sub_1000098A8((uint64_t)&v50);
  }
  return v21;
}

void sub_100008D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v71 = a1;
  uint64_t v7 = type metadata accessor for Locale();
  __chkstk_darwin(v7 - 8);
  os_log_type_t v70 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v9 - 8);
  v69 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  Swift::String v15 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  id v17 = (char *)&v66 - v16;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a2;
  v18[3] = a3;
  v18[4] = a4;
  id v19 = objc_allocWithZone((Class)LAContext);
  swift_retain();
  swift_retain();
  id v20 = [v19 init];
  unint64_t v21 = self;
  id v22 = [v21 sharedInstance];
  LODWORD(v19) = [v22 isFeatureEnabled];

  if (v19) {
    uint64_t v23 = 1025;
  }
  else {
    uint64_t v23 = 2;
  }
  aBlock = 0;
  id v68 = v20;
  unsigned int v24 = [v20 canEvaluatePolicy:v23 error:&aBlock];
  os_log_type_t v78 = aBlock;
  if (!v24 || aBlock)
  {
    uint64_t v35 = aBlock;
    uint64_t v36 = PASLogger.common.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v36, v11);
    int v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v67 = v18;
      long long v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = (void *)swift_slowAlloc();
      *(_DWORD *)long long v39 = 138543362;
      swift_beginAccess();
      uint64_t v41 = v78;
      if (v78)
      {
        v66 = v39 + 12;
        aBlock = v78;
        id v42 = v78;
      }
      else
      {
        aBlock = 0;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v40 = v41;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Local authentication failed with error %{public}@", v39, 0xCu);
      sub_100004C0C(&qword_100021E68);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    uint64_t v50 = v71;
    swift_beginAccess();
    if (*(void *)(v50 + 64))
    {
      uint64_t v51 = PASDevice.deviceBiometricKey.getter();
      unint64_t v53 = v52;
      swift_endAccess();
    }
    else
    {
      swift_endAccess();
      unint64_t v53 = (void *)0xED00005343495254;
      uint64_t v51 = 0x454D4F49425F4F4ELL;
    }
    aBlock = 0;
    unint64_t v73 = 0xE000000000000000;
    _StringGuts.grow(_:)(40);
    swift_bridgeObjectRelease();
    aBlock = (void **)0xD000000000000026;
    unint64_t v73 = 0x8000000100019EF0;
    v54._countAndFlagsBits = v51;
    v54._object = v53;
    String.append(_:)(v54);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    String.LocalizationValue.init(_:)();
    type metadata accessor for PASVSPrimaryViewController();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    os_log_type_t v56 = self;
    id v57 = [v56 bundleForClass:ObjCClassFromMetadata];
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    swift_bridgeObjectRelease();
    sub_1000096CC(v50 + 96, (uint64_t)&aBlock);
    v58 = v75;
    if (v75)
    {
      id v59 = v76;
      sub_100009734(&aBlock, (uint64_t)v75);
      (*((void (**)(void *, uint64_t (*)(uint64_t, uint64_t)))v59 + 1))(v58, v59);
      uint64_t v61 = v60;
      sub_100009958((uint64_t)&aBlock);
      if (v61) {
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      sub_100007E60((uint64_t)&aBlock, &qword_100021E50);
    }
    v62 = *(void **)(v50 + 32);
    String.LocalizationValue.init(_:)();
    id v63 = [v56 bundleForClass:ObjCClassFromMetadata];
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    NSString v64 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    v47.super.isa = (Class)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v62 showErrorWithTitle:v64 message:v47.super.isa];

    uint64_t v43 = v68;
  }
  else
  {
    uint64_t v67 = v18;
    uint64_t v25 = PASLogger.common.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v17, v25, v11);
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v28 = 67240192;
      LODWORD(aBlock) = 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "PASBiometryEvaluator result: %{BOOL,public}d", v28, 8u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
    uint64_t v29 = v71;
    swift_beginAccess();
    if (*(void *)(v29 + 64))
    {
      sub_1000097E8(v29 + 40, (uint64_t)&aBlock);
      id v30 = v75;
      uint64_t v31 = v76;
      sub_100009734(&aBlock, (uint64_t)v75);
      uint64_t v32 = (*((uint64_t (**)(void *, void))v31 + 1))(v30, v31);
      char v34 = v33;
      sub_100009844((uint64_t)&aBlock);
    }
    else
    {
      char v34 = (void *)0xE700000000000000;
      uint64_t v32 = 0x4E574F4E4B4E55;
    }
    uint64_t v43 = v68;
    id v44 = [v21 sharedInstance];
    unsigned int v45 = [v44 isFeatureEnabled];

    if (v45) {
      uint64_t v46 = 1025;
    }
    else {
      uint64_t v46 = 2;
    }
    sub_10000867C(v32, v34, (uint64_t)[v43 biometryType]);
    v47.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    long long v48 = (void *)swift_allocObject();
    v48[2] = v71;
    v48[3] = v32;
    v48[4] = v34;
    v48[5] = sub_1000096C0;
    v48[6] = v67;
    v76 = sub_1000097C0;
    v77 = v48;
    aBlock = _NSConcreteStackBlock;
    unint64_t v73 = 1107296256;
    uint64_t v74 = sub_100005E50;
    v75 = &unk_10001CCB0;
    uint64_t v49 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    [v43 evaluatePolicy:v46 options:v47.super.isa reply:v49];
    _Block_release(v49);
  }

  uint64_t v65 = v78;
  swift_release();
}

uint64_t sub_100009660()
{
  return sub_100009678((void (*)(void))&_swift_release);
}

uint64_t sub_100009678(void (*a1)(void))
{
  a1(*(void *)(v1 + 16));
  swift_release();

  return _swift_deallocObject(v1, 40, 7);
}

uint64_t sub_1000096C0(char a1)
{
  return sub_100005590(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t sub_1000096CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004C0C(&qword_100021E50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_100009734(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100009778()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000097C0(uint64_t a1, uint64_t a2)
{
  return sub_100005900(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), *(uint64_t (**)(BOOL))(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_1000097D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000097E0()
{
  return swift_release();
}

uint64_t sub_1000097E8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100009844(uint64_t a1)
{
  return a1;
}

_OWORD *sub_100009898(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000098A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000098FC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100009958(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000099A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_100009A04(id result, void *a2)
{
  if (result)
  {
    swift_retain();
    return a2;
  }
  return result;
}

uint64_t sub_100009A48()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100009A90()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100009CA0;
  return sub_100013FE8();
}

void type metadata accessor for Key(uint64_t a1)
{
}

void type metadata accessor for MGDeviceClass(uint64_t a1)
{
}

void sub_100009B78(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100009BC0()
{
  return sub_100009C28(&qword_100021FE0);
}

uint64_t sub_100009BF4()
{
  return sub_100009C28(&qword_100021FE8);
}

uint64_t sub_100009C28(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009C6C()
{
  return sub_100009C28(&qword_100021FF0);
}

ValueMetadata *type metadata accessor for DTOStatusProvider()
{
  return &type metadata for DTOStatusProvider;
}

uint64_t sub_100009CB4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for AccountSecurityLevelCalculator()
{
  return self;
}

uint64_t sub_100009CE8()
{
  v1[2] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return _swift_task_switch(sub_100009DA8, 0, 0);
}

uint64_t sub_100009DA8()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[10];
  uint64_t v3 = v1[11];
  sub_100009734(v1 + 7, v2);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3))
  {
    uint64_t v5 = v0[4];
    uint64_t v4 = v0[5];
    uint64_t v6 = v0[3];
    uint64_t v7 = PASLogger.viewService.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "PASVSProxCardValidator Suppressing Proximity Apple ID Sign In prox card - Device is in lost mode", v10, 2u);
      swift_slowDealloc();
    }
    uint64_t v12 = v0[4];
    uint64_t v11 = v0[5];
    uint64_t v13 = v0[3];

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void, void, void))v0[1];
    return v14(0, 0, 0);
  }
  else
  {
    uint64_t v16 = (void *)swift_task_alloc();
    v0[6] = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_100009F74;
    return sub_10000A210();
  }
}

uint64_t sub_100009F74(uint64_t a1)
{
  *(void *)(*(void *)v1 + 56) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000A074, 0, 0);
}

uint64_t sub_10000A074()
{
  uint64_t v1 = *(void **)(v0 + 56);
  if (!v1)
  {
    swift_task_dealloc();
    int v13 = 0;
    uint64_t v7 = 0;
    uint64_t v5 = 0;
    int v12 = 0;
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)(*(void *)(v0 + 16) + 136);
  if (v2 && *(unsigned char *)(v2 + direct field offset for PASExtensionManifest.isAccountPickerAvailable) == 1)
  {
    id v3 = [*(id *)(v0 + 56) username];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v7 = v6;
    }
    else
    {

      uint64_t v5 = 0;
      uint64_t v7 = 0;
    }
    swift_task_dealloc();
    goto LABEL_14;
  }
  id v8 = sub_10000AAC8(*(void *)(v0 + 56));
  id v9 = [v1 username];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v11;

    swift_task_dealloc();
    if (v8 != (id)4)
    {
      int v12 = 0;
LABEL_15:
      int v13 = 1;
      goto LABEL_16;
    }
LABEL_14:
    int v12 = 256;
    goto LABEL_15;
  }

  swift_task_dealloc();
  uint64_t v7 = 0;
  if (v8 == (id)4)
  {
    uint64_t v5 = 0;
    goto LABEL_14;
  }
  int v12 = 0;
  int v13 = 1;
  uint64_t v5 = 0;
LABEL_16:
  uint64_t v14 = *(uint64_t (**)(void, uint64_t, uint64_t))(v0 + 8);
  return v14(v12 | v13, v5, v7);
}

uint64_t sub_10000A210()
{
  v1[4] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_10000A2E0, 0, 0);
}

uint64_t sub_10000A2E0()
{
  uint64_t v1 = *(void **)(v0 + 32);
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[6];
  sub_100009734(v1 + 2, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  void *v4 = v0;
  v4[1] = sub_10000A3E4;
  return v6(v2, v3);
}

uint64_t sub_10000A3E4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_10000A644;
  }
  else
  {
    *(void *)(v4 + 88) = a1;
    uint64_t v5 = sub_10000A50C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000A50C()
{
  uint64_t v1 = v0[11];
  if (!v1)
  {
    uint64_t v2 = v0[8];
    uint64_t v3 = v0[5];
    uint64_t v4 = v0[6];
    uint64_t v5 = PASLogger.viewService.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "PASVSProxCardValidator Suppressing Proximity Apple ID Sign In prox card - No primary account found", v8, 2u);
      swift_slowDealloc();
    }
    uint64_t v9 = v0[8];
    uint64_t v10 = v0[5];
    uint64_t v11 = v0[6];

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  int v12 = (uint64_t (*)(uint64_t))v0[1];
  return v12(v1);
}

uint64_t sub_10000A644()
{
  unint64_t v21 = v0;
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v4 = PASLogger.viewService.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[10];
    uint64_t v8 = v0[6];
    uint64_t v18 = v0[5];
    uint64_t v19 = v0[7];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v20 = v10;
    v0[2] = v7;
    swift_errorRetain();
    sub_100004C0C(&qword_100022190);
    uint64_t v11 = String.init<A>(describing:)();
    v0[3] = sub_10001493C(v11, v12, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "PASVSProxCardValidator, failed trying to find local account %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v19, v18);
  }
  else
  {
    uint64_t v14 = v0[6];
    uint64_t v13 = v0[7];
    uint64_t v15 = v0[5];
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16(0);
}

uint64_t sub_10000A8A4()
{
  sub_100009958(v0 + 16);
  sub_100009958(v0 + 56);
  sub_100009958(v0 + 96);

  return _swift_deallocClassInstance(v0, 144, 7);
}

uint64_t type metadata accessor for PASVSProxCardValidator()
{
  return self;
}

uint64_t destroy for PASVSProxCardValidator.ValidatorResult()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s14PASViewService22PASVSProxCardValidatorC15ValidatorResultVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PASVSProxCardValidator.ValidatorResult(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PASVSProxCardValidator.ValidatorResult(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PASVSProxCardValidator.ValidatorResult(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASVSProxCardValidator.ValidatorResult(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PASVSProxCardValidator.ValidatorResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASVSProxCardValidator.ValidatorResult()
{
  return &type metadata for PASVSProxCardValidator.ValidatorResult;
}

id sub_10000AAC8(uint64_t a1)
{
  uint64_t v2 = self;
  id v3 = [v2 sharedInstance];
  id v4 = [v3 altDSIDForAccount:a1];

  if (!v4) {
    return 0;
  }
  id v5 = [v2 sharedInstance];
  id v6 = [v5 authKitAccountWithAltDSID:v4];

  if (!v6) {
    return 0;
  }
  id v7 = [v2 sharedInstance];
  id v8 = [v7 securityLevelForAccount:v6];

  return v8;
}

ValueMetadata *type metadata accessor for ContentView()
{
  return &type metadata for ContentView;
}

uint64_t sub_10000ABD4(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100019948, 1);
}

uint64_t sub_10000ABF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v39 = a1;
  uint64_t v37 = sub_100004C0C(&qword_1000221B0) - 8;
  __chkstk_darwin(v37);
  uint64_t v2 = (uint64_t *)((char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = type metadata accessor for Image.Scale();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004C0C(&qword_1000221B8);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (uint64_t *)((char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_100004C0C(&qword_1000221C0);
  uint64_t v12 = v11 - 8;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v38 = (uint64_t)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v35 - v16;
  __chkstk_darwin(v15);
  uint64_t v36 = (uint64_t)&v35 - v18;
  uint64_t v19 = Image.init(systemName:)();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Image.Scale.large(_:), v3);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v2 + *(int *)(v37 + 36), v6, v3);
  *uint64_t v2 = KeyPath;
  sub_10000B2C4((uint64_t)v2, (uint64_t)v10 + *(int *)(v8 + 44), &qword_1000221B0);
  uint64_t *v10 = v19;
  swift_retain();
  sub_100007E60((uint64_t)v2, &qword_1000221B0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_release();
  uint64_t v21 = static Color.accentColor.getter();
  uint64_t v22 = swift_getKeyPath();
  sub_10000B2C4((uint64_t)v10, (uint64_t)v17, &qword_1000221B8);
  uint64_t v23 = (uint64_t *)&v17[*(int *)(v12 + 44)];
  *uint64_t v23 = v22;
  v23[1] = v21;
  sub_100007E60((uint64_t)v10, &qword_1000221B8);
  uint64_t v24 = v36;
  sub_10000B25C((uint64_t)v17, v36);
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v25 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  LOBYTE(v3) = v30 & 1;
  uint64_t v31 = v38;
  sub_10000B2C4(v24, v38, &qword_1000221C0);
  uint64_t v32 = v39;
  sub_10000B2C4(v31, v39, &qword_1000221C0);
  uint64_t v33 = v32 + *(int *)(sub_100004C0C(&qword_1000221C8) + 48);
  *(void *)uint64_t v33 = v25;
  *(void *)(v33 + 8) = v27;
  *(unsigned char *)(v33 + 16) = v3;
  *(void *)(v33 + 24) = v29;
  sub_10000B328(v25, v27, v3);
  swift_bridgeObjectRetain();
  sub_100007E60(v24, &qword_1000221C0);
  sub_10000B338(v25, v27, v3);
  swift_bridgeObjectRelease();
  return sub_100007E60(v31, &qword_1000221C0);
}

uint64_t sub_10000B004()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10000B020@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100004C0C(&qword_100022198);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v4 = static HorizontalAlignment.center.getter();
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  uint64_t v5 = sub_100004C0C(&qword_1000221A0);
  sub_10000ABF0((uint64_t)&v4[*(int *)(v5 + 44)]);
  char v6 = static Edge.Set.all.getter();
  sub_10000B2C4((uint64_t)v4, a1, &qword_100022198);
  uint64_t v7 = a1 + *(int *)(sub_100004C0C(&qword_1000221A8) + 36);
  *(unsigned char *)uint64_t v7 = v6;
  *(_OWORD *)(v7 + 8) = 0u;
  *(_OWORD *)(v7 + 24) = 0u;
  *(unsigned char *)(v7 + 40) = 1;
  return sub_100007E60((uint64_t)v4, &qword_100022198);
}

uint64_t sub_10000B114()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_10000B138(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Image.Scale();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_10000B204@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000B230()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_10000B25C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004C0C(&qword_1000221C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B2C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004C0C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B328(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000B338(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_10000B34C()
{
  unint64_t result = qword_1000221D0;
  if (!qword_1000221D0)
  {
    sub_10000B3C8(&qword_1000221A8);
    sub_10000B410();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000221D0);
  }
  return result;
}

uint64_t sub_10000B3C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000B410()
{
  unint64_t result = qword_1000221D8;
  if (!qword_1000221D8)
  {
    sub_10000B3C8(&qword_100022198);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000221D8);
  }
  return result;
}

NSString sub_10000B46C()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100022A80 = (uint64_t)result;
  return result;
}

NSString sub_10000B4A4()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100022A88 = (uint64_t)result;
  return result;
}

id sub_10000B5B0()
{
  uint64_t v1 = OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter____lazy_storage___proxCardController;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter____lazy_storage___proxCardController);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter____lazy_storage___proxCardController);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)PRXCardContentViewController) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_10000B624(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate] = 0;
  *(void *)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter] = 0;
  v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_hasEligibleAccountForProxSetup] = 1;
  id v3 = &v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_accountUserName];
  *id v3 = 0;
  v3[1] = 0xE000000000000000;
  id v4 = &v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_targetDevice];
  *(_OWORD *)id v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((void *)v4 + 6) = 0;
  *(void *)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_proxyDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter____lazy_storage___proxCardController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_pinEntryController] = 0;
  sub_10000B2C4(a1, (uint64_t)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_viewDetails], &qword_1000222C0);
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for PASVSSetupEventPresenter();
  id v5 = [super init];
  sub_100007E60(a1, &qword_1000222C0);
  return v5;
}

void sub_10000B734()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)&v93 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v5 - 8);
  objc_super v7 = (char *)&v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v93 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = PASLogger.viewService.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.info.getter();
  BOOL v15 = os_log_type_enabled(v13, v14);
  v101 = v1;
  if (v15)
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "PASVSSetupEventPresenter: About to present prox card", v16, 2u);
    uint64_t v1 = v101;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  id v17 = sub_10000B5B0();
  [v17 setDismissalType:1];

  id v18 = sub_10000B5B0();
  aBlock = 0;
  unint64_t v107 = 0xE000000000000000;
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease();
  *(void *)&v105[0] = 0xD000000000000017;
  *((void *)&v105[0] + 1) = 0x800000010001A540;
  uint64_t v19 = (uint64_t)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_targetDevice];
  swift_beginAccess();
  sub_10000B2C4(v19, (uint64_t)&aBlock, &qword_1000222F0);
  if (v109)
  {
    sub_1000097E8((uint64_t)&aBlock, (uint64_t)v102);
    sub_100007E60((uint64_t)&aBlock, &qword_1000222F0);
    uint64_t v20 = v103;
    uint64_t v21 = v104;
    sub_100009734(v102, v103);
    uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v20, v21);
    uint64_t v24 = v23;
    sub_100009844((uint64_t)v102);
  }
  else
  {
    uint64_t v22 = 0x4E574F4E4B4E55;
    sub_100007E60((uint64_t)&aBlock, &qword_1000222F0);
    uint64_t v24 = (void *)0xE700000000000000;
  }
  v25._countAndFlagsBits = v22;
  v25._object = v24;
  String.append(_:)(v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.LocalizationValue.init(_:)();
  type metadata accessor for PASVSPrimaryViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v27 = self;
  id v28 = [v27 bundleForClass:ObjCClassFromMetadata];
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  swift_bridgeObjectRelease();
  NSString v29 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v18 setTitle:v29];

  id v30 = sub_10000B5B0();
  NSString v31 = String._bridgeToObjectiveC()();
  v110 = (uint64_t (**)(void *, void *))sub_10000C590;
  uint64_t v111 = 0;
  aBlock = _NSConcreteStackBlock;
  unint64_t v107 = 1107296256;
  v108 = sub_10000FA44;
  v109 = &unk_10001CFA0;
  uint64_t v32 = _Block_copy(&aBlock);
  id v94 = self;
  id v33 = [v94 actionWithTitle:v31 style:0 handler:v32];

  _Block_release(v32);
  swift_release();
  [v30 setDismissButtonAction:v33];

  sub_10000B2C4(v19, (uint64_t)&aBlock, &qword_1000222F0);
  v96 = v7;
  uint64_t v100 = ObjCClassFromMetadata;
  id v99 = v27;
  v95 = v4;
  if (v109)
  {
    sub_1000097E8((uint64_t)&aBlock, (uint64_t)v102);
    sub_100007E60((uint64_t)&aBlock, &qword_1000222F0);
    sub_10000F340((uint64_t)v102, (uint64_t)v105);
    sub_100009844((uint64_t)v102);
    sub_10000F3A4(v105, (uint64_t)&aBlock);
  }
  else
  {
    sub_100007E60((uint64_t)&aBlock, &qword_1000222F0);
    v109 = &type metadata for PASDeviceClass;
    v110 = (uint64_t (**)(void *, void *))&protocol witness table for PASDeviceClass;
    LOBYTE(aBlock) = 3;
  }
  sub_10000EADC((uint64_t)&aBlock);
  uint64_t v35 = v34;
  sub_100009958((uint64_t)&aBlock);
  id v36 = sub_10000B5B0();
  id v37 = [v36 contentView];

  [v37 addSubview:v35];
  id v38 = sub_10000B5B0();
  id v39 = [v38 contentView];

  id v40 = [v39 mainContentGuide];
  uint64_t v41 = self;
  sub_100004C0C(&qword_1000222F8);
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_100016FB0;
  id v43 = [v35 topAnchor];
  id v44 = [v40 topAnchor];
  id v45 = [v43 constraintGreaterThanOrEqualToAnchor:v44];

  *(void *)(v42 + 32) = v45;
  id v46 = [v35 bottomAnchor];
  id v47 = [v40 bottomAnchor];
  id v48 = [v46 constraintLessThanOrEqualToAnchor:v47];

  *(void *)(v42 + 40) = v48;
  id v49 = [v35 centerXAnchor];
  id v50 = [v40 centerXAnchor];
  id v51 = [v49 constraintEqualToAnchor:v50];

  *(void *)(v42 + 48) = v51;
  id v98 = v35;
  id v52 = [v35 centerYAnchor];
  id v97 = v40;
  id v53 = [v40 centerYAnchor];
  id v54 = [v52 constraintEqualToAnchor:v53];

  *(void *)(v42 + 56) = v54;
  aBlock = (void **)v42;
  specialized Array._endMutation()();
  sub_10000F2FC(0, &qword_100022300);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v41 activateConstraints:isa];

  sub_10000B2C4(v19, (uint64_t)&aBlock, &qword_1000222F0);
  if (v109)
  {
    sub_1000097E8((uint64_t)&aBlock, (uint64_t)v102);
    sub_100007E60((uint64_t)&aBlock, &qword_1000222F0);
    uint64_t v56 = v103;
    uint64_t v57 = v104;
    sub_100009734(v102, v103);
    uint64_t v58 = (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 8))(v56, v57);
    uint64_t v60 = v59;
    sub_100009844((uint64_t)v102);
  }
  else
  {
    uint64_t v58 = 0x4E574F4E4B4E55;
    sub_100007E60((uint64_t)&aBlock, &qword_1000222F0);
    uint64_t v60 = (void *)0xE700000000000000;
  }
  uint64_t v61 = v101;
  int v62 = v101[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_hasEligibleAccountForProxSetup];
  id v63 = sub_10000B5B0();
  id v64 = v63;
  if (v62 != 1)
  {
    aBlock = 0;
    unint64_t v107 = 0xE000000000000000;
    _StringGuts.grow(_:)(39);
    swift_bridgeObjectRelease();
    aBlock = (void **)0xD000000000000025;
    unint64_t v107 = 0x800000010001A560;
    v70._countAndFlagsBits = v58;
    v70._object = v60;
    String.append(_:)(v70);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    String.LocalizationValue.init(_:)();
    id v71 = [v99 bundleForClass:v100];
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    swift_bridgeObjectRelease();
    NSString v72 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v64 setSubtitle:v72];
    goto LABEL_20;
  }
  id v93 = v63;
  sub_10000B2C4((uint64_t)&v61[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_viewDetails], (uint64_t)&aBlock, &qword_1000222C0);
  uint64_t v65 = v109;
  if (!v109)
  {
    sub_100007E60((uint64_t)&aBlock, &qword_1000222C0);
    goto LABEL_18;
  }
  v66 = v110;
  sub_100009734(&aBlock, (uint64_t)v109);
  uint64_t v67 = v66[1](v65, v66);
  unint64_t v69 = v68;
  sub_100009958((uint64_t)&aBlock);
  if (!v69)
  {
LABEL_18:
    aBlock = 0;
    unint64_t v107 = 0xE000000000000000;
    _StringGuts.grow(_:)(28);
    swift_bridgeObjectRelease();
    aBlock = (void **)0xD00000000000001ALL;
    unint64_t v107 = 0x800000010001A590;
    v73._countAndFlagsBits = v58;
    v73._object = v60;
    String.append(_:)(v73);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    String.LocalizationValue.init(_:)();
    id v74 = [v99 bundleForClass:v100];
    static Locale.current.getter();
    uint64_t v67 = String.init(localized:table:bundle:locale:comment:)();
    unint64_t v69 = v75;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
LABEL_19:
  v76 = (uint64_t *)PASBoldAppleIDPlaceholder.unsafeMutableAddressor();
  uint64_t v77 = *v76;
  unint64_t v78 = v76[1];
  uint64_t v79 = *(void *)&v61[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_accountUserName];
  unint64_t v80 = *(void *)&v61[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_accountUserName + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v61 = v101;
  id v81 = sub_100010C04(v77, v78, v79, v80, (uint64_t)UIFontTextStyleSubheadline, v67, v69);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v82 = v93;
  [v93 setAttributedSubtitle:v81];

  id v64 = sub_10000B5B0();
  String.LocalizationValue.init(_:)();
  id v83 = [v99 bundleForClass:v100];
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  uint64_t v84 = swift_allocObject();
  *(void *)(v84 + 16) = v61;
  uint64_t v85 = v61;
  NSString v86 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v110 = (uint64_t (**)(void *, void *))sub_10000F338;
  uint64_t v111 = v84;
  aBlock = _NSConcreteStackBlock;
  unint64_t v107 = 1107296256;
  v108 = sub_10000FA44;
  v109 = &unk_10001CFF0;
  id v87 = _Block_copy(&aBlock);
  NSString v72 = [v94 actionWithTitle:v86 style:0 handler:v87];

  _Block_release(v87);
  swift_release();

LABEL_20:
  v88 = *(void **)&v61[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController];
  if (v88)
  {
    id v89 = v88;
    id v90 = sub_10000B5B0();
    id v91 = [v89 presentProxCardFlowWithDelegate:v61 initialViewController:v90];

    id v92 = v97;
  }
  else
  {
    id v92 = v98;
    id v91 = v97;
  }
}

void sub_10000C590()
{
}

void sub_10000C5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Locale();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v4 - 8);
  id v5 = sub_10000B5B0();
  String.LocalizationValue.init(_:)();
  type metadata accessor for PASVSPrimaryViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = [self bundleForClass:ObjCClassFromMetadata];
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v5 showActivityIndicatorWithStatus:v8];

  uint64_t v9 = *(void **)(a2 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate);
  if (v9) {
    [v9 initiateClientConnectionIfEligible];
  }
  sub_10000F2FC(0, &qword_1000222C8);
  id v10 = [(id)swift_getObjCClassFromMetadata() defaultCenter];
  if (qword_100021E30 != -1) {
    swift_once();
  }
  [v10 postNotificationName:qword_100022A80 object:0];
}

void sub_10000C808()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = PASLogger.viewService.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "PASVSSetupEventPresenter: Pairing Requested", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v10 = objc_allocWithZone((Class)type metadata accessor for PASVSScannerCardViewController());
  uint64_t v11 = sub_10000FAAC();
  *(void *)&v11[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_delegate] = *(void *)(v1 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  id v12 = sub_10000B5B0();
  id v13 = [v12 navigationController];

  if (v13)
  {
    [v13 pushViewController:v11 animated:1];
  }
}

void sub_10000CA3C()
{
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v2 - 8);
  id v3 = [objc_allocWithZone((Class)PRXPasscodeEntryViewController) init];
  [v3 setNumberOfDigits:6];
  id v4 = v3;
  String.LocalizationValue.init(_:)();
  type metadata accessor for PASVSPrimaryViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v6 = self;
  id v7 = [v6 bundleForClass:ObjCClassFromMetadata];
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v4 setTitle:v8];

  id v9 = v4;
  String.LocalizationValue.init(_:)();
  id v10 = [v6 bundleForClass:ObjCClassFromMetadata];
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v9 setSubtitle:v11];

  [v9 setDismissalType:1];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  *(void *)(v12 + 24) = v0;
  id v13 = v9;
  id v14 = v0;
  NSString v15 = String._bridgeToObjectiveC()();
  id v28 = sub_10000F2B4;
  uint64_t v29 = v12;
  aBlock = _NSConcreteStackBlock;
  uint64_t v25 = 1107296256;
  uint64_t v26 = sub_10000FA44;
  uint64_t v27 = &unk_10001CF28;
  uint64_t v16 = _Block_copy(&aBlock);
  id v17 = [self actionWithTitle:v15 style:0 handler:v16];

  _Block_release(v16);
  swift_release();
  [v13 setDismissButtonAction:v17];

  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v14;
  id v28 = sub_10000F2F4;
  uint64_t v29 = v18;
  aBlock = _NSConcreteStackBlock;
  uint64_t v25 = 1107296256;
  uint64_t v26 = sub_10000CFA8;
  uint64_t v27 = &unk_10001CF78;
  uint64_t v19 = _Block_copy(&aBlock);
  uint64_t v20 = (char *)v14;
  swift_release();
  [v13 setTextEntryCompletionHandler:v19];
  _Block_release(v19);
  id v21 = sub_10000B5B0();
  id v22 = [v21 navigationController];

  if (v22)
  {
    [v22 pushViewController:v13 animated:1];
  }
  uint64_t v23 = *(void **)&v20[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_pinEntryController];
  *(void *)&v20[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_pinEntryController] = v13;
}

void sub_10000CEB0(int a1, id a2, uint64_t a3)
{
  id v4 = [a2 passcodeEntryView];
  [v4 endEditing:1];

  id v5 = *(void **)(a3 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate);
  if (v5) {
    [v5 invalidateClientConnection];
  }
  exit(1);
}

void sub_10000CF18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a3 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate);
  if (v3)
  {
    swift_unknownObjectRetain();
    NSString v4 = String._bridgeToObjectiveC()();
    [v3 handleScannedCode:v4];

    swift_unknownObjectRelease();
  }
}

uint64_t sub_10000CFA8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_10000D05C()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Locale();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v6 - 8);
  id v7 = *(void **)(v0 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_pinEntryController);
  if (v7)
  {
    id v8 = v7;
    String.LocalizationValue.init(_:)();
    type metadata accessor for PASVSPrimaryViewController();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v10 = [self bundleForClass:ObjCClassFromMetadata];
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v8 setSubtitle:v11];

    id v12 = [v8 contentView];
    id v13 = [v12 subtitleLabel];

    if (v13)
    {
      id v14 = [self systemRedColor];
      [v13 setTextColor:v14];
    }
    id v15 = [v8 passcodeEntryView];
    NSString v16 = String._bridgeToObjectiveC()();
    [v15 setText:v16];
  }
  else
  {
    uint64_t v17 = PASLogger.viewService.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v17, v1);
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Attempted to show PIN entry error, but no PIN entry view was found.", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_10000D428(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = type metadata accessor for Logger();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  type metadata accessor for MainActor();
  v2[10] = static MainActor.shared.getter();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[11] = v5;
  v2[12] = v4;
  return _swift_task_switch(sub_10000D51C, v5, v4);
}

uint64_t sub_10000D51C()
{
  id v1 = sub_10000B5B0();
  id v2 = [v1 navigationController];

  if (v2)
  {
    id v3 = sub_10000B5B0();
    id v4 = [v2 popToViewController:v3 animated:0];
  }
  uint64_t v6 = v0[8];
  uint64_t v5 = v0[9];
  uint64_t v7 = v0[7];
  uint64_t v8 = PASLogger.viewService.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
  id v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    NSString v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "PASVSSetupEventPresenter: Pairing Completed", v11, 2u);
    swift_slowDealloc();
  }
  uint64_t v13 = v0[8];
  uint64_t v12 = v0[9];
  uint64_t v15 = v0[6];
  uint64_t v14 = v0[7];

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  sub_10000B5B0();
  id v16 = objc_allocWithZone((Class)type metadata accessor for PASUISourceViewPresenter());
  uint64_t v17 = PASUISourceViewPresenter.init(sharingViewController:)();
  uint64_t v18 = OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter;
  os_log_type_t v19 = *(void **)(v15 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter);
  *(void *)(v15 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter) = v17;

  uint64_t v20 = *(void **)(v15 + v18);
  v0[13] = v20;
  if (v20)
  {
    swift_beginAccess();
    swift_unknownObjectWeakAssign();
    v20;
    uint64_t v21 = (void *)swift_task_alloc();
    v0[14] = v21;
    *uint64_t v21 = v0;
    v21[1] = sub_10000D7B4;
    uint64_t v22 = v0[5];
    return PASUISourceViewPresenter.activate(withTemplate:)(v22);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
}

uint64_t sub_10000D7B4(void *a1)
{
  uint64_t v3 = *v1;
  id v4 = *(void **)(*v1 + 104);
  swift_task_dealloc();

  uint64_t v5 = *(void *)(v3 + 96);
  uint64_t v6 = *(void *)(v3 + 88);
  return _swift_task_switch(sub_10000D8FC, v6, v5);
}

uint64_t sub_10000D8FC()
{
  swift_release();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000DAE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for MainActor();
  v3[5] = static MainActor.shared.getter();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000DB7C, v5, v4);
}

uint64_t sub_10000DB7C()
{
  id v1 = (void *)v0[4];
  uint64_t v3 = (void *)v0[2];
  id v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  id v4 = v3;
  id v5 = v1;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_10000DC40;
  uint64_t v7 = v0[2];
  return sub_10000D428(v7);
}

uint64_t sub_10000DC40()
{
  id v1 = *(void (***)(void))(*v0 + 48);
  id v2 = *(void **)(*v0 + 32);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  id v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_10000DD98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = v4;
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DispatchQoS();
  uint64_t result = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)&v5[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter])
  {
    uint64_t v26 = v16;
    sub_10000F2FC(0, &qword_1000222D0);
    uint64_t v25 = v11;
    uint64_t v24 = static OS_dispatch_queue.main.getter();
    os_log_type_t v19 = (void *)swift_allocObject();
    v19[2] = a1;
    v19[3] = a2;
    v19[4] = a3;
    v19[5] = a4;
    v19[6] = v5;
    aBlock[4] = sub_10000F264;
    aBlock[5] = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000E198;
    aBlock[3] = &unk_10001CED8;
    uint64_t v20 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v21 = v5;
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_10000F168();
    sub_100004C0C(&qword_1000222E0);
    sub_10000F1C0();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    uint64_t v22 = (void *)v24;
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v18, v14);
  }
  return result;
}

void sub_10000E06C()
{
  id v4 = [objc_allocWithZone((Class)PRXCardContentViewController) init];
  NSString v0 = String._bridgeToObjectiveC()();
  [v4 setTitle:v0];

  NSString v1 = String._bridgeToObjectiveC()();
  [v4 setSubtitle:v1];

  [v4 setDismissalType:1];
  id v2 = sub_10000B5B0();
  id v3 = [v2 navigationController];

  if (v3)
  {
    [v3 pushViewController:v4 animated:1];
  }
}

uint64_t sub_10000E198(uint64_t a1)
{
  NSString v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_10000E29C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASVSSetupEventPresenter();
  return [super dealloc];
}

uint64_t type metadata accessor for PASVSSetupEventPresenter()
{
  return self;
}

void sub_10000E3C4()
{
  swift_beginAccess();
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    NSString v1 = *(void **)&Strong[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter];
    *(void *)&Strong[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter] = 0;
  }
  swift_beginAccess();
  uint64_t v2 = swift_unknownObjectWeakLoadStrong();
  if (!v2
    || (id v3 = (void *)v2,
        id v4 = *(void **)(v2 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController),
        id v5 = v4,
        v3,
        !v4))
  {
    exit(0);
  }
  v7[4] = sub_10000E4FC;
  v7[5] = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10000E198;
  v7[3] = &unk_10001CE88;
  uint64_t v6 = _Block_copy(v7);
  [v5 dismissViewControllerAnimated:1 completion:v6];
  _Block_release(v6);
}

void sub_10000E4FC()
{
}

void sub_10000E570()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = PASLogger.viewService.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "PASVSSetupEventPresenter:proxCardFlowDidDismiss", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate);
  if (v10) {
    [v10 invalidateClientConnection];
  }
  sub_10000F2FC(0, &qword_1000222C8);
  id v11 = [(id)swift_getObjCClassFromMetadata() defaultCenter];
  if (qword_100021E38 != -1) {
    swift_once();
  }
  [v11 postNotificationName:qword_100022A88 object:0];

  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10001399C();
    swift_unknownObjectRelease();
  }
  exit(0);
}

uint64_t sub_10000E798(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_100009CA0;
  return v6();
}

uint64_t sub_10000E864(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_100009CA0;
  return v7();
}

uint64_t sub_10000E930(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100007E60(a1, &qword_100022310);
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

void sub_10000EADC(uint64_t a1)
{
  sub_10000F340(a1, (uint64_t)v10);
  sub_100004C0C(&qword_100022308);
  if ((swift_dynamicCast() & 1) != 0 && v9 == 2)
  {
    if (qword_100021E40 != -1) {
      swift_once();
    }
    uint64_t v1 = qword_100021E48;
    swift_bridgeObjectRetain();
    if (v1 != -1) {
      swift_once();
    }
    id v2 = (id)qword_100022AA0;
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v4 = [self imageNamed:v3 inBundle:v2];

    if (v4) {
      goto LABEL_12;
    }
    __break(1u);
  }
  if (qword_100021E48 != -1) {
    swift_once();
  }
  id v5 = (id)qword_100022AA0;
  NSString v6 = String._bridgeToObjectiveC()();
  id v4 = [self imageNamed:v6 inBundle:v5];

  if (v4)
  {
LABEL_12:
    id v7 = [objc_allocWithZone((Class)UIImageView) initWithImage:v4];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = v7;
    [v8 setContentMode:1];

    return;
  }
  __break(1u);
}

uint64_t sub_10000ED10()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  NSString v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v24 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = PASLogger.viewService.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = v5;
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "PASVSSetupEventPresenter: proximitySetupCompleted", v14, 2u);
    uint64_t v5 = v22;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v15 = *(void **)(v23 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate);
  if (v15) {
    [v15 invalidateClientConnection];
  }
  sub_10000F2FC(0, &qword_1000222D0);
  uint64_t v16 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_10000F148;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000E198;
  aBlock[3] = &unk_10001CE60;
  uint64_t v18 = _Block_copy(aBlock);
  swift_release();
  os_log_type_t v19 = v24;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000F168();
  sub_100004C0C(&qword_1000222E0);
  sub_10000F1C0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v19, v4);
}

uint64_t sub_10000F110()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000F148()
{
}

uint64_t sub_10000F150(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000F160()
{
  return swift_release();
}

unint64_t sub_10000F168()
{
  unint64_t result = qword_1000222D8;
  if (!qword_1000222D8)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000222D8);
  }
  return result;
}

unint64_t sub_10000F1C0()
{
  unint64_t result = qword_1000222E8;
  if (!qword_1000222E8)
  {
    sub_10000B3C8(&qword_1000222E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000222E8);
  }
  return result;
}

uint64_t sub_10000F21C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10000F264()
{
}

uint64_t sub_10000F274()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000F2B4(int a1)
{
  sub_10000CEB0(a1, *(id *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000F2BC()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000F2F4(uint64_t a1, uint64_t a2)
{
  sub_10000CF18(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10000F2FC(uint64_t a1, unint64_t *a2)
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

void sub_10000F338(uint64_t a1)
{
  sub_10000C5A4(a1, *(void *)(v1 + 16));
}

uint64_t sub_10000F340(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000F3A4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000F3BC()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000F404()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100007D6C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100022318 + dword_100022318);
  return v6(v2, v3, v4);
}

uint64_t sub_10000F4BC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100009CA0;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100022328 + dword_100022328);
  return v6(v2, v3, v4);
}

uint64_t sub_10000F580()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000F5C0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100009CA0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100022338 + dword_100022338);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000F68C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000F6C4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100007D6C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100022348 + dword_100022348);
  return v6(a1, v4);
}

uint64_t sub_10000F7B4()
{
  uint64_t v0 = sub_100004C0C(&qword_1000223C8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F990();
  WindowGroup.init(id:title:lazyContent:)();
  sub_10000F9E4();
  static SceneBuilder.buildBlock<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000F910()
{
  unint64_t result = qword_1000223C0;
  if (!qword_1000223C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000223C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for PASViewServiceApp()
{
  return &type metadata for PASViewServiceApp;
}

uint64_t sub_10000F974(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100019B00, 1);
}

unint64_t sub_10000F990()
{
  unint64_t result = qword_1000223D0;
  if (!qword_1000223D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000223D0);
  }
  return result;
}

unint64_t sub_10000F9E4()
{
  unint64_t result = qword_1000223D8;
  if (!qword_1000223D8)
  {
    sub_10000B3C8(&qword_1000223C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000223D8);
  }
  return result;
}

void sub_10000FA44(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

char *sub_10000FAAC()
{
  *(void *)&v0[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_delegate] = 0;
  id v1 = objc_allocWithZone((Class)VPScannerProxCardViewController);
  uint64_t v2 = v0;
  id v3 = [v1 init];
  uint64_t v4 = OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_scannerEngineVC;
  *(void *)&v2[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_scannerEngineVC] = v3;

  uint64_t v5 = *(void *)&v2[v4];
  v14.receiver = v2;
  v14.super_class = (Class)type metadata accessor for PASVSScannerCardViewController();
  uint64_t v6 = (char *)[v14 initWithScannerEngine:v5];
  uint64_t v7 = *(void **)&v6[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_scannerEngineVC];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  v13[4] = sub_1000108B8;
  v13[5] = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10000CFA8;
  v13[3] = &unk_10001D150;
  uint64_t v9 = _Block_copy(v13);
  uint64_t v10 = v6;
  id v11 = v7;
  swift_release();
  [v11 setScannedCodeHandler:v9];

  _Block_release(v9);
  return v10;
}

void sub_10000FC0C()
{
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v2 - 8);
  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for PASVSScannerCardViewController();
  [super viewDidLoad];
  [v0 setDismissalType:1];
  String.LocalizationValue.init(_:)();
  type metadata accessor for PASVSPrimaryViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v4 = self;
  id v5 = [v4 bundleForClass:ObjCClassFromMetadata];
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setTitle:v6];

  String.LocalizationValue.init(_:)();
  id v7 = [v4 bundleForClass:ObjCClassFromMetadata];
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setSubtitle:v8];

  String.LocalizationValue.init(_:)();
  id v9 = [v4 bundleForClass:ObjCClassFromMetadata];
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(_:)();
  id v11 = [v4 bundleForClass:ObjCClassFromMetadata];
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(_:)();
  id v13 = [v4 bundleForClass:ObjCClassFromMetadata];
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(_:)();
  id v15 = [v4 bundleForClass:ObjCClassFromMetadata];
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v17 = [v0 dismissalConfirmationActionWithTitle:v10 message:v12 confirmButtonTitle:v14 cancelButtonTitle:v16];

  [v0 setDismissButtonAction:v17];
  id v18 = sub_1000100BC();
}

id sub_1000100BC()
{
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v2 - 8);
  String.LocalizationValue.init(_:)();
  type metadata accessor for PASVSPrimaryViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v4 = [self bundleForClass:ObjCClassFromMetadata];
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v0;
  id v6 = v0;
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_100010898;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000FA44;
  aBlock[3] = &unk_10001D100;
  NSString v8 = _Block_copy(aBlock);
  id v9 = [self actionWithTitle:v7 style:1 handler:v8];

  _Block_release(v8);
  swift_release();
  return v9;
}

void sub_100010328()
{
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v2 - 8);
  [v0 showConfirmationRing];
  [*(id *)&v0[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_scannerEngineVC] stop];
  String.LocalizationValue.init(_:)();
  type metadata accessor for PASVSPrimaryViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v4 = [self bundleForClass:ObjCClassFromMetadata];
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 showActivityIndicatorWithStatus:v5];

  id v6 = *(void **)&v0[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_delegate];
  if (v6)
  {
    swift_unknownObjectRetain();
    NSString v7 = String._bridgeToObjectiveC()();
    [v6 handleScannedCode:v7];

    swift_unknownObjectRelease();
  }
}

id sub_100010644()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASVSScannerCardViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for PASVSScannerCardViewController()
{
  return self;
}

id sub_1000106E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = PASLogger.viewService.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  NSString v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    NSString v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "User has elected manual pairing.", v10, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id result = *(id *)(a2 + OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_delegate);
  if (result) {
    return [result enableManualPairing];
  }
  return result;
}

uint64_t sub_100010860()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100010898(uint64_t a1)
{
  return sub_1000106E8(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000108A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000108B0()
{
  return swift_release();
}

void sub_1000108B8()
{
}

void sub_1000108E8()
{
  qword_100022A90 = 0x64615069786F7250;
  *(void *)algn_100022A98 = 0xEF636972656E6547;
}

id sub_100010918()
{
  type metadata accessor for PASBundleForViewService();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_100022AA0 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for PASBundleForViewService()
{
  return self;
}

unint64_t sub_100010990(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004C0C(&qword_100021FC0);
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
    sub_10000B2C4(v6, (uint64_t)v15, &qword_1000224F0);
    unint64_t result = sub_100014F94((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_100009898(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100010AD4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004C0C(&qword_1000224E0);
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
    sub_10000B2C4(v6, (uint64_t)&v13, &qword_1000224E8);
    uint64_t v7 = v13;
    unint64_t result = sub_100014FD8(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100009898(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

id sub_100010C04(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v14 = sub_100004C0C(&qword_1000224B0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = a6;
  unint64_t v46 = a7;
  uint64_t v43 = a1;
  unint64_t v44 = a2;
  v42[10] = a3;
  v42[11] = a4;
  sub_100010FBC();
  uint64_t v17 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  unint64_t v19 = v18;
  uint64_t v45 = v17;
  unint64_t v46 = v18;
  uint64_t v43 = a3;
  unint64_t v44 = a4;
  uint64_t v20 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v16, 1, 1, v20);
  uint64_t v21 = StringProtocol.range<A>(of:options:range:locale:)();
  unint64_t v23 = v22;
  LOBYTE(a3) = v24;
  sub_100011010((uint64_t)v16);
  if ((a3 & 1) != 0 || (v21 ^ v23) < 0x4000)
  {
    id v40 = objc_allocWithZone((Class)NSAttributedString);
    NSString v39 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v38 = [v40 initWithString:v39];
  }
  else
  {
    uint64_t v45 = v21;
    unint64_t v46 = v23;
    uint64_t v43 = v17;
    unint64_t v44 = v19;
    swift_bridgeObjectRetain();
    sub_100004C0C(&qword_1000224C0);
    sub_100011070();
    uint64_t v25 = _NSRange.init<A, B>(_:in:)();
    uint64_t v27 = v26;
    id v28 = self;
    id v29 = [v28 preferredFontForTextStyle:a5];
    [v29 pointSize];
    double v31 = v30;

    sub_100004C0C(&qword_1000224D0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100016B30;
    *(void *)(inited + 32) = NSFontAttributeName;
    id v33 = NSFontAttributeName;
    id v34 = [v28 systemFontOfSize:v31];
    *(void *)(inited + 64) = sub_1000110CC();
    *(void *)(inited + 40) = v34;
    sub_100010AD4(inited);
    id v35 = objc_allocWithZone((Class)NSMutableAttributedString);
    NSString v36 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_10001110C();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v38 = [v35 initWithString:v36 attributes:isa];

    NSString v39 = [v28 boldSystemFontOfSize:v31];
    [v38 addAttribute:v33 value:v39 range:v25];
  }

  return v38;
}

unint64_t sub_100010FBC()
{
  unint64_t result = qword_1000224B8;
  if (!qword_1000224B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000224B8);
  }
  return result;
}

uint64_t sub_100011010(uint64_t a1)
{
  uint64_t v2 = sub_100004C0C(&qword_1000224B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100011070()
{
  unint64_t result = qword_1000224C8;
  if (!qword_1000224C8)
  {
    sub_10000B3C8(&qword_1000224C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000224C8);
  }
  return result;
}

unint64_t sub_1000110CC()
{
  unint64_t result = qword_1000224D8;
  if (!qword_1000224D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000224D8);
  }
  return result;
}

unint64_t sub_10001110C()
{
  unint64_t result = qword_100021FF8;
  if (!qword_100021FF8)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021FF8);
  }
  return result;
}

uint64_t sub_100011164(void *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v82 = a3;
  uint64_t v7 = sub_100004C0C(&qword_100022310);
  __chkstk_darwin(v7 - 8);
  char v9 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v83 = *(void *)(v10 - 8);
  uint64_t v84 = (void *)v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v74 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v74 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v74 - v19;
  __chkstk_darwin(v18);
  unint64_t v22 = (char *)&v74 - v21;
  if (a1 && (id v23 = [a1 userInfo]) != 0)
  {
    char v24 = v23;
    id v81 = a2;
    uint64_t v25 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v85 = 0x656369766564;
    unint64_t v86 = 0xE600000000000000;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v25 + 16) && (unint64_t v26 = sub_100014F94((uint64_t)v90), (v27 & 1) != 0))
    {
      sub_1000099A8(*(void *)(v25 + 56) + 32 * v26, (uint64_t)&v87);
    }
    else
    {
      long long v87 = 0u;
      long long v88 = 0u;
    }
    sub_1000098A8((uint64_t)v90);
    if (*((void *)&v88 + 1))
    {
      sub_100004C0C(&qword_100022590);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        id v37 = objc_allocWithZone((Class)CBDevice);
        id v49 = sub_100014704();
        unsigned int v50 = [v49 nearbyActionDeviceClass];
        uint64_t v89 = 0;
        long long v87 = 0u;
        long long v88 = 0u;
        if ([self currentDevice])
        {
          LODWORD(v80) = v50;
          PASDevice.init(deviceClass:biometryProvider:ak_device:)();
          uint64_t v52 = (uint64_t)&v4[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_targetDevice];
          swift_beginAccess();
          sub_10001572C((uint64_t)v90, v52, &qword_1000222F0);
          swift_endAccess();
          uint64_t v53 = PASLogger.viewService.unsafeMutableAddressor();
          uint64_t v54 = v83 + 16;
          v55 = *(void (**)(char *, uint64_t, void *))(v83 + 16);
          v55(v22, v53, v84);
          id v56 = v49;
          uint64_t v57 = Logger.logObject.getter();
          os_log_type_t v58 = static os_log_type_t.info.getter();
          int v79 = v58;
          BOOL v59 = os_log_type_enabled(v57, v58);
          uint64_t v78 = v54;
          uint64_t v77 = v53;
          v76 = v55;
          if (v59)
          {
            uint64_t v60 = swift_slowAlloc();
            unint64_t v75 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v60 = 141558274;
            v90[0] = 1752392040;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *(_WORD *)(v60 + 12) = 2112;
            os_log_t v74 = v57;
            v90[0] = (uint64_t)v56;
            id v61 = v56;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            void *v75 = v56;

            os_log_t v62 = v74;
            _os_log_impl((void *)&_mh_execute_header, v74, (os_log_type_t)v79, "PASVSPrimaryViewController Started CoreBluetooth device %{mask.hash}@", (uint8_t *)v60, 0x16u);
            sub_100004C0C(&qword_100021E68);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
          }
          uint64_t v63 = (uint64_t)v81;
          id v49 = v84;
          uint64_t v25 = *(void *)(v83 + 8);
          ((void (*)(char *, void *))v25)(v22, v84);
          uint64_t v64 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_device;
          uint64_t v65 = *(void **)&v4[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_device];
          *(void *)&v4[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_device] = v56;

          if (*(void *)&v4[v64])
          {
            PASServices.shared.unsafeMutableAddressor();
            swift_retain();
            PASServices.registerSourceServices()();
            swift_release();
            uint64_t v66 = type metadata accessor for TaskPriority();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v9, 1, 1, v66);
            type metadata accessor for MainActor();
            uint64_t v67 = v4;
            uint64_t v68 = v82;
            sub_1000155B4(v63);
            uint64_t v69 = static MainActor.shared.getter();
            uint64_t v70 = swift_allocObject();
            *(void *)(v70 + 16) = v69;
            *(void *)(v70 + 24) = &protocol witness table for MainActor;
            *(void *)(v70 + 32) = v67;
            *(_DWORD *)(v70 + 40) = v80;
            *(void *)(v70 + 48) = v63;
            *(void *)(v70 + 56) = v68;
            sub_100012BDC((uint64_t)v9, (uint64_t)&unk_1000225A0, v70);
            return swift_release();
          }
        }
        else
        {
          __break(1u);
        }
        v76(v20, v77, v49);
        id v71 = Logger.logObject.getter();
        os_log_type_t v72 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v71, v72))
        {
          Swift::String v73 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)Swift::String v73 = 0;
          _os_log_impl((void *)&_mh_execute_header, v71, v72, "PASVSPrimaryViewController No remote device, exiting PASViewService.", v73, 2u);
          swift_slowDealloc();
        }

        ((void (*)(char *, void *))v25)(v20, v84);
        exit(-1);
      }
    }
    else
    {
      sub_100007E60((uint64_t)&v87, &qword_100022560);
    }
    uint64_t v38 = PASLogger.viewService.unsafeMutableAddressor();
    uint64_t v40 = v83;
    NSString v39 = v84;
    (*(void (**)(char *, uint64_t, void *))(v83 + 16))(v17, v38, v84);
    swift_bridgeObjectRetain();
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      v90[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 141558274;
      *(void *)&long long v87 = 1752392040;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v80 = v43 + 14;
      swift_bridgeObjectRetain();
      uint64_t v44 = Dictionary.description.getter();
      unint64_t v46 = v45;
      swift_bridgeObjectRelease();
      *(void *)&long long v87 = sub_10001493C(v44, v46, v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "PASVSPrimaryViewController No device to start setup: %{mask.hash}s", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t result = (*(uint64_t (**)(char *, void *))(v83 + 8))(v17, v84);
      id v48 = v81;
      if (!v81) {
        return result;
      }
      return v48(result);
    }

    swift_bridgeObjectRelease_n();
    uint64_t result = (*(uint64_t (**)(char *, void *))(v40 + 8))(v17, v39);
    id v48 = v81;
    if (v81) {
      return v48(result);
    }
  }
  else
  {
    uint64_t v28 = PASLogger.viewService.unsafeMutableAddressor();
    uint64_t v30 = v83;
    id v29 = v84;
    (*(void (**)(char *, uint64_t, void *))(v83 + 16))(v14, v28, v84);
    double v31 = a1;
    uint64_t v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      id v81 = a2;
      uint64_t v34 = swift_slowAlloc();
      id v35 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 141558274;
      v90[0] = 1752392040;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v34 + 12) = 2112;
      if (a1)
      {
        v90[0] = (uint64_t)v31;
        NSString v36 = v31;
      }
      else
      {
        v90[0] = 0;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v35 = a1;

      _os_log_impl((void *)&_mh_execute_header, v32, v33, "PASVSPrimaryViewController No user info dictionary to start setup: %{mask.hash}@", (uint8_t *)v34, 0x16u);
      sub_100004C0C(&qword_100021E68);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      a2 = v81;
      uint64_t v30 = v83;
      id v29 = v84;
    }
    else
    {

      uint64_t v32 = v31;
    }

    uint64_t result = (*(uint64_t (**)(char *, void *))(v30 + 8))(v14, v29);
    if (a2) {
      return a2(result);
    }
  }
  return result;
}

uint64_t sub_100011D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 184) = a6;
  *(void *)(v7 + 192) = a7;
  *(_DWORD *)(v7 + 352) = a5;
  *(void *)(v7 + 176) = a4;
  uint64_t v8 = type metadata accessor for Logger();
  *(void *)(v7 + 200) = v8;
  *(void *)(v7 + 208) = *(void *)(v8 - 8);
  *(void *)(v7 + 216) = swift_task_alloc();
  type metadata accessor for MainActor();
  *(void *)(v7 + 224) = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  *(void *)(v7 + 232) = v10;
  *(void *)(v7 + 240) = v9;
  return _swift_task_switch(sub_100011E50, v10, v9);
}

uint64_t sub_100011E50()
{
  uint64_t v1 = *(void (**)(uint64_t))(**(void **)(v0[22]
                                                    + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__extensionCache)
                                      + 128);
  uint64_t v2 = swift_retain();
  v1(v2);
  swift_release();
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  sub_100009734(v0 + 8, v3);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v4 + 8) + **(int **)(v4 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  v0[31] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_100011FA4;
  return v7(v3, v4);
}

uint64_t sub_100011FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 256) = a1;
  *(void *)(v4 + 264) = a2;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 240);
  uint64_t v6 = *(void *)(v3 + 232);
  return _swift_task_switch(sub_1000120CC, v6, v5);
}

uint64_t sub_1000120CC()
{
  uint64_t v35 = v0;
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension;
  *(void *)(v0 + 272) = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension;
  uint64_t v3 = v1 + v2;
  uint64_t v4 = *(void *)(v1 + v2);
  uint64_t v5 = *(void **)(v1 + v2 + 8);
  *(_OWORD *)(v1 + v2) = *(_OWORD *)(v0 + 256);
  sub_1000156EC(v4, v5);
  sub_100009958(v0 + 64);
  uint64_t v6 = *(void (**)(uint64_t))(**(void **)(v1
                                                    + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__deviceProvider)
                                      + 128);
  uint64_t v7 = swift_retain();
  v6(v7);
  swift_release();
  PASDeviceProvider.sourceDevice.getter();
  swift_release();
  uint64_t v8 = *(void *)(v0 + 128);
  if (v8)
  {
    uint64_t v9 = *(void *)(v0 + 136);
    uint64_t v10 = sub_100009734((void *)(v0 + 104), *(void *)(v0 + 128));
    uint64_t v11 = *(void *)(v8 - 8);
    uint64_t v12 = swift_task_alloc();
    (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v12, v10, v8);
    sub_100007E60(v0 + 104, &qword_1000225A8);
    (*(void (**)(uint64_t, uint64_t))(v9 + 40))(v8, v9);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v8);
    swift_task_dealloc();
  }
  else
  {
    sub_100007E60(v0 + 104, &qword_1000225A8);
  }
  id v13 = objc_allocWithZone((Class)type metadata accessor for PASExtensionDevicePair());
  LOBYTE(v32) = 0;
  uint64_t v14 = PASExtensionDevicePair.init(targetDeviceType:sourceDeviceBiometryType:)();
  *(void *)(v0 + 280) = v14;
  uint64_t v15 = *(void **)v3;
  *(void *)(v0 + 288) = *(void *)v3;
  if (v15)
  {
    uint64_t v16 = (void *)v14;
    uint64_t v17 = *(void **)(v3 + 8);
    sub_100009A04(v15, v17);
    uint64_t v18 = swift_retain();
    sub_1000156EC(v18, v17);
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 296) = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_100012524;
    id v20 = v16;
    return PASExtensionHandle.viewDetails(for:)(v20);
  }
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  uint64_t v21 = *(void *)(v0 + 176) + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_sourceViewDetails;
  swift_beginAccess();
  sub_10001572C(v0 + 16, v21, &qword_100022580);
  swift_endAccess();
  id v20 = [self defaultStore];
  if (!v20)
  {
    __break(1u);
    return PASExtensionHandle.viewDetails(for:)(v20);
  }
  id v22 = v20;
  uint64_t v23 = *(void *)(v0 + 272);
  uint64_t v24 = *(void *)(v0 + 176);
  uint64_t v33 = sub_10000F2FC(0, &qword_1000225B0);
  uint64_t v34 = &protocol witness table for ACAccountStore;
  id v25 = [self sharedInstance:v22];
  type metadata accessor for AccountSecurityLevelCalculator();
  uint64_t v26 = swift_allocObject();
  char v27 = *(void **)(v24 + v23);
  if (v27)
  {
    uint64_t v28 = *(void **)(*(void *)(v0 + 176) + *(void *)(v0 + 272) + 8);
    sub_100009A04(v27, v28);
    id v29 = v28;
    sub_1000156EC((uint64_t)v27, v28);
  }
  else
  {
    uint64_t v28 = 0;
  }
  *(void *)(v0 + 320) = sub_1000152AC(&v32, (uint64_t)v25, v26, (uint64_t)v28);
  uint64_t v30 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v30;
  void *v30 = v0;
  v30[1] = sub_100012850;
  return sub_100009CE8();
}

uint64_t sub_100012524(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 304) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[29];
    uint64_t v6 = v4[30];
    uint64_t v7 = sub_100012B54;
  }
  else
  {
    swift_release();
    v4[39] = a1;
    uint64_t v5 = v4[29];
    uint64_t v6 = v4[30];
    uint64_t v7 = sub_100012654;
  }
  return _swift_task_switch(v7, v5, v6);
}

id sub_100012654()
{
  uint64_t v17 = v0;
  uint64_t v1 = v0[39];
  uint64_t v2 = type metadata accessor for PASExtensionProvidedViewDetails();
  v0[2] = v1;
  v0[5] = v2;
  v0[6] = &protocol witness table for PASExtensionProvidedViewDetails;
  v0[7] = &protocol witness table for PASExtensionProvidedViewDetails;
  uint64_t v3 = v0[22] + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_sourceViewDetails;
  swift_beginAccess();
  sub_10001572C((uint64_t)(v0 + 2), v3, &qword_100022580);
  swift_endAccess();
  id result = [self defaultStore];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = v0[34];
    uint64_t v7 = v0[22];
    uint64_t v15 = sub_10000F2FC(0, &qword_1000225B0);
    uint64_t v16 = &protocol witness table for ACAccountStore;
    *(void *)&long long v14 = v5;
    id v8 = [self sharedInstance];
    type metadata accessor for AccountSecurityLevelCalculator();
    uint64_t v9 = swift_allocObject();
    uint64_t v10 = *(void **)(v7 + v6);
    if (v10)
    {
      uint64_t v11 = *(void **)(v0[22] + v0[34] + 8);
      sub_100009A04(v10, v11);
      id v12 = v11;
      sub_1000156EC((uint64_t)v10, v11);
    }
    else
    {
      uint64_t v11 = 0;
    }
    v0[40] = sub_1000152AC(&v14, (uint64_t)v8, v9, (uint64_t)v11);
    id v13 = (void *)swift_task_alloc();
    v0[41] = v13;
    *id v13 = v0;
    v13[1] = sub_100012850;
    return (id)sub_100009CE8();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100012850(__int16 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *v3;
  uint64_t v5 = *v3;
  *(_WORD *)(v5 + 356) = a1;
  *(void *)(v5 + 336) = a2;
  *(void *)(v5 + 344) = a3;
  swift_task_dealloc();
  uint64_t v6 = *(void *)(v4 + 240);
  uint64_t v7 = *(void *)(v4 + 232);
  return _swift_task_switch(sub_10001297C, v7, v6);
}

uint64_t sub_10001297C()
{
  uint64_t v1 = *(void *)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 344);
  uint64_t v3 = *(unsigned __int16 *)(v0 + 356);
  uint64_t v4 = *(void *)(v0 + 176);
  swift_release();
  uint64_t v5 = v3 & 0x101010101010101;
  uint64_t v6 = (unsigned __int8 *)(v4 + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult);
  uint64_t v7 = *(void *)(v4 + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult);
  uint64_t v8 = *(void *)(v4 + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult + 8);
  uint64_t v9 = *(void *)(v4 + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult + 16);
  *(void *)uint64_t v6 = v5;
  *((void *)v6 + 1) = v1;
  *((void *)v6 + 2) = v2;
  sub_1000147EC(v7, v8, v9);
  uint64_t v10 = *((void *)v6 + 2);
  if (v10 == 1
    || (uint64_t v11 = *v6,
        uint64_t v12 = *((void *)v6 + 1),
        unint64_t v13 = ((unint64_t)*(unsigned int *)(v6 + 1) << 8) | ((unint64_t)(*(unsigned __int16 *)(v6 + 5) | (v6[7] << 16)) << 40) | v11,
        swift_bridgeObjectRetain(),
        uint64_t v14 = sub_1000147EC(v13, v12, v10),
        (v11 & 1) == 0))
  {
    uint64_t v19 = *(void *)(v0 + 208);
    uint64_t v18 = *(void *)(v0 + 216);
    uint64_t v20 = *(void *)(v0 + 200);
    uint64_t v21 = PASLogger.viewService.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
    id v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Validator says we should not show prox card, exiting PASViewService.", v24, 2u);
      swift_slowDealloc();
    }
    uint64_t v26 = *(void *)(v0 + 208);
    uint64_t v25 = *(void *)(v0 + 216);
    uint64_t v27 = *(void *)(v0 + 200);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    exit(-1);
  }
  uint64_t v15 = *(void (**)(uint64_t))(v0 + 184);
  if (v15) {
    v15(v14);
  }

  swift_release();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_100012B54()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100012BDC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100007E60(a1, &qword_100022310);
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

void sub_100012E34()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v67 - v7;
  uint64_t v9 = *(void **)&v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_device];
  if (!v9)
  {
    uint64_t v63 = PASLogger.viewService.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v63, v2);
    uint64_t v64 = Logger.logObject.getter();
    os_log_type_t v65 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v66 = 0;
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "No CBDevice present, unable to show prox card, exiting PASViewService.", v66, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    exit(-1);
  }
  uint64_t v10 = (uint64_t)&v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_sourceViewDetails];
  swift_beginAccess();
  sub_10000B2C4(v10, (uint64_t)&v78, &qword_100022580);
  uint64_t v11 = *((void *)&v79 + 1);
  uint64_t v71 = v10;
  uint64_t v69 = v3;
  if (*((void *)&v79 + 1))
  {
    uint64_t v12 = v80;
    unint64_t v13 = sub_100009734(&v78, *((uint64_t *)&v79 + 1));
    *((void *)&v75 + 1) = v11;
    *(void *)&long long v76 = v12;
    uint64_t v14 = sub_1000154F4((uint64_t *)&v74);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v14, v13, v11);
    id v15 = v9;
    sub_100009958((uint64_t)&v78);
  }
  else
  {
    id v16 = v9;
    sub_100007E60((uint64_t)&v78, &qword_100022580);
    long long v74 = 0u;
    long long v75 = 0u;
    *(void *)&long long v76 = 0;
  }
  id v17 = objc_allocWithZone((Class)type metadata accessor for PASVSSetupEventPresenter());
  uint64_t v18 = sub_10000B624((uint64_t)&v74);
  uint64_t v19 = *(void **)&v18[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController];
  *(void *)&v18[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController] = v1;
  uint64_t v20 = v1;

  uint64_t v21 = &v20[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult];
  uint64_t v22 = *(void *)&v20[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult + 16];
  if (v22 == 1)
  {
    char v23 = 0;
  }
  else
  {
    uint64_t v24 = v21[1];
    char v23 = v24 & 1;
    uint64_t v25 = *((void *)v21 + 1);
    unint64_t v26 = ((unint64_t)*(unsigned int *)(v21 + 2) << 16) | ((unint64_t)*((unsigned __int16 *)v21 + 3) << 48) | *v21 | (v24 << 8);
    swift_bridgeObjectRetain();
    sub_1000147EC(v26, v25, v22);
  }
  v18[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_hasEligibleAccountForProxSetup] = v23;
  uint64_t v27 = *((void *)v21 + 2);
  uint64_t v70 = v9;
  if (v27 == 1
    || (uint64_t v29 = *(void *)v21,
        uint64_t v28 = *((void *)v21 + 1),
        swift_bridgeObjectRetain(),
        sub_100014800(v29, v28, v27),
        sub_1000147EC(v29, v28, v27),
        !v27))
  {
    swift_bridgeObjectRelease();
    uint64_t v28 = 0;
    uint64_t v27 = 0xE000000000000000;
  }
  uint64_t v30 = (uint64_t *)&v18[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_accountUserName];
  uint64_t *v30 = v28;
  v30[1] = v27;
  swift_bridgeObjectRelease();
  *(void *)&v18[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_proxyDelegate + 8] = &off_10001D260;
  swift_unknownObjectWeakAssign();
  uint64_t v31 = (uint64_t)&v20[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_targetDevice];
  swift_beginAccess();
  sub_10000B2C4(v31, (uint64_t)&v74, &qword_1000222F0);
  if (*((void *)&v75 + 1))
  {
    long long v78 = v74;
    long long v79 = v75;
    long long v80 = v76;
    uint64_t v81 = v77;
    uint64_t v32 = PASLogger.common.unsafeMutableAddressor();
    uint64_t v33 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v8, v32, v2);
    sub_1000097E8((uint64_t)&v78, (uint64_t)&v74);
    uint64_t v34 = Logger.logObject.getter();
    uint64_t v35 = v2;
    os_log_type_t v36 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v67 = v35;
      uint64_t v73 = v38;
      *(_DWORD *)uint64_t v37 = 141558274;
      v72[0] = 1752392040;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v37 + 12) = 2080;
      sub_1000097E8((uint64_t)&v74, (uint64_t)v72);
      uint64_t v39 = String.init<A>(describing:)();
      uint64_t v68 = v31;
      v72[0] = sub_10001493C(v39, v40, &v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100009844((uint64_t)&v74);
      _os_log_impl((void *)&_mh_execute_header, v34, v36, "Setting target Device to :%{mask.hash}s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v67);
      uint64_t v31 = v68;
    }
    else
    {
      sub_100009844((uint64_t)&v74);

      (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v35);
    }
    uint64_t v41 = v70;
    sub_1000097E8((uint64_t)&v78, (uint64_t)&v74);
    uint64_t v42 = (uint64_t)&v18[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_targetDevice];
    swift_beginAccess();
    sub_10001572C((uint64_t)&v74, v42, &qword_1000222F0);
    swift_endAccess();
    sub_100009844((uint64_t)&v78);
  }
  else
  {
    sub_100007E60((uint64_t)&v74, &qword_1000222F0);
    uint64_t v41 = v70;
  }
  id v43 = [objc_allocWithZone((Class)SKDevice) init];
  id v44 = [v41 identifier];
  [v43 setIdentifier:v44];

  id v45 = [objc_allocWithZone((Class)SKSetupAppleIDSignInClient) init];
  [v45 setPasswordType:2];
  [v45 setPeerDevice:v43];
  [v45 setPersistentPairing:0];
  sub_10000B2C4(v71, (uint64_t)&v78, &qword_100022580);
  uint64_t v46 = *((void *)&v79 + 1);
  if (*((void *)&v79 + 1))
  {
    uint64_t v47 = *((void *)&v80 + 1);
    id v48 = sub_100009734(&v78, *((uint64_t *)&v79 + 1));
    *((void *)&v75 + 1) = v46;
    *(void *)&long long v76 = v47;
    id v49 = sub_1000154F4((uint64_t *)&v74);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v46 - 8) + 16))(v49, v48, v46);
    sub_100009958((uint64_t)&v78);
  }
  else
  {
    sub_100007E60((uint64_t)&v78, &qword_100022580);
    long long v74 = 0u;
    long long v75 = 0u;
    *(void *)&long long v76 = 0;
  }
  *((void *)&v79 + 1) = &type metadata for DTOStatusProvider;
  *(void *)&long long v80 = &off_10001CD70;
  type metadata accessor for PASVSSetupFlowController();
  uint64_t v50 = swift_allocObject();
  uint64_t v51 = sub_100014814((uint64_t)&v78, (uint64_t)&type metadata for DTOStatusProvider);
  __chkstk_darwin(v51);
  (*(void (**)(void))(v52 + 16))();
  id v53 = v45;
  uint64_t v54 = v18;
  uint64_t v55 = sub_100015420((uint64_t)v53, (uint64_t)v54, (uint64_t)&v74, v50);
  sub_100009958((uint64_t)&v78);
  uint64_t v56 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_flowController;
  *(void *)&v20[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_flowController] = v55;
  swift_release();
  uint64_t v57 = *(void *)&v20[v56];
  if (v57)
  {
    *(void *)(v57 + 144) = &off_10001D248;
    swift_unknownObjectWeakAssign();
  }
  sub_10000B2C4(v31, (uint64_t)&v74, &qword_1000222F0);
  if (*((void *)&v75 + 1))
  {
    long long v78 = v74;
    long long v79 = v75;
    long long v80 = v76;
    uint64_t v81 = v77;
    uint64_t v58 = *(void *)&v20[v56];
    if (v58)
    {
      long long v74 = v78;
      long long v75 = v79;
      long long v76 = v80;
      uint64_t v77 = v81;
      swift_beginAccess();
      swift_retain();
      sub_10001572C((uint64_t)&v74, v58 + 40, &qword_1000222F0);
      swift_endAccess();
      swift_release();
    }
    else
    {
      sub_100009844((uint64_t)&v78);
    }
  }
  else
  {
    sub_100007E60((uint64_t)&v74, &qword_1000222F0);
  }
  if ([v20 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v74 = 0u;
    long long v75 = 0u;
  }
  sub_10001469C((uint64_t)&v74, (uint64_t)&v78);
  if (!*((void *)&v79 + 1))
  {
    sub_100007E60((uint64_t)&v78, &qword_100022560);
    uint64_t v61 = *(void *)&v20[v56];
    if (!v61) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  sub_100004C0C(&qword_100022568);
  if (swift_dynamicCast())
  {
    BOOL v59 = (void *)v72[0];
    NSString v60 = String._bridgeToObjectiveC()();
    [v59 setIdleTimerDisabled:1 forReason:v60];
    swift_unknownObjectRelease();
  }
  uint64_t v61 = *(void *)&v20[v56];
  if (v61)
  {
LABEL_34:
    os_log_t v62 = *(void **)(v61 + 32);
    swift_retain();
    [v62 showProxCard];
    swift_release();
  }
LABEL_35:
}

void sub_10001393C()
{
}

void sub_10001399C()
{
}

void sub_1000139A8(const char *a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = PASLogger.common.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, a1, v11, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ([v3 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  sub_10001469C((uint64_t)v15, (uint64_t)v16);
  if (v17)
  {
    sub_100004C0C(&qword_100022568);
    if (swift_dynamicCast())
    {
      uint64_t v12 = (void *)v14[1];
      NSString v13 = String._bridgeToObjectiveC()();
      [v12 setIdleTimerDisabled:0 forReason:v13];
      swift_unknownObjectRelease();
    }
  }
  else
  {
    sub_100007E60((uint64_t)v16, &qword_100022560);
  }
}

id sub_100013BE4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  *(void *)&v3[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_device] = 0;
  uint64_t v7 = &v3[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_targetDevice];
  *(_OWORD *)uint64_t v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((void *)v7 + 6) = 0;
  *(void *)&v3[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_flowController] = 0;
  uint64_t v8 = &v3[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = 1;
  uint64_t v9 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__extensionCache;
  sub_100004C0C(&qword_100022570);
  swift_allocObject();
  *(void *)&v3[v9] = PASService.init()();
  uint64_t v10 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__deviceProvider;
  sub_100004C0C(&qword_100022578);
  swift_allocObject();
  *(void *)&v3[v10] = PASService.init()();
  uint64_t v11 = &v3[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  uint64_t v12 = &v3[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_sourceViewDetails];
  *(_OWORD *)uint64_t v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((_OWORD *)v12 + 2) = 0u;
  if (a2)
  {
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  v16.receiver = v4;
  v16.super_class = (Class)type metadata accessor for PASVSPrimaryViewController();
  id v14 = [super initWithNibName:v13 bundle:a3];

  return v14;
}

id sub_100013DA8(void *a1)
{
  uint64_t v2 = v1;
  *(void *)&v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_device] = 0;
  uint64_t v4 = &v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_targetDevice];
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((void *)v4 + 6) = 0;
  *(void *)&v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_flowController] = 0;
  uint64_t v5 = &v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 1;
  uint64_t v6 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__extensionCache;
  sub_100004C0C(&qword_100022570);
  swift_allocObject();
  *(void *)&v1[v6] = PASService.init()();
  uint64_t v7 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__deviceProvider;
  sub_100004C0C(&qword_100022578);
  swift_allocObject();
  *(void *)&v1[v7] = PASService.init()();
  uint64_t v8 = &v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  uint64_t v9 = &v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_sourceViewDetails];
  uint64_t v10 = (objc_class *)type metadata accessor for PASVSPrimaryViewController();
  *(_OWORD *)uint64_t v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  v13.receiver = v2;
  v13.super_class = v10;
  [super initWithCoder:a1];

  return v11;
}

id sub_100013EF8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASVSPrimaryViewController();
  [super dealloc];
}

uint64_t sub_100013FE8()
{
  uint64_t v1 = type metadata accessor for Logger();
  v0[3] = v1;
  v0[4] = *(void *)(v1 - 8);
  v0[5] = swift_task_alloc();
  v0[6] = type metadata accessor for MainActor();
  v0[7] = static MainActor.shared.getter();
  objc_super v2 = (void *)swift_task_alloc();
  v0[8] = v2;
  *objc_super v2 = v0;
  v2[1] = sub_1000140F4;
  return PASExtensionHandle.didPerformLocalAuthentication()();
}

uint64_t sub_1000140F4()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  if (v0) {
    uint64_t v4 = sub_1000142B8;
  }
  else {
    uint64_t v4 = sub_100014250;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_100014250()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000142B8()
{
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  swift_release();
  uint64_t v4 = PASLogger.common.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v4, v1);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138543362;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "PASVSPrimaryViewController setupFlowControllerDidPerformLocalAuthentication failed to notify extension: %{public}@", v7, 0xCu);
    sub_100004C0C(&qword_100021E68);
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
  (*(void (**)(void, void))(v0[4] + 8))(v0[5], v0[3]);
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

id sub_1000144C8()
{
  return [v0 passwordType];
}

id sub_1000144D8(uint64_t a1)
{
  return [v1 setPasswordType:a1];
}

void sub_1000144EC(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    v4[4] = a1;
    v4[5] = a2;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 1107296256;
    v4[2] = sub_10000FA44;
    v4[3] = &unk_10001D2C0;
    uint64_t v3 = _Block_copy(v4);
    swift_release();
  }
  else
  {
    uint64_t v3 = 0;
  }
  [v2 setEventHandler:v3];
  _Block_release(v3);
}

id sub_100014594()
{
  id v1 = [v0 messageSessionTemplate];

  return v1;
}

id sub_1000145CC()
{
  return [v0 activate];
}

id sub_1000145DC(uint64_t a1)
{
  return [v1 postEvent:a1];
}

id sub_1000145F0()
{
  return [v0 invalidate];
}

id sub_100014600()
{
  return [*v0 isLostModeActive];
}

uint64_t sub_100014624(uint64_t a1, uint64_t a2)
{
  return sub_10001463C(a1, a2, &direct field offset for PASExtensionProvidedViewDetails.proxCardSubtitle);
}

uint64_t sub_100014630(uint64_t a1, uint64_t a2)
{
  return sub_10001463C(a1, a2, &direct field offset for PASExtensionProvidedViewDetails.biometricsNotEnrolledErrorSubtitle);
}

uint64_t sub_10001463C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(*v3 + *a3);
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t type metadata accessor for PASVSPrimaryViewController()
{
  return self;
}

uint64_t sub_10001469C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004C0C(&qword_100022560);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_100014704()
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

uint64_t sub_1000147EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100014800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100014814(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100014864(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_10001489C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000148C4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10001493C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10001493C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100014A10(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000099A8((uint64_t)v12, *a3);
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
      sub_1000099A8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009958((uint64_t)v12);
  return v7;
}

uint64_t sub_100014A10(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100014BCC(a5, a6);
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

uint64_t sub_100014BCC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100014C64(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100014E44(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100014E44(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100014C64(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100014DDC(v2, 0);
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

void *sub_100014DDC(uint64_t a1, uint64_t a2)
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
  sub_100004C0C(&qword_100022588);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100014E44(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004C0C(&qword_100022588);
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

unint64_t sub_100014F94(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10001506C(a1, v4);
}

unint64_t sub_100014FD8(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_100015134(a1, v2);
}

unint64_t sub_10001506C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000098FC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000098A8((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100015134(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

void *sub_1000152AC(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = sub_10000F2FC(0, &qword_1000225B8);
  uint64_t v20 = &off_10001D218;
  *(void *)&long long v18 = a2;
  uint64_t v8 = type metadata accessor for AccountSecurityLevelCalculator();
  v17[3] = v8;
  v17[4] = &off_10001CE08;
  v17[0] = a3;
  type metadata accessor for PASVSProxCardValidator();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = sub_100014814((uint64_t)v17, v8);
  __chkstk_darwin(v10);
  uint64_t v12 = (void *)((char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v13 + 16))(v12);
  uint64_t v14 = *v12;
  v9[15] = v8;
  v9[16] = &off_10001CE08;
  v9[12] = v14;
  v9[17] = 0;
  sub_10000F3A4(a1, (uint64_t)(v9 + 2));
  sub_10000F3A4(&v18, (uint64_t)(v9 + 7));
  uint64_t v15 = (void *)v9[17];
  v9[17] = a4;

  sub_100009958((uint64_t)v17);
  return v9;
}

uint64_t sub_100015420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = &type metadata for DTOStatusProvider;
  uint64_t v11 = &off_10001CD70;
  *(void *)(a4 + 144) = 0;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(void *)(a4 + 88) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(a4 + 16) = a1;
  *(void *)(a4 + 24) = &off_10001D178;
  *(void *)(a4 + 32) = a2;
  sub_10000F340((uint64_t)v9, a4 + 152);
  sub_10000B2C4(a3, a4 + 96, &qword_100021E50);
  [*(id *)(a4 + 32) setDelegate:a4];
  sub_100007E60(a3, &qword_100021E50);
  sub_100009958((uint64_t)v9);
  return a4;
}

uint64_t *sub_1000154F4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10001555C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10001556C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000155A4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000155B4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000155C4()
{
  swift_unknownObjectRelease();

  if (*(void *)(v0 + 48)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100015614(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  int v7 = *(_DWORD *)(v1 + 40);
  uint64_t v9 = *(void *)(v1 + 48);
  uint64_t v8 = *(void *)(v1 + 56);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_100007D6C;
  return sub_100011D54(a1, v4, v5, v6, v7, v9, v8);
}

void sub_1000156EC(uint64_t a1, void *a2)
{
  if (a1)
  {
    swift_release();
  }
}

uint64_t sub_10001572C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004C0C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_100015790(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000157A0()
{
  return swift_release();
}

uint64_t sub_1000157A8()
{
  v1[3] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[7] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[8] = v4;
  v1[9] = v3;
  return _swift_task_switch(sub_10001589C, v4, v3);
}

uint64_t sub_10001589C()
{
  uint64_t v1 = (uint64_t *)(v0[3] + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension);
  uint64_t v2 = *v1;
  v0[10] = *v1;
  if (v2)
  {
    uint64_t v3 = (void *)v1[1];
    v0[11] = v3;
    swift_retain();
    id v4 = v3;
    uint64_t v5 = (void *)swift_task_alloc();
    v0[12] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_1000159B0;
    return PASExtensionHandle.shouldPerformLocalAuthentication()();
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
    return v6(1);
  }
}

uint64_t sub_1000159B0(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 104) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(void *)(v4 + 64);
    uint64_t v6 = *(void *)(v4 + 72);
    int v7 = sub_100015B58;
  }
  else
  {
    *(unsigned char *)(v4 + 112) = a1 & 1;
    uint64_t v5 = *(void *)(v4 + 64);
    uint64_t v6 = *(void *)(v4 + 72);
    int v7 = sub_100015AD8;
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t sub_100015AD8()
{
  uint64_t v1 = *(void **)(v0 + 88);
  swift_release();

  swift_release();
  uint64_t v2 = *(unsigned __int8 *)(v0 + 112);
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_100015B58()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  swift_release();
  uint64_t v4 = PASLogger.common.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v12 = *(void **)(v0 + 88);
    int v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)int v7 = 138543362;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "PASVSPrimaryViewController setupFlowControllerShouldPerformLocalAuthentication extension failed: %{public}@", v7, 0xCu);
    sub_100004C0C(&qword_100021E68);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_release();
    swift_errorRelease();
  }
  else
  {

    swift_release();
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  (*(void (**)(void, void))(*(void *)(v0 + 40) + 8))(*(void *)(v0 + 48), *(void *)(v0 + 32));
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v10(1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t PASBoldAppleIDPlaceholder.unsafeMutableAddressor()
{
  return PASBoldAppleIDPlaceholder.unsafeMutableAddressor();
}

uint64_t PASService.init()()
{
  return PASService.init()();
}

Swift::Void __swiftcall PASServices.registerSourceServices()()
{
}

uint64_t PASServices.shared.unsafeMutableAddressor()
{
  return PASServices.shared.unsafeMutableAddressor();
}

uint64_t PASDeviceProvider.sourceDevice.getter()
{
  return PASDeviceProvider.sourceDevice.getter();
}

uint64_t PASExtensionDevicePair.init(targetDeviceType:sourceDeviceBiometryType:)()
{
  return PASExtensionDevicePair.init(targetDeviceType:sourceDeviceBiometryType:)();
}

uint64_t type metadata accessor for PASExtensionDevicePair()
{
  return type metadata accessor for PASExtensionDevicePair();
}

uint64_t type metadata accessor for PASExtensionProvidedViewDetails()
{
  return type metadata accessor for PASExtensionProvidedViewDetails();
}

uint64_t PASDevice.init(deviceClass:biometryProvider:ak_device:)()
{
  return PASDevice.init(deviceClass:biometryProvider:ak_device:)();
}

uint64_t PASDevice.deviceBiometricKey.getter()
{
  return PASDevice.deviceBiometricKey.getter();
}

uint64_t PASLogger.viewService.unsafeMutableAddressor()
{
  return PASLogger.viewService.unsafeMutableAddressor();
}

uint64_t PASLogger.common.unsafeMutableAddressor()
{
  return PASLogger.common.unsafeMutableAddressor();
}

uint64_t PASUISourceViewPresenter.init(sharingViewController:)()
{
  return PASUISourceViewPresenter.init(sharingViewController:)();
}

uint64_t type metadata accessor for PASUISourceViewPresenter()
{
  return type metadata accessor for PASUISourceViewPresenter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t static SceneBuilder.buildBlock<A>(_:)()
{
  return static SceneBuilder.buildBlock<A>(_:)();
}

uint64_t EnvironmentValues.imageScale.getter()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t EnvironmentValues.imageScale.setter()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
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

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t static Color.accentColor.getter()
{
  return static Color.accentColor.getter();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.Scale()
{
  return type metadata accessor for Image.Scale();
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

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t String.LocalizationValue.init(_:)()
{
  return String.LocalizationValue.init(_:)();
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

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return String.init(localized:table:bundle:locale:comment:)();
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

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t _NSRange.init<A, B>(_:in:)()
{
  return _NSRange.init<A, B>(_:in:)();
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

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}