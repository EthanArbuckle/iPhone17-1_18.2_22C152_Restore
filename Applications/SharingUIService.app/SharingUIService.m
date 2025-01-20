id sub_100002214()
{
  void *v0;
  uint64_t vars8;

  if (qword_100044658[0] != -1) {
    dispatch_once(qword_100044658, &stru_100039438);
  }
  v0 = (void *)qword_100044650;

  return v0;
}

void sub_100002268(id a1)
{
  qword_100044650 = (uint64_t)os_log_create("com.apple.sharinguiservice", "ShareSheetUI");

  _objc_release_x1();
}

void sub_1000023B0()
{
  v0 = share_sheet_log();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetServiceLoad", "", v1, 2u);
  }
}

void sub_100002428()
{
  id v0 = +[UIApplication sharedApplication];
  [v0 _performBlockAfterCATransactionCommits:&stru_100039458];
}

void sub_100002478(id a1)
{
  v1 = share_sheet_log();
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v1, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetServiceLoad", "", v2, 2u);
  }
}

uint64_t sub_10000269C()
{
  sub_100006E30((uint64_t *)&unk_100043230);
  __chkstk_darwin();
  v1 = (char *)v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000061DC((uint64_t)v1);
  uint64_t v2 = sub_100006E30((uint64_t *)&unk_100044080);
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_10000842C((uint64_t)v1, (uint64_t *)&unk_100043230);
    return static SHSheetRemoteSetting.HostProcessType.defaultValue.getter();
  }
  else
  {
    type metadata accessor for SHSheetRemoteSetting.HostProcessType();
    swift_getOpaqueTypeConformance2();
    sub_100007C40(&qword_100043258, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.HostProcessType);
    dispatch thunk of UISceneKeyValueStorage.subscript.getter();
    uint64_t v4 = v6[1];
    (*(void (**)(char *, uint64_t))(v3 + 8))(v1, v2);
  }
  return v4;
}

uint64_t sub_100002864()
{
  uint64_t v1 = sub_100006E30((uint64_t *)&unk_100043230);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007F84(v4, (uint64_t)qword_100045D30);
  v5 = v0;
  v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (void *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = *(void **)&v5[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_scene];
    v18[1] = v10;
    id v11 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v9 = v10;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "create new share sheet session for scene:%@", v8, 0xCu);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_1000061DC((uint64_t)v3);
  uint64_t v12 = sub_100006E30((uint64_t *)&unk_100044080);
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v3, 1, v12) == 1)
  {
    uint64_t result = sub_10000842C((uint64_t)v3, (uint64_t *)&unk_100043230);
  }
  else
  {
    type metadata accessor for SHSheetRemoteSetting.ClientContext();
    swift_getOpaqueTypeConformance2();
    sub_100008D18(0, &qword_100043240);
    sub_100007C40(&qword_100043248, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.ClientContext);
    v14 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v3, v12);
    if (v14)
    {
      id v16 = objc_allocWithZone((Class)type metadata accessor for ShareSheetUISession());
      v17 = sub_10001B0DC(v14);
      *(void *)&v17[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate + 8] = &off_100039760;
      swift_unknownObjectWeakAssign();
      return (uint64_t)v17;
    }
  }
  __break(1u);
  return result;
}

void sub_100002BE0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100006E30((uint64_t *)&unk_100043230);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  v5 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  os_log_type_t v7 = (char *)v33 - v6;
  uint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
  sub_1000061DC((uint64_t)v33 - v6);
  uint64_t v9 = sub_100006E30((uint64_t *)&unk_100044080);
  uint64_t v10 = *(void *)(v9 - 8);
  id v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v7, 1, v9) == 1)
  {
    sub_10000842C((uint64_t)v7, (uint64_t *)&unk_100043230);
    goto LABEL_12;
  }
  v35 = v11;
  uint64_t v36 = v8;
  type metadata accessor for SHSheetRemoteSetting.ClientContext();
  swift_getOpaqueTypeConformance2();
  sub_100008D18(0, &qword_100043240);
  sub_100007C40(&qword_100043248, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.ClientContext);
  uint64_t v12 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter();
  v14 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v13 = v10 + 8;
  v34 = v14;
  v14(v7, v9);
  if (!v12)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v15 = [objc_allocWithZone((Class)UIActivityContentContext) init];
  [v15 setIsRemote:1];
  [v15 setCanRenderPeople:1];
  [v15 setConfigureForCloudSharing:[v12 configureForCloudSharing]];
  [v15 setConfigureForPhotosEdit:[v12 configureForPhotosEdit]];
  [v15 setHideHeaderView:[v12 hideHeaderView]];
  [v15 setSharingExpanded:[v12 isSharingExpanded]];
  id v16 = [v12 topContentSectionText];
  [v15 setTopContentSectionText:v16];

  id v17 = [v12 applicationActivityTypes];
  [v15 setApplicationActivityTypes:v17];

  id v18 = [v12 heroActionActivityTypes];
  [v15 setHeroActionActivityTypes:v18];

  [v15 setShowHeroActionsHorizontally:[v12 showHeroActionsHorizontally]];
  id v19 = [v12 tintColor];
  [v15 setTintColor:v19];

  id v20 = [*(id *)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_fbsScene) hostAuditToken];
  if (!v20) {
    goto LABEL_6;
  }
  id v21 = v20;
  [v15 setHostAuditToken:v20];
  uint64_t v22 = *(void *)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession);
  if (v22)
  {
    v23 = *(void **)(v22 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken);
    *(void *)(v22 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken) = v21;

LABEL_6:
    v33[1] = v13;
    id v24 = [objc_allocWithZone((Class)UIActivityContentViewController) initWithContext:v15];
    [v24 setDelegate:v1];
    uint64_t v25 = OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession;
    [v24 setPresenter:*(void *)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession)];
    sub_1000061DC((uint64_t)v5);
    if (v35(v5, 1, v9) == 1)
    {
      sub_10000842C((uint64_t)v5, (uint64_t *)&unk_100043230);
      uint64_t v26 = static SHSheetRemoteSetting.HostPresentationStyle.defaultValue.getter();
    }
    else
    {
      type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle();
      sub_100007C40(&qword_100043308, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle);
      dispatch thunk of UISceneKeyValueStorage.subscript.getter();
      uint64_t v26 = v37;
      v34(v5, v9);
    }
    id v27 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v26];
    [v24 setHostPresentationStyle:v27];

    uint64_t v28 = *(void *)(v1 + v25);
    if (v28)
    {
      v29 = (void *)(v28 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
      swift_beginAccess();
      void *v29 = v24;
      id v30 = v24;
      swift_unknownObjectRelease();
      v31 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController);
      *(void *)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController) = v24;
      id v32 = v30;

      [objc_allocWithZone((Class)SUISNavigationController) initWithRootViewController:v32];
      return;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_100003208()
{
  uint64_t v1 = sub_100006E30((uint64_t *)&unk_100043230);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_scene);
  self;
  uint64_t v5 = swift_dynamicCastObjCClassUnconditional();
  id v6 = objc_allocWithZone((Class)UIWindow);
  id v7 = v4;
  id v8 = [v6 initWithWindowScene:v5];
  [v8 setRootViewController:*(void *)(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_rootViewController)];
  id v9 = v8;
  sub_1000061DC((uint64_t)v3);
  uint64_t v10 = sub_100006E30((uint64_t *)&unk_100044080);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v3, 1, v10) == 1)
  {
    uint64_t result = sub_10000842C((uint64_t)v3, (uint64_t *)&unk_100043230);
  }
  else
  {
    type metadata accessor for SHSheetRemoteSetting.ClientContext();
    swift_getOpaqueTypeConformance2();
    sub_100008D18(0, &qword_100043240);
    sub_100007C40(&qword_100043248, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.ClientContext);
    uint64_t v12 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v3, v10);
    if (v12)
    {
      id v14 = [v12 tintColor];

      [v9 setTintColor:v14];
      return (uint64_t)v9;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100003498()
{
  uint64_t v1 = sub_100006E30((uint64_t *)&unk_100043230);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  v42 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v41 = (uint64_t)&v37 - v5;
  __chkstk_darwin(v4);
  id v7 = (char *)&v37 - v6;
  uint64_t v8 = sub_100006E30((uint64_t *)&unk_100044080);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v40 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  v39 = (char *)&v37 - v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v37 - v14;
  uint64_t v16 = *(void *)(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_100003F78((uint64_t)sub_100008488, v17);
  swift_release_n();
  uint64_t v18 = v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_sceneSettingsObservables;
  swift_beginAccess();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)(*(void *)v18 + 16) >= *(void *)(*(void *)v18 + 24) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  uint64_t v19 = swift_allocObject();
  uint64_t v45 = v0;
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_100004510((uint64_t)sub_100008490, v19);
  swift_release_n();
  swift_beginAccess();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)(*(void *)v18 + 16) >= *(void *)(*(void *)v18 + 24) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  sub_1000047B0((uint64_t)nullsub_1, 0);
  swift_beginAccess();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)(*(void *)v18 + 16) >= *(void *)(*(void *)v18 + 24) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v44 = v16;
  sub_1000061DC((uint64_t)v7);
  id v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
  int v22 = v21(v7, 1, v8);
  uint64_t v43 = v9;
  if (v22 == 1)
  {
    sub_10000842C((uint64_t)v7, (uint64_t *)&unk_100043230);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v15, v7, v8);
    type metadata accessor for SHSheetRemoteSetting.OptionGroups();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = sub_100008498;
    *(void *)(v23 + 24) = v20;
    swift_retain();
    swift_getOpaqueTypeConformance2();
    sub_100007C40(&qword_1000432E8, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.OptionGroups);
    dispatch thunk of UISceneKeyValueStorage.observe<A>(_:handler:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
  }
  swift_release_n();
  swift_beginAccess();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)(*(void *)v18 + 16) >= *(void *)(*(void *)v18 + 24) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  uint64_t v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v25 = v41;
  sub_1000061DC(v41);
  if (v21((char *)v25, 1, v8) == 1)
  {
    sub_10000842C(v25, (uint64_t *)&unk_100043230);
  }
  else
  {
    uint64_t v26 = v43;
    id v27 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 32);
    v38 = v21;
    uint64_t v28 = v39;
    v27(v39, v25, v8);
    type metadata accessor for SHSheetRemoteSetting.CollaborationOptions();
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = sub_1000084C8;
    *(void *)(v29 + 24) = v24;
    swift_retain();
    swift_getOpaqueTypeConformance2();
    type metadata accessor for SHSheetCollaborationOptions();
    sub_100007C40(&qword_1000432E0, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.CollaborationOptions);
    dispatch thunk of UISceneKeyValueStorage.observe<A, B>(_:handler:)();
    swift_release();
    id v30 = v28;
    id v21 = v38;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v30, v8);
  }
  swift_release_n();
  uint64_t v31 = (uint64_t)v42;
  swift_beginAccess();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)(*(void *)v18 + 16) >= *(void *)(*(void *)v18 + 24) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  uint64_t v32 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1000061DC(v31);
  if (v21((char *)v31, 1, v8) == 1)
  {
    sub_10000842C(v31, (uint64_t *)&unk_100043230);
  }
  else
  {
    uint64_t v33 = v43;
    v34 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 32))(v40, v31, v8);
    type metadata accessor for SHSheetRemoteSetting.CloudShareRequest();
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = sub_1000084F8;
    *(void *)(v35 + 24) = v32;
    swift_retain();
    swift_getOpaqueTypeConformance2();
    type metadata accessor for SHSheetCloudSharingRequest();
    sub_100007C40(&qword_1000432D8, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.CloudShareRequest);
    dispatch thunk of UISceneKeyValueStorage.observe<A, B>(_:handler:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v8);
  }
  swift_release_n();
  swift_beginAccess();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)(*(void *)v18 + 16) >= *(void *)(*(void *)v18 + 24) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  return swift_endAccess();
}

void sub_100003E9C(uint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (char *)Strong;
    uint64_t v4 = *(void **)(Strong + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController);
    if (v4)
    {
      id v5 = objc_allocWithZone((Class)NSNumber);
      id v6 = v4;
      id v7 = [v5 initWithInteger:a1];
      [v6 setHostPresentationStyle:v7];

      uint64_t v8 = *(void **)&v3[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router];
      if (v8)
      {
        [v8 layoutPresentationBlockingViewController];

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t sub_100003F78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006E30((uint64_t *)&unk_100043230);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006E30((uint64_t *)&unk_100044080);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000061DC((uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_10000842C((uint64_t)v6, (uint64_t *)&unk_100043230);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle();
    uint64_t v12 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = v12;
    v13[3] = a1;
    v13[4] = a2;
    swift_retain();
    swift_getOpaqueTypeConformance2();
    sub_100007C40(&qword_100043308, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle);
    uint64_t v11 = dispatch thunk of UISceneKeyValueStorage.observe<A>(_:handler:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return v11;
}

void sub_10000420C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_100004260();
  }
}

void sub_100004260()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100006E30((uint64_t *)&unk_100043230);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100007F84(v5, (uint64_t)qword_100045D30);
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Updating remote scene session", v8, 2u);
    swift_slowDealloc();
  }

  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession);
  if (!v9)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v10 = v9;
  sub_1000061DC((uint64_t)v4);
  uint64_t v11 = sub_100006E30((uint64_t *)&unk_100044080);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v4, 1, v11) == 1)
  {
LABEL_10:
    sub_10000842C((uint64_t)v4, (uint64_t *)&unk_100043230);
    goto LABEL_11;
  }
  type metadata accessor for SHSheetRemoteSetting.ClientContext();
  swift_getOpaqueTypeConformance2();
  sub_100008D18(0, &qword_100043240);
  sub_100007C40(&qword_100043248, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.ClientContext);
  uint64_t v13 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v4, v11);
  if (v13)
  {
    sub_10001AE44(v13);

    return;
  }
LABEL_11:
  __break(1u);
}

uint64_t sub_100004510(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006E30((uint64_t *)&unk_100043230);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006E30((uint64_t *)&unk_100044080);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000061DC((uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_10000842C((uint64_t)v6, (uint64_t *)&unk_100043230);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    type metadata accessor for SHSheetRemoteSetting.ClientContext();
    uint64_t v12 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = v12;
    v13[3] = a1;
    v13[4] = a2;
    swift_retain();
    swift_getOpaqueTypeConformance2();
    sub_100008D18(0, &qword_100043240);
    sub_100007C40(&qword_100043248, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.ClientContext);
    uint64_t v11 = dispatch thunk of UISceneKeyValueStorage.observe<A, B>(_:handler:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return v11;
}

uint64_t sub_1000047B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006E30((uint64_t *)&unk_100043230);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006E30((uint64_t *)&unk_100044080);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000061DC((uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_10000842C((uint64_t)v6, (uint64_t *)&unk_100043230);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    type metadata accessor for SHSheetRemoteSetting.HostProcessType();
    uint64_t v12 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = v12;
    v13[3] = a1;
    v13[4] = a2;
    swift_retain();
    swift_getOpaqueTypeConformance2();
    sub_100007C40(&qword_100043258, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.HostProcessType);
    uint64_t v11 = dispatch thunk of UISceneKeyValueStorage.observe<A>(_:handler:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return v11;
}

void sub_100004A44(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v6 = (void *)Strong;
    uint64_t v7 = *(void **)(Strong + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession);
    id v8 = v7;

    if (v7)
    {
      a3(a1);
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100004ADC()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong) {
}
  }

void sub_100004B28(void *a1)
{
  uint64_t v2 = sub_100006E30(&qword_1000432D0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    id v6 = (void *)v5;
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (!Strong) {
      return;
    }
    id v8 = (char *)Strong;
    uint64_t v9 = a1;
    id v10 = [v6 event];
    sub_10001A2B8(v10);
    goto LABEL_4;
  }
  self;
  uint64_t v11 = swift_dynamicCastObjCClass();
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    swift_beginAccess();
    uint64_t v13 = swift_unknownObjectWeakLoadStrong();
    if (v13)
    {
      id v8 = (char *)v13;
      uint64_t v9 = a1;
      id v10 = [v12 change];
      uint64_t v14 = (id *)&v8[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView];
      swift_beginAccess();
      if (*v14) {
        [*v14 didUpdateAirDropTransferWithChange:v10];
      }
      goto LABEL_4;
    }
  }
  else
  {
    self;
    uint64_t v15 = swift_dynamicCastObjCClass();
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      swift_beginAccess();
      uint64_t v17 = swift_unknownObjectWeakLoadStrong();
      if (v17)
      {
        uint64_t v18 = (void *)v17;
        id v19 = a1;
        id v20 = [v16 activityUUID];
        if (v20)
        {
          id v21 = v20;
          static UUID._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v22 = type metadata accessor for UUID();
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v4, 0, 1, v22);
        }
        else
        {
          uint64_t v26 = type metadata accessor for UUID();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v4, 1, 1, v26);
        }
        sub_10001A784((uint64_t)v4);

        sub_10000842C((uint64_t)v4, &qword_1000432D0);
      }
    }
    else
    {
      self;
      uint64_t v23 = swift_dynamicCastObjCClass();
      if (v23)
      {
        uint64_t v24 = (void *)v23;
        swift_beginAccess();
        uint64_t v25 = swift_unknownObjectWeakLoadStrong();
        if (v25)
        {
          id v8 = (char *)v25;
          uint64_t v9 = a1;
          id v10 = [v24 test];
          sub_10001AC84(v10);
LABEL_4:

LABEL_5:
        }
      }
      else
      {
        self;
        uint64_t v27 = swift_dynamicCastObjCClass();
        if (v27)
        {
          uint64_t v28 = (void *)v27;
          swift_beginAccess();
          uint64_t v29 = swift_unknownObjectWeakLoadStrong();
          if (v29)
          {
            id v8 = (char *)v29;
            uint64_t v9 = a1;
            id v10 = [v28 metadata];
            id v30 = (id *)&v8[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView];
            swift_beginAccess();
            if (*v30) {
              [*v30 reloadMetadata:v10];
            }
            goto LABEL_4;
          }
        }
        else
        {
          if (qword_100042E38 != -1) {
            swift_once();
          }
          uint64_t v31 = type metadata accessor for Logger();
          sub_100007F84(v31, (uint64_t)qword_100045D30);
          id v38 = a1;
          uint64_t v9 = Logger.logObject.getter();
          os_log_type_t v32 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v9, v32))
          {
            uint64_t v33 = (uint8_t *)swift_slowAlloc();
            v34 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v33 = 138412290;
            id v39 = v38;
            id v35 = v38;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            void *v34 = v38;

            _os_log_impl((void *)&_mh_execute_header, v9, v32, "Scene session received unhandled action: %@", v33, 0xCu);
            sub_100006E30(&qword_100043250);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
            goto LABEL_5;
          }

          id v36 = v38;
        }
      }
    }
  }
}

void sub_100005080(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_1000050E8()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100007F84(v3, (uint64_t)qword_100045D30);
  id v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "deinit Remote scene session", v6, 2u);
    swift_slowDealloc();
  }

  id v7 = [objc_allocWithZone((Class)SHSheetAction) initWithType:8];
  id v8 = *(void **)&v1[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene];
  self;
  uint64_t v9 = (void *)swift_dynamicCastObjCClass();
  if (v9) {
    id v10 = v8;
  }
  [v9 sendAction:v7];

  v12.receiver = v1;
  v12.super_class = ObjectType;
  return [super dealloc];
}

void sub_1000053B8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_activeCloudShareRequest;
  if (*(void *)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_activeCloudShareRequest))
  {
    if (qword_100042E38 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_100007F84(v5, (uint64_t)qword_100045D30);
    id v6 = a1;
    id v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      os_log_t oslog = (os_log_t)swift_slowAlloc();
      id v21 = v6;
      *(_DWORD *)uint64_t v9 = 138412290;
      id v10 = v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      oslog->isa = (Class)v6;

      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Sending collaboration cloud sharing result: %@ to host", v9, 0xCu);
      sub_100006E30(&qword_100043250);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v14 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = 0;

    id v15 = [objc_allocWithZone((Class)SHSheetCloudShareResultAction) initWithResult:v6];
    uint64_t v16 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
    self;
    uint64_t v17 = (void *)swift_dynamicCastObjCClass();
    if (v17) {
      id v18 = v16;
    }
    [v17 sendAction:v15];
  }
  else
  {
    if (qword_100042E38 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_100007F84(v11, (uint64_t)qword_100045D30);
    osloga = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(osloga, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, osloga, v12, "Can't send collaboration cloud sharing result without an active share request", v13, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_1000056C4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_100005738()
{
  return *(id *)(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_scene);
}

uint64_t sub_100005748()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_fbsScene) settings];
  unsigned int v2 = [v1 isForeground];

  return v2 ^ 1;
}

id sub_1000057A8()
{
  id v1 = self;

  return [v1 unregisterHandlerForHostedWindowScene:v0];
}

void sub_1000057E4()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (void *)Strong;
    unsigned int v2 = *(void **)(Strong + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession);
    uint64_t v3 = v2;

    if (v2)
    {
      v3[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_wantsRemoteOptionsPresentation] = 0;
      id v4 = *(void **)&v3[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_optionsViewController];
      *(void *)&v3[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_optionsViewController] = 0;

      uint64_t v5 = *(void **)&v3[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_collaborationOptionsViewController];
      *(void *)&v3[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_collaborationOptionsViewController] = 0;
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100005890(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
  self;
  id v6 = (id)swift_dynamicCastObjCClass();
  if (v6) {
    id v5 = v4;
  }
  [v6 sendAction:a2];
}

id sub_100005910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100005928(a1, a2, a3, a4, (SEL *)&selRef_presentUserDefaultsViewController_);
}

id sub_10000591C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100005928(a1, a2, a3, a4, (SEL *)&selRef_presentAlertController_);
}

id sub_100005928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  id result = *(id *)(v5 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router);
  if (result) {
    return [result *a5:a2];
  }
  __break(1u);
  return result;
}

void sub_100005948(uint64_t a1, uint64_t a2)
{
}

id sub_100005950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005968(a1, a2, a3, (SEL *)&selRef_presentPresentationBlockingViewController);
}

id sub_10000595C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005968(a1, a2, a3, (SEL *)&selRef_dismissPresentationBlockingViewControllerIfNeeded);
}

id sub_100005968(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  id result = *(id *)(v4 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router);
  if (result) {
    return [result *a4];
  }
  __break(1u);
  return result;
}

void sub_100005A54(void *a1)
{
  id v1 = [a1 headerMetadata];
  if (v1)
  {
    uint64_t v2 = v1;
    sub_100006E30(&qword_100043378);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_10002B9F0;
    *(void *)(v3 + 32) = v2;
    specialized Array._endMutation()();
    sub_100008D18(0, (unint64_t *)&unk_100043380);
    id v4 = v2;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v6 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v8[4] = sub_100008D10;
    v8[5] = v6;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_10000D7FC;
    v8[3] = &unk_100039990;
    id v7 = _Block_copy(v8);
    swift_release();
    SFUILinkMetadataSerializationForLocalUseOnly();
    _Block_release(v7);
  }
}

void sub_100005BC8(void *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v11 = Strong;
    if (a1[2])
    {
      uint64_t v19 = v3;
      uint64_t v12 = a1[4];
      unint64_t v13 = a1[5];
      sub_100008D18(0, (unint64_t *)&unk_100043AE0);
      sub_100008D54(v12, v13);
      uint64_t v18 = static OS_dispatch_queue.main.getter();
      uint64_t v14 = (void *)swift_allocObject();
      v14[2] = v12;
      v14[3] = v13;
      v14[4] = v11;
      aBlock[4] = sub_100008E44;
      aBlock[5] = v14;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000056C4;
      aBlock[3] = &unk_1000399E0;
      id v15 = _Block_copy(aBlock);
      sub_100008D54(v12, v13);
      id v17 = v11;
      swift_release();
      static DispatchQoS.unspecified.getter();
      aBlock[0] = &_swiftEmptyArrayStorage;
      sub_100007C40((unint64_t *)&qword_100043390, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100006E30((uint64_t *)&unk_100043AF0);
      sub_100008E50();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      uint64_t v16 = (void *)v18;
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v15);

      sub_100008DEC(v12, v13);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    else
    {
    }
  }
}

void sub_100005F00(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id v6 = objc_allocWithZone((Class)SHSheetMetadataUpdateAction);
  sub_100008D54(a1, a2);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v8 = [v6 initWithSerializedMetadata:isa];
  sub_100008DEC(a1, a2);

  uint64_t v9 = *(void **)(a3 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
  self;
  id v11 = (id)swift_dynamicCastObjCClass();
  if (v11) {
    id v10 = v9;
  }
  [v11 sendAction:v8];
}

uint64_t sub_1000061DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  sub_100006E30((uint64_t *)&unk_100043230);
  __chkstk_darwin();
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  UIScene.hostStorage.getter();
  uint64_t v6 = sub_100006E30((uint64_t *)&unk_100044080);
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6);
  sub_10000842C((uint64_t)v5, (uint64_t *)&unk_100043230);
  if (v7 == 1)
  {
    if (qword_100042E38 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100007F84(v8, (uint64_t)qword_100045D30);
    uint64_t v9 = v2;
    id v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v16[0] = a1;
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      unint64_t v13 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 138412290;
      v16[1] = v9;
      uint64_t v14 = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unint64_t v13 = v9;

      _os_log_impl((void *)&_mh_execute_header, v10, v11, "No host storage found for scene: %@", v12, 0xCu);
      sub_100006E30(&qword_100043250);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v10 = v9;
    }
  }
  return UIScene.hostStorage.getter();
}

void sub_10000643C(uint64_t a1, uint64_t a2, void (*a3)(void *))
{
  uint64_t v4 = sub_100006E30((uint64_t *)&unk_100043230);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    sub_1000061DC((uint64_t)v6);
    uint64_t v9 = sub_100006E30((uint64_t *)&unk_100044080);
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
    {
      sub_10000842C((uint64_t)v6, (uint64_t *)&unk_100043230);
      os_log_type_t v11 = 0;
    }
    else
    {
      type metadata accessor for SHSheetRemoteSetting.ClientContext();
      swift_getOpaqueTypeConformance2();
      sub_100008D18(0, &qword_100043240);
      sub_100007C40(&qword_100043248, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.ClientContext);
      os_log_type_t v11 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
    }
    a3(v11);
  }
}

void sub_100006654(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_100006E30((uint64_t *)&unk_100043230);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    sub_1000061DC((uint64_t)v6);
    uint64_t v9 = sub_100006E30((uint64_t *)&unk_100044080);
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
    {
      sub_10000842C((uint64_t)v6, (uint64_t *)&unk_100043230);
      uint64_t v11 = static SHSheetRemoteSetting.HostPresentationStyle.defaultValue.getter();
    }
    else
    {
      type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle();
      swift_getOpaqueTypeConformance2();
      sub_100007C40(&qword_100043308, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle);
      dispatch thunk of UISceneKeyValueStorage.subscript.getter();
      uint64_t v11 = v12;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
    }
    a3(v11);
  }
}

void sub_100006860(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_100006E30((uint64_t *)&unk_100043230);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    sub_1000061DC((uint64_t)v6);
    uint64_t v9 = sub_100006E30((uint64_t *)&unk_100044080);
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
    {
      sub_10000842C((uint64_t)v6, (uint64_t *)&unk_100043230);
      uint64_t v11 = static SHSheetRemoteSetting.HostProcessType.defaultValue.getter();
    }
    else
    {
      type metadata accessor for SHSheetRemoteSetting.HostProcessType();
      swift_getOpaqueTypeConformance2();
      sub_100007C40(&qword_100043258, (void (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.HostProcessType);
      dispatch thunk of UISceneKeyValueStorage.subscript.getter();
      uint64_t v11 = v12;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
    }
    a3(v11);
  }
}

void sub_100006A6C(uint64_t a1, void (*a2)())
{
  sub_100006E30(&qword_1000432F0);
  UITypedKeyDiff.newValue.getter();
  a2();
}

void sub_100006AD0(uint64_t a1, void (*a2)(void *), uint64_t a3, uint64_t *a4, uint64_t (*a5)(uint64_t))
{
  sub_100006E30(a4);
  uint64_t v7 = UITypedKeyDiff.newValue.getter();
  if (v9)
  {
    uint64_t v8 = (void *)a5(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  a2(v8);
}

uint64_t variable initialization expression of ShareIntent._shareTransport()
{
  uint64_t v17 = type metadata accessor for InputConnectionBehavior();
  uint64_t v0 = *(void *)(v17 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006E30(&qword_100042EA8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_100006E30(&qword_100042EB0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for LocalizedStringResource();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100006E30(&qword_100042EB8);
  LocalizedStringResource.init(stringLiteral:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  uint64_t v13 = type metadata accessor for IntentDialog();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100006E74();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100006E30(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006E74()
{
  unint64_t result = qword_100042EC0;
  if (!qword_100042EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100042EC0);
  }
  return result;
}

uint64_t variable initialization expression of ShareIntent._recipients()
{
  uint64_t v17 = type metadata accessor for InputConnectionBehavior();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for IntentPerson.ParameterMode();
  uint64_t v3 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006E30(&qword_100042EA8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006E30(&qword_100042EB0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for LocalizedStringResource();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100006E30(&qword_100042EC8);
  LocalizedStringResource.init(stringLiteral:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  uint64_t v14 = type metadata accessor for IntentDialog();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for IntentPerson.ParameterMode.contact(_:), v16);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  return IntentParameter<>.init(title:description:mode:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t variable initialization expression of ShareIntent._mode()
{
  uint64_t v17 = type metadata accessor for InputConnectionBehavior();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006E30(&qword_100042EA8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100006E30(&qword_100042EB0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for LocalizedStringResource();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100006E30(&qword_100042ED0);
  LocalizedStringResource.init(stringLiteral:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 2;
  uint64_t v14 = type metadata accessor for IntentDialog();
  id v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_1000074DC();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

unint64_t sub_1000074DC()
{
  unint64_t result = qword_100042ED8;
  if (!qword_100042ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100042ED8);
  }
  return result;
}

uint64_t variable initialization expression of ShareIntent._content()
{
  uint64_t v0 = type metadata accessor for InputConnectionBehavior();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006E30(&qword_100042EA8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006E30(&qword_100042EB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for LocalizedStringResource();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_100006E30(&qword_100042EE0);
  LocalizedStringResource.init(stringLiteral:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  v14[1] = 0;
  uint64_t v12 = type metadata accessor for IntentDialog();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v6, 1, 1, v12);
  sub_100006E30(&qword_100042EE8);
  type metadata accessor for UTType();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10002BA00;
  static UTType.item.getter();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  return IntentParameter<>.init(title:description:default:supportedContentTypes:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t variable initialization expression of ShareTransportQuery._shareIntent()
{
  return IntentParameterDependency.__allocating_init<A, B>(_:)();
}

uint64_t type metadata accessor for ShareSheetRemoteSceneSession()
{
  return self;
}

void type metadata accessor for ActivityType(uint64_t a1)
{
}

uint64_t sub_1000078CC(uint64_t a1, uint64_t a2)
{
  return sub_100007DA4(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

void sub_1000078F0(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_1000078FC(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100007904@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100007918(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100007948(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_10000795C(void *result)
{
  *v1 &= *result;
  return result;
}

uint64_t sub_100007970(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_1000079E8(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100007A68@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void *sub_100007AB4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100007AC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100007AF4(uint64_t a1)
{
  uint64_t v2 = sub_100007C40(&qword_100043260, type metadata accessor for ActivityType);
  uint64_t v3 = sub_100007C40(&qword_100043268, type metadata accessor for ActivityType);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100007BB0()
{
  return sub_100007C40(&qword_100043218, type metadata accessor for ActivityType);
}

uint64_t sub_100007BF8()
{
  return sub_100007C40(&qword_100043220, type metadata accessor for ActivityType);
}

uint64_t sub_100007C40(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100007C88@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100007CD0(uint64_t a1)
{
  uint64_t v2 = sub_100007C40(&qword_1000433D0, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_100007C40(&qword_1000433D8, type metadata accessor for URLResourceKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100007D8C(uint64_t a1, uint64_t a2)
{
  return sub_100007DA4(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100007DA4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100007DE8()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100007E3C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100007EB0()
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

uint64_t sub_100007F3C()
{
  return sub_100007C40(&qword_100043228, type metadata accessor for ActivityType);
}

uint64_t sub_100007F84(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_100007FBC(void *a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_rootViewController] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_window] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_sceneSettingsObservables] = &_swiftEmptyArrayStorage;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_activeCloudShareRequest] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_scene] = a1;
  char v5 = v2;
  id v6 = a1;
  id v7 = [v6 _FBSScene];
  *(void *)&v5[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_fbsScene] = v7;
  self;
  *(void *)&v5[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene] = swift_dynamicCastObjCClassUnconditional();
  id v8 = v6;

  v30.receiver = v5;
  v30.super_class = ObjectType;
  uint64_t v9 = (char *)[super init];
  uint64_t v10 = sub_100002864();
  uint64_t v11 = OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession;
  uint64_t v12 = *(void **)&v9[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession];
  *(void *)&v9[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession] = v10;

  sub_100002BE0();
  uint64_t v13 = OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_rootViewController;
  uint64_t v14 = *(void **)&v9[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_rootViewController];
  *(void *)&v9[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_rootViewController] = v15;

  uint64_t v16 = sub_100003208();
  uint64_t v17 = *(void **)&v9[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_window];
  *(void *)&v9[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_window] = v16;

  uint64_t v18 = OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController;
  uint64_t v19 = *(void *)&v9[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController];
  if (!v19)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (!*(void *)&v9[v13])
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (!*(void *)&v9[v11])
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  self;
  id v20 = [objc_allocWithZone((Class)SHSheetRouter) initWithRootViewController:v19 mainNavigationController:swift_dynamicCastObjCClassUnconditional() supportsModalPresentations:1];
  uint64_t v21 = OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router;
  uint64_t v22 = *(void **)&v9[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router];
  *(void *)&v9[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router] = v20;

  uint64_t v23 = *(void **)&v9[v21];
  if (v23)
  {
    [v23 setMainViewController:*(void *)&v9[v18]];
    sub_100003498();
    uint64_t v24 = *(void **)&v9[v11];
    uint64_t v25 = self;
    uint64_t v26 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v29[4] = sub_100008424;
    v29[5] = v26;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 1107296256;
    v29[2] = sub_100005080;
    v29[3] = &unk_100039850;
    uint64_t v27 = _Block_copy(v29);
    id v28 = v24;
    swift_release();
    [v25 registerHandler:v27 forHostedWindowScene:v9];
    _Block_release(v27);

    return;
  }
LABEL_9:
  __break(1u);
}

void sub_1000082C8(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router);
  if (v2)
  {
    uint64_t v4 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v7[4] = sub_100008404;
    v7[5] = v4;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 1107296256;
    v7[2] = sub_1000056C4;
    v7[3] = &unk_100039800;
    char v5 = _Block_copy(v7);
    id v6 = v2;
    swift_release();
    [v6 presentOptionsViewController:a1 dismissalHandler:v5];
    _Block_release(v5);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000083CC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100008404()
{
}

uint64_t sub_10000840C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000841C()
{
  return swift_release();
}

void sub_100008424(void *a1)
{
}

uint64_t sub_10000842C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006E30(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_100008488(uint64_t a1)
{
}

void sub_100008490()
{
}

void sub_100008498(uint64_t a1)
{
  sub_100004A44(a1, v1, (void (*)(uint64_t))sub_1000194C8);
}

void sub_1000084C8(uint64_t a1)
{
  sub_100004A44(a1, v1, (void (*)(uint64_t))sub_100019D5C);
}

void sub_1000084F8()
{
}

uint64_t sub_100008500()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100008538(uint64_t a1)
{
  sub_100006AD0(a1, *(void (**)(void *))(v1 + 16), *(void *)(v1 + 24), &qword_100043300, (uint64_t (*)(uint64_t))&SHSheetCloudSharingRequest.request.getter);
}

void sub_100008570(uint64_t a1)
{
  sub_100006AD0(a1, *(void (**)(void *))(v1 + 16), *(void *)(v1 + 24), &qword_1000432F8, (uint64_t (*)(uint64_t))&SHSheetCollaborationOptions.shareOptionsData.getter);
}

void sub_1000085A8(uint64_t a1)
{
  sub_100006A6C(a1, *(void (**)())(v1 + 16));
}

void sub_1000085B4(uint64_t a1)
{
  sub_100006860(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

void sub_1000085C4(uint64_t a1)
{
  sub_10000643C(a1, *(void *)(v1 + 16), *(void (**)(void *))(v1 + 24));
}

uint64_t sub_1000085D4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100008614(uint64_t a1)
{
  sub_100006654(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

void sub_100008620()
{
  sub_100006E30(&qword_100043370);
  __chkstk_darwin();
  uint64_t v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  id v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_activeCloudShareRequest);
  if (v7)
  {
    os_log_t v23 = v7;
    id v8 = [v23 collaborationItemIdentifier];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v9 = type metadata accessor for URL();
    uint64_t v10 = *(void *)(v9 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, 1, 1, v9);
    swift_errorRetain();
    v11.super.Class isa = UUID._bridgeToObjectiveC()().super.isa;
    uint64_t v13 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v2, 1, v9) != 1)
    {
      URL._bridgeToObjectiveC()(v12);
      uint64_t v13 = v14;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v2, v9);
    }
    id v15 = objc_allocWithZone((Class)SFCollaborationCloudSharingResult);
    uint64_t v16 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    id v17 = [v15 initWithCollaborationItemIdentifier:v11.super.isa sharingURL:v13 share:0 error:v16 mailResult:0];

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_1000053B8(v17);
  }
  else
  {
    if (qword_100042E38 != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    sub_100007F84(v18, (uint64_t)qword_100045D30);
    os_log_t v23 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v19, "Received failedToSaveShareWithError message without an active cloud share request", v20, 2u);
      swift_slowDealloc();
    }
    os_log_t v21 = v23;
  }
}

void sub_100008994(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  sub_100006E30(&qword_100043370);
  __chkstk_darwin();
  id v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  NSUUID v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void **)(v3 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_activeCloudShareRequest);
  if (v12)
  {
    os_log_t v27 = v12;
    id v13 = [v27 collaborationItemIdentifier];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v14 = type metadata accessor for URL();
    uint64_t v15 = *(void *)(v14 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v7, a1, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
    id v16 = a2;
    v17.super.Class isa = UUID._bridgeToObjectiveC()().super.isa;
    os_log_type_t v19 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14) != 1)
    {
      URL._bridgeToObjectiveC()(v18);
      os_log_type_t v19 = v20;
      (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v14);
    }
    id v21 = [objc_allocWithZone((Class)SFCollaborationCloudSharingResult) initWithCollaborationItemIdentifier:v17.super.isa sharingURL:v19 share:v16 error:0 mailResult:0];

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_1000053B8(v21);
  }
  else
  {
    if (qword_100042E38 != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    sub_100007F84(v22, (uint64_t)qword_100045D30);
    os_log_t v27 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v23, "Received completedSharingWithShare message without an active cloud share request", v24, 2u);
      swift_slowDealloc();
    }
    os_log_t v25 = v27;
  }
}

void sub_100008D10(void *a1)
{
}

uint64_t sub_100008D18(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100008D54(uint64_t a1, unint64_t a2)
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

uint64_t sub_100008DAC()
{
  sub_100008DEC(*(void *)(v0 + 16), *(void *)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100008DEC(uint64_t a1, unint64_t a2)
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

void sub_100008E44()
{
  sub_100005F00(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

unint64_t sub_100008E50()
{
  unint64_t result = qword_1000433A0;
  if (!qword_1000433A0)
  {
    sub_100008EAC((uint64_t *)&unk_100043AF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000433A0);
  }
  return result;
}

uint64_t sub_100008EAC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void type metadata accessor for Category(uint64_t a1)
{
}

void sub_100008F1C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100008F64()
{
  return sub_100007C40(&qword_1000433B8, type metadata accessor for URLResourceKey);
}

uint64_t sub_100008FAC()
{
  return sub_100007C40(&qword_1000433C0, type metadata accessor for URLResourceKey);
}

uint64_t sub_100008FF4()
{
  return sub_100007C40(&qword_1000433C8, type metadata accessor for URLResourceKey);
}

id sub_100009148()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v5 = (objc_class *)type metadata accessor for AppDelegate();
  uint64_t v6 = NSStringFromClass(v5);
  UIApplicationMain(argc, (char **)argv, 0, v6);

  return 0;
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

id sub_1000091FC(void *a1)
{
  id v2 = [a1 role];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v8 = [a1 role];
  id v9 = objc_allocWithZone((Class)UISceneConfiguration);
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [v9 initWithName:v10 sessionRole:v8];

  return v11;
}

uint64_t sub_100009378(uint64_t a1)
{
  return sub_100009450(a1, qword_100045D18);
}

uint64_t sub_10000939C(uint64_t a1)
{
  return sub_100009450(a1, qword_100045D30);
}

uint64_t *sub_1000093C4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100009428(uint64_t a1)
{
  return sub_100009450(a1, qword_100045D48);
}

uint64_t sub_100009450(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_1000093C4(v3, a2);
  sub_100007F84(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t ShareTransportEntity.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ShareTransportEntity.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *id v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ShareTransportEntity.id.modify())()
{
  return nullsub_1;
}

uint64_t ShareTransportEntity.displayRepresentation.getter()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();

  return DisplayRepresentation.init(stringLiteral:)(v2, v1);
}

uint64_t sub_1000095A0()
{
  uint64_t v0 = type metadata accessor for TypeDisplayRepresentation();
  sub_1000093C4(v0, static ShareTransportEntity.typeDisplayRepresentation);
  sub_100007F84(v0, (uint64_t)static ShareTransportEntity.typeDisplayRepresentation);
  return TypeDisplayRepresentation.init(stringLiteral:)();
}

uint64_t ShareTransportEntity.typeDisplayRepresentation.unsafeMutableAddressor()
{
  if (qword_100042E48 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for TypeDisplayRepresentation();

  return sub_100007F84(v0, (uint64_t)static ShareTransportEntity.typeDisplayRepresentation);
}

uint64_t static ShareTransportEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100042E48 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for TypeDisplayRepresentation();
  uint64_t v3 = sub_100007F84(v2, (uint64_t)static ShareTransportEntity.typeDisplayRepresentation);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static ShareTransportEntity.typeDisplayRepresentation.setter(uint64_t a1)
{
  if (qword_100042E48 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for TypeDisplayRepresentation();
  uint64_t v3 = sub_100007F84(v2, (uint64_t)static ShareTransportEntity.typeDisplayRepresentation);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static ShareTransportEntity.typeDisplayRepresentation.modify())()
{
  if (qword_100042E48 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for TypeDisplayRepresentation();
  sub_100007F84(v0, (uint64_t)static ShareTransportEntity.typeDisplayRepresentation);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1000098A8()
{
  sub_100006E30(&qword_100042EF0);
  swift_getKeyPath();
  uint64_t result = IntentParameterDependency.__allocating_init<A, B>(_:)();
  static ShareTransportEntity.defaultQuery = result;
  return result;
}

uint64_t *ShareTransportEntity.defaultQuery.unsafeMutableAddressor()
{
  if (qword_100042E50 != -1) {
    swift_once();
  }
  return &static ShareTransportEntity.defaultQuery;
}

uint64_t static ShareTransportEntity.defaultQuery.getter()
{
  if (qword_100042E50 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_retain();
}

uint64_t static ShareTransportEntity.defaultQuery.setter(uint64_t a1)
{
  if (qword_100042E50 != -1) {
    swift_once();
  }
  swift_beginAccess();
  static ShareTransportEntity.defaultQuery = a1;
  return swift_release();
}

uint64_t (*static ShareTransportEntity.defaultQuery.modify())()
{
  if (qword_100042E50 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ShareTransportEntity.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ShareTransportEntity.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ShareTransportEntity.title.modify())()
{
  return nullsub_1;
}

uint64_t ShareTransportEntity.activityType.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ShareTransportEntity.activityType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ShareTransportEntity.activityType.modify())()
{
  return nullsub_1;
}

uint64_t ShareTransportEntity.appBundleID.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ShareTransportEntity.appBundleID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*ShareTransportEntity.appBundleID.modify())()
{
  return nullsub_1;
}

uint64_t ShareTransportEntity.description.getter()
{
  _StringGuts.grow(_:)(77);
  v1._countAndFlagsBits = 0xD00000000000001CLL;
  v1._object = (void *)0x800000010002CDD0;
  String.append(_:)(v1);
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)v0[1];
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x3A656C746974202CLL;
  v5._object = (void *)0xE900000000000020;
  String.append(_:)(v5);
  uint64_t v6 = v0[2];
  id v7 = (void *)v0[3];
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = v6;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._object = (void *)0x800000010002CDF0;
  v9._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v9);
  uint64_t v10 = v0[4];
  id v11 = (void *)v0[5];
  swift_bridgeObjectRetain();
  v12._countAndFlagsBits = v10;
  v12._object = v11;
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 0x6E7542707061202CLL;
  v13._object = (void *)0xEF203A4449656C64;
  String.append(_:)(v13);
  uint64_t v15 = v0[6];
  uint64_t v14 = (void *)v0[7];
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = v15;
  v16._object = v14;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = 62;
  v17._object = (void *)0xE100000000000000;
  String.append(_:)(v17);
  return 0;
}

unint64_t sub_100009DD4()
{
  unint64_t result = qword_100043650;
  if (!qword_100043650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043650);
  }
  return result;
}

unint64_t sub_100009E2C()
{
  unint64_t result = qword_100043658;
  if (!qword_100043658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043658);
  }
  return result;
}

unint64_t sub_100009E84()
{
  unint64_t result = qword_100043660;
  if (!qword_100043660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043660);
  }
  return result;
}

unint64_t sub_100009EDC()
{
  unint64_t result = qword_100043668;
  if (!qword_100043668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043668);
  }
  return result;
}

void *sub_100009F30()
{
  return &protocol witness table for String;
}

uint64_t sub_100009F3C@<X0>(void *a1@<X8>)
{
  if (qword_100042E50 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a1 = static ShareTransportEntity.defaultQuery;
  return swift_retain();
}

void *sub_100009FBC()
{
  return &protocol witness table for String;
}

uint64_t sub_100009FC8@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_100009FDC()
{
  unint64_t result = qword_100043670;
  if (!qword_100043670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043670);
  }
  return result;
}

unint64_t sub_10000A034()
{
  unint64_t result = qword_100043678;
  if (!qword_100043678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043678);
  }
  return result;
}

unint64_t sub_10000A08C()
{
  unint64_t result = qword_100043680;
  if (!qword_100043680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043680);
  }
  return result;
}

unint64_t sub_10000A0E4()
{
  unint64_t result = qword_100043688;
  if (!qword_100043688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043688);
  }
  return result;
}

unint64_t sub_10000A140()
{
  unint64_t result = qword_100043690;
  if (!qword_100043690)
  {
    sub_100008EAC(&qword_100043698);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043690);
  }
  return result;
}

uint64_t sub_10000A19C(uint64_t a1)
{
  unint64_t v2 = sub_100006E74();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000A1EC()
{
  unint64_t result = qword_1000436A0;
  if (!qword_1000436A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000436A0);
  }
  return result;
}

uint64_t sub_10000A240(uint64_t a1)
{
  unint64_t v2 = sub_10000A0E4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for ShareTransportEntity(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ShareTransportEntity()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ShareTransportEntity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ShareTransportEntity(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ShareTransportEntity(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for ShareTransportEntity(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShareTransportEntity(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShareTransportEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShareTransportEntity()
{
  return &type metadata for ShareTransportEntity;
}

uint64_t type metadata accessor for SUISRemoteAlertPresentationManager()
{
  uint64_t result = qword_1000436B8;
  if (!qword_1000436B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000A59C()
{
  return swift_initClassMetadata2();
}

id sub_10000A5DC()
{
  if (qword_100042E58 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)swift_dynamicCastClassUnconditional();

  return v0;
}

void sub_10000A64C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  SFRemoteAlertPresentationManager.remoteAlertHandleDidActivate(_:)();
}

void sub_10000A6B4(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  SFRemoteAlertPresentationManager.remoteAlertHandleDidDeactivate(_:)();
}

void sub_10000A71C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a1;
  id v8 = a4;
  SFRemoteAlertPresentationManager.remoteAlertHandle(_:didInvalidateWithError:)();
}

id sub_10000A790(void *a1)
{
  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for SUISRemoteAlertPresentationManager();
  return [super init];
}

id sub_10000A7D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SUISRemoteAlertPresentationManager();
  return [super dealloc];
}

uint64_t sub_10000A80C()
{
  return type metadata accessor for SUISRemoteAlertPresentationManager();
}

id sub_10000A814()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for SUISRemoteAlertPresentationManager()) init];
  qword_1000436B0 = (uint64_t)result;
  return result;
}

uint64_t sub_10000A848()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000093C4(v0, qword_100043770);
  uint64_t v1 = sub_100007F84(v0, (uint64_t)qword_100043770);
  if (qword_100042E40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100007F84(v0, (uint64_t)qword_100045D48);
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_10000A910()
{
  type metadata accessor for ShareTransportEntitiesProviderActor();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  qword_100045D90 = v0;
  return result;
}

uint64_t sub_10000A94C()
{
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for ShareTransportEntitiesProviderActor()
{
  return self;
}

uint64_t sub_10000A9A0()
{
  return v0;
}

uint64_t sub_10000A9AC()
{
  if (qword_100042E68 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_10000AA08()
{
  return static GlobalActor.sharedUnownedExecutor.getter(v0);
}

uint64_t sub_10000AA10()
{
  *(void *)(v1 + 32) = v0;
  if (qword_100042E68 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100045D90;
  *(void *)(v1 + 40) = qword_100045D90;
  return _swift_task_switch(sub_10000AAAC, v2, 0);
}

uint64_t sub_10000AAAC()
{
  uint64_t v1 = (void *)v0[4];
  if (v1[3])
  {
    id v7 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v2 = swift_bridgeObjectRetain();
    return v7(v2);
  }
  else
  {
    v0[6] = v1[2];
    uint64_t v4 = (void *)v1[4];
    uint64_t v5 = qword_100045D90;
    v0[7] = v4;
    v0[8] = v5;
    id v6 = v4;
    return _swift_task_switch(sub_10000AB84, v5, 0);
  }
}

uint64_t sub_10000AB84()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[4];
  uint64_t v4 = qword_100045D90;
  unint64_t v5 = sub_10000C34C();
  id v6 = (void *)swift_task_alloc();
  v0[9] = v6;
  void v6[2] = v1;
  v6[3] = v2;
  v6[4] = v3;
  id v7 = (void *)swift_task_alloc();
  v0[10] = v7;
  uint64_t v8 = sub_100006E30(&qword_100043948);
  *id v7 = v0;
  v7[1] = sub_10000ACB0;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 2, v4, v5, 0xD00000000000001BLL, 0x800000010002CF10, sub_10000C3A0, v6, v8);
}

uint64_t sub_10000ACB0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 64);
    uint64_t v4 = sub_10000AF04;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 64);
    swift_task_dealloc();
    uint64_t v4 = sub_10000ADD4;
    uint64_t v3 = v5;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_10000ADD4()
{
  uint64_t v1 = *(void *)(v0 + 40);

  *(void *)(v0 + 96) = *(void *)(v0 + 16);
  return _swift_task_switch(sub_10000AE48, v1, 0);
}

uint64_t sub_10000AE48()
{
  unint64_t v1 = v0[12];
  uint64_t v2 = v0[4];
  swift_retain();
  uint64_t v3 = sub_10000CF1C(v1);
  swift_release();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t (*)(void *))v0[1];
  return v4(v3);
}

uint64_t sub_10000AF04()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_task_dealloc();
  return _swift_task_switch(sub_10000AF70, v1, 0);
}

uint64_t sub_10000AF70()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000AFD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  if (qword_100042E68 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_100045D90;
  v4[6] = qword_100045D90;
  return _swift_task_switch(sub_10000B074, v5, 0);
}

uint64_t sub_10000B074()
{
  if (v0[3] == 0xD00000000000002ALL && v0[4] == 0x800000010002CAC0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v1 = v0[2];
    *(void *)uint64_t v1 = 0xD00000000000002ALL;
    *(void *)(v1 + 8) = 0x800000010002CAC0;
    *(_OWORD *)(v1 + 16) = xmmword_10002C100;
    *(void *)(v1 + 32) = 0xD00000000000002ALL;
    *(void *)(v1 + 40) = 0x800000010002CAC0;
    *(void *)(v1 + 48) = 0xD00000000000002ALL;
    *(void *)(v1 + 56) = 0x800000010002CAC0;
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  else
  {
    uint64_t v4 = (void *)swift_task_alloc();
    v0[7] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_10000B1A4;
    return sub_10000AA10();
  }
}

uint64_t sub_10000B1A4(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    uint64_t v7 = *(void *)(v3 + 48);
    return _swift_task_switch(sub_10000B2EC, v7, 0);
  }
}

uint64_t sub_10000B2EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v17 = v0;
    uint64_t v4 = (uint64_t *)(v2 + 48);
    while (1)
    {
      uint64_t v6 = *(v4 - 2);
      uint64_t v5 = *(v4 - 1);
      uint64_t v8 = *v4;
      uint64_t v7 = v4[1];
      uint64_t v9 = v4[2];
      uint64_t v10 = v4[3];
      uint64_t v12 = v4[4];
      uint64_t v11 = v4[5];
      if (v6 == *(void *)(v17 + 24) && v5 == *(void *)(v17 + 32)) {
        break;
      }
      if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
        goto LABEL_12;
      }
      v4 += 8;
      if (!--v3)
      {
        uint64_t v1 = v17;
        goto LABEL_10;
      }
    }
    uint64_t v6 = *(void *)(v17 + 24);
    uint64_t v5 = *(void *)(v17 + 32);
LABEL_12:
    uint64_t v1 = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    uint64_t v11 = 0;
  }
  uint64_t v14 = *(void **)(v1 + 16);
  void *v14 = v6;
  v14[1] = v5;
  void v14[2] = v8;
  v14[3] = v7;
  v14[4] = v9;
  v14[5] = v10;
  v14[6] = v12;
  v14[7] = v11;
  uint64_t v15 = *(uint64_t (**)(void))(v1 + 8);
  return v15();
}

uint64_t sub_10000B444(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v8 = sub_100006E30(&qword_100043950);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006E30(&qword_100043958);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  type metadata accessor for MainActor();
  id v16 = a2;
  id v17 = a3;
  swift_retain();
  uint64_t v18 = static MainActor.shared.getter();
  unint64_t v19 = (*(unsigned __int8 *)(v9 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  id v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = v18;
  *((void *)v20 + 3) = &protocol witness table for MainActor;
  *((void *)v20 + 4) = a2;
  *((void *)v20 + 5) = v17;
  *((void *)v20 + 6) = a4;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v20[v19], v11, v8);
  sub_10000C15C((uint64_t)v14, (uint64_t)&unk_100043968, (uint64_t)v20);
  return swift_release();
}

uint64_t sub_10000B65C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[19] = a6;
  v7[20] = a7;
  v7[17] = a4;
  v7[18] = a5;
  sub_100006E30(&qword_100043958);
  v7[21] = swift_task_alloc();
  type metadata accessor for MainActor();
  v7[22] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  v7[23] = v9;
  v7[24] = v8;
  return _swift_task_switch(sub_10000B728, v9, v8);
}

uint64_t sub_10000B728()
{
  uint64_t v1 = (void *)v0[17];
  if (v1)
  {
    id v2 = (id)v0[17];
  }
  else
  {
    uint64_t v3 = v0[21];
    id v2 = [objc_allocWithZone((Class)UIActivityViewController) initWithActivityItemsConfiguration:v0[18]];
    [v2 setHideSuggestions:1];
    [v2 setExcludedActivityCategories:1];
    uint64_t v4 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
    uint64_t v5 = swift_allocObject();
    swift_weakInit();
    uint64_t v6 = qword_100042E68;
    swift_retain();
    if (v6 != -1) {
      swift_once();
    }
    uint64_t v7 = v0[21];
    uint64_t v1 = (void *)v0[17];
    uint64_t v8 = qword_100045D90;
    unint64_t v9 = sub_10000C34C();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v8;
    v10[3] = v9;
    v10[4] = v5;
    v10[5] = v2;
    swift_retain();
    swift_release();
    sub_10000BD40(v7, (uint64_t)&unk_100043978, (uint64_t)v10);
    swift_release();
  }
  v0[25] = v2;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_10000B9A0;
  uint64_t v11 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10000C090;
  v0[13] = &unk_100039B50;
  v0[14] = v11;
  id v12 = v1;
  [v2 _findSupportedActivitiesWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10000B9A0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 208) = v2;
  uint64_t v3 = *(void *)(v1 + 192);
  uint64_t v4 = *(void *)(v1 + 184);
  if (v2) {
    uint64_t v5 = sub_10000BB74;
  }
  else {
    uint64_t v5 = sub_10000BAD0;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10000BAD0()
{
  uint64_t v1 = (void *)v0[25];
  swift_release();
  v0[16] = v0[15];
  sub_100006E30(&qword_100043950);
  CheckedContinuation.resume(returning:)();

  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_10000BB74()
{
  uint64_t v1 = *(void **)(v0 + 200);
  swift_release();
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000BBF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  if (qword_100042E68 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_100045D90;
  return _swift_task_switch(sub_10000BC90, v6, 0);
}

uint64_t sub_10000BC90()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  uint64_t v2 = Strong;
  if (Strong)
  {
    uint64_t v3 = *(void **)(v0 + 56);
    uint64_t v4 = *(void **)(Strong + 32);
    *(void *)(Strong + 32) = v3;
    id v5 = v3;

    swift_release();
  }
  **(unsigned char **)(v0 + 40) = v2 == 0;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_10000BD40(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000D46C(a1);
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
  sub_100006E30(&qword_1000439A0);
  return swift_task_create();
}

uint64_t sub_10000BEEC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000D46C(a1);
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

uint64_t sub_10000C090(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100006E30(&qword_100043988);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_10000D60C();
    **(void **)(*(void *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10000C15C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000D46C(a1);
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

uint64_t sub_10000C2DC()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ShareTransportEntitiesProvider()
{
  return self;
}

unint64_t sub_10000C34C()
{
  unint64_t result = qword_100043940;
  if (!qword_100043940)
  {
    type metadata accessor for ShareTransportEntitiesProviderActor();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043940);
  }
  return result;
}

uint64_t sub_10000C3A0(uint64_t a1)
{
  return sub_10000B444(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

id sub_10000C3AC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v12 = 0;
  id v8 = [v4 initWithBundleIdentifier:v7 requireValid:a3 & 1 platform:a4 error:&v12];

  if (v8)
  {
    id v9 = v12;
  }
  else
  {
    id v10 = v12;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v8;
}

uint64_t sub_10000C490(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000C56C;
  return v6(a1);
}

uint64_t sub_10000C56C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000C664(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_10000C69C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000C6C4(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_10000C7A4;
  return v5(v2 + 32);
}

uint64_t sub_10000C7A4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_10000C8B8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return String.subscript.getter();
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  unint64_t v6 = String.index(_:offsetBy:limitedBy:)();
  if (v7) {
    unint64_t v6 = v5;
  }
  if (4 * v3 < v6 >> 14) {
    goto LABEL_14;
  }

  return String.subscript.getter();
}

uint64_t sub_10000C968(unint64_t a1, unint64_t a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t v3 = a1;
  BOOL v5 = static String._unconditionallyBridgeFromObjectiveC(_:)() == a1 && v4 == a2;
  if (v5
    || (char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        (v6 & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0xD000000000000013;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v3 && v7 == a2) {
    goto LABEL_16;
  }
  char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v9)
  {
    unint64_t v3 = 0xD000000000000014;
LABEL_17:
    swift_bridgeObjectRelease();
    return v3;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v3 && v11 == a2)
  {
    swift_bridgeObjectRelease();
LABEL_26:
    swift_bridgeObjectRelease();
    return static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v13) {
    goto LABEL_26;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v3 && v14 == a2)
  {
LABEL_16:
    unint64_t v3 = 0xD000000000000014;
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v15)
  {
    unint64_t v3 = 0xD000000000000014;
    goto LABEL_17;
  }
  v16._countAndFlagsBits = 0xD000000000000025;
  v16._object = (void *)0x800000010002CF30;
  if (String.hasPrefix(_:)(v16))
  {
    uint64_t v17 = String.count.getter();
    sub_10000C8B8(v17, v3, a2);
    swift_bridgeObjectRelease();
    unint64_t v3 = static String._fromSubstring(_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t active_platform = dyld_get_active_platform();
    id v19 = objc_allocWithZone((Class)LSApplicationExtensionRecord);
    id v20 = sub_10000C3AC(v3, a2, 0, active_platform);
    id v21 = [v20 containingBundleRecord];
    if (v21
      && (uint64_t v22 = v21,
          id v23 = [v21 bundleIdentifier],
          v22,
          v23))
    {
      unint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      swift_bridgeObjectRelease();
    }
    else
    {
    }
  }
  return v3;
}

void *sub_10000CF1C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  unint64_t result = (void *)sub_100014834(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    unint64_t v29 = v1 & 0xC000000000000001;
    uint64_t v30 = v2;
    unint64_t v31 = v1;
    while (1)
    {
      if (v2 == v4)
      {
        __break(1u);
        goto LABEL_23;
      }
      if (v29) {
        id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v5 = *(id *)(v1 + 8 * v4 + 32);
      }
      id v6 = v5;
      id v7 = [v6 identifier];
      if (v7)
      {
        id v8 = v7;
        unint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v11 = v10;
      }
      else
      {
        unint64_t v9 = 0;
        unint64_t v11 = 0;
      }
      uint64_t v12 = sub_10000C968(v9, v11);
      uint64_t v14 = v13;
      swift_bridgeObjectRelease();
      id v15 = [v6 title];
      uint64_t v32 = v14;
      if (!v15) {
        goto LABEL_17;
      }
      Swift::String v16 = v15;
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v19 = v18;

      id v20 = [v6 identifier];
      if (!v20) {
        break;
      }
      id v21 = v20;
      uint64_t v22 = v12;
      uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v25 = v24;

      swift_bridgeObjectRetain();
LABEL_18:

      unint64_t v27 = _swiftEmptyArrayStorage[2];
      unint64_t v26 = _swiftEmptyArrayStorage[3];
      if (v27 >= v26 >> 1) {
        sub_100014834(v26 > 1, v27 + 1, 1);
      }
      ++v4;
      _swiftEmptyArrayStorage[2] = v27 + 1;
      id v28 = &_swiftEmptyArrayStorage[8 * v27];
      v28[4] = v23;
      v28[5] = v25;
      v28[6] = v17;
      v28[7] = v19;
      v28[8] = v23;
      v28[9] = v25;
      unint64_t v1 = v31;
      v28[10] = v22;
      v28[11] = v32;
      uint64_t v2 = v30;
      if (v30 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    swift_bridgeObjectRelease();
LABEL_17:
    uint64_t v22 = v12;

    uint64_t v23 = 0;
    uint64_t v17 = 0;
    unint64_t v25 = 0xE000000000000000;
    unint64_t v19 = 0xE000000000000000;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000D17C()
{
  uint64_t v1 = sub_100006E30(&qword_100043950);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000D264(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100006E30(&qword_100043950) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v10 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  unint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *unint64_t v11 = v2;
  v11[1] = sub_10000D378;
  return sub_10000B65C(a1, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_10000D378()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000D46C(uint64_t a1)
{
  uint64_t v2 = sub_100006E30(&qword_100043958);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D4CC()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D504()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000D54C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_10000D378;
  return sub_10000BBF4(a1, v4, v5, v7, v6);
}

unint64_t sub_10000D60C()
{
  unint64_t result = qword_100043980;
  if (!qword_100043980)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100043980);
  }
  return result;
}

uint64_t sub_10000D64C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D684(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000D7F4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100043990 + dword_100043990);
  return v6(a1, v4);
}

uint64_t sub_10000D73C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000D7F4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000439A8 + dword_1000439A8);
  return v6(a1, v4);
}

uint64_t sub_10000D7FC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_10000D990()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for ShareSheetSceneActionHandler()
{
  return self;
}

void sub_10000DA00(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_rootViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_contentViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_window] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_router] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_scene] = a1;
  uint64_t v4 = v1;
  id v5 = a1;
  id v6 = [v5 _FBSScene];
  *(void *)&v4[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene] = v6;

  v21.receiver = v4;
  v21.super_class = ObjectType;
  uint64_t v7 = (char *)[super init];
  uint64_t v8 = sub_10000DB98();
  uint64_t v9 = OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession;
  uint64_t v10 = *(void **)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession];
  *(void *)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession] = v8;

  sub_10000DDE4();
  uint64_t v11 = OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_rootViewController;
  uint64_t v12 = *(void **)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_rootViewController];
  *(void *)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_rootViewController] = v13;

  id v14 = sub_10000E21C();
  id v15 = *(void **)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_window];
  *(void *)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_window] = v14;

  uint64_t v16 = *(void *)&v7[v11];
  if (!v16)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (!*(void *)&v7[v9])
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  id v17 = [objc_allocWithZone((Class)SHSheetRouter) initWithRootViewController:v16 supportsModalPresentations:1];
  uint64_t v18 = OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_router;
  unint64_t v19 = *(void **)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_router];
  *(void *)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_router] = v17;

  id v20 = *(void **)&v7[v18];
  if (v20)
  {
    [v20 setMainViewController:*(void *)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_contentViewController]];
    sub_10000E3C4();

    return;
  }
LABEL_7:
  __break(1u);
}

char *sub_10000DB98()
{
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007F84(v1, (uint64_t)qword_100045D30);
  objc_super v2 = v0;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    id v6 = (void *)swift_slowAlloc();
    *(_DWORD *)id v5 = 138412290;
    uint64_t v13 = *(void **)&v2[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_scene];
    id v7 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v6 = v13;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "create new share sheet session for scene:%@", v5, 0xCu);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v8 = [*(id *)&v2[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene] settings];
  self;
  id v9 = [(id)swift_dynamicCastObjCClassUnconditional() sessionContext];

  id v10 = objc_allocWithZone((Class)type metadata accessor for ShareSheetUISession());
  uint64_t v11 = sub_10001B0DC(v9);
  *(void *)&v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate + 8] = &off_100039BB8;
  swift_unknownObjectWeakAssign();
  return v11;
}

void sub_10000DDE4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  id v2 = [v1 settings];
  self;
  id v3 = [(id)swift_dynamicCastObjCClassUnconditional() sessionContext];

  id v4 = [objc_allocWithZone((Class)UIActivityContentContext) init];
  [v4 setIsRemote:1];
  [v4 setCanRenderPeople:1];
  [v4 setConfigureForCloudSharing:[v3 configureForCloudSharing]];
  [v4 setConfigureForPhotosEdit:[v3 configureForPhotosEdit]];
  [v4 setHideHeaderView:[v3 hideHeaderView]];
  [v4 setSharingExpanded:[v3 isSharingExpanded]];
  id v5 = [v3 topContentSectionText];
  [v4 setTopContentSectionText:v5];

  id v6 = [v3 applicationActivityTypes];
  [v4 setApplicationActivityTypes:v6];

  id v7 = [v3 heroActionActivityTypes];
  [v4 setHeroActionActivityTypes:v7];

  [v4 setShowHeroActionsHorizontally:[v3 showHeroActionsHorizontally]];
  id v8 = [v3 tintColor];
  [v4 setTintColor:v8];

  id v9 = [v1 hostAuditToken];
  if (v9)
  {
    id v10 = v9;
    [v4 setHostAuditToken:v9];
    uint64_t v11 = *(void *)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession);
    if (!v11) {
      goto LABEL_7;
    }
    uint64_t v12 = *(void **)(v11 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken);
    *(void *)(v11 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken) = v10;
  }
  id v13 = [objc_allocWithZone((Class)UIActivityContentViewController) initWithContext:v4];
  [v13 setDelegate:v0];
  uint64_t v14 = OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession;
  [v13 setPresenter:*(void *)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession)];
  id v15 = [v1 settings];
  self;
  id v16 = [(id)swift_dynamicCastObjCClassUnconditional() presentationStyle];

  id v17 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v16];
  [v13 setHostPresentationStyle:v17];

  uint64_t v18 = *(void *)(v0 + v14);
  if (v18)
  {
    unint64_t v19 = (void *)(v18 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
    swift_beginAccess();
    *unint64_t v19 = v13;
    id v20 = v13;
    swift_unknownObjectRelease();
    objc_super v21 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_contentViewController);
    *(void *)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_contentViewController) = v13;
    id v22 = v20;

    [objc_allocWithZone((Class)SUISNavigationController) initWithRootViewController:v22 setSheetInteractionDelegate:v0];
    return;
  }
  __break(1u);
LABEL_7:
  __break(1u);
}

id sub_10000E21C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_scene);
  self;
  uint64_t v2 = swift_dynamicCastObjCClassUnconditional();
  id v3 = objc_allocWithZone((Class)UIWindow);
  id v4 = v1;
  id v5 = [v3 initWithWindowScene:v2];
  [v5 setRootViewController:*(void *)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_rootViewController)];
  id v6 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  id v7 = v5;
  id v8 = [v6 settings];
  self;
  id v9 = [(id)swift_dynamicCastObjCClassUnconditional() sessionContext];

  id v10 = [v9 tintColor];
  [v7 setTintColor:v10];

  id result = [v7 _rootSheetPresentationController];
  if (result)
  {
    uint64_t v12 = result;
    [self configureSheetPresentationController:result];

    [v7 makeKeyAndVisible];
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000E3C4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession);
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v3 = (objc_class *)type metadata accessor for ShareSheetSceneActionHandler();
  id v4 = (char *)objc_allocWithZone(v3);
  id v5 = (uint64_t (**)(void *))&v4[OBJC_IVAR____TtC16SharingUIService28ShareSheetSceneActionHandler_handler];
  uint8_t *v5 = sub_10001059C;
  v5[1] = (uint64_t (*)(void *))v2;
  v15.receiver = v4;
  v15.super_class = v3;
  id v6 = v1;
  id v7 = [super init];
  id v8 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_scene);
  sub_100006E30(&qword_100043378);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10002B9F0;
  *(void *)(v9 + 32) = v7;
  specialized Array._endMutation()();
  id v10 = v7;
  sub_100006E30((uint64_t *)&unk_100043AD0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v12 = objc_allocWithZone((Class)NSString);
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = [v12 initWithString:v13];

  [v8 _registerBSActionResponderArray:isa forKey:v14];
}

id sub_10000E55C()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  id result = *(id *)&v0[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_window];
  if (result)
  {
    id result = [result _rootSheetPresentationController];
    if (result)
    {
      id v4 = result;
      [self resetSheetPresentationController:result];

      v9[1] = &_swiftEmptySetSingleton;
      id v5 = [objc_allocWithZone((Class)SHSheetAction) initWithType:8];
      sub_10000F790(v9, v5);

      id v6 = *(void **)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene];
      sub_100008D18(0, &qword_100043AB0);
      sub_10000FA30();
      Class isa = Set._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v6 sendActions:isa];

      v8.receiver = v1;
      v8.super_class = ObjectType;
      return [super dealloc];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E77C(void *a1)
{
  uint64_t v2 = sub_100006E30(&qword_1000432D0);
  __chkstk_darwin(v2 - 8);
  id v4 = &v31[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    id v6 = (void *)v5;
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (!Strong) {
      return 1;
    }
    objc_super v8 = (char *)Strong;
    id v9 = a1;
    id v10 = [v6 event];
    sub_10001A2B8(v10);
LABEL_4:

    return 1;
  }
  self;
  uint64_t v12 = swift_dynamicCastObjCClass();
  if (v12)
  {
    NSString v13 = (void *)v12;
    swift_beginAccess();
    uint64_t v14 = swift_unknownObjectWeakLoadStrong();
    if (!v14) {
      return 1;
    }
    objc_super v8 = (char *)v14;
    id v9 = a1;
    id v10 = [v13 change];
    objc_super v15 = (id *)&v8[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView];
    swift_beginAccess();
    if (*v15) {
      [*v15 didUpdateAirDropTransferWithChange:v10];
    }
    goto LABEL_4;
  }
  self;
  uint64_t v16 = swift_dynamicCastObjCClass();
  if (v16)
  {
    id v17 = (void *)v16;
    swift_beginAccess();
    uint64_t v18 = swift_unknownObjectWeakLoadStrong();
    if (v18)
    {
      unint64_t v19 = (void *)v18;
      id v20 = a1;
      id v21 = [v17 activityUUID];
      if (v21)
      {
        id v22 = v21;
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v23 = type metadata accessor for UUID();
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v4, 0, 1, v23);
      }
      else
      {
        uint64_t v27 = type metadata accessor for UUID();
        (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v4, 1, 1, v27);
      }
      sub_10001A784((uint64_t)v4);

      sub_1000105A4((uint64_t)v4);
    }
    return 1;
  }
  self;
  uint64_t v24 = swift_dynamicCastObjCClass();
  if (v24)
  {
    unint64_t v25 = (void *)v24;
    swift_beginAccess();
    uint64_t v26 = swift_unknownObjectWeakLoadStrong();
    if (!v26) {
      return 1;
    }
    objc_super v8 = (char *)v26;
    id v9 = a1;
    id v10 = [v25 test];
    sub_10001AC84(v10);
    goto LABEL_4;
  }
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    id v28 = (void *)result;
    swift_beginAccess();
    uint64_t v29 = swift_unknownObjectWeakLoadStrong();
    if (!v29) {
      return 1;
    }
    objc_super v8 = (char *)v29;
    id v9 = a1;
    id v10 = [v28 metadata];
    uint64_t v30 = (id *)&v8[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView];
    swift_beginAccess();
    if (*v30) {
      [*v30 reloadMetadata:v10];
    }
    goto LABEL_4;
  }
  return result;
}

void sub_10000EB34()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession);
  if (!v1)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v2 = v0;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  id v4 = v1;
  id v5 = [v3 settings];
  self;
  id v6 = [(id)swift_dynamicCastObjCClassUnconditional() sessionContext];

  sub_10001AE44(v6);
  id v7 = [v3 settings];
  self;
  id v8 = [(id)swift_dynamicCastObjCClassUnconditional() sheetConfiguration];

  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  id v9 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_window);
  if (!v9)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  id v10 = [v9 _rootSheetPresentationController];
  if (!v10)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v11 = v10;
  uint64_t v12 = self;
  sub_10000F6FC(v18, v18[3]);
  [v12 updateSheetPresentationController:v11 withConfiguration:_bridgeAnythingToObjectiveC<A>(_:)()];

  swift_unknownObjectRelease();
  NSString v13 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_contentViewController);
  if (v13)
  {
    id v14 = v13;
    id v15 = [v3 settings];
    self;
    id v16 = [(id)swift_dynamicCastObjCClassUnconditional() presentationStyle];

    id v17 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v16];
    [v14 setHostPresentationStyle:v17];

    sub_10000F740((uint64_t)v18);
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t type metadata accessor for ShareSheetSceneSession()
{
  return self;
}

id sub_10000EDF4()
{
  return *(id *)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_scene);
}

BOOL sub_10000EE04()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene), "settings"));
  self;
  id v2 = [(id)swift_dynamicCastObjCClassUnconditional() applicationState];

  return v2 == (id)2;
}

id sub_10000EE84()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene), "settings"));
  self;
  id v2 = [(id)swift_dynamicCastObjCClassUnconditional() hostProcessType];

  return v2;
}

void sub_10000EF04(uint64_t a1, void *a2)
{
  v5[1] = &_swiftEmptySetSingleton;
  sub_10000F790(v5, a2);

  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  sub_100008D18(0, &qword_100043AB0);
  sub_10000FA30();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v3 sendActions:isa];
}

id sub_10000EFD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000EFE8(a1, a2, a3, a4, (SEL *)&selRef_presentUserDefaultsViewController_);
}

id sub_10000EFDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000EFE8(a1, a2, a3, a4, (SEL *)&selRef_presentAlertController_);
}

id sub_10000EFE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  id result = *(id *)(v5 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_router);
  if (result) {
    return [result *a5:a2];
  }
  __break(1u);
  return result;
}

void sub_10000F068(void *a1)
{
  id v1 = [a1 headerMetadata];
  if (v1)
  {
    uint64_t v2 = v1;
    sub_100006E30(&qword_100043378);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_10002B9F0;
    *(void *)(v3 + 32) = v2;
    specialized Array._endMutation()();
    sub_100008D18(0, (unint64_t *)&unk_100043380);
    id v4 = v2;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v6 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v8[4] = sub_100010AC0;
    v8[5] = v6;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_10000D7FC;
    v8[3] = &unk_100039C80;
    id v7 = _Block_copy(v8);
    swift_release();
    SFUILinkMetadataSerializationForLocalUseOnly();
    _Block_release(v7);
  }
}

void sub_10000F1DC(void *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v11 = Strong;
    if (a1[2])
    {
      uint64_t v19 = v3;
      uint64_t v12 = a1[4];
      unint64_t v13 = a1[5];
      sub_100008D18(0, (unint64_t *)&unk_100043AE0);
      sub_100008D54(v12, v13);
      uint64_t v18 = static OS_dispatch_queue.main.getter();
      id v14 = (void *)swift_allocObject();
      void v14[2] = v12;
      v14[3] = v13;
      v14[4] = v11;
      aBlock[4] = sub_100010B20;
      aBlock[5] = v14;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000056C4;
      aBlock[3] = &unk_100039CD0;
      id v15 = _Block_copy(aBlock);
      sub_100008D54(v12, v13);
      id v17 = v11;
      swift_release();
      static DispatchQoS.unspecified.getter();
      aBlock[0] = &_swiftEmptyArrayStorage;
      sub_100010B2C();
      sub_100006E30((uint64_t *)&unk_100043AF0);
      sub_100008E50();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      id v16 = (void *)v18;
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v15);

      sub_100008DEC(v12, v13);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    else
    {
    }
  }
}

void sub_10000F4E4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id v6 = objc_allocWithZone((Class)SHSheetMetadataUpdateAction);
  sub_100008D54(a1, a2);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v8 = [v6 initWithSerializedMetadata:isa];
  sub_100008DEC(a1, a2);

  v12[1] = &_swiftEmptySetSingleton;
  id v9 = v8;
  sub_10000F790(v12, v9);

  id v10 = *(void **)(a3 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  sub_100008D18(0, &qword_100043AB0);
  sub_10000FA30();
  Class v11 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v10 sendActions:v11];
}

void *sub_10000F6FC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000F740(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000F790(void *a1, void *a2)
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

      sub_100008D18(0, &qword_100043AB0);
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
    Swift::Int v22 = sub_10000FA98(v7, result + 1);
    id v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_10000FC90();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_10000FF30((uint64_t)v8, v23);
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
      sub_100008D18(0, &qword_100043AB0);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = static NSObject.== infix(_:_:)();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        id v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
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
    sub_10000FFB4((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

unint64_t sub_10000FA30()
{
  unint64_t result = qword_100043AB8;
  if (!qword_100043AB8)
  {
    sub_100008D18(255, &qword_100043AB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043AB8);
  }
  return result;
}

Swift::Int sub_10000FA98(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100006E30((uint64_t *)&unk_100043AC0);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      sub_100008D18(0, &qword_100043AB0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_10000FC90();
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

uint64_t sub_10000FC90()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006E30((uint64_t *)&unk_100043AC0);
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
                  void *v6 = -1 << v27;
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
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_10000FF30(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_10000FFB4(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_10000FC90();
  }
  else
  {
    if (v7 > v6)
    {
      sub_10001013C();
      goto LABEL_14;
    }
    sub_1000102E8();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100008D18(0, &qword_100043AB0);
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

id sub_10001013C()
{
  uint64_t v1 = v0;
  sub_100006E30((uint64_t *)&unk_100043AC0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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

uint64_t sub_1000102E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006E30((uint64_t *)&unk_100043AC0);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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

uint64_t sub_100010564()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001059C(void *a1)
{
  return sub_10000E77C(a1);
}

uint64_t sub_1000105A4(uint64_t a1)
{
  uint64_t v2 = sub_100006E30(&qword_1000432D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100010604(unint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = a1;
  v19[1] = (id)a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain_n();
    __CocoaSet.makeIterator()();
    sub_100008D18(0, &qword_100043AB0);
    sub_10000FA30();
    Set.Iterator.init(_cocoa:)();
    unint64_t v3 = (unint64_t)v19[2];
    int64_t v18 = v19[3];
    uint64_t v4 = (uint64_t)v19[4];
    id v5 = v19[5];
    unint64_t v6 = (unint64_t)v19[6];
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    int64_t v18 = (void *)(a1 + 56);
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain_n();
    id v5 = 0;
  }
  int64_t v10 = (unint64_t)(v4 + 64) >> 6;
  while ((v3 & 0x8000000000000000) != 0)
  {
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_33;
    }
    sub_100008D18(0, &qword_100043AB0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v14 = v19[0];
    swift_unknownObjectRelease();
    unint64_t v13 = (char *)v5;
    uint64_t v11 = v6;
    if (!v14) {
      goto LABEL_33;
    }
LABEL_31:
    if ((*(uint64_t (**)(id))(v2 + OBJC_IVAR____TtC16SharingUIService28ShareSheetSceneActionHandler_handler))(v14))
    {
    }
    else
    {
      sub_10000F790(v19, v14);
    }
    id v5 = v13;
    unint64_t v6 = v11;
  }
  if (v6)
  {
    uint64_t v11 = (v6 - 1) & v6;
    unint64_t v12 = __clz(__rbit64(v6)) | ((void)v5 << 6);
    unint64_t v13 = (char *)v5;
LABEL_30:
    id v14 = *(id *)(*(void *)(v3 + 48) + 8 * v12);
    if (!v14) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  uint64_t v15 = (uint64_t)v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = v18[v15];
    unint64_t v13 = (char *)v5 + 1;
    if (!v16)
    {
      unint64_t v13 = (char *)v5 + 2;
      if ((uint64_t)v5 + 2 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = v18[(void)v13];
      if (!v16)
      {
        unint64_t v13 = (char *)v5 + 3;
        if ((uint64_t)v5 + 3 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v18[(void)v13];
        if (!v16)
        {
          unint64_t v13 = (char *)v5 + 4;
          if ((uint64_t)v5 + 4 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v18[(void)v13];
          if (!v16)
          {
            unint64_t v17 = (char *)v5 + 5;
            while ((char *)v10 != v17)
            {
              unint64_t v16 = v18[(void)v17++];
              if (v16)
              {
                unint64_t v13 = v17 - 1;
                goto LABEL_29;
              }
            }
LABEL_33:
            sub_100010B84();
            return;
          }
        }
      }
    }
LABEL_29:
    uint64_t v11 = (v16 - 1) & v16;
    unint64_t v12 = __clz(__rbit64(v16)) + ((void)v13 << 6);
    goto LABEL_30;
  }
  __break(1u);
}

void sub_1000108DC()
{
  v4[1] = &_swiftEmptySetSingleton;
  id v1 = [objc_allocWithZone((Class)SHSheetAction) initWithType:10];
  sub_10000F790(v4, v1);

  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  sub_100008D18(0, &qword_100043AB0);
  sub_10000FA30();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 sendActions:isa];
}

void sub_1000109CC(uint64_t a1)
{
  v5[1] = &_swiftEmptySetSingleton;
  id v2 = [objc_allocWithZone((Class)SHSheetDraggingAction) initWithDraggingEvent:a1];
  sub_10000F790(v5, v2);

  unint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  sub_100008D18(0, &qword_100043AB0);
  sub_10000FA30();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v3 sendActions:isa];
}

void sub_100010AC0(void *a1)
{
}

uint64_t sub_100010AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100010AD8()
{
  return swift_release();
}

uint64_t sub_100010AE0()
{
  sub_100008DEC(*(void *)(v0 + 16), *(void *)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100010B20()
{
  sub_10000F4E4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

unint64_t sub_100010B2C()
{
  unint64_t result = qword_100043390;
  if (!qword_100043390)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043390);
  }
  return result;
}

uint64_t sub_100010B84()
{
  return swift_release();
}

Class sub_100010CD8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4(0);
  swift_bridgeObjectRetain();
  v4.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

uint64_t sub_100010D5C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), void *a5)
{
  a4(0);
  *(void *)(a1 + *a5) = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return swift_bridgeObjectRelease();
}

id sub_100011040(uint64_t a1, uint64_t a2, void *a3)
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

uint64_t sub_1000110B8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
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
  uint64_t v8 = (uint64_t *)(a1 + *a4);
  uint64_t *v8 = v6;
  v8[1] = v7;

  return swift_bridgeObjectRelease();
}

Class sub_1000112DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  swift_bridgeObjectRetain();
  sub_100006E30(a4);
  v5.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

uint64_t sub_100011354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  sub_100006E30(a4);
  *(void *)(a1 + *a5) = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return swift_bridgeObjectRelease();
}

unint64_t sub_100011410(uint64_t a1)
{
  uint64_t v2 = sub_100006E30(&qword_100043CA8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  NSArray v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006E30(&qword_100043CB0);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10001279C(v12, (uint64_t)v5, &qword_100043CA8);
    unint64_t result = sub_10001197C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for UUID();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

uint64_t type metadata accessor for ShareSheetViewModel()
{
  return self;
}

unint64_t sub_10001197C(uint64_t a1)
{
  type metadata accessor for UUID();
  sub_100012590((unint64_t *)&unk_100043C88);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_100011A70(a1, v2);
}

unint64_t sub_100011A00(char a1)
{
  char v2 = a1 & 1;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  Swift::Int v3 = Hasher._finalize()();

  return sub_100011C1C(v2, v3);
}

unint64_t sub_100011A70(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for UUID();
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
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    unint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_100012590(&qword_100043CB8);
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

unint64_t sub_100011C1C(char a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if ((((a1 & 1) == 0) ^ *(unsigned char *)(v7 + result))) {
          break;
        }
      }
    }
  }
  return result;
}

id sub_100011CD8(void *a1, void *a2)
{
  Swift::Int v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v63 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isSharingExpanded;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isSharingExpanded] = 0;
  uint64_t v6 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_metadataValues;
  unint64_t v7 = (unint64_t)&_swiftEmptyArrayStorage;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_metadataValues] = &_swiftEmptyArrayStorage;
  uint64_t v64 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isLoadingMetadata;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isLoadingMetadata] = 0;
  uint64_t v65 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlRequests;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlRequests] = &_swiftEmptyArrayStorage;
  uint64_t v66 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlSandboxExtensions;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlSandboxExtensions] = 0;
  uint64_t v67 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showOptions;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showOptions] = 0;
  uint64_t v8 = (uint64_t *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customOptionsTitle];
  uint64_t *v8 = 0;
  v8[1] = 0;
  uint64_t v68 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showCustomHeaderButton;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showCustomHeaderButton] = 0;
  uint64_t v69 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showHeaderSpecialization;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showHeaderSpecialization] = 0;
  uint64_t v70 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonTitle;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonTitle] = 0;
  uint64_t v71 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonColor;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonColor] = 0;
  uint64_t v72 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isModeSwitchDisabled;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isModeSwitchDisabled] = 0;
  uint64_t v73 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsCollaboration;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsCollaboration] = 0;
  uint64_t v74 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsSendCopy;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsSendCopy] = 0;
  uint64_t v75 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isCollaborative;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isCollaborative] = 0;
  unint64_t v9 = (uint64_t *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationModeTitle];
  uint64_t *v9 = 0;
  v9[1] = 0;
  uint64_t v76 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationFooterViewModel;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationFooterViewModel] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController] = 0;
  uint64_t v60 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerVerticalInsetWrapper;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerVerticalInsetWrapper] = 0;
  uint64_t v61 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerSectionHeightWrapper;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerSectionHeightWrapper] = 0;
  uint64_t v10 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_activitiesByUUID;
  unint64_t v11 = v2;
  *(void *)&v2[v10] = sub_100011410((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v62 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_applicationActivityTypes;
  *(void *)&v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_applicationActivityTypes] = &_swiftEmptyArrayStorage;
  id v12 = [a1 peopleProxies];
  if (v12)
  {
    uint64_t v13 = v12;
    sub_100008D18(0, &qword_100043CA0);
    unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_bridgeObjectRetain();
  if (v7 >> 62)
  {
    sub_100006E30(&qword_100043C68);
    uint64_t v14 = _bridgeCocoaArray<A>(_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
    uint64_t v14 = v7;
  }
  swift_bridgeObjectRelease();
  *(void *)&v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_peopleSuggestionProxies] = v14;
  id v15 = [a1 shareProxies];
  if (v15)
  {
    unint64_t v16 = v15;
    sub_100008D18(0, &qword_100043C98);
    unint64_t v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (!(v17 >> 62))
    {
LABEL_7:
      swift_bridgeObjectRetain();
      dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
      uint64_t v18 = v17;
      goto LABEL_8;
    }
  }
  else
  {
    unint64_t v17 = (unint64_t)&_swiftEmptyArrayStorage;
    if (!((unint64_t)&_swiftEmptyArrayStorage >> 62)) {
      goto LABEL_7;
    }
  }
  swift_bridgeObjectRetain();
  sub_100006E30(&qword_100043C70);
  uint64_t v18 = _bridgeCocoaArray<A>(_:)();
  swift_bridgeObjectRelease();
LABEL_8:
  swift_bridgeObjectRelease();
  *(void *)&v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_shareProxies] = v18;
  id v19 = [a1 actionProxies];
  if (v19)
  {
    uint64_t v20 = v19;
    sub_100008D18(0, &qword_100043C98);
    unint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (!(v21 >> 62))
    {
LABEL_10:
      swift_bridgeObjectRetain();
      dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
      uint64_t v22 = v21;
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v21 = (unint64_t)&_swiftEmptyArrayStorage;
    if (!((unint64_t)&_swiftEmptyArrayStorage >> 62)) {
      goto LABEL_10;
    }
  }
  swift_bridgeObjectRetain();
  sub_100006E30(&qword_100043C70);
  uint64_t v22 = _bridgeCocoaArray<A>(_:)();
  swift_bridgeObjectRelease();
LABEL_11:
  swift_bridgeObjectRelease();
  *(void *)&v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_actionProxies] = v22;
  Class isa = (Class)[a1 nearbyCountSlotID];
  if (!isa)
  {
    sub_100008D18(0, &qword_100043C78);
    Class isa = NSNumber.init(integerLiteral:)(0).super.super.isa;
  }
  *(void *)&v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_nearbyCountSlotID] = isa;
  unsigned __int8 v24 = [a1 reloadData];
  v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_reloadData] = v24;
  unsigned __int8 v25 = [a1 wantsAnimation];
  v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_updateProxiesWithAnimation] = v25;
  if (a2)
  {
    id v26 = a2;
    v3[v63] = [v26 isSharingExpanded];
    id v27 = [v26 activitiesByUUID];
    type metadata accessor for UUID();
    sub_100008D18(0, &qword_100043C80);
    sub_100012590((unint64_t *)&unk_100043C88);
    uint64_t v28 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    *(void *)&v3[v10] = v28;
    swift_bridgeObjectRelease();
    id v29 = [v26 metadataValues];
    sub_100008D18(0, (unint64_t *)&unk_100043380);
    uint64_t v30 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    *(void *)&v3[v6] = v30;
    swift_bridgeObjectRelease();
    v3[v64] = [v26 isLoadingMetadata];
    id v31 = [v26 urlRequests];
    type metadata accessor for URLRequest();
    uint64_t v32 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    *(void *)&v3[v65] = v32;
    swift_bridgeObjectRelease();
    id v33 = [v26 urlSandboxExtensions];
    uint64_t v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    *(void *)&v3[v66] = v34;
    swift_bridgeObjectRelease();
    v3[v67] = [v26 showOptions];
    id v35 = [v26 customOptionsTitle];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v39 = v38;
    }
    else
    {
      uint64_t v37 = 0;
      uint64_t v39 = 0;
    }
    uint64_t *v8 = v37;
    v8[1] = v39;
    swift_bridgeObjectRelease();
    v3[v68] = [v26 showCustomHeaderButton];
    v3[v69] = [v26 showHeaderSpecialization];
    id v41 = [v26 customHeaderButtonTitle];
    v42 = *(void **)&v3[v70];
    *(void *)&v3[v70] = v41;

    id v43 = [v26 customHeaderButtonColor];
    uint64_t v44 = *(void **)&v3[v71];
    *(void *)&v3[v71] = v43;

    v3[v72] = [v26 isModeSwitchDisabled];
    v3[v73] = [v26 supportsCollaboration];
    v3[v74] = [v26 supportsSendCopy];
    v3[v75] = [v26 isCollaborative];
    id v45 = [v26 collaborationModeTitle];
    if (v45)
    {
      v46 = v45;
      uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v49 = v48;
    }
    else
    {
      uint64_t v47 = 0;
      uint64_t v49 = 0;
    }
    v40 = (objc_class *)ObjectType;
    uint64_t *v9 = v47;
    v9[1] = v49;
    swift_bridgeObjectRelease();
    id v50 = [v26 collaborationFooterViewModel];
    v51 = *(void **)&v3[v76];
    *(void *)&v3[v76] = v50;

    id v52 = [v26 customViewControllerVerticalInsetWrapper];
    v53 = *(void **)&v3[v60];
    *(void *)&v3[v60] = v52;

    id v54 = [v26 customViewControllerSectionHeightWrapper];
    v55 = *(void **)&v3[v61];
    *(void *)&v3[v61] = v54;

    id v56 = [v26 applicationActivityTypes];
    if (v56)
    {
      id v57 = v56;
      type metadata accessor for ActivityType(0);
      v58 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

      id v26 = v57;
    }
    else
    {
      v58 = &_swiftEmptyArrayStorage;
    }

    *(void *)&v11[v62] = v58;
    swift_bridgeObjectRelease();
  }
  else
  {

    v40 = (objc_class *)ObjectType;
  }
  v78.receiver = v11;
  v78.super_class = v40;
  return [super init];
}

uint64_t sub_100012590(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for UUID();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000125D4(uint64_t a1)
{
  uint64_t v2 = sub_100006E30(&qword_100043CC0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    sub_100006E30(&qword_100043CC8);
    unint64_t v7 = (void *)static _DictionaryStorage.allocate(capacity:)();
    uint64_t v8 = &v5[*(int *)(v2 + 48)];
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_10001279C(v9, (uint64_t)v5, &qword_100043CC0);
      char v11 = *v5;
      unint64_t result = sub_100011A00(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v7[6] + result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = type metadata accessor for DisplayRepresentation();
      unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v8, v16);
      uint64_t v17 = v7[2];
      BOOL v18 = __OFADD__(v17, 1);
      uint64_t v19 = v17 + 1;
      if (v18) {
        goto LABEL_10;
      }
      v7[2] = v19;
      v9 += v10;
      if (!--v6) {
        return (unint64_t)v7;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

uint64_t sub_10001279C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006E30(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012800()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000093C4(v0, qword_100043CD0);
  uint64_t v1 = sub_100007F84(v0, (uint64_t)qword_100043CD0);
  if (qword_100042E40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100007F84(v0, (uint64_t)qword_100045D48);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_1000128C8()
{
  v1[5] = v0;
  sub_100006E30(&qword_100043CF0);
  v1[6] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for UTType();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  return _swift_task_switch(sub_1000129B8, 0, 0);
}

uint64_t sub_1000129B8()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[6];
  UTType.init(identifier:allowUndeclared:)();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100013050(v0[6]);
LABEL_18:
    swift_task_dealloc();
    swift_task_dealloc();
    id v31 = (uint64_t (*)(void))v0[1];
    return v31(0);
  }
  uint64_t v4 = (void **)(v0 + 5);
  uint64_t v5 = (void *)v0[5];
  (*(void (**)(void, void, void))(v0[8] + 32))(v0[9], v0[6], v0[7]);
  NSString v6 = String._bridgeToObjectiveC()();
  LODWORD(v5) = [v5 hasRepresentationConformingToTypeIdentifier:v6 fileOptions:0];

  if (!v5)
  {
    if (qword_100042E70 != -1) {
      swift_once();
    }
    uint64_t v16 = *v4;
    uint64_t v17 = type metadata accessor for Logger();
    sub_100007F84(v17, (uint64_t)qword_100043CD0);
    id v18 = v16;
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.info.getter();
    BOOL v21 = os_log_type_enabled(v19, v20);
    uint64_t v22 = *v4;
    if (v21)
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      unsigned __int8 v24 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v23 = 138412290;
      v0[2] = v22;
      id v25 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unsigned __int8 v24 = v22;

      _os_log_impl((void *)&_mh_execute_header, v19, v20, "No metadata registered in item provider: %@", v23, 0xCu);
      sub_100006E30(&qword_100043250);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
    goto LABEL_18;
  }
  if (qword_100042E70 != -1) {
    swift_once();
  }
  unint64_t v7 = *v4;
  uint64_t v8 = type metadata accessor for Logger();
  sub_100007F84(v8, (uint64_t)qword_100043CD0);
  id v9 = v7;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  BOOL v12 = os_log_type_enabled(v10, v11);
  char v13 = *v4;
  if (v12)
  {
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    id v33 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v14 = 138412290;
    v0[4] = v13;
    id v15 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v33 = v13;

    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Loading metadata from item provider %@", v14, 0xCu);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v26 = v0[9];
  uint64_t v27 = v0[5];
  uint64_t v28 = swift_task_alloc();
  v0[10] = v28;
  *(void *)(v28 + 16) = v27;
  *(void *)(v28 + 24) = v26;
  id v29 = (void *)swift_task_alloc();
  v0[11] = v29;
  uint64_t v30 = sub_100006E30(&qword_100043CF8);
  void *v29 = v0;
  v29[1] = sub_100012EAC;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 3, 0, 0, 0xD000000000000010, 0x800000010002D860, sub_1000138A8, v28, v30);
}

uint64_t sub_100012EAC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_100012FC4, 0, 0);
}

uint64_t sub_100012FC4()
{
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  uint64_t v1 = v0[3];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_100013050(uint64_t a1)
{
  uint64_t v2 = sub_100006E30(&qword_100043CF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000130B0(uint64_t a1)
{
  uint64_t v2 = sub_100006E30(&qword_100043D00);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  unint64_t v7 = NSItemProvider.loadDataRepresentation(for:completionHandler:)();
  swift_release();
}

uint64_t sub_100013200(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 >> 60 == 15)
  {
    if (qword_100042E70 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100007F84(v4, (uint64_t)qword_100043CD0);
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      unint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v7 = 138412290;
      if (a3)
      {
        swift_errorRetain();
        uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
      }
      else
      {
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v9 = 0;
      }
      void *v8 = v9;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to load metadata: %@", v7, 0xCu);
      sub_100006E30(&qword_100043250);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    sub_100006E30(&qword_100043D00);
    return CheckedContinuation.resume(returning:)();
  }
  else
  {
    sub_100008D18(0, &qword_100043D08);
    sub_100008D18(0, (unint64_t *)&unk_100043380);
    sub_100008D54(a1, a2);
    uint64_t v12 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
    char v13 = (void *)v12;
    if (v12)
    {
      if (qword_100042E70 != -1) {
        swift_once();
      }
      uint64_t v14 = type metadata accessor for Logger();
      sub_100007F84(v14, (uint64_t)qword_100043CD0);
      id v15 = v13;
      uint64_t v16 = Logger.logObject.getter();
      os_log_type_t v17 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v16, v17))
      {
        id v18 = (uint8_t *)swift_slowAlloc();
        id v25 = (void *)swift_slowAlloc();
        *(_DWORD *)id v18 = 138412290;
        id v19 = v15;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *id v25 = v13;

        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Loaded metadata: %@", v18, 0xCu);
        sub_100006E30(&qword_100043250);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
    }
    else
    {
      if (qword_100042E70 != -1) {
        swift_once();
      }
      uint64_t v21 = type metadata accessor for Logger();
      sub_100007F84(v21, (uint64_t)qword_100043CD0);
      uint64_t v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v22, v23))
      {
        unsigned __int8 v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unsigned __int8 v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Failed to unarchive metadata", v24, 2u);
        swift_slowDealloc();
      }
    }
    sub_100006E30(&qword_100043D00);
    CheckedContinuation.resume(returning:)();
    return sub_1000139D0(a1, a2);
  }
}

void sub_1000138A8(uint64_t a1)
{
}

uint64_t sub_1000138B0()
{
  uint64_t v1 = sub_100006E30(&qword_100043D00);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100013944(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_100006E30(&qword_100043D00);

  return sub_100013200(a1, a2, a3);
}

uint64_t sub_1000139D0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100008DEC(a1, a2);
  }
  return a1;
}

void sub_1000139E4(uint64_t *a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    uint64_t v6 = (uint64_t *)&_swiftEmptyArrayStorage;
    do
    {
      long long v33 = *(_OWORD *)(v3 + 16 * v5 + 32);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v8 = *(uint64_t (**)(uint64_t, void))(*((void *)&v33 + 1) + 24);
      swift_unknownObjectRetain();
      if ((v8(ObjectType, *((void *)&v33 + 1)) & 1) != 0
        && (*(uint64_t (**)(uint64_t, void))(*((void *)&v33 + 1) + 32))(ObjectType, *((void *)&v33 + 1)) == 1)
      {
        uint64_t v34 = v6;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100014854(0, v6[2] + 1, 1);
          uint64_t v6 = v34;
        }
        unint64_t v10 = v6[2];
        unint64_t v9 = v6[3];
        if (v10 >= v9 >> 1)
        {
          sub_100014854(v9 > 1, v10 + 1, 1);
          uint64_t v6 = v34;
        }
        void v6[2] = v10 + 1;
        *(_OWORD *)&v6[2 * v10 + 4] = v33;
      }
      else
      {
        swift_unknownObjectRelease();
      }
      ++v5;
    }
    while (v4 != v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = (uint64_t *)&_swiftEmptyArrayStorage;
  }
  os_log_type_t v11 = a1;
  if (qword_100042E30 != -1) {
    goto LABEL_29;
  }
  while (1)
  {
    uint64_t v12 = type metadata accessor for Logger();
    sub_100007F84(v12, (uint64_t)qword_100045D18);
    swift_retain_n();
    char v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v34 = (uint64_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315394;
      swift_retain();
      sub_100006E30(&qword_100043DB8);
      uint64_t v16 = Array.description.getter();
      unint64_t v18 = v17;
      swift_release();
      sub_100028E64(v16, v18, (uint64_t *)&v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2048;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "EvictIfNeeded: background scene sessions = %s backgroundLimit = %ld", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    uint64_t v19 = v6[2];
    if (v19 <= (uint64_t)v11)
    {
LABEL_27:
      swift_release();
      return;
    }
    if (__OFSUB__(v19, v11)) {
      break;
    }
    if (!v19) {
      goto LABEL_27;
    }
    os_log_type_t v20 = (char *)v11 + 1;
    uint64_t v21 = v11 + 0x8000000000000000;
    os_log_type_t v11 = v6 + 5;
    id v31 = v20;
    uint64_t v32 = v6;
    while (1)
    {
      uint64_t v22 = *(v11 - 1);
      uint64_t v23 = *v11;
      swift_unknownObjectRetain();
      unsigned __int8 v24 = Logger.logObject.getter();
      os_log_type_t v25 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = swift_slowAlloc();
        uint64_t v27 = v21;
        uint64_t v28 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 138412290;
        uint64_t v29 = swift_getObjectType();
        uint64_t v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v29, v23);
        *(void *)(v26 + 4) = v30;
        *uint64_t v28 = v30;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "evicting background scene session for scene:%@", (uint8_t *)v26, 0xCu);
        sub_100006E30(&qword_100043250);
        swift_arrayDestroy();
        uint64_t v21 = v27;
        swift_slowDealloc();
        os_log_type_t v20 = v31;
        uint64_t v6 = v32;
        swift_slowDealloc();
      }

      sub_1000142B0(v22, v23);
      swift_unknownObjectRelease();
      if (v21 == (uint64_t *)v19) {
        break;
      }
      if (v20 != (char *)v19)
      {
        v11 += 2;
        if (--v19) {
          continue;
        }
      }
      goto LABEL_27;
    }
    __break(1u);
LABEL_29:
    swift_once();
  }
  __break(1u);
}

void sub_100014048(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_100042E30 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100007F84(v6, (uint64_t)qword_100045D18);
  swift_unknownObjectRetain();
  unint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    unint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v9 = 138412290;
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(ObjectType, a2);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v10 = v18;
    swift_unknownObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "adding scene session for scene:%@", v9, 0xCu);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease();
  }
  uint64_t v12 = (char **)(v2 + 24);
  swift_beginAccess();
  char v13 = *(char **)(v3 + 24);
  swift_unknownObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v3 + 24) = v13;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    char v13 = sub_100028874(0, *((void *)v13 + 2) + 1, 1, v13);
    *uint64_t v12 = v13;
  }
  unint64_t v16 = *((void *)v13 + 2);
  unint64_t v15 = *((void *)v13 + 3);
  if (v16 >= v15 >> 1)
  {
    char v13 = sub_100028874((char *)(v15 > 1), v16 + 1, 1, v13);
    *uint64_t v12 = v13;
  }
  *((void *)v13 + 2) = v16 + 1;
  unint64_t v17 = &v13[16 * v16];
  *((void *)v17 + 4) = a1;
  *((void *)v17 + 5) = a2;
  swift_endAccess();
  sub_1000139E4((uint64_t *)2);
}

void sub_1000142B0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + 24;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v30 = *(void *)(v6 + 16);
  if (v30)
  {
    uint64_t v29 = v5;
    sub_100014B70();
    uint64_t ObjectType = swift_getObjectType();
    id v31 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 8);
    uint64_t v32 = ObjectType;
    swift_bridgeObjectRetain();
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    while (1)
    {
      unint64_t v33 = v9;
      uint64_t v10 = v6;
      uint64_t v11 = a1;
      uint64_t v12 = *(void *)(v6 + v8 + 40);
      uint64_t v13 = swift_getObjectType();
      uint64_t v14 = a2;
      unint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
      swift_unknownObjectRetain();
      uint64_t v16 = v12;
      a1 = v11;
      uint64_t v17 = v15(v13, v16);
      a2 = v14;
      uint64_t v18 = (void *)v17;
      uint64_t v19 = (void *)v31(v32, v14);
      char v20 = static NSObject.== infix(_:_:)();
      swift_unknownObjectRelease();

      if (v20) {
        break;
      }
      unint64_t v9 = v33 + 1;
      v8 += 16;
      uint64_t v6 = v10;
      if (v30 == v33 + 1)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_100042E30 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_100007F84(v21, (uint64_t)qword_100045D18);
    swift_unknownObjectRetain();
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      unsigned __int8 v24 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v25 = (void *)swift_slowAlloc();
      *(_DWORD *)unsigned __int8 v24 = 138412290;
      uint64_t v34 = v31(v32, a2);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *os_log_type_t v25 = v34;
      swift_unknownObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "remove scene session for scene:%@", v24, 0xCu);
      sub_100006E30(&qword_100043250);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_unknownObjectRelease();
    }
    if (v33 >= *(void *)(*(void *)v29 + 16))
    {
      __break(1u);
    }
    else
    {
      uint64_t v26 = *(void *)(*(void *)v29 + v8 + 40);
      uint64_t v27 = swift_getObjectType();
      uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v26 + 56);
      swift_unknownObjectRetain();
      v28(v27, v26);
      swift_beginAccess();
      sub_100014624(v33);
      swift_endAccess();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_100014624(unint64_t a1)
{
  uint64_t v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_100014BB0((uint64_t)v3);
  }
  unint64_t v4 = *((void *)v3 + 2);
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v4 - 1;
    uint64_t v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      unint64_t v7 = &v3[16 * a1];
      uint64_t v8 = *((void *)v7 + 4);
      memmove(v7 + 32, v7 + 48, 16 * v6);
      *((void *)v3 + 2) = v5;
      void *v1 = v3;
      return v8;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100014704()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SceneSessionManager()
{
  return self;
}

uint64_t sub_100014760@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void *sub_100014790(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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

uint64_t sub_100014834(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100014874(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100014854(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000149E0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100014874(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006E30((uint64_t *)&unk_100043DD0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 31;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[64 * v8]) {
      memmove(v13, v14, v8 << 6);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[64 * v8] || v13 >= &v14[64 * v8])
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

uint64_t sub_1000149E0(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006E30(&qword_100043DC0);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    sub_100006E30(&qword_100043DB8);
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

unint64_t sub_100014B70()
{
  unint64_t result = qword_100043DC8;
  if (!qword_100043DC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100043DC8);
  }
  return result;
}

char *sub_100014BB0(uint64_t a1)
{
  return sub_100028874(0, *(void *)(a1 + 16), 0, (char *)a1);
}

id sub_100014D3C(uint64_t a1)
{
  return sub_100015B08(a1, type metadata accessor for SecureWindow);
}

uint64_t type metadata accessor for SecureWindow()
{
  return self;
}

void sub_100014EF0(void *a1, uint64_t a2, void *a3, const char *a4)
{
  uint64_t v6 = qword_100042E30;
  id v12 = a3;
  id v7 = a1;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100007F84(v8, (uint64_t)qword_100045D18);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    int64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, a4, v11, 2u);
    swift_slowDealloc();
  }
}

id sub_1000150A0()
{
  return sub_100015B08(0, type metadata accessor for RemoteAlertSceneDelegate);
}

uint64_t sub_100015108()
{
  return type metadata accessor for RemoteAlertSceneDelegate();
}

uint64_t type metadata accessor for RemoteAlertSceneDelegate()
{
  uint64_t result = qword_100043E98;
  if (!qword_100043E98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001515C()
{
  sub_1000151F8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1000151F8()
{
  if (!qword_100043EA8)
  {
    type metadata accessor for SFRemoteAlertPresentationRequest();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100043EA8);
    }
  }
}

void sub_100015370(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SFRemoteAlertPresentationRequest();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  os_log_type_t v10 = (char *)&v32 - v9;
  id v11 = [v1 view];
  if (!v11)
  {
    __break(1u);
    goto LABEL_20;
  }
  id v12 = v11;
  id v13 = [v11 window];

  if (v13)
  {
    id v14 = [v13 _rootSheetPresentationController];

    if (v14)
    {
      [v14 _setShouldScaleDownBehindDescendantSheets:0];

      goto LABEL_5;
    }
LABEL_20:
    __break(1u);
    return;
  }
LABEL_5:
  if (SFRemoteAlertPresentationRequest.hideViewController.getter())
  {
    if (qword_100042E30 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_100007F84(v15, (uint64_t)qword_100045D18);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      unint64_t v33 = v2;
      uint64_t v35 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      uint64_t v32 = a1;
      uint64_t v20 = SFRemoteAlertPresentationRequest.id.getter();
      uint64_t v34 = sub_100028E64(v20, v21, &v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Adding view controller to view hierarchy in remote alert for request: %s", v18, 0xCu);
      swift_arrayDestroy();
      uint64_t v2 = v33;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }

    uint64_t v29 = (void *)SFRemoteAlertPresentationRequest.viewControllerToPresent.getter();
    [v29 willMoveToParentViewController:v2];

    uint64_t v30 = (void *)SFRemoteAlertPresentationRequest.viewControllerToPresent.getter();
    [v2 addChildViewController:v30];

    id v31 = (void *)SFRemoteAlertPresentationRequest.viewControllerToPresent.getter();
    [v31 didMoveToParentViewController:v2];
  }
  else
  {
    if (qword_100042E30 != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    sub_100007F84(v22, (uint64_t)qword_100045D18);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, a1, v4);
    os_log_type_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v24))
    {
      os_log_type_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      unint64_t v33 = v2;
      uint64_t v35 = v26;
      uint64_t v32 = a1;
      *(_DWORD *)os_log_type_t v25 = 136315138;
      uint64_t v27 = SFRemoteAlertPresentationRequest.id.getter();
      uint64_t v34 = sub_100028E64(v27, v28, &v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Presenting view controller in remote alert for request: %s", v25, 0xCu);
      swift_arrayDestroy();
      uint64_t v2 = v33;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }

    id v31 = (void *)SFRemoteAlertPresentationRequest.viewControllerToPresent.getter();
    [v2 presentViewController:v31 animated:SFRemoteAlertPresentationRequest.animated.getter() & 1 completion:0];
  }
}

void sub_1000158A4(void (*a1)(void), int a2, id a3)
{
  if (a1) {
    a1();
  }
  id v4 = [a3 presentedViewController];

  if (!v4)
  {
    id Strong = (id)swift_unknownObjectWeakLoadStrong();
    [Strong invalidate];
  }
}

id sub_100015AEC()
{
  return sub_100015B08(0, type metadata accessor for RemoteAlertRootViewController);
}

id sub_100015B08(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  [super dealloc];
}

uint64_t type metadata accessor for RemoteAlertRootViewController()
{
  return self;
}

uint64_t sub_100015B74()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100015BBC()
{
  sub_1000158A4(*(void (**)(void))(v0 + 16), *(void *)(v0 + 24), *(id *)(v0 + 32));
}

uint64_t sub_100015BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100015BD8()
{
  return swift_release();
}

uint64_t sub_100015BE0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100015BF0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100015C00()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100015C38()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

unint64_t sub_100015C48()
{
  unint64_t result = qword_100043F40;
  if (!qword_100043F40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100043F40);
  }
  return result;
}

unint64_t sub_100015C88()
{
  unint64_t result = qword_100043F48;
  if (!qword_100043F48)
  {
    sub_100015C48();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043F48);
  }
  return result;
}

void sub_100015CE0(void *a1)
{
  uint64_t v3 = type metadata accessor for SFRemoteAlertPresentationRequest.PresentationType();
  v91 = *(void **)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  v90 = (char *)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v89 = (char *)&v77 - v6;
  uint64_t v7 = sub_100006E30(&qword_100043F58);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  os_log_type_t v10 = (char *)&v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  id v12 = (char *)&v77 - v11;
  uint64_t v13 = type metadata accessor for SFRemoteAlertPresentationRequest();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  os_log_type_t v17 = (char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v77 - v18;
  self;
  uint64_t v20 = swift_dynamicCastObjCClass();
  if (v20)
  {
    unint64_t v21 = (void *)v20;
    uint64_t v88 = v3;
    id v22 = a1;
    id v23 = [v21 configurationIdentifier];
    if (v23)
    {
      os_log_type_t v24 = v23;
      uint64_t v86 = v1;
      id v87 = v22;
      v85 = v10;
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v27 = v26;

      type metadata accessor for SUISRemoteAlertPresentationManager();
      id v28 = sub_10000A5DC();
      dispatch thunk of SFRemoteAlertPresentationManager.presentationRequest(for:)();

      uint64_t v29 = v14;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
      {
        sub_1000173C0((uint64_t)v12);
        if (qword_100042E30 != -1) {
          swift_once();
        }
        uint64_t v30 = type metadata accessor for Logger();
        sub_100007F84(v30, (uint64_t)qword_100045D18);
        swift_bridgeObjectRetain();
        id v31 = Logger.logObject.getter();
        os_log_type_t v32 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v31, v32))
        {
          unint64_t v33 = (uint8_t *)swift_slowAlloc();
          v92[0] = swift_slowAlloc();
          *(_DWORD *)unint64_t v33 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v94 = sub_100028E64(v25, v27, v92);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v31, v32, "Could not find a remote alert presentation request for ID: %s", v33, 0xCu);
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
        (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
        if (qword_100042E30 != -1) {
          swift_once();
        }
        uint64_t v46 = type metadata accessor for Logger();
        uint64_t v47 = sub_100007F84(v46, (uint64_t)qword_100045D18);
        v83 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
        uint64_t v84 = v14 + 16;
        v83(v17, v19, v13);
        id v48 = v87;
        uint64_t v49 = Logger.logObject.getter();
        os_log_type_t v50 = static os_log_type_t.default.getter();
        int v51 = v50;
        BOOL v52 = os_log_type_enabled(v49, v50);
        id v87 = v48;
        if (v52)
        {
          uint64_t v53 = swift_slowAlloc();
          uint64_t v81 = v47;
          uint64_t v54 = v53;
          v77 = (void *)swift_slowAlloc();
          uint64_t v80 = swift_slowAlloc();
          v92[0] = v80;
          *(_DWORD *)uint64_t v54 = 138412546;
          os_log_t v78 = v49;
          int v79 = v51;
          uint64_t v94 = (uint64_t)v21;
          id v55 = v48;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          void *v77 = v21;

          *(_WORD *)(v54 + 12) = 2080;
          uint64_t v56 = SFRemoteAlertPresentationRequest.id.getter();
          uint64_t v94 = sub_100028E64(v56, v57, v92);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          v82 = *(void (**)(char *, uint64_t))(v29 + 8);
          v82(v17, v13);
          uint64_t v49 = v78;
          _os_log_impl((void *)&_mh_execute_header, v78, (os_log_type_t)v79, "Configuring remote alert scene: %@ for request with ID: %s", (uint8_t *)v54, 0x16u);
          sub_100006E30(&qword_100043250);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          v82 = *(void (**)(char *, uint64_t))(v29 + 8);
          v82(v17, v13);
        }

        if (SFRemoteAlertPresentationRequest.contentOverlaysStatusBar.getter())
        {
          if ([v21 respondsToSelector:"setContentOverlaysStatusBar:animationSettings:"])
          {
            [v21 setContentOverlaysStatusBar:1 animationSettings:0];
          }
          else
          {
            v59 = Logger.logObject.getter();
            os_log_type_t v60 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v59, v60))
            {
              uint64_t v61 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v61 = 0;
              _os_log_impl((void *)&_mh_execute_header, v59, v60, "Wanted to set contentOverlaysStatusBar to true, but this version of SpringBoard does not support it.", v61, 2u);
              swift_slowDealloc();
            }
          }
        }
        [v21 setAllowsAlertStacking:1];
        [v21 setOrientationChangedEventsDisabled:1];
        uint64_t v62 = v89;
        SFRemoteAlertPresentationRequest.presentationType.getter();
        uint64_t v64 = v90;
        uint64_t v63 = v91;
        uint64_t v65 = v88;
        ((void (*)(char *, void, uint64_t))v91[13])(v90, enum case for SFRemoteAlertPresentationRequest.PresentationType.sharesheet(_:), v88);
        char v66 = static SFRemoteAlertPresentationRequest.PresentationType.== infix(_:_:)();
        uint64_t v67 = (void (*)(char *, uint64_t))v63[1];
        v67(v64, v65);
        v67(v62, v65);
        if (v66)
        {
          [v21 setDelegate:v86];
          [v21 setAllowsMenuButtonDismissal:1];
          [v21 setDesiredHardwareButtonEvents:16];
        }
        id v68 = [objc_allocWithZone((Class)type metadata accessor for SecureWindow()) initWithWindowScene:v21];
        uint64_t v69 = (objc_class *)type metadata accessor for RemoteAlertRootViewController();
        id v70 = objc_allocWithZone(v69);
        swift_unknownObjectWeakInit();
        swift_unknownObjectWeakAssign();
        v93.receiver = v70;
        v93.super_class = v69;
        id v71 = [super initWithNibName:0 bundle:0];
        [v68 setRootViewController:v71];
        [v68 makeKeyAndVisible];
        uint64_t v72 = v86;
        uint64_t v73 = *(void **)(v86 + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window);
        *(void *)(v86 + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window) = v68;
        id v74 = v68;

        uint64_t v75 = (uint64_t)v85;
        v83(v85, v19, v13);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v29 + 56))(v75, 0, 1, v13);
        uint64_t v76 = v72 + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_presentationRequest;
        swift_beginAccess();
        sub_100017420(v75, v76);
        swift_endAccess();

        v82(v19, v13);
      }
      return;
    }
    if (qword_100042E30 != -1) {
      swift_once();
    }
    uint64_t v40 = type metadata accessor for Logger();
    sub_100007F84(v40, (uint64_t)qword_100045D18);
    v91 = v22;
    id v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      id v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = (void *)swift_slowAlloc();
      *(_DWORD *)id v43 = 138412290;
      v92[0] = (uint64_t)v21;
      id v45 = v91;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v44 = v21;

      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Could not find configuration identifier on remote alert scene: %@", v43, 0xCu);
      sub_100006E30(&qword_100043250);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
  else
  {
    if (qword_100042E30 != -1) {
      swift_once();
    }
    uint64_t v34 = type metadata accessor for Logger();
    sub_100007F84(v34, (uint64_t)qword_100045D18);
    v91 = a1;
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      v92[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136315138;
      swift_getObjectType();
      uint64_t v38 = _typeName(_:qualified:)();
      uint64_t v94 = sub_100028E64(v38, v39, v92);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Cannot configure scene, expected a remote alert scene but got a scene of type: %s", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
  id v58 = v91;
}

void sub_100016970()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100006E30(&qword_100043F58);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SFRemoteAlertPresentationRequest();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100042E30 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100007F84(v9, (uint64_t)qword_100045D18);
  os_log_type_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "RemoteAlertSceneDelegate: sceneDidBecomeActive", v12, 2u);
    swift_slowDealloc();
  }

  uint64_t v13 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window);
  if (v13)
  {
    id v14 = [v13 rootViewController];
    if (v14)
    {
      id v19 = v14;
      type metadata accessor for RemoteAlertRootViewController();
      uint64_t v15 = (void *)swift_dynamicCastClass();
      if (v15
        && (id v16 = [v15 presentedViewController],
            v16,
            !v16))
      {
        uint64_t v18 = v1 + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_presentationRequest;
        swift_beginAccess();
        sub_100017358(v18, (uint64_t)v4);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
        {

          sub_1000173C0((uint64_t)v4);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
          sub_100015370((uint64_t)v8);

          (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        }
      }
      else
      {
        id v17 = v19;
      }
    }
  }
}

void sub_100016C6C(void *a1, uint64_t a2)
{
  if (qword_100042E30 != -1) {
LABEL_48:
  }
    swift_once();
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007F84(v4, (uint64_t)qword_100045D18);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    v41[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    sub_100015C48();
    sub_100015C88();
    swift_bridgeObjectRetain();
    uint64_t v8 = Set.description.getter();
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    uint64_t v40 = sub_100028E64(v8, v10, v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "RemoteAlertSceneDelegate: handle buttonActions: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v11 = [a1 configurationIdentifier];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v15 = v14;

    type metadata accessor for SUISRemoteAlertPresentationManager();
    id v16 = sub_10000A5DC();
    a1 = (void *)dispatch thunk of SFRemoteAlertPresentationManager.presentationHandle(for:)();

    if (a1)
    {
      swift_bridgeObjectRelease();
      if ((a2 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        __CocoaSet.makeIterator()();
        sub_100015C48();
        sub_100015C88();
        Set.Iterator.init(_cocoa:)();
        a2 = v41[0];
        uint64_t v39 = v41[1];
        uint64_t v17 = v41[2];
        uint64_t v18 = v41[3];
        unint64_t v19 = v41[4];
      }
      else
      {
        uint64_t v28 = -1 << *(unsigned char *)(a2 + 32);
        uint64_t v39 = a2 + 56;
        uint64_t v17 = ~v28;
        uint64_t v29 = -v28;
        if (v29 < 64) {
          uint64_t v30 = ~(-1 << v29);
        }
        else {
          uint64_t v30 = -1;
        }
        unint64_t v19 = v30 & *(void *)(a2 + 56);
        swift_bridgeObjectRetain();
        uint64_t v18 = 0;
      }
      int64_t v31 = (unint64_t)(v17 + 64) >> 6;
      while (1)
      {
        if (a2 < 0)
        {
          if (!__CocoaSet.Iterator.next()()) {
            goto LABEL_46;
          }
          sub_100015C48();
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v35 = (id)v40;
          swift_unknownObjectRelease();
          uint64_t v34 = v18;
          uint64_t v32 = v19;
          if (!v40) {
            goto LABEL_46;
          }
        }
        else
        {
          if (v19)
          {
            uint64_t v32 = (v19 - 1) & v19;
            unint64_t v33 = __clz(__rbit64(v19)) | (v18 << 6);
            uint64_t v34 = v18;
          }
          else
          {
            int64_t v36 = v18 + 1;
            if (__OFADD__(v18, 1))
            {
              __break(1u);
              goto LABEL_48;
            }
            if (v36 >= v31) {
              goto LABEL_46;
            }
            unint64_t v37 = *(void *)(v39 + 8 * v36);
            uint64_t v34 = v18 + 1;
            if (!v37)
            {
              uint64_t v34 = v18 + 2;
              if (v18 + 2 >= v31) {
                goto LABEL_46;
              }
              unint64_t v37 = *(void *)(v39 + 8 * v34);
              if (!v37)
              {
                uint64_t v34 = v18 + 3;
                if (v18 + 3 >= v31) {
                  goto LABEL_46;
                }
                unint64_t v37 = *(void *)(v39 + 8 * v34);
                if (!v37)
                {
                  uint64_t v34 = v18 + 4;
                  if (v18 + 4 >= v31) {
                    goto LABEL_46;
                  }
                  unint64_t v37 = *(void *)(v39 + 8 * v34);
                  if (!v37)
                  {
                    uint64_t v38 = v18 + 5;
                    while (v31 != v38)
                    {
                      unint64_t v37 = *(void *)(v39 + 8 * v38++);
                      if (v37)
                      {
                        uint64_t v34 = v38 - 1;
                        goto LABEL_41;
                      }
                    }
LABEL_46:
                    sub_100010B84();
                    swift_release();
                    return;
                  }
                }
              }
            }
LABEL_41:
            uint64_t v32 = (v37 - 1) & v37;
            unint64_t v33 = __clz(__rbit64(v37)) + (v34 << 6);
          }
          id v35 = *(id *)(*(void *)(a2 + 48) + 8 * v33);
          if (!v35) {
            goto LABEL_46;
          }
        }
        if ([v35 events] == (id)16) {
          dispatch thunk of SFRemoteAlertPresentationHandle.dismiss(animated:completion:)();
        }
        else {
          [v35 sendResponseWithUnHandledEvents:[v35 events]];
        }

        uint64_t v18 = v34;
        unint64_t v19 = v32;
      }
    }
    swift_bridgeObjectRetain();
    unint64_t v21 = Logger.logObject.getter();
    uint64_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, (os_log_type_t)v26))
    {
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      v41[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v27 = 136315138;
      swift_bridgeObjectRetain();
      sub_100028E64(v13, v15, v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v21, (os_log_type_t)v26, "Could not find a remote alert presentation request for ID: %s", v27, 0xCu);
      swift_arrayDestroy();
      goto LABEL_13;
    }

    swift_bridgeObjectRelease_n();
  }
  else
  {
    id v20 = a1;
    unint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v24 = (void *)swift_slowAlloc();
      *(_DWORD *)id v23 = 138412290;
      v41[0] = (uint64_t)v20;
      id v25 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *os_log_type_t v24 = v20;

      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Could not find configuration identifier on remote alert scene: %@", v23, 0xCu);
      sub_100006E30(&qword_100043250);
      swift_arrayDestroy();
LABEL_13:
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
}

uint64_t sub_100017358(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006E30(&qword_100043F58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000173C0(uint64_t a1)
{
  uint64_t v2 = sub_100006E30(&qword_100043F58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100017420(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006E30(&qword_100043F58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_100017488()
{
  type metadata accessor for SceneSessionManager();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 2;
  *(void *)(v0 + 24) = &_swiftEmptyArrayStorage;
  id v1 = [self defaultCenter];
  [v1 addObserver:v0 selector:"didReceiveMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];

  qword_100045DA0 = v0;
}

uint64_t sub_10001760C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100042E30 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007F84(v4, (uint64_t)qword_100045D18);
  id v5 = a1;
  os_log_type_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    unint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "disconnect scene:%@", v8, 0xCu);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  [v5 _unregisterSceneComponentForKey:*(void *)(v2 + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneComponentKey)];
  uint64_t v11 = v2 + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneSession;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v13 = result;
    uint64_t v14 = *(void *)(v11 + 8);
    if (qword_100042E78 != -1) {
      swift_once();
    }
    sub_1000142B0(v13, v14);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_1000178B0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v1 + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneSession;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v5 = *(void *)(v4 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v5 + 48))(ObjectType, v5);
    char v7 = *(unsigned char *)(v2 + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_isModernScene);
    id v8 = [a1 _FBSScene];
    id v18 = [v8 settings];

    if (v7)
    {
      unsigned int v9 = [v18 isForeground];

      if (v9) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
    self;
    id v16 = (void *)swift_dynamicCastObjCClass();
    if (v16)
    {
      id v17 = [v16 applicationState];

      if (v17 != (id)2)
      {
LABEL_14:
        swift_unknownObjectRelease();
        return;
      }
LABEL_11:
      if (qword_100042E78 != -1) {
        swift_once();
      }
      sub_1000139E4((uint64_t *)2);
      goto LABEL_14;
    }
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_100042E30 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_100007F84(v10, (uint64_t)qword_100045D18);
    id v18 = a1;
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 138412290;
      id v15 = v18;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v14 = v18;

      _os_log_impl((void *)&_mh_execute_header, v11, v12, "no scene session for scene settings update:%@", v13, 0xCu);
      sub_100006E30(&qword_100043250);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
}

id sub_100017C94()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

unint64_t sub_100017D48()
{
  unint64_t result = qword_100044070;
  if (!qword_100044070)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100044070);
  }
  return result;
}

void sub_100017D88(void *a1)
{
  objc_super v2 = v1;
  uint64_t v4 = sub_100006E30((uint64_t *)&unk_100043230);
  __chkstk_darwin(v4 - 8);
  os_log_type_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100042E30 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100007F84(v7, (uint64_t)qword_100045D18);
  id v8 = a1;
  unsigned int v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v12 = (void *)swift_slowAlloc();
    uint64_t v49 = v2;
    os_log_type_t v50 = v6;
    *(_DWORD *)uint64_t v11 = 138412290;
    id v51 = v8;
    id v13 = v8;
    objc_super v2 = v49;
    os_log_type_t v6 = v50;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *os_log_type_t v12 = v8;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "connect scene:%@", v11, 0xCu);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v14 = [v8 session];
  id v15 = [v14 configuration];

  id v16 = [v15 role];
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  if (v17 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v19 == v20)
  {

    swift_bridgeObjectRelease_n();
LABEL_10:
    os_log_type_t v22 = (objc_class *)type metadata accessor for SceneWindowObserver();
    id v23 = (char *)objc_allocWithZone(v22);
    *(void *)&v23[OBJC_IVAR____TtC16SharingUIService19SceneWindowObserver__scene] = v8;
    v52.receiver = v23;
    v52.super_class = v22;
    id v24 = v8;
    [super init];

    [v24 _registerSceneComponent:v25 forKey:*(void *)&v2[OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneComponentKey]];
    UIScene.hostStorage.getter();
    uint64_t v26 = sub_100006E30((uint64_t *)&unk_100044080);
    LODWORD(v22) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 48))(v6, 1, v26);
    sub_100018378((uint64_t)v6);
    uint64_t v27 = OBJC_IVAR____TtC16SharingUIService13SceneDelegate_isModernScene;
    v2[OBJC_IVAR____TtC16SharingUIService13SceneDelegate_isModernScene] = v22 != 1;
    if (v22 == 1)
    {
      id v40 = objc_allocWithZone((Class)type metadata accessor for ShareSheetSceneSession());
      sub_10000DA00(v24);
      id v35 = v41;
      uint64_t v39 = &off_100039BF0;
    }
    else
    {
      id v28 = objc_allocWithZone((Class)type metadata accessor for ShareSheetRemoteSceneSession());
      id v29 = v24;
      sub_100007FBC(v29);
      int64_t v31 = v30;

      uint64_t v32 = *(void **)&v31[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_window];
      uint64_t v33 = OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window;
      uint64_t v34 = *(void **)&v2[OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window];
      *(void *)&v2[OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window] = v32;
      id v35 = v31;
      id v36 = v32;

      unint64_t v37 = *(void **)&v2[v33];
      if (v37)
      {
        id v38 = v37;
        [v38 makeKeyAndVisible];
      }
      uint64_t v39 = &off_100039798;
    }
    *(void *)&v2[OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneSession + 8] = v39;
    swift_unknownObjectWeakAssign();
    if (qword_100042E78 != -1) {
      swift_once();
    }
    sub_100014048((uint64_t)v35, (uint64_t)v39);
    os_log_type_t v42 = v2;
    id v43 = Logger.logObject.getter();
    os_log_type_t v44 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v43, v44))
    {
      id v45 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v45 = 67109120;
      LODWORD(v51) = v2[v27];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v43, v44, "setup share sheet scene isModernScene: %{BOOL}d", v45, 8u);
      swift_slowDealloc();
      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
      id v43 = v25;
    }
    goto LABEL_22;
  }
  char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21) {
    goto LABEL_10;
  }
  id v43 = Logger.logObject.getter();
  os_log_type_t v46 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v43, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v47 = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, v46, "scene session role is not supported.", v47, 2u);
    swift_slowDealloc();
  }
LABEL_22:
}

uint64_t sub_100018378(uint64_t a1)
{
  uint64_t v2 = sub_100006E30((uint64_t *)&unk_100043230);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000183D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100018400()
{
  uint64_t v0 = type metadata accessor for TypeDisplayRepresentation();
  sub_1000093C4(v0, static ShareIntentMode.typeDisplayRepresentation);
  sub_100007F84(v0, (uint64_t)static ShareIntentMode.typeDisplayRepresentation);
  return TypeDisplayRepresentation.init(stringLiteral:)();
}

uint64_t ShareIntentMode.typeDisplayRepresentation.unsafeMutableAddressor()
{
  if (qword_100042E80 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for TypeDisplayRepresentation();

  return sub_100007F84(v0, (uint64_t)static ShareIntentMode.typeDisplayRepresentation);
}

uint64_t static ShareIntentMode.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100042E80 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for TypeDisplayRepresentation();
  uint64_t v3 = sub_100007F84(v2, (uint64_t)static ShareIntentMode.typeDisplayRepresentation);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static ShareIntentMode.typeDisplayRepresentation.setter(uint64_t a1)
{
  if (qword_100042E80 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for TypeDisplayRepresentation();
  uint64_t v3 = sub_100007F84(v2, (uint64_t)static ShareIntentMode.typeDisplayRepresentation);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static ShareIntentMode.typeDisplayRepresentation.modify())()
{
  if (qword_100042E80 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for TypeDisplayRepresentation();
  sub_100007F84(v0, (uint64_t)static ShareIntentMode.typeDisplayRepresentation);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_100018708()
{
  uint64_t v0 = sub_100006E30(&qword_1000440F8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006E30(&qword_100042EB0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LocalizedStringResource();
  uint64_t v20 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_100006E30((uint64_t *)&unk_100044100);
  uint64_t v8 = sub_100006E30(&qword_100043CC0);
  uint64_t v9 = *(void *)(*(void *)(v8 - 8) + 72);
  unint64_t v10 = (*(unsigned __int8 *)(*(void *)(v8 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10002C400;
  os_log_type_t v12 = (unsigned char *)(v11 + v10);
  uint64_t v13 = *(int *)(v8 + 48);
  uint64_t v22 = v8;
  v19[1] = &v12[v13];
  *os_log_type_t v12 = 0;
  LocalizedStringResource.init(stringLiteral:)();
  id v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v19[2] = v7 + 56;
  char v21 = v14;
  v14(v5, 1, 1, v6);
  uint64_t v15 = type metadata accessor for DisplayRepresentation.Image();
  id v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v2, 1, 1, v15);
  DisplayRepresentation.init(title:subtitle:image:)();
  v12[v9] = 1;
  LocalizedStringResource.init(stringLiteral:)();
  v21(v5, 1, 1, v20);
  v16(v2, 1, 1, v15);
  DisplayRepresentation.init(title:subtitle:image:)();
  unint64_t v17 = sub_1000125D4(v11);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t result = swift_deallocClassInstance();
  static ShareIntentMode.caseDisplayRepresentations = v17;
  return result;
}

uint64_t *ShareIntentMode.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_100042E88 != -1) {
    swift_once();
  }
  return &static ShareIntentMode.caseDisplayRepresentations;
}

uint64_t static ShareIntentMode.caseDisplayRepresentations.getter()
{
  if (qword_100042E88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static ShareIntentMode.caseDisplayRepresentations.setter(uint64_t a1)
{
  if (qword_100042E88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  static ShareIntentMode.caseDisplayRepresentations = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static ShareIntentMode.caseDisplayRepresentations.modify())()
{
  if (qword_100042E88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ShareIntentMode.description.getter(char a1)
{
  if (a1) {
    return 0x6F62616C6C6F632ELL;
  }
  else {
    return 0x706F43646E65732ELL;
  }
}

SharingUIService::ShareIntentMode_optional __swiftcall ShareIntentMode.init(rawValue:)(Swift::UInt rawValue)
{
  if (rawValue == 1) {
    v1.value = SharingUIService_ShareIntentMode_collaborate;
  }
  else {
    v1.value = SharingUIService_ShareIntentMode_unknownDefault;
  }
  if (rawValue) {
    return v1;
  }
  else {
    return 0;
  }
}

_UNKNOWN **static ShareIntentMode.allCases.getter()
{
  return &off_100039578;
}

uint64_t ShareIntentMode.rawValue.getter(char a1)
{
  return a1 & 1;
}

BOOL sub_100018CA0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_100018CBC()
{
  unint64_t result = qword_100044090;
  if (!qword_100044090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044090);
  }
  return result;
}

Swift::Int sub_100018D10()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100018D58()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100018D84()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void *sub_100018DC8@<X0>(void *result@<X0>, char *a2@<X8>)
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

void sub_100018DE8(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_100018DF8()
{
  unint64_t result = qword_100044098;
  if (!qword_100044098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044098);
  }
  return result;
}

unint64_t sub_100018E50()
{
  unint64_t result = qword_1000440A0;
  if (!qword_1000440A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000440A0);
  }
  return result;
}

unint64_t sub_100018EA8()
{
  unint64_t result = qword_1000440A8;
  if (!qword_1000440A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000440A8);
  }
  return result;
}

void *sub_100018EFC()
{
  return &protocol witness table for UInt;
}

uint64_t sub_100018F08()
{
  if (*v0) {
    return 0x6F62616C6C6F632ELL;
  }
  else {
    return 0x706F43646E65732ELL;
  }
}

unint64_t sub_100018F54()
{
  unint64_t result = qword_1000440B0;
  if (!qword_1000440B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000440B0);
  }
  return result;
}

unint64_t sub_100018FAC()
{
  unint64_t result = qword_1000440B8;
  if (!qword_1000440B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000440B8);
  }
  return result;
}

unint64_t sub_100019004()
{
  unint64_t result = qword_1000440C0;
  if (!qword_1000440C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000440C0);
  }
  return result;
}

unint64_t sub_10001905C()
{
  unint64_t result = qword_1000440C8;
  if (!qword_1000440C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000440C8);
  }
  return result;
}

uint64_t sub_1000190B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100019100(uint64_t a1)
{
  unint64_t v2 = sub_1000074DC();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100019150()
{
  unint64_t result = qword_1000440D0;
  if (!qword_1000440D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000440D0);
  }
  return result;
}

unint64_t sub_1000191A8()
{
  unint64_t result = qword_1000440D8;
  if (!qword_1000440D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000440D8);
  }
  return result;
}

unint64_t sub_100019200()
{
  unint64_t result = qword_1000440E0;
  if (!qword_1000440E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000440E0);
  }
  return result;
}

uint64_t sub_100019254(uint64_t a1)
{
  unint64_t v2 = sub_10001905C();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000192A4()
{
  unint64_t result = qword_1000440E8;
  if (!qword_1000440E8)
  {
    sub_100008EAC(&qword_1000440F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000440E8);
  }
  return result;
}

void sub_100019300(void *a1@<X8>)
{
  *a1 = &off_1000395A0;
}

unsigned char *initializeBufferWithCopyOfBuffer for ShareIntentMode(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ShareIntentMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ShareIntentMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001947CLL);
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

uint64_t sub_1000194A4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000194AC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ShareIntentMode()
{
  return &type metadata for ShareIntentMode;
}

void sub_1000194C8()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_wantsRemoteOptionsPresentation) != 1) {
    return;
  }
  uint64_t v1 = v0;
  uint64_t v2 = SHSheetOptionGroups.groups.getter();
  if (!v2) {
    return;
  }
  unint64_t v3 = v2;
  if (qword_100042E38 != -1) {
    goto LABEL_43;
  }
  while (1)
  {
    uint64_t v45 = v1;
    uint64_t v4 = type metadata accessor for Logger();
    sub_100007F84(v4, (uint64_t)qword_100045D30);
    swift_bridgeObjectRetain_n();
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    unint64_t v7 = v3 >> 62;
    unint64_t v47 = v3;
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 134218242;
      if (v7)
      {
        swift_bridgeObjectRetain();
        _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 12) = 2080;
      sub_100008D18(0, (unint64_t *)&unk_100044330);
      swift_bridgeObjectRetain();
      uint64_t v9 = Array.description.getter();
      unint64_t v11 = v10;
      swift_bridgeObjectRelease();
      sub_100028E64(v9, v11, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "options to update: group count %ld, %s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      unint64_t v7 = v3 >> 62;
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v12 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v46 = v3 & 0xFFFFFFFFFFFFFF8;
    if (!v7)
    {
      uint64_t v1 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v1) {
        break;
      }
      goto LABEL_11;
    }
    swift_bridgeObjectRetain();
    uint64_t v1 = _CocoaArrayWrapper.endIndex.getter();
    if (!v1) {
      break;
    }
LABEL_11:
    unint64_t v13 = 0;
    uint64_t v48 = v1;
    while (1)
    {
      if ((v47 & 0xC000000000000001) != 0)
      {
        id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        BOOL v15 = __OFADD__(v13, 1);
        unint64_t v16 = v13 + 1;
        if (v15) {
          goto LABEL_40;
        }
      }
      else
      {
        if (v13 >= *(void *)(v46 + 16)) {
          goto LABEL_42;
        }
        id v14 = *(id *)(v47 + 32 + 8 * v13);
        BOOL v15 = __OFADD__(v13, 1);
        unint64_t v16 = v13 + 1;
        if (v15)
        {
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
      }
      uint64_t v49 = v14;
      id v17 = [v14 customizations];
      sub_100008D18(0, &qword_100044328);
      unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      unint64_t v50 = v16;
      if (v3 >> 62) {
        break;
      }
      uint64_t v1 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v1) {
        goto LABEL_21;
      }
LABEL_12:

      swift_bridgeObjectRelease();
      uint64_t v1 = v48;
      unint64_t v13 = v50;
      if (v50 == v48) {
        goto LABEL_45;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v1 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v1) {
      goto LABEL_12;
    }
LABEL_21:
    if (v1 >= 1)
    {
      uint64_t v18 = 0;
      while (1)
      {
        if ((v3 & 0xC000000000000001) != 0) {
          id v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v19 = *(id *)(v3 + 8 * v18 + 32);
        }
        uint64_t v20 = v19;
        self;
        uint64_t v21 = swift_dynamicCastObjCClass();
        if (v21)
        {
          uint64_t v22 = (void *)v21;
          id v55 = sub_10001F48C;
          uint64_t v56 = v12;
          uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
          uint64_t v52 = 1107296256;
          uint64_t v53 = sub_10001BA24;
          id v23 = &unk_100039F90;
        }
        else
        {
          self;
          uint64_t v24 = swift_dynamicCastObjCClass();
          if (v24)
          {
            uint64_t v22 = (void *)v24;
            id v55 = sub_10001F48C;
            uint64_t v56 = v12;
            uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
            uint64_t v52 = 1107296256;
            uint64_t v53 = sub_10001BA24;
            id v23 = &unk_100039F68;
          }
          else
          {
            self;
            uint64_t v25 = swift_dynamicCastObjCClass();
            if (!v25)
            {
              id v28 = v20;
              uint64_t v27 = Logger.logObject.getter();
              os_log_type_t v29 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v27, v29))
              {
                uint64_t v30 = swift_slowAlloc();
                int64_t v31 = (void *)swift_slowAlloc();
                *(_DWORD *)uint64_t v30 = 138412290;
                *(void *)(v30 + 4) = v28;
                void *v31 = v28;
                _os_log_impl((void *)&_mh_execute_header, v27, v29, "Received unhandled customization: %@", (uint8_t *)v30, 0xCu);
                sub_100006E30(&qword_100043250);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
              }
              else
              {

                uint64_t v27 = v28;
              }
              goto LABEL_33;
            }
            uint64_t v22 = (void *)v25;
            id v55 = sub_10001F48C;
            uint64_t v56 = v12;
            uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
            uint64_t v52 = 1107296256;
            uint64_t v53 = sub_10001BA24;
            id v23 = &unk_100039F40;
          }
        }
        uint64_t v54 = v23;
        uint64_t v26 = _Block_copy(&aBlock);
        uint64_t v27 = v20;
        swift_retain();
        swift_release();
        [v22 _setHandler:v26];

        _Block_release(v26);
LABEL_33:
        ++v18;

        if (v1 == v18) {
          goto LABEL_12;
        }
      }
    }
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    swift_once();
  }
LABEL_45:
  swift_bridgeObjectRelease();
  uint64_t v32 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_optionsViewController;
  uint64_t v33 = *(void **)(v45 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_optionsViewController);
  if (v33)
  {
    sub_100008D18(0, (unint64_t *)&unk_100044330);
    id v34 = v33;
    v35.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v34 updateWithCustomizationGroups:v35.super.isa];
  }
  else
  {
    id v36 = objc_allocWithZone((Class)SHSheetOptionsViewContext);
    sub_100008D18(0, (unint64_t *)&unk_100044330);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v38 = [v36 initWithCustomizationGroups:isa];

    v35.super.Class isa = (Class)[self createOptionsViewControllerWithContext:v38 delegate:v45];
    self;
    uint64_t v39 = swift_dynamicCastObjCClass();
    if (v39) {
      id v40 = v35.super.isa;
    }
    id v41 = *(void **)(v45 + v32);
    *(void *)(v45 + v32) = v39;

    uint64_t v42 = v45 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v43 = *(void *)(v42 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, Class, uint64_t, uint64_t))(v43 + 32))(v45, v35.super.isa, ObjectType, v43);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }

  swift_release();
}

void sub_100019D5C(void *a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_wantsRemoteOptionsPresentation) != 1
    || a1 == 0)
  {
    return;
  }
  uint64_t v3 = v1;
  uint64_t v32 = a1;
  uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;
  id v7 = objc_allocWithZone((Class)NSKeyedUnarchiver);
  id v8 = sub_10001E958();
  sub_100008DEC(v4, v6);
  if (!v8)
  {
    if (qword_100042E38 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_100007F84(v9, (uint64_t)qword_100045D30);
    os_log_t oslog = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v10))
    {
      unint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v10, "Found collaboration options data but couldn't create unarchiver to decode it", v11, 2u);
      swift_slowDealloc();

LABEL_11:
      uint64_t v12 = oslog;
LABEL_28:

      return;
    }
    goto LABEL_26;
  }
  [v8 setRequiresSecureCoding:1];
  sub_100008D18(0, &qword_100044320);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  os_log_t oslog = NSCoder.decodeObject<A>(of:forKey:)();
  swift_bridgeObjectRelease();
  if (!oslog)
  {
    if (qword_100042E38 != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    sub_100007F84(v18, (uint64_t)qword_100045D30);
    os_log_t oslog = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v19, "Couldn't decode collaboration options", v20, 2u);
      swift_slowDealloc();

      goto LABEL_11;
    }

LABEL_27:
    uint64_t v12 = v32;
    goto LABEL_28;
  }
  [v8 finishDecoding];
  uint64_t v13 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_collaborationOptionsViewController;
  if (*(void *)(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_collaborationOptionsViewController))
  {
    if (qword_100042E38 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_100007F84(v14, (uint64_t)qword_100045D30);
    BOOL v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Collaboration options view controller already exists", v17, 2u);
      swift_slowDealloc();

      goto LABEL_11;
    }

LABEL_26:
    goto LABEL_27;
  }
  sub_10001B008();
  if (v21)
  {
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v22 = 0;
  }
  id v23 = self;
  uint64_t v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_10001F484;
  aBlock[5] = v24;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001BA24;
  aBlock[3] = &unk_100039F18;
  uint64_t v25 = _Block_copy(aBlock);
  swift_release();
  id v26 = [v23 createCollaborationOptionsViewControllerWithCollaborationOptions:oslog bundleIdentifier:v22 updateHandler:v25];
  _Block_release(v25);

  uint64_t v27 = *(void **)(v3 + v13);
  *(void *)(v3 + v13) = v26;
  id v28 = v26;

  uint64_t v29 = v3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v30 = *(void *)(v29 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v30 + 32))(v3, v28, ObjectType, v30);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

void sub_10001A2B8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  os_log_type_t v10 = (char *)&v31 - v9;
  unint64_t v11 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext);
  if (v11)
  {
    id v12 = [v11 activitiesByUUID];
    sub_100008D18(0, &qword_100043C80);
    sub_10001F3B4((unint64_t *)&unk_100043C88, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    id v14 = [a1 activityUUID];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    if (*(void *)(v13 + 16))
    {
      unint64_t v15 = sub_10001197C((uint64_t)v10);
      if (v16)
      {
        id v17 = *(id *)(*(void *)(v13 + 56) + 8 * v15);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
        unsigned int v18 = [a1 isPulsing];
        os_log_type_t v19 = (id *)(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
        if (v18)
        {
          swift_beginAccess();
          id v20 = *v19;
          if (v20)
          {
            swift_unknownObjectRetain();
            NSString v21 = [a1 localizedTitle];
            if (!v21)
            {
              static String._unconditionallyBridgeFromObjectiveC(_:)();
              NSString v21 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease();
            }
            [v20 startPulsingActivity:v17 localizedTitle:v21];

            swift_unknownObjectRelease();
            return;
          }
        }
        else
        {
          swift_beginAccess();
          if (*v19) {
            [*v19 stopPulsingActivity:v17];
          }
        }

        return;
      }
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v22 = type metadata accessor for Logger();
  sub_100007F84(v22, (uint64_t)qword_100045D30);
  id v23 = a1;
  uint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    id v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    v33[0] = v32;
    *(_DWORD *)id v26 = 136315138;
    id v27 = [v23 activityUUID:v26 + 4, v32, v33[0]];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10001F3B4(&qword_100044310, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v28 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v30 = v29;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v33[3] = sub_100028E64(v28, v30, v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Couldn't resolve activity for UUUID:%s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_10001A784(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100006E30(&qword_1000432D0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  unint64_t v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v31 - v12;
  sub_10001F2D4(a1, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_1000105A4((uint64_t)v6);
    id v14 = (id *)(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
    swift_beginAccess();
    if (*v14) {
      [*v14 reloadContent];
    }
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
  unint64_t v15 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext);
  if (v15)
  {
    id v16 = [v15 activitiesByUUID];
    sub_100008D18(0, &qword_100043C80);
    sub_10001F3B4((unint64_t *)&unk_100043C88, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    if (*(void *)(v17 + 16))
    {
      unint64_t v18 = sub_10001197C((uint64_t)v13);
      if (v19)
      {
        id v20 = *(id *)(*(void *)(v17 + 56) + 8 * v18);
        swift_bridgeObjectRelease();
        NSString v21 = (void **)(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
        swift_beginAccess();
        uint64_t v22 = *v21;
        if (v22)
        {
          swift_endAccess();
          [v22 reloadActivity:v20];

          (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
          swift_endAccess();
        }
        return;
      }
    }
    swift_bridgeObjectRelease();
  }
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v23 = type metadata accessor for Logger();
  sub_100007F84(v23, (uint64_t)qword_100045D30);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  uint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    id v26 = (uint8_t *)swift_slowAlloc();
    v32[0] = swift_slowAlloc();
    *(_DWORD *)id v26 = 136315138;
    v31[1] = v26 + 4;
    sub_10001F3B4(&qword_100044310, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v27 = dispatch thunk of CustomStringConvertible.description.getter();
    v31[2] = sub_100028E64(v27, v28, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    unint64_t v29 = *(void (**)(char *, uint64_t))(v8 + 8);
    v29(v11, v7);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Couldn't resolve activity for UUUID:%s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v29(v13, v7);
  }
  else
  {

    unint64_t v30 = *(void (**)(char *, uint64_t))(v8 + 8);
    v30(v11, v7);
    v30(v13, v7);
  }
}

uint64_t sub_10001AC84(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
  uint64_t result = swift_beginAccess();
  uint64_t v5 = *v3;
  if (v5)
  {
    uint64_t result = (uint64_t)[v5 respondsToSelector:"runScrollingTestWithName:type:completionHandler:"];
    if (result)
    {
      swift_unknownObjectRetain();
      id v6 = [a1 name];
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      id v7 = [a1 type];
      uint64_t v8 = swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_retain();
      NSString v9 = String._bridgeToObjectiveC()();
      aBlock[4] = sub_10001F47C;
      aBlock[5] = v8;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000056C4;
      aBlock[3] = &unk_100039EF0;
      uint64_t v10 = _Block_copy(aBlock);
      swift_retain();
      [v5 runScrollingTestWithName:v9 type:v7 completionHandler:v10];
      _Block_release(v10);

      swift_bridgeObjectRelease();
      swift_release_n();
      swift_unknownObjectRelease();
      return swift_release();
    }
  }
  return result;
}

void sub_10001AE44(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007F84(v4, (uint64_t)qword_100045D30);
  id v5 = a1;
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    NSString v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "updateSessionContext: %@", v8, 0xCu);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  unint64_t v11 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext);
  *(void *)(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext) = v5;

  id v12 = v5;
  sub_10001B538();
}

uint64_t sub_10001B008()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken);
  if (v1)
  {
    id v2 = v1;
    [v2 realToken];
    CPCopyBundleIdentifierAndTeamFromAuditToken();
  }
  return 0;
}

char *sub_10001B0DC(void *a1)
{
  id v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_currentConfiguration] = 0;
  uint64_t v6 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_customViewController;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_customViewController] = 0;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_wantsRemoteOptionsPresentation] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_optionsViewController] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_collaborationOptionsViewController] = 0;
  os_log_type_t v7 = *(void **)&v2[v5];
  *(void *)&v2[v5] = a1;
  uint64_t v8 = v2;
  id v9 = a1;

  id v10 = [v9 sessionIdentifier];
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;

  id v14 = (uint64_t *)&v8[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_identifier];
  uint64_t *v14 = v11;
  v14[1] = v13;
  unint64_t v15 = v8;
  if ([v9 wantsCustomScene])
  {
    id v16 = [v9 processIdentity];
    id v17 = [objc_allocWithZone((Class)SHSheetCustomSceneViewController) initWithProcessIdentity:v16];

    unint64_t v15 = *(void **)&v2[v6];
    *(void *)&v2[v6] = v17;
  }
  v23.receiver = v8;
  v23.super_class = ObjectType;
  unint64_t v18 = [(char *)[super init]];
  sub_1000023B0();
  sub_10001B304();
  char v19 = *(void **)&v18[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager];
  if (v19)
  {
    id v20 = v19;
    swift_bridgeObjectRetain();
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v20 connectUIServiceToDaemonWithSessionID:v21];
  }
  return v18;
}

id sub_10001B304()
{
  id v1 = [objc_allocWithZone((Class)SFShareSheetSlotManager) init];
  uint64_t v2 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  *(void *)(v0 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager) = v1;

  id result = *(id *)(v0 + v2);
  if (result)
  {
    [result setDelegate:v0];
    id result = *(id *)(v0 + v2);
    if (result)
    {
      return [result activate];
    }
  }
  return result;
}

id sub_10001B390()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager];
  if (v2) {
    [v2 invalidate];
  }
  v4.receiver = v0;
  v4.super_class = ObjectType;
  return [super dealloc];
}

void sub_10001B538()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchPredicate();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (void *)((char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100008D18(0, (unint64_t *)&unk_100043AE0);
  void *v5 = static OS_dispatch_queue.main.getter();
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  char v6 = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
LABEL_12:
    swift_once();
    goto LABEL_4;
  }
  os_log_type_t v7 = sub_10001BD68();
  if (!v7) {
    return;
  }
  uint64_t v5 = v7;
  if (qword_100042E38 != -1) {
    goto LABEL_12;
  }
LABEL_4:
  uint64_t v8 = type metadata accessor for Logger();
  sub_100007F84(v8, (uint64_t)qword_100045D30);
  id v9 = v5;
  id v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    v17[0] = v1;
    uint64_t v13 = (uint8_t *)v12;
    id v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    v17[1] = v9;
    unint64_t v15 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v14 = v5;

    _os_log_impl((void *)&_mh_execute_header, v10, v11, "update content with viewModel %@", v13, 0xCu);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v1 = v17[0];
    swift_slowDealloc();
  }
  else
  {

    id v10 = v9;
  }

  id v16 = (id *)(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
  swift_beginAccess();
  if (*v16) {
    [*v16 updateWithViewModel:v9];
  }
}

void sub_10001B818(void *a1)
{
  if (a1)
  {
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v3 = (void *)Strong;
      id v4 = a1;
      sub_10001B884((uint64_t)v4);
    }
  }
}

void sub_10001B884(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007F84(v4, (uint64_t)qword_100045D30);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "handle remote option update", v7, 2u);
    swift_slowDealloc();
  }

  id v11 = [objc_allocWithZone((Class)SHSheetOptionsUpdateAction) initWithCustomization:a1];
  uint64_t v8 = v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v9 = *(void *)(v8 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v9 + 8))(v2, v11, ObjectType, v9);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

void sub_10001BA28(uint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    sub_10001BA84(a1);
  }
}

void sub_10001BA84(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007F84(v4, (uint64_t)qword_100045D30);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "handle remote collaboration options update", v7, 2u);
    swift_slowDealloc();
  }

  id v11 = [objc_allocWithZone((Class)SHSheetCollaborationOptionsUpdateAction) initWithCollaborationOptions:a1];
  uint64_t v8 = v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v9 = *(void *)(v8 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v9 + 8))(v2, v11, ObjectType, v9);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

void sub_10001BC24(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_10001BC90()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    id v2 = [objc_allocWithZone((Class)SHSheetAction) initWithType:9];
    uint64_t v3 = &v1[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate];
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v4 = *((void *)v3 + 1);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(char *, id, uint64_t, uint64_t))(v4 + 8))(v1, v2, ObjectType, v4);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

char *sub_10001BD68()
{
  uint64_t v1 = v0;
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007F84(v2, (uint64_t)qword_100045D30);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "creating view model", v5, 2u);
    swift_slowDealloc();
  }

  os_log_type_t v6 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_currentConfiguration);
  if (!v6)
  {
    unint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "skipping: no configuration", v17, 2u);
      swift_slowDealloc();
    }
    goto LABEL_13;
  }
  os_log_type_t v7 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext);
  if (!v7)
  {
    unint64_t v15 = v6;
    unint64_t v18 = Logger.logObject.getter();
    uint64_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, (os_log_type_t)v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v19, "skipping: no session context", v20, 2u);
      swift_slowDealloc();
    }

LABEL_13:
    return 0;
  }
  id v8 = objc_allocWithZone((Class)type metadata accessor for ShareSheetViewModel());
  id v9 = v7;
  id v10 = v6;
  id v11 = (char *)sub_100011CD8(v10, v7);

  uint64_t v12 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_customViewController);
  uint64_t v13 = *(void **)&v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController];
  *(void *)&v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController] = v12;
  id v14 = v12;

  return v11;
}

uint64_t type metadata accessor for ShareSheetUISession()
{
  return self;
}

uint64_t sub_10001C084(void *a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  os_log_type_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008D18(0, (unint64_t *)&unk_100043AE0);
  id v10 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = v1;
  aBlock[4] = sub_10001F43C;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000056C4;
  aBlock[3] = &unk_100039EA0;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = a1;
  id v14 = v1;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10001F3B4((unint64_t *)&qword_100043390, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100006E30((uint64_t *)&unk_100043AF0);
  sub_100008E50();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v17);
}

void sub_10001C348(void *a1, uint64_t a2)
{
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007F84(v4, (uint64_t)qword_100045D30);
  id v5 = a1;
  os_log_type_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    id v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "did update data source with configuration %@", v8, 0xCu);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v11 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_currentConfiguration;
  uint64_t v12 = *(void **)(a2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_currentConfiguration);
  if (!v12)
  {
    sub_100002428();
    uint64_t v12 = *(void **)(a2 + v11);
  }
  *(void *)(a2 + v11) = v5;

  unsigned int v13 = [v5 shouldBlockPresentation];
  uint64_t v14 = a2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (v13)
  {
    if (Strong)
    {
      uint64_t v16 = *(void *)(v14 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 40))(a2, ObjectType, v16);
      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (Strong)
    {
      uint64_t v18 = *(void *)(v14 + 8);
      uint64_t v19 = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(a2, v19, v18);
      swift_unknownObjectRelease();
    }
    sub_10001B538();
  }
}

uint64_t sub_10001C620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v23 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for DispatchQoS();
  uint64_t v12 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008D18(0, (unint64_t *)&unk_100043AE0);
  uint64_t v21 = static OS_dispatch_queue.main.getter();
  unint64_t v15 = (void *)swift_allocObject();
  v15[2] = a1;
  v15[3] = a2;
  v15[4] = v4;
  v15[5] = a3;
  v15[6] = a4;
  aBlock[4] = sub_10001F38C;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000056C4;
  aBlock[3] = &unk_100039E50;
  uint64_t v16 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v17 = v4;
  swift_bridgeObjectRetain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10001F3B4((unint64_t *)&qword_100043390, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100006E30((uint64_t *)&unk_100043AF0);
  sub_100008E50();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v18 = (void *)v21;
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v22);
}

void sub_10001C910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext;
  uint64_t v10 = *(void **)(a3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext);
  if (v10)
  {
    id v11 = [v10 activitiesByUUID];
    type metadata accessor for UUID();
    sub_100008D18(0, &qword_100043C80);
    sub_10001F3B4((unint64_t *)&unk_100043C88, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v13 = *(void **)(a3 + v9);
    if (v13) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v18 = 0;
    uint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_12;
  }
  uint64_t v12 = sub_100011410((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v13 = *(void **)(a3 + v9);
  if (!v13) {
    goto LABEL_7;
  }
LABEL_3:
  id v14 = [v13 applicationActivityTypes];
  if (v14)
  {
    unint64_t v15 = v14;
    type metadata accessor for ActivityType(0);
    uint64_t v16 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    id v17 = *(void **)(a3 + v9);
    if (!v17) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
    id v17 = *(void **)(a3 + v9);
    if (!v17) {
      goto LABEL_11;
    }
  }
  id v19 = [v17 excludedActivityTypes];
  if (v19)
  {
    uint64_t v20 = v19;
    type metadata accessor for ActivityType(0);
    uint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    goto LABEL_12;
  }
LABEL_11:
  uint64_t v18 = 0;
LABEL_12:
  objc_allocWithZone((Class)_UIActivityUserDefaultsViewController);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v21 = swift_bridgeObjectRetain();
  id v25 = sub_10001E778(v21, a2, v12, (uint64_t)v16, a4, v18, a5, 1);
  [v25 setUserDefaultsDelegate:a3];
  [v25 setHostAuditToken:*(void *)(a3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken)];
  uint64_t v22 = a3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v23 = *(void *)(v22 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v23 + 16))(a3, v25, ObjectType, v23);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

void sub_10001CCB8(void *a1)
{
}

void sub_10001CCE0(void *a1)
{
}

void sub_10001CCF4(void *a1, const char *a2, SEL *a3)
{
  uint64_t v6 = v3;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v33 = v8;
  uint64_t v34 = v9;
  __chkstk_darwin(v8);
  id v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100007F84(v12, (uint64_t)qword_100045D30);
  swift_unknownObjectRetain_n();
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v32 = a3;
    uint64_t v16 = v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v31 = v3;
    uint64_t v36 = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    v30[1] = (const char *)(v16 + 4);
    id v18 = [a1 identifier];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10001F3B4(&qword_100044310, (void (*)(uint64_t))&type metadata accessor for UUID);
    id v19 = a1;
    uint64_t v20 = v33;
    uint64_t v21 = dispatch thunk of CustomStringConvertible.description.getter();
    v30[0] = a2;
    unint64_t v23 = v22;
    uint64_t v24 = v20;
    a1 = v19;
    (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v24);
    uint64_t v35 = sub_100028E64(v21, v23, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, v30[0], (uint8_t *)v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v6 = v31;
    swift_slowDealloc();
    a3 = v32;
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  id v25 = *(void **)(v6 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  if (v25)
  {
    id v26 = v25;
    NSString v27 = String._bridgeToObjectiveC()();
    id v28 = [a1 identifier];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v33);
    [v26 *a3:v27 isa];
  }
}

void sub_10001D088(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v39 - v9;
  uint64_t v11 = sub_100006E30(&qword_1000432D0);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v46 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v39 - v15;
  __chkstk_darwin(v14);
  id v18 = (char *)&v39 - v17;
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for Logger();
  sub_100007F84(v19, (uint64_t)qword_100045D30);
  sub_10001F2D4(a2, (uint64_t)v18);
  swift_unknownObjectRetain_n();
  uint64_t v20 = Logger.logObject.getter();
  int v21 = static os_log_type_t.default.getter();
  BOOL v22 = os_log_type_enabled(v20, (os_log_type_t)v21);
  uint64_t v44 = v5;
  if (v22)
  {
    int v41 = v21;
    uint64_t v42 = a2;
    uint64_t v43 = v8;
    unint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v48 = v40;
    *(_DWORD *)unint64_t v23 = 136315138;
    sub_10001F2D4((uint64_t)v18, (uint64_t)v16);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v16, 1, v4) == 1)
    {
      id v24 = [a1 identifier];
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      sub_1000105A4((uint64_t)v16);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v16, v4);
    }
    id v26 = a1;
    sub_10001F3B4(&qword_100044310, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v27 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v29 = v28;
    unint64_t v30 = v10;
    uint64_t v25 = v4;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v30, v4);
    uint64_t v47 = sub_100028E64(v27, v29, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000105A4((uint64_t)v18);
    swift_unknownObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v20, (os_log_type_t)v41, "Perform share activity %s", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a1 = v26;
    a2 = v42;
    uint64_t v8 = v43;
  }
  else
  {
    uint64_t v25 = v4;
    swift_unknownObjectRelease();
    sub_1000105A4((uint64_t)v18);

    swift_unknownObjectRelease();
  }
  uint64_t v31 = (uint64_t)v46;
  uint64_t v32 = *(void **)(v45 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  if (v32)
  {
    uint64_t v33 = a1;
    id v34 = v32;
    NSString v35 = String._bridgeToObjectiveC()();
    sub_10001F2D4(a2, v31);
    uint64_t v36 = v44;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v31, 1, v25) == 1)
    {
      id v37 = [v33 identifier];
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      sub_1000105A4(v31);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v8, v31, v25);
    }
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v25);
    [v34 activityViewControllerWithSessionID:v35 selectedActivityWithIdentifier:isa];
  }
}

void sub_10001D6D8(void *a1)
{
}

void sub_10001D700(void *a1, uint64_t a2, void *a3, const char *a4, SEL *a5)
{
  swift_unknownObjectRetain();
  id v9 = a1;
  sub_10001CCF4(a3, a4, a5);
  swift_unknownObjectRelease();
}

void sub_10001D780()
{
  uint64_t v1 = v0;
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007F84(v2, (uint64_t)qword_100045D30);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "handle action edit", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  if (v6)
  {
    id v7 = v6;
    NSString v8 = String._bridgeToObjectiveC()();
    [v7 activityViewControllerPerformEditActionsWithSessionID:v8];
  }
}

void sub_10001D924()
{
}

void sub_10001D98C()
{
}

void sub_10001D9F4()
{
}

void sub_10001DA5C()
{
}

void sub_10001DAC4()
{
}

void sub_10001DB2C()
{
  uint64_t v1 = v0;
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007F84(v2, (uint64_t)qword_100045D30);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "handle info suggestion", v5, 2u);
    swift_slowDealloc();
  }

  id v6 = objc_allocWithZone((Class)SHSheetSuggestionAction);
  swift_bridgeObjectRetain();
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v11 = [v6 initWithSuggestionReason:v7];

  uint64_t v8 = v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v9 = *(void *)(v8 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v9 + 8))(v1, v11, ObjectType, v9);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

void sub_10001DD64()
{
}

void sub_10001DDCC()
{
}

void sub_10001DDDC(const char *a1, uint64_t a2)
{
  uint64_t v5 = v2;
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100007F84(v6, (uint64_t)qword_100045D30);
  NSString v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, a1, v9, 2u);
    swift_slowDealloc();
  }

  id v13 = [objc_allocWithZone((Class)SHSheetAction) initWithType:a2];
  uint64_t v10 = v5 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v11 = *(void *)(v10 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v11 + 8))(v5, v13, ObjectType, v11);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

void sub_10001E290(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5 = v4;
  int v34 = a4;
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  sub_100007F84(v13, (uint64_t)qword_100045D30);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, v9);
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v31 = a2;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v33 = v4;
    uint64_t v36 = v18;
    unint64_t v30 = a1;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v32 = a3;
    sub_10001F3B4(&qword_100044310, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v35 = sub_100028E64(v19, v20, &v36);
    a3 = v32;
    a1 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "didSelectActivityWithIdentifier:%s", v17, 0xCu);
    swift_arrayDestroy();
    uint64_t v5 = v33;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  if (v34)
  {
    id v21 = [self createScreenTimeAlertViewController];
    uint64_t v22 = v5 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v23 = *(void *)(v22 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v23 + 24))(v5, v21, ObjectType, v23);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
  else
  {
    [a1 dismissViewControllerAnimated:1 completion:0];
    uint64_t v25 = *(void **)(v5 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
    if (v25)
    {
      id v26 = v25;
      NSString v27 = String._bridgeToObjectiveC()();
      Class isa = UUID._bridgeToObjectiveC()().super.isa;
      [v26 activityViewControllerWithSessionID:v27 selectedDefaultActivityWithIdentifier:isa activityCategory:a3];
    }
  }
}

id sub_10001E778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  sub_100008D18(0, &qword_100044318);
  v10.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v11.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  type metadata accessor for UUID();
  sub_100008D18(0, &qword_100043C80);
  sub_10001F3B4((unint64_t *)&unk_100043C88, (void (*)(uint64_t))&type metadata accessor for UUID);
  v12.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  type metadata accessor for ActivityType(0);
  v13.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v14.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (a6)
  {
    v15.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v15.super.Class isa = 0;
  }
  LOBYTE(v18) = a8 & 1;
  id v16 = [v20 initWithFavoritesProxies:v10.super.isa suggestionProxies:v11.super.isa activitiesByUUID:v12.super.isa applicationActivityTypes:v13.super.isa orderedUUIDs:v14.super.isa excludedActivityTypes:v15.super.isa activityCategory:a7 isPresentedModally:v18];

  return v16;
}

id sub_10001E958()
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v6 = 0;
  id v2 = [v0 initForReadingFromData:isa error:&v6];

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

void sub_10001EA18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_100007F84(v10, (uint64_t)qword_100045D30);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  NSArray v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v23 = v2;
    NSArray v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v24 = a1;
    uint64_t v27 = v15;
    uint64_t v25 = a2;
    *(_DWORD *)NSArray v14 = 136315138;
    sub_10001F3B4(&qword_100044310, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v16 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v26 = sub_100028E64(v16, v17, &v27);
    a2 = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "didToggleActivityWithIdentifier:%s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v3 = v23;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  uint64_t v18 = *(void **)(v3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  if (v18)
  {
    id v19 = v18;
    NSString v20 = String._bridgeToObjectiveC()();
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    [v19 activityViewControllerWithSessionID:v20 toggledActivityWithIdentifier:isa activityCategory:a2];
  }
}

void sub_10001ED30(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  NSArray v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100007F84(v12, (uint64_t)qword_100045D30);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v27 = a2;
  if (v15)
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v24 = v3;
    unint64_t v17 = (uint8_t *)v16;
    uint64_t v29 = swift_slowAlloc();
    int v25 = a1;
    *(_DWORD *)unint64_t v17 = 136315138;
    uint64_t v26 = a3;
    sub_10001F3B4(&qword_100044310, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v18 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v28 = sub_100028E64(v18, v19, &v29);
    a3 = v26;
    LOBYTE(asub_10001DDDC("handle options", 1) = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "didFavoriteActivity:%s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v4 = v24;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  NSString v20 = *(void **)(v4 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  if (v20)
  {
    id v21 = v20;
    NSString v22 = String._bridgeToObjectiveC()();
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    [v21 activityViewControllerWithSessionID:v22 favoritedActivity:a1 & 1 withIdentifier:isa activityCategory:a3];
  }
}

void sub_10001F054(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_100042E38 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100007F84(v5, (uint64_t)qword_100045D30);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v16 = a2;
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    sub_100008D18(0, &qword_100044318);
    swift_bridgeObjectRetain();
    uint64_t v9 = Array.description.getter();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    sub_100028E64(v9, v11, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "didUpdateFavoritesProxies:%s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v16;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v12 = *(void **)(v3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  if (v12)
  {
    id v13 = v12;
    NSString v14 = String._bridgeToObjectiveC()();
    sub_100008D18(0, &qword_100044318);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    [v13 activityViewControllerWithSessionID:v14 updatedFavoritesProxies:isa activityCategory:a2];
  }
}

uint64_t sub_10001F2D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006E30(&qword_1000432D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001F33C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10001F38C()
{
  sub_10001C910(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_10001F39C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 3sub_10001DDDC("handle collaboration options", 2) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_10001DDDC("handle custom header button", 0) = v2;
  return swift_retain();
}

uint64_t sub_10001F3AC()
{
  return swift_release();
}

uint64_t sub_10001F3B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001F3FC()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001F43C()
{
  sub_10001C348(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10001F444()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001F47C()
{
}

void sub_10001F484(uint64_t a1)
{
}

void sub_10001F48C(void *a1)
{
}

id sub_10001F60C()
{
  return sub_10001F838(type metadata accessor for SceneSettingsDiffAction);
}

uint64_t type metadata accessor for SceneSettingsDiffAction()
{
  return self;
}

id sub_10001F820()
{
  return sub_10001F838(type metadata accessor for SceneWindowObserver);
}

id sub_10001F838(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for SceneWindowObserver()
{
  return self;
}

uint64_t sub_10001F8A4()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000093C4(v0, qword_100044410);
  uint64_t v1 = sub_100007F84(v0, (uint64_t)qword_100044410);
  if (qword_100042E40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100007F84(v0, (uint64_t)qword_100045D48);
  objc_super v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void *ShareIntent.assistantOnly.unsafeMutableAddressor()
{
  return &static ShareIntent.assistantOnly;
}

uint64_t static ShareIntent.assistantOnly.getter()
{
  return 1;
}

uint64_t sub_10001F980()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource();
  sub_1000093C4(v0, static ShareIntent.title);
  sub_100007F84(v0, (uint64_t)static ShareIntent.title);
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t ShareIntent.title.unsafeMutableAddressor()
{
  if (qword_100042E98 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for LocalizedStringResource();

  return sub_100007F84(v0, (uint64_t)static ShareIntent.title);
}

uint64_t static ShareIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100042E98 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource();
  uint64_t v3 = sub_100007F84(v2, (uint64_t)static ShareIntent.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static ShareIntent.title.setter(uint64_t a1)
{
  if (qword_100042E98 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource();
  uint64_t v3 = sub_100007F84(v2, (uint64_t)static ShareIntent.title);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static ShareIntent.title.modify())()
{
  if (qword_100042E98 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for LocalizedStringResource();
  sub_100007F84(v0, (uint64_t)static ShareIntent.title);
  swift_beginAccess();
  return j__swift_endAccess;
}

double ShareIntent.shareTransport.getter@<D0>(uint64_t a1@<X8>)
{
  IntentParameter.wrappedValue.getter();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 3sub_10001DDDC("handle collaboration options", 2) = v5;
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  return result;
}

uint64_t ShareIntent.shareTransport.setter()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t (*ShareIntent.shareTransport.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10001FD74;
}

uint64_t ShareIntent.$shareTransport.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t ShareIntent.recipients.getter()
{
  IntentParameter.wrappedValue.getter();
  return v1;
}

uint64_t ShareIntent.recipients.setter()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t (*ShareIntent.recipients.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10001FD74;
}

uint64_t ShareIntent.$recipients.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t ShareIntent.mode.getter()
{
  IntentParameter.wrappedValue.getter();
  return v1;
}

uint64_t ShareIntent.mode.setter()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t (*ShareIntent.mode.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10001FD74;
}

uint64_t ShareIntent.$mode.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t ShareIntent.content.getter()
{
  IntentParameter.wrappedValue.getter();
  return v1;
}

uint64_t ShareIntent.content.setter()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t (*ShareIntent.content.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10001FD74;
}

void sub_100020030(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t ShareIntent.$content.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t ShareIntent.perform()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[13] = a4;
  v5[14] = a5;
  v5[11] = a2;
  v5[12] = a3;
  v5[10] = a1;
  return _swift_task_switch(sub_1000200CC, 0, 0);
}

uint64_t sub_1000200CC()
{
  if (qword_100042E90 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007F84(v1, (uint64_t)qword_100044410);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    long long v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Performing share intent", v4, 2u);
    swift_slowDealloc();
  }

  IntentParameter.wrappedValue.getter();
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5 == 0xD00000000000002ALL && v6 == 0x800000010002CAC0)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    uint64_t v8 = (void *)swift_task_alloc();
    v0[15] = v8;
    void *v8 = v0;
    v8[1] = sub_100020334;
    uint64_t v9 = v0[13];
    uint64_t v10 = v0[14];
    uint64_t v12 = v0[11];
    uint64_t v11 = v0[12];
    return sub_100020590(v12, v11, v9, v10);
  }
  char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v7) {
    goto LABEL_9;
  }
  NSString v14 = (void *)swift_task_alloc();
  v0[16] = v14;
  void *v14 = v0;
  v14[1] = sub_100020494;
  uint64_t v15 = v0[13];
  uint64_t v16 = v0[14];
  uint64_t v18 = v0[11];
  uint64_t v17 = v0[12];
  return sub_100020AC0(v18, v17, v15, v16);
}

uint64_t sub_100020334()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100020430, 0, 0);
}

uint64_t sub_100020430()
{
  static IntentResult.result<>()();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100020494()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100026168, 0, 0);
}

uint64_t sub_100020590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[10] = a3;
  v4[11] = a4;
  v4[8] = a1;
  v4[9] = a2;
  uint64_t v5 = type metadata accessor for SFRemoteAlertPresentationRequest.PresentationType();
  v4[12] = v5;
  v4[13] = *(void *)(v5 - 8);
  v4[14] = swift_task_alloc();
  type metadata accessor for MainActor();
  v4[15] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[16] = v7;
  v4[17] = v6;
  return _swift_task_switch(sub_100020688, v7, v6);
}

uint64_t sub_100020688()
{
  if (qword_100042E90 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007F84(v1, (uint64_t)qword_100044410);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    long long v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "No transport provided, presenting Share Sheet", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = (void *)swift_task_alloc();
  v0[18] = v5;
  void *v5 = v0;
  v5[1] = sub_1000207DC;
  uint64_t v6 = v0[10];
  uint64_t v7 = v0[11];
  uint64_t v9 = v0[8];
  uint64_t v8 = v0[9];
  return sub_100021228(v9, v8, v6, v7);
}

uint64_t sub_1000207DC(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 15sub_10001DDDC("handle collaboration options", 2) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 136);
  uint64_t v4 = *(void *)(v2 + 128);
  return _swift_task_switch(sub_100020904, v4, v3);
}

uint64_t sub_100020904()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[13];
  swift_release();
  type metadata accessor for SUISRemoteAlertPresentationManager();
  id v5 = sub_10000A5DC();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v2, enum case for SFRemoteAlertPresentationRequest.PresentationType.sharesheet(_:), v3);
  uint64_t v6 = dispatch thunk of SFRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:hideViewController:presentationType:)();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v0[6] = sub_100024FC0;
  v0[7] = v7;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_1000216A8;
  v0[5] = &unk_10003A090;
  uint64_t v8 = _Block_copy(v0 + 2);
  swift_retain();
  swift_release();
  [v1 setCompletionWithItemsHandler:v8];
  _Block_release(v8);
  swift_release();

  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100020AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[27] = a3;
  v4[28] = a4;
  v4[25] = a1;
  v4[26] = a2;
  uint64_t v5 = type metadata accessor for SFRemoteAlertPresentationRequest.PresentationType();
  v4[29] = v5;
  v4[30] = *(void *)(v5 - 8);
  v4[31] = swift_task_alloc();
  type metadata accessor for MainActor();
  v4[32] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[33] = v7;
  v4[34] = v6;
  return _swift_task_switch(sub_100020BB8, v7, v6);
}

uint64_t sub_100020BB8()
{
  uint64_t v18 = v0;
  if (qword_100042E90 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007F84(v1, (uint64_t)qword_100044410);
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    log = v2;
    os_log_type_t type = v3;
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    IntentParameter.wrappedValue.getter();
    uint64_t v5 = ShareTransportEntity.description.getter();
    unint64_t v7 = v6;
    sub_100025FD8((uint64_t)(v0 + 2));
    v0[24] = sub_100028E64(v5, v7, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release();
    swift_release();
    uint64_t v2 = log;
    _os_log_impl((void *)&_mh_execute_header, log, type, "Performing provided transport: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
  }

  IntentParameter.wrappedValue.getter();
  uint64_t v8 = v0[15];
  v0[35] = v0[14];
  v0[36] = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[37] = v9;
  void *v9 = v0;
  v9[1] = sub_100020ED8;
  uint64_t v10 = v0[27];
  uint64_t v11 = v0[28];
  uint64_t v13 = v0[25];
  uint64_t v12 = v0[26];
  return sub_100021228(v13, v12, v10, v11);
}

uint64_t sub_100020ED8(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 30sub_10001DDDC("did select send copy action", 4) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 272);
  uint64_t v4 = *(void *)(v2 + 264);
  return _swift_task_switch(sub_100021000, v4, v3);
}

uint64_t sub_100021000()
{
  uint64_t v1 = (void *)v0[38];
  uint64_t v2 = v0[31];
  uint64_t v3 = v0[29];
  uint64_t v4 = v0[30];
  swift_release();
  type metadata accessor for SUISRemoteAlertPresentationManager();
  id v5 = sub_10000A5DC();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v2, enum case for SFRemoteAlertPresentationRequest.PresentationType.unknown(_:), v3);
  uint64_t v6 = dispatch thunk of SFRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:hideViewController:presentationType:)();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v0[22] = sub_100024FC0;
  v0[23] = v7;
  v0[18] = _NSConcreteStackBlock;
  v0[19] = 1107296256;
  v0[20] = sub_1000216A8;
  v0[21] = &unk_10003A130;
  uint64_t v8 = _Block_copy(v0 + 18);
  swift_retain();
  swift_release();
  [v1 setCompletionWithItemsHandler:v8];
  _Block_release(v8);
  uint64_t v9 = (void *)v0[38];
  uint64_t v10 = v0[36];
  if (v6)
  {
    uint64_t v11 = v0[35];
    uint64_t v12 = (void *)swift_allocObject();
    id v12[2] = v9;
    v12[3] = v11;
    v12[4] = v10;
    v12[5] = v6;
    swift_retain();
    id v13 = v9;
    dispatch thunk of SFRemoteAlertPresentationHandle.onActivate.setter();

    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  NSString v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_100021228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[11] = a3;
  v4[12] = a4;
  v4[9] = a1;
  v4[10] = a2;
  type metadata accessor for MainActor();
  v4[13] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[14] = v6;
  v4[15] = v5;
  return _swift_task_switch(sub_1000212C4, v6, v5);
}

uint64_t sub_1000212C4()
{
  IntentParameter.wrappedValue.getter();
  uint64_t v1 = sub_100024228(v0[8]);
  v0[16] = (uint64_t)v1;
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[17] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100021380;
  uint64_t v3 = v0[12];
  return sub_100024FDC((uint64_t)v1, v3);
}

uint64_t sub_100021380(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 14sub_10001DDDC("did select send copy action", 4) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 120);
  uint64_t v4 = *(void *)(v2 + 112);
  return _swift_task_switch(sub_1000214A8, v4, v3);
}

uint64_t sub_1000214A8()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[12];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v5 = v0[9];
  swift_release();
  id v6 = objc_allocWithZone((Class)UIActivityItemsConfiguration);
  sub_100008D18(0, (unint64_t *)&qword_100044478);
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v8 = [v6 initWithItemProviders:isa];

  uint64_t v9 = (void *)swift_allocObject();
  id v9[2] = v5;
  v9[3] = v4;
  v9[4] = v3;
  v9[5] = v2;
  v9[6] = v1;
  v0[6] = sub_100025F08;
  v0[7] = v9;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_100023254;
  v0[5] = &unk_10003A0E0;
  uint64_t v10 = _Block_copy(v0 + 2);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  [v8 setPerItemMetadataProvider:v10];
  _Block_release(v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v11 = [objc_allocWithZone((Class)UIActivityViewController) initWithActivityItemsConfiguration:v8];

  uint64_t v12 = (uint64_t (*)(id))v0[1];
  return v12(v11);
}

uint64_t sub_1000216A8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = *(void (**)(void *, uint64_t, uint64_t, void *))(a1 + 32);
  if (a4) {
    uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v9 = 0;
  }
  swift_retain();
  id v10 = a2;
  id v11 = a5;
  v8(a2, a3, v9, a5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100021764(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100006E30(&qword_100043958);
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  type metadata accessor for MainActor();
  swift_retain();
  id v12 = a1;
  swift_bridgeObjectRetain();
  uint64_t v13 = static MainActor.shared.getter();
  uint64_t v14 = (void *)swift_allocObject();
  void v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v12;
  v14[5] = a2;
  v14[6] = a3;
  v14[7] = a4;
  sub_10000BEEC((uint64_t)v10, (uint64_t)&unk_1000444C8, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_1000218B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[17] = a6;
  v7[18] = a7;
  v7[15] = a4;
  v7[16] = a5;
  type metadata accessor for MainActor();
  v7[19] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  v7[20] = v9;
  v7[21] = v8;
  return _swift_task_switch(sub_10002194C, v9, v8);
}

uint64_t sub_10002194C()
{
  uint64_t v1 = (void *)v0[15];
  NSString v2 = String._bridgeToObjectiveC()();
  v0[22] = v2;
  v0[2] = v0;
  v0[7] = v0 + 24;
  v0[3] = sub_100021A64;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10002206C;
  v0[13] = &unk_10003A1A8;
  v0[14] = v3;
  [v1 _performActivityWithType:v2 completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100021A64()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 18sub_10001DDDC("did select send copy action", 4) = v2;
  uint64_t v3 = *(void *)(v1 + 168);
  uint64_t v4 = *(void *)(v1 + 160);
  if (v2) {
    uint64_t v5 = sub_100021DAC;
  }
  else {
    uint64_t v5 = sub_100021B94;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100021B94()
{
  uint64_t v13 = v0;
  uint64_t v1 = *(void **)(v0 + 176);
  swift_release();
  char v2 = *(unsigned char *)(v0 + 192);

  if ((v2 & 1) == 0)
  {
    if (qword_100042E90 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_100007F84(v3, (uint64_t)qword_100044410);
    swift_bridgeObjectRetain_n();
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    BOOL v6 = os_log_type_enabled(v4, v5);
    unint64_t v7 = *(void *)(v0 + 136);
    if (v6)
    {
      uint64_t v8 = *(void *)(v0 + 128);
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 8sub_10001DDDC("handle custom header button", 0) = sub_100028E64(v8, v7, &v12);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Failed to perform activity of type %s", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    if (*(void *)(v0 + 144)) {
      dispatch thunk of SFRemoteAlertPresentationHandle.dismiss(animated:completion:)();
    }
  }
  id v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_100021DAC()
{
  uint64_t v14 = v0;
  uint64_t v1 = (void *)v0[22];
  swift_release();
  swift_willThrow();

  if (qword_100042E90 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007F84(v2, (uint64_t)qword_100044410);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  BOOL v5 = os_log_type_enabled(v3, v4);
  unint64_t v6 = v0[17];
  if (v5)
  {
    uint64_t v7 = v0[16];
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    swift_bridgeObjectRetain();
    v0[10] = sub_100028E64(v7, v6, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 1sub_10001DDDC("handle collaboration options", 2) = 2112;
    swift_errorRetain();
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[10] = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v9 = v10;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to perform activity of type %s with error: %@", (uint8_t *)v8, 0x16u);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_10002206C(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100006E30(&qword_100043988);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 4sub_10001DDDC("handle custom header button", 0) = a2;
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100022120(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000221E8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  unint64_t v50 = a2;
  uint64_t v44 = type metadata accessor for URL();
  uint64_t v47 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v48 = v3;
  uint64_t v49 = &v40[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100006E30(&qword_100043CF0);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = &v40[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v42 = type metadata accessor for UTType();
  uint64_t v51 = *(void *)(v42 - 8);
  uint64_t v7 = __chkstk_darwin(v42);
  uint64_t v46 = &v40[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = &v40[-v10];
  __chkstk_darwin(v9);
  uint64_t v52 = &v40[-v12];
  uint64_t v13 = type metadata accessor for URLResourceValues();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = &v40[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  BOOL v41 = URL.startAccessingSecurityScopedResource()();
  sub_100006E30(&qword_100044480);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002BA00;
  *(void *)(inited + 3sub_10001DDDC("handle collaboration options", 2) = NSURLTypeIdentifierKey;
  uint64_t v18 = NSURLTypeIdentifierKey;
  sub_100023FF8(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  uint64_t v43 = a1;
  uint64_t v19 = v45;
  URL.resourceValues(forKeys:)();
  if (v19)
  {
    swift_errorRelease();
    swift_bridgeObjectRelease();
    uint64_t v45 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    URLResourceValues.typeIdentifier.getter();
    uint64_t v35 = v34;
    (*(void (**)(unsigned char *, uint64_t))(v14 + 8))(v16, v13);
    uint64_t v45 = 0;
    if (v35)
    {
      UTType.init(identifier:allowUndeclared:)();
      uint64_t v36 = v51;
      uint64_t v22 = v42;
      int v37 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v51 + 48))(v6, 1, v42);
      uint64_t v38 = v44;
      uint64_t v23 = v52;
      if (v37 == 1)
      {
        static UTType.fileURL.getter();
        sub_10000842C((uint64_t)v6, &qword_100043CF0);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v36 + 32))(v23, v11, v22);
      }
      else
      {
        uint64_t v39 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v36 + 32);
        v39(v11, v6, v22);
        v39(v23, v11, v22);
      }
      uint64_t v20 = v43;
      uint64_t v21 = v38;
      if (v41) {
        goto LABEL_4;
      }
      goto LABEL_5;
    }
  }
  uint64_t v20 = v43;
  uint64_t v21 = v44;
  uint64_t v22 = v42;
  uint64_t v23 = v52;
  BOOL v24 = v41;
  static UTType.fileURL.getter();
  if (v24) {
LABEL_4:
  }
    URL.stopAccessingSecurityScopedResource()();
LABEL_5:
  id v25 = [objc_allocWithZone((Class)NSItemProvider) init];
  uint64_t v26 = v51;
  uint64_t v27 = v46;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v51 + 16))(v46, v23, v22);
  uint64_t v28 = v47;
  uint64_t v29 = v49;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v47 + 16))(v49, v20, v21);
  unint64_t v30 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v31 = swift_allocObject();
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v28 + 32))(v31 + v30, v29, v21);
  NSItemProvider.registerFileRepresentation(for:visibility:openInPlace:loadHandler:)();
  swift_release();
  uint64_t v32 = *(void (**)(unsigned char *, uint64_t))(v26 + 8);
  v32(v27, v22);
  uint64_t result = ((uint64_t (*)(unsigned char *, uint64_t))v32)(v52, v22);
  *unint64_t v50 = v25;
  return result;
}

uint64_t sub_100022714(void (*a1)(char *, uint64_t, void), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100006E30(&qword_100043370);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::Bool v8 = URL.startAccessingSecurityScopedResource()();
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v7, a3, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  a1(v7, 1, 0);
  sub_10000842C((uint64_t)v7, &qword_100043370);
  if (v8) {
    URL.stopAccessingSecurityScopedResource()();
  }
  return 0;
}

uint64_t sub_10002285C@<X0>(uint64_t a1@<X0>, id **a2@<X4>, unint64_t a3@<X6>, uint64_t a4@<X8>)
{
  uint64_t v74 = type metadata accessor for IntentPerson();
  uint64_t v70 = *(void *)(v74 - 8);
  uint64_t v8 = __chkstk_darwin(v74);
  uint64_t v73 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v72 = (char *)&v69 - v10;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (v11 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v13 == v14)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16)
  {
LABEL_16:
    IntentParameter.wrappedValue.getter();
    if (v76)
    {
      if (*(void *)(v76 + 16))
      {
        if (qword_100042E90 != -1) {
          swift_once();
        }
        uint64_t v29 = type metadata accessor for Logger();
        sub_100007F84(v29, (uint64_t)qword_100044410);
        swift_bridgeObjectRetain();
        unint64_t v30 = Logger.logObject.getter();
        os_log_type_t v31 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v32 = (uint8_t *)swift_slowAlloc();
          uint64_t v76 = swift_slowAlloc();
          *(_DWORD *)uint64_t v32 = 136315138;
          id v71 = v32 + 4;
          swift_bridgeObjectRetain();
          uint64_t v33 = Array.description.getter();
          unint64_t v35 = v34;
          swift_bridgeObjectRelease();
          uint64_t v75 = sub_100028E64(v33, v35, &v76);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v30, v31, "Intent providing recipients: %s", v32, 0xCu);
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
      }
    }
    uint64_t result = IntentParameter.wrappedValue.getter();
    uint64_t v36 = v76;
    if (!v76) {
      goto LABEL_52;
    }
    int v37 = &_swiftEmptyArrayStorage;
    uint64_t v76 = (uint64_t)&_swiftEmptyArrayStorage;
    uint64_t v38 = *(void *)(v36 + 16);
    if (v38)
    {
      uint64_t v69 = a4;
      uint64_t v39 = sub_100008D18(0, &qword_1000444B0);
      uint64_t v40 = *(void (**)(char *, unint64_t, uint64_t))(v70 + 16);
      unint64_t v41 = v36 + ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80));
      uint64_t v42 = *(void *)(v70 + 72);
      uint64_t v43 = (void (**)(char *, uint64_t))(v70 + 8);
      uint64_t v70 = v36;
      id v71 = (uint8_t *)v39;
      swift_bridgeObjectRetain();
      uint64_t v44 = v72;
      do
      {
        uint64_t v45 = v74;
        v40(v44, v41, v74);
        v40(v73, (unint64_t)v44, v45);
        INPerson.init(_:)();
        (*v43)(v44, v45);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        v41 += v42;
        --v38;
      }
      while (v38);
      swift_bridgeObjectRelease();
      int v37 = (void *)v76;
      a4 = v69;
    }
    swift_bridgeObjectRelease();
    uint64_t v46 = (uint64_t *)&unk_1000444B8;
    goto LABEL_32;
  }
  uint64_t v17 = a2;
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = v19;
  if (v18 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v20 == v21)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_34;
  }
  char v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v23)
  {
LABEL_34:
    IntentParameter.wrappedValue.getter();
    char v47 = v76;
    if (v76 != 2)
    {
      if (qword_100042E90 != -1) {
        swift_once();
      }
      uint64_t v48 = type metadata accessor for Logger();
      sub_100007F84(v48, (uint64_t)qword_100044410);
      uint64_t v49 = Logger.logObject.getter();
      os_log_type_t v50 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = a4;
        uint64_t v52 = (uint8_t *)swift_slowAlloc();
        uint64_t v76 = swift_slowAlloc();
        *(_DWORD *)uint64_t v52 = 136315138;
        sub_100006E30(&qword_100043378);
        uint64_t v53 = swift_allocObject();
        *(_OWORD *)(v53 + 16) = xmmword_10002B9F0;
        *(void *)(v53 + 3sub_10001DDDC("handle collaboration options", 2) = [objc_allocWithZone((Class)UIActivityCollaborationModeRestriction) initWithDisabledMode:(v47 & 1) == 0];
        uint64_t v75 = v53;
        specialized Array._endMutation()();
        sub_100008D18(0, &qword_1000444A8);
        uint64_t v63 = Array.description.getter();
        unint64_t v65 = v64;
        swift_bridgeObjectRelease();
        uint64_t v75 = sub_100028E64(v63, v65, &v76);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "Intent providing restrictions: %s", v52, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        a4 = v51;
      }
      else
      {
      }
    }
    uint64_t result = IntentParameter.wrappedValue.getter();
    char v66 = v76;
    if (v76 == 2) {
      goto LABEL_52;
    }
    sub_100006E30(&qword_100043378);
    uint64_t v67 = swift_allocObject();
    *(_OWORD *)(v67 + 16) = xmmword_10002B9F0;
    *(void *)(v67 + 3sub_10001DDDC("handle collaboration options", 2) = [objc_allocWithZone((Class)UIActivityCollaborationModeRestriction) initWithDisabledMode:(v66 & 1) == 0];
    uint64_t v76 = v67;
    specialized Array._endMutation()();
    int v37 = (void *)v76;
    uint64_t v46 = (uint64_t *)&unk_1000444A0;
LABEL_32:
    uint64_t result = sub_100006E30(v46);
    *(void *)(a4 + 2sub_10001DDDC("did select send copy action", 4) = result;
    *(void *)a4 = v37;
    return result;
  }
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v26 = v25;
  if (v24 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v26 == v27)
  {
    uint64_t result = swift_bridgeObjectRelease_n();
    if (!a3) {
      goto LABEL_52;
    }
  }
  else
  {
    char v54 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v54 & 1) == 0 || !a3) {
      goto LABEL_52;
    }
  }
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v68 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (v68 <= a1) {
      goto LABEL_52;
    }
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a1)
  {
LABEL_52:
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    return result;
  }
  if ((a3 & 0xC000000000000001) == 0)
  {
    if (a1 < 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a1)
    {
      id v55 = (id *)*(id *)(a3 + 8 * a1 + 32);
      goto LABEL_48;
    }
    __break(1u);
    goto LABEL_61;
  }
  id v55 = (id *)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_48:
  a3 = (unint64_t)v55;
  uint64_t v17 = (id **)a4;
  if (qword_100042E90 != -1) {
LABEL_61:
  }
    swift_once();
  uint64_t v56 = type metadata accessor for Logger();
  sub_100007F84(v56, (uint64_t)qword_100044410);
  unint64_t v57 = (id *)(id)a3;
  id v58 = Logger.logObject.getter();
  os_log_type_t v59 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v58, v59))
  {
    os_log_type_t v60 = (uint8_t *)swift_slowAlloc();
    uint64_t v61 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v60 = 138412290;
    uint64_t v76 = (uint64_t)v57;
    uint64_t v62 = v57;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v61 = v57;

    _os_log_impl((void *)&_mh_execute_header, v58, v59, "Intent providing metadata: %@", v60, 0xCu);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t result = sub_100008D18(0, (unint64_t *)&unk_100043380);
  v17[3] = (id *)result;
  uint8_t *v17 = v57;
  return result;
}

id sub_100023254(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(void *__return_ptr, uint64_t, id);
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void v14[3];
  uint64_t v15;
  uint64_t vars8;

  uint64_t v5 = *(void (**)(void *__return_ptr, uint64_t, id))(a1 + 32);
  swift_retain();
  uint64_t v6 = a3;
  v5(v14, a2, v6);
  swift_release();

  uint64_t v7 = v15;
  if (v15)
  {
    uint64_t v8 = sub_10000F6FC(v14, v15);
    uint64_t v9 = *(void *)(v7 - 8);
    __chkstk_darwin(v8);
    uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_10000F740((uint64_t)v14);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t sub_1000233D0(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  long long v5 = *v1;
  *(_OWORD *)(v4 + 10sub_10001DDDC("did select send copy action", 4) = v1[1];
  *(void *)(v4 + 8) = sub_10000D378;
  *(_OWORD *)(v4 + 88) = v5;
  *(void *)(v4 + 8sub_10001DDDC("handle custom header button", 0) = a1;
  return _swift_task_switch(sub_1000200CC, 0, 0);
}

uint64_t sub_100023488@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s16SharingUIService11ShareIntentVACycfC_0();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

uint64_t sub_1000234B4(uint64_t a1)
{
  unint64_t v2 = sub_100023D14();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_1000234F0(uint64_t result, unsigned char **a2)
{
  unint64_t v2 = *a2;
  *unint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t _s16SharingUIService11ShareIntentVACycfC_0()
{
  uint64_t v0 = type metadata accessor for IntentPerson.ParameterMode();
  uint64_t v45 = *(void *)(v0 - 8);
  uint64_t v46 = v0;
  __chkstk_darwin(v0);
  uint64_t v43 = (char *)&v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for InputConnectionBehavior();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006E30(&qword_100042EA8);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v38 - v10;
  uint64_t v12 = sub_100006E30(&qword_100042EB0);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for LocalizedStringResource();
  uint64_t v48 = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_100006E30(&qword_100042EB8);
  uint64_t v19 = v18;
  LocalizedStringResource.init(stringLiteral:)();
  uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  uint64_t v54 = v16 + 56;
  v49(v14, 1, 1, v15);
  uint64_t v20 = type metadata accessor for IntentDialog();
  uint64_t v52 = v20;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  id v55 = v22;
  uint64_t v23 = v21 + 56;
  v22(v11, 1, 1, v20);
  unint64_t v41 = v9;
  v22(v9, 1, 1, v20);
  uint64_t v47 = v23;
  unsigned int v53 = enum case for InputConnectionBehavior.default(_:);
  os_log_type_t v50 = *(void (**)(char *))(v3 + 104);
  uint64_t v51 = v3 + 104;
  uint64_t v24 = v2;
  v50(v5);
  sub_100006E74();
  uint64_t v25 = v19;
  uint64_t v44 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
  uint64_t v40 = sub_100006E30(&qword_100042EC8);
  LocalizedStringResource.init(stringLiteral:)();
  uint64_t v26 = v14;
  uint64_t v27 = v14;
  uint64_t v28 = v48;
  v49(v26, 1, 1, v48);
  v55(v11, 1, 1, v52);
  (*(void (**)(char *, void, uint64_t))(v45 + 104))(v43, enum case for IntentPerson.ParameterMode.contact(_:), v46);
  uint64_t v39 = v5;
  uint64_t v29 = v24;
  uint64_t v30 = v24;
  uint64_t v42 = v24;
  os_log_type_t v31 = v50;
  ((void (*)(char *, void, uint64_t))v50)(v5, v53, v29);
  uint64_t v38 = v25;
  uint64_t v32 = v27;
  uint64_t v46 = IntentParameter<>.init(title:description:mode:requestValueDialog:inputConnectionBehavior:)();
  uint64_t v45 = sub_100006E30(&qword_100042ED0);
  LocalizedStringResource.init(stringLiteral:)();
  uint64_t v33 = v49;
  v49(v27, 1, 1, v28);
  LOBYTE(v56) = 2;
  uint64_t v34 = v52;
  unint64_t v35 = v55;
  v55(v11, 1, 1, v52);
  v35(v41, 1, 1, v34);
  uint64_t v36 = v39;
  ((void (*)(char *, void, uint64_t))v31)(v39, v53, v30);
  sub_1000074DC();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
  sub_100006E30(&qword_100042EE0);
  LocalizedStringResource.init(stringLiteral:)();
  v33(v32, 1, 1, v48);
  *(void *)&long long v56 = 0;
  v55(v11, 1, 1, v34);
  sub_100006E30(&qword_100042EE8);
  type metadata accessor for UTType();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10002BA00;
  static UTType.item.getter();
  ((void (*)(char *, void, uint64_t))v50)(v36, v53, v42);
  IntentParameter<>.init(title:description:default:supportedContentTypes:requestValueDialog:inputConnectionBehavior:)();
  return v44;
}

unint64_t sub_100023BFC()
{
  unint64_t result = qword_100044440;
  if (!qword_100044440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044440);
  }
  return result;
}

unint64_t sub_100023C54()
{
  unint64_t result = qword_100044448;
  if (!qword_100044448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044448);
  }
  return result;
}

uint64_t sub_100023CA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100023CC4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100023D14()
{
  unint64_t result = qword_100044450;
  if (!qword_100044450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044450);
  }
  return result;
}

uint64_t destroy for ShareIntent()
{
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *initializeWithCopy for ShareIntent(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ShareIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ShareIntent(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for ShareIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShareIntent(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(vsub_10001DDDC("handle collaboration options", 2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShareIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 2sub_10001DDDC("did select send copy action", 4) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 3sub_10001DDDC("handle collaboration options", 2) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 3sub_10001DDDC("handle collaboration options", 2) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShareIntent()
{
  return &type metadata for ShareIntent;
}

unint64_t sub_100023F9C()
{
  unint64_t result = qword_100044460;
  if (!qword_100044460)
  {
    sub_100008EAC(&qword_100044468);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044460);
  }
  return result;
}

void *sub_100023FF8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100006E30(&qword_100044488);
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
      unint64_t result = (void *)swift_bridgeObjectRelease();
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
        unint64_t result = (void *)swift_bridgeObjectRelease();
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
          unint64_t result = (void *)swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v1sub_10001DDDC("handle collaboration options", 2) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v1sub_10001DDDC("handle options", 1) = v7;
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

void *sub_100024228(uint64_t a1)
{
  uint64_t v2 = sub_100006E30(&qword_100043370);
  __chkstk_darwin(v2 - 8);
  v85 = (char *)&v79 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v86 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  id v7 = (char *)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  v92 = (char *)&v79 - v9;
  __chkstk_darwin(v8);
  uint64_t v84 = (char *)&v79 - v10;
  uint64_t v11 = type metadata accessor for IntentFile();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  v91 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v79 - v15;
  uint64_t v17 = sub_100006E30(&qword_100044470);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v79 - v20;
  if (!a1) {
    return &_swiftEmptyArrayStorage;
  }
  v100[0] = (uint64_t)&_swiftEmptyArrayStorage;
  uint64_t v22 = *(void *)(a1 + 16);
  uint64_t v97 = v11;
  v90 = v19;
  uint64_t v80 = v7;
  uint64_t v82 = v22;
  uint64_t v83 = a1;
  uint64_t v81 = v12;
  if (v22)
  {
    v89 = (void (**)(char *, uint64_t, uint64_t))v4;
    uint64_t v23 = v12 + 16;
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    uint64_t v25 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v94 = *(void *)(v12 + 72);
    v95 = v24;
    unint64_t v26 = v12 + 56;
    char v27 = (unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    objc_super v93 = (void (**)(char *, char *, uint64_t))(v23 + 16);
    v96 = (char *)v23;
    uint64_t v28 = (void (**)(char *, uint64_t))(v23 - 8);
    swift_bridgeObjectRetain();
    uint64_t v88 = (void (**)(char *, uint64_t))(v26 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000);
    while (1)
    {
      v95(v21, v25, v11);
      BOOL v29 = *(void (**)(char *, void, uint64_t, uint64_t))v26;
      (*(void (**)(char *, void, uint64_t, uint64_t))v26)(v21, 0, 1, v11);
      if ((*v27)(v21, 1, v11) == 1) {
        break;
      }
      v98 = v29;
      (*v93)(v16, v21, v11);
      IntentFile._itemProvider.getter();
      (*v28)(v16, v11);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v100[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v100[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      v25 += v94;
      --v22;
      uint64_t v11 = v97;
      if (!v22)
      {
        uint64_t v4 = (uint64_t)v89;
        a1 = v83;
        uint64_t v12 = v81;
        BOOL v29 = v98;
        v98(v21, 1, 1, v97);
        goto LABEL_12;
      }
    }
    uint64_t v4 = (uint64_t)v89;
    a1 = v83;
    uint64_t v12 = v81;
  }
  else
  {
    BOOL v29 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
    swift_bridgeObjectRetain();
    v29(v21, 1, 1, v11);
  }
LABEL_12:
  v98 = v29;
  swift_bridgeObjectRelease();
  uint64_t v30 = v100[0];
  unint64_t v31 = (unint64_t)v100[0] >> 62;
  if ((unint64_t)v100[0] >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v78 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v78 == 1)
    {
      swift_bridgeObjectRetain();
      if (_CocoaArrayWrapper.endIndex.getter()) {
        goto LABEL_15;
      }
      swift_bridgeObjectRelease();
    }
    char v41 = 0;
    goto LABEL_25;
  }
  if (*(void *)((v100[0] & 0xFFFFFFFFFFFFFF8) + 0x10) != 1)
  {
    char v41 = 0;
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
LABEL_15:
  if ((v30 & 0xC000000000000001) != 0)
  {
    uint64_t v32 = v12;
    id v33 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_18:
    uint64_t v34 = v33;
    swift_bridgeObjectRelease();
    id v35 = [v34 registeredTypeIdentifiers];
    uint64_t v36 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v37 = *(void *)(v36 + 16);
    swift_bridgeObjectRelease();
    if (v37 == 1)
    {
      id v38 = [v34 registeredTypeIdentifiers];
      uint64_t v39 = a1;
      uint64_t v40 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

      char v41 = sub_100022120(0xD000000000000018, 0x800000010002D840, v40);
      a1 = v39;
      swift_bridgeObjectRelease();

      uint64_t v12 = v32;
      if (v31)
      {
LABEL_25:
        swift_bridgeObjectRetain();
        uint64_t v43 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        uint64_t v42 = v82;
        if (!v43) {
          goto LABEL_31;
        }
LABEL_26:
        if ((v41 & 1) == 0)
        {
          if (qword_100042E90 != -1) {
            swift_once();
          }
          uint64_t v44 = type metadata accessor for Logger();
          sub_100007F84(v44, (uint64_t)qword_100044410);
          swift_bridgeObjectRetain_n();
          uint64_t v45 = Logger.logObject.getter();
          os_log_type_t v46 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v45, v46))
          {
            uint64_t v47 = (uint8_t *)swift_slowAlloc();
            v100[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v47 = 136315138;
            sub_100008D18(0, (unint64_t *)&qword_100044478);
            swift_bridgeObjectRetain();
            uint64_t v48 = Array.description.getter();
            unint64_t v50 = v49;
            swift_bridgeObjectRelease();
            uint64_t v99 = sub_100028E64(v48, v50, v100);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            uint64_t v51 = "Returning item providers from IntentFiles: %s";
LABEL_53:
            _os_log_impl((void *)&_mh_execute_header, v45, v46, v51, v47, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            return (void *)v30;
          }
          goto LABEL_54;
        }
LABEL_31:
        swift_bridgeObjectRelease();
        if (v42)
        {
          unsigned int v53 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
          uint64_t v52 = v12 + 16;
          uint64_t v54 = a1 + ((*(unsigned __int8 *)(v52 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 64));
          uint64_t v94 = v52 + 40;
          v95 = v53;
          objc_super v93 = *(void (***)(char *, char *, uint64_t))(v52 + 56);
          id v55 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 32);
          v96 = (char *)v52;
          uint64_t v88 = (void (**)(char *, uint64_t))(v52 - 8);
          v89 = (void (**)(char *, uint64_t, uint64_t))(v52 + 16);
          id v87 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v86 + 48);
          long long v56 = (void (**)(char *, uint64_t, uint64_t))(v86 + 32);
          swift_bridgeObjectRetain();
          long long v57 = (char *)&_swiftEmptyArrayStorage;
          uint64_t v58 = (uint64_t)v85;
          long long v59 = (void (*)(uint64_t, void, uint64_t, uint64_t))v98;
          os_log_type_t v60 = v90;
          while (1)
          {
            uint64_t v61 = v97;
            v95(v60, v54, v97);
            v59((uint64_t)v60, 0, 1, v61);
            if ((*v55)((uint64_t)v60, 1, v61) == 1) {
              break;
            }
            uint64_t v62 = v91;
            (*v89)(v91, (uint64_t)v60, v61);
            IntentFile.fileURL.getter();
            (*v88)(v62, v61);
            if ((*v87)(v58, 1, v4) == 1)
            {
              sub_10000842C(v58, &qword_100043370);
            }
            else
            {
              uint64_t v63 = *v56;
              unint64_t v64 = v84;
              (*v56)(v84, v58, v4);
              v63(v92, (uint64_t)v64, v4);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                long long v57 = (char *)sub_100028984(0, *((void *)v57 + 2) + 1, 1, (unint64_t)v57);
              }
              unint64_t v66 = *((void *)v57 + 2);
              unint64_t v65 = *((void *)v57 + 3);
              if (v66 >= v65 >> 1) {
                long long v57 = (char *)sub_100028984(v65 > 1, v66 + 1, 1, (unint64_t)v57);
              }
              *((void *)v57 + sub_10001DDDC("handle collaboration options", 2) = v66 + 1;
              v63(&v57[((*(unsigned __int8 *)(v86 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80))+ *(void *)(v86 + 72) * v66], (uint64_t)v92, v4);
              uint64_t v58 = (uint64_t)v85;
            }
            v54 += (uint64_t)v93;
            --v42;
            long long v59 = (void (*)(uint64_t, void, uint64_t, uint64_t))v98;
            if (!v42) {
              goto LABEL_43;
            }
          }
        }
        else
        {
          swift_bridgeObjectRetain();
          long long v57 = (char *)&_swiftEmptyArrayStorage;
          long long v59 = (void (*)(uint64_t, void, uint64_t, uint64_t))v98;
LABEL_43:
          v59((uint64_t)v90, 1, 1, v97);
        }
        swift_bridgeObjectRelease();
        uint64_t v67 = *((void *)v57 + 2);
        if (v67)
        {
          v100[0] = (uint64_t)&_swiftEmptyArrayStorage;
          specialized ContiguousArray.reserveCapacity(_:)();
          uint64_t v68 = *(void (**)(char *, void, uint64_t, uint64_t))(v86 + 16);
          uint64_t v69 = *(unsigned __int8 *)(v86 + 80);
          v96 = v57;
          uint64_t v70 = &v57[(v69 + 32) & ~v69];
          uint64_t v97 = *(void *)(v86 + 72);
          v98 = v68;
          id v71 = (void (**)(uint64_t, uint64_t))(v86 + 8);
          uint64_t v72 = (uint64_t)v80;
          do
          {
            ((void (*)(uint64_t, char *, uint64_t))v98)(v72, v70, v4);
            sub_1000221E8(v72, &v99);
            (*v71)(v72, v4);
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
            specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized ContiguousArray._endMutation()();
            v70 += v97;
            --v67;
          }
          while (v67);
          uint64_t v30 = v100[0];
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v30 = (uint64_t)&_swiftEmptyArrayStorage;
        }
        if (qword_100042E90 != -1) {
          swift_once();
        }
        uint64_t v73 = type metadata accessor for Logger();
        sub_100007F84(v73, (uint64_t)qword_100044410);
        swift_bridgeObjectRetain_n();
        uint64_t v45 = Logger.logObject.getter();
        os_log_type_t v46 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v45, v46))
        {
          uint64_t v47 = (uint8_t *)swift_slowAlloc();
          v100[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v47 = 136315138;
          sub_100008D18(0, (unint64_t *)&qword_100044478);
          swift_bridgeObjectRetain();
          uint64_t v74 = Array.description.getter();
          unint64_t v76 = v75;
          swift_bridgeObjectRelease();
          uint64_t v99 = sub_100028E64(v74, v76, v100);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          uint64_t v51 = "Did not find item providers on Intent File using synthesized item providers: %s";
          goto LABEL_53;
        }
LABEL_54:

        swift_bridgeObjectRelease_n();
        return (void *)v30;
      }
    }
    else
    {

      char v41 = 0;
      uint64_t v12 = v32;
      if (v31) {
        goto LABEL_25;
      }
    }
LABEL_22:
    uint64_t v42 = v82;
    if (!*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_31;
    }
    goto LABEL_26;
  }
  if (*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v32 = v12;
    id v33 = *(id *)(v30 + 32);
    goto LABEL_18;
  }
  __break(1u);
  (*(void (**)(char *, uint64_t))v12)(v21, v4);
  unint64_t result = (void *)swift_release();
  __break(1u);
  return result;
}

uint64_t sub_100024EB0()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100024F40(void (*a1)(char *, uint64_t, void), uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100022714(a1, a2, v6);
}

uint64_t sub_100024FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 3sub_10001DDDC("handle collaboration options", 2) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_10001DDDC("handle custom header button", 0) = v2;
  return swift_retain();
}

uint64_t sub_100024FD4()
{
  return swift_release();
}

uint64_t sub_100024FDC(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  sub_100006E30(&qword_100043370);
  v2[6] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for URL();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for IntentFile();
  v2[12] = v4;
  v2[13] = *(void *)(v4 - 8);
  v2[14] = swift_task_alloc();
  sub_100006E30(&qword_100044470);
  v2[15] = swift_task_alloc();
  return _swift_task_switch(sub_100025174, 0, 0);
}

uint64_t sub_100025174()
{
  v0[2] = &_swiftEmptyArrayStorage;
  unint64_t v1 = v0[4];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    v0[16] = v2;
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v0[16] = v2;
    if (v2)
    {
LABEL_3:
      if (v2 >= 1)
      {
        uint64_t v3 = v0[4];
        v0[17] = 0;
        if ((v3 & 0xC000000000000001) != 0) {
          id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v4 = *(id *)(v3 + 32);
        }
        v0[18] = v4;
        uint64_t v5 = (void *)swift_task_alloc();
        v0[19] = v5;
        void *v5 = v0;
        v5[1] = sub_10002577C;
        return sub_1000128C8();
      }
      __break(1u);
      goto LABEL_36;
    }
  }
  swift_bridgeObjectRelease();
  if ((unint64_t)&_swiftEmptyArrayStorage >> 62)
  {
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  uint64_t v7 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_13:
  if (!v7)
  {
    IntentParameter.wrappedValue.getter();
    uint64_t v8 = v0[3];
    uint64_t v9 = *(void *)(v8 + 16);
    uint64_t v10 = v0[13];
    if (v9)
    {
      uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
      uint64_t v11 = v10 + 16;
      id v55 = v12;
      uint64_t v13 = v8 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
      uint64_t v52 = *(void *)(v11 + 56);
      unsigned int v53 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 32);
      unint64_t v50 = (void (**)(uint64_t, uint64_t))(v11 - 8);
      uint64_t v51 = (void (**)(uint64_t, void, uint64_t))(v11 + 16);
      uint64_t v49 = v0[8];
      swift_bridgeObjectRetain();
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v54 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 40);
      uint64_t v15 = (void (**)(char *, char *, uint64_t))(v49 + 32);
      while (1)
      {
        uint64_t v16 = v0[15];
        uint64_t v17 = v0[12];
        v55(v16, v13, v17);
        uint64_t v18 = *v54;
        (*v54)(v16, 0, 1, v17);
        if ((*v53)(v16, 1, v17) == 1) {
          break;
        }
        unint64_t v19 = (unint64_t)v14;
        uint64_t v20 = v0[14];
        uint64_t v21 = v0[12];
        uint64_t v23 = v0[6];
        uint64_t v22 = v0[7];
        (*v51)(v20, v0[15], v21);
        IntentFile.fileURL.getter();
        (*v50)(v20, v21);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v23, 1, v22) == 1)
        {
          sub_10000842C(v0[6], &qword_100043370);
          uint64_t v14 = (char *)v19;
        }
        else
        {
          uint64_t v25 = (char *)v0[10];
          uint64_t v24 = (char *)v0[11];
          uint64_t v26 = v0[7];
          char v27 = *v15;
          (*v15)(v24, (char *)v0[6], v26);
          v27(v25, v24, v26);
          uint64_t v14 = (char *)v19;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v14 = (char *)sub_100028984(0, *(void *)(v19 + 16) + 1, 1, v19);
          }
          unint64_t v29 = *((void *)v14 + 2);
          unint64_t v28 = *((void *)v14 + 3);
          if (v29 >= v28 >> 1) {
            uint64_t v14 = (char *)sub_100028984(v28 > 1, v29 + 1, 1, (unint64_t)v14);
          }
          uint64_t v30 = (char *)v0[10];
          uint64_t v31 = v0[7];
          *((void *)v14 + sub_10001DDDC("handle collaboration options", 2) = v29 + 1;
          v27(&v14[((*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80))+ *(void *)(v49 + 72) * v29], v30, v31);
        }
        v13 += v52;
        if (!--v9)
        {
          v18(v0[15], 1, 1, v0[12]);
          break;
        }
      }
    }
    else
    {
      uint64_t v32 = *(void (**)(void, uint64_t, uint64_t, void))(v10 + 56);
      swift_bridgeObjectRetain();
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage;
      v32(v0[15], 1, 1, v0[12]);
    }
    swift_bridgeObjectRelease_n();
    uint64_t v33 = *((void *)v14 + 2);
    if (v33)
    {
      uint64_t v34 = v0[8];
      specialized ContiguousArray.reserveCapacity(_:)();
      uint64_t v36 = *(void (**)(uint64_t, char *, uint64_t))(v34 + 16);
      uint64_t v35 = v34 + 16;
      long long v56 = v36;
      uint64_t v37 = &v14[(*(unsigned __int8 *)(v35 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 64)];
      uint64_t v38 = *(void *)(v35 + 56);
      do
      {
        uint64_t v39 = v0[9];
        uint64_t v40 = v0[7];
        v56(v39, v37, v40);
        id v41 = [objc_allocWithZone((Class)LPLinkMetadata) init];
        URL._bridgeToObjectiveC()(v42);
        uint64_t v44 = v43;
        [v41 setOriginalURL:v43];

        URL._bridgeToObjectiveC()(v45);
        uint64_t v47 = v46;
        [v41 setURL:v46];

        (*(void (**)(uint64_t, uint64_t))(v35 - 8))(v39, v40);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        v37 += v38;
        --v33;
      }
      while (v33);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v48 = (uint64_t (*)(void *))v0[1];
  return v48(&_swiftEmptyArrayStorage);
}

uint64_t sub_10002577C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 16sub_10001DDDC("handle custom header button", 0) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10002587C, 0, 0);
}

uint64_t sub_10002587C()
{
  uint64_t v1 = (void *)v0[20];
  if (v1)
  {
    id v2 = v1;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v0[2] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v0[2] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    uint64_t v3 = (void *)v0[18];
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
  }
  else
  {
    uint64_t v3 = (void *)v0[18];
  }

  uint64_t v4 = v0[17] + 1;
  if (v4 == v0[16])
  {
    swift_bridgeObjectRelease();
    unint64_t v5 = v0[2];
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v51 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v51) {
        goto LABEL_9;
      }
    }
    else if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_9:
      IntentParameter.wrappedValue.getter();
      uint64_t v6 = v0[3];
      uint64_t v7 = *(void *)(v6 + 16);
      uint64_t v8 = v0[13];
      if (v7)
      {
        uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
        uint64_t v9 = v8 + 16;
        uint64_t v58 = v10;
        uint64_t v11 = v6 + ((*(unsigned __int8 *)(v9 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 64));
        uint64_t v55 = *(void *)(v9 + 56);
        long long v56 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);
        unsigned int v53 = (void (**)(uint64_t, uint64_t))(v9 - 8);
        uint64_t v54 = (void (**)(uint64_t, void, uint64_t))(v9 + 16);
        uint64_t v52 = v0[8];
        swift_bridgeObjectRetain();
        uint64_t v12 = (char *)&_swiftEmptyArrayStorage;
        uint64_t v57 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 40);
        uint64_t v13 = (void (**)(char *, char *, uint64_t))(v52 + 32);
        while (1)
        {
          uint64_t v14 = v0[15];
          uint64_t v15 = v0[12];
          v58(v14, v11, v15);
          uint64_t v16 = *v57;
          (*v57)(v14, 0, 1, v15);
          if ((*v56)(v14, 1, v15) == 1) {
            break;
          }
          unint64_t v17 = (unint64_t)v12;
          uint64_t v18 = v0[14];
          uint64_t v19 = v0[12];
          uint64_t v21 = v0[6];
          uint64_t v20 = v0[7];
          (*v54)(v18, v0[15], v19);
          IntentFile.fileURL.getter();
          (*v53)(v18, v19);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v21, 1, v20) == 1)
          {
            sub_10000842C(v0[6], &qword_100043370);
            uint64_t v12 = (char *)v17;
          }
          else
          {
            uint64_t v23 = (char *)v0[10];
            uint64_t v22 = (char *)v0[11];
            uint64_t v24 = v0[7];
            uint64_t v25 = *v13;
            (*v13)(v22, (char *)v0[6], v24);
            v25(v23, v22, v24);
            uint64_t v12 = (char *)v17;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v12 = (char *)sub_100028984(0, *(void *)(v17 + 16) + 1, 1, v17);
            }
            unint64_t v27 = *((void *)v12 + 2);
            unint64_t v26 = *((void *)v12 + 3);
            if (v27 >= v26 >> 1) {
              uint64_t v12 = (char *)sub_100028984(v26 > 1, v27 + 1, 1, (unint64_t)v12);
            }
            unint64_t v28 = (char *)v0[10];
            uint64_t v29 = v0[7];
            *((void *)v12 + sub_10001DDDC("handle collaboration options", 2) = v27 + 1;
            v25(&v12[((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80))+ *(void *)(v52 + 72) * v27], v28, v29);
          }
          v11 += v55;
          if (!--v7)
          {
            v16(v0[15], 1, 1, v0[12]);
            break;
          }
        }
      }
      else
      {
        uint64_t v34 = *(void (**)(void, uint64_t, uint64_t, void))(v8 + 56);
        swift_bridgeObjectRetain();
        uint64_t v12 = (char *)&_swiftEmptyArrayStorage;
        v34(v0[15], 1, 1, v0[12]);
      }
      swift_bridgeObjectRelease_n();
      uint64_t v35 = *((void *)v12 + 2);
      if (v35)
      {
        uint64_t v36 = v0[8];
        specialized ContiguousArray.reserveCapacity(_:)();
        uint64_t v38 = *(void (**)(uint64_t, char *, uint64_t))(v36 + 16);
        uint64_t v37 = v36 + 16;
        long long v59 = v38;
        uint64_t v39 = &v12[(*(unsigned __int8 *)(v37 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 64)];
        uint64_t v40 = *(void *)(v37 + 56);
        do
        {
          uint64_t v41 = v0[9];
          uint64_t v42 = v0[7];
          v59(v41, v39, v42);
          id v43 = [objc_allocWithZone((Class)LPLinkMetadata) init];
          URL._bridgeToObjectiveC()(v44);
          os_log_type_t v46 = v45;
          [v43 setOriginalURL:v45];

          URL._bridgeToObjectiveC()(v47);
          uint64_t v49 = v48;
          [v43 setURL:v48];

          (*(void (**)(uint64_t, uint64_t))(v37 - 8))(v41, v42);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          v39 += v40;
          --v35;
        }
        while (v35);
        unint64_t v5 = (unint64_t)&_swiftEmptyArrayStorage;
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        unint64_t v5 = (unint64_t)&_swiftEmptyArrayStorage;
      }
      swift_bridgeObjectRelease();
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v50 = (uint64_t (*)(unint64_t))v0[1];
    return v50(v5);
  }
  v0[17] = v4;
  uint64_t v30 = v0[4];
  if ((v30 & 0xC000000000000001) != 0) {
    id v31 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else {
    id v31 = *(id *)(v30 + 8 * v4 + 32);
  }
  v0[18] = v31;
  uint64_t v32 = (void *)swift_task_alloc();
  v0[19] = v32;
  *uint64_t v32 = v0;
  v32[1] = sub_10002577C;
  return sub_1000128C8();
}

uint64_t sub_100025EB0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100025F08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10002285C(a1, *(id ***)(v2 + 32), *(void *)(v2 + 48), a2);
}

uint64_t sub_100025F18()
{
  swift_release();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100025F50()
{
  if (*(void *)(v0 + 16)) {
    return dispatch thunk of SFRemoteAlertPresentationHandle.dismiss(animated:completion:)();
  }
  return result;
}

uint64_t sub_100025F84()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100025FCC()
{
  return sub_100021764(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_100025FD8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100026030()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100026080(uint64_t a1)
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
  v10[1] = sub_10000D378;
  return sub_1000218B0(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t ShareTransportQuery.init()()
{
  return IntentParameterDependency.__allocating_init<A, B>(_:)();
}

uint64_t sub_1000261A8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000093C4(v0, qword_1000444D0);
  uint64_t v1 = sub_100007F84(v0, (uint64_t)qword_1000444D0);
  if (qword_100042E40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100007F84(v0, (uint64_t)qword_100045D48);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t ShareTransportQuery.shareIntent.getter()
{
  return IntentParameterDependency.wrappedValue.getter();
}

uint64_t sub_100026294@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = IntentParameter.projectedValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000262C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = IntentParameter.projectedValue.getter();
  *a1 = result;
  return result;
}

uint64_t ShareTransportQuery.entities(for:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 6sub_10001DDDC("did select send copy action", 4) = a2;
  return _swift_task_switch(sub_10002630C, 0, 0);
}

uint64_t sub_10002630C()
{
  uint64_t v15 = v0;
  if (qword_100042EA0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[9] = sub_100007F84(v1, (uint64_t)qword_1000444D0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v5 = Array.description.getter();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    v0[6] = sub_100028E64(v5, v7, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Querying for entities with identifiers %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  id v8 = sub_100026CDC();
  v0[10] = v8;
  if (v8)
  {
    uint64_t v9 = qword_100042E68;
    id v10 = v8;
    if (v9 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_100045D90;
    return _swift_task_switch(sub_1000265C0, v11, 0);
  }
  else
  {
    uint64_t v12 = (uint64_t (*)(_UNKNOWN **))v0[1];
    return v12(&off_100039618);
  }
}

uint64_t sub_1000265C0()
{
  uint64_t v1 = *(void *)(v0 + 80);
  type metadata accessor for ShareTransportEntitiesProvider();
  uint64_t v2 = (void *)swift_allocObject();
  *(void *)(v0 + 88) = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[2] = v1;
  return _swift_task_switch(sub_100026644, 0, 0);
}

uint64_t sub_100026644()
{
  v0[2] = v0[7];
  uint64_t v1 = (void *)swift_task_alloc();
  v0[12] = v1;
  uint64_t v2 = sub_100006E30(&qword_100044500);
  uint64_t v3 = sub_100006E30(&qword_100044508);
  unint64_t v4 = sub_1000270EC();
  void *v1 = v0;
  v1[1] = sub_100026734;
  uint64_t v5 = v0[11];
  return Sequence.asyncMap<A>(_:)(&unk_1000444F8, v5, v2, v3, v4);
}

uint64_t sub_100026734(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 10sub_10001DDDC("did select send copy action", 4) = a1;
  *(void *)(v3 + 11sub_10001DDDC("handle collaboration options", 2) = v1;
  swift_task_dealloc();
  if (v1) {
    unint64_t v4 = sub_100026C74;
  }
  else {
    unint64_t v4 = sub_100026848;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100026848()
{
  uint64_t v37 = v0;
  uint64_t v1 = *(void *)(v0[13] + 16);
  if (v1)
  {
    uint64_t v2 = (uint64_t *)(swift_bridgeObjectRetain() + 48);
    uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      uint64_t v5 = *(v2 - 1);
      if (v5)
      {
        uint64_t v6 = v2[5];
        uint64_t v34 = *(v2 - 2);
        uint64_t v35 = v2[4];
        uint64_t v8 = v2[2];
        uint64_t v7 = v2[3];
        uint64_t v9 = *v2;
        uint64_t v10 = v2[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v3 = sub_100028BEC(0, *((void *)v3 + 2) + 1, 1, v3);
        }
        unint64_t v12 = *((void *)v3 + 2);
        unint64_t v11 = *((void *)v3 + 3);
        uint64_t v13 = v3;
        if (v12 >= v11 >> 1) {
          uint64_t v13 = sub_100028BEC((char *)(v11 > 1), v12 + 1, 1, v3);
        }
        *((void *)v13 + sub_10001DDDC("handle collaboration options", 2) = v12 + 1;
        uint64_t v3 = v13;
        unint64_t v4 = &v13[64 * v12];
        *((void *)v4 + sub_10001DDDC("did select send copy action", 4) = v34;
        *((void *)v4 + sub_10001DDDC("handle close", 5) = v5;
        *((void *)v4 + 6) = v9;
        *((void *)v4 + sub_10001DDDC("handle next button", 7) = v10;
        *((void *)v4 + 8) = v8;
        *((void *)v4 + 9) = v7;
        *((void *)v4 + 1sub_10001DDDC("handle custom header button", 0) = v35;
        *((void *)v4 + 1sub_10001DDDC("handle options", 1) = v6;
      }
      v2 += 8;
      --v1;
    }
    while (v1);
    uint64_t v0 = *(void **)type;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v14 = (void *)v0[10];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  id v15 = v14;
  swift_bridgeObjectRetain_n();
  id v16 = v15;
  unint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v20 = (void *)v0[10];
  if (v19)
  {
    os_log_type_t typea = v18;
    uint64_t v21 = swift_slowAlloc();
    id v31 = (void *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v22 = Array.description.getter();
    unint64_t v24 = v23;
    swift_bridgeObjectRelease();
    v0[3] = sub_100028E64(v22, v24, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 1sub_10001DDDC("handle collaboration options", 2) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v25 = Array.description.getter();
    unint64_t v27 = v26;
    swift_bridgeObjectRelease();
    v0[4] = sub_100028E64(v25, v27, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 2sub_10001DDDC("handle collaboration options", 2) = 2112;
    v0[5] = v20;
    id v28 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v31 = v20;

    _os_log_impl((void *)&_mh_execute_header, v17, typea, "Query found entities %s for identifiers %s and configuration %@", (uint8_t *)v21, 0x20u);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release();
  }
  uint64_t v29 = (uint64_t (*)(char *))v0[1];
  return v29(v3);
}

uint64_t sub_100026C74()
{
  uint64_t v1 = *(void **)(v0 + 80);
  swift_release();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

id sub_100026CDC()
{
  if (!IntentParameterDependency.wrappedValue.getter()) {
    return 0;
  }
  swift_getKeyPath();
  sub_100029AC4(&qword_100044588, &qword_100044590, (void (*)(void))sub_100029B30);
  IntentProjection.subscript.getter();
  swift_release();
  swift_release();
  sub_100024228(v4);
  swift_bridgeObjectRelease();
  id v0 = objc_allocWithZone((Class)UIActivityItemsConfiguration);
  sub_100029B88();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithItemProviders:isa];

  return v2;
}

uint64_t sub_100026DF4(uint64_t a1, uint64_t *a2)
{
  *(void *)(v2 + 8sub_10001DDDC("handle custom header button", 0) = a1;
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 88) = v5;
  void *v5 = v2;
  v5[1] = sub_100026EA8;
  return sub_10000AFD4(v2 + 16, v3, v4);
}

uint64_t sub_100026EA8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return _swift_task_switch(sub_100026FD8, 0, 0);
  }
}

uint64_t sub_100026FD8()
{
  sub_1000299E4(v0 + 16, *(void *)(v0 + 80));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100027040(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000D378;
  return sub_100026DF4(a1, a2);
}

unint64_t sub_1000270EC()
{
  unint64_t result = qword_100044510;
  if (!qword_100044510)
  {
    sub_100008EAC(&qword_100044500);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044510);
  }
  return result;
}

uint64_t ShareTransportQuery.suggestedEntities()(uint64_t a1)
{
  *(void *)(v1 + 3sub_10001DDDC("handle collaboration options", 2) = a1;
  return _swift_task_switch(sub_100027168, 0, 0);
}

uint64_t sub_100027168()
{
  if (qword_100042EA0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[5] = sub_100007F84(v1, (uint64_t)qword_1000444D0);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Querying for supported entities", v4, 2u);
    swift_slowDealloc();
  }

  id v5 = sub_100026CDC();
  v0[6] = v5;
  if (v5)
  {
    uint64_t v6 = qword_100042E68;
    id v7 = v5;
    if (v6 != -1) {
      swift_once();
    }
    uint64_t v8 = qword_100045D90;
    return _swift_task_switch(sub_100027314, v8, 0);
  }
  else
  {
    uint64_t v9 = (uint64_t (*)(_UNKNOWN **))v0[1];
    return v9(&off_100039678);
  }
}

uint64_t sub_100027314()
{
  uint64_t v1 = v0[6];
  type metadata accessor for ShareTransportEntitiesProvider();
  uint64_t v2 = (void *)swift_allocObject();
  v0[7] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[2] = v1;
  os_log_type_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  *os_log_type_t v3 = v0;
  v3[1] = sub_1000273C8;
  return sub_10000AA10();
}

uint64_t sub_1000273C8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 7sub_10001DDDC("handle collaboration options", 2) = a1;
  *(void *)(v3 + 8sub_10001DDDC("handle custom header button", 0) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_10002775C;
  }
  else {
    uint64_t v4 = sub_1000274DC;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000274DC()
{
  uint64_t v17 = v0;
  id v1 = *(id *)(v0 + 48);
  swift_bridgeObjectRetain_n();
  id v2 = v1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void **)(v0 + 48);
    uint64_t v6 = swift_slowAlloc();
    id v15 = (void *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v7 = Array.description.getter();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 16) = sub_100028E64(v7, v9, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 1sub_10001DDDC("handle collaboration options", 2) = 2112;
    *(void *)(v0 + 2sub_10001DDDC("did select send copy action", 4) = v5;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v15 = v5;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Query found entities %s for configuration %@", (uint8_t *)v6, 0x16u);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_release();
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 48);
    swift_bridgeObjectRelease_n();
    swift_release();
  }
  uint64_t v12 = *(void *)(v0 + 72);
  uint64_t v13 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v13(v12);
}

uint64_t sub_10002775C()
{
  id v1 = *(void **)(v0 + 48);
  swift_release();

  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t ShareTransportQuery.entities(matching:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[15] = a2;
  v3[16] = a3;
  v3[14] = a1;
  return _swift_task_switch(sub_1000277E8, 0, 0);
}

uint64_t sub_1000277E8()
{
  id v15 = v0;
  if (qword_100042EA0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[17] = sub_100007F84(v1, (uint64_t)qword_1000444D0);
  swift_bridgeObjectRetain_n();
  id v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[15];
  if (v4)
  {
    uint64_t v6 = v0[14];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[13] = sub_100028E64(v6, v5, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Querying for entity matching string %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  id v8 = sub_100026CDC();
  v0[18] = v8;
  if (v8)
  {
    uint64_t v9 = qword_100042E68;
    id v10 = v8;
    if (v9 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_100045D90;
    return _swift_task_switch(sub_100027A78, v11, 0);
  }
  else
  {
    uint64_t v12 = (uint64_t (*)(_UNKNOWN **))v0[1];
    return v12(&off_1000396D8);
  }
}

uint64_t sub_100027A78()
{
  uint64_t v1 = v0[18];
  type metadata accessor for ShareTransportEntitiesProvider();
  id v2 = (void *)swift_allocObject();
  v2[3] = 0;
  v2[4] = 0;
  v2[2] = v1;
  uint64_t v3 = qword_100045D90;
  v0[19] = v2;
  v0[20] = v3;
  BOOL v4 = (void *)swift_task_alloc();
  v0[21] = v4;
  *BOOL v4 = v0;
  v4[1] = sub_100027B34;
  return sub_10000AA10();
}

uint64_t sub_100027B34(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[22] = a1;
  v3[23] = v1;
  swift_task_dealloc();
  if (v1)
  {
    BOOL v4 = sub_100027DEC;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = v3[20];
    BOOL v4 = sub_100027C50;
  }
  return _swift_task_switch(v4, v5, 0);
}

uint64_t sub_100027C50()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[22];
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    id v15 = v0;
    BOOL v4 = (uint64_t *)(v2 + 48);
    while (1)
    {
      unint64_t v6 = *(v4 - 2);
      unint64_t v5 = *(v4 - 1);
      uint64_t v8 = *v4;
      unint64_t v7 = v4[1];
      unint64_t v10 = v4[2];
      unint64_t v9 = v4[3];
      unint64_t v11 = v4[4];
      unint64_t v12 = v4[5];
      if (v11 == v15[14] && v12 == v15[15]) {
        break;
      }
      if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
        goto LABEL_13;
      }
      v4 += 8;
      if (!--v3)
      {
        unint64_t v6 = 0xD00000000000002ALL;
        uint64_t v1 = v15;
        goto LABEL_11;
      }
    }
    unint64_t v11 = v15[14];
    unint64_t v12 = v15[15];
LABEL_13:
    uint64_t v1 = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v6 = 0xD00000000000002ALL;
LABEL_11:
    swift_bridgeObjectRelease();
    unint64_t v5 = 0x800000010002CAC0;
    uint64_t v8 = 0x725420796D6D7544;
    unint64_t v7 = 0xEF74726F70736E61;
    unint64_t v10 = 0xD00000000000002ALL;
    unint64_t v9 = 0x800000010002CAC0;
    unint64_t v11 = 0xD00000000000002ALL;
    unint64_t v12 = 0x800000010002CAC0;
  }
  v1[26] = v9;
  v1[27] = v12;
  v1[24] = v5;
  v1[25] = v7;
  v1[2] = v6;
  v1[3] = v5;
  v1[4] = v8;
  v1[5] = v7;
  v1[6] = v10;
  v1[7] = v9;
  v1[8] = v11;
  v1[9] = v12;
  return _swift_task_switch(sub_100027E54, 0, 0);
}

uint64_t sub_100027DEC()
{
  uint64_t v1 = *(void **)(v0 + 144);
  swift_release();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100027E54()
{
  uint64_t v27 = v0;
  uint64_t v1 = *(void **)(v0 + 144);
  swift_bridgeObjectRetain_n();
  id v2 = v1;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v3 = v2;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    log = v4;
    unint64_t v24 = *(void **)(v0 + 144);
    unint64_t v20 = *(void *)(v0 + 120);
    uint64_t v21 = *(void *)(v0 + 112);
    uint64_t v6 = swift_slowAlloc();
    unint64_t v23 = (void *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315650;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    os_log_type_t type = v5;
    uint64_t v7 = ShareTransportEntity.description.getter();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 8sub_10001DDDC("handle custom header button", 0) = sub_100028E64(v7, v9, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 1sub_10001DDDC("handle collaboration options", 2) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 88) = sub_100028E64(v21, v20, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 2sub_10001DDDC("handle collaboration options", 2) = 2112;
    *(void *)(v0 + 96) = v24;
    id v10 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v23 = v24;

    _os_log_impl((void *)&_mh_execute_header, log, type, "Query found entity %s matching string %s and configuration %@", (uint8_t *)v6, 0x20u);
    sub_100006E30(&qword_100043250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    unint64_t v11 = *(void **)(v0 + 144);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  unint64_t v12 = *(void **)(v0 + 144);
  sub_100006E30((uint64_t *)&unk_100043DD0);
  uint64_t v13 = (_OWORD *)swift_allocObject();
  long long v14 = *(_OWORD *)(v0 + 16);
  long long v15 = *(_OWORD *)(v0 + 32);
  v13[1] = xmmword_10002BA00;
  v13[2] = v14;
  long long v16 = *(_OWORD *)(v0 + 48);
  long long v17 = *(_OWORD *)(v0 + 64);
  v13[3] = v15;
  v13[4] = v16;
  v13[5] = v17;
  swift_release();

  uint64_t v18 = *(uint64_t (**)(_OWORD *))(v0 + 8);
  return v18(v13);
}

uint64_t ShareTransportQuery.defaultResult()(uint64_t a1)
{
  *(void *)a1 = 0xD00000000000002ALL;
  *(void *)(a1 + 8) = 0x800000010002CAC0;
  *(_OWORD *)(a1 + 16) = xmmword_10002C100;
  *(void *)(a1 + 3sub_10001DDDC("handle collaboration options", 2) = 0xD00000000000002ALL;
  *(void *)(a1 + 4sub_10001DDDC("handle custom header button", 0) = 0x800000010002CAC0;
  *(void *)(a1 + 48) = 0xD00000000000002ALL;
  *(void *)(a1 + 56) = 0x800000010002CAC0;
  return sub_100028F38(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_1000282A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 16) = a1;
  uint64_t v7 = *v3;
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 2sub_10001DDDC("did select send copy action", 4) = v8;
  void *v8 = v4;
  v8[1] = sub_100028364;
  v8[15] = a3;
  v8[16] = v7;
  v8[14] = a2;
  return _swift_task_switch(sub_1000277E8, 0, 0);
}

uint64_t sub_100028364(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t sub_100028474@<X0>(uint64_t *a1@<X8>)
{
  sub_100006E30(&qword_100042EF0);
  swift_getKeyPath();
  uint64_t result = IntentParameterDependency.__allocating_init<A, B>(_:)();
  *a1 = result;
  return result;
}

uint64_t sub_1000284B8(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100028568;
  v5[7] = a1;
  v5[8] = v4;
  return _swift_task_switch(sub_10002630C, 0, 0);
}

uint64_t sub_100028568(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100028668(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 2sub_10001DDDC("did select send copy action", 4) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100029BC8;
  v4[4] = v3;
  return _swift_task_switch(sub_100027168, 0, 0);
}

uint64_t sub_100028718(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100009EDC();
  void *v5 = v2;
  v5[1] = sub_10000D378;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_1000287CC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000287EC, 0, 0);
}

uint64_t sub_1000287EC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)uint64_t v1 = 0xD00000000000002ALL;
  *(void *)(v1 + 8) = 0x800000010002CAC0;
  *(_OWORD *)(v1 + 16) = xmmword_10002C100;
  *(void *)(v1 + 3sub_10001DDDC("handle collaboration options", 2) = 0xD00000000000002ALL;
  *(void *)(v1 + 4sub_10001DDDC("handle custom header button", 0) = 0x800000010002CAC0;
  *(void *)(v1 + 48) = 0xD00000000000002ALL;
  *(void *)(v1 + 56) = 0x800000010002CAC0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100028838(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

char *sub_100028874(char *result, int64_t a2, char a3, char *a4)
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
      sub_100006E30(&qword_100043DC0);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + sub_10001DDDC("handle collaboration options", 2) = v8;
      *((void *)v10 + sub_10001DDDC("did select collaborative action", 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + sub_10001DDDC("handle collaboration options", 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100029630(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100028984(char a1, int64_t a2, char a3, unint64_t a4)
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
  sub_100006E30(&qword_1000445A0);
  uint64_t v10 = *(void *)(type metadata accessor for URL() - 8);
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
  uint64_t v16 = *(void *)(type metadata accessor for URL() - 8);
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
    sub_10002973C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

char *sub_100028BEC(char *result, int64_t a2, char a3, char *a4)
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
      sub_100006E30((uint64_t *)&unk_100043DD0);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 31;
      }
      *((void *)v10 + sub_10001DDDC("handle collaboration options", 2) = v8;
      *((void *)v10 + sub_10001DDDC("did select collaborative action", 3) = 2 * (v12 >> 6);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[64 * v8 + 32]) {
          memmove(v13, a4 + 32, v8 << 6);
        }
        *((void *)a4 + sub_10001DDDC("handle collaboration options", 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100029894(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unsigned char **sub_100028CFC(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_100028D0C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_100028DC4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100028DEC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100028E64(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100028E64(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000290AC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100029988((uint64_t)v12, *a3);
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
      sub_100029988((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000F740((uint64_t)v12);
  return v7;
}

uint64_t sub_100028F38(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t sub_100028F44()
{
  unint64_t result = qword_100044538;
  if (!qword_100044538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044538);
  }
  return result;
}

unint64_t sub_100028F9C()
{
  unint64_t result = qword_100044540[0];
  if (!qword_100044540[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100044540);
  }
  return result;
}

unint64_t sub_100028FF8()
{
  unint64_t result = qword_100044558;
  if (!qword_100044558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044558);
  }
  return result;
}

uint64_t sub_10002904C()
{
  return sub_100029AC4(&qword_100044560, qword_100044568, (void (*)(void))sub_10000A08C);
}

ValueMetadata *type metadata accessor for ShareTransportQuery()
{
  return &type metadata for ShareTransportQuery;
}

uint64_t sub_1000290AC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100029268(a5, a6);
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

uint64_t sub_100029268(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100029300(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000294E0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000294E0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + vsub_10001DDDC("did select send copy action", 4) = 0;
  return v2;
}

void *sub_100029300(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100029478(v2, 0);
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

void *sub_100029478(uint64_t a1, uint64_t a2)
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
  sub_100006E30(&qword_100044580);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  id v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000294E0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006E30(&qword_100044580);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + sub_10001DDDC("handle collaboration options", 2) = v8;
    *((void *)v10 + sub_10001DDDC("did select collaborative action", 3) = 2 * v11 - 64;
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
    *((void *)a4 + sub_10001DDDC("handle collaboration options", 2) = 0;
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

uint64_t sub_100029630(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100006E30(&qword_100043DB8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002973C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for URL() - 8);
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

uint64_t sub_100029894(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + (a1 << 6) + 32;
    unint64_t v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100029988(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 2sub_10001DDDC("did select send copy action", 4) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000299E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006E30(&qword_100044508);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100029A4C@<X0>(void *a1@<X8>)
{
  uint64_t result = IntentParameter.wrappedValue.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_100029A88()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100029AC4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008EAC(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100029B30()
{
  unint64_t result = qword_100044598;
  if (!qword_100044598)
  {
    type metadata accessor for IntentFile();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044598);
  }
  return result;
}

unint64_t sub_100029B88()
{
  unint64_t result = qword_100044478;
  if (!qword_100044478)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100044478);
  }
  return result;
}

uint64_t sub_100029BCC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static AppIntent.openAppWhenRun.getter()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t static AppIntent.description.getter()
{
  return static AppIntent.description.getter();
}

uint64_t static AppIntent.isDiscoverable.getter()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t static AppIntent.parameterSummary.getter()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t static AppIntent.authenticationPolicy.getter()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t IntentFile._itemProvider.getter()
{
  return IntentFile._itemProvider.getter();
}

uint64_t IntentFile.fileURL.getter()
{
  return IntentFile.fileURL.getter();
}

uint64_t type metadata accessor for IntentFile()
{
  return type metadata accessor for IntentFile();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t type metadata accessor for IntentPerson.ParameterMode()
{
  return type metadata accessor for IntentPerson.ParameterMode();
}

uint64_t type metadata accessor for IntentPerson()
{
  return type metadata accessor for IntentPerson();
}

uint64_t static IntentResult.result<>()()
{
  return static IntentResult.result<>()();
}

uint64_t IntentParameter.wrappedValue.modify()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t IntentParameter.wrappedValue.getter()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t IntentParameter.wrappedValue.setter()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t IntentParameter.projectedValue.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(title:description:default:supportedContentTypes:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:supportedContentTypes:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(title:description:mode:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:mode:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentProjection.subscript.getter()
{
  return IntentProjection.subscript.getter();
}

uint64_t type metadata accessor for DisplayRepresentation.Image()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:)()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t type metadata accessor for DisplayRepresentation()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t static DynamicOptionsProvider.useForParameterResolution.getter()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t static PersistentlyIdentifiable.persistentIdentifier.getter()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t IntentParameterDependency.wrappedValue.getter()
{
  return IntentParameterDependency.wrappedValue.getter();
}

uint64_t IntentParameterDependency.__allocating_init<A, B>(_:)()
{
  return IntentParameterDependency.__allocating_init<A, B>(_:)();
}

uint64_t TypeDisplayRepresentation.init(stringLiteral:)()
{
  return TypeDisplayRepresentation.init(stringLiteral:)();
}

uint64_t type metadata accessor for TypeDisplayRepresentation()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t URLResourceValues.typeIdentifier.getter()
{
  return URLResourceValues.typeIdentifier.getter();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return URL.resourceValues(forKeys:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

Swift::Void __swiftcall URL.stopAccessingSecurityScopedResource()()
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Bool __swiftcall URL.startAccessingSecurityScopedResource()()
{
  return URL.startAccessingSecurityScopedResource()();
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

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static UTType.item.getter()
{
  return static UTType.item.getter();
}

uint64_t UTType.init(identifier:allowUndeclared:)()
{
  return UTType.init(identifier:allowUndeclared:)();
}

uint64_t static UTType.fileURL.getter()
{
  return static UTType.fileURL.getter();
}

uint64_t type metadata accessor for UTType()
{
  return type metadata accessor for UTType();
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

uint64_t UITypedKeyDiff.newValue.getter()
{
  return UITypedKeyDiff.newValue.getter();
}

uint64_t dispatch thunk of UISceneKeyValueStorage.observe<A>(_:handler:)()
{
  return dispatch thunk of UISceneKeyValueStorage.observe<A>(_:handler:)();
}

{
  return dispatch thunk of UISceneKeyValueStorage.observe<A>(_:handler:)();
}

uint64_t dispatch thunk of UISceneKeyValueStorage.observe<A, B>(_:handler:)()
{
  return dispatch thunk of UISceneKeyValueStorage.observe<A, B>(_:handler:)();
}

uint64_t dispatch thunk of UISceneKeyValueStorage.subscript.getter()
{
  return dispatch thunk of UISceneKeyValueStorage.subscript.getter();
}

{
  return dispatch thunk of UISceneKeyValueStorage.subscript.getter();
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

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t type metadata accessor for SHSheetCloudSharingRequest()
{
  return type metadata accessor for SHSheetCloudSharingRequest();
}

uint64_t SHSheetOptionGroups.groups.getter()
{
  return SHSheetOptionGroups.groups.getter();
}

uint64_t type metadata accessor for SHSheetRemoteSetting.OptionGroups()
{
  return type metadata accessor for SHSheetRemoteSetting.OptionGroups();
}

uint64_t type metadata accessor for SHSheetRemoteSetting.ClientContext()
{
  return type metadata accessor for SHSheetRemoteSetting.ClientContext();
}

uint64_t static SHSheetRemoteSetting.HostProcessType.defaultValue.getter()
{
  return static SHSheetRemoteSetting.HostProcessType.defaultValue.getter();
}

uint64_t type metadata accessor for SHSheetRemoteSetting.HostProcessType()
{
  return type metadata accessor for SHSheetRemoteSetting.HostProcessType();
}

uint64_t type metadata accessor for SHSheetRemoteSetting.CloudShareRequest()
{
  return type metadata accessor for SHSheetRemoteSetting.CloudShareRequest();
}

uint64_t type metadata accessor for SHSheetRemoteSetting.CollaborationOptions()
{
  return type metadata accessor for SHSheetRemoteSetting.CollaborationOptions();
}

uint64_t static SHSheetRemoteSetting.HostPresentationStyle.defaultValue.getter()
{
  return static SHSheetRemoteSetting.HostPresentationStyle.defaultValue.getter();
}

uint64_t type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle()
{
  return type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle();
}

uint64_t type metadata accessor for SHSheetCollaborationOptions()
{
  return type metadata accessor for SHSheetCollaborationOptions();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.onActivate.setter()
{
  return dispatch thunk of SFRemoteAlertPresentationHandle.onActivate.setter();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.dismiss(animated:completion:)()
{
  return dispatch thunk of SFRemoteAlertPresentationHandle.dismiss(animated:completion:)();
}

uint64_t SFRemoteAlertPresentationManager.remoteAlertHandleDidActivate(_:)()
{
  return SFRemoteAlertPresentationManager.remoteAlertHandleDidActivate(_:)();
}

uint64_t SFRemoteAlertPresentationManager.remoteAlertHandleDidDeactivate(_:)()
{
  return SFRemoteAlertPresentationManager.remoteAlertHandleDidDeactivate(_:)();
}

uint64_t SFRemoteAlertPresentationManager.remoteAlertHandle(_:didInvalidateWithError:)()
{
  return SFRemoteAlertPresentationManager.remoteAlertHandle(_:didInvalidateWithError:)();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationManager.presentationHandle(for:)()
{
  return dispatch thunk of SFRemoteAlertPresentationManager.presentationHandle(for:)();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationManager.presentationRequest(for:)()
{
  return dispatch thunk of SFRemoteAlertPresentationManager.presentationRequest(for:)();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:hideViewController:presentationType:)()
{
  return dispatch thunk of SFRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:hideViewController:presentationType:)();
}

uint64_t static SFRemoteAlertPresentationRequest.PresentationType.== infix(_:_:)()
{
  return static SFRemoteAlertPresentationRequest.PresentationType.== infix(_:_:)();
}

uint64_t type metadata accessor for SFRemoteAlertPresentationRequest.PresentationType()
{
  return type metadata accessor for SFRemoteAlertPresentationRequest.PresentationType();
}

uint64_t SFRemoteAlertPresentationRequest.presentationType.getter()
{
  return SFRemoteAlertPresentationRequest.presentationType.getter();
}

uint64_t SFRemoteAlertPresentationRequest.hideViewController.getter()
{
  return SFRemoteAlertPresentationRequest.hideViewController.getter();
}

uint64_t SFRemoteAlertPresentationRequest.viewControllerToPresent.getter()
{
  return SFRemoteAlertPresentationRequest.viewControllerToPresent.getter();
}

uint64_t SFRemoteAlertPresentationRequest.contentOverlaysStatusBar.getter()
{
  return SFRemoteAlertPresentationRequest.contentOverlaysStatusBar.getter();
}

uint64_t SFRemoteAlertPresentationRequest.id.getter()
{
  return SFRemoteAlertPresentationRequest.id.getter();
}

uint64_t SFRemoteAlertPresentationRequest.animated.getter()
{
  return SFRemoteAlertPresentationRequest.animated.getter();
}

uint64_t type metadata accessor for SFRemoteAlertPresentationRequest()
{
  return type metadata accessor for SFRemoteAlertPresentationRequest();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
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

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
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

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
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

uint64_t NSItemProvider.loadDataRepresentation(for:completionHandler:)()
{
  return NSItemProvider.loadDataRepresentation(for:completionHandler:)();
}

uint64_t NSItemProvider.registerFileRepresentation(for:visibility:openInPlace:loadHandler:)()
{
  return NSItemProvider.registerFileRepresentation(for:visibility:openInPlace:loadHandler:)();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t NSCoder.decodeObject<A>(of:forKey:)()
{
  return NSCoder.decodeObject<A>(of:forKey:)();
}

uint64_t UIScene.hostStorage.getter()
{
  return UIScene.hostStorage.getter();
}

uint64_t INPerson.init(_:)()
{
  return INPerson.init(_:)();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
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

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return _bridgeCocoaArray<A>(_:)();
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

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return _CPCopyBundleIdentifierAndTeamFromAuditToken();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SFUILinkMetadataSerializationForLocalUseOnly()
{
  return _SFUILinkMetadataSerializationForLocalUseOnly();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dyld_get_active_platform()
{
  return _dyld_get_active_platform();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t share_sheet_log()
{
  return _share_sheet_log();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

id objc_msgSend__performBlockAfterCATransactionCommits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performBlockAfterCATransactionCommits:");
}

id objc_msgSend__setConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 _setConfiguration:];
}

id objc_msgSend_eventForDraggingDidBeginWithRubberBandCoefficient_dismissible_interruptedOffset_(void *a1, const char *a2, ...)
{
  return [a1 eventForDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:];
}

id objc_msgSend_eventForDraggingDidChangeWithTranslation_velocity_animateChange_dismissible_(void *a1, const char *a2, ...)
{
  return [a1 eventForDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:];
}

id objc_msgSend_eventForDraggingDidEnd(void *a1, const char *a2, ...)
{
  return _[a1 eventForDraggingDidEnd];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sheetInteractionController_didReceiveDraggingEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sheetInteractionController:didReceiveDraggingEvent:");
}

id objc_msgSend_sheetInteractionDelegate(void *a1, const char *a2, ...)
{
  return _[a1 sheetInteractionDelegate];
}