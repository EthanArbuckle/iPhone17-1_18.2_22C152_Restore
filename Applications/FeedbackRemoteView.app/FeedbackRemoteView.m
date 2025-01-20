uint64_t sub_100002170()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  sub_100007304(v0, qword_100011DA8);
  sub_1000071D8(v0, (uint64_t)qword_100011DA8);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000021F4()
{
  return _swift_deallocClassInstance(v0, 33, 7);
}

uint64_t sub_100002234()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_remoteEvaluationRequest;
  uint64_t v2 = type metadata accessor for FBKSRemoteEvaluationRequest();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_evaluationController));
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000022E4(char a1)
{
  uint64_t v2 = v1;
  v24.receiver = v2;
  v24.super_class = (Class)type metadata accessor for FeedbackRemoteViewController();
  [super viewWillAppear:a1 & 1];
  id v4 = [self processInfo];
  id v5 = [v4 environment];

  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(v6 + 16)) {
    return swift_bridgeObjectRelease();
  }
  unint64_t v7 = sub_100005FE0(0xD000000000000014, 0x8000000100008D10);
  if ((v8 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  v9 = (uint64_t *)(*(void *)(v6 + 56) + 16 * v7);
  uint64_t v11 = *v9;
  unint64_t v10 = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if ((FBKSHasInternalDiagnostics() & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_1000071D8(v12, (uint64_t)qword_100011DA8);
  swift_bridgeObjectRetain_n();
  v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)v15 = 136315138;
    swift_bridgeObjectRetain();
    sub_100005988(v11, v10, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Using form from scheme %s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v17 = objc_allocWithZone((Class)type metadata accessor for FBKFeedbackForm());
  v18 = (void *)FBKFeedbackForm.init(identifier:)();
  objc_allocWithZone((Class)type metadata accessor for FBKFeedbackDraftViewController());
  id v19 = v18;
  uint64_t v20 = FBKFeedbackDraftViewController.init(feedbackForm:)();
  swift_unknownObjectRetain();
  dispatch thunk of FBKFeedbackDraftViewController.delegate.setter();
  type metadata accessor for FeedbackRemoteViewController.FormRequestState();
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 32) = 0;
  *(void *)(v21 + 16) = v19;
  *(void *)(v21 + 24) = v20;
  uint64_t v22 = *(void *)&v2[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state];
  *(void *)&v2[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state] = v21;
  return sub_100007430(v22);
}

void sub_100002648(char a1)
{
  uint64_t v2 = v1;
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for FeedbackRemoteViewController();
  [super viewDidAppear:a1 & 1];
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000071D8(v4, (uint64_t)qword_100011DA8);
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)unint64_t v7 = 136446210;
    sub_100005988(0xD000000000000011, 0x8000000100008CF0, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%{public}s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100002904();
}

void sub_100002904()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for FBKSEvaluation.Subject();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = (uint64_t *)((char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for FBKSEvaluation.Action();
  __chkstk_darwin();
  objc_super v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)&v0[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state];
  if ((~v10 & 0xF000000000000007) == 0)
  {
    if (qword_100011DA0 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_1000071D8(v11, (uint64_t)qword_100011DA8);
    os_log_t v44 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v44, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, v12, "Not configured yet. Will not present UI", v13, 2u);
      swift_slowDealloc();
    }
    os_log_t v14 = v44;

    return;
  }
  os_log_t v44 = v7;
  uint64_t v15 = v10 & 0x7FFFFFFFFFFFFFFFLL;
  swift_retain();
  id v16 = [v0 view];
  if (!v16)
  {
    __break(1u);
    return;
  }
  id v17 = v16;
  id v18 = [v16 window];

  if (!v18)
  {
    if (qword_100011DA0 != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    sub_1000071D8(v26, (uint64_t)qword_100011DA8);
    v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "No window. Will not present UI", v29, 2u);
      swift_slowDealloc();
    }

    sub_100004E1C();
    goto LABEL_34;
  }
  uint64_t v19 = qword_100011DA0;
  if ((v10 & 0x8000000000000000) == 0)
  {
    char v20 = *(unsigned char *)(v10 + 32);
    swift_retain();
    if ((v20 & 1) == 0)
    {
      if (v19 != -1) {
        swift_once();
      }
      uint64_t v33 = type metadata accessor for Logger();
      sub_1000071D8(v33, (uint64_t)qword_100011DA8);
      v34 = Logger.logObject.getter();
      os_log_type_t v35 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v36 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "Presenting Feedback UI", v36, 2u);
        swift_slowDealloc();
      }

      *(unsigned char *)(v10 + 32) = 1;
      id v37 = *(id *)(v10 + 24);
      [v1 presentViewController:v37 animated:1 completion:0];
      sub_100007430(v10);

      goto LABEL_34;
    }
    if (v19 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_1000071D8(v21, (uint64_t)qword_100011DA8);
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v22, v23))
    {
LABEL_28:

      sub_100007430(v10);
LABEL_34:
      sub_100007430(v10);
      return;
    }
    objc_super v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)objc_super v24 = 0;
    v25 = "Feedback UI already presented.";
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v22, v23, v25, v24, 2u);
    swift_slowDealloc();
    goto LABEL_28;
  }
  uint64_t v30 = OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_isPresented;
  char v31 = *(unsigned char *)(v15
                 + OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_isPresented);
  swift_retain();
  if (v31)
  {
    if (v19 != -1) {
      swift_once();
    }
    uint64_t v32 = type metadata accessor for Logger();
    sub_1000071D8(v32, (uint64_t)qword_100011DA8);
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v22, v23)) {
      goto LABEL_28;
    }
    objc_super v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)objc_super v24 = 0;
    v25 = "Evaluation Feedback UI already presented.";
    goto LABEL_27;
  }
  if (v19 != -1) {
    swift_once();
  }
  uint64_t v38 = type metadata accessor for Logger();
  sub_1000071D8(v38, (uint64_t)qword_100011DA8);
  v39 = Logger.logObject.getter();
  os_log_type_t v40 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = v30;
    *(_WORD *)v41 = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "Starting evaluation", v41, 2u);
    uint64_t v30 = v43;
    swift_slowDealloc();
  }

  *(unsigned char *)(v15 + v30) = 1;
  id v42 = objc_retain(*(id *)(v15
                          + OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_evaluationController));
  FBKSRemoteEvaluationRequest.action.getter();
  *id v5 = FBKSRemoteEvaluationRequest.interaction.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v3 + 104))(v5, enum case for FBKSEvaluation.Subject.interaction(_:), v2);
  dispatch thunk of FBKEvaluationController.userDidPerformAction(action:subject:showFeedbackForm:retryCount:)();

  sub_100007430(v10);
  sub_100007430(v10);
  (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
  ((void (*)(char *, uint64_t))v44[1].isa)(v9, v6);
}

uint64_t sub_100003048()
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
  sub_100007368((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_100007210(&qword_100012058);
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_1000073D0((uint64_t)v4);
    return 0;
  }
}

void sub_10000310C(void *a1, void (*a2)(void), void (*a3)(void))
{
  uint64_t v4 = v3;
  v99 = a3;
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  uint64_t v90 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v89 = (char *)&v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = type metadata accessor for FBKSRemoteAlertRequest();
  uint64_t v96 = *(void *)(v98 - 8);
  uint64_t v13 = __chkstk_darwin(v98);
  v88 = (char *)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  id v17 = (char *)&v81 - v16;
  uint64_t v87 = v18;
  __chkstk_darwin(v15);
  v95 = (char *)&v81 - v19;
  char v20 = (void *)sub_100003048();
  if (v20)
  {
    [v20 setAllowsAlertStacking:1];
    swift_unknownObjectRelease();
  }
  v97 = v17;
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v21 = type metadata accessor for Logger();
  uint64_t v100 = sub_1000071D8(v21, (uint64_t)qword_100011DA8);
  uint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.default.getter();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v94 = v7;
  uint64_t v93 = v8;
  uint64_t v92 = v11;
  v91 = v10;
  if (v24)
  {
    v25 = (uint8_t *)swift_slowAlloc();
    aBlock = (void *)swift_slowAlloc();
    *(_DWORD *)v25 = 136446210;
    *(void *)&long long v110 = sub_100005988(0xD00000000000001BLL, 0x8000000100008C50, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "%{public}s", v25, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (!a1) {
    __break(1u);
  }
  id v26 = [a1 userInfo];
  if (!v26)
  {
    long long v110 = 0u;
    long long v111 = 0u;
LABEL_30:
    sub_1000073D0((uint64_t)&v110);
    goto LABEL_31;
  }
  v27 = v26;
  uint64_t v28 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v102 = 0x74736575716572;
  unint64_t v103 = 0xE700000000000000;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v28 + 16) && (unint64_t v29 = sub_100006058((uint64_t)&aBlock), (v30 & 1) != 0))
  {
    sub_1000072A4(*(void *)(v28 + 56) + 32 * v29, (uint64_t)&v110);
  }
  else
  {
    long long v110 = 0u;
    long long v111 = 0u;
  }
  sub_1000074A0((uint64_t)&aBlock);
  swift_bridgeObjectRelease();
  if (!*((void *)&v111 + 1)) {
    goto LABEL_30;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_31:
    v60 = Logger.logObject.getter();
    os_log_type_t v61 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc();
      aBlock = (void *)swift_slowAlloc();
      *(_DWORD *)v62 = 136315138;
      *(void *)&long long v110 = sub_100005988(0xD00000000000001BLL, 0x8000000100008C50, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v60, v61, "%s Failed to get request data.", v62, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    if (a2)
    {
      a2();
      sub_100004E1C();
      return;
    }
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v85 = (uint64_t)aBlock;
  unint64_t v84 = v105;
  id v86 = [objc_allocWithZone((Class)NSXPCListenerEndpoint) init];
  id v31 = [a1 xpcEndpoint];
  if (!v31)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v83 = a2;
  id v32 = v86;
  [v86 _setEndpoint:v31];
  swift_unknownObjectRelease();
  id v33 = [objc_allocWithZone((Class)NSXPCConnection) initWithListenerEndpoint:v32];
  id v34 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP15FeedbackService33RemoteViewControllerReplyProtocol_];
  [v33 setRemoteObjectInterface:v34];

  v108 = sub_100004124;
  uint64_t v109 = 0;
  aBlock = _NSConcreteStackBlock;
  unint64_t v105 = 1107296256;
  v106 = sub_100004130;
  v107 = &unk_10000C730;
  os_log_type_t v35 = _Block_copy(&aBlock);
  [v33 setInvalidationHandler:v35];
  _Block_release(v35);
  v108 = sub_100004174;
  uint64_t v109 = 0;
  aBlock = _NSConcreteStackBlock;
  unint64_t v105 = 1107296256;
  v106 = sub_100004130;
  v107 = &unk_10000C758;
  v36 = _Block_copy(&aBlock);
  [v33 setInterruptionHandler:v36];
  _Block_release(v36);
  [v33 resume];
  id v37 = Logger.logObject.getter();
  os_log_type_t v38 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Anonymous xpc connection created", v39, 2u);
    swift_slowDealloc();
  }

  v108 = sub_100004180;
  uint64_t v109 = 0;
  aBlock = _NSConcreteStackBlock;
  unint64_t v105 = 1107296256;
  v106 = sub_100004378;
  v107 = &unk_10000C780;
  os_log_type_t v40 = _Block_copy(&aBlock);
  id v41 = [v33 remoteObjectProxyWithErrorHandler:v40];
  _Block_release(v40);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1000072A4((uint64_t)&v110, (uint64_t)&aBlock);
  sub_100007210(&qword_100012060);
  int v42 = swift_dynamicCast();
  uint64_t v43 = v102;
  if (!v42) {
    uint64_t v43 = 0;
  }
  uint64_t v44 = OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_feedbackd;
  *(void *)&v4[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_feedbackd] = v43;
  swift_unknownObjectRelease();
  char v101 = 0;
  int v45 = SBSGetScreenLockStatus();
  v46 = Logger.logObject.getter();
  os_log_type_t v47 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v46, v47))
  {
    BOOL v48 = v45 != 0;
    uint64_t v49 = swift_slowAlloc();
    v50 = (void *)swift_slowAlloc();
    id v82 = v33;
    aBlock = v50;
    *(_DWORD *)uint64_t v49 = 67240450;
    LODWORD(v102) = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v49 + 8) = 2082;
    swift_beginAccess();
    uint64_t v51 = DarwinBoolean.description.getter();
    uint64_t v102 = sub_100005988(v51, v52, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "Is device locked? [%{BOOL,public}d] passcodeRequired [%{public}s]", (uint8_t *)v49, 0x12u);
    swift_arrayDestroy();
    id v33 = v82;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  v53 = v83;
  uint64_t v54 = v98;
  swift_beginAccess();
  if (!v101)
  {
    id v82 = v33;
    sub_1000077AC(&qword_100012068, 255, (void (*)(uint64_t))&type metadata accessor for FBKSRemoteAlertRequest);
    v63 = v97;
    static JSONCodable.decode(from:)();
    uint64_t v64 = v96;
    v65 = *(void (**)(char *, char *, uint64_t))(v96 + 32);
    v66 = v95;
    v65(v95, v63, v54);
    sub_100007564();
    uint64_t v100 = static OS_dispatch_queue.main.getter();
    v67 = v88;
    (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v88, v66, v54);
    uint64_t v68 = *(unsigned __int8 *)(v64 + 80);
    uint64_t v69 = v54;
    uint64_t v70 = (v68 + 16) & ~v68;
    unint64_t v71 = (v87 + v70 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v72 = swift_allocObject();
    v65((char *)(v72 + v70), v67, v69);
    *(void *)(v72 + v71) = v4;
    v73 = (void (**)(void))(v72 + ((v71 + 15) & 0xFFFFFFFFFFFFFFF8));
    v74 = v99;
    *v73 = v53;
    v73[1] = v74;
    v108 = sub_10000765C;
    uint64_t v109 = v72;
    aBlock = _NSConcreteStackBlock;
    unint64_t v105 = 1107296256;
    v106 = sub_100004130;
    v107 = &unk_10000C7F8;
    v75 = _Block_copy(&aBlock);
    v76 = v4;
    sub_1000076F8((uint64_t)v53);
    swift_release();
    v77 = v89;
    static DispatchQoS.unspecified.getter();
    aBlock = &_swiftEmptyArrayStorage;
    sub_1000077AC(&qword_100012078, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100007210(&qword_100012080);
    sub_100007708();
    v78 = v91;
    uint64_t v79 = v94;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    v80 = (void *)v100;
    OS_dispatch_queue.async(group:qos:flags:execute:)();

    sub_10000750C(v85, v84);
    _Block_release(v75);

    (*(void (**)(char *, uint64_t))(v93 + 8))(v78, v79);
    (*(void (**)(char *, uint64_t))(v90 + 8))(v77, v92);
    (*(void (**)(char *, uint64_t))(v96 + 8))(v95, v69);
    goto LABEL_36;
  }
  v55 = Logger.logObject.getter();
  os_log_type_t v56 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v57 = 0;
    _os_log_impl((void *)&_mh_execute_header, v55, v56, "Detected race condition with remote alert launching while device is locked from remote view", v57, 2u);
    swift_slowDealloc();
  }

  v58 = *(void **)&v4[v44];
  if (v58)
  {
    v108 = sub_1000043E0;
    uint64_t v109 = 0;
    aBlock = _NSConcreteStackBlock;
    unint64_t v105 = 1107296256;
    v106 = sub_100004130;
    v107 = &unk_10000C7A8;
    v59 = _Block_copy(&aBlock);
    [v58 remoteViewControllerDidLaunchWhileLockedWithCompletion:v59];
    _Block_release(v59);
  }
  if (v53)
  {
    v53();
    sub_100004E1C();

    sub_10000750C(v85, v84);
LABEL_36:
    sub_100007254((uint64_t)&v110);
    return;
  }
LABEL_40:
  __break(1u);
  __break(1u);
}

void sub_100004124()
{
}

uint64_t sub_100004130(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100004174()
{
}

void sub_100004180()
{
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000071D8(v0, (uint64_t)qword_100011DA8);
  swift_errorRetain();
  swift_errorRetain();
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136446210;
    swift_errorRetain();
    sub_100007210(&qword_100012098);
    uint64_t v3 = String.init<A>(describing:)();
    sub_100005988(v3, v4, &v6);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Failed to connect to feedbackd from remote alert view controller: [%{public}s]", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
}

void sub_100004378(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_1000043E0()
{
}

void sub_1000043EC(const char *a1)
{
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000071D8(v2, (uint64_t)qword_100011DA8);
  oslog = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, a1, v4, 2u);
    swift_slowDealloc();
  }
}

void sub_1000044DC(uint64_t a1, char *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v68 = a4;
  uint64_t v69 = a2;
  uint64_t v70 = a3;
  uint64_t v5 = type metadata accessor for FBKSRemoteEvaluationRequest();
  v66 = *(uint8_t **)(v5 - 8);
  uint64_t v67 = v5;
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v65 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v65 - v8;
  uint64_t v10 = type metadata accessor for FBKSRemoteAlertRequest();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  id v17 = (char *)&v65 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (void **)((char *)&v65 - v18);
  char v20 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v20((char *)&v65 - v18, a1, v10);
  int v21 = (*(uint64_t (**)(void **, uint64_t))(v11 + 88))(v19, v10);
  if (v21 != enum case for FBKSRemoteAlertRequest.form(_:))
  {
    if (v21 != enum case for FBKSRemoteAlertRequest.evaluation(_:))
    {
      if (qword_100011DA0 != -1) {
        swift_once();
      }
      uint64_t v54 = type metadata accessor for Logger();
      sub_1000071D8(v54, (uint64_t)qword_100011DA8);
      v20(v17, a1, v10);
      v55 = Logger.logObject.getter();
      os_log_type_t v56 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v55, v56))
      {
        v57 = (uint8_t *)swift_slowAlloc();
        uint64_t v67 = swift_slowAlloc();
        uint64_t v72 = v67;
        v66 = v57;
        *(_DWORD *)v57 = 136315138;
        v65 = (char *)(v57 + 4);
        v20(v14, (uint64_t)v17, v10);
        uint64_t v58 = String.init<A>(describing:)();
        uint64_t v71 = sub_100005988(v58, v59, &v72);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v60 = *(void (**)(char *, uint64_t))(v11 + 8);
        v60(v17, v10);
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "Unknown request type %s. Closing the connection.", v66, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v60 = *(void (**)(char *, uint64_t))(v11 + 8);
        v60(v17, v10);
      }

      if (v70)
      {
        v70();
        sub_100004E1C();
        v60((char *)v19, v10);
        goto LABEL_22;
      }
LABEL_29:
      __break(1u);
      return;
    }
    (*(void (**)(void **, uint64_t))(v11 + 96))(v19, v10);
    v39 = v66;
    uint64_t v38 = v67;
    os_log_type_t v40 = v19;
    id v41 = (void (*)(char *, void **, uint64_t))*((void *)v66 + 4);
    v41(v9, v40, v67);
    if (qword_100011DA0 != -1) {
      swift_once();
    }
    uint64_t v42 = type metadata accessor for Logger();
    sub_1000071D8(v42, (uint64_t)qword_100011DA8);
    uint64_t v43 = Logger.logObject.getter();
    os_log_type_t v44 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v43, v44))
    {
      int v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Configuring with Interaction", v45, 2u);
      swift_slowDealloc();
    }

    type metadata accessor for FBKEvaluationController();
    sub_1000077AC(&qword_100012090, v46, (void (*)(uint64_t))type metadata accessor for FeedbackRemoteViewController);
    os_log_type_t v47 = v69;
    BOOL v48 = (void *)FBKEvaluationController.__allocating_init(delegate:)();
    dispatch thunk of FBKEvaluationController.blockPresentationDetentUsage.setter();
    uint64_t v49 = v65;
    (*((void (**)(char *, char *, uint64_t))v39 + 2))(v65, v9, v38);
    type metadata accessor for FeedbackRemoteViewController.RemoteEvaluationControllerState();
    uint64_t v50 = swift_allocObject();
    *(unsigned char *)(v50
             + OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_isPresented) = 0;
    v41((char *)(v50+ OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_remoteEvaluationRequest), (void **)v49, v38);
    *(void *)(v50
              + OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_evaluationController) = v48;
    uint64_t v51 = *(void *)&v47[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state];
    *(void *)&v47[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state] = v50 | 0x8000000000000000;
    id v52 = v48;
    swift_retain();
    uint64_t v53 = sub_100007430(v51);
    if (v70)
    {
      ((void (*)(uint64_t))v70)(v53);

      swift_release();
      (*((void (**)(char *, uint64_t))v39 + 1))(v9, v38);
      goto LABEL_22;
    }
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  (*(void (**)(void **, uint64_t))(v11 + 96))(v19, v10);
  uint64_t v22 = *v19;
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v23 = type metadata accessor for Logger();
  sub_1000071D8(v23, (uint64_t)qword_100011DA8);
  BOOL v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    id v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Configuring with Form", v26, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for FBKFeedbackForm();
  id v27 = v22;
  uint64_t v28 = (void *)FBKFeedbackForm.__allocating_init(serviceForm:)();
  id v29 = objc_allocWithZone((Class)type metadata accessor for FBKFeedbackDraftViewController());
  id v30 = v28;
  id v31 = (void *)FBKFeedbackDraftViewController.init(feedbackForm:)();
  id v32 = v69;
  swift_unknownObjectRetain();
  dispatch thunk of FBKFeedbackDraftViewController.delegate.setter();
  type metadata accessor for FeedbackRemoteViewController.FormRequestState();
  uint64_t v33 = swift_allocObject();
  *(unsigned char *)(v33 + 32) = 0;
  *(void *)(v33 + 16) = v30;
  *(void *)(v33 + 24) = v31;
  uint64_t v34 = *(void *)&v32[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state];
  *(void *)&v32[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state] = v33;
  id v35 = v30;
  id v36 = v31;
  uint64_t v37 = sub_100007430(v34);
  if (!v70)
  {
    __break(1u);
    goto LABEL_28;
  }
  ((void (*)(uint64_t))v70)(v37);

LABEL_22:
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v61 = type metadata accessor for Logger();
  sub_1000071D8(v61, (uint64_t)qword_100011DA8);
  v62 = Logger.logObject.getter();
  os_log_type_t v63 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v62, v63))
  {
    uint64_t v64 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v64 = 0;
    _os_log_impl((void *)&_mh_execute_header, v62, v63, "Did configure remote alert controller", v64, 2u);
    swift_slowDealloc();
  }
}

void *sub_100004E1C()
{
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000071D8(v0, (uint64_t)qword_100011DA8);
  os_log_type_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v3 = 136446210;
    sub_100005988(0x292865736F6C63, 0xE700000000000000, &v5);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%{public}s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  result = (void *)sub_100003048();
  if (result)
  {
    [result invalidate];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

id sub_1000050F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FeedbackRemoteViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for FeedbackRemoteViewController()
{
  return self;
}

uint64_t type metadata accessor for FeedbackRemoteViewController.FormRequestState()
{
  return self;
}

uint64_t sub_1000051C0()
{
  return type metadata accessor for FeedbackRemoteViewController.RemoteEvaluationControllerState();
}

uint64_t type metadata accessor for FeedbackRemoteViewController.RemoteEvaluationControllerState()
{
  uint64_t result = qword_100011F00;
  if (!qword_100011F00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100005214()
{
  uint64_t result = type metadata accessor for FBKSRemoteEvaluationRequest();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for FeedbackRemoteViewController.State(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for FeedbackRemoteViewController.State()
{
  return swift_release();
}

void *assignWithCopy for FeedbackRemoteViewController.State(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for FeedbackRemoteViewController.State(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

void *assignWithTake for FeedbackRemoteViewController.State(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FeedbackRemoteViewController.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7F && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 127);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 6) | (2 * ((*(void *)a1 >> 57) & 0x38 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7E) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for FeedbackRemoteViewController.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7E)
  {
    *(void *)uint64_t result = a2 - 127;
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 1) & 0x3F | ((-a2 & 0x7F) << 6);
      *(void *)uint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_100005888(void *a1)
{
  return *a1 >> 63;
}

void *sub_100005894(void *result)
{
  *result &= ~0x8000000000000000;
  return result;
}

uint64_t *sub_1000058A4(uint64_t *result, uint64_t a2)
{
  void *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for FeedbackRemoteViewController.State()
{
  return &type metadata for FeedbackRemoteViewController.State;
}

uint64_t sub_1000058CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return FBKEvaluationControllerDelegate.evaluationDidComplete(controller:response:)(a1, a2, a3, WitnessTable);
}

void *sub_100005938()
{
  return sub_100006F9C();
}

uint64_t sub_100005940(uint64_t a1, uint64_t a2)
{
  return sub_1000077AC(&qword_100011FC8, a2, (void (*)(uint64_t))type metadata accessor for FeedbackRemoteViewController);
}

uint64_t sub_100005988(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005A5C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000072A4((uint64_t)v12, *a3);
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
      sub_1000072A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007254((uint64_t)v12);
  return v7;
}

uint64_t sub_100005A5C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100005C18(a5, a6);
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

uint64_t sub_100005C18(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005CB0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005E90(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005E90(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005CB0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005E28(v2, 0);
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

void *sub_100005E28(uint64_t a1, uint64_t a2)
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
  sub_100007210(&qword_100011FD8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005E90(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007210(&qword_100011FD8);
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

unint64_t sub_100005FE0(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000609C(a1, a2, v4);
}

unint64_t sub_100006058(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100006180(a1, v4);
}

unint64_t sub_10000609C(uint64_t a1, uint64_t a2, uint64_t a3)
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
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100006180(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000077F4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000074A0((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_100006464(void (*a1)(uint64_t))
{
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000071D8(v2, (uint64_t)qword_100011DA8);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    sub_100005988(0xD000000000000026, 0x8000000100008CA0, &v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (a1) {
    a1(v6);
  }
}

void *sub_1000065F8(uint64_t a1, unint64_t a2)
{
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000071D8(v4, (uint64_t)qword_100011DA8);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446210;
    swift_bridgeObjectRetain();
    sub_100005988(a1, a2, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Controller complete with ID: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return sub_100004E1C();
}

void *sub_1000067B4()
{
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000071D8(v0, (uint64_t)qword_100011DA8);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136446210;
    uint64_t v4 = FBKDraftError.description.getter();
    sub_100005988(v4, v5, &v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Controller failed to start, error: %{public}s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return sub_100004E1C();
}

void sub_10000693C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_1000071D8(v8, (uint64_t)qword_100011DA8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    v17[1] = a2;
    uint64_t v12 = v11;
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136380931;
    sub_1000077AC(&qword_100011FE8, 255, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v18 = sub_100005988(v13, v14, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_WORD *)(v12 + 12) = 2082;
    uint64_t v15 = FBKAttachmentError.description.getter();
    uint64_t v18 = sub_100005988(v15, v16, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Controller failed to attach, url: %{private}s error  %{public}s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void *sub_100006C10(void *a1)
{
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000071D8(v2, (uint64_t)qword_100011DA8);
  id v3 = a1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    type metadata accessor for FBKSubmissionError();
    sub_1000077AC(&qword_100011FE0, 255, (void (*)(uint64_t))&type metadata accessor for FBKSubmissionError);
    uint64_t v7 = Error.localizedDescription.getter();
    sub_100005988(v7, v8, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Failed to submit feedback.%s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return sub_100004E1C();
}

void *sub_100006E14()
{
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000071D8(v0, (uint64_t)qword_100011DA8);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)id v3 = 136446210;
    sub_100005988(0xD00000000000002DLL, 0x8000000100008C20, &v5);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%{public}s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return sub_100004E1C();
}

void *sub_100006F9C()
{
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000071D8(v0, (uint64_t)qword_100011DA8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136446466;
    sub_100005988(0xD000000000000024, 0x8000000100008980, &v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v3 + 12) = 2112;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%{public}s %@", (uint8_t *)v3, 0x16u);
    sub_100007210(&qword_100011FD0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  return sub_100004E1C();
}

uint64_t sub_1000071D8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100007210(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007254(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000072A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100007304(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100007368(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007210(&qword_100011FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000073D0(uint64_t a1)
{
  uint64_t v2 = sub_100007210(&qword_100011FF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007430(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100007448(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100007458()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100007490()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000074A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000074F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100007504()
{
  return swift_release();
}

uint64_t sub_10000750C(uint64_t a1, unint64_t a2)
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

unint64_t sub_100007564()
{
  unint64_t result = qword_100012070;
  if (!qword_100012070)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100012070);
  }
  return result;
}

uint64_t sub_1000075A4()
{
  uint64_t v1 = type metadata accessor for FBKSRemoteAlertRequest();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  if (*(void *)(v0 + v6)) {
    swift_release();
  }

  return _swift_deallocObject(v0, v6 + 16, v3 | 7);
}

void sub_10000765C()
{
  uint64_t v1 = *(void *)(type metadata accessor for FBKSRemoteAlertRequest() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = v0 + v2;
  unint64_t v5 = *(char **)(v0 + v3);
  uint64_t v6 = v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = *(void (**)(void))v6;
  uint64_t v8 = *(void *)(v6 + 8);

  sub_1000044DC(v4, v5, v7, v8);
}

uint64_t sub_1000076F8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_100007708()
{
  unint64_t result = qword_100012088;
  if (!qword_100012088)
  {
    sub_100007764(&qword_100012080);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100012088);
  }
  return result;
}

uint64_t sub_100007764(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000077AC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000077F4(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_1000079BC()
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

id sub_100007B5C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

uint64_t sub_100007BC4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t static JSONCodable.decode(from:)()
{
  return static JSONCodable.decode(from:)();
}

uint64_t type metadata accessor for FBKSEvaluation.Action()
{
  return type metadata accessor for FBKSEvaluation.Action();
}

uint64_t type metadata accessor for FBKSEvaluation.Subject()
{
  return type metadata accessor for FBKSEvaluation.Subject();
}

uint64_t type metadata accessor for FBKSRemoteAlertRequest()
{
  return type metadata accessor for FBKSRemoteAlertRequest();
}

uint64_t FBKSRemoteEvaluationRequest.interaction.getter()
{
  return FBKSRemoteEvaluationRequest.interaction.getter();
}

uint64_t FBKSRemoteEvaluationRequest.action.getter()
{
  return FBKSRemoteEvaluationRequest.action.getter();
}

uint64_t type metadata accessor for FBKSRemoteEvaluationRequest()
{
  return type metadata accessor for FBKSRemoteEvaluationRequest();
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

uint64_t DarwinBoolean.description.getter()
{
  return DarwinBoolean.description.getter();
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

uint64_t FBKDraftError.description.getter()
{
  return FBKDraftError.description.getter();
}

uint64_t FBKFeedbackForm.__allocating_init(serviceForm:)()
{
  return FBKFeedbackForm.__allocating_init(serviceForm:)();
}

uint64_t FBKFeedbackForm.init(identifier:)()
{
  return FBKFeedbackForm.init(identifier:)();
}

uint64_t type metadata accessor for FBKFeedbackForm()
{
  return type metadata accessor for FBKFeedbackForm();
}

uint64_t FBKAttachmentError.description.getter()
{
  return FBKAttachmentError.description.getter();
}

uint64_t type metadata accessor for FBKSubmissionError()
{
  return type metadata accessor for FBKSubmissionError();
}

uint64_t dispatch thunk of FBKEvaluationController.userDidPerformAction(action:subject:showFeedbackForm:retryCount:)()
{
  return dispatch thunk of FBKEvaluationController.userDidPerformAction(action:subject:showFeedbackForm:retryCount:)();
}

uint64_t dispatch thunk of FBKEvaluationController.blockPresentationDetentUsage.setter()
{
  return dispatch thunk of FBKEvaluationController.blockPresentationDetentUsage.setter();
}

uint64_t FBKEvaluationController.__allocating_init(delegate:)()
{
  return FBKEvaluationController.__allocating_init(delegate:)();
}

uint64_t type metadata accessor for FBKEvaluationController()
{
  return type metadata accessor for FBKEvaluationController();
}

uint64_t FBKFeedbackDraftViewController.init(feedbackForm:)()
{
  return FBKFeedbackDraftViewController.init(feedbackForm:)();
}

uint64_t dispatch thunk of FBKFeedbackDraftViewController.delegate.setter()
{
  return dispatch thunk of FBKFeedbackDraftViewController.delegate.setter();
}

uint64_t type metadata accessor for FBKFeedbackDraftViewController()
{
  return type metadata accessor for FBKFeedbackDraftViewController();
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

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
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

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
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

uint64_t FBKSHasInternalDiagnostics()
{
  return _FBKSHasInternalDiagnostics();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
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